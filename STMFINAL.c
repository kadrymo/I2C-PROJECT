typedef unsigned char byte;

#define I2C1_Base 0x40005400
#define I2C1_offset 0x24

#define master_add -1
#define slave_add   3
#define Data_TA 5

#define slave_add 3
#define Filter_EN 1
#define Filter_type   'D'
#define filter_level  3



byte* FLTR_PTR = (byte*)(I2C1_Base+I2C1_offset);

byte saver;
byte count;
void (*destination)(void);
int x;
int y;

void begin(short int);
void end(void);
void requestFrom(int,byte,byte,byte);
void beginTransmission(int);
void endTransmission(void);
void write(byte);
void read(int,byte);
byte available(void);
void setClock(byte);
void onReceive(void(*)(void)); //in slave ONly
void onRequest(void(*)(void)); //in slav ONly
void enableNoiseFilter(byte,char,byte);

void Blink(void);// Code slave


void main() {

//////////////////////============master Code===================///////////////////////////////////////////

begin(master_add);
beginTransmission(slave_add);
write(Data_TA);
endTransmission(void);
end(void);

//////////////////////============slave Code========///////////////////////////////////////////////////////

GPIOB_MODER |= (1<<0); // set ch0 as output
begin(slave_add);
enableNoiseFilter(Filter_EN,Filter_type,filter_level);
while(1)
{
onReceive(&Blink);
}

}
void Blink(void)
{
GPIOB_ODR |= (1<<0); // set High
Delay_ms(3000);
GPIOB_ODR &=~(1<<0); // set Low
Delay_ms(3000);
}



void begin(short int address)
{
 RCC_AHB1ENR |= (1<<1);
 RCC_APB1ENR |= (1<<21);
 GPIOB_MODER |= ( (1<<13) | (1<<15) );// ch 6; 7
 GPIOB_AFRL  |= ( (1<<26) | (1<<30) ) ;
 GPIOB_PUPDR |= ( (1<<12) | (1<<14) );
 GPIOB_OTYPER|= ( (1<<6) | (1<<7) );
 if(address == -1)
 {
  I2C1_CCR   |= (210<<0);//set control Clk reg
  I2C1_TRISE |= (43<<0); //set rise time
  I2C1_CR2   |= (42<<0); // 42 MHZ from datasheet
 }
 else                   //Slave
 {
  I2C1_OAR1 |= (address<<1); // address
 }
 I2C1_CR1    |= (1<<0);                   // SET PE
 I2C1_CR1    |= (1<<10);                   // Set ACK
}

void end(void)
{

 RCC_APB1ENR &= ~(1<<21);    //disable i2c clk
}

void requestFrom(int address,byte quantity,byte array[],byte size)
/*
1 - set address
2 - wait ADDR == 1 & set ACK == 0
3 - clear ADDR
4 - wait BTF == 1
5 - set ACK == 0
6 - read data 1 from DR
7 - stop byte generation
8 - read data 2 from DR
*/
{
 while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
 saver = I2C1_SR1 ;
 I2C1_DR |= (address << 0); // Write address on DR
 while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
 I2C1_CR1 &= ~(1<<10); //disable ACK
 saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
 for(count=0 ; count<size-1 ; count++)
 {
  while(!(I2C1_SR1 & (1<<2))); // wait till BTF == 1
  I2C1_CR1 &= ~(1<<10); //disable ACK
  array[count] == I2C1_DR ;
 }
 I2C1_CR1 |= (1<<9);
 array[size] == I2C1_DR ;
}

void beginTransmission(int address)  //slave address
{

 I2C1_CR1    |= (1<<8);//start condition
 while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
 saver = I2C1_SR1 ;
 I2C1_DR |= (address<<0);
 while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
 saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
}

void endTransmission(void)
{
 I2C1_CR1 |= (1<<9);//stop generation
            // Wait until the STOP condition is complete
 while (I2C1_SR2 & (1<<0)); //Cleared by hardware after detecting a Stop condition on the bus
           I2C1_CR1 &= ~(1<<9);    // Clear the STOP bit
}

void write(byte Data_T)
/*
1 - wait Tx == 1
2 - write data on DR
3 - wait BTF == 1
4 - ACK == 1 & Tx == 1
*/
{
 while(!(I2C1_SR1 & (1<<7))); // wait tx == 1
 I2C1_DR =Data_T; // Write on DR
 while(!(I2C1_SR1 & (1<<2))); // wait till BTF == 1
 while(!(I2C1_SR1 & (1<<7))); // wait till tx == 1
}

void read(int address,byte Data_R)

{
 while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
 saver = I2C1_SR1 ;
 I2C1_DR |= (address << 0); // Write address on DR
 while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
 I2C1_CR1 &= ~(1<<10); //disable ACK
 saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
 I2C1_CR1 |= (1<<9); // Set the Stop
 while(!(I2C1_SR1 & (1<<6))); // wait RxNE == 1
 Data_R = I2C1_DR ;
 }
void setClock(byte Frequency)
{
 I2C1_CR2   |= (Frequency<<0); //set frequency
 x=5*Frequency;
 y=Frequency+1;
 I2C1_CCR   |= (x<<0);//set control Clk reg
 I2C1_TRISE |= (y<<0); //set rise time
}

byte available(void)
{
 if(I2C1_SR1 & (1<<6)) //RxNE == 1
 {
  return 1;
 }
 else
 {
  return 0;
 }
}
void onReceive(void(*function)(void))
/*
1 - start condition detected
2 - ADDR == 1 & RxNE == 1
3 - execute function
*/
{
 while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<6))); // wait till ADDR == 1 & RxNE == 1
 destination = function ;         // destination pointer takes value of function
 destination();
}

void onRequest(void(*function)(void))
/*
1 - start condition detected
2 - ADDR == 1 & Tx == 1
3 - execute function
*/
{
 while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<7))); // wait till ADDR == 1 & Tx == 1
 destination = function ;         // destination pointer takes value of function
 destination();
}
void enableNoiseFilter(byte Enable,char filter_type,byte level)
{

 if(Enable==1)
 {
  I2C1_CR1   |= (0<<0); //disable PE
  if(filter_type == 65 | filter_type == 97)        // Analog (A|a)
  {
   *FLTR_PTR |= (1<<4);

  }
  if(filter_type == 68 | filter_type == 100)        // digital
  {
   *FLTR_PTR |= (level<<0);
  }
 }
}


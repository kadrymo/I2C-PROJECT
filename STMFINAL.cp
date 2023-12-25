#line 1 "D:/KADRYCOd/STMFINAL.c"
typedef unsigned char byte;
#line 17 "D:/KADRYCOd/STMFINAL.c"
byte* FLTR_PTR = (byte*)( 0x40005400 + 0x24 );

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
void onReceive(void(*)(void));
void onRequest(void(*)(void));
void enableNoiseFilter(byte,char,byte);

void Blink(void);


void main() {



begin( -1 );
beginTransmission( 3 );
write( 5 );
endTransmission(void);
end(void);



GPIOB_MODER |= (1<<0);
begin( 3 );
enableNoiseFilter( 1 , 'D' , 3 );
while(1)
{
onReceive(&Blink);
}

}
void Blink(void)
{
GPIOB_ODR |= (1<<0);
Delay_ms(3000);
GPIOB_ODR &=~(1<<0);
Delay_ms(3000);
}



void begin(short int address)
{
 RCC_AHB1ENR |= (1<<1);
 RCC_APB1ENR |= (1<<21);
 GPIOB_MODER |= ( (1<<13) | (1<<15) );
 GPIOB_AFRL |= ( (1<<26) | (1<<30) ) ;
 GPIOB_PUPDR |= ( (1<<12) | (1<<14) );
 GPIOB_OTYPER|= ( (1<<6) | (1<<7) );
 if(address == -1)
 {
 I2C1_CCR |= (210<<0);
 I2C1_TRISE |= (43<<0);
 I2C1_CR2 |= (42<<0);
 }
 else
 {
 I2C1_OAR1 |= (address<<1);
 }
 I2C1_CR1 |= (1<<0);
 I2C1_CR1 |= (1<<10);
}

void end(void)
{

 RCC_APB1ENR &= ~(1<<21);
}

void requestFrom(int address,byte quantity,byte array[],byte size)
#line 111 "D:/KADRYCOd/STMFINAL.c"
{
 while(!(I2C1_SR1 & (1<<0)));
 saver = I2C1_SR1 ;
 I2C1_DR |= (address << 0);
 while(!(I2C1_SR1 & (1<<1)));
 I2C1_CR1 &= ~(1<<10);
 saver = I2C1_SR1 ; saver = I2C1_SR2 ;
 for(count=0 ; count<size-1 ; count++)
 {
 while(!(I2C1_SR1 & (1<<2)));
 I2C1_CR1 &= ~(1<<10);
 array[count] == I2C1_DR ;
 }
 I2C1_CR1 |= (1<<9);
 array[size] == I2C1_DR ;
}

void beginTransmission(int address)
{

 I2C1_CR1 |= (1<<8);
 while(!(I2C1_SR1 & (1<<0)));
 saver = I2C1_SR1 ;
 I2C1_DR |= (address<<0);
 while(!(I2C1_SR1 & (1<<1)));
 saver = I2C1_SR1 ; saver = I2C1_SR2 ;
}

void endTransmission(void)
{
 I2C1_CR1 |= (1<<9);

 while (I2C1_SR2 & (1<<0));
 I2C1_CR1 &= ~(1<<9);
}

void write(byte Data_T)
#line 154 "D:/KADRYCOd/STMFINAL.c"
{
 while(!(I2C1_SR1 & (1<<7)));
 I2C1_DR =Data_T;
 while(!(I2C1_SR1 & (1<<2)));
 while(!(I2C1_SR1 & (1<<7)));
}

void read(int address,byte Data_R)

{
 while(!(I2C1_SR1 & (1<<0)));
 saver = I2C1_SR1 ;
 I2C1_DR |= (address << 0);
 while(!(I2C1_SR1 & (1<<1)));
 I2C1_CR1 &= ~(1<<10);
 saver = I2C1_SR1 ; saver = I2C1_SR2 ;
 I2C1_CR1 |= (1<<9);
 while(!(I2C1_SR1 & (1<<6)));
 Data_R = I2C1_DR ;
 }
void setClock(byte Frequency)
{
 I2C1_CR2 |= (Frequency<<0);
 x=5*Frequency;
 y=Frequency+1;
 I2C1_CCR |= (x<<0);
 I2C1_TRISE |= (y<<0);
}

byte available(void)
{
 if(I2C1_SR1 & (1<<6))
 {
 return 1;
 }
 else
 {
 return 0;
 }
}
void onReceive(void(*function)(void))
#line 200 "D:/KADRYCOd/STMFINAL.c"
{
 while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<6)));
 destination = function ;
 destination();
}

void onRequest(void(*function)(void))
#line 212 "D:/KADRYCOd/STMFINAL.c"
{
 while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<7)));
 destination = function ;
 destination();
}
void enableNoiseFilter(byte Enable,char filter_type,byte level)
{

 if(Enable==1)
 {
 I2C1_CR1 |= (0<<0);
 if(filter_type == 65 | filter_type == 97)
 {
 *FLTR_PTR |= (1<<4);

 }
 if(filter_type == 68 | filter_type == 100)
 {
 *FLTR_PTR |= (level<<0);
 }
 }
}

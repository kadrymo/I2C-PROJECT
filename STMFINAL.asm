_main:
;STMFINAL.c,41 :: 		void main() {
;STMFINAL.c,45 :: 		begin(master_add);
MOVS	R0, #-1
SXTB	R0, R0
BL	_begin+0
;STMFINAL.c,46 :: 		beginTransmission(slave_add);
MOVS	R0, #3
SXTH	R0, R0
BL	_beginTransmission+0
;STMFINAL.c,47 :: 		write(Data_TA);
MOVS	R0, #5
BL	_write+0
;STMFINAL.c,48 :: 		endTransmission(void);
BL	_endTransmission+0
;STMFINAL.c,49 :: 		end(void);
BL	_end+0
;STMFINAL.c,53 :: 		GPIOB_MODER |= (1<<0); // set ch0 as output
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_MODER+0)
MOVT	R0, #hi_addr(GPIOB_MODER+0)
STR	R1, [R0, #0]
;STMFINAL.c,54 :: 		begin(slave_add);
MOVS	R0, #3
SXTB	R0, R0
BL	_begin+0
;STMFINAL.c,55 :: 		enableNoiseFilter(Filter_EN,Filter_type,filter_level);
MOVS	R2, #3
MOVS	R1, #68
MOVS	R0, #1
BL	_enableNoiseFilter+0
;STMFINAL.c,56 :: 		while(1)
L_main0:
;STMFINAL.c,58 :: 		onReceive(&Blink);
MOVW	R0, #lo_addr(_Blink+0)
MOVT	R0, #hi_addr(_Blink+0)
BL	_onReceive+0
;STMFINAL.c,59 :: 		}
IT	AL
BAL	L_main0
;STMFINAL.c,61 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Blink:
;STMFINAL.c,62 :: 		void Blink(void)
;STMFINAL.c,64 :: 		GPIOB_ODR |= (1<<0); // set High
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;STMFINAL.c,65 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_Blink2:
SUBS	R7, R7, #1
BNE	L_Blink2
NOP
NOP
NOP
;STMFINAL.c,66 :: 		GPIOB_ODR &=~(1<<0); // set Low
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #1
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;STMFINAL.c,67 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_Blink4:
SUBS	R7, R7, #1
BNE	L_Blink4
NOP
NOP
NOP
;STMFINAL.c,68 :: 		}
L_end_Blink:
BX	LR
; end of _Blink
_begin:
;STMFINAL.c,72 :: 		void begin(short int address)
; address start address is: 0 (R0)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
;STMFINAL.c,74 :: 		RCC_AHB1ENR |= (1<<1);
MOVW	R1, #lo_addr(RCC_AHB1ENR+0)
MOVT	R1, #hi_addr(RCC_AHB1ENR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #2
MOVW	R1, #lo_addr(RCC_AHB1ENR+0)
MOVT	R1, #hi_addr(RCC_AHB1ENR+0)
STR	R2, [R1, #0]
;STMFINAL.c,75 :: 		RCC_APB1ENR |= (1<<21);
MOVW	R1, #lo_addr(RCC_APB1ENR+0)
MOVT	R1, #hi_addr(RCC_APB1ENR+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(RCC_APB1ENR+0)
MOVT	R1, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R1, #0]
;STMFINAL.c,76 :: 		GPIOB_MODER |= ( (1<<13) | (1<<15) );// ch 6; 7
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #40960
MOVW	R1, #lo_addr(GPIOB_MODER+0)
MOVT	R1, #hi_addr(GPIOB_MODER+0)
STR	R2, [R1, #0]
;STMFINAL.c,77 :: 		GPIOB_AFRL  |= ( (1<<26) | (1<<30) ) ;
MOVW	R1, #lo_addr(GPIOB_AFRL+0)
MOVT	R1, #hi_addr(GPIOB_AFRL+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(GPIOB_AFRL+0)
MOVT	R1, #hi_addr(GPIOB_AFRL+0)
STR	R2, [R1, #0]
;STMFINAL.c,78 :: 		GPIOB_PUPDR |= ( (1<<12) | (1<<14) );
MOVW	R1, #lo_addr(GPIOB_PUPDR+0)
MOVT	R1, #hi_addr(GPIOB_PUPDR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #20480
MOVW	R1, #lo_addr(GPIOB_PUPDR+0)
MOVT	R1, #hi_addr(GPIOB_PUPDR+0)
STR	R2, [R1, #0]
;STMFINAL.c,79 :: 		GPIOB_OTYPER|= ( (1<<6) | (1<<7) );
MOVW	R1, #lo_addr(GPIOB_OTYPER+0)
MOVT	R1, #hi_addr(GPIOB_OTYPER+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #192
MOVW	R1, #lo_addr(GPIOB_OTYPER+0)
MOVT	R1, #hi_addr(GPIOB_OTYPER+0)
STR	R2, [R1, #0]
;STMFINAL.c,80 :: 		if(address == -1)
CMP	R0, #-1
IT	NE
BNE	L_begin6
; address end address is: 0 (R0)
;STMFINAL.c,82 :: 		I2C1_CCR   |= (210<<0);//set control Clk reg
MOVW	R1, #lo_addr(I2C1_CCR+0)
MOVT	R1, #hi_addr(I2C1_CCR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #210
MOVW	R1, #lo_addr(I2C1_CCR+0)
MOVT	R1, #hi_addr(I2C1_CCR+0)
STR	R2, [R1, #0]
;STMFINAL.c,83 :: 		I2C1_TRISE |= (43<<0); //set rise time
MOVW	R1, #lo_addr(I2C1_TRISE+0)
MOVT	R1, #hi_addr(I2C1_TRISE+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #43
MOVW	R1, #lo_addr(I2C1_TRISE+0)
MOVT	R1, #hi_addr(I2C1_TRISE+0)
STR	R2, [R1, #0]
;STMFINAL.c,84 :: 		I2C1_CR2   |= (42<<0); // 42 MHZ from datasheet
MOVW	R1, #lo_addr(I2C1_CR2+0)
MOVT	R1, #hi_addr(I2C1_CR2+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #42
MOVW	R1, #lo_addr(I2C1_CR2+0)
MOVT	R1, #hi_addr(I2C1_CR2+0)
STR	R2, [R1, #0]
;STMFINAL.c,85 :: 		}
IT	AL
BAL	L_begin7
L_begin6:
;STMFINAL.c,88 :: 		I2C1_OAR1 |= (address<<1); // address
; address start address is: 0 (R0)
LSLS	R2, R0, #1
SXTH	R2, R2
; address end address is: 0 (R0)
MOVW	R1, #lo_addr(I2C1_OAR1+0)
MOVT	R1, #hi_addr(I2C1_OAR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(I2C1_OAR1+0)
MOVT	R1, #hi_addr(I2C1_OAR1+0)
STR	R2, [R1, #0]
;STMFINAL.c,89 :: 		}
L_begin7:
;STMFINAL.c,90 :: 		I2C1_CR1    |= (1<<0);                   // SET PE
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
STR	R2, [R1, #0]
;STMFINAL.c,91 :: 		I2C1_CR1    |= (1<<10);                   // Set ACK
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #1024
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
STR	R2, [R1, #0]
;STMFINAL.c,92 :: 		}
L_end_begin:
BX	LR
; end of _begin
_end:
;STMFINAL.c,94 :: 		void end(void)
;STMFINAL.c,97 :: 		RCC_APB1ENR &= ~(1<<21);    //disable i2c clk
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #-1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;STMFINAL.c,98 :: 		}
L_end_end:
BX	LR
; end of _end
_requestFrom:
;STMFINAL.c,100 :: 		void requestFrom(int address,byte quantity,byte array[],byte size)
; size start address is: 12 (R3)
; address start address is: 0 (R0)
; size end address is: 12 (R3)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
; size start address is: 12 (R3)
SXTH	R1, R0
; address end address is: 0 (R0)
; size end address is: 12 (R3)
UXTB	R0, R3
;STMFINAL.c,112 :: 		while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
L_requestFrom8:
; size start address is: 0 (R0)
; address start address is: 4 (R1)
MOVW	R4, #lo_addr(I2C1_SR1+0)
MOVT	R4, #hi_addr(I2C1_SR1+0)
LDR	R4, [R4, #0]
AND	R4, R4, #1
CMP	R4, #0
IT	NE
BNE	L_requestFrom9
IT	AL
BAL	L_requestFrom8
L_requestFrom9:
;STMFINAL.c,113 :: 		saver = I2C1_SR1 ;
MOVW	R4, #lo_addr(I2C1_SR1+0)
MOVT	R4, #hi_addr(I2C1_SR1+0)
LDR	R5, [R4, #0]
MOVW	R4, #lo_addr(_saver+0)
MOVT	R4, #hi_addr(_saver+0)
STRB	R5, [R4, #0]
;STMFINAL.c,114 :: 		I2C1_DR |= (address << 0); // Write address on DR
MOVW	R4, #lo_addr(I2C1_DR+0)
MOVT	R4, #hi_addr(I2C1_DR+0)
LDR	R4, [R4, #0]
ORR	R5, R4, R1, LSL #0
; address end address is: 4 (R1)
MOVW	R4, #lo_addr(I2C1_DR+0)
MOVT	R4, #hi_addr(I2C1_DR+0)
STR	R5, [R4, #0]
; size end address is: 0 (R0)
;STMFINAL.c,115 :: 		while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
L_requestFrom10:
; size start address is: 0 (R0)
MOVW	R4, #lo_addr(I2C1_SR1+0)
MOVT	R4, #hi_addr(I2C1_SR1+0)
LDR	R4, [R4, #0]
AND	R4, R4, #2
CMP	R4, #0
IT	NE
BNE	L_requestFrom11
IT	AL
BAL	L_requestFrom10
L_requestFrom11:
;STMFINAL.c,116 :: 		I2C1_CR1 &= ~(1<<10); //disable ACK
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
LDR	R5, [R4, #0]
MVN	R4, #1024
ANDS	R5, R4
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
STR	R5, [R4, #0]
;STMFINAL.c,117 :: 		saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
MOVW	R4, #lo_addr(I2C1_SR1+0)
MOVT	R4, #hi_addr(I2C1_SR1+0)
LDR	R4, [R4, #0]
MOVW	R5, #lo_addr(_saver+0)
MOVT	R5, #hi_addr(_saver+0)
STRB	R4, [R5, #0]
MOVW	R4, #lo_addr(I2C1_SR2+0)
MOVT	R4, #hi_addr(I2C1_SR2+0)
LDR	R4, [R4, #0]
STRB	R4, [R5, #0]
;STMFINAL.c,118 :: 		for(count=0 ; count<size-1 ; count++)
MOVS	R5, #0
MOVW	R4, #lo_addr(_count+0)
MOVT	R4, #hi_addr(_count+0)
STRB	R5, [R4, #0]
; size end address is: 0 (R0)
L_requestFrom12:
; size start address is: 0 (R0)
SUBS	R5, R0, #1
SXTH	R5, R5
MOVW	R4, #lo_addr(_count+0)
MOVT	R4, #hi_addr(_count+0)
LDRB	R4, [R4, #0]
CMP	R4, R5
IT	GE
BGE	L_requestFrom13
; size end address is: 0 (R0)
;STMFINAL.c,120 :: 		while(!(I2C1_SR1 & (1<<2))); // wait till BTF == 1
L_requestFrom15:
; size start address is: 0 (R0)
MOVW	R4, #lo_addr(I2C1_SR1+0)
MOVT	R4, #hi_addr(I2C1_SR1+0)
LDR	R4, [R4, #0]
AND	R4, R4, #4
CMP	R4, #0
IT	NE
BNE	L_requestFrom16
IT	AL
BAL	L_requestFrom15
L_requestFrom16:
;STMFINAL.c,121 :: 		I2C1_CR1 &= ~(1<<10); //disable ACK
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
LDR	R5, [R4, #0]
MVN	R4, #1024
ANDS	R5, R4
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
STR	R5, [R4, #0]
;STMFINAL.c,118 :: 		for(count=0 ; count<size-1 ; count++)
MOVW	R5, #lo_addr(_count+0)
MOVT	R5, #hi_addr(_count+0)
LDRB	R4, [R5, #0]
ADDS	R4, R4, #1
STRB	R4, [R5, #0]
;STMFINAL.c,123 :: 		}
; size end address is: 0 (R0)
IT	AL
BAL	L_requestFrom12
L_requestFrom13:
;STMFINAL.c,124 :: 		I2C1_CR1 |= (1<<9);
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
LDR	R4, [R4, #0]
ORR	R5, R4, #512
MOVW	R4, #lo_addr(I2C1_CR1+0)
MOVT	R4, #hi_addr(I2C1_CR1+0)
STR	R5, [R4, #0]
;STMFINAL.c,126 :: 		}
L_end_requestFrom:
BX	LR
; end of _requestFrom
_beginTransmission:
;STMFINAL.c,128 :: 		void beginTransmission(int address)  //slave address
; address start address is: 0 (R0)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
;STMFINAL.c,131 :: 		I2C1_CR1    |= (1<<8);//start condition
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #256
MOVW	R1, #lo_addr(I2C1_CR1+0)
MOVT	R1, #hi_addr(I2C1_CR1+0)
STR	R2, [R1, #0]
; address end address is: 0 (R0)
;STMFINAL.c,132 :: 		while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
L_beginTransmission17:
; address start address is: 0 (R0)
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #1
CMP	R1, #0
IT	NE
BNE	L_beginTransmission18
IT	AL
BAL	L_beginTransmission17
L_beginTransmission18:
;STMFINAL.c,133 :: 		saver = I2C1_SR1 ;
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(_saver+0)
MOVT	R1, #hi_addr(_saver+0)
STRB	R2, [R1, #0]
;STMFINAL.c,134 :: 		I2C1_DR |= (address<<0);
MOVW	R1, #lo_addr(I2C1_DR+0)
MOVT	R1, #hi_addr(I2C1_DR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R0, LSL #0
; address end address is: 0 (R0)
MOVW	R1, #lo_addr(I2C1_DR+0)
MOVT	R1, #hi_addr(I2C1_DR+0)
STR	R2, [R1, #0]
;STMFINAL.c,135 :: 		while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
L_beginTransmission19:
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #0
IT	NE
BNE	L_beginTransmission20
IT	AL
BAL	L_beginTransmission19
L_beginTransmission20:
;STMFINAL.c,136 :: 		saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
MOVW	R2, #lo_addr(_saver+0)
MOVT	R2, #hi_addr(_saver+0)
STRB	R1, [R2, #0]
MOVW	R1, #lo_addr(I2C1_SR2+0)
MOVT	R1, #hi_addr(I2C1_SR2+0)
LDR	R1, [R1, #0]
STRB	R1, [R2, #0]
;STMFINAL.c,137 :: 		}
L_end_beginTransmission:
BX	LR
; end of _beginTransmission
_endTransmission:
;STMFINAL.c,139 :: 		void endTransmission(void)
;STMFINAL.c,141 :: 		I2C1_CR1 |= (1<<9);//stop generation
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #512
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
STR	R1, [R0, #0]
;STMFINAL.c,143 :: 		while (I2C1_SR2 & (1<<0)); //Cleared by hardware after detecting a Stop condition on the bus
L_endTransmission21:
MOVW	R0, #lo_addr(I2C1_SR2+0)
MOVT	R0, #hi_addr(I2C1_SR2+0)
LDR	R0, [R0, #0]
AND	R0, R0, #1
CMP	R0, #0
IT	EQ
BEQ	L_endTransmission22
IT	AL
BAL	L_endTransmission21
L_endTransmission22:
;STMFINAL.c,144 :: 		I2C1_CR1 &= ~(1<<9);    // Clear the STOP bit
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
LDR	R1, [R0, #0]
MVN	R0, #512
ANDS	R1, R0
MOVW	R0, #lo_addr(I2C1_CR1+0)
MOVT	R0, #hi_addr(I2C1_CR1+0)
STR	R1, [R0, #0]
;STMFINAL.c,145 :: 		}
L_end_endTransmission:
BX	LR
; end of _endTransmission
_write:
;STMFINAL.c,147 :: 		void write(byte Data_T)
; Data_T start address is: 0 (R0)
; Data_T end address is: 0 (R0)
; Data_T start address is: 0 (R0)
; Data_T end address is: 0 (R0)
;STMFINAL.c,155 :: 		while(!(I2C1_SR1 & (1<<7))); // wait tx == 1
L_write23:
; Data_T start address is: 0 (R0)
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #128
CMP	R1, #0
IT	NE
BNE	L_write24
IT	AL
BAL	L_write23
L_write24:
;STMFINAL.c,156 :: 		I2C1_DR =Data_T; // Write on DR
MOVW	R1, #lo_addr(I2C1_DR+0)
MOVT	R1, #hi_addr(I2C1_DR+0)
STR	R0, [R1, #0]
; Data_T end address is: 0 (R0)
;STMFINAL.c,157 :: 		while(!(I2C1_SR1 & (1<<2))); // wait till BTF == 1
L_write25:
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #4
CMP	R1, #0
IT	NE
BNE	L_write26
IT	AL
BAL	L_write25
L_write26:
;STMFINAL.c,158 :: 		while(!(I2C1_SR1 & (1<<7))); // wait till tx == 1
L_write27:
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #128
CMP	R1, #0
IT	NE
BNE	L_write28
IT	AL
BAL	L_write27
L_write28:
;STMFINAL.c,159 :: 		}
L_end_write:
BX	LR
; end of _write
_read:
;STMFINAL.c,161 :: 		void read(int address,byte Data_R)
; address start address is: 0 (R0)
; address end address is: 0 (R0)
; address start address is: 0 (R0)
; address end address is: 0 (R0)
;STMFINAL.c,164 :: 		while(!(I2C1_SR1 & (1<<0))); // wait till SB == 1
L_read29:
; address start address is: 0 (R0)
MOVW	R2, #lo_addr(I2C1_SR1+0)
MOVT	R2, #hi_addr(I2C1_SR1+0)
LDR	R2, [R2, #0]
AND	R2, R2, #1
CMP	R2, #0
IT	NE
BNE	L_read30
IT	AL
BAL	L_read29
L_read30:
;STMFINAL.c,165 :: 		saver = I2C1_SR1 ;
MOVW	R2, #lo_addr(I2C1_SR1+0)
MOVT	R2, #hi_addr(I2C1_SR1+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_saver+0)
MOVT	R2, #hi_addr(_saver+0)
STRB	R3, [R2, #0]
;STMFINAL.c,166 :: 		I2C1_DR |= (address << 0); // Write address on DR
MOVW	R2, #lo_addr(I2C1_DR+0)
MOVT	R2, #hi_addr(I2C1_DR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, R0, LSL #0
; address end address is: 0 (R0)
MOVW	R2, #lo_addr(I2C1_DR+0)
MOVT	R2, #hi_addr(I2C1_DR+0)
STR	R3, [R2, #0]
;STMFINAL.c,167 :: 		while(!(I2C1_SR1 & (1<<1))); // wait till ADDR == 1
L_read31:
MOVW	R2, #lo_addr(I2C1_SR1+0)
MOVT	R2, #hi_addr(I2C1_SR1+0)
LDR	R2, [R2, #0]
AND	R2, R2, #2
CMP	R2, #0
IT	NE
BNE	L_read32
IT	AL
BAL	L_read31
L_read32:
;STMFINAL.c,168 :: 		I2C1_CR1 &= ~(1<<10); //disable ACK
MOVW	R2, #lo_addr(I2C1_CR1+0)
MOVT	R2, #hi_addr(I2C1_CR1+0)
LDR	R3, [R2, #0]
MVN	R2, #1024
ANDS	R3, R2
MOVW	R2, #lo_addr(I2C1_CR1+0)
MOVT	R2, #hi_addr(I2C1_CR1+0)
STR	R3, [R2, #0]
;STMFINAL.c,169 :: 		saver = I2C1_SR1 ; saver = I2C1_SR2 ; // clear ADDR
MOVW	R2, #lo_addr(I2C1_SR1+0)
MOVT	R2, #hi_addr(I2C1_SR1+0)
LDR	R2, [R2, #0]
MOVW	R3, #lo_addr(_saver+0)
MOVT	R3, #hi_addr(_saver+0)
STRB	R2, [R3, #0]
MOVW	R2, #lo_addr(I2C1_SR2+0)
MOVT	R2, #hi_addr(I2C1_SR2+0)
LDR	R2, [R2, #0]
STRB	R2, [R3, #0]
;STMFINAL.c,170 :: 		I2C1_CR1 |= (1<<9); // Set the Stop
MOVW	R2, #lo_addr(I2C1_CR1+0)
MOVT	R2, #hi_addr(I2C1_CR1+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #512
MOVW	R2, #lo_addr(I2C1_CR1+0)
MOVT	R2, #hi_addr(I2C1_CR1+0)
STR	R3, [R2, #0]
;STMFINAL.c,171 :: 		while(!(I2C1_SR1 & (1<<6))); // wait RxNE == 1
L_read33:
MOVW	R2, #lo_addr(I2C1_SR1+0)
MOVT	R2, #hi_addr(I2C1_SR1+0)
LDR	R2, [R2, #0]
AND	R2, R2, #64
CMP	R2, #0
IT	NE
BNE	L_read34
IT	AL
BAL	L_read33
L_read34:
;STMFINAL.c,173 :: 		}
L_end_read:
BX	LR
; end of _read
_setClock:
;STMFINAL.c,174 :: 		void setClock(byte Frequency)
; Frequency start address is: 0 (R0)
; Frequency end address is: 0 (R0)
; Frequency start address is: 0 (R0)
;STMFINAL.c,176 :: 		I2C1_CR2   |= (Frequency<<0); //set frequency
UXTB	R2, R0
MOVW	R1, #lo_addr(I2C1_CR2+0)
MOVT	R1, #hi_addr(I2C1_CR2+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(I2C1_CR2+0)
MOVT	R1, #hi_addr(I2C1_CR2+0)
STR	R2, [R1, #0]
;STMFINAL.c,177 :: 		x=5*Frequency;
MOVS	R1, #5
SXTH	R1, R1
MUL	R2, R1, R0
SXTH	R2, R2
MOVW	R1, #lo_addr(_x+0)
MOVT	R1, #hi_addr(_x+0)
STRH	R2, [R1, #0]
;STMFINAL.c,178 :: 		y=Frequency+1;
ADDS	R3, R0, #1
SXTH	R3, R3
; Frequency end address is: 0 (R0)
MOVW	R1, #lo_addr(_y+0)
MOVT	R1, #hi_addr(_y+0)
STRH	R3, [R1, #0]
;STMFINAL.c,179 :: 		I2C1_CCR   |= (x<<0);//set control Clk reg
MOVW	R1, #lo_addr(I2C1_CCR+0)
MOVT	R1, #hi_addr(I2C1_CCR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(I2C1_CCR+0)
MOVT	R1, #hi_addr(I2C1_CCR+0)
STR	R2, [R1, #0]
;STMFINAL.c,180 :: 		I2C1_TRISE |= (y<<0); //set rise time
MOVW	R1, #lo_addr(I2C1_TRISE+0)
MOVT	R1, #hi_addr(I2C1_TRISE+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R3, LSL #0
MOVW	R1, #lo_addr(I2C1_TRISE+0)
MOVT	R1, #hi_addr(I2C1_TRISE+0)
STR	R2, [R1, #0]
;STMFINAL.c,181 :: 		}
L_end_setClock:
BX	LR
; end of _setClock
_available:
;STMFINAL.c,183 :: 		byte available(void)
;STMFINAL.c,185 :: 		if(I2C1_SR1 & (1<<6)) //RxNE == 1
MOVW	R0, #lo_addr(I2C1_SR1+0)
MOVT	R0, #hi_addr(I2C1_SR1+0)
LDR	R0, [R0, #0]
AND	R0, R0, #64
CMP	R0, #0
IT	EQ
BEQ	L_available35
;STMFINAL.c,187 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_available
;STMFINAL.c,188 :: 		}
L_available35:
;STMFINAL.c,191 :: 		return 0;
MOVS	R0, #0
;STMFINAL.c,193 :: 		}
L_end_available:
BX	LR
; end of _available
_onReceive:
;STMFINAL.c,194 :: 		void onReceive(void(*function)(void))
; function start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; function end address is: 0 (R0)
; function start address is: 0 (R0)
MOV	R6, R0
; function end address is: 0 (R0)
;STMFINAL.c,201 :: 		while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<6))); // wait till ADDR == 1 & RxNE == 1
L_onReceive37:
; function start address is: 24 (R6)
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #0
MOVW	R5, #0
BNE	L__onReceive57
MOVS	R5, #1
L__onReceive57:
UXTB	R5, R5
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R4, R1, #64
CMP	R4, #0
MOVW	R4, #0
BNE	L__onReceive58
MOVS	R4, #1
L__onReceive58:
UXTB	R4, R4
AND	R4, R5, R4, LSL #0
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_onReceive38
IT	AL
BAL	L_onReceive37
L_onReceive38:
;STMFINAL.c,202 :: 		destination = function ;         // destination pointer takes value of function
MOVW	R4, #lo_addr(_destination+0)
MOVT	R4, #hi_addr(_destination+0)
STR	R6, [R4, #0]
; function end address is: 24 (R6)
;STMFINAL.c,203 :: 		destination();
LDR	R4, [R4, #0]
BLX	R4
;STMFINAL.c,204 :: 		}
L_end_onReceive:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _onReceive
_onRequest:
;STMFINAL.c,206 :: 		void onRequest(void(*function)(void))
; function start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; function end address is: 0 (R0)
; function start address is: 0 (R0)
MOV	R6, R0
; function end address is: 0 (R0)
;STMFINAL.c,213 :: 		while(!(I2C1_SR1 & (1<<1)) & !(I2C1_SR1 & (1<<7))); // wait till ADDR == 1 & Tx == 1
L_onRequest39:
; function start address is: 24 (R6)
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R1, R1, #2
CMP	R1, #0
MOVW	R5, #0
BNE	L__onRequest60
MOVS	R5, #1
L__onRequest60:
UXTB	R5, R5
MOVW	R1, #lo_addr(I2C1_SR1+0)
MOVT	R1, #hi_addr(I2C1_SR1+0)
LDR	R1, [R1, #0]
AND	R4, R1, #128
CMP	R4, #0
MOVW	R4, #0
BNE	L__onRequest61
MOVS	R4, #1
L__onRequest61:
UXTB	R4, R4
AND	R4, R5, R4, LSL #0
UXTB	R4, R4
CMP	R4, #0
IT	EQ
BEQ	L_onRequest40
IT	AL
BAL	L_onRequest39
L_onRequest40:
;STMFINAL.c,214 :: 		destination = function ;         // destination pointer takes value of function
MOVW	R4, #lo_addr(_destination+0)
MOVT	R4, #hi_addr(_destination+0)
STR	R6, [R4, #0]
; function end address is: 24 (R6)
;STMFINAL.c,215 :: 		destination();
LDR	R4, [R4, #0]
BLX	R4
;STMFINAL.c,216 :: 		}
L_end_onRequest:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _onRequest
_enableNoiseFilter:
;STMFINAL.c,217 :: 		void enableNoiseFilter(byte Enable,char filter_type,byte level)
; level start address is: 8 (R2)
; filter_type start address is: 4 (R1)
; Enable start address is: 0 (R0)
; level end address is: 8 (R2)
; filter_type end address is: 4 (R1)
; Enable end address is: 0 (R0)
; Enable start address is: 0 (R0)
; filter_type start address is: 4 (R1)
; level start address is: 8 (R2)
;STMFINAL.c,220 :: 		if(Enable==1)
CMP	R0, #1
IT	NE
BNE	L_enableNoiseFilter41
; Enable end address is: 0 (R0)
;STMFINAL.c,222 :: 		I2C1_CR1   |= (0<<0); //disable PE
MOVW	R3, #lo_addr(I2C1_CR1+0)
MOVT	R3, #hi_addr(I2C1_CR1+0)
LDR	R4, [R3, #0]
MOVW	R3, #lo_addr(I2C1_CR1+0)
MOVT	R3, #hi_addr(I2C1_CR1+0)
STR	R4, [R3, #0]
;STMFINAL.c,223 :: 		if(filter_type == 65 | filter_type == 97)        // Analog (A|a)
CMP	R1, #65
MOVW	R4, #0
BNE	L__enableNoiseFilter63
MOVS	R4, #1
L__enableNoiseFilter63:
CMP	R1, #97
MOVW	R3, #0
BNE	L__enableNoiseFilter64
MOVS	R3, #1
L__enableNoiseFilter64:
ORR	R3, R4, R3, LSL #0
CMP	R3, #0
IT	EQ
BEQ	L_enableNoiseFilter42
;STMFINAL.c,225 :: 		*FLTR_PTR |= (1<<4);
MOVW	R5, #lo_addr(_FLTR_PTR+0)
MOVT	R5, #hi_addr(_FLTR_PTR+0)
LDR	R3, [R5, #0]
LDRB	R3, [R3, #0]
ORR	R4, R3, #16
MOV	R3, R5
LDR	R3, [R3, #0]
STRB	R4, [R3, #0]
;STMFINAL.c,227 :: 		}
L_enableNoiseFilter42:
;STMFINAL.c,228 :: 		if(filter_type == 68 | filter_type == 100)        // digital
CMP	R1, #68
MOVW	R4, #0
BNE	L__enableNoiseFilter65
MOVS	R4, #1
L__enableNoiseFilter65:
CMP	R1, #100
MOVW	R3, #0
BNE	L__enableNoiseFilter66
MOVS	R3, #1
L__enableNoiseFilter66:
; filter_type end address is: 4 (R1)
ORR	R3, R4, R3, LSL #0
CMP	R3, #0
IT	EQ
BEQ	L_enableNoiseFilter43
;STMFINAL.c,230 :: 		*FLTR_PTR |= (level<<0);
UXTB	R4, R2
; level end address is: 8 (R2)
MOVW	R5, #lo_addr(_FLTR_PTR+0)
MOVT	R5, #hi_addr(_FLTR_PTR+0)
LDR	R3, [R5, #0]
LDRB	R3, [R3, #0]
ORR	R4, R3, R4, LSL #0
MOV	R3, R5
LDR	R3, [R3, #0]
STRB	R4, [R3, #0]
;STMFINAL.c,231 :: 		}
L_enableNoiseFilter43:
;STMFINAL.c,232 :: 		}
L_enableNoiseFilter41:
;STMFINAL.c,233 :: 		}
L_end_enableNoiseFilter:
BX	LR
; end of _enableNoiseFilter

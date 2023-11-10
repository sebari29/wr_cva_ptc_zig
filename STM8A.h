/*==============================================================================================
¢Ñ     Processor		: STM8A
¢Ñ     Software Design	: Yun_Chung_Eun
¢Ñ     Update		: 2010_12_28
¢Ñ     Format 		: Cosmic STM8 v4.2.6 Compiler
===============================================================================================*/
#ifndef	__STM8A__
#define	__STM8A__

/*==============	¢Ñ IO PORTS Control Register ¢Ð  ====================================================*/
volatile @near unsigned char PA_ODR		@0x5000;		//PORT_A Data Output Latch Register
volatile @near unsigned char PA_IDR		@0x5001;		//PORT_A Data Input Pin Value Register
volatile @near unsigned char PA_DDR		@0x5002;		//PORT_A Data Data Direction Register
volatile @near unsigned char PA_CR1		@0x5003;		//PORT_A Data Control Register_1
volatile @near unsigned char PA_CR2		@0x5004;		//PORT_A Data Control Register_2
volatile @near unsigned char PB_ODR		@0x5005;		//PORT_B Data Output Latch Register
volatile @near unsigned char PB_IDR		@0x5006;		//PORT_B Data Input Pin Value Register
volatile @near unsigned char PB_DDR		@0x5007;		//PORT_B Data Data Direction Register
volatile @near unsigned char PB_CR1		@0x5008;		//PORT_B Data Control Register_1
volatile @near unsigned char PB_CR2		@0x5009;		//PORT_B Data Control Register_2
volatile @near unsigned char PC_ODR		@0x500A;		//PORT_C Data Output Latch Register
volatile @near unsigned char PC_IDR		@0x500B;		//PORT_C Data Input Pin Value Register
volatile @near unsigned char PC_DDR		@0x500C;		//PORT_C Data Data Direction Register
volatile @near unsigned char PC_CR1		@0x500D;		//PORT_C Data Control Register_1
volatile @near unsigned char PC_CR2		@0x500E;		//PORT_C Data Control Register_2
volatile @near unsigned char PD_ODR		@0x500F;		//PORT_D Data Output Latch Register
volatile @near unsigned char PD_IDR		@0x5010;		//PORT_D Data Input Pin Value Register
volatile @near unsigned char PD_DDR		@0x5011;		//PORT_D Data Data Direction Register
volatile @near unsigned char PD_CR1		@0x5012;		//PORT_D Data Control Register_1
volatile @near unsigned char PD_CR2		@0x5013;		//PORT_D Data Control Register_2
volatile @near unsigned char PE_ODR		@0x5014;		//PORT_E Data Output Latch Register
volatile @near unsigned char PE_IDR		@0x5015;		//PORT_E Data Input Pin Value Register
volatile @near unsigned char PE_DDR		@0x5016;		//PORT_E Data Data Direction Register
volatile @near unsigned char PE_CR1		@0x5017;		//PORT_E Data Control Register_1
volatile @near unsigned char PE_CR2		@0x5018;		//PORT_E Data Control Register_2
volatile @near unsigned char PF_ODR		@0x5019;		//PORT_F Data Output Latch Register
volatile @near unsigned char PF_IDR		@0x501A;		//PORT_F Data Input Pin Value Register
volatile @near unsigned char PF_DDR		@0x501B;		//PORT_F Data Data Direction Register
volatile @near unsigned char PF_CR1		@0x501C;		//PORT_F Data Control Register_1
volatile @near unsigned char PF_CR2		@0x501D;		//PORT_F Data Control Register_2
volatile @near unsigned char PG_ODR		@0x501E;		//PORT_G Data Output Latch Register
volatile @near unsigned char PG_IDR		@0x501F;		//PORT_G Data Input Pin Value Register
volatile @near unsigned char PG_DDR		@0x5020;		//PORT_G Data Data Direction Register
volatile @near unsigned char PG_CR1		@0x5021;		//PORT_G Data Control Register_1
volatile @near unsigned char PG_CR2		@0x5022;		//PORT_G Data Control Register_2
volatile @near unsigned char PH_ODR		@0x5023;		//PORT_H Data Output Latch Register
volatile @near unsigned char PH_IDR		@0x5024;		//PORT_H Data Input Pin Value Register
volatile @near unsigned char PH_DDR		@0x5025;		//PORT_H Data Data Direction Register
volatile @near unsigned char PH_CR1		@0x5026;		//PORT_H Data Control Register_1
volatile @near unsigned char PH_CR2		@0x5027;		//PORT_H Data Control Register_2
volatile @near unsigned char PI_ODR		@0x5028;		//PORT_I Data Output Latch Register
volatile @near unsigned char PI_IDR		@0x5029;		//PORT_I Data Input Pin Value Register
volatile @near unsigned char PI_DDR		@0x502A;		//PORT_I Data Data Direction Register
volatile @near unsigned char PI_CR1		@0x502B;		//PORT_I Data Control Register_1
volatile @near unsigned char PI_CR2		@0x502C;		//PORT_I Data Control Register_2

/*==============	¢Ñ Flash Control Register ¢Ð  =======================================================*/
volatile @near unsigned char FLASH_CR1	@0x505A;		//Flash Control Register_1
volatile @near unsigned char FLASH_CR2	@0x505B;		//Flash Control Register_2
volatile @near unsigned char FLASH_NCR12	@0x505C;		//Flash Complementary Control Register_2
volatile @near unsigned char FLASH_FPR	@0x505D;		//Flash Protection Register
volatile @near unsigned char FLASH_NFPR	@0x505E;		//Flash Complementary Protection Register
volatile @near unsigned char FLASH_IAPSR	@0x505F;		//Flash In-Application Programming Status Register
volatile @near unsigned char FLASH_PUKR	@0x5062;		//Flash Program Memory Unprotection Register
volatile @near unsigned char FLASH_DUKR	@0x5064;		//Data EEPROM Unprotection Register

/*==============	¢Ñ ITC Control Register ¢Ð  =========================================================*/
volatile @near unsigned char EXTI_CR1		@0x50A0;		//External Interrupt Control Register_1
volatile @near unsigned char EXTI_CR2		@0x50A1;		//External Interrupt Control Register_2

/*==============	¢Ñ Reset Status Register ¢Ð  ========================================================*/
volatile @near unsigned char RST_SR		@0x50B3;		//Reset Status Register

/*==============	¢Ñ Clock Control Register ¢Ð  =======================================================*/
volatile @near unsigned char CLK_ICKR		@0x50C0;		//Internal Clock Control Register
volatile @near unsigned char CLK_ECKR	@0x50C1;		//External Clock Control Register
volatile @near unsigned char CLK_CMSR	@0x50C3;		//Clock Master Status Register
volatile @near unsigned char CLK_SWR		@0x50C4;		//Clock Master Switch Register
volatile @near unsigned char CLK_SWCR	@0x50C5;		//Clock Switch Control Register
volatile @near unsigned char CLK_CKDIVR	@0x50C6;		//Clock Divider Register
volatile @near unsigned char CLK_PCKENR1	@0x50C7;		//Peripheral Clock Gating Register_1
volatile @near unsigned char CLK_CSSR	@0x50C8;		//Clock Security System Register
volatile @near unsigned char CLK_CCOR	@0x50C9;		//Configurable Clock Cntrol Register
volatile @near unsigned char CLK_PCKENR2	@0x50CA;	//Peripheral Clock Gating Register_2
volatile @near unsigned char CLK_CANCR	@0x50CB;	//CAN Clock Control Register
volatile @near unsigned char CLK_HSITRIMR	@0x50CC;	//HSI Clock Calibration Trimming Register
volatile @near unsigned char CLK_SWIMCCR	@0x50CD;	//SWIM Clock Control Register

/*==============	¢Ñ Watch-Dog Control Register ¢Ð  ==================================================*/
volatile @near unsigned char WWDG_CR	@0x50D1;		//Windows Watch-dog Control Register
volatile @near unsigned char WWDG_WR	@0x50D2;		//Windows Watch-dog Register
volatile @near unsigned char IWDG_KR		@0x50E0;		//Independent Watch-dog Key Register
volatile @near unsigned char IWDG_PR		@0x50E1;		//Independent Watch-dog Prescaler Register
volatile @near unsigned char IWDG_RLR	@0x50E2;		//Independent Watch-dog Reload Register

/*==============	¢Ñ Auto Wake-up Control Register ¢Ð  ===============================================*/
volatile @near unsigned char AWU_CSR1	@0x50F0;		//Auto Wake-up Control/Status Register_1
volatile @near unsigned char AWU_APR	@0x50F1;		//Auto Wake-up Asynchronous Prescaler Buffer Register
volatile @near unsigned char AWU_TBR		@0x50F2;		//Auto Wake-up Timebase Selection Register

/*==============	¢Ñ Beep Control Register ¢Ð  ======================================================*/
volatile @near unsigned char BEEP_CSR	@0x50F3;		//Beep Control / Status Register

/*==============	¢Ñ SPI Control Register ¢Ð  =======================================================*/
volatile @near unsigned char SPI_CR1		@0x5200;		//SPI Control Register_1
volatile @near unsigned char SPI_CR2		@0x5201;		//SPI Control Register_2
volatile @near unsigned char SPI_ICR		@0x5202;		//SPI Interrupt Control Register
volatile @near unsigned char SPI_SR		@0x5203;		//SPI Status Register
volatile @near unsigned char SPI_DR		@0x5204;		//SPI Data Register
volatile @near unsigned char SPI_CRCPR	@0x5205;		//SPI CRC Polynomial Register
volatile @near unsigned char SPI_RXCRCR	@0x5206;		//SPI Rx CRC Register
volatile @near unsigned char SPI_TXCRCR	@0x5207;		//SPI Tx CRC Register

/*==============	¢Ñ I2C Control Register ¢Ð  =======================================================*/
volatile @near unsigned char I2C_CR1		@0x5210;		//I2C Control Register_1
volatile @near unsigned char I2C_CR2		@0x5211;		//I2C Control Register_2
volatile @near unsigned char I2C_FREQR	@0x5212;		//I2C Frequency Register
volatile @near unsigned char I2C_OARL		@0x5213;		//I2C Own Address Register Low
volatile @near unsigned char I2C_OARH		@0x5214;		//I2C Own Address Register High
volatile @near unsigned char I2C_DR		@0x5216;		//I2C Data Register
volatile @near unsigned char I2C_SR1		@0x5217;		//I2C Status Register_1
volatile @near unsigned char I2C_SR2		@0x5218;		//I2C Status Register_2
volatile @near unsigned char I2C_SR3		@0x5219;		//I2C Status Register_3
volatile @near unsigned char I2C_ITR		@0x521A;		//I2C Interrupt Control Register
volatile @near unsigned char I2C_CCRL		@0x521B;		//I2C Clock Control Register Low
volatile @near unsigned char I2C_CCRH		@0x521C;		//I2C Clock Control Register High
volatile @near unsigned char I2C_TRISER	@0x521D;		//I2C TRISE Register
volatile @near unsigned char I2C_PECR		@0x521E;		//I2C Packet Error Checking Register

/*==============	¢Ñ UART Control Register ¢Ð  ======================================================*/
volatile @near unsigned char UART_SR		@0x5230;		//UART Status Register
volatile @near unsigned char UART_DR		@0x5231;		//UART Data Register
volatile @near unsigned char UART_BRR1	@0x5232;		//UART Baud Rate Register_1
volatile @near unsigned char UART_BRR2	@0x5233;		//UART Baud Rate Register_2
volatile @near unsigned char UART_CR1	@0x5234;		//UART Control Register_1
volatile @near unsigned char UART_CR2	@0x5235;		//UART Control Register_2
volatile @near unsigned char UART_CR3	@0x5236;		//UART Control Register_3
volatile @near unsigned char UART_CR4	@0x5237;		//UART Control Register_4
volatile @near unsigned char UART_CR5	@0x5238;		//UART Control Register_5
volatile @near unsigned char UART_GTR	@0x5239;		//UART Guard Time Register
volatile @near unsigned char UART_PSCR	@0x523A;		//UART Prescaler Register

/*==============	¢Ñ LIN_SCI Control Register ¢Ð  ===================================================*/
volatile @near unsigned char LINUART_SR	@0x5240;		//LINUART Status Register
volatile @near unsigned char LINUART_DR	@0x5241;		//LINUART Data Register
volatile @near unsigned char LINUART_BRR1	@0x5242;		//LINUART Baud Rate Register_1
volatile @near unsigned char LINUART_BRR2	@0x5243;		//LINUART Baud Rate Register_2
volatile @near unsigned char LINUART_CR1	@0x5244;		//LINUART Control Register_1
volatile @near unsigned char LINUART_CR2	@0x5245;		//LINUART Control Register_2
volatile @near unsigned char LINUART_CR3	@0x5246;		//LINUART Control Register_3
volatile @near unsigned char LINUART_CR4	@0x5247;		//LINUART Control Register_4
volatile @near unsigned char LINUART_CR6	@0x5249;		//LINUART Control Register_6

/*==============	¢Ñ TIMER_1 Control Register ¢Ð  ===================================================*/
volatile @near unsigned char TIM1_CR1		@0x5250;		//Timer_1 Control Register_1
volatile @near unsigned char TIM1_CR2		@0x5251;		//Timer_1 Control Register_2
volatile @near unsigned char TIM1_SMCR	@0x5252;		//Timer_1 Slave Mode Control Register
volatile @near unsigned char TIM1_ETR		@0x5253;		//Timer_1 External Trigger Register
volatile @near unsigned char TIM1_IER		@0x5254;		//Timer_1 Interrupt Enable Register
volatile @near unsigned char TIM1_SR1		@0x5255;		//Timer_1 Status Register_1
volatile @near unsigned char TIM1_SR2		@0x5256;		//Timer_1 Status Register_1
volatile @near unsigned char TIM1_EGR		@0x5257;		//Timer_1 Event Generation Register
volatile @near unsigned char TIM1_CCMR1	@0x5258;		//Timer_1 Capture / Compare Mode Register_1
volatile @near unsigned char TIM1_CCMR2	@0x5259;		//Timer_1 Capture / Compare Mode Register_2
volatile @near unsigned char TIM1_CCMR3	@0x525A;		//Timer_1 Capture / Compare Mode Register_3
volatile @near unsigned char TIM1_CCMR4	@0x525B;		//Timer_1 Capture / Compare Mode Register_4
volatile @near unsigned char TIM1_CCER1	@0x525C;		//Timer_1 Capture / Compare Mode Enable Register_1
volatile @near unsigned char TIM1_CCER2	@0x525D;		//Timer_1 Capture / Compare Mode Enable Register_2
volatile @near unsigned char TIM1_CNTRH	@0x525E;		//Timer_1 Counter High
volatile @near unsigned char TIM1_CNTRL	@0x525F;		//Timer_1 Counter Low
volatile @near unsigned char TIM1_PSCRH	@0x5260;		//Timer_1 Prescaler Register High
volatile @near unsigned char TIM1_PSCRL	@0x5261;		//Timer_1 Prescaler Register Low
volatile @near unsigned char TIM1_ARRH	@0x5262;		//Timer_1 Auto-Reload Register High
volatile @near unsigned char TIM1_ARRL	@0x5263;		//Timer_1 Auto-Reload Register Low
volatile @near unsigned char TIM1_RCR		@0x5264;		//Timer_1 Repetition Counter Register
volatile @near unsigned char TIM1_CCR1H	@0x5265;		//Timer_1 Capture / Compare Register_1 High
volatile @near unsigned char TIM1_CCR1L	@0x5266;		//Timer_1 Capture / Compare Register_1 Low
volatile @near unsigned char TIM1_CCR2H	@0x5267;		//Timer_1 Capture / Compare Register_2 High
volatile @near unsigned char TIM1_CCR2L	@0x5268;		//Timer_1 Capture / Compare Register_2 Low
volatile @near unsigned char TIM1_CCR3H	@0x5269;		//Timer_1 Capture / Compare Register_3 High
volatile @near unsigned char TIM1_CCR3L	@0x526A;		//Timer_1 Capture / Compare Register_3 Low
volatile @near unsigned char TIM1_CCR4H	@0x526B;		//Timer_1 Capture / Compare Register_4 High
volatile @near unsigned char TIM1_CCR4L	@0x526C;		//Timer_1 Capture / Compare Register_4 Low
volatile @near unsigned char TIM1_BKR		@0x526D;		//Timer_1 Break Register
volatile @near unsigned char TIM1_DTR		@0x526E;		//Timer_1 Dead-Time Register
volatile @near unsigned char TIM1_OISR	@0x526F;		//Timer_1 Output Idle State Register

/*==============	¢Ñ TIMER_2 Control Register ¢Ð  ===================================================*/
volatile @near unsigned char TIM2_CR1		@0x5300;		//Timer_2 Control Register_1
volatile @near unsigned char TIM2_IER		@0x5301;		//Timer_2 Interrupt Enable Register
volatile @near unsigned char TIM2_SR1		@0x5302;		//Timer_2 Status Register_1
volatile @near unsigned char TIM2_SR2		@0x5303;		//Timer_2 Status Register_1
volatile @near unsigned char TIM2_EGR		@0x5304;		//Timer_2 Event Generation Register
volatile @near unsigned char TIM2_CCMR1	@0x5305;		//Timer_2 Capture / Compare Mode Register_1
volatile @near unsigned char TIM2_CCMR2	@0x5306;		//Timer_2 Capture / Compare Mode Register_2
volatile @near unsigned char TIM2_CCMR3	@0x5307;		//Timer_2 Capture / Compare Mode Register_3
volatile @near unsigned char TIM2_CCER1	@0x5308;		//Timer_2 Capture / Compare Mode Enable Register_1
volatile @near unsigned char TIM2_CCER2	@0x5309;		//Timer_2 Capture / Compare Mode Enable Register_2
volatile @near unsigned char TIM2_CNTRH	@0x530A;		//Timer_2 Counter High
volatile @near unsigned char TIM2_CNTRL	@0x530B;		//Timer_2 Counter Low
volatile @near unsigned char TIM2_PSCR	@0x530C;		//Timer_2 Prescaler Register
volatile @near unsigned char TIM2_ARRH	@0x530D;		//Timer_2 Auto-Reload Register High
volatile @near unsigned char TIM2_ARRL	@0x530E;		//Timer_2 Auto-Reload Register Low
volatile @near unsigned char TIM2_CCR1H	@0x530F;		//Timer_2 Capture / Compare Register_1 High
volatile @near unsigned char TIM2_CCR1L	@0x5310;		//Timer_2 Capture / Compare Register_1 Low
volatile @near unsigned char TIM2_CCR2H	@0x5311;		//Timer_2 Capture / Compare Register_2 High
volatile @near unsigned char TIM2_CCR2L	@0x5312;		//Timer_2 Capture / Compare Register_2 Low
volatile @near unsigned char TIM2_CCR3H	@0x5313;		//Timer_2 Capture / Compare Register_3 High
volatile @near unsigned char TIM2_CCR3L	@0x5314;		//Timer_2 Capture / Compare Register_3 Low

/*==============	¢Ñ TIMER_3 Control Register ¢Ð  ===================================================*/
volatile @near unsigned char TIM3_CR1		@0x5320;		//Timer_3 Control Register_1
volatile @near unsigned char TIM3_IER		@0x5321;		//Timer_3 Interrupt Enable Register
volatile @near unsigned char TIM3_SR1		@0x5322;		//Timer_3 Status Register_1
volatile @near unsigned char TIM3_SR2		@0x5323;		//Timer_3 Status Register_1
volatile @near unsigned char TIM3_EGR		@0x5324;		//Timer_3 Event Generation Register
volatile @near unsigned char TIM3_CCMR1	@0x5325;		//Timer_3 Capture / Compare Mode Register_1
volatile @near unsigned char TIM3_CCMR2	@0x5326;		//Timer_3 Capture / Compare Mode Register_2
volatile @near unsigned char TIM3_CCER1	@0x5327;		//Timer_3 Capture / Compare Mode Enable Register_1
volatile @near unsigned char TIM3_CNTRH	@0x5328;		//Timer_3 Counter High
volatile @near unsigned char TIM3_CNTRL	@0x5329;		//Timer_3 Counter Low
volatile @near unsigned char TIM3_PSCR	@0x532A;		//Timer_3 Prescaler Register
volatile @near unsigned char TIM3_ARRH	@0x532B;		//Timer_3 Auto-Reload Register High
volatile @near unsigned char TIM3_ARRL	@0x532C;		//Timer_3 Auto-Reload Register Low
volatile @near unsigned char TIM3_CCR1H	@0x532D;		//Timer_3 Capture / Compare Register_1 High
volatile @near unsigned char TIM3_CCR1L	@0x532E;		//Timer_3 Capture / Compare Register_1 Low
volatile @near unsigned char TIM3_CCR2H	@0x532F;		//Timer_3 Capture / Compare Register_2 High
volatile @near unsigned char TIM3_CCR2L	@0x5330;		//Timer_3 Capture / Compare Register_2 Low

/*==============	¢Ñ TIMER_4 Control Register ¢Ð  ===================================================*/
volatile @near unsigned char TIM4_CR1		@0x5340;		//Timer_4 Control Register_1
volatile @near unsigned char TIM4_IER		@0x5341;		//Timer_4 Interrupt Enable Register
volatile @near unsigned char TIM4_SR		@0x5342;		//Timer_4 Status Register_1
volatile @near unsigned char TIM4_EGR		@0x5343;		//Timer_4 Event Generation Register
volatile @near unsigned char TIM4_CNTR	@0x5344;		//Timer_4 Counter
volatile @near unsigned char TIM4_PSCR	@0x5345;		//Timer_4 Prescaler Register
volatile @near unsigned char TIM4_ARR		@0x5346;		//Timer_4 Auto-Reload Register Low

/*==============	¢Ñ ADC Control Register ¢Ð  ======================================================*/
volatile @near unsigned char ADC_CSR		@0x5400;		//ADC Control/Status Register
volatile @near unsigned char ADC_CR1		@0x5401;		//ADC Configuration Register_1
volatile @near unsigned char ADC_CR2		@0x5402;		//ADC Configuration Register_2
volatile @near unsigned char ADC_CR3		@0x5403;		//ADC Configuration Register_3
volatile @near unsigned char ADC_DRH		@0x5404;		//ADC Data Register High
volatile @near unsigned char ADC_DRL		@0x5405;		//ADC Data Register Low
volatile @near unsigned char ADC_TDRH	@0x5406;		//ADC Schmitt Trigger Disable Register High
volatile @near unsigned char ADC_TDRL	@0x5407;		//ADC Schmitt Trigger Disable Register Low

/*==============	¢Ñ CAN Control Register ¢Ð  =====================================================*/
volatile @near unsigned char CAN_MCR		@0x5420;		//CAN Master Control Register
volatile @near unsigned char CAN_MSR		@0x5421;		//CAN Master Status Register
volatile @near unsigned char CAN_TSR		@0x5422;		//CAN Transmit Status Register
volatile @near unsigned char CAN_TPR		@0x5423;		//CAN Transmit Priority Register
volatile @near unsigned char CAN_RFR		@0x5424;		//CAN Receive FIFO Register
volatile @near unsigned char CAN_IER		@0x5425;		//CAN Interrupt Enable Register
volatile @near unsigned char CAN_DGR		@0x5426;		//CAN Diagnosis Register
volatile @near unsigned char CAN_FPSR	@0x5427;		//CAN Page Selection Register
volatile @near unsigned char CAN_P0		@0x5428;		//CAN Paged Register_0
volatile @near unsigned char CAN_P1		@0x5429;		//CAN Paged Register_1
volatile @near unsigned char CAN_P2		@0x542A;		//CAN Paged Register_2
volatile @near unsigned char CAN_P3		@0x542B;		//CAN Paged Register_3
volatile @near unsigned char CAN_P4		@0x542C;		//CAN Paged Register_4
volatile @near unsigned char CAN_P5		@0x542D;		//CAN Paged Register_5
volatile @near unsigned char CAN_P6		@0x542E;		//CAN Paged Register_6
volatile @near unsigned char CAN_P7		@0x542F;		//CAN Paged Register_7
volatile @near unsigned char CAN_P8		@0x5430;		//CAN Paged Register_8
volatile @near unsigned char CAN_P9		@0x5431;		//CAN Paged Register_9
volatile @near unsigned char CAN_PA		@0x5432;		//CAN Paged Register_A
volatile @near unsigned char CAN_PB		@0x5433;		//CAN Paged Register_B
volatile @near unsigned char CAN_PC		@0x5434;		//CAN Paged Register_C
volatile @near unsigned char CAN_PD		@0x5435;		//CAN Paged Register_D
volatile @near unsigned char CAN_PE		@0x5436;		//CAN Paged Register_E
volatile @near unsigned char CAN_PF		@0x5437;		//CAN Paged Register_F

/*==============	¢Ñ SYSTEM Control Register ¢Ð  ===================================================*/
volatile @near unsigned char CFG_GCR		@0x7F60;		//Global Configuration Register
volatile @near unsigned char ITC_SPR1		@0x7F70;		//Interrupt Software Priority Register_1
volatile @near unsigned char ITC_SPR2		@0x7F71;		//Interrupt Software Priority Register_2
volatile @near unsigned char ITC_SPR3		@0x7F72;		//Interrupt Software Priority Register_3
volatile @near unsigned char ITC_SPR4		@0x7F73;		//Interrupt Software Priority Register_4
volatile @near unsigned char ITC_SPR5		@0x7F74;		//Interrupt Software Priority Register_5
volatile @near unsigned char ITC_SPR6		@0x7F75;		//Interrupt Software Priority Register_6
volatile @near unsigned char ITC_SPR7		@0x7F76;		//Interrupt Software Priority Register_7
volatile @near unsigned char SWIM_CSR	@0x7F80;		//SWIM Control Status Register

/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
#endif
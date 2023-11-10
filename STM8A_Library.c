/*=================================================================================================
¢Ñ	Project		: JD_MTC_Control_Header
¢Ñ	Software Design	: Kim_Yong_Jun
¢Ñ	Update		: 2010_12_28
=================================================================================================*/

/*==============	¢Ñ Main Include File ¢Ð  =============================================================*/
#include	"Main.h"				//Main Include
/*==============	¢Ñ CPU Reset Initialize Routine ¢Ð  ====================================================*/
void CPU_Clock_Initialize(void)
{
	//Be_Careful!!
	if(CLK_CMSR != 0xB4){
		CLK_SWCR = 0B00000000;	//Clock Switch Disable, Switch Interrupt Disable
		CLK_SWR = 0xB4;		//High Speed External Clock, HSI(0xE1), LSI(0xD2)
		while(!(CLK_SWCR & 0x08));	//SWIF
		CLK_SWCR &= 0B11110111;	//Clear Switch Event
		CLK_SWCR |= 0x02;		//by KMSHIM, clear
		while(CLK_SWCR & 0x01);    	//poll SWBSY
		CLK_CKDIVR = 0x00; 	//xxxIIEEE : Fmaster = HSE / 1 = 8Mhz / 1, Fcpu = 8Mhz
	}//End of Clock_Ready

	CLK_PCKENR1 = 0B01000000;		//TIM1 OFF, TIM3 ON, TIM2 OFF, TIM4 OFF, LINUART ON, USART OFF, SPI OFF, I2C OFF
	CLK_PCKENR2 = 0B10000000;		//CAN OFF, ADC OFF, AWU OFF
	
	return;
}//End of CPU Reset_Value_Initialize

/*==============	¢Ñ Disable_Global_Interrupt Routine ¢Ð  ================================================*/
void DisableInterrupts(void)
{
	_asm("sim");			//Disable Global Interrupt
	return;
}//End of Disable_Global_Interrupt

/*==============	¢Ñ Enables_Global_Interrupt Routine ¢Ð  ================================================*/
void EnableInterrupts(void)
{
	_asm("rim");			//Enable Global Interrupt
	return;
}//End of Enables_Global_Interrupt

/*==============	¢Ñ Windows Watchdog Reset Routine ¢Ð  ===============================================*/
void Windows_Watchdog_Clear(void)
{
	WWDG_WR = 0x7F;			//Limit Counter Value = (8Mhz / 12288) x 63 = 96.768ms
	WWDG_CR = 0xFF;			//96.768ms, Between 0 and WATCHDOG_LIMIT, if 100ms*(8Mhz/12288) = 33
	return;
 }//End of Reset_Watchdog

/*==============	¢Ñ AD Converter Module Enable Routine ¢Ð  =============================================*/
void ADC_Enable(void)
{
	ADC_CR1	= 0B01000000;		//Sampleing clock = 8Mhz(Fmaster) / 8 = 1MHz, Single Mode, ADC Disable
	ADC_CR2	= 0B00000000;		//External Trigger Disable, Left Alignment, Scan Disable
	ADC_CR3	= 0B00000000;		//Buffer Disable
	ADC_CSR	= 0B00000000;		//EOC Clear, AWD Clera, AWD Interrut Disable, EOC Interrupt Disable, Channel 0;
	ADC_CR1 |= 0x01;			//ADC Conversion Start
	return;
}//End of ADC_Enable

/*==============	¢Ñ ADC_10BIT_Conversn Data Read Routine ¢Ð  ===========================================*/
unsigned int ADC_10BIT_Read(unsigned char Channel)
{
	unsigned int Buffer;

	ADC_CSR = Channel; 		//Select ADC Channel
	ADC_CR1 |= 0x01;			//ADC Conversion Start
	while((ADC_CSR & 0x80) == 0);	//Conversion Completed?
	Buffer = ADC_DRH;			//ADC Data[9:2]
	Buffer = (Buffer << 2) | ADC_DRL;	//ADC Data[1:0]
	return(Buffer);			//10Bit ADC Return
}//End of ADC_10BIT_Read

/*==============	¢Ñ TIMER 3 Enable Routine ¢Ð  ========================================================*/
void TIMER_3_Enable(void)			//10ms Timer Interrupt
{
/*	TIM3_CR1 = 0B10000101;		//Auto Reload Enable, overflow interrut, counter enable
	TIM3_PSCR = 0x05;			//Prescaler = Fcpu / 2 ^ 3 = 8M / 8 = 1000khz = 1.0us
	TIM3_ARRH = 0x03;			//ARR = 1000 X 1us = 1ms 
	TIM3_ARRL = 0xE7;
	TIM3_SR1 = 0x00;				//Pending Flag Clear
	TIM3_IER = 0B00000001; 		//Overflow interrupt Enable*/

	TIM3_CR1 = 0B10000101;		//Auto Reload Enable, overflow interrut, counter enable
	TIM3_PSCR = 0x07;			//Prescaler = Fcpu / 2 ^ 3 = 8M/8 = 1M
	TIM3_ARRH = 0x02;			//ARR = 9999, 10000/1M = 0.01s = 10ms
	TIM3_ARRL = 0x70;
	TIM3_SR1 = 0x00;			//Pending Flag Clear
	TIM3_IER = 0B00000001; 		//Overflow interrupt Enable

	return;
}//End of TIMER_3_Enable

/*==============	¢Ñ CAN All Interrupt Disable Routine ¢Ð =================================================*/
void CAN_Interrupt_Disable(void)		//CAN_Interrupt_All_Disable
{
	U8 Buffer;

	Buffer = CAN_FPSR;			//Current_Page_Save
	CAN_IER = 0x00;
	CAN_FPSR = 0x06;
	CAN_P1 = 0x00;
	CAN_FPSR = Buffer;
	return;
}//End of CAN_Interrupt_Disable

/*==============	¢Ñ CAN All Interrupt Disable Routine ¢Ð =================================================*/
void CAN_Interrupt_Enable(void)		//CAN_Interrupt_All_Enable
{
	U8 Buffer;

	Buffer = CAN_FPSR;
	CAN_IER = 0x0F;			//Wakeup = OFF, Overrun, FIFO Full, Message_Pending, Tx_Mail Box Empty Interrupt Enable
	CAN_FPSR = 0x06;			//Configuration/Diagnostic_Page_Select
	CAN_P1 = 0x84;			//Interrupt Enable = BUS OFF = ON, Last Error Code = OFF, Error Passive = OFF, Error Wareing = OFF
	CAN_FPSR = Buffer;
	return;
}//End of CAN_Interrupt_Enable

/*==============	¢Ñ CAN Module Initialize Routine ¢Ð ===================================================*/
void CAN_Enable(void)			//CAN_Initialize
{
	//CAN_Wake_up_Request
	CAN_MCR &= 0B11111101;		//leave Sleep Mode = CPU Reset Defualt : Sleep
	while(CAN_MSR & 0x02);		//beCAN is in Sleep Mode

	//Abort_the_Pending_Transmit_Requests
	CAN_FPSR = 0x00;			//PSR(Page Select Register) : Tx_Mailbox_0_Page_Select
	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort

	CAN_FPSR = 0x01;			//PSR(Page Select Register) : Tx_Mailbox_1_Page_Select
	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort

	CAN_FPSR = 0x05;  			//PSR(Page Select Register) : Tx_Mailbox_2_Page_Select
	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort

	CAN_MCR |= 0x01;			//MCR(Master Control Register) : Request_Initialisation
	while((CAN_MSR & 0x01) == 0);	//MSR(Master Select Regitser) : Wait_until_Acknowledged

	CAN_TSR |= 0B00000111;		//Clear_Request_Completed_for_Mailbox_[0:1:2]

	//Release_the_Receive_FIFO ¡æ Clear_FMP_Bits_and_FULL_Bit
	while(CAN_RFR & 0x03){ CAN_RFR = 0x20; }

	CAN_RFR |= 0x10;			//Clear_the_FIFO_Overrun(FOVR)_Bit
	CAN_MSR = 0x08;  			//Clear_Wake_up_Pending_Interrupt
	CAN_MCR |= 0x44;  			//Automatic_Bus_Off_Management, Tx_Priority_Driven by Request_Order

	//Filter_Configuration
	CAN_FPSR = 0x06;  			//Configuration / Diagnostic_Page_Select
	CAN_PA = 0x00;			//FCR1(Filter Configuration Register 1), Disable Filter 0 and Filter 1
	CAN_PB = 0x00;			//FCR2(Filter Configuration Register 2), Disable Filter 2 and Filter 3
	CAN_PC = 0x00;			//FCR3(Filter Configuration Register 3), Disable Filter 4 and Filter 5

	//Configure Bit Timing = 500Kbps, 75%, 1SJW, 1/8Tq
	CAN_P4 = 0B00000001;		//SJW[7:6] = 1, BRP[5:0] = 2
	CAN_P5 = 0B00010100;		//CAN Clock Source = Fcpu(8Mhz), BS2[6:4] = 2, BS1[3:0] = 5

	//Filter Mode
	CAN_P8 = 0B11111111;		//FMR1(Filter Mode Register 1) = Bank_3~0 : List_Mode
	CAN_P9 = 0B00001111;		//FMR2(Filter Mode Register 2) = Bank_5~4 : List_Mode

	//Filter_Bank_0, 1Page_Select
	CAN_FPSR = 0x02;
	//BID_Bank 0
	CAN_P0 	= (U8)((CAN_HTR_STATUS1_ID & 0x7F8) >> 3);	//Rx_Filter_0
	CAN_P1 	= (U8)((CAN_HTR_STATUS1_ID & 0x007) << 5);
	CAN_P2 	= (U8)((CAN_HTR_STATUS2_ID & 0x7F8) >> 3);	//Rx_Filter_1
	CAN_P3 	= (U8)((CAN_HTR_STATUS2_ID & 0x007) << 5);
	CAN_P4 	= (U8)((CAN_HTR_STATUS3_ID & 0x7F8) >> 3);	//Rx_Filter_2
	CAN_P5 	= (U8)((CAN_HTR_STATUS3_ID & 0x007) << 5);
	CAN_P6 	= (U8)((CAN_HTR_STATUS4_ID & 0x7F8) >> 3);	//Rx_Filter_3
	CAN_P7 	= (U8)((CAN_HTR_STATUS4_ID & 0x007) << 5);

	//ID_Bank 1
	CAN_P8 	= (U8)(0x00);	//Rx_Filter_5
	CAN_P9 	= (U8)(0x00);
	CAN_PA 	= (U8)(0x00);	//Rx_Filter_7
	CAN_PB 	= (U8)(0x00);
	CAN_PC 	= (U8)(0x00);	//Rx_Filter_8
	CAN_PD 	= (U8)(0x00);
	CAN_PE 	= (U8)(0x00);	//Rx_Filter_9
	CAN_PF 	= (U8)(0x00);

	 //Filter_Bank_2, 3 Page_Select
	CAN_FPSR = 0x03;
	//ID_Bank 2
	CAN_P0 	= (U8)(0x00);
	CAN_P1 	= (U8)(0x00);
	CAN_P2 	= (U8)(0x00);
	CAN_P3 	= (U8)(0x00);
	CAN_P4 	= (U8)(0x00);
	CAN_P5 	= (U8)(0x00);
	CAN_P6 	= (U8)(0x00);
	CAN_P7 	= (U8)(0x00);
	//ID_Bank 3
	CAN_P8 	= (U8)(0x00);
	CAN_P9 	= (U8)(0x00);
	CAN_PA 	= (U8)(0x00);
	CAN_PB 	= (U8)(0x00);
	CAN_PC	= (U8)(0x00);
	CAN_PD 	= (U8)(0x00);
	CAN_PE 	= (U8)(0x00);
	CAN_PF 	= (U8)(0x00);

	CAN_FPSR = 0x04; 			//Filter_Bank_4,5 Page_Select
	//ID_Bank 4
	CAN_P0 	= (U8)(0x00);
	CAN_P1 	= (U8)(0x00);
	CAN_P2 	= (U8)(0x00);
	CAN_P3 	= (U8)(0x00);
	CAN_P4 	= (U8)(0x00);
	CAN_P5 	= (U8)(0x00);
	CAN_P6 	= (U8)(0x00);
	CAN_P7 	= (U8)(0x00);
	//ID_Bank 5
	CAN_P8 	= (U8)(0x00);
	CAN_P9 	= (U8)(0x00);
	CAN_PA 	= (U8)(0x00);
	CAN_PB 	= (U8)(0x00);
	CAN_PC 	= (U8)(0x00);
	CAN_PD 	= (U8)(0x00);
	CAN_PE 	= (U8)(0x00);
	CAN_PF 	= (U8)(0x00);

	//Configuration/Diagnostic_Page_Select
	CAN_FPSR = 0x06;
	//CAN_PA(Filter_Configuration_Register)
	//Bit.7	: Reserved
	//Bit[6:5]	: 00 ¡æ 8bit_Filter
	//           	: 01 ¡æ 16bit_Filter_&_8bit_Filter
	//              : 10 ¡æ 16bit_Filter
	//              : 11 ¡æ 32bit_Filter
	//Bit4	: Filter_Enable

	//Filter Bank_1_&_0
	CAN_PA = 0x55;			//Bank_1_&_0_Filter_Enable

	//Filter Bank_3_&_2
	CAN_PB = 0x55;			//Filter_Disable

  	//Filter Bank_5_&_4
	CAN_PC = 0x00;			//Filter_Disable

	CAN_DGR |= 0x10;			//3rd_Tx_Mailboxes_Enable

	CAN_MCR &= 0xFE;			//Leave_the_Init_Mode, that_is_switch_into_Normal_Mode
	return;
}//End of CAN_Enable

/*==============	¢Ñ CAN Module Disable Routine ¢Ð ====================================================*/
void CAN_Disable(void)
{
	CAN_MCR |= 0B00000010; 		//CAN_Sleep_Reqeust
	return;
}//End of CAN_Disable

/*==============	¢Ñ Current Transmit Request Cancle Routine ¢Ð ==========================================*/
void CAN_Transmit_Cancel(void)
{
	U8 Buffer;

	Buffer = CAN_FPSR;

	CAN_FPSR = 0x00; 			//Tx_Mailbox_0_Select
	CAN_P0 |= 0x02;			//Make_Abort_Request

	CAN_FPSR = 0x01;			//Tx_Mailbox_1_Select
	CAN_P0 |= 0x02;			//Make_Abort_Request

	CAN_FPSR = 0x05;			//Tx_Mailbox_2_Select
	CAN_P0 |= 0x02;			//Make_Abort_Request

	CAN_FPSR = Buffer;
	return;
}//End of CAN_Transmit_Cancel

/*==============	¢Ñ CAN_Wait_Tx_Message Routine ¢Ð ==================================================*/
void CAN_Wait_Tx_Message(void)
{
	U16 Time = 0;

	//Wait_uitil_All_Tx_Completed
	while((CAN_TPR & 0x1C) != 0x1C){	//All_Mailbox_Empty?
		if(++Time > 2000){ break; }	//2ms/8MHz_Clock_Timeout
	}//End of Wait_uitil_all_Tx_Completed
	return;
}//End of CAN_Wait_Tx_Message
/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

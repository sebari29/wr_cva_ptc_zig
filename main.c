/*=======================================================================================
¢Ñ	Project_Name	: Test Controller
¢Ñ	Processor	: STM8A_Serise
¢Ñ	CPU_Clock	: 8MHz_External_Resonator
¢Ñ	Compiler		: Cosmic_STM8_v4.3.4_Compiler
¢Ñ	Design_By	: Woory_Industrial
¢Ñ	Final_Release	: 2017_07_18
=========================================================================================*/

/*==============	¢Ñ Include_File ¢Ð  =================================================================*/
#include	"Main.h"				//Main Include

/*==============	¢Ñ Control_Regsiter ¢Ð  ==============================================================*/
@tiny volatile U8 uc_System_Ctrl_Reg;	// System_Control_Register
volatile U16 ui_System_Timer_Cnt;		// System_Timer_Control_Counter


/*==============	¢Ñ System_On_Initialize ¢Ð  =============================================================*/
void System_On_Initialize(void)
{
	Test_Ctrl_Reset_Values();
	TIMER_3_Enable();			// System_Timer_Enable
//	LINUART_Enable();			// LIN_Communication_Enable

//	io_LIN_EN_OUTPUT = ON;					// LIN_Tranciever_Enable
//	b_LIN_Mute_Mode_Flag = ON;

	return;
}// End of System_On_Initialize


/*==============	¢Ñ Internal_Function ¢Ð  =============================================================*/



/*==============	¢Ñ Timer 3 Overflow Interrupt Routine ¢Ð  ===============================================*/
void Timer_10ms_Routine(void)
{
	LCD_Blink_Timer_Control();
//	LIN_Time_Control_Routine();
	return;
}

/*==============	¢Ñ Alarm_Setting_Mode_Display_Control ¢Ð  =============================================*/
void Start_Zig_Display(void)
{
	if(b_First_Logic_On == OFF){
				
		Set_LCD_Address(0x00);	// 1 Line Test Zig
		Display_LCD_String("WOORY Industrial");
	
		Set_LCD_Address(0xC0);  // 2 Line Test Zig
#if (PTC_MODEL == MV_FRONT_PTC)
		Display_LCD_String("MV FRONT PTC");
#elif (PTC_MODEL == MV_REAR_PTC)
		Display_LCD_String("MV REAR PTC");
#elif (PTC_MODEL == SU2I_PTC)
		Display_LCD_String("SU2I PTC");
#elif (PTC_MODEL == CVa_FRONT_PTC)
		Display_LCD_String("CV FRONT PTC");
#else
		Display_LCD_String("TEST PTC");
#endif
		Set_LCD_Address(0x10);  // 3 Line Test Zig
		Display_LCD_String("Test Ctrl Ver0.4");

		Set_LCD_Address(0xD0);  // 4 Line Test Zig
		Display_LCD_String("23.11.13  By OSY");
	}	
	return;
}// End of Start_Zig_Display



/*==============	¢Ñ System_IO_Port_Initialize ¢Ð  ===========================================================*/
void System_IO_Port_Initialize(void)
{
	EXTI_CR1 = 0B10101010;
	EXTI_CR2 = 0B00000010;

	PA_ODR	= 0B00000000;		//PORT_A all of ouput low
	PA_DDR	= 0B00000000;		//PORT_A Input / Output Selection
	PA_CR1	= 0B00000000;		//PORT_A Function Select_1
	PA_CR2	= 0B00000000;		//PORT_A Function Select_2 ;; IGN Input/Speed Signal Input

	PB_ODR	= 0B00000000;		//PORT_B all of ouput low
	PB_DDR	= 0B11111111;		//PORT_B Input / Output Selection
	PB_CR1	= 0B11111111;		//PORT_B Function Select_1
	PB_CR2	= 0B00000000;		//PORT_B Function Select_2

	PC_ODR	= 0B00000000;		//PORT_C all of ouput low
	PC_DDR	= 0B11100110;		//PORT_C Input / Output Selection
	PC_CR1	= 0B11100110;		//PORT_C Function Select_1
	PC_CR2	= 0B00000000;		//PORT_C Function Select_2

	PD_ODR	= 0B00000100;		//PORT_D all of ouput low
	PD_DDR	= 0B10011101;		//PORT_D Input 0/ Output 1 Selection
	PD_CR1	= 0B10011101;		//PORT_D Function Select_1
	PD_CR2	= 0B00000000;		//PORT_D Function Select_2

	PE_ODR	= 0B00000000;		//PORT_E all of ouput low
	PE_DDR	= 0B01111110;		//PORT_E Input / Output Selection.
	PE_CR1	= 0B01111110;		//PORT_E Function Select_1
	PE_CR2	= 0B00000000;		//PORT_E Function Select_2

	PF_ODR	= 0B00000000;		//PORT_F all of ouput low
	PF_DDR	= 0B00111001;		//PORT_F Input / Output Selection.
	PF_CR1	= 0B00111001;		//PORT_F Function Select_1
	PF_CR2	= 0B00000000;		//PORT_F Function Select_2

	PG_ODR	= 0B00000000;		//PORT_G all of ouput low
	PG_DDR	= 0B11111000;		//PORT_G Input / Output Selection
	PG_CR1	= 0B11111000;		//PORT_G Function Select_1
	PG_CR2	= 0B00000000;		//PORT_G Function Select_2

	PI_ODR	= 0B00000000;		//PORT_I all of ouput low
	PI_DDR	= 0B00000001;		//PORT_I Input / Output Selection
	PI_CR1	= 0B00000001;		//PORT_I Function Select_1
	PI_CR2	= 0B00000000;		//PORT_I Function Select_2
	
	ADC_TDRH = 0B00000000;
	ADC_TDRL = 0B00000000;
	return;
}//End of System_IO_Port_Initialize



/*==============	¢Ñ System_Main_Control_Routine ¢Ð  ===================================================*/
void main(void)
{
	DisableInterrupts();				// Disable_Global_Interrupt

	Windows_Watchdog_Clear();		// Enable_Windows_Watchdog
	CPU_Clock_Initialize();			// System_Clock_Initialize
	System_IO_Port_Initialize();		// IO_Port_Initialize
	System_On_Initialize();			// System_Function_Initialize

	EnableInterrupts();				// Enabled_Global_Interrupt
	LCD_Initialize();

/*--------------------------------------------------------------------------------------------------*/
	for(;;){	
		Windows_Watchdog_Clear();	// Enabled_Windows_Watchdog	
		
		if(b_System_10ms_Task){		// System_10ms_task
			
			Timer_10ms_Routine();
			Controller_Button_Detection();
			
			if(!b_First_Logic_On){ Test_Controller_First_Routine(); }	// Controller_First_Display
			else if(b_Model_Select_flag){ Model_Select_Routine(); }	// Model_Selection_Routine
			else{ Test_Controller_Routine(); }				// Test_Controller_Routine

			Controller_Button_Clear();
			b_System_10ms_Task = OFF;	// 10ms_Task_Flag_Reset
		}//End of Endless_Loop

		CAN_Management_Function();
	}
	return;
}//End of Function_Main


/*==============	¢Ñ Timer 3 Overflow Interrupt Routine ¢Ð  ===============================================*/
@interrupt void TIMER_3_Interrupt(void)		//10ms_Timer_Interrupt_Routine
{
	TIM3_SR1 &= 0B11111110;	 		//Pending update flag clear
	b_System_10ms_Task = ON;
	b_Can_10ms_Periode = ON;
	
	return;
}//End of TIMER_3_Interrupt
/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

/*=================================================================================================
¢Ñ	Project_Name	: FCA520_EV_PTC
¢Ñ	Design_By	: Woory_Industrial
¢Ñ	Final_Release	: 2017_07_18
=================================================================================================*/
#ifndef	__MAIN_H__
#define	__MAIN_H__

/*==============	¢Ñ Include_File ¢Ð  =================================================================*/
#include "common.h"
#include "STM8A.h"			//CPU Register Hider File

/*==============	¢Ñ System_Control_Value_Define ¢Ð  ===================================================*/
#define MV_FRONT_PTC 		0	//
#define MV_REAR_PTC 		1	//
#define SU2I_PTC	2
#define CVa_FRONT_PTC	3
#define PTC_MODEL	CVa_FRONT_PTC

/*============== ¢Ñ AD_Conversion_Channel_Define ¢Ð  ==================================================*/

/*==============	¢Ñ System_IO_Port_Define ¢Ð ===================================================*/
#define	io_SET_STATUS_INPUT			((struct bits*)&PA_IDR)->BIT6		//SW_SET
#define	io_DOWN_STATUS_INPUT			((struct bits*)&PA_IDR)->BIT5		//SW_DOWN
#define	io_UP_STATUS_INPUT			((struct bits*)&PA_IDR)->BIT4		//SW_UP
#define	io_ONOFF_STATUS_INPUT		((struct bits*)&PA_IDR)->BIT3		//SW_ONOFF
#define	io_OPTION_STATUS_INPUT		((struct bits*)&PF_IDR)->BIT7		//SW_OPTION
#define	io_ENTER_STATUS_INPUT			((struct bits*)&PF_IDR)->BIT6		//SW_ENTER

#define	io_LIN_EN_OUTPUT		((struct bits*)&PD_ODR)->BIT2		//LIN_EN_PIN

#define	io_LED1_OUTPUT		((struct bits*)&PF_ODR)->BIT0		//LED 1
#define	io_LED2_OUTPUT		((struct bits*)&PC_ODR)->BIT5		//LED 2
#define	io_LED3_OUTPUT		((struct bits*)&PC_ODR)->BIT6		//LED 3
#define	io_LED4_OUTPUT		((struct bits*)&PG_ODR)->BIT3		//LED 4
#define	io_LED5_OUTPUT		((struct bits*)&PG_ODR)->BIT4		//LED 5
#define	io_LED6_OUTPUT		((struct bits*)&PI_ODR)->BIT0		//LED 6
#define	io_LED7_OUTPUT		((struct bits*)&PG_ODR)->BIT5		//LED 7
#define	io_LED8_OUTPUT		((struct bits*)&PD_ODR)->BIT0		//LED 8
#define	io_LED9_OUTPUT		((struct bits*)&PD_ODR)->BIT7		//LED 9
#define	io_LED9_STATUS_INPUT		((struct bits*)&PD_IDR)->BIT7		//LED 9 Status

#define	LCD_RS				((struct bits*)&PF_ODR)->BIT5		//[LCD_4Pin] Data = 1, Command = 0
#define	LCD_RW				((struct bits*)&PF_ODR)->BIT4		//[LCD_5Pin] Read = 1, Write = 0
#define	LCD_EN				((struct bits*)&PF_ODR)->BIT3		//[LCD_6Pin] Enable = 1
#define	LCD_Data			PB_ODR
#define	IC_SWIM_OUTPUT	((struct bits*)&PD_ODR)->BIT1		//

/*==============	¢Ñ System_Control_Register ¢Ð  =======================================================*/
extern U8 uc_System_Ctrl_Reg;
#define b_First_Logic_On		((struct bits*)&uc_System_Ctrl_Reg)->BIT0		// First_Logic_On_Flag
#define b_System_10ms_Task	((struct bits*)&uc_System_Ctrl_Reg)->BIT1		// System_10ms_Task_Flag
#define b_Can_10ms_Periode	((struct bits*)&uc_System_Ctrl_Reg)->BIT2

/*==============	¢Ñ Header_Include ¢Ð  =============================================================*/
#include	"STM8A_Library.h"			//STM8A_Library Library Include
#include	"LCD_Ctrl_Function.h"
#include "Button_Control.h"
#include "Test_Controller_Function.h"
#include "CAN_Function.h"

/*==============	¢Ñ External_Global_Functions ¢Ð	==============================================================*/
extern void Start_Zig_Display(void);

/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
#endif

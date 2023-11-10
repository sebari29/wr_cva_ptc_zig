/*=================================================================================================
¢Ñ	Project_Name	: FCA520_EV_PTC
¢Ñ	Design_By	: Woory_Industrial
¢Ñ	Final_Release	: 2017_07_18
=================================================================================================*/
#ifndef	__BMW48_H__
#define	__BMW48_H__

/*==============	¢Ñ Constant_Value_Define ¢Ð =========================================================*/
#define RX_FR_TIMEOUT	(U16)(200)	// Rx_frame_TimeOut : 2sec

/*==============	¢Ñ Control_Register ¢Ð  =======================================================*/
extern U8 uc_Model_Select_Reg;		// PTC_Model_Select_Register

extern U8 uc_Test_Ctrl_Reg;			// Test_Controller_Control_Register
#define b_Model_Select_flag		((struct bits*)&uc_Test_Ctrl_Reg)->BIT0	// Model_Selection_Flag
#define b_Data_Select_flag   		((struct bits*)&uc_Test_Ctrl_Reg)->BIT1	// Data_Selection_Flag
#define b_Data_Setting_flag   		((struct bits*)&uc_Test_Ctrl_Reg)->BIT2	// Data_Setting_Flag
#define b_Com_On_flag			((struct bits*)&uc_Test_Ctrl_Reg)->BIT3	// Communication_On_Flag
#define b_Test_Option_flag		((struct bits*)&uc_Test_Ctrl_Reg)->BIT4	// Test_Controller_Option_Flag

extern U8 uc_Rx_TimeOut_Reg;		// Rx Data frame Timeout Register
#define b_Rx1_Msg_TimeOut_Flag   		((struct bits*)&uc_Rx_TimeOut_Reg)->BIT0		// Tx_Response_Header_Event : ID 0x3A
#define b_Rx2_Msg_TimeOut_Flag   		((struct bits*)&uc_Rx_TimeOut_Reg)->BIT1		// Tx_Response_Header_Event : ID 0x03
#define b_Rx3_Msg_TimeOut_Flag   		((struct bits*)&uc_Rx_TimeOut_Reg)->BIT2		// Tx_Response_Header_Event : ID 0x3A
#define b_Rx4_Msg_TimeOut_Flag   		((struct bits*)&uc_Rx_TimeOut_Reg)->BIT3		// Tx_Response_Header_Event : ID 0x03

/*==============	¢Ñ External_Global_Value ¢Ð  =======================================================*/
extern volatile U8 uc_Target_Duty_Perc[2];		// Target_Duty_Percentage
extern volatile U8 uc_Heater_Enable_Flag;	// Heater_Enable_Flag

extern U8 uc_Rx_Data[4][8];		// 

extern U16 ui_Rx1_TimeOut_Cnt;	// Rx1_Frame_TimeOut_Counter
extern U16 ui_Rx2_TimeOut_Cnt;	// Rx2_Frame_TimeOut_Counter

/*==============	¢Ñ External_Global_Functions ¢Ð =================================================*/
extern void Test_Controller_First_Routine(void);
extern void Model_Select_Routine(void);
extern void Test_Controller_Routine(void);
extern void Test_Ctrl_Reset_Values(void);

/*=================================================================================================
¢Ñ		Copyright¨Ï 2016. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
#endif

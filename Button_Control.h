/*=================================================================================================
��	Project_Name	: FCA520_EV_PTC
��	Design_By	: Woory_Industrial
��	Final_Release	: 2017_07_18
=================================================================================================*/
#ifndef	__BUTT_H__
#define	__BUTT_H__

/*==============	�� Constant_Value_Define �� =========================================================*/
#define BUTTON_FLT			(U8)(3)	// Key_30ms_filtering
#define LONG_BUTTON_FLT	(U8)(50)	// Long_Key_500ms_filtering
#define CONTI_BUTTON_FLT	(U8)(3)	// Continue_press_key_30ms_filtering

/*==============	�� Control_Register ��  =======================================================*/
extern U8 uc_Button_Status_Reg;		// Switch_Status_Register
#define b_ONOFF_Button_Flag   	((struct bits*)&uc_Button_Status_Reg)->BIT0	// ONOFF_Button_Flag
#define b_UP_Button_Flag   		((struct bits*)&uc_Button_Status_Reg)->BIT1	// Up_Button_Flag
#define b_DOWN_Button_Flag		((struct bits*)&uc_Button_Status_Reg)->BIT2	// Down_Button_Flag
#define b_SET_Button_Flag		((struct bits*)&uc_Button_Status_Reg)->BIT3	// Set_Button_Flag
#define b_OPTION_Button_Flag	((struct bits*)&uc_Button_Status_Reg)->BIT4	// Option_Button_Flag
#define b_ENTER_Button_Flag		((struct bits*)&uc_Button_Status_Reg)->BIT5	// Enter_Button_Flag

extern U8 uc_Button_Status_Reg2;		// Button_Status_Register_2
#define b_Up_Long_Button_Flag   		((struct bits*)&uc_Button_Status_Reg2)->BIT0		// Up_Long_Button_Status_Flag
#define b_Down_Long_Button_Flag   	((struct bits*)&uc_Button_Status_Reg2)->BIT1		// Down_Long_Button_Status_Flag

/*==============	�� External_Global_Value ��  =======================================================*/


/*==============	�� External_Global_Functions �� =================================================*/
extern void Controller_Button_Clear(void);
extern void Controller_Button_Detection(void);


/*=================================================================================================
��		Copyright�� 2010. by WOORY�� Industrial Company Limited. All Rights Reserved.		��
=================================================================================================*/
#endif

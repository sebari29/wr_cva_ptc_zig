/*=================================================================================================
☞	Project_Name	: MTC_Standard_Software
☞	HKMC_C-CAN_Ver	: GB_DATC(-)13.10.09
☞	Design_By	: Woory_Industrial
☞	Final_Release	: 2014_02_14
=================================================================================================*/
#ifndef	__HMC_CAN__
#define	__HMC_CAN__
#include	"Main.h"				//Main Include
/*==============	☞ CAN_Control_Timing_Value ☜  ======================================================
☞	1.Normal_Message 전송주기 확인할것.
=================================================================================================*/
#define HTR_CTRL_MSG_PERIODE	(U8)(2)		// Heater_Control_Result_Msg_Tx_Periode	= 10ms x 2 = 20ms
#define CAN_RECOVERY_TIME		(U8)(8)		//Bus_Off_Recover_Periode	= 10ms x 8 = 80ms

/*==============	☞ CAN_ID_Filter_Offset_Definition ☜ ==================================================*/
#define CAN_MSG_ID_MAX		(U8)(4)		//Normal_Msg_Rx_Total_No
#define HTR_STATUS1			(U8)(0)		// Heater_Status1_Rx_Message
#define HTR_STATUS2			(U8)(1)		// Heater_Status2_Rx_Message
#define HTR_STATUS3			(U8)(2)		// Heater_Status1_Rx_Message
#define HTR_STATUS4			(U8)(3)		// Heater_Status2_Rx_Message
#if (PTC_MODEL == MV_FRONT_PTC)
// Rx_Message_ID
#define CAN_HTR_STATUS1_ID	(U16)(0x0140)	// 0. Heater_Status1_ID 20230504 0x0140 -> 0x0150
#define CAN_HTR_STATUS2_ID	(U16)(0x0141)	// 1. Heater_Status2_ID 20230504 0x0141 -> 0x0151
#define CAN_HTR_STATUS3_ID	(U16)(0x0142)	// 0. Heater_Status1_ID 20230504 0x0142 -> 0x0152
#define CAN_HTR_STATUS4_ID	(U16)(0x0143)	// 1. Heater_Status2_ID 20230504 0x0143 -> 0x0153

//Tx_Message_Id
#define CAN_HTR_CTRL_ID		(U16)(0x0111) 	// 1. Heater_Control_ID 20230504 0x0111 -> 0x0112
#elif (PTC_MODEL == MV_REAR_PTC)
// Rx_Message_ID
#define CAN_HTR_STATUS1_ID	(U16)(0x0150)	// 0. Heater_Status1_ID 20230504 0x0140 -> 0x0150
#define CAN_HTR_STATUS2_ID	(U16)(0x0151)	// 1. Heater_Status2_ID 20230504 0x0141 -> 0x0151
#define CAN_HTR_STATUS3_ID	(U16)(0x0152)	// 0. Heater_Status1_ID 20230504 0x0142 -> 0x0152
#define CAN_HTR_STATUS4_ID	(U16)(0x0153)	// 1. Heater_Status2_ID 20230504 0x0143 -> 0x0153

//Tx_Message_Id
#define CAN_HTR_CTRL_ID		(U16)(0x0112) 	// 1. Heater_Control_ID 20230504 0x0111 -> 0x0112
#else
/*==============	☞ CAN_ID_Definition ☜ =============================================================*/
// Rx_Message_ID
#define CAN_HTR_STATUS1_ID	(U16)(0x0201)	// 0. Heater_Status1_ID 20230504 0x0140 -> 0x0150
#define CAN_HTR_STATUS2_ID	(U16)(0x0202)	// 1. Heater_Status2_ID 20230504 0x0141 -> 0x0151
#define CAN_HTR_STATUS3_ID	(U16)(0x0203)	// 0. Heater_Status1_ID 20230504 0x0142 -> 0x0152
#define CAN_HTR_STATUS4_ID	(U16)(0x0204)	// 1. Heater_Status2_ID 20230504 0x0143 -> 0x0153

//Tx_Message_Id
#define CAN_HTR_CTRL_ID		(U16)(0x0200) 	// 1. Heater_Control_ID 20230504 0x0111 -> 0x0112
#endif
/*==============	☞ Global_Control_Register ☜ ========================================================*/

/*==============	☞ Proto_Type_Of_Global_Functions ☜ =================================================*/
extern void CAN_Bus_Off_Handling(void);
extern void CAN_Management_Function(void);
extern void Reset_Can_Function(void);
extern U16 CAN_RECV_ID;
extern U8 CAN_test_data[4];
extern U8 HEATER_zone_status;
#define HTR_ZONE_1	0
#define HTR_ZONE_2	1
/*=================================================================================================
☞		Copyrightⓒ 2014. by WOORY™ Industrial Company Limited. All Rights Reserved.		☜
=================================================================================================*/
#endif

/*=================================================================================================
☞	Project_Name	: MTC_Standard_Software
☞	HKMC_C-CAN_Ver	: GB_DATC(-)13.10.09
☞	Design_By	: Woory_Industrial
☞	Final_Release	: 2014_08_28
=================================================================================================*/

/*==============	☞ Include_File ☜ ==================================================================*/
#include	"main.h"

/*==============	☞ CAN_Node_Control_Register ☜ ======================================================
☞	1.CAN_작동에_필요한_레지스터
=================================================================================================*/
struct Can_Msg_Status
{
	_Bool	Fail;			//Bit_Node_Fail_Status
	_Bool	Update;			//Bit_Now_Msg_Flag
	U8	Timeout;			//Msg_Timeout_Counter
	U8	Msg[8];			//Rx_Msg_Data
}volatile Can_Node[CAN_MSG_ID_MAX];

//Node_Timeout_Periode
const U8 Can_Fail_Time[CAN_MSG_ID_MAX] =	//Timeout = Value x 10ms
{
	50,				// 0. STATUS1		= 500ms
	50,				// 1. STATUS2		= 500ms
	50,				// 0. STATUS1		= 500ms
	50				// 1. STATUS2		= 500ms
};//End of Node_Timeout_Periode

//Node_Message_Length
const U8 Can_Msg_Length[CAN_MSG_ID_MAX] =	
{
	8,				// 0. STATUS1		= 8bytes
	8,				// 1. STATUS2		= 8bytes
	8,				// 0. STATUS1		= 8bytes
	8				// 1. STATUS2		= 8bytes

};//End of Node_Message_Length

U16 CAN_RECV_ID=0;
U8 CAN_test_data[4]={0};
U8 HEATER_zone_status=0;
volatile U8 Can_Tx_Buffer[8];
@tiny volatile U8 uc_Can_Init_Delay;
@tiny volatile U8 uc_Can_Event_Time;
@tiny volatile U8 uc_Can_Event_Counter;
@tiny volatile U8 uc_Can_Operation_Flow;

@tiny volatile U8 uc_Can_Status_Reg;
#define b_Can_Bus_Off_Fail	((struct bits*)&uc_Can_Status_Reg)->BIT0 	//	1 = Bus_Off_Fail
#define b_Can_TInitialize		((struct bits*)&uc_Can_Status_Reg)->BIT1		//	1 = IInitialize_Start
#define b_Can_TMsg_Start	((struct bits*)&uc_Can_Status_Reg)->BIT2	//	1 = Normal_Message_Start
#define b_Can_Tx_Error		((struct bits*)&uc_Can_Status_Reg)->BIT3		//	1 = Normal_Message_Tx_Error
#define b_Can_Tx_Event		((struct bits*)&uc_Can_Status_Reg)->BIT4		//	1 = Normal_Message_Tx
#define b_Can_Error_Pending	((struct bits*)&uc_Can_Status_Reg)->BIT5	//	1 = Error_Pending

/*==============	☞ CAN_Normal_Message_Register ☜ ===================================================
/*==============	☞ Proto_Type_Of_Internal_Functions ☜ ================================================*/
void CAN_Fail_Handling(void);
void CAN_Timing_Control(void);
void CAN_Bus_Off_Handling(void);
void CAN_Tx_Message_Now(void);
void CAN_Management_Function(void);
void CAN_Failure_Safety_Initialize(void);
void CAN_Normal_Maessge_Transmit(void);
void CAN_Normal_Message_Handling(void);


/*==============	☞ ECV Debug_Mode ☜ ==============================================================
☞	4.ECV_DEBUG_MODE
=================================================================================================*/


/*==============	☞ CAN_Tx_Message_Now ☜ =========================================================*/
void CAN_Tx_Message_Now(void)
{
	b_Can_Tx_Event = ON;
	uc_Can_Event_Counter = 0;
	uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;

	return;
}//End of CAN_Tx_Message_Now


/*==============	☞ CAN_Normal_Message_Handling ☜ =================================================*/
void CAN_Normal_Message_Handling(void)
{
	U8 uc_index;

	if(Can_Node[HTR_STATUS1].Fail){ b_Rx1_Msg_TimeOut_Flag = ON; }
	else if(Can_Node[HTR_STATUS1].Update)
	{
CAN_test_data[0]++;
		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS1][uc_index] = Can_Node[HTR_STATUS1].Msg[uc_index];  }
		b_Rx1_Msg_TimeOut_Flag = OFF;	
		Can_Node[HTR_STATUS1].Update = OFF;			//Data_Read_Panding
	}

	if(Can_Node[HTR_STATUS2].Fail){ b_Rx2_Msg_TimeOut_Flag = ON; }
	else if(Can_Node[HTR_STATUS2].Update)
	{
CAN_test_data[1]++;
		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS2][uc_index] = Can_Node[HTR_STATUS2].Msg[uc_index];  }
		b_Rx2_Msg_TimeOut_Flag = OFF;
		Can_Node[HTR_STATUS2].Update = OFF;			//Data_Read_Panding
	}

	if(Can_Node[HTR_STATUS3].Fail){ b_Rx3_Msg_TimeOut_Flag = ON; }
	else if(Can_Node[HTR_STATUS3].Update)
	{
CAN_test_data[2]++;
		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS3][uc_index] = Can_Node[HTR_STATUS3].Msg[uc_index];  }
		b_Rx3_Msg_TimeOut_Flag = OFF;	
		Can_Node[HTR_STATUS3].Update = OFF;			//Data_Read_Panding
	}

	if(Can_Node[HTR_STATUS4].Fail){ b_Rx4_Msg_TimeOut_Flag = ON; }
	else if(Can_Node[HTR_STATUS4].Update)
	{
CAN_test_data[3]++;
		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS4][uc_index] = Can_Node[HTR_STATUS4].Msg[uc_index];  }
		b_Rx4_Msg_TimeOut_Flag = OFF;
		Can_Node[HTR_STATUS4].Update = OFF;			//Data_Read_Panding
	}
	return;
}//End of CAN_Normal_Message_Handling

/*==============	☞ CAN_Bus_Off_Handling_Routine ☜ ==================================================*/
void CAN_Fail_Handling(void)
{
	U8 Index;

	//Bus_Off_Accept_Control
	if(b_Can_Error_Pending == OFF)
	{
		//Can_Node_Status_Fail
		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
		{
			Can_Node[Index].Fail = ON;		//Node_Fail
			Can_Node[Index].Update = OFF;	//Msg_Pending
			Can_Node[Index].Timeout = 0;	//Msg_Timer_Reset
		}//End of Can_Node_Status_Fail

		b_Can_Error_Pending = ON;
	}//End of Bus_Off_Fail_Control
	return;
}//End of Can_Fail_Handling

/*==============	☞ CAN_Normal_Maessge_Transmit ☜ ==================================================*/
void CAN_Normal_Maessge_Transmit(void)
{
	static U8 testCnt=0;
	U8 Offset,uc_index;

	//Transmit_FATC_Message
	if(b_Can_Tx_Event == OFF){ return;		}	//Wait_Normal_Message_Period
	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
	else{	return;			      	}	//Mailbox_All_Busy

	//Load_FATC_Message_Tx_ID
	CAN_P2 = (U8)((CAN_HTR_CTRL_ID >> 6) & 0x1F);	//Tx_HAVC_ID_MSB
	_asm("nop");					//STM8A_CAN_Bug_Happy
	CAN_P3 = (U8)((CAN_HTR_CTRL_ID << 2) & 0xFC);	//Tx_HAVC_ID_LSB
	_asm("nop");					//STM8A_CAN_Bug_Happy

	//Load_Transmit_Data
	for(uc_index = 0; uc_index < (U8)(8); uc_index++){ Can_Tx_Buffer[uc_index] = (U8)(0); }

	// Byte#0

#if (PTC_MODEL == MV_FRONT_PTC)||(PTC_MODEL == MV_REAR_PTC)
	Can_Tx_Buffer[0] = (U8)(uc_Heater_Enable_Flag);	// Allowance_Flag_is_always_set
	Can_Tx_Buffer[1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1]);
	Can_Tx_Buffer[2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2]);
#else
	Can_Tx_Buffer[0] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1]);
	Can_Tx_Buffer[1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2]);
	Can_Tx_Buffer[2] = (U8)(uc_Heater_Enable_Flag);
#endif

#if 0 // YJS 20230314
	if(b_Com_On_flag) 
	Can_Tx_Buffer[3] |= 0x1;
#endif
	for(Offset = 0; Offset < 8; Offset++)	// Tx_Message_Length : 7Bytes
	{
		(&CAN_P6)[Offset] = Can_Tx_Buffer[Offset];	//MDARx(Mailbox_Data_Register_x)
	}//End of Load_Transmit_Data

	CAN_P1 = 0x08;				//Tx_Data_Length
	_asm("nop");					//STM8A_CAN_Bug_Happy
	CAN_P0 |= 0x01;				//Transmit_Request
	b_Can_Tx_Event = OFF;		//Next_Message_Transmit_Periode
	
	return;
}//End of CAN_Normal_Maessge_Transmit


/*==============	☞ CAN_Bus_OFF_Handling Routine ☜ =================================================*/
void CAN_Bus_Off_Handling(void)
{
	if(uc_Can_Operation_Flow){
		Windows_Watchdog_Clear();

		//Recovery_Operation_Status
		if(uc_Can_Operation_Flow == 2)
		{
			CAN_Interrupt_Disable();
			CAN_Transmit_Cancel();
			CAN_Disable();
		}//End of Recovery_Operation_Stop

		//Normal_Operation_Status
		else if(uc_Can_Operation_Flow == 3)
		{
			CAN_Wait_Tx_Message();
			CAN_Disable();
			CAN_Interrupt_Disable();
		}//End of Normal_Operation_Stop

		uc_Can_Status_Reg = 0;
		uc_Can_Operation_Flow = 0;
	}//End of CAN_Bus_Off_Handling
	return;
}//End of CAN_BusOff_Handling

/*==============	☞ CAN_Timing_Control_Function ☜ ===================================================*/
void CAN_Timing_Control(void)
{
	U8 ID;

	//Wait_10ms_Periode
	if(b_Can_10ms_Periode == OFF){	return;	}

	//Next_10ms_Periode
	b_Can_10ms_Periode = OFF;


	//First_CAN_Initialize_Delay
	if(b_Can_TInitialize == OFF)
	{
		if(++uc_Can_Init_Delay >= 13){		//Ignd_On_130ms_Delay
			b_Can_TInitialize = ON;
		}//End of 130ms_After_IGN_ON
	}//End of CAN_Initialize_Time

	//Normal_Message_Start_Time
	else if(b_Can_TMsg_Start == OFF)
	{
		if(++uc_Can_Init_Delay >= 30){		//Ign1_On_300ms_Delay
			uc_Can_Init_Delay = 0;
			b_Can_TMsg_Start = ON;

			//Tx_Message_Now
			CAN_Tx_Message_Now();
		}//End of 300ms_After_IGN_ON
	}//End of Message_Start_Time

	else{
		//FATC11_Tx_or_Bus_Off_Recover
		if(b_Can_Tx_Event == OFF){
			if(++uc_Can_Event_Counter >= uc_Can_Event_Time){
				uc_Can_Event_Counter = 0;
				b_Can_Tx_Event = ON;
			}//End of CAN_Tx_Completed
		}//End of Normal_Tx_Message

		//¡ØNote : GST1_ID´A Timeout_Check ¾ECO.
		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
			if(Can_Node[ID].Fail == OFF){
				if(++Can_Node[ID].Timeout > Can_Fail_Time[ID]){
					Can_Node[ID].Fail = ON;
				}//End of Message_Timeout_Fail
			}//End of Can_Node_Fail
		}//End of Scan_Normal_Message_ID
	}//End of Normal_Message_Enable_Status

	return;
}//End of CAN_Timing_Control

/*==============	☞ CAN_Management_Control_Routine ☜ ===============================================*/
void CAN_Management_Function(void)
{
	//10ms_Periode_Timing_Control
	CAN_Timing_Control();

	//CAN_Bus_Management
	switch(uc_Can_Operation_Flow)
	{
		//IGN_OFF→ON_CAN_Control_Value Initialize
		case 0 :	uc_Can_Init_Delay = 0;
			uc_Can_Status_Reg = 0;			//CAN_Control = Reset
			uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
			uc_Can_Event_Counter = 0;			//Tx_Counter_Clear
			uc_Can_Operation_Flow = 1;
			break;

		//CAN_Module_Initialize
		case 1 :	if(b_Can_TInitialize == ON){			//130ms_Delay_After_Ign_On
				Windows_Watchdog_Clear();
				CAN_Interrupt_Disable();
				CAN_Enable();
				CAN_Interrupt_Enable();
				uc_Can_Operation_Flow = 3;		//CAN_Operation
			}//End of 130ms_Delay_After_Ign_On
			break;

		//Bus_Off_Recovery_Control
		case 2 :	if(b_Can_Tx_Error == ON){			//Recovery_Attempt_Completed
				CAN_Interrupt_Disable();
				CAN_Transmit_Cancel();
				uc_Can_Event_Time = CAN_RECOVERY_TIME;
				uc_Can_Event_Counter = 0;		//Tx_Counter Clear
				b_Can_Bus_Off_Fail = ON;		//CAN_Bus = OFF
				b_Can_Error_Pending = OFF;
				b_Can_Tx_Error = OFF;
				CAN_Interrupt_Enable();
			}//End of Tx_Fail_Event_Control

			//Recover_Control_Interval = Recovery_Time
			else if(b_Can_Tx_Event == ON){		//Set Flag from Timer_Interrupt
				Windows_Watchdog_Clear();
				CAN_Interrupt_Disable();
				CAN_Enable();
				CAN_Interrupt_Enable();
				CAN_Normal_Maessge_Transmit();
			}//End of Recover Time Delay Completed

			CAN_Fail_Handling();
			break;

		//Normal_Operation
		case 3 :	//CAN_Bus_Off→Normal
			if(b_Can_Bus_Off_Fail == ON){
				b_Can_Bus_Off_Fail = OFF;
				CAN_Tx_Message_Now();
			}//End of CAN_BUS_ON

		
			CAN_Normal_Message_Handling();	//CAN_Normal_Message_Rx_Data
//			if(b_Com_On_flag)	//YJS 20230314
			if(b_First_Logic_On) //YJS 20230314
			{ 
				CAN_Normal_Maessge_Transmit(); 
			}	
			
			break;

		default :	uc_Can_Operation_Flow = 0;
			break;
	}//End of CAN_Control_Mode
	return;
}//End of CAN_Management_Routine


/*==============	☞ Reset_Can_Function ☜ ==========================================*/
void Reset_Can_Function(void)
{
	uc_Can_Init_Delay = (U8)(0);
	uc_Can_Event_Time = (U8)(0);
	uc_Can_Event_Counter = (U8)(0);
	uc_Can_Operation_Flow = (U8)(0);

	uc_Can_Status_Reg = (U8)(0);

	return;
}// End of Reset_Can_Function


/*==============	☞ CAN_Receive_Complete_Interrupt_Routine ☜ ==========================================*/
@interrupt void CAN_Rx_Interrupt(void)
{
	U8 Index;
	static U8 From_ID, Current_Page;

	CAN_Interrupt_Disable();

	Current_Page = CAN_FPSR;					//Backup_PSR(Page_Selection_Register)

	//FIFO_Overrun
	if(CAN_RFR & 0x10){	 CAN_RFR |= 0x10;		}		//Clear_the_FIFO_FOVR_bit

	//FIFO_Full
	else if(CAN_RFR & 0x08){ CAN_RFR |= 0x08;	}		//Clear_the_FIFO_FULL_bit

	//Read Current CAN Message
	while(CAN_RFR & 0x03)					//CAN_Received?
	{
		CAN_FPSR = 0x07;					//CAN_Receive_FIFO_Page_Select
		From_ID = CAN_P0;					//Read_to_Tx_Massage_ID
CAN_RECV_ID = (U16)((U16)(CAN_P2 & 0x1F) << 6);
CAN_RECV_ID |= (U16)((U16)(CAN_P3 >> 2) & 0x3F);
if (CAN_RECV_ID==CAN_HTR_STATUS1_ID)
From_ID=0;
else if (CAN_RECV_ID==CAN_HTR_STATUS2_ID)
From_ID=1;
else if (CAN_RECV_ID==CAN_HTR_STATUS3_ID)
From_ID=2;
else if (CAN_RECV_ID==CAN_HTR_STATUS4_ID)
From_ID=3;
else From_ID=0xffu;
		////All_Message_Data_Legnth = 8Byte
		if(From_ID < CAN_MSG_ID_MAX)
		{
			for(Index = 0; Index < 8u; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
				Can_Node[From_ID].Msg[Index] = *((&CAN_P6) + Index);
			}//End of Read From Rx Data Register

			//ID_Error_Status_Clear
			Can_Node[From_ID].Fail = OFF;		//Fail_Status_Clear
			Can_Node[From_ID].Timeout = 0;		//Rx_Error_Counter_Clear
			Can_Node[From_ID].Update = ON;		//New_Rx_Data
		}		
		else
		{
		}
#if 0
		//Normal_Message_Receive
		else if(From_ID < CAN_MSG_ID_MAX)			//Rx_Mask_ID_Filter_Match?
		{
			for(Index = 0; Index < Can_Msg_Length[From_ID]; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
				Can_Node[From_ID].Msg[Index] = *((&CAN_P6) + Index);
			}//End of Read From Rx Data Register

			//ID_Error_Status_Clear
			Can_Node[From_ID].Fail = OFF;		//Fail_Status_Clear
			Can_Node[From_ID].Timeout = 0;		//Rx_Error_Counter_Clear
			Can_Node[From_ID].Update = ON;		//New_Rx_Data
		}//End of Rx_Data_Legnth_Check
#endif
		CAN_RFR |= 0x20;					//Release_FIFO
		while(CAN_RFR & 0x20);				//Release_Completed?
	}//End of CAN_Message_Box_Check

	CAN_FPSR = Current_Page;
	
	CAN_Interrupt_Enable();
	return;
}//End of CAN_Receive_Interrupt

/*==============	☞ CAN Transmit Complete Interrupt Routine ☜  ==========================================*/
@interrupt void CAN_Tx_Interrupt(void)
{
	//Wakrup_Interrupt
	if(CAN_MSR & 0x08){ CAN_MSR |= 0x08;		}		//Clear_Wakeup_Flag

	//CAN_Tx or Bus_OFF, Error?
	if(CAN_MSR & 0x04)
	{
		CAN_MSR |= 0x04;					//Clear_Error_Flag
		b_Can_Tx_Error = ON;				//CAN_Tx_Error_Flag = ON
		uc_Can_Operation_Flow = 2;				//Recover_Mode
	}//End of Tx_Error_Handling

	//Mailbox_0_Tx_Interrupt
	if(CAN_TSR & 0x01)
	{
		//Transmission_Completed?
		if(CAN_TSR & 0x10){
			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
		}//End of Mailbox_0 Transmission Completed

		CAN_TSR |= 0x01;					//Clear_Interrupt_Flag
	}//End of Mailbox_0_Tx_Interrupt

	//Mailbox_1_Tx_Interrupt
	if(CAN_TSR & 0x02)
	{
		//Transmission_Completed?
		if(CAN_TSR & 0x20){
			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
		}//End of Mailbox_1 Transmission Completed

		CAN_TSR |= 0x02;					//Clear_Interrupt_Flag
	}//End of Mailbox_1_Tx_Interrupt

	//Mailbox_2_Tx_Interrupt
	if(CAN_TSR & 0x04)
	{
		//Transmission_Completed?
		if(CAN_TSR & 0x40){
			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
		}//End of Mailbox_2 Transmission Completed

		CAN_TSR |= 0x04;					//Clear_Interrupt_Flag
	}//End of Mailbox_2_Tx_Interrupt
	return;
}//End of CAN_Tx_Interrupt
/*=================================================================================================
☞		Copyrightⓒ 2014. by WOORY™ Industrial Company Limited. All Rights Reserved.		☜
=================================================================================================*/

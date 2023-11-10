/*=================================================================================================
¢Ñ	Project_Name	: LGE_HEH_Standard_Software
¢Ñ	Design_By	: Woory_Industrial
¢Ñ	Final_Release	: 2014_09_05
=================================================================================================*/
#ifndef	__LIN_CONTROL_H__
#define	__LIN_CONTROL_H__

/*==============	¢Ñ Define Variable ¢Ð  ====================================================*/
#define LIN_VERSION 		(F32)(2.0)		// LIN_Protocol_Version	

#define TX_FRAME1_ID		(U8)(0x22)	// HVEAHLIN18Fr01 LIN ID : $22
#define TX_FRAME1_LEN		(U8)(0x02)	// HVEAHLIN18Fr01 Length : 2bytes

#define RX_FRAME1_ID		(U8)(0x17)	// HVEAHLIN18Fr02 LIN ID : $17 	
#define RX_FRAME1_LEN		(U8)(0x04)	// HVEAHLIN18Fr02 Length : 4bytes

#define RX_FRAME2_ID		(U8)(0x27)	// HVEAHLIN18Fr03 LIN ID : $27 	
#define RX_FRAME2_LEN		(U8)(0x07)	// HVEAHLIN18Fr03 Length : 7bytes

/*==============	¢Ñ LIN Message Frame Type Definition ¢Ð  ===========================================*/
#define SINGLE_FRAME			(U8)(0x00)		//Single_Frame
#define FIRST_FRAME				(U8)(0x10)		//First_Frame
#define CONSECUTIVE_FRAME		(U8)(0x20)		//Consecutive_Frame

/*==============	¢Ñ External Resister variable  ¢Ð  =================================================================*/
extern U8 uc_PID_Parity_Register;
#define PID_BIT0		((struct bits*)&uc_PID_Parity_Register)->BIT0		// Bit0
#define PID_BIT1		((struct bits*)&uc_PID_Parity_Register)->BIT1		// Bit1
#define PID_BIT2		((struct bits*)&uc_PID_Parity_Register)->BIT2		// Bit2
#define PID_BIT3		((struct bits*)&uc_PID_Parity_Register)->BIT3		// Bit3
#define PID_BIT4		((struct bits*)&uc_PID_Parity_Register)->BIT4		// Bit4
#define PID_BIT5		((struct bits*)&uc_PID_Parity_Register)->BIT5		// Bit5
#define PARITY_0		((struct bits*)&uc_PID_Parity_Register)->BIT6		// Bit6
#define PARITY_1		((struct bits*)&uc_PID_Parity_Register)->BIT7		// Bit7 


extern U8 uc_Tx_Event_Ctrl_Reg;		// Test_Controller_Tx_Frame_Control_Register
#define b_Tx1_Event_Flag   		((struct bits*)&uc_Tx_Event_Ctrl_Reg)->BIT0		// Tx_Request_Data_Event : ID 0x24
#define b_Tx2_Event_Flag   		((struct bits*)&uc_Tx_Event_Ctrl_Reg)->BIT1		// Tx_Response_Header_Event : ID 0x3A
#define b_Tx3_Event_Flag		((struct bits*)&uc_Tx_Event_Ctrl_Reg)->BIT2		// Tx_Request_Data_Event : ID 0x02

#define b_LIN_Mute_Mode_Flag		((struct bits*)&LINUART_CR2)->BIT1						// Mute_Mode_Register_bit

/*==============	¢Ñ External Function variable  ¢Ð  =================================================================*/


/*==============	¢Ñ External Function ¢Ð  ===================================================================*/
extern void Request_Data_Control(void);
extern void LIN_Time_Control_Routine(void);
extern void Reset_LIN_Control(void);
extern void Diag_Reponse_Handling(void);
extern U8 LIN_Measure_PID_Parity(U8 id);
extern void LIN_Frame_Event_Control(void);

/*=================================================================================================
¢Ñ		Copyright¨Ï 2014. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
#endif

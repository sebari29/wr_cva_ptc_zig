/*=================================================================================================
¢Ñ	Project_Name	: LGE_HEH_Standard_Software
¢Ñ	Design_By	: Woory_Industrial
¢Ñ	Final_Release	: 2014_09_05
=================================================================================================*/

/*==============	¢Ñ Include File ¢Ð  ===================================================================*/
#include "main.h"
#if 0
/*==============	¢Ñ Define Structur  ¢Ð  =================================================================*/
struct LIN_Req_Status
{
	_Bool	Transmit;		// Response_Header_Transmit_Flag	
	U8	Req_ID;				// Request_ID
	U8	Index;			// Transmit Data index
	U8 	Length;			// Transmit Data Length
	U8	Msg[9];				// Request_Data_Buffer / Last buffer stores checksum
}volatile LIN_Req_Frame;

struct LIN_Resp_Status
{
	_Bool	Transmit;		// Response_Header_Transmit_Flag
	_Bool	Update;			// Response_Frame_Update_Flag
	U8 	Resp_ID;			// Response_ID
	U8	Index;				// Response Data index
	U8 	Length;				// Response Data Length
	U8	Msg[9];				// Response_Msg_Data
}volatile LIN_Resp_Frame;


/*=======================¢Ñ Define Control Resister ¢Ð  ========================================================*/
volatile U8 uc_PID_Parity_Register;		// PID_Control_Register
volatile U8 uc_Tx_Event_Ctrl_Reg;		// Test_Controller_Tx_Frame_Control_Register

volatile U8 uc_Tx_Event_Index;		// LIN_Tx_Event_Index
volatile U16 ui_Tx_Event_Delay_Cnt;		// LIN_Tx_Event_Delay_Counter


/*===================¢Ñ Function variable  ¢Ð  ================================================================*/


/*==============	¢Ñ LIN_Rx_Enalbe Routine ¢Ð  ==============================================================*/
void LIN_Rx_Enable(void)
{
	LINUART_CR2 |= 0x04;		//Receiver Enalbe
	return ;
}// End of LIN RX Enable


/*==============	¢Ñ LIN_Rx_Disable Routine ¢Ð  ==============================================================*/
void LIN_Rx_Disable(void)
{
	LINUART_CR2 &= 0xFB;		//Receiver Disable
	return ;
}// End of LIN RX Disable


/*==============	¢Ñ Transmission Data Routine ¢Ð  ============================================================*/
void LIN_Transmission_Data(U8 Data)
{
	LINUART_DR = Data;		//Request_Transmission_Data
	while((LINUART_SR & 0x40) == 0);		//Transmission_Complete?
	
	return;
}//End of LIN_Transmission_Data


/*==============	¢Ñ LIN_Time_Control_Routine ¢Ð  =======================================================*/
void LIN_Time_Control_Routine(void)
{
	// LIN_Communication_Event_Delay_Control_Routine
	if(b_Com_On_flag){
		ui_Tx_Event_Delay_Cnt++;

		if((ui_Tx_Event_Delay_Cnt % (U16)(5)) == (U16)(0)){	// Event_Delay_Time : 50ms
			ui_Tx_Event_Delay_Cnt = 0;
			uc_Tx_Event_Index++;	// Increasing_Event_Index

			uc_Tx_Event_Ctrl_Reg = 0x00;		// Clear_All_Event_Control_Register
			if(uc_Tx_Event_Index == (U8)(1)){ b_Tx1_Event_Flag = ON; } 	// Tx_Request_Data_Event : ID 0x24
			else if(uc_Tx_Event_Index == (U8)(2)){ b_Tx2_Event_Flag = ON; }	// Tx_Response_Header_Event : ID 0x3A
			else if(uc_Tx_Event_Index == (U8)(3)){ 	// Tx_Response_Header_Event : ID 0x04
				b_Tx3_Event_Flag = ON; 
				uc_Tx_Event_Index = (U8)(0);
			}	
		}
	}else{ 
		uc_Tx_Event_Index = (U8)(0); 
		ui_Tx_Event_Delay_Cnt = (U8)(0);
	}

	LIN_Frame_Event_Control();


	// Rx1_Frame_TimeOut_Control
	if(!b_Rx1_Msg_TimeOut_Flag){
		ui_Rx1_TimeOut_Cnt++;
		if(ui_Rx1_TimeOut_Cnt >= RX_FR_TIMEOUT){ b_Rx1_Msg_TimeOut_Flag = ON; }
	}

	// Rx2_Frame_TimeOut_Control
	if(!b_Rx2_Msg_TimeOut_Flag){
		ui_Rx2_TimeOut_Cnt++;
		if(ui_Rx2_TimeOut_Cnt >= RX_FR_TIMEOUT){ b_Rx2_Msg_TimeOut_Flag = ON; }
	}

	return;
}// End of LIN_Time_Control_Routine


/*==============	¢Ñ Request_Frame01_Handling ¢Ð  =======================================================*/
void Request_Frame01_Handling(void)
{
	U8 uc_index;
	for(uc_index = 0; uc_index < (U8)(9) ; uc_index++){ LIN_Req_Frame.Msg[uc_index] = 0x00; }	// Buffer Clear

	LIN_Req_Frame.Msg[0] = uc_target_Power_Perc;	// 1byte
	LIN_Req_Frame.Msg[1] = uc_Heater_Enable_Flag;	// 2bits

	return;
}// End of Request_Frame01_Handling



/*==============	¢Ñ LIN_Generate_Break Routine ¢Ð  ==================================================*/
void LIN_Generate_Break_Field(void)
{
	LINUART_CR2 |= 0B00000001;			//Request_Break_&_Delimiter
	return;
}//End of LIN_Generate_Break_Field


/*==============	¢Ñ LIN_Header_Transmission Routine ¢Ð  =============================================*/
void LIN_Header_Transmission(U8 uc_id)
{
	U8 uc_pid;

	uc_pid = LIN_Measure_PID_Parity(uc_id);

	LIN_Generate_Break_Field();			//LIN_Generate_Break_Field
	LIN_Transmission_Data(0x55);		//Request_Syncy_Field
	LIN_Transmission_Data(uc_pid);		//Protected_Identifier

	return;
}//End of LIN_Header_Transmission


/*==============	¢Ñ LIN_Measure_Parity Routine ¢Ð  ============================================================*/
U8 LIN_Measure_PID_Parity(U8 id)
{
	// Load_Protected_Identifier
	uc_PID_Parity_Register = id;

	// Measure_Parity_0 = (ID0 + ID1 + ID2 + ID4)
	PARITY_0 = PID_BIT0;
	PARITY_0 ^= PID_BIT1;
	PARITY_0 ^= PID_BIT2;
	PARITY_0 ^= PID_BIT4;

	// Measure_Parity_1 = (ID1 + ID3 + ID4 + ID5) ^ 1
	PARITY_1 = PID_BIT1;
	PARITY_1 ^= PID_BIT3;
	PARITY_1 ^= PID_BIT4;
	PARITY_1 ^= PID_BIT5;
	PARITY_1 ^= 1;

	return(uc_PID_Parity_Register);
}// End of Measure_Parity_Bit_ID


/*==============	¢Ñ Lin_Extend_Checksum Routine ¢Ð  ==========================================================*/
U8 Lin_Extend_Checksum(U8 id,U8 length ,U8 *Data)
{
	U8 Offset;
	U8 Checksum = 0;
	U16 Check_buff= 0;
			
	Checksum = LIN_Measure_PID_Parity(id);
	
	for(Offset = 0; Offset <length; Offset++){

		Check_buff = Checksum +*(Data + Offset);
		if(Check_buff > 0xFF){  
			Checksum = (U8)(Check_buff);
			Checksum += (U8)(Check_buff>>8);
		}
		else{ Checksum = (U8)(Check_buff); }
		Check_buff = 0;
	}
	Checksum = (U8)(0xFF - Checksum);

	return ((U8)Checksum);
}//End of Lin_Extend_Checksum


/*==============	¢Ñ Lin_Classic_Checksum Routine ¢Ð  ==========================================================*/
U8 Lin_Classic_Checksum(U8 *Data)
{
	U8 Offset;
	U16 CheckSum = 0;

	for(Offset = 0; Offset <8; Offset++){
		CheckSum += *(Data + Offset);
		if(CheckSum > 0xFF){ CheckSum -= 0xFF; }
	}
	return ((U8)(0xFF - CheckSum));
}//End of Lin_Classic_Checksum


/*==============	¢Ñ Reset_LIN_Data_Handling ¢Ð  =============================================================*/
void Reset_LIN_Data_Handling(void)
{
	// Reset Response Handling
	LIN_Resp_Frame.Transmit = OFF;	// Transmit flag off
	LIN_Resp_Frame.Update = OFF;
	LIN_Req_Frame.Transmit = OFF;
	
	return;
}// End of Reset_LIN_Data_Handling


/*==============	¢Ñ Request_Frame_Initialize ¢Ð  =============================================*/
void Request_Frame_Initialize(U8 id, U8 length)
{
	U8 uc_pid;

	LIN_Req_Frame.Req_ID = id;			// Store_Lin_ID
	LIN_Req_Frame.Length = length;	// DATA_Length
	LIN_Req_Frame.Index = 0;			// Request_data_counter_reset
	
	uc_pid = LIN_Measure_PID_Parity(id);
	LIN_Req_Frame.Msg[LIN_Req_Frame.Length] = 
			Lin_Extend_Checksum(uc_pid, LIN_Req_Frame.Length, LIN_Req_Frame.Msg);

	LIN_Req_Frame.Transmit = ON;			// Request_Transmit_Flag_Set

	LIN_Resp_Frame.Transmit = OFF;		// Response_Transmit_Flag_Reset	
	LIN_Resp_Frame.Update = OFF;		// Response_Update_Flag_Reset

	return;
}// End of Request_Frame_Initialize


/*==============	¢Ñ Response_Frame_Initialize ¢Ð  =============================================*/
void Response_Frame_Initialize(U8 id, U8 length)
{
	U8 index,pid;

	LIN_Resp_Frame.Resp_ID = id;		// Read_Response_ID	
	LIN_Resp_Frame.Length = length;	// Read_Response_Length
	LIN_Resp_Frame.Index = 0;			// Reset_Response_DATA_Index
	LIN_Resp_Frame.Update = OFF;			// Reset_Receive_Flag
	LIN_Resp_Frame.Transmit = ON;		// Set_Transmit_Flag

	return;
}// End of Response_Frame_Initialize*/


/*==============	¢Ñ Reset_LIN_Control ¢Ð  =============================================*/
void Reset_LIN_Control(void)
{
	uc_PID_Parity_Register = 0x00;	// PID_Control_Register
	uc_Tx_Event_Ctrl_Reg = 0x00;		// Test_Controller_Tx_Frame_Control_Register

	uc_Tx_Event_Index = 0;		// LIN_Tx_Event_Index
	ui_Tx_Event_Delay_Cnt = 0;		// LIN_Tx_Event_Delay_Counter

	return;
}// End of Reset_LIN_Control


/*==============	¢Ñ LIN_Frame_Event_Control ¢Ð  =============================================*/
void LIN_Frame_Event_Control(void)
{
	U8 uc_index;
	U8 buffer;

	// Tx_Request_Data_Event : ID 0x24
	if(b_Tx1_Event_Flag){	

		LIN_Rx_Disable();	// LIN_Rx_Disabled
		Request_Frame01_Handling();		// Request_Frame_Handling
		Request_Frame_Initialize(TX_FRAME1_ID,TX_FRAME1_LEN);		// Request_Frame_Initializing
		LIN_Header_Transmission(TX_FRAME1_ID);				// LIN_Heater_Transmission
		LIN_Rx_Enable();	// LIN_Rx_Enabled

		LIN_Transmission_Data(LIN_Req_Frame.Msg[LIN_Req_Frame.Index++]);	// Transmit_First_Byte

		b_Tx1_Event_Flag = OFF;	// Event_OFF
	}
	
	// Tx_Response_Header_Event : ID 0x3A
	else if(b_Tx2_Event_Flag){	

		LIN_Rx_Disable();	// LIN_Rx_Disabled
		Response_Frame_Initialize(RX_FRAME1_ID, RX_FRAME1_LEN);		// Response_Frame_Initializing
		LIN_Header_Transmission(RX_FRAME1_ID);				// LIN_Heater_Transmission
		LIN_Rx_Enable();	// LIN_Rx_Enabled

		b_Tx2_Event_Flag = OFF;	// Event_OFF
	}
	
	// Tx_Request_Data_Event : ID 0x02
	else if(b_Tx3_Event_Flag){

		if(b_LDF_V02_Flag){
			LIN_Rx_Disable();	// LIN_Rx_Disabled
			Response_Frame_Initialize(RX_FRAME2_ID, 0x05);		// Response_Frame_Initializing
			LIN_Header_Transmission(RX_FRAME2_ID);				// LIN_Heater_Transmission
			LIN_Rx_Enable();	// LIN_Rx_Enabled
		}
		else if(b_LDF_V03_Flag){
			LIN_Rx_Disable();	// LIN_Rx_Disabled
			Response_Frame_Initialize(RX_FRAME2_ID, RX_FRAME2_LEN);		// Response_Frame_Initializing
			LIN_Header_Transmission(RX_FRAME2_ID);				// LIN_Heater_Transmission
			LIN_Rx_Enable();	// LIN_Rx_Enabled
		}
		b_Tx3_Event_Flag = OFF;	// Event_OFF
	}


	return;
}// End of LIN_Frame_Event_Control



/*==============	¢Ñ LIN_Response_Data_Handling ¢Ð  =============================================*/
void LIN_Response_Data_Handling(void)
{
	U8 uc_checksum, uc_index, uc_pid;
	
	if(LIN_Resp_Frame.Update){
		LIN_Resp_Frame.Update = OFF;		// Clear the Update flag

		if(LIN_Resp_Frame.Resp_ID == RX_FRAME1_ID){

			uc_pid = LIN_Measure_PID_Parity(LIN_Resp_Frame.Resp_ID);		// Calculation_PID
			uc_checksum = Lin_Extend_Checksum(uc_pid, LIN_Resp_Frame.Length,  LIN_Resp_Frame.Msg);	// Calcaulation_Checksum

			if(uc_checksum == LIN_Resp_Frame.Msg[LIN_Resp_Frame.Length]){	 
				for(uc_index = 0; uc_index < LIN_Resp_Frame.Length; uc_index++){ uc_Rx1_Lin_Data[uc_index] = LIN_Resp_Frame.Msg[uc_index]; }
				b_Rx1_Msg_TimeOut_Flag = OFF;
				ui_Rx1_TimeOut_Cnt = 0;
			}
		}
		else if(LIN_Resp_Frame.Resp_ID == RX_FRAME2_ID){
			uc_pid = LIN_Measure_PID_Parity(LIN_Resp_Frame.Resp_ID);		// Calculation_PID
			uc_checksum = Lin_Extend_Checksum(uc_pid, LIN_Resp_Frame.Length,  LIN_Resp_Frame.Msg);	// Calcaulation_Checksum

			if(uc_checksum == LIN_Resp_Frame.Msg[LIN_Resp_Frame.Length]){	 
				for(uc_index = 0; uc_index < LIN_Resp_Frame.Length; uc_index++){ uc_Rx2_Lin_Data[uc_index] = LIN_Resp_Frame.Msg[uc_index]; }
				b_Rx2_Msg_TimeOut_Flag = OFF;
				ui_Rx2_TimeOut_Cnt = 0;
			 }
		}
	}

	return;
}// End of LIN_Response_Data_Handling



/*==============	¢Ñ LINUART_Receive_Interrupt_Routine ¢Ð  ==================*/
@far @interrupt void LINUART_Rx_Interrupt(void)
{
	U8 lin_dr_reg, lin_sr_reg;
	U8 pid,lin_id;
	U8 index;

	lin_sr_reg = LINUART_SR;	// Read the LINUART_SR Register
	lin_dr_reg = LINUART_DR;	// Read the LINUART_DR Register (DATA) / Must read dr register after reading sr register

	if(LIN_Req_Frame.Transmit == ON){
		if(LIN_Req_Frame.Index <= LIN_Req_Frame.Length){
			LIN_Transmission_Data(LIN_Req_Frame.Msg[LIN_Req_Frame.Index++]);
		}
		else{ 
			LIN_Req_Frame.Transmit = OFF;
			LIN_Rx_Disable();
		}
	}
	else if(LIN_Resp_Frame.Transmit == ON){			// Request_Transmit_Flag_Set
		LIN_Resp_Frame.Msg[LIN_Resp_Frame.Index++] = lin_dr_reg;

		if(LIN_Resp_Frame.Index > (LIN_Resp_Frame.Length)){ 
			LIN_Rx_Disable();
			LIN_Resp_Frame.Transmit = OFF;
			LIN_Resp_Frame.Update = ON;
		}
	}

	if(LIN_Resp_Frame.Update == ON){ LIN_Response_Data_Handling(); }

	
	return;
}//End of LINUART_Rx_Interrupt
#endif
/*=================================================================================================
¢Ñ		Copyright¨Ï 2014. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

/*=================================================================================================
¢Ñ	Project		: 
¢Ñ	Software_Design	: Yun_Chung_Eun
¢Ñ	Update		: 2011_04_22
=================================================================================================*/

/*==============	¢Ñ Include_File ¢Ð  =================================================================*/
#include	"Main.h"				//Main Include
#include <string.h>

/*==============	¢Ñ Control_Register ¢Ð  ==============================================================*/
volatile U8 uc_Test_Ctrl_Reg;			// Test_Controller_Control_Register
volatile U8 uc_Model_Select_Reg;		// PTC_Model_Select_Register
volatile U8 uc_Rx_TimeOut_Reg;		// Rx Data frame Timeout Register

/*==============	¢Ñ Define Variables ¢Ð  ==============================================================*/
volatile U8 uc_Test_Page_Now;		// Test_Controller_Page_Now
volatile U8 uc_Test_Page_Pre;		// Test_Controller_Page_Previous
volatile U8 uc_Test_Data_Select_Num;	// Test_Controller_Data_Selection_Number

volatile U8 uc_Perc_Unit;		// Perc_Moving_Unit
U8 uc_Rx_Data[4][8] = {0,};

volatile U16 ui_Rx1_TimeOut_Cnt;	// Rx1_Frame_TimeOut_Counter
volatile U16 ui_Rx2_TimeOut_Cnt;	// Rx2_Frame_TimeOut_Counter

volatile U8 uc_Heater_Enable_Flag;	// Heater_Enable_Flag
volatile U8 uc_Target_Duty_Perc[2];		// Target_Duty_Percentage

volatile U8 uc_Target_Display_Mode;	// Target_Display_Mode

/*==============	¢Ñ FIAT500_Test  Function ¢Ð  =====================================================*/



/*==============	¢Ñ First_Switch_Control ¢Ð  ==============================================================*/
void First_Switch_Control(void)
{
	if(b_ENTER_Button_Flag){
		b_First_Logic_On = ON;
		b_Model_Select_flag = OFF;		// Model_Selection_Skipped
		b_Data_Select_flag = OFF;
		
		uc_Test_Page_Pre = (U8)(1);
		uc_Test_Data_Select_Num = (U8)(0);

		b_ENTER_Button_Flag = OFF;
	}

	return;
}// End of First_Switch_Control


/*==============	¢Ñ Test_Controller_First_Routine ¢Ð  ==============================================================*/
void Test_Controller_First_Routine(void)
{
	Start_Zig_Display();
	First_Switch_Control();
	b_Com_On_flag = OFF;//YJS 20230314
	return;
}// End of Test_Controller_First_Routine



/*==============	¢Ñ Model_Select_Display_Handling ¢Ð  ==============================================================*/
void Model_Select_Display_Handling(void)
{
	switch(uc_Test_Page_Now){

		// Display_Page_0
		case 0:	strcpy(LCD_Dis_Data[0],"*HVCC Model*");	
				strcpy(LCD_Dis_Data[1],"");	// 
				strcpy(LCD_Dis_Data[2],"");	// 
				strcpy(LCD_Dis_Data[3],"");		

				break;
							
		default: 
				strcpy(LCD_Dis_Data[0],"");	// Null
				strcpy(LCD_Dis_Data[1],"");	// Null
				strcpy(LCD_Dis_Data[2],"");	// Null
				strcpy(LCD_Dis_Data[3],"");	// Null

				break;
	}

	return;
}// End of Model_Select_Display_Handling



/*==============	¢Ñ Model_Select_Switch_Control ¢Ð  ==============================================================*/
void Model_Select_Switch_Control(void)
{
	if(b_UP_Button_Flag){

		b_UP_Button_Flag = OFF;
	}

	if(b_DOWN_Button_Flag){

		b_DOWN_Button_Flag = OFF;
	}

	if(b_ENTER_Button_Flag){

		b_ENTER_Button_Flag = OFF;
	}


	return;
}// End of Model_Select_Switch_Control



/*==============	¢Ñ Model_Select_LCD_Display_Control ¢Ð  ==============================================================*/
void Model_Select_LCD_Display_Control(void)
{
	U8 uc_line_index;

	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
	uc_Test_Page_Pre = uc_Test_Page_Now ;
	
	// Test_Controller_Page 0 Display
	if(uc_Test_Page_Now == (U8)(0)){			//page 1
		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
			Set_LCD_Address(LCD_Line[uc_line_index]);

			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
		}
	}

	return;
}// End of Model_Select_LCD_Display_Control


/*==============	¢Ñ Model_Select_Routine ¢Ð  ==============================================================*/
void Model_Select_Routine(void)
{
	Model_Select_LCD_Display_Control();
	Model_Select_Switch_Control();	

	return;
}// End of Model_Select_Routine



/*==============	¢Ñ Test_Ctrl_Value_Change ¢Ð  ==============================================================*/
void Test_Ctrl_Value_Change(U8 uc_st)
{
	U8 uc_buffer;
	U16 ui_buffer;

	// Value_Up_Routine (Up button)
	if(uc_st == 1){	
  		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
		else if(uc_Test_Data_Select_Num == (U8)(1)){			
			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode		
if (HEATER_zone_status == HTR_ZONE_1)
{
				if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(20); }
				else{
					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);

					if((uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
					else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
				}
}
else
{
				if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(20); }
				else{
					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);

					if((uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
					else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
				}
}
			}
			else{	// Percentage_Display_Mode
if (HEATER_zone_status == HTR_ZONE_1)
{
				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(200); }
				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
}
else
{
				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(200); }
				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
}
			}
		}
	}
			
	// Value Down Routine (Down_Button)
	else if(uc_st == 0){	
		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
		else if(uc_Test_Data_Select_Num == (U8)(1)){
			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode	
if (HEATER_zone_status == HTR_ZONE_1)
{
				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ 

					if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
				}
				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
}
else
{
				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ 

					if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
				}
				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
}
			}
			else{	// Percentage_Display_Mode
if (HEATER_zone_status == HTR_ZONE_1)
{
				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
}
else
{
				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
}
			}
		}
	}

	return ;
}// End of Test_Ctrl_Value_Change


/*==============	¢Ñ Test_Ctrl_Swtich_Control ¢Ð  ==============================================================*/
void Test_Ctrl_Swtich_Control(void)
{
	// Up_Button_Control_Routine
	if(b_UP_Button_Flag== ON){

		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit < (U8)(130)){ uc_Perc_Unit++;}}
		else{
			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
			else if(b_Data_Select_flag == ON){
				if(uc_Test_Page_Now == (U8)(0)){
					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
				}
			}else{
				if(uc_Test_Page_Now > 0){
					uc_Test_Page_Now--;
					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
				}
			}
		}
		b_UP_Button_Flag = OFF;
	}// End of Up_Button_Control_Routine
/*--------------------------------------------------------------------------------------------------*/
	// Down_Button_Control_Routine
	else if(b_DOWN_Button_Flag== ON){ 

		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit > (U8)(1)){ uc_Perc_Unit--;}}
		else{
			//Data down setting
			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
			//Data select
			else if(b_Data_Select_flag == ON){
				if(uc_Test_Page_Now == (U8)(0)){
					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
				}
			}else{
				if(uc_Test_Page_Now < 4){
					uc_Test_Page_Now++;
					
					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
				}
			}
		}
		b_DOWN_Button_Flag = OFF;
	}// End of Down_Button_Control_Routine
/*--------------------------------------------------------------------------------------------------*/
	//Set_Button_Control_Routine
	if(b_SET_Button_Flag== ON){
		if(b_Test_Option_flag){ uc_Target_Display_Mode ^= ON; uc_Test_Page_Pre = (U8)(10);}
		else if(uc_Test_Page_Now < 2){

			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
			else{
				if(b_Data_Setting_flag == OFF){
					b_Data_Setting_flag = ON;
				}else{ 
					b_Data_Setting_flag = OFF;
					b_Data_Select_flag = OFF;
				}
			}
			b_SET_Button_Flag = OFF;
		}

		b_SET_Button_Flag = OFF;
	}// End of Set_Button_Control_Routine
/*--------------------------------------------------------------------------------------------------*/
	// OnOff_Button_Control_Routine
	if(b_ONOFF_Button_Flag== ON){
#if 0//YJS 20230314
		if(b_Com_On_flag == OFF){b_Com_On_flag = ON;}
		else{ b_Com_On_flag = OFF;}
#endif		
		b_ONOFF_Button_Flag = OFF;
	}// End of OnOff_Button_Control_Routine
/*--------------------------------------------------------------------------------------------------*/
	// Option_Button_Control_Routine
	if(b_OPTION_Button_Flag == ON){

		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
		else{b_Test_Option_flag = OFF; }

		b_OPTION_Button_Flag = OFF;
	}// End of Option_Button_Control_Routine

/*--------------------------------------------------------------------------------------------------*/
	// Enter_Button_Control_Routine
	if(b_ENTER_Button_Flag == ON){
		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
		else{
#if 0
			b_First_Logic_On = OFF;
			Test_Ctrl_Reset_Values();	
#else
if (HEATER_zone_status != HTR_ZONE_1)
HEATER_zone_status = HTR_ZONE_1;
else HEATER_zone_status=HTR_ZONE_2;
#endif
		}
		b_ENTER_Button_Flag = OFF;
	}// End of Enter_Button_Control_Routine
	
	return;
}// End of Test_Ctrl_Swtich_Control

	
/*==============	¢Ñ Test_Ctrl_Display_Handling ¢Ð  ==============================================================*/
void Test_Ctrl_Text_Display_Handling(void)
{
	switch(uc_Test_Page_Now){

		// Display_Page_0
		case 0:	strcpy(LCD_Dis_Data[0],"Al:     /");		// PTC_Allowance: / Status 
				if(!uc_Target_Display_Mode){ strcpy(LCD_Dis_Data[1],"Td:     Fd:"); }	// Target Duty:   / Feedback Duty:
				else{ strcpy(LCD_Dis_Data[1],"Tp:     Fd:"); }	// Target Duty:   / Feedback Duty:
				strcpy(LCD_Dis_Data[2],"R:  F:  HV:");	// Ready: / Fault: / HV:
				strcpy(LCD_Dis_Data[3],"Cr:     Pw:");	// Current:  / Power:
				break;
				
		// Display_Page_1
		case 1:	strcpy(LCD_Dis_Data[0],"Ct:");			// Core Temp:
				strcpy(LCD_Dis_Data[1],"Ver:");		// Software_Version:
				strcpy(LCD_Dis_Data[2],"");	// Core Temp:
				strcpy(LCD_Dis_Data[3],"");	// Core Temp
				break;

		default:
				strcpy(LCD_Dis_Data[0],"");	// Null
				strcpy(LCD_Dis_Data[1],"");	// Null
				strcpy(LCD_Dis_Data[2],"");	// Null
				strcpy(LCD_Dis_Data[3],"");	// Null

				break;
 	}

	return;
}// End of Test_Ctrl_Text_Display_Handling


/*==============	¢Ñ Test_Ctrl_LCD_Display_Control ¢Ð  ==============================================================*/
static void MV_Ctrl_LCD_Display_Control(void)
{
	U8 can_data[8],can_diag[8];
	U8 uc_buffer;
	U8 uc_line_index;
	U8 uc_fault_cnt;
	U16 ui_buffer;
	U32 ul_buffer;
if (HEATER_zone_status==HTR_ZONE_1)
{
	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
	{
		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS1][uc_buffer];
		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
	}
}
else
{
	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
	{
		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
	}
}	
	if(b_Test_Option_flag == ON){
		Set_LCD_Address(LCD_Line[0]);
		Display_LCD_String("*OPTION*");

		if(uc_Target_Display_Mode == (U8)(0)){
			Set_LCD_Address(LCD_Line[1]);
			Display_LCD_String("*Target Perc");
		}
		else{
			Set_LCD_Address(LCD_Line[1]);
			Display_LCD_String("*Target Watt(OS)");
		}
		
		Set_LCD_Address(LCD_Line[2]);
		Display_LCD_String("D_Unit:");

		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
		if(b_Blink_250_Flag){
			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
			Display_LCD_String(".");
			uc_buffer = uc_Perc_Unit %(U8)(2);
			if(uc_buffer){ Display_LCD_String("5"); }
			else{ Display_LCD_String("0"); }
			Display_LCD_String("%");
		}
		return;
	}

	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
		Test_Ctrl_Text_Display_Handling(); 
		b_Data_Select_flag = OFF;
		b_Data_Setting_flag = OFF;
		uc_Test_Data_Select_Num = (U8)(0);
	}
	uc_Test_Page_Pre = uc_Test_Page_Now ;
	
	// Test_Controller_Page 0 Display
	if(uc_Test_Page_Now == (U8)(0)){			//page 1
		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){

			Set_LCD_Address(LCD_Line[uc_line_index]);

			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
				if(uc_line_index == uc_Test_Data_Select_Num){ 
					if(uc_Test_Data_Select_Num == (U8)(0)){
						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
						else{ Display_LCD_String("        /"); }
					}
					else if(uc_Test_Data_Select_Num == (U8)(1)){
						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
						else{ Display_LCD_String("        Fd:"); }
					}
				}
				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
		
			// Line1_Display
			if(uc_line_index == (U8)(0)){		// LINE 1

				// PTC_Allowance_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
#if 1
				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
#else
//Num_Display_LCD(CAN_test_data[0]);
#endif
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
				if (HEATER_zone_status == HTR_ZONE_1)
				Display_LCD_String("Z1");
				else Display_LCD_String("Z2");
				// PTC_Status
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
#if 1
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
//					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
					uc_buffer = (U8)((can_data[0] & 0x06) >> 1);//YJS
					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
				}
#else

Num_Display_LCD(CAN_test_data[1]);
#endif
			}

			// Line2_Display
			else if(uc_line_index == (U8)(1)){	// LINE 2

				// Target_Duty_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
					if(b_Blink_250_Flag){
						if(!uc_Target_Display_Mode){	// Percentage_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
								Display_LCD_String(".");
								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
								if(uc_buffer){ Display_LCD_String("5"); }
								else{ Display_LCD_String("0"); }
							}
}
else
{
							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
								Display_LCD_String(".");
								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
								if(uc_buffer){ Display_LCD_String("5"); }
								else{ Display_LCD_String("0"); }
							}
}
						}
						else{	// Power_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
else
{
							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
						}
					}	
				}else{
					if(!uc_Target_Display_Mode){
if (HEATER_zone_status == HTR_ZONE_1)
{
						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
							Display_LCD_String(".");
							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
							if(uc_buffer){ Display_LCD_String("5"); }
							else{ Display_LCD_String("0"); }
						}
}
else
{
						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
							Display_LCD_String(".");
							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
							if(uc_buffer){ Display_LCD_String("5"); }
							else{ Display_LCD_String("0"); }
						}
}
					}
					else{	// Power_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
else
{
						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
					}
				}

				// Feedback_Duty_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					Num_Display_LCD(can_data[6] /(U8)(2));
					if(can_data[6] < (U8)(200)){
						Display_LCD_String(".");
						uc_buffer = can_data[6] % (U8)(2);
						if(uc_buffer){ Display_LCD_String("5"); }
						else{ Display_LCD_String("0"); }
					}
				}
			}

			// Line3_Display
			else if(uc_line_index == (U8)(2)){	// LINE 3

				// Ready_flag_display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
				else{
					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
					else{ Display_LCD_String("0"); }
				}
				// Fault_flag_display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
				else{
					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
					else{ Display_LCD_String("0"); }
				}
				// Input_HV
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					ui_buffer = (U16)(can_data[4]) * (U16)(4);//YJS 2->4
					Num_Display_LCD(ui_buffer);
				}
			}

			// Line4_Display
			else if(uc_line_index == (U8)(3)){	// LINE 4

				// Consumption_Current_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
#if 1
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					Num_Display_LCD(can_data[5] / (U8)(5));
					Display_LCD_String(".");
					uc_buffer = can_data[5] % (U8)(5);
					Num_Display_LCD(uc_buffer * (U8)(2));
				}
#else
Num_Display_LCD(CAN_test_data[2]);
#endif
				// Consumption_Power_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
#if 1
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
					Num_Display_LCD(ui_buffer);
				}
#else
Num_Display_LCD(CAN_test_data[3]);
#endif
			}
		}
	}
		
	// Test_Controller_Page 1 Display
	else if(uc_Test_Page_Now == (U8)(1)){
		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){

			Set_LCD_Address(LCD_Line[uc_line_index]);
			Display_LCD_String(LCD_Dis_Data[uc_line_index]);

			// Line1_Display
			if(uc_line_index == (U8)(0)){		// LINE 1

				// Core_Temp_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					if(can_data[1] < (U8)(40)){
						Display_LCD_String("-");
						Num_Display_LCD((U8)(40) - can_data[1]);
					}
					else{
						Num_Display_LCD(can_data[1] - (U8)(40));
					}
				}
			}
			
			// Line2_Display
			if(uc_line_index == (U8)(1)){		// LINE 2

				// Software Version
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
#if 0	// YJS
					Num_Display_LCD(can_diag[7] >> 4);  				//SoftWare Version Display
					Display_LCD_String(".");
					Num_Display_LCD(can_diag[7] & 0x0F);  			//SoftWare Version Display
#else
					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
					Display_LCD_String(".");
					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
#endif
				}	
			}

			// Line3_Display
			if(uc_line_index == (U8)(2)){		// LINE 2
				
			}

			// Line4_Display
			if(uc_line_index == (U8)(3)){		// LINE 3

			}
		}
	}
	else{

		if(b_Rx2_Msg_TimeOut_Flag){
			Set_LCD_Address(LCD_Line[0]);	
			Display_LCD_String("NC");
		}
		else{
			uc_fault_cnt = (U8)(0);
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[1] & (U8)(0x01)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_LVLow");
				}
			}

			if(can_diag[1] & (U8)(0x02)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_LVHigh");
				}
			}

			if(can_diag[1] & (U8)(0x04)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_HVLow");
				}
			}

			if(can_diag[1] & (U8)(0x08)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
					Display_LCD_String("Flt_HVHigh");
				}
			}

			if(can_diag[1] & (U8)(0x10)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_OverCur");
				}
			}
#if 0	// YJS
			if(can_diag[1] & (U8)(0x80)){
#else
			if(can_diag[1] & (U8)(0x20)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_ThmShut");
				}
			}
#if 0	// YJS
			if(can_diag[2] & (U8)(0x01)){
#else
			if(can_diag[1] & (U8)(0x40)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
					Display_LCD_String("Flt_PCBThmShut");
				}
			}

			if(can_diag[3] & (U8)(0x01)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_MsgTimeOut");
				}
			}
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[4] & (U8)(0x01)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_HVSen");
				}
			}
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[4] & (U8)(0x02)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_LVSen");
				}
			}

			if(can_diag[4] & (U8)(0x04)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_CurSen");
				}
			}
#if 0 // YJS
			if(can_diag[4] & (U8)(0x40)){
#else
			if(can_diag[4] & (U8)(0x08)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
					Display_LCD_String("Fail_CoreTemp");
				}
			}
#if 0 // YJS
			if(can_diag[4] & (U8)(0x80)){
#else
			if(can_diag[4] & (U8)(0x10)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_PCB1Temp");
				}
			}
#if 0	// YJS
			if(can_diag[5] & (U8)(0x01)){
#else
			if(can_diag[4] & (U8)(0x20)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_IGBT");
				}
			}
#if 1 // YJS
			if(can_diag[4] & (U8)(0x40)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_openLoad");
				}
			}
#endif
			if(!uc_fault_cnt){
				Set_LCD_Address(LCD_Line[0]);
				Display_LCD_String("Normal");
			}
		}
	}

	if((b_Com_On_flag == ON)){
		Set_LCD_Address((unsigned char)(0x00+15));
//		if(b_Blink_250_Flag){Display_LCD_String("C");}
//		else{Display_LCD_String(" ");}
		Display_LCD_String("Y");	// YJS 20230314
	}else{
		Set_LCD_Address((unsigned char)(0x00+15));
		Display_LCD_String("N");
	}

	return;
}// End of Test_Ctrl_LCD_Display_Control
static void SU2I_Ctrl_LCD_Display_Control(void)
{
	U8 can_data[8],can_diag[8];
	U8 uc_buffer;
	U8 uc_line_index;
	U8 uc_fault_cnt;
	U16 ui_buffer;
	U32 ul_buffer;
if (HEATER_zone_status==HTR_ZONE_1)
{
	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
	{
		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
	}
}
else
{
	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
	{
		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
	}
}	
	if(b_Test_Option_flag == ON){
		Set_LCD_Address(LCD_Line[0]);
		Display_LCD_String("*OPTION*");

		if(uc_Target_Display_Mode == (U8)(0)){
			Set_LCD_Address(LCD_Line[1]);
			Display_LCD_String("*Target Perc");
		}
		else{
			Set_LCD_Address(LCD_Line[1]);
			Display_LCD_String("*Target Watt(OS)");
		}
		
		Set_LCD_Address(LCD_Line[2]);
		Display_LCD_String("D_Unit:");

		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
		if(b_Blink_250_Flag){
			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
			Display_LCD_String(".");
			uc_buffer = uc_Perc_Unit %(U8)(2);
			if(uc_buffer){ Display_LCD_String("5"); }
			else{ Display_LCD_String("0"); }
			Display_LCD_String("%");
		}
		return;
	}

	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
		Test_Ctrl_Text_Display_Handling(); 
		b_Data_Select_flag = OFF;
		b_Data_Setting_flag = OFF;
		uc_Test_Data_Select_Num = (U8)(0);
	}
	uc_Test_Page_Pre = uc_Test_Page_Now ;
	
	// Test_Controller_Page 0 Display
	if(uc_Test_Page_Now == (U8)(0)){			//page 1
		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){

			Set_LCD_Address(LCD_Line[uc_line_index]);

			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
				if(uc_line_index == uc_Test_Data_Select_Num){ 
					if(uc_Test_Data_Select_Num == (U8)(0)){
						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
						else{ Display_LCD_String("        /"); }
					}
					else if(uc_Test_Data_Select_Num == (U8)(1)){
						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
						else{ Display_LCD_String("        Fd:"); }
					}
				}
				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
		
			// Line1_Display
			if(uc_line_index == (U8)(0)){		// LINE 1

				// PTC_Allowance_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
#if 1
				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
#else
//Num_Display_LCD(CAN_test_data[0]);
#endif
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
				if (HEATER_zone_status == HTR_ZONE_1)
				Display_LCD_String("Z1");
				else Display_LCD_String("Z2");
				// PTC_Status
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));

				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
				}

			}

			// Line2_Display
			else if(uc_line_index == (U8)(1)){	// LINE 2

				// Target_Duty_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
					if(b_Blink_250_Flag){
						if(!uc_Target_Display_Mode){	// Percentage_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
								Display_LCD_String(".");
								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
								if(uc_buffer){ Display_LCD_String("5"); }
								else{ Display_LCD_String("0"); }
							}
}
else
{
							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
								Display_LCD_String(".");
								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
								if(uc_buffer){ Display_LCD_String("5"); }
								else{ Display_LCD_String("0"); }
							}
}
						}
						else{	// Power_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
else
{
							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
						}
					}	
				}else{
					if(!uc_Target_Display_Mode){
if (HEATER_zone_status == HTR_ZONE_1)
{
						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
							Display_LCD_String(".");
							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
							if(uc_buffer){ Display_LCD_String("5"); }
							else{ Display_LCD_String("0"); }
						}
}
else
{
						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
							Display_LCD_String(".");
							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
							if(uc_buffer){ Display_LCD_String("5"); }
							else{ Display_LCD_String("0"); }
						}
}
					}
					else{	// Power_Display
if (HEATER_zone_status == HTR_ZONE_1)
{
						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
else
{
						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
}
					}
				}

				// Feedback_Duty_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					Num_Display_LCD(can_data[4] /(U8)(2));
					if(can_data[6] < (U8)(200)){
						Display_LCD_String(".");
						uc_buffer = can_data[4] % (U8)(2);
						if(uc_buffer){ Display_LCD_String("5"); }
						else{ Display_LCD_String("0"); }
					}
				}
			}

			// Line3_Display
			else if(uc_line_index == (U8)(2)){	// LINE 3

				// Ready_flag_display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
				else{
					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
					else{ Display_LCD_String("0"); }
				}
				// Fault_flag_display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
				else{
					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
					else{ Display_LCD_String("0"); }
				}
				// Input_HV
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{

					ui_buffer = (U16)(uc_Rx_Data[0][3]) * (U16)(4);//YJS 2->4
					Num_Display_LCD(ui_buffer);

				}
			}

			// Line4_Display
			else if(uc_line_index == (U8)(3)){	// LINE 4

				// Consumption_Current_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
#if 1
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					Num_Display_LCD(can_data[6] / (U8)(5));
					Display_LCD_String(".");
					uc_buffer = can_data[6] % (U8)(5);
					Num_Display_LCD(uc_buffer * (U8)(2));
				}
#else
Num_Display_LCD(CAN_test_data[2]);
#endif
				// Consumption_Power_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
#if 1
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
					Num_Display_LCD(ui_buffer);
				}
#else
Num_Display_LCD(CAN_test_data[3]);
#endif
			}
		}
	}
		
	// Test_Controller_Page 1 Display
	else if(uc_Test_Page_Now == (U8)(1)){
		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){

			Set_LCD_Address(LCD_Line[uc_line_index]);
			Display_LCD_String(LCD_Dis_Data[uc_line_index]);

			// Line1_Display
			if(uc_line_index == (U8)(0)){		// LINE 1

				// Core_Temp_Display
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
					if(can_data[1] < (U8)(40)){
						Display_LCD_String("-");
						Num_Display_LCD((U8)(40) - can_data[1]);
					}
					else{
						Num_Display_LCD(can_data[1] - (U8)(40));
					}
				}
			}
			
			// Line2_Display
			if(uc_line_index == (U8)(1)){		// LINE 2

				// Software Version
				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
				else{
#if 1	// YJS
					Num_Display_LCD(uc_Rx_Data[0][7]);  				//SoftWare Version Display
//					Display_LCD_String(".");
//					Num_Display_LCD(".");  			//SoftWare Version Display
#else
					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
					Display_LCD_String(".");
					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
#endif
				}	
			}

			// Line3_Display
			if(uc_line_index == (U8)(2)){		// LINE 2
				
			}

			// Line4_Display
			if(uc_line_index == (U8)(3)){		// LINE 3

			}
		}
	}
	else{

		if(b_Rx2_Msg_TimeOut_Flag){
			Set_LCD_Address(LCD_Line[0]);	
			Display_LCD_String("NC");
		}
		else{
			uc_fault_cnt = (U8)(0);
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[0] & (U8)(0x02)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_LVLow");
				}
			}

			if(can_diag[0] & (U8)(0x04)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_LVHigh");
				}
			}

			if(can_diag[0] & (U8)(0x08)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_HVLow");
				}
			}

			if(can_diag[0] & (U8)(0x10)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
					Display_LCD_String("Flt_HVHigh");
				}
			}

			if(can_data[7] & (U8)(0x2)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_OverCur");
				}
			}
			if(can_data[7] & (U8)(0x1)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_ThmShut");
				}
			}

			if(can_diag[1] & (U8)(0x1)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
					Display_LCD_String("Flt_PCBThmShut");
				}
			}

			if(can_diag[1] & (U8)(0x10)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Flt_MsgTimeOut");
				}
			}
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[1] & (U8)(0x04)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_HVSen");
				}
			}
/*--------------------------------------------------------------------------------------------------*/
			if(can_diag[1] & (U8)(0x02)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_LVSen");
				}
			}

			if(can_data[7] & (U8)(0x04)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_CurSen");
				}
			}
#if 0 // YJS
			if(can_diag[4] & (U8)(0x40)){
#else
			if(can_data[7] & (U8)(0x08)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
					Display_LCD_String("Fail_CoreTemp");
				}
			}
#if 0 // YJS
			if(can_diag[4] & (U8)(0x80)){
#else
			if(can_diag[1] & (U8)(0x8)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_PCB1Temp");
				}
			}
#if 0	// YJS
			if(can_diag[5] & (U8)(0x01)){
#else
			if(can_data[5] == (U8)(0xff)){
#endif
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_IGBT");
				}
			}
#if 0 // YJS
			if(can_diag[4] & (U8)(0x40)){
				uc_fault_cnt++;
				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
				){
					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
					Display_LCD_String("Fail_openLoad");
				}
			}
#endif
			if(!uc_fault_cnt){
				Set_LCD_Address(LCD_Line[0]);
				Display_LCD_String("Normal");
			}
		}
	}

	if((b_Com_On_flag == ON)){
		Set_LCD_Address((unsigned char)(0x00+15));
//		if(b_Blink_250_Flag){Display_LCD_String("C");}
//		else{Display_LCD_String(" ");}
		Display_LCD_String("Y");	// YJS 20230314
	}else{
		Set_LCD_Address((unsigned char)(0x00+15));
		Display_LCD_String("N");
	}

	return;
}// End of Test_Ctrl_LCD_Display_Control
/*==============	¢Ñ BMW48_Test_Controller_Routine ¢Ð  ==============================================================*/
void Test_Controller_Routine(void)
{
#if (PTC_MODEL == MV_FRONT_PTC)||(PTC_MODEL == MV_REAR_PTC)
	MV_Ctrl_LCD_Display_Control(); 
#else
	SU2I_Ctrl_LCD_Display_Control();
#endif
	Test_Ctrl_Swtich_Control();
	
	return;
}// End of BMW48_Test_Controller_Routine


/*==============	¢Ñ TEST_CTRL_Reset_Values ¢Ð  ==============================================================*/
void Test_Ctrl_Reset_Values(void)
{
	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register

	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number

	uc_Perc_Unit = 1;		// Duty_Moving_Unit

	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter

	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
	uc_Target_Duty_Perc[HTR_ZONE_1] = 0;		// Target_Duty_Percentage
	uc_Target_Duty_Perc[HTR_ZONE_2] = 0;		// Target_Duty_Percentage
	HEATER_zone_status=HTR_ZONE_1;
	return;
}// End of TEST_CTRL_Reset_Values

/*=================================================================================================
¢Ñ		Copyright¨Ï 2014. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

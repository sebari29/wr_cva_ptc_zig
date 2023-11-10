/*=================================================================================================
¢Ñ	Project		: 
¢Ñ	Software_Design	: Yun_Chung_Eun
¢Ñ	Update		: 2011_04_22
=================================================================================================*/

/*==============	¢Ñ Include_File ¢Ð  =================================================================*/
#include	"Main.h"				//Main Include

/*==============	¢Ñ Define Variables ¢Ð  ==============================================================*/
U8 uc_Button_Status_Reg;		// Button_Status_Register
U8 uc_Button_Status_Reg2;		// Button_Status_Register_2

U8 uc_Set_BT_Cnt;		// Set_Button_Counter
U8 uc_ONOFF_BT_Cnt;	// ON_OFF_Button_Counter
U8 uc_Up_BT_Cnt;		// Up_Button_Counter
U8 uc_DN_BT_Cnt;		// Down_Button_Counter
U8 uc_OP_BT_Cnt;		// Option_Button_Counter
U8 uc_En_BT_Cnt;		// Enter_Button_Counter


/*==============	¢Ñ Control_Register ¢Ð  ==============================================================*/



/*==============	¢Ñ FunctionS ¢Ð  =====================================================*/


/*==============	¢Ñ ONOFF_Button_Detection ¢Ð  =====================================================*/
void ONOFF_Button_Detection(void)
{
	if(io_ONOFF_STATUS_INPUT == LOW){ uc_ONOFF_BT_Cnt++; }
	else{
		if(uc_ONOFF_BT_Cnt > BUTTON_FLT){ b_ONOFF_Button_Flag = ON; }		// filtering_30ms
		uc_ONOFF_BT_Cnt = (U8)(0);
	}

	return;
}// End of ONOFF_Button_Detection


/*==============	¢Ñ Up_Button_Detection ¢Ð  =====================================================*/
void Up_Button_Detection(void)
{
	if(io_UP_STATUS_INPUT == LOW){ 
		uc_Up_BT_Cnt++;

		if(b_Up_Long_Button_Flag){
			if(uc_Up_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
				b_UP_Button_Flag = ON; 
				uc_Up_BT_Cnt = (U8)(0);
			}	
		}else{
			if(uc_Up_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
				b_UP_Button_Flag = ON;
				b_Up_Long_Button_Flag = ON;
				uc_Up_BT_Cnt = (U8)(0);
			}
		}
	}
	else{
		if(uc_Up_BT_Cnt > BUTTON_FLT){	// filtering_30ms
			b_UP_Button_Flag = ON;
		}
		b_Up_Long_Button_Flag = OFF;
		uc_Up_BT_Cnt = (U8)(0);
	}

	return;
}// End of Up_Button_Detection


/*==============	¢Ñ Down_Button_Detection ¢Ð  =====================================================*/
void Down_Button_Detection(void)
{
	if(io_DOWN_STATUS_INPUT == LOW){ 
		uc_DN_BT_Cnt++;

		if(b_Down_Long_Button_Flag){
			if(uc_DN_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
				b_DOWN_Button_Flag = ON; 
				uc_DN_BT_Cnt = (U8)(0);
			}	
		}
		else{
			if(uc_DN_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
				b_DOWN_Button_Flag = ON;
				b_Down_Long_Button_Flag = ON;
				uc_DN_BT_Cnt = (U8)(0);
			}
		}
	}
	else{
		if(uc_DN_BT_Cnt > BUTTON_FLT){	// filtering_30ms
			b_DOWN_Button_Flag = ON;
		}

		b_Down_Long_Button_Flag = OFF;
		uc_DN_BT_Cnt = (U8)(0);
	}

	return;
}// End of Down_Button_Detection


/*==============	¢Ñ Set_Button_Detection ¢Ð  =====================================================*/
void Set_Button_Detection(void)
{
	if(io_SET_STATUS_INPUT == LOW){ uc_Set_BT_Cnt++; }
	else{
		if(uc_Set_BT_Cnt > BUTTON_FLT){ b_SET_Button_Flag = ON; }		// filtering_30ms
		uc_Set_BT_Cnt = (U8)(0);
	}

	return;
}// End of Set_Button_Detection


/*==============	¢Ñ Option_Button_Detection ¢Ð  =====================================================*/
void Option_Button_Detection(void)
{
	if(io_OPTION_STATUS_INPUT == LOW){ uc_OP_BT_Cnt++; }
	else{
		if(uc_OP_BT_Cnt > BUTTON_FLT){ b_OPTION_Button_Flag = ON; }		// filtering_30ms
		uc_OP_BT_Cnt = (U8)(0);
	}

	return;
}// End of Option_Button_Detection


/*==============	¢Ñ Enter_Button_Detection ¢Ð  =====================================================*/
void Enter_Button_Detection(void)
{
	if(io_ENTER_STATUS_INPUT == LOW){ uc_En_BT_Cnt++; }
	else{
		if(uc_En_BT_Cnt > BUTTON_FLT){ b_ENTER_Button_Flag = ON; }		// filtering_30ms
		uc_En_BT_Cnt = (U8)(0);
	}

	return;
}// End of Enter_Button_Detection

/*==============	¢Ñ Enter_Button_Detection ¢Ð  =====================================================*/
void Controller_Button_Clear(void)
{
	uc_Button_Status_Reg = 0x00;

	return;
}// End of Controller_Button_Clear


/*==============	¢Ñ Controller_Button_Detection ¢Ð  =====================================================*/
void Controller_Button_Detection(void)
{
	ONOFF_Button_Detection();
	Up_Button_Detection();
	Down_Button_Detection();
	Set_Button_Detection();
	Option_Button_Detection();
	Enter_Button_Detection();
	
	return;
}// End of Controller_Button_Detection


/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

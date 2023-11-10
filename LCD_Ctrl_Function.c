/*=================================================================================================
¢Ñ	Project_Name	: TEST CONTROLLER
¢Ñ	File_Name	: LCD_Ctrl_Function
¢Ñ	Design_By	: Woory Industrial SW TEAM
¢Ñ	Final_Release	: 2018
=================================================================================================*/

/*==============	¢Ñ Include_File ¢Ð  =================================================================*/
#include	"main.h"

/*==============	¢Ñ Constant_Value_Define ¢Ð ===========================================================*/
#define	Delay_us(x){  U8 dcnt; dcnt = (x) / ((12 * 1000L)/(FCPU_SPEED * 1000L)) | 1; while(--dcnt != 0)continue;  }

/*==============	¢Ñ Control_Register ¢Ð  =======================================================*/
@tiny volatile unsigned char Buffer_Add;
@tiny volatile unsigned char LCD_Buffer[32];
volatile U8 uc_LCD_Blink_Reg;	// LCD_Blink_bit_Control_Register
volatile U8 LCD_Line[4] = {0x00, 0xC0, 0x10, 0xD0};
volatile U8 LCD_Dis_Data[4][16];

volatile U8 ui_blink_timer_cnt;


/*==============	¢Ñ Internal_Functions ¢Ð ==============================================================*/

/*==============	¢Ñ LCD_Blink_Timer_Control ¢Ð  ================================================================*/
void LCD_Blink_Timer_Control(void)
{
	ui_blink_timer_cnt++;

	if((ui_blink_timer_cnt % (U16)(10)) == (U16)(0)){ b_Blink_100_Flag ^= ON; Clear_Display_LCD();}
	if((ui_blink_timer_cnt % (U16)(25)) == (U16)(0)){ b_Blink_250_Flag ^= ON; }
	if((ui_blink_timer_cnt % (U16)(50)) == (U16)(0)){ b_Blink_500_Flag ^= ON; }
	if((ui_blink_timer_cnt % (U16)(100)) == (U16)(0)){ b_Blink_1s_Flag ^= ON; }
	if((ui_blink_timer_cnt % (U16)(200)) == (U16)(0)){ 
		b_Blink_2s_Flag ^= ON; 
		ui_blink_timer_cnt = 0;
	}

	return;
}// End of LCD_Blink_Timer_Control


/*==============	¢Ñ Delay Routine ¢Ð  ================================================================*/
void Delay_ms(U8 Delay)
{
	U8 i;
	do{	i = 8;
	Windows_Watchdog_Clear();
		do{ Delay_us(250);  }while(--i);
	}while(--Delay);
	return;
}//End of Delay_ms

/*==============	¢Ñ LCD Command Routine ¢Ð  =========================================================*/
void Set_LCD_Command(U8 Cmd)
{
	LCD_Data	= Cmd;
	LCD_EN	= 1;
	Delay_us(150);//100
	LCD_EN	= 0;
	return;
}//End of Set_LCD_Command

/*==============	¢Ñ LCD Data RAM Address Set Routine ¢Ð  ================================================*/
void Set_LCD_Address(U8 Add)
{
	LCD_Data	= (unsigned char)(Add | 0x80);
	LCD_EN	= 1;
	Delay_us(150);//100
	LCD_EN	= 0;
	return;
}//End of Set_LCD_Address

/*==============	¢Ñ LCD Display Routine Routine ¢Ð  =====================================================*/
void Display_LCD_Data(U8 Data)
{
	LCD_Data = Data;
	LCD_RS = 1;
	LCD_EN = 1;
	Delay_us(150);
	LCD_EN = 0;
	LCD_RS = 0;
	return;
}//End of Display_LCD_Data

/*============== ¢Ñ LCD String Display Routine ¢Ð  ======================================================*/
void Display_LCD_String(U8 *str)
{
	for(; *str;){ Display_LCD_Data(*str++);	}
	return;
}//End of Display_LCD_String


void Display_Clear(void)
{
	LCD_RS = OFF;
	LCD_RW = OFF;
	LCD_EN= OFF;
	LCD_Data = 0x01;

	return;
}


/*============== ¢Ñ LCD String Display Routine ¢Ð  ======================================================*/
void Clear_Display_LCD(void)
{
	Set_LCD_Address(0x00);	// 1 Line Test Zig
	Display_LCD_String("                ");
	
	Set_LCD_Address(0xC0);  // 2 Line Test Zig
	Display_LCD_String("                ");

	Set_LCD_Address(0x10);  // 3 Line Test Zig
	Display_LCD_String("                ");

	Set_LCD_Address(0xD0);  // 4 Line Test Zig
	Display_LCD_String("                ");
	
	return;
}//End of Display_LCD_String


/*==============	¢Ñ LCD Initialize Routine Routine ¢Ð  ===================================================*/
void LCD_Initialize(void)
{
//	LCD_RS	= 0;		//[LCD_4Pin] Data = 1, Command = 0
//	LCD_RW	= 0;		//[LCD_5Pin] Read = 1, Write = 0
//	LCD_EN	= 0;		//[LCD_6Pin] Enable = 1
//	LCD_Buffer_Clear();

	Set_LCD_Command(0x3C);	//Function set
	Delay_ms(50);
		
	Set_LCD_Command(0x3C);	//Function set
	Delay_ms(100);
	Set_LCD_Command(0x3C);	//Function set
	
	Set_LCD_Command(0x3C);	//Function set
	Set_LCD_Command(0x08);	//Display off
	Set_LCD_Command(0x01);	//Display Clear and Return home
	Delay_ms(100);
	
	Set_LCD_Command(0x06);	//Entry mode setting
	Set_LCD_Command(0x0C);	//Display on and cursor off
	Set_LCD_Address(0x00);	//LCD Address Init

//	Set_LCD_Command(0x02);	//LCD Home
//	Set_LCD_Command(0x04);	//Decrement Write
//	Set_LCD_Command(0x0E);	//Small Cursor
//  	Set_LCD_Command(0x0F);	//Large Cursor
//	Set_LCD_Command(0x14);	//Cursor Right
//	Set_LCD_Command(0x10);	//Cursor Left
	return;
}//End of LCD_Initialize

/*==============	¢Ñ LCD_Buffer Address Set Routine ¢Ð  ==================================================*/
void LCD_Buffer_Add(U8 Add)
{
	if(Add >= 0xC0){ Buffer_Add = (U8)((Add & 0x0F) + 48);	}	//forth_LCD_Column
	else{	Buffer_Add = (U8)(Add & 0x0F);		}			//First_LCD_Column
	return;
}//End of LCD_Buffer_Address

/*==============	¢Ñ LCD_Buffer_Char Routine ¢Ð  =======================================================*/
void LCD_Buffer_Char(U8 Data)
{
	LCD_Buffer[Buffer_Add++] = Data;
	return;
}//End of LCD_Buffer_Char

/*============== ¢Ñ LCD_Buffer_String Routine ¢Ð  ======================================================*/
void LCD_Buffer_String(U8 *str)
{
	for(; *str;){ LCD_Buffer_Char(*str++);	}
	return;
}//End of LCD_Buffer_String

/*============== ¢Ñ LCD_Buffer_Clear Routine ¢Ð  =======================================================*/
void LCD_Buffer_Clear(void)
{
	U8 i;

	for(i = 0; i < 32; i++){ LCD_Buffer[i] = ' ';	}
	return;
}//End of LCD_Buffer_Clear

/*============== ¢Ñ Num Display Routine ¢Ð  ======================================================*/
void Num_Display_LCD(U16 num)
{
	U8 i;
	U8 buff;

	if(num >= 10000){
		buff = (U8)(num / 10000);
		num %= 10000;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 1000);
		num %= 1000;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 100);
		num %= 100;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 10);
		num %= 10;
		Display_LCD_Data((U8)(48+buff));

		num %= 10;
		Display_LCD_Data((U8)(48+num));

	}else if(num >= 1000){
		buff = (U8)(num / 1000);
		num %= 1000;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 100);
		num %= 100;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 10);
		num %= 10;
		Display_LCD_Data((U8)(48+buff));

		num %= 10;
		Display_LCD_Data((U8)(48+num));
	}else if(num >= 100){
		buff = (U8)(num / 100);
		num %= 100;
		Display_LCD_Data((U8)(48+buff));

		buff = (U8)(num / 10);
		num %= 10;
		Display_LCD_Data((U8)(48+buff));

		num %= 10;
		Display_LCD_Data((U8)(48+num));
	}else if(num >= 10){
		buff = (U8)(num / 10);
		num %= 10;
		Display_LCD_Data((U8)(48+buff));

		num %= 10;
		Display_LCD_Data((U8)(48+num));
	}else{ Display_LCD_Data((U8)(48+num));}
	
	return;
} // End of Num_Display_LCD
/*=================================================================================================
¢Ñ		Copyright¨Ï 2018. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/

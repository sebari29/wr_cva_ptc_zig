/*=================================================================================================
¢Ñ	Project_Name	: HV PTC HTR STANDARD
¢Ñ	File_Name	: HV_Battery_Function.c
¢Ñ	Design_By	: Woory Industrial SW TEAM
¢Ñ	Final_Release	: 2018
=================================================================================================*/
#ifndef	__CLD_CTRL_H__
#define	__CLD_CTRL_H__

/*==============	¢Ñ Global_Constant_Value_Define ¢Ð ===========================================================*/

/*==============	¢Ñ Global_Control_Register ¢Ð  ===========================================================*/
extern U8 uc_LCD_Blink_Reg;	// LCD_Blink_bit_Control_Register
#define b_Blink_100_Flag		((struct bits*)&uc_LCD_Blink_Reg)->BIT0	// blink_100ms_flag
#define b_Blink_250_Flag		((struct bits*)&uc_LCD_Blink_Reg)->BIT1	// blink_250ms_flag
#define b_Blink_500_Flag		((struct bits*)&uc_LCD_Blink_Reg)->BIT2	// blink_500ms_flag
#define b_Blink_1s_Flag		((struct bits*)&uc_LCD_Blink_Reg)->BIT3	// blink_1s_flag
#define b_Blink_2s_Flag		((struct bits*)&uc_LCD_Blink_Reg)->BIT4	// blink_2s_flag


/*==============	¢Ñ External Global Value ¢Ð	============================================================*/
extern U8 LCD_Line[4];
extern U8 LCD_Dis_Data[4][16];


/*==============	¢Ñ Global_Functions ¢Ð	==============================================================*/
extern void Delay_ms(U8 Delay);
extern void Set_LCD_Command(U8 Cmd);
extern void Set_LCD_Address(U8 Add);
extern void Display_LCD_Data(U8 Data);
extern void Display_LCD_String(U8 *str);
extern void Clear_Display_LCD(void);
extern void LCD_Initialize(void);
extern void LCD_Buffer_Add(U8 Add);
extern void LCD_Buffer_Char(U8 Data);
extern void LCD_Buffer_String(U8 *str);
extern void LCD_Buffer_Clear(void);
extern void Num_Display_LCD(U16 num);
extern void LCD_Blink_Timer_Control(void);
extern void Display_Clear(void);

/*=================================================================================================
¢Ñ		Copyright¨Ï 2018. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
#endif
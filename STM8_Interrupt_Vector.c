/*=================================================================================================
¢Ñ	Project		: Interrupt_Vectors_Table_for_STM8_Devices
¢Ñ	Software_Design	: Yun_Chung_Eun
¢Ñ	Update		: 2010_12_28
¢Ñ	Compiler		: Cosmic STM8 v4.2.6 Compiler
=================================================================================================*/

/*==============	¢Ñ Basic Interrupt Vectors ¢Ð  =========================================================*/
typedef void @far (*Interrupt_Handler_1)(void);

struct Interrupt_Vector
{
	unsigned char interrupt_instruction;
	Interrupt_Handler_1	Interrupt_Handler;
};//End of Interrupt_Vector

/*==============	¢Ñ Non Handled Interrupt ¢Ð  =========================================================*/
@far @interrupt void Not_Used_Interrupt(void)
{
	return;
}//End of Not_Used_Interrupt_Control

/*==============	¢Ñ Interrupt Handler ¢Ð  =============================================================*/
extern void _stext(void);
extern void TIMER_3_Interrupt(void);		//Timer_3 Interrupt Routine
extern void CAN_Rx_Interrupt(void);		// CAN_Rx_Interrupt
extern void CAN_Tx_Interrupt(void);		// CAN_Tx_Interrupt

/*==============	¢Ñ Interrupt Vector Table ¢Ð  =========================================================*/
struct Interrupt_Vector const _vectab[] =
{
	{0x82,	(Interrupt_Handler_1)_stext	},	//0x8000		= Reset Vector
	{0x82,	Not_Used_Interrupt		}, 	//0x8004		= TRAP (Software interrupt Vector)
	{0x82,	Not_Used_Interrupt		}, 	//IRQ0 (0x8008)	= TLI (External Top Level Interrupt)
	{0x82,	Not_Used_Interrupt		}, 	//IRQ1 (0x800C)	= AWU (Auto Wake up From Halt)
	{0x82,	Not_Used_Interrupt		}, 	//IRQ2 (0x8010)	= Clock (Main Clock Controller interrupt Vector)
	{0x82,	Not_Used_Interrupt		}, 	//IRQ3 (0x8014)	= POART_A External interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ4 (0x8018)	= POART_B External interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ5 (0x801C)	= POART_C External interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ6 (0x8020)	= POART_D External interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ7 (0x8024)	= POART_E External interrupt Vector
	{0x82,	(Interrupt_Handler_1)CAN_Rx_Interrupt		}, 	//IRQ8 (0x8028)	= CAN Rx interrupt Vector
	{0x82,	(Interrupt_Handler_1)CAN_Tx_Interrupt		}, 	//IRQ9 (0x802C)	= CAN Tx/ER/SC interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ10 (0x8030)	= SPI Transfer Compledted interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ11 (0x8034)	= TIMER_1 Update/Overflow/Trigger/Break interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ12 (0x8038)	= TIMER_1 Capture/ Compare interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ13 (0x803C)	= TIMER_2 Update/Overflow/Break interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ14 (0x8040)	= TIMER_2 Capture/ Compare interrupt Vector
	{0x82,	(Interrupt_Handler_1)TIMER_3_Interrupt		}, 	//IRQ15 (0x8044)	= TIMER_3 Update/Overflow/Break interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ16 (0x8048)	= TIMER_3 Capture/ Compare interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ17 (0x804C)	= SCI1 Tx interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ18 (0x8050)	= SCI1 Rx interrupt Vector ---> UART_Rx_Interrupt
	{0x82,	Not_Used_Interrupt		}, 	//IRQ19 (0x8054)	= I2C Peripheral Interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ20 (0x8058)	= SCI2 Tx interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ21 (0x805C)	= LINUART Receive Register DATA FULL
	{0x82,	Not_Used_Interrupt		}, 	//IRQ22 (0x8060)	= ADC Conversion Complete interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ23 (0x8064)	= TIMER_4 Update/Overflow interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ24 (0x8068)	= EEPROM ECC Correction interrupt Vector
	{0x82,	Not_Used_Interrupt		}, 	//IRQ25 (0x806C)	= Not Used
	{0x82,	Not_Used_Interrupt		}, 	//IRQ26 (0x8070)	= Not Used
	{0x82,	Not_Used_Interrupt		}, 	//IRQ27 (0x8074)	= Not Used
	{0x82,	Not_Used_Interrupt		}, 	//IRQ28 (0x8078)	= Not Used
	{0x82,	Not_Used_Interrupt		} 	//IRQ29 (0x807C)	= Not Used
};//End of Interrupt Vector Table
/*=================================================================================================
¢Ñ		Copyright¨Ï 2010. by WOORY¢â Industrial Company Limited. All Rights Reserved.		¢Ð
=================================================================================================*/
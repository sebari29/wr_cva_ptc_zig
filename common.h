/*=================================================================================================
Ｃ	Project_Name	: SAIC_EV_PTC_Software
Ｃ	Design_By	: Woory_Industrial
Ｃ	Final_Release	: 2016_04_05
=================================================================================================*/
#ifndef	__CONFIG__
#define	__CONFIG__

/*==============	Ｃ Compil_Option Ｂ ===============================================================*/
//#define DEBUG_MODE
// Based Spec: CTS V2.7
// LDF Version : V03
/*==============	Ｃ Software_Release_Information Ｂ ===================================================*/
#define	SW_VER_INF		(U16)(0x0020)

/*式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式
No.	Version		Release_Information							Release_Date
式式式式托式式式式式式式式式式式托式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式托
2. 	V00.20		1. Power Display 蹺陛							18.11.12
1.	V00.10		1. First_Release_Version						17.08.09
式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式式*/

/*==============	Ｃ Register_Size_Define Ｂ ===========================================================
	125	: is Type signed Int		125U	: is Type unsigned int
	125L	: is Type signed long	125UL	: is Type unsigned long
	1.5	: is Type double		1.5F	: is Type float
=================================================================================================*/
typedef	unsigned char	U8;			//0 ~ 255
typedef	unsigned int	U16;		//0 ~ 65,535
typedef	unsigned long	U32;		//0 ~ 4,294,967,295
typedef	signed char	S8;			//-128 ~ 127
typedef	signed int		S16;		//-32,768 ~ 32,767
typedef	signed long	S32;		//-2,147,483,648 ~ -2,147,483,648
typedef	float			F32;		// F8Byte
typedef	double		D32;		// 8Byte

/*==============	Ｃ Bit_ON_OFF_Define Ｂ ============================================================*/
#define	ON			(_Bool)(1)		//Bit_1
#define	OFF			(_Bool)(0)		//Bit_0
#define	HIGH		(_Bool)(1)		//Bit_1
#define	LOW		(_Bool)(0)		//Bit_0

/*==============	Ｃ Bit_Map_of_1Byte_Register Ｂ ======================================================*/
const struct bits
{
	unsigned		BIT0:1;		//Bit.0
	unsigned		BIT1:1;		//Bit.1
	unsigned		BIT2:1;		//Bit.2
	unsigned		BIT3:1;		//Bit.3
	unsigned		BIT4:1;		//Bit.4
	unsigned		BIT5:1;		//Bit.5
	unsigned		BIT6:1;		//Bit.6
	unsigned		BIT7:1;		//Bit.7
};//End of Bit_Define

/*==============	Ｃ Constant_Value_Define Ｂ =========================================================*/
#define FCPU_SPEED	(U8)(8)		//8MHz_System_Delay_ms_Function
#define BOOT_KEY_RAM_ADD	(U16)(0x0100)	//CPU_Reset_Bootloader_Function_Start
#define RESET_KEY_RAM_ADD	(U16)(0x0102)	//CPU_TARGET_RESET_FUNCITON_ADD
#define BOOT_KEY		(U16)(0x5AA5)		//Bootloader_Run_Key

#define FCA520_PN	(U32)(0x00014310)		// FCA520 PartNumber "MB013410" - 1310(LHD), -1320(RHD)
#define LDF_VER		(U16)(0x1709)			// FCA520 Current Sample LDF Version : 17y 09m
#define LIN_DIAG_VER	(U8)(0x22)			// LIN Protocol Cersion 2.2

/*=================================================================================================
Ｃ		Copyright使 2016. by WOORYＴ Industrial Company Limited. All Rights Reserved.		Ｂ
=================================================================================================*/
#endif

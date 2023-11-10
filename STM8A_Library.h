/*=================================================================================================
��	Project		: Parking_Heater_Remote
��	Software_Design	: Yun_Chung_Eun
��	Update		: 2010_12_28
=================================================================================================*/
#ifndef	__LIBRARY_H__
#define	__LIBRARY_H__

/*==============	�� Extern_Proto_Type ��  ============================================================*/
extern void CPU_Clock_Initialize(void);
extern void DisableInterrupts(void);
extern void EnableInterrupts(void);
extern void Windows_Watchdog_Clear(void);
extern void ADC_Enable(void);
extern unsigned int ADC_10BIT_Read(unsigned char Channel);
extern void TIMER_3_Enable(void);			//10ms Timer Interrupt
extern void CAN_Interrupt_Disable(void);		//CAN_Interrupt_All_Disable
extern void CAN_Interrupt_Enable(void);		//CAN_Interrupt_All_Enable
extern void CAN_Enable(void);			//CAN_Initialize
extern void CAN_Disable(void);
extern void CAN_Transmit_Cancel(void);
extern void CAN_Wait_Tx_Message(void);

/*=================================================================================================
��		Copyright�� 2010. by WOORY�� Industrial Company Limited. All Rights Reserved.		��
=================================================================================================*/
#endif
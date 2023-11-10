   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     ; 19 void System_On_Initialize(void)
 495                     ; 20 {
 496  0000               f_System_On_Initialize:
 498                     ; 21 	Test_Ctrl_Reset_Values();
 499  0000 8d000000      	callf	f_Test_Ctrl_Reset_Values
 501                     ; 22 	TIMER_3_Enable();			// System_Timer_Enable
 503                     ; 28 	return;
 504  0004 ac000000      	jpf	f_TIMER_3_Enable
 505                     ; 37 void Timer_10ms_Routine(void)
 505                     ; 38 {
 506  0008               f_Timer_10ms_Routine:
 508                     ; 39 	LCD_Blink_Timer_Control();
 510                     ; 41 	return;
 511  0008 ac000000      	jpf	f_LCD_Blink_Timer_Control
 512                     ; 45 void Start_Zig_Display(void)
 512                     ; 46 {
 513  000c               f_Start_Zig_Display:
 515                     ; 47 	if(b_First_Logic_On == OFF){
 516  000c 7200000033    	btjt	_uc_System_Ctrl_Reg,#0,L3
 517                     ; 49 		Set_LCD_Address(0x00);	// 1 Line Test Zig
 518  0011 4f            	clr	a
 519  0012 8d000000      	callf	f_Set_LCD_Address
 521                     ; 50 		Display_LCD_String("WOORY Industrial");
 522  0016 ae002e        	ldw	x,#L5
 523  0019 8d000000      	callf	f_Display_LCD_String
 525                     ; 52 		Set_LCD_Address(0xC0);  // 2 Line Test Zig
 526  001d a6c0          	ld	a,#192
 527  001f 8d000000      	callf	f_Set_LCD_Address
 529                     ; 53 		Display_LCD_String("AE/PS/OS/KC");
 530  0023 ae0022        	ldw	x,#L7
 531  0026 8d000000      	callf	f_Display_LCD_String
 533                     ; 55 		Set_LCD_Address(0x10);  // 3 Line Test Zig
 534  002a a610          	ld	a,#16
 535  002c 8d000000      	callf	f_Set_LCD_Address
 537                     ; 56 		Display_LCD_String("Test Ctrl Ver0.2");
 538  0030 ae0011        	ldw	x,#L11
 539  0033 8d000000      	callf	f_Display_LCD_String
 541                     ; 58 		Set_LCD_Address(0xD0);  // 4 Line Test Zig
 542  0037 a6d0          	ld	a,#208
 543  0039 8d000000      	callf	f_Set_LCD_Address
 545                     ; 59 		Display_LCD_String("18.11.13  By CJW");
 546  003d ae0000        	ldw	x,#L31
 547  0040 8d000000      	callf	f_Display_LCD_String
 549  0044               L3:
 550                     ; 61 	return;
 551  0044 87            	retf	
 552                     ; 67 void System_IO_Port_Initialize(void)
 552                     ; 68 {
 553  0045               f_System_IO_Port_Initialize:
 555                     ; 69 	EXTI_CR1 = 0B10101010;
 556  0045 35aa50a0      	mov	_EXTI_CR1,#170
 557                     ; 70 	EXTI_CR2 = 0B00000010;
 558  0049 350250a1      	mov	_EXTI_CR2,#2
 559                     ; 72 	PA_ODR	= 0B00000000;		//PORT_A all of ouput low
 560  004d 725f5000      	clr	_PA_ODR
 561                     ; 73 	PA_DDR	= 0B00000000;		//PORT_A Input / Output Selection
 562  0051 725f5002      	clr	_PA_DDR
 563                     ; 74 	PA_CR1	= 0B00000000;		//PORT_A Function Select_1
 564  0055 725f5003      	clr	_PA_CR1
 565                     ; 75 	PA_CR2	= 0B00000000;		//PORT_A Function Select_2 ;; IGN Input/Speed Signal Input
 566  0059 725f5004      	clr	_PA_CR2
 567                     ; 77 	PB_ODR	= 0B00000000;		//PORT_B all of ouput low
 568  005d 725f5005      	clr	_PB_ODR
 569                     ; 78 	PB_DDR	= 0B11111111;		//PORT_B Input / Output Selection
 570  0061 35ff5007      	mov	_PB_DDR,#255
 571                     ; 79 	PB_CR1	= 0B11111111;		//PORT_B Function Select_1
 572  0065 35ff5008      	mov	_PB_CR1,#255
 573                     ; 80 	PB_CR2	= 0B00000000;		//PORT_B Function Select_2
 574  0069 725f5009      	clr	_PB_CR2
 575                     ; 82 	PC_ODR	= 0B00000000;		//PORT_C all of ouput low
 576  006d 725f500a      	clr	_PC_ODR
 577                     ; 83 	PC_DDR	= 0B11100110;		//PORT_C Input / Output Selection
 578  0071 35e6500c      	mov	_PC_DDR,#230
 579                     ; 84 	PC_CR1	= 0B11100110;		//PORT_C Function Select_1
 580  0075 35e6500d      	mov	_PC_CR1,#230
 581                     ; 85 	PC_CR2	= 0B00000000;		//PORT_C Function Select_2
 582  0079 725f500e      	clr	_PC_CR2
 583                     ; 87 	PD_ODR	= 0B00000100;		//PORT_D all of ouput low
 584  007d 3504500f      	mov	_PD_ODR,#4
 585                     ; 88 	PD_DDR	= 0B10011101;		//PORT_D Input 0/ Output 1 Selection
 586  0081 359d5011      	mov	_PD_DDR,#157
 587                     ; 89 	PD_CR1	= 0B10011101;		//PORT_D Function Select_1
 588  0085 359d5012      	mov	_PD_CR1,#157
 589                     ; 90 	PD_CR2	= 0B00000000;		//PORT_D Function Select_2
 590  0089 725f5013      	clr	_PD_CR2
 591                     ; 92 	PE_ODR	= 0B00000000;		//PORT_E all of ouput low
 592  008d 725f5014      	clr	_PE_ODR
 593                     ; 93 	PE_DDR	= 0B01111110;		//PORT_E Input / Output Selection.
 594  0091 357e5016      	mov	_PE_DDR,#126
 595                     ; 94 	PE_CR1	= 0B01111110;		//PORT_E Function Select_1
 596  0095 357e5017      	mov	_PE_CR1,#126
 597                     ; 95 	PE_CR2	= 0B00000000;		//PORT_E Function Select_2
 598  0099 725f5018      	clr	_PE_CR2
 599                     ; 97 	PF_ODR	= 0B00000000;		//PORT_F all of ouput low
 600  009d 725f5019      	clr	_PF_ODR
 601                     ; 98 	PF_DDR	= 0B00111001;		//PORT_F Input / Output Selection.
 602  00a1 3539501b      	mov	_PF_DDR,#57
 603                     ; 99 	PF_CR1	= 0B00111001;		//PORT_F Function Select_1
 604  00a5 3539501c      	mov	_PF_CR1,#57
 605                     ; 100 	PF_CR2	= 0B00000000;		//PORT_F Function Select_2
 606  00a9 725f501d      	clr	_PF_CR2
 607                     ; 102 	PG_ODR	= 0B00000000;		//PORT_G all of ouput low
 608  00ad 725f501e      	clr	_PG_ODR
 609                     ; 103 	PG_DDR	= 0B11111000;		//PORT_G Input / Output Selection
 610  00b1 35f85020      	mov	_PG_DDR,#248
 611                     ; 104 	PG_CR1	= 0B11111000;		//PORT_G Function Select_1
 612  00b5 35f85021      	mov	_PG_CR1,#248
 613                     ; 105 	PG_CR2	= 0B00000000;		//PORT_G Function Select_2
 614  00b9 725f5022      	clr	_PG_CR2
 615                     ; 107 	PI_ODR	= 0B00000000;		//PORT_I all of ouput low
 616  00bd 725f5028      	clr	_PI_ODR
 617                     ; 108 	PI_DDR	= 0B00000001;		//PORT_I Input / Output Selection
 618  00c1 3501502a      	mov	_PI_DDR,#1
 619                     ; 109 	PI_CR1	= 0B00000001;		//PORT_I Function Select_1
 620  00c5 3501502b      	mov	_PI_CR1,#1
 621                     ; 110 	PI_CR2	= 0B00000000;		//PORT_I Function Select_2
 622  00c9 725f502c      	clr	_PI_CR2
 623                     ; 112 	ADC_TDRH = 0B00000000;
 624  00cd 725f5406      	clr	_ADC_TDRH
 625                     ; 113 	ADC_TDRL = 0B00000000;
 626  00d1 725f5407      	clr	_ADC_TDRL
 627                     ; 114 	return;
 628  00d5 87            	retf	
 629                     ; 120 void main(void)
 629                     ; 121 {
 630  00d6               f_main:
 632                     ; 122 	DisableInterrupts();				// Disable_Global_Interrupt
 633  00d6 8d000000      	callf	f_DisableInterrupts
 635                     ; 124 	Windows_Watchdog_Clear();		// Enable_Windows_Watchdog
 636  00da 8d000000      	callf	f_Windows_Watchdog_Clear
 638                     ; 125 	CPU_Clock_Initialize();			// System_Clock_Initialize
 639  00de 8d000000      	callf	f_CPU_Clock_Initialize
 641                     ; 126 	System_IO_Port_Initialize();		// IO_Port_Initialize
 642  00e2 8d450045      	callf	f_System_IO_Port_Initialize
 644                     ; 127 	System_On_Initialize();			// System_Function_Initialize
 645  00e6 8d000000      	callf	f_System_On_Initialize
 647                     ; 129 	EnableInterrupts();				// Enabled_Global_Interrupt
 648  00ea 8d000000      	callf	f_EnableInterrupts
 650                     ; 130 	LCD_Initialize();
 651  00ee 8d000000      	callf	f_LCD_Initialize
 653  00f2               L51:
 654                     ; 134 		Windows_Watchdog_Clear();	// Enabled_Windows_Watchdog	
 655  00f2 8d000000      	callf	f_Windows_Watchdog_Clear
 657                     ; 136 		if(b_System_10ms_Task){		// System_10ms_task
 658  00f6 720300002a    	btjf	_uc_System_Ctrl_Reg,#1,L12
 659                     ; 138 			Timer_10ms_Routine();
 660  00fb 8d080008      	callf	f_Timer_10ms_Routine
 662                     ; 139 			Controller_Button_Detection();
 663  00ff 8d000000      	callf	f_Controller_Button_Detection
 665                     ; 141 			if(!b_First_Logic_On){ Test_Controller_First_Routine(); }	// Controller_First_Display
 666  0103 7200000006    	btjt	_uc_System_Ctrl_Reg,#0,L32
 668  0108 8d000000      	callf	f_Test_Controller_First_Routine
 671  010c 200f          	jra	L52
 672  010e               L32:
 673                     ; 142 			else if(b_Model_Select_flag){ Model_Select_Routine(); }	// Model_Selection_Routine
 674  010e 7201000006    	btjf	_uc_Test_Ctrl_Reg,#0,L72
 676  0113 8d000000      	callf	f_Model_Select_Routine
 679  0117 2004          	jra	L52
 680  0119               L72:
 681                     ; 143 			else{ Test_Controller_Routine(); }				// Test_Controller_Routine
 682  0119 8d000000      	callf	f_Test_Controller_Routine
 684  011d               L52:
 685                     ; 145 			Controller_Button_Clear();
 686  011d 8d000000      	callf	f_Controller_Button_Clear
 688                     ; 146 			b_System_10ms_Task = OFF;	// 10ms_Task_Flag_Reset
 689  0121 72130000      	bres	_uc_System_Ctrl_Reg,#1
 690  0125               L12:
 691                     ; 149 		CAN_Management_Function();
 692  0125 8d000000      	callf	f_CAN_Management_Function
 695  0129 20c7          	jra	L51
 696                     ; 156 @far @interrupt void TIMER_3_Interrupt(void)		//10ms_Timer_Interrupt_Routine
 696                     ; 157 {
 697  012b               f_TIMER_3_Interrupt:
 699                     ; 158 	TIM3_SR1 &= 0B11111110;	 		//Pending update flag clear
 700  012b 72115322      	bres	_TIM3_SR1,#0
 701                     ; 159 	b_System_10ms_Task = ON;
 702  012f 72120000      	bset	_uc_System_Ctrl_Reg,#1
 703                     ; 160 	b_Can_10ms_Periode = ON;
 704  0133 72140000      	bset	_uc_System_Ctrl_Reg,#2
 705                     ; 162 	return;
 706  0137 80            	iret	
 707                     	xdef	f_TIMER_3_Interrupt
 708                     	xdef	f_main
 709                     	xdef	f_System_IO_Port_Initialize
 710                     	xdef	f_Timer_10ms_Routine
 711                     	xdef	f_System_On_Initialize
 712                     	switch	.bss
 713  0000               _ui_System_Timer_Cnt:
 714  0000 0000          	ds.b	2
 715                     	xdef	_ui_System_Timer_Cnt
 716                     	xdef	f_Start_Zig_Display
 717                     	xref	f_CAN_Management_Function
 718                     	xref	f_Test_Ctrl_Reset_Values
 719                     	xref	f_Test_Controller_Routine
 720                     	xref	f_Model_Select_Routine
 721                     	xref	f_Test_Controller_First_Routine
 722                     	xref	_uc_Test_Ctrl_Reg
 723                     	xref	f_Controller_Button_Detection
 724                     	xref	f_Controller_Button_Clear
 725                     	xref	f_LCD_Blink_Timer_Control
 726                     	xref	f_LCD_Initialize
 727                     	xref	f_Display_LCD_String
 728                     	xref	f_Set_LCD_Address
 729                     	xref	f_TIMER_3_Enable
 730                     	xref	f_Windows_Watchdog_Clear
 731                     	xref	f_EnableInterrupts
 732                     	xref	f_DisableInterrupts
 733                     	xref	f_CPU_Clock_Initialize
 734                     	switch	.ubsct
 735  0000               _uc_System_Ctrl_Reg:
 736  0000 00            	ds.b	1
 737                     	xdef	_uc_System_Ctrl_Reg
 738                     .const:	section	.text
 739  0000               L31:
 740  0000 31382e31312e  	dc.b	"18.11.13  By CJW",0
 741  0011               L11:
 742  0011 546573742043  	dc.b	"Test Ctrl Ver0.2",0
 743  0022               L7:
 744  0022 41452f50532f  	dc.b	"AE/PS/OS/KC",0
 745  002e               L5:
 746  002e 574f4f525920  	dc.b	"WOORY Industrial",0
 747                     	end

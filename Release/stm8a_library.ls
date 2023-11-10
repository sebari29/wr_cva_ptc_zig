   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     ; 10 void CPU_Clock_Initialize(void)
 495                     ; 11 {
 496  0000               f_CPU_Clock_Initialize:
 498                     ; 13 	if(CLK_CMSR != 0xB4){
 499  0000 c650c3        	ld	a,_CLK_CMSR
 500  0003 a1b4          	cp	a,#180
 501  0005 271e          	jreq	L3
 502                     ; 14 		CLK_SWCR = 0B00000000;	//Clock Switch Disable, Switch Interrupt Disable
 503  0007 725f50c5      	clr	_CLK_SWCR
 504                     ; 15 		CLK_SWR = 0xB4;		//High Speed External Clock, HSI(0xE1), LSI(0xD2)
 505  000b 35b450c4      	mov	_CLK_SWR,#180
 507  000f               L11:
 508                     ; 16 		while(!(CLK_SWCR & 0x08));	//SWIF
 509  000f 720750c5fb    	btjf	_CLK_SWCR,#3,L11
 510                     ; 17 		CLK_SWCR &= 0B11110111;	//Clear Switch Event
 511  0014 721750c5      	bres	_CLK_SWCR,#3
 512                     ; 18 		CLK_SWCR |= 0x02;		//by KMSHIM, clear
 513  0018 721250c5      	bset	_CLK_SWCR,#1
 515  001c               L71:
 516                     ; 19 		while(CLK_SWCR & 0x01);    	//poll SWBSY
 517  001c 720050c5fb    	btjt	_CLK_SWCR,#0,L71
 518                     ; 20 		CLK_CKDIVR = 0x00; 	//xxxIIEEE : Fmaster = HSE / 1 = 8Mhz / 1, Fcpu = 8Mhz
 519  0021 725f50c6      	clr	_CLK_CKDIVR
 520  0025               L3:
 521                     ; 23 	CLK_PCKENR1 = 0B01000000;		//TIM1 OFF, TIM3 ON, TIM2 OFF, TIM4 OFF, LINUART ON, USART OFF, SPI OFF, I2C OFF
 522  0025 354050c7      	mov	_CLK_PCKENR1,#64
 523                     ; 24 	CLK_PCKENR2 = 0B10000000;		//CAN OFF, ADC OFF, AWU OFF
 524  0029 358050ca      	mov	_CLK_PCKENR2,#128
 525                     ; 26 	return;
 526  002d 87            	retf	
 527                     ; 30 void DisableInterrupts(void)
 527                     ; 31 {
 528  002e               f_DisableInterrupts:
 530                     ; 32 	_asm("sim");			//Disable Global Interrupt
 532  002e 9b            	sim	
 534                     ; 33 	return;
 535  002f 87            	retf	
 536                     ; 37 void EnableInterrupts(void)
 536                     ; 38 {
 537  0030               f_EnableInterrupts:
 539                     ; 39 	_asm("rim");			//Enable Global Interrupt
 541  0030 9a            	rim	
 543                     ; 40 	return;
 544  0031 87            	retf	
 545                     ; 44 void Windows_Watchdog_Clear(void)
 545                     ; 45 {
 546  0032               f_Windows_Watchdog_Clear:
 548                     ; 46 	WWDG_WR = 0x7F;			//Limit Counter Value = (8Mhz / 12288) x 63 = 96.768ms
 549  0032 357f50d2      	mov	_WWDG_WR,#127
 550                     ; 47 	WWDG_CR = 0xFF;			//96.768ms, Between 0 and WATCHDOG_LIMIT, if 100ms*(8Mhz/12288) = 33
 551  0036 35ff50d1      	mov	_WWDG_CR,#255
 552                     ; 48 	return;
 553  003a 87            	retf	
 554                     ; 52 void ADC_Enable(void)
 554                     ; 53 {
 555  003b               f_ADC_Enable:
 557                     ; 54 	ADC_CR1	= 0B01000000;		//Sampleing clock = 8Mhz(Fmaster) / 8 = 1MHz, Single Mode, ADC Disable
 558  003b 35405401      	mov	_ADC_CR1,#64
 559                     ; 55 	ADC_CR2	= 0B00000000;		//External Trigger Disable, Left Alignment, Scan Disable
 560  003f 725f5402      	clr	_ADC_CR2
 561                     ; 56 	ADC_CR3	= 0B00000000;		//Buffer Disable
 562  0043 725f5403      	clr	_ADC_CR3
 563                     ; 57 	ADC_CSR	= 0B00000000;		//EOC Clear, AWD Clera, AWD Interrut Disable, EOC Interrupt Disable, Channel 0;
 564  0047 725f5400      	clr	_ADC_CSR
 565                     ; 58 	ADC_CR1 |= 0x01;			//ADC Conversion Start
 566  004b 72105401      	bset	_ADC_CR1,#0
 567                     ; 59 	return;
 568  004f 87            	retf	
 569                     ; 63 unsigned int ADC_10BIT_Read(unsigned char Channel)
 569                     ; 64 {
 570  0050               f_ADC_10BIT_Read:
 571       00000002      OFST:	set	2
 573                     ; 67 	ADC_CSR = Channel; 		//Select ADC Channel
 574  0050 c75400        	ld	_ADC_CSR,a
 575  0053 89            	pushw	x
 576                     ; 68 	ADC_CR1 |= 0x01;			//ADC Conversion Start
 577  0054 72105401      	bset	_ADC_CR1,#0
 579  0058               L52:
 580                     ; 69 	while((ADC_CSR & 0x80) == 0);	//Conversion Completed?
 581  0058 720f5400fb    	btjf	_ADC_CSR,#7,L52
 582                     ; 70 	Buffer = ADC_DRH;			//ADC Data[9:2]
 583  005d c65404        	ld	a,_ADC_DRH
 584  0060 5f            	clrw	x
 585  0061 97            	ld	xl,a
 586                     ; 71 	Buffer = (Buffer << 2) | ADC_DRL;	//ADC Data[1:0]
 587  0062 58            	sllw	x
 588  0063 58            	sllw	x
 589  0064 01            	rrwa	x,a
 590  0065 ca5405        	or	a,_ADC_DRL
 591  0068 02            	rlwa	x,a
 592                     ; 72 	return(Buffer);			//10Bit ADC Return
 594  0069 5b02          	addw	sp,#2
 595  006b 87            	retf	
 596                     ; 76 void TIMER_3_Enable(void)			//10ms Timer Interrupt
 596                     ; 77 {
 597  006c               f_TIMER_3_Enable:
 599                     ; 85 	TIM3_CR1 = 0B10000101;		//Auto Reload Enable, overflow interrut, counter enable
 600  006c 35855320      	mov	_TIM3_CR1,#133
 601                     ; 86 	TIM3_PSCR = 0x07;			//Prescaler = Fcpu / 2 ^ 3 = 8M/8 = 1M
 602  0070 3507532a      	mov	_TIM3_PSCR,#7
 603                     ; 87 	TIM3_ARRH = 0x02;			//ARR = 9999, 10000/1M = 0.01s = 10ms
 604  0074 3502532b      	mov	_TIM3_ARRH,#2
 605                     ; 88 	TIM3_ARRL = 0x70;
 606  0078 3570532c      	mov	_TIM3_ARRL,#112
 607                     ; 89 	TIM3_SR1 = 0x00;			//Pending Flag Clear
 608  007c 725f5322      	clr	_TIM3_SR1
 609                     ; 90 	TIM3_IER = 0B00000001; 		//Overflow interrupt Enable
 610  0080 35015321      	mov	_TIM3_IER,#1
 611                     ; 92 	return;
 612  0084 87            	retf	
 613                     ; 96 void CAN_Interrupt_Disable(void)		//CAN_Interrupt_All_Disable
 613                     ; 97 {
 614  0085               f_CAN_Interrupt_Disable:
 615       00000001      OFST:	set	1
 617                     ; 100 	Buffer = CAN_FPSR;			//Current_Page_Save
 618  0085 c65427        	ld	a,_CAN_FPSR
 619                     ; 101 	CAN_IER = 0x00;
 620  0088 725f5425      	clr	_CAN_IER
 621                     ; 102 	CAN_FPSR = 0x06;
 622  008c 35065427      	mov	_CAN_FPSR,#6
 623                     ; 103 	CAN_P1 = 0x00;
 624  0090 725f5429      	clr	_CAN_P1
 625                     ; 104 	CAN_FPSR = Buffer;
 626  0094 c75427        	ld	_CAN_FPSR,a
 627                     ; 105 	return;
 628  0097 87            	retf	
 629                     ; 109 void CAN_Interrupt_Enable(void)		//CAN_Interrupt_All_Enable
 629                     ; 110 {
 630  0098               f_CAN_Interrupt_Enable:
 631       00000001      OFST:	set	1
 633                     ; 113 	Buffer = CAN_FPSR;
 634  0098 c65427        	ld	a,_CAN_FPSR
 635                     ; 114 	CAN_IER = 0x0F;			//Wakeup = OFF, Overrun, FIFO Full, Message_Pending, Tx_Mail Box Empty Interrupt Enable
 636  009b 350f5425      	mov	_CAN_IER,#15
 637                     ; 115 	CAN_FPSR = 0x06;			//Configuration/Diagnostic_Page_Select
 638  009f 35065427      	mov	_CAN_FPSR,#6
 639                     ; 116 	CAN_P1 = 0x84;			//Interrupt Enable = BUS OFF = ON, Last Error Code = OFF, Error Passive = OFF, Error Wareing = OFF
 640  00a3 35845429      	mov	_CAN_P1,#132
 641                     ; 117 	CAN_FPSR = Buffer;
 642  00a7 c75427        	ld	_CAN_FPSR,a
 643                     ; 118 	return;
 644  00aa 87            	retf	
 645                     ; 122 void CAN_Enable(void)			//CAN_Initialize
 645                     ; 123 {
 646  00ab               f_CAN_Enable:
 648                     ; 125 	CAN_MCR &= 0B11111101;		//leave Sleep Mode = CPU Reset Defualt : Sleep
 649  00ab 72135420      	bres	_CAN_MCR,#1
 651  00af               L33:
 652                     ; 126 	while(CAN_MSR & 0x02);		//beCAN is in Sleep Mode
 653  00af 72025421fb    	btjt	_CAN_MSR,#1,L33
 654                     ; 129 	CAN_FPSR = 0x00;			//PSR(Page Select Register) : Tx_Mailbox_0_Page_Select
 655  00b4 725f5427      	clr	_CAN_FPSR
 656                     ; 130 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
 657  00b8 72125428      	bset	_CAN_P0,#1
 658                     ; 132 	CAN_FPSR = 0x01;			//PSR(Page Select Register) : Tx_Mailbox_1_Page_Select
 659  00bc 35015427      	mov	_CAN_FPSR,#1
 660                     ; 133 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
 661  00c0 72125428      	bset	_CAN_P0,#1
 662                     ; 135 	CAN_FPSR = 0x05;  			//PSR(Page Select Register) : Tx_Mailbox_2_Page_Select
 663  00c4 35055427      	mov	_CAN_FPSR,#5
 664                     ; 136 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
 665  00c8 72125428      	bset	_CAN_P0,#1
 666                     ; 138 	CAN_MCR |= 0x01;			//MCR(Master Control Register) : Request_Initialisation
 667  00cc 72105420      	bset	_CAN_MCR,#0
 669  00d0               L14:
 670                     ; 139 	while((CAN_MSR & 0x01) == 0);	//MSR(Master Select Regitser) : Wait_until_Acknowledged
 671  00d0 72015421fb    	btjf	_CAN_MSR,#0,L14
 672                     ; 141 	CAN_TSR |= 0B00000111;		//Clear_Request_Completed_for_Mailbox_[0:1:2]
 673  00d5 c65422        	ld	a,_CAN_TSR
 674  00d8 aa07          	or	a,#7
 675  00da c75422        	ld	_CAN_TSR,a
 677  00dd 2004          	jra	L74
 678  00df               L54:
 679                     ; 144 	while(CAN_RFR & 0x03){ CAN_RFR = 0x20; }
 680  00df 35205424      	mov	_CAN_RFR,#32
 681  00e3               L74:
 683  00e3 c65424        	ld	a,_CAN_RFR
 684  00e6 a503          	bcp	a,#3
 685  00e8 26f5          	jrne	L54
 686                     ; 146 	CAN_RFR |= 0x10;			//Clear_the_FIFO_Overrun(FOVR)_Bit
 687  00ea 72185424      	bset	_CAN_RFR,#4
 688                     ; 147 	CAN_MSR = 0x08;  			//Clear_Wake_up_Pending_Interrupt
 689  00ee 35085421      	mov	_CAN_MSR,#8
 690                     ; 148 	CAN_MCR |= 0x44;  			//Automatic_Bus_Off_Management, Tx_Priority_Driven by Request_Order
 691  00f2 c65420        	ld	a,_CAN_MCR
 692  00f5 aa44          	or	a,#68
 693  00f7 c75420        	ld	_CAN_MCR,a
 694                     ; 151 	CAN_FPSR = 0x06;  			//Configuration / Diagnostic_Page_Select
 695  00fa 35065427      	mov	_CAN_FPSR,#6
 696                     ; 152 	CAN_PA = 0x00;			//FCR1(Filter Configuration Register 1), Disable Filter 0 and Filter 1
 697  00fe 725f5432      	clr	_CAN_PA
 698                     ; 153 	CAN_PB = 0x00;			//FCR2(Filter Configuration Register 2), Disable Filter 2 and Filter 3
 699  0102 725f5433      	clr	_CAN_PB
 700                     ; 154 	CAN_PC = 0x00;			//FCR3(Filter Configuration Register 3), Disable Filter 4 and Filter 5
 701  0106 725f5434      	clr	_CAN_PC
 702                     ; 157 	CAN_P4 = 0B00000001;		//SJW[7:6] = 1, BRP[5:0] = 2
 703  010a 3501542c      	mov	_CAN_P4,#1
 704                     ; 158 	CAN_P5 = 0B00010100;		//CAN Clock Source = Fcpu(8Mhz), BS2[6:4] = 2, BS1[3:0] = 5
 705  010e 3514542d      	mov	_CAN_P5,#20
 706                     ; 161 	CAN_P8 = 0B11111111;		//FMR1(Filter Mode Register 1) = Bank_3~0 : List_Mode
 707  0112 35ff5430      	mov	_CAN_P8,#255
 708                     ; 162 	CAN_P9 = 0B00001111;		//FMR2(Filter Mode Register 2) = Bank_5~4 : List_Mode
 709  0116 350f5431      	mov	_CAN_P9,#15
 710                     ; 165 	CAN_FPSR = 0x02;
 711  011a 35025427      	mov	_CAN_FPSR,#2
 712                     ; 167 	CAN_P0 	= (U8)((CAN_HTR_STATUS1_ID & 0x7F8) >> 3);	//Rx_Filter_0
 713  011e 35285428      	mov	_CAN_P0,#40
 714                     ; 168 	CAN_P1 	= (U8)((CAN_HTR_STATUS1_ID & 0x007) << 5);
 715  0122 725f5429      	clr	_CAN_P1
 716                     ; 169 	CAN_P2 	= (U8)((CAN_HTR_STATUS2_ID & 0x7F8) >> 3);	//Rx_Filter_1
 717  0126 3528542a      	mov	_CAN_P2,#40
 718                     ; 170 	CAN_P3 	= (U8)((CAN_HTR_STATUS2_ID & 0x007) << 5);
 719  012a 3520542b      	mov	_CAN_P3,#32
 720                     ; 171 	CAN_P4 	= (U8)(0x00);	//Rx_Filter_2
 721  012e 725f542c      	clr	_CAN_P4
 722                     ; 172 	CAN_P5 	= (U8)(0x00);
 723  0132 725f542d      	clr	_CAN_P5
 724                     ; 173 	CAN_P6 	= (U8)(0x00);	//Rx_Filter_3
 725  0136 725f542e      	clr	_CAN_P6
 726                     ; 174 	CAN_P7 	= (U8)(0x00);
 727  013a 725f542f      	clr	_CAN_P7
 728                     ; 177 	CAN_P8 	= (U8)(0x00);	//Rx_Filter_5
 729  013e 725f5430      	clr	_CAN_P8
 730                     ; 178 	CAN_P9 	= (U8)(0x00);
 731  0142 725f5431      	clr	_CAN_P9
 732                     ; 179 	CAN_PA 	= (U8)(0x00);	//Rx_Filter_7
 733  0146 725f5432      	clr	_CAN_PA
 734                     ; 180 	CAN_PB 	= (U8)(0x00);
 735  014a 725f5433      	clr	_CAN_PB
 736                     ; 181 	CAN_PC 	= (U8)(0x00);	//Rx_Filter_8
 737  014e 725f5434      	clr	_CAN_PC
 738                     ; 182 	CAN_PD 	= (U8)(0x00);
 739  0152 725f5435      	clr	_CAN_PD
 740                     ; 183 	CAN_PE 	= (U8)(0x00);	//Rx_Filter_9
 741  0156 725f5436      	clr	_CAN_PE
 742                     ; 184 	CAN_PF 	= (U8)(0x00);
 743  015a 725f5437      	clr	_CAN_PF
 744                     ; 187 	CAN_FPSR = 0x03;
 745  015e 35035427      	mov	_CAN_FPSR,#3
 746                     ; 189 	CAN_P0 	= (U8)(0x00);
 747  0162 725f5428      	clr	_CAN_P0
 748                     ; 190 	CAN_P1 	= (U8)(0x00);
 749  0166 725f5429      	clr	_CAN_P1
 750                     ; 191 	CAN_P2 	= (U8)(0x00);
 751  016a 725f542a      	clr	_CAN_P2
 752                     ; 192 	CAN_P3 	= (U8)(0x00);
 753  016e 725f542b      	clr	_CAN_P3
 754                     ; 193 	CAN_P4 	= (U8)(0x00);
 755  0172 725f542c      	clr	_CAN_P4
 756                     ; 194 	CAN_P5 	= (U8)(0x00);
 757  0176 725f542d      	clr	_CAN_P5
 758                     ; 195 	CAN_P6 	= (U8)(0x00);
 759  017a 725f542e      	clr	_CAN_P6
 760                     ; 196 	CAN_P7 	= (U8)(0x00);
 761  017e 725f542f      	clr	_CAN_P7
 762                     ; 198 	CAN_P8 	= (U8)(0x00);
 763  0182 725f5430      	clr	_CAN_P8
 764                     ; 199 	CAN_P9 	= (U8)(0x00);
 765  0186 725f5431      	clr	_CAN_P9
 766                     ; 200 	CAN_PA 	= (U8)(0x00);
 767  018a 725f5432      	clr	_CAN_PA
 768                     ; 201 	CAN_PB 	= (U8)(0x00);
 769  018e 725f5433      	clr	_CAN_PB
 770                     ; 202 	CAN_PC	= (U8)(0x00);
 771  0192 725f5434      	clr	_CAN_PC
 772                     ; 203 	CAN_PD 	= (U8)(0x00);
 773  0196 725f5435      	clr	_CAN_PD
 774                     ; 204 	CAN_PE 	= (U8)(0x00);
 775  019a 725f5436      	clr	_CAN_PE
 776                     ; 205 	CAN_PF 	= (U8)(0x00);
 777  019e 725f5437      	clr	_CAN_PF
 778                     ; 207 	CAN_FPSR = 0x04; 			//Filter_Bank_4,5 Page_Select
 779  01a2 35045427      	mov	_CAN_FPSR,#4
 780                     ; 209 	CAN_P0 	= (U8)(0x00);
 781  01a6 725f5428      	clr	_CAN_P0
 782                     ; 210 	CAN_P1 	= (U8)(0x00);
 783  01aa 725f5429      	clr	_CAN_P1
 784                     ; 211 	CAN_P2 	= (U8)(0x00);
 785  01ae 725f542a      	clr	_CAN_P2
 786                     ; 212 	CAN_P3 	= (U8)(0x00);
 787  01b2 725f542b      	clr	_CAN_P3
 788                     ; 213 	CAN_P4 	= (U8)(0x00);
 789  01b6 725f542c      	clr	_CAN_P4
 790                     ; 214 	CAN_P5 	= (U8)(0x00);
 791  01ba 725f542d      	clr	_CAN_P5
 792                     ; 215 	CAN_P6 	= (U8)(0x00);
 793  01be 725f542e      	clr	_CAN_P6
 794                     ; 216 	CAN_P7 	= (U8)(0x00);
 795  01c2 725f542f      	clr	_CAN_P7
 796                     ; 218 	CAN_P8 	= (U8)(0x00);
 797  01c6 725f5430      	clr	_CAN_P8
 798                     ; 219 	CAN_P9 	= (U8)(0x00);
 799  01ca 725f5431      	clr	_CAN_P9
 800                     ; 220 	CAN_PA 	= (U8)(0x00);
 801  01ce 725f5432      	clr	_CAN_PA
 802                     ; 221 	CAN_PB 	= (U8)(0x00);
 803  01d2 725f5433      	clr	_CAN_PB
 804                     ; 222 	CAN_PC 	= (U8)(0x00);
 805  01d6 725f5434      	clr	_CAN_PC
 806                     ; 223 	CAN_PD 	= (U8)(0x00);
 807  01da 725f5435      	clr	_CAN_PD
 808                     ; 224 	CAN_PE 	= (U8)(0x00);
 809  01de 725f5436      	clr	_CAN_PE
 810                     ; 225 	CAN_PF 	= (U8)(0x00);
 811  01e2 725f5437      	clr	_CAN_PF
 812                     ; 228 	CAN_FPSR = 0x06;
 813  01e6 35065427      	mov	_CAN_FPSR,#6
 814                     ; 238 	CAN_PA = 0x55;			//Bank_1_&_0_Filter_Enable
 815  01ea 35555432      	mov	_CAN_PA,#85
 816                     ; 241 	CAN_PB = 0x00;			//Filter_Disable
 817  01ee 725f5433      	clr	_CAN_PB
 818                     ; 244 	CAN_PC = 0x00;			//Filter_Disable
 819  01f2 725f5434      	clr	_CAN_PC
 820                     ; 246 	CAN_DGR |= 0x10;			//3rd_Tx_Mailboxes_Enable
 821  01f6 72185426      	bset	_CAN_DGR,#4
 822                     ; 248 	CAN_MCR &= 0xFE;			//Leave_the_Init_Mode, that_is_switch_into_Normal_Mode
 823  01fa 72115420      	bres	_CAN_MCR,#0
 824                     ; 249 	return;
 825  01fe 87            	retf	
 826                     ; 253 void CAN_Disable(void)
 826                     ; 254 {
 827  01ff               f_CAN_Disable:
 829                     ; 255 	CAN_MCR |= 0B00000010; 		//CAN_Sleep_Reqeust
 830  01ff 72125420      	bset	_CAN_MCR,#1
 831                     ; 256 	return;
 832  0203 87            	retf	
 833                     ; 260 void CAN_Transmit_Cancel(void)
 833                     ; 261 {
 834  0204               f_CAN_Transmit_Cancel:
 835  0204 88            	push	a
 836       00000001      OFST:	set	1
 838                     ; 264 	Buffer = CAN_FPSR;
 839  0205 c65427        	ld	a,_CAN_FPSR
 840  0208 6b01          	ld	(OFST+0,sp),a
 841                     ; 266 	CAN_FPSR = 0x00; 			//Tx_Mailbox_0_Select
 842  020a 725f5427      	clr	_CAN_FPSR
 843                     ; 267 	CAN_P0 |= 0x02;			//Make_Abort_Request
 844  020e 72125428      	bset	_CAN_P0,#1
 845                     ; 269 	CAN_FPSR = 0x01;			//Tx_Mailbox_1_Select
 846  0212 35015427      	mov	_CAN_FPSR,#1
 847                     ; 270 	CAN_P0 |= 0x02;			//Make_Abort_Request
 848  0216 72125428      	bset	_CAN_P0,#1
 849                     ; 272 	CAN_FPSR = 0x05;			//Tx_Mailbox_2_Select
 850  021a 35055427      	mov	_CAN_FPSR,#5
 851                     ; 273 	CAN_P0 |= 0x02;			//Make_Abort_Request
 852  021e 72125428      	bset	_CAN_P0,#1
 853                     ; 275 	CAN_FPSR = Buffer;
 854  0222 c75427        	ld	_CAN_FPSR,a
 855                     ; 276 	return;
 856  0225 84            	pop	a
 857  0226 87            	retf	
 858                     ; 280 void CAN_Wait_Tx_Message(void)
 858                     ; 281 {
 859  0227               f_CAN_Wait_Tx_Message:
 860  0227 89            	pushw	x
 861       00000002      OFST:	set	2
 863                     ; 282 	U16 Time = 0;
 864  0228 5f            	clrw	x
 865  0229 1f01          	ldw	(OFST-1,sp),x
 867  022b 200a          	jra	L75
 868  022d               L35:
 869                     ; 286 		if(++Time > 2000){ break; }	//2ms/8MHz_Clock_Timeout
 870  022d 5c            	incw	x
 871  022e 1f01          	ldw	(OFST-1,sp),x
 872  0230 a307d1        	cpw	x,#2001
 873  0233 2502          	jrult	L75
 875  0235               L16:
 876                     ; 288 	return;
 877  0235 85            	popw	x
 878  0236 87            	retf	
 879  0237               L75:
 880                     ; 285 	while((CAN_TPR & 0x1C) != 0x1C){	//All_Mailbox_Empty?
 881  0237 c65423        	ld	a,_CAN_TPR
 882  023a a41c          	and	a,#28
 883  023c a11c          	cp	a,#28
 884  023e 26ed          	jrne	L35
 885  0240 20f3          	jra	L16
 886                     	xdef	f_CAN_Wait_Tx_Message
 887                     	xdef	f_CAN_Transmit_Cancel
 888                     	xdef	f_CAN_Disable
 889                     	xdef	f_CAN_Enable
 890                     	xdef	f_CAN_Interrupt_Enable
 891                     	xdef	f_CAN_Interrupt_Disable
 892                     	xdef	f_TIMER_3_Enable
 893                     	xdef	f_ADC_10BIT_Read
 894                     	xdef	f_ADC_Enable
 895                     	xdef	f_Windows_Watchdog_Clear
 896                     	xdef	f_EnableInterrupts
 897                     	xdef	f_DisableInterrupts
 898                     	xdef	f_CPU_Clock_Initialize
 899                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     .const:	section	.text
 496  0000               _Can_Fail_Time:
 497  0000 32            	dc.b	50
 498  0001 32            	dc.b	50
 499  0002               _Can_Msg_Length:
 500  0002 08            	dc.b	8
 501  0003 08            	dc.b	8
 502                     ; 70 void CAN_Tx_Message_Now(void)
 502                     ; 71 {
 503                     	switch	.text
 504  0000               f_CAN_Tx_Message_Now:
 506                     ; 72 	b_Can_Tx_Event = ON;
 507  0000 72180000      	bset	_uc_Can_Status_Reg,#4
 508                     ; 73 	uc_Can_Event_Counter = 0;
 509  0004 3f02          	clr	_uc_Can_Event_Counter
 510                     ; 74 	uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
 511  0006 35020003      	mov	_uc_Can_Event_Time,#2
 512                     ; 76 	return;
 513  000a 87            	retf	
 514                     ; 80 void CAN_Tx_Message_Handling(void)
 514                     ; 81 {
 515  000b               f_CAN_Tx_Message_Handling:
 516  000b 88            	push	a
 517       00000001      OFST:	set	1
 519                     ; 84 	for(uc_index = 0; uc_index < (U8)(8); uc_index++){ Can_Tx_Buffer[uc_index] = (U8)(0); }
 520  000c 4f            	clr	a
 521  000d 6b01          	ld	(OFST+0,sp),a
 522  000f               L3:
 524  000f 5f            	clrw	x
 525  0010 97            	ld	xl,a
 526  0011 724f0002      	clr	(_Can_Tx_Buffer,x)
 528  0015 0c01          	inc	(OFST+0,sp)
 530  0017 7b01          	ld	a,(OFST+0,sp)
 531  0019 a108          	cp	a,#8
 532  001b 25f2          	jrult	L3
 533                     ; 87 	Can_Tx_Buffer[0] = (U8)(uc_Heater_Enable_Flag);	// Allowance_Flag_is_always_set
 534  001d 5500000002    	mov	_Can_Tx_Buffer,_uc_Heater_Enable_Flag
 535                     ; 90 	Can_Tx_Buffer[1] = (U8)(uc_Target_Duty_Perc);
 536                     ; 92 	return;
 537  0022 84            	pop	a
 538  0023 5500000003    	mov	_Can_Tx_Buffer+1,_uc_Target_Duty_Perc
 539  0028 87            	retf	
 540                     ; 96 void CAN_Normal_Message_Handling(void)
 540                     ; 97 {
 541  0029               f_CAN_Normal_Message_Handling:
 542  0029 88            	push	a
 543       00000001      OFST:	set	1
 545                     ; 100 	if(Can_Node[HTR_STATUS1].Fail){ b_Rx1_Msg_TimeOut_Flag = ON; }
 546  002a 7201000a06    	btjf	_Can_Node,#0,L11
 548  002f 72100000      	bset	_uc_Rx_TimeOut_Reg,#0
 550  0033 2020          	jra	L31
 551  0035               L11:
 552                     ; 101 	else if(Can_Node[HTR_STATUS1].Update)
 553  0035 7203000a1b    	btjf	_Can_Node,#1,L31
 554                     ; 103 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx1_Data[uc_index] = Can_Node[HTR_STATUS1].Msg[uc_index];  }
 555  003a 4f            	clr	a
 556  003b 6b01          	ld	(OFST+0,sp),a
 557  003d               L71:
 559  003d 5f            	clrw	x
 560  003e 97            	ld	xl,a
 561  003f d6000c        	ld	a,(_Can_Node+2,x)
 562  0042 d70000        	ld	(_uc_Rx1_Data,x),a
 564  0045 0c01          	inc	(OFST+0,sp)
 566  0047 7b01          	ld	a,(OFST+0,sp)
 567  0049 a108          	cp	a,#8
 568  004b 25f0          	jrult	L71
 569                     ; 104 		b_Rx1_Msg_TimeOut_Flag = OFF;	
 570  004d 72110000      	bres	_uc_Rx_TimeOut_Reg,#0
 571                     ; 105 		Can_Node[HTR_STATUS1].Update = OFF;			//Data_Read_Panding
 572  0051 7213000a      	bres	_Can_Node,#1
 573  0055               L31:
 574                     ; 108 	if(Can_Node[HTR_STATUS2].Fail){ b_Rx2_Msg_TimeOut_Flag = ON; }
 575  0055 7201001406    	btjf	_Can_Node+10,#0,L52
 577  005a 72120000      	bset	_uc_Rx_TimeOut_Reg,#1
 579  005e 2020          	jra	L72
 580  0060               L52:
 581                     ; 109 	else if(Can_Node[HTR_STATUS2].Update)
 582  0060 720300141b    	btjf	_Can_Node+10,#1,L72
 583                     ; 111 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx2_Data[uc_index] = Can_Node[HTR_STATUS2].Msg[uc_index];  }
 584  0065 4f            	clr	a
 585  0066 6b01          	ld	(OFST+0,sp),a
 586  0068               L33:
 588  0068 5f            	clrw	x
 589  0069 97            	ld	xl,a
 590  006a d60016        	ld	a,(_Can_Node+12,x)
 591  006d d70000        	ld	(_uc_Rx2_Data,x),a
 593  0070 0c01          	inc	(OFST+0,sp)
 595  0072 7b01          	ld	a,(OFST+0,sp)
 596  0074 a108          	cp	a,#8
 597  0076 25f0          	jrult	L33
 598                     ; 112 		b_Rx2_Msg_TimeOut_Flag = OFF;
 599  0078 72130000      	bres	_uc_Rx_TimeOut_Reg,#1
 600                     ; 113 		Can_Node[HTR_STATUS2].Update = OFF;			//Data_Read_Panding
 601  007c 72130014      	bres	_Can_Node+10,#1
 602  0080               L72:
 603                     ; 116 	return;
 604  0080 84            	pop	a
 605  0081 87            	retf	
 606                     ; 120 void CAN_Fail_Handling(void)
 606                     ; 121 {
 607  0082               f_CAN_Fail_Handling:
 608  0082 88            	push	a
 609       00000001      OFST:	set	1
 611                     ; 125 	if(b_Can_Error_Pending == OFF)
 612  0083 720a000027    	btjt	_uc_Can_Status_Reg,#5,L14
 613                     ; 128 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
 614  0088 4f            	clr	a
 615  0089 6b01          	ld	(OFST+0,sp),a
 616  008b               L34:
 617                     ; 130 			Can_Node[Index].Fail = ON;		//Node_Fail
 618  008b 97            	ld	xl,a
 619  008c a60a          	ld	a,#10
 620  008e 42            	mul	x,a
 621  008f d6000a        	ld	a,(_Can_Node,x)
 622  0092 aa01          	or	a,#1
 623  0094 d7000a        	ld	(_Can_Node,x),a
 624                     ; 131 			Can_Node[Index].Update = OFF;	//Msg_Pending
 625  0097 d6000a        	ld	a,(_Can_Node,x)
 626  009a a4fd          	and	a,#253
 627  009c d7000a        	ld	(_Can_Node,x),a
 628                     ; 132 			Can_Node[Index].Timeout = 0;	//Msg_Timer_Reset
 629  009f 724f000b      	clr	(_Can_Node+1,x)
 630                     ; 128 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
 631  00a3 0c01          	inc	(OFST+0,sp)
 633  00a5 7b01          	ld	a,(OFST+0,sp)
 634  00a7 a102          	cp	a,#2
 635  00a9 25e0          	jrult	L34
 636                     ; 135 		b_Can_Error_Pending = ON;
 637  00ab 721a0000      	bset	_uc_Can_Status_Reg,#5
 638  00af               L14:
 639                     ; 137 	return;
 640  00af 84            	pop	a
 641  00b0 87            	retf	
 642                     ; 141 void CAN_Normal_Maessge_Transmit(void)
 642                     ; 142 {
 643  00b1               f_CAN_Normal_Maessge_Transmit:
 644  00b1 88            	push	a
 645       00000001      OFST:	set	1
 647                     ; 146 	if(b_Can_Tx_Event == OFF){ return;		}	//Wait_Normal_Message_Period
 648  00b2 7208000002    	btjt	_uc_Can_Status_Reg,#4,L15
 650  00b7 84            	pop	a
 651  00b8 87            	retf	
 652  00b9               L15:
 653                     ; 147 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
 654  00b9 7209542306    	btjf	_CAN_TPR,#4,L55
 656  00be 35055427      	mov	_CAN_FPSR,#5
 658  00c2 2014          	jra	L35
 659  00c4               L55:
 660                     ; 148 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
 661  00c4 7207542306    	btjf	_CAN_TPR,#3,L16
 663  00c9 35015427      	mov	_CAN_FPSR,#1
 665  00cd 2009          	jra	L35
 666  00cf               L16:
 667                     ; 149 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
 668  00cf 7205542334    	btjf	_CAN_TPR,#2,L56
 670  00d4 725f5427      	clr	_CAN_FPSR
 672  00d8               L35:
 673                     ; 153 	CAN_P2 = (U8)((CAN_HTR_CTRL_ID >> 6) & 0x1F);	//Tx_HAVC_ID_MSB
 674  00d8 3504542a      	mov	_CAN_P2,#4
 675                     ; 154 	_asm("nop");					//STM8A_CAN_Bug_Happy
 677  00dc 9d            	nop	
 679                     ; 155 	CAN_P3 = (U8)((CAN_HTR_CTRL_ID << 2) & 0xFC);	//Tx_HAVC_ID_LSB
 680  00dd 3544542b      	mov	_CAN_P3,#68
 681                     ; 156 	_asm("nop");					//STM8A_CAN_Bug_Happy
 683  00e1 9d            	nop	
 685                     ; 159 	CAN_Tx_Message_Handling();
 686  00e2 8d0b000b      	callf	f_CAN_Tx_Message_Handling
 688                     ; 161 	for(Offset = 0; Offset < 7; Offset++)	// Tx_Message_Length : 7Bytes
 689  00e6 4f            	clr	a
 690  00e7 6b01          	ld	(OFST+0,sp),a
 691  00e9               L17:
 692                     ; 163 		(&CAN_P6)[Offset] = Can_Tx_Buffer[Offset];	//MDARx(Mailbox_Data_Register_x)
 693  00e9 5f            	clrw	x
 694  00ea 97            	ld	xl,a
 695  00eb d60002        	ld	a,(_Can_Tx_Buffer,x)
 696  00ee d7542e        	ld	(_CAN_P6,x),a
 697                     ; 161 	for(Offset = 0; Offset < 7; Offset++)	// Tx_Message_Length : 7Bytes
 698  00f1 0c01          	inc	(OFST+0,sp)
 700  00f3 7b01          	ld	a,(OFST+0,sp)
 701  00f5 a107          	cp	a,#7
 702  00f7 25f0          	jrult	L17
 703                     ; 166 	CAN_P1 = 0x08;				//Tx_Data_Length
 704  00f9 35085429      	mov	_CAN_P1,#8
 705                     ; 167 	_asm("nop");					//STM8A_CAN_Bug_Happy
 708                     ; 168 	CAN_P0 |= 0x01;				//Transmit_Request
 709  00fd 72105428      	bset	_CAN_P0,#0
 710  0101 9d            	nop	
 711                     ; 169 	b_Can_Tx_Event = OFF;		//Next_Message_Transmit_Periode
 712  0102 72190000      	bres	_uc_Can_Status_Reg,#4
 713                     ; 171 	return;
 714  0106 84            	pop	a
 715  0107 87            	retf	
 716  0108               L56:
 717                     ; 150 	else{	return;			      	}	//Mailbox_All_Busy
 718  0108 84            	pop	a
 719  0109 87            	retf	
 720                     ; 176 void CAN_Bus_Off_Handling(void)
 720                     ; 177 {
 721  010a               f_CAN_Bus_Off_Handling:
 723                     ; 178 	if(uc_Can_Operation_Flow){
 724  010a 3d01          	tnz	_uc_Can_Operation_Flow
 725  010c 272e          	jreq	L77
 726                     ; 179 		Windows_Watchdog_Clear();
 727  010e 8d000000      	callf	f_Windows_Watchdog_Clear
 729                     ; 182 		if(uc_Can_Operation_Flow == 2)
 730  0112 b601          	ld	a,_uc_Can_Operation_Flow
 731  0114 a102          	cp	a,#2
 732  0116 260e          	jrne	L101
 733                     ; 184 			CAN_Interrupt_Disable();
 734  0118 8d000000      	callf	f_CAN_Interrupt_Disable
 736                     ; 185 			CAN_Transmit_Cancel();
 737  011c 8d000000      	callf	f_CAN_Transmit_Cancel
 739                     ; 186 			CAN_Disable();
 740  0120 8d000000      	callf	f_CAN_Disable
 743  0124 2012          	jra	L301
 744  0126               L101:
 745                     ; 190 		else if(uc_Can_Operation_Flow == 3)
 746  0126 b601          	ld	a,_uc_Can_Operation_Flow
 747  0128 a103          	cp	a,#3
 748  012a 260c          	jrne	L301
 749                     ; 192 			CAN_Wait_Tx_Message();
 750  012c 8d000000      	callf	f_CAN_Wait_Tx_Message
 752                     ; 193 			CAN_Disable();
 753  0130 8d000000      	callf	f_CAN_Disable
 755                     ; 194 			CAN_Interrupt_Disable();
 756  0134 8d000000      	callf	f_CAN_Interrupt_Disable
 758  0138               L301:
 759                     ; 197 		uc_Can_Status_Reg = 0;
 760  0138 3f00          	clr	_uc_Can_Status_Reg
 761                     ; 198 		uc_Can_Operation_Flow = 0;
 762  013a 3f01          	clr	_uc_Can_Operation_Flow
 763  013c               L77:
 764                     ; 200 	return;
 765  013c 87            	retf	
 766                     ; 204 void CAN_Timing_Control(void)
 766                     ; 205 {
 767  013d               f_CAN_Timing_Control:
 768  013d 89            	pushw	x
 769       00000002      OFST:	set	2
 771                     ; 209 	if(b_Can_10ms_Periode == OFF){	return;	}
 772  013e 720500007b    	btjf	_uc_System_Ctrl_Reg,#2,L511
 774                     ; 212 	b_Can_10ms_Periode = OFF;
 775  0143 72150000      	bres	_uc_System_Ctrl_Reg,#2
 776                     ; 216 	if(b_Can_TInitialize == OFF)
 777  0147 720200000e    	btjt	_uc_Can_Status_Reg,#1,L111
 778                     ; 218 		if(++uc_Can_Init_Delay >= 13){		//Ignd_On_130ms_Delay
 779  014c 3c04          	inc	_uc_Can_Init_Delay
 780  014e b604          	ld	a,_uc_Can_Init_Delay
 781  0150 a10d          	cp	a,#13
 782  0152 256a          	jrult	L511
 783                     ; 219 			b_Can_TInitialize = ON;
 784  0154 72120000      	bset	_uc_Can_Status_Reg,#1
 785  0158 2064          	jra	L511
 786  015a               L111:
 787                     ; 224 	else if(b_Can_TMsg_Start == OFF)
 788  015a 7204000014    	btjt	_uc_Can_Status_Reg,#2,L711
 789                     ; 226 		if(++uc_Can_Init_Delay >= 30){		//Ign1_On_300ms_Delay
 790  015f 3c04          	inc	_uc_Can_Init_Delay
 791  0161 b604          	ld	a,_uc_Can_Init_Delay
 792  0163 a11e          	cp	a,#30
 793  0165 2557          	jrult	L511
 794                     ; 227 			uc_Can_Init_Delay = 0;
 795  0167 3f04          	clr	_uc_Can_Init_Delay
 796                     ; 228 			b_Can_TMsg_Start = ON;
 797  0169 72140000      	bset	_uc_Can_Status_Reg,#2
 798                     ; 231 			CAN_Tx_Message_Now();
 799  016d 8d000000      	callf	f_CAN_Tx_Message_Now
 801  0171 204b          	jra	L511
 802  0173               L711:
 803                     ; 237 		if(b_Can_Tx_Event == OFF){
 804  0173 720800000e    	btjt	_uc_Can_Status_Reg,#4,L521
 805                     ; 238 			if(++uc_Can_Event_Counter >= uc_Can_Event_Time){
 806  0178 3c02          	inc	_uc_Can_Event_Counter
 807  017a b602          	ld	a,_uc_Can_Event_Counter
 808  017c b103          	cp	a,_uc_Can_Event_Time
 809  017e 2506          	jrult	L521
 810                     ; 239 				uc_Can_Event_Counter = 0;
 811  0180 3f02          	clr	_uc_Can_Event_Counter
 812                     ; 240 				b_Can_Tx_Event = ON;
 813  0182 72180000      	bset	_uc_Can_Status_Reg,#4
 814  0186               L521:
 815                     ; 245 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
 816  0186 4f            	clr	a
 817  0187 6b02          	ld	(OFST+0,sp),a
 818  0189               L131:
 819                     ; 246 			if(Can_Node[ID].Fail == OFF){
 820  0189 97            	ld	xl,a
 821  018a a60a          	ld	a,#10
 822  018c 42            	mul	x,a
 823  018d d6000a        	ld	a,(_Can_Node,x)
 824  0190 a501          	bcp	a,#1
 825  0192 2622          	jrne	L731
 826                     ; 247 				if(++Can_Node[ID].Timeout > Can_Fail_Time[ID]){
 827  0194 7b02          	ld	a,(OFST+0,sp)
 828  0196 5f            	clrw	x
 829  0197 97            	ld	xl,a
 830  0198 d60000        	ld	a,(_Can_Fail_Time,x)
 831  019b 6b01          	ld	(OFST-1,sp),a
 832  019d 7b02          	ld	a,(OFST+0,sp)
 833  019f 97            	ld	xl,a
 834  01a0 a60a          	ld	a,#10
 835  01a2 42            	mul	x,a
 836  01a3 724c000b      	inc	(_Can_Node+1,x)
 837  01a7 d6000b        	ld	a,(_Can_Node+1,x)
 838  01aa 1101          	cp	a,(OFST-1,sp)
 839  01ac 2308          	jrule	L731
 840                     ; 248 					Can_Node[ID].Fail = ON;
 841  01ae d6000a        	ld	a,(_Can_Node,x)
 842  01b1 aa01          	or	a,#1
 843  01b3 d7000a        	ld	(_Can_Node,x),a
 844  01b6               L731:
 845                     ; 245 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
 846  01b6 0c02          	inc	(OFST+0,sp)
 848  01b8 7b02          	ld	a,(OFST+0,sp)
 849  01ba a102          	cp	a,#2
 850  01bc 25cb          	jrult	L131
 851  01be               L511:
 852                     ; 254 	return;
 853  01be 85            	popw	x
 854  01bf 87            	retf	
 855                     ; 258 void CAN_Management_Function(void)
 855                     ; 259 {
 856  01c0               f_CAN_Management_Function:
 858                     ; 261 	CAN_Timing_Control();
 859  01c0 8d3d013d      	callf	f_CAN_Timing_Control
 861                     ; 264 	switch(uc_Can_Operation_Flow)
 862  01c4 b601          	ld	a,_uc_Can_Operation_Flow
 864                     ; 322 			break;
 865  01c6 270c          	jreq	L341
 866  01c8 4a            	dec	a
 867  01c9 2718          	jreq	L541
 868  01cb 4a            	dec	a
 869  01cc 272f          	jreq	L741
 870  01ce 4a            	dec	a
 871  01cf 276e          	jreq	L151
 872                     ; 321 		default :	uc_Can_Operation_Flow = 0;
 873  01d1 3f01          	clr	_uc_Can_Operation_Flow
 874                     ; 322 			break;
 875  01d3 87            	retf	
 876  01d4               L341:
 877                     ; 267 		case 0 :	uc_Can_Init_Delay = 0;
 878  01d4 b704          	ld	_uc_Can_Init_Delay,a
 879                     ; 268 			uc_Can_Status_Reg = 0;			//CAN_Control = Reset
 880  01d6 b700          	ld	_uc_Can_Status_Reg,a
 881                     ; 269 			uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
 882  01d8 35020003      	mov	_uc_Can_Event_Time,#2
 883                     ; 270 			uc_Can_Event_Counter = 0;			//Tx_Counter_Clear
 884  01dc b702          	ld	_uc_Can_Event_Counter,a
 885                     ; 271 			uc_Can_Operation_Flow = 1;
 886  01de 35010001      	mov	_uc_Can_Operation_Flow,#1
 887                     ; 272 			break;
 888  01e2 87            	retf	
 889  01e3               L541:
 890                     ; 275 		case 1 :	if(b_Can_TInitialize == ON){			//130ms_Delay_After_Ign_On
 891  01e3 7203000071    	btjf	_uc_Can_Status_Reg,#1,L751
 892                     ; 276 				Windows_Watchdog_Clear();
 893  01e8 8d000000      	callf	f_Windows_Watchdog_Clear
 895                     ; 277 				CAN_Interrupt_Disable();
 896  01ec 8d000000      	callf	f_CAN_Interrupt_Disable
 898                     ; 278 				CAN_Enable();
 899  01f0 8d000000      	callf	f_CAN_Enable
 901                     ; 279 				CAN_Interrupt_Enable();
 902  01f4 8d000000      	callf	f_CAN_Interrupt_Enable
 904                     ; 280 				uc_Can_Operation_Flow = 3;		//CAN_Operation
 905  01f8 35030001      	mov	_uc_Can_Operation_Flow,#3
 906  01fc 87            	retf	
 907  01fd               L741:
 908                     ; 285 		case 2 :	if(b_Can_Tx_Error == ON){			//Recovery_Attempt_Completed
 909  01fd 7207000020    	btjf	_uc_Can_Status_Reg,#3,L361
 910                     ; 286 				CAN_Interrupt_Disable();
 911  0202 8d000000      	callf	f_CAN_Interrupt_Disable
 913                     ; 287 				CAN_Transmit_Cancel();
 914  0206 8d000000      	callf	f_CAN_Transmit_Cancel
 916                     ; 288 				uc_Can_Event_Time = CAN_RECOVERY_TIME;
 917  020a 35080003      	mov	_uc_Can_Event_Time,#8
 918                     ; 289 				uc_Can_Event_Counter = 0;		//Tx_Counter Clear
 919  020e 3f02          	clr	_uc_Can_Event_Counter
 920                     ; 290 				b_Can_Bus_Off_Fail = ON;		//CAN_Bus = OFF
 921  0210 72100000      	bset	_uc_Can_Status_Reg,#0
 922                     ; 291 				b_Can_Error_Pending = OFF;
 923  0214 721b0000      	bres	_uc_Can_Status_Reg,#5
 924                     ; 292 				b_Can_Tx_Error = OFF;
 925  0218 72170000      	bres	_uc_Can_Status_Reg,#3
 926                     ; 293 				CAN_Interrupt_Enable();
 927  021c 8d000000      	callf	f_CAN_Interrupt_Enable
 930  0220 2019          	jra	L561
 931  0222               L361:
 932                     ; 297 			else if(b_Can_Tx_Event == ON){		//Set Flag from Timer_Interrupt
 933  0222 7209000014    	btjf	_uc_Can_Status_Reg,#4,L561
 934                     ; 298 				Windows_Watchdog_Clear();
 935  0227 8d000000      	callf	f_Windows_Watchdog_Clear
 937                     ; 299 				CAN_Interrupt_Disable();
 938  022b 8d000000      	callf	f_CAN_Interrupt_Disable
 940                     ; 300 				CAN_Enable();
 941  022f 8d000000      	callf	f_CAN_Enable
 943                     ; 301 				CAN_Interrupt_Enable();
 944  0233 8d000000      	callf	f_CAN_Interrupt_Enable
 946                     ; 302 				CAN_Normal_Maessge_Transmit();
 947  0237 8db100b1      	callf	f_CAN_Normal_Maessge_Transmit
 949  023b               L561:
 950                     ; 305 			CAN_Fail_Handling();
 952                     ; 306 			break;
 953  023b ac820082      	jpf	f_CAN_Fail_Handling
 954  023f               L151:
 955                     ; 309 		case 3 :	//CAN_Bus_Off¡æNormal
 955                     ; 310 			if(b_Can_Bus_Off_Fail == ON){
 956  023f 7201000008    	btjf	_uc_Can_Status_Reg,#0,L171
 957                     ; 311 				b_Can_Bus_Off_Fail = OFF;
 958  0244 72110000      	bres	_uc_Can_Status_Reg,#0
 959                     ; 312 				CAN_Tx_Message_Now();
 960  0248 8d000000      	callf	f_CAN_Tx_Message_Now
 962  024c               L171:
 963                     ; 316 			CAN_Normal_Message_Handling();	//CAN_Normal_Message_Rx_Data
 964  024c 8d290029      	callf	f_CAN_Normal_Message_Handling
 966                     ; 317 			if(b_Com_On_flag){ CAN_Normal_Maessge_Transmit(); }	//Transmit_Tx_Data
 967  0250 7207000004    	btjf	_uc_Test_Ctrl_Reg,#3,L751
 969  0255 8db100b1      	callf	f_CAN_Normal_Maessge_Transmit
 971  0259               L751:
 972                     ; 324 	return;
 973  0259 87            	retf	
 974                     ; 329 void Reset_Can_Function(void)
 974                     ; 330 {
 975  025a               f_Reset_Can_Function:
 977                     ; 331 	uc_Can_Init_Delay = (U8)(0);
 978  025a 3f04          	clr	_uc_Can_Init_Delay
 979                     ; 332 	uc_Can_Event_Time = (U8)(0);
 980  025c 3f03          	clr	_uc_Can_Event_Time
 981                     ; 333 	uc_Can_Event_Counter = (U8)(0);
 982  025e 3f02          	clr	_uc_Can_Event_Counter
 983                     ; 334 	uc_Can_Operation_Flow = (U8)(0);
 984  0260 3f01          	clr	_uc_Can_Operation_Flow
 985                     ; 336 	uc_Can_Status_Reg = (U8)(0);
 986  0262 3f00          	clr	_uc_Can_Status_Reg
 987                     ; 338 	return;
 988  0264 87            	retf	
 989                     	switch	.bss
 990  0000               L571_From_ID:
 991  0000 00            	ds.b	1
 992  0001               L771_Current_Page:
 993  0001 00            	ds.b	1
 994                     ; 343 @interrupt void CAN_Rx_Interrupt(void)
 994                     ; 344 {
 995                     	switch	.text
 996  0265               f_CAN_Rx_Interrupt:
 997       00000001      OFST:	set	1
 998  0265 3b0002        	push	c_x+2
 999  0268 be00          	ldw	x,c_x
1000  026a 89            	pushw	x
1001  026b 3b0002        	push	c_y+2
1002  026e be00          	ldw	x,c_y
1003  0270 89            	pushw	x
1004  0271 88            	push	a
1006                     ; 348 	CAN_Interrupt_Disable();
1007  0272 8d000000      	callf	f_CAN_Interrupt_Disable
1009                     ; 350 	Current_Page = CAN_FPSR;					//Backup_PSR(Page_Selection_Register)
1010  0276 5554270001    	mov	L771_Current_Page,_CAN_FPSR
1011                     ; 353 	if(CAN_RFR & 0x10){	 CAN_RFR |= 0x10;		}		//Clear_the_FIFO_FOVR_bit
1012  027b 7209542406    	btjf	_CAN_RFR,#4,L102
1014  0280 72185424      	bset	_CAN_RFR,#4
1016  0284 2078          	jra	L112
1017  0286               L102:
1018                     ; 356 	else if(CAN_RFR & 0x08){ CAN_RFR |= 0x08;	}		//Clear_the_FIFO_FULL_bit
1019  0286 7207542473    	btjf	_CAN_RFR,#3,L112
1021  028b 72165424      	bset	_CAN_RFR,#3
1022  028f 206d          	jra	L112
1023  0291               L702:
1024                     ; 361 		CAN_FPSR = 0x07;					//CAN_Receive_FIFO_Page_Select
1025  0291 35075427      	mov	_CAN_FPSR,#7
1026                     ; 362 		From_ID = CAN_P0;					//Read_to_Tx_Massage_ID
1027  0295 5554280000    	mov	L571_From_ID,_CAN_P0
1028                     ; 365 		if((CAN_P1 & 0x0F) != 8){ _asm("nop");	}		//All_Message_Data_Legnth = 8Byte
1029  029a c65429        	ld	a,_CAN_P1
1030  029d a40f          	and	a,#15
1031  029f a108          	cp	a,#8
1032  02a1 2703          	jreq	L512
1035  02a3 9d            	nop	
1038  02a4 204f          	jra	L712
1039  02a6               L512:
1040                     ; 368 		else if(From_ID < CAN_MSG_ID_MAX)			//Rx_Mask_ID_Filter_Match?
1041  02a6 c60000        	ld	a,L571_From_ID
1042  02a9 a102          	cp	a,#2
1043  02ab 2448          	jruge	L712
1044                     ; 370 			for(Index = 0; Index < Can_Msg_Length[From_ID]; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
1045  02ad 0f01          	clr	(OFST+0,sp)
1047  02af 201d          	jra	L722
1048  02b1               L322:
1049                     ; 371 				Can_Node[From_ID].Msg[Index] = *((&CAN_P6) + Index);
1050  02b1 c60000        	ld	a,L571_From_ID
1051  02b4 97            	ld	xl,a
1052  02b5 a60a          	ld	a,#10
1053  02b7 42            	mul	x,a
1054  02b8 01            	rrwa	x,a
1055  02b9 1b01          	add	a,(OFST+0,sp)
1056  02bb 2401          	jrnc	L611
1057  02bd 5c            	incw	x
1058  02be               L611:
1059  02be 02            	rlwa	x,a
1060  02bf 7b01          	ld	a,(OFST+0,sp)
1061  02c1 905f          	clrw	y
1062  02c3 9097          	ld	yl,a
1063  02c5 90d6542e      	ld	a,(_CAN_P6,y)
1064  02c9 d7000c        	ld	(_Can_Node+2,x),a
1065                     ; 370 			for(Index = 0; Index < Can_Msg_Length[From_ID]; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
1066  02cc 0c01          	inc	(OFST+0,sp)
1067  02ce               L722:
1069  02ce c60000        	ld	a,L571_From_ID
1070  02d1 5f            	clrw	x
1071  02d2 97            	ld	xl,a
1072  02d3 d60002        	ld	a,(_Can_Msg_Length,x)
1073  02d6 1101          	cp	a,(OFST+0,sp)
1074  02d8 22d7          	jrugt	L322
1075                     ; 375 			Can_Node[From_ID].Fail = OFF;		//Fail_Status_Clear
1076  02da c60000        	ld	a,L571_From_ID
1077  02dd 97            	ld	xl,a
1078  02de a60a          	ld	a,#10
1079  02e0 42            	mul	x,a
1080  02e1 d6000a        	ld	a,(_Can_Node,x)
1081  02e4 a4fe          	and	a,#254
1082  02e6 d7000a        	ld	(_Can_Node,x),a
1083                     ; 376 			Can_Node[From_ID].Timeout = 0;		//Rx_Error_Counter_Clear
1084  02e9 724f000b      	clr	(_Can_Node+1,x)
1085                     ; 377 			Can_Node[From_ID].Update = ON;		//New_Rx_Data
1086  02ed d6000a        	ld	a,(_Can_Node,x)
1087  02f0 aa02          	or	a,#2
1088  02f2 d7000a        	ld	(_Can_Node,x),a
1089  02f5               L712:
1090                     ; 380 		CAN_RFR |= 0x20;					//Release_FIFO
1091  02f5 721a5424      	bset	_CAN_RFR,#5
1093  02f9               L532:
1094                     ; 381 		while(CAN_RFR & 0x20);				//Release_Completed?
1095  02f9 720a5424fb    	btjt	_CAN_RFR,#5,L532
1096  02fe               L112:
1097                     ; 359 	while(CAN_RFR & 0x03)					//CAN_Received?
1098  02fe c65424        	ld	a,_CAN_RFR
1099  0301 a503          	bcp	a,#3
1100  0303 268c          	jrne	L702
1101                     ; 384 	CAN_FPSR = Current_Page;
1102  0305 5500015427    	mov	_CAN_FPSR,L771_Current_Page
1103                     ; 386 	CAN_Interrupt_Enable();
1104  030a 8d000000      	callf	f_CAN_Interrupt_Enable
1106                     ; 387 	return;
1107  030e 84            	pop	a
1108  030f 85            	popw	x
1109  0310 bf00          	ldw	c_y,x
1110  0312 320002        	pop	c_y+2
1111  0315 85            	popw	x
1112  0316 bf00          	ldw	c_x,x
1113  0318 320002        	pop	c_x+2
1114  031b 80            	iret	
1115                     ; 391 @interrupt void CAN_Tx_Interrupt(void)
1115                     ; 392 {
1116  031c               f_CAN_Tx_Interrupt:
1118                     ; 394 	if(CAN_MSR & 0x08){ CAN_MSR |= 0x08;		}		//Clear_Wakeup_Flag
1119  031c 7207542104    	btjf	_CAN_MSR,#3,L142
1121  0321 72165421      	bset	_CAN_MSR,#3
1122  0325               L142:
1123                     ; 397 	if(CAN_MSR & 0x04)
1124  0325 720554210c    	btjf	_CAN_MSR,#2,L342
1125                     ; 399 		CAN_MSR |= 0x04;					//Clear_Error_Flag
1126  032a 72145421      	bset	_CAN_MSR,#2
1127                     ; 400 		b_Can_Tx_Error = ON;				//CAN_Tx_Error_Flag = ON
1128  032e 72160000      	bset	_uc_Can_Status_Reg,#3
1129                     ; 401 		uc_Can_Operation_Flow = 2;				//Recover_Mode
1130  0332 35020001      	mov	_uc_Can_Operation_Flow,#2
1131  0336               L342:
1132                     ; 405 	if(CAN_TSR & 0x01)
1133  0336 720154220d    	btjf	_CAN_TSR,#0,L542
1134                     ; 408 		if(CAN_TSR & 0x10){
1135  033b 7209542204    	btjf	_CAN_TSR,#4,L742
1136                     ; 409 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
1137  0340 35030001      	mov	_uc_Can_Operation_Flow,#3
1138  0344               L742:
1139                     ; 412 		CAN_TSR |= 0x01;					//Clear_Interrupt_Flag
1140  0344 72105422      	bset	_CAN_TSR,#0
1141  0348               L542:
1142                     ; 416 	if(CAN_TSR & 0x02)
1143  0348 720354220d    	btjf	_CAN_TSR,#1,L152
1144                     ; 419 		if(CAN_TSR & 0x20){
1145  034d 720b542204    	btjf	_CAN_TSR,#5,L352
1146                     ; 420 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
1147  0352 35030001      	mov	_uc_Can_Operation_Flow,#3
1148  0356               L352:
1149                     ; 423 		CAN_TSR |= 0x02;					//Clear_Interrupt_Flag
1150  0356 72125422      	bset	_CAN_TSR,#1
1151  035a               L152:
1152                     ; 427 	if(CAN_TSR & 0x04)
1153  035a 720554220d    	btjf	_CAN_TSR,#2,L552
1154                     ; 430 		if(CAN_TSR & 0x40){
1155  035f 720d542204    	btjf	_CAN_TSR,#6,L752
1156                     ; 431 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
1157  0364 35030001      	mov	_uc_Can_Operation_Flow,#3
1158  0368               L752:
1159                     ; 434 		CAN_TSR |= 0x04;					//Clear_Interrupt_Flag
1160  0368 72145422      	bset	_CAN_TSR,#2
1161  036c               L552:
1162                     ; 436 	return;
1163  036c 80            	iret	
1164                     	xdef	f_CAN_Tx_Interrupt
1165                     	xdef	f_CAN_Rx_Interrupt
1166                     	xdef	f_CAN_Normal_Message_Handling
1167                     	xdef	f_CAN_Normal_Maessge_Transmit
1168                     	xdef	f_CAN_Tx_Message_Handling
1169                     	xdef	f_CAN_Tx_Message_Now
1170                     	xdef	f_CAN_Timing_Control
1171                     	xdef	f_CAN_Fail_Handling
1172                     	switch	.ubsct
1173  0000               _uc_Can_Status_Reg:
1174  0000 00            	ds.b	1
1175                     	xdef	_uc_Can_Status_Reg
1176  0001               _uc_Can_Operation_Flow:
1177  0001 00            	ds.b	1
1178                     	xdef	_uc_Can_Operation_Flow
1179  0002               _uc_Can_Event_Counter:
1180  0002 00            	ds.b	1
1181                     	xdef	_uc_Can_Event_Counter
1182  0003               _uc_Can_Event_Time:
1183  0003 00            	ds.b	1
1184                     	xdef	_uc_Can_Event_Time
1185  0004               _uc_Can_Init_Delay:
1186  0004 00            	ds.b	1
1187                     	xdef	_uc_Can_Init_Delay
1188                     	switch	.bss
1189  0002               _Can_Tx_Buffer:
1190  0002 000000000000  	ds.b	8
1191                     	xdef	_Can_Tx_Buffer
1192                     	xdef	_Can_Msg_Length
1193                     	xdef	_Can_Fail_Time
1194  000a               _Can_Node:
1195  000a 000000000000  	ds.b	20
1196                     	xdef	_Can_Node
1197                     	xdef	f_Reset_Can_Function
1198                     	xdef	f_CAN_Management_Function
1199                     	xdef	f_CAN_Bus_Off_Handling
1200                     	xref	_uc_Rx2_Data
1201                     	xref	_uc_Rx1_Data
1202                     	xref	_uc_Heater_Enable_Flag
1203                     	xref	_uc_Target_Duty_Perc
1204                     	xref	_uc_Rx_TimeOut_Reg
1205                     	xref	_uc_Test_Ctrl_Reg
1206                     	xref	f_CAN_Wait_Tx_Message
1207                     	xref	f_CAN_Transmit_Cancel
1208                     	xref	f_CAN_Disable
1209                     	xref	f_CAN_Enable
1210                     	xref	f_CAN_Interrupt_Enable
1211                     	xref	f_CAN_Interrupt_Disable
1212                     	xref	f_Windows_Watchdog_Clear
1213                     	xref	_uc_System_Ctrl_Reg
1214                     	xref.b	c_x
1215                     	xref.b	c_y
1216                     	end

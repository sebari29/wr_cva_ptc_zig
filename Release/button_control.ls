   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     ; 30 void ONOFF_Button_Detection(void)
 495                     ; 31 {
 496  0000               f_ONOFF_Button_Detection:
 498                     ; 32 	if(io_ONOFF_STATUS_INPUT == LOW){ uc_ONOFF_BT_Cnt++; }
 499  0000 7206500105    	btjt	_PA_IDR,#3,L3
 501  0005 725c0004      	inc	_uc_ONOFF_BT_Cnt
 503  0009 87            	retf	
 504  000a               L3:
 505                     ; 34 		if(uc_ONOFF_BT_Cnt > BUTTON_FLT){ b_ONOFF_Button_Flag = ON; }		// filtering_30ms
 506  000a c60004        	ld	a,_uc_ONOFF_BT_Cnt
 507  000d a104          	cp	a,#4
 508  000f 2504          	jrult	L7
 510  0011 72100007      	bset	_uc_Button_Status_Reg,#0
 511  0015               L7:
 512                     ; 35 		uc_ONOFF_BT_Cnt = (U8)(0);
 513  0015 725f0004      	clr	_uc_ONOFF_BT_Cnt
 514                     ; 38 	return;
 515  0019 87            	retf	
 516                     ; 43 void Up_Button_Detection(void)
 516                     ; 44 {
 517  001a               f_Up_Button_Detection:
 519                     ; 45 	if(io_UP_STATUS_INPUT == LOW){ 
 520  001a 7208500124    	btjt	_PA_IDR,#4,L11
 521                     ; 46 		uc_Up_BT_Cnt++;
 522  001f 725c0003      	inc	_uc_Up_BT_Cnt
 523                     ; 48 		if(b_Up_Long_Button_Flag){
 524  0023 c60003        	ld	a,_uc_Up_BT_Cnt
 525  0026 720100060a    	btjf	_uc_Button_Status_Reg2,#0,L31
 526                     ; 49 			if(uc_Up_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
 527  002b a104          	cp	a,#4
 528  002d 2527          	jrult	L32
 529                     ; 50 				b_UP_Button_Flag = ON; 
 530  002f 72120007      	bset	_uc_Button_Status_Reg,#1
 531                     ; 51 				uc_Up_BT_Cnt = (U8)(0);
 532  0033 201d          	jpf	LC001
 533  0035               L31:
 534                     ; 54 			if(uc_Up_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
 535  0035 a133          	cp	a,#51
 536  0037 251d          	jrult	L32
 537                     ; 55 				b_UP_Button_Flag = ON;
 538  0039 72120007      	bset	_uc_Button_Status_Reg,#1
 539                     ; 56 				b_Up_Long_Button_Flag = ON;
 540  003d 72100006      	bset	_uc_Button_Status_Reg2,#0
 541                     ; 57 				uc_Up_BT_Cnt = (U8)(0);
 542  0041 200f          	jpf	LC001
 543  0043               L11:
 544                     ; 62 		if(uc_Up_BT_Cnt > BUTTON_FLT){	// filtering_30ms
 545  0043 c60003        	ld	a,_uc_Up_BT_Cnt
 546  0046 a104          	cp	a,#4
 547  0048 2504          	jrult	L52
 548                     ; 63 			b_UP_Button_Flag = ON;
 549  004a 72120007      	bset	_uc_Button_Status_Reg,#1
 550  004e               L52:
 551                     ; 65 		b_Up_Long_Button_Flag = OFF;
 552  004e 72110006      	bres	_uc_Button_Status_Reg2,#0
 553                     ; 66 		uc_Up_BT_Cnt = (U8)(0);
 554  0052               LC001:
 555  0052 725f0003      	clr	_uc_Up_BT_Cnt
 556  0056               L32:
 557                     ; 69 	return;
 558  0056 87            	retf	
 559                     ; 74 void Down_Button_Detection(void)
 559                     ; 75 {
 560  0057               f_Down_Button_Detection:
 562                     ; 76 	if(io_DOWN_STATUS_INPUT == LOW){ 
 563  0057 720a500124    	btjt	_PA_IDR,#5,L72
 564                     ; 77 		uc_DN_BT_Cnt++;
 565  005c 725c0002      	inc	_uc_DN_BT_Cnt
 566                     ; 79 		if(b_Down_Long_Button_Flag){
 567  0060 c60002        	ld	a,_uc_DN_BT_Cnt
 568  0063 720300060a    	btjf	_uc_Button_Status_Reg2,#1,L13
 569                     ; 80 			if(uc_DN_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
 570  0068 a104          	cp	a,#4
 571  006a 2527          	jrult	L14
 572                     ; 81 				b_DOWN_Button_Flag = ON; 
 573  006c 72140007      	bset	_uc_Button_Status_Reg,#2
 574                     ; 82 				uc_DN_BT_Cnt = (U8)(0);
 575  0070 201d          	jpf	LC002
 576  0072               L13:
 577                     ; 86 			if(uc_DN_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
 578  0072 a133          	cp	a,#51
 579  0074 251d          	jrult	L14
 580                     ; 87 				b_DOWN_Button_Flag = ON;
 581  0076 72140007      	bset	_uc_Button_Status_Reg,#2
 582                     ; 88 				b_Down_Long_Button_Flag = ON;
 583  007a 72120006      	bset	_uc_Button_Status_Reg2,#1
 584                     ; 89 				uc_DN_BT_Cnt = (U8)(0);
 585  007e 200f          	jpf	LC002
 586  0080               L72:
 587                     ; 94 		if(uc_DN_BT_Cnt > BUTTON_FLT){	// filtering_30ms
 588  0080 c60002        	ld	a,_uc_DN_BT_Cnt
 589  0083 a104          	cp	a,#4
 590  0085 2504          	jrult	L34
 591                     ; 95 			b_DOWN_Button_Flag = ON;
 592  0087 72140007      	bset	_uc_Button_Status_Reg,#2
 593  008b               L34:
 594                     ; 98 		b_Down_Long_Button_Flag = OFF;
 595  008b 72130006      	bres	_uc_Button_Status_Reg2,#1
 596                     ; 99 		uc_DN_BT_Cnt = (U8)(0);
 597  008f               LC002:
 598  008f 725f0002      	clr	_uc_DN_BT_Cnt
 599  0093               L14:
 600                     ; 102 	return;
 601  0093 87            	retf	
 602                     ; 107 void Set_Button_Detection(void)
 602                     ; 108 {
 603  0094               f_Set_Button_Detection:
 605                     ; 109 	if(io_SET_STATUS_INPUT == LOW){ uc_Set_BT_Cnt++; }
 606  0094 720c500105    	btjt	_PA_IDR,#6,L54
 608  0099 725c0005      	inc	_uc_Set_BT_Cnt
 610  009d 87            	retf	
 611  009e               L54:
 612                     ; 111 		if(uc_Set_BT_Cnt > BUTTON_FLT){ b_SET_Button_Flag = ON; }		// filtering_30ms
 613  009e c60005        	ld	a,_uc_Set_BT_Cnt
 614  00a1 a104          	cp	a,#4
 615  00a3 2504          	jrult	L15
 617  00a5 72160007      	bset	_uc_Button_Status_Reg,#3
 618  00a9               L15:
 619                     ; 112 		uc_Set_BT_Cnt = (U8)(0);
 620  00a9 725f0005      	clr	_uc_Set_BT_Cnt
 621                     ; 115 	return;
 622  00ad 87            	retf	
 623                     ; 120 void Option_Button_Detection(void)
 623                     ; 121 {
 624  00ae               f_Option_Button_Detection:
 626                     ; 122 	if(io_OPTION_STATUS_INPUT == LOW){ uc_OP_BT_Cnt++; }
 627  00ae 720e501a05    	btjt	_PF_IDR,#7,L35
 629  00b3 725c0001      	inc	_uc_OP_BT_Cnt
 631  00b7 87            	retf	
 632  00b8               L35:
 633                     ; 124 		if(uc_OP_BT_Cnt > BUTTON_FLT){ b_OPTION_Button_Flag = ON; }		// filtering_30ms
 634  00b8 c60001        	ld	a,_uc_OP_BT_Cnt
 635  00bb a104          	cp	a,#4
 636  00bd 2504          	jrult	L75
 638  00bf 72180007      	bset	_uc_Button_Status_Reg,#4
 639  00c3               L75:
 640                     ; 125 		uc_OP_BT_Cnt = (U8)(0);
 641  00c3 725f0001      	clr	_uc_OP_BT_Cnt
 642                     ; 128 	return;
 643  00c7 87            	retf	
 644                     ; 133 void Enter_Button_Detection(void)
 644                     ; 134 {
 645  00c8               f_Enter_Button_Detection:
 647                     ; 135 	if(io_ENTER_STATUS_INPUT == LOW){ uc_En_BT_Cnt++; }
 648  00c8 720c501a05    	btjt	_PF_IDR,#6,L16
 650  00cd 725c0000      	inc	_uc_En_BT_Cnt
 652  00d1 87            	retf	
 653  00d2               L16:
 654                     ; 137 		if(uc_En_BT_Cnt > BUTTON_FLT){ b_ENTER_Button_Flag = ON; }		// filtering_30ms
 655  00d2 c60000        	ld	a,_uc_En_BT_Cnt
 656  00d5 a104          	cp	a,#4
 657  00d7 2504          	jrult	L56
 659  00d9 721a0007      	bset	_uc_Button_Status_Reg,#5
 660  00dd               L56:
 661                     ; 138 		uc_En_BT_Cnt = (U8)(0);
 662  00dd 725f0000      	clr	_uc_En_BT_Cnt
 663                     ; 141 	return;
 664  00e1 87            	retf	
 665                     ; 145 void Controller_Button_Clear(void)
 665                     ; 146 {
 666  00e2               f_Controller_Button_Clear:
 668                     ; 147 	uc_Button_Status_Reg = 0x00;
 669  00e2 725f0007      	clr	_uc_Button_Status_Reg
 670                     ; 149 	return;
 671  00e6 87            	retf	
 672                     ; 154 void Controller_Button_Detection(void)
 672                     ; 155 {
 673  00e7               f_Controller_Button_Detection:
 675                     ; 156 	ONOFF_Button_Detection();
 676  00e7 8d000000      	callf	f_ONOFF_Button_Detection
 678                     ; 157 	Up_Button_Detection();
 679  00eb 8d1a001a      	callf	f_Up_Button_Detection
 681                     ; 158 	Down_Button_Detection();
 682  00ef 8d570057      	callf	f_Down_Button_Detection
 684                     ; 159 	Set_Button_Detection();
 685  00f3 8d940094      	callf	f_Set_Button_Detection
 687                     ; 160 	Option_Button_Detection();
 688  00f7 8dae00ae      	callf	f_Option_Button_Detection
 690                     ; 161 	Enter_Button_Detection();
 692                     ; 163 	return;
 693  00fb 20cb          	jpf	f_Enter_Button_Detection
 694                     	xdef	f_Enter_Button_Detection
 695                     	xdef	f_Option_Button_Detection
 696                     	xdef	f_Set_Button_Detection
 697                     	xdef	f_Down_Button_Detection
 698                     	xdef	f_Up_Button_Detection
 699                     	xdef	f_ONOFF_Button_Detection
 700                     	switch	.bss
 701  0000               _uc_En_BT_Cnt:
 702  0000 00            	ds.b	1
 703                     	xdef	_uc_En_BT_Cnt
 704  0001               _uc_OP_BT_Cnt:
 705  0001 00            	ds.b	1
 706                     	xdef	_uc_OP_BT_Cnt
 707  0002               _uc_DN_BT_Cnt:
 708  0002 00            	ds.b	1
 709                     	xdef	_uc_DN_BT_Cnt
 710  0003               _uc_Up_BT_Cnt:
 711  0003 00            	ds.b	1
 712                     	xdef	_uc_Up_BT_Cnt
 713  0004               _uc_ONOFF_BT_Cnt:
 714  0004 00            	ds.b	1
 715                     	xdef	_uc_ONOFF_BT_Cnt
 716  0005               _uc_Set_BT_Cnt:
 717  0005 00            	ds.b	1
 718                     	xdef	_uc_Set_BT_Cnt
 719                     	xdef	f_Controller_Button_Detection
 720                     	xdef	f_Controller_Button_Clear
 721  0006               _uc_Button_Status_Reg2:
 722  0006 00            	ds.b	1
 723                     	xdef	_uc_Button_Status_Reg2
 724  0007               _uc_Button_Status_Reg:
 725  0007 00            	ds.b	1
 726                     	xdef	_uc_Button_Status_Reg
 727                     	end

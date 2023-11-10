   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     	switch	.data
 496  0000               _LCD_Line:
 497  0000 00            	dc.b	0
 498  0001 c0            	dc.b	192
 499  0002 10            	dc.b	16
 500  0003 d0            	dc.b	208
 501                     ; 27 void LCD_Blink_Timer_Control(void)
 501                     ; 28 {
 502                     	switch	.text
 503  0000               f_LCD_Blink_Timer_Control:
 505                     ; 29 	ui_blink_timer_cnt++;
 506  0000 725c0000      	inc	_ui_blink_timer_cnt
 507                     ; 31 	if((ui_blink_timer_cnt % (U16)(10)) == (U16)(0)){ b_Blink_100_Flag ^= ON; Clear_Display_LCD();}
 508  0004 5f            	clrw	x
 509  0005 c60000        	ld	a,_ui_blink_timer_cnt
 510  0008 97            	ld	xl,a
 511  0009 90ae000a      	ldw	y,#10
 512  000d 65            	divw	x,y
 513  000e 905d          	tnzw	y
 514  0010 2608          	jrne	L3
 516  0012 90100041      	bcpl	_uc_LCD_Blink_Reg,#0
 518  0016 8df300f3      	callf	f_Clear_Display_LCD
 520  001a               L3:
 521                     ; 32 	if((ui_blink_timer_cnt % (U16)(25)) == (U16)(0)){ b_Blink_250_Flag ^= ON; }
 522  001a c60000        	ld	a,_ui_blink_timer_cnt
 523  001d 5f            	clrw	x
 524  001e 97            	ld	xl,a
 525  001f 90ae0019      	ldw	y,#25
 526  0023 65            	divw	x,y
 527  0024 905d          	tnzw	y
 528  0026 2604          	jrne	L5
 530  0028 90120041      	bcpl	_uc_LCD_Blink_Reg,#1
 531  002c               L5:
 532                     ; 33 	if((ui_blink_timer_cnt % (U16)(50)) == (U16)(0)){ b_Blink_500_Flag ^= ON; }
 533  002c c60000        	ld	a,_ui_blink_timer_cnt
 534  002f 5f            	clrw	x
 535  0030 97            	ld	xl,a
 536  0031 90ae0032      	ldw	y,#50
 537  0035 65            	divw	x,y
 538  0036 905d          	tnzw	y
 539  0038 2604          	jrne	L7
 541  003a 90140041      	bcpl	_uc_LCD_Blink_Reg,#2
 542  003e               L7:
 543                     ; 34 	if((ui_blink_timer_cnt % (U16)(100)) == (U16)(0)){ b_Blink_1s_Flag ^= ON; }
 544  003e c60000        	ld	a,_ui_blink_timer_cnt
 545  0041 5f            	clrw	x
 546  0042 97            	ld	xl,a
 547  0043 90ae0064      	ldw	y,#100
 548  0047 65            	divw	x,y
 549  0048 905d          	tnzw	y
 550  004a 2604          	jrne	L11
 552  004c 90160041      	bcpl	_uc_LCD_Blink_Reg,#3
 553  0050               L11:
 554                     ; 35 	if((ui_blink_timer_cnt % (U16)(200)) == (U16)(0)){ 
 555  0050 c60000        	ld	a,_ui_blink_timer_cnt
 556  0053 5f            	clrw	x
 557  0054 97            	ld	xl,a
 558  0055 a6c8          	ld	a,#200
 559  0057 62            	div	x,a
 560  0058 5f            	clrw	x
 561  0059 97            	ld	xl,a
 562  005a 5d            	tnzw	x
 563  005b 2608          	jrne	L31
 564                     ; 36 		b_Blink_2s_Flag ^= ON; 
 565  005d 90180041      	bcpl	_uc_LCD_Blink_Reg,#4
 566                     ; 37 		ui_blink_timer_cnt = 0;
 567  0061 725f0000      	clr	_ui_blink_timer_cnt
 568  0065               L31:
 569                     ; 40 	return;
 570  0065 87            	retf	
 571                     ; 45 void Delay_ms(U8 Delay)
 571                     ; 46 {
 572  0066               f_Delay_ms:
 573  0066 88            	push	a
 574  0067 89            	pushw	x
 575       00000002      OFST:	set	2
 577  0068               L51:
 578                     ; 48 	do{	i = 8;
 579  0068 a608          	ld	a,#8
 580  006a 6b02          	ld	(OFST+0,sp),a
 581                     ; 49 	Windows_Watchdog_Clear();
 582  006c 8d000000      	callf	f_Windows_Watchdog_Clear
 584  0070 a6fb          	ld	a,#251
 585  0072               L32:
 586                     ; 50 		do{ Delay_us(250);  }while(--i);
 587  0072 6b01          	ld	(OFST-1,sp),a
 589  0074               L53:
 591  0074 0a01          	dec	(OFST-1,sp)
 592  0076 26fc          	jrne	L53
 594  0078 0a02          	dec	(OFST+0,sp)
 595  007a 26f6          	jrne	L32
 596                     ; 51 	}while(--Delay);
 597  007c 0a03          	dec	(OFST+1,sp)
 598  007e 26e8          	jrne	L51
 599                     ; 52 	return;
 600  0080 5b03          	addw	sp,#3
 601  0082 87            	retf	
 602                     ; 56 void Set_LCD_Command(U8 Cmd)
 602                     ; 57 {
 603  0083               f_Set_LCD_Command:
 604       00000001      OFST:	set	1
 606                     ; 58 	LCD_Data	= Cmd;
 607  0083 c75005        	ld	_PB_ODR,a
 608  0086 88            	push	a
 609                     ; 59 	LCD_EN	= 1;
 610  0087 72165019      	bset	_PF_ODR,#3
 611                     ; 60 	Delay_us(150);//100
 612  008b a697          	ld	a,#151
 613  008d 6b01          	ld	(OFST+0,sp),a
 615  008f               L54:
 617  008f 0a01          	dec	(OFST+0,sp)
 618  0091 26fc          	jrne	L54
 619                     ; 61 	LCD_EN	= 0;
 620  0093 72175019      	bres	_PF_ODR,#3
 621                     ; 62 	return;
 622  0097 84            	pop	a
 623  0098 87            	retf	
 624                     ; 66 void Set_LCD_Address(U8 Add)
 624                     ; 67 {
 625  0099               f_Set_LCD_Address:
 626  0099 88            	push	a
 627       00000001      OFST:	set	1
 629                     ; 68 	LCD_Data	= (unsigned char)(Add | 0x80);
 630  009a aa80          	or	a,#128
 631  009c c75005        	ld	_PB_ODR,a
 632                     ; 69 	LCD_EN	= 1;
 633                     ; 70 	Delay_us(150);//100
 634  009f a697          	ld	a,#151
 635  00a1 72165019      	bset	_PF_ODR,#3
 636  00a5 6b01          	ld	(OFST+0,sp),a
 638  00a7               L55:
 640  00a7 0a01          	dec	(OFST+0,sp)
 641  00a9 26fc          	jrne	L55
 642                     ; 71 	LCD_EN	= 0;
 643  00ab 72175019      	bres	_PF_ODR,#3
 644                     ; 72 	return;
 645  00af 84            	pop	a
 646  00b0 87            	retf	
 647                     ; 76 void Display_LCD_Data(U8 Data)
 647                     ; 77 {
 648  00b1               f_Display_LCD_Data:
 649       00000001      OFST:	set	1
 651                     ; 78 	LCD_Data = Data;
 652  00b1 c75005        	ld	_PB_ODR,a
 653                     ; 79 	LCD_RS = 1;
 654  00b4 721a5019      	bset	_PF_ODR,#5
 655  00b8 88            	push	a
 656                     ; 80 	LCD_EN = 1;
 657  00b9 72165019      	bset	_PF_ODR,#3
 658                     ; 81 	Delay_us(150);
 659  00bd a697          	ld	a,#151
 660  00bf 6b01          	ld	(OFST+0,sp),a
 662  00c1               L56:
 664  00c1 0a01          	dec	(OFST+0,sp)
 665  00c3 26fc          	jrne	L56
 666                     ; 82 	LCD_EN = 0;
 667  00c5 72175019      	bres	_PF_ODR,#3
 668                     ; 83 	LCD_RS = 0;
 669                     ; 84 	return;
 670  00c9 84            	pop	a
 671  00ca 721b5019      	bres	_PF_ODR,#5
 672  00ce 87            	retf	
 673                     ; 88 void Display_LCD_String(U8 *str)
 673                     ; 89 {
 674  00cf               f_Display_LCD_String:
 675  00cf 89            	pushw	x
 676       00000000      OFST:	set	0
 678  00d0 2009          	jra	L57
 679  00d2               L17:
 680                     ; 90 	for(; *str;){ Display_LCD_Data(*str++);	}
 681  00d2 5c            	incw	x
 682  00d3 1f01          	ldw	(OFST+1,sp),x
 683  00d5 5a            	decw	x
 684  00d6 f6            	ld	a,(x)
 685  00d7 8db100b1      	callf	f_Display_LCD_Data
 687  00db               L57:
 689  00db 1e01          	ldw	x,(OFST+1,sp)
 690  00dd f6            	ld	a,(x)
 691  00de 26f2          	jrne	L17
 692                     ; 91 	return;
 693  00e0 85            	popw	x
 694  00e1 87            	retf	
 695                     ; 95 void Display_Clear(void)
 695                     ; 96 {
 696  00e2               f_Display_Clear:
 698                     ; 97 	LCD_RS = OFF;
 699  00e2 721b5019      	bres	_PF_ODR,#5
 700                     ; 98 	LCD_RW = OFF;
 701  00e6 72195019      	bres	_PF_ODR,#4
 702                     ; 99 	LCD_EN= OFF;
 703  00ea 72175019      	bres	_PF_ODR,#3
 704                     ; 100 	LCD_Data = 0x01;
 705  00ee 35015005      	mov	_PB_ODR,#1
 706                     ; 102 	return;
 707  00f2 87            	retf	
 708                     ; 107 void Clear_Display_LCD(void)
 708                     ; 108 {
 709  00f3               f_Clear_Display_LCD:
 711                     ; 109 	Set_LCD_Address(0x00);	// 1 Line Test Zig
 712  00f3 4f            	clr	a
 713  00f4 8d990099      	callf	f_Set_LCD_Address
 715                     ; 110 	Display_LCD_String("                ");
 716  00f8 ae0000        	ldw	x,#L101
 717  00fb 8dcf00cf      	callf	f_Display_LCD_String
 719                     ; 112 	Set_LCD_Address(0xC0);  // 2 Line Test Zig
 720  00ff a6c0          	ld	a,#192
 721  0101 8d990099      	callf	f_Set_LCD_Address
 723                     ; 113 	Display_LCD_String("                ");
 724  0105 ae0000        	ldw	x,#L101
 725  0108 8dcf00cf      	callf	f_Display_LCD_String
 727                     ; 115 	Set_LCD_Address(0x10);  // 3 Line Test Zig
 728  010c a610          	ld	a,#16
 729  010e 8d990099      	callf	f_Set_LCD_Address
 731                     ; 116 	Display_LCD_String("                ");
 732  0112 ae0000        	ldw	x,#L101
 733  0115 8dcf00cf      	callf	f_Display_LCD_String
 735                     ; 118 	Set_LCD_Address(0xD0);  // 4 Line Test Zig
 736  0119 a6d0          	ld	a,#208
 737  011b 8d990099      	callf	f_Set_LCD_Address
 739                     ; 119 	Display_LCD_String("                ");
 740  011f ae0000        	ldw	x,#L101
 742                     ; 121 	return;
 743  0122 20ab          	jpf	f_Display_LCD_String
 744                     ; 126 void LCD_Initialize(void)
 744                     ; 127 {
 745  0124               f_LCD_Initialize:
 747                     ; 133 	Set_LCD_Command(0x3C);	//Function set
 748  0124 a63c          	ld	a,#60
 749  0126 8d830083      	callf	f_Set_LCD_Command
 751                     ; 134 	Delay_ms(50);
 752  012a a632          	ld	a,#50
 753  012c 8d660066      	callf	f_Delay_ms
 755                     ; 136 	Set_LCD_Command(0x3C);	//Function set
 756  0130 a63c          	ld	a,#60
 757  0132 8d830083      	callf	f_Set_LCD_Command
 759                     ; 137 	Delay_ms(100);
 760  0136 a664          	ld	a,#100
 761  0138 8d660066      	callf	f_Delay_ms
 763                     ; 138 	Set_LCD_Command(0x3C);	//Function set
 764  013c a63c          	ld	a,#60
 765  013e 8d830083      	callf	f_Set_LCD_Command
 767                     ; 140 	Set_LCD_Command(0x3C);	//Function set
 768  0142 a63c          	ld	a,#60
 769  0144 8d830083      	callf	f_Set_LCD_Command
 771                     ; 141 	Set_LCD_Command(0x08);	//Display off
 772  0148 a608          	ld	a,#8
 773  014a 8d830083      	callf	f_Set_LCD_Command
 775                     ; 142 	Set_LCD_Command(0x01);	//Display Clear and Return home
 776  014e a601          	ld	a,#1
 777  0150 8d830083      	callf	f_Set_LCD_Command
 779                     ; 143 	Delay_ms(100);
 780  0154 a664          	ld	a,#100
 781  0156 8d660066      	callf	f_Delay_ms
 783                     ; 145 	Set_LCD_Command(0x06);	//Entry mode setting
 784  015a a606          	ld	a,#6
 785  015c 8d830083      	callf	f_Set_LCD_Command
 787                     ; 146 	Set_LCD_Command(0x0C);	//Display on and cursor off
 788  0160 a60c          	ld	a,#12
 789  0162 8d830083      	callf	f_Set_LCD_Command
 791                     ; 147 	Set_LCD_Address(0x00);	//LCD Address Init
 792  0166 4f            	clr	a
 794                     ; 155 	return;
 795  0167 ac990099      	jpf	f_Set_LCD_Address
 796                     ; 159 void LCD_Buffer_Add(U8 Add)
 796                     ; 160 {
 797  016b               f_LCD_Buffer_Add:
 798  016b 88            	push	a
 799       00000000      OFST:	set	0
 801                     ; 161 	if(Add >= 0xC0){ Buffer_Add = (U8)((Add & 0x0F) + 48);	}	//forth_LCD_Column
 802  016c a1c0          	cp	a,#192
 803  016e 2506          	jrult	L301
 805  0170 a40f          	and	a,#15
 806  0172 ab30          	add	a,#48
 808  0174 2004          	jra	L501
 809  0176               L301:
 810                     ; 162 	else{	Buffer_Add = (U8)(Add & 0x0F);		}			//First_LCD_Column
 811  0176 7b01          	ld	a,(OFST+1,sp)
 812  0178 a40f          	and	a,#15
 813  017a               L501:
 814  017a b720          	ld	_Buffer_Add,a
 815                     ; 163 	return;
 816  017c 84            	pop	a
 817  017d 87            	retf	
 818                     ; 167 void LCD_Buffer_Char(U8 Data)
 818                     ; 168 {
 819  017e               f_LCD_Buffer_Char:
 820  017e 88            	push	a
 821       00000000      OFST:	set	0
 823                     ; 169 	LCD_Buffer[Buffer_Add++] = Data;
 824  017f b620          	ld	a,_Buffer_Add
 825  0181 3c20          	inc	_Buffer_Add
 826  0183 5f            	clrw	x
 827  0184 97            	ld	xl,a
 828  0185 7b01          	ld	a,(OFST+1,sp)
 829  0187 e700          	ld	(_LCD_Buffer,x),a
 830                     ; 170 	return;
 831  0189 84            	pop	a
 832  018a 87            	retf	
 833                     ; 174 void LCD_Buffer_String(U8 *str)
 833                     ; 175 {
 834  018b               f_LCD_Buffer_String:
 835  018b 89            	pushw	x
 836       00000000      OFST:	set	0
 838  018c 2009          	jra	L311
 839  018e               L701:
 840                     ; 176 	for(; *str;){ LCD_Buffer_Char(*str++);	}
 841  018e 5c            	incw	x
 842  018f 1f01          	ldw	(OFST+1,sp),x
 843  0191 5a            	decw	x
 844  0192 f6            	ld	a,(x)
 845  0193 8d7e017e      	callf	f_LCD_Buffer_Char
 847  0197               L311:
 849  0197 1e01          	ldw	x,(OFST+1,sp)
 850  0199 f6            	ld	a,(x)
 851  019a 26f2          	jrne	L701
 852                     ; 177 	return;
 853  019c 85            	popw	x
 854  019d 87            	retf	
 855                     ; 181 void LCD_Buffer_Clear(void)
 855                     ; 182 {
 856  019e               f_LCD_Buffer_Clear:
 857  019e 88            	push	a
 858       00000001      OFST:	set	1
 860                     ; 185 	for(i = 0; i < 32; i++){ LCD_Buffer[i] = ' ';	}
 861  019f 4f            	clr	a
 862  01a0 6b01          	ld	(OFST+0,sp),a
 863  01a2               L711:
 865  01a2 5f            	clrw	x
 866  01a3 97            	ld	xl,a
 867  01a4 a620          	ld	a,#32
 868  01a6 e700          	ld	(_LCD_Buffer,x),a
 870  01a8 0c01          	inc	(OFST+0,sp)
 872  01aa 7b01          	ld	a,(OFST+0,sp)
 873  01ac a120          	cp	a,#32
 874  01ae 25f2          	jrult	L711
 875                     ; 186 	return;
 876  01b0 84            	pop	a
 877  01b1 87            	retf	
 878                     ; 190 void Num_Display_LCD(U16 num)
 878                     ; 191 {
 879  01b2               f_Num_Display_LCD:
 880  01b2 89            	pushw	x
 881  01b3 88            	push	a
 882       00000001      OFST:	set	1
 884                     ; 195 	if(num >= 10000){
 885  01b4 a32710        	cpw	x,#10000
 886  01b7 251c          	jrult	L521
 887                     ; 196 		buff = (U8)(num / 10000);
 888  01b9 90ae2710      	ldw	y,#10000
 889  01bd 65            	divw	x,y
 890  01be 9f            	ld	a,xl
 891  01bf 6b01          	ld	(OFST+0,sp),a
 892                     ; 197 		num %= 10000;
 893  01c1 90ae2710      	ldw	y,#10000
 894  01c5 1e02          	ldw	x,(OFST+1,sp)
 895  01c7 65            	divw	x,y
 896  01c8 93            	ldw	x,y
 897  01c9 1f02          	ldw	(OFST+1,sp),x
 898                     ; 198 		Display_LCD_Data((U8)(48+buff));
 899  01cb ab30          	add	a,#48
 900  01cd 8db100b1      	callf	f_Display_LCD_Data
 902                     ; 200 		buff = (U8)(num / 1000);
 903  01d1 1e02          	ldw	x,(OFST+1,sp)
 904                     ; 201 		num %= 1000;
 905                     ; 202 		Display_LCD_Data((U8)(48+buff));
 907                     ; 204 		buff = (U8)(num / 100);
 908                     ; 205 		num %= 100;
 909                     ; 206 		Display_LCD_Data((U8)(48+buff));
 911                     ; 208 		buff = (U8)(num / 10);
 912                     ; 209 		num %= 10;
 913                     ; 210 		Display_LCD_Data((U8)(48+buff));
 915                     ; 212 		num %= 10;
 916                     ; 213 		Display_LCD_Data((U8)(48+num));
 919  01d3 2007          	jpf	LC003
 920  01d5               L521:
 921                     ; 215 	}else if(num >= 1000){
 922  01d5 1e02          	ldw	x,(OFST+1,sp)
 923  01d7 a303e8        	cpw	x,#1000
 924  01da 2536          	jrult	L131
 925                     ; 216 		buff = (U8)(num / 1000);
 926                     ; 217 		num %= 1000;
 927                     ; 218 		Display_LCD_Data((U8)(48+buff));
 929                     ; 220 		buff = (U8)(num / 100);
 930  01dc               LC003:
 931  01dc 90ae03e8      	ldw	y,#1000
 932  01e0 65            	divw	x,y
 933  01e1 9f            	ld	a,xl
 934  01e2 6b01          	ld	(OFST+0,sp),a
 935  01e4 90ae03e8      	ldw	y,#1000
 936  01e8 1e02          	ldw	x,(OFST+1,sp)
 937  01ea 65            	divw	x,y
 938  01eb 93            	ldw	x,y
 939  01ec 1f02          	ldw	(OFST+1,sp),x
 940  01ee ab30          	add	a,#48
 941  01f0 8db100b1      	callf	f_Display_LCD_Data
 942  01f4 1e02          	ldw	x,(OFST+1,sp)
 943                     ; 221 		num %= 100;
 944                     ; 222 		Display_LCD_Data((U8)(48+buff));
 946                     ; 224 		buff = (U8)(num / 10);
 947  01f6               LC002:
 948  01f6 90ae0064      	ldw	y,#100
 949  01fa 65            	divw	x,y
 950  01fb 9f            	ld	a,xl
 951  01fc 6b01          	ld	(OFST+0,sp),a
 952  01fe 90ae0064      	ldw	y,#100
 953  0202 1e02          	ldw	x,(OFST+1,sp)
 954  0204 65            	divw	x,y
 955  0205 93            	ldw	x,y
 956  0206 1f02          	ldw	(OFST+1,sp),x
 957  0208 ab30          	add	a,#48
 958  020a 8db100b1      	callf	f_Display_LCD_Data
 959  020e 1e02          	ldw	x,(OFST+1,sp)
 960                     ; 225 		num %= 10;
 961                     ; 226 		Display_LCD_Data((U8)(48+buff));
 963                     ; 228 		num %= 10;
 964                     ; 229 		Display_LCD_Data((U8)(48+num));
 967  0210 200a          	jpf	LC001
 968  0212               L131:
 969                     ; 230 	}else if(num >= 100){
 970  0212 a30064        	cpw	x,#100
 971                     ; 231 		buff = (U8)(num / 100);
 972                     ; 232 		num %= 100;
 973                     ; 233 		Display_LCD_Data((U8)(48+buff));
 975                     ; 235 		buff = (U8)(num / 10);
 976                     ; 236 		num %= 10;
 977                     ; 237 		Display_LCD_Data((U8)(48+buff));
 979                     ; 239 		num %= 10;
 980                     ; 240 		Display_LCD_Data((U8)(48+num));
 983  0215 24df          	jruge	LC002
 984                     ; 241 	}else if(num >= 10){
 985  0217 a3000a        	cpw	x,#10
 986  021a 2522          	jrult	L141
 987                     ; 242 		buff = (U8)(num / 10);
 988                     ; 243 		num %= 10;
 989                     ; 244 		Display_LCD_Data((U8)(48+buff));
 991                     ; 246 		num %= 10;
 992  021c               LC001:
 993  021c 90ae000a      	ldw	y,#10
 994  0220 65            	divw	x,y
 995  0221 9f            	ld	a,xl
 996  0222 6b01          	ld	(OFST+0,sp),a
 997  0224 90ae000a      	ldw	y,#10
 998  0228 1e02          	ldw	x,(OFST+1,sp)
 999  022a 65            	divw	x,y
1000  022b 93            	ldw	x,y
1001  022c 1f02          	ldw	(OFST+1,sp),x
1002  022e ab30          	add	a,#48
1003  0230 8db100b1      	callf	f_Display_LCD_Data
1004  0234 1e02          	ldw	x,(OFST+1,sp)
1005  0236 90ae000a      	ldw	y,#10
1006  023a 65            	divw	x,y
1007  023b 93            	ldw	x,y
1008  023c 1f02          	ldw	(OFST+1,sp),x
1009                     ; 247 		Display_LCD_Data((U8)(48+num));
1012  023e               L141:
1013                     ; 248 	}else{ Display_LCD_Data((U8)(48+num));}
1015  023e 7b03          	ld	a,(OFST+2,sp)
1016  0240 ab30          	add	a,#48
1017  0242 8db100b1      	callf	f_Display_LCD_Data
1018                     ; 250 	return;
1019  0246 5b03          	addw	sp,#3
1020  0248 87            	retf	
1021                     	switch	.bss
1022  0000               _ui_blink_timer_cnt:
1023  0000 00            	ds.b	1
1024                     	xdef	_ui_blink_timer_cnt
1025                     	switch	.ubsct
1026  0000               _LCD_Buffer:
1027  0000 000000000000  	ds.b	32
1028                     	xdef	_LCD_Buffer
1029  0020               _Buffer_Add:
1030  0020 00            	ds.b	1
1031                     	xdef	_Buffer_Add
1032                     	xdef	f_Display_Clear
1033                     	xdef	f_LCD_Blink_Timer_Control
1034                     	xdef	f_Num_Display_LCD
1035                     	xdef	f_LCD_Buffer_Clear
1036                     	xdef	f_LCD_Buffer_String
1037                     	xdef	f_LCD_Buffer_Char
1038                     	xdef	f_LCD_Buffer_Add
1039                     	xdef	f_LCD_Initialize
1040                     	xdef	f_Clear_Display_LCD
1041                     	xdef	f_Display_LCD_String
1042                     	xdef	f_Display_LCD_Data
1043                     	xdef	f_Set_LCD_Address
1044                     	xdef	f_Set_LCD_Command
1045                     	xdef	f_Delay_ms
1046                     	switch	.bss
1047  0001               _LCD_Dis_Data:
1048  0001 000000000000  	ds.b	64
1049                     	xdef	_LCD_Dis_Data
1050                     	xdef	_LCD_Line
1051  0041               _uc_LCD_Blink_Reg:
1052  0041 00            	ds.b	1
1053                     	xdef	_uc_LCD_Blink_Reg
1054                     	xref	f_Windows_Watchdog_Clear
1055                     .const:	section	.text
1056  0000               L101:
1057  0000 202020202020  	dc.b	"                ",0
1058                     	end

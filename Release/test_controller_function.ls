   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
 495                     	switch	.data
 496  0000               _uc_Rx1_Data:
 497  0000 00            	dc.b	0
 498  0001 000000000000  	ds.b	7
 499  0008               _uc_Rx2_Data:
 500  0008 00            	dc.b	0
 501  0009 000000000000  	ds.b	7
 502                     ; 40 void First_Switch_Control(void)
 502                     ; 41 {
 503                     	switch	.text
 504  0000               f_First_Switch_Control:
 506                     ; 42 	if(b_ENTER_Button_Flag){
 507  0000 720b000018    	btjf	_uc_Button_Status_Reg,#5,L3
 508                     ; 43 		b_First_Logic_On = ON;
 509  0005 72100000      	bset	_uc_System_Ctrl_Reg,#0
 510                     ; 44 		b_Model_Select_flag = OFF;		// Model_Selection_Skipped
 511  0009 7211000c      	bres	_uc_Test_Ctrl_Reg,#0
 512                     ; 45 		b_Data_Select_flag = OFF;
 513  000d 7213000c      	bres	_uc_Test_Ctrl_Reg,#1
 514                     ; 47 		uc_Test_Page_Pre = (U8)(1);
 515  0011 35010003      	mov	_uc_Test_Page_Pre,#1
 516                     ; 48 		uc_Test_Data_Select_Num = (U8)(0);
 517  0015 725f0002      	clr	_uc_Test_Data_Select_Num
 518                     ; 50 		b_ENTER_Button_Flag = OFF;
 519  0019 721b0000      	bres	_uc_Button_Status_Reg,#5
 520  001d               L3:
 521                     ; 53 	return;
 522  001d 87            	retf	
 523                     ; 58 void Test_Controller_First_Routine(void)
 523                     ; 59 {
 524  001e               f_Test_Controller_First_Routine:
 526                     ; 60 	Start_Zig_Display();
 527  001e 8d000000      	callf	f_Start_Zig_Display
 529                     ; 61 	First_Switch_Control();
 531                     ; 63 	return;
 532  0022 20dc          	jpf	f_First_Switch_Control
 533                     ; 69 void Model_Select_Display_Handling(void)
 533                     ; 70 {
 534  0024               f_Model_Select_Display_Handling:
 536                     ; 71 	switch(uc_Test_Page_Now){
 537  0024 725d0004      	tnz	_uc_Test_Page_Now
 538  0028 2605          	jrne	L7
 540                     ; 74 		case 0:	strcpy(LCD_Dis_Data[0],"*HVCC Model*");	
 541  002a ae016c        	ldw	x,#L51
 543                     ; 75 				strcpy(LCD_Dis_Data[1],"");	// 
 545                     ; 76 				strcpy(LCD_Dis_Data[2],"");	// 
 547                     ; 77 				strcpy(LCD_Dis_Data[3],"");		
 549                     ; 79 				break;
 550  002d 2003          	jra	L31
 551  002f               L7:
 552                     ; 81 		default: 
 552                     ; 82 				strcpy(LCD_Dis_Data[0],"");	// Null
 553  002f ae016b        	ldw	x,#L71
 555                     ; 83 				strcpy(LCD_Dis_Data[1],"");	// Null
 557                     ; 84 				strcpy(LCD_Dis_Data[2],"");	// Null
 559                     ; 85 				strcpy(LCD_Dis_Data[3],"");	// Null
 561                     ; 87 				break;
 562  0032               L31:
 563  0032 89            	pushw	x
 564  0033 ae0000        	ldw	x,#_LCD_Dis_Data
 565  0036 8d000000      	callf	f_strcpy
 566  003a 85            	popw	x
 567  003b ae016b        	ldw	x,#L71
 568  003e 89            	pushw	x
 569  003f ae0010        	ldw	x,#_LCD_Dis_Data+16
 570  0042 8d000000      	callf	f_strcpy
 571  0046 85            	popw	x
 572  0047 ae016b        	ldw	x,#L71
 573  004a 89            	pushw	x
 574  004b ae0020        	ldw	x,#_LCD_Dis_Data+32
 575  004e 8d000000      	callf	f_strcpy
 576  0052 85            	popw	x
 577  0053 ae016b        	ldw	x,#L71
 578  0056 89            	pushw	x
 579  0057 ae0030        	ldw	x,#_LCD_Dis_Data+48
 580  005a 8d000000      	callf	f_strcpy
 581  005e 85            	popw	x
 582                     ; 90 	return;
 583  005f 87            	retf	
 584                     ; 96 void Model_Select_Switch_Control(void)
 584                     ; 97 {
 585  0060               f_Model_Select_Switch_Control:
 587                     ; 98 	if(b_UP_Button_Flag){
 588  0060 7203000004    	btjf	_uc_Button_Status_Reg,#1,L32
 589                     ; 100 		b_UP_Button_Flag = OFF;
 590  0065 72130000      	bres	_uc_Button_Status_Reg,#1
 591  0069               L32:
 592                     ; 103 	if(b_DOWN_Button_Flag){
 593  0069 7205000004    	btjf	_uc_Button_Status_Reg,#2,L52
 594                     ; 105 		b_DOWN_Button_Flag = OFF;
 595  006e 72150000      	bres	_uc_Button_Status_Reg,#2
 596  0072               L52:
 597                     ; 108 	if(b_ENTER_Button_Flag){
 598  0072 720b000004    	btjf	_uc_Button_Status_Reg,#5,L72
 599                     ; 110 		b_ENTER_Button_Flag = OFF;
 600  0077 721b0000      	bres	_uc_Button_Status_Reg,#5
 601  007b               L72:
 602                     ; 114 	return;
 603  007b 87            	retf	
 604                     ; 120 void Model_Select_LCD_Display_Control(void)
 604                     ; 121 {
 605  007c               f_Model_Select_LCD_Display_Control:
 606  007c 88            	push	a
 607       00000001      OFST:	set	1
 609                     ; 124 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
 610  007d c60004        	ld	a,_uc_Test_Page_Now
 611  0080 c10003        	cp	a,_uc_Test_Page_Pre
 612  0083 2704          	jreq	L13
 614  0085 8d240024      	callf	f_Model_Select_Display_Handling
 616  0089               L13:
 617                     ; 125 	uc_Test_Page_Pre = uc_Test_Page_Now ;
 618  0089 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
 619                     ; 128 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
 620  008e 725d0004      	tnz	_uc_Test_Page_Now
 621  0092 2634          	jrne	L33
 622                     ; 129 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
 623  0094 4f            	clr	a
 624  0095 6b01          	ld	(OFST+0,sp),a
 625  0097               L53:
 626                     ; 130 			Set_LCD_Address(LCD_Line[uc_line_index]);
 627  0097 5f            	clrw	x
 628  0098 97            	ld	xl,a
 629  0099 d60000        	ld	a,(_LCD_Line,x)
 630  009c 8d000000      	callf	f_Set_LCD_Address
 632                     ; 132 			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
 633  00a0 7203000c0e    	btjf	_uc_Test_Ctrl_Reg,#1,L34
 635  00a5 7b01          	ld	a,(OFST+0,sp)
 636  00a7 c10002        	cp	a,_uc_Test_Data_Select_Num
 637  00aa 2607          	jrne	L34
 638                     ; 133 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
 639  00ac 720300000f    	btjf	_uc_LCD_Blink_Reg,#1,L74
 642  00b1 2002          	jpf	LC001
 643  00b3               L34:
 644                     ; 134 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
 645  00b3 7b01          	ld	a,(OFST+0,sp)
 646  00b5               LC001:
 647  00b5 97            	ld	xl,a
 648  00b6 a610          	ld	a,#16
 649  00b8 42            	mul	x,a
 650  00b9 1c0000        	addw	x,#_LCD_Dis_Data
 651  00bc 8d000000      	callf	f_Display_LCD_String
 653  00c0               L74:
 654                     ; 129 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
 655  00c0 0c01          	inc	(OFST+0,sp)
 657  00c2 7b01          	ld	a,(OFST+0,sp)
 658  00c4 a104          	cp	a,#4
 659  00c6 25cf          	jrult	L53
 660  00c8               L33:
 661                     ; 138 	return;
 662  00c8 84            	pop	a
 663  00c9 87            	retf	
 664                     ; 143 void Model_Select_Routine(void)
 664                     ; 144 {
 665  00ca               f_Model_Select_Routine:
 667                     ; 145 	Model_Select_LCD_Display_Control();
 668  00ca 8d7c007c      	callf	f_Model_Select_LCD_Display_Control
 670                     ; 146 	Model_Select_Switch_Control();	
 672                     ; 148 	return;
 673  00ce 2090          	jpf	f_Model_Select_Switch_Control
 674                     ; 154 void Test_Ctrl_Value_Change(U8 uc_st)
 674                     ; 155 {
 675  00d0               f_Test_Ctrl_Value_Change:
 676  00d0 88            	push	a
 677  00d1 5204          	subw	sp,#4
 678       00000004      OFST:	set	4
 680                     ; 160 	if(uc_st == 1){	
 681  00d3 4a            	dec	a
 682  00d4 2704ac600160  	jrne	L15
 683                     ; 161   		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
 684  00da 725d0002      	tnz	_uc_Test_Data_Select_Num
 687  00de 2604ac6a016a  	jreq	LC006
 688                     ; 162 		else if(uc_Test_Data_Select_Num == (U8)(1)){
 689  00e4 c60002        	ld	a,_uc_Test_Data_Select_Num
 690  00e7 4a            	dec	a
 691  00e8 2704acac01ac  	jrne	L111
 692                     ; 164 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode		
 693  00ee c60000        	ld	a,_uc_Target_Display_Mode
 694  00f1 4a            	dec	a
 695  00f2 264c          	jrne	L16
 696                     ; 165 				if(uc_Target_Duty_Perc < (U8)(20)){ uc_Target_Duty_Perc = (U8)(20); }
 697  00f4 c6000a        	ld	a,_uc_Target_Duty_Perc
 698  00f7 a114          	cp	a,#20
 699  00f9 2408          	jruge	L36
 701  00fb 3514000a      	mov	_uc_Target_Duty_Perc,#20
 703  00ff acac01ac      	jra	L111
 704  0103               L36:
 705                     ; 167 					ui_buffer = (U16)(uc_Target_Duty_Perc) + (U16)(uc_Perc_Unit);
 706  0103 c60001        	ld	a,_uc_Perc_Unit
 707  0106 5f            	clrw	x
 708  0107 97            	ld	xl,a
 709  0108 1f01          	ldw	(OFST-3,sp),x
 710  010a 5f            	clrw	x
 711  010b c6000a        	ld	a,_uc_Target_Duty_Perc
 712  010e 97            	ld	xl,a
 713  010f 72fb01        	addw	x,(OFST-3,sp)
 714  0112 1f03          	ldw	(OFST-1,sp),x
 715                     ; 169 					if((uc_Target_Duty_Perc < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc = (U8)(180); }
 716  0114 c6000a        	ld	a,_uc_Target_Duty_Perc
 717  0117 a1b4          	cp	a,#180
 718  0119 240d          	jruge	L76
 720  011b a300b4        	cpw	x,#180
 721  011e 2508          	jrult	L76
 723  0120 35b4000a      	mov	_uc_Target_Duty_Perc,#180
 725  0124 acac01ac      	jra	L111
 726  0128               L76:
 727                     ; 170 					else if(uc_Target_Duty_Perc == (U8)(180)){ uc_Target_Duty_Perc = (U8)(190); }
 728  0128 c6000a        	ld	a,_uc_Target_Duty_Perc
 729  012b a1b4          	cp	a,#180
 730  012d 2606          	jrne	L37
 732  012f 35be000a      	mov	_uc_Target_Duty_Perc,#190
 734  0133 2077          	jra	L111
 735  0135               L37:
 736                     ; 171 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc = (U8)(190); }
 737  0135 a300bf        	cpw	x,#191
 738  0138 2522          	jrult	L501
 740  013a 35be000a      	mov	_uc_Target_Duty_Perc,#190
 742  013e 206c          	jra	L111
 743                     ; 172 					else{ uc_Target_Duty_Perc = (U8)(ui_buffer); }
 744  0140               L16:
 745                     ; 176 				ui_buffer = (U16)(uc_Target_Duty_Perc) + (U16)(uc_Perc_Unit);
 746  0140 c60001        	ld	a,_uc_Perc_Unit
 747  0143 5f            	clrw	x
 748  0144 97            	ld	xl,a
 749  0145 1f01          	ldw	(OFST-3,sp),x
 750  0147 5f            	clrw	x
 751  0148 c6000a        	ld	a,_uc_Target_Duty_Perc
 752  014b 97            	ld	xl,a
 753  014c 72fb01        	addw	x,(OFST-3,sp)
 754  014f 1f03          	ldw	(OFST-1,sp),x
 755                     ; 177 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc = (U8)(200); }
 756  0151 a300c8        	cpw	x,#200
 757  0154 2506          	jrult	L501
 759  0156 35c8000a      	mov	_uc_Target_Duty_Perc,#200
 761  015a 2050          	jra	L111
 762  015c               L501:
 763                     ; 178 				else{ uc_Target_Duty_Perc = (U8)(ui_buffer); }
 764  015c 7b04          	ld	a,(OFST+0,sp)
 765  015e 2043          	jpf	LC003
 766  0160               L15:
 767                     ; 184 	else if(uc_st == 0){	
 768  0160 7b05          	ld	a,(OFST+1,sp)
 769  0162 2648          	jrne	L111
 770                     ; 185 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
 771  0164 725d0002      	tnz	_uc_Test_Data_Select_Num
 772  0168 260a          	jrne	L511
 774  016a               LC006:
 775  016a c60009        	ld	a,_uc_Heater_Enable_Flag
 776  016d a801          	xor	a,#1
 777  016f c70009        	ld	_uc_Heater_Enable_Flag,a
 779  0172 2038          	jra	L111
 780  0174               L511:
 781                     ; 186 		else if(uc_Test_Data_Select_Num == (U8)(1)){
 782  0174 c60002        	ld	a,_uc_Test_Data_Select_Num
 783  0177 4a            	dec	a
 784  0178 2632          	jrne	L111
 785                     ; 187 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode	
 786  017a c60000        	ld	a,_uc_Target_Display_Mode
 787  017d 4a            	dec	a
 788  017e 2615          	jrne	L321
 789                     ; 188 				if(uc_Target_Duty_Perc >= uc_Perc_Unit){ 
 790  0180 c6000a        	ld	a,_uc_Target_Duty_Perc
 791  0183 c10001        	cp	a,_uc_Perc_Unit
 792  0186 2520          	jrult	L731
 793                     ; 190 					if(uc_Target_Duty_Perc == (U8)(190)){ uc_Target_Duty_Perc = (U8)(180); }
 794  0188 c6000a        	ld	a,_uc_Target_Duty_Perc
 795  018b a1be          	cp	a,#190
 796  018d 260e          	jrne	LC004
 798  018f 35b4000a      	mov	_uc_Target_Duty_Perc,#180
 800  0193 2017          	jra	L111
 801                     ; 191 					else{ uc_Target_Duty_Perc = (U8)(uc_Target_Duty_Perc - uc_Perc_Unit); }
 802                     ; 193 				else{ uc_Target_Duty_Perc = (U8)(0); }
 803  0195               L321:
 804                     ; 196 				if(uc_Target_Duty_Perc >= uc_Perc_Unit){ uc_Target_Duty_Perc = (U8)(uc_Target_Duty_Perc - uc_Perc_Unit); }
 805  0195 c6000a        	ld	a,_uc_Target_Duty_Perc
 806  0198 c10001        	cp	a,_uc_Perc_Unit
 807  019b 250b          	jrult	L731
 809  019d               LC004:
 810  019d c6000a        	ld	a,_uc_Target_Duty_Perc
 811  01a0 c00001        	sub	a,_uc_Perc_Unit
 812  01a3               LC003:
 813  01a3 c7000a        	ld	_uc_Target_Duty_Perc,a
 815  01a6 2004          	jra	L111
 816  01a8               L731:
 817                     ; 197 				else{ uc_Target_Duty_Perc = (U8)(0); }
 818  01a8 725f000a      	clr	_uc_Target_Duty_Perc
 819  01ac               L111:
 820                     ; 202 	return ;
 821  01ac 5b05          	addw	sp,#5
 822  01ae 87            	retf	
 823                     ; 207 void Test_Ctrl_Swtich_Control(void)
 823                     ; 208 {
 824  01af               f_Test_Ctrl_Swtich_Control:
 826                     ; 210 	if(b_UP_Button_Flag== ON){
 827  01af 720300005c    	btjf	_uc_Button_Status_Reg,#1,L341
 828                     ; 212 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit < (U8)(130)){ uc_Perc_Unit++;}}
 829  01b4 7209000c0d    	btjf	_uc_Test_Ctrl_Reg,#4,L541
 831  01b9 c60001        	ld	a,_uc_Perc_Unit
 832  01bc a182          	cp	a,#130
 833  01be 244a          	jruge	L151
 835  01c0 725c0001      	inc	_uc_Perc_Unit
 836  01c4 2044          	jra	L151
 837  01c6               L541:
 838                     ; 214 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
 839  01c6 7205000c08    	btjf	_uc_Test_Ctrl_Reg,#2,L351
 841  01cb a601          	ld	a,#1
 842  01cd 8dd000d0      	callf	f_Test_Ctrl_Value_Change
 845  01d1 2037          	jra	L151
 846  01d3               L351:
 847                     ; 215 			else if(b_Data_Select_flag == ON){
 848  01d3 7203000c12    	btjf	_uc_Test_Ctrl_Reg,#1,L751
 849                     ; 216 				if(uc_Test_Page_Now == (U8)(0)){
 850  01d8 725d0004      	tnz	_uc_Test_Page_Now
 851  01dc 262c          	jrne	L151
 852                     ; 217 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
 853  01de 725d0002      	tnz	_uc_Test_Data_Select_Num
 854  01e2 2726          	jreq	L151
 856  01e4 725a0002      	dec	_uc_Test_Data_Select_Num
 857  01e8 2020          	jra	L151
 858  01ea               L751:
 859                     ; 220 				if(uc_Test_Page_Now > 0){
 860  01ea 725d0004      	tnz	_uc_Test_Page_Now
 861  01ee 271a          	jreq	L151
 862                     ; 221 					uc_Test_Page_Now--;
 863  01f0 725a0004      	dec	_uc_Test_Page_Now
 864                     ; 222 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
 865  01f4 725d0004      	tnz	_uc_Test_Page_Now
 866  01f8 2606          	jrne	L171
 868  01fa 725f0002      	clr	_uc_Test_Data_Select_Num
 870  01fe 200a          	jra	L151
 871  0200               L171:
 872                     ; 223 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
 873  0200 c60004        	ld	a,_uc_Test_Page_Now
 874  0203 4a            	dec	a
 875  0204 2604          	jrne	L151
 877  0206 35040002      	mov	_uc_Test_Data_Select_Num,#4
 878  020a               L151:
 879                     ; 227 		b_UP_Button_Flag = OFF;
 880  020a 72130000      	bres	_uc_Button_Status_Reg,#1
 882  020e 205f          	jra	L771
 883  0210               L341:
 884                     ; 231 	else if(b_DOWN_Button_Flag== ON){ 
 885  0210 720500005a    	btjf	_uc_Button_Status_Reg,#2,L771
 886                     ; 233 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit > (U8)(1)){ uc_Perc_Unit--;}}
 887  0215 7209000c0d    	btjf	_uc_Test_Ctrl_Reg,#4,L302
 889  021a c60001        	ld	a,_uc_Perc_Unit
 890  021d a102          	cp	a,#2
 891  021f 254a          	jrult	L702
 893  0221 725a0001      	dec	_uc_Perc_Unit
 894  0225 2044          	jra	L702
 895  0227               L302:
 896                     ; 236 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
 897  0227 7205000c07    	btjf	_uc_Test_Ctrl_Reg,#2,L112
 899  022c 4f            	clr	a
 900  022d 8dd000d0      	callf	f_Test_Ctrl_Value_Change
 903  0231 2038          	jra	L702
 904  0233               L112:
 905                     ; 238 			else if(b_Data_Select_flag == ON){
 906  0233 7203000c12    	btjf	_uc_Test_Ctrl_Reg,#1,L512
 907                     ; 239 				if(uc_Test_Page_Now == (U8)(0)){
 908  0238 725d0004      	tnz	_uc_Test_Page_Now
 909  023c 262d          	jrne	L702
 910                     ; 240 					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
 911  023e 725d0002      	tnz	_uc_Test_Data_Select_Num
 912  0242 2627          	jrne	L702
 914  0244 725c0002      	inc	_uc_Test_Data_Select_Num
 915  0248 2021          	jra	L702
 916  024a               L512:
 917                     ; 243 				if(uc_Test_Page_Now < 4){
 918  024a c60004        	ld	a,_uc_Test_Page_Now
 919  024d a104          	cp	a,#4
 920  024f 241a          	jruge	L702
 921                     ; 244 					uc_Test_Page_Now++;
 922  0251 725c0004      	inc	_uc_Test_Page_Now
 923                     ; 246 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
 924  0255 725d0004      	tnz	_uc_Test_Page_Now
 925  0259 2606          	jrne	L722
 927  025b 725f0002      	clr	_uc_Test_Data_Select_Num
 929  025f 200a          	jra	L702
 930  0261               L722:
 931                     ; 247 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
 932  0261 c60004        	ld	a,_uc_Test_Page_Now
 933  0264 4a            	dec	a
 934  0265 2604          	jrne	L702
 936  0267 35040002      	mov	_uc_Test_Data_Select_Num,#4
 937  026b               L702:
 938                     ; 251 		b_DOWN_Button_Flag = OFF;
 939  026b 72150000      	bres	_uc_Button_Status_Reg,#2
 940  026f               L771:
 941                     ; 255 	if(b_SET_Button_Flag== ON){
 942  026f 7207000040    	btjf	_uc_Button_Status_Reg,#3,L532
 943                     ; 256 		if(b_Test_Option_flag){ uc_Target_Display_Mode ^= ON; uc_Test_Page_Pre = (U8)(10);}
 944  0274 7209000c0e    	btjf	_uc_Test_Ctrl_Reg,#4,L732
 946  0279 c60000        	ld	a,_uc_Target_Display_Mode
 947  027c a801          	xor	a,#1
 948  027e c70000        	ld	_uc_Target_Display_Mode,a
 950  0281 350a0003      	mov	_uc_Test_Page_Pre,#10
 952  0285 2029          	jra	L142
 953  0287               L732:
 954                     ; 257 		else if(uc_Test_Page_Now < 2){
 955  0287 c60004        	ld	a,_uc_Test_Page_Now
 956  028a a102          	cp	a,#2
 957  028c 2422          	jruge	L142
 958                     ; 259 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
 959  028e 7202000c06    	btjt	_uc_Test_Ctrl_Reg,#1,L542
 961  0293 7212000c      	bset	_uc_Test_Ctrl_Reg,#1
 963  0297 2013          	jra	L742
 964  0299               L542:
 965                     ; 261 				if(b_Data_Setting_flag == OFF){
 966  0299 7204000c06    	btjt	_uc_Test_Ctrl_Reg,#2,L152
 967                     ; 262 					b_Data_Setting_flag = ON;
 968  029e 7214000c      	bset	_uc_Test_Ctrl_Reg,#2
 970  02a2 2008          	jra	L742
 971  02a4               L152:
 972                     ; 264 					b_Data_Setting_flag = OFF;
 973  02a4 7215000c      	bres	_uc_Test_Ctrl_Reg,#2
 974                     ; 265 					b_Data_Select_flag = OFF;
 975  02a8 7213000c      	bres	_uc_Test_Ctrl_Reg,#1
 976  02ac               L742:
 977                     ; 268 			b_SET_Button_Flag = OFF;
 978  02ac 72170000      	bres	_uc_Button_Status_Reg,#3
 979  02b0               L142:
 980                     ; 271 		b_SET_Button_Flag = OFF;
 981  02b0 72170000      	bres	_uc_Button_Status_Reg,#3
 982  02b4               L532:
 983                     ; 275 	if(b_ONOFF_Button_Flag== ON){
 984  02b4 7201000013    	btjf	_uc_Button_Status_Reg,#0,L552
 985                     ; 277 		if(b_Com_On_flag == OFF){b_Com_On_flag = ON;}
 986  02b9 7206000c06    	btjt	_uc_Test_Ctrl_Reg,#3,L752
 988  02be 7216000c      	bset	_uc_Test_Ctrl_Reg,#3
 990  02c2 2004          	jra	L162
 991  02c4               L752:
 992                     ; 278 		else{ b_Com_On_flag = OFF;}
 993  02c4 7217000c      	bres	_uc_Test_Ctrl_Reg,#3
 994  02c8               L162:
 995                     ; 280 		b_ONOFF_Button_Flag = OFF;
 996  02c8 72110000      	bres	_uc_Button_Status_Reg,#0
 997  02cc               L552:
 998                     ; 284 	if(b_OPTION_Button_Flag == ON){
 999  02cc 7209000013    	btjf	_uc_Button_Status_Reg,#4,L362
1000                     ; 286 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
1001  02d1 7208000c06    	btjt	_uc_Test_Ctrl_Reg,#4,L562
1003  02d6 7218000c      	bset	_uc_Test_Ctrl_Reg,#4
1005  02da 2004          	jra	L762
1006  02dc               L562:
1007                     ; 287 		else{b_Test_Option_flag = OFF; }
1008  02dc 7219000c      	bres	_uc_Test_Ctrl_Reg,#4
1009  02e0               L762:
1010                     ; 289 		b_OPTION_Button_Flag = OFF;
1011  02e0 72190000      	bres	_uc_Button_Status_Reg,#4
1012  02e4               L362:
1013                     ; 294 	if(b_ENTER_Button_Flag == ON){
1014  02e4 720b000017    	btjf	_uc_Button_Status_Reg,#5,L172
1015                     ; 295 		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
1016  02e9 7200000006    	btjt	_uc_System_Ctrl_Reg,#0,L372
1018  02ee 72100000      	bset	_uc_System_Ctrl_Reg,#0
1020  02f2 2008          	jra	L572
1021  02f4               L372:
1022                     ; 297 			b_First_Logic_On = OFF;
1023  02f4 72110000      	bres	_uc_System_Ctrl_Reg,#0
1024                     ; 298 			Test_Ctrl_Reset_Values();	
1025  02f8 8da80ba8      	callf	f_Test_Ctrl_Reset_Values
1027  02fc               L572:
1028                     ; 300 		b_ENTER_Button_Flag = OFF;
1029  02fc 721b0000      	bres	_uc_Button_Status_Reg,#5
1030  0300               L172:
1031                     ; 303 	return;
1032  0300 87            	retf	
1033                     ; 308 void Test_Ctrl_Text_Display_Handling(void)
1033                     ; 309 {
1034  0301               f_Test_Ctrl_Text_Display_Handling:
1036                     ; 310 	switch(uc_Test_Page_Now){
1037  0301 c60004        	ld	a,_uc_Test_Page_Now
1039                     ; 333 				break;
1040  0304 2714          	jreq	L772
1041  0306 4a            	dec	a
1042  0307 2745          	jreq	L103
1043                     ; 327 		default:
1043                     ; 328 				strcpy(LCD_Dis_Data[0],"");	// Null
1044  0309 ae016b        	ldw	x,#L71
1045  030c 89            	pushw	x
1046  030d ae0000        	ldw	x,#_LCD_Dis_Data
1047  0310 8d000000      	callf	f_strcpy
1049  0314 85            	popw	x
1050                     ; 329 				strcpy(LCD_Dis_Data[1],"");	// Null
1051  0315 ae016b        	ldw	x,#L71
1053                     ; 330 				strcpy(LCD_Dis_Data[2],"");	// Null
1055                     ; 331 				strcpy(LCD_Dis_Data[3],"");	// Null
1057                     ; 333 				break;
1058  0318 2043          	jpf	LC007
1059  031a               L772:
1060                     ; 313 		case 0:	strcpy(LCD_Dis_Data[0],"Al:     /");		// PTC_Allowance: / Status 
1061  031a ae0161        	ldw	x,#L113
1062  031d 89            	pushw	x
1063  031e ae0000        	ldw	x,#_LCD_Dis_Data
1064  0321 8d000000      	callf	f_strcpy
1066  0325 725d0000      	tnz	_uc_Target_Display_Mode
1067  0329 85            	popw	x
1068                     ; 314 				if(!uc_Target_Display_Mode){ strcpy(LCD_Dis_Data[1],"Td:     Fd:"); }	// Target Duty:   / Feedback Duty:
1069  032a 2605          	jrne	L313
1071  032c ae0155        	ldw	x,#L513
1074  032f 2003          	jra	L713
1075  0331               L313:
1076                     ; 315 				else{ strcpy(LCD_Dis_Data[1],"Tp:     Fd:"); }	// Target Duty:   / Feedback Duty:
1077  0331 ae0149        	ldw	x,#L123
1079  0334               L713:
1080  0334 89            	pushw	x
1081  0335 ae0010        	ldw	x,#_LCD_Dis_Data+16
1082  0338 8d000000      	callf	f_strcpy
1083  033c 85            	popw	x
1084                     ; 316 				strcpy(LCD_Dis_Data[2],"R:  F:  HV:");	// Ready: / Fault: / HV:
1085  033d ae013d        	ldw	x,#L323
1086  0340 89            	pushw	x
1087  0341 ae0020        	ldw	x,#_LCD_Dis_Data+32
1088  0344 8d000000      	callf	f_strcpy
1090  0348 85            	popw	x
1091                     ; 317 				strcpy(LCD_Dis_Data[3],"Cr:     Pw:");	// Current:  / Power:
1092  0349 ae0131        	ldw	x,#L523
1094                     ; 318 				break;
1095  034c 2027          	jra	L703
1096  034e               L103:
1097                     ; 321 		case 1:	strcpy(LCD_Dis_Data[0],"Ct:");			// Core Temp:
1098  034e ae012d        	ldw	x,#L723
1099  0351 89            	pushw	x
1100  0352 ae0000        	ldw	x,#_LCD_Dis_Data
1101  0355 8d000000      	callf	f_strcpy
1103  0359 85            	popw	x
1104                     ; 322 				strcpy(LCD_Dis_Data[1],"Ver:");		// Software_Version:
1105  035a ae0128        	ldw	x,#L133
1107                     ; 323 				strcpy(LCD_Dis_Data[2],"");	// Core Temp:
1109                     ; 324 				strcpy(LCD_Dis_Data[3],"");	// Core Temp
1110  035d               LC007:
1111  035d 89            	pushw	x
1112  035e ae0010        	ldw	x,#_LCD_Dis_Data+16
1113  0361 8d000000      	callf	f_strcpy
1114  0365 85            	popw	x
1115  0366 ae016b        	ldw	x,#L71
1116  0369 89            	pushw	x
1117  036a ae0020        	ldw	x,#_LCD_Dis_Data+32
1118  036d 8d000000      	callf	f_strcpy
1119  0371 85            	popw	x
1120  0372 ae016b        	ldw	x,#L71
1122                     ; 325 				break;
1123  0375               L703:
1124  0375 89            	pushw	x
1125  0376 ae0030        	ldw	x,#_LCD_Dis_Data+48
1126  0379 8d000000      	callf	f_strcpy
1127  037d 85            	popw	x
1128                     ; 336 	return;
1129  037e 87            	retf	
1130                     .const:	section	.text
1131  0000               L642:
1132  0000 000003e8      	dc.l	1000
1133                     ; 341 void Test_Ctrl_LCD_Display_Control(void)
1133                     ; 342 {
1134                     	switch	.text
1135  037f               f_Test_Ctrl_LCD_Display_Control:
1136  037f 5206          	subw	sp,#6
1137       00000006      OFST:	set	6
1139                     ; 349 	if(b_Test_Option_flag == ON){
1140  0381 7209000c7b    	btjf	_uc_Test_Ctrl_Reg,#4,L333
1141                     ; 350 		Set_LCD_Address(LCD_Line[0]);
1142  0386 c60000        	ld	a,_LCD_Line
1143  0389 8d000000      	callf	f_Set_LCD_Address
1145                     ; 351 		Display_LCD_String("*OPTION*");
1146  038d ae011f        	ldw	x,#L533
1147  0390 8d000000      	callf	f_Display_LCD_String
1149                     ; 353 		if(uc_Target_Display_Mode == (U8)(0)){
1150  0394 725d0000      	tnz	_uc_Target_Display_Mode
1151  0398 260c          	jrne	L733
1152                     ; 354 			Set_LCD_Address(LCD_Line[1]);
1153  039a c60001        	ld	a,_LCD_Line+1
1154  039d 8d000000      	callf	f_Set_LCD_Address
1156                     ; 355 			Display_LCD_String("*Target Perc");
1157  03a1 ae0112        	ldw	x,#L143
1160  03a4 200a          	jra	L343
1161  03a6               L733:
1162                     ; 358 			Set_LCD_Address(LCD_Line[1]);
1163  03a6 c60001        	ld	a,_LCD_Line+1
1164  03a9 8d000000      	callf	f_Set_LCD_Address
1166                     ; 359 			Display_LCD_String("*Target Watt(OS)");
1167  03ad ae0101        	ldw	x,#L543
1169  03b0               L343:
1170  03b0 8d000000      	callf	f_Display_LCD_String
1171                     ; 362 		Set_LCD_Address(LCD_Line[2]);
1172  03b4 c60002        	ld	a,_LCD_Line+2
1173  03b7 8d000000      	callf	f_Set_LCD_Address
1175                     ; 363 		Display_LCD_String("D_Unit:");
1176  03bb ae00f9        	ldw	x,#L743
1177  03be 8d000000      	callf	f_Display_LCD_String
1179                     ; 365 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
1180  03c2 c60002        	ld	a,_LCD_Line+2
1181  03c5 ab07          	add	a,#7
1182  03c7 8d000000      	callf	f_Set_LCD_Address
1184                     ; 366 		if(b_Blink_250_Flag){
1185  03cb 720300002d    	btjf	_uc_LCD_Blink_Reg,#1,L153
1186                     ; 367 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
1187  03d0 c60001        	ld	a,_uc_Perc_Unit
1188  03d3 44            	srl	a
1189  03d4 5f            	clrw	x
1190  03d5 97            	ld	xl,a
1191  03d6 8d000000      	callf	f_Num_Display_LCD
1193                     ; 368 			Display_LCD_String(".");
1194  03da ae00f7        	ldw	x,#L353
1195  03dd 8d000000      	callf	f_Display_LCD_String
1197                     ; 369 			uc_buffer = uc_Perc_Unit %(U8)(2);
1198  03e1 c60001        	ld	a,_uc_Perc_Unit
1199  03e4 a401          	and	a,#1
1200  03e6 6b05          	ld	(OFST-1,sp),a
1201                     ; 370 			if(uc_buffer){ Display_LCD_String("5"); }
1202  03e8 2705          	jreq	L553
1204  03ea ae00f5        	ldw	x,#L753
1207  03ed 2003          	jra	L163
1208  03ef               L553:
1209                     ; 371 			else{ Display_LCD_String("0"); }
1210  03ef ae00f3        	ldw	x,#L363
1212  03f2               L163:
1213  03f2 8d000000      	callf	f_Display_LCD_String
1214                     ; 372 			Display_LCD_String("%");
1215  03f6 ae00f1        	ldw	x,#L563
1216  03f9 8d000000      	callf	f_Display_LCD_String
1218  03fd               L153:
1219                     ; 374 		return;
1220  03fd ac9d0b9d      	jra	L5121
1221  0401               L333:
1222                     ; 377 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
1223  0401 c60004        	ld	a,_uc_Test_Page_Now
1224  0404 c10003        	cp	a,_uc_Test_Page_Pre
1225  0407 2710          	jreq	L763
1226                     ; 378 		Test_Ctrl_Text_Display_Handling(); 
1227  0409 8d010301      	callf	f_Test_Ctrl_Text_Display_Handling
1229                     ; 379 		b_Data_Select_flag = OFF;
1230  040d 7213000c      	bres	_uc_Test_Ctrl_Reg,#1
1231                     ; 380 		b_Data_Setting_flag = OFF;
1232  0411 7215000c      	bres	_uc_Test_Ctrl_Reg,#2
1233                     ; 381 		uc_Test_Data_Select_Num = (U8)(0);
1234  0415 725f0002      	clr	_uc_Test_Data_Select_Num
1235  0419               L763:
1236                     ; 383 	uc_Test_Page_Pre = uc_Test_Page_Now ;
1237  0419 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
1238                     ; 386 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
1239  041e 725d0004      	tnz	_uc_Test_Page_Now
1240  0422 2704ac210721  	jrne	L173
1241                     ; 387 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
1242  0428 4f            	clr	a
1243  0429 6b06          	ld	(OFST+0,sp),a
1244  042b               L373:
1245                     ; 389 			Set_LCD_Address(LCD_Line[uc_line_index]);
1246  042b 5f            	clrw	x
1247  042c 97            	ld	xl,a
1248  042d d60000        	ld	a,(_LCD_Line,x)
1249  0430 8d000000      	callf	f_Set_LCD_Address
1251                     ; 391 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
1252  0434 7203000c30    	btjf	_uc_Test_Ctrl_Reg,#1,L104
1254  0439 7204000c2b    	btjt	_uc_Test_Ctrl_Reg,#2,L104
1255                     ; 392 				if(uc_line_index == uc_Test_Data_Select_Num){ 
1256  043e 7b06          	ld	a,(OFST+0,sp)
1257  0440 c10002        	cp	a,_uc_Test_Data_Select_Num
1258  0443 2626          	jrne	LC009
1259                     ; 393 					if(uc_Test_Data_Select_Num == (U8)(0)){
1260  0445 725d0002      	tnz	_uc_Test_Data_Select_Num
1261  0449 260c          	jrne	L504
1262                     ; 394 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
1263  044b 7203000002    	btjf	_uc_LCD_Blink_Reg,#1,L704
1267  0450 2019          	jpf	LC009
1268  0452               L704:
1269                     ; 395 						else{ Display_LCD_String("        /"); }
1270  0452 ae00e7        	ldw	x,#L314
1272  0455 201b          	jpf	LC008
1273  0457               L504:
1274                     ; 397 					else if(uc_Test_Data_Select_Num == (U8)(1)){
1275  0457 c60002        	ld	a,_uc_Test_Data_Select_Num
1276  045a 4a            	dec	a
1277  045b 2619          	jrne	L134
1278                     ; 398 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
1279  045d 7203000002    	btjf	_uc_LCD_Blink_Reg,#1,L124
1283  0462 2005          	jpf	L104
1284  0464               L124:
1285                     ; 399 						else{ Display_LCD_String("        Fd:"); }
1286  0464 ae00db        	ldw	x,#L524
1288  0467 2009          	jpf	LC008
1289                     ; 402 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
1291  0469               L104:
1292                     ; 403 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
1293  0469 7b06          	ld	a,(OFST+0,sp)
1294  046b               LC009:
1295  046b 97            	ld	xl,a
1296  046c a610          	ld	a,#16
1297  046e 42            	mul	x,a
1298  046f 1c0000        	addw	x,#_LCD_Dis_Data
1299  0472               LC008:
1300  0472 8d000000      	callf	f_Display_LCD_String
1302  0476               L134:
1303                     ; 406 			if(uc_line_index == (U8)(0)){		// LINE 1
1304  0476 7b06          	ld	a,(OFST+0,sp)
1305  0478 2672          	jrne	L334
1306                     ; 409 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
1307  047a 5f            	clrw	x
1308  047b 97            	ld	xl,a
1309  047c d60000        	ld	a,(_LCD_Line,x)
1310  047f ab03          	add	a,#3
1311  0481 8d000000      	callf	f_Set_LCD_Address
1313                     ; 410 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
1314  0485 7205000c0c    	btjf	_uc_Test_Ctrl_Reg,#2,L534
1316  048a 7b06          	ld	a,(OFST+0,sp)
1317  048c c10002        	cp	a,_uc_Test_Data_Select_Num
1318  048f 2605          	jrne	L534
1319                     ; 411 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
1320  0491 720300000b    	btjf	_uc_LCD_Blink_Reg,#1,L144
1323  0496               L534:
1324                     ; 412 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
1325  0496 c60009        	ld	a,_uc_Heater_Enable_Flag
1326  0499 5f            	clrw	x
1327  049a 97            	ld	xl,a
1328  049b 8d000000      	callf	f_Num_Display_LCD
1330  049f 7b06          	ld	a,(OFST+0,sp)
1331  04a1               L144:
1332                     ; 415 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
1333  04a1 5f            	clrw	x
1334  04a2 97            	ld	xl,a
1335  04a3 d60000        	ld	a,(_LCD_Line,x)
1336  04a6 ab09          	add	a,#9
1337  04a8 8d000000      	callf	f_Set_LCD_Address
1339                     ; 416 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1340  04ac 7201000b04    	btjf	_uc_Rx_TimeOut_Reg,#0,L344
1344  04b1 acf206f2      	jpf	LC023
1345  04b5               L344:
1346                     ; 418 					uc_buffer = (U8)((uc_Rx1_Data[0] & 0x0C) >> 2);
1347  04b5 c60000        	ld	a,_uc_Rx1_Data
1348  04b8 a40c          	and	a,#12
1349  04ba 44            	srl	a
1350  04bb 44            	srl	a
1351  04bc 6b05          	ld	(OFST-1,sp),a
1352                     ; 419 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
1353  04be 2607          	jrne	L154
1355  04c0 ae00d3        	ldw	x,#L354
1358  04c3 acf506f5      	jpf	LC022
1359  04c7               L154:
1360                     ; 420 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
1361  04c7 a101          	cp	a,#1
1362  04c9 2607          	jrne	L754
1364  04cb ae00ce        	ldw	x,#L164
1367  04ce acf506f5      	jpf	LC022
1368  04d2               L754:
1369                     ; 421 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
1370  04d2 a102          	cp	a,#2
1371  04d4 2607          	jrne	L564
1373  04d6 ae00ca        	ldw	x,#L764
1376  04d9 acf506f5      	jpf	LC022
1377  04dd               L564:
1378                     ; 422 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
1379  04dd a103          	cp	a,#3
1380  04df 2704ac110711  	jrne	L774
1382  04e5 ae00c5        	ldw	x,#L574
1384  04e8 acf506f5      	jpf	LC022
1385  04ec               L334:
1386                     ; 427 			else if(uc_line_index == (U8)(1)){	// LINE 2
1387  04ec a101          	cp	a,#1
1388  04ee 2704ac290629  	jrne	L105
1389                     ; 430 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
1390  04f4 5f            	clrw	x
1391  04f5 97            	ld	xl,a
1392  04f6 d60000        	ld	a,(_LCD_Line,x)
1393  04f9 ab03          	add	a,#3
1394  04fb 8d000000      	callf	f_Set_LCD_Address
1396                     ; 431 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
1397  04ff 7205000c65    	btjf	_uc_Test_Ctrl_Reg,#2,L305
1399  0504 7b06          	ld	a,(OFST+0,sp)
1400  0506 c10002        	cp	a,_uc_Test_Data_Select_Num
1401  0509 265e          	jrne	L305
1402                     ; 432 					if(b_Blink_250_Flag){
1403  050b 7202000004ac  	btjf	_uc_LCD_Blink_Reg,#1,L345
1404                     ; 433 						if(!uc_Target_Display_Mode){	// Percentage_Display
1405  0514 725d0000      	tnz	_uc_Target_Display_Mode
1406  0518 2623          	jrne	L705
1407                     ; 434 							Num_Display_LCD(uc_Target_Duty_Perc /(U8)(2));
1408  051a c6000a        	ld	a,_uc_Target_Duty_Perc
1409  051d 44            	srl	a
1410  051e 5f            	clrw	x
1411  051f 97            	ld	xl,a
1412  0520 8d000000      	callf	f_Num_Display_LCD
1414                     ; 435 							if(uc_Target_Duty_Perc < (U8)(200)){
1415  0524 c6000a        	ld	a,_uc_Target_Duty_Perc
1416  0527 a1c8          	cp	a,#200
1417  0529 24e5          	jruge	L345
1418                     ; 436 								Display_LCD_String(".");
1419  052b ae00f7        	ldw	x,#L353
1420  052e 8d000000      	callf	f_Display_LCD_String
1422                     ; 437 								uc_buffer = uc_Target_Duty_Perc % (U8)(2);
1423  0532 c6000a        	ld	a,_uc_Target_Duty_Perc
1424  0535 a401          	and	a,#1
1425  0537 6b05          	ld	(OFST-1,sp),a
1426                     ; 438 								if(uc_buffer){ Display_LCD_String("5"); }
1427  0539 275a          	jreq	L155
1431  053b 2053          	jpf	LC019
1432                     ; 439 								else{ Display_LCD_String("0"); }
1434  053d               L705:
1435                     ; 443 							if(uc_Target_Duty_Perc < (U8)(20)){ Num_Display_LCD(0u); }
1436  053d c6000a        	ld	a,_uc_Target_Duty_Perc
1437  0540 a114          	cp	a,#20
1441  0542 255d          	jrult	LC015
1442                     ; 444 							else if(uc_Target_Duty_Perc == (U8)(20)){ Num_Display_LCD(100u); }
1443  0544 c6000a        	ld	a,_uc_Target_Duty_Perc
1444  0547 a114          	cp	a,#20
1448  0549 2760          	jreq	LC016
1449                     ; 445 							else if(uc_Target_Duty_Perc == (U8)(180)){ Num_Display_LCD(6200u); }
1450  054b c6000a        	ld	a,_uc_Target_Duty_Perc
1451  054e a1b4          	cp	a,#180
1452  0550 2607          	jrne	L135
1454  0552               LC014:
1455  0552 ae1838        	ldw	x,#6200
1458  0555 acdc05dc      	jpf	LC012
1459  0559               L135:
1460                     ; 446 							else if(uc_Target_Duty_Perc == (U8)(190)){ Display_LCD_String("MAX"); }
1461  0559 c6000a        	ld	a,_uc_Target_Duty_Perc
1462  055c a1be          	cp	a,#190
1463  055e 265e          	jrne	L375
1465  0560               LC018:
1466  0560 ae00c1        	ldw	x,#L735
1467  0563               LC017:
1468  0563 8d000000      	callf	f_Display_LCD_String
1471  0567 2077          	jra	L345
1472                     ; 447 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
1477  0569               L305:
1478                     ; 451 					if(!uc_Target_Display_Mode){
1479  0569 725d0000      	tnz	_uc_Target_Display_Mode
1480  056d 262b          	jrne	L545
1481                     ; 452 						Num_Display_LCD(uc_Target_Duty_Perc /(U8)(2));
1482  056f c6000a        	ld	a,_uc_Target_Duty_Perc
1483  0572 44            	srl	a
1484  0573 5f            	clrw	x
1485  0574 97            	ld	xl,a
1486  0575 8d000000      	callf	f_Num_Display_LCD
1488                     ; 453 						if(uc_Target_Duty_Perc < (U8)(200)){
1489  0579 c6000a        	ld	a,_uc_Target_Duty_Perc
1490  057c a1c8          	cp	a,#200
1491  057e 2460          	jruge	L345
1492                     ; 454 							Display_LCD_String(".");
1493  0580 ae00f7        	ldw	x,#L353
1494  0583 8d000000      	callf	f_Display_LCD_String
1496                     ; 455 							uc_buffer = uc_Target_Duty_Perc % (U8)(2);
1497  0587 c6000a        	ld	a,_uc_Target_Duty_Perc
1498  058a a401          	and	a,#1
1499  058c 6b05          	ld	(OFST-1,sp),a
1500                     ; 456 							if(uc_buffer){ Display_LCD_String("5"); }
1501  058e 2705          	jreq	L155
1503  0590               LC019:
1504  0590 ae00f5        	ldw	x,#L753
1507  0593 20ce          	jpf	LC017
1508  0595               L155:
1509                     ; 457 							else{ Display_LCD_String("0"); }
1510  0595 ae00f3        	ldw	x,#L363
1512  0598 20c9          	jpf	LC017
1513  059a               L545:
1514                     ; 461 						if(uc_Target_Duty_Perc < (U8)(20)){ Num_Display_LCD(0u); }
1515  059a c6000a        	ld	a,_uc_Target_Duty_Perc
1516  059d a114          	cp	a,#20
1517  059f 2403          	jruge	L755
1519  05a1               LC015:
1520  05a1 5f            	clrw	x
1523  05a2 2038          	jpf	LC012
1524  05a4               L755:
1525                     ; 462 						else if(uc_Target_Duty_Perc == (U8)(20)){ Num_Display_LCD(100u); }
1526  05a4 c6000a        	ld	a,_uc_Target_Duty_Perc
1527  05a7 a114          	cp	a,#20
1528  05a9 2605          	jrne	L365
1530  05ab               LC016:
1531  05ab ae0064        	ldw	x,#100
1534  05ae 202c          	jpf	LC012
1535  05b0               L365:
1536                     ; 463 						else if(uc_Target_Duty_Perc == (U8)(180)){ Num_Display_LCD(6200u); }
1537  05b0 c6000a        	ld	a,_uc_Target_Duty_Perc
1538  05b3 a1b4          	cp	a,#180
1542  05b5 279b          	jreq	LC014
1543                     ; 464 						else if(uc_Target_Duty_Perc > (U8)(180)){ Display_LCD_String("MAX"); }
1544  05b7 c6000a        	ld	a,_uc_Target_Duty_Perc
1545  05ba a1b5          	cp	a,#181
1549  05bc 24a2          	jruge	LC018
1550  05be               L375:
1551                     ; 465 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
1554  05be c6000a        	ld	a,_uc_Target_Duty_Perc
1555  05c1 5f            	clrw	x
1556  05c2 97            	ld	xl,a
1557  05c3 1d0014        	subw	x,#20
1558  05c6 90ae94ed      	ldw	y,#38125
1559  05ca 8d000000      	callf	d_umul
1560  05ce ae0000        	ldw	x,#L642
1561  05d1 8d000000      	callf	d_ludv
1562  05d5 be02          	ldw	x,c_lreg+2
1563  05d7 1c0064        	addw	x,#100
1564  05da 1f03          	ldw	(OFST-3,sp),x
1566  05dc               LC012:
1567  05dc 8d000000      	callf	f_Num_Display_LCD
1569  05e0               L345:
1570                     ; 470 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
1571  05e0 7b06          	ld	a,(OFST+0,sp)
1572  05e2 5f            	clrw	x
1573  05e3 97            	ld	xl,a
1574  05e4 d60000        	ld	a,(_LCD_Line,x)
1575  05e7 ab0b          	add	a,#11
1576  05e9 8d000000      	callf	f_Set_LCD_Address
1578                     ; 471 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1579  05ed 7201000b04    	btjf	_uc_Rx_TimeOut_Reg,#0,L775
1583  05f2 acf206f2      	jpf	LC023
1584  05f6               L775:
1585                     ; 473 					Num_Display_LCD(uc_Rx1_Data[6] /(U8)(2));
1586  05f6 c60006        	ld	a,_uc_Rx1_Data+6
1587  05f9 44            	srl	a
1588  05fa 5f            	clrw	x
1589  05fb 97            	ld	xl,a
1590  05fc 8d000000      	callf	f_Num_Display_LCD
1592                     ; 474 					if(uc_Rx1_Data[6] < (U8)(200)){
1593  0600 c60006        	ld	a,_uc_Rx1_Data+6
1594  0603 a1c8          	cp	a,#200
1595  0605 2504ac110711  	jruge	L774
1596                     ; 475 						Display_LCD_String(".");
1597  060b ae00f7        	ldw	x,#L353
1598  060e 8d000000      	callf	f_Display_LCD_String
1600                     ; 476 						uc_buffer = uc_Rx1_Data[6] % (U8)(2);
1601  0612 c60006        	ld	a,_uc_Rx1_Data+6
1602  0615 a401          	and	a,#1
1603  0617 6b05          	ld	(OFST-1,sp),a
1604                     ; 477 						if(uc_buffer){ Display_LCD_String("5"); }
1605  0619 2707          	jreq	L506
1607  061b ae00f5        	ldw	x,#L753
1610  061e acf506f5      	jpf	LC022
1611  0622               L506:
1612                     ; 478 						else{ Display_LCD_String("0"); }
1613  0622 ae00f3        	ldw	x,#L363
1615  0625 acf506f5      	jpf	LC022
1616  0629               L105:
1617                     ; 484 			else if(uc_line_index == (U8)(2)){	// LINE 3
1618  0629 a102          	cp	a,#2
1619  062b 266a          	jrne	L316
1620                     ; 487 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
1621  062d 5f            	clrw	x
1622  062e 97            	ld	xl,a
1623  062f d60000        	ld	a,(_LCD_Line,x)
1624  0632 ab02          	add	a,#2
1625  0634 8d000000      	callf	f_Set_LCD_Address
1627                     ; 488 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
1628  0638 7201000b05    	btjf	_uc_Rx_TimeOut_Reg,#0,L516
1630  063d ae00bf        	ldw	x,#L716
1633  0640 200d          	jra	L126
1634  0642               L516:
1635                     ; 490 					if(uc_Rx1_Data[0] & 0x01){ Display_LCD_String("1"); }
1636  0642 7201000005    	btjf	_uc_Rx1_Data,#0,L326
1638  0647 ae00bd        	ldw	x,#L526
1641  064a 2003          	jra	L126
1642  064c               L326:
1643                     ; 491 					else{ Display_LCD_String("0"); }
1644  064c ae00f3        	ldw	x,#L363
1646  064f               L126:
1647  064f 8d000000      	callf	f_Display_LCD_String
1648                     ; 494 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
1649  0653 7b06          	ld	a,(OFST+0,sp)
1650  0655 5f            	clrw	x
1651  0656 97            	ld	xl,a
1652  0657 d60000        	ld	a,(_LCD_Line,x)
1653  065a ab06          	add	a,#6
1654  065c 8d000000      	callf	f_Set_LCD_Address
1656                     ; 495 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
1657  0660 7203000b05    	btjf	_uc_Rx_TimeOut_Reg,#1,L136
1659  0665 ae00bf        	ldw	x,#L716
1662  0668 200d          	jra	L336
1663  066a               L136:
1664                     ; 497 					if(uc_Rx2_Data[0] & 0x01){ Display_LCD_String("1"); }
1665  066a 7201000805    	btjf	_uc_Rx2_Data,#0,L536
1667  066f ae00bd        	ldw	x,#L526
1670  0672 2003          	jra	L336
1671  0674               L536:
1672                     ; 498 					else{ Display_LCD_String("0"); }
1673  0674 ae00f3        	ldw	x,#L363
1675  0677               L336:
1676  0677 8d000000      	callf	f_Display_LCD_String
1677                     ; 501 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
1678  067b 7b06          	ld	a,(OFST+0,sp)
1679  067d 5f            	clrw	x
1680  067e 97            	ld	xl,a
1681  067f d60000        	ld	a,(_LCD_Line,x)
1682  0682 ab0b          	add	a,#11
1683  0684 8d000000      	callf	f_Set_LCD_Address
1685                     ; 502 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1686  0688 7201000b02    	btjf	_uc_Rx_TimeOut_Reg,#0,L146
1690  068d 2063          	jpf	LC023
1691  068f               L146:
1692                     ; 504 					ui_buffer = (U16)(uc_Rx1_Data[4]) * (U16)(2);
1693  068f c60004        	ld	a,_uc_Rx1_Data+4
1694  0692 5f            	clrw	x
1695  0693 97            	ld	xl,a
1696  0694 58            	sllw	x
1697                     ; 505 					Num_Display_LCD(ui_buffer);
1699  0695 2074          	jpf	LC021
1700  0697               L316:
1701                     ; 510 			else if(uc_line_index == (U8)(3)){	// LINE 4
1702  0697 a103          	cp	a,#3
1703  0699 2676          	jrne	L774
1704                     ; 513 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
1705  069b 5f            	clrw	x
1706  069c 97            	ld	xl,a
1707  069d d60000        	ld	a,(_LCD_Line,x)
1708  06a0 ab03          	add	a,#3
1709  06a2 8d000000      	callf	f_Set_LCD_Address
1711                     ; 514 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1712  06a6 7201000b09    	btjf	_uc_Rx_TimeOut_Reg,#0,L156
1714  06ab ae00d8        	ldw	x,#L544
1715  06ae 8d000000      	callf	f_Display_LCD_String
1718  06b2 202c          	jra	L356
1719  06b4               L156:
1720                     ; 516 					Num_Display_LCD(uc_Rx1_Data[5] / (U8)(5));
1721  06b4 c60005        	ld	a,_uc_Rx1_Data+5
1722  06b7 5f            	clrw	x
1723  06b8 97            	ld	xl,a
1724  06b9 a605          	ld	a,#5
1725  06bb 8d000000      	callf	d_sdivx
1727  06bf 8d000000      	callf	f_Num_Display_LCD
1729                     ; 517 					Display_LCD_String(".");
1730  06c3 ae00f7        	ldw	x,#L353
1731  06c6 8d000000      	callf	f_Display_LCD_String
1733                     ; 518 					uc_buffer = uc_Rx1_Data[5] % (U8)(5);
1734  06ca c60005        	ld	a,_uc_Rx1_Data+5
1735  06cd ae0005        	ldw	x,#5
1736  06d0 9093          	ldw	y,x
1737  06d2 5f            	clrw	x
1738  06d3 97            	ld	xl,a
1739  06d4 65            	divw	x,y
1740  06d5 909f          	ld	a,yl
1741  06d7 6b05          	ld	(OFST-1,sp),a
1742                     ; 519 					Num_Display_LCD(uc_buffer * (U8)(2));
1743  06d9 5f            	clrw	x
1744  06da 97            	ld	xl,a
1745  06db 58            	sllw	x
1746  06dc 8d000000      	callf	f_Num_Display_LCD
1748  06e0               L356:
1749                     ; 523 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
1750  06e0 7b06          	ld	a,(OFST+0,sp)
1751  06e2 5f            	clrw	x
1752  06e3 97            	ld	xl,a
1753  06e4 d60000        	ld	a,(_LCD_Line,x)
1754  06e7 ab0b          	add	a,#11
1755  06e9 8d000000      	callf	f_Set_LCD_Address
1757                     ; 524 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1758  06ed 7201000b09    	btjf	_uc_Rx_TimeOut_Reg,#0,L556
1760  06f2               LC023:
1761  06f2 ae00d8        	ldw	x,#L544
1762  06f5               LC022:
1763  06f5 8d000000      	callf	f_Display_LCD_String
1766  06f9 2016          	jra	L774
1767  06fb               L556:
1768                     ; 526 					ui_buffer = (U16)(uc_Rx1_Data[3] << 8) + (U16)(uc_Rx1_Data[2]);
1769  06fb c60002        	ld	a,_uc_Rx1_Data+2
1770  06fe 5f            	clrw	x
1771  06ff 97            	ld	xl,a
1772  0700 1f01          	ldw	(OFST-5,sp),x
1773  0702 c60003        	ld	a,_uc_Rx1_Data+3
1774  0705 97            	ld	xl,a
1775  0706 4f            	clr	a
1776  0707 02            	rlwa	x,a
1777  0708 72fb01        	addw	x,(OFST-5,sp)
1778                     ; 527 					Num_Display_LCD(ui_buffer);
1779  070b               LC021:
1780  070b 1f03          	ldw	(OFST-3,sp),x
1781  070d 8d000000      	callf	f_Num_Display_LCD
1783  0711               L774:
1784                     ; 387 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
1785  0711 0c06          	inc	(OFST+0,sp)
1787  0713 7b06          	ld	a,(OFST+0,sp)
1788  0715 a104          	cp	a,#4
1789  0717 2404ac2b042b  	jrult	L373
1791  071d ac780b78      	jra	L166
1792  0721               L173:
1793                     ; 534 	else if(uc_Test_Page_Now == (U8)(1)){
1794  0721 c60004        	ld	a,_uc_Test_Page_Now
1795  0724 4a            	dec	a
1796  0725 2704acd107d1  	jrne	L366
1797                     ; 535 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
1798  072b 6b06          	ld	(OFST+0,sp),a
1799  072d               L566:
1800                     ; 537 			Set_LCD_Address(LCD_Line[uc_line_index]);
1801  072d 5f            	clrw	x
1802  072e 97            	ld	xl,a
1803  072f d60000        	ld	a,(_LCD_Line,x)
1804  0732 8d000000      	callf	f_Set_LCD_Address
1806                     ; 538 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
1807  0736 7b06          	ld	a,(OFST+0,sp)
1808  0738 97            	ld	xl,a
1809  0739 a610          	ld	a,#16
1810  073b 42            	mul	x,a
1811  073c 1c0000        	addw	x,#_LCD_Dis_Data
1812  073f 8d000000      	callf	f_Display_LCD_String
1814                     ; 541 			if(uc_line_index == (U8)(0)){		// LINE 1
1815  0743 7b06          	ld	a,(OFST+0,sp)
1816  0745 263d          	jrne	L376
1817                     ; 544 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
1818  0747 5f            	clrw	x
1819  0748 97            	ld	xl,a
1820  0749 d60000        	ld	a,(_LCD_Line,x)
1821  074c ab03          	add	a,#3
1822  074e 8d000000      	callf	f_Set_LCD_Address
1824                     ; 545 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1825  0752 7201000b09    	btjf	_uc_Rx_TimeOut_Reg,#0,L576
1827  0757 ae00d8        	ldw	x,#L544
1828  075a 8d000000      	callf	f_Display_LCD_String
1831  075e 2024          	jra	L376
1832  0760               L576:
1833                     ; 547 					if(uc_Rx1_Data[1] < (U8)(40)){
1834  0760 c60001        	ld	a,_uc_Rx1_Data+1
1835  0763 a128          	cp	a,#40
1836  0765 2414          	jruge	L107
1837                     ; 548 						Display_LCD_String("-");
1838  0767 ae00bb        	ldw	x,#L307
1839  076a 8d000000      	callf	f_Display_LCD_String
1841                     ; 549 						Num_Display_LCD((U8)(40) - uc_Rx1_Data[1]);
1842  076e 4f            	clr	a
1843  076f 97            	ld	xl,a
1844  0770 a628          	ld	a,#40
1845  0772 c00001        	sub	a,_uc_Rx1_Data+1
1846  0775 2401          	jrnc	L273
1847  0777 5a            	decw	x
1848  0778               L273:
1849  0778 02            	rlwa	x,a
1852  0779 2005          	jpf	LC024
1853  077b               L107:
1854                     ; 552 						Num_Display_LCD(uc_Rx1_Data[1] - (U8)(40));
1855  077b 5f            	clrw	x
1856  077c 97            	ld	xl,a
1857  077d 1d0028        	subw	x,#40
1858  0780               LC024:
1859  0780 8d000000      	callf	f_Num_Display_LCD
1861  0784               L376:
1862                     ; 558 			if(uc_line_index == (U8)(1)){		// LINE 2
1863  0784 7b06          	ld	a,(OFST+0,sp)
1864  0786 a101          	cp	a,#1
1865  0788 2637          	jrne	L707
1866                     ; 561 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
1867  078a 5f            	clrw	x
1868  078b 97            	ld	xl,a
1869  078c d60000        	ld	a,(_LCD_Line,x)
1870  078f ab04          	add	a,#4
1871  0791 8d000000      	callf	f_Set_LCD_Address
1873                     ; 562 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
1874  0795 7203000b09    	btjf	_uc_Rx_TimeOut_Reg,#1,L117
1876  079a ae00d8        	ldw	x,#L544
1877  079d 8d000000      	callf	f_Display_LCD_String
1880  07a1 201e          	jra	L707
1881  07a3               L117:
1882                     ; 564 					Num_Display_LCD(uc_Rx2_Data[7] >> 4);  				//SoftWare Version Display
1883  07a3 c6000f        	ld	a,_uc_Rx2_Data+7
1884  07a6 4e            	swap	a
1885  07a7 a40f          	and	a,#15
1886  07a9 5f            	clrw	x
1887  07aa 97            	ld	xl,a
1888  07ab 8d000000      	callf	f_Num_Display_LCD
1890                     ; 565 					Display_LCD_String(".");
1891  07af ae00f7        	ldw	x,#L353
1892  07b2 8d000000      	callf	f_Display_LCD_String
1894                     ; 566 					Num_Display_LCD(uc_Rx2_Data[7] & 0x0F);  			//SoftWare Version Display
1895  07b6 c6000f        	ld	a,_uc_Rx2_Data+7
1896  07b9 a40f          	and	a,#15
1897  07bb 5f            	clrw	x
1898  07bc 97            	ld	xl,a
1899  07bd 8d000000      	callf	f_Num_Display_LCD
1901  07c1               L707:
1902                     ; 571 			if(uc_line_index == (U8)(2)){		// LINE 2
1903                     ; 576 			if(uc_line_index == (U8)(3)){		// LINE 3
1904                     ; 535 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
1905  07c1 0c06          	inc	(OFST+0,sp)
1907  07c3 7b06          	ld	a,(OFST+0,sp)
1908  07c5 a104          	cp	a,#4
1909  07c7 2404ac2d072d  	jrult	L566
1911  07cd ac780b78      	jra	L166
1912  07d1               L366:
1913                     ; 583 		if(b_Rx2_Msg_TimeOut_Flag){
1914  07d1 7203000b0e    	btjf	_uc_Rx_TimeOut_Reg,#1,L327
1915                     ; 584 			Set_LCD_Address(LCD_Line[0]);	
1916  07d6 c60000        	ld	a,_LCD_Line
1917  07d9 8d000000      	callf	f_Set_LCD_Address
1919                     ; 585 			Display_LCD_String("NC");
1920  07dd ae00d8        	ldw	x,#L544
1923  07e0 ac740b74      	jpf	LC025
1924  07e4               L327:
1925                     ; 588 			uc_fault_cnt = (U8)(0);
1926  07e4 0f06          	clr	(OFST+0,sp)
1927                     ; 590 			if(uc_Rx2_Data[1] & (U8)(0x01)){
1928  07e6 720100093b    	btjf	_uc_Rx2_Data+1,#0,L727
1929                     ; 591 				uc_fault_cnt++;
1930  07eb 0c06          	inc	(OFST+0,sp)
1931                     ; 592 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
1931                     ; 593 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
1931                     ; 594 				){
1932  07ed 270d          	jreq	L537
1934  07ef 7b06          	ld	a,(OFST+0,sp)
1935  07f1 a105          	cp	a,#5
1936  07f3 2407          	jruge	L537
1938  07f5 c60004        	ld	a,_uc_Test_Page_Now
1939  07f8 a102          	cp	a,#2
1940  07fa 2711          	jreq	L337
1941  07fc               L537:
1943  07fc 7b06          	ld	a,(OFST+0,sp)
1944  07fe a105          	cp	a,#5
1945  0800 2524          	jrult	L727
1947  0802 a109          	cp	a,#9
1948  0804 2420          	jruge	L727
1950  0806 c60004        	ld	a,_uc_Test_Page_Now
1951  0809 a103          	cp	a,#3
1952  080b 2619          	jrne	L727
1953  080d               L337:
1954                     ; 595 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
1955  080d 7b06          	ld	a,(OFST+0,sp)
1956  080f 5f            	clrw	x
1957  0810 97            	ld	xl,a
1958  0811 5a            	decw	x
1959  0812 a604          	ld	a,#4
1960  0814 8d000000      	callf	d_smodx
1962  0818 d60000        	ld	a,(_LCD_Line,x)
1963  081b 8d000000      	callf	f_Set_LCD_Address
1965                     ; 596 					Display_LCD_String("Flt_LVLow");
1966  081f ae00b1        	ldw	x,#L147
1967  0822 8d000000      	callf	f_Display_LCD_String
1969  0826               L727:
1970                     ; 600 			if(uc_Rx2_Data[1] & (U8)(0x02)){
1971  0826 720300093b    	btjf	_uc_Rx2_Data+1,#1,L347
1972                     ; 601 				uc_fault_cnt++;
1973  082b 0c06          	inc	(OFST+0,sp)
1974                     ; 602 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
1974                     ; 603 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
1974                     ; 604 				){
1975  082d 270d          	jreq	L157
1977  082f 7b06          	ld	a,(OFST+0,sp)
1978  0831 a105          	cp	a,#5
1979  0833 2407          	jruge	L157
1981  0835 c60004        	ld	a,_uc_Test_Page_Now
1982  0838 a102          	cp	a,#2
1983  083a 2711          	jreq	L747
1984  083c               L157:
1986  083c 7b06          	ld	a,(OFST+0,sp)
1987  083e a105          	cp	a,#5
1988  0840 2524          	jrult	L347
1990  0842 a109          	cp	a,#9
1991  0844 2420          	jruge	L347
1993  0846 c60004        	ld	a,_uc_Test_Page_Now
1994  0849 a103          	cp	a,#3
1995  084b 2619          	jrne	L347
1996  084d               L747:
1997                     ; 605 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
1998  084d 7b06          	ld	a,(OFST+0,sp)
1999  084f 5f            	clrw	x
2000  0850 97            	ld	xl,a
2001  0851 5a            	decw	x
2002  0852 a604          	ld	a,#4
2003  0854 8d000000      	callf	d_smodx
2005  0858 d60000        	ld	a,(_LCD_Line,x)
2006  085b 8d000000      	callf	f_Set_LCD_Address
2008                     ; 606 					Display_LCD_String("Flt_LVHigh");
2009  085f ae00a6        	ldw	x,#L557
2010  0862 8d000000      	callf	f_Display_LCD_String
2012  0866               L347:
2013                     ; 610 			if(uc_Rx2_Data[1] & (U8)(0x04)){
2014  0866 720500093b    	btjf	_uc_Rx2_Data+1,#2,L757
2015                     ; 611 				uc_fault_cnt++;
2016  086b 0c06          	inc	(OFST+0,sp)
2017                     ; 612 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2017                     ; 613 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2017                     ; 614 				){
2018  086d 270d          	jreq	L567
2020  086f 7b06          	ld	a,(OFST+0,sp)
2021  0871 a105          	cp	a,#5
2022  0873 2407          	jruge	L567
2024  0875 c60004        	ld	a,_uc_Test_Page_Now
2025  0878 a102          	cp	a,#2
2026  087a 2711          	jreq	L367
2027  087c               L567:
2029  087c 7b06          	ld	a,(OFST+0,sp)
2030  087e a105          	cp	a,#5
2031  0880 2524          	jrult	L757
2033  0882 a109          	cp	a,#9
2034  0884 2420          	jruge	L757
2036  0886 c60004        	ld	a,_uc_Test_Page_Now
2037  0889 a103          	cp	a,#3
2038  088b 2619          	jrne	L757
2039  088d               L367:
2040                     ; 615 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2041  088d 7b06          	ld	a,(OFST+0,sp)
2042  088f 5f            	clrw	x
2043  0890 97            	ld	xl,a
2044  0891 5a            	decw	x
2045  0892 a604          	ld	a,#4
2046  0894 8d000000      	callf	d_smodx
2048  0898 d60000        	ld	a,(_LCD_Line,x)
2049  089b 8d000000      	callf	f_Set_LCD_Address
2051                     ; 616 					Display_LCD_String("Flt_HVLow");
2052  089f ae009c        	ldw	x,#L177
2053  08a2 8d000000      	callf	f_Display_LCD_String
2055  08a6               L757:
2056                     ; 620 			if(uc_Rx2_Data[1] & (U8)(0x08)){
2057  08a6 720700093b    	btjf	_uc_Rx2_Data+1,#3,L377
2058                     ; 621 				uc_fault_cnt++;
2059  08ab 0c06          	inc	(OFST+0,sp)
2060                     ; 622 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2060                     ; 623 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2060                     ; 624 				){
2061  08ad 270d          	jreq	L1001
2063  08af 7b06          	ld	a,(OFST+0,sp)
2064  08b1 a105          	cp	a,#5
2065  08b3 2407          	jruge	L1001
2067  08b5 c60004        	ld	a,_uc_Test_Page_Now
2068  08b8 a102          	cp	a,#2
2069  08ba 2711          	jreq	L777
2070  08bc               L1001:
2072  08bc 7b06          	ld	a,(OFST+0,sp)
2073  08be a105          	cp	a,#5
2074  08c0 2524          	jrult	L377
2076  08c2 a109          	cp	a,#9
2077  08c4 2420          	jruge	L377
2079  08c6 c60004        	ld	a,_uc_Test_Page_Now
2080  08c9 a103          	cp	a,#3
2081  08cb 2619          	jrne	L377
2082  08cd               L777:
2083                     ; 625 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
2084  08cd 7b06          	ld	a,(OFST+0,sp)
2085  08cf 5f            	clrw	x
2086  08d0 97            	ld	xl,a
2087  08d1 5a            	decw	x
2088  08d2 a604          	ld	a,#4
2089  08d4 8d000000      	callf	d_smodx
2091  08d8 d60000        	ld	a,(_LCD_Line,x)
2092  08db 8d000000      	callf	f_Set_LCD_Address
2094                     ; 626 					Display_LCD_String("Flt_HVHigh");
2095  08df ae0091        	ldw	x,#L5001
2096  08e2 8d000000      	callf	f_Display_LCD_String
2098  08e6               L377:
2099                     ; 630 			if(uc_Rx2_Data[1] & (U8)(0x10)){
2100  08e6 720900093b    	btjf	_uc_Rx2_Data+1,#4,L7001
2101                     ; 631 				uc_fault_cnt++;
2102  08eb 0c06          	inc	(OFST+0,sp)
2103                     ; 632 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2103                     ; 633 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2103                     ; 634 				){
2104  08ed 270d          	jreq	L5101
2106  08ef 7b06          	ld	a,(OFST+0,sp)
2107  08f1 a105          	cp	a,#5
2108  08f3 2407          	jruge	L5101
2110  08f5 c60004        	ld	a,_uc_Test_Page_Now
2111  08f8 a102          	cp	a,#2
2112  08fa 2711          	jreq	L3101
2113  08fc               L5101:
2115  08fc 7b06          	ld	a,(OFST+0,sp)
2116  08fe a105          	cp	a,#5
2117  0900 2524          	jrult	L7001
2119  0902 a109          	cp	a,#9
2120  0904 2420          	jruge	L7001
2122  0906 c60004        	ld	a,_uc_Test_Page_Now
2123  0909 a103          	cp	a,#3
2124  090b 2619          	jrne	L7001
2125  090d               L3101:
2126                     ; 635 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2127  090d 7b06          	ld	a,(OFST+0,sp)
2128  090f 5f            	clrw	x
2129  0910 97            	ld	xl,a
2130  0911 5a            	decw	x
2131  0912 a604          	ld	a,#4
2132  0914 8d000000      	callf	d_smodx
2134  0918 d60000        	ld	a,(_LCD_Line,x)
2135  091b 8d000000      	callf	f_Set_LCD_Address
2137                     ; 636 					Display_LCD_String("Flt_OverCur");
2138  091f ae0085        	ldw	x,#L1201
2139  0922 8d000000      	callf	f_Display_LCD_String
2141  0926               L7001:
2142                     ; 640 			if(uc_Rx2_Data[1] & (U8)(0x80)){
2143  0926 720f00093b    	btjf	_uc_Rx2_Data+1,#7,L3201
2144                     ; 641 				uc_fault_cnt++;
2145  092b 0c06          	inc	(OFST+0,sp)
2146                     ; 642 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2146                     ; 643 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2146                     ; 644 				){
2147  092d 270d          	jreq	L1301
2149  092f 7b06          	ld	a,(OFST+0,sp)
2150  0931 a105          	cp	a,#5
2151  0933 2407          	jruge	L1301
2153  0935 c60004        	ld	a,_uc_Test_Page_Now
2154  0938 a102          	cp	a,#2
2155  093a 2711          	jreq	L7201
2156  093c               L1301:
2158  093c 7b06          	ld	a,(OFST+0,sp)
2159  093e a105          	cp	a,#5
2160  0940 2524          	jrult	L3201
2162  0942 a109          	cp	a,#9
2163  0944 2420          	jruge	L3201
2165  0946 c60004        	ld	a,_uc_Test_Page_Now
2166  0949 a103          	cp	a,#3
2167  094b 2619          	jrne	L3201
2168  094d               L7201:
2169                     ; 645 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2170  094d 7b06          	ld	a,(OFST+0,sp)
2171  094f 5f            	clrw	x
2172  0950 97            	ld	xl,a
2173  0951 5a            	decw	x
2174  0952 a604          	ld	a,#4
2175  0954 8d000000      	callf	d_smodx
2177  0958 d60000        	ld	a,(_LCD_Line,x)
2178  095b 8d000000      	callf	f_Set_LCD_Address
2180                     ; 646 					Display_LCD_String("Flt_ThmShut");
2181  095f ae0079        	ldw	x,#L5301
2182  0962 8d000000      	callf	f_Display_LCD_String
2184  0966               L3201:
2185                     ; 650 			if(uc_Rx2_Data[2] & (U8)(0x01)){
2186  0966 7201000a3b    	btjf	_uc_Rx2_Data+2,#0,L7301
2187                     ; 651 				uc_fault_cnt++;
2188  096b 0c06          	inc	(OFST+0,sp)
2189                     ; 652 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2189                     ; 653 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2189                     ; 654 				){
2190  096d 270d          	jreq	L5401
2192  096f 7b06          	ld	a,(OFST+0,sp)
2193  0971 a105          	cp	a,#5
2194  0973 2407          	jruge	L5401
2196  0975 c60004        	ld	a,_uc_Test_Page_Now
2197  0978 a102          	cp	a,#2
2198  097a 2711          	jreq	L3401
2199  097c               L5401:
2201  097c 7b06          	ld	a,(OFST+0,sp)
2202  097e a105          	cp	a,#5
2203  0980 2524          	jrult	L7301
2205  0982 a109          	cp	a,#9
2206  0984 2420          	jruge	L7301
2208  0986 c60004        	ld	a,_uc_Test_Page_Now
2209  0989 a103          	cp	a,#3
2210  098b 2619          	jrne	L7301
2211  098d               L3401:
2212                     ; 655 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
2213  098d 7b06          	ld	a,(OFST+0,sp)
2214  098f 5f            	clrw	x
2215  0990 97            	ld	xl,a
2216  0991 5a            	decw	x
2217  0992 a604          	ld	a,#4
2218  0994 8d000000      	callf	d_smodx
2220  0998 d60000        	ld	a,(_LCD_Line,x)
2221  099b 8d000000      	callf	f_Set_LCD_Address
2223                     ; 656 					Display_LCD_String("Flt_PCBThmShut");
2224  099f ae006a        	ldw	x,#L1501
2225  09a2 8d000000      	callf	f_Display_LCD_String
2227  09a6               L7301:
2228                     ; 660 			if(uc_Rx2_Data[3] & (U8)(0x01)){
2229  09a6 7201000b3b    	btjf	_uc_Rx2_Data+3,#0,L3501
2230                     ; 661 				uc_fault_cnt++;
2231  09ab 0c06          	inc	(OFST+0,sp)
2232                     ; 662 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2232                     ; 663 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2232                     ; 664 				){
2233  09ad 270d          	jreq	L1601
2235  09af 7b06          	ld	a,(OFST+0,sp)
2236  09b1 a105          	cp	a,#5
2237  09b3 2407          	jruge	L1601
2239  09b5 c60004        	ld	a,_uc_Test_Page_Now
2240  09b8 a102          	cp	a,#2
2241  09ba 2711          	jreq	L7501
2242  09bc               L1601:
2244  09bc 7b06          	ld	a,(OFST+0,sp)
2245  09be a105          	cp	a,#5
2246  09c0 2524          	jrult	L3501
2248  09c2 a109          	cp	a,#9
2249  09c4 2420          	jruge	L3501
2251  09c6 c60004        	ld	a,_uc_Test_Page_Now
2252  09c9 a103          	cp	a,#3
2253  09cb 2619          	jrne	L3501
2254  09cd               L7501:
2255                     ; 665 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2256  09cd 7b06          	ld	a,(OFST+0,sp)
2257  09cf 5f            	clrw	x
2258  09d0 97            	ld	xl,a
2259  09d1 5a            	decw	x
2260  09d2 a604          	ld	a,#4
2261  09d4 8d000000      	callf	d_smodx
2263  09d8 d60000        	ld	a,(_LCD_Line,x)
2264  09db 8d000000      	callf	f_Set_LCD_Address
2266                     ; 666 					Display_LCD_String("Flt_MsgTimeOut");
2267  09df ae005b        	ldw	x,#L5601
2268  09e2 8d000000      	callf	f_Display_LCD_String
2270  09e6               L3501:
2271                     ; 670 			if(uc_Rx2_Data[4] & (U8)(0x01)){
2272  09e6 7201000c3b    	btjf	_uc_Rx2_Data+4,#0,L7601
2273                     ; 671 				uc_fault_cnt++;
2274  09eb 0c06          	inc	(OFST+0,sp)
2275                     ; 672 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2275                     ; 673 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2275                     ; 674 				){
2276  09ed 270d          	jreq	L5701
2278  09ef 7b06          	ld	a,(OFST+0,sp)
2279  09f1 a105          	cp	a,#5
2280  09f3 2407          	jruge	L5701
2282  09f5 c60004        	ld	a,_uc_Test_Page_Now
2283  09f8 a102          	cp	a,#2
2284  09fa 2711          	jreq	L3701
2285  09fc               L5701:
2287  09fc 7b06          	ld	a,(OFST+0,sp)
2288  09fe a105          	cp	a,#5
2289  0a00 2524          	jrult	L7601
2291  0a02 a109          	cp	a,#9
2292  0a04 2420          	jruge	L7601
2294  0a06 c60004        	ld	a,_uc_Test_Page_Now
2295  0a09 a103          	cp	a,#3
2296  0a0b 2619          	jrne	L7601
2297  0a0d               L3701:
2298                     ; 675 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2299  0a0d 7b06          	ld	a,(OFST+0,sp)
2300  0a0f 5f            	clrw	x
2301  0a10 97            	ld	xl,a
2302  0a11 5a            	decw	x
2303  0a12 a604          	ld	a,#4
2304  0a14 8d000000      	callf	d_smodx
2306  0a18 d60000        	ld	a,(_LCD_Line,x)
2307  0a1b 8d000000      	callf	f_Set_LCD_Address
2309                     ; 676 					Display_LCD_String("Fail_HVSen");
2310  0a1f ae0050        	ldw	x,#L1011
2311  0a22 8d000000      	callf	f_Display_LCD_String
2313  0a26               L7601:
2314                     ; 680 			if(uc_Rx2_Data[4] & (U8)(0x02)){
2315  0a26 7203000c3b    	btjf	_uc_Rx2_Data+4,#1,L3011
2316                     ; 681 				uc_fault_cnt++;
2317  0a2b 0c06          	inc	(OFST+0,sp)
2318                     ; 682 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2318                     ; 683 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2318                     ; 684 				){
2319  0a2d 270d          	jreq	L1111
2321  0a2f 7b06          	ld	a,(OFST+0,sp)
2322  0a31 a105          	cp	a,#5
2323  0a33 2407          	jruge	L1111
2325  0a35 c60004        	ld	a,_uc_Test_Page_Now
2326  0a38 a102          	cp	a,#2
2327  0a3a 2711          	jreq	L7011
2328  0a3c               L1111:
2330  0a3c 7b06          	ld	a,(OFST+0,sp)
2331  0a3e a105          	cp	a,#5
2332  0a40 2524          	jrult	L3011
2334  0a42 a109          	cp	a,#9
2335  0a44 2420          	jruge	L3011
2337  0a46 c60004        	ld	a,_uc_Test_Page_Now
2338  0a49 a103          	cp	a,#3
2339  0a4b 2619          	jrne	L3011
2340  0a4d               L7011:
2341                     ; 685 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2342  0a4d 7b06          	ld	a,(OFST+0,sp)
2343  0a4f 5f            	clrw	x
2344  0a50 97            	ld	xl,a
2345  0a51 5a            	decw	x
2346  0a52 a604          	ld	a,#4
2347  0a54 8d000000      	callf	d_smodx
2349  0a58 d60000        	ld	a,(_LCD_Line,x)
2350  0a5b 8d000000      	callf	f_Set_LCD_Address
2352                     ; 686 					Display_LCD_String("Fail_LVSen");
2353  0a5f ae0045        	ldw	x,#L5111
2354  0a62 8d000000      	callf	f_Display_LCD_String
2356  0a66               L3011:
2357                     ; 690 			if(uc_Rx2_Data[4] & (U8)(0x04)){
2358  0a66 7205000c3b    	btjf	_uc_Rx2_Data+4,#2,L7111
2359                     ; 691 				uc_fault_cnt++;
2360  0a6b 0c06          	inc	(OFST+0,sp)
2361                     ; 692 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2361                     ; 693 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2361                     ; 694 				){
2362  0a6d 270d          	jreq	L5211
2364  0a6f 7b06          	ld	a,(OFST+0,sp)
2365  0a71 a105          	cp	a,#5
2366  0a73 2407          	jruge	L5211
2368  0a75 c60004        	ld	a,_uc_Test_Page_Now
2369  0a78 a102          	cp	a,#2
2370  0a7a 2711          	jreq	L3211
2371  0a7c               L5211:
2373  0a7c 7b06          	ld	a,(OFST+0,sp)
2374  0a7e a105          	cp	a,#5
2375  0a80 2524          	jrult	L7111
2377  0a82 a109          	cp	a,#9
2378  0a84 2420          	jruge	L7111
2380  0a86 c60004        	ld	a,_uc_Test_Page_Now
2381  0a89 a103          	cp	a,#3
2382  0a8b 2619          	jrne	L7111
2383  0a8d               L3211:
2384                     ; 695 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2385  0a8d 7b06          	ld	a,(OFST+0,sp)
2386  0a8f 5f            	clrw	x
2387  0a90 97            	ld	xl,a
2388  0a91 5a            	decw	x
2389  0a92 a604          	ld	a,#4
2390  0a94 8d000000      	callf	d_smodx
2392  0a98 d60000        	ld	a,(_LCD_Line,x)
2393  0a9b 8d000000      	callf	f_Set_LCD_Address
2395                     ; 696 					Display_LCD_String("Fail_CurSen");
2396  0a9f ae0039        	ldw	x,#L1311
2397  0aa2 8d000000      	callf	f_Display_LCD_String
2399  0aa6               L7111:
2400                     ; 700 			if(uc_Rx2_Data[4] & (U8)(0x40)){
2401  0aa6 720d000c3b    	btjf	_uc_Rx2_Data+4,#6,L3311
2402                     ; 701 				uc_fault_cnt++;
2403  0aab 0c06          	inc	(OFST+0,sp)
2404                     ; 702 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2404                     ; 703 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2404                     ; 704 				){
2405  0aad 270d          	jreq	L1411
2407  0aaf 7b06          	ld	a,(OFST+0,sp)
2408  0ab1 a105          	cp	a,#5
2409  0ab3 2407          	jruge	L1411
2411  0ab5 c60004        	ld	a,_uc_Test_Page_Now
2412  0ab8 a102          	cp	a,#2
2413  0aba 2711          	jreq	L7311
2414  0abc               L1411:
2416  0abc 7b06          	ld	a,(OFST+0,sp)
2417  0abe a105          	cp	a,#5
2418  0ac0 2524          	jrult	L3311
2420  0ac2 a109          	cp	a,#9
2421  0ac4 2420          	jruge	L3311
2423  0ac6 c60004        	ld	a,_uc_Test_Page_Now
2424  0ac9 a103          	cp	a,#3
2425  0acb 2619          	jrne	L3311
2426  0acd               L7311:
2427                     ; 705 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
2428  0acd 7b06          	ld	a,(OFST+0,sp)
2429  0acf 5f            	clrw	x
2430  0ad0 97            	ld	xl,a
2431  0ad1 5a            	decw	x
2432  0ad2 a604          	ld	a,#4
2433  0ad4 8d000000      	callf	d_smodx
2435  0ad8 d60000        	ld	a,(_LCD_Line,x)
2436  0adb 8d000000      	callf	f_Set_LCD_Address
2438                     ; 706 					Display_LCD_String("Fail_CoreTemp");
2439  0adf ae002b        	ldw	x,#L5411
2440  0ae2 8d000000      	callf	f_Display_LCD_String
2442  0ae6               L3311:
2443                     ; 710 			if(uc_Rx2_Data[4] & (U8)(0x80)){
2444  0ae6 720f000c3b    	btjf	_uc_Rx2_Data+4,#7,L7411
2445                     ; 711 				uc_fault_cnt++;
2446  0aeb 0c06          	inc	(OFST+0,sp)
2447                     ; 712 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2447                     ; 713 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2447                     ; 714 				){
2448  0aed 270d          	jreq	L5511
2450  0aef 7b06          	ld	a,(OFST+0,sp)
2451  0af1 a105          	cp	a,#5
2452  0af3 2407          	jruge	L5511
2454  0af5 c60004        	ld	a,_uc_Test_Page_Now
2455  0af8 a102          	cp	a,#2
2456  0afa 2711          	jreq	L3511
2457  0afc               L5511:
2459  0afc 7b06          	ld	a,(OFST+0,sp)
2460  0afe a105          	cp	a,#5
2461  0b00 2524          	jrult	L7411
2463  0b02 a109          	cp	a,#9
2464  0b04 2420          	jruge	L7411
2466  0b06 c60004        	ld	a,_uc_Test_Page_Now
2467  0b09 a103          	cp	a,#3
2468  0b0b 2619          	jrne	L7411
2469  0b0d               L3511:
2470                     ; 715 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2471  0b0d 7b06          	ld	a,(OFST+0,sp)
2472  0b0f 5f            	clrw	x
2473  0b10 97            	ld	xl,a
2474  0b11 5a            	decw	x
2475  0b12 a604          	ld	a,#4
2476  0b14 8d000000      	callf	d_smodx
2478  0b18 d60000        	ld	a,(_LCD_Line,x)
2479  0b1b 8d000000      	callf	f_Set_LCD_Address
2481                     ; 716 					Display_LCD_String("Fail_PCB1Temp");
2482  0b1f ae001d        	ldw	x,#L1611
2483  0b22 8d000000      	callf	f_Display_LCD_String
2485  0b26               L7411:
2486                     ; 720 			if(uc_Rx2_Data[5] & (U8)(0x01)){
2487  0b26 7201000d3b    	btjf	_uc_Rx2_Data+5,#0,L3611
2488                     ; 721 				uc_fault_cnt++;
2489  0b2b 0c06          	inc	(OFST+0,sp)
2490                     ; 722 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
2490                     ; 723 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
2490                     ; 724 				){
2491  0b2d 270d          	jreq	L1711
2493  0b2f 7b06          	ld	a,(OFST+0,sp)
2494  0b31 a105          	cp	a,#5
2495  0b33 2407          	jruge	L1711
2497  0b35 c60004        	ld	a,_uc_Test_Page_Now
2498  0b38 a102          	cp	a,#2
2499  0b3a 2711          	jreq	L7611
2500  0b3c               L1711:
2502  0b3c 7b06          	ld	a,(OFST+0,sp)
2503  0b3e a105          	cp	a,#5
2504  0b40 2524          	jrult	L3611
2506  0b42 a109          	cp	a,#9
2507  0b44 2420          	jruge	L3611
2509  0b46 c60004        	ld	a,_uc_Test_Page_Now
2510  0b49 a103          	cp	a,#3
2511  0b4b 2619          	jrne	L3611
2512  0b4d               L7611:
2513                     ; 725 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
2514  0b4d 7b06          	ld	a,(OFST+0,sp)
2515  0b4f 5f            	clrw	x
2516  0b50 97            	ld	xl,a
2517  0b51 5a            	decw	x
2518  0b52 a604          	ld	a,#4
2519  0b54 8d000000      	callf	d_smodx
2521  0b58 d60000        	ld	a,(_LCD_Line,x)
2522  0b5b 8d000000      	callf	f_Set_LCD_Address
2524                     ; 726 					Display_LCD_String("Fail_PCB2Temp");
2525  0b5f ae000f        	ldw	x,#L5711
2526  0b62 8d000000      	callf	f_Display_LCD_String
2528  0b66               L3611:
2529                     ; 730 			if(!uc_fault_cnt){
2530  0b66 7b06          	ld	a,(OFST+0,sp)
2531  0b68 260e          	jrne	L166
2532                     ; 731 				Set_LCD_Address(LCD_Line[0]);
2533  0b6a c60000        	ld	a,_LCD_Line
2534  0b6d 8d000000      	callf	f_Set_LCD_Address
2536                     ; 732 				Display_LCD_String("Normal");
2537  0b71 ae0008        	ldw	x,#L1021
2538  0b74               LC025:
2539  0b74 8d000000      	callf	f_Display_LCD_String
2541  0b78               L166:
2542                     ; 737 	if((b_Com_On_flag == ON)){
2543  0b78 a60f          	ld	a,#15
2544  0b7a 7207000c13    	btjf	_uc_Test_Ctrl_Reg,#3,L3021
2545                     ; 738 		Set_LCD_Address((unsigned char)(0x00+15));
2546  0b7f 8d000000      	callf	f_Set_LCD_Address
2548                     ; 739 		if(b_Blink_250_Flag){Display_LCD_String("C");}
2549  0b83 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L5021
2551  0b88 ae0006        	ldw	x,#L7021
2554  0b8b 200c          	jpf	LC026
2555  0b8d               L5021:
2556                     ; 740 		else{Display_LCD_String(" ");}
2557  0b8d ae0004        	ldw	x,#L3121
2559  0b90 2007          	jpf	LC026
2560  0b92               L3021:
2561                     ; 743 		Set_LCD_Address((unsigned char)(0x00+15));
2562  0b92 8d000000      	callf	f_Set_LCD_Address
2564                     ; 744 		Display_LCD_String("N");
2565  0b96 ae00bf        	ldw	x,#L716
2566  0b99               LC026:
2567  0b99 8d000000      	callf	f_Display_LCD_String
2569  0b9d               L5121:
2570                     ; 747 	return;
2571  0b9d 5b06          	addw	sp,#6
2572  0b9f 87            	retf	
2573                     ; 751 void Test_Controller_Routine(void)
2573                     ; 752 {
2574  0ba0               f_Test_Controller_Routine:
2576                     ; 753 	Test_Ctrl_LCD_Display_Control(); 
2577  0ba0 8d7f037f      	callf	f_Test_Ctrl_LCD_Display_Control
2579                     ; 754 	Test_Ctrl_Swtich_Control();
2581                     ; 756 	return;
2582  0ba4 acaf01af      	jpf	f_Test_Ctrl_Swtich_Control
2583                     ; 761 void Test_Ctrl_Reset_Values(void)
2583                     ; 762 {
2584  0ba8               f_Test_Ctrl_Reset_Values:
2586                     ; 763 	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
2587  0ba8 725f000c      	clr	_uc_Test_Ctrl_Reg
2588                     ; 764 	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
2589  0bac 725f000d      	clr	_uc_Model_Select_Reg
2590                     ; 765 	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register
2591  0bb0 725f000b      	clr	_uc_Rx_TimeOut_Reg
2592                     ; 767 	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
2593  0bb4 725f0004      	clr	_uc_Test_Page_Now
2594                     ; 768 	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
2595  0bb8 725f0003      	clr	_uc_Test_Page_Pre
2596                     ; 769 	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number
2597  0bbc 725f0002      	clr	_uc_Test_Data_Select_Num
2598                     ; 771 	uc_Perc_Unit = 1;		// Duty_Moving_Unit
2599  0bc0 35010001      	mov	_uc_Perc_Unit,#1
2600                     ; 773 	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
2601  0bc4 5f            	clrw	x
2602  0bc5 cf0007        	ldw	_ui_Rx1_TimeOut_Cnt,x
2603                     ; 774 	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter
2604  0bc8 cf0005        	ldw	_ui_Rx2_TimeOut_Cnt,x
2605                     ; 776 	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
2606  0bcb 725f0009      	clr	_uc_Heater_Enable_Flag
2607                     ; 777 	uc_Target_Duty_Perc = 0;		// Target_Duty_Percentage
2608  0bcf 725f000a      	clr	_uc_Target_Duty_Perc
2609                     ; 779 	return;
2610  0bd3 87            	retf	
2611                     	xdef	f_Test_Ctrl_LCD_Display_Control
2612                     	xdef	f_Test_Ctrl_Text_Display_Handling
2613                     	xdef	f_Test_Ctrl_Swtich_Control
2614                     	xdef	f_Test_Ctrl_Value_Change
2615                     	xdef	f_Model_Select_LCD_Display_Control
2616                     	xdef	f_Model_Select_Switch_Control
2617                     	xdef	f_Model_Select_Display_Handling
2618                     	xdef	f_First_Switch_Control
2619                     	switch	.bss
2620  0000               _uc_Target_Display_Mode:
2621  0000 00            	ds.b	1
2622                     	xdef	_uc_Target_Display_Mode
2623  0001               _uc_Perc_Unit:
2624  0001 00            	ds.b	1
2625                     	xdef	_uc_Perc_Unit
2626  0002               _uc_Test_Data_Select_Num:
2627  0002 00            	ds.b	1
2628                     	xdef	_uc_Test_Data_Select_Num
2629  0003               _uc_Test_Page_Pre:
2630  0003 00            	ds.b	1
2631                     	xdef	_uc_Test_Page_Pre
2632  0004               _uc_Test_Page_Now:
2633  0004 00            	ds.b	1
2634                     	xdef	_uc_Test_Page_Now
2635                     	xref	f_strcpy
2636                     	xref	f_Start_Zig_Display
2637                     	xdef	f_Test_Ctrl_Reset_Values
2638                     	xdef	f_Test_Controller_Routine
2639                     	xdef	f_Model_Select_Routine
2640                     	xdef	f_Test_Controller_First_Routine
2641  0005               _ui_Rx2_TimeOut_Cnt:
2642  0005 0000          	ds.b	2
2643                     	xdef	_ui_Rx2_TimeOut_Cnt
2644  0007               _ui_Rx1_TimeOut_Cnt:
2645  0007 0000          	ds.b	2
2646                     	xdef	_ui_Rx1_TimeOut_Cnt
2647                     	xdef	_uc_Rx2_Data
2648                     	xdef	_uc_Rx1_Data
2649  0009               _uc_Heater_Enable_Flag:
2650  0009 00            	ds.b	1
2651                     	xdef	_uc_Heater_Enable_Flag
2652  000a               _uc_Target_Duty_Perc:
2653  000a 00            	ds.b	1
2654                     	xdef	_uc_Target_Duty_Perc
2655  000b               _uc_Rx_TimeOut_Reg:
2656  000b 00            	ds.b	1
2657                     	xdef	_uc_Rx_TimeOut_Reg
2658  000c               _uc_Test_Ctrl_Reg:
2659  000c 00            	ds.b	1
2660                     	xdef	_uc_Test_Ctrl_Reg
2661  000d               _uc_Model_Select_Reg:
2662  000d 00            	ds.b	1
2663                     	xdef	_uc_Model_Select_Reg
2664                     	xref	_uc_Button_Status_Reg
2665                     	xref	f_Num_Display_LCD
2666                     	xref	f_Display_LCD_String
2667                     	xref	f_Set_LCD_Address
2668                     	xref	_LCD_Dis_Data
2669                     	xref	_LCD_Line
2670                     	xref	_uc_LCD_Blink_Reg
2671                     	xref	_uc_System_Ctrl_Reg
2672                     	switch	.const
2673  0004               L3121:
2674  0004 2000          	dc.b	" ",0
2675  0006               L7021:
2676  0006 4300          	dc.b	"C",0
2677  0008               L1021:
2678  0008 4e6f726d616c  	dc.b	"Normal",0
2679  000f               L5711:
2680  000f 4661696c5f50  	dc.b	"Fail_PCB2Temp",0
2681  001d               L1611:
2682  001d 4661696c5f50  	dc.b	"Fail_PCB1Temp",0
2683  002b               L5411:
2684  002b 4661696c5f43  	dc.b	"Fail_CoreTemp",0
2685  0039               L1311:
2686  0039 4661696c5f43  	dc.b	"Fail_CurSen",0
2687  0045               L5111:
2688  0045 4661696c5f4c  	dc.b	"Fail_LVSen",0
2689  0050               L1011:
2690  0050 4661696c5f48  	dc.b	"Fail_HVSen",0
2691  005b               L5601:
2692  005b 466c745f4d73  	dc.b	"Flt_MsgTimeOut",0
2693  006a               L1501:
2694  006a 466c745f5043  	dc.b	"Flt_PCBThmShut",0
2695  0079               L5301:
2696  0079 466c745f5468  	dc.b	"Flt_ThmShut",0
2697  0085               L1201:
2698  0085 466c745f4f76  	dc.b	"Flt_OverCur",0
2699  0091               L5001:
2700  0091 466c745f4856  	dc.b	"Flt_HVHigh",0
2701  009c               L177:
2702  009c 466c745f4856  	dc.b	"Flt_HVLow",0
2703  00a6               L557:
2704  00a6 466c745f4c56  	dc.b	"Flt_LVHigh",0
2705  00b1               L147:
2706  00b1 466c745f4c56  	dc.b	"Flt_LVLow",0
2707  00bb               L307:
2708  00bb 2d00          	dc.b	"-",0
2709  00bd               L526:
2710  00bd 3100          	dc.b	"1",0
2711  00bf               L716:
2712  00bf 4e00          	dc.b	"N",0
2713  00c1               L735:
2714  00c1 4d415800      	dc.b	"MAX",0
2715  00c5               L574:
2716  00c5 4c6d697400    	dc.b	"Lmit",0
2717  00ca               L764:
2718  00ca 466c7400      	dc.b	"Flt",0
2719  00ce               L164:
2720  00ce 4f70657200    	dc.b	"Oper",0
2721  00d3               L354:
2722  00d3 53746f7000    	dc.b	"Stop",0
2723  00d8               L544:
2724  00d8 4e4300        	dc.b	"NC",0
2725  00db               L524:
2726  00db 202020202020  	dc.b	"        Fd:",0
2727  00e7               L314:
2728  00e7 202020202020  	dc.b	"        /",0
2729  00f1               L563:
2730  00f1 2500          	dc.b	"%",0
2731  00f3               L363:
2732  00f3 3000          	dc.b	"0",0
2733  00f5               L753:
2734  00f5 3500          	dc.b	"5",0
2735  00f7               L353:
2736  00f7 2e00          	dc.b	".",0
2737  00f9               L743:
2738  00f9 445f556e6974  	dc.b	"D_Unit:",0
2739  0101               L543:
2740  0101 2a5461726765  	dc.b	"*Target Watt(OS)",0
2741  0112               L143:
2742  0112 2a5461726765  	dc.b	"*Target Perc",0
2743  011f               L533:
2744  011f 2a4f5054494f  	dc.b	"*OPTION*",0
2745  0128               L133:
2746  0128 5665723a00    	dc.b	"Ver:",0
2747  012d               L723:
2748  012d 43743a00      	dc.b	"Ct:",0
2749  0131               L523:
2750  0131 43723a202020  	dc.b	"Cr:     Pw:",0
2751  013d               L323:
2752  013d 523a2020463a  	dc.b	"R:  F:  HV:",0
2753  0149               L123:
2754  0149 54703a202020  	dc.b	"Tp:     Fd:",0
2755  0155               L513:
2756  0155 54643a202020  	dc.b	"Td:     Fd:",0
2757  0161               L113:
2758  0161 416c3a202020  	dc.b	"Al:     /",0
2759  016b               L71:
2760  016b 00            	dc.b	0
2761  016c               L51:
2762  016c 2a4856434320  	dc.b	"*HVCC Model*",0
2763                     	xref.b	c_lreg
2764                     	xref.b	c_x
2765                     	xref.b	c_y
2766                     	xref	d_smodx
2767                     	xref	d_sdivx
2768                     	xref	d_ludv
2769                     	xref	d_umul
2770                     	end

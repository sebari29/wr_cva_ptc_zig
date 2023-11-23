   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2654                     	switch	.data
2655  0000               _uc_Rx_Data:
2656  0000 00            	dc.b	0
2657  0001 000000000000  	ds.b	31
2658  0020               _uc_Test_Pre_Mode:
2659  0020 00            	dc.b	0
2660  0021               _uc_Test_Mode:
2661  0021 00            	dc.b	0
2662  0022               _uc_Test_Step:
2663  0022 00            	dc.b	0
2664  0023               _ui_Test_Cycle:
2665  0023 0000          	dc.w	0
2666  0025               _ui_Test_Target:
2667  0025 0000          	dc.w	0
2668  0027               _ui_10ms_cnt:
2669  0027 0000          	dc.w	0
2670  0029               _ui_1sec_cnt:
2671  0029 0000          	dc.w	0
2672  002b               _ui_1min_cnt:
2673  002b 0000          	dc.w	0
2674  002d               _ui_1hour_cnt:
2675  002d 0000          	dc.w	0
2676  002f               _ui_Total_hour_cnt:
2677  002f 0000          	dc.w	0
2678  0031               _ui_Test_10ms_cnt:
2679  0031 0000          	dc.w	0
2680  0033               _ui_Test_1sec_cnt:
2681  0033 0000          	dc.w	0
2682  0035               _ui_Test_1min_cnt:
2683  0035 0000          	dc.w	0
2684  0037               _ui_Test_1hour_cnt:
2685  0037 0000          	dc.w	0
2721                     ; 50 void Cycle_Test_Timer_Count(void)
2721                     ; 51 {
2723                     	switch	.text
2724  0000               _Cycle_Test_Timer_Count:
2728                     ; 52 	ui_10ms_cnt++;
2730  0000 ce0027        	ldw	x,_ui_10ms_cnt
2731  0003 1c0001        	addw	x,#1
2732  0006 cf0027        	ldw	_ui_10ms_cnt,x
2733                     ; 53 	if(ui_10ms_cnt >= 100u){ 
2735  0009 ce0027        	ldw	x,_ui_10ms_cnt
2736  000c a30064        	cpw	x,#100
2737  000f 2516          	jrult	L1271
2738                     ; 54 		ui_10ms_cnt = 0u;
2740  0011 5f            	clrw	x
2741  0012 cf0027        	ldw	_ui_10ms_cnt,x
2742                     ; 55 		ui_1sec_cnt++;
2744  0015 ce0029        	ldw	x,_ui_1sec_cnt
2745  0018 1c0001        	addw	x,#1
2746  001b cf0029        	ldw	_ui_1sec_cnt,x
2747                     ; 56 		ui_Total_hour_cnt++;
2749  001e ce002f        	ldw	x,_ui_Total_hour_cnt
2750  0021 1c0001        	addw	x,#1
2751  0024 cf002f        	ldw	_ui_Total_hour_cnt,x
2752  0027               L1271:
2753                     ; 58 	if(ui_1sec_cnt >= 60u){
2755  0027 ce0029        	ldw	x,_ui_1sec_cnt
2756  002a a3003c        	cpw	x,#60
2757  002d 250d          	jrult	L3271
2758                     ; 59 		ui_1sec_cnt = 0u;
2760  002f 5f            	clrw	x
2761  0030 cf0029        	ldw	_ui_1sec_cnt,x
2762                     ; 60 		ui_1min_cnt++;
2764  0033 ce002b        	ldw	x,_ui_1min_cnt
2765  0036 1c0001        	addw	x,#1
2766  0039 cf002b        	ldw	_ui_1min_cnt,x
2767  003c               L3271:
2768                     ; 62 	if(ui_1min_cnt >= 60u){
2770  003c ce002b        	ldw	x,_ui_1min_cnt
2771  003f a3003c        	cpw	x,#60
2772  0042 2516          	jrult	L5271
2773                     ; 63 		ui_1min_cnt = 0u;
2775  0044 5f            	clrw	x
2776  0045 cf002b        	ldw	_ui_1min_cnt,x
2777                     ; 64 		ui_1hour_cnt++;
2779  0048 ce002d        	ldw	x,_ui_1hour_cnt
2780  004b 1c0001        	addw	x,#1
2781  004e cf002d        	ldw	_ui_1hour_cnt,x
2782                     ; 65 		ui_Total_hour_cnt++;
2784  0051 ce002f        	ldw	x,_ui_Total_hour_cnt
2785  0054 1c0001        	addw	x,#1
2786  0057 cf002f        	ldw	_ui_Total_hour_cnt,x
2787  005a               L5271:
2788                     ; 68 	return;
2791  005a 81            	ret
2820                     ; 72 void Reset_Cycle_Test_Timer(void)
2820                     ; 73 {
2821                     	switch	.text
2822  005b               _Reset_Cycle_Test_Timer:
2826                     ; 74 	ui_10ms_cnt = 0u;
2828  005b 5f            	clrw	x
2829  005c cf0027        	ldw	_ui_10ms_cnt,x
2830                     ; 75 	ui_1sec_cnt = 0u;
2832  005f 5f            	clrw	x
2833  0060 cf0029        	ldw	_ui_1sec_cnt,x
2834                     ; 76 	ui_1min_cnt = 0u;
2836  0063 5f            	clrw	x
2837  0064 cf002b        	ldw	_ui_1min_cnt,x
2838                     ; 77 	ui_1hour_cnt = 0u;
2840  0067 5f            	clrw	x
2841  0068 cf002d        	ldw	_ui_1hour_cnt,x
2842                     ; 78 	ui_Total_hour_cnt = 0u;
2844  006b 5f            	clrw	x
2845  006c cf002f        	ldw	_ui_Total_hour_cnt,x
2846                     ; 80 	return;
2849  006f 81            	ret
2877                     ; 84 void Long_Test_Timer_Count(void)
2877                     ; 85 {
2878                     	switch	.text
2879  0070               _Long_Test_Timer_Count:
2883                     ; 86 	ui_Test_10ms_cnt++;
2885  0070 ce0031        	ldw	x,_ui_Test_10ms_cnt
2886  0073 1c0001        	addw	x,#1
2887  0076 cf0031        	ldw	_ui_Test_10ms_cnt,x
2888                     ; 87 	if(ui_Test_10ms_cnt >= 100u){ 
2890  0079 ce0031        	ldw	x,_ui_Test_10ms_cnt
2891  007c a30064        	cpw	x,#100
2892  007f 250d          	jrult	L7471
2893                     ; 88 		ui_Test_10ms_cnt = 0u;
2895  0081 5f            	clrw	x
2896  0082 cf0031        	ldw	_ui_Test_10ms_cnt,x
2897                     ; 89 		ui_Test_1sec_cnt++;
2899  0085 ce0033        	ldw	x,_ui_Test_1sec_cnt
2900  0088 1c0001        	addw	x,#1
2901  008b cf0033        	ldw	_ui_Test_1sec_cnt,x
2902  008e               L7471:
2903                     ; 91 	if(ui_Test_1sec_cnt >= 60u){
2905  008e ce0033        	ldw	x,_ui_Test_1sec_cnt
2906  0091 a3003c        	cpw	x,#60
2907  0094 250d          	jrult	L1571
2908                     ; 92 		ui_Test_1sec_cnt = 0u;
2910  0096 5f            	clrw	x
2911  0097 cf0033        	ldw	_ui_Test_1sec_cnt,x
2912                     ; 93 		ui_Test_1min_cnt++;
2914  009a ce0035        	ldw	x,_ui_Test_1min_cnt
2915  009d 1c0001        	addw	x,#1
2916  00a0 cf0035        	ldw	_ui_Test_1min_cnt,x
2917  00a3               L1571:
2918                     ; 95 	if(ui_Test_1min_cnt >= 60u){
2920  00a3 ce0035        	ldw	x,_ui_Test_1min_cnt
2921  00a6 a3003c        	cpw	x,#60
2922  00a9 250d          	jrult	L3571
2923                     ; 96 		ui_Test_1min_cnt = 0u;
2925  00ab 5f            	clrw	x
2926  00ac cf0035        	ldw	_ui_Test_1min_cnt,x
2927                     ; 97 		ui_Test_1hour_cnt++;
2929  00af ce0037        	ldw	x,_ui_Test_1hour_cnt
2930  00b2 1c0001        	addw	x,#1
2931  00b5 cf0037        	ldw	_ui_Test_1hour_cnt,x
2932  00b8               L3571:
2933                     ; 100 	return;
2936  00b8 81            	ret
2965                     ; 104 void Reset_Long_Test_Timer(void)
2965                     ; 105 {
2966                     	switch	.text
2967  00b9               _Reset_Long_Test_Timer:
2971                     ; 106 	ui_Test_10ms_cnt = 0u;
2973  00b9 5f            	clrw	x
2974  00ba cf0031        	ldw	_ui_Test_10ms_cnt,x
2975                     ; 107 	ui_Test_1sec_cnt = 0u;
2977  00bd 5f            	clrw	x
2978  00be cf0033        	ldw	_ui_Test_1sec_cnt,x
2979                     ; 108 	ui_Test_1min_cnt = 0u;
2981  00c1 5f            	clrw	x
2982  00c2 cf0035        	ldw	_ui_Test_1min_cnt,x
2983                     ; 109 	ui_Test_1hour_cnt = 0u;
2985  00c5 5f            	clrw	x
2986  00c6 cf0037        	ldw	_ui_Test_1hour_cnt,x
2987                     ; 110 	ui_Total_hour_cnt = 0u;
2989  00c9 5f            	clrw	x
2990  00ca cf002f        	ldw	_ui_Total_hour_cnt,x
2991                     ; 112 	return;
2994  00cd 81            	ret
3023                     ; 117 void First_Switch_Control(void)
3023                     ; 118 {
3024                     	switch	.text
3025  00ce               _First_Switch_Control:
3029                     ; 119 	if(b_ENTER_Button_Flag){
3031  00ce c60000        	ld	a,_uc_Button_Status_Reg
3032  00d1 a520          	bcp	a,#32
3033  00d3 2718          	jreq	L5771
3034                     ; 120 		b_First_Logic_On = ON;
3036  00d5 72100000      	bset	_uc_System_Ctrl_Reg,#0
3037                     ; 121 		b_Model_Select_flag = OFF;		// Model_Selection_Skipped
3039  00d9 7211000d      	bres	_uc_Test_Ctrl_Reg,#0
3040                     ; 122 		b_Data_Select_flag = OFF;
3042  00dd 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
3043                     ; 124 		uc_Test_Page_Pre = (U8)(1);
3045  00e1 35010003      	mov	_uc_Test_Page_Pre,#1
3046                     ; 125 		uc_Test_Data_Select_Num = (U8)(0);
3048  00e5 725f0002      	clr	_uc_Test_Data_Select_Num
3049                     ; 127 		b_ENTER_Button_Flag = OFF;
3051  00e9 721b0000      	bres	_uc_Button_Status_Reg,#5
3052  00ed               L5771:
3053                     ; 130 	return;
3056  00ed 81            	ret
3083                     ; 134 void Test_Controller_First_Routine(void)
3083                     ; 135 {
3084                     	switch	.text
3085  00ee               _Test_Controller_First_Routine:
3089                     ; 136 	Start_Zig_Display();
3091  00ee cd0000        	call	_Start_Zig_Display
3093                     ; 137 	First_Switch_Control();
3095  00f1 addb          	call	_First_Switch_Control
3097                     ; 138 	b_Com_On_flag = OFF;//YJS 20230314
3099  00f3 7217000d      	bres	_uc_Test_Ctrl_Reg,#3
3100                     ; 139 	return;
3103  00f7 81            	ret
3130                     ; 143 void Model_Select_Display_Handling(void)
3130                     ; 144 {
3131                     	switch	.text
3132  00f8               _Model_Select_Display_Handling:
3136                     ; 145 	switch(uc_Test_Page_Now){
3138  00f8 725d0004      	tnz	_uc_Test_Page_Now
3139  00fc 262a          	jrne	L1102
3142  00fe               L7002:
3143                     ; 148 		case 0:	strcpy(LCD_Dis_Data[0],"*HVCC Model*");	
3145  00fe ae0000        	ldw	x,#_LCD_Dis_Data
3146  0101 90ae030a      	ldw	y,#L7202
3147  0105 cd0000        	call	c_strcpx
3149                     ; 149 				strcpy(LCD_Dis_Data[1],"");	// 
3151  0108 ae0010        	ldw	x,#_LCD_Dis_Data+16
3152  010b 90ae0309      	ldw	y,#L1302
3153  010f cd0000        	call	c_strcpx
3155                     ; 150 				strcpy(LCD_Dis_Data[2],"");	// 
3157  0112 ae0020        	ldw	x,#_LCD_Dis_Data+32
3158  0115 90ae0309      	ldw	y,#L1302
3159  0119 cd0000        	call	c_strcpx
3161                     ; 151 				strcpy(LCD_Dis_Data[3],"");		
3163  011c ae0030        	ldw	x,#_LCD_Dis_Data+48
3164  011f 90ae0309      	ldw	y,#L1302
3165  0123 cd0000        	call	c_strcpx
3167                     ; 153 				break;
3169  0126 2028          	jra	L5202
3170  0128               L1102:
3171                     ; 155 		default: 
3171                     ; 156 				strcpy(LCD_Dis_Data[0],"");	// Null
3173  0128 ae0000        	ldw	x,#_LCD_Dis_Data
3174  012b 90ae0309      	ldw	y,#L1302
3175  012f cd0000        	call	c_strcpx
3177                     ; 157 				strcpy(LCD_Dis_Data[1],"");	// Null
3179  0132 ae0010        	ldw	x,#_LCD_Dis_Data+16
3180  0135 90ae0309      	ldw	y,#L1302
3181  0139 cd0000        	call	c_strcpx
3183                     ; 158 				strcpy(LCD_Dis_Data[2],"");	// Null
3185  013c ae0020        	ldw	x,#_LCD_Dis_Data+32
3186  013f 90ae0309      	ldw	y,#L1302
3187  0143 cd0000        	call	c_strcpx
3189                     ; 159 				strcpy(LCD_Dis_Data[3],"");	// Null
3191  0146 ae0030        	ldw	x,#_LCD_Dis_Data+48
3192  0149 90ae0309      	ldw	y,#L1302
3193  014d cd0000        	call	c_strcpx
3195                     ; 161 				break;
3196  0150               L5202:
3197                     ; 164 	return;
3200  0150 81            	ret
3225                     ; 168 void Model_Select_Switch_Control(void)
3225                     ; 169 {
3226                     	switch	.text
3227  0151               _Model_Select_Switch_Control:
3231                     ; 170 	if(b_UP_Button_Flag){
3233  0151 c60000        	ld	a,_uc_Button_Status_Reg
3234  0154 a502          	bcp	a,#2
3235  0156 2704          	jreq	L5402
3236                     ; 172 		b_UP_Button_Flag = OFF;
3238  0158 72130000      	bres	_uc_Button_Status_Reg,#1
3239  015c               L5402:
3240                     ; 175 	if(b_DOWN_Button_Flag){
3242  015c c60000        	ld	a,_uc_Button_Status_Reg
3243  015f a504          	bcp	a,#4
3244  0161 2704          	jreq	L7402
3245                     ; 177 		b_DOWN_Button_Flag = OFF;
3247  0163 72150000      	bres	_uc_Button_Status_Reg,#2
3248  0167               L7402:
3249                     ; 180 	if(b_ENTER_Button_Flag){
3251  0167 c60000        	ld	a,_uc_Button_Status_Reg
3252  016a a520          	bcp	a,#32
3253  016c 2704          	jreq	L1502
3254                     ; 182 		b_ENTER_Button_Flag = OFF;
3256  016e 721b0000      	bres	_uc_Button_Status_Reg,#5
3257  0172               L1502:
3258                     ; 186 	return;
3261  0172 81            	ret
3304                     ; 190 void Model_Select_LCD_Display_Control(void)
3304                     ; 191 {
3305                     	switch	.text
3306  0173               _Model_Select_LCD_Display_Control:
3308  0173 88            	push	a
3309       00000001      OFST:	set	1
3312                     ; 194 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
3314  0174 c60004        	ld	a,_uc_Test_Page_Now
3315  0177 c10003        	cp	a,_uc_Test_Page_Pre
3316  017a 2703          	jreq	L7602
3319  017c cd00f8        	call	_Model_Select_Display_Handling
3321  017f               L7602:
3322                     ; 195 	uc_Test_Page_Pre = uc_Test_Page_Now ;
3324  017f 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
3325                     ; 198 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
3327  0184 725d0004      	tnz	_uc_Test_Page_Now
3328  0188 2643          	jrne	L1702
3329                     ; 199 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3331  018a 0f01          	clr	(OFST+0,sp)
3333  018c               L3702:
3334                     ; 200 			Set_LCD_Address(LCD_Line[uc_line_index]);
3336  018c 7b01          	ld	a,(OFST+0,sp)
3337  018e 5f            	clrw	x
3338  018f 97            	ld	xl,a
3339  0190 d60000        	ld	a,(_LCD_Line,x)
3340  0193 cd0000        	call	_Set_LCD_Address
3342                     ; 202 			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3344  0196 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3345  0199 a502          	bcp	a,#2
3346  019b 271c          	jreq	L1012
3348  019d 7b01          	ld	a,(OFST+0,sp)
3349  019f c10002        	cp	a,_uc_Test_Data_Select_Num
3350  01a2 2615          	jrne	L1012
3351                     ; 203 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3353  01a4 c60000        	ld	a,_uc_LCD_Blink_Reg
3354  01a7 a502          	bcp	a,#2
3355  01a9 271a          	jreq	L5012
3358  01ab 7b01          	ld	a,(OFST+0,sp)
3359  01ad 97            	ld	xl,a
3360  01ae a610          	ld	a,#16
3361  01b0 42            	mul	x,a
3362  01b1 1c0000        	addw	x,#_LCD_Dis_Data
3363  01b4 cd0000        	call	_Display_LCD_String
3365  01b7 200c          	jra	L5012
3366  01b9               L1012:
3367                     ; 204 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3369  01b9 7b01          	ld	a,(OFST+0,sp)
3370  01bb 97            	ld	xl,a
3371  01bc a610          	ld	a,#16
3372  01be 42            	mul	x,a
3373  01bf 1c0000        	addw	x,#_LCD_Dis_Data
3374  01c2 cd0000        	call	_Display_LCD_String
3376  01c5               L5012:
3377                     ; 199 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3379  01c5 0c01          	inc	(OFST+0,sp)
3383  01c7 7b01          	ld	a,(OFST+0,sp)
3384  01c9 a104          	cp	a,#4
3385  01cb 25bf          	jrult	L3702
3386  01cd               L1702:
3387                     ; 208 	return;
3390  01cd 84            	pop	a
3391  01ce 81            	ret
3417                     ; 212 void Model_Select_Routine(void)
3417                     ; 213 {
3418                     	switch	.text
3419  01cf               _Model_Select_Routine:
3423                     ; 214 	Model_Select_LCD_Display_Control();
3425  01cf ada2          	call	_Model_Select_LCD_Display_Control
3427                     ; 215 	Model_Select_Switch_Control();	
3429  01d1 cd0151        	call	_Model_Select_Switch_Control
3431                     ; 217 	return;
3434  01d4 81            	ret
3480                     ; 221 void Test_Ctrl_Value_Change(U8 uc_st)
3480                     ; 222 {
3481                     	switch	.text
3482  01d5               _Test_Ctrl_Value_Change:
3484  01d5 88            	push	a
3485  01d6 5204          	subw	sp,#4
3486       00000004      OFST:	set	4
3489                     ; 227 	if(uc_st == 1){	
3491  01d8 a101          	cp	a,#1
3492  01da 2703          	jreq	L23
3493  01dc cc0319        	jp	L5312
3494  01df               L23:
3495                     ; 228   		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3497  01df 725d0002      	tnz	_uc_Test_Data_Select_Num
3498  01e3 2608          	jrne	L7312
3501  01e5 90100009      	bcpl	_uc_Heater_Enable_Flag,#0
3503  01e9 acc703c7      	jpf	L1322
3504  01ed               L7312:
3505                     ; 229 		else if(uc_Test_Data_Select_Num == (U8)(1)){			
3507  01ed c60002        	ld	a,_uc_Test_Data_Select_Num
3508  01f0 a101          	cp	a,#1
3509  01f2 2703          	jreq	L43
3510  01f4 cc03c7        	jp	L1322
3511  01f7               L43:
3512                     ; 230 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode		
3514  01f7 c60000        	ld	a,_uc_Target_Display_Mode
3515  01fa a101          	cp	a,#1
3516  01fc 2703          	jreq	L63
3517  01fe cc02c1        	jp	L5412
3518  0201               L63:
3519                     ; 231 if (HEATER_zone_status == HTR_ZONE_1)
3521  0201 725d0000      	tnz	_HEATER_zone_status
3522  0205 265d          	jrne	L7412
3523                     ; 233 				if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(20); }
3525  0207 c6000a        	ld	a,_uc_Target_Duty_Perc
3526  020a a114          	cp	a,#20
3527  020c 2408          	jruge	L1512
3530  020e 3514000a      	mov	_uc_Target_Duty_Perc,#20
3532  0212 acc703c7      	jpf	L1322
3533  0216               L1512:
3534                     ; 235 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3536  0216 c60001        	ld	a,_uc_Perc_Unit
3537  0219 5f            	clrw	x
3538  021a 97            	ld	xl,a
3539  021b 1f01          	ldw	(OFST-3,sp),x
3541  021d c6000a        	ld	a,_uc_Target_Duty_Perc
3542  0220 5f            	clrw	x
3543  0221 97            	ld	xl,a
3544  0222 72fb01        	addw	x,(OFST-3,sp)
3545  0225 1f03          	ldw	(OFST-1,sp),x
3547                     ; 237 					if((uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3549  0227 c6000a        	ld	a,_uc_Target_Duty_Perc
3550  022a a1b4          	cp	a,#180
3551  022c 240f          	jruge	L5512
3553  022e 1e03          	ldw	x,(OFST-1,sp)
3554  0230 a300b4        	cpw	x,#180
3555  0233 2508          	jrult	L5512
3558  0235 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3560  0239 acc703c7      	jpf	L1322
3561  023d               L5512:
3562                     ; 238 					else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3564  023d c6000a        	ld	a,_uc_Target_Duty_Perc
3565  0240 a1b4          	cp	a,#180
3566  0242 2608          	jrne	L1612
3569  0244 35be000a      	mov	_uc_Target_Duty_Perc,#190
3571  0248 acc703c7      	jpf	L1322
3572  024c               L1612:
3573                     ; 239 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3575  024c 1e03          	ldw	x,(OFST-1,sp)
3576  024e a300bf        	cpw	x,#191
3577  0251 2508          	jrult	L5612
3580  0253 35be000a      	mov	_uc_Target_Duty_Perc,#190
3582  0257 acc703c7      	jpf	L1322
3583  025b               L5612:
3584                     ; 240 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3586  025b 7b04          	ld	a,(OFST+0,sp)
3587  025d c7000a        	ld	_uc_Target_Duty_Perc,a
3588  0260 acc703c7      	jpf	L1322
3589  0264               L7412:
3590                     ; 245 				if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(20); }
3592  0264 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3593  0267 a114          	cp	a,#20
3594  0269 2408          	jruge	L3712
3597  026b 3514000b      	mov	_uc_Target_Duty_Perc+1,#20
3599  026f acc703c7      	jpf	L1322
3600  0273               L3712:
3601                     ; 247 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3603  0273 c60001        	ld	a,_uc_Perc_Unit
3604  0276 5f            	clrw	x
3605  0277 97            	ld	xl,a
3606  0278 1f01          	ldw	(OFST-3,sp),x
3608  027a c6000b        	ld	a,_uc_Target_Duty_Perc+1
3609  027d 5f            	clrw	x
3610  027e 97            	ld	xl,a
3611  027f 72fb01        	addw	x,(OFST-3,sp)
3612  0282 1f03          	ldw	(OFST-1,sp),x
3614                     ; 249 					if((uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3616  0284 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3617  0287 a1b4          	cp	a,#180
3618  0289 240f          	jruge	L7712
3620  028b 1e03          	ldw	x,(OFST-1,sp)
3621  028d a300b4        	cpw	x,#180
3622  0290 2508          	jrult	L7712
3625  0292 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3627  0296 acc703c7      	jpf	L1322
3628  029a               L7712:
3629                     ; 250 					else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3631  029a c6000b        	ld	a,_uc_Target_Duty_Perc+1
3632  029d a1b4          	cp	a,#180
3633  029f 2608          	jrne	L3022
3636  02a1 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3638  02a5 acc703c7      	jpf	L1322
3639  02a9               L3022:
3640                     ; 251 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3642  02a9 1e03          	ldw	x,(OFST-1,sp)
3643  02ab a300bf        	cpw	x,#191
3644  02ae 2508          	jrult	L7022
3647  02b0 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3649  02b4 acc703c7      	jpf	L1322
3650  02b8               L7022:
3651                     ; 252 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3653  02b8 7b04          	ld	a,(OFST+0,sp)
3654  02ba c7000b        	ld	_uc_Target_Duty_Perc+1,a
3655  02bd acc703c7      	jpf	L1322
3656  02c1               L5412:
3657                     ; 257 if (HEATER_zone_status == HTR_ZONE_1)
3659  02c1 725d0000      	tnz	_HEATER_zone_status
3660  02c5 2629          	jrne	L5122
3661                     ; 259 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3663  02c7 c60001        	ld	a,_uc_Perc_Unit
3664  02ca 5f            	clrw	x
3665  02cb 97            	ld	xl,a
3666  02cc 1f01          	ldw	(OFST-3,sp),x
3668  02ce c6000a        	ld	a,_uc_Target_Duty_Perc
3669  02d1 5f            	clrw	x
3670  02d2 97            	ld	xl,a
3671  02d3 72fb01        	addw	x,(OFST-3,sp)
3672  02d6 1f03          	ldw	(OFST-1,sp),x
3674                     ; 260 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(200); }
3676  02d8 1e03          	ldw	x,(OFST-1,sp)
3677  02da a300c8        	cpw	x,#200
3678  02dd 2508          	jrult	L7122
3681  02df 35c8000a      	mov	_uc_Target_Duty_Perc,#200
3683  02e3 acc703c7      	jpf	L1322
3684  02e7               L7122:
3685                     ; 261 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3687  02e7 7b04          	ld	a,(OFST+0,sp)
3688  02e9 c7000a        	ld	_uc_Target_Duty_Perc,a
3689  02ec acc703c7      	jpf	L1322
3690  02f0               L5122:
3691                     ; 265 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3693  02f0 c60001        	ld	a,_uc_Perc_Unit
3694  02f3 5f            	clrw	x
3695  02f4 97            	ld	xl,a
3696  02f5 1f01          	ldw	(OFST-3,sp),x
3698  02f7 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3699  02fa 5f            	clrw	x
3700  02fb 97            	ld	xl,a
3701  02fc 72fb01        	addw	x,(OFST-3,sp)
3702  02ff 1f03          	ldw	(OFST-1,sp),x
3704                     ; 266 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(200); }
3706  0301 1e03          	ldw	x,(OFST-1,sp)
3707  0303 a300c8        	cpw	x,#200
3708  0306 2508          	jrult	L5222
3711  0308 35c8000b      	mov	_uc_Target_Duty_Perc+1,#200
3713  030c acc703c7      	jpf	L1322
3714  0310               L5222:
3715                     ; 267 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3717  0310 7b04          	ld	a,(OFST+0,sp)
3718  0312 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3719  0315 acc703c7      	jpf	L1322
3720  0319               L5312:
3721                     ; 274 	else if(uc_st == 0){	
3723  0319 0d05          	tnz	(OFST+1,sp)
3724  031b 2703          	jreq	L04
3725  031d cc03c7        	jp	L1322
3726  0320               L04:
3727                     ; 275 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3729  0320 725d0002      	tnz	_uc_Test_Data_Select_Num
3730  0324 2608          	jrne	L5322
3733  0326 90100009      	bcpl	_uc_Heater_Enable_Flag,#0
3735  032a acc703c7      	jpf	L1322
3736  032e               L5322:
3737                     ; 276 		else if(uc_Test_Data_Select_Num == (U8)(1)){
3739  032e c60002        	ld	a,_uc_Test_Data_Select_Num
3740  0331 a101          	cp	a,#1
3741  0333 2703          	jreq	L24
3742  0335 cc03c7        	jp	L1322
3743  0338               L24:
3744                     ; 277 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode	
3746  0338 c60000        	ld	a,_uc_Target_Display_Mode
3747  033b a101          	cp	a,#1
3748  033d 2652          	jrne	L3422
3749                     ; 278 if (HEATER_zone_status == HTR_ZONE_1)
3751  033f 725d0000      	tnz	_HEATER_zone_status
3752  0343 2626          	jrne	L5422
3753                     ; 280 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ 
3755  0345 c6000a        	ld	a,_uc_Target_Duty_Perc
3756  0348 c10001        	cp	a,_uc_Perc_Unit
3757  034b 2518          	jrult	L7422
3758                     ; 282 					if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3760  034d c6000a        	ld	a,_uc_Target_Duty_Perc
3761  0350 a1be          	cp	a,#190
3762  0352 2606          	jrne	L1522
3765  0354 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3767  0358 206d          	jra	L1322
3768  035a               L1522:
3769                     ; 283 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3771  035a c6000a        	ld	a,_uc_Target_Duty_Perc
3772  035d c00001        	sub	a,_uc_Perc_Unit
3773  0360 c7000a        	ld	_uc_Target_Duty_Perc,a
3774  0363 2062          	jra	L1322
3775  0365               L7422:
3776                     ; 285 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3778  0365 725f000a      	clr	_uc_Target_Duty_Perc
3779  0369 205c          	jra	L1322
3780  036b               L5422:
3781                     ; 289 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ 
3783  036b c6000b        	ld	a,_uc_Target_Duty_Perc+1
3784  036e c10001        	cp	a,_uc_Perc_Unit
3785  0371 2518          	jrult	L1622
3786                     ; 291 					if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3788  0373 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3789  0376 a1be          	cp	a,#190
3790  0378 2606          	jrne	L3622
3793  037a 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3795  037e 2047          	jra	L1322
3796  0380               L3622:
3797                     ; 292 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3799  0380 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3800  0383 c00001        	sub	a,_uc_Perc_Unit
3801  0386 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3802  0389 203c          	jra	L1322
3803  038b               L1622:
3804                     ; 294 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3806  038b 725f000b      	clr	_uc_Target_Duty_Perc+1
3807  038f 2036          	jra	L1322
3808  0391               L3422:
3809                     ; 298 if (HEATER_zone_status == HTR_ZONE_1)
3811  0391 725d0000      	tnz	_HEATER_zone_status
3812  0395 2619          	jrne	L3722
3813                     ; 300 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3815  0397 c6000a        	ld	a,_uc_Target_Duty_Perc
3816  039a c10001        	cp	a,_uc_Perc_Unit
3817  039d 250b          	jrult	L5722
3820  039f c6000a        	ld	a,_uc_Target_Duty_Perc
3821  03a2 c00001        	sub	a,_uc_Perc_Unit
3822  03a5 c7000a        	ld	_uc_Target_Duty_Perc,a
3824  03a8 201d          	jra	L1322
3825  03aa               L5722:
3826                     ; 301 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3828  03aa 725f000a      	clr	_uc_Target_Duty_Perc
3829  03ae 2017          	jra	L1322
3830  03b0               L3722:
3831                     ; 305 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3833  03b0 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3834  03b3 c10001        	cp	a,_uc_Perc_Unit
3835  03b6 250b          	jrult	L3032
3838  03b8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3839  03bb c00001        	sub	a,_uc_Perc_Unit
3840  03be c7000b        	ld	_uc_Target_Duty_Perc+1,a
3842  03c1 2004          	jra	L1322
3843  03c3               L3032:
3844                     ; 306 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3846  03c3 725f000b      	clr	_uc_Target_Duty_Perc+1
3847  03c7               L1322:
3848                     ; 312 	return ;
3851  03c7 5b05          	addw	sp,#5
3852  03c9 81            	ret
3886                     ; 317 void Test_Ctrl_Swtich_Control(void)
3886                     ; 318 {
3887                     	switch	.text
3888  03ca               _Test_Ctrl_Swtich_Control:
3892                     ; 320 	if(b_UP_Button_Flag== ON){
3894  03ca c60000        	ld	a,_uc_Button_Status_Reg
3895  03cd a502          	bcp	a,#2
3896  03cf 2775          	jreq	L7132
3897                     ; 322 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit < (U8)(130)){ uc_Perc_Unit++;}}
3899  03d1 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3900  03d4 a510          	bcp	a,#16
3901  03d6 270d          	jreq	L1232
3904  03d8 c60001        	ld	a,_uc_Perc_Unit
3905  03db a182          	cp	a,#130
3906  03dd 2461          	jruge	L5232
3909  03df 725c0001      	inc	_uc_Perc_Unit
3910  03e3 205b          	jra	L5232
3911  03e5               L1232:
3912                     ; 324 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
3914  03e5 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3915  03e8 a504          	bcp	a,#4
3916  03ea 2707          	jreq	L7232
3919  03ec a601          	ld	a,#1
3920  03ee cd01d5        	call	_Test_Ctrl_Value_Change
3923  03f1 204d          	jra	L5232
3924  03f3               L7232:
3925                     ; 325 			else if(b_Data_Select_flag == ON){
3927  03f3 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3928  03f6 a502          	bcp	a,#2
3929  03f8 2725          	jreq	L3332
3930                     ; 326 				if(uc_Test_Page_Now == (U8)(0)){
3932  03fa 725d0004      	tnz	_uc_Test_Page_Now
3933  03fe 260c          	jrne	L5332
3934                     ; 327 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3936  0400 725d0002      	tnz	_uc_Test_Data_Select_Num
3937  0404 273a          	jreq	L5232
3940  0406 725a0002      	dec	_uc_Test_Data_Select_Num
3941  040a 2034          	jra	L5232
3942  040c               L5332:
3943                     ; 328 				} else if(uc_Test_Page_Now == (U8)(2)){
3945  040c c60004        	ld	a,_uc_Test_Page_Now
3946  040f a102          	cp	a,#2
3947  0411 262d          	jrne	L5232
3948                     ; 329 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3950  0413 725d0002      	tnz	_uc_Test_Data_Select_Num
3951  0417 2727          	jreq	L5232
3954  0419 725a0002      	dec	_uc_Test_Data_Select_Num
3955  041d 2021          	jra	L5232
3956  041f               L3332:
3957                     ; 332 				if(uc_Test_Page_Now > 0){
3959  041f 725d0004      	tnz	_uc_Test_Page_Now
3960  0423 271b          	jreq	L5232
3961                     ; 333 					uc_Test_Page_Now--;
3963  0425 725a0004      	dec	_uc_Test_Page_Now
3964                     ; 334 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3966  0429 725d0004      	tnz	_uc_Test_Page_Now
3967  042d 2606          	jrne	L3532
3970  042f 725f0002      	clr	_uc_Test_Data_Select_Num
3972  0433 200b          	jra	L5232
3973  0435               L3532:
3974                     ; 335 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 5; }
3976  0435 c60004        	ld	a,_uc_Test_Page_Now
3977  0438 a101          	cp	a,#1
3978  043a 2604          	jrne	L5232
3981  043c 35050002      	mov	_uc_Test_Data_Select_Num,#5
3982  0440               L5232:
3983                     ; 339 		b_UP_Button_Flag = OFF;
3985  0440 72130000      	bres	_uc_Button_Status_Reg,#1
3987  0444 207a          	jra	L1632
3988  0446               L7132:
3989                     ; 343 	else if(b_DOWN_Button_Flag== ON){ 
3991  0446 c60000        	ld	a,_uc_Button_Status_Reg
3992  0449 a504          	bcp	a,#4
3993  044b 2773          	jreq	L1632
3994                     ; 345 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit > (U8)(1)){ uc_Perc_Unit--;}}
3996  044d c6000d        	ld	a,_uc_Test_Ctrl_Reg
3997  0450 a510          	bcp	a,#16
3998  0452 270d          	jreq	L5632
4001  0454 c60001        	ld	a,_uc_Perc_Unit
4002  0457 a102          	cp	a,#2
4003  0459 2561          	jrult	L1732
4006  045b 725a0001      	dec	_uc_Perc_Unit
4007  045f 205b          	jra	L1732
4008  0461               L5632:
4009                     ; 348 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
4011  0461 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4012  0464 a504          	bcp	a,#4
4013  0466 2706          	jreq	L3732
4016  0468 4f            	clr	a
4017  0469 cd01d5        	call	_Test_Ctrl_Value_Change
4020  046c 204e          	jra	L1732
4021  046e               L3732:
4022                     ; 350 			else if(b_Data_Select_flag == ON){
4024  046e c6000d        	ld	a,_uc_Test_Ctrl_Reg
4025  0471 a502          	bcp	a,#2
4026  0473 2725          	jreq	L7732
4027                     ; 351 				if(uc_Test_Page_Now == (U8)(0)){
4029  0475 725d0004      	tnz	_uc_Test_Page_Now
4030  0479 260c          	jrne	L1042
4031                     ; 352 					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
4033  047b 725d0002      	tnz	_uc_Test_Data_Select_Num
4034  047f 263b          	jrne	L1732
4037  0481 725c0002      	inc	_uc_Test_Data_Select_Num
4038  0485 2035          	jra	L1732
4039  0487               L1042:
4040                     ; 353 				} else if(uc_Test_Page_Now == (U8)(2)){
4042  0487 c60004        	ld	a,_uc_Test_Page_Now
4043  048a a102          	cp	a,#2
4044  048c 262e          	jrne	L1732
4045                     ; 354 					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
4047  048e 725d0002      	tnz	_uc_Test_Data_Select_Num
4048  0492 2628          	jrne	L1732
4051  0494 725c0002      	inc	_uc_Test_Data_Select_Num
4052  0498 2022          	jra	L1732
4053  049a               L7732:
4054                     ; 357 				if(uc_Test_Page_Now < 4){
4056  049a c60004        	ld	a,_uc_Test_Page_Now
4057  049d a104          	cp	a,#4
4058  049f 241b          	jruge	L1732
4059                     ; 358 					uc_Test_Page_Now++;
4061  04a1 725c0004      	inc	_uc_Test_Page_Now
4062                     ; 360 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
4064  04a5 725d0004      	tnz	_uc_Test_Page_Now
4065  04a9 2606          	jrne	L7142
4068  04ab 725f0002      	clr	_uc_Test_Data_Select_Num
4070  04af 200b          	jra	L1732
4071  04b1               L7142:
4072                     ; 361 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 5; }
4074  04b1 c60004        	ld	a,_uc_Test_Page_Now
4075  04b4 a101          	cp	a,#1
4076  04b6 2604          	jrne	L1732
4079  04b8 35050002      	mov	_uc_Test_Data_Select_Num,#5
4080  04bc               L1732:
4081                     ; 365 		b_DOWN_Button_Flag = OFF;
4083  04bc 72150000      	bres	_uc_Button_Status_Reg,#2
4084  04c0               L1632:
4085                     ; 369 	if(b_SET_Button_Flag== ON){
4087  04c0 c60000        	ld	a,_uc_Button_Status_Reg
4088  04c3 a508          	bcp	a,#8
4089  04c5 274d          	jreq	L5242
4090                     ; 370 		if(b_Test_Option_flag){ 
4092  04c7 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4093  04ca a510          	bcp	a,#16
4094  04cc 2715          	jreq	L7242
4095                     ; 371 			uc_Target_Display_Mode ++; 
4097  04ce 725c0000      	inc	_uc_Target_Display_Mode
4098                     ; 372 			uc_Test_Page_Pre = (U8)(10);
4100  04d2 350a0003      	mov	_uc_Test_Page_Pre,#10
4101                     ; 374 			if(uc_Target_Display_Mode>3u){ uc_Target_Display_Mode = 0u; }
4103  04d6 c60000        	ld	a,_uc_Target_Display_Mode
4104  04d9 a104          	cp	a,#4
4105  04db 2533          	jrult	L3342
4108  04dd 725f0000      	clr	_uc_Target_Display_Mode
4109  04e1 202d          	jra	L3342
4110  04e3               L7242:
4111                     ; 377 		else if(uc_Test_Page_Now < 4){
4113  04e3 c60004        	ld	a,_uc_Test_Page_Now
4114  04e6 a104          	cp	a,#4
4115  04e8 2426          	jruge	L3342
4116                     ; 379 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
4118  04ea c6000d        	ld	a,_uc_Test_Ctrl_Reg
4119  04ed a502          	bcp	a,#2
4120  04ef 2606          	jrne	L7342
4123  04f1 7212000d      	bset	_uc_Test_Ctrl_Reg,#1
4125  04f5 2015          	jra	L1442
4126  04f7               L7342:
4127                     ; 381 				if(b_Data_Setting_flag == OFF){
4129  04f7 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4130  04fa a504          	bcp	a,#4
4131  04fc 2606          	jrne	L3442
4132                     ; 382 					b_Data_Setting_flag = ON;
4134  04fe 7214000d      	bset	_uc_Test_Ctrl_Reg,#2
4136  0502 2008          	jra	L1442
4137  0504               L3442:
4138                     ; 384 					b_Data_Setting_flag = OFF;
4140  0504 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
4141                     ; 385 					b_Data_Select_flag = OFF;
4143  0508 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
4144  050c               L1442:
4145                     ; 388 			b_SET_Button_Flag = OFF;
4147  050c 72170000      	bres	_uc_Button_Status_Reg,#3
4148  0510               L3342:
4149                     ; 391 		b_SET_Button_Flag = OFF;
4151  0510 72170000      	bres	_uc_Button_Status_Reg,#3
4152  0514               L5242:
4153                     ; 395 	if(b_ONOFF_Button_Flag== ON){
4155  0514 c60000        	ld	a,_uc_Button_Status_Reg
4156  0517 a501          	bcp	a,#1
4157  0519 2711          	jreq	L7442
4158                     ; 397 		if(b_Com_On_flag == OFF){b_Com_On_flag = ON;}
4160  051b c6000d        	ld	a,_uc_Test_Ctrl_Reg
4161  051e a508          	bcp	a,#8
4162  0520 2606          	jrne	L1542
4165  0522 7216000d      	bset	_uc_Test_Ctrl_Reg,#3
4167  0526 2004          	jra	L7442
4168  0528               L1542:
4169                     ; 398 		else{ b_Com_On_flag = OFF;}
4171  0528 7217000d      	bres	_uc_Test_Ctrl_Reg,#3
4172  052c               L7442:
4173                     ; 404 	if(b_OPTION_Button_Flag == ON){
4175  052c c60000        	ld	a,_uc_Button_Status_Reg
4176  052f a510          	bcp	a,#16
4177  0531 2715          	jreq	L5542
4178                     ; 406 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
4180  0533 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4181  0536 a510          	bcp	a,#16
4182  0538 2606          	jrne	L7542
4185  053a 7218000d      	bset	_uc_Test_Ctrl_Reg,#4
4187  053e 2004          	jra	L1642
4188  0540               L7542:
4189                     ; 407 		else{b_Test_Option_flag = OFF; }
4191  0540 7219000d      	bres	_uc_Test_Ctrl_Reg,#4
4192  0544               L1642:
4193                     ; 409 		b_OPTION_Button_Flag = OFF;
4195  0544 72190000      	bres	_uc_Button_Status_Reg,#4
4196  0548               L5542:
4197                     ; 414 	if(b_ENTER_Button_Flag == ON){
4199  0548 c60000        	ld	a,_uc_Button_Status_Reg
4200  054b a520          	bcp	a,#32
4201  054d 2721          	jreq	L3642
4202                     ; 415 		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
4204  054f c60000        	ld	a,_uc_System_Ctrl_Reg
4205  0552 a501          	bcp	a,#1
4206  0554 2606          	jrne	L5642
4209  0556 72100000      	bset	_uc_System_Ctrl_Reg,#0
4211  055a 2010          	jra	L7642
4212  055c               L5642:
4213                     ; 421 if (HEATER_zone_status != HTR_ZONE_1)
4215  055c 725d0000      	tnz	_HEATER_zone_status
4216  0560 2706          	jreq	L1742
4217                     ; 422 HEATER_zone_status = HTR_ZONE_1;
4219  0562 725f0000      	clr	_HEATER_zone_status
4221  0566 2004          	jra	L7642
4222  0568               L1742:
4223                     ; 423 else HEATER_zone_status=HTR_ZONE_2;
4225  0568 35010000      	mov	_HEATER_zone_status,#1
4226  056c               L7642:
4227                     ; 426 		b_ENTER_Button_Flag = OFF;
4229  056c 721b0000      	bres	_uc_Button_Status_Reg,#5
4230  0570               L3642:
4231                     ; 429 	return;
4234  0570 81            	ret
4267                     ; 433 void Test_30s_OFF_30s_On(void)
4267                     ; 434 {
4268                     	switch	.text
4269  0571               _Test_30s_OFF_30s_On:
4273                     ; 435 	if(b_Com_On_flag){
4275  0571 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4276  0574 a508          	bcp	a,#8
4277  0576 2603cc05fc    	jreq	L5052
4278                     ; 436 		if(ui_Test_Cycle < 64800u){			// cycle 64800 total time 1080hour
4280  057b ce0023        	ldw	x,_ui_Test_Cycle
4281  057e a3fd20        	cpw	x,#64800
4282  0581 2467          	jruge	L7052
4283                     ; 437 			if(uc_Test_Step == 0u){ 
4285  0583 725d0022      	tnz	_uc_Test_Step
4286  0587 260c          	jrne	L1152
4287                     ; 438 				Reset_Cycle_Test_Timer();	//time clear
4289  0589 cd005b        	call	_Reset_Cycle_Test_Timer
4291                     ; 439 				Reset_Long_Test_Timer();
4293  058c cd00b9        	call	_Reset_Long_Test_Timer
4295                     ; 440 				uc_Test_Step = 1u; 
4297  058f 35010022      	mov	_uc_Test_Step,#1
4299  0593 2067          	jra	L5052
4300  0595               L1152:
4301                     ; 442 			else if(uc_Test_Step == 1u){		// Step_2_ON
4303  0595 c60022        	ld	a,_uc_Test_Step
4304  0598 a101          	cp	a,#1
4305  059a 261f          	jrne	L5152
4306                     ; 443 				if(ui_1sec_cnt >= 30u){		// 30sec
4308  059c ce0029        	ldw	x,_ui_1sec_cnt
4309  059f a3001e        	cpw	x,#30
4310  05a2 2509          	jrult	L7152
4311                     ; 444 					uc_Test_Step++;
4313  05a4 725c0022      	inc	_uc_Test_Step
4314                     ; 445 					Reset_Cycle_Test_Timer();
4316  05a8 cd005b        	call	_Reset_Cycle_Test_Timer
4319  05ab 204f          	jra	L5052
4320  05ad               L7152:
4321                     ; 447 					uc_Target_Duty_Perc[HTR_ZONE_1] = 190u;
4323  05ad 35be000a      	mov	_uc_Target_Duty_Perc,#190
4324                     ; 448 					uc_Target_Duty_Perc[HTR_ZONE_2] = 190u;
4326  05b1 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
4327                     ; 449 					uc_Heater_Enable_Flag = ON;
4329  05b5 35010009      	mov	_uc_Heater_Enable_Flag,#1
4330  05b9 2041          	jra	L5052
4331  05bb               L5152:
4332                     ; 452 			else if(uc_Test_Step == 2u){		// Step1_OFF
4334  05bb c60022        	ld	a,_uc_Test_Step
4335  05be a102          	cp	a,#2
4336  05c0 263a          	jrne	L5052
4337                     ; 453 				if(ui_1sec_cnt >= 30u){		// 3osec
4339  05c2 ce0029        	ldw	x,_ui_1sec_cnt
4340  05c5 a3001e        	cpw	x,#30
4341  05c8 2512          	jrult	L7252
4342                     ; 454 					uc_Test_Step = 1u;
4344  05ca 35010022      	mov	_uc_Test_Step,#1
4345                     ; 455 					ui_Test_Cycle++;
4347  05ce ce0023        	ldw	x,_ui_Test_Cycle
4348  05d1 1c0001        	addw	x,#1
4349  05d4 cf0023        	ldw	_ui_Test_Cycle,x
4350                     ; 456 					Reset_Cycle_Test_Timer();
4352  05d7 cd005b        	call	_Reset_Cycle_Test_Timer
4355  05da 2020          	jra	L5052
4356  05dc               L7252:
4357                     ; 458 					uc_Target_Duty_Perc[HTR_ZONE_1] = 0u;
4359  05dc 725f000a      	clr	_uc_Target_Duty_Perc
4360                     ; 459 					uc_Target_Duty_Perc[HTR_ZONE_2] = 0u;
4362  05e0 725f000b      	clr	_uc_Target_Duty_Perc+1
4363                     ; 460 					uc_Heater_Enable_Flag = OFF;
4365  05e4 725f0009      	clr	_uc_Heater_Enable_Flag
4366  05e8 2012          	jra	L5052
4367  05ea               L7052:
4368                     ; 465 			uc_Test_Step = 0u;
4370  05ea 725f0022      	clr	_uc_Test_Step
4371                     ; 466 			ui_Test_Cycle = 0u;
4373  05ee 5f            	clrw	x
4374  05ef cf0023        	ldw	_ui_Test_Cycle,x
4375                     ; 467 			Reset_Cycle_Test_Timer();
4377  05f2 cd005b        	call	_Reset_Cycle_Test_Timer
4379                     ; 468 			Reset_Long_Test_Timer();
4381  05f5 cd00b9        	call	_Reset_Long_Test_Timer
4383                     ; 470 			ui_Test_Target = 0u;
4385  05f8 5f            	clrw	x
4386  05f9 cf0025        	ldw	_ui_Test_Target,x
4387  05fc               L5052:
4388                     ; 473 	return;
4391  05fc 81            	ret
4424                     ; 477 void Test_10m_OFF_10m_On(void)
4424                     ; 478 {
4425                     	switch	.text
4426  05fd               _Test_10m_OFF_10m_On:
4430                     ; 479 	if(b_Com_On_flag){
4432  05fd c6000d        	ld	a,_uc_Test_Ctrl_Reg
4433  0600 a508          	bcp	a,#8
4434  0602 2603cc0688    	jreq	L5452
4435                     ; 480 		if(ui_Test_Cycle < 144u){					// cycle 144 total time 48 hour
4437  0607 ce0023        	ldw	x,_ui_Test_Cycle
4438  060a a30090        	cpw	x,#144
4439  060d 2467          	jruge	L7452
4440                     ; 481 			if(uc_Test_Step == 0u){ 			//time clear
4442  060f 725d0022      	tnz	_uc_Test_Step
4443  0613 260c          	jrne	L1552
4444                     ; 482 				Reset_Cycle_Test_Timer();
4446  0615 cd005b        	call	_Reset_Cycle_Test_Timer
4448                     ; 483 				Reset_Long_Test_Timer();
4450  0618 cd00b9        	call	_Reset_Long_Test_Timer
4452                     ; 484 				uc_Test_Step = 1u; 
4454  061b 35010022      	mov	_uc_Test_Step,#1
4456  061f 2067          	jra	L5452
4457  0621               L1552:
4458                     ; 486 			else if(uc_Test_Step == 1u){		// Step_1_OFF
4460  0621 c60022        	ld	a,_uc_Test_Step
4461  0624 a101          	cp	a,#1
4462  0626 261f          	jrne	L5552
4463                     ; 487 				if(ui_1min_cnt >= 10u){		// 10min
4465  0628 ce002b        	ldw	x,_ui_1min_cnt
4466  062b a3000a        	cpw	x,#10
4467  062e 2509          	jrult	L7552
4468                     ; 488 					uc_Test_Step++;
4470  0630 725c0022      	inc	_uc_Test_Step
4471                     ; 489 					Reset_Cycle_Test_Timer();
4473  0634 cd005b        	call	_Reset_Cycle_Test_Timer
4476  0637 204f          	jra	L5452
4477  0639               L7552:
4478                     ; 491 					uc_Target_Duty_Perc[HTR_ZONE_1] = 190u;
4480  0639 35be000a      	mov	_uc_Target_Duty_Perc,#190
4481                     ; 492 					uc_Target_Duty_Perc[HTR_ZONE_2] = 190u;
4483  063d 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
4484                     ; 493 					uc_Heater_Enable_Flag = ON;
4486  0641 35010009      	mov	_uc_Heater_Enable_Flag,#1
4487  0645 2041          	jra	L5452
4488  0647               L5552:
4489                     ; 496 			else if(uc_Test_Step == 2u){		// Step_2_On 
4491  0647 c60022        	ld	a,_uc_Test_Step
4492  064a a102          	cp	a,#2
4493  064c 263a          	jrne	L5452
4494                     ; 497 				if(ui_1min_cnt >= 10u){		// 10min
4496  064e ce002b        	ldw	x,_ui_1min_cnt
4497  0651 a3000a        	cpw	x,#10
4498  0654 2512          	jrult	L7652
4499                     ; 498 					uc_Test_Step = 1u;
4501  0656 35010022      	mov	_uc_Test_Step,#1
4502                     ; 499 					ui_Test_Cycle ++;
4504  065a ce0023        	ldw	x,_ui_Test_Cycle
4505  065d 1c0001        	addw	x,#1
4506  0660 cf0023        	ldw	_ui_Test_Cycle,x
4507                     ; 500 					Reset_Cycle_Test_Timer();
4509  0663 cd005b        	call	_Reset_Cycle_Test_Timer
4512  0666 2020          	jra	L5452
4513  0668               L7652:
4514                     ; 502 					uc_Target_Duty_Perc[HTR_ZONE_1] = 0u;
4516  0668 725f000a      	clr	_uc_Target_Duty_Perc
4517                     ; 503 					uc_Target_Duty_Perc[HTR_ZONE_2] = 0u;
4519  066c 725f000b      	clr	_uc_Target_Duty_Perc+1
4520                     ; 504 					uc_Heater_Enable_Flag = OFF;
4522  0670 725f0009      	clr	_uc_Heater_Enable_Flag
4523  0674 2012          	jra	L5452
4524  0676               L7452:
4525                     ; 509 			uc_Test_Step = 0u;
4527  0676 725f0022      	clr	_uc_Test_Step
4528                     ; 510 			ui_Test_Cycle = 0u;
4530  067a 5f            	clrw	x
4531  067b cf0023        	ldw	_ui_Test_Cycle,x
4532                     ; 511 			Reset_Cycle_Test_Timer();
4534  067e cd005b        	call	_Reset_Cycle_Test_Timer
4536                     ; 512 			Reset_Long_Test_Timer();
4538  0681 cd00b9        	call	_Reset_Long_Test_Timer
4540                     ; 514 			ui_Test_Target = 0u;
4542  0684 5f            	clrw	x
4543  0685 cf0025        	ldw	_ui_Test_Target,x
4544  0688               L5452:
4545                     ; 517 	return;
4548  0688 81            	ret
4580                     ; 520 void Test_1h_OFF_1h_On(void)
4580                     ; 521 {
4581                     	switch	.text
4582  0689               _Test_1h_OFF_1h_On:
4586                     ; 522 	if(b_Com_On_flag){
4588  0689 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4589  068c a508          	bcp	a,#8
4590  068e 277b          	jreq	L5062
4591                     ; 523 		if(ui_Test_Cycle < 12u){
4593  0690 ce0023        	ldw	x,_ui_Test_Cycle
4594  0693 a3000c        	cpw	x,#12
4595  0696 2461          	jruge	L7062
4596                     ; 524 			if(uc_Test_Step == 0u){ 
4598  0698 725d0022      	tnz	_uc_Test_Step
4599  069c 260c          	jrne	L1162
4600                     ; 525 				Reset_Cycle_Test_Timer();
4602  069e cd005b        	call	_Reset_Cycle_Test_Timer
4604                     ; 526 				Reset_Long_Test_Timer();
4606  06a1 cd00b9        	call	_Reset_Long_Test_Timer
4608                     ; 527 					uc_Test_Step = 1u; 
4610  06a4 35010022      	mov	_uc_Test_Step,#1
4612  06a8 2061          	jra	L5062
4613  06aa               L1162:
4614                     ; 529 			else if(uc_Test_Step == 1u){		// Step_1_OFF
4616  06aa c60022        	ld	a,_uc_Test_Step
4617  06ad a101          	cp	a,#1
4618  06af 261c          	jrne	L5162
4619                     ; 530 				if(ui_1hour_cnt >= 1u){		// 1hour
4621  06b1 ce002d        	ldw	x,_ui_1hour_cnt
4622  06b4 2709          	jreq	L7162
4623                     ; 531 					uc_Test_Step++;
4625  06b6 725c0022      	inc	_uc_Test_Step
4626                     ; 532 					Reset_Cycle_Test_Timer();
4628  06ba cd005b        	call	_Reset_Cycle_Test_Timer
4631  06bd 204c          	jra	L5062
4632  06bf               L7162:
4633                     ; 534 						uc_Target_Duty_Perc[HTR_ZONE_1] = 190u;
4635  06bf 35be000a      	mov	_uc_Target_Duty_Perc,#190
4636                     ; 535 						uc_Target_Duty_Perc[HTR_ZONE_2] = 190u;
4638  06c3 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
4639                     ; 536 						uc_Heater_Enable_Flag = ON;
4641  06c7 35010009      	mov	_uc_Heater_Enable_Flag,#1
4642  06cb 203e          	jra	L5062
4643  06cd               L5162:
4644                     ; 539 			else if(uc_Test_Step == 2u){		// Step_2_On
4646  06cd c60022        	ld	a,_uc_Test_Step
4647  06d0 a102          	cp	a,#2
4648  06d2 2637          	jrne	L5062
4649                     ; 540 				if(ui_1hour_cnt >= 1u){		// 1hour
4651  06d4 ce002d        	ldw	x,_ui_1hour_cnt
4652  06d7 2712          	jreq	L7262
4653                     ; 541 					uc_Test_Step = 1u;
4655  06d9 35010022      	mov	_uc_Test_Step,#1
4656                     ; 542 					ui_Test_Cycle ++;
4658  06dd ce0023        	ldw	x,_ui_Test_Cycle
4659  06e0 1c0001        	addw	x,#1
4660  06e3 cf0023        	ldw	_ui_Test_Cycle,x
4661                     ; 543 					Reset_Cycle_Test_Timer();
4663  06e6 cd005b        	call	_Reset_Cycle_Test_Timer
4666  06e9 2020          	jra	L5062
4667  06eb               L7262:
4668                     ; 547 					uc_Target_Duty_Perc[HTR_ZONE_1] = 0u;
4670  06eb 725f000a      	clr	_uc_Target_Duty_Perc
4671                     ; 548 					uc_Target_Duty_Perc[HTR_ZONE_2] = 0u;
4673  06ef 725f000b      	clr	_uc_Target_Duty_Perc+1
4674                     ; 549 					uc_Heater_Enable_Flag = OFF;
4676  06f3 725f0009      	clr	_uc_Heater_Enable_Flag
4677  06f7 2012          	jra	L5062
4678  06f9               L7062:
4679                     ; 554 			uc_Test_Step = 0u;
4681  06f9 725f0022      	clr	_uc_Test_Step
4682                     ; 555 			ui_Test_Cycle = 0u;
4684  06fd 5f            	clrw	x
4685  06fe cf0023        	ldw	_ui_Test_Cycle,x
4686                     ; 556 			Reset_Cycle_Test_Timer();
4688  0701 cd005b        	call	_Reset_Cycle_Test_Timer
4690                     ; 557 			Reset_Long_Test_Timer();
4692  0704 cd00b9        	call	_Reset_Long_Test_Timer
4694                     ; 559 			ui_Test_Target = 0u;
4696  0707 5f            	clrw	x
4697  0708 cf0025        	ldw	_ui_Test_Target,x
4698  070b               L5062:
4699                     ; 562 	return;
4702  070b 81            	ret
4734                     ; 565 void Test_48h_On(void)
4734                     ; 566 {
4735                     	switch	.text
4736  070c               _Test_48h_On:
4740                     ; 567 	if(b_Com_On_flag){
4742  070c c6000d        	ld	a,_uc_Test_Ctrl_Reg
4743  070f a508          	bcp	a,#8
4744  0711 2768          	jreq	L5462
4745                     ; 568 		if(ui_Test_Cycle < 1u){
4747  0713 ce0023        	ldw	x,_ui_Test_Cycle
4748  0716 2659          	jrne	L7462
4749                     ; 569 			if(uc_Test_Step == 0u){ 
4751  0718 725d0022      	tnz	_uc_Test_Step
4752  071c 260c          	jrne	L1562
4753                     ; 570 				Reset_Cycle_Test_Timer();
4755  071e cd005b        	call	_Reset_Cycle_Test_Timer
4757                     ; 571 				Reset_Long_Test_Timer();
4759  0721 cd00b9        	call	_Reset_Long_Test_Timer
4761                     ; 572 					uc_Test_Step = 1u; 
4763  0724 35010022      	mov	_uc_Test_Step,#1
4765  0728 2051          	jra	L5462
4766  072a               L1562:
4767                     ; 574 			else if(uc_Test_Step == 1u){
4769  072a c60022        	ld	a,_uc_Test_Step
4770  072d a101          	cp	a,#1
4771  072f 261f          	jrne	L5562
4772                     ; 577 				if(ui_1hour_cnt >= 48u){		// 1hour
4774  0731 ce002d        	ldw	x,_ui_1hour_cnt
4775  0734 a30030        	cpw	x,#48
4776  0737 2509          	jrult	L7562
4777                     ; 578 					uc_Test_Step++;
4779  0739 725c0022      	inc	_uc_Test_Step
4780                     ; 579 					Reset_Cycle_Test_Timer();
4782  073d cd005b        	call	_Reset_Cycle_Test_Timer
4785  0740 2039          	jra	L5462
4786  0742               L7562:
4787                     ; 581 						uc_Target_Duty_Perc[HTR_ZONE_1] = 190u;
4789  0742 35be000a      	mov	_uc_Target_Duty_Perc,#190
4790                     ; 582 						uc_Target_Duty_Perc[HTR_ZONE_2] = 190u;
4792  0746 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
4793                     ; 583 						uc_Heater_Enable_Flag = ON;
4795  074a 35010009      	mov	_uc_Heater_Enable_Flag,#1
4796  074e 202b          	jra	L5462
4797  0750               L5562:
4798                     ; 586 			else if(uc_Test_Step == 2u){		// Step_2_On
4800  0750 c60022        	ld	a,_uc_Test_Step
4801  0753 a102          	cp	a,#2
4802  0755 2624          	jrne	L5462
4803                     ; 587 				ui_Test_Cycle ++;
4805  0757 ce0023        	ldw	x,_ui_Test_Cycle
4806  075a 1c0001        	addw	x,#1
4807  075d cf0023        	ldw	_ui_Test_Cycle,x
4808                     ; 588 				Reset_Cycle_Test_Timer();
4810  0760 cd005b        	call	_Reset_Cycle_Test_Timer
4812                     ; 590 				uc_Target_Duty_Perc[HTR_ZONE_1] = 0u;
4814  0763 725f000a      	clr	_uc_Target_Duty_Perc
4815                     ; 591 				uc_Target_Duty_Perc[HTR_ZONE_2] = 0u;
4817  0767 725f000b      	clr	_uc_Target_Duty_Perc+1
4818                     ; 592 				uc_Heater_Enable_Flag = OFF;
4820  076b 725f0009      	clr	_uc_Heater_Enable_Flag
4821  076f 200a          	jra	L5462
4822  0771               L7462:
4823                     ; 596 			Reset_Cycle_Test_Timer();
4825  0771 cd005b        	call	_Reset_Cycle_Test_Timer
4827                     ; 597 			Reset_Long_Test_Timer();
4829  0774 cd00b9        	call	_Reset_Long_Test_Timer
4831                     ; 599 			ui_Test_Target = 0u;
4833  0777 5f            	clrw	x
4834  0778 cf0025        	ldw	_ui_Test_Target,x
4835  077b               L5462:
4836                     ; 602 	return;
4839  077b 81            	ret
4877                     ; 607 void Cycle_Test_Control_Routine(void)
4877                     ; 608 {
4878                     	switch	.text
4879  077c               _Cycle_Test_Control_Routine:
4883                     ; 611 	if(uc_Target_Display_Mode != uc_Test_Pre_Mode){
4885  077c c60000        	ld	a,_uc_Target_Display_Mode
4886  077f c10020        	cp	a,_uc_Test_Pre_Mode
4887  0782 2719          	jreq	L1072
4888                     ; 612 		uc_Test_Pre_Mode = uc_Target_Display_Mode;
4890  0784 5500000020    	mov	_uc_Test_Pre_Mode,_uc_Target_Display_Mode
4891                     ; 614 		Reset_Cycle_Test_Timer();
4893  0789 cd005b        	call	_Reset_Cycle_Test_Timer
4895                     ; 615 		Reset_Long_Test_Timer();
4897  078c cd00b9        	call	_Reset_Long_Test_Timer
4899                     ; 617 		ui_Test_Target = 0u;
4901  078f 5f            	clrw	x
4902  0790 cf0025        	ldw	_ui_Test_Target,x
4903                     ; 618 		uc_Test_Step = 0u;
4905  0793 725f0022      	clr	_uc_Test_Step
4906                     ; 619 		ui_Test_Cycle = 0u;
4908  0797 5f            	clrw	x
4909  0798 cf0023        	ldw	_ui_Test_Cycle,x
4911  079b 204e          	jra	L3072
4912  079d               L1072:
4913                     ; 622 		if(b_Com_On_flag == ON){
4915  079d c6000d        	ld	a,_uc_Test_Ctrl_Reg
4916  07a0 a508          	bcp	a,#8
4917  07a2 2735          	jreq	L5072
4918                     ; 623 			Cycle_Test_Timer_Count();
4920  07a4 cd0000        	call	_Cycle_Test_Timer_Count
4922                     ; 624 			Long_Test_Timer_Count();
4924  07a7 cd0070        	call	_Long_Test_Timer_Count
4926                     ; 626 			if(uc_Target_Display_Mode == 0u){Test_30s_OFF_30s_On(); }			// low, normla temp
4928  07aa 725d0000      	tnz	_uc_Target_Display_Mode
4929  07ae 2605          	jrne	L7072
4932  07b0 cd0571        	call	_Test_30s_OFF_30s_On
4935  07b3 2036          	jra	L3072
4936  07b5               L7072:
4937                     ; 627 			else if(uc_Target_Display_Mode == 1u){Test_10m_OFF_10m_On(); }		// coolant spray
4939  07b5 c60000        	ld	a,_uc_Target_Display_Mode
4940  07b8 a101          	cp	a,#1
4941  07ba 2605          	jrne	L3172
4944  07bc cd05fd        	call	_Test_10m_OFF_10m_On
4947  07bf 202a          	jra	L3072
4948  07c1               L3172:
4949                     ; 628 			else if(uc_Target_Display_Mode == 2u){Test_1h_OFF_1h_On(); }		// coolant Flooding
4951  07c1 c60000        	ld	a,_uc_Target_Display_Mode
4952  07c4 a102          	cp	a,#2
4953  07c6 2605          	jrne	L7172
4956  07c8 cd0689        	call	_Test_1h_OFF_1h_On
4959  07cb 201e          	jra	L3072
4960  07cd               L7172:
4961                     ; 629 			else if(uc_Target_Display_Mode == 3u){Test_48h_On(); }
4963  07cd c60000        	ld	a,_uc_Target_Display_Mode
4964  07d0 a103          	cp	a,#3
4965  07d2 2617          	jrne	L3072
4968  07d4 cd070c        	call	_Test_48h_On
4970  07d7 2012          	jra	L3072
4971  07d9               L5072:
4972                     ; 632 		uc_Test_Step = 0u;
4974  07d9 725f0022      	clr	_uc_Test_Step
4975                     ; 633 		ui_Test_Cycle = 0u;
4977  07dd 5f            	clrw	x
4978  07de cf0023        	ldw	_ui_Test_Cycle,x
4979                     ; 634 		ui_Test_Target = 0u;
4981  07e1 5f            	clrw	x
4982  07e2 cf0025        	ldw	_ui_Test_Target,x
4983                     ; 636 		Reset_Cycle_Test_Timer();
4985  07e5 cd005b        	call	_Reset_Cycle_Test_Timer
4987                     ; 637 		Reset_Long_Test_Timer();
4989  07e8 cd00b9        	call	_Reset_Long_Test_Timer
4991  07eb               L3072:
4992                     ; 642 	return;
4995  07eb 81            	ret
5023                     ; 646 void Test_Ctrl_Text_Display_Handling(void)
5023                     ; 647 {
5024                     	switch	.text
5025  07ec               _Test_Ctrl_Text_Display_Handling:
5029                     ; 648 	switch(uc_Test_Page_Now){
5031  07ec c60004        	ld	a,_uc_Test_Page_Now
5033                     ; 685 				break;
5034  07ef 4d            	tnz	a
5035  07f0 273b          	jreq	L7272
5036  07f2 4a            	dec	a
5037  07f3 2764          	jreq	L1372
5038  07f5 4a            	dec	a
5039  07f6 2603          	jrne	L26
5040  07f8 cc0883        	jp	L3372
5041  07fb               L26:
5042  07fb 4a            	dec	a
5043  07fc 2603          	jrne	L46
5044  07fe cc08bf        	jp	L5372
5045  0801               L46:
5046  0801               L7372:
5047                     ; 679 		default:
5047                     ; 680 				strcpy(LCD_Dis_Data[0],"");	// Null
5049  0801 ae0000        	ldw	x,#_LCD_Dis_Data
5050  0804 90ae0309      	ldw	y,#L1302
5051  0808 cd0000        	call	c_strcpx
5053                     ; 681 				strcpy(LCD_Dis_Data[1],"");	// Null
5055  080b ae0010        	ldw	x,#_LCD_Dis_Data+16
5056  080e 90ae0309      	ldw	y,#L1302
5057  0812 cd0000        	call	c_strcpx
5059                     ; 682 				strcpy(LCD_Dis_Data[2],"");	// Null
5061  0815 ae0020        	ldw	x,#_LCD_Dis_Data+32
5062  0818 90ae0309      	ldw	y,#L1302
5063  081c cd0000        	call	c_strcpx
5065                     ; 683 				strcpy(LCD_Dis_Data[3],"");	// Null
5067  081f ae0030        	ldw	x,#_LCD_Dis_Data+48
5068  0822 90ae0309      	ldw	y,#L1302
5069  0826 cd0000        	call	c_strcpx
5071                     ; 685 				break;
5073  0829 ace708e7      	jpf	L3572
5074  082d               L7272:
5075                     ; 653 		case 0:	strcpy(LCD_Dis_Data[0],"C:");		// Test_Cycle
5077  082d ae0000        	ldw	x,#_LCD_Dis_Data
5078  0830 90ae0306      	ldw	y,#L5572
5079  0834 cd0000        	call	c_strcpx
5081                     ; 654 				strcpy(LCD_Dis_Data[1],"Sp:"); 		// Step
5083  0837 ae0010        	ldw	x,#_LCD_Dis_Data+16
5084  083a 90ae0302      	ldw	y,#L7572
5085  083e cd0000        	call	c_strcpx
5087                     ; 655 				strcpy(LCD_Dis_Data[2],"ST:");		// step time
5089  0841 ae0020        	ldw	x,#_LCD_Dis_Data+32
5090  0844 90ae02fe      	ldw	y,#L1672
5091  0848 cd0000        	call	c_strcpx
5093                     ; 656 				strcpy(LCD_Dis_Data[3],"T1:");		// total time
5095  084b ae0030        	ldw	x,#_LCD_Dis_Data+48
5096  084e 90ae02fa      	ldw	y,#L3672
5097  0852 cd0000        	call	c_strcpx
5099                     ; 657 				break;
5101  0855 ace708e7      	jpf	L3572
5102  0859               L1372:
5103                     ; 659 		case 1:	strcpy(LCD_Dis_Data[0],"C:");		// Test_Cycle
5105  0859 ae0000        	ldw	x,#_LCD_Dis_Data
5106  085c 90ae0306      	ldw	y,#L5572
5107  0860 cd0000        	call	c_strcpx
5109                     ; 660 				strcpy(LCD_Dis_Data[1],"Sp:"); 		// Step
5111  0863 ae0010        	ldw	x,#_LCD_Dis_Data+16
5112  0866 90ae0302      	ldw	y,#L7572
5113  086a cd0000        	call	c_strcpx
5115                     ; 661 				strcpy(LCD_Dis_Data[2],"ST:");		// step time
5117  086d ae0020        	ldw	x,#_LCD_Dis_Data+32
5118  0870 90ae02fe      	ldw	y,#L1672
5119  0874 cd0000        	call	c_strcpx
5121                     ; 662 				strcpy(LCD_Dis_Data[3],"T2:");		// total time
5123  0877 ae0030        	ldw	x,#_LCD_Dis_Data+48
5124  087a 90ae02f6      	ldw	y,#L5672
5125  087e cd0000        	call	c_strcpx
5127                     ; 663 				break;		
5129  0881 2064          	jra	L3572
5130  0883               L3372:
5131                     ; 665 		case 2:	strcpy(LCD_Dis_Data[0],"Al:     /");		// PTC_Allowance: / Status 
5133  0883 ae0000        	ldw	x,#_LCD_Dis_Data
5134  0886 90ae02ec      	ldw	y,#L7672
5135  088a cd0000        	call	c_strcpx
5137                     ; 666 				if(!uc_Target_Display_Mode){ strcpy(LCD_Dis_Data[1],"Td:     Fd:"); }	// Target Duty:   / Feedback Duty:
5139  088d 725d0000      	tnz	_uc_Target_Display_Mode
5140  0891 260c          	jrne	L1772
5143  0893 ae0010        	ldw	x,#_LCD_Dis_Data+16
5144  0896 90ae02e0      	ldw	y,#L3772
5145  089a cd0000        	call	c_strcpx
5148  089d 200a          	jra	L5772
5149  089f               L1772:
5150                     ; 667 				else{ strcpy(LCD_Dis_Data[1],"Tp:     Fd:"); }	// Target Duty:   / Feedback Duty:
5152  089f ae0010        	ldw	x,#_LCD_Dis_Data+16
5153  08a2 90ae02d4      	ldw	y,#L7772
5154  08a6 cd0000        	call	c_strcpx
5156  08a9               L5772:
5157                     ; 668 				strcpy(LCD_Dis_Data[2],"R:  F:  HV:");	// Ready: / Fault: / HV:
5159  08a9 ae0020        	ldw	x,#_LCD_Dis_Data+32
5160  08ac 90ae02c8      	ldw	y,#L1003
5161  08b0 cd0000        	call	c_strcpx
5163                     ; 669 				strcpy(LCD_Dis_Data[3],"Cr:     Pw:");	// Current:  / Power:
5165  08b3 ae0030        	ldw	x,#_LCD_Dis_Data+48
5166  08b6 90ae02bc      	ldw	y,#L3003
5167  08ba cd0000        	call	c_strcpx
5169                     ; 670 				break;
5171  08bd 2028          	jra	L3572
5172  08bf               L5372:
5173                     ; 673 		case 3:	strcpy(LCD_Dis_Data[0],"Ct:");			// Core Temp:
5175  08bf ae0000        	ldw	x,#_LCD_Dis_Data
5176  08c2 90ae02b8      	ldw	y,#L5003
5177  08c6 cd0000        	call	c_strcpx
5179                     ; 674 				strcpy(LCD_Dis_Data[1],"Ver:");		// Software_Version:
5181  08c9 ae0010        	ldw	x,#_LCD_Dis_Data+16
5182  08cc 90ae02b3      	ldw	y,#L7003
5183  08d0 cd0000        	call	c_strcpx
5185                     ; 675 				strcpy(LCD_Dis_Data[2],"");	// Null
5187  08d3 ae0020        	ldw	x,#_LCD_Dis_Data+32
5188  08d6 90ae0309      	ldw	y,#L1302
5189  08da cd0000        	call	c_strcpx
5191                     ; 676 				strcpy(LCD_Dis_Data[3],"");	// Null
5193  08dd ae0030        	ldw	x,#_LCD_Dis_Data+48
5194  08e0 90ae0309      	ldw	y,#L1302
5195  08e4 cd0000        	call	c_strcpx
5197                     ; 677 				break;
5199  08e7               L3572:
5200                     ; 688 	return;
5203  08e7 81            	ret
5295                     .const:	section	.text
5296  0000               L001:
5297  0000 000003e8      	dc.l	1000
5298                     ; 693 static void MV_Ctrl_LCD_Display_Control(void)
5298                     ; 694 {
5299                     	switch	.text
5300  08e8               L1103_MV_Ctrl_LCD_Display_Control:
5302  08e8 5216          	subw	sp,#22
5303       00000016      OFST:	set	22
5306                     ; 701 if (HEATER_zone_status==HTR_ZONE_1)
5308  08ea 725d0000      	tnz	_HEATER_zone_status
5309  08ee 263a          	jrne	L5403
5310                     ; 703 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
5312  08f0 0f15          	clr	(OFST-1,sp)
5314  08f2               L7403:
5315                     ; 705 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS1][uc_buffer];
5317  08f2 96            	ldw	x,sp
5318  08f3 1c000d        	addw	x,#OFST-9
5319  08f6 9f            	ld	a,xl
5320  08f7 5e            	swapw	x
5321  08f8 1b15          	add	a,(OFST-1,sp)
5322  08fa 2401          	jrnc	L07
5323  08fc 5c            	incw	x
5324  08fd               L07:
5325  08fd 02            	rlwa	x,a
5326  08fe 7b15          	ld	a,(OFST-1,sp)
5327  0900 905f          	clrw	y
5328  0902 9097          	ld	yl,a
5329  0904 90d60000      	ld	a,(_uc_Rx_Data,y)
5330  0908 f7            	ld	(x),a
5331                     ; 706 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
5333  0909 96            	ldw	x,sp
5334  090a 1c0003        	addw	x,#OFST-19
5335  090d 9f            	ld	a,xl
5336  090e 5e            	swapw	x
5337  090f 1b15          	add	a,(OFST-1,sp)
5338  0911 2401          	jrnc	L27
5339  0913 5c            	incw	x
5340  0914               L27:
5341  0914 02            	rlwa	x,a
5342  0915 7b15          	ld	a,(OFST-1,sp)
5343  0917 905f          	clrw	y
5344  0919 9097          	ld	yl,a
5345  091b 90d60008      	ld	a,(_uc_Rx_Data+8,y)
5346  091f f7            	ld	(x),a
5347                     ; 703 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
5349  0920 0c15          	inc	(OFST-1,sp)
5353  0922 7b15          	ld	a,(OFST-1,sp)
5354  0924 a108          	cp	a,#8
5355  0926 25ca          	jrult	L7403
5357  0928 2038          	jra	L5503
5358  092a               L5403:
5359                     ; 711 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
5361  092a 0f15          	clr	(OFST-1,sp)
5363  092c               L7503:
5364                     ; 713 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
5366  092c 96            	ldw	x,sp
5367  092d 1c000d        	addw	x,#OFST-9
5368  0930 9f            	ld	a,xl
5369  0931 5e            	swapw	x
5370  0932 1b15          	add	a,(OFST-1,sp)
5371  0934 2401          	jrnc	L47
5372  0936 5c            	incw	x
5373  0937               L47:
5374  0937 02            	rlwa	x,a
5375  0938 7b15          	ld	a,(OFST-1,sp)
5376  093a 905f          	clrw	y
5377  093c 9097          	ld	yl,a
5378  093e 90d60010      	ld	a,(_uc_Rx_Data+16,y)
5379  0942 f7            	ld	(x),a
5380                     ; 714 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
5382  0943 96            	ldw	x,sp
5383  0944 1c0003        	addw	x,#OFST-19
5384  0947 9f            	ld	a,xl
5385  0948 5e            	swapw	x
5386  0949 1b15          	add	a,(OFST-1,sp)
5387  094b 2401          	jrnc	L67
5388  094d 5c            	incw	x
5389  094e               L67:
5390  094e 02            	rlwa	x,a
5391  094f 7b15          	ld	a,(OFST-1,sp)
5392  0951 905f          	clrw	y
5393  0953 9097          	ld	yl,a
5394  0955 90d60018      	ld	a,(_uc_Rx_Data+24,y)
5395  0959 f7            	ld	(x),a
5396                     ; 711 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
5398  095a 0c15          	inc	(OFST-1,sp)
5402  095c 7b15          	ld	a,(OFST-1,sp)
5403  095e a108          	cp	a,#8
5404  0960 25ca          	jrult	L7503
5405  0962               L5503:
5406                     ; 717 	if(b_Test_Option_flag == ON){
5408  0962 c6000d        	ld	a,_uc_Test_Ctrl_Reg
5409  0965 a510          	bcp	a,#16
5410  0967 2779          	jreq	L5603
5411                     ; 718 		Set_LCD_Address(LCD_Line[0]);
5413  0969 c60000        	ld	a,_LCD_Line
5414  096c cd0000        	call	_Set_LCD_Address
5416                     ; 719 		Display_LCD_String("*OPTION*");
5418  096f ae02aa        	ldw	x,#L7603
5419  0972 cd0000        	call	_Display_LCD_String
5421                     ; 721 		if(uc_Target_Display_Mode == (U8)(0)){
5423  0975 725d0000      	tnz	_uc_Target_Display_Mode
5424  0979 260e          	jrne	L1703
5425                     ; 722 			Set_LCD_Address(LCD_Line[1]);
5427  097b c60001        	ld	a,_LCD_Line+1
5428  097e cd0000        	call	_Set_LCD_Address
5430                     ; 723 			Display_LCD_String("*Target Perc");
5432  0981 ae029d        	ldw	x,#L3703
5433  0984 cd0000        	call	_Display_LCD_String
5436  0987 200c          	jra	L5703
5437  0989               L1703:
5438                     ; 726 			Set_LCD_Address(LCD_Line[1]);
5440  0989 c60001        	ld	a,_LCD_Line+1
5441  098c cd0000        	call	_Set_LCD_Address
5443                     ; 727 			Display_LCD_String("*Target Watt(OS)");
5445  098f ae028c        	ldw	x,#L7703
5446  0992 cd0000        	call	_Display_LCD_String
5448  0995               L5703:
5449                     ; 730 		Set_LCD_Address(LCD_Line[2]);
5451  0995 c60002        	ld	a,_LCD_Line+2
5452  0998 cd0000        	call	_Set_LCD_Address
5454                     ; 731 		Display_LCD_String("D_Unit:");
5456  099b ae0284        	ldw	x,#L1013
5457  099e cd0000        	call	_Display_LCD_String
5459                     ; 733 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
5461  09a1 c60002        	ld	a,_LCD_Line+2
5462  09a4 ab07          	add	a,#7
5463  09a6 cd0000        	call	_Set_LCD_Address
5465                     ; 734 		if(b_Blink_250_Flag){
5467  09a9 c60000        	ld	a,_uc_LCD_Blink_Reg
5468  09ac a502          	bcp	a,#2
5469  09ae 272e          	jreq	L3013
5470                     ; 735 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
5472  09b0 c60001        	ld	a,_uc_Perc_Unit
5473  09b3 5f            	clrw	x
5474  09b4 97            	ld	xl,a
5475  09b5 57            	sraw	x
5476  09b6 cd0000        	call	_Num_Display_LCD
5478                     ; 736 			Display_LCD_String(".");
5480  09b9 ae0282        	ldw	x,#L5013
5481  09bc cd0000        	call	_Display_LCD_String
5483                     ; 737 			uc_buffer = uc_Perc_Unit %(U8)(2);
5485  09bf c60001        	ld	a,_uc_Perc_Unit
5486  09c2 a401          	and	a,#1
5487  09c4 6b15          	ld	(OFST-1,sp),a
5489                     ; 738 			if(uc_buffer){ Display_LCD_String("5"); }
5491  09c6 0d15          	tnz	(OFST-1,sp)
5492  09c8 2708          	jreq	L7013
5495  09ca ae0280        	ldw	x,#L1113
5496  09cd cd0000        	call	_Display_LCD_String
5499  09d0 2006          	jra	L3113
5500  09d2               L7013:
5501                     ; 739 			else{ Display_LCD_String("0"); }
5503  09d2 ae027e        	ldw	x,#L5113
5504  09d5 cd0000        	call	_Display_LCD_String
5506  09d8               L3113:
5507                     ; 740 			Display_LCD_String("%");
5509  09d8 ae027c        	ldw	x,#L7113
5510  09db cd0000        	call	_Display_LCD_String
5512  09de               L3013:
5513                     ; 742 		return;
5515  09de ac551455      	jpf	L401
5516  09e2               L5603:
5517                     ; 745 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
5519  09e2 c60004        	ld	a,_uc_Test_Page_Now
5520  09e5 c10003        	cp	a,_uc_Test_Page_Pre
5521  09e8 270f          	jreq	L1213
5522                     ; 746 		Test_Ctrl_Text_Display_Handling(); 
5524  09ea cd07ec        	call	_Test_Ctrl_Text_Display_Handling
5526                     ; 747 		b_Data_Select_flag = OFF;
5528  09ed 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
5529                     ; 748 		b_Data_Setting_flag = OFF;
5531  09f1 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
5532                     ; 749 		uc_Test_Data_Select_Num = (U8)(0);
5534  09f5 725f0002      	clr	_uc_Test_Data_Select_Num
5535  09f9               L1213:
5536                     ; 751 	uc_Test_Page_Pre = uc_Test_Page_Now ;
5538  09f9 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
5539                     ; 754 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
5541  09fe 725d0004      	tnz	_uc_Test_Page_Now
5542  0a02 2703          	jreq	L601
5543  0a04 cc0f77        	jp	L3213
5544  0a07               L601:
5545                     ; 755 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5547  0a07 0f16          	clr	(OFST+0,sp)
5549  0a09               L5213:
5550                     ; 757 			Set_LCD_Address(LCD_Line[uc_line_index]);
5552  0a09 7b16          	ld	a,(OFST+0,sp)
5553  0a0b 5f            	clrw	x
5554  0a0c 97            	ld	xl,a
5555  0a0d d60000        	ld	a,(_LCD_Line,x)
5556  0a10 cd0000        	call	_Set_LCD_Address
5558                     ; 759 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
5560  0a13 c6000d        	ld	a,_uc_Test_Ctrl_Reg
5561  0a16 a502          	bcp	a,#2
5562  0a18 2763          	jreq	L3313
5564  0a1a c6000d        	ld	a,_uc_Test_Ctrl_Reg
5565  0a1d a504          	bcp	a,#4
5566  0a1f 265c          	jrne	L3313
5567                     ; 760 				if(uc_line_index == uc_Test_Data_Select_Num){ 
5569  0a21 7b16          	ld	a,(OFST+0,sp)
5570  0a23 c10002        	cp	a,_uc_Test_Data_Select_Num
5571  0a26 2647          	jrne	L5313
5572                     ; 761 					if(uc_Test_Data_Select_Num == (U8)(0)){
5574  0a28 725d0002      	tnz	_uc_Test_Data_Select_Num
5575  0a2c 261d          	jrne	L7313
5576                     ; 762 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
5578  0a2e c60000        	ld	a,_uc_LCD_Blink_Reg
5579  0a31 a502          	bcp	a,#2
5580  0a33 270e          	jreq	L1413
5583  0a35 7b16          	ld	a,(OFST+0,sp)
5584  0a37 97            	ld	xl,a
5585  0a38 a610          	ld	a,#16
5586  0a3a 42            	mul	x,a
5587  0a3b 1c0000        	addw	x,#_LCD_Dis_Data
5588  0a3e cd0000        	call	_Display_LCD_String
5591  0a41 2046          	jra	L3613
5592  0a43               L1413:
5593                     ; 763 						else{ Display_LCD_String("        /"); }
5595  0a43 ae0272        	ldw	x,#L5413
5596  0a46 cd0000        	call	_Display_LCD_String
5598  0a49 203e          	jra	L3613
5599  0a4b               L7313:
5600                     ; 765 					else if(uc_Test_Data_Select_Num == (U8)(1)){
5602  0a4b c60002        	ld	a,_uc_Test_Data_Select_Num
5603  0a4e a101          	cp	a,#1
5604  0a50 2637          	jrne	L3613
5605                     ; 766 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
5607  0a52 c60000        	ld	a,_uc_LCD_Blink_Reg
5608  0a55 a502          	bcp	a,#2
5609  0a57 270e          	jreq	L3513
5612  0a59 7b16          	ld	a,(OFST+0,sp)
5613  0a5b 97            	ld	xl,a
5614  0a5c a610          	ld	a,#16
5615  0a5e 42            	mul	x,a
5616  0a5f 1c0000        	addw	x,#_LCD_Dis_Data
5617  0a62 cd0000        	call	_Display_LCD_String
5620  0a65 2022          	jra	L3613
5621  0a67               L3513:
5622                     ; 767 						else{ Display_LCD_String("        Fd:"); }
5624  0a67 ae0266        	ldw	x,#L7513
5625  0a6a cd0000        	call	_Display_LCD_String
5627  0a6d 201a          	jra	L3613
5628  0a6f               L5313:
5629                     ; 770 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
5631  0a6f 7b16          	ld	a,(OFST+0,sp)
5632  0a71 97            	ld	xl,a
5633  0a72 a610          	ld	a,#16
5634  0a74 42            	mul	x,a
5635  0a75 1c0000        	addw	x,#_LCD_Dis_Data
5636  0a78 cd0000        	call	_Display_LCD_String
5638  0a7b 200c          	jra	L3613
5639  0a7d               L3313:
5640                     ; 771 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
5642  0a7d 7b16          	ld	a,(OFST+0,sp)
5643  0a7f 97            	ld	xl,a
5644  0a80 a610          	ld	a,#16
5645  0a82 42            	mul	x,a
5646  0a83 1c0000        	addw	x,#_LCD_Dis_Data
5647  0a86 cd0000        	call	_Display_LCD_String
5649  0a89               L3613:
5650                     ; 774 			if(uc_line_index == (U8)(0)){		// LINE 1
5652  0a89 0d16          	tnz	(OFST+0,sp)
5653  0a8b 2703          	jreq	L011
5654  0a8d cc0b48        	jp	L5613
5655  0a90               L011:
5656                     ; 777 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5658  0a90 7b16          	ld	a,(OFST+0,sp)
5659  0a92 5f            	clrw	x
5660  0a93 97            	ld	xl,a
5661  0a94 d60000        	ld	a,(_LCD_Line,x)
5662  0a97 ab03          	add	a,#3
5663  0a99 cd0000        	call	_Set_LCD_Address
5665                     ; 779 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
5667  0a9c c6000d        	ld	a,_uc_Test_Ctrl_Reg
5668  0a9f a504          	bcp	a,#4
5669  0aa1 2718          	jreq	L7613
5671  0aa3 7b16          	ld	a,(OFST+0,sp)
5672  0aa5 c10002        	cp	a,_uc_Test_Data_Select_Num
5673  0aa8 2611          	jrne	L7613
5674                     ; 780 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
5676  0aaa c60000        	ld	a,_uc_LCD_Blink_Reg
5677  0aad a502          	bcp	a,#2
5678  0aaf 2712          	jreq	L3713
5681  0ab1 c60009        	ld	a,_uc_Heater_Enable_Flag
5682  0ab4 5f            	clrw	x
5683  0ab5 97            	ld	xl,a
5684  0ab6 cd0000        	call	_Num_Display_LCD
5686  0ab9 2008          	jra	L3713
5687  0abb               L7613:
5688                     ; 781 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
5690  0abb c60009        	ld	a,_uc_Heater_Enable_Flag
5691  0abe 5f            	clrw	x
5692  0abf 97            	ld	xl,a
5693  0ac0 cd0000        	call	_Num_Display_LCD
5695  0ac3               L3713:
5696                     ; 785 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
5698  0ac3 7b16          	ld	a,(OFST+0,sp)
5699  0ac5 5f            	clrw	x
5700  0ac6 97            	ld	xl,a
5701  0ac7 d60000        	ld	a,(_LCD_Line,x)
5702  0aca ab05          	add	a,#5
5703  0acc cd0000        	call	_Set_LCD_Address
5705                     ; 786 				if (HEATER_zone_status == HTR_ZONE_1)
5707  0acf 725d0000      	tnz	_HEATER_zone_status
5708  0ad3 2608          	jrne	L5713
5709                     ; 787 				Display_LCD_String("Z1");
5711  0ad5 ae0263        	ldw	x,#L7713
5712  0ad8 cd0000        	call	_Display_LCD_String
5715  0adb 2006          	jra	L1023
5716  0add               L5713:
5717                     ; 788 				else Display_LCD_String("Z2");
5719  0add ae0260        	ldw	x,#L3023
5720  0ae0 cd0000        	call	_Display_LCD_String
5722  0ae3               L1023:
5723                     ; 790 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
5725  0ae3 7b16          	ld	a,(OFST+0,sp)
5726  0ae5 5f            	clrw	x
5727  0ae6 97            	ld	xl,a
5728  0ae7 d60000        	ld	a,(_LCD_Line,x)
5729  0aea ab09          	add	a,#9
5730  0aec cd0000        	call	_Set_LCD_Address
5732                     ; 792 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5734  0aef c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5735  0af2 a501          	bcp	a,#1
5736  0af4 270a          	jreq	L5023
5739  0af6 ae025d        	ldw	x,#L7023
5740  0af9 cd0000        	call	_Display_LCD_String
5743  0afc ac680f68      	jpf	L1423
5744  0b00               L5023:
5745                     ; 795 					uc_buffer = (U8)((can_data[0] & 0x06) >> 1);//YJS
5747  0b00 7b0d          	ld	a,(OFST-9,sp)
5748  0b02 44            	srl	a
5749  0b03 a403          	and	a,#3
5750  0b05 6b15          	ld	(OFST-1,sp),a
5752                     ; 796 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
5754  0b07 0d15          	tnz	(OFST-1,sp)
5755  0b09 260a          	jrne	L3123
5758  0b0b ae0258        	ldw	x,#L5123
5759  0b0e cd0000        	call	_Display_LCD_String
5762  0b11 ac680f68      	jpf	L1423
5763  0b15               L3123:
5764                     ; 797 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
5766  0b15 7b15          	ld	a,(OFST-1,sp)
5767  0b17 a101          	cp	a,#1
5768  0b19 260a          	jrne	L1223
5771  0b1b ae0253        	ldw	x,#L3223
5772  0b1e cd0000        	call	_Display_LCD_String
5775  0b21 ac680f68      	jpf	L1423
5776  0b25               L1223:
5777                     ; 798 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
5779  0b25 7b15          	ld	a,(OFST-1,sp)
5780  0b27 a102          	cp	a,#2
5781  0b29 260a          	jrne	L7223
5784  0b2b ae024f        	ldw	x,#L1323
5785  0b2e cd0000        	call	_Display_LCD_String
5788  0b31 ac680f68      	jpf	L1423
5789  0b35               L7223:
5790                     ; 799 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
5792  0b35 7b15          	ld	a,(OFST-1,sp)
5793  0b37 a103          	cp	a,#3
5794  0b39 2703          	jreq	L211
5795  0b3b cc0f68        	jp	L1423
5796  0b3e               L211:
5799  0b3e ae024a        	ldw	x,#L7323
5800  0b41 cd0000        	call	_Display_LCD_String
5802  0b44 ac680f68      	jpf	L1423
5803  0b48               L5613:
5804                     ; 808 			else if(uc_line_index == (U8)(1)){	// LINE 2
5806  0b48 7b16          	ld	a,(OFST+0,sp)
5807  0b4a a101          	cp	a,#1
5808  0b4c 2703          	jreq	L411
5809  0b4e cc0e5d        	jp	L3423
5810  0b51               L411:
5811                     ; 811 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5813  0b51 7b16          	ld	a,(OFST+0,sp)
5814  0b53 5f            	clrw	x
5815  0b54 97            	ld	xl,a
5816  0b55 d60000        	ld	a,(_LCD_Line,x)
5817  0b58 ab03          	add	a,#3
5818  0b5a cd0000        	call	_Set_LCD_Address
5820                     ; 812 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
5822  0b5d c6000d        	ld	a,_uc_Test_Ctrl_Reg
5823  0b60 a504          	bcp	a,#4
5824  0b62 2603          	jrne	L611
5825  0b64 cc0ccb        	jp	L5423
5826  0b67               L611:
5828  0b67 7b16          	ld	a,(OFST+0,sp)
5829  0b69 c10002        	cp	a,_uc_Test_Data_Select_Num
5830  0b6c 2703          	jreq	L021
5831  0b6e cc0ccb        	jp	L5423
5832  0b71               L021:
5833                     ; 813 					if(b_Blink_250_Flag){
5835  0b71 c60000        	ld	a,_uc_LCD_Blink_Reg
5836  0b74 a502          	bcp	a,#2
5837  0b76 2603          	jrne	L221
5838  0b78 cc0e0b        	jp	L3433
5839  0b7b               L221:
5840                     ; 814 						if(!uc_Target_Display_Mode){	// Percentage_Display
5842  0b7b 725d0000      	tnz	_uc_Target_Display_Mode
5843  0b7f 2676          	jrne	L1523
5844                     ; 815 if (HEATER_zone_status == HTR_ZONE_1)
5846  0b81 725d0000      	tnz	_HEATER_zone_status
5847  0b85 2638          	jrne	L3523
5848                     ; 817 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
5850  0b87 c6000a        	ld	a,_uc_Target_Duty_Perc
5851  0b8a 5f            	clrw	x
5852  0b8b 97            	ld	xl,a
5853  0b8c 57            	sraw	x
5854  0b8d cd0000        	call	_Num_Display_LCD
5856                     ; 818 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
5858  0b90 c6000a        	ld	a,_uc_Target_Duty_Perc
5859  0b93 a1c8          	cp	a,#200
5860  0b95 2503          	jrult	L421
5861  0b97 cc0e0b        	jp	L3433
5862  0b9a               L421:
5863                     ; 819 								Display_LCD_String(".");
5865  0b9a ae0282        	ldw	x,#L5013
5866  0b9d cd0000        	call	_Display_LCD_String
5868                     ; 820 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
5870  0ba0 c6000a        	ld	a,_uc_Target_Duty_Perc
5871  0ba3 a401          	and	a,#1
5872  0ba5 6b15          	ld	(OFST-1,sp),a
5874                     ; 821 								if(uc_buffer){ Display_LCD_String("5"); }
5876  0ba7 0d15          	tnz	(OFST-1,sp)
5877  0ba9 270a          	jreq	L7523
5880  0bab ae0280        	ldw	x,#L1113
5881  0bae cd0000        	call	_Display_LCD_String
5884  0bb1 ac0b0e0b      	jpf	L3433
5885  0bb5               L7523:
5886                     ; 822 								else{ Display_LCD_String("0"); }
5888  0bb5 ae027e        	ldw	x,#L5113
5889  0bb8 cd0000        	call	_Display_LCD_String
5891  0bbb ac0b0e0b      	jpf	L3433
5892  0bbf               L3523:
5893                     ; 827 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
5895  0bbf c6000b        	ld	a,_uc_Target_Duty_Perc+1
5896  0bc2 5f            	clrw	x
5897  0bc3 97            	ld	xl,a
5898  0bc4 57            	sraw	x
5899  0bc5 cd0000        	call	_Num_Display_LCD
5901                     ; 828 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
5903  0bc8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5904  0bcb a1c8          	cp	a,#200
5905  0bcd 2503          	jrult	L621
5906  0bcf cc0e0b        	jp	L3433
5907  0bd2               L621:
5908                     ; 829 								Display_LCD_String(".");
5910  0bd2 ae0282        	ldw	x,#L5013
5911  0bd5 cd0000        	call	_Display_LCD_String
5913                     ; 830 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
5915  0bd8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5916  0bdb a401          	and	a,#1
5917  0bdd 6b15          	ld	(OFST-1,sp),a
5919                     ; 831 								if(uc_buffer){ Display_LCD_String("5"); }
5921  0bdf 0d15          	tnz	(OFST-1,sp)
5922  0be1 270a          	jreq	L7623
5925  0be3 ae0280        	ldw	x,#L1113
5926  0be6 cd0000        	call	_Display_LCD_String
5929  0be9 ac0b0e0b      	jpf	L3433
5930  0bed               L7623:
5931                     ; 832 								else{ Display_LCD_String("0"); }
5933  0bed ae027e        	ldw	x,#L5113
5934  0bf0 cd0000        	call	_Display_LCD_String
5936  0bf3 ac0b0e0b      	jpf	L3433
5937  0bf7               L1523:
5938                     ; 837 if (HEATER_zone_status == HTR_ZONE_1)
5940  0bf7 725d0000      	tnz	_HEATER_zone_status
5941  0bfb 2667          	jrne	L5723
5942                     ; 839 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
5944  0bfd c6000a        	ld	a,_uc_Target_Duty_Perc
5945  0c00 a114          	cp	a,#20
5946  0c02 2408          	jruge	L7723
5949  0c04 5f            	clrw	x
5950  0c05 cd0000        	call	_Num_Display_LCD
5953  0c08 ac0b0e0b      	jpf	L3433
5954  0c0c               L7723:
5955                     ; 840 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
5957  0c0c c6000a        	ld	a,_uc_Target_Duty_Perc
5958  0c0f a114          	cp	a,#20
5959  0c11 260a          	jrne	L3033
5962  0c13 ae0064        	ldw	x,#100
5963  0c16 cd0000        	call	_Num_Display_LCD
5966  0c19 ac0b0e0b      	jpf	L3433
5967  0c1d               L3033:
5968                     ; 841 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
5970  0c1d c6000a        	ld	a,_uc_Target_Duty_Perc
5971  0c20 a1b4          	cp	a,#180
5972  0c22 260a          	jrne	L7033
5975  0c24 ae1838        	ldw	x,#6200
5976  0c27 cd0000        	call	_Num_Display_LCD
5979  0c2a ac0b0e0b      	jpf	L3433
5980  0c2e               L7033:
5981                     ; 842 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
5983  0c2e c6000a        	ld	a,_uc_Target_Duty_Perc
5984  0c31 a1be          	cp	a,#190
5985  0c33 260a          	jrne	L3133
5988  0c35 ae0246        	ldw	x,#L5133
5989  0c38 cd0000        	call	_Display_LCD_String
5992  0c3b ac0b0e0b      	jpf	L3433
5993  0c3f               L3133:
5994                     ; 843 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
5996  0c3f c6000a        	ld	a,_uc_Target_Duty_Perc
5997  0c42 5f            	clrw	x
5998  0c43 97            	ld	xl,a
5999  0c44 1d0014        	subw	x,#20
6000  0c47 90ae94ed      	ldw	y,#38125
6001  0c4b cd0000        	call	c_umul
6003  0c4e ae0000        	ldw	x,#L001
6004  0c51 cd0000        	call	c_ludv
6006  0c54 be02          	ldw	x,c_lreg+2
6007  0c56 1c0064        	addw	x,#100
6008  0c59 1f0b          	ldw	(OFST-11,sp),x
6012  0c5b 1e0b          	ldw	x,(OFST-11,sp)
6013  0c5d cd0000        	call	_Num_Display_LCD
6015  0c60 ac0b0e0b      	jpf	L3433
6016  0c64               L5723:
6017                     ; 847 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
6019  0c64 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6020  0c67 a114          	cp	a,#20
6021  0c69 2408          	jruge	L3233
6024  0c6b 5f            	clrw	x
6025  0c6c cd0000        	call	_Num_Display_LCD
6028  0c6f ac0b0e0b      	jpf	L3433
6029  0c73               L3233:
6030                     ; 848 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
6032  0c73 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6033  0c76 a114          	cp	a,#20
6034  0c78 260a          	jrne	L7233
6037  0c7a ae0064        	ldw	x,#100
6038  0c7d cd0000        	call	_Num_Display_LCD
6041  0c80 ac0b0e0b      	jpf	L3433
6042  0c84               L7233:
6043                     ; 849 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
6045  0c84 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6046  0c87 a1b4          	cp	a,#180
6047  0c89 260a          	jrne	L3333
6050  0c8b ae1838        	ldw	x,#6200
6051  0c8e cd0000        	call	_Num_Display_LCD
6054  0c91 ac0b0e0b      	jpf	L3433
6055  0c95               L3333:
6056                     ; 850 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
6058  0c95 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6059  0c98 a1be          	cp	a,#190
6060  0c9a 260a          	jrne	L7333
6063  0c9c ae0246        	ldw	x,#L5133
6064  0c9f cd0000        	call	_Display_LCD_String
6067  0ca2 ac0b0e0b      	jpf	L3433
6068  0ca6               L7333:
6069                     ; 851 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
6071  0ca6 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6072  0ca9 5f            	clrw	x
6073  0caa 97            	ld	xl,a
6074  0cab 1d0014        	subw	x,#20
6075  0cae 90ae94ed      	ldw	y,#38125
6076  0cb2 cd0000        	call	c_umul
6078  0cb5 ae0000        	ldw	x,#L001
6079  0cb8 cd0000        	call	c_ludv
6081  0cbb be02          	ldw	x,c_lreg+2
6082  0cbd 1c0064        	addw	x,#100
6083  0cc0 1f0b          	ldw	(OFST-11,sp),x
6087  0cc2 1e0b          	ldw	x,(OFST-11,sp)
6088  0cc4 cd0000        	call	_Num_Display_LCD
6090  0cc7 ac0b0e0b      	jpf	L3433
6091  0ccb               L5423:
6092                     ; 856 					if(!uc_Target_Display_Mode){
6094  0ccb 725d0000      	tnz	_uc_Target_Display_Mode
6095  0ccf 2676          	jrne	L5433
6096                     ; 857 if (HEATER_zone_status == HTR_ZONE_1)
6098  0cd1 725d0000      	tnz	_HEATER_zone_status
6099  0cd5 2638          	jrne	L7433
6100                     ; 859 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
6102  0cd7 c6000a        	ld	a,_uc_Target_Duty_Perc
6103  0cda 5f            	clrw	x
6104  0cdb 97            	ld	xl,a
6105  0cdc 57            	sraw	x
6106  0cdd cd0000        	call	_Num_Display_LCD
6108                     ; 860 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
6110  0ce0 c6000a        	ld	a,_uc_Target_Duty_Perc
6111  0ce3 a1c8          	cp	a,#200
6112  0ce5 2503          	jrult	L031
6113  0ce7 cc0e0b        	jp	L3433
6114  0cea               L031:
6115                     ; 861 							Display_LCD_String(".");
6117  0cea ae0282        	ldw	x,#L5013
6118  0ced cd0000        	call	_Display_LCD_String
6120                     ; 862 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
6122  0cf0 c6000a        	ld	a,_uc_Target_Duty_Perc
6123  0cf3 a401          	and	a,#1
6124  0cf5 6b15          	ld	(OFST-1,sp),a
6126                     ; 863 							if(uc_buffer){ Display_LCD_String("5"); }
6128  0cf7 0d15          	tnz	(OFST-1,sp)
6129  0cf9 270a          	jreq	L3533
6132  0cfb ae0280        	ldw	x,#L1113
6133  0cfe cd0000        	call	_Display_LCD_String
6136  0d01 ac0b0e0b      	jpf	L3433
6137  0d05               L3533:
6138                     ; 864 							else{ Display_LCD_String("0"); }
6140  0d05 ae027e        	ldw	x,#L5113
6141  0d08 cd0000        	call	_Display_LCD_String
6143  0d0b ac0b0e0b      	jpf	L3433
6144  0d0f               L7433:
6145                     ; 869 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
6147  0d0f c6000b        	ld	a,_uc_Target_Duty_Perc+1
6148  0d12 5f            	clrw	x
6149  0d13 97            	ld	xl,a
6150  0d14 57            	sraw	x
6151  0d15 cd0000        	call	_Num_Display_LCD
6153                     ; 870 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
6155  0d18 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6156  0d1b a1c8          	cp	a,#200
6157  0d1d 2503          	jrult	L231
6158  0d1f cc0e0b        	jp	L3433
6159  0d22               L231:
6160                     ; 871 							Display_LCD_String(".");
6162  0d22 ae0282        	ldw	x,#L5013
6163  0d25 cd0000        	call	_Display_LCD_String
6165                     ; 872 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
6167  0d28 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6168  0d2b a401          	and	a,#1
6169  0d2d 6b15          	ld	(OFST-1,sp),a
6171                     ; 873 							if(uc_buffer){ Display_LCD_String("5"); }
6173  0d2f 0d15          	tnz	(OFST-1,sp)
6174  0d31 270a          	jreq	L3633
6177  0d33 ae0280        	ldw	x,#L1113
6178  0d36 cd0000        	call	_Display_LCD_String
6181  0d39 ac0b0e0b      	jpf	L3433
6182  0d3d               L3633:
6183                     ; 874 							else{ Display_LCD_String("0"); }
6185  0d3d ae027e        	ldw	x,#L5113
6186  0d40 cd0000        	call	_Display_LCD_String
6188  0d43 ac0b0e0b      	jpf	L3433
6189  0d47               L5433:
6190                     ; 879 if (HEATER_zone_status == HTR_ZONE_1)
6192  0d47 725d0000      	tnz	_HEATER_zone_status
6193  0d4b 2663          	jrne	L1733
6194                     ; 881 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
6196  0d4d c6000a        	ld	a,_uc_Target_Duty_Perc
6197  0d50 a114          	cp	a,#20
6198  0d52 2408          	jruge	L3733
6201  0d54 5f            	clrw	x
6202  0d55 cd0000        	call	_Num_Display_LCD
6205  0d58 ac0b0e0b      	jpf	L3433
6206  0d5c               L3733:
6207                     ; 882 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
6209  0d5c c6000a        	ld	a,_uc_Target_Duty_Perc
6210  0d5f a114          	cp	a,#20
6211  0d61 260a          	jrne	L7733
6214  0d63 ae0064        	ldw	x,#100
6215  0d66 cd0000        	call	_Num_Display_LCD
6218  0d69 ac0b0e0b      	jpf	L3433
6219  0d6d               L7733:
6220                     ; 883 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
6222  0d6d c6000a        	ld	a,_uc_Target_Duty_Perc
6223  0d70 a1b4          	cp	a,#180
6224  0d72 260a          	jrne	L3043
6227  0d74 ae1838        	ldw	x,#6200
6228  0d77 cd0000        	call	_Num_Display_LCD
6231  0d7a ac0b0e0b      	jpf	L3433
6232  0d7e               L3043:
6233                     ; 884 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
6235  0d7e c6000a        	ld	a,_uc_Target_Duty_Perc
6236  0d81 a1b5          	cp	a,#181
6237  0d83 2508          	jrult	L7043
6240  0d85 ae0246        	ldw	x,#L5133
6241  0d88 cd0000        	call	_Display_LCD_String
6244  0d8b 207e          	jra	L3433
6245  0d8d               L7043:
6246                     ; 885 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
6248  0d8d c6000a        	ld	a,_uc_Target_Duty_Perc
6249  0d90 5f            	clrw	x
6250  0d91 97            	ld	xl,a
6251  0d92 1d0014        	subw	x,#20
6252  0d95 90ae94ed      	ldw	y,#38125
6253  0d99 cd0000        	call	c_umul
6255  0d9c ae0000        	ldw	x,#L001
6256  0d9f cd0000        	call	c_ludv
6258  0da2 be02          	ldw	x,c_lreg+2
6259  0da4 1c0064        	addw	x,#100
6260  0da7 1f0b          	ldw	(OFST-11,sp),x
6264  0da9 1e0b          	ldw	x,(OFST-11,sp)
6265  0dab cd0000        	call	_Num_Display_LCD
6267  0dae 205b          	jra	L3433
6268  0db0               L1733:
6269                     ; 889 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
6271  0db0 c6000b        	ld	a,_uc_Target_Duty_Perc+1
6272  0db3 a114          	cp	a,#20
6273  0db5 2406          	jruge	L5143
6276  0db7 5f            	clrw	x
6277  0db8 cd0000        	call	_Num_Display_LCD
6280  0dbb 204e          	jra	L3433
6281  0dbd               L5143:
6282                     ; 890 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
6284  0dbd c6000b        	ld	a,_uc_Target_Duty_Perc+1
6285  0dc0 a114          	cp	a,#20
6286  0dc2 2608          	jrne	L1243
6289  0dc4 ae0064        	ldw	x,#100
6290  0dc7 cd0000        	call	_Num_Display_LCD
6293  0dca 203f          	jra	L3433
6294  0dcc               L1243:
6295                     ; 891 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
6297  0dcc c6000b        	ld	a,_uc_Target_Duty_Perc+1
6298  0dcf a1b4          	cp	a,#180
6299  0dd1 2608          	jrne	L5243
6302  0dd3 ae1838        	ldw	x,#6200
6303  0dd6 cd0000        	call	_Num_Display_LCD
6306  0dd9 2030          	jra	L3433
6307  0ddb               L5243:
6308                     ; 892 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
6310  0ddb c6000b        	ld	a,_uc_Target_Duty_Perc+1
6311  0dde a1b5          	cp	a,#181
6312  0de0 2508          	jrult	L1343
6315  0de2 ae0246        	ldw	x,#L5133
6316  0de5 cd0000        	call	_Display_LCD_String
6319  0de8 2021          	jra	L3433
6320  0dea               L1343:
6321                     ; 893 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
6323  0dea c6000b        	ld	a,_uc_Target_Duty_Perc+1
6324  0ded 5f            	clrw	x
6325  0dee 97            	ld	xl,a
6326  0def 1d0014        	subw	x,#20
6327  0df2 90ae94ed      	ldw	y,#38125
6328  0df6 cd0000        	call	c_umul
6330  0df9 ae0000        	ldw	x,#L001
6331  0dfc cd0000        	call	c_ludv
6333  0dff be02          	ldw	x,c_lreg+2
6334  0e01 1c0064        	addw	x,#100
6335  0e04 1f0b          	ldw	(OFST-11,sp),x
6339  0e06 1e0b          	ldw	x,(OFST-11,sp)
6340  0e08 cd0000        	call	_Num_Display_LCD
6342  0e0b               L3433:
6343                     ; 899 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
6345  0e0b 7b16          	ld	a,(OFST+0,sp)
6346  0e0d 5f            	clrw	x
6347  0e0e 97            	ld	xl,a
6348  0e0f d60000        	ld	a,(_LCD_Line,x)
6349  0e12 ab0b          	add	a,#11
6350  0e14 cd0000        	call	_Set_LCD_Address
6352                     ; 900 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6354  0e17 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6355  0e1a a501          	bcp	a,#1
6356  0e1c 270a          	jreq	L5343
6359  0e1e ae025d        	ldw	x,#L7023
6360  0e21 cd0000        	call	_Display_LCD_String
6363  0e24 ac680f68      	jpf	L1423
6364  0e28               L5343:
6365                     ; 902 					Num_Display_LCD(can_data[6] /(U8)(2));
6367  0e28 7b13          	ld	a,(OFST-3,sp)
6368  0e2a 5f            	clrw	x
6369  0e2b 97            	ld	xl,a
6370  0e2c 57            	sraw	x
6371  0e2d cd0000        	call	_Num_Display_LCD
6373                     ; 903 					if(can_data[6] < (U8)(200)){
6375  0e30 7b13          	ld	a,(OFST-3,sp)
6376  0e32 a1c8          	cp	a,#200
6377  0e34 2503          	jrult	L431
6378  0e36 cc0f68        	jp	L1423
6379  0e39               L431:
6380                     ; 904 						Display_LCD_String(".");
6382  0e39 ae0282        	ldw	x,#L5013
6383  0e3c cd0000        	call	_Display_LCD_String
6385                     ; 905 						uc_buffer = can_data[6] % (U8)(2);
6387  0e3f 7b13          	ld	a,(OFST-3,sp)
6388  0e41 a401          	and	a,#1
6389  0e43 6b15          	ld	(OFST-1,sp),a
6391                     ; 906 						if(uc_buffer){ Display_LCD_String("5"); }
6393  0e45 0d15          	tnz	(OFST-1,sp)
6394  0e47 270a          	jreq	L3443
6397  0e49 ae0280        	ldw	x,#L1113
6398  0e4c cd0000        	call	_Display_LCD_String
6401  0e4f ac680f68      	jpf	L1423
6402  0e53               L3443:
6403                     ; 907 						else{ Display_LCD_String("0"); }
6405  0e53 ae027e        	ldw	x,#L5113
6406  0e56 cd0000        	call	_Display_LCD_String
6408  0e59 ac680f68      	jpf	L1423
6409  0e5d               L3423:
6410                     ; 913 			else if(uc_line_index == (U8)(2)){	// LINE 3
6412  0e5d 7b16          	ld	a,(OFST+0,sp)
6413  0e5f a102          	cp	a,#2
6414  0e61 2703          	jreq	L631
6415  0e63 cc0ef0        	jp	L1543
6416  0e66               L631:
6417                     ; 916 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
6419  0e66 7b16          	ld	a,(OFST+0,sp)
6420  0e68 5f            	clrw	x
6421  0e69 97            	ld	xl,a
6422  0e6a d60000        	ld	a,(_LCD_Line,x)
6423  0e6d ab02          	add	a,#2
6424  0e6f cd0000        	call	_Set_LCD_Address
6426                     ; 917 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
6428  0e72 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6429  0e75 a501          	bcp	a,#1
6430  0e77 2708          	jreq	L3543
6433  0e79 ae0244        	ldw	x,#L5543
6434  0e7c cd0000        	call	_Display_LCD_String
6437  0e7f 2014          	jra	L7543
6438  0e81               L3543:
6439                     ; 919 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
6441  0e81 7b0d          	ld	a,(OFST-9,sp)
6442  0e83 a501          	bcp	a,#1
6443  0e85 2708          	jreq	L1643
6446  0e87 ae0242        	ldw	x,#L3643
6447  0e8a cd0000        	call	_Display_LCD_String
6450  0e8d 2006          	jra	L7543
6451  0e8f               L1643:
6452                     ; 920 					else{ Display_LCD_String("0"); }
6454  0e8f ae027e        	ldw	x,#L5113
6455  0e92 cd0000        	call	_Display_LCD_String
6457  0e95               L7543:
6458                     ; 923 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
6460  0e95 7b16          	ld	a,(OFST+0,sp)
6461  0e97 5f            	clrw	x
6462  0e98 97            	ld	xl,a
6463  0e99 d60000        	ld	a,(_LCD_Line,x)
6464  0e9c ab06          	add	a,#6
6465  0e9e cd0000        	call	_Set_LCD_Address
6467                     ; 924 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
6469  0ea1 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6470  0ea4 a502          	bcp	a,#2
6471  0ea6 2708          	jreq	L7643
6474  0ea8 ae0244        	ldw	x,#L5543
6475  0eab cd0000        	call	_Display_LCD_String
6478  0eae 2014          	jra	L1743
6479  0eb0               L7643:
6480                     ; 926 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
6482  0eb0 7b03          	ld	a,(OFST-19,sp)
6483  0eb2 a501          	bcp	a,#1
6484  0eb4 2708          	jreq	L3743
6487  0eb6 ae0242        	ldw	x,#L3643
6488  0eb9 cd0000        	call	_Display_LCD_String
6491  0ebc 2006          	jra	L1743
6492  0ebe               L3743:
6493                     ; 927 					else{ Display_LCD_String("0"); }
6495  0ebe ae027e        	ldw	x,#L5113
6496  0ec1 cd0000        	call	_Display_LCD_String
6498  0ec4               L1743:
6499                     ; 930 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
6501  0ec4 7b16          	ld	a,(OFST+0,sp)
6502  0ec6 5f            	clrw	x
6503  0ec7 97            	ld	xl,a
6504  0ec8 d60000        	ld	a,(_LCD_Line,x)
6505  0ecb ab0b          	add	a,#11
6506  0ecd cd0000        	call	_Set_LCD_Address
6508                     ; 931 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6510  0ed0 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6511  0ed3 a501          	bcp	a,#1
6512  0ed5 270a          	jreq	L7743
6515  0ed7 ae025d        	ldw	x,#L7023
6516  0eda cd0000        	call	_Display_LCD_String
6519  0edd ac680f68      	jpf	L1423
6520  0ee1               L7743:
6521                     ; 933 					ui_buffer = (U16)(can_data[4]) * (U16)(4);//YJS 2->4
6523  0ee1 7b11          	ld	a,(OFST-5,sp)
6524  0ee3 97            	ld	xl,a
6525  0ee4 a604          	ld	a,#4
6526  0ee6 42            	mul	x,a
6527  0ee7 1f0b          	ldw	(OFST-11,sp),x
6529                     ; 934 					Num_Display_LCD(ui_buffer);
6531  0ee9 1e0b          	ldw	x,(OFST-11,sp)
6532  0eeb cd0000        	call	_Num_Display_LCD
6534  0eee 2078          	jra	L1423
6535  0ef0               L1543:
6536                     ; 939 			else if(uc_line_index == (U8)(3)){	// LINE 4
6538  0ef0 7b16          	ld	a,(OFST+0,sp)
6539  0ef2 a103          	cp	a,#3
6540  0ef4 2672          	jrne	L1423
6541                     ; 942 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
6543  0ef6 7b16          	ld	a,(OFST+0,sp)
6544  0ef8 5f            	clrw	x
6545  0ef9 97            	ld	xl,a
6546  0efa d60000        	ld	a,(_LCD_Line,x)
6547  0efd ab03          	add	a,#3
6548  0eff cd0000        	call	_Set_LCD_Address
6550                     ; 944 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6552  0f02 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6553  0f05 a501          	bcp	a,#1
6554  0f07 2708          	jreq	L7053
6557  0f09 ae025d        	ldw	x,#L7023
6558  0f0c cd0000        	call	_Display_LCD_String
6561  0f0f 2026          	jra	L1153
6562  0f11               L7053:
6563                     ; 946 					Num_Display_LCD(can_data[5] / (U8)(5));
6565  0f11 7b12          	ld	a,(OFST-4,sp)
6566  0f13 5f            	clrw	x
6567  0f14 97            	ld	xl,a
6568  0f15 a605          	ld	a,#5
6569  0f17 cd0000        	call	c_sdivx
6571  0f1a cd0000        	call	_Num_Display_LCD
6573                     ; 947 					Display_LCD_String(".");
6575  0f1d ae0282        	ldw	x,#L5013
6576  0f20 cd0000        	call	_Display_LCD_String
6578                     ; 948 					uc_buffer = can_data[5] % (U8)(5);
6580  0f23 7b12          	ld	a,(OFST-4,sp)
6581  0f25 5f            	clrw	x
6582  0f26 97            	ld	xl,a
6583  0f27 a605          	ld	a,#5
6584  0f29 62            	div	x,a
6585  0f2a 5f            	clrw	x
6586  0f2b 97            	ld	xl,a
6587  0f2c 9f            	ld	a,xl
6588  0f2d 6b15          	ld	(OFST-1,sp),a
6590                     ; 949 					Num_Display_LCD(uc_buffer * (U8)(2));
6592  0f2f 7b15          	ld	a,(OFST-1,sp)
6593  0f31 5f            	clrw	x
6594  0f32 97            	ld	xl,a
6595  0f33 58            	sllw	x
6596  0f34 cd0000        	call	_Num_Display_LCD
6598  0f37               L1153:
6599                     ; 955 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
6601  0f37 7b16          	ld	a,(OFST+0,sp)
6602  0f39 5f            	clrw	x
6603  0f3a 97            	ld	xl,a
6604  0f3b d60000        	ld	a,(_LCD_Line,x)
6605  0f3e ab0b          	add	a,#11
6606  0f40 cd0000        	call	_Set_LCD_Address
6608                     ; 957 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6610  0f43 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6611  0f46 a501          	bcp	a,#1
6612  0f48 2708          	jreq	L3153
6615  0f4a ae025d        	ldw	x,#L7023
6616  0f4d cd0000        	call	_Display_LCD_String
6619  0f50 2016          	jra	L1423
6620  0f52               L3153:
6621                     ; 959 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
6623  0f52 7b0f          	ld	a,(OFST-7,sp)
6624  0f54 5f            	clrw	x
6625  0f55 97            	ld	xl,a
6626  0f56 1f01          	ldw	(OFST-21,sp),x
6628  0f58 7b10          	ld	a,(OFST-6,sp)
6629  0f5a 5f            	clrw	x
6630  0f5b 97            	ld	xl,a
6631  0f5c 4f            	clr	a
6632  0f5d 02            	rlwa	x,a
6633  0f5e 72fb01        	addw	x,(OFST-21,sp)
6634  0f61 1f0b          	ldw	(OFST-11,sp),x
6636                     ; 960 					Num_Display_LCD(ui_buffer);
6638  0f63 1e0b          	ldw	x,(OFST-11,sp)
6639  0f65 cd0000        	call	_Num_Display_LCD
6641  0f68               L1423:
6642                     ; 755 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
6644  0f68 0c16          	inc	(OFST+0,sp)
6648  0f6a 7b16          	ld	a,(OFST+0,sp)
6649  0f6c a104          	cp	a,#4
6650  0f6e 2403          	jruge	L041
6651  0f70 cc0a09        	jp	L5213
6652  0f73               L041:
6654  0f73 ac361436      	jpf	L7153
6655  0f77               L3213:
6656                     ; 970 	else if(uc_Test_Page_Now == (U8)(1)){
6658  0f77 c60004        	ld	a,_uc_Test_Page_Now
6659  0f7a a101          	cp	a,#1
6660  0f7c 2703          	jreq	L241
6661  0f7e cc102f        	jp	L1253
6662  0f81               L241:
6663                     ; 971 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
6665  0f81 0f16          	clr	(OFST+0,sp)
6667  0f83               L3253:
6668                     ; 973 			Set_LCD_Address(LCD_Line[uc_line_index]);
6670  0f83 7b16          	ld	a,(OFST+0,sp)
6671  0f85 5f            	clrw	x
6672  0f86 97            	ld	xl,a
6673  0f87 d60000        	ld	a,(_LCD_Line,x)
6674  0f8a cd0000        	call	_Set_LCD_Address
6676                     ; 974 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
6678  0f8d 7b16          	ld	a,(OFST+0,sp)
6679  0f8f 97            	ld	xl,a
6680  0f90 a610          	ld	a,#16
6681  0f92 42            	mul	x,a
6682  0f93 1c0000        	addw	x,#_LCD_Dis_Data
6683  0f96 cd0000        	call	_Display_LCD_String
6685                     ; 977 			if(uc_line_index == (U8)(0)){		// LINE 1
6687  0f99 0d16          	tnz	(OFST+0,sp)
6688  0f9b 2641          	jrne	L1353
6689                     ; 980 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
6691  0f9d 7b16          	ld	a,(OFST+0,sp)
6692  0f9f 5f            	clrw	x
6693  0fa0 97            	ld	xl,a
6694  0fa1 d60000        	ld	a,(_LCD_Line,x)
6695  0fa4 ab03          	add	a,#3
6696  0fa6 cd0000        	call	_Set_LCD_Address
6698                     ; 981 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6700  0fa9 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6701  0fac a501          	bcp	a,#1
6702  0fae 2708          	jreq	L3353
6705  0fb0 ae025d        	ldw	x,#L7023
6706  0fb3 cd0000        	call	_Display_LCD_String
6709  0fb6 2026          	jra	L1353
6710  0fb8               L3353:
6711                     ; 983 					if(can_data[1] < (U8)(40)){
6713  0fb8 7b0e          	ld	a,(OFST-8,sp)
6714  0fba a128          	cp	a,#40
6715  0fbc 2416          	jruge	L7353
6716                     ; 984 						Display_LCD_String("-");
6718  0fbe ae0240        	ldw	x,#L1453
6719  0fc1 cd0000        	call	_Display_LCD_String
6721                     ; 985 						Num_Display_LCD((U8)(40) - can_data[1]);
6723  0fc4 a600          	ld	a,#0
6724  0fc6 97            	ld	xl,a
6725  0fc7 a628          	ld	a,#40
6726  0fc9 100e          	sub	a,(OFST-8,sp)
6727  0fcb 2401          	jrnc	L201
6728  0fcd 5a            	decw	x
6729  0fce               L201:
6730  0fce 02            	rlwa	x,a
6731  0fcf cd0000        	call	_Num_Display_LCD
6734  0fd2 200a          	jra	L1353
6735  0fd4               L7353:
6736                     ; 988 						Num_Display_LCD(can_data[1] - (U8)(40));
6738  0fd4 7b0e          	ld	a,(OFST-8,sp)
6739  0fd6 5f            	clrw	x
6740  0fd7 97            	ld	xl,a
6741  0fd8 1d0028        	subw	x,#40
6742  0fdb cd0000        	call	_Num_Display_LCD
6744  0fde               L1353:
6745                     ; 994 			if(uc_line_index == (U8)(1)){		// LINE 2
6747  0fde 7b16          	ld	a,(OFST+0,sp)
6748  0fe0 a101          	cp	a,#1
6749  0fe2 2634          	jrne	L5453
6750                     ; 997 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
6752  0fe4 7b16          	ld	a,(OFST+0,sp)
6753  0fe6 5f            	clrw	x
6754  0fe7 97            	ld	xl,a
6755  0fe8 d60000        	ld	a,(_LCD_Line,x)
6756  0feb ab04          	add	a,#4
6757  0fed cd0000        	call	_Set_LCD_Address
6759                     ; 998 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
6761  0ff0 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6762  0ff3 a502          	bcp	a,#2
6763  0ff5 2708          	jreq	L7453
6766  0ff7 ae025d        	ldw	x,#L7023
6767  0ffa cd0000        	call	_Display_LCD_String
6770  0ffd 2019          	jra	L5453
6771  0fff               L7453:
6772                     ; 1005 					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
6774  0fff 7b09          	ld	a,(OFST-13,sp)
6775  1001 4e            	swap	a
6776  1002 a40f          	and	a,#15
6777  1004 5f            	clrw	x
6778  1005 97            	ld	xl,a
6779  1006 cd0000        	call	_Num_Display_LCD
6781                     ; 1006 					Display_LCD_String(".");
6783  1009 ae0282        	ldw	x,#L5013
6784  100c cd0000        	call	_Display_LCD_String
6786                     ; 1007 					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
6788  100f 7b09          	ld	a,(OFST-13,sp)
6789  1011 a40f          	and	a,#15
6790  1013 5f            	clrw	x
6791  1014 97            	ld	xl,a
6792  1015 cd0000        	call	_Num_Display_LCD
6794  1018               L5453:
6795                     ; 1013 			if(uc_line_index == (U8)(2)){		// LINE 2
6797  1018 7b16          	ld	a,(OFST+0,sp)
6798  101a a102          	cp	a,#2
6799                     ; 1018 			if(uc_line_index == (U8)(3)){		// LINE 3
6801  101c 7b16          	ld	a,(OFST+0,sp)
6802  101e a103          	cp	a,#3
6803                     ; 971 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
6805  1020 0c16          	inc	(OFST+0,sp)
6809  1022 7b16          	ld	a,(OFST+0,sp)
6810  1024 a104          	cp	a,#4
6811  1026 2403          	jruge	L441
6812  1028 cc0f83        	jp	L3253
6813  102b               L441:
6815  102b ac361436      	jpf	L7153
6816  102f               L1253:
6817                     ; 1025 		if(b_Rx2_Msg_TimeOut_Flag){
6819  102f c6000c        	ld	a,_uc_Rx_TimeOut_Reg
6820  1032 a502          	bcp	a,#2
6821  1034 2710          	jreq	L1653
6822                     ; 1026 			Set_LCD_Address(LCD_Line[0]);	
6824  1036 c60000        	ld	a,_LCD_Line
6825  1039 cd0000        	call	_Set_LCD_Address
6827                     ; 1027 			Display_LCD_String("NC");
6829  103c ae025d        	ldw	x,#L7023
6830  103f cd0000        	call	_Display_LCD_String
6833  1042 ac361436      	jpf	L7153
6834  1046               L1653:
6835                     ; 1030 			uc_fault_cnt = (U8)(0);
6837  1046 0f16          	clr	(OFST+0,sp)
6839                     ; 1032 			if(can_diag[1] & (U8)(0x01)){
6841  1048 7b04          	ld	a,(OFST-18,sp)
6842  104a a501          	bcp	a,#1
6843  104c 273c          	jreq	L5653
6844                     ; 1033 				uc_fault_cnt++;
6846  104e 0c16          	inc	(OFST+0,sp)
6848                     ; 1034 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6848                     ; 1035 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6848                     ; 1036 				){
6850  1050 0d16          	tnz	(OFST+0,sp)
6851  1052 270d          	jreq	L3753
6853  1054 7b16          	ld	a,(OFST+0,sp)
6854  1056 a105          	cp	a,#5
6855  1058 2407          	jruge	L3753
6857  105a c60004        	ld	a,_uc_Test_Page_Now
6858  105d a102          	cp	a,#2
6859  105f 2713          	jreq	L1753
6860  1061               L3753:
6862  1061 7b16          	ld	a,(OFST+0,sp)
6863  1063 a105          	cp	a,#5
6864  1065 2523          	jrult	L5653
6866  1067 7b16          	ld	a,(OFST+0,sp)
6867  1069 a109          	cp	a,#9
6868  106b 241d          	jruge	L5653
6870  106d c60004        	ld	a,_uc_Test_Page_Now
6871  1070 a103          	cp	a,#3
6872  1072 2616          	jrne	L5653
6873  1074               L1753:
6874                     ; 1037 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6876  1074 7b16          	ld	a,(OFST+0,sp)
6877  1076 5f            	clrw	x
6878  1077 97            	ld	xl,a
6879  1078 5a            	decw	x
6880  1079 a604          	ld	a,#4
6881  107b cd0000        	call	c_smodx
6883  107e d60000        	ld	a,(_LCD_Line,x)
6884  1081 cd0000        	call	_Set_LCD_Address
6886                     ; 1038 					Display_LCD_String("Flt_LVLow");
6888  1084 ae0236        	ldw	x,#L7753
6889  1087 cd0000        	call	_Display_LCD_String
6891  108a               L5653:
6892                     ; 1042 			if(can_diag[1] & (U8)(0x02)){
6894  108a 7b04          	ld	a,(OFST-18,sp)
6895  108c a502          	bcp	a,#2
6896  108e 273c          	jreq	L1063
6897                     ; 1043 				uc_fault_cnt++;
6899  1090 0c16          	inc	(OFST+0,sp)
6901                     ; 1044 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6901                     ; 1045 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6901                     ; 1046 				){
6903  1092 0d16          	tnz	(OFST+0,sp)
6904  1094 270d          	jreq	L7063
6906  1096 7b16          	ld	a,(OFST+0,sp)
6907  1098 a105          	cp	a,#5
6908  109a 2407          	jruge	L7063
6910  109c c60004        	ld	a,_uc_Test_Page_Now
6911  109f a102          	cp	a,#2
6912  10a1 2713          	jreq	L5063
6913  10a3               L7063:
6915  10a3 7b16          	ld	a,(OFST+0,sp)
6916  10a5 a105          	cp	a,#5
6917  10a7 2523          	jrult	L1063
6919  10a9 7b16          	ld	a,(OFST+0,sp)
6920  10ab a109          	cp	a,#9
6921  10ad 241d          	jruge	L1063
6923  10af c60004        	ld	a,_uc_Test_Page_Now
6924  10b2 a103          	cp	a,#3
6925  10b4 2616          	jrne	L1063
6926  10b6               L5063:
6927                     ; 1047 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6929  10b6 7b16          	ld	a,(OFST+0,sp)
6930  10b8 5f            	clrw	x
6931  10b9 97            	ld	xl,a
6932  10ba 5a            	decw	x
6933  10bb a604          	ld	a,#4
6934  10bd cd0000        	call	c_smodx
6936  10c0 d60000        	ld	a,(_LCD_Line,x)
6937  10c3 cd0000        	call	_Set_LCD_Address
6939                     ; 1048 					Display_LCD_String("Flt_LVHigh");
6941  10c6 ae022b        	ldw	x,#L3163
6942  10c9 cd0000        	call	_Display_LCD_String
6944  10cc               L1063:
6945                     ; 1052 			if(can_diag[1] & (U8)(0x04)){
6947  10cc 7b04          	ld	a,(OFST-18,sp)
6948  10ce a504          	bcp	a,#4
6949  10d0 273c          	jreq	L5163
6950                     ; 1053 				uc_fault_cnt++;
6952  10d2 0c16          	inc	(OFST+0,sp)
6954                     ; 1054 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6954                     ; 1055 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6954                     ; 1056 				){
6956  10d4 0d16          	tnz	(OFST+0,sp)
6957  10d6 270d          	jreq	L3263
6959  10d8 7b16          	ld	a,(OFST+0,sp)
6960  10da a105          	cp	a,#5
6961  10dc 2407          	jruge	L3263
6963  10de c60004        	ld	a,_uc_Test_Page_Now
6964  10e1 a102          	cp	a,#2
6965  10e3 2713          	jreq	L1263
6966  10e5               L3263:
6968  10e5 7b16          	ld	a,(OFST+0,sp)
6969  10e7 a105          	cp	a,#5
6970  10e9 2523          	jrult	L5163
6972  10eb 7b16          	ld	a,(OFST+0,sp)
6973  10ed a109          	cp	a,#9
6974  10ef 241d          	jruge	L5163
6976  10f1 c60004        	ld	a,_uc_Test_Page_Now
6977  10f4 a103          	cp	a,#3
6978  10f6 2616          	jrne	L5163
6979  10f8               L1263:
6980                     ; 1057 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6982  10f8 7b16          	ld	a,(OFST+0,sp)
6983  10fa 5f            	clrw	x
6984  10fb 97            	ld	xl,a
6985  10fc 5a            	decw	x
6986  10fd a604          	ld	a,#4
6987  10ff cd0000        	call	c_smodx
6989  1102 d60000        	ld	a,(_LCD_Line,x)
6990  1105 cd0000        	call	_Set_LCD_Address
6992                     ; 1058 					Display_LCD_String("Flt_HVLow");
6994  1108 ae0221        	ldw	x,#L7263
6995  110b cd0000        	call	_Display_LCD_String
6997  110e               L5163:
6998                     ; 1062 			if(can_diag[1] & (U8)(0x08)){
7000  110e 7b04          	ld	a,(OFST-18,sp)
7001  1110 a508          	bcp	a,#8
7002  1112 273c          	jreq	L1363
7003                     ; 1063 				uc_fault_cnt++;
7005  1114 0c16          	inc	(OFST+0,sp)
7007                     ; 1064 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7007                     ; 1065 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7007                     ; 1066 				){
7009  1116 0d16          	tnz	(OFST+0,sp)
7010  1118 270d          	jreq	L7363
7012  111a 7b16          	ld	a,(OFST+0,sp)
7013  111c a105          	cp	a,#5
7014  111e 2407          	jruge	L7363
7016  1120 c60004        	ld	a,_uc_Test_Page_Now
7017  1123 a102          	cp	a,#2
7018  1125 2713          	jreq	L5363
7019  1127               L7363:
7021  1127 7b16          	ld	a,(OFST+0,sp)
7022  1129 a105          	cp	a,#5
7023  112b 2523          	jrult	L1363
7025  112d 7b16          	ld	a,(OFST+0,sp)
7026  112f a109          	cp	a,#9
7027  1131 241d          	jruge	L1363
7029  1133 c60004        	ld	a,_uc_Test_Page_Now
7030  1136 a103          	cp	a,#3
7031  1138 2616          	jrne	L1363
7032  113a               L5363:
7033                     ; 1067 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
7035  113a 7b16          	ld	a,(OFST+0,sp)
7036  113c 5f            	clrw	x
7037  113d 97            	ld	xl,a
7038  113e 5a            	decw	x
7039  113f a604          	ld	a,#4
7040  1141 cd0000        	call	c_smodx
7042  1144 d60000        	ld	a,(_LCD_Line,x)
7043  1147 cd0000        	call	_Set_LCD_Address
7045                     ; 1068 					Display_LCD_String("Flt_HVHigh");
7047  114a ae0216        	ldw	x,#L3463
7048  114d cd0000        	call	_Display_LCD_String
7050  1150               L1363:
7051                     ; 1072 			if(can_diag[1] & (U8)(0x10)){
7053  1150 7b04          	ld	a,(OFST-18,sp)
7054  1152 a510          	bcp	a,#16
7055  1154 273c          	jreq	L5463
7056                     ; 1073 				uc_fault_cnt++;
7058  1156 0c16          	inc	(OFST+0,sp)
7060                     ; 1074 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7060                     ; 1075 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7060                     ; 1076 				){
7062  1158 0d16          	tnz	(OFST+0,sp)
7063  115a 270d          	jreq	L3563
7065  115c 7b16          	ld	a,(OFST+0,sp)
7066  115e a105          	cp	a,#5
7067  1160 2407          	jruge	L3563
7069  1162 c60004        	ld	a,_uc_Test_Page_Now
7070  1165 a102          	cp	a,#2
7071  1167 2713          	jreq	L1563
7072  1169               L3563:
7074  1169 7b16          	ld	a,(OFST+0,sp)
7075  116b a105          	cp	a,#5
7076  116d 2523          	jrult	L5463
7078  116f 7b16          	ld	a,(OFST+0,sp)
7079  1171 a109          	cp	a,#9
7080  1173 241d          	jruge	L5463
7082  1175 c60004        	ld	a,_uc_Test_Page_Now
7083  1178 a103          	cp	a,#3
7084  117a 2616          	jrne	L5463
7085  117c               L1563:
7086                     ; 1077 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7088  117c 7b16          	ld	a,(OFST+0,sp)
7089  117e 5f            	clrw	x
7090  117f 97            	ld	xl,a
7091  1180 5a            	decw	x
7092  1181 a604          	ld	a,#4
7093  1183 cd0000        	call	c_smodx
7095  1186 d60000        	ld	a,(_LCD_Line,x)
7096  1189 cd0000        	call	_Set_LCD_Address
7098                     ; 1078 					Display_LCD_String("Flt_OverCur");
7100  118c ae020a        	ldw	x,#L7563
7101  118f cd0000        	call	_Display_LCD_String
7103  1192               L5463:
7104                     ; 1084 			if(can_diag[1] & (U8)(0x20)){
7106  1192 7b04          	ld	a,(OFST-18,sp)
7107  1194 a520          	bcp	a,#32
7108  1196 273c          	jreq	L1663
7109                     ; 1086 				uc_fault_cnt++;
7111  1198 0c16          	inc	(OFST+0,sp)
7113                     ; 1087 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7113                     ; 1088 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7113                     ; 1089 				){
7115  119a 0d16          	tnz	(OFST+0,sp)
7116  119c 270d          	jreq	L7663
7118  119e 7b16          	ld	a,(OFST+0,sp)
7119  11a0 a105          	cp	a,#5
7120  11a2 2407          	jruge	L7663
7122  11a4 c60004        	ld	a,_uc_Test_Page_Now
7123  11a7 a102          	cp	a,#2
7124  11a9 2713          	jreq	L5663
7125  11ab               L7663:
7127  11ab 7b16          	ld	a,(OFST+0,sp)
7128  11ad a105          	cp	a,#5
7129  11af 2523          	jrult	L1663
7131  11b1 7b16          	ld	a,(OFST+0,sp)
7132  11b3 a109          	cp	a,#9
7133  11b5 241d          	jruge	L1663
7135  11b7 c60004        	ld	a,_uc_Test_Page_Now
7136  11ba a103          	cp	a,#3
7137  11bc 2616          	jrne	L1663
7138  11be               L5663:
7139                     ; 1090 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7141  11be 7b16          	ld	a,(OFST+0,sp)
7142  11c0 5f            	clrw	x
7143  11c1 97            	ld	xl,a
7144  11c2 5a            	decw	x
7145  11c3 a604          	ld	a,#4
7146  11c5 cd0000        	call	c_smodx
7148  11c8 d60000        	ld	a,(_LCD_Line,x)
7149  11cb cd0000        	call	_Set_LCD_Address
7151                     ; 1091 					Display_LCD_String("Flt_ThmShut");
7153  11ce ae01fe        	ldw	x,#L3763
7154  11d1 cd0000        	call	_Display_LCD_String
7156  11d4               L1663:
7157                     ; 1097 			if(can_diag[1] & (U8)(0x40)){
7159  11d4 7b04          	ld	a,(OFST-18,sp)
7160  11d6 a540          	bcp	a,#64
7161  11d8 273c          	jreq	L5763
7162                     ; 1099 				uc_fault_cnt++;
7164  11da 0c16          	inc	(OFST+0,sp)
7166                     ; 1100 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7166                     ; 1101 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7166                     ; 1102 				){
7168  11dc 0d16          	tnz	(OFST+0,sp)
7169  11de 270d          	jreq	L3073
7171  11e0 7b16          	ld	a,(OFST+0,sp)
7172  11e2 a105          	cp	a,#5
7173  11e4 2407          	jruge	L3073
7175  11e6 c60004        	ld	a,_uc_Test_Page_Now
7176  11e9 a102          	cp	a,#2
7177  11eb 2713          	jreq	L1073
7178  11ed               L3073:
7180  11ed 7b16          	ld	a,(OFST+0,sp)
7181  11ef a105          	cp	a,#5
7182  11f1 2523          	jrult	L5763
7184  11f3 7b16          	ld	a,(OFST+0,sp)
7185  11f5 a109          	cp	a,#9
7186  11f7 241d          	jruge	L5763
7188  11f9 c60004        	ld	a,_uc_Test_Page_Now
7189  11fc a103          	cp	a,#3
7190  11fe 2616          	jrne	L5763
7191  1200               L1073:
7192                     ; 1103 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
7194  1200 7b16          	ld	a,(OFST+0,sp)
7195  1202 5f            	clrw	x
7196  1203 97            	ld	xl,a
7197  1204 5a            	decw	x
7198  1205 a604          	ld	a,#4
7199  1207 cd0000        	call	c_smodx
7201  120a d60000        	ld	a,(_LCD_Line,x)
7202  120d cd0000        	call	_Set_LCD_Address
7204                     ; 1104 					Display_LCD_String("Flt_PCBThmShut");
7206  1210 ae01ef        	ldw	x,#L7073
7207  1213 cd0000        	call	_Display_LCD_String
7209  1216               L5763:
7210                     ; 1108 			if(can_diag[3] & (U8)(0x01)){
7212  1216 7b06          	ld	a,(OFST-16,sp)
7213  1218 a501          	bcp	a,#1
7214  121a 273c          	jreq	L1173
7215                     ; 1109 				uc_fault_cnt++;
7217  121c 0c16          	inc	(OFST+0,sp)
7219                     ; 1110 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7219                     ; 1111 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7219                     ; 1112 				){
7221  121e 0d16          	tnz	(OFST+0,sp)
7222  1220 270d          	jreq	L7173
7224  1222 7b16          	ld	a,(OFST+0,sp)
7225  1224 a105          	cp	a,#5
7226  1226 2407          	jruge	L7173
7228  1228 c60004        	ld	a,_uc_Test_Page_Now
7229  122b a102          	cp	a,#2
7230  122d 2713          	jreq	L5173
7231  122f               L7173:
7233  122f 7b16          	ld	a,(OFST+0,sp)
7234  1231 a105          	cp	a,#5
7235  1233 2523          	jrult	L1173
7237  1235 7b16          	ld	a,(OFST+0,sp)
7238  1237 a109          	cp	a,#9
7239  1239 241d          	jruge	L1173
7241  123b c60004        	ld	a,_uc_Test_Page_Now
7242  123e a103          	cp	a,#3
7243  1240 2616          	jrne	L1173
7244  1242               L5173:
7245                     ; 1113 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7247  1242 7b16          	ld	a,(OFST+0,sp)
7248  1244 5f            	clrw	x
7249  1245 97            	ld	xl,a
7250  1246 5a            	decw	x
7251  1247 a604          	ld	a,#4
7252  1249 cd0000        	call	c_smodx
7254  124c d60000        	ld	a,(_LCD_Line,x)
7255  124f cd0000        	call	_Set_LCD_Address
7257                     ; 1114 					Display_LCD_String("Flt_MsgTimeOut");
7259  1252 ae01e0        	ldw	x,#L3273
7260  1255 cd0000        	call	_Display_LCD_String
7262  1258               L1173:
7263                     ; 1118 			if(can_diag[4] & (U8)(0x01)){
7265  1258 7b07          	ld	a,(OFST-15,sp)
7266  125a a501          	bcp	a,#1
7267  125c 273c          	jreq	L5273
7268                     ; 1119 				uc_fault_cnt++;
7270  125e 0c16          	inc	(OFST+0,sp)
7272                     ; 1120 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7272                     ; 1121 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7272                     ; 1122 				){
7274  1260 0d16          	tnz	(OFST+0,sp)
7275  1262 270d          	jreq	L3373
7277  1264 7b16          	ld	a,(OFST+0,sp)
7278  1266 a105          	cp	a,#5
7279  1268 2407          	jruge	L3373
7281  126a c60004        	ld	a,_uc_Test_Page_Now
7282  126d a102          	cp	a,#2
7283  126f 2713          	jreq	L1373
7284  1271               L3373:
7286  1271 7b16          	ld	a,(OFST+0,sp)
7287  1273 a105          	cp	a,#5
7288  1275 2523          	jrult	L5273
7290  1277 7b16          	ld	a,(OFST+0,sp)
7291  1279 a109          	cp	a,#9
7292  127b 241d          	jruge	L5273
7294  127d c60004        	ld	a,_uc_Test_Page_Now
7295  1280 a103          	cp	a,#3
7296  1282 2616          	jrne	L5273
7297  1284               L1373:
7298                     ; 1123 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7300  1284 7b16          	ld	a,(OFST+0,sp)
7301  1286 5f            	clrw	x
7302  1287 97            	ld	xl,a
7303  1288 5a            	decw	x
7304  1289 a604          	ld	a,#4
7305  128b cd0000        	call	c_smodx
7307  128e d60000        	ld	a,(_LCD_Line,x)
7308  1291 cd0000        	call	_Set_LCD_Address
7310                     ; 1124 					Display_LCD_String("Fail_HVSen");
7312  1294 ae01d5        	ldw	x,#L7373
7313  1297 cd0000        	call	_Display_LCD_String
7315  129a               L5273:
7316                     ; 1128 			if(can_diag[4] & (U8)(0x02)){
7318  129a 7b07          	ld	a,(OFST-15,sp)
7319  129c a502          	bcp	a,#2
7320  129e 273c          	jreq	L1473
7321                     ; 1129 				uc_fault_cnt++;
7323  12a0 0c16          	inc	(OFST+0,sp)
7325                     ; 1130 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7325                     ; 1131 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7325                     ; 1132 				){
7327  12a2 0d16          	tnz	(OFST+0,sp)
7328  12a4 270d          	jreq	L7473
7330  12a6 7b16          	ld	a,(OFST+0,sp)
7331  12a8 a105          	cp	a,#5
7332  12aa 2407          	jruge	L7473
7334  12ac c60004        	ld	a,_uc_Test_Page_Now
7335  12af a102          	cp	a,#2
7336  12b1 2713          	jreq	L5473
7337  12b3               L7473:
7339  12b3 7b16          	ld	a,(OFST+0,sp)
7340  12b5 a105          	cp	a,#5
7341  12b7 2523          	jrult	L1473
7343  12b9 7b16          	ld	a,(OFST+0,sp)
7344  12bb a109          	cp	a,#9
7345  12bd 241d          	jruge	L1473
7347  12bf c60004        	ld	a,_uc_Test_Page_Now
7348  12c2 a103          	cp	a,#3
7349  12c4 2616          	jrne	L1473
7350  12c6               L5473:
7351                     ; 1133 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7353  12c6 7b16          	ld	a,(OFST+0,sp)
7354  12c8 5f            	clrw	x
7355  12c9 97            	ld	xl,a
7356  12ca 5a            	decw	x
7357  12cb a604          	ld	a,#4
7358  12cd cd0000        	call	c_smodx
7360  12d0 d60000        	ld	a,(_LCD_Line,x)
7361  12d3 cd0000        	call	_Set_LCD_Address
7363                     ; 1134 					Display_LCD_String("Fail_LVSen");
7365  12d6 ae01ca        	ldw	x,#L3573
7366  12d9 cd0000        	call	_Display_LCD_String
7368  12dc               L1473:
7369                     ; 1138 			if(can_diag[4] & (U8)(0x04)){
7371  12dc 7b07          	ld	a,(OFST-15,sp)
7372  12de a504          	bcp	a,#4
7373  12e0 273c          	jreq	L5573
7374                     ; 1139 				uc_fault_cnt++;
7376  12e2 0c16          	inc	(OFST+0,sp)
7378                     ; 1140 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7378                     ; 1141 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7378                     ; 1142 				){
7380  12e4 0d16          	tnz	(OFST+0,sp)
7381  12e6 270d          	jreq	L3673
7383  12e8 7b16          	ld	a,(OFST+0,sp)
7384  12ea a105          	cp	a,#5
7385  12ec 2407          	jruge	L3673
7387  12ee c60004        	ld	a,_uc_Test_Page_Now
7388  12f1 a102          	cp	a,#2
7389  12f3 2713          	jreq	L1673
7390  12f5               L3673:
7392  12f5 7b16          	ld	a,(OFST+0,sp)
7393  12f7 a105          	cp	a,#5
7394  12f9 2523          	jrult	L5573
7396  12fb 7b16          	ld	a,(OFST+0,sp)
7397  12fd a109          	cp	a,#9
7398  12ff 241d          	jruge	L5573
7400  1301 c60004        	ld	a,_uc_Test_Page_Now
7401  1304 a103          	cp	a,#3
7402  1306 2616          	jrne	L5573
7403  1308               L1673:
7404                     ; 1143 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7406  1308 7b16          	ld	a,(OFST+0,sp)
7407  130a 5f            	clrw	x
7408  130b 97            	ld	xl,a
7409  130c 5a            	decw	x
7410  130d a604          	ld	a,#4
7411  130f cd0000        	call	c_smodx
7413  1312 d60000        	ld	a,(_LCD_Line,x)
7414  1315 cd0000        	call	_Set_LCD_Address
7416                     ; 1144 					Display_LCD_String("Fail_CurSen");
7418  1318 ae01be        	ldw	x,#L7673
7419  131b cd0000        	call	_Display_LCD_String
7421  131e               L5573:
7422                     ; 1150 			if(can_diag[4] & (U8)(0x08)){
7424  131e 7b07          	ld	a,(OFST-15,sp)
7425  1320 a508          	bcp	a,#8
7426  1322 273c          	jreq	L1773
7427                     ; 1152 				uc_fault_cnt++;
7429  1324 0c16          	inc	(OFST+0,sp)
7431                     ; 1153 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7431                     ; 1154 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7431                     ; 1155 				){
7433  1326 0d16          	tnz	(OFST+0,sp)
7434  1328 270d          	jreq	L7773
7436  132a 7b16          	ld	a,(OFST+0,sp)
7437  132c a105          	cp	a,#5
7438  132e 2407          	jruge	L7773
7440  1330 c60004        	ld	a,_uc_Test_Page_Now
7441  1333 a102          	cp	a,#2
7442  1335 2713          	jreq	L5773
7443  1337               L7773:
7445  1337 7b16          	ld	a,(OFST+0,sp)
7446  1339 a105          	cp	a,#5
7447  133b 2523          	jrult	L1773
7449  133d 7b16          	ld	a,(OFST+0,sp)
7450  133f a109          	cp	a,#9
7451  1341 241d          	jruge	L1773
7453  1343 c60004        	ld	a,_uc_Test_Page_Now
7454  1346 a103          	cp	a,#3
7455  1348 2616          	jrne	L1773
7456  134a               L5773:
7457                     ; 1156 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
7459  134a 7b16          	ld	a,(OFST+0,sp)
7460  134c 5f            	clrw	x
7461  134d 97            	ld	xl,a
7462  134e 5a            	decw	x
7463  134f a604          	ld	a,#4
7464  1351 cd0000        	call	c_smodx
7466  1354 d60000        	ld	a,(_LCD_Line,x)
7467  1357 cd0000        	call	_Set_LCD_Address
7469                     ; 1157 					Display_LCD_String("Fail_CoreTemp");
7471  135a ae01b0        	ldw	x,#L3004
7472  135d cd0000        	call	_Display_LCD_String
7474  1360               L1773:
7475                     ; 1163 			if(can_diag[4] & (U8)(0x10)){
7477  1360 7b07          	ld	a,(OFST-15,sp)
7478  1362 a510          	bcp	a,#16
7479  1364 273c          	jreq	L5004
7480                     ; 1165 				uc_fault_cnt++;
7482  1366 0c16          	inc	(OFST+0,sp)
7484                     ; 1166 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7484                     ; 1167 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7484                     ; 1168 				){
7486  1368 0d16          	tnz	(OFST+0,sp)
7487  136a 270d          	jreq	L3104
7489  136c 7b16          	ld	a,(OFST+0,sp)
7490  136e a105          	cp	a,#5
7491  1370 2407          	jruge	L3104
7493  1372 c60004        	ld	a,_uc_Test_Page_Now
7494  1375 a102          	cp	a,#2
7495  1377 2713          	jreq	L1104
7496  1379               L3104:
7498  1379 7b16          	ld	a,(OFST+0,sp)
7499  137b a105          	cp	a,#5
7500  137d 2523          	jrult	L5004
7502  137f 7b16          	ld	a,(OFST+0,sp)
7503  1381 a109          	cp	a,#9
7504  1383 241d          	jruge	L5004
7506  1385 c60004        	ld	a,_uc_Test_Page_Now
7507  1388 a103          	cp	a,#3
7508  138a 2616          	jrne	L5004
7509  138c               L1104:
7510                     ; 1169 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7512  138c 7b16          	ld	a,(OFST+0,sp)
7513  138e 5f            	clrw	x
7514  138f 97            	ld	xl,a
7515  1390 5a            	decw	x
7516  1391 a604          	ld	a,#4
7517  1393 cd0000        	call	c_smodx
7519  1396 d60000        	ld	a,(_LCD_Line,x)
7520  1399 cd0000        	call	_Set_LCD_Address
7522                     ; 1170 					Display_LCD_String("Fail_PCB1Temp");
7524  139c ae01a2        	ldw	x,#L7104
7525  139f cd0000        	call	_Display_LCD_String
7527  13a2               L5004:
7528                     ; 1176 			if(can_diag[4] & (U8)(0x20)){
7530  13a2 7b07          	ld	a,(OFST-15,sp)
7531  13a4 a520          	bcp	a,#32
7532  13a6 273c          	jreq	L1204
7533                     ; 1178 				uc_fault_cnt++;
7535  13a8 0c16          	inc	(OFST+0,sp)
7537                     ; 1179 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7537                     ; 1180 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7537                     ; 1181 				){
7539  13aa 0d16          	tnz	(OFST+0,sp)
7540  13ac 270d          	jreq	L7204
7542  13ae 7b16          	ld	a,(OFST+0,sp)
7543  13b0 a105          	cp	a,#5
7544  13b2 2407          	jruge	L7204
7546  13b4 c60004        	ld	a,_uc_Test_Page_Now
7547  13b7 a102          	cp	a,#2
7548  13b9 2713          	jreq	L5204
7549  13bb               L7204:
7551  13bb 7b16          	ld	a,(OFST+0,sp)
7552  13bd a105          	cp	a,#5
7553  13bf 2523          	jrult	L1204
7555  13c1 7b16          	ld	a,(OFST+0,sp)
7556  13c3 a109          	cp	a,#9
7557  13c5 241d          	jruge	L1204
7559  13c7 c60004        	ld	a,_uc_Test_Page_Now
7560  13ca a103          	cp	a,#3
7561  13cc 2616          	jrne	L1204
7562  13ce               L5204:
7563                     ; 1182 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7565  13ce 7b16          	ld	a,(OFST+0,sp)
7566  13d0 5f            	clrw	x
7567  13d1 97            	ld	xl,a
7568  13d2 5a            	decw	x
7569  13d3 a604          	ld	a,#4
7570  13d5 cd0000        	call	c_smodx
7572  13d8 d60000        	ld	a,(_LCD_Line,x)
7573  13db cd0000        	call	_Set_LCD_Address
7575                     ; 1183 					Display_LCD_String("Fail_IGBT");
7577  13de ae0198        	ldw	x,#L3304
7578  13e1 cd0000        	call	_Display_LCD_String
7580  13e4               L1204:
7581                     ; 1187 			if(can_diag[4] & (U8)(0x40)){
7583  13e4 7b07          	ld	a,(OFST-15,sp)
7584  13e6 a540          	bcp	a,#64
7585  13e8 273c          	jreq	L5304
7586                     ; 1188 				uc_fault_cnt++;
7588  13ea 0c16          	inc	(OFST+0,sp)
7590                     ; 1189 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
7590                     ; 1190 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
7590                     ; 1191 				){
7592  13ec 0d16          	tnz	(OFST+0,sp)
7593  13ee 270d          	jreq	L3404
7595  13f0 7b16          	ld	a,(OFST+0,sp)
7596  13f2 a105          	cp	a,#5
7597  13f4 2407          	jruge	L3404
7599  13f6 c60004        	ld	a,_uc_Test_Page_Now
7600  13f9 a102          	cp	a,#2
7601  13fb 2713          	jreq	L1404
7602  13fd               L3404:
7604  13fd 7b16          	ld	a,(OFST+0,sp)
7605  13ff a105          	cp	a,#5
7606  1401 2523          	jrult	L5304
7608  1403 7b16          	ld	a,(OFST+0,sp)
7609  1405 a109          	cp	a,#9
7610  1407 241d          	jruge	L5304
7612  1409 c60004        	ld	a,_uc_Test_Page_Now
7613  140c a103          	cp	a,#3
7614  140e 2616          	jrne	L5304
7615  1410               L1404:
7616                     ; 1192 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
7618  1410 7b16          	ld	a,(OFST+0,sp)
7619  1412 5f            	clrw	x
7620  1413 97            	ld	xl,a
7621  1414 5a            	decw	x
7622  1415 a604          	ld	a,#4
7623  1417 cd0000        	call	c_smodx
7625  141a d60000        	ld	a,(_LCD_Line,x)
7626  141d cd0000        	call	_Set_LCD_Address
7628                     ; 1193 					Display_LCD_String("Fail_openLoad");
7630  1420 ae018a        	ldw	x,#L7404
7631  1423 cd0000        	call	_Display_LCD_String
7633  1426               L5304:
7634                     ; 1197 			if(!uc_fault_cnt){
7636  1426 0d16          	tnz	(OFST+0,sp)
7637  1428 260c          	jrne	L7153
7638                     ; 1198 				Set_LCD_Address(LCD_Line[0]);
7640  142a c60000        	ld	a,_LCD_Line
7641  142d cd0000        	call	_Set_LCD_Address
7643                     ; 1199 				Display_LCD_String("Normal");
7645  1430 ae0183        	ldw	x,#L3504
7646  1433 cd0000        	call	_Display_LCD_String
7648  1436               L7153:
7649                     ; 1204 	if((b_Com_On_flag == ON)){
7651  1436 c6000d        	ld	a,_uc_Test_Ctrl_Reg
7652  1439 a508          	bcp	a,#8
7653  143b 270d          	jreq	L5504
7654                     ; 1205 		Set_LCD_Address((unsigned char)(0x00+15));
7656  143d a60f          	ld	a,#15
7657  143f cd0000        	call	_Set_LCD_Address
7659                     ; 1208 		Display_LCD_String("Y");	// YJS 20230314
7661  1442 ae0181        	ldw	x,#L7504
7662  1445 cd0000        	call	_Display_LCD_String
7665  1448 200b          	jra	L1604
7666  144a               L5504:
7667                     ; 1210 		Set_LCD_Address((unsigned char)(0x00+15));
7669  144a a60f          	ld	a,#15
7670  144c cd0000        	call	_Set_LCD_Address
7672                     ; 1211 		Display_LCD_String("N");
7674  144f ae0244        	ldw	x,#L5543
7675  1452 cd0000        	call	_Display_LCD_String
7677  1455               L1604:
7678                     ; 1214 	return;
7679  1455               L401:
7682  1455 5b16          	addw	sp,#22
7683  1457 81            	ret
7775                     ; 1217 static void SU2I_Ctrl_LCD_Display_Control(void)
7775                     ; 1218 {
7776                     	switch	.text
7777  1458               L3604_SU2I_Ctrl_LCD_Display_Control:
7779  1458 5216          	subw	sp,#22
7780       00000016      OFST:	set	22
7783                     ; 1225 	if (HEATER_zone_status==HTR_ZONE_1)
7785  145a 725d0000      	tnz	_HEATER_zone_status
7786  145e 263a          	jrne	L7114
7787                     ; 1227 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
7789  1460 0f16          	clr	(OFST+0,sp)
7791  1462               L1214:
7792                     ; 1229 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
7794  1462 96            	ldw	x,sp
7795  1463 1c000d        	addw	x,#OFST-9
7796  1466 9f            	ld	a,xl
7797  1467 5e            	swapw	x
7798  1468 1b16          	add	a,(OFST+0,sp)
7799  146a 2401          	jrnc	L051
7800  146c 5c            	incw	x
7801  146d               L051:
7802  146d 02            	rlwa	x,a
7803  146e 7b16          	ld	a,(OFST+0,sp)
7804  1470 905f          	clrw	y
7805  1472 9097          	ld	yl,a
7806  1474 90d60008      	ld	a,(_uc_Rx_Data+8,y)
7807  1478 f7            	ld	(x),a
7808                     ; 1230 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
7810  1479 96            	ldw	x,sp
7811  147a 1c0003        	addw	x,#OFST-19
7812  147d 9f            	ld	a,xl
7813  147e 5e            	swapw	x
7814  147f 1b16          	add	a,(OFST+0,sp)
7815  1481 2401          	jrnc	L251
7816  1483 5c            	incw	x
7817  1484               L251:
7818  1484 02            	rlwa	x,a
7819  1485 7b16          	ld	a,(OFST+0,sp)
7820  1487 905f          	clrw	y
7821  1489 9097          	ld	yl,a
7822  148b 90d60018      	ld	a,(_uc_Rx_Data+24,y)
7823  148f f7            	ld	(x),a
7824                     ; 1227 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
7826  1490 0c16          	inc	(OFST+0,sp)
7830  1492 7b16          	ld	a,(OFST+0,sp)
7831  1494 a108          	cp	a,#8
7832  1496 25ca          	jrult	L1214
7834  1498 2038          	jra	L7214
7835  149a               L7114:
7836                     ; 1235 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
7838  149a 0f16          	clr	(OFST+0,sp)
7840  149c               L1314:
7841                     ; 1237 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
7843  149c 96            	ldw	x,sp
7844  149d 1c000d        	addw	x,#OFST-9
7845  14a0 9f            	ld	a,xl
7846  14a1 5e            	swapw	x
7847  14a2 1b16          	add	a,(OFST+0,sp)
7848  14a4 2401          	jrnc	L451
7849  14a6 5c            	incw	x
7850  14a7               L451:
7851  14a7 02            	rlwa	x,a
7852  14a8 7b16          	ld	a,(OFST+0,sp)
7853  14aa 905f          	clrw	y
7854  14ac 9097          	ld	yl,a
7855  14ae 90d60010      	ld	a,(_uc_Rx_Data+16,y)
7856  14b2 f7            	ld	(x),a
7857                     ; 1238 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
7859  14b3 96            	ldw	x,sp
7860  14b4 1c0003        	addw	x,#OFST-19
7861  14b7 9f            	ld	a,xl
7862  14b8 5e            	swapw	x
7863  14b9 1b16          	add	a,(OFST+0,sp)
7864  14bb 2401          	jrnc	L651
7865  14bd 5c            	incw	x
7866  14be               L651:
7867  14be 02            	rlwa	x,a
7868  14bf 7b16          	ld	a,(OFST+0,sp)
7869  14c1 905f          	clrw	y
7870  14c3 9097          	ld	yl,a
7871  14c5 90d60018      	ld	a,(_uc_Rx_Data+24,y)
7872  14c9 f7            	ld	(x),a
7873                     ; 1235 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
7875  14ca 0c16          	inc	(OFST+0,sp)
7879  14cc 7b16          	ld	a,(OFST+0,sp)
7880  14ce a108          	cp	a,#8
7881  14d0 25ca          	jrult	L1314
7882  14d2               L7214:
7883                     ; 1241 	if(b_Test_Option_flag == ON){
7885  14d2 c6000d        	ld	a,_uc_Test_Ctrl_Reg
7886  14d5 a510          	bcp	a,#16
7887  14d7 2779          	jreq	L7314
7888                     ; 1242 		Set_LCD_Address(LCD_Line[0]);
7890  14d9 c60000        	ld	a,_LCD_Line
7891  14dc cd0000        	call	_Set_LCD_Address
7893                     ; 1243 		Display_LCD_String("*OPTION*");
7895  14df ae02aa        	ldw	x,#L7603
7896  14e2 cd0000        	call	_Display_LCD_String
7898                     ; 1245 		if(uc_Target_Display_Mode == (U8)(0)){
7900  14e5 725d0000      	tnz	_uc_Target_Display_Mode
7901  14e9 260e          	jrne	L1414
7902                     ; 1246 			Set_LCD_Address(LCD_Line[1]);
7904  14eb c60001        	ld	a,_LCD_Line+1
7905  14ee cd0000        	call	_Set_LCD_Address
7907                     ; 1247 			Display_LCD_String("*Target Perc");
7909  14f1 ae029d        	ldw	x,#L3703
7910  14f4 cd0000        	call	_Display_LCD_String
7913  14f7 200c          	jra	L3414
7914  14f9               L1414:
7915                     ; 1250 			Set_LCD_Address(LCD_Line[1]);
7917  14f9 c60001        	ld	a,_LCD_Line+1
7918  14fc cd0000        	call	_Set_LCD_Address
7920                     ; 1251 			Display_LCD_String("*Target Watt(OS)");
7922  14ff ae028c        	ldw	x,#L7703
7923  1502 cd0000        	call	_Display_LCD_String
7925  1505               L3414:
7926                     ; 1254 		Set_LCD_Address(LCD_Line[2]);
7928  1505 c60002        	ld	a,_LCD_Line+2
7929  1508 cd0000        	call	_Set_LCD_Address
7931                     ; 1255 		Display_LCD_String("D_Unit:");
7933  150b ae0284        	ldw	x,#L1013
7934  150e cd0000        	call	_Display_LCD_String
7936                     ; 1257 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
7938  1511 c60002        	ld	a,_LCD_Line+2
7939  1514 ab07          	add	a,#7
7940  1516 cd0000        	call	_Set_LCD_Address
7942                     ; 1258 		if(b_Blink_250_Flag){
7944  1519 c60000        	ld	a,_uc_LCD_Blink_Reg
7945  151c a502          	bcp	a,#2
7946  151e 272e          	jreq	L5414
7947                     ; 1259 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
7949  1520 c60001        	ld	a,_uc_Perc_Unit
7950  1523 5f            	clrw	x
7951  1524 97            	ld	xl,a
7952  1525 57            	sraw	x
7953  1526 cd0000        	call	_Num_Display_LCD
7955                     ; 1260 			Display_LCD_String(".");
7957  1529 ae0282        	ldw	x,#L5013
7958  152c cd0000        	call	_Display_LCD_String
7960                     ; 1261 			uc_buffer = uc_Perc_Unit %(U8)(2);
7962  152f c60001        	ld	a,_uc_Perc_Unit
7963  1532 a401          	and	a,#1
7964  1534 6b16          	ld	(OFST+0,sp),a
7966                     ; 1262 			if(uc_buffer){ Display_LCD_String("5"); }
7968  1536 0d16          	tnz	(OFST+0,sp)
7969  1538 2708          	jreq	L7414
7972  153a ae0280        	ldw	x,#L1113
7973  153d cd0000        	call	_Display_LCD_String
7976  1540 2006          	jra	L1514
7977  1542               L7414:
7978                     ; 1263 			else{ Display_LCD_String("0"); }
7980  1542 ae027e        	ldw	x,#L5113
7981  1545 cd0000        	call	_Display_LCD_String
7983  1548               L1514:
7984                     ; 1264 			Display_LCD_String("%");
7986  1548 ae027c        	ldw	x,#L7113
7987  154b cd0000        	call	_Display_LCD_String
7989  154e               L5414:
7990                     ; 1266 		return;
7992  154e ac741f74      	jpf	L261
7993  1552               L7314:
7994                     ; 1269 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
7996  1552 c60004        	ld	a,_uc_Test_Page_Now
7997  1555 c10003        	cp	a,_uc_Test_Page_Pre
7998  1558 270f          	jreq	L3514
7999                     ; 1270 		Test_Ctrl_Text_Display_Handling(); 
8001  155a cd07ec        	call	_Test_Ctrl_Text_Display_Handling
8003                     ; 1271 		b_Data_Select_flag = OFF;
8005  155d 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
8006                     ; 1272 		b_Data_Setting_flag = OFF;
8008  1561 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
8009                     ; 1273 		uc_Test_Data_Select_Num = (U8)(0);
8011  1565 725f0002      	clr	_uc_Test_Data_Select_Num
8012  1569               L3514:
8013                     ; 1275 	uc_Test_Page_Pre = uc_Test_Page_Now ;
8015  1569 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
8016                     ; 1278 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
8018  156e 725d0004      	tnz	_uc_Test_Page_Now
8019  1572 2703          	jreq	L461
8020  1574 cc1ae9        	jp	L5514
8021  1577               L461:
8022                     ; 1279 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
8024  1577 0f15          	clr	(OFST-1,sp)
8026  1579               L7514:
8027                     ; 1281 			Set_LCD_Address(LCD_Line[uc_line_index]);
8029  1579 7b15          	ld	a,(OFST-1,sp)
8030  157b 5f            	clrw	x
8031  157c 97            	ld	xl,a
8032  157d d60000        	ld	a,(_LCD_Line,x)
8033  1580 cd0000        	call	_Set_LCD_Address
8035                     ; 1283 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
8037  1583 c6000d        	ld	a,_uc_Test_Ctrl_Reg
8038  1586 a502          	bcp	a,#2
8039  1588 2763          	jreq	L5614
8041  158a c6000d        	ld	a,_uc_Test_Ctrl_Reg
8042  158d a504          	bcp	a,#4
8043  158f 265c          	jrne	L5614
8044                     ; 1284 				if(uc_line_index == uc_Test_Data_Select_Num){ 
8046  1591 7b15          	ld	a,(OFST-1,sp)
8047  1593 c10002        	cp	a,_uc_Test_Data_Select_Num
8048  1596 2647          	jrne	L7614
8049                     ; 1285 					if(uc_Test_Data_Select_Num == (U8)(0)){
8051  1598 725d0002      	tnz	_uc_Test_Data_Select_Num
8052  159c 261d          	jrne	L1714
8053                     ; 1286 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
8055  159e c60000        	ld	a,_uc_LCD_Blink_Reg
8056  15a1 a502          	bcp	a,#2
8057  15a3 270e          	jreq	L3714
8060  15a5 7b15          	ld	a,(OFST-1,sp)
8061  15a7 97            	ld	xl,a
8062  15a8 a610          	ld	a,#16
8063  15aa 42            	mul	x,a
8064  15ab 1c0000        	addw	x,#_LCD_Dis_Data
8065  15ae cd0000        	call	_Display_LCD_String
8068  15b1 2046          	jra	L1124
8069  15b3               L3714:
8070                     ; 1287 						else{ Display_LCD_String("        /"); }
8072  15b3 ae0272        	ldw	x,#L5413
8073  15b6 cd0000        	call	_Display_LCD_String
8075  15b9 203e          	jra	L1124
8076  15bb               L1714:
8077                     ; 1289 					else if(uc_Test_Data_Select_Num == (U8)(1)){
8079  15bb c60002        	ld	a,_uc_Test_Data_Select_Num
8080  15be a101          	cp	a,#1
8081  15c0 2637          	jrne	L1124
8082                     ; 1290 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
8084  15c2 c60000        	ld	a,_uc_LCD_Blink_Reg
8085  15c5 a502          	bcp	a,#2
8086  15c7 270e          	jreq	L3024
8089  15c9 7b15          	ld	a,(OFST-1,sp)
8090  15cb 97            	ld	xl,a
8091  15cc a610          	ld	a,#16
8092  15ce 42            	mul	x,a
8093  15cf 1c0000        	addw	x,#_LCD_Dis_Data
8094  15d2 cd0000        	call	_Display_LCD_String
8097  15d5 2022          	jra	L1124
8098  15d7               L3024:
8099                     ; 1291 						else{ Display_LCD_String("        Fd:"); }
8101  15d7 ae0266        	ldw	x,#L7513
8102  15da cd0000        	call	_Display_LCD_String
8104  15dd 201a          	jra	L1124
8105  15df               L7614:
8106                     ; 1294 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
8108  15df 7b15          	ld	a,(OFST-1,sp)
8109  15e1 97            	ld	xl,a
8110  15e2 a610          	ld	a,#16
8111  15e4 42            	mul	x,a
8112  15e5 1c0000        	addw	x,#_LCD_Dis_Data
8113  15e8 cd0000        	call	_Display_LCD_String
8115  15eb 200c          	jra	L1124
8116  15ed               L5614:
8117                     ; 1295 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
8119  15ed 7b15          	ld	a,(OFST-1,sp)
8120  15ef 97            	ld	xl,a
8121  15f0 a610          	ld	a,#16
8122  15f2 42            	mul	x,a
8123  15f3 1c0000        	addw	x,#_LCD_Dis_Data
8124  15f6 cd0000        	call	_Display_LCD_String
8126  15f9               L1124:
8127                     ; 1298 			if(uc_line_index == (U8)(0)){		// LINE 1
8129  15f9 0d15          	tnz	(OFST-1,sp)
8130  15fb 2703          	jreq	L661
8131  15fd cc16b9        	jp	L3124
8132  1600               L661:
8133                     ; 1301 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
8135  1600 7b15          	ld	a,(OFST-1,sp)
8136  1602 5f            	clrw	x
8137  1603 97            	ld	xl,a
8138  1604 d60000        	ld	a,(_LCD_Line,x)
8139  1607 ab03          	add	a,#3
8140  1609 cd0000        	call	_Set_LCD_Address
8142                     ; 1303 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
8144  160c c6000d        	ld	a,_uc_Test_Ctrl_Reg
8145  160f a504          	bcp	a,#4
8146  1611 2718          	jreq	L5124
8148  1613 7b15          	ld	a,(OFST-1,sp)
8149  1615 c10002        	cp	a,_uc_Test_Data_Select_Num
8150  1618 2611          	jrne	L5124
8151                     ; 1304 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
8153  161a c60000        	ld	a,_uc_LCD_Blink_Reg
8154  161d a502          	bcp	a,#2
8155  161f 2712          	jreq	L1224
8158  1621 c60009        	ld	a,_uc_Heater_Enable_Flag
8159  1624 5f            	clrw	x
8160  1625 97            	ld	xl,a
8161  1626 cd0000        	call	_Num_Display_LCD
8163  1629 2008          	jra	L1224
8164  162b               L5124:
8165                     ; 1305 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
8167  162b c60009        	ld	a,_uc_Heater_Enable_Flag
8168  162e 5f            	clrw	x
8169  162f 97            	ld	xl,a
8170  1630 cd0000        	call	_Num_Display_LCD
8172  1633               L1224:
8173                     ; 1309 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
8175  1633 7b15          	ld	a,(OFST-1,sp)
8176  1635 5f            	clrw	x
8177  1636 97            	ld	xl,a
8178  1637 d60000        	ld	a,(_LCD_Line,x)
8179  163a ab05          	add	a,#5
8180  163c cd0000        	call	_Set_LCD_Address
8182                     ; 1310 				if (HEATER_zone_status == HTR_ZONE_1)
8184  163f 725d0000      	tnz	_HEATER_zone_status
8185  1643 2608          	jrne	L3224
8186                     ; 1311 				Display_LCD_String("Z1");
8188  1645 ae0263        	ldw	x,#L7713
8189  1648 cd0000        	call	_Display_LCD_String
8192  164b 2006          	jra	L5224
8193  164d               L3224:
8194                     ; 1312 				else Display_LCD_String("Z2");
8196  164d ae0260        	ldw	x,#L3023
8197  1650 cd0000        	call	_Display_LCD_String
8199  1653               L5224:
8200                     ; 1314 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
8202  1653 7b15          	ld	a,(OFST-1,sp)
8203  1655 5f            	clrw	x
8204  1656 97            	ld	xl,a
8205  1657 d60000        	ld	a,(_LCD_Line,x)
8206  165a ab09          	add	a,#9
8207  165c cd0000        	call	_Set_LCD_Address
8209                     ; 1316 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
8211  165f c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8212  1662 a501          	bcp	a,#1
8213  1664 270a          	jreq	L7224
8216  1666 ae025d        	ldw	x,#L7023
8217  1669 cd0000        	call	_Display_LCD_String
8220  166c acda1ada      	jpf	L1524
8221  1670               L7224:
8222                     ; 1318 					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
8224  1670 7b0d          	ld	a,(OFST-9,sp)
8225  1672 44            	srl	a
8226  1673 44            	srl	a
8227  1674 a403          	and	a,#3
8228  1676 6b16          	ld	(OFST+0,sp),a
8230                     ; 1319 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
8232  1678 0d16          	tnz	(OFST+0,sp)
8233  167a 260a          	jrne	L3324
8236  167c ae0258        	ldw	x,#L5123
8237  167f cd0000        	call	_Display_LCD_String
8240  1682 acda1ada      	jpf	L1524
8241  1686               L3324:
8242                     ; 1320 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
8244  1686 7b16          	ld	a,(OFST+0,sp)
8245  1688 a101          	cp	a,#1
8246  168a 260a          	jrne	L7324
8249  168c ae0253        	ldw	x,#L3223
8250  168f cd0000        	call	_Display_LCD_String
8253  1692 acda1ada      	jpf	L1524
8254  1696               L7324:
8255                     ; 1321 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
8257  1696 7b16          	ld	a,(OFST+0,sp)
8258  1698 a102          	cp	a,#2
8259  169a 260a          	jrne	L3424
8262  169c ae024f        	ldw	x,#L1323
8263  169f cd0000        	call	_Display_LCD_String
8266  16a2 acda1ada      	jpf	L1524
8267  16a6               L3424:
8268                     ; 1322 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
8270  16a6 7b16          	ld	a,(OFST+0,sp)
8271  16a8 a103          	cp	a,#3
8272  16aa 2703          	jreq	L071
8273  16ac cc1ada        	jp	L1524
8274  16af               L071:
8277  16af ae024a        	ldw	x,#L7323
8278  16b2 cd0000        	call	_Display_LCD_String
8280  16b5 acda1ada      	jpf	L1524
8281  16b9               L3124:
8282                     ; 1328 			else if(uc_line_index == (U8)(1)){	// LINE 2
8284  16b9 7b15          	ld	a,(OFST-1,sp)
8285  16bb a101          	cp	a,#1
8286  16bd 2703          	jreq	L271
8287  16bf cc19ce        	jp	L3524
8288  16c2               L271:
8289                     ; 1331 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
8291  16c2 7b15          	ld	a,(OFST-1,sp)
8292  16c4 5f            	clrw	x
8293  16c5 97            	ld	xl,a
8294  16c6 d60000        	ld	a,(_LCD_Line,x)
8295  16c9 ab03          	add	a,#3
8296  16cb cd0000        	call	_Set_LCD_Address
8298                     ; 1332 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
8300  16ce c6000d        	ld	a,_uc_Test_Ctrl_Reg
8301  16d1 a504          	bcp	a,#4
8302  16d3 2603          	jrne	L471
8303  16d5 cc183c        	jp	L5524
8304  16d8               L471:
8306  16d8 7b15          	ld	a,(OFST-1,sp)
8307  16da c10002        	cp	a,_uc_Test_Data_Select_Num
8308  16dd 2703          	jreq	L671
8309  16df cc183c        	jp	L5524
8310  16e2               L671:
8311                     ; 1333 					if(b_Blink_250_Flag){
8313  16e2 c60000        	ld	a,_uc_LCD_Blink_Reg
8314  16e5 a502          	bcp	a,#2
8315  16e7 2603          	jrne	L002
8316  16e9 cc197c        	jp	L1534
8317  16ec               L002:
8318                     ; 1334 						if(!uc_Target_Display_Mode){	// Percentage_Display
8320  16ec 725d0000      	tnz	_uc_Target_Display_Mode
8321  16f0 2676          	jrne	L1624
8322                     ; 1335 if (HEATER_zone_status == HTR_ZONE_1)
8324  16f2 725d0000      	tnz	_HEATER_zone_status
8325  16f6 2638          	jrne	L3624
8326                     ; 1337 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
8328  16f8 c6000a        	ld	a,_uc_Target_Duty_Perc
8329  16fb 5f            	clrw	x
8330  16fc 97            	ld	xl,a
8331  16fd 57            	sraw	x
8332  16fe cd0000        	call	_Num_Display_LCD
8334                     ; 1338 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
8336  1701 c6000a        	ld	a,_uc_Target_Duty_Perc
8337  1704 a1c8          	cp	a,#200
8338  1706 2503          	jrult	L202
8339  1708 cc197c        	jp	L1534
8340  170b               L202:
8341                     ; 1339 								Display_LCD_String(".");
8343  170b ae0282        	ldw	x,#L5013
8344  170e cd0000        	call	_Display_LCD_String
8346                     ; 1340 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
8348  1711 c6000a        	ld	a,_uc_Target_Duty_Perc
8349  1714 a401          	and	a,#1
8350  1716 6b16          	ld	(OFST+0,sp),a
8352                     ; 1341 								if(uc_buffer){ Display_LCD_String("5"); }
8354  1718 0d16          	tnz	(OFST+0,sp)
8355  171a 270a          	jreq	L7624
8358  171c ae0280        	ldw	x,#L1113
8359  171f cd0000        	call	_Display_LCD_String
8362  1722 ac7c197c      	jpf	L1534
8363  1726               L7624:
8364                     ; 1342 								else{ Display_LCD_String("0"); }
8366  1726 ae027e        	ldw	x,#L5113
8367  1729 cd0000        	call	_Display_LCD_String
8369  172c ac7c197c      	jpf	L1534
8370  1730               L3624:
8371                     ; 1347 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
8373  1730 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8374  1733 5f            	clrw	x
8375  1734 97            	ld	xl,a
8376  1735 57            	sraw	x
8377  1736 cd0000        	call	_Num_Display_LCD
8379                     ; 1348 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
8381  1739 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8382  173c a1c8          	cp	a,#200
8383  173e 2503          	jrult	L402
8384  1740 cc197c        	jp	L1534
8385  1743               L402:
8386                     ; 1349 								Display_LCD_String(".");
8388  1743 ae0282        	ldw	x,#L5013
8389  1746 cd0000        	call	_Display_LCD_String
8391                     ; 1350 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
8393  1749 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8394  174c a401          	and	a,#1
8395  174e 6b16          	ld	(OFST+0,sp),a
8397                     ; 1351 								if(uc_buffer){ Display_LCD_String("5"); }
8399  1750 0d16          	tnz	(OFST+0,sp)
8400  1752 270a          	jreq	L7724
8403  1754 ae0280        	ldw	x,#L1113
8404  1757 cd0000        	call	_Display_LCD_String
8407  175a ac7c197c      	jpf	L1534
8408  175e               L7724:
8409                     ; 1352 								else{ Display_LCD_String("0"); }
8411  175e ae027e        	ldw	x,#L5113
8412  1761 cd0000        	call	_Display_LCD_String
8414  1764 ac7c197c      	jpf	L1534
8415  1768               L1624:
8416                     ; 1357 if (HEATER_zone_status == HTR_ZONE_1)
8418  1768 725d0000      	tnz	_HEATER_zone_status
8419  176c 2667          	jrne	L5034
8420                     ; 1359 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
8422  176e c6000a        	ld	a,_uc_Target_Duty_Perc
8423  1771 a114          	cp	a,#20
8424  1773 2408          	jruge	L7034
8427  1775 5f            	clrw	x
8428  1776 cd0000        	call	_Num_Display_LCD
8431  1779 ac7c197c      	jpf	L1534
8432  177d               L7034:
8433                     ; 1360 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
8435  177d c6000a        	ld	a,_uc_Target_Duty_Perc
8436  1780 a114          	cp	a,#20
8437  1782 260a          	jrne	L3134
8440  1784 ae0064        	ldw	x,#100
8441  1787 cd0000        	call	_Num_Display_LCD
8444  178a ac7c197c      	jpf	L1534
8445  178e               L3134:
8446                     ; 1361 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
8448  178e c6000a        	ld	a,_uc_Target_Duty_Perc
8449  1791 a1b4          	cp	a,#180
8450  1793 260a          	jrne	L7134
8453  1795 ae1838        	ldw	x,#6200
8454  1798 cd0000        	call	_Num_Display_LCD
8457  179b ac7c197c      	jpf	L1534
8458  179f               L7134:
8459                     ; 1362 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
8461  179f c6000a        	ld	a,_uc_Target_Duty_Perc
8462  17a2 a1be          	cp	a,#190
8463  17a4 260a          	jrne	L3234
8466  17a6 ae0246        	ldw	x,#L5133
8467  17a9 cd0000        	call	_Display_LCD_String
8470  17ac ac7c197c      	jpf	L1534
8471  17b0               L3234:
8472                     ; 1363 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
8474  17b0 c6000a        	ld	a,_uc_Target_Duty_Perc
8475  17b3 5f            	clrw	x
8476  17b4 97            	ld	xl,a
8477  17b5 1d0014        	subw	x,#20
8478  17b8 90ae94ed      	ldw	y,#38125
8479  17bc cd0000        	call	c_umul
8481  17bf ae0000        	ldw	x,#L001
8482  17c2 cd0000        	call	c_ludv
8484  17c5 be02          	ldw	x,c_lreg+2
8485  17c7 1c0064        	addw	x,#100
8486  17ca 1f0b          	ldw	(OFST-11,sp),x
8490  17cc 1e0b          	ldw	x,(OFST-11,sp)
8491  17ce cd0000        	call	_Num_Display_LCD
8493  17d1 ac7c197c      	jpf	L1534
8494  17d5               L5034:
8495                     ; 1367 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
8497  17d5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8498  17d8 a114          	cp	a,#20
8499  17da 2408          	jruge	L1334
8502  17dc 5f            	clrw	x
8503  17dd cd0000        	call	_Num_Display_LCD
8506  17e0 ac7c197c      	jpf	L1534
8507  17e4               L1334:
8508                     ; 1368 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
8510  17e4 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8511  17e7 a114          	cp	a,#20
8512  17e9 260a          	jrne	L5334
8515  17eb ae0064        	ldw	x,#100
8516  17ee cd0000        	call	_Num_Display_LCD
8519  17f1 ac7c197c      	jpf	L1534
8520  17f5               L5334:
8521                     ; 1369 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
8523  17f5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8524  17f8 a1b4          	cp	a,#180
8525  17fa 260a          	jrne	L1434
8528  17fc ae1838        	ldw	x,#6200
8529  17ff cd0000        	call	_Num_Display_LCD
8532  1802 ac7c197c      	jpf	L1534
8533  1806               L1434:
8534                     ; 1370 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
8536  1806 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8537  1809 a1be          	cp	a,#190
8538  180b 260a          	jrne	L5434
8541  180d ae0246        	ldw	x,#L5133
8542  1810 cd0000        	call	_Display_LCD_String
8545  1813 ac7c197c      	jpf	L1534
8546  1817               L5434:
8547                     ; 1371 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
8549  1817 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8550  181a 5f            	clrw	x
8551  181b 97            	ld	xl,a
8552  181c 1d0014        	subw	x,#20
8553  181f 90ae94ed      	ldw	y,#38125
8554  1823 cd0000        	call	c_umul
8556  1826 ae0000        	ldw	x,#L001
8557  1829 cd0000        	call	c_ludv
8559  182c be02          	ldw	x,c_lreg+2
8560  182e 1c0064        	addw	x,#100
8561  1831 1f0b          	ldw	(OFST-11,sp),x
8565  1833 1e0b          	ldw	x,(OFST-11,sp)
8566  1835 cd0000        	call	_Num_Display_LCD
8568  1838 ac7c197c      	jpf	L1534
8569  183c               L5524:
8570                     ; 1376 					if(!uc_Target_Display_Mode){
8572  183c 725d0000      	tnz	_uc_Target_Display_Mode
8573  1840 2676          	jrne	L3534
8574                     ; 1377 if (HEATER_zone_status == HTR_ZONE_1)
8576  1842 725d0000      	tnz	_HEATER_zone_status
8577  1846 2638          	jrne	L5534
8578                     ; 1379 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
8580  1848 c6000a        	ld	a,_uc_Target_Duty_Perc
8581  184b 5f            	clrw	x
8582  184c 97            	ld	xl,a
8583  184d 57            	sraw	x
8584  184e cd0000        	call	_Num_Display_LCD
8586                     ; 1380 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
8588  1851 c6000a        	ld	a,_uc_Target_Duty_Perc
8589  1854 a1c8          	cp	a,#200
8590  1856 2503          	jrult	L602
8591  1858 cc197c        	jp	L1534
8592  185b               L602:
8593                     ; 1381 							Display_LCD_String(".");
8595  185b ae0282        	ldw	x,#L5013
8596  185e cd0000        	call	_Display_LCD_String
8598                     ; 1382 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
8600  1861 c6000a        	ld	a,_uc_Target_Duty_Perc
8601  1864 a401          	and	a,#1
8602  1866 6b16          	ld	(OFST+0,sp),a
8604                     ; 1383 							if(uc_buffer){ Display_LCD_String("5"); }
8606  1868 0d16          	tnz	(OFST+0,sp)
8607  186a 270a          	jreq	L1634
8610  186c ae0280        	ldw	x,#L1113
8611  186f cd0000        	call	_Display_LCD_String
8614  1872 ac7c197c      	jpf	L1534
8615  1876               L1634:
8616                     ; 1384 							else{ Display_LCD_String("0"); }
8618  1876 ae027e        	ldw	x,#L5113
8619  1879 cd0000        	call	_Display_LCD_String
8621  187c ac7c197c      	jpf	L1534
8622  1880               L5534:
8623                     ; 1389 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
8625  1880 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8626  1883 5f            	clrw	x
8627  1884 97            	ld	xl,a
8628  1885 57            	sraw	x
8629  1886 cd0000        	call	_Num_Display_LCD
8631                     ; 1390 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
8633  1889 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8634  188c a1c8          	cp	a,#200
8635  188e 2503          	jrult	L012
8636  1890 cc197c        	jp	L1534
8637  1893               L012:
8638                     ; 1391 							Display_LCD_String(".");
8640  1893 ae0282        	ldw	x,#L5013
8641  1896 cd0000        	call	_Display_LCD_String
8643                     ; 1392 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
8645  1899 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8646  189c a401          	and	a,#1
8647  189e 6b16          	ld	(OFST+0,sp),a
8649                     ; 1393 							if(uc_buffer){ Display_LCD_String("5"); }
8651  18a0 0d16          	tnz	(OFST+0,sp)
8652  18a2 270a          	jreq	L1734
8655  18a4 ae0280        	ldw	x,#L1113
8656  18a7 cd0000        	call	_Display_LCD_String
8659  18aa ac7c197c      	jpf	L1534
8660  18ae               L1734:
8661                     ; 1394 							else{ Display_LCD_String("0"); }
8663  18ae ae027e        	ldw	x,#L5113
8664  18b1 cd0000        	call	_Display_LCD_String
8666  18b4 ac7c197c      	jpf	L1534
8667  18b8               L3534:
8668                     ; 1399 if (HEATER_zone_status == HTR_ZONE_1)
8670  18b8 725d0000      	tnz	_HEATER_zone_status
8671  18bc 2663          	jrne	L7734
8672                     ; 1401 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
8674  18be c6000a        	ld	a,_uc_Target_Duty_Perc
8675  18c1 a114          	cp	a,#20
8676  18c3 2408          	jruge	L1044
8679  18c5 5f            	clrw	x
8680  18c6 cd0000        	call	_Num_Display_LCD
8683  18c9 ac7c197c      	jpf	L1534
8684  18cd               L1044:
8685                     ; 1402 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
8687  18cd c6000a        	ld	a,_uc_Target_Duty_Perc
8688  18d0 a114          	cp	a,#20
8689  18d2 260a          	jrne	L5044
8692  18d4 ae0064        	ldw	x,#100
8693  18d7 cd0000        	call	_Num_Display_LCD
8696  18da ac7c197c      	jpf	L1534
8697  18de               L5044:
8698                     ; 1403 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
8700  18de c6000a        	ld	a,_uc_Target_Duty_Perc
8701  18e1 a1b4          	cp	a,#180
8702  18e3 260a          	jrne	L1144
8705  18e5 ae1838        	ldw	x,#6200
8706  18e8 cd0000        	call	_Num_Display_LCD
8709  18eb ac7c197c      	jpf	L1534
8710  18ef               L1144:
8711                     ; 1404 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
8713  18ef c6000a        	ld	a,_uc_Target_Duty_Perc
8714  18f2 a1b5          	cp	a,#181
8715  18f4 2508          	jrult	L5144
8718  18f6 ae0246        	ldw	x,#L5133
8719  18f9 cd0000        	call	_Display_LCD_String
8722  18fc 207e          	jra	L1534
8723  18fe               L5144:
8724                     ; 1405 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
8726  18fe c6000a        	ld	a,_uc_Target_Duty_Perc
8727  1901 5f            	clrw	x
8728  1902 97            	ld	xl,a
8729  1903 1d0014        	subw	x,#20
8730  1906 90ae94ed      	ldw	y,#38125
8731  190a cd0000        	call	c_umul
8733  190d ae0000        	ldw	x,#L001
8734  1910 cd0000        	call	c_ludv
8736  1913 be02          	ldw	x,c_lreg+2
8737  1915 1c0064        	addw	x,#100
8738  1918 1f0b          	ldw	(OFST-11,sp),x
8742  191a 1e0b          	ldw	x,(OFST-11,sp)
8743  191c cd0000        	call	_Num_Display_LCD
8745  191f 205b          	jra	L1534
8746  1921               L7734:
8747                     ; 1409 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
8749  1921 c6000b        	ld	a,_uc_Target_Duty_Perc+1
8750  1924 a114          	cp	a,#20
8751  1926 2406          	jruge	L3244
8754  1928 5f            	clrw	x
8755  1929 cd0000        	call	_Num_Display_LCD
8758  192c 204e          	jra	L1534
8759  192e               L3244:
8760                     ; 1410 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
8762  192e c6000b        	ld	a,_uc_Target_Duty_Perc+1
8763  1931 a114          	cp	a,#20
8764  1933 2608          	jrne	L7244
8767  1935 ae0064        	ldw	x,#100
8768  1938 cd0000        	call	_Num_Display_LCD
8771  193b 203f          	jra	L1534
8772  193d               L7244:
8773                     ; 1411 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
8775  193d c6000b        	ld	a,_uc_Target_Duty_Perc+1
8776  1940 a1b4          	cp	a,#180
8777  1942 2608          	jrne	L3344
8780  1944 ae1838        	ldw	x,#6200
8781  1947 cd0000        	call	_Num_Display_LCD
8784  194a 2030          	jra	L1534
8785  194c               L3344:
8786                     ; 1412 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
8788  194c c6000b        	ld	a,_uc_Target_Duty_Perc+1
8789  194f a1b5          	cp	a,#181
8790  1951 2508          	jrult	L7344
8793  1953 ae0246        	ldw	x,#L5133
8794  1956 cd0000        	call	_Display_LCD_String
8797  1959 2021          	jra	L1534
8798  195b               L7344:
8799                     ; 1413 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
8801  195b c6000b        	ld	a,_uc_Target_Duty_Perc+1
8802  195e 5f            	clrw	x
8803  195f 97            	ld	xl,a
8804  1960 1d0014        	subw	x,#20
8805  1963 90ae94ed      	ldw	y,#38125
8806  1967 cd0000        	call	c_umul
8808  196a ae0000        	ldw	x,#L001
8809  196d cd0000        	call	c_ludv
8811  1970 be02          	ldw	x,c_lreg+2
8812  1972 1c0064        	addw	x,#100
8813  1975 1f0b          	ldw	(OFST-11,sp),x
8817  1977 1e0b          	ldw	x,(OFST-11,sp)
8818  1979 cd0000        	call	_Num_Display_LCD
8820  197c               L1534:
8821                     ; 1419 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
8823  197c 7b15          	ld	a,(OFST-1,sp)
8824  197e 5f            	clrw	x
8825  197f 97            	ld	xl,a
8826  1980 d60000        	ld	a,(_LCD_Line,x)
8827  1983 ab0b          	add	a,#11
8828  1985 cd0000        	call	_Set_LCD_Address
8830                     ; 1420 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
8832  1988 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8833  198b a501          	bcp	a,#1
8834  198d 270a          	jreq	L3444
8837  198f ae025d        	ldw	x,#L7023
8838  1992 cd0000        	call	_Display_LCD_String
8841  1995 acda1ada      	jpf	L1524
8842  1999               L3444:
8843                     ; 1422 					Num_Display_LCD(can_data[4] /(U8)(2));
8845  1999 7b11          	ld	a,(OFST-5,sp)
8846  199b 5f            	clrw	x
8847  199c 97            	ld	xl,a
8848  199d 57            	sraw	x
8849  199e cd0000        	call	_Num_Display_LCD
8851                     ; 1423 					if(can_data[6] < (U8)(200)){
8853  19a1 7b13          	ld	a,(OFST-3,sp)
8854  19a3 a1c8          	cp	a,#200
8855  19a5 2503          	jrult	L212
8856  19a7 cc1ada        	jp	L1524
8857  19aa               L212:
8858                     ; 1424 						Display_LCD_String(".");
8860  19aa ae0282        	ldw	x,#L5013
8861  19ad cd0000        	call	_Display_LCD_String
8863                     ; 1425 						uc_buffer = can_data[4] % (U8)(2);
8865  19b0 7b11          	ld	a,(OFST-5,sp)
8866  19b2 a401          	and	a,#1
8867  19b4 6b16          	ld	(OFST+0,sp),a
8869                     ; 1426 						if(uc_buffer){ Display_LCD_String("5"); }
8871  19b6 0d16          	tnz	(OFST+0,sp)
8872  19b8 270a          	jreq	L1544
8875  19ba ae0280        	ldw	x,#L1113
8876  19bd cd0000        	call	_Display_LCD_String
8879  19c0 acda1ada      	jpf	L1524
8880  19c4               L1544:
8881                     ; 1427 						else{ Display_LCD_String("0"); }
8883  19c4 ae027e        	ldw	x,#L5113
8884  19c7 cd0000        	call	_Display_LCD_String
8886  19ca acda1ada      	jpf	L1524
8887  19ce               L3524:
8888                     ; 1433 			else if(uc_line_index == (U8)(2)){	// LINE 3
8890  19ce 7b15          	ld	a,(OFST-1,sp)
8891  19d0 a102          	cp	a,#2
8892  19d2 2703          	jreq	L412
8893  19d4 cc1a62        	jp	L7544
8894  19d7               L412:
8895                     ; 1436 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
8897  19d7 7b15          	ld	a,(OFST-1,sp)
8898  19d9 5f            	clrw	x
8899  19da 97            	ld	xl,a
8900  19db d60000        	ld	a,(_LCD_Line,x)
8901  19de ab02          	add	a,#2
8902  19e0 cd0000        	call	_Set_LCD_Address
8904                     ; 1437 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
8906  19e3 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8907  19e6 a501          	bcp	a,#1
8908  19e8 2708          	jreq	L1644
8911  19ea ae0244        	ldw	x,#L5543
8912  19ed cd0000        	call	_Display_LCD_String
8915  19f0 2014          	jra	L3644
8916  19f2               L1644:
8917                     ; 1439 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
8919  19f2 7b0d          	ld	a,(OFST-9,sp)
8920  19f4 a501          	bcp	a,#1
8921  19f6 2708          	jreq	L5644
8924  19f8 ae0242        	ldw	x,#L3643
8925  19fb cd0000        	call	_Display_LCD_String
8928  19fe 2006          	jra	L3644
8929  1a00               L5644:
8930                     ; 1440 					else{ Display_LCD_String("0"); }
8932  1a00 ae027e        	ldw	x,#L5113
8933  1a03 cd0000        	call	_Display_LCD_String
8935  1a06               L3644:
8936                     ; 1443 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
8938  1a06 7b15          	ld	a,(OFST-1,sp)
8939  1a08 5f            	clrw	x
8940  1a09 97            	ld	xl,a
8941  1a0a d60000        	ld	a,(_LCD_Line,x)
8942  1a0d ab06          	add	a,#6
8943  1a0f cd0000        	call	_Set_LCD_Address
8945                     ; 1444 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
8947  1a12 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8948  1a15 a502          	bcp	a,#2
8949  1a17 2708          	jreq	L1744
8952  1a19 ae0244        	ldw	x,#L5543
8953  1a1c cd0000        	call	_Display_LCD_String
8956  1a1f 2014          	jra	L3744
8957  1a21               L1744:
8958                     ; 1446 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
8960  1a21 7b03          	ld	a,(OFST-19,sp)
8961  1a23 a501          	bcp	a,#1
8962  1a25 2708          	jreq	L5744
8965  1a27 ae0242        	ldw	x,#L3643
8966  1a2a cd0000        	call	_Display_LCD_String
8969  1a2d 2006          	jra	L3744
8970  1a2f               L5744:
8971                     ; 1447 					else{ Display_LCD_String("0"); }
8973  1a2f ae027e        	ldw	x,#L5113
8974  1a32 cd0000        	call	_Display_LCD_String
8976  1a35               L3744:
8977                     ; 1450 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
8979  1a35 7b15          	ld	a,(OFST-1,sp)
8980  1a37 5f            	clrw	x
8981  1a38 97            	ld	xl,a
8982  1a39 d60000        	ld	a,(_LCD_Line,x)
8983  1a3c ab0b          	add	a,#11
8984  1a3e cd0000        	call	_Set_LCD_Address
8986                     ; 1451 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
8988  1a41 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8989  1a44 a501          	bcp	a,#1
8990  1a46 270a          	jreq	L1054
8993  1a48 ae025d        	ldw	x,#L7023
8994  1a4b cd0000        	call	_Display_LCD_String
8997  1a4e acda1ada      	jpf	L1524
8998  1a52               L1054:
8999                     ; 1454 					ui_buffer = (U16)(uc_Rx_Data[0][3]) * (U16)(4);//YJS 2->4
9001  1a52 c60003        	ld	a,_uc_Rx_Data+3
9002  1a55 97            	ld	xl,a
9003  1a56 a604          	ld	a,#4
9004  1a58 42            	mul	x,a
9005  1a59 1f0b          	ldw	(OFST-11,sp),x
9007                     ; 1455 					Num_Display_LCD(ui_buffer);
9009  1a5b 1e0b          	ldw	x,(OFST-11,sp)
9010  1a5d cd0000        	call	_Num_Display_LCD
9012  1a60 2078          	jra	L1524
9013  1a62               L7544:
9014                     ; 1461 			else if(uc_line_index == (U8)(3)){	// LINE 4
9016  1a62 7b15          	ld	a,(OFST-1,sp)
9017  1a64 a103          	cp	a,#3
9018  1a66 2672          	jrne	L1524
9019                     ; 1464 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
9021  1a68 7b15          	ld	a,(OFST-1,sp)
9022  1a6a 5f            	clrw	x
9023  1a6b 97            	ld	xl,a
9024  1a6c d60000        	ld	a,(_LCD_Line,x)
9025  1a6f ab03          	add	a,#3
9026  1a71 cd0000        	call	_Set_LCD_Address
9028                     ; 1466 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
9030  1a74 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
9031  1a77 a501          	bcp	a,#1
9032  1a79 2708          	jreq	L1154
9035  1a7b ae025d        	ldw	x,#L7023
9036  1a7e cd0000        	call	_Display_LCD_String
9039  1a81 2026          	jra	L3154
9040  1a83               L1154:
9041                     ; 1468 					Num_Display_LCD(can_data[6] / (U8)(5));
9043  1a83 7b13          	ld	a,(OFST-3,sp)
9044  1a85 5f            	clrw	x
9045  1a86 97            	ld	xl,a
9046  1a87 a605          	ld	a,#5
9047  1a89 cd0000        	call	c_sdivx
9049  1a8c cd0000        	call	_Num_Display_LCD
9051                     ; 1469 					Display_LCD_String(".");
9053  1a8f ae0282        	ldw	x,#L5013
9054  1a92 cd0000        	call	_Display_LCD_String
9056                     ; 1470 					uc_buffer = can_data[6] % (U8)(5);
9058  1a95 7b13          	ld	a,(OFST-3,sp)
9059  1a97 5f            	clrw	x
9060  1a98 97            	ld	xl,a
9061  1a99 a605          	ld	a,#5
9062  1a9b 62            	div	x,a
9063  1a9c 5f            	clrw	x
9064  1a9d 97            	ld	xl,a
9065  1a9e 9f            	ld	a,xl
9066  1a9f 6b16          	ld	(OFST+0,sp),a
9068                     ; 1471 					Num_Display_LCD(uc_buffer * (U8)(2));
9070  1aa1 7b16          	ld	a,(OFST+0,sp)
9071  1aa3 5f            	clrw	x
9072  1aa4 97            	ld	xl,a
9073  1aa5 58            	sllw	x
9074  1aa6 cd0000        	call	_Num_Display_LCD
9076  1aa9               L3154:
9077                     ; 1477 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
9079  1aa9 7b15          	ld	a,(OFST-1,sp)
9080  1aab 5f            	clrw	x
9081  1aac 97            	ld	xl,a
9082  1aad d60000        	ld	a,(_LCD_Line,x)
9083  1ab0 ab0b          	add	a,#11
9084  1ab2 cd0000        	call	_Set_LCD_Address
9086                     ; 1479 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
9088  1ab5 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
9089  1ab8 a501          	bcp	a,#1
9090  1aba 2708          	jreq	L5154
9093  1abc ae025d        	ldw	x,#L7023
9094  1abf cd0000        	call	_Display_LCD_String
9097  1ac2 2016          	jra	L1524
9098  1ac4               L5154:
9099                     ; 1481 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
9101  1ac4 7b0f          	ld	a,(OFST-7,sp)
9102  1ac6 5f            	clrw	x
9103  1ac7 97            	ld	xl,a
9104  1ac8 1f01          	ldw	(OFST-21,sp),x
9106  1aca 7b10          	ld	a,(OFST-6,sp)
9107  1acc 5f            	clrw	x
9108  1acd 97            	ld	xl,a
9109  1ace 4f            	clr	a
9110  1acf 02            	rlwa	x,a
9111  1ad0 72fb01        	addw	x,(OFST-21,sp)
9112  1ad3 1f0b          	ldw	(OFST-11,sp),x
9114                     ; 1482 					Num_Display_LCD(ui_buffer);
9116  1ad5 1e0b          	ldw	x,(OFST-11,sp)
9117  1ad7 cd0000        	call	_Num_Display_LCD
9119  1ada               L1524:
9120                     ; 1279 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
9122  1ada 0c15          	inc	(OFST-1,sp)
9126  1adc 7b15          	ld	a,(OFST-1,sp)
9127  1ade a104          	cp	a,#4
9128  1ae0 2403          	jruge	L612
9129  1ae2 cc1579        	jp	L7514
9130  1ae5               L612:
9132  1ae5 ac551f55      	jpf	L1254
9133  1ae9               L5514:
9134                     ; 1492 	else if(uc_Test_Page_Now == (U8)(1)){
9136  1ae9 c60004        	ld	a,_uc_Test_Page_Now
9137  1aec a101          	cp	a,#1
9138  1aee 2703          	jreq	L022
9139  1af0 cc1b90        	jp	L3254
9140  1af3               L022:
9141                     ; 1493 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
9143  1af3 0f15          	clr	(OFST-1,sp)
9145  1af5               L5254:
9146                     ; 1495 			Set_LCD_Address(LCD_Line[uc_line_index]);
9148  1af5 7b15          	ld	a,(OFST-1,sp)
9149  1af7 5f            	clrw	x
9150  1af8 97            	ld	xl,a
9151  1af9 d60000        	ld	a,(_LCD_Line,x)
9152  1afc cd0000        	call	_Set_LCD_Address
9154                     ; 1496 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
9156  1aff 7b15          	ld	a,(OFST-1,sp)
9157  1b01 97            	ld	xl,a
9158  1b02 a610          	ld	a,#16
9159  1b04 42            	mul	x,a
9160  1b05 1c0000        	addw	x,#_LCD_Dis_Data
9161  1b08 cd0000        	call	_Display_LCD_String
9163                     ; 1499 			if(uc_line_index == (U8)(0)){		// LINE 1
9165  1b0b 0d15          	tnz	(OFST-1,sp)
9166  1b0d 2641          	jrne	L3354
9167                     ; 1502 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
9169  1b0f 7b15          	ld	a,(OFST-1,sp)
9170  1b11 5f            	clrw	x
9171  1b12 97            	ld	xl,a
9172  1b13 d60000        	ld	a,(_LCD_Line,x)
9173  1b16 ab03          	add	a,#3
9174  1b18 cd0000        	call	_Set_LCD_Address
9176                     ; 1503 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
9178  1b1b c6000c        	ld	a,_uc_Rx_TimeOut_Reg
9179  1b1e a501          	bcp	a,#1
9180  1b20 2708          	jreq	L5354
9183  1b22 ae025d        	ldw	x,#L7023
9184  1b25 cd0000        	call	_Display_LCD_String
9187  1b28 2026          	jra	L3354
9188  1b2a               L5354:
9189                     ; 1505 					if(can_data[1] < (U8)(40)){
9191  1b2a 7b0e          	ld	a,(OFST-8,sp)
9192  1b2c a128          	cp	a,#40
9193  1b2e 2416          	jruge	L1454
9194                     ; 1506 						Display_LCD_String("-");
9196  1b30 ae0240        	ldw	x,#L1453
9197  1b33 cd0000        	call	_Display_LCD_String
9199                     ; 1507 						Num_Display_LCD((U8)(40) - can_data[1]);
9201  1b36 a600          	ld	a,#0
9202  1b38 97            	ld	xl,a
9203  1b39 a628          	ld	a,#40
9204  1b3b 100e          	sub	a,(OFST-8,sp)
9205  1b3d 2401          	jrnc	L061
9206  1b3f 5a            	decw	x
9207  1b40               L061:
9208  1b40 02            	rlwa	x,a
9209  1b41 cd0000        	call	_Num_Display_LCD
9212  1b44 200a          	jra	L3354
9213  1b46               L1454:
9214                     ; 1510 						Num_Display_LCD(can_data[1] - (U8)(40));
9216  1b46 7b0e          	ld	a,(OFST-8,sp)
9217  1b48 5f            	clrw	x
9218  1b49 97            	ld	xl,a
9219  1b4a 1d0028        	subw	x,#40
9220  1b4d cd0000        	call	_Num_Display_LCD
9222  1b50               L3354:
9223                     ; 1516 			if(uc_line_index == (U8)(1)){		// LINE 2
9225  1b50 7b15          	ld	a,(OFST-1,sp)
9226  1b52 a101          	cp	a,#1
9227  1b54 2623          	jrne	L5454
9228                     ; 1519 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
9230  1b56 7b15          	ld	a,(OFST-1,sp)
9231  1b58 5f            	clrw	x
9232  1b59 97            	ld	xl,a
9233  1b5a d60000        	ld	a,(_LCD_Line,x)
9234  1b5d ab04          	add	a,#4
9235  1b5f cd0000        	call	_Set_LCD_Address
9237                     ; 1520 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
9239  1b62 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
9240  1b65 a502          	bcp	a,#2
9241  1b67 2708          	jreq	L7454
9244  1b69 ae025d        	ldw	x,#L7023
9245  1b6c cd0000        	call	_Display_LCD_String
9248  1b6f 2008          	jra	L5454
9249  1b71               L7454:
9250                     ; 1523 					Num_Display_LCD(uc_Rx_Data[0][7]);  				//SoftWare Version Display
9252  1b71 c60007        	ld	a,_uc_Rx_Data+7
9253  1b74 5f            	clrw	x
9254  1b75 97            	ld	xl,a
9255  1b76 cd0000        	call	_Num_Display_LCD
9257  1b79               L5454:
9258                     ; 1535 			if(uc_line_index == (U8)(2)){		// LINE 2
9260  1b79 7b15          	ld	a,(OFST-1,sp)
9261  1b7b a102          	cp	a,#2
9262                     ; 1540 			if(uc_line_index == (U8)(3)){		// LINE 3
9264  1b7d 7b15          	ld	a,(OFST-1,sp)
9265  1b7f a103          	cp	a,#3
9266                     ; 1493 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
9268  1b81 0c15          	inc	(OFST-1,sp)
9272  1b83 7b15          	ld	a,(OFST-1,sp)
9273  1b85 a104          	cp	a,#4
9274  1b87 2403          	jruge	L222
9275  1b89 cc1af5        	jp	L5254
9276  1b8c               L222:
9278  1b8c ac551f55      	jpf	L1254
9279  1b90               L3254:
9280                     ; 1547 		if(b_Rx2_Msg_TimeOut_Flag){
9282  1b90 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
9283  1b93 a502          	bcp	a,#2
9284  1b95 2710          	jreq	L1654
9285                     ; 1548 			Set_LCD_Address(LCD_Line[0]);	
9287  1b97 c60000        	ld	a,_LCD_Line
9288  1b9a cd0000        	call	_Set_LCD_Address
9290                     ; 1549 			Display_LCD_String("NC");
9292  1b9d ae025d        	ldw	x,#L7023
9293  1ba0 cd0000        	call	_Display_LCD_String
9296  1ba3 ac551f55      	jpf	L1254
9297  1ba7               L1654:
9298                     ; 1552 			uc_fault_cnt = (U8)(0);
9300  1ba7 0f16          	clr	(OFST+0,sp)
9302                     ; 1554 			if(can_diag[0] & (U8)(0x02)){
9304  1ba9 7b03          	ld	a,(OFST-19,sp)
9305  1bab a502          	bcp	a,#2
9306  1bad 273c          	jreq	L5654
9307                     ; 1555 				uc_fault_cnt++;
9309  1baf 0c16          	inc	(OFST+0,sp)
9311                     ; 1556 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9311                     ; 1557 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9311                     ; 1558 				){
9313  1bb1 0d16          	tnz	(OFST+0,sp)
9314  1bb3 270d          	jreq	L3754
9316  1bb5 7b16          	ld	a,(OFST+0,sp)
9317  1bb7 a105          	cp	a,#5
9318  1bb9 2407          	jruge	L3754
9320  1bbb c60004        	ld	a,_uc_Test_Page_Now
9321  1bbe a102          	cp	a,#2
9322  1bc0 2713          	jreq	L1754
9323  1bc2               L3754:
9325  1bc2 7b16          	ld	a,(OFST+0,sp)
9326  1bc4 a105          	cp	a,#5
9327  1bc6 2523          	jrult	L5654
9329  1bc8 7b16          	ld	a,(OFST+0,sp)
9330  1bca a109          	cp	a,#9
9331  1bcc 241d          	jruge	L5654
9333  1bce c60004        	ld	a,_uc_Test_Page_Now
9334  1bd1 a103          	cp	a,#3
9335  1bd3 2616          	jrne	L5654
9336  1bd5               L1754:
9337                     ; 1559 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9339  1bd5 7b16          	ld	a,(OFST+0,sp)
9340  1bd7 5f            	clrw	x
9341  1bd8 97            	ld	xl,a
9342  1bd9 5a            	decw	x
9343  1bda a604          	ld	a,#4
9344  1bdc cd0000        	call	c_smodx
9346  1bdf d60000        	ld	a,(_LCD_Line,x)
9347  1be2 cd0000        	call	_Set_LCD_Address
9349                     ; 1560 					Display_LCD_String("Flt_LVLow");
9351  1be5 ae0236        	ldw	x,#L7753
9352  1be8 cd0000        	call	_Display_LCD_String
9354  1beb               L5654:
9355                     ; 1564 			if(can_diag[0] & (U8)(0x04)){
9357  1beb 7b03          	ld	a,(OFST-19,sp)
9358  1bed a504          	bcp	a,#4
9359  1bef 273c          	jreq	L7754
9360                     ; 1565 				uc_fault_cnt++;
9362  1bf1 0c16          	inc	(OFST+0,sp)
9364                     ; 1566 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9364                     ; 1567 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9364                     ; 1568 				){
9366  1bf3 0d16          	tnz	(OFST+0,sp)
9367  1bf5 270d          	jreq	L5064
9369  1bf7 7b16          	ld	a,(OFST+0,sp)
9370  1bf9 a105          	cp	a,#5
9371  1bfb 2407          	jruge	L5064
9373  1bfd c60004        	ld	a,_uc_Test_Page_Now
9374  1c00 a102          	cp	a,#2
9375  1c02 2713          	jreq	L3064
9376  1c04               L5064:
9378  1c04 7b16          	ld	a,(OFST+0,sp)
9379  1c06 a105          	cp	a,#5
9380  1c08 2523          	jrult	L7754
9382  1c0a 7b16          	ld	a,(OFST+0,sp)
9383  1c0c a109          	cp	a,#9
9384  1c0e 241d          	jruge	L7754
9386  1c10 c60004        	ld	a,_uc_Test_Page_Now
9387  1c13 a103          	cp	a,#3
9388  1c15 2616          	jrne	L7754
9389  1c17               L3064:
9390                     ; 1569 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9392  1c17 7b16          	ld	a,(OFST+0,sp)
9393  1c19 5f            	clrw	x
9394  1c1a 97            	ld	xl,a
9395  1c1b 5a            	decw	x
9396  1c1c a604          	ld	a,#4
9397  1c1e cd0000        	call	c_smodx
9399  1c21 d60000        	ld	a,(_LCD_Line,x)
9400  1c24 cd0000        	call	_Set_LCD_Address
9402                     ; 1570 					Display_LCD_String("Flt_LVHigh");
9404  1c27 ae022b        	ldw	x,#L3163
9405  1c2a cd0000        	call	_Display_LCD_String
9407  1c2d               L7754:
9408                     ; 1574 			if(can_diag[0] & (U8)(0x08)){
9410  1c2d 7b03          	ld	a,(OFST-19,sp)
9411  1c2f a508          	bcp	a,#8
9412  1c31 273c          	jreq	L1164
9413                     ; 1575 				uc_fault_cnt++;
9415  1c33 0c16          	inc	(OFST+0,sp)
9417                     ; 1576 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9417                     ; 1577 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9417                     ; 1578 				){
9419  1c35 0d16          	tnz	(OFST+0,sp)
9420  1c37 270d          	jreq	L7164
9422  1c39 7b16          	ld	a,(OFST+0,sp)
9423  1c3b a105          	cp	a,#5
9424  1c3d 2407          	jruge	L7164
9426  1c3f c60004        	ld	a,_uc_Test_Page_Now
9427  1c42 a102          	cp	a,#2
9428  1c44 2713          	jreq	L5164
9429  1c46               L7164:
9431  1c46 7b16          	ld	a,(OFST+0,sp)
9432  1c48 a105          	cp	a,#5
9433  1c4a 2523          	jrult	L1164
9435  1c4c 7b16          	ld	a,(OFST+0,sp)
9436  1c4e a109          	cp	a,#9
9437  1c50 241d          	jruge	L1164
9439  1c52 c60004        	ld	a,_uc_Test_Page_Now
9440  1c55 a103          	cp	a,#3
9441  1c57 2616          	jrne	L1164
9442  1c59               L5164:
9443                     ; 1579 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9445  1c59 7b16          	ld	a,(OFST+0,sp)
9446  1c5b 5f            	clrw	x
9447  1c5c 97            	ld	xl,a
9448  1c5d 5a            	decw	x
9449  1c5e a604          	ld	a,#4
9450  1c60 cd0000        	call	c_smodx
9452  1c63 d60000        	ld	a,(_LCD_Line,x)
9453  1c66 cd0000        	call	_Set_LCD_Address
9455                     ; 1580 					Display_LCD_String("Flt_HVLow");
9457  1c69 ae0221        	ldw	x,#L7263
9458  1c6c cd0000        	call	_Display_LCD_String
9460  1c6f               L1164:
9461                     ; 1584 			if(can_diag[0] & (U8)(0x10)){
9463  1c6f 7b03          	ld	a,(OFST-19,sp)
9464  1c71 a510          	bcp	a,#16
9465  1c73 273c          	jreq	L3264
9466                     ; 1585 				uc_fault_cnt++;
9468  1c75 0c16          	inc	(OFST+0,sp)
9470                     ; 1586 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9470                     ; 1587 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9470                     ; 1588 				){
9472  1c77 0d16          	tnz	(OFST+0,sp)
9473  1c79 270d          	jreq	L1364
9475  1c7b 7b16          	ld	a,(OFST+0,sp)
9476  1c7d a105          	cp	a,#5
9477  1c7f 2407          	jruge	L1364
9479  1c81 c60004        	ld	a,_uc_Test_Page_Now
9480  1c84 a102          	cp	a,#2
9481  1c86 2713          	jreq	L7264
9482  1c88               L1364:
9484  1c88 7b16          	ld	a,(OFST+0,sp)
9485  1c8a a105          	cp	a,#5
9486  1c8c 2523          	jrult	L3264
9488  1c8e 7b16          	ld	a,(OFST+0,sp)
9489  1c90 a109          	cp	a,#9
9490  1c92 241d          	jruge	L3264
9492  1c94 c60004        	ld	a,_uc_Test_Page_Now
9493  1c97 a103          	cp	a,#3
9494  1c99 2616          	jrne	L3264
9495  1c9b               L7264:
9496                     ; 1589 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
9498  1c9b 7b16          	ld	a,(OFST+0,sp)
9499  1c9d 5f            	clrw	x
9500  1c9e 97            	ld	xl,a
9501  1c9f 5a            	decw	x
9502  1ca0 a604          	ld	a,#4
9503  1ca2 cd0000        	call	c_smodx
9505  1ca5 d60000        	ld	a,(_LCD_Line,x)
9506  1ca8 cd0000        	call	_Set_LCD_Address
9508                     ; 1590 					Display_LCD_String("Flt_HVHigh");
9510  1cab ae0216        	ldw	x,#L3463
9511  1cae cd0000        	call	_Display_LCD_String
9513  1cb1               L3264:
9514                     ; 1594 			if(can_data[7] & (U8)(0x2)){
9516  1cb1 7b14          	ld	a,(OFST-2,sp)
9517  1cb3 a502          	bcp	a,#2
9518  1cb5 273c          	jreq	L5364
9519                     ; 1595 				uc_fault_cnt++;
9521  1cb7 0c16          	inc	(OFST+0,sp)
9523                     ; 1596 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9523                     ; 1597 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9523                     ; 1598 				){
9525  1cb9 0d16          	tnz	(OFST+0,sp)
9526  1cbb 270d          	jreq	L3464
9528  1cbd 7b16          	ld	a,(OFST+0,sp)
9529  1cbf a105          	cp	a,#5
9530  1cc1 2407          	jruge	L3464
9532  1cc3 c60004        	ld	a,_uc_Test_Page_Now
9533  1cc6 a102          	cp	a,#2
9534  1cc8 2713          	jreq	L1464
9535  1cca               L3464:
9537  1cca 7b16          	ld	a,(OFST+0,sp)
9538  1ccc a105          	cp	a,#5
9539  1cce 2523          	jrult	L5364
9541  1cd0 7b16          	ld	a,(OFST+0,sp)
9542  1cd2 a109          	cp	a,#9
9543  1cd4 241d          	jruge	L5364
9545  1cd6 c60004        	ld	a,_uc_Test_Page_Now
9546  1cd9 a103          	cp	a,#3
9547  1cdb 2616          	jrne	L5364
9548  1cdd               L1464:
9549                     ; 1599 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9551  1cdd 7b16          	ld	a,(OFST+0,sp)
9552  1cdf 5f            	clrw	x
9553  1ce0 97            	ld	xl,a
9554  1ce1 5a            	decw	x
9555  1ce2 a604          	ld	a,#4
9556  1ce4 cd0000        	call	c_smodx
9558  1ce7 d60000        	ld	a,(_LCD_Line,x)
9559  1cea cd0000        	call	_Set_LCD_Address
9561                     ; 1600 					Display_LCD_String("Flt_OverCur");
9563  1ced ae020a        	ldw	x,#L7563
9564  1cf0 cd0000        	call	_Display_LCD_String
9566  1cf3               L5364:
9567                     ; 1603 			if(can_data[7] & (U8)(0x1)){
9569  1cf3 7b14          	ld	a,(OFST-2,sp)
9570  1cf5 a501          	bcp	a,#1
9571  1cf7 273c          	jreq	L7464
9572                     ; 1604 				uc_fault_cnt++;
9574  1cf9 0c16          	inc	(OFST+0,sp)
9576                     ; 1605 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9576                     ; 1606 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9576                     ; 1607 				){
9578  1cfb 0d16          	tnz	(OFST+0,sp)
9579  1cfd 270d          	jreq	L5564
9581  1cff 7b16          	ld	a,(OFST+0,sp)
9582  1d01 a105          	cp	a,#5
9583  1d03 2407          	jruge	L5564
9585  1d05 c60004        	ld	a,_uc_Test_Page_Now
9586  1d08 a102          	cp	a,#2
9587  1d0a 2713          	jreq	L3564
9588  1d0c               L5564:
9590  1d0c 7b16          	ld	a,(OFST+0,sp)
9591  1d0e a105          	cp	a,#5
9592  1d10 2523          	jrult	L7464
9594  1d12 7b16          	ld	a,(OFST+0,sp)
9595  1d14 a109          	cp	a,#9
9596  1d16 241d          	jruge	L7464
9598  1d18 c60004        	ld	a,_uc_Test_Page_Now
9599  1d1b a103          	cp	a,#3
9600  1d1d 2616          	jrne	L7464
9601  1d1f               L3564:
9602                     ; 1608 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9604  1d1f 7b16          	ld	a,(OFST+0,sp)
9605  1d21 5f            	clrw	x
9606  1d22 97            	ld	xl,a
9607  1d23 5a            	decw	x
9608  1d24 a604          	ld	a,#4
9609  1d26 cd0000        	call	c_smodx
9611  1d29 d60000        	ld	a,(_LCD_Line,x)
9612  1d2c cd0000        	call	_Set_LCD_Address
9614                     ; 1609 					Display_LCD_String("Flt_ThmShut");
9616  1d2f ae01fe        	ldw	x,#L3763
9617  1d32 cd0000        	call	_Display_LCD_String
9619  1d35               L7464:
9620                     ; 1613 			if(can_diag[1] & (U8)(0x1)){
9622  1d35 7b04          	ld	a,(OFST-18,sp)
9623  1d37 a501          	bcp	a,#1
9624  1d39 273c          	jreq	L1664
9625                     ; 1614 				uc_fault_cnt++;
9627  1d3b 0c16          	inc	(OFST+0,sp)
9629                     ; 1615 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9629                     ; 1616 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9629                     ; 1617 				){
9631  1d3d 0d16          	tnz	(OFST+0,sp)
9632  1d3f 270d          	jreq	L7664
9634  1d41 7b16          	ld	a,(OFST+0,sp)
9635  1d43 a105          	cp	a,#5
9636  1d45 2407          	jruge	L7664
9638  1d47 c60004        	ld	a,_uc_Test_Page_Now
9639  1d4a a102          	cp	a,#2
9640  1d4c 2713          	jreq	L5664
9641  1d4e               L7664:
9643  1d4e 7b16          	ld	a,(OFST+0,sp)
9644  1d50 a105          	cp	a,#5
9645  1d52 2523          	jrult	L1664
9647  1d54 7b16          	ld	a,(OFST+0,sp)
9648  1d56 a109          	cp	a,#9
9649  1d58 241d          	jruge	L1664
9651  1d5a c60004        	ld	a,_uc_Test_Page_Now
9652  1d5d a103          	cp	a,#3
9653  1d5f 2616          	jrne	L1664
9654  1d61               L5664:
9655                     ; 1618 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
9657  1d61 7b16          	ld	a,(OFST+0,sp)
9658  1d63 5f            	clrw	x
9659  1d64 97            	ld	xl,a
9660  1d65 5a            	decw	x
9661  1d66 a604          	ld	a,#4
9662  1d68 cd0000        	call	c_smodx
9664  1d6b d60000        	ld	a,(_LCD_Line,x)
9665  1d6e cd0000        	call	_Set_LCD_Address
9667                     ; 1619 					Display_LCD_String("Flt_PCBThmShut");
9669  1d71 ae01ef        	ldw	x,#L7073
9670  1d74 cd0000        	call	_Display_LCD_String
9672  1d77               L1664:
9673                     ; 1623 			if(can_diag[1] & (U8)(0x10)){
9675  1d77 7b04          	ld	a,(OFST-18,sp)
9676  1d79 a510          	bcp	a,#16
9677  1d7b 273c          	jreq	L3764
9678                     ; 1624 				uc_fault_cnt++;
9680  1d7d 0c16          	inc	(OFST+0,sp)
9682                     ; 1625 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9682                     ; 1626 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9682                     ; 1627 				){
9684  1d7f 0d16          	tnz	(OFST+0,sp)
9685  1d81 270d          	jreq	L1074
9687  1d83 7b16          	ld	a,(OFST+0,sp)
9688  1d85 a105          	cp	a,#5
9689  1d87 2407          	jruge	L1074
9691  1d89 c60004        	ld	a,_uc_Test_Page_Now
9692  1d8c a102          	cp	a,#2
9693  1d8e 2713          	jreq	L7764
9694  1d90               L1074:
9696  1d90 7b16          	ld	a,(OFST+0,sp)
9697  1d92 a105          	cp	a,#5
9698  1d94 2523          	jrult	L3764
9700  1d96 7b16          	ld	a,(OFST+0,sp)
9701  1d98 a109          	cp	a,#9
9702  1d9a 241d          	jruge	L3764
9704  1d9c c60004        	ld	a,_uc_Test_Page_Now
9705  1d9f a103          	cp	a,#3
9706  1da1 2616          	jrne	L3764
9707  1da3               L7764:
9708                     ; 1628 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9710  1da3 7b16          	ld	a,(OFST+0,sp)
9711  1da5 5f            	clrw	x
9712  1da6 97            	ld	xl,a
9713  1da7 5a            	decw	x
9714  1da8 a604          	ld	a,#4
9715  1daa cd0000        	call	c_smodx
9717  1dad d60000        	ld	a,(_LCD_Line,x)
9718  1db0 cd0000        	call	_Set_LCD_Address
9720                     ; 1629 					Display_LCD_String("Flt_MsgTimeOut");
9722  1db3 ae01e0        	ldw	x,#L3273
9723  1db6 cd0000        	call	_Display_LCD_String
9725  1db9               L3764:
9726                     ; 1633 			if(can_diag[1] & (U8)(0x04)){
9728  1db9 7b04          	ld	a,(OFST-18,sp)
9729  1dbb a504          	bcp	a,#4
9730  1dbd 273c          	jreq	L5074
9731                     ; 1634 				uc_fault_cnt++;
9733  1dbf 0c16          	inc	(OFST+0,sp)
9735                     ; 1635 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9735                     ; 1636 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9735                     ; 1637 				){
9737  1dc1 0d16          	tnz	(OFST+0,sp)
9738  1dc3 270d          	jreq	L3174
9740  1dc5 7b16          	ld	a,(OFST+0,sp)
9741  1dc7 a105          	cp	a,#5
9742  1dc9 2407          	jruge	L3174
9744  1dcb c60004        	ld	a,_uc_Test_Page_Now
9745  1dce a102          	cp	a,#2
9746  1dd0 2713          	jreq	L1174
9747  1dd2               L3174:
9749  1dd2 7b16          	ld	a,(OFST+0,sp)
9750  1dd4 a105          	cp	a,#5
9751  1dd6 2523          	jrult	L5074
9753  1dd8 7b16          	ld	a,(OFST+0,sp)
9754  1dda a109          	cp	a,#9
9755  1ddc 241d          	jruge	L5074
9757  1dde c60004        	ld	a,_uc_Test_Page_Now
9758  1de1 a103          	cp	a,#3
9759  1de3 2616          	jrne	L5074
9760  1de5               L1174:
9761                     ; 1638 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9763  1de5 7b16          	ld	a,(OFST+0,sp)
9764  1de7 5f            	clrw	x
9765  1de8 97            	ld	xl,a
9766  1de9 5a            	decw	x
9767  1dea a604          	ld	a,#4
9768  1dec cd0000        	call	c_smodx
9770  1def d60000        	ld	a,(_LCD_Line,x)
9771  1df2 cd0000        	call	_Set_LCD_Address
9773                     ; 1639 					Display_LCD_String("Fail_HVSen");
9775  1df5 ae01d5        	ldw	x,#L7373
9776  1df8 cd0000        	call	_Display_LCD_String
9778  1dfb               L5074:
9779                     ; 1643 			if(can_diag[1] & (U8)(0x02)){
9781  1dfb 7b04          	ld	a,(OFST-18,sp)
9782  1dfd a502          	bcp	a,#2
9783  1dff 273c          	jreq	L7174
9784                     ; 1644 				uc_fault_cnt++;
9786  1e01 0c16          	inc	(OFST+0,sp)
9788                     ; 1645 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9788                     ; 1646 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9788                     ; 1647 				){
9790  1e03 0d16          	tnz	(OFST+0,sp)
9791  1e05 270d          	jreq	L5274
9793  1e07 7b16          	ld	a,(OFST+0,sp)
9794  1e09 a105          	cp	a,#5
9795  1e0b 2407          	jruge	L5274
9797  1e0d c60004        	ld	a,_uc_Test_Page_Now
9798  1e10 a102          	cp	a,#2
9799  1e12 2713          	jreq	L3274
9800  1e14               L5274:
9802  1e14 7b16          	ld	a,(OFST+0,sp)
9803  1e16 a105          	cp	a,#5
9804  1e18 2523          	jrult	L7174
9806  1e1a 7b16          	ld	a,(OFST+0,sp)
9807  1e1c a109          	cp	a,#9
9808  1e1e 241d          	jruge	L7174
9810  1e20 c60004        	ld	a,_uc_Test_Page_Now
9811  1e23 a103          	cp	a,#3
9812  1e25 2616          	jrne	L7174
9813  1e27               L3274:
9814                     ; 1648 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9816  1e27 7b16          	ld	a,(OFST+0,sp)
9817  1e29 5f            	clrw	x
9818  1e2a 97            	ld	xl,a
9819  1e2b 5a            	decw	x
9820  1e2c a604          	ld	a,#4
9821  1e2e cd0000        	call	c_smodx
9823  1e31 d60000        	ld	a,(_LCD_Line,x)
9824  1e34 cd0000        	call	_Set_LCD_Address
9826                     ; 1649 					Display_LCD_String("Fail_LVSen");
9828  1e37 ae01ca        	ldw	x,#L3573
9829  1e3a cd0000        	call	_Display_LCD_String
9831  1e3d               L7174:
9832                     ; 1653 			if(can_data[7] & (U8)(0x04)){
9834  1e3d 7b14          	ld	a,(OFST-2,sp)
9835  1e3f a504          	bcp	a,#4
9836  1e41 273c          	jreq	L1374
9837                     ; 1654 				uc_fault_cnt++;
9839  1e43 0c16          	inc	(OFST+0,sp)
9841                     ; 1655 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9841                     ; 1656 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9841                     ; 1657 				){
9843  1e45 0d16          	tnz	(OFST+0,sp)
9844  1e47 270d          	jreq	L7374
9846  1e49 7b16          	ld	a,(OFST+0,sp)
9847  1e4b a105          	cp	a,#5
9848  1e4d 2407          	jruge	L7374
9850  1e4f c60004        	ld	a,_uc_Test_Page_Now
9851  1e52 a102          	cp	a,#2
9852  1e54 2713          	jreq	L5374
9853  1e56               L7374:
9855  1e56 7b16          	ld	a,(OFST+0,sp)
9856  1e58 a105          	cp	a,#5
9857  1e5a 2523          	jrult	L1374
9859  1e5c 7b16          	ld	a,(OFST+0,sp)
9860  1e5e a109          	cp	a,#9
9861  1e60 241d          	jruge	L1374
9863  1e62 c60004        	ld	a,_uc_Test_Page_Now
9864  1e65 a103          	cp	a,#3
9865  1e67 2616          	jrne	L1374
9866  1e69               L5374:
9867                     ; 1658 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9869  1e69 7b16          	ld	a,(OFST+0,sp)
9870  1e6b 5f            	clrw	x
9871  1e6c 97            	ld	xl,a
9872  1e6d 5a            	decw	x
9873  1e6e a604          	ld	a,#4
9874  1e70 cd0000        	call	c_smodx
9876  1e73 d60000        	ld	a,(_LCD_Line,x)
9877  1e76 cd0000        	call	_Set_LCD_Address
9879                     ; 1659 					Display_LCD_String("Fail_CurSen");
9881  1e79 ae01be        	ldw	x,#L7673
9882  1e7c cd0000        	call	_Display_LCD_String
9884  1e7f               L1374:
9885                     ; 1665 			if(can_data[7] & (U8)(0x08)){
9887  1e7f 7b14          	ld	a,(OFST-2,sp)
9888  1e81 a508          	bcp	a,#8
9889  1e83 273c          	jreq	L3474
9890                     ; 1667 				uc_fault_cnt++;
9892  1e85 0c16          	inc	(OFST+0,sp)
9894                     ; 1668 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9894                     ; 1669 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9894                     ; 1670 				){
9896  1e87 0d16          	tnz	(OFST+0,sp)
9897  1e89 270d          	jreq	L1574
9899  1e8b 7b16          	ld	a,(OFST+0,sp)
9900  1e8d a105          	cp	a,#5
9901  1e8f 2407          	jruge	L1574
9903  1e91 c60004        	ld	a,_uc_Test_Page_Now
9904  1e94 a102          	cp	a,#2
9905  1e96 2713          	jreq	L7474
9906  1e98               L1574:
9908  1e98 7b16          	ld	a,(OFST+0,sp)
9909  1e9a a105          	cp	a,#5
9910  1e9c 2523          	jrult	L3474
9912  1e9e 7b16          	ld	a,(OFST+0,sp)
9913  1ea0 a109          	cp	a,#9
9914  1ea2 241d          	jruge	L3474
9916  1ea4 c60004        	ld	a,_uc_Test_Page_Now
9917  1ea7 a103          	cp	a,#3
9918  1ea9 2616          	jrne	L3474
9919  1eab               L7474:
9920                     ; 1671 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
9922  1eab 7b16          	ld	a,(OFST+0,sp)
9923  1ead 5f            	clrw	x
9924  1eae 97            	ld	xl,a
9925  1eaf 5a            	decw	x
9926  1eb0 a604          	ld	a,#4
9927  1eb2 cd0000        	call	c_smodx
9929  1eb5 d60000        	ld	a,(_LCD_Line,x)
9930  1eb8 cd0000        	call	_Set_LCD_Address
9932                     ; 1672 					Display_LCD_String("Fail_CoreTemp");
9934  1ebb ae01b0        	ldw	x,#L3004
9935  1ebe cd0000        	call	_Display_LCD_String
9937  1ec1               L3474:
9938                     ; 1678 			if(can_diag[1] & (U8)(0x8)){
9940  1ec1 7b04          	ld	a,(OFST-18,sp)
9941  1ec3 a508          	bcp	a,#8
9942  1ec5 273c          	jreq	L5574
9943                     ; 1680 				uc_fault_cnt++;
9945  1ec7 0c16          	inc	(OFST+0,sp)
9947                     ; 1681 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
9947                     ; 1682 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
9947                     ; 1683 				){
9949  1ec9 0d16          	tnz	(OFST+0,sp)
9950  1ecb 270d          	jreq	L3674
9952  1ecd 7b16          	ld	a,(OFST+0,sp)
9953  1ecf a105          	cp	a,#5
9954  1ed1 2407          	jruge	L3674
9956  1ed3 c60004        	ld	a,_uc_Test_Page_Now
9957  1ed6 a102          	cp	a,#2
9958  1ed8 2713          	jreq	L1674
9959  1eda               L3674:
9961  1eda 7b16          	ld	a,(OFST+0,sp)
9962  1edc a105          	cp	a,#5
9963  1ede 2523          	jrult	L5574
9965  1ee0 7b16          	ld	a,(OFST+0,sp)
9966  1ee2 a109          	cp	a,#9
9967  1ee4 241d          	jruge	L5574
9969  1ee6 c60004        	ld	a,_uc_Test_Page_Now
9970  1ee9 a103          	cp	a,#3
9971  1eeb 2616          	jrne	L5574
9972  1eed               L1674:
9973                     ; 1684 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
9975  1eed 7b16          	ld	a,(OFST+0,sp)
9976  1eef 5f            	clrw	x
9977  1ef0 97            	ld	xl,a
9978  1ef1 5a            	decw	x
9979  1ef2 a604          	ld	a,#4
9980  1ef4 cd0000        	call	c_smodx
9982  1ef7 d60000        	ld	a,(_LCD_Line,x)
9983  1efa cd0000        	call	_Set_LCD_Address
9985                     ; 1685 					Display_LCD_String("Fail_PCB1Temp");
9987  1efd ae01a2        	ldw	x,#L7104
9988  1f00 cd0000        	call	_Display_LCD_String
9990  1f03               L5574:
9991                     ; 1691 			if(can_data[5] == (U8)(0xff)){
9993  1f03 7b12          	ld	a,(OFST-4,sp)
9994  1f05 a1ff          	cp	a,#255
9995  1f07 263c          	jrne	L7674
9996                     ; 1693 				uc_fault_cnt++;
9998  1f09 0c16          	inc	(OFST+0,sp)
10000                     ; 1694 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
10000                     ; 1695 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
10000                     ; 1696 				){
10002  1f0b 0d16          	tnz	(OFST+0,sp)
10003  1f0d 270d          	jreq	L5774
10005  1f0f 7b16          	ld	a,(OFST+0,sp)
10006  1f11 a105          	cp	a,#5
10007  1f13 2407          	jruge	L5774
10009  1f15 c60004        	ld	a,_uc_Test_Page_Now
10010  1f18 a102          	cp	a,#2
10011  1f1a 2713          	jreq	L3774
10012  1f1c               L5774:
10014  1f1c 7b16          	ld	a,(OFST+0,sp)
10015  1f1e a105          	cp	a,#5
10016  1f20 2523          	jrult	L7674
10018  1f22 7b16          	ld	a,(OFST+0,sp)
10019  1f24 a109          	cp	a,#9
10020  1f26 241d          	jruge	L7674
10022  1f28 c60004        	ld	a,_uc_Test_Page_Now
10023  1f2b a103          	cp	a,#3
10024  1f2d 2616          	jrne	L7674
10025  1f2f               L3774:
10026                     ; 1697 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
10028  1f2f 7b16          	ld	a,(OFST+0,sp)
10029  1f31 5f            	clrw	x
10030  1f32 97            	ld	xl,a
10031  1f33 5a            	decw	x
10032  1f34 a604          	ld	a,#4
10033  1f36 cd0000        	call	c_smodx
10035  1f39 d60000        	ld	a,(_LCD_Line,x)
10036  1f3c cd0000        	call	_Set_LCD_Address
10038                     ; 1698 					Display_LCD_String("Fail_IGBT");
10040  1f3f ae0198        	ldw	x,#L3304
10041  1f42 cd0000        	call	_Display_LCD_String
10043  1f45               L7674:
10044                     ; 1712 			if(!uc_fault_cnt){
10046  1f45 0d16          	tnz	(OFST+0,sp)
10047  1f47 260c          	jrne	L1254
10048                     ; 1713 				Set_LCD_Address(LCD_Line[0]);
10050  1f49 c60000        	ld	a,_LCD_Line
10051  1f4c cd0000        	call	_Set_LCD_Address
10053                     ; 1714 				Display_LCD_String("Normal");
10055  1f4f ae0183        	ldw	x,#L3504
10056  1f52 cd0000        	call	_Display_LCD_String
10058  1f55               L1254:
10059                     ; 1719 	if((b_Com_On_flag == ON)){
10061  1f55 c6000d        	ld	a,_uc_Test_Ctrl_Reg
10062  1f58 a508          	bcp	a,#8
10063  1f5a 270d          	jreq	L3005
10064                     ; 1720 		Set_LCD_Address((unsigned char)(0x00+15));
10066  1f5c a60f          	ld	a,#15
10067  1f5e cd0000        	call	_Set_LCD_Address
10069                     ; 1723 		Display_LCD_String("Y");	// YJS 20230314
10071  1f61 ae0181        	ldw	x,#L7504
10072  1f64 cd0000        	call	_Display_LCD_String
10075  1f67 200b          	jra	L5005
10076  1f69               L3005:
10077                     ; 1725 		Set_LCD_Address((unsigned char)(0x00+15));
10079  1f69 a60f          	ld	a,#15
10080  1f6b cd0000        	call	_Set_LCD_Address
10082                     ; 1726 		Display_LCD_String("N");
10084  1f6e ae0244        	ldw	x,#L5543
10085  1f71 cd0000        	call	_Display_LCD_String
10087  1f74               L5005:
10088                     ; 1729 	return;
10089  1f74               L261:
10092  1f74 5b16          	addw	sp,#22
10093  1f76 81            	ret
10185                     ; 1732 static CV_Ctrl_LCD_Display_Control(void)
10185                     ; 1733 {
10186                     	switch	.text
10187  1f77               L7005_CV_Ctrl_LCD_Display_Control:
10189  1f77 5216          	subw	sp,#22
10190       00000016      OFST:	set	22
10193                     ; 1740 	if (HEATER_zone_status==HTR_ZONE_1)
10195  1f79 725d0000      	tnz	_HEATER_zone_status
10196  1f7d 263a          	jrne	L3405
10197                     ; 1742 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
10199  1f7f 0f16          	clr	(OFST+0,sp)
10201  1f81               L5405:
10202                     ; 1744 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
10204  1f81 96            	ldw	x,sp
10205  1f82 1c000d        	addw	x,#OFST-9
10206  1f85 9f            	ld	a,xl
10207  1f86 5e            	swapw	x
10208  1f87 1b16          	add	a,(OFST+0,sp)
10209  1f89 2401          	jrnc	L622
10210  1f8b 5c            	incw	x
10211  1f8c               L622:
10212  1f8c 02            	rlwa	x,a
10213  1f8d 7b16          	ld	a,(OFST+0,sp)
10214  1f8f 905f          	clrw	y
10215  1f91 9097          	ld	yl,a
10216  1f93 90d60008      	ld	a,(_uc_Rx_Data+8,y)
10217  1f97 f7            	ld	(x),a
10218                     ; 1745 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
10220  1f98 96            	ldw	x,sp
10221  1f99 1c0003        	addw	x,#OFST-19
10222  1f9c 9f            	ld	a,xl
10223  1f9d 5e            	swapw	x
10224  1f9e 1b16          	add	a,(OFST+0,sp)
10225  1fa0 2401          	jrnc	L032
10226  1fa2 5c            	incw	x
10227  1fa3               L032:
10228  1fa3 02            	rlwa	x,a
10229  1fa4 7b16          	ld	a,(OFST+0,sp)
10230  1fa6 905f          	clrw	y
10231  1fa8 9097          	ld	yl,a
10232  1faa 90d60018      	ld	a,(_uc_Rx_Data+24,y)
10233  1fae f7            	ld	(x),a
10234                     ; 1742 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
10236  1faf 0c16          	inc	(OFST+0,sp)
10240  1fb1 7b16          	ld	a,(OFST+0,sp)
10241  1fb3 a108          	cp	a,#8
10242  1fb5 25ca          	jrult	L5405
10244  1fb7 2038          	jra	L3505
10245  1fb9               L3405:
10246                     ; 1750 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
10248  1fb9 0f16          	clr	(OFST+0,sp)
10250  1fbb               L5505:
10251                     ; 1752 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
10253  1fbb 96            	ldw	x,sp
10254  1fbc 1c000d        	addw	x,#OFST-9
10255  1fbf 9f            	ld	a,xl
10256  1fc0 5e            	swapw	x
10257  1fc1 1b16          	add	a,(OFST+0,sp)
10258  1fc3 2401          	jrnc	L232
10259  1fc5 5c            	incw	x
10260  1fc6               L232:
10261  1fc6 02            	rlwa	x,a
10262  1fc7 7b16          	ld	a,(OFST+0,sp)
10263  1fc9 905f          	clrw	y
10264  1fcb 9097          	ld	yl,a
10265  1fcd 90d60010      	ld	a,(_uc_Rx_Data+16,y)
10266  1fd1 f7            	ld	(x),a
10267                     ; 1753 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
10269  1fd2 96            	ldw	x,sp
10270  1fd3 1c0003        	addw	x,#OFST-19
10271  1fd6 9f            	ld	a,xl
10272  1fd7 5e            	swapw	x
10273  1fd8 1b16          	add	a,(OFST+0,sp)
10274  1fda 2401          	jrnc	L432
10275  1fdc 5c            	incw	x
10276  1fdd               L432:
10277  1fdd 02            	rlwa	x,a
10278  1fde 7b16          	ld	a,(OFST+0,sp)
10279  1fe0 905f          	clrw	y
10280  1fe2 9097          	ld	yl,a
10281  1fe4 90d60018      	ld	a,(_uc_Rx_Data+24,y)
10282  1fe8 f7            	ld	(x),a
10283                     ; 1750 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
10285  1fe9 0c16          	inc	(OFST+0,sp)
10289  1feb 7b16          	ld	a,(OFST+0,sp)
10290  1fed a108          	cp	a,#8
10291  1fef 25ca          	jrult	L5505
10292  1ff1               L3505:
10293                     ; 1756 	if(b_Test_Option_flag == ON){
10295  1ff1 c6000d        	ld	a,_uc_Test_Ctrl_Reg
10296  1ff4 a510          	bcp	a,#16
10297  1ff6 2779          	jreq	L3605
10298                     ; 1757 		Set_LCD_Address(LCD_Line[0]);
10300  1ff8 c60000        	ld	a,_LCD_Line
10301  1ffb cd0000        	call	_Set_LCD_Address
10303                     ; 1758 		Display_LCD_String("*OPTION*");
10305  1ffe ae02aa        	ldw	x,#L7603
10306  2001 cd0000        	call	_Display_LCD_String
10308                     ; 1760 		if(uc_Target_Display_Mode == (U8)(0)){
10310  2004 725d0000      	tnz	_uc_Target_Display_Mode
10311  2008 260e          	jrne	L5605
10312                     ; 1761 			Set_LCD_Address(LCD_Line[1]);
10314  200a c60001        	ld	a,_LCD_Line+1
10315  200d cd0000        	call	_Set_LCD_Address
10317                     ; 1762 			Display_LCD_String("*Target Perc");
10319  2010 ae029d        	ldw	x,#L3703
10320  2013 cd0000        	call	_Display_LCD_String
10323  2016 200c          	jra	L7605
10324  2018               L5605:
10325                     ; 1765 			Set_LCD_Address(LCD_Line[1]);
10327  2018 c60001        	ld	a,_LCD_Line+1
10328  201b cd0000        	call	_Set_LCD_Address
10330                     ; 1766 			Display_LCD_String("*Target Watt(OS)");
10332  201e ae028c        	ldw	x,#L7703
10333  2021 cd0000        	call	_Display_LCD_String
10335  2024               L7605:
10336                     ; 1769 		Set_LCD_Address(LCD_Line[2]);
10338  2024 c60002        	ld	a,_LCD_Line+2
10339  2027 cd0000        	call	_Set_LCD_Address
10341                     ; 1770 		Display_LCD_String("D_Unit:");
10343  202a ae0284        	ldw	x,#L1013
10344  202d cd0000        	call	_Display_LCD_String
10346                     ; 1772 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
10348  2030 c60002        	ld	a,_LCD_Line+2
10349  2033 ab07          	add	a,#7
10350  2035 cd0000        	call	_Set_LCD_Address
10352                     ; 1773 		if(b_Blink_250_Flag){
10354  2038 c60000        	ld	a,_uc_LCD_Blink_Reg
10355  203b a502          	bcp	a,#2
10356  203d 272e          	jreq	L1705
10357                     ; 1774 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
10359  203f c60001        	ld	a,_uc_Perc_Unit
10360  2042 5f            	clrw	x
10361  2043 97            	ld	xl,a
10362  2044 57            	sraw	x
10363  2045 cd0000        	call	_Num_Display_LCD
10365                     ; 1775 			Display_LCD_String(".");
10367  2048 ae0282        	ldw	x,#L5013
10368  204b cd0000        	call	_Display_LCD_String
10370                     ; 1776 			uc_buffer = uc_Perc_Unit %(U8)(2);
10372  204e c60001        	ld	a,_uc_Perc_Unit
10373  2051 a401          	and	a,#1
10374  2053 6b16          	ld	(OFST+0,sp),a
10376                     ; 1777 			if(uc_buffer){ Display_LCD_String("5"); }
10378  2055 0d16          	tnz	(OFST+0,sp)
10379  2057 2708          	jreq	L3705
10382  2059 ae0280        	ldw	x,#L1113
10383  205c cd0000        	call	_Display_LCD_String
10386  205f 2006          	jra	L5705
10387  2061               L3705:
10388                     ; 1778 			else{ Display_LCD_String("0"); }
10390  2061 ae027e        	ldw	x,#L5113
10391  2064 cd0000        	call	_Display_LCD_String
10393  2067               L5705:
10394                     ; 1779 			Display_LCD_String("%");
10396  2067 ae027c        	ldw	x,#L7113
10397  206a cd0000        	call	_Display_LCD_String
10399  206d               L1705:
10400                     ; 1781 		return;
10402  206d ac932a93      	jpf	L042
10403  2071               L3605:
10404                     ; 1784 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
10406  2071 c60004        	ld	a,_uc_Test_Page_Now
10407  2074 c10003        	cp	a,_uc_Test_Page_Pre
10408  2077 270f          	jreq	L7705
10409                     ; 1785 		Test_Ctrl_Text_Display_Handling(); 
10411  2079 cd07ec        	call	_Test_Ctrl_Text_Display_Handling
10413                     ; 1786 		b_Data_Select_flag = OFF;
10415  207c 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
10416                     ; 1787 		b_Data_Setting_flag = OFF;
10418  2080 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
10419                     ; 1788 		uc_Test_Data_Select_Num = (U8)(0);
10421  2084 725f0002      	clr	_uc_Test_Data_Select_Num
10422  2088               L7705:
10423                     ; 1790 	uc_Test_Page_Pre = uc_Test_Page_Now ;
10425  2088 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
10426                     ; 1793 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
10428  208d 725d0004      	tnz	_uc_Test_Page_Now
10429  2091 2703          	jreq	L242
10430  2093 cc2608        	jp	L1015
10431  2096               L242:
10432                     ; 1794 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
10434  2096 0f15          	clr	(OFST-1,sp)
10436  2098               L3015:
10437                     ; 1796 			Set_LCD_Address(LCD_Line[uc_line_index]);
10439  2098 7b15          	ld	a,(OFST-1,sp)
10440  209a 5f            	clrw	x
10441  209b 97            	ld	xl,a
10442  209c d60000        	ld	a,(_LCD_Line,x)
10443  209f cd0000        	call	_Set_LCD_Address
10445                     ; 1798 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
10447  20a2 c6000d        	ld	a,_uc_Test_Ctrl_Reg
10448  20a5 a502          	bcp	a,#2
10449  20a7 2763          	jreq	L1115
10451  20a9 c6000d        	ld	a,_uc_Test_Ctrl_Reg
10452  20ac a504          	bcp	a,#4
10453  20ae 265c          	jrne	L1115
10454                     ; 1799 				if(uc_line_index == uc_Test_Data_Select_Num){ 
10456  20b0 7b15          	ld	a,(OFST-1,sp)
10457  20b2 c10002        	cp	a,_uc_Test_Data_Select_Num
10458  20b5 2647          	jrne	L3115
10459                     ; 1800 					if(uc_Test_Data_Select_Num == (U8)(0)){
10461  20b7 725d0002      	tnz	_uc_Test_Data_Select_Num
10462  20bb 261d          	jrne	L5115
10463                     ; 1801 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
10465  20bd c60000        	ld	a,_uc_LCD_Blink_Reg
10466  20c0 a502          	bcp	a,#2
10467  20c2 270e          	jreq	L7115
10470  20c4 7b15          	ld	a,(OFST-1,sp)
10471  20c6 97            	ld	xl,a
10472  20c7 a610          	ld	a,#16
10473  20c9 42            	mul	x,a
10474  20ca 1c0000        	addw	x,#_LCD_Dis_Data
10475  20cd cd0000        	call	_Display_LCD_String
10478  20d0 2046          	jra	L5315
10479  20d2               L7115:
10480                     ; 1802 						else{ Display_LCD_String("        /"); }
10482  20d2 ae0272        	ldw	x,#L5413
10483  20d5 cd0000        	call	_Display_LCD_String
10485  20d8 203e          	jra	L5315
10486  20da               L5115:
10487                     ; 1804 					else if(uc_Test_Data_Select_Num == (U8)(1)){
10489  20da c60002        	ld	a,_uc_Test_Data_Select_Num
10490  20dd a101          	cp	a,#1
10491  20df 2637          	jrne	L5315
10492                     ; 1805 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
10494  20e1 c60000        	ld	a,_uc_LCD_Blink_Reg
10495  20e4 a502          	bcp	a,#2
10496  20e6 270e          	jreq	L7215
10499  20e8 7b15          	ld	a,(OFST-1,sp)
10500  20ea 97            	ld	xl,a
10501  20eb a610          	ld	a,#16
10502  20ed 42            	mul	x,a
10503  20ee 1c0000        	addw	x,#_LCD_Dis_Data
10504  20f1 cd0000        	call	_Display_LCD_String
10507  20f4 2022          	jra	L5315
10508  20f6               L7215:
10509                     ; 1806 						else{ Display_LCD_String("        Fd:"); }
10511  20f6 ae0266        	ldw	x,#L7513
10512  20f9 cd0000        	call	_Display_LCD_String
10514  20fc 201a          	jra	L5315
10515  20fe               L3115:
10516                     ; 1809 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
10518  20fe 7b15          	ld	a,(OFST-1,sp)
10519  2100 97            	ld	xl,a
10520  2101 a610          	ld	a,#16
10521  2103 42            	mul	x,a
10522  2104 1c0000        	addw	x,#_LCD_Dis_Data
10523  2107 cd0000        	call	_Display_LCD_String
10525  210a 200c          	jra	L5315
10526  210c               L1115:
10527                     ; 1810 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
10529  210c 7b15          	ld	a,(OFST-1,sp)
10530  210e 97            	ld	xl,a
10531  210f a610          	ld	a,#16
10532  2111 42            	mul	x,a
10533  2112 1c0000        	addw	x,#_LCD_Dis_Data
10534  2115 cd0000        	call	_Display_LCD_String
10536  2118               L5315:
10537                     ; 1813 			if(uc_line_index == (U8)(0)){		// LINE 1
10539  2118 0d15          	tnz	(OFST-1,sp)
10540  211a 2703          	jreq	L442
10541  211c cc21d8        	jp	L7315
10542  211f               L442:
10543                     ; 1816 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
10545  211f 7b15          	ld	a,(OFST-1,sp)
10546  2121 5f            	clrw	x
10547  2122 97            	ld	xl,a
10548  2123 d60000        	ld	a,(_LCD_Line,x)
10549  2126 ab03          	add	a,#3
10550  2128 cd0000        	call	_Set_LCD_Address
10552                     ; 1818 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
10554  212b c6000d        	ld	a,_uc_Test_Ctrl_Reg
10555  212e a504          	bcp	a,#4
10556  2130 2718          	jreq	L1415
10558  2132 7b15          	ld	a,(OFST-1,sp)
10559  2134 c10002        	cp	a,_uc_Test_Data_Select_Num
10560  2137 2611          	jrne	L1415
10561                     ; 1819 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
10563  2139 c60000        	ld	a,_uc_LCD_Blink_Reg
10564  213c a502          	bcp	a,#2
10565  213e 2712          	jreq	L5415
10568  2140 c60009        	ld	a,_uc_Heater_Enable_Flag
10569  2143 5f            	clrw	x
10570  2144 97            	ld	xl,a
10571  2145 cd0000        	call	_Num_Display_LCD
10573  2148 2008          	jra	L5415
10574  214a               L1415:
10575                     ; 1820 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
10577  214a c60009        	ld	a,_uc_Heater_Enable_Flag
10578  214d 5f            	clrw	x
10579  214e 97            	ld	xl,a
10580  214f cd0000        	call	_Num_Display_LCD
10582  2152               L5415:
10583                     ; 1824 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
10585  2152 7b15          	ld	a,(OFST-1,sp)
10586  2154 5f            	clrw	x
10587  2155 97            	ld	xl,a
10588  2156 d60000        	ld	a,(_LCD_Line,x)
10589  2159 ab05          	add	a,#5
10590  215b cd0000        	call	_Set_LCD_Address
10592                     ; 1825 				if (HEATER_zone_status == HTR_ZONE_1)
10594  215e 725d0000      	tnz	_HEATER_zone_status
10595  2162 2608          	jrne	L7415
10596                     ; 1826 				Display_LCD_String("Z1");
10598  2164 ae0263        	ldw	x,#L7713
10599  2167 cd0000        	call	_Display_LCD_String
10602  216a 2006          	jra	L1515
10603  216c               L7415:
10604                     ; 1827 				else Display_LCD_String("Z2");
10606  216c ae0260        	ldw	x,#L3023
10607  216f cd0000        	call	_Display_LCD_String
10609  2172               L1515:
10610                     ; 1829 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
10612  2172 7b15          	ld	a,(OFST-1,sp)
10613  2174 5f            	clrw	x
10614  2175 97            	ld	xl,a
10615  2176 d60000        	ld	a,(_LCD_Line,x)
10616  2179 ab09          	add	a,#9
10617  217b cd0000        	call	_Set_LCD_Address
10619                     ; 1831 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
10621  217e c6000c        	ld	a,_uc_Rx_TimeOut_Reg
10622  2181 a501          	bcp	a,#1
10623  2183 270a          	jreq	L3515
10626  2185 ae025d        	ldw	x,#L7023
10627  2188 cd0000        	call	_Display_LCD_String
10630  218b acf925f9      	jpf	L5715
10631  218f               L3515:
10632                     ; 1833 					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
10634  218f 7b0d          	ld	a,(OFST-9,sp)
10635  2191 44            	srl	a
10636  2192 44            	srl	a
10637  2193 a403          	and	a,#3
10638  2195 6b16          	ld	(OFST+0,sp),a
10640                     ; 1834 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
10642  2197 0d16          	tnz	(OFST+0,sp)
10643  2199 260a          	jrne	L7515
10646  219b ae0258        	ldw	x,#L5123
10647  219e cd0000        	call	_Display_LCD_String
10650  21a1 acf925f9      	jpf	L5715
10651  21a5               L7515:
10652                     ; 1835 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
10654  21a5 7b16          	ld	a,(OFST+0,sp)
10655  21a7 a101          	cp	a,#1
10656  21a9 260a          	jrne	L3615
10659  21ab ae0253        	ldw	x,#L3223
10660  21ae cd0000        	call	_Display_LCD_String
10663  21b1 acf925f9      	jpf	L5715
10664  21b5               L3615:
10665                     ; 1836 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
10667  21b5 7b16          	ld	a,(OFST+0,sp)
10668  21b7 a102          	cp	a,#2
10669  21b9 260a          	jrne	L7615
10672  21bb ae024f        	ldw	x,#L1323
10673  21be cd0000        	call	_Display_LCD_String
10676  21c1 acf925f9      	jpf	L5715
10677  21c5               L7615:
10678                     ; 1837 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
10680  21c5 7b16          	ld	a,(OFST+0,sp)
10681  21c7 a103          	cp	a,#3
10682  21c9 2703          	jreq	L642
10683  21cb cc25f9        	jp	L5715
10684  21ce               L642:
10687  21ce ae024a        	ldw	x,#L7323
10688  21d1 cd0000        	call	_Display_LCD_String
10690  21d4 acf925f9      	jpf	L5715
10691  21d8               L7315:
10692                     ; 1843 			else if(uc_line_index == (U8)(1)){	// LINE 2
10694  21d8 7b15          	ld	a,(OFST-1,sp)
10695  21da a101          	cp	a,#1
10696  21dc 2703          	jreq	L052
10697  21de cc24ed        	jp	L7715
10698  21e1               L052:
10699                     ; 1846 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
10701  21e1 7b15          	ld	a,(OFST-1,sp)
10702  21e3 5f            	clrw	x
10703  21e4 97            	ld	xl,a
10704  21e5 d60000        	ld	a,(_LCD_Line,x)
10705  21e8 ab03          	add	a,#3
10706  21ea cd0000        	call	_Set_LCD_Address
10708                     ; 1847 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
10710  21ed c6000d        	ld	a,_uc_Test_Ctrl_Reg
10711  21f0 a504          	bcp	a,#4
10712  21f2 2603          	jrne	L252
10713  21f4 cc235b        	jp	L1025
10714  21f7               L252:
10716  21f7 7b15          	ld	a,(OFST-1,sp)
10717  21f9 c10002        	cp	a,_uc_Test_Data_Select_Num
10718  21fc 2703          	jreq	L452
10719  21fe cc235b        	jp	L1025
10720  2201               L452:
10721                     ; 1848 					if(b_Blink_250_Flag){
10723  2201 c60000        	ld	a,_uc_LCD_Blink_Reg
10724  2204 a502          	bcp	a,#2
10725  2206 2603          	jrne	L652
10726  2208 cc249b        	jp	L5725
10727  220b               L652:
10728                     ; 1849 						if(!uc_Target_Display_Mode){	// Percentage_Display
10730  220b 725d0000      	tnz	_uc_Target_Display_Mode
10731  220f 2676          	jrne	L5025
10732                     ; 1850 if (HEATER_zone_status == HTR_ZONE_1)
10734  2211 725d0000      	tnz	_HEATER_zone_status
10735  2215 2638          	jrne	L7025
10736                     ; 1852 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
10738  2217 c6000a        	ld	a,_uc_Target_Duty_Perc
10739  221a 5f            	clrw	x
10740  221b 97            	ld	xl,a
10741  221c 57            	sraw	x
10742  221d cd0000        	call	_Num_Display_LCD
10744                     ; 1853 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
10746  2220 c6000a        	ld	a,_uc_Target_Duty_Perc
10747  2223 a1c8          	cp	a,#200
10748  2225 2503          	jrult	L062
10749  2227 cc249b        	jp	L5725
10750  222a               L062:
10751                     ; 1854 								Display_LCD_String(".");
10753  222a ae0282        	ldw	x,#L5013
10754  222d cd0000        	call	_Display_LCD_String
10756                     ; 1855 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
10758  2230 c6000a        	ld	a,_uc_Target_Duty_Perc
10759  2233 a401          	and	a,#1
10760  2235 6b16          	ld	(OFST+0,sp),a
10762                     ; 1856 								if(uc_buffer){ Display_LCD_String("5"); }
10764  2237 0d16          	tnz	(OFST+0,sp)
10765  2239 270a          	jreq	L3125
10768  223b ae0280        	ldw	x,#L1113
10769  223e cd0000        	call	_Display_LCD_String
10772  2241 ac9b249b      	jpf	L5725
10773  2245               L3125:
10774                     ; 1857 								else{ Display_LCD_String("0"); }
10776  2245 ae027e        	ldw	x,#L5113
10777  2248 cd0000        	call	_Display_LCD_String
10779  224b ac9b249b      	jpf	L5725
10780  224f               L7025:
10781                     ; 1862 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
10783  224f c6000b        	ld	a,_uc_Target_Duty_Perc+1
10784  2252 5f            	clrw	x
10785  2253 97            	ld	xl,a
10786  2254 57            	sraw	x
10787  2255 cd0000        	call	_Num_Display_LCD
10789                     ; 1863 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
10791  2258 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10792  225b a1c8          	cp	a,#200
10793  225d 2503          	jrult	L262
10794  225f cc249b        	jp	L5725
10795  2262               L262:
10796                     ; 1864 								Display_LCD_String(".");
10798  2262 ae0282        	ldw	x,#L5013
10799  2265 cd0000        	call	_Display_LCD_String
10801                     ; 1865 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
10803  2268 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10804  226b a401          	and	a,#1
10805  226d 6b16          	ld	(OFST+0,sp),a
10807                     ; 1866 								if(uc_buffer){ Display_LCD_String("5"); }
10809  226f 0d16          	tnz	(OFST+0,sp)
10810  2271 270a          	jreq	L3225
10813  2273 ae0280        	ldw	x,#L1113
10814  2276 cd0000        	call	_Display_LCD_String
10817  2279 ac9b249b      	jpf	L5725
10818  227d               L3225:
10819                     ; 1867 								else{ Display_LCD_String("0"); }
10821  227d ae027e        	ldw	x,#L5113
10822  2280 cd0000        	call	_Display_LCD_String
10824  2283 ac9b249b      	jpf	L5725
10825  2287               L5025:
10826                     ; 1872 if (HEATER_zone_status == HTR_ZONE_1)
10828  2287 725d0000      	tnz	_HEATER_zone_status
10829  228b 2667          	jrne	L1325
10830                     ; 1874 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
10832  228d c6000a        	ld	a,_uc_Target_Duty_Perc
10833  2290 a114          	cp	a,#20
10834  2292 2408          	jruge	L3325
10837  2294 5f            	clrw	x
10838  2295 cd0000        	call	_Num_Display_LCD
10841  2298 ac9b249b      	jpf	L5725
10842  229c               L3325:
10843                     ; 1875 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
10845  229c c6000a        	ld	a,_uc_Target_Duty_Perc
10846  229f a114          	cp	a,#20
10847  22a1 260a          	jrne	L7325
10850  22a3 ae0064        	ldw	x,#100
10851  22a6 cd0000        	call	_Num_Display_LCD
10854  22a9 ac9b249b      	jpf	L5725
10855  22ad               L7325:
10856                     ; 1876 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
10858  22ad c6000a        	ld	a,_uc_Target_Duty_Perc
10859  22b0 a1b4          	cp	a,#180
10860  22b2 260a          	jrne	L3425
10863  22b4 ae1838        	ldw	x,#6200
10864  22b7 cd0000        	call	_Num_Display_LCD
10867  22ba ac9b249b      	jpf	L5725
10868  22be               L3425:
10869                     ; 1877 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
10871  22be c6000a        	ld	a,_uc_Target_Duty_Perc
10872  22c1 a1be          	cp	a,#190
10873  22c3 260a          	jrne	L7425
10876  22c5 ae0246        	ldw	x,#L5133
10877  22c8 cd0000        	call	_Display_LCD_String
10880  22cb ac9b249b      	jpf	L5725
10881  22cf               L7425:
10882                     ; 1878 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
10884  22cf c6000a        	ld	a,_uc_Target_Duty_Perc
10885  22d2 5f            	clrw	x
10886  22d3 97            	ld	xl,a
10887  22d4 1d0014        	subw	x,#20
10888  22d7 90ae94ed      	ldw	y,#38125
10889  22db cd0000        	call	c_umul
10891  22de ae0000        	ldw	x,#L001
10892  22e1 cd0000        	call	c_ludv
10894  22e4 be02          	ldw	x,c_lreg+2
10895  22e6 1c0064        	addw	x,#100
10896  22e9 1f0b          	ldw	(OFST-11,sp),x
10900  22eb 1e0b          	ldw	x,(OFST-11,sp)
10901  22ed cd0000        	call	_Num_Display_LCD
10903  22f0 ac9b249b      	jpf	L5725
10904  22f4               L1325:
10905                     ; 1882 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
10907  22f4 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10908  22f7 a114          	cp	a,#20
10909  22f9 2408          	jruge	L5525
10912  22fb 5f            	clrw	x
10913  22fc cd0000        	call	_Num_Display_LCD
10916  22ff ac9b249b      	jpf	L5725
10917  2303               L5525:
10918                     ; 1883 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
10920  2303 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10921  2306 a114          	cp	a,#20
10922  2308 260a          	jrne	L1625
10925  230a ae0064        	ldw	x,#100
10926  230d cd0000        	call	_Num_Display_LCD
10929  2310 ac9b249b      	jpf	L5725
10930  2314               L1625:
10931                     ; 1884 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
10933  2314 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10934  2317 a1b4          	cp	a,#180
10935  2319 260a          	jrne	L5625
10938  231b ae1838        	ldw	x,#6200
10939  231e cd0000        	call	_Num_Display_LCD
10942  2321 ac9b249b      	jpf	L5725
10943  2325               L5625:
10944                     ; 1885 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
10946  2325 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10947  2328 a1be          	cp	a,#190
10948  232a 260a          	jrne	L1725
10951  232c ae0246        	ldw	x,#L5133
10952  232f cd0000        	call	_Display_LCD_String
10955  2332 ac9b249b      	jpf	L5725
10956  2336               L1725:
10957                     ; 1886 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
10959  2336 c6000b        	ld	a,_uc_Target_Duty_Perc+1
10960  2339 5f            	clrw	x
10961  233a 97            	ld	xl,a
10962  233b 1d0014        	subw	x,#20
10963  233e 90ae94ed      	ldw	y,#38125
10964  2342 cd0000        	call	c_umul
10966  2345 ae0000        	ldw	x,#L001
10967  2348 cd0000        	call	c_ludv
10969  234b be02          	ldw	x,c_lreg+2
10970  234d 1c0064        	addw	x,#100
10971  2350 1f0b          	ldw	(OFST-11,sp),x
10975  2352 1e0b          	ldw	x,(OFST-11,sp)
10976  2354 cd0000        	call	_Num_Display_LCD
10978  2357 ac9b249b      	jpf	L5725
10979  235b               L1025:
10980                     ; 1891 					if(!uc_Target_Display_Mode){
10982  235b 725d0000      	tnz	_uc_Target_Display_Mode
10983  235f 2676          	jrne	L7725
10984                     ; 1892 if (HEATER_zone_status == HTR_ZONE_1)
10986  2361 725d0000      	tnz	_HEATER_zone_status
10987  2365 2638          	jrne	L1035
10988                     ; 1894 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
10990  2367 c6000a        	ld	a,_uc_Target_Duty_Perc
10991  236a 5f            	clrw	x
10992  236b 97            	ld	xl,a
10993  236c 57            	sraw	x
10994  236d cd0000        	call	_Num_Display_LCD
10996                     ; 1895 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
10998  2370 c6000a        	ld	a,_uc_Target_Duty_Perc
10999  2373 a1c8          	cp	a,#200
11000  2375 2503          	jrult	L462
11001  2377 cc249b        	jp	L5725
11002  237a               L462:
11003                     ; 1896 							Display_LCD_String(".");
11005  237a ae0282        	ldw	x,#L5013
11006  237d cd0000        	call	_Display_LCD_String
11008                     ; 1897 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
11010  2380 c6000a        	ld	a,_uc_Target_Duty_Perc
11011  2383 a401          	and	a,#1
11012  2385 6b16          	ld	(OFST+0,sp),a
11014                     ; 1898 							if(uc_buffer){ Display_LCD_String("5"); }
11016  2387 0d16          	tnz	(OFST+0,sp)
11017  2389 270a          	jreq	L5035
11020  238b ae0280        	ldw	x,#L1113
11021  238e cd0000        	call	_Display_LCD_String
11024  2391 ac9b249b      	jpf	L5725
11025  2395               L5035:
11026                     ; 1899 							else{ Display_LCD_String("0"); }
11028  2395 ae027e        	ldw	x,#L5113
11029  2398 cd0000        	call	_Display_LCD_String
11031  239b ac9b249b      	jpf	L5725
11032  239f               L1035:
11033                     ; 1904 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
11035  239f c6000b        	ld	a,_uc_Target_Duty_Perc+1
11036  23a2 5f            	clrw	x
11037  23a3 97            	ld	xl,a
11038  23a4 57            	sraw	x
11039  23a5 cd0000        	call	_Num_Display_LCD
11041                     ; 1905 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
11043  23a8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
11044  23ab a1c8          	cp	a,#200
11045  23ad 2503          	jrult	L662
11046  23af cc249b        	jp	L5725
11047  23b2               L662:
11048                     ; 1906 							Display_LCD_String(".");
11050  23b2 ae0282        	ldw	x,#L5013
11051  23b5 cd0000        	call	_Display_LCD_String
11053                     ; 1907 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
11055  23b8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
11056  23bb a401          	and	a,#1
11057  23bd 6b16          	ld	(OFST+0,sp),a
11059                     ; 1908 							if(uc_buffer){ Display_LCD_String("5"); }
11061  23bf 0d16          	tnz	(OFST+0,sp)
11062  23c1 270a          	jreq	L5135
11065  23c3 ae0280        	ldw	x,#L1113
11066  23c6 cd0000        	call	_Display_LCD_String
11069  23c9 ac9b249b      	jpf	L5725
11070  23cd               L5135:
11071                     ; 1909 							else{ Display_LCD_String("0"); }
11073  23cd ae027e        	ldw	x,#L5113
11074  23d0 cd0000        	call	_Display_LCD_String
11076  23d3 ac9b249b      	jpf	L5725
11077  23d7               L7725:
11078                     ; 1914 if (HEATER_zone_status == HTR_ZONE_1)
11080  23d7 725d0000      	tnz	_HEATER_zone_status
11081  23db 2663          	jrne	L3235
11082                     ; 1916 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
11084  23dd c6000a        	ld	a,_uc_Target_Duty_Perc
11085  23e0 a114          	cp	a,#20
11086  23e2 2408          	jruge	L5235
11089  23e4 5f            	clrw	x
11090  23e5 cd0000        	call	_Num_Display_LCD
11093  23e8 ac9b249b      	jpf	L5725
11094  23ec               L5235:
11095                     ; 1917 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
11097  23ec c6000a        	ld	a,_uc_Target_Duty_Perc
11098  23ef a114          	cp	a,#20
11099  23f1 260a          	jrne	L1335
11102  23f3 ae0064        	ldw	x,#100
11103  23f6 cd0000        	call	_Num_Display_LCD
11106  23f9 ac9b249b      	jpf	L5725
11107  23fd               L1335:
11108                     ; 1918 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
11110  23fd c6000a        	ld	a,_uc_Target_Duty_Perc
11111  2400 a1b4          	cp	a,#180
11112  2402 260a          	jrne	L5335
11115  2404 ae1838        	ldw	x,#6200
11116  2407 cd0000        	call	_Num_Display_LCD
11119  240a ac9b249b      	jpf	L5725
11120  240e               L5335:
11121                     ; 1919 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
11123  240e c6000a        	ld	a,_uc_Target_Duty_Perc
11124  2411 a1b5          	cp	a,#181
11125  2413 2508          	jrult	L1435
11128  2415 ae0246        	ldw	x,#L5133
11129  2418 cd0000        	call	_Display_LCD_String
11132  241b 207e          	jra	L5725
11133  241d               L1435:
11134                     ; 1920 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
11136  241d c6000a        	ld	a,_uc_Target_Duty_Perc
11137  2420 5f            	clrw	x
11138  2421 97            	ld	xl,a
11139  2422 1d0014        	subw	x,#20
11140  2425 90ae94ed      	ldw	y,#38125
11141  2429 cd0000        	call	c_umul
11143  242c ae0000        	ldw	x,#L001
11144  242f cd0000        	call	c_ludv
11146  2432 be02          	ldw	x,c_lreg+2
11147  2434 1c0064        	addw	x,#100
11148  2437 1f0b          	ldw	(OFST-11,sp),x
11152  2439 1e0b          	ldw	x,(OFST-11,sp)
11153  243b cd0000        	call	_Num_Display_LCD
11155  243e 205b          	jra	L5725
11156  2440               L3235:
11157                     ; 1924 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
11159  2440 c6000b        	ld	a,_uc_Target_Duty_Perc+1
11160  2443 a114          	cp	a,#20
11161  2445 2406          	jruge	L7435
11164  2447 5f            	clrw	x
11165  2448 cd0000        	call	_Num_Display_LCD
11168  244b 204e          	jra	L5725
11169  244d               L7435:
11170                     ; 1925 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
11172  244d c6000b        	ld	a,_uc_Target_Duty_Perc+1
11173  2450 a114          	cp	a,#20
11174  2452 2608          	jrne	L3535
11177  2454 ae0064        	ldw	x,#100
11178  2457 cd0000        	call	_Num_Display_LCD
11181  245a 203f          	jra	L5725
11182  245c               L3535:
11183                     ; 1926 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
11185  245c c6000b        	ld	a,_uc_Target_Duty_Perc+1
11186  245f a1b4          	cp	a,#180
11187  2461 2608          	jrne	L7535
11190  2463 ae1838        	ldw	x,#6200
11191  2466 cd0000        	call	_Num_Display_LCD
11194  2469 2030          	jra	L5725
11195  246b               L7535:
11196                     ; 1927 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
11198  246b c6000b        	ld	a,_uc_Target_Duty_Perc+1
11199  246e a1b5          	cp	a,#181
11200  2470 2508          	jrult	L3635
11203  2472 ae0246        	ldw	x,#L5133
11204  2475 cd0000        	call	_Display_LCD_String
11207  2478 2021          	jra	L5725
11208  247a               L3635:
11209                     ; 1928 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
11211  247a c6000b        	ld	a,_uc_Target_Duty_Perc+1
11212  247d 5f            	clrw	x
11213  247e 97            	ld	xl,a
11214  247f 1d0014        	subw	x,#20
11215  2482 90ae94ed      	ldw	y,#38125
11216  2486 cd0000        	call	c_umul
11218  2489 ae0000        	ldw	x,#L001
11219  248c cd0000        	call	c_ludv
11221  248f be02          	ldw	x,c_lreg+2
11222  2491 1c0064        	addw	x,#100
11223  2494 1f0b          	ldw	(OFST-11,sp),x
11227  2496 1e0b          	ldw	x,(OFST-11,sp)
11228  2498 cd0000        	call	_Num_Display_LCD
11230  249b               L5725:
11231                     ; 1934 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
11233  249b 7b15          	ld	a,(OFST-1,sp)
11234  249d 5f            	clrw	x
11235  249e 97            	ld	xl,a
11236  249f d60000        	ld	a,(_LCD_Line,x)
11237  24a2 ab0b          	add	a,#11
11238  24a4 cd0000        	call	_Set_LCD_Address
11240                     ; 1935 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11242  24a7 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11243  24aa a501          	bcp	a,#1
11244  24ac 270a          	jreq	L7635
11247  24ae ae025d        	ldw	x,#L7023
11248  24b1 cd0000        	call	_Display_LCD_String
11251  24b4 acf925f9      	jpf	L5715
11252  24b8               L7635:
11253                     ; 1937 					Num_Display_LCD(can_data[4] /(U8)(2));
11255  24b8 7b11          	ld	a,(OFST-5,sp)
11256  24ba 5f            	clrw	x
11257  24bb 97            	ld	xl,a
11258  24bc 57            	sraw	x
11259  24bd cd0000        	call	_Num_Display_LCD
11261                     ; 1938 					if(can_data[6] < (U8)(200)){
11263  24c0 7b13          	ld	a,(OFST-3,sp)
11264  24c2 a1c8          	cp	a,#200
11265  24c4 2503          	jrult	L072
11266  24c6 cc25f9        	jp	L5715
11267  24c9               L072:
11268                     ; 1939 						Display_LCD_String(".");
11270  24c9 ae0282        	ldw	x,#L5013
11271  24cc cd0000        	call	_Display_LCD_String
11273                     ; 1940 						uc_buffer = can_data[4] % (U8)(2);
11275  24cf 7b11          	ld	a,(OFST-5,sp)
11276  24d1 a401          	and	a,#1
11277  24d3 6b16          	ld	(OFST+0,sp),a
11279                     ; 1941 						if(uc_buffer){ Display_LCD_String("5"); }
11281  24d5 0d16          	tnz	(OFST+0,sp)
11282  24d7 270a          	jreq	L5735
11285  24d9 ae0280        	ldw	x,#L1113
11286  24dc cd0000        	call	_Display_LCD_String
11289  24df acf925f9      	jpf	L5715
11290  24e3               L5735:
11291                     ; 1942 						else{ Display_LCD_String("0"); }
11293  24e3 ae027e        	ldw	x,#L5113
11294  24e6 cd0000        	call	_Display_LCD_String
11296  24e9 acf925f9      	jpf	L5715
11297  24ed               L7715:
11298                     ; 1948 			else if(uc_line_index == (U8)(2)){	// LINE 3
11300  24ed 7b15          	ld	a,(OFST-1,sp)
11301  24ef a102          	cp	a,#2
11302  24f1 2703          	jreq	L272
11303  24f3 cc2581        	jp	L3045
11304  24f6               L272:
11305                     ; 1951 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
11307  24f6 7b15          	ld	a,(OFST-1,sp)
11308  24f8 5f            	clrw	x
11309  24f9 97            	ld	xl,a
11310  24fa d60000        	ld	a,(_LCD_Line,x)
11311  24fd ab02          	add	a,#2
11312  24ff cd0000        	call	_Set_LCD_Address
11314                     ; 1952 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
11316  2502 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11317  2505 a501          	bcp	a,#1
11318  2507 2708          	jreq	L5045
11321  2509 ae0244        	ldw	x,#L5543
11322  250c cd0000        	call	_Display_LCD_String
11325  250f 2014          	jra	L7045
11326  2511               L5045:
11327                     ; 1954 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
11329  2511 7b0d          	ld	a,(OFST-9,sp)
11330  2513 a501          	bcp	a,#1
11331  2515 2708          	jreq	L1145
11334  2517 ae0242        	ldw	x,#L3643
11335  251a cd0000        	call	_Display_LCD_String
11338  251d 2006          	jra	L7045
11339  251f               L1145:
11340                     ; 1955 					else{ Display_LCD_String("0"); }
11342  251f ae027e        	ldw	x,#L5113
11343  2522 cd0000        	call	_Display_LCD_String
11345  2525               L7045:
11346                     ; 1958 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
11348  2525 7b15          	ld	a,(OFST-1,sp)
11349  2527 5f            	clrw	x
11350  2528 97            	ld	xl,a
11351  2529 d60000        	ld	a,(_LCD_Line,x)
11352  252c ab06          	add	a,#6
11353  252e cd0000        	call	_Set_LCD_Address
11355                     ; 1959 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
11357  2531 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11358  2534 a502          	bcp	a,#2
11359  2536 2708          	jreq	L5145
11362  2538 ae0244        	ldw	x,#L5543
11363  253b cd0000        	call	_Display_LCD_String
11366  253e 2014          	jra	L7145
11367  2540               L5145:
11368                     ; 1961 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
11370  2540 7b03          	ld	a,(OFST-19,sp)
11371  2542 a501          	bcp	a,#1
11372  2544 2708          	jreq	L1245
11375  2546 ae0242        	ldw	x,#L3643
11376  2549 cd0000        	call	_Display_LCD_String
11379  254c 2006          	jra	L7145
11380  254e               L1245:
11381                     ; 1962 					else{ Display_LCD_String("0"); }
11383  254e ae027e        	ldw	x,#L5113
11384  2551 cd0000        	call	_Display_LCD_String
11386  2554               L7145:
11387                     ; 1965 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
11389  2554 7b15          	ld	a,(OFST-1,sp)
11390  2556 5f            	clrw	x
11391  2557 97            	ld	xl,a
11392  2558 d60000        	ld	a,(_LCD_Line,x)
11393  255b ab0b          	add	a,#11
11394  255d cd0000        	call	_Set_LCD_Address
11396                     ; 1966 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11398  2560 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11399  2563 a501          	bcp	a,#1
11400  2565 270a          	jreq	L5245
11403  2567 ae025d        	ldw	x,#L7023
11404  256a cd0000        	call	_Display_LCD_String
11407  256d acf925f9      	jpf	L5715
11408  2571               L5245:
11409                     ; 1969 					ui_buffer = (U16)(uc_Rx_Data[0][3]) * (U16)(4);//YJS 2->4
11411  2571 c60003        	ld	a,_uc_Rx_Data+3
11412  2574 97            	ld	xl,a
11413  2575 a604          	ld	a,#4
11414  2577 42            	mul	x,a
11415  2578 1f0b          	ldw	(OFST-11,sp),x
11417                     ; 1970 					Num_Display_LCD(ui_buffer);
11419  257a 1e0b          	ldw	x,(OFST-11,sp)
11420  257c cd0000        	call	_Num_Display_LCD
11422  257f 2078          	jra	L5715
11423  2581               L3045:
11424                     ; 1976 			else if(uc_line_index == (U8)(3)){	// LINE 4
11426  2581 7b15          	ld	a,(OFST-1,sp)
11427  2583 a103          	cp	a,#3
11428  2585 2672          	jrne	L5715
11429                     ; 1979 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
11431  2587 7b15          	ld	a,(OFST-1,sp)
11432  2589 5f            	clrw	x
11433  258a 97            	ld	xl,a
11434  258b d60000        	ld	a,(_LCD_Line,x)
11435  258e ab03          	add	a,#3
11436  2590 cd0000        	call	_Set_LCD_Address
11438                     ; 1981 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11440  2593 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11441  2596 a501          	bcp	a,#1
11442  2598 2708          	jreq	L5345
11445  259a ae025d        	ldw	x,#L7023
11446  259d cd0000        	call	_Display_LCD_String
11449  25a0 2026          	jra	L7345
11450  25a2               L5345:
11451                     ; 1983 					Num_Display_LCD(can_data[6] / (U8)(5));
11453  25a2 7b13          	ld	a,(OFST-3,sp)
11454  25a4 5f            	clrw	x
11455  25a5 97            	ld	xl,a
11456  25a6 a605          	ld	a,#5
11457  25a8 cd0000        	call	c_sdivx
11459  25ab cd0000        	call	_Num_Display_LCD
11461                     ; 1984 					Display_LCD_String(".");
11463  25ae ae0282        	ldw	x,#L5013
11464  25b1 cd0000        	call	_Display_LCD_String
11466                     ; 1985 					uc_buffer = can_data[6] % (U8)(5);
11468  25b4 7b13          	ld	a,(OFST-3,sp)
11469  25b6 5f            	clrw	x
11470  25b7 97            	ld	xl,a
11471  25b8 a605          	ld	a,#5
11472  25ba 62            	div	x,a
11473  25bb 5f            	clrw	x
11474  25bc 97            	ld	xl,a
11475  25bd 9f            	ld	a,xl
11476  25be 6b16          	ld	(OFST+0,sp),a
11478                     ; 1986 					Num_Display_LCD(uc_buffer * (U8)(2));
11480  25c0 7b16          	ld	a,(OFST+0,sp)
11481  25c2 5f            	clrw	x
11482  25c3 97            	ld	xl,a
11483  25c4 58            	sllw	x
11484  25c5 cd0000        	call	_Num_Display_LCD
11486  25c8               L7345:
11487                     ; 1992 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
11489  25c8 7b15          	ld	a,(OFST-1,sp)
11490  25ca 5f            	clrw	x
11491  25cb 97            	ld	xl,a
11492  25cc d60000        	ld	a,(_LCD_Line,x)
11493  25cf ab0b          	add	a,#11
11494  25d1 cd0000        	call	_Set_LCD_Address
11496                     ; 1994 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11498  25d4 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11499  25d7 a501          	bcp	a,#1
11500  25d9 2708          	jreq	L1445
11503  25db ae025d        	ldw	x,#L7023
11504  25de cd0000        	call	_Display_LCD_String
11507  25e1 2016          	jra	L5715
11508  25e3               L1445:
11509                     ; 1996 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
11511  25e3 7b0f          	ld	a,(OFST-7,sp)
11512  25e5 5f            	clrw	x
11513  25e6 97            	ld	xl,a
11514  25e7 1f01          	ldw	(OFST-21,sp),x
11516  25e9 7b10          	ld	a,(OFST-6,sp)
11517  25eb 5f            	clrw	x
11518  25ec 97            	ld	xl,a
11519  25ed 4f            	clr	a
11520  25ee 02            	rlwa	x,a
11521  25ef 72fb01        	addw	x,(OFST-21,sp)
11522  25f2 1f0b          	ldw	(OFST-11,sp),x
11524                     ; 1997 					Num_Display_LCD(ui_buffer);
11526  25f4 1e0b          	ldw	x,(OFST-11,sp)
11527  25f6 cd0000        	call	_Num_Display_LCD
11529  25f9               L5715:
11530                     ; 1794 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
11532  25f9 0c15          	inc	(OFST-1,sp)
11536  25fb 7b15          	ld	a,(OFST-1,sp)
11537  25fd a104          	cp	a,#4
11538  25ff 2403          	jruge	L472
11539  2601 cc2098        	jp	L3015
11540  2604               L472:
11542  2604 ac742a74      	jpf	L5445
11543  2608               L1015:
11544                     ; 2007 	else if(uc_Test_Page_Now == (U8)(1)){
11546  2608 c60004        	ld	a,_uc_Test_Page_Now
11547  260b a101          	cp	a,#1
11548  260d 2703          	jreq	L672
11549  260f cc26af        	jp	L7445
11550  2612               L672:
11551                     ; 2008 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
11553  2612 0f15          	clr	(OFST-1,sp)
11555  2614               L1545:
11556                     ; 2010 			Set_LCD_Address(LCD_Line[uc_line_index]);
11558  2614 7b15          	ld	a,(OFST-1,sp)
11559  2616 5f            	clrw	x
11560  2617 97            	ld	xl,a
11561  2618 d60000        	ld	a,(_LCD_Line,x)
11562  261b cd0000        	call	_Set_LCD_Address
11564                     ; 2011 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
11566  261e 7b15          	ld	a,(OFST-1,sp)
11567  2620 97            	ld	xl,a
11568  2621 a610          	ld	a,#16
11569  2623 42            	mul	x,a
11570  2624 1c0000        	addw	x,#_LCD_Dis_Data
11571  2627 cd0000        	call	_Display_LCD_String
11573                     ; 2014 			if(uc_line_index == (U8)(0)){		// LINE 1
11575  262a 0d15          	tnz	(OFST-1,sp)
11576  262c 2641          	jrne	L7545
11577                     ; 2017 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
11579  262e 7b15          	ld	a,(OFST-1,sp)
11580  2630 5f            	clrw	x
11581  2631 97            	ld	xl,a
11582  2632 d60000        	ld	a,(_LCD_Line,x)
11583  2635 ab03          	add	a,#3
11584  2637 cd0000        	call	_Set_LCD_Address
11586                     ; 2018 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11588  263a c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11589  263d a501          	bcp	a,#1
11590  263f 2708          	jreq	L1645
11593  2641 ae025d        	ldw	x,#L7023
11594  2644 cd0000        	call	_Display_LCD_String
11597  2647 2026          	jra	L7545
11598  2649               L1645:
11599                     ; 2020 					if(can_data[1] < (U8)(40)){
11601  2649 7b0e          	ld	a,(OFST-8,sp)
11602  264b a128          	cp	a,#40
11603  264d 2416          	jruge	L5645
11604                     ; 2021 						Display_LCD_String("-");
11606  264f ae0240        	ldw	x,#L1453
11607  2652 cd0000        	call	_Display_LCD_String
11609                     ; 2022 						Num_Display_LCD((U8)(40) - can_data[1]);
11611  2655 a600          	ld	a,#0
11612  2657 97            	ld	xl,a
11613  2658 a628          	ld	a,#40
11614  265a 100e          	sub	a,(OFST-8,sp)
11615  265c 2401          	jrnc	L632
11616  265e 5a            	decw	x
11617  265f               L632:
11618  265f 02            	rlwa	x,a
11619  2660 cd0000        	call	_Num_Display_LCD
11622  2663 200a          	jra	L7545
11623  2665               L5645:
11624                     ; 2025 						Num_Display_LCD(can_data[1] - (U8)(40));
11626  2665 7b0e          	ld	a,(OFST-8,sp)
11627  2667 5f            	clrw	x
11628  2668 97            	ld	xl,a
11629  2669 1d0028        	subw	x,#40
11630  266c cd0000        	call	_Num_Display_LCD
11632  266f               L7545:
11633                     ; 2031 			if(uc_line_index == (U8)(1)){		// LINE 2
11635  266f 7b15          	ld	a,(OFST-1,sp)
11636  2671 a101          	cp	a,#1
11637  2673 2623          	jrne	L1745
11638                     ; 2034 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
11640  2675 7b15          	ld	a,(OFST-1,sp)
11641  2677 5f            	clrw	x
11642  2678 97            	ld	xl,a
11643  2679 d60000        	ld	a,(_LCD_Line,x)
11644  267c ab04          	add	a,#4
11645  267e cd0000        	call	_Set_LCD_Address
11647                     ; 2035 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
11649  2681 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11650  2684 a502          	bcp	a,#2
11651  2686 2708          	jreq	L3745
11654  2688 ae025d        	ldw	x,#L7023
11655  268b cd0000        	call	_Display_LCD_String
11658  268e 2008          	jra	L1745
11659  2690               L3745:
11660                     ; 2038 					Num_Display_LCD(uc_Rx_Data[0][7]);  				//SoftWare Version Display
11662  2690 c60007        	ld	a,_uc_Rx_Data+7
11663  2693 5f            	clrw	x
11664  2694 97            	ld	xl,a
11665  2695 cd0000        	call	_Num_Display_LCD
11667  2698               L1745:
11668                     ; 2050 			if(uc_line_index == (U8)(2)){		// LINE 2
11670  2698 7b15          	ld	a,(OFST-1,sp)
11671  269a a102          	cp	a,#2
11672                     ; 2055 			if(uc_line_index == (U8)(3)){		// LINE 3
11674  269c 7b15          	ld	a,(OFST-1,sp)
11675  269e a103          	cp	a,#3
11676                     ; 2008 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
11678  26a0 0c15          	inc	(OFST-1,sp)
11682  26a2 7b15          	ld	a,(OFST-1,sp)
11683  26a4 a104          	cp	a,#4
11684  26a6 2403          	jruge	L003
11685  26a8 cc2614        	jp	L1545
11686  26ab               L003:
11688  26ab ac742a74      	jpf	L5445
11689  26af               L7445:
11690                     ; 2062 		if(b_Rx2_Msg_TimeOut_Flag){
11692  26af c6000c        	ld	a,_uc_Rx_TimeOut_Reg
11693  26b2 a502          	bcp	a,#2
11694  26b4 2710          	jreq	L5055
11695                     ; 2063 			Set_LCD_Address(LCD_Line[0]);	
11697  26b6 c60000        	ld	a,_LCD_Line
11698  26b9 cd0000        	call	_Set_LCD_Address
11700                     ; 2064 			Display_LCD_String("NC");
11702  26bc ae025d        	ldw	x,#L7023
11703  26bf cd0000        	call	_Display_LCD_String
11706  26c2 ac742a74      	jpf	L5445
11707  26c6               L5055:
11708                     ; 2067 			uc_fault_cnt = (U8)(0);
11710  26c6 0f16          	clr	(OFST+0,sp)
11712                     ; 2069 			if(can_diag[0] & (U8)(0x02)){
11714  26c8 7b03          	ld	a,(OFST-19,sp)
11715  26ca a502          	bcp	a,#2
11716  26cc 273c          	jreq	L1155
11717                     ; 2070 				uc_fault_cnt++;
11719  26ce 0c16          	inc	(OFST+0,sp)
11721                     ; 2071 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11721                     ; 2072 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11721                     ; 2073 				){
11723  26d0 0d16          	tnz	(OFST+0,sp)
11724  26d2 270d          	jreq	L7155
11726  26d4 7b16          	ld	a,(OFST+0,sp)
11727  26d6 a105          	cp	a,#5
11728  26d8 2407          	jruge	L7155
11730  26da c60004        	ld	a,_uc_Test_Page_Now
11731  26dd a102          	cp	a,#2
11732  26df 2713          	jreq	L5155
11733  26e1               L7155:
11735  26e1 7b16          	ld	a,(OFST+0,sp)
11736  26e3 a105          	cp	a,#5
11737  26e5 2523          	jrult	L1155
11739  26e7 7b16          	ld	a,(OFST+0,sp)
11740  26e9 a109          	cp	a,#9
11741  26eb 241d          	jruge	L1155
11743  26ed c60004        	ld	a,_uc_Test_Page_Now
11744  26f0 a103          	cp	a,#3
11745  26f2 2616          	jrne	L1155
11746  26f4               L5155:
11747                     ; 2074 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
11749  26f4 7b16          	ld	a,(OFST+0,sp)
11750  26f6 5f            	clrw	x
11751  26f7 97            	ld	xl,a
11752  26f8 5a            	decw	x
11753  26f9 a604          	ld	a,#4
11754  26fb cd0000        	call	c_smodx
11756  26fe d60000        	ld	a,(_LCD_Line,x)
11757  2701 cd0000        	call	_Set_LCD_Address
11759                     ; 2075 					Display_LCD_String("Flt_LVLow");
11761  2704 ae0236        	ldw	x,#L7753
11762  2707 cd0000        	call	_Display_LCD_String
11764  270a               L1155:
11765                     ; 2079 			if(can_diag[0] & (U8)(0x04)){
11767  270a 7b03          	ld	a,(OFST-19,sp)
11768  270c a504          	bcp	a,#4
11769  270e 273c          	jreq	L3255
11770                     ; 2080 				uc_fault_cnt++;
11772  2710 0c16          	inc	(OFST+0,sp)
11774                     ; 2081 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11774                     ; 2082 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11774                     ; 2083 				){
11776  2712 0d16          	tnz	(OFST+0,sp)
11777  2714 270d          	jreq	L1355
11779  2716 7b16          	ld	a,(OFST+0,sp)
11780  2718 a105          	cp	a,#5
11781  271a 2407          	jruge	L1355
11783  271c c60004        	ld	a,_uc_Test_Page_Now
11784  271f a102          	cp	a,#2
11785  2721 2713          	jreq	L7255
11786  2723               L1355:
11788  2723 7b16          	ld	a,(OFST+0,sp)
11789  2725 a105          	cp	a,#5
11790  2727 2523          	jrult	L3255
11792  2729 7b16          	ld	a,(OFST+0,sp)
11793  272b a109          	cp	a,#9
11794  272d 241d          	jruge	L3255
11796  272f c60004        	ld	a,_uc_Test_Page_Now
11797  2732 a103          	cp	a,#3
11798  2734 2616          	jrne	L3255
11799  2736               L7255:
11800                     ; 2084 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
11802  2736 7b16          	ld	a,(OFST+0,sp)
11803  2738 5f            	clrw	x
11804  2739 97            	ld	xl,a
11805  273a 5a            	decw	x
11806  273b a604          	ld	a,#4
11807  273d cd0000        	call	c_smodx
11809  2740 d60000        	ld	a,(_LCD_Line,x)
11810  2743 cd0000        	call	_Set_LCD_Address
11812                     ; 2085 					Display_LCD_String("Flt_LVHigh");
11814  2746 ae022b        	ldw	x,#L3163
11815  2749 cd0000        	call	_Display_LCD_String
11817  274c               L3255:
11818                     ; 2089 			if(can_diag[0] & (U8)(0x08)){
11820  274c 7b03          	ld	a,(OFST-19,sp)
11821  274e a508          	bcp	a,#8
11822  2750 273c          	jreq	L5355
11823                     ; 2090 				uc_fault_cnt++;
11825  2752 0c16          	inc	(OFST+0,sp)
11827                     ; 2091 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11827                     ; 2092 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11827                     ; 2093 				){
11829  2754 0d16          	tnz	(OFST+0,sp)
11830  2756 270d          	jreq	L3455
11832  2758 7b16          	ld	a,(OFST+0,sp)
11833  275a a105          	cp	a,#5
11834  275c 2407          	jruge	L3455
11836  275e c60004        	ld	a,_uc_Test_Page_Now
11837  2761 a102          	cp	a,#2
11838  2763 2713          	jreq	L1455
11839  2765               L3455:
11841  2765 7b16          	ld	a,(OFST+0,sp)
11842  2767 a105          	cp	a,#5
11843  2769 2523          	jrult	L5355
11845  276b 7b16          	ld	a,(OFST+0,sp)
11846  276d a109          	cp	a,#9
11847  276f 241d          	jruge	L5355
11849  2771 c60004        	ld	a,_uc_Test_Page_Now
11850  2774 a103          	cp	a,#3
11851  2776 2616          	jrne	L5355
11852  2778               L1455:
11853                     ; 2094 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
11855  2778 7b16          	ld	a,(OFST+0,sp)
11856  277a 5f            	clrw	x
11857  277b 97            	ld	xl,a
11858  277c 5a            	decw	x
11859  277d a604          	ld	a,#4
11860  277f cd0000        	call	c_smodx
11862  2782 d60000        	ld	a,(_LCD_Line,x)
11863  2785 cd0000        	call	_Set_LCD_Address
11865                     ; 2095 					Display_LCD_String("Flt_HVLow");
11867  2788 ae0221        	ldw	x,#L7263
11868  278b cd0000        	call	_Display_LCD_String
11870  278e               L5355:
11871                     ; 2099 			if(can_diag[0] & (U8)(0x10)){
11873  278e 7b03          	ld	a,(OFST-19,sp)
11874  2790 a510          	bcp	a,#16
11875  2792 273c          	jreq	L7455
11876                     ; 2100 				uc_fault_cnt++;
11878  2794 0c16          	inc	(OFST+0,sp)
11880                     ; 2101 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11880                     ; 2102 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11880                     ; 2103 				){
11882  2796 0d16          	tnz	(OFST+0,sp)
11883  2798 270d          	jreq	L5555
11885  279a 7b16          	ld	a,(OFST+0,sp)
11886  279c a105          	cp	a,#5
11887  279e 2407          	jruge	L5555
11889  27a0 c60004        	ld	a,_uc_Test_Page_Now
11890  27a3 a102          	cp	a,#2
11891  27a5 2713          	jreq	L3555
11892  27a7               L5555:
11894  27a7 7b16          	ld	a,(OFST+0,sp)
11895  27a9 a105          	cp	a,#5
11896  27ab 2523          	jrult	L7455
11898  27ad 7b16          	ld	a,(OFST+0,sp)
11899  27af a109          	cp	a,#9
11900  27b1 241d          	jruge	L7455
11902  27b3 c60004        	ld	a,_uc_Test_Page_Now
11903  27b6 a103          	cp	a,#3
11904  27b8 2616          	jrne	L7455
11905  27ba               L3555:
11906                     ; 2104 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
11908  27ba 7b16          	ld	a,(OFST+0,sp)
11909  27bc 5f            	clrw	x
11910  27bd 97            	ld	xl,a
11911  27be 5a            	decw	x
11912  27bf a604          	ld	a,#4
11913  27c1 cd0000        	call	c_smodx
11915  27c4 d60000        	ld	a,(_LCD_Line,x)
11916  27c7 cd0000        	call	_Set_LCD_Address
11918                     ; 2105 					Display_LCD_String("Flt_HVHigh");
11920  27ca ae0216        	ldw	x,#L3463
11921  27cd cd0000        	call	_Display_LCD_String
11923  27d0               L7455:
11924                     ; 2109 			if(can_data[7] & (U8)(0x2)){
11926  27d0 7b14          	ld	a,(OFST-2,sp)
11927  27d2 a502          	bcp	a,#2
11928  27d4 273c          	jreq	L1655
11929                     ; 2110 				uc_fault_cnt++;
11931  27d6 0c16          	inc	(OFST+0,sp)
11933                     ; 2111 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11933                     ; 2112 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11933                     ; 2113 				){
11935  27d8 0d16          	tnz	(OFST+0,sp)
11936  27da 270d          	jreq	L7655
11938  27dc 7b16          	ld	a,(OFST+0,sp)
11939  27de a105          	cp	a,#5
11940  27e0 2407          	jruge	L7655
11942  27e2 c60004        	ld	a,_uc_Test_Page_Now
11943  27e5 a102          	cp	a,#2
11944  27e7 2713          	jreq	L5655
11945  27e9               L7655:
11947  27e9 7b16          	ld	a,(OFST+0,sp)
11948  27eb a105          	cp	a,#5
11949  27ed 2523          	jrult	L1655
11951  27ef 7b16          	ld	a,(OFST+0,sp)
11952  27f1 a109          	cp	a,#9
11953  27f3 241d          	jruge	L1655
11955  27f5 c60004        	ld	a,_uc_Test_Page_Now
11956  27f8 a103          	cp	a,#3
11957  27fa 2616          	jrne	L1655
11958  27fc               L5655:
11959                     ; 2114 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
11961  27fc 7b16          	ld	a,(OFST+0,sp)
11962  27fe 5f            	clrw	x
11963  27ff 97            	ld	xl,a
11964  2800 5a            	decw	x
11965  2801 a604          	ld	a,#4
11966  2803 cd0000        	call	c_smodx
11968  2806 d60000        	ld	a,(_LCD_Line,x)
11969  2809 cd0000        	call	_Set_LCD_Address
11971                     ; 2115 					Display_LCD_String("Flt_OverCur");
11973  280c ae020a        	ldw	x,#L7563
11974  280f cd0000        	call	_Display_LCD_String
11976  2812               L1655:
11977                     ; 2118 			if(can_data[7] & (U8)(0x1)){
11979  2812 7b14          	ld	a,(OFST-2,sp)
11980  2814 a501          	bcp	a,#1
11981  2816 273c          	jreq	L3755
11982                     ; 2119 				uc_fault_cnt++;
11984  2818 0c16          	inc	(OFST+0,sp)
11986                     ; 2120 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
11986                     ; 2121 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
11986                     ; 2122 				){
11988  281a 0d16          	tnz	(OFST+0,sp)
11989  281c 270d          	jreq	L1065
11991  281e 7b16          	ld	a,(OFST+0,sp)
11992  2820 a105          	cp	a,#5
11993  2822 2407          	jruge	L1065
11995  2824 c60004        	ld	a,_uc_Test_Page_Now
11996  2827 a102          	cp	a,#2
11997  2829 2713          	jreq	L7755
11998  282b               L1065:
12000  282b 7b16          	ld	a,(OFST+0,sp)
12001  282d a105          	cp	a,#5
12002  282f 2523          	jrult	L3755
12004  2831 7b16          	ld	a,(OFST+0,sp)
12005  2833 a109          	cp	a,#9
12006  2835 241d          	jruge	L3755
12008  2837 c60004        	ld	a,_uc_Test_Page_Now
12009  283a a103          	cp	a,#3
12010  283c 2616          	jrne	L3755
12011  283e               L7755:
12012                     ; 2123 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12014  283e 7b16          	ld	a,(OFST+0,sp)
12015  2840 5f            	clrw	x
12016  2841 97            	ld	xl,a
12017  2842 5a            	decw	x
12018  2843 a604          	ld	a,#4
12019  2845 cd0000        	call	c_smodx
12021  2848 d60000        	ld	a,(_LCD_Line,x)
12022  284b cd0000        	call	_Set_LCD_Address
12024                     ; 2124 					Display_LCD_String("Flt_ThmShut");
12026  284e ae01fe        	ldw	x,#L3763
12027  2851 cd0000        	call	_Display_LCD_String
12029  2854               L3755:
12030                     ; 2128 			if(can_diag[1] & (U8)(0x1)){
12032  2854 7b04          	ld	a,(OFST-18,sp)
12033  2856 a501          	bcp	a,#1
12034  2858 273c          	jreq	L5065
12035                     ; 2129 				uc_fault_cnt++;
12037  285a 0c16          	inc	(OFST+0,sp)
12039                     ; 2130 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12039                     ; 2131 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12039                     ; 2132 				){
12041  285c 0d16          	tnz	(OFST+0,sp)
12042  285e 270d          	jreq	L3165
12044  2860 7b16          	ld	a,(OFST+0,sp)
12045  2862 a105          	cp	a,#5
12046  2864 2407          	jruge	L3165
12048  2866 c60004        	ld	a,_uc_Test_Page_Now
12049  2869 a102          	cp	a,#2
12050  286b 2713          	jreq	L1165
12051  286d               L3165:
12053  286d 7b16          	ld	a,(OFST+0,sp)
12054  286f a105          	cp	a,#5
12055  2871 2523          	jrult	L5065
12057  2873 7b16          	ld	a,(OFST+0,sp)
12058  2875 a109          	cp	a,#9
12059  2877 241d          	jruge	L5065
12061  2879 c60004        	ld	a,_uc_Test_Page_Now
12062  287c a103          	cp	a,#3
12063  287e 2616          	jrne	L5065
12064  2880               L1165:
12065                     ; 2133 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
12067  2880 7b16          	ld	a,(OFST+0,sp)
12068  2882 5f            	clrw	x
12069  2883 97            	ld	xl,a
12070  2884 5a            	decw	x
12071  2885 a604          	ld	a,#4
12072  2887 cd0000        	call	c_smodx
12074  288a d60000        	ld	a,(_LCD_Line,x)
12075  288d cd0000        	call	_Set_LCD_Address
12077                     ; 2134 					Display_LCD_String("Flt_PCBThmShut");
12079  2890 ae01ef        	ldw	x,#L7073
12080  2893 cd0000        	call	_Display_LCD_String
12082  2896               L5065:
12083                     ; 2138 			if(can_diag[1] & (U8)(0x10)){
12085  2896 7b04          	ld	a,(OFST-18,sp)
12086  2898 a510          	bcp	a,#16
12087  289a 273c          	jreq	L7165
12088                     ; 2139 				uc_fault_cnt++;
12090  289c 0c16          	inc	(OFST+0,sp)
12092                     ; 2140 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12092                     ; 2141 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12092                     ; 2142 				){
12094  289e 0d16          	tnz	(OFST+0,sp)
12095  28a0 270d          	jreq	L5265
12097  28a2 7b16          	ld	a,(OFST+0,sp)
12098  28a4 a105          	cp	a,#5
12099  28a6 2407          	jruge	L5265
12101  28a8 c60004        	ld	a,_uc_Test_Page_Now
12102  28ab a102          	cp	a,#2
12103  28ad 2713          	jreq	L3265
12104  28af               L5265:
12106  28af 7b16          	ld	a,(OFST+0,sp)
12107  28b1 a105          	cp	a,#5
12108  28b3 2523          	jrult	L7165
12110  28b5 7b16          	ld	a,(OFST+0,sp)
12111  28b7 a109          	cp	a,#9
12112  28b9 241d          	jruge	L7165
12114  28bb c60004        	ld	a,_uc_Test_Page_Now
12115  28be a103          	cp	a,#3
12116  28c0 2616          	jrne	L7165
12117  28c2               L3265:
12118                     ; 2143 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12120  28c2 7b16          	ld	a,(OFST+0,sp)
12121  28c4 5f            	clrw	x
12122  28c5 97            	ld	xl,a
12123  28c6 5a            	decw	x
12124  28c7 a604          	ld	a,#4
12125  28c9 cd0000        	call	c_smodx
12127  28cc d60000        	ld	a,(_LCD_Line,x)
12128  28cf cd0000        	call	_Set_LCD_Address
12130                     ; 2144 					Display_LCD_String("Flt_MsgTimeOut");
12132  28d2 ae01e0        	ldw	x,#L3273
12133  28d5 cd0000        	call	_Display_LCD_String
12135  28d8               L7165:
12136                     ; 2148 			if(can_diag[1] & (U8)(0x04)){
12138  28d8 7b04          	ld	a,(OFST-18,sp)
12139  28da a504          	bcp	a,#4
12140  28dc 273c          	jreq	L1365
12141                     ; 2149 				uc_fault_cnt++;
12143  28de 0c16          	inc	(OFST+0,sp)
12145                     ; 2150 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12145                     ; 2151 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12145                     ; 2152 				){
12147  28e0 0d16          	tnz	(OFST+0,sp)
12148  28e2 270d          	jreq	L7365
12150  28e4 7b16          	ld	a,(OFST+0,sp)
12151  28e6 a105          	cp	a,#5
12152  28e8 2407          	jruge	L7365
12154  28ea c60004        	ld	a,_uc_Test_Page_Now
12155  28ed a102          	cp	a,#2
12156  28ef 2713          	jreq	L5365
12157  28f1               L7365:
12159  28f1 7b16          	ld	a,(OFST+0,sp)
12160  28f3 a105          	cp	a,#5
12161  28f5 2523          	jrult	L1365
12163  28f7 7b16          	ld	a,(OFST+0,sp)
12164  28f9 a109          	cp	a,#9
12165  28fb 241d          	jruge	L1365
12167  28fd c60004        	ld	a,_uc_Test_Page_Now
12168  2900 a103          	cp	a,#3
12169  2902 2616          	jrne	L1365
12170  2904               L5365:
12171                     ; 2153 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12173  2904 7b16          	ld	a,(OFST+0,sp)
12174  2906 5f            	clrw	x
12175  2907 97            	ld	xl,a
12176  2908 5a            	decw	x
12177  2909 a604          	ld	a,#4
12178  290b cd0000        	call	c_smodx
12180  290e d60000        	ld	a,(_LCD_Line,x)
12181  2911 cd0000        	call	_Set_LCD_Address
12183                     ; 2154 					Display_LCD_String("Fail_HVSen");
12185  2914 ae01d5        	ldw	x,#L7373
12186  2917 cd0000        	call	_Display_LCD_String
12188  291a               L1365:
12189                     ; 2158 			if(can_diag[1] & (U8)(0x02)){
12191  291a 7b04          	ld	a,(OFST-18,sp)
12192  291c a502          	bcp	a,#2
12193  291e 273c          	jreq	L3465
12194                     ; 2159 				uc_fault_cnt++;
12196  2920 0c16          	inc	(OFST+0,sp)
12198                     ; 2160 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12198                     ; 2161 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12198                     ; 2162 				){
12200  2922 0d16          	tnz	(OFST+0,sp)
12201  2924 270d          	jreq	L1565
12203  2926 7b16          	ld	a,(OFST+0,sp)
12204  2928 a105          	cp	a,#5
12205  292a 2407          	jruge	L1565
12207  292c c60004        	ld	a,_uc_Test_Page_Now
12208  292f a102          	cp	a,#2
12209  2931 2713          	jreq	L7465
12210  2933               L1565:
12212  2933 7b16          	ld	a,(OFST+0,sp)
12213  2935 a105          	cp	a,#5
12214  2937 2523          	jrult	L3465
12216  2939 7b16          	ld	a,(OFST+0,sp)
12217  293b a109          	cp	a,#9
12218  293d 241d          	jruge	L3465
12220  293f c60004        	ld	a,_uc_Test_Page_Now
12221  2942 a103          	cp	a,#3
12222  2944 2616          	jrne	L3465
12223  2946               L7465:
12224                     ; 2163 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12226  2946 7b16          	ld	a,(OFST+0,sp)
12227  2948 5f            	clrw	x
12228  2949 97            	ld	xl,a
12229  294a 5a            	decw	x
12230  294b a604          	ld	a,#4
12231  294d cd0000        	call	c_smodx
12233  2950 d60000        	ld	a,(_LCD_Line,x)
12234  2953 cd0000        	call	_Set_LCD_Address
12236                     ; 2164 					Display_LCD_String("Fail_LVSen");
12238  2956 ae01ca        	ldw	x,#L3573
12239  2959 cd0000        	call	_Display_LCD_String
12241  295c               L3465:
12242                     ; 2168 			if(can_data[7] & (U8)(0x04)){
12244  295c 7b14          	ld	a,(OFST-2,sp)
12245  295e a504          	bcp	a,#4
12246  2960 273c          	jreq	L5565
12247                     ; 2169 				uc_fault_cnt++;
12249  2962 0c16          	inc	(OFST+0,sp)
12251                     ; 2170 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12251                     ; 2171 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12251                     ; 2172 				){
12253  2964 0d16          	tnz	(OFST+0,sp)
12254  2966 270d          	jreq	L3665
12256  2968 7b16          	ld	a,(OFST+0,sp)
12257  296a a105          	cp	a,#5
12258  296c 2407          	jruge	L3665
12260  296e c60004        	ld	a,_uc_Test_Page_Now
12261  2971 a102          	cp	a,#2
12262  2973 2713          	jreq	L1665
12263  2975               L3665:
12265  2975 7b16          	ld	a,(OFST+0,sp)
12266  2977 a105          	cp	a,#5
12267  2979 2523          	jrult	L5565
12269  297b 7b16          	ld	a,(OFST+0,sp)
12270  297d a109          	cp	a,#9
12271  297f 241d          	jruge	L5565
12273  2981 c60004        	ld	a,_uc_Test_Page_Now
12274  2984 a103          	cp	a,#3
12275  2986 2616          	jrne	L5565
12276  2988               L1665:
12277                     ; 2173 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12279  2988 7b16          	ld	a,(OFST+0,sp)
12280  298a 5f            	clrw	x
12281  298b 97            	ld	xl,a
12282  298c 5a            	decw	x
12283  298d a604          	ld	a,#4
12284  298f cd0000        	call	c_smodx
12286  2992 d60000        	ld	a,(_LCD_Line,x)
12287  2995 cd0000        	call	_Set_LCD_Address
12289                     ; 2174 					Display_LCD_String("Fail_CurSen");
12291  2998 ae01be        	ldw	x,#L7673
12292  299b cd0000        	call	_Display_LCD_String
12294  299e               L5565:
12295                     ; 2180 			if(can_data[7] & (U8)(0x08)){
12297  299e 7b14          	ld	a,(OFST-2,sp)
12298  29a0 a508          	bcp	a,#8
12299  29a2 273c          	jreq	L7665
12300                     ; 2182 				uc_fault_cnt++;
12302  29a4 0c16          	inc	(OFST+0,sp)
12304                     ; 2183 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12304                     ; 2184 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12304                     ; 2185 				){
12306  29a6 0d16          	tnz	(OFST+0,sp)
12307  29a8 270d          	jreq	L5765
12309  29aa 7b16          	ld	a,(OFST+0,sp)
12310  29ac a105          	cp	a,#5
12311  29ae 2407          	jruge	L5765
12313  29b0 c60004        	ld	a,_uc_Test_Page_Now
12314  29b3 a102          	cp	a,#2
12315  29b5 2713          	jreq	L3765
12316  29b7               L5765:
12318  29b7 7b16          	ld	a,(OFST+0,sp)
12319  29b9 a105          	cp	a,#5
12320  29bb 2523          	jrult	L7665
12322  29bd 7b16          	ld	a,(OFST+0,sp)
12323  29bf a109          	cp	a,#9
12324  29c1 241d          	jruge	L7665
12326  29c3 c60004        	ld	a,_uc_Test_Page_Now
12327  29c6 a103          	cp	a,#3
12328  29c8 2616          	jrne	L7665
12329  29ca               L3765:
12330                     ; 2186 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
12332  29ca 7b16          	ld	a,(OFST+0,sp)
12333  29cc 5f            	clrw	x
12334  29cd 97            	ld	xl,a
12335  29ce 5a            	decw	x
12336  29cf a604          	ld	a,#4
12337  29d1 cd0000        	call	c_smodx
12339  29d4 d60000        	ld	a,(_LCD_Line,x)
12340  29d7 cd0000        	call	_Set_LCD_Address
12342                     ; 2187 					Display_LCD_String("Fail_CoreTemp");
12344  29da ae01b0        	ldw	x,#L3004
12345  29dd cd0000        	call	_Display_LCD_String
12347  29e0               L7665:
12348                     ; 2193 			if(can_diag[1] & (U8)(0x8)){
12350  29e0 7b04          	ld	a,(OFST-18,sp)
12351  29e2 a508          	bcp	a,#8
12352  29e4 273c          	jreq	L1075
12353                     ; 2195 				uc_fault_cnt++;
12355  29e6 0c16          	inc	(OFST+0,sp)
12357                     ; 2196 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12357                     ; 2197 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12357                     ; 2198 				){
12359  29e8 0d16          	tnz	(OFST+0,sp)
12360  29ea 270d          	jreq	L7075
12362  29ec 7b16          	ld	a,(OFST+0,sp)
12363  29ee a105          	cp	a,#5
12364  29f0 2407          	jruge	L7075
12366  29f2 c60004        	ld	a,_uc_Test_Page_Now
12367  29f5 a102          	cp	a,#2
12368  29f7 2713          	jreq	L5075
12369  29f9               L7075:
12371  29f9 7b16          	ld	a,(OFST+0,sp)
12372  29fb a105          	cp	a,#5
12373  29fd 2523          	jrult	L1075
12375  29ff 7b16          	ld	a,(OFST+0,sp)
12376  2a01 a109          	cp	a,#9
12377  2a03 241d          	jruge	L1075
12379  2a05 c60004        	ld	a,_uc_Test_Page_Now
12380  2a08 a103          	cp	a,#3
12381  2a0a 2616          	jrne	L1075
12382  2a0c               L5075:
12383                     ; 2199 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12385  2a0c 7b16          	ld	a,(OFST+0,sp)
12386  2a0e 5f            	clrw	x
12387  2a0f 97            	ld	xl,a
12388  2a10 5a            	decw	x
12389  2a11 a604          	ld	a,#4
12390  2a13 cd0000        	call	c_smodx
12392  2a16 d60000        	ld	a,(_LCD_Line,x)
12393  2a19 cd0000        	call	_Set_LCD_Address
12395                     ; 2200 					Display_LCD_String("Fail_PCB1Temp");
12397  2a1c ae01a2        	ldw	x,#L7104
12398  2a1f cd0000        	call	_Display_LCD_String
12400  2a22               L1075:
12401                     ; 2206 			if(can_data[5] == (U8)(0xff)){
12403  2a22 7b12          	ld	a,(OFST-4,sp)
12404  2a24 a1ff          	cp	a,#255
12405  2a26 263c          	jrne	L3175
12406                     ; 2208 				uc_fault_cnt++;
12408  2a28 0c16          	inc	(OFST+0,sp)
12410                     ; 2209 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
12410                     ; 2210 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
12410                     ; 2211 				){
12412  2a2a 0d16          	tnz	(OFST+0,sp)
12413  2a2c 270d          	jreq	L1275
12415  2a2e 7b16          	ld	a,(OFST+0,sp)
12416  2a30 a105          	cp	a,#5
12417  2a32 2407          	jruge	L1275
12419  2a34 c60004        	ld	a,_uc_Test_Page_Now
12420  2a37 a102          	cp	a,#2
12421  2a39 2713          	jreq	L7175
12422  2a3b               L1275:
12424  2a3b 7b16          	ld	a,(OFST+0,sp)
12425  2a3d a105          	cp	a,#5
12426  2a3f 2523          	jrult	L3175
12428  2a41 7b16          	ld	a,(OFST+0,sp)
12429  2a43 a109          	cp	a,#9
12430  2a45 241d          	jruge	L3175
12432  2a47 c60004        	ld	a,_uc_Test_Page_Now
12433  2a4a a103          	cp	a,#3
12434  2a4c 2616          	jrne	L3175
12435  2a4e               L7175:
12436                     ; 2212 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
12438  2a4e 7b16          	ld	a,(OFST+0,sp)
12439  2a50 5f            	clrw	x
12440  2a51 97            	ld	xl,a
12441  2a52 5a            	decw	x
12442  2a53 a604          	ld	a,#4
12443  2a55 cd0000        	call	c_smodx
12445  2a58 d60000        	ld	a,(_LCD_Line,x)
12446  2a5b cd0000        	call	_Set_LCD_Address
12448                     ; 2213 					Display_LCD_String("Fail_IGBT");
12450  2a5e ae0198        	ldw	x,#L3304
12451  2a61 cd0000        	call	_Display_LCD_String
12453  2a64               L3175:
12454                     ; 2227 			if(!uc_fault_cnt){
12456  2a64 0d16          	tnz	(OFST+0,sp)
12457  2a66 260c          	jrne	L5445
12458                     ; 2228 				Set_LCD_Address(LCD_Line[0]);
12460  2a68 c60000        	ld	a,_LCD_Line
12461  2a6b cd0000        	call	_Set_LCD_Address
12463                     ; 2229 				Display_LCD_String("Normal");
12465  2a6e ae0183        	ldw	x,#L3504
12466  2a71 cd0000        	call	_Display_LCD_String
12468  2a74               L5445:
12469                     ; 2234 	if((b_Com_On_flag == ON)){
12471  2a74 c6000d        	ld	a,_uc_Test_Ctrl_Reg
12472  2a77 a508          	bcp	a,#8
12473  2a79 270d          	jreq	L7275
12474                     ; 2235 		Set_LCD_Address((unsigned char)(0x00+15));
12476  2a7b a60f          	ld	a,#15
12477  2a7d cd0000        	call	_Set_LCD_Address
12479                     ; 2238 		Display_LCD_String("Y");	// YJS 20230314
12481  2a80 ae0181        	ldw	x,#L7504
12482  2a83 cd0000        	call	_Display_LCD_String
12485  2a86 200b          	jra	L1375
12486  2a88               L7275:
12487                     ; 2240 		Set_LCD_Address((unsigned char)(0x00+15));
12489  2a88 a60f          	ld	a,#15
12490  2a8a cd0000        	call	_Set_LCD_Address
12492                     ; 2241 		Display_LCD_String("N");
12494  2a8d ae0244        	ldw	x,#L5543
12495  2a90 cd0000        	call	_Display_LCD_String
12497  2a93               L1375:
12498                     ; 2244 	return;
12499  2a93               L042:
12502  2a93 5b16          	addw	sp,#22
12503  2a95 81            	ret
12603                     ; 2248 void Test_Ctrl_LCD_Display_Control(void)
12603                     ; 2249 {
12604                     	switch	.text
12605  2a96               _Test_Ctrl_LCD_Display_Control:
12607  2a96 5216          	subw	sp,#22
12608       00000016      OFST:	set	22
12611                     ; 2256 	if (HEATER_zone_status==HTR_ZONE_1)
12613  2a98 725d0000      	tnz	_HEATER_zone_status
12614  2a9c 263a          	jrne	L5675
12615                     ; 2258 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
12617  2a9e 0f15          	clr	(OFST-1,sp)
12619  2aa0               L7675:
12620                     ; 2260 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
12622  2aa0 96            	ldw	x,sp
12623  2aa1 1c000d        	addw	x,#OFST-9
12624  2aa4 9f            	ld	a,xl
12625  2aa5 5e            	swapw	x
12626  2aa6 1b15          	add	a,(OFST-1,sp)
12627  2aa8 2401          	jrnc	L403
12628  2aaa 5c            	incw	x
12629  2aab               L403:
12630  2aab 02            	rlwa	x,a
12631  2aac 7b15          	ld	a,(OFST-1,sp)
12632  2aae 905f          	clrw	y
12633  2ab0 9097          	ld	yl,a
12634  2ab2 90d60008      	ld	a,(_uc_Rx_Data+8,y)
12635  2ab6 f7            	ld	(x),a
12636                     ; 2261 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
12638  2ab7 96            	ldw	x,sp
12639  2ab8 1c0003        	addw	x,#OFST-19
12640  2abb 9f            	ld	a,xl
12641  2abc 5e            	swapw	x
12642  2abd 1b15          	add	a,(OFST-1,sp)
12643  2abf 2401          	jrnc	L603
12644  2ac1 5c            	incw	x
12645  2ac2               L603:
12646  2ac2 02            	rlwa	x,a
12647  2ac3 7b15          	ld	a,(OFST-1,sp)
12648  2ac5 905f          	clrw	y
12649  2ac7 9097          	ld	yl,a
12650  2ac9 90d60018      	ld	a,(_uc_Rx_Data+24,y)
12651  2acd f7            	ld	(x),a
12652                     ; 2258 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
12654  2ace 0c15          	inc	(OFST-1,sp)
12658  2ad0 7b15          	ld	a,(OFST-1,sp)
12659  2ad2 a108          	cp	a,#8
12660  2ad4 25ca          	jrult	L7675
12662  2ad6 2038          	jra	L5775
12663  2ad8               L5675:
12664                     ; 2266 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
12666  2ad8 0f15          	clr	(OFST-1,sp)
12668  2ada               L7775:
12669                     ; 2268 			can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
12671  2ada 96            	ldw	x,sp
12672  2adb 1c000d        	addw	x,#OFST-9
12673  2ade 9f            	ld	a,xl
12674  2adf 5e            	swapw	x
12675  2ae0 1b15          	add	a,(OFST-1,sp)
12676  2ae2 2401          	jrnc	L013
12677  2ae4 5c            	incw	x
12678  2ae5               L013:
12679  2ae5 02            	rlwa	x,a
12680  2ae6 7b15          	ld	a,(OFST-1,sp)
12681  2ae8 905f          	clrw	y
12682  2aea 9097          	ld	yl,a
12683  2aec 90d60010      	ld	a,(_uc_Rx_Data+16,y)
12684  2af0 f7            	ld	(x),a
12685                     ; 2269 			can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
12687  2af1 96            	ldw	x,sp
12688  2af2 1c0003        	addw	x,#OFST-19
12689  2af5 9f            	ld	a,xl
12690  2af6 5e            	swapw	x
12691  2af7 1b15          	add	a,(OFST-1,sp)
12692  2af9 2401          	jrnc	L213
12693  2afb 5c            	incw	x
12694  2afc               L213:
12695  2afc 02            	rlwa	x,a
12696  2afd 7b15          	ld	a,(OFST-1,sp)
12697  2aff 905f          	clrw	y
12698  2b01 9097          	ld	yl,a
12699  2b03 90d60018      	ld	a,(_uc_Rx_Data+24,y)
12700  2b07 f7            	ld	(x),a
12701                     ; 2266 		for (uc_buffer=0;uc_buffer<8;uc_buffer++)
12703  2b08 0c15          	inc	(OFST-1,sp)
12707  2b0a 7b15          	ld	a,(OFST-1,sp)
12708  2b0c a108          	cp	a,#8
12709  2b0e 25ca          	jrult	L7775
12710  2b10               L5775:
12711                     ; 2273 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
12713  2b10 c60004        	ld	a,_uc_Test_Page_Now
12714  2b13 c10003        	cp	a,_uc_Test_Page_Pre
12715  2b16 270f          	jreq	L5006
12716                     ; 2274 		Test_Ctrl_Text_Display_Handling(); 
12718  2b18 cd07ec        	call	_Test_Ctrl_Text_Display_Handling
12720                     ; 2275 		b_Data_Select_flag = OFF;
12722  2b1b 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
12723                     ; 2276 		b_Data_Setting_flag = OFF;
12725  2b1f 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
12726                     ; 2277 		uc_Test_Data_Select_Num = (U8)(0);
12728  2b23 725f0002      	clr	_uc_Test_Data_Select_Num
12729  2b27               L5006:
12730                     ; 2279 	uc_Test_Page_Pre = uc_Test_Page_Now ;
12732  2b27 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
12733                     ; 2283 	if(uc_Test_Page_Now == (U8)(0)){
12735  2b2c 725d0004      	tnz	_uc_Test_Page_Now
12736  2b30 2703          	jreq	L023
12737  2b32 cc2f0e        	jp	L7006
12738  2b35               L023:
12739                     ; 2284 		if(b_Test_Option_flag == ON){
12741  2b35 c6000d        	ld	a,_uc_Test_Ctrl_Reg
12742  2b38 a510          	bcp	a,#16
12743  2b3a 2603          	jrne	L223
12744  2b3c cc2bff        	jp	L1106
12745  2b3f               L223:
12746                     ; 2285 			Set_LCD_Address(LCD_Line[0u]);
12748  2b3f c60000        	ld	a,_LCD_Line
12749  2b42 cd0000        	call	_Set_LCD_Address
12751                     ; 2286 			Display_LCD_String("*OPTION*");
12753  2b45 ae02aa        	ldw	x,#L7603
12754  2b48 cd0000        	call	_Display_LCD_String
12756                     ; 2289 			Set_LCD_Address(LCD_Line[1]);
12758  2b4b c60001        	ld	a,_LCD_Line+1
12759  2b4e cd0000        	call	_Set_LCD_Address
12761                     ; 2290 				if(b_Blink_250_Flag == ON){
12763  2b51 c60000        	ld	a,_uc_LCD_Blink_Reg
12764  2b54 a502          	bcp	a,#2
12765  2b56 2739          	jreq	L3106
12766                     ; 2291 					if(uc_Target_Display_Mode == 0u){ Display_LCD_String("30s_ON_30s_OFF"); }			// low,Nomal Temp
12768  2b58 725d0000      	tnz	_uc_Target_Display_Mode
12769  2b5c 2608          	jrne	L5106
12772  2b5e ae0172        	ldw	x,#L7106
12773  2b61 cd0000        	call	_Display_LCD_String
12776  2b64 202b          	jra	L3106
12777  2b66               L5106:
12778                     ; 2292 					else if(uc_Target_Display_Mode == 1u){ Display_LCD_String("10m_OFF_10m_ON"); }	//coolant Spray	
12780  2b66 c60000        	ld	a,_uc_Target_Display_Mode
12781  2b69 a101          	cp	a,#1
12782  2b6b 2608          	jrne	L3206
12785  2b6d ae0163        	ldw	x,#L5206
12786  2b70 cd0000        	call	_Display_LCD_String
12789  2b73 201c          	jra	L3106
12790  2b75               L3206:
12791                     ; 2293 					else if(uc_Target_Display_Mode == 2u){ Display_LCD_String("1h_OFF_1h_ON"); }		// coolant Flooding
12793  2b75 c60000        	ld	a,_uc_Target_Display_Mode
12794  2b78 a102          	cp	a,#2
12795  2b7a 2608          	jrne	L1306
12798  2b7c ae0156        	ldw	x,#L3306
12799  2b7f cd0000        	call	_Display_LCD_String
12802  2b82 200d          	jra	L3106
12803  2b84               L1306:
12804                     ; 2294 					else if(uc_Target_Display_Mode == 3u){ Display_LCD_String("48h_ON"); }
12806  2b84 c60000        	ld	a,_uc_Target_Display_Mode
12807  2b87 a103          	cp	a,#3
12808  2b89 2606          	jrne	L3106
12811  2b8b ae014f        	ldw	x,#L1406
12812  2b8e cd0000        	call	_Display_LCD_String
12814  2b91               L3106:
12815                     ; 2297 			Set_LCD_Address(LCD_Line[3u]);
12817  2b91 c60003        	ld	a,_LCD_Line+3
12818  2b94 cd0000        	call	_Set_LCD_Address
12820                     ; 2298 			if((b_Data_Select_flag == ON) && (uc_Test_Data_Select_Num == 3u)){
12822  2b97 c6000d        	ld	a,_uc_Test_Ctrl_Reg
12823  2b9a a502          	bcp	a,#2
12824  2b9c 2716          	jreq	L3406
12826  2b9e c60002        	ld	a,_uc_Test_Data_Select_Num
12827  2ba1 a103          	cp	a,#3
12828  2ba3 260f          	jrne	L3406
12829                     ; 2299 				if(b_Blink_250_Flag){ Display_LCD_String("Mode:"); }
12831  2ba5 c60000        	ld	a,_uc_LCD_Blink_Reg
12832  2ba8 a502          	bcp	a,#2
12833  2baa 270e          	jreq	L1506
12836  2bac ae0149        	ldw	x,#L7406
12837  2baf cd0000        	call	_Display_LCD_String
12839  2bb2 2006          	jra	L1506
12840  2bb4               L3406:
12841                     ; 2300 			}else{ Display_LCD_String("Mode:"); }
12843  2bb4 ae0149        	ldw	x,#L7406
12844  2bb7 cd0000        	call	_Display_LCD_String
12846  2bba               L1506:
12847                     ; 2302 			Set_LCD_Address(LCD_Line[3u] + 5u);
12849  2bba c60003        	ld	a,_LCD_Line+3
12850  2bbd ab05          	add	a,#5
12851  2bbf cd0000        	call	_Set_LCD_Address
12853                     ; 2304 					if(uc_Target_Display_Mode == 0u){
12855  2bc2 725d0000      	tnz	_uc_Target_Display_Mode
12856  2bc6 2608          	jrne	L3506
12857                     ; 2305 						Display_LCD_String("Test_Mode1"); 
12859  2bc8 ae013e        	ldw	x,#L5506
12860  2bcb cd0000        	call	_Display_LCD_String
12863  2bce 202b          	jra	L7506
12864  2bd0               L3506:
12865                     ; 2306 					}else if(uc_Target_Display_Mode == 1u){
12867  2bd0 c60000        	ld	a,_uc_Target_Display_Mode
12868  2bd3 a101          	cp	a,#1
12869  2bd5 2608          	jrne	L1606
12870                     ; 2307 						Display_LCD_String("Test_Mode2"); 
12872  2bd7 ae0133        	ldw	x,#L3606
12873  2bda cd0000        	call	_Display_LCD_String
12876  2bdd 201c          	jra	L7506
12877  2bdf               L1606:
12878                     ; 2308 					}else if(uc_Target_Display_Mode== 2u){
12880  2bdf c60000        	ld	a,_uc_Target_Display_Mode
12881  2be2 a102          	cp	a,#2
12882  2be4 2608          	jrne	L7606
12883                     ; 2309 						Display_LCD_String("Test_Mode3"); 
12885  2be6 ae0128        	ldw	x,#L1706
12886  2be9 cd0000        	call	_Display_LCD_String
12889  2bec 200d          	jra	L7506
12890  2bee               L7606:
12891                     ; 2310 					}else if(uc_Target_Display_Mode== 3u){
12893  2bee c60000        	ld	a,_uc_Target_Display_Mode
12894  2bf1 a103          	cp	a,#3
12895  2bf3 2606          	jrne	L7506
12896                     ; 2311 						Display_LCD_String("Test_Mode4"); 
12898  2bf5 ae011d        	ldw	x,#L7706
12899  2bf8 cd0000        	call	_Display_LCD_String
12901  2bfb               L7506:
12902                     ; 2315 			return;
12904  2bfb acde2fde      	jpf	L613
12905  2bff               L1106:
12906                     ; 2317 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
12908  2bff 0f16          	clr	(OFST+0,sp)
12910  2c01               L1016:
12911                     ; 2319 			Set_LCD_Address(LCD_Line[uc_line_index]);
12913  2c01 7b16          	ld	a,(OFST+0,sp)
12914  2c03 5f            	clrw	x
12915  2c04 97            	ld	xl,a
12916  2c05 d60000        	ld	a,(_LCD_Line,x)
12917  2c08 cd0000        	call	_Set_LCD_Address
12919                     ; 2320 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
12921  2c0b 7b16          	ld	a,(OFST+0,sp)
12922  2c0d 97            	ld	xl,a
12923  2c0e a610          	ld	a,#16
12924  2c10 42            	mul	x,a
12925  2c11 1c0000        	addw	x,#_LCD_Dis_Data
12926  2c14 cd0000        	call	_Display_LCD_String
12928                     ; 2322 			if(uc_line_index == 0u){		// LINE 1
12930  2c17 0d16          	tnz	(OFST+0,sp)
12931  2c19 266a          	jrne	L7016
12932                     ; 2323 				Set_LCD_Address(LCD_Line[uc_line_index] + 2u);
12934  2c1b 7b16          	ld	a,(OFST+0,sp)
12935  2c1d 5f            	clrw	x
12936  2c1e 97            	ld	xl,a
12937  2c1f d60000        	ld	a,(_LCD_Line,x)
12938  2c22 ab02          	add	a,#2
12939  2c24 cd0000        	call	_Set_LCD_Address
12941                     ; 2324 				Num_Display_LCD(ui_Test_Cycle);		// Test_Cycle
12943  2c27 ce0023        	ldw	x,_ui_Test_Cycle
12944  2c2a cd0000        	call	_Num_Display_LCD
12946                     ; 2326 				Set_LCD_Address(LCD_Line[uc_line_index] + 6u);
12948  2c2d 7b16          	ld	a,(OFST+0,sp)
12949  2c2f 5f            	clrw	x
12950  2c30 97            	ld	xl,a
12951  2c31 d60000        	ld	a,(_LCD_Line,x)
12952  2c34 ab06          	add	a,#6
12953  2c36 cd0000        	call	_Set_LCD_Address
12955                     ; 2327 				Display_LCD_String("/");
12957  2c39 ae011b        	ldw	x,#L1116
12958  2c3c cd0000        	call	_Display_LCD_String
12960                     ; 2328 				if(uc_Target_Display_Mode == 0u){ Display_LCD_String("30sto30s"); }			
12962  2c3f 725d0000      	tnz	_uc_Target_Display_Mode
12963  2c43 260a          	jrne	L3116
12966  2c45 ae0112        	ldw	x,#L5116
12967  2c48 cd0000        	call	_Display_LCD_String
12970  2c4b ac032f03      	jpf	L1416
12971  2c4f               L3116:
12972                     ; 2329 				else if(uc_Target_Display_Mode == 1u){ Display_LCD_String("10mto10m"); }
12974  2c4f c60000        	ld	a,_uc_Target_Display_Mode
12975  2c52 a101          	cp	a,#1
12976  2c54 260a          	jrne	L1216
12979  2c56 ae0109        	ldw	x,#L3216
12980  2c59 cd0000        	call	_Display_LCD_String
12983  2c5c ac032f03      	jpf	L1416
12984  2c60               L1216:
12985                     ; 2330 				else if(uc_Target_Display_Mode == 2u){ Display_LCD_String("1hto1h"); }
12987  2c60 c60000        	ld	a,_uc_Target_Display_Mode
12988  2c63 a102          	cp	a,#2
12989  2c65 260a          	jrne	L7216
12992  2c67 ae0102        	ldw	x,#L1316
12993  2c6a cd0000        	call	_Display_LCD_String
12996  2c6d ac032f03      	jpf	L1416
12997  2c71               L7216:
12998                     ; 2331 				else if(uc_Target_Display_Mode == 3u){ Display_LCD_String("48h"); }
13000  2c71 c60000        	ld	a,_uc_Target_Display_Mode
13001  2c74 a103          	cp	a,#3
13002  2c76 2703          	jreq	L423
13003  2c78 cc2f03        	jp	L1416
13004  2c7b               L423:
13007  2c7b ae00fe        	ldw	x,#L7316
13008  2c7e cd0000        	call	_Display_LCD_String
13010  2c81 ac032f03      	jpf	L1416
13011  2c85               L7016:
13012                     ; 2334 			else if(uc_line_index == 1u){	// LINE 2	
13014  2c85 7b16          	ld	a,(OFST+0,sp)
13015  2c87 a101          	cp	a,#1
13016  2c89 2703          	jreq	L623
13017  2c8b cc2d77        	jp	L3416
13018  2c8e               L623:
13019                     ; 2335 				if(b_Com_On_flag == OFF){ Display_LCD_String("STOP"); }
13021  2c8e c6000d        	ld	a,_uc_Test_Ctrl_Reg
13022  2c91 a508          	bcp	a,#8
13023  2c93 260a          	jrne	L5416
13026  2c95 ae00f9        	ldw	x,#L7416
13027  2c98 cd0000        	call	_Display_LCD_String
13030  2c9b ac032f03      	jpf	L1416
13031  2c9f               L5416:
13032                     ; 2337 					Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
13034  2c9f 7b16          	ld	a,(OFST+0,sp)
13035  2ca1 5f            	clrw	x
13036  2ca2 97            	ld	xl,a
13037  2ca3 d60000        	ld	a,(_LCD_Line,x)
13038  2ca6 ab03          	add	a,#3
13039  2ca8 cd0000        	call	_Set_LCD_Address
13041                     ; 2338 					Num_Display_LCD(uc_Test_Step);		// Test_Cycle	
13043  2cab c60022        	ld	a,_uc_Test_Step
13044  2cae 5f            	clrw	x
13045  2caf 97            	ld	xl,a
13046  2cb0 cd0000        	call	_Num_Display_LCD
13048                     ; 2340 					Set_LCD_Address(LCD_Line[uc_line_index] + 5u);
13050  2cb3 7b16          	ld	a,(OFST+0,sp)
13051  2cb5 5f            	clrw	x
13052  2cb6 97            	ld	xl,a
13053  2cb7 d60000        	ld	a,(_LCD_Line,x)
13054  2cba ab05          	add	a,#5
13055  2cbc cd0000        	call	_Set_LCD_Address
13057                     ; 2341 					Display_LCD_String("/");
13059  2cbf ae011b        	ldw	x,#L1116
13060  2cc2 cd0000        	call	_Display_LCD_String
13062                     ; 2343 						if(uc_Target_Display_Mode == 0u){		// low,normal temp
13064  2cc5 725d0000      	tnz	_uc_Target_Display_Mode
13065  2cc9 2625          	jrne	L3516
13066                     ; 2344 							if(uc_Test_Step == 1u){ Display_LCD_String("On,30sec"); }			// 95% 30sec
13068  2ccb c60022        	ld	a,_uc_Test_Step
13069  2cce a101          	cp	a,#1
13070  2cd0 260a          	jrne	L5516
13073  2cd2 ae00f0        	ldw	x,#L7516
13074  2cd5 cd0000        	call	_Display_LCD_String
13077  2cd8 ac032f03      	jpf	L1416
13078  2cdc               L5516:
13079                     ; 2345 							else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,30sec"); }		// 0% 30sec
13081  2cdc c60022        	ld	a,_uc_Test_Step
13082  2cdf a102          	cp	a,#2
13083  2ce1 2703          	jreq	L033
13084  2ce3 cc2f03        	jp	L1416
13085  2ce6               L033:
13088  2ce6 ae00e6        	ldw	x,#L5616
13089  2ce9 cd0000        	call	_Display_LCD_String
13091  2cec ac032f03      	jpf	L1416
13092  2cf0               L3516:
13093                     ; 2348 					else if(uc_Target_Display_Mode == 1u){		// coolant spray
13095  2cf0 c60000        	ld	a,_uc_Target_Display_Mode
13096  2cf3 a101          	cp	a,#1
13097  2cf5 2625          	jrne	L1716
13098                     ; 2349 						if(uc_Test_Step == 1u){ Display_LCD_String("On,10min"); }			// 95% 10min
13100  2cf7 c60022        	ld	a,_uc_Test_Step
13101  2cfa a101          	cp	a,#1
13102  2cfc 260a          	jrne	L3716
13105  2cfe ae00dd        	ldw	x,#L5716
13106  2d01 cd0000        	call	_Display_LCD_String
13109  2d04 ac032f03      	jpf	L1416
13110  2d08               L3716:
13111                     ; 2350 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,10min"); }		// 0% 10min
13113  2d08 c60022        	ld	a,_uc_Test_Step
13114  2d0b a102          	cp	a,#2
13115  2d0d 2703          	jreq	L233
13116  2d0f cc2f03        	jp	L1416
13117  2d12               L233:
13120  2d12 ae00d3        	ldw	x,#L3026
13121  2d15 cd0000        	call	_Display_LCD_String
13123  2d18 ac032f03      	jpf	L1416
13124  2d1c               L1716:
13125                     ; 2352 					else if(uc_Target_Display_Mode == 2u){		// coolant Flooding
13127  2d1c c60000        	ld	a,_uc_Target_Display_Mode
13128  2d1f a102          	cp	a,#2
13129  2d21 2625          	jrne	L7026
13130                     ; 2353 						if(uc_Test_Step == 1u){ Display_LCD_String("On,1hour"); }			// 95% 1hour
13132  2d23 c60022        	ld	a,_uc_Test_Step
13133  2d26 a101          	cp	a,#1
13134  2d28 260a          	jrne	L1126
13137  2d2a ae00ca        	ldw	x,#L3126
13138  2d2d cd0000        	call	_Display_LCD_String
13141  2d30 ac032f03      	jpf	L1416
13142  2d34               L1126:
13143                     ; 2354 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,1hour");  }	// 0% 1hour
13145  2d34 c60022        	ld	a,_uc_Test_Step
13146  2d37 a102          	cp	a,#2
13147  2d39 2703          	jreq	L433
13148  2d3b cc2f03        	jp	L1416
13149  2d3e               L433:
13152  2d3e ae00c0        	ldw	x,#L1226
13153  2d41 cd0000        	call	_Display_LCD_String
13155  2d44 ac032f03      	jpf	L1416
13156  2d48               L7026:
13157                     ; 2356 					else if(uc_Target_Display_Mode == 3u){		
13159  2d48 c60000        	ld	a,_uc_Target_Display_Mode
13160  2d4b a103          	cp	a,#3
13161  2d4d 2703          	jreq	L633
13162  2d4f cc2f03        	jp	L1416
13163  2d52               L633:
13164                     ; 2357 						if(uc_Test_Step == 1u){ Display_LCD_String("On,48hour"); }			
13166  2d52 c60022        	ld	a,_uc_Test_Step
13167  2d55 a101          	cp	a,#1
13168  2d57 260a          	jrne	L7226
13171  2d59 ae00b6        	ldw	x,#L1326
13172  2d5c cd0000        	call	_Display_LCD_String
13175  2d5f ac032f03      	jpf	L1416
13176  2d63               L7226:
13177                     ; 2358 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,48hour");  }	
13179  2d63 c60022        	ld	a,_uc_Test_Step
13180  2d66 a102          	cp	a,#2
13181  2d68 2703          	jreq	L043
13182  2d6a cc2f03        	jp	L1416
13183  2d6d               L043:
13186  2d6d ae00ab        	ldw	x,#L7326
13187  2d70 cd0000        	call	_Display_LCD_String
13189  2d73 ac032f03      	jpf	L1416
13190  2d77               L3416:
13191                     ; 2362 			else if(uc_line_index == 2u){	// LINE 3
13193  2d77 7b16          	ld	a,(OFST+0,sp)
13194  2d79 a102          	cp	a,#2
13195  2d7b 2703          	jreq	L243
13196  2d7d cc2e41        	jp	L3426
13197  2d80               L243:
13198                     ; 2363 				Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
13200  2d80 7b16          	ld	a,(OFST+0,sp)
13201  2d82 5f            	clrw	x
13202  2d83 97            	ld	xl,a
13203  2d84 d60000        	ld	a,(_LCD_Line,x)
13204  2d87 ab03          	add	a,#3
13205  2d89 cd0000        	call	_Set_LCD_Address
13207                     ; 2364 				if(uc_Test_Step == 0u){ Display_LCD_String("000:00:00"); }
13209  2d8c 725d0022      	tnz	_uc_Test_Step
13210  2d90 260a          	jrne	L5426
13213  2d92 ae00a1        	ldw	x,#L7426
13214  2d95 cd0000        	call	_Display_LCD_String
13217  2d98 ac032f03      	jpf	L1416
13218  2d9c               L5426:
13219                     ; 2366 					if(ui_1hour_cnt == 0u){ Display_LCD_String("000"); } 
13221  2d9c ce002d        	ldw	x,_ui_1hour_cnt
13222  2d9f 2608          	jrne	L3526
13225  2da1 ae009d        	ldw	x,#L5526
13226  2da4 cd0000        	call	_Display_LCD_String
13229  2da7 2032          	jra	L7526
13230  2da9               L3526:
13231                     ; 2367 					else if(ui_1hour_cnt < 10u){ 
13233  2da9 ce002d        	ldw	x,_ui_1hour_cnt
13234  2dac a3000a        	cpw	x,#10
13235  2daf 240e          	jruge	L1626
13236                     ; 2368 						Display_LCD_String("00");
13238  2db1 ae009a        	ldw	x,#L3626
13239  2db4 cd0000        	call	_Display_LCD_String
13241                     ; 2369 						Num_Display_LCD(ui_1hour_cnt);
13243  2db7 ce002d        	ldw	x,_ui_1hour_cnt
13244  2dba cd0000        	call	_Num_Display_LCD
13247  2dbd 201c          	jra	L7526
13248  2dbf               L1626:
13249                     ; 2371 					else if(ui_1hour_cnt < 100u){ 
13251  2dbf ce002d        	ldw	x,_ui_1hour_cnt
13252  2dc2 a30064        	cpw	x,#100
13253  2dc5 240e          	jruge	L7626
13254                     ; 2372 						Display_LCD_String("0");
13256  2dc7 ae027e        	ldw	x,#L5113
13257  2dca cd0000        	call	_Display_LCD_String
13259                     ; 2373 						Num_Display_LCD(ui_1hour_cnt);
13261  2dcd ce002d        	ldw	x,_ui_1hour_cnt
13262  2dd0 cd0000        	call	_Num_Display_LCD
13265  2dd3 2006          	jra	L7526
13266  2dd5               L7626:
13267                     ; 2375 					else{ Num_Display_LCD(ui_1hour_cnt); }
13269  2dd5 ce002d        	ldw	x,_ui_1hour_cnt
13270  2dd8 cd0000        	call	_Num_Display_LCD
13272  2ddb               L7526:
13273                     ; 2376 					Display_LCD_String(":");
13275  2ddb ae0098        	ldw	x,#L3726
13276  2dde cd0000        	call	_Display_LCD_String
13278                     ; 2378 					if(ui_1min_cnt == 0u){ Display_LCD_String("00"); } 
13280  2de1 ce002b        	ldw	x,_ui_1min_cnt
13281  2de4 2608          	jrne	L5726
13284  2de6 ae009a        	ldw	x,#L3626
13285  2de9 cd0000        	call	_Display_LCD_String
13288  2dec 201c          	jra	L7726
13289  2dee               L5726:
13290                     ; 2379 					else if(ui_1min_cnt < 10u){ 
13292  2dee ce002b        	ldw	x,_ui_1min_cnt
13293  2df1 a3000a        	cpw	x,#10
13294  2df4 240e          	jruge	L1036
13295                     ; 2380 						Display_LCD_String("0");
13297  2df6 ae027e        	ldw	x,#L5113
13298  2df9 cd0000        	call	_Display_LCD_String
13300                     ; 2381 						Num_Display_LCD(ui_1min_cnt);
13302  2dfc ce002b        	ldw	x,_ui_1min_cnt
13303  2dff cd0000        	call	_Num_Display_LCD
13306  2e02 2006          	jra	L7726
13307  2e04               L1036:
13308                     ; 2383 					else{ Num_Display_LCD(ui_1min_cnt);	}
13310  2e04 ce002b        	ldw	x,_ui_1min_cnt
13311  2e07 cd0000        	call	_Num_Display_LCD
13313  2e0a               L7726:
13314                     ; 2384 					Display_LCD_String(":");
13316  2e0a ae0098        	ldw	x,#L3726
13317  2e0d cd0000        	call	_Display_LCD_String
13319                     ; 2386 					if(ui_1sec_cnt == 0u){ Display_LCD_String("00"); } 
13321  2e10 ce0029        	ldw	x,_ui_1sec_cnt
13322  2e13 260a          	jrne	L5036
13325  2e15 ae009a        	ldw	x,#L3626
13326  2e18 cd0000        	call	_Display_LCD_String
13329  2e1b ac032f03      	jpf	L1416
13330  2e1f               L5036:
13331                     ; 2387 					else if(ui_1sec_cnt < 10u){ 
13333  2e1f ce0029        	ldw	x,_ui_1sec_cnt
13334  2e22 a3000a        	cpw	x,#10
13335  2e25 2410          	jruge	L1136
13336                     ; 2388 						Display_LCD_String("0");
13338  2e27 ae027e        	ldw	x,#L5113
13339  2e2a cd0000        	call	_Display_LCD_String
13341                     ; 2389 						Num_Display_LCD(ui_1sec_cnt);
13343  2e2d ce0029        	ldw	x,_ui_1sec_cnt
13344  2e30 cd0000        	call	_Num_Display_LCD
13347  2e33 ac032f03      	jpf	L1416
13348  2e37               L1136:
13349                     ; 2391 					else{ Num_Display_LCD(ui_1sec_cnt);	}
13351  2e37 ce0029        	ldw	x,_ui_1sec_cnt
13352  2e3a cd0000        	call	_Num_Display_LCD
13354  2e3d ac032f03      	jpf	L1416
13355  2e41               L3426:
13356                     ; 2394 			else if(uc_line_index == 3u){	// LINE 4
13358  2e41 7b16          	ld	a,(OFST+0,sp)
13359  2e43 a103          	cp	a,#3
13360  2e45 2703          	jreq	L443
13361  2e47 cc2f03        	jp	L1416
13362  2e4a               L443:
13363                     ; 2395 				Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
13365  2e4a 7b16          	ld	a,(OFST+0,sp)
13366  2e4c 5f            	clrw	x
13367  2e4d 97            	ld	xl,a
13368  2e4e d60000        	ld	a,(_LCD_Line,x)
13369  2e51 ab03          	add	a,#3
13370  2e53 cd0000        	call	_Set_LCD_Address
13372                     ; 2396 				if(uc_Test_Step == 0u){ Display_LCD_String("000:00:00"); }
13374  2e56 725d0022      	tnz	_uc_Test_Step
13375  2e5a 260a          	jrne	L1236
13378  2e5c ae00a1        	ldw	x,#L7426
13379  2e5f cd0000        	call	_Display_LCD_String
13382  2e62 ac032f03      	jpf	L1416
13383  2e66               L1236:
13384                     ; 2398 					if(ui_Test_1hour_cnt == 0u){ Display_LCD_String("000"); } 
13386  2e66 ce0037        	ldw	x,_ui_Test_1hour_cnt
13387  2e69 2608          	jrne	L5236
13390  2e6b ae009d        	ldw	x,#L5526
13391  2e6e cd0000        	call	_Display_LCD_String
13394  2e71 2032          	jra	L7236
13395  2e73               L5236:
13396                     ; 2399 					else if(ui_Test_1hour_cnt < 10u){ 
13398  2e73 ce0037        	ldw	x,_ui_Test_1hour_cnt
13399  2e76 a3000a        	cpw	x,#10
13400  2e79 240e          	jruge	L1336
13401                     ; 2400 						Display_LCD_String("00");
13403  2e7b ae009a        	ldw	x,#L3626
13404  2e7e cd0000        	call	_Display_LCD_String
13406                     ; 2401 						Num_Display_LCD(ui_Test_1hour_cnt);
13408  2e81 ce0037        	ldw	x,_ui_Test_1hour_cnt
13409  2e84 cd0000        	call	_Num_Display_LCD
13412  2e87 201c          	jra	L7236
13413  2e89               L1336:
13414                     ; 2403 					else if(ui_Test_1hour_cnt < 100u){ 
13416  2e89 ce0037        	ldw	x,_ui_Test_1hour_cnt
13417  2e8c a30064        	cpw	x,#100
13418  2e8f 240e          	jruge	L5336
13419                     ; 2404 						Display_LCD_String("0");
13421  2e91 ae027e        	ldw	x,#L5113
13422  2e94 cd0000        	call	_Display_LCD_String
13424                     ; 2405 						Num_Display_LCD(ui_Test_1hour_cnt);
13426  2e97 ce0037        	ldw	x,_ui_Test_1hour_cnt
13427  2e9a cd0000        	call	_Num_Display_LCD
13430  2e9d 2006          	jra	L7236
13431  2e9f               L5336:
13432                     ; 2407 					else{ Num_Display_LCD(ui_Test_1hour_cnt); }
13434  2e9f ce0037        	ldw	x,_ui_Test_1hour_cnt
13435  2ea2 cd0000        	call	_Num_Display_LCD
13437  2ea5               L7236:
13438                     ; 2408 					Display_LCD_String(":");
13440  2ea5 ae0098        	ldw	x,#L3726
13441  2ea8 cd0000        	call	_Display_LCD_String
13443                     ; 2410 					if(ui_Test_1min_cnt == 0u){ Display_LCD_String("00"); } 
13445  2eab ce0035        	ldw	x,_ui_Test_1min_cnt
13446  2eae 2608          	jrne	L1436
13449  2eb0 ae009a        	ldw	x,#L3626
13450  2eb3 cd0000        	call	_Display_LCD_String
13453  2eb6 201c          	jra	L3436
13454  2eb8               L1436:
13455                     ; 2411 					else if(ui_Test_1min_cnt < 10u){ 
13457  2eb8 ce0035        	ldw	x,_ui_Test_1min_cnt
13458  2ebb a3000a        	cpw	x,#10
13459  2ebe 240e          	jruge	L5436
13460                     ; 2412 						Display_LCD_String("0");
13462  2ec0 ae027e        	ldw	x,#L5113
13463  2ec3 cd0000        	call	_Display_LCD_String
13465                     ; 2413 						Num_Display_LCD(ui_Test_1min_cnt);
13467  2ec6 ce0035        	ldw	x,_ui_Test_1min_cnt
13468  2ec9 cd0000        	call	_Num_Display_LCD
13471  2ecc 2006          	jra	L3436
13472  2ece               L5436:
13473                     ; 2415 					else{ Num_Display_LCD(ui_Test_1min_cnt);	}
13475  2ece ce0035        	ldw	x,_ui_Test_1min_cnt
13476  2ed1 cd0000        	call	_Num_Display_LCD
13478  2ed4               L3436:
13479                     ; 2416 					Display_LCD_String(":");
13481  2ed4 ae0098        	ldw	x,#L3726
13482  2ed7 cd0000        	call	_Display_LCD_String
13484                     ; 2418 					if(ui_Test_1sec_cnt == 0u){ Display_LCD_String("00"); } 
13486  2eda ce0033        	ldw	x,_ui_Test_1sec_cnt
13487  2edd 2608          	jrne	L1536
13490  2edf ae009a        	ldw	x,#L3626
13491  2ee2 cd0000        	call	_Display_LCD_String
13494  2ee5 201c          	jra	L1416
13495  2ee7               L1536:
13496                     ; 2419 					else if(ui_Test_1sec_cnt < 10u){ 
13498  2ee7 ce0033        	ldw	x,_ui_Test_1sec_cnt
13499  2eea a3000a        	cpw	x,#10
13500  2eed 240e          	jruge	L5536
13501                     ; 2420 						Display_LCD_String("0");
13503  2eef ae027e        	ldw	x,#L5113
13504  2ef2 cd0000        	call	_Display_LCD_String
13506                     ; 2421 						Num_Display_LCD(ui_Test_1sec_cnt);
13508  2ef5 ce0033        	ldw	x,_ui_Test_1sec_cnt
13509  2ef8 cd0000        	call	_Num_Display_LCD
13512  2efb 2006          	jra	L1416
13513  2efd               L5536:
13514                     ; 2423 					else{ Num_Display_LCD(ui_Test_1sec_cnt);	}
13516  2efd ce0033        	ldw	x,_ui_Test_1sec_cnt
13517  2f00 cd0000        	call	_Num_Display_LCD
13519  2f03               L1416:
13520                     ; 2317 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
13522  2f03 0c16          	inc	(OFST+0,sp)
13526  2f05 7b16          	ld	a,(OFST+0,sp)
13527  2f07 a104          	cp	a,#4
13528  2f09 2403          	jruge	L643
13529  2f0b cc2c01        	jp	L1016
13530  2f0e               L643:
13531  2f0e               L7006:
13532                     ; 2429 	if(uc_Test_Page_Now == (U8)(1)){
13534  2f0e c60004        	ld	a,_uc_Test_Page_Now
13535  2f11 a101          	cp	a,#1
13536  2f13 2703          	jreq	L053
13537  2f15 cc32f4        	jp	L1636
13538  2f18               L053:
13539                     ; 2430 		if(b_Test_Option_flag == ON){
13541  2f18 c6000d        	ld	a,_uc_Test_Ctrl_Reg
13542  2f1b a510          	bcp	a,#16
13543  2f1d 2603          	jrne	L253
13544  2f1f cc2fe1        	jp	L3636
13545  2f22               L253:
13546                     ; 2431 			Set_LCD_Address(LCD_Line[0u]);
13548  2f22 c60000        	ld	a,_LCD_Line
13549  2f25 cd0000        	call	_Set_LCD_Address
13551                     ; 2432 			Display_LCD_String("*OPTION*");
13553  2f28 ae02aa        	ldw	x,#L7603
13554  2f2b cd0000        	call	_Display_LCD_String
13556                     ; 2435 			Set_LCD_Address(LCD_Line[1]);
13558  2f2e c60001        	ld	a,_LCD_Line+1
13559  2f31 cd0000        	call	_Set_LCD_Address
13561                     ; 2436 				if(b_Blink_250_Flag == ON){
13563  2f34 c60000        	ld	a,_uc_LCD_Blink_Reg
13564  2f37 a502          	bcp	a,#2
13565  2f39 2739          	jreq	L5636
13566                     ; 2437 					if(uc_Target_Display_Mode == 0u){ Display_LCD_String("30s_OFF_30s_On"); }			// low,Nomal Temp
13568  2f3b 725d0000      	tnz	_uc_Target_Display_Mode
13569  2f3f 2608          	jrne	L7636
13572  2f41 ae0089        	ldw	x,#L1736
13573  2f44 cd0000        	call	_Display_LCD_String
13576  2f47 202b          	jra	L5636
13577  2f49               L7636:
13578                     ; 2438 					else if(uc_Target_Display_Mode == 1u){ Display_LCD_String("10m_OFF_10m_On"); }	//coolant Spray	
13580  2f49 c60000        	ld	a,_uc_Target_Display_Mode
13581  2f4c a101          	cp	a,#1
13582  2f4e 2608          	jrne	L5736
13585  2f50 ae007a        	ldw	x,#L7736
13586  2f53 cd0000        	call	_Display_LCD_String
13589  2f56 201c          	jra	L5636
13590  2f58               L5736:
13591                     ; 2439 					else if(uc_Target_Display_Mode == 2u){ Display_LCD_String("1h_OFF_1h_On"); }		// coolant Flooding
13593  2f58 c60000        	ld	a,_uc_Target_Display_Mode
13594  2f5b a102          	cp	a,#2
13595  2f5d 2608          	jrne	L3046
13598  2f5f ae006d        	ldw	x,#L5046
13599  2f62 cd0000        	call	_Display_LCD_String
13602  2f65 200d          	jra	L5636
13603  2f67               L3046:
13604                     ; 2440 					else if(uc_Target_Display_Mode == 3u){ Display_LCD_String("48h_On"); }
13606  2f67 c60000        	ld	a,_uc_Target_Display_Mode
13607  2f6a a103          	cp	a,#3
13608  2f6c 2606          	jrne	L5636
13611  2f6e ae0066        	ldw	x,#L3146
13612  2f71 cd0000        	call	_Display_LCD_String
13614  2f74               L5636:
13615                     ; 2443 			Set_LCD_Address(LCD_Line[3u]);
13617  2f74 c60003        	ld	a,_LCD_Line+3
13618  2f77 cd0000        	call	_Set_LCD_Address
13620                     ; 2444 			if((b_Data_Select_flag == ON) && (uc_Test_Data_Select_Num == 3u)){
13622  2f7a c6000d        	ld	a,_uc_Test_Ctrl_Reg
13623  2f7d a502          	bcp	a,#2
13624  2f7f 2716          	jreq	L5146
13626  2f81 c60002        	ld	a,_uc_Test_Data_Select_Num
13627  2f84 a103          	cp	a,#3
13628  2f86 260f          	jrne	L5146
13629                     ; 2445 				if(b_Blink_250_Flag){ Display_LCD_String("Mode:"); }
13631  2f88 c60000        	ld	a,_uc_LCD_Blink_Reg
13632  2f8b a502          	bcp	a,#2
13633  2f8d 270e          	jreq	L1246
13636  2f8f ae0149        	ldw	x,#L7406
13637  2f92 cd0000        	call	_Display_LCD_String
13639  2f95 2006          	jra	L1246
13640  2f97               L5146:
13641                     ; 2446 			}else{ Display_LCD_String("Mode:"); }
13643  2f97 ae0149        	ldw	x,#L7406
13644  2f9a cd0000        	call	_Display_LCD_String
13646  2f9d               L1246:
13647                     ; 2448 			Set_LCD_Address(LCD_Line[3u] + 5u);
13649  2f9d c60003        	ld	a,_LCD_Line+3
13650  2fa0 ab05          	add	a,#5
13651  2fa2 cd0000        	call	_Set_LCD_Address
13653                     ; 2450 					if(uc_Target_Display_Mode == 0u){
13655  2fa5 725d0000      	tnz	_uc_Target_Display_Mode
13656  2fa9 2608          	jrne	L3246
13657                     ; 2451 						Display_LCD_String("Test_Mode1"); 
13659  2fab ae013e        	ldw	x,#L5506
13660  2fae cd0000        	call	_Display_LCD_String
13663  2fb1 202b          	jra	L5246
13664  2fb3               L3246:
13665                     ; 2452 					}else if(uc_Target_Display_Mode == 1u){
13667  2fb3 c60000        	ld	a,_uc_Target_Display_Mode
13668  2fb6 a101          	cp	a,#1
13669  2fb8 2608          	jrne	L7246
13670                     ; 2453 						Display_LCD_String("Test_Mode2"); 
13672  2fba ae0133        	ldw	x,#L3606
13673  2fbd cd0000        	call	_Display_LCD_String
13676  2fc0 201c          	jra	L5246
13677  2fc2               L7246:
13678                     ; 2454 					}else if(uc_Target_Display_Mode== 2u){
13680  2fc2 c60000        	ld	a,_uc_Target_Display_Mode
13681  2fc5 a102          	cp	a,#2
13682  2fc7 2608          	jrne	L3346
13683                     ; 2455 						Display_LCD_String("Test_Mode3"); 
13685  2fc9 ae0128        	ldw	x,#L1706
13686  2fcc cd0000        	call	_Display_LCD_String
13689  2fcf 200d          	jra	L5246
13690  2fd1               L3346:
13691                     ; 2456 					}else if(uc_Target_Display_Mode== 3u){
13693  2fd1 c60000        	ld	a,_uc_Target_Display_Mode
13694  2fd4 a103          	cp	a,#3
13695  2fd6 2606          	jrne	L5246
13696                     ; 2457 						Display_LCD_String("Test_Mode4"); 
13698  2fd8 ae011d        	ldw	x,#L7706
13699  2fdb cd0000        	call	_Display_LCD_String
13701  2fde               L5246:
13702                     ; 2461 			return;
13703  2fde               L613:
13706  2fde 5b16          	addw	sp,#22
13707  2fe0 81            	ret
13708  2fe1               L3636:
13709                     ; 2463 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
13711  2fe1 0f16          	clr	(OFST+0,sp)
13713  2fe3               L1446:
13714                     ; 2465 			Set_LCD_Address(LCD_Line[uc_line_index]);
13716  2fe3 7b16          	ld	a,(OFST+0,sp)
13717  2fe5 5f            	clrw	x
13718  2fe6 97            	ld	xl,a
13719  2fe7 d60000        	ld	a,(_LCD_Line,x)
13720  2fea cd0000        	call	_Set_LCD_Address
13722                     ; 2466 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
13724  2fed 7b16          	ld	a,(OFST+0,sp)
13725  2fef 97            	ld	xl,a
13726  2ff0 a610          	ld	a,#16
13727  2ff2 42            	mul	x,a
13728  2ff3 1c0000        	addw	x,#_LCD_Dis_Data
13729  2ff6 cd0000        	call	_Display_LCD_String
13731                     ; 2468 			if(uc_line_index == 0u){		// LINE 1
13733  2ff9 0d16          	tnz	(OFST+0,sp)
13734  2ffb 266a          	jrne	L7446
13735                     ; 2469 				Set_LCD_Address(LCD_Line[uc_line_index] + 2u);
13737  2ffd 7b16          	ld	a,(OFST+0,sp)
13738  2fff 5f            	clrw	x
13739  3000 97            	ld	xl,a
13740  3001 d60000        	ld	a,(_LCD_Line,x)
13741  3004 ab02          	add	a,#2
13742  3006 cd0000        	call	_Set_LCD_Address
13744                     ; 2470 				Num_Display_LCD(ui_Test_Cycle);		// Test_Cycle
13746  3009 ce0023        	ldw	x,_ui_Test_Cycle
13747  300c cd0000        	call	_Num_Display_LCD
13749                     ; 2472 				Set_LCD_Address(LCD_Line[uc_line_index] + 6u);
13751  300f 7b16          	ld	a,(OFST+0,sp)
13752  3011 5f            	clrw	x
13753  3012 97            	ld	xl,a
13754  3013 d60000        	ld	a,(_LCD_Line,x)
13755  3016 ab06          	add	a,#6
13756  3018 cd0000        	call	_Set_LCD_Address
13758                     ; 2473 				Display_LCD_String("/");
13760  301b ae011b        	ldw	x,#L1116
13761  301e cd0000        	call	_Display_LCD_String
13763                     ; 2474 				if(uc_Target_Display_Mode == 0u){ Display_LCD_String("30sto30s"); }			
13765  3021 725d0000      	tnz	_uc_Target_Display_Mode
13766  3025 260a          	jrne	L1546
13769  3027 ae0112        	ldw	x,#L5116
13770  302a cd0000        	call	_Display_LCD_String
13773  302d ace532e5      	jpf	L7646
13774  3031               L1546:
13775                     ; 2475 				else if(uc_Target_Display_Mode == 1u){ Display_LCD_String("10mto10m"); }
13777  3031 c60000        	ld	a,_uc_Target_Display_Mode
13778  3034 a101          	cp	a,#1
13779  3036 260a          	jrne	L5546
13782  3038 ae0109        	ldw	x,#L3216
13783  303b cd0000        	call	_Display_LCD_String
13786  303e ace532e5      	jpf	L7646
13787  3042               L5546:
13788                     ; 2476 				else if(uc_Target_Display_Mode == 2u){ Display_LCD_String("1hto1h"); }
13790  3042 c60000        	ld	a,_uc_Target_Display_Mode
13791  3045 a102          	cp	a,#2
13792  3047 260a          	jrne	L1646
13795  3049 ae0102        	ldw	x,#L1316
13796  304c cd0000        	call	_Display_LCD_String
13799  304f ace532e5      	jpf	L7646
13800  3053               L1646:
13801                     ; 2477 				else if(uc_Target_Display_Mode == 3u){ Display_LCD_String("48h"); }
13803  3053 c60000        	ld	a,_uc_Target_Display_Mode
13804  3056 a103          	cp	a,#3
13805  3058 2703          	jreq	L453
13806  305a cc32e5        	jp	L7646
13807  305d               L453:
13810  305d ae00fe        	ldw	x,#L7316
13811  3060 cd0000        	call	_Display_LCD_String
13813  3063 ace532e5      	jpf	L7646
13814  3067               L7446:
13815                     ; 2480 			else if(uc_line_index == 1u){	// LINE 2	
13817  3067 7b16          	ld	a,(OFST+0,sp)
13818  3069 a101          	cp	a,#1
13819  306b 2703          	jreq	L653
13820  306d cc3159        	jp	L1746
13821  3070               L653:
13822                     ; 2481 				if(b_Com_On_flag == OFF){ Display_LCD_String("STOP"); }
13824  3070 c6000d        	ld	a,_uc_Test_Ctrl_Reg
13825  3073 a508          	bcp	a,#8
13826  3075 260a          	jrne	L3746
13829  3077 ae00f9        	ldw	x,#L7416
13830  307a cd0000        	call	_Display_LCD_String
13833  307d ace532e5      	jpf	L7646
13834  3081               L3746:
13835                     ; 2483 					Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
13837  3081 7b16          	ld	a,(OFST+0,sp)
13838  3083 5f            	clrw	x
13839  3084 97            	ld	xl,a
13840  3085 d60000        	ld	a,(_LCD_Line,x)
13841  3088 ab03          	add	a,#3
13842  308a cd0000        	call	_Set_LCD_Address
13844                     ; 2484 					Num_Display_LCD(uc_Test_Step);		// Test_Cycle	
13846  308d c60022        	ld	a,_uc_Test_Step
13847  3090 5f            	clrw	x
13848  3091 97            	ld	xl,a
13849  3092 cd0000        	call	_Num_Display_LCD
13851                     ; 2486 					Set_LCD_Address(LCD_Line[uc_line_index] + 5u);
13853  3095 7b16          	ld	a,(OFST+0,sp)
13854  3097 5f            	clrw	x
13855  3098 97            	ld	xl,a
13856  3099 d60000        	ld	a,(_LCD_Line,x)
13857  309c ab05          	add	a,#5
13858  309e cd0000        	call	_Set_LCD_Address
13860                     ; 2487 					Display_LCD_String("/");
13862  30a1 ae011b        	ldw	x,#L1116
13863  30a4 cd0000        	call	_Display_LCD_String
13865                     ; 2489 						if(uc_Target_Display_Mode == 0u){		// low,normal temp
13867  30a7 725d0000      	tnz	_uc_Target_Display_Mode
13868  30ab 2625          	jrne	L7746
13869                     ; 2490 							if(uc_Test_Step == 1u){ Display_LCD_String("On,30sec"); }			// 95% 30sec
13871  30ad c60022        	ld	a,_uc_Test_Step
13872  30b0 a101          	cp	a,#1
13873  30b2 260a          	jrne	L1056
13876  30b4 ae00f0        	ldw	x,#L7516
13877  30b7 cd0000        	call	_Display_LCD_String
13880  30ba ace532e5      	jpf	L7646
13881  30be               L1056:
13882                     ; 2491 							else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,30sec"); }		// 0% 30sec
13884  30be c60022        	ld	a,_uc_Test_Step
13885  30c1 a102          	cp	a,#2
13886  30c3 2703          	jreq	L063
13887  30c5 cc32e5        	jp	L7646
13888  30c8               L063:
13891  30c8 ae00e6        	ldw	x,#L5616
13892  30cb cd0000        	call	_Display_LCD_String
13894  30ce ace532e5      	jpf	L7646
13895  30d2               L7746:
13896                     ; 2494 					else if(uc_Target_Display_Mode == 1u){		// coolant spray
13898  30d2 c60000        	ld	a,_uc_Target_Display_Mode
13899  30d5 a101          	cp	a,#1
13900  30d7 2625          	jrne	L1156
13901                     ; 2495 						if(uc_Test_Step == 1u){ Display_LCD_String("On,10min"); }			// 95% 10min
13903  30d9 c60022        	ld	a,_uc_Test_Step
13904  30dc a101          	cp	a,#1
13905  30de 260a          	jrne	L3156
13908  30e0 ae00dd        	ldw	x,#L5716
13909  30e3 cd0000        	call	_Display_LCD_String
13912  30e6 ace532e5      	jpf	L7646
13913  30ea               L3156:
13914                     ; 2496 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,10min"); }		// 0% 10min
13916  30ea c60022        	ld	a,_uc_Test_Step
13917  30ed a102          	cp	a,#2
13918  30ef 2703          	jreq	L263
13919  30f1 cc32e5        	jp	L7646
13920  30f4               L263:
13923  30f4 ae00d3        	ldw	x,#L3026
13924  30f7 cd0000        	call	_Display_LCD_String
13926  30fa ace532e5      	jpf	L7646
13927  30fe               L1156:
13928                     ; 2498 					else if(uc_Target_Display_Mode == 2u){		// coolant Flooding
13930  30fe c60000        	ld	a,_uc_Target_Display_Mode
13931  3101 a102          	cp	a,#2
13932  3103 2625          	jrne	L3256
13933                     ; 2499 						if(uc_Test_Step == 1u){ Display_LCD_String("On,1hour"); }			// 95% 1hour
13935  3105 c60022        	ld	a,_uc_Test_Step
13936  3108 a101          	cp	a,#1
13937  310a 260a          	jrne	L5256
13940  310c ae00ca        	ldw	x,#L3126
13941  310f cd0000        	call	_Display_LCD_String
13944  3112 ace532e5      	jpf	L7646
13945  3116               L5256:
13946                     ; 2500 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,1hour");  }	// 0% 1hour
13948  3116 c60022        	ld	a,_uc_Test_Step
13949  3119 a102          	cp	a,#2
13950  311b 2703          	jreq	L463
13951  311d cc32e5        	jp	L7646
13952  3120               L463:
13955  3120 ae00c0        	ldw	x,#L1226
13956  3123 cd0000        	call	_Display_LCD_String
13958  3126 ace532e5      	jpf	L7646
13959  312a               L3256:
13960                     ; 2502 					else if(uc_Target_Display_Mode == 3u){		
13962  312a c60000        	ld	a,_uc_Target_Display_Mode
13963  312d a103          	cp	a,#3
13964  312f 2703          	jreq	L663
13965  3131 cc32e5        	jp	L7646
13966  3134               L663:
13967                     ; 2503 						if(uc_Test_Step == 1u){ Display_LCD_String("On,48hour"); }			
13969  3134 c60022        	ld	a,_uc_Test_Step
13970  3137 a101          	cp	a,#1
13971  3139 260a          	jrne	L7356
13974  313b ae00b6        	ldw	x,#L1326
13975  313e cd0000        	call	_Display_LCD_String
13978  3141 ace532e5      	jpf	L7646
13979  3145               L7356:
13980                     ; 2504 						else if(uc_Test_Step == 2u){ Display_LCD_String("OFF,48hour");  }	
13982  3145 c60022        	ld	a,_uc_Test_Step
13983  3148 a102          	cp	a,#2
13984  314a 2703          	jreq	L073
13985  314c cc32e5        	jp	L7646
13986  314f               L073:
13989  314f ae00ab        	ldw	x,#L7326
13990  3152 cd0000        	call	_Display_LCD_String
13992  3155 ace532e5      	jpf	L7646
13993  3159               L1746:
13994                     ; 2508 			else if(uc_line_index == 2u){	// LINE 3
13996  3159 7b16          	ld	a,(OFST+0,sp)
13997  315b a102          	cp	a,#2
13998  315d 2703          	jreq	L273
13999  315f cc3223        	jp	L7456
14000  3162               L273:
14001                     ; 2509 				Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
14003  3162 7b16          	ld	a,(OFST+0,sp)
14004  3164 5f            	clrw	x
14005  3165 97            	ld	xl,a
14006  3166 d60000        	ld	a,(_LCD_Line,x)
14007  3169 ab03          	add	a,#3
14008  316b cd0000        	call	_Set_LCD_Address
14010                     ; 2510 				if(uc_Test_Step == 0u){ Display_LCD_String("000:00:00"); }
14012  316e 725d0022      	tnz	_uc_Test_Step
14013  3172 260a          	jrne	L1556
14016  3174 ae00a1        	ldw	x,#L7426
14017  3177 cd0000        	call	_Display_LCD_String
14020  317a ace532e5      	jpf	L7646
14021  317e               L1556:
14022                     ; 2512 					if(ui_1hour_cnt == 0u){ Display_LCD_String("000"); } 
14024  317e ce002d        	ldw	x,_ui_1hour_cnt
14025  3181 2608          	jrne	L5556
14028  3183 ae009d        	ldw	x,#L5526
14029  3186 cd0000        	call	_Display_LCD_String
14032  3189 2032          	jra	L7556
14033  318b               L5556:
14034                     ; 2513 					else if(ui_1hour_cnt < 10u){ 
14036  318b ce002d        	ldw	x,_ui_1hour_cnt
14037  318e a3000a        	cpw	x,#10
14038  3191 240e          	jruge	L1656
14039                     ; 2514 						Display_LCD_String("00");
14041  3193 ae009a        	ldw	x,#L3626
14042  3196 cd0000        	call	_Display_LCD_String
14044                     ; 2515 						Num_Display_LCD(ui_1hour_cnt);
14046  3199 ce002d        	ldw	x,_ui_1hour_cnt
14047  319c cd0000        	call	_Num_Display_LCD
14050  319f 201c          	jra	L7556
14051  31a1               L1656:
14052                     ; 2517 					else if(ui_1hour_cnt < 100u){ 
14054  31a1 ce002d        	ldw	x,_ui_1hour_cnt
14055  31a4 a30064        	cpw	x,#100
14056  31a7 240e          	jruge	L5656
14057                     ; 2518 						Display_LCD_String("0");
14059  31a9 ae027e        	ldw	x,#L5113
14060  31ac cd0000        	call	_Display_LCD_String
14062                     ; 2519 						Num_Display_LCD(ui_1hour_cnt);
14064  31af ce002d        	ldw	x,_ui_1hour_cnt
14065  31b2 cd0000        	call	_Num_Display_LCD
14068  31b5 2006          	jra	L7556
14069  31b7               L5656:
14070                     ; 2521 					else{ Num_Display_LCD(ui_1hour_cnt); }
14072  31b7 ce002d        	ldw	x,_ui_1hour_cnt
14073  31ba cd0000        	call	_Num_Display_LCD
14075  31bd               L7556:
14076                     ; 2522 					Display_LCD_String(":");
14078  31bd ae0098        	ldw	x,#L3726
14079  31c0 cd0000        	call	_Display_LCD_String
14081                     ; 2524 					if(ui_1min_cnt == 0u){ Display_LCD_String("00"); } 
14083  31c3 ce002b        	ldw	x,_ui_1min_cnt
14084  31c6 2608          	jrne	L1756
14087  31c8 ae009a        	ldw	x,#L3626
14088  31cb cd0000        	call	_Display_LCD_String
14091  31ce 201c          	jra	L3756
14092  31d0               L1756:
14093                     ; 2525 					else if(ui_1min_cnt < 10u){ 
14095  31d0 ce002b        	ldw	x,_ui_1min_cnt
14096  31d3 a3000a        	cpw	x,#10
14097  31d6 240e          	jruge	L5756
14098                     ; 2526 						Display_LCD_String("0");
14100  31d8 ae027e        	ldw	x,#L5113
14101  31db cd0000        	call	_Display_LCD_String
14103                     ; 2527 						Num_Display_LCD(ui_1min_cnt);
14105  31de ce002b        	ldw	x,_ui_1min_cnt
14106  31e1 cd0000        	call	_Num_Display_LCD
14109  31e4 2006          	jra	L3756
14110  31e6               L5756:
14111                     ; 2529 					else{ Num_Display_LCD(ui_1min_cnt);	}
14113  31e6 ce002b        	ldw	x,_ui_1min_cnt
14114  31e9 cd0000        	call	_Num_Display_LCD
14116  31ec               L3756:
14117                     ; 2530 					Display_LCD_String(":");
14119  31ec ae0098        	ldw	x,#L3726
14120  31ef cd0000        	call	_Display_LCD_String
14122                     ; 2532 					if(ui_1sec_cnt == 0u){ Display_LCD_String("00"); } 
14124  31f2 ce0029        	ldw	x,_ui_1sec_cnt
14125  31f5 260a          	jrne	L1066
14128  31f7 ae009a        	ldw	x,#L3626
14129  31fa cd0000        	call	_Display_LCD_String
14132  31fd ace532e5      	jpf	L7646
14133  3201               L1066:
14134                     ; 2533 					else if(ui_1sec_cnt < 10u){ 
14136  3201 ce0029        	ldw	x,_ui_1sec_cnt
14137  3204 a3000a        	cpw	x,#10
14138  3207 2410          	jruge	L5066
14139                     ; 2534 						Display_LCD_String("0");
14141  3209 ae027e        	ldw	x,#L5113
14142  320c cd0000        	call	_Display_LCD_String
14144                     ; 2535 						Num_Display_LCD(ui_1sec_cnt);
14146  320f ce0029        	ldw	x,_ui_1sec_cnt
14147  3212 cd0000        	call	_Num_Display_LCD
14150  3215 ace532e5      	jpf	L7646
14151  3219               L5066:
14152                     ; 2537 					else{ Num_Display_LCD(ui_1sec_cnt);	}
14154  3219 ce0029        	ldw	x,_ui_1sec_cnt
14155  321c cd0000        	call	_Num_Display_LCD
14157  321f ace532e5      	jpf	L7646
14158  3223               L7456:
14159                     ; 2540 			else if(uc_line_index == 3u){	// LINE 4
14161  3223 7b16          	ld	a,(OFST+0,sp)
14162  3225 a103          	cp	a,#3
14163  3227 2703          	jreq	L473
14164  3229 cc32e5        	jp	L7646
14165  322c               L473:
14166                     ; 2541 				Set_LCD_Address(LCD_Line[uc_line_index] + 3u);
14168  322c 7b16          	ld	a,(OFST+0,sp)
14169  322e 5f            	clrw	x
14170  322f 97            	ld	xl,a
14171  3230 d60000        	ld	a,(_LCD_Line,x)
14172  3233 ab03          	add	a,#3
14173  3235 cd0000        	call	_Set_LCD_Address
14175                     ; 2542 				if(uc_Test_Step == 0u){ Display_LCD_String("000:00:00"); }
14177  3238 725d0022      	tnz	_uc_Test_Step
14178  323c 260a          	jrne	L5166
14181  323e ae00a1        	ldw	x,#L7426
14182  3241 cd0000        	call	_Display_LCD_String
14185  3244 ace532e5      	jpf	L7646
14186  3248               L5166:
14187                     ; 2544 					if(ui_Test_1hour_cnt == 0u){ Display_LCD_String("000"); } 
14189  3248 ce0037        	ldw	x,_ui_Test_1hour_cnt
14190  324b 2608          	jrne	L1266
14193  324d ae009d        	ldw	x,#L5526
14194  3250 cd0000        	call	_Display_LCD_String
14197  3253 2032          	jra	L3266
14198  3255               L1266:
14199                     ; 2545 					else if(ui_Test_1hour_cnt < 10u){ 
14201  3255 ce0037        	ldw	x,_ui_Test_1hour_cnt
14202  3258 a3000a        	cpw	x,#10
14203  325b 240e          	jruge	L5266
14204                     ; 2546 						Display_LCD_String("00");
14206  325d ae009a        	ldw	x,#L3626
14207  3260 cd0000        	call	_Display_LCD_String
14209                     ; 2547 						Num_Display_LCD(ui_Test_1hour_cnt);
14211  3263 ce0037        	ldw	x,_ui_Test_1hour_cnt
14212  3266 cd0000        	call	_Num_Display_LCD
14215  3269 201c          	jra	L3266
14216  326b               L5266:
14217                     ; 2549 					else if(ui_Test_1hour_cnt < 100u){ 
14219  326b ce0037        	ldw	x,_ui_Test_1hour_cnt
14220  326e a30064        	cpw	x,#100
14221  3271 240e          	jruge	L1366
14222                     ; 2550 						Display_LCD_String("0");
14224  3273 ae027e        	ldw	x,#L5113
14225  3276 cd0000        	call	_Display_LCD_String
14227                     ; 2551 						Num_Display_LCD(ui_Test_1hour_cnt);
14229  3279 ce0037        	ldw	x,_ui_Test_1hour_cnt
14230  327c cd0000        	call	_Num_Display_LCD
14233  327f 2006          	jra	L3266
14234  3281               L1366:
14235                     ; 2553 					else{ Num_Display_LCD(ui_Test_1hour_cnt); }
14237  3281 ce0037        	ldw	x,_ui_Test_1hour_cnt
14238  3284 cd0000        	call	_Num_Display_LCD
14240  3287               L3266:
14241                     ; 2554 					Display_LCD_String(":");
14243  3287 ae0098        	ldw	x,#L3726
14244  328a cd0000        	call	_Display_LCD_String
14246                     ; 2556 					if(ui_Test_1min_cnt == 0u){ Display_LCD_String("00"); } 
14248  328d ce0035        	ldw	x,_ui_Test_1min_cnt
14249  3290 2608          	jrne	L5366
14252  3292 ae009a        	ldw	x,#L3626
14253  3295 cd0000        	call	_Display_LCD_String
14256  3298 201c          	jra	L7366
14257  329a               L5366:
14258                     ; 2557 					else if(ui_Test_1min_cnt < 10u){ 
14260  329a ce0035        	ldw	x,_ui_Test_1min_cnt
14261  329d a3000a        	cpw	x,#10
14262  32a0 240e          	jruge	L1466
14263                     ; 2558 						Display_LCD_String("0");
14265  32a2 ae027e        	ldw	x,#L5113
14266  32a5 cd0000        	call	_Display_LCD_String
14268                     ; 2559 						Num_Display_LCD(ui_Test_1min_cnt);
14270  32a8 ce0035        	ldw	x,_ui_Test_1min_cnt
14271  32ab cd0000        	call	_Num_Display_LCD
14274  32ae 2006          	jra	L7366
14275  32b0               L1466:
14276                     ; 2561 					else{ Num_Display_LCD(ui_Test_1min_cnt);	}
14278  32b0 ce0035        	ldw	x,_ui_Test_1min_cnt
14279  32b3 cd0000        	call	_Num_Display_LCD
14281  32b6               L7366:
14282                     ; 2562 					Display_LCD_String(":");
14284  32b6 ae0098        	ldw	x,#L3726
14285  32b9 cd0000        	call	_Display_LCD_String
14287                     ; 2564 					if(ui_Test_1sec_cnt == 0u){ Display_LCD_String("00"); } 
14289  32bc ce0033        	ldw	x,_ui_Test_1sec_cnt
14290  32bf 2608          	jrne	L5466
14293  32c1 ae009a        	ldw	x,#L3626
14294  32c4 cd0000        	call	_Display_LCD_String
14297  32c7 201c          	jra	L7646
14298  32c9               L5466:
14299                     ; 2565 					else if(ui_Test_1sec_cnt < 10u){ 
14301  32c9 ce0033        	ldw	x,_ui_Test_1sec_cnt
14302  32cc a3000a        	cpw	x,#10
14303  32cf 240e          	jruge	L1566
14304                     ; 2566 						Display_LCD_String("0");
14306  32d1 ae027e        	ldw	x,#L5113
14307  32d4 cd0000        	call	_Display_LCD_String
14309                     ; 2567 						Num_Display_LCD(ui_Test_1sec_cnt);
14311  32d7 ce0033        	ldw	x,_ui_Test_1sec_cnt
14312  32da cd0000        	call	_Num_Display_LCD
14315  32dd 2006          	jra	L7646
14316  32df               L1566:
14317                     ; 2569 					else{ Num_Display_LCD(ui_Test_1sec_cnt);	}
14319  32df ce0033        	ldw	x,_ui_Test_1sec_cnt
14320  32e2 cd0000        	call	_Num_Display_LCD
14322  32e5               L7646:
14323                     ; 2463 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
14325  32e5 0c16          	inc	(OFST+0,sp)
14329  32e7 7b16          	ld	a,(OFST+0,sp)
14330  32e9 a104          	cp	a,#4
14331  32eb 2403          	jruge	L673
14332  32ed cc2fe3        	jp	L1446
14333  32f0               L673:
14335  32f0 aca73da7      	jpf	L5566
14336  32f4               L1636:
14337                     ; 2575 	else if(uc_Test_Page_Now == (U8)(2)){			//page 1
14339  32f4 c60004        	ld	a,_uc_Test_Page_Now
14340  32f7 a102          	cp	a,#2
14341  32f9 2703          	jreq	L004
14342  32fb cc38ee        	jp	L7566
14343  32fe               L004:
14344                     ; 2576 		if(b_Test_Option_flag == ON){
14346  32fe c6000d        	ld	a,_uc_Test_Ctrl_Reg
14347  3301 a510          	bcp	a,#16
14348  3303 2779          	jreq	L1666
14349                     ; 2577 			Set_LCD_Address(LCD_Line[0]);
14351  3305 c60000        	ld	a,_LCD_Line
14352  3308 cd0000        	call	_Set_LCD_Address
14354                     ; 2578 			Display_LCD_String("*OPTION*");
14356  330b ae02aa        	ldw	x,#L7603
14357  330e cd0000        	call	_Display_LCD_String
14359                     ; 2580 			if(uc_Target_Display_Mode == (U8)(0)){
14361  3311 725d0000      	tnz	_uc_Target_Display_Mode
14362  3315 260e          	jrne	L3666
14363                     ; 2581 				Set_LCD_Address(LCD_Line[1]);
14365  3317 c60001        	ld	a,_LCD_Line+1
14366  331a cd0000        	call	_Set_LCD_Address
14368                     ; 2582 				Display_LCD_String("*Target Perc");
14370  331d ae029d        	ldw	x,#L3703
14371  3320 cd0000        	call	_Display_LCD_String
14374  3323 200c          	jra	L5666
14375  3325               L3666:
14376                     ; 2585 				Set_LCD_Address(LCD_Line[1]);
14378  3325 c60001        	ld	a,_LCD_Line+1
14379  3328 cd0000        	call	_Set_LCD_Address
14381                     ; 2586 				Display_LCD_String("*Target Watt(OS)");
14383  332b ae028c        	ldw	x,#L7703
14384  332e cd0000        	call	_Display_LCD_String
14386  3331               L5666:
14387                     ; 2589 			Set_LCD_Address(LCD_Line[2]);
14389  3331 c60002        	ld	a,_LCD_Line+2
14390  3334 cd0000        	call	_Set_LCD_Address
14392                     ; 2590 			Display_LCD_String("D_Unit:");
14394  3337 ae0284        	ldw	x,#L1013
14395  333a cd0000        	call	_Display_LCD_String
14397                     ; 2592 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
14399  333d c60002        	ld	a,_LCD_Line+2
14400  3340 ab07          	add	a,#7
14401  3342 cd0000        	call	_Set_LCD_Address
14403                     ; 2593 			if(b_Blink_250_Flag){
14405  3345 c60000        	ld	a,_uc_LCD_Blink_Reg
14406  3348 a502          	bcp	a,#2
14407  334a 272e          	jreq	L7666
14408                     ; 2594 				Num_Display_LCD(uc_Perc_Unit /(U8)(2));
14410  334c c60001        	ld	a,_uc_Perc_Unit
14411  334f 5f            	clrw	x
14412  3350 97            	ld	xl,a
14413  3351 57            	sraw	x
14414  3352 cd0000        	call	_Num_Display_LCD
14416                     ; 2595 				Display_LCD_String(".");
14418  3355 ae0282        	ldw	x,#L5013
14419  3358 cd0000        	call	_Display_LCD_String
14421                     ; 2596 				uc_buffer = uc_Perc_Unit %(U8)(2);
14423  335b c60001        	ld	a,_uc_Perc_Unit
14424  335e a401          	and	a,#1
14425  3360 6b15          	ld	(OFST-1,sp),a
14427                     ; 2597 				if(uc_buffer){ Display_LCD_String("5"); }
14429  3362 0d15          	tnz	(OFST-1,sp)
14430  3364 2708          	jreq	L1766
14433  3366 ae0280        	ldw	x,#L1113
14434  3369 cd0000        	call	_Display_LCD_String
14437  336c 2006          	jra	L3766
14438  336e               L1766:
14439                     ; 2598 				else{ Display_LCD_String("0"); }
14441  336e ae027e        	ldw	x,#L5113
14442  3371 cd0000        	call	_Display_LCD_String
14444  3374               L3766:
14445                     ; 2599 				Display_LCD_String("%");
14447  3374 ae027c        	ldw	x,#L7113
14448  3377 cd0000        	call	_Display_LCD_String
14450  337a               L7666:
14451                     ; 2601 			return;
14453  337a acde2fde      	jpf	L613
14454  337e               L1666:
14455                     ; 2603 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
14457  337e 0f16          	clr	(OFST+0,sp)
14459  3380               L5766:
14460                     ; 2605 			Set_LCD_Address(LCD_Line[uc_line_index]);
14462  3380 7b16          	ld	a,(OFST+0,sp)
14463  3382 5f            	clrw	x
14464  3383 97            	ld	xl,a
14465  3384 d60000        	ld	a,(_LCD_Line,x)
14466  3387 cd0000        	call	_Set_LCD_Address
14468                     ; 2607 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
14470  338a c6000d        	ld	a,_uc_Test_Ctrl_Reg
14471  338d a502          	bcp	a,#2
14472  338f 2763          	jreq	L3076
14474  3391 c6000d        	ld	a,_uc_Test_Ctrl_Reg
14475  3394 a504          	bcp	a,#4
14476  3396 265c          	jrne	L3076
14477                     ; 2608 				if(uc_line_index == uc_Test_Data_Select_Num){ 
14479  3398 7b16          	ld	a,(OFST+0,sp)
14480  339a c10002        	cp	a,_uc_Test_Data_Select_Num
14481  339d 2647          	jrne	L5076
14482                     ; 2609 					if(uc_Test_Data_Select_Num == (U8)(0)){
14484  339f 725d0002      	tnz	_uc_Test_Data_Select_Num
14485  33a3 261d          	jrne	L7076
14486                     ; 2610 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
14488  33a5 c60000        	ld	a,_uc_LCD_Blink_Reg
14489  33a8 a502          	bcp	a,#2
14490  33aa 270e          	jreq	L1176
14493  33ac 7b16          	ld	a,(OFST+0,sp)
14494  33ae 97            	ld	xl,a
14495  33af a610          	ld	a,#16
14496  33b1 42            	mul	x,a
14497  33b2 1c0000        	addw	x,#_LCD_Dis_Data
14498  33b5 cd0000        	call	_Display_LCD_String
14501  33b8 2046          	jra	L7276
14502  33ba               L1176:
14503                     ; 2611 						else{ Display_LCD_String("        /"); }
14505  33ba ae0272        	ldw	x,#L5413
14506  33bd cd0000        	call	_Display_LCD_String
14508  33c0 203e          	jra	L7276
14509  33c2               L7076:
14510                     ; 2613 					else if(uc_Test_Data_Select_Num == (U8)(1)){
14512  33c2 c60002        	ld	a,_uc_Test_Data_Select_Num
14513  33c5 a101          	cp	a,#1
14514  33c7 2637          	jrne	L7276
14515                     ; 2614 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
14517  33c9 c60000        	ld	a,_uc_LCD_Blink_Reg
14518  33cc a502          	bcp	a,#2
14519  33ce 270e          	jreq	L1276
14522  33d0 7b16          	ld	a,(OFST+0,sp)
14523  33d2 97            	ld	xl,a
14524  33d3 a610          	ld	a,#16
14525  33d5 42            	mul	x,a
14526  33d6 1c0000        	addw	x,#_LCD_Dis_Data
14527  33d9 cd0000        	call	_Display_LCD_String
14530  33dc 2022          	jra	L7276
14531  33de               L1276:
14532                     ; 2615 						else{ Display_LCD_String("        Fd:"); }
14534  33de ae0266        	ldw	x,#L7513
14535  33e1 cd0000        	call	_Display_LCD_String
14537  33e4 201a          	jra	L7276
14538  33e6               L5076:
14539                     ; 2618 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
14541  33e6 7b16          	ld	a,(OFST+0,sp)
14542  33e8 97            	ld	xl,a
14543  33e9 a610          	ld	a,#16
14544  33eb 42            	mul	x,a
14545  33ec 1c0000        	addw	x,#_LCD_Dis_Data
14546  33ef cd0000        	call	_Display_LCD_String
14548  33f2 200c          	jra	L7276
14549  33f4               L3076:
14550                     ; 2619 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
14552  33f4 7b16          	ld	a,(OFST+0,sp)
14553  33f6 97            	ld	xl,a
14554  33f7 a610          	ld	a,#16
14555  33f9 42            	mul	x,a
14556  33fa 1c0000        	addw	x,#_LCD_Dis_Data
14557  33fd cd0000        	call	_Display_LCD_String
14559  3400               L7276:
14560                     ; 2622 			if(uc_line_index == (U8)(0)){		// LINE 1
14562  3400 0d16          	tnz	(OFST+0,sp)
14563  3402 2703          	jreq	L204
14564  3404 cc34bf        	jp	L1376
14565  3407               L204:
14566                     ; 2625 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
14568  3407 7b16          	ld	a,(OFST+0,sp)
14569  3409 5f            	clrw	x
14570  340a 97            	ld	xl,a
14571  340b d60000        	ld	a,(_LCD_Line,x)
14572  340e ab03          	add	a,#3
14573  3410 cd0000        	call	_Set_LCD_Address
14575                     ; 2627 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
14577  3413 c6000d        	ld	a,_uc_Test_Ctrl_Reg
14578  3416 a504          	bcp	a,#4
14579  3418 2718          	jreq	L3376
14581  341a 7b16          	ld	a,(OFST+0,sp)
14582  341c c10002        	cp	a,_uc_Test_Data_Select_Num
14583  341f 2611          	jrne	L3376
14584                     ; 2628 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
14586  3421 c60000        	ld	a,_uc_LCD_Blink_Reg
14587  3424 a502          	bcp	a,#2
14588  3426 2712          	jreq	L7376
14591  3428 c60009        	ld	a,_uc_Heater_Enable_Flag
14592  342b 5f            	clrw	x
14593  342c 97            	ld	xl,a
14594  342d cd0000        	call	_Num_Display_LCD
14596  3430 2008          	jra	L7376
14597  3432               L3376:
14598                     ; 2629 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
14600  3432 c60009        	ld	a,_uc_Heater_Enable_Flag
14601  3435 5f            	clrw	x
14602  3436 97            	ld	xl,a
14603  3437 cd0000        	call	_Num_Display_LCD
14605  343a               L7376:
14606                     ; 2633 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
14608  343a 7b16          	ld	a,(OFST+0,sp)
14609  343c 5f            	clrw	x
14610  343d 97            	ld	xl,a
14611  343e d60000        	ld	a,(_LCD_Line,x)
14612  3441 ab05          	add	a,#5
14613  3443 cd0000        	call	_Set_LCD_Address
14615                     ; 2634 				if (HEATER_zone_status == HTR_ZONE_1)
14617  3446 725d0000      	tnz	_HEATER_zone_status
14618  344a 2608          	jrne	L1476
14619                     ; 2635 				Display_LCD_String("Z1");
14621  344c ae0263        	ldw	x,#L7713
14622  344f cd0000        	call	_Display_LCD_String
14625  3452 2006          	jra	L3476
14626  3454               L1476:
14627                     ; 2636 				else Display_LCD_String("Z2");
14629  3454 ae0260        	ldw	x,#L3023
14630  3457 cd0000        	call	_Display_LCD_String
14632  345a               L3476:
14633                     ; 2638 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
14635  345a 7b16          	ld	a,(OFST+0,sp)
14636  345c 5f            	clrw	x
14637  345d 97            	ld	xl,a
14638  345e d60000        	ld	a,(_LCD_Line,x)
14639  3461 ab09          	add	a,#9
14640  3463 cd0000        	call	_Set_LCD_Address
14642                     ; 2640 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
14644  3466 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
14645  3469 a501          	bcp	a,#1
14646  346b 270a          	jreq	L5476
14649  346d ae025d        	ldw	x,#L7023
14650  3470 cd0000        	call	_Display_LCD_String
14653  3473 acdf38df      	jpf	L7676
14654  3477               L5476:
14655                     ; 2643 					uc_buffer = (U8)((can_data[0] & 0x06) >> 1);//YJS
14657  3477 7b0d          	ld	a,(OFST-9,sp)
14658  3479 44            	srl	a
14659  347a a403          	and	a,#3
14660  347c 6b15          	ld	(OFST-1,sp),a
14662                     ; 2644 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
14664  347e 0d15          	tnz	(OFST-1,sp)
14665  3480 260a          	jrne	L1576
14668  3482 ae0258        	ldw	x,#L5123
14669  3485 cd0000        	call	_Display_LCD_String
14672  3488 acdf38df      	jpf	L7676
14673  348c               L1576:
14674                     ; 2645 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
14676  348c 7b15          	ld	a,(OFST-1,sp)
14677  348e a101          	cp	a,#1
14678  3490 260a          	jrne	L5576
14681  3492 ae0253        	ldw	x,#L3223
14682  3495 cd0000        	call	_Display_LCD_String
14685  3498 acdf38df      	jpf	L7676
14686  349c               L5576:
14687                     ; 2646 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
14689  349c 7b15          	ld	a,(OFST-1,sp)
14690  349e a102          	cp	a,#2
14691  34a0 260a          	jrne	L1676
14694  34a2 ae024f        	ldw	x,#L1323
14695  34a5 cd0000        	call	_Display_LCD_String
14698  34a8 acdf38df      	jpf	L7676
14699  34ac               L1676:
14700                     ; 2647 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
14702  34ac 7b15          	ld	a,(OFST-1,sp)
14703  34ae a103          	cp	a,#3
14704  34b0 2703          	jreq	L404
14705  34b2 cc38df        	jp	L7676
14706  34b5               L404:
14709  34b5 ae024a        	ldw	x,#L7323
14710  34b8 cd0000        	call	_Display_LCD_String
14712  34bb acdf38df      	jpf	L7676
14713  34bf               L1376:
14714                     ; 2656 			else if(uc_line_index == (U8)(1)){	// LINE 2
14716  34bf 7b16          	ld	a,(OFST+0,sp)
14717  34c1 a101          	cp	a,#1
14718  34c3 2703          	jreq	L604
14719  34c5 cc37d4        	jp	L1776
14720  34c8               L604:
14721                     ; 2659 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
14723  34c8 7b16          	ld	a,(OFST+0,sp)
14724  34ca 5f            	clrw	x
14725  34cb 97            	ld	xl,a
14726  34cc d60000        	ld	a,(_LCD_Line,x)
14727  34cf ab03          	add	a,#3
14728  34d1 cd0000        	call	_Set_LCD_Address
14730                     ; 2660 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
14732  34d4 c6000d        	ld	a,_uc_Test_Ctrl_Reg
14733  34d7 a504          	bcp	a,#4
14734  34d9 2603          	jrne	L014
14735  34db cc3642        	jp	L3776
14736  34de               L014:
14738  34de 7b16          	ld	a,(OFST+0,sp)
14739  34e0 c10002        	cp	a,_uc_Test_Data_Select_Num
14740  34e3 2703          	jreq	L214
14741  34e5 cc3642        	jp	L3776
14742  34e8               L214:
14743                     ; 2661 					if(b_Blink_250_Flag){
14745  34e8 c60000        	ld	a,_uc_LCD_Blink_Reg
14746  34eb a502          	bcp	a,#2
14747  34ed 2603          	jrne	L414
14748  34ef cc3782        	jp	L7607
14749  34f2               L414:
14750                     ; 2662 						if(!uc_Target_Display_Mode){	// Percentage_Display
14752  34f2 725d0000      	tnz	_uc_Target_Display_Mode
14753  34f6 2676          	jrne	L7776
14754                     ; 2663 if (HEATER_zone_status == HTR_ZONE_1)
14756  34f8 725d0000      	tnz	_HEATER_zone_status
14757  34fc 2638          	jrne	L1007
14758                     ; 2665 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
14760  34fe c6000a        	ld	a,_uc_Target_Duty_Perc
14761  3501 5f            	clrw	x
14762  3502 97            	ld	xl,a
14763  3503 57            	sraw	x
14764  3504 cd0000        	call	_Num_Display_LCD
14766                     ; 2666 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
14768  3507 c6000a        	ld	a,_uc_Target_Duty_Perc
14769  350a a1c8          	cp	a,#200
14770  350c 2503          	jrult	L614
14771  350e cc3782        	jp	L7607
14772  3511               L614:
14773                     ; 2667 								Display_LCD_String(".");
14775  3511 ae0282        	ldw	x,#L5013
14776  3514 cd0000        	call	_Display_LCD_String
14778                     ; 2668 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
14780  3517 c6000a        	ld	a,_uc_Target_Duty_Perc
14781  351a a401          	and	a,#1
14782  351c 6b15          	ld	(OFST-1,sp),a
14784                     ; 2669 								if(uc_buffer){ Display_LCD_String("5"); }
14786  351e 0d15          	tnz	(OFST-1,sp)
14787  3520 270a          	jreq	L5007
14790  3522 ae0280        	ldw	x,#L1113
14791  3525 cd0000        	call	_Display_LCD_String
14794  3528 ac823782      	jpf	L7607
14795  352c               L5007:
14796                     ; 2670 								else{ Display_LCD_String("0"); }
14798  352c ae027e        	ldw	x,#L5113
14799  352f cd0000        	call	_Display_LCD_String
14801  3532 ac823782      	jpf	L7607
14802  3536               L1007:
14803                     ; 2675 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
14805  3536 c6000b        	ld	a,_uc_Target_Duty_Perc+1
14806  3539 5f            	clrw	x
14807  353a 97            	ld	xl,a
14808  353b 57            	sraw	x
14809  353c cd0000        	call	_Num_Display_LCD
14811                     ; 2676 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
14813  353f c6000b        	ld	a,_uc_Target_Duty_Perc+1
14814  3542 a1c8          	cp	a,#200
14815  3544 2503          	jrult	L024
14816  3546 cc3782        	jp	L7607
14817  3549               L024:
14818                     ; 2677 								Display_LCD_String(".");
14820  3549 ae0282        	ldw	x,#L5013
14821  354c cd0000        	call	_Display_LCD_String
14823                     ; 2678 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
14825  354f c6000b        	ld	a,_uc_Target_Duty_Perc+1
14826  3552 a401          	and	a,#1
14827  3554 6b15          	ld	(OFST-1,sp),a
14829                     ; 2679 								if(uc_buffer){ Display_LCD_String("5"); }
14831  3556 0d15          	tnz	(OFST-1,sp)
14832  3558 270a          	jreq	L5107
14835  355a ae0280        	ldw	x,#L1113
14836  355d cd0000        	call	_Display_LCD_String
14839  3560 ac823782      	jpf	L7607
14840  3564               L5107:
14841                     ; 2680 								else{ Display_LCD_String("0"); }
14843  3564 ae027e        	ldw	x,#L5113
14844  3567 cd0000        	call	_Display_LCD_String
14846  356a ac823782      	jpf	L7607
14847  356e               L7776:
14848                     ; 2685 if (HEATER_zone_status == HTR_ZONE_1)
14850  356e 725d0000      	tnz	_HEATER_zone_status
14851  3572 2667          	jrne	L3207
14852                     ; 2687 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
14854  3574 c6000a        	ld	a,_uc_Target_Duty_Perc
14855  3577 a114          	cp	a,#20
14856  3579 2408          	jruge	L5207
14859  357b 5f            	clrw	x
14860  357c cd0000        	call	_Num_Display_LCD
14863  357f ac823782      	jpf	L7607
14864  3583               L5207:
14865                     ; 2688 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
14867  3583 c6000a        	ld	a,_uc_Target_Duty_Perc
14868  3586 a114          	cp	a,#20
14869  3588 260a          	jrne	L1307
14872  358a ae0064        	ldw	x,#100
14873  358d cd0000        	call	_Num_Display_LCD
14876  3590 ac823782      	jpf	L7607
14877  3594               L1307:
14878                     ; 2689 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
14880  3594 c6000a        	ld	a,_uc_Target_Duty_Perc
14881  3597 a1b4          	cp	a,#180
14882  3599 260a          	jrne	L5307
14885  359b ae1838        	ldw	x,#6200
14886  359e cd0000        	call	_Num_Display_LCD
14889  35a1 ac823782      	jpf	L7607
14890  35a5               L5307:
14891                     ; 2690 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
14893  35a5 c6000a        	ld	a,_uc_Target_Duty_Perc
14894  35a8 a1be          	cp	a,#190
14895  35aa 260a          	jrne	L1407
14898  35ac ae0246        	ldw	x,#L5133
14899  35af cd0000        	call	_Display_LCD_String
14902  35b2 ac823782      	jpf	L7607
14903  35b6               L1407:
14904                     ; 2691 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
14906  35b6 c6000a        	ld	a,_uc_Target_Duty_Perc
14907  35b9 5f            	clrw	x
14908  35ba 97            	ld	xl,a
14909  35bb 1d0014        	subw	x,#20
14910  35be 90ae94ed      	ldw	y,#38125
14911  35c2 cd0000        	call	c_umul
14913  35c5 ae0000        	ldw	x,#L001
14914  35c8 cd0000        	call	c_ludv
14916  35cb be02          	ldw	x,c_lreg+2
14917  35cd 1c0064        	addw	x,#100
14918  35d0 1f0b          	ldw	(OFST-11,sp),x
14922  35d2 1e0b          	ldw	x,(OFST-11,sp)
14923  35d4 cd0000        	call	_Num_Display_LCD
14925  35d7 ac823782      	jpf	L7607
14926  35db               L3207:
14927                     ; 2695 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
14929  35db c6000b        	ld	a,_uc_Target_Duty_Perc+1
14930  35de a114          	cp	a,#20
14931  35e0 2408          	jruge	L7407
14934  35e2 5f            	clrw	x
14935  35e3 cd0000        	call	_Num_Display_LCD
14938  35e6 ac823782      	jpf	L7607
14939  35ea               L7407:
14940                     ; 2696 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
14942  35ea c6000b        	ld	a,_uc_Target_Duty_Perc+1
14943  35ed a114          	cp	a,#20
14944  35ef 260a          	jrne	L3507
14947  35f1 ae0064        	ldw	x,#100
14948  35f4 cd0000        	call	_Num_Display_LCD
14951  35f7 ac823782      	jpf	L7607
14952  35fb               L3507:
14953                     ; 2697 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
14955  35fb c6000b        	ld	a,_uc_Target_Duty_Perc+1
14956  35fe a1b4          	cp	a,#180
14957  3600 260a          	jrne	L7507
14960  3602 ae1838        	ldw	x,#6200
14961  3605 cd0000        	call	_Num_Display_LCD
14964  3608 ac823782      	jpf	L7607
14965  360c               L7507:
14966                     ; 2698 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
14968  360c c6000b        	ld	a,_uc_Target_Duty_Perc+1
14969  360f a1be          	cp	a,#190
14970  3611 260a          	jrne	L3607
14973  3613 ae0246        	ldw	x,#L5133
14974  3616 cd0000        	call	_Display_LCD_String
14977  3619 ac823782      	jpf	L7607
14978  361d               L3607:
14979                     ; 2699 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
14981  361d c6000b        	ld	a,_uc_Target_Duty_Perc+1
14982  3620 5f            	clrw	x
14983  3621 97            	ld	xl,a
14984  3622 1d0014        	subw	x,#20
14985  3625 90ae94ed      	ldw	y,#38125
14986  3629 cd0000        	call	c_umul
14988  362c ae0000        	ldw	x,#L001
14989  362f cd0000        	call	c_ludv
14991  3632 be02          	ldw	x,c_lreg+2
14992  3634 1c0064        	addw	x,#100
14993  3637 1f0b          	ldw	(OFST-11,sp),x
14997  3639 1e0b          	ldw	x,(OFST-11,sp)
14998  363b cd0000        	call	_Num_Display_LCD
15000  363e ac823782      	jpf	L7607
15001  3642               L3776:
15002                     ; 2704 					if(!uc_Target_Display_Mode){
15004  3642 725d0000      	tnz	_uc_Target_Display_Mode
15005  3646 2676          	jrne	L1707
15006                     ; 2705 if (HEATER_zone_status == HTR_ZONE_1)
15008  3648 725d0000      	tnz	_HEATER_zone_status
15009  364c 2638          	jrne	L3707
15010                     ; 2707 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
15012  364e c6000a        	ld	a,_uc_Target_Duty_Perc
15013  3651 5f            	clrw	x
15014  3652 97            	ld	xl,a
15015  3653 57            	sraw	x
15016  3654 cd0000        	call	_Num_Display_LCD
15018                     ; 2708 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
15020  3657 c6000a        	ld	a,_uc_Target_Duty_Perc
15021  365a a1c8          	cp	a,#200
15022  365c 2503          	jrult	L224
15023  365e cc3782        	jp	L7607
15024  3661               L224:
15025                     ; 2709 							Display_LCD_String(".");
15027  3661 ae0282        	ldw	x,#L5013
15028  3664 cd0000        	call	_Display_LCD_String
15030                     ; 2710 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
15032  3667 c6000a        	ld	a,_uc_Target_Duty_Perc
15033  366a a401          	and	a,#1
15034  366c 6b15          	ld	(OFST-1,sp),a
15036                     ; 2711 							if(uc_buffer){ Display_LCD_String("5"); }
15038  366e 0d15          	tnz	(OFST-1,sp)
15039  3670 270a          	jreq	L7707
15042  3672 ae0280        	ldw	x,#L1113
15043  3675 cd0000        	call	_Display_LCD_String
15046  3678 ac823782      	jpf	L7607
15047  367c               L7707:
15048                     ; 2712 							else{ Display_LCD_String("0"); }
15050  367c ae027e        	ldw	x,#L5113
15051  367f cd0000        	call	_Display_LCD_String
15053  3682 ac823782      	jpf	L7607
15054  3686               L3707:
15055                     ; 2717 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
15057  3686 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15058  3689 5f            	clrw	x
15059  368a 97            	ld	xl,a
15060  368b 57            	sraw	x
15061  368c cd0000        	call	_Num_Display_LCD
15063                     ; 2718 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
15065  368f c6000b        	ld	a,_uc_Target_Duty_Perc+1
15066  3692 a1c8          	cp	a,#200
15067  3694 2503          	jrult	L424
15068  3696 cc3782        	jp	L7607
15069  3699               L424:
15070                     ; 2719 							Display_LCD_String(".");
15072  3699 ae0282        	ldw	x,#L5013
15073  369c cd0000        	call	_Display_LCD_String
15075                     ; 2720 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
15077  369f c6000b        	ld	a,_uc_Target_Duty_Perc+1
15078  36a2 a401          	and	a,#1
15079  36a4 6b15          	ld	(OFST-1,sp),a
15081                     ; 2721 							if(uc_buffer){ Display_LCD_String("5"); }
15083  36a6 0d15          	tnz	(OFST-1,sp)
15084  36a8 270a          	jreq	L7017
15087  36aa ae0280        	ldw	x,#L1113
15088  36ad cd0000        	call	_Display_LCD_String
15091  36b0 ac823782      	jpf	L7607
15092  36b4               L7017:
15093                     ; 2722 							else{ Display_LCD_String("0"); }
15095  36b4 ae027e        	ldw	x,#L5113
15096  36b7 cd0000        	call	_Display_LCD_String
15098  36ba ac823782      	jpf	L7607
15099  36be               L1707:
15100                     ; 2727 if (HEATER_zone_status == HTR_ZONE_1)
15102  36be 725d0000      	tnz	_HEATER_zone_status
15103  36c2 2663          	jrne	L5117
15104                     ; 2729 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
15106  36c4 c6000a        	ld	a,_uc_Target_Duty_Perc
15107  36c7 a114          	cp	a,#20
15108  36c9 2408          	jruge	L7117
15111  36cb 5f            	clrw	x
15112  36cc cd0000        	call	_Num_Display_LCD
15115  36cf ac823782      	jpf	L7607
15116  36d3               L7117:
15117                     ; 2730 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
15119  36d3 c6000a        	ld	a,_uc_Target_Duty_Perc
15120  36d6 a114          	cp	a,#20
15121  36d8 260a          	jrne	L3217
15124  36da ae0064        	ldw	x,#100
15125  36dd cd0000        	call	_Num_Display_LCD
15128  36e0 ac823782      	jpf	L7607
15129  36e4               L3217:
15130                     ; 2731 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
15132  36e4 c6000a        	ld	a,_uc_Target_Duty_Perc
15133  36e7 a1b4          	cp	a,#180
15134  36e9 260a          	jrne	L7217
15137  36eb ae1838        	ldw	x,#6200
15138  36ee cd0000        	call	_Num_Display_LCD
15141  36f1 ac823782      	jpf	L7607
15142  36f5               L7217:
15143                     ; 2732 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
15145  36f5 c6000a        	ld	a,_uc_Target_Duty_Perc
15146  36f8 a1b5          	cp	a,#181
15147  36fa 2508          	jrult	L3317
15150  36fc ae0246        	ldw	x,#L5133
15151  36ff cd0000        	call	_Display_LCD_String
15154  3702 207e          	jra	L7607
15155  3704               L3317:
15156                     ; 2733 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
15158  3704 c6000a        	ld	a,_uc_Target_Duty_Perc
15159  3707 5f            	clrw	x
15160  3708 97            	ld	xl,a
15161  3709 1d0014        	subw	x,#20
15162  370c 90ae94ed      	ldw	y,#38125
15163  3710 cd0000        	call	c_umul
15165  3713 ae0000        	ldw	x,#L001
15166  3716 cd0000        	call	c_ludv
15168  3719 be02          	ldw	x,c_lreg+2
15169  371b 1c0064        	addw	x,#100
15170  371e 1f0b          	ldw	(OFST-11,sp),x
15174  3720 1e0b          	ldw	x,(OFST-11,sp)
15175  3722 cd0000        	call	_Num_Display_LCD
15177  3725 205b          	jra	L7607
15178  3727               L5117:
15179                     ; 2737 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
15181  3727 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15182  372a a114          	cp	a,#20
15183  372c 2406          	jruge	L1417
15186  372e 5f            	clrw	x
15187  372f cd0000        	call	_Num_Display_LCD
15190  3732 204e          	jra	L7607
15191  3734               L1417:
15192                     ; 2738 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
15194  3734 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15195  3737 a114          	cp	a,#20
15196  3739 2608          	jrne	L5417
15199  373b ae0064        	ldw	x,#100
15200  373e cd0000        	call	_Num_Display_LCD
15203  3741 203f          	jra	L7607
15204  3743               L5417:
15205                     ; 2739 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
15207  3743 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15208  3746 a1b4          	cp	a,#180
15209  3748 2608          	jrne	L1517
15212  374a ae1838        	ldw	x,#6200
15213  374d cd0000        	call	_Num_Display_LCD
15216  3750 2030          	jra	L7607
15217  3752               L1517:
15218                     ; 2740 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
15220  3752 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15221  3755 a1b5          	cp	a,#181
15222  3757 2508          	jrult	L5517
15225  3759 ae0246        	ldw	x,#L5133
15226  375c cd0000        	call	_Display_LCD_String
15229  375f 2021          	jra	L7607
15230  3761               L5517:
15231                     ; 2741 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
15233  3761 c6000b        	ld	a,_uc_Target_Duty_Perc+1
15234  3764 5f            	clrw	x
15235  3765 97            	ld	xl,a
15236  3766 1d0014        	subw	x,#20
15237  3769 90ae94ed      	ldw	y,#38125
15238  376d cd0000        	call	c_umul
15240  3770 ae0000        	ldw	x,#L001
15241  3773 cd0000        	call	c_ludv
15243  3776 be02          	ldw	x,c_lreg+2
15244  3778 1c0064        	addw	x,#100
15245  377b 1f0b          	ldw	(OFST-11,sp),x
15249  377d 1e0b          	ldw	x,(OFST-11,sp)
15250  377f cd0000        	call	_Num_Display_LCD
15252  3782               L7607:
15253                     ; 2747 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
15255  3782 7b16          	ld	a,(OFST+0,sp)
15256  3784 5f            	clrw	x
15257  3785 97            	ld	xl,a
15258  3786 d60000        	ld	a,(_LCD_Line,x)
15259  3789 ab0b          	add	a,#11
15260  378b cd0000        	call	_Set_LCD_Address
15262                     ; 2748 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15264  378e c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15265  3791 a501          	bcp	a,#1
15266  3793 270a          	jreq	L1617
15269  3795 ae025d        	ldw	x,#L7023
15270  3798 cd0000        	call	_Display_LCD_String
15273  379b acdf38df      	jpf	L7676
15274  379f               L1617:
15275                     ; 2750 					Num_Display_LCD(can_data[6] /(U8)(2));
15277  379f 7b13          	ld	a,(OFST-3,sp)
15278  37a1 5f            	clrw	x
15279  37a2 97            	ld	xl,a
15280  37a3 57            	sraw	x
15281  37a4 cd0000        	call	_Num_Display_LCD
15283                     ; 2751 					if(can_data[6] < (U8)(200)){
15285  37a7 7b13          	ld	a,(OFST-3,sp)
15286  37a9 a1c8          	cp	a,#200
15287  37ab 2503          	jrult	L624
15288  37ad cc38df        	jp	L7676
15289  37b0               L624:
15290                     ; 2752 						Display_LCD_String(".");
15292  37b0 ae0282        	ldw	x,#L5013
15293  37b3 cd0000        	call	_Display_LCD_String
15295                     ; 2753 						uc_buffer = can_data[6] % (U8)(2);
15297  37b6 7b13          	ld	a,(OFST-3,sp)
15298  37b8 a401          	and	a,#1
15299  37ba 6b15          	ld	(OFST-1,sp),a
15301                     ; 2754 						if(uc_buffer){ Display_LCD_String("5"); }
15303  37bc 0d15          	tnz	(OFST-1,sp)
15304  37be 270a          	jreq	L7617
15307  37c0 ae0280        	ldw	x,#L1113
15308  37c3 cd0000        	call	_Display_LCD_String
15311  37c6 acdf38df      	jpf	L7676
15312  37ca               L7617:
15313                     ; 2755 						else{ Display_LCD_String("0"); }
15315  37ca ae027e        	ldw	x,#L5113
15316  37cd cd0000        	call	_Display_LCD_String
15318  37d0 acdf38df      	jpf	L7676
15319  37d4               L1776:
15320                     ; 2761 			else if(uc_line_index == (U8)(2)){	// LINE 3
15322  37d4 7b16          	ld	a,(OFST+0,sp)
15323  37d6 a102          	cp	a,#2
15324  37d8 2703          	jreq	L034
15325  37da cc3867        	jp	L5717
15326  37dd               L034:
15327                     ; 2764 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
15329  37dd 7b16          	ld	a,(OFST+0,sp)
15330  37df 5f            	clrw	x
15331  37e0 97            	ld	xl,a
15332  37e1 d60000        	ld	a,(_LCD_Line,x)
15333  37e4 ab02          	add	a,#2
15334  37e6 cd0000        	call	_Set_LCD_Address
15336                     ; 2765 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
15338  37e9 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15339  37ec a501          	bcp	a,#1
15340  37ee 2708          	jreq	L7717
15343  37f0 ae0244        	ldw	x,#L5543
15344  37f3 cd0000        	call	_Display_LCD_String
15347  37f6 2014          	jra	L1027
15348  37f8               L7717:
15349                     ; 2767 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
15351  37f8 7b0d          	ld	a,(OFST-9,sp)
15352  37fa a501          	bcp	a,#1
15353  37fc 2708          	jreq	L3027
15356  37fe ae0242        	ldw	x,#L3643
15357  3801 cd0000        	call	_Display_LCD_String
15360  3804 2006          	jra	L1027
15361  3806               L3027:
15362                     ; 2781 					else{ Display_LCD_String("0"); }
15364  3806 ae027e        	ldw	x,#L5113
15365  3809 cd0000        	call	_Display_LCD_String
15367  380c               L1027:
15368                     ; 2784 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
15370  380c 7b16          	ld	a,(OFST+0,sp)
15371  380e 5f            	clrw	x
15372  380f 97            	ld	xl,a
15373  3810 d60000        	ld	a,(_LCD_Line,x)
15374  3813 ab06          	add	a,#6
15375  3815 cd0000        	call	_Set_LCD_Address
15377                     ; 2785 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
15379  3818 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15380  381b a502          	bcp	a,#2
15381  381d 2708          	jreq	L7027
15384  381f ae0244        	ldw	x,#L5543
15385  3822 cd0000        	call	_Display_LCD_String
15388  3825 2014          	jra	L1127
15389  3827               L7027:
15390                     ; 2787 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
15392  3827 7b03          	ld	a,(OFST-19,sp)
15393  3829 a501          	bcp	a,#1
15394  382b 2708          	jreq	L3127
15397  382d ae0242        	ldw	x,#L3643
15398  3830 cd0000        	call	_Display_LCD_String
15401  3833 2006          	jra	L1127
15402  3835               L3127:
15403                     ; 2788 					else{ Display_LCD_String("0"); }
15405  3835 ae027e        	ldw	x,#L5113
15406  3838 cd0000        	call	_Display_LCD_String
15408  383b               L1127:
15409                     ; 2791 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
15411  383b 7b16          	ld	a,(OFST+0,sp)
15412  383d 5f            	clrw	x
15413  383e 97            	ld	xl,a
15414  383f d60000        	ld	a,(_LCD_Line,x)
15415  3842 ab0b          	add	a,#11
15416  3844 cd0000        	call	_Set_LCD_Address
15418                     ; 2792 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15420  3847 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15421  384a a501          	bcp	a,#1
15422  384c 270a          	jreq	L7127
15425  384e ae025d        	ldw	x,#L7023
15426  3851 cd0000        	call	_Display_LCD_String
15429  3854 acdf38df      	jpf	L7676
15430  3858               L7127:
15431                     ; 2794 					ui_buffer = (U16)(can_data[4]) * (U16)(4);//YJS 2->4
15433  3858 7b11          	ld	a,(OFST-5,sp)
15434  385a 97            	ld	xl,a
15435  385b a604          	ld	a,#4
15436  385d 42            	mul	x,a
15437  385e 1f0b          	ldw	(OFST-11,sp),x
15439                     ; 2795 					Num_Display_LCD(ui_buffer);
15441  3860 1e0b          	ldw	x,(OFST-11,sp)
15442  3862 cd0000        	call	_Num_Display_LCD
15444  3865 2078          	jra	L7676
15445  3867               L5717:
15446                     ; 2800 			else if(uc_line_index == (U8)(3)){	// LINE 4
15448  3867 7b16          	ld	a,(OFST+0,sp)
15449  3869 a103          	cp	a,#3
15450  386b 2672          	jrne	L7676
15451                     ; 2803 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
15453  386d 7b16          	ld	a,(OFST+0,sp)
15454  386f 5f            	clrw	x
15455  3870 97            	ld	xl,a
15456  3871 d60000        	ld	a,(_LCD_Line,x)
15457  3874 ab03          	add	a,#3
15458  3876 cd0000        	call	_Set_LCD_Address
15460                     ; 2805 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15462  3879 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15463  387c a501          	bcp	a,#1
15464  387e 2708          	jreq	L7227
15467  3880 ae025d        	ldw	x,#L7023
15468  3883 cd0000        	call	_Display_LCD_String
15471  3886 2026          	jra	L1327
15472  3888               L7227:
15473                     ; 2809 					Num_Display_LCD(can_data[5] / (U8)(5));
15475  3888 7b12          	ld	a,(OFST-4,sp)
15476  388a 5f            	clrw	x
15477  388b 97            	ld	xl,a
15478  388c a605          	ld	a,#5
15479  388e cd0000        	call	c_sdivx
15481  3891 cd0000        	call	_Num_Display_LCD
15483                     ; 2810 					Display_LCD_String(".");
15485  3894 ae0282        	ldw	x,#L5013
15486  3897 cd0000        	call	_Display_LCD_String
15488                     ; 2811 					uc_buffer = can_data[5] % (U8)(5);
15490  389a 7b12          	ld	a,(OFST-4,sp)
15491  389c 5f            	clrw	x
15492  389d 97            	ld	xl,a
15493  389e a605          	ld	a,#5
15494  38a0 62            	div	x,a
15495  38a1 5f            	clrw	x
15496  38a2 97            	ld	xl,a
15497  38a3 9f            	ld	a,xl
15498  38a4 6b15          	ld	(OFST-1,sp),a
15500                     ; 2812 					Num_Display_LCD(uc_buffer * (U8)(2));
15502  38a6 7b15          	ld	a,(OFST-1,sp)
15503  38a8 5f            	clrw	x
15504  38a9 97            	ld	xl,a
15505  38aa 58            	sllw	x
15506  38ab cd0000        	call	_Num_Display_LCD
15508  38ae               L1327:
15509                     ; 2819 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
15511  38ae 7b16          	ld	a,(OFST+0,sp)
15512  38b0 5f            	clrw	x
15513  38b1 97            	ld	xl,a
15514  38b2 d60000        	ld	a,(_LCD_Line,x)
15515  38b5 ab0b          	add	a,#11
15516  38b7 cd0000        	call	_Set_LCD_Address
15518                     ; 2821 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15520  38ba c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15521  38bd a501          	bcp	a,#1
15522  38bf 2708          	jreq	L3327
15525  38c1 ae025d        	ldw	x,#L7023
15526  38c4 cd0000        	call	_Display_LCD_String
15529  38c7 2016          	jra	L7676
15530  38c9               L3327:
15531                     ; 2823 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
15533  38c9 7b0f          	ld	a,(OFST-7,sp)
15534  38cb 5f            	clrw	x
15535  38cc 97            	ld	xl,a
15536  38cd 1f01          	ldw	(OFST-21,sp),x
15538  38cf 7b10          	ld	a,(OFST-6,sp)
15539  38d1 5f            	clrw	x
15540  38d2 97            	ld	xl,a
15541  38d3 4f            	clr	a
15542  38d4 02            	rlwa	x,a
15543  38d5 72fb01        	addw	x,(OFST-21,sp)
15544  38d8 1f0b          	ldw	(OFST-11,sp),x
15546                     ; 2824 					Num_Display_LCD(ui_buffer);
15548  38da 1e0b          	ldw	x,(OFST-11,sp)
15549  38dc cd0000        	call	_Num_Display_LCD
15551  38df               L7676:
15552                     ; 2603 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
15554  38df 0c16          	inc	(OFST+0,sp)
15558  38e1 7b16          	ld	a,(OFST+0,sp)
15559  38e3 a104          	cp	a,#4
15560  38e5 2403          	jruge	L234
15561  38e7 cc3380        	jp	L5766
15562  38ea               L234:
15564  38ea aca73da7      	jpf	L5566
15565  38ee               L7566:
15566                     ; 2837 	else if(uc_Test_Page_Now == (U8)(3)){
15568  38ee c60004        	ld	a,_uc_Test_Page_Now
15569  38f1 a103          	cp	a,#3
15570  38f3 2703          	jreq	L434
15571  38f5 cc39a6        	jp	L1427
15572  38f8               L434:
15573                     ; 2838 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
15575  38f8 0f16          	clr	(OFST+0,sp)
15577  38fa               L3427:
15578                     ; 2840 			Set_LCD_Address(LCD_Line[uc_line_index]);
15580  38fa 7b16          	ld	a,(OFST+0,sp)
15581  38fc 5f            	clrw	x
15582  38fd 97            	ld	xl,a
15583  38fe d60000        	ld	a,(_LCD_Line,x)
15584  3901 cd0000        	call	_Set_LCD_Address
15586                     ; 2841 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
15588  3904 7b16          	ld	a,(OFST+0,sp)
15589  3906 97            	ld	xl,a
15590  3907 a610          	ld	a,#16
15591  3909 42            	mul	x,a
15592  390a 1c0000        	addw	x,#_LCD_Dis_Data
15593  390d cd0000        	call	_Display_LCD_String
15595                     ; 2844 			if(uc_line_index == (U8)(0)){		// LINE 1
15597  3910 0d16          	tnz	(OFST+0,sp)
15598  3912 2641          	jrne	L1527
15599                     ; 2847 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
15601  3914 7b16          	ld	a,(OFST+0,sp)
15602  3916 5f            	clrw	x
15603  3917 97            	ld	xl,a
15604  3918 d60000        	ld	a,(_LCD_Line,x)
15605  391b ab03          	add	a,#3
15606  391d cd0000        	call	_Set_LCD_Address
15608                     ; 2848 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15610  3920 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15611  3923 a501          	bcp	a,#1
15612  3925 2708          	jreq	L3527
15615  3927 ae025d        	ldw	x,#L7023
15616  392a cd0000        	call	_Display_LCD_String
15619  392d 2026          	jra	L1527
15620  392f               L3527:
15621                     ; 2850 					if(can_data[1] < (U8)(40)){
15623  392f 7b0e          	ld	a,(OFST-8,sp)
15624  3931 a128          	cp	a,#40
15625  3933 2416          	jruge	L7527
15626                     ; 2851 						Display_LCD_String("-");
15628  3935 ae0240        	ldw	x,#L1453
15629  3938 cd0000        	call	_Display_LCD_String
15631                     ; 2852 						Num_Display_LCD((U8)(40) - can_data[1]);
15633  393b a600          	ld	a,#0
15634  393d 97            	ld	xl,a
15635  393e a628          	ld	a,#40
15636  3940 100e          	sub	a,(OFST-8,sp)
15637  3942 2401          	jrnc	L413
15638  3944 5a            	decw	x
15639  3945               L413:
15640  3945 02            	rlwa	x,a
15641  3946 cd0000        	call	_Num_Display_LCD
15644  3949 200a          	jra	L1527
15645  394b               L7527:
15646                     ; 2855 						Num_Display_LCD(can_data[1] - (U8)(40));
15648  394b 7b0e          	ld	a,(OFST-8,sp)
15649  394d 5f            	clrw	x
15650  394e 97            	ld	xl,a
15651  394f 1d0028        	subw	x,#40
15652  3952 cd0000        	call	_Num_Display_LCD
15654  3955               L1527:
15655                     ; 2861 			if(uc_line_index == (U8)(1)){		// LINE 2
15657  3955 7b16          	ld	a,(OFST+0,sp)
15658  3957 a101          	cp	a,#1
15659  3959 2634          	jrne	L3627
15660                     ; 2864 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
15662  395b 7b16          	ld	a,(OFST+0,sp)
15663  395d 5f            	clrw	x
15664  395e 97            	ld	xl,a
15665  395f d60000        	ld	a,(_LCD_Line,x)
15666  3962 ab04          	add	a,#4
15667  3964 cd0000        	call	_Set_LCD_Address
15669                     ; 2865 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
15671  3967 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15672  396a a502          	bcp	a,#2
15673  396c 2708          	jreq	L5627
15676  396e ae025d        	ldw	x,#L7023
15677  3971 cd0000        	call	_Display_LCD_String
15680  3974 2019          	jra	L3627
15681  3976               L5627:
15682                     ; 2872 					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
15684  3976 7b09          	ld	a,(OFST-13,sp)
15685  3978 4e            	swap	a
15686  3979 a40f          	and	a,#15
15687  397b 5f            	clrw	x
15688  397c 97            	ld	xl,a
15689  397d cd0000        	call	_Num_Display_LCD
15691                     ; 2873 					Display_LCD_String(".");
15693  3980 ae0282        	ldw	x,#L5013
15694  3983 cd0000        	call	_Display_LCD_String
15696                     ; 2874 					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
15698  3986 7b09          	ld	a,(OFST-13,sp)
15699  3988 a40f          	and	a,#15
15700  398a 5f            	clrw	x
15701  398b 97            	ld	xl,a
15702  398c cd0000        	call	_Num_Display_LCD
15704  398f               L3627:
15705                     ; 2880 			if(uc_line_index == (U8)(2)){		// LINE 2
15707  398f 7b16          	ld	a,(OFST+0,sp)
15708  3991 a102          	cp	a,#2
15709                     ; 2886 			if(uc_line_index == (U8)(3)){		// LINE 3
15711  3993 7b16          	ld	a,(OFST+0,sp)
15712  3995 a103          	cp	a,#3
15713                     ; 2838 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
15715  3997 0c16          	inc	(OFST+0,sp)
15719  3999 7b16          	ld	a,(OFST+0,sp)
15720  399b a104          	cp	a,#4
15721  399d 2403          	jruge	L634
15722  399f cc38fa        	jp	L3427
15723  39a2               L634:
15725  39a2 aca73da7      	jpf	L5566
15726  39a6               L1427:
15727                     ; 2895 		if(b_Rx2_Msg_TimeOut_Flag){
15729  39a6 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
15730  39a9 a502          	bcp	a,#2
15731  39ab 270a          	jreq	L7727
15732                     ; 2896 			Set_LCD_Address(LCD_Line[0]);	
15734  39ad c60000        	ld	a,_LCD_Line
15735  39b0 cd0000        	call	_Set_LCD_Address
15738  39b3 aca73da7      	jpf	L5566
15739  39b7               L7727:
15740                     ; 2900 			uc_fault_cnt = (U8)(0);
15742  39b7 0f16          	clr	(OFST+0,sp)
15744                     ; 2902 			if(can_data[7] & (U8)(0x01)){
15746  39b9 7b14          	ld	a,(OFST-2,sp)
15747  39bb a501          	bcp	a,#1
15748  39bd 273c          	jreq	L3037
15749                     ; 2903 				uc_fault_cnt++;
15751  39bf 0c16          	inc	(OFST+0,sp)
15753                     ; 2904 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
15753                     ; 2905 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
15753                     ; 2906 				){
15755  39c1 0d16          	tnz	(OFST+0,sp)
15756  39c3 270d          	jreq	L1137
15758  39c5 7b16          	ld	a,(OFST+0,sp)
15759  39c7 a105          	cp	a,#5
15760  39c9 2407          	jruge	L1137
15762  39cb c60004        	ld	a,_uc_Test_Page_Now
15763  39ce a104          	cp	a,#4
15764  39d0 2713          	jreq	L7037
15765  39d2               L1137:
15767  39d2 7b16          	ld	a,(OFST+0,sp)
15768  39d4 a105          	cp	a,#5
15769  39d6 2523          	jrult	L3037
15771  39d8 7b16          	ld	a,(OFST+0,sp)
15772  39da a109          	cp	a,#9
15773  39dc 241d          	jruge	L3037
15775  39de c60004        	ld	a,_uc_Test_Page_Now
15776  39e1 a105          	cp	a,#5
15777  39e3 2616          	jrne	L3037
15778  39e5               L7037:
15779                     ; 2907 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
15781  39e5 7b16          	ld	a,(OFST+0,sp)
15782  39e7 5f            	clrw	x
15783  39e8 97            	ld	xl,a
15784  39e9 5a            	decw	x
15785  39ea a604          	ld	a,#4
15786  39ec cd0000        	call	c_smodx
15788  39ef d60000        	ld	a,(_LCD_Line,x)
15789  39f2 cd0000        	call	_Set_LCD_Address
15791                     ; 2908 					Display_LCD_String("Flt_CoreTemp");
15793  39f5 ae0059        	ldw	x,#L5137
15794  39f8 cd0000        	call	_Display_LCD_String
15796  39fb               L3037:
15797                     ; 2912 			if(can_data[7] & (U8)(0x02)){
15799  39fb 7b14          	ld	a,(OFST-2,sp)
15800  39fd a502          	bcp	a,#2
15801  39ff 273c          	jreq	L7137
15802                     ; 2913 				uc_fault_cnt++;
15804  3a01 0c16          	inc	(OFST+0,sp)
15806                     ; 2914 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
15806                     ; 2915 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
15806                     ; 2916 				){
15808  3a03 0d16          	tnz	(OFST+0,sp)
15809  3a05 270d          	jreq	L5237
15811  3a07 7b16          	ld	a,(OFST+0,sp)
15812  3a09 a105          	cp	a,#5
15813  3a0b 2407          	jruge	L5237
15815  3a0d c60004        	ld	a,_uc_Test_Page_Now
15816  3a10 a104          	cp	a,#4
15817  3a12 2713          	jreq	L3237
15818  3a14               L5237:
15820  3a14 7b16          	ld	a,(OFST+0,sp)
15821  3a16 a105          	cp	a,#5
15822  3a18 2523          	jrult	L7137
15824  3a1a 7b16          	ld	a,(OFST+0,sp)
15825  3a1c a109          	cp	a,#9
15826  3a1e 241d          	jruge	L7137
15828  3a20 c60004        	ld	a,_uc_Test_Page_Now
15829  3a23 a105          	cp	a,#5
15830  3a25 2616          	jrne	L7137
15831  3a27               L3237:
15832                     ; 2917 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
15834  3a27 7b16          	ld	a,(OFST+0,sp)
15835  3a29 5f            	clrw	x
15836  3a2a 97            	ld	xl,a
15837  3a2b 5a            	decw	x
15838  3a2c a604          	ld	a,#4
15839  3a2e cd0000        	call	c_smodx
15841  3a31 d60000        	ld	a,(_LCD_Line,x)
15842  3a34 cd0000        	call	_Set_LCD_Address
15844                     ; 2918 					Display_LCD_String("Flt_OverCurrent");
15846  3a37 ae0049        	ldw	x,#L1337
15847  3a3a cd0000        	call	_Display_LCD_String
15849  3a3d               L7137:
15850                     ; 2922 			if(can_data[7] & (U8)(0x04)){
15852  3a3d 7b14          	ld	a,(OFST-2,sp)
15853  3a3f a504          	bcp	a,#4
15854  3a41 273c          	jreq	L3337
15855                     ; 2923 				uc_fault_cnt++;
15857  3a43 0c16          	inc	(OFST+0,sp)
15859                     ; 2924 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
15859                     ; 2925 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
15859                     ; 2926 				){
15861  3a45 0d16          	tnz	(OFST+0,sp)
15862  3a47 270d          	jreq	L1437
15864  3a49 7b16          	ld	a,(OFST+0,sp)
15865  3a4b a105          	cp	a,#5
15866  3a4d 2407          	jruge	L1437
15868  3a4f c60004        	ld	a,_uc_Test_Page_Now
15869  3a52 a104          	cp	a,#4
15870  3a54 2713          	jreq	L7337
15871  3a56               L1437:
15873  3a56 7b16          	ld	a,(OFST+0,sp)
15874  3a58 a105          	cp	a,#5
15875  3a5a 2523          	jrult	L3337
15877  3a5c 7b16          	ld	a,(OFST+0,sp)
15878  3a5e a109          	cp	a,#9
15879  3a60 241d          	jruge	L3337
15881  3a62 c60004        	ld	a,_uc_Test_Page_Now
15882  3a65 a105          	cp	a,#5
15883  3a67 2616          	jrne	L3337
15884  3a69               L7337:
15885                     ; 2927 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
15887  3a69 7b16          	ld	a,(OFST+0,sp)
15888  3a6b 5f            	clrw	x
15889  3a6c 97            	ld	xl,a
15890  3a6d 5a            	decw	x
15891  3a6e a604          	ld	a,#4
15892  3a70 cd0000        	call	c_smodx
15894  3a73 d60000        	ld	a,(_LCD_Line,x)
15895  3a76 cd0000        	call	_Set_LCD_Address
15897                     ; 2928 					Display_LCD_String("Flt_CurrentSen");
15899  3a79 ae003a        	ldw	x,#L5437
15900  3a7c cd0000        	call	_Display_LCD_String
15902  3a7f               L3337:
15903                     ; 2932 			if(can_data[7] & (U8)(0x08)){
15905  3a7f 7b14          	ld	a,(OFST-2,sp)
15906  3a81 a508          	bcp	a,#8
15907  3a83 273c          	jreq	L7437
15908                     ; 2933 				uc_fault_cnt++;
15910  3a85 0c16          	inc	(OFST+0,sp)
15912                     ; 2934 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
15912                     ; 2935 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
15912                     ; 2936 				){
15914  3a87 0d16          	tnz	(OFST+0,sp)
15915  3a89 270d          	jreq	L5537
15917  3a8b 7b16          	ld	a,(OFST+0,sp)
15918  3a8d a105          	cp	a,#5
15919  3a8f 2407          	jruge	L5537
15921  3a91 c60004        	ld	a,_uc_Test_Page_Now
15922  3a94 a104          	cp	a,#4
15923  3a96 2713          	jreq	L3537
15924  3a98               L5537:
15926  3a98 7b16          	ld	a,(OFST+0,sp)
15927  3a9a a105          	cp	a,#5
15928  3a9c 2523          	jrult	L7437
15930  3a9e 7b16          	ld	a,(OFST+0,sp)
15931  3aa0 a109          	cp	a,#9
15932  3aa2 241d          	jruge	L7437
15934  3aa4 c60004        	ld	a,_uc_Test_Page_Now
15935  3aa7 a105          	cp	a,#5
15936  3aa9 2616          	jrne	L7437
15937  3aab               L3537:
15938                     ; 2937 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
15940  3aab 7b16          	ld	a,(OFST+0,sp)
15941  3aad 5f            	clrw	x
15942  3aae 97            	ld	xl,a
15943  3aaf 5a            	decw	x
15944  3ab0 a604          	ld	a,#4
15945  3ab2 cd0000        	call	c_smodx
15947  3ab5 d60000        	ld	a,(_LCD_Line,x)
15948  3ab8 cd0000        	call	_Set_LCD_Address
15950                     ; 2938 					Display_LCD_String("Flt_CoreTempSen");
15952  3abb ae002a        	ldw	x,#L1637
15953  3abe cd0000        	call	_Display_LCD_String
15955  3ac1               L7437:
15956                     ; 2942 			if(can_diag[0] & (U8)(0x01)){
15958  3ac1 7b03          	ld	a,(OFST-19,sp)
15959  3ac3 a501          	bcp	a,#1
15960  3ac5 273c          	jreq	L3637
15961                     ; 2943 				uc_fault_cnt++;
15963  3ac7 0c16          	inc	(OFST+0,sp)
15965                     ; 2944 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
15965                     ; 2945 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
15965                     ; 2946 				){
15967  3ac9 0d16          	tnz	(OFST+0,sp)
15968  3acb 270d          	jreq	L1737
15970  3acd 7b16          	ld	a,(OFST+0,sp)
15971  3acf a105          	cp	a,#5
15972  3ad1 2407          	jruge	L1737
15974  3ad3 c60004        	ld	a,_uc_Test_Page_Now
15975  3ad6 a104          	cp	a,#4
15976  3ad8 2713          	jreq	L7637
15977  3ada               L1737:
15979  3ada 7b16          	ld	a,(OFST+0,sp)
15980  3adc a105          	cp	a,#5
15981  3ade 2523          	jrult	L3637
15983  3ae0 7b16          	ld	a,(OFST+0,sp)
15984  3ae2 a109          	cp	a,#9
15985  3ae4 241d          	jruge	L3637
15987  3ae6 c60004        	ld	a,_uc_Test_Page_Now
15988  3ae9 a105          	cp	a,#5
15989  3aeb 2616          	jrne	L3637
15990  3aed               L7637:
15991                     ; 2947 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
15993  3aed 7b16          	ld	a,(OFST+0,sp)
15994  3aef 5f            	clrw	x
15995  3af0 97            	ld	xl,a
15996  3af1 5a            	decw	x
15997  3af2 a604          	ld	a,#4
15998  3af4 cd0000        	call	c_smodx
16000  3af7 d60000        	ld	a,(_LCD_Line,x)
16001  3afa cd0000        	call	_Set_LCD_Address
16003                     ; 2948 					Display_LCD_String("Flt_Ptc");
16005  3afd ae0022        	ldw	x,#L5737
16006  3b00 cd0000        	call	_Display_LCD_String
16008  3b03               L3637:
16009                     ; 2952 			if(can_diag[0] & (U8)(0x02)){
16011  3b03 7b03          	ld	a,(OFST-19,sp)
16012  3b05 a502          	bcp	a,#2
16013  3b07 273c          	jreq	L7737
16014                     ; 2953 				uc_fault_cnt++;
16016  3b09 0c16          	inc	(OFST+0,sp)
16018                     ; 2954 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16018                     ; 2955 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16018                     ; 2956 				){
16020  3b0b 0d16          	tnz	(OFST+0,sp)
16021  3b0d 270d          	jreq	L5047
16023  3b0f 7b16          	ld	a,(OFST+0,sp)
16024  3b11 a105          	cp	a,#5
16025  3b13 2407          	jruge	L5047
16027  3b15 c60004        	ld	a,_uc_Test_Page_Now
16028  3b18 a104          	cp	a,#4
16029  3b1a 2713          	jreq	L3047
16030  3b1c               L5047:
16032  3b1c 7b16          	ld	a,(OFST+0,sp)
16033  3b1e a105          	cp	a,#5
16034  3b20 2523          	jrult	L7737
16036  3b22 7b16          	ld	a,(OFST+0,sp)
16037  3b24 a109          	cp	a,#9
16038  3b26 241d          	jruge	L7737
16040  3b28 c60004        	ld	a,_uc_Test_Page_Now
16041  3b2b a105          	cp	a,#5
16042  3b2d 2616          	jrne	L7737
16043  3b2f               L3047:
16044                     ; 2957 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16046  3b2f 7b16          	ld	a,(OFST+0,sp)
16047  3b31 5f            	clrw	x
16048  3b32 97            	ld	xl,a
16049  3b33 5a            	decw	x
16050  3b34 a604          	ld	a,#4
16051  3b36 cd0000        	call	c_smodx
16053  3b39 d60000        	ld	a,(_LCD_Line,x)
16054  3b3c cd0000        	call	_Set_LCD_Address
16056                     ; 2958 					Display_LCD_String("Flt_LVLow");
16058  3b3f ae0236        	ldw	x,#L7753
16059  3b42 cd0000        	call	_Display_LCD_String
16061  3b45               L7737:
16062                     ; 2962 			if(can_diag[0] & (U8)(0x04)){
16064  3b45 7b03          	ld	a,(OFST-19,sp)
16065  3b47 a504          	bcp	a,#4
16066  3b49 273c          	jreq	L1147
16067                     ; 2963 				uc_fault_cnt++;
16069  3b4b 0c16          	inc	(OFST+0,sp)
16071                     ; 2964 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16071                     ; 2965 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16071                     ; 2966 				){
16073  3b4d 0d16          	tnz	(OFST+0,sp)
16074  3b4f 270d          	jreq	L7147
16076  3b51 7b16          	ld	a,(OFST+0,sp)
16077  3b53 a105          	cp	a,#5
16078  3b55 2407          	jruge	L7147
16080  3b57 c60004        	ld	a,_uc_Test_Page_Now
16081  3b5a a104          	cp	a,#4
16082  3b5c 2713          	jreq	L5147
16083  3b5e               L7147:
16085  3b5e 7b16          	ld	a,(OFST+0,sp)
16086  3b60 a105          	cp	a,#5
16087  3b62 2523          	jrult	L1147
16089  3b64 7b16          	ld	a,(OFST+0,sp)
16090  3b66 a109          	cp	a,#9
16091  3b68 241d          	jruge	L1147
16093  3b6a c60004        	ld	a,_uc_Test_Page_Now
16094  3b6d a105          	cp	a,#5
16095  3b6f 2616          	jrne	L1147
16096  3b71               L5147:
16097                     ; 2967 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16099  3b71 7b16          	ld	a,(OFST+0,sp)
16100  3b73 5f            	clrw	x
16101  3b74 97            	ld	xl,a
16102  3b75 5a            	decw	x
16103  3b76 a604          	ld	a,#4
16104  3b78 cd0000        	call	c_smodx
16106  3b7b d60000        	ld	a,(_LCD_Line,x)
16107  3b7e cd0000        	call	_Set_LCD_Address
16109                     ; 2968 					Display_LCD_String("Flt_LVHigh");
16111  3b81 ae022b        	ldw	x,#L3163
16112  3b84 cd0000        	call	_Display_LCD_String
16114  3b87               L1147:
16115                     ; 2972 			if(can_diag[0] & (U8)(0x08)){
16117  3b87 7b03          	ld	a,(OFST-19,sp)
16118  3b89 a508          	bcp	a,#8
16119  3b8b 273c          	jreq	L3247
16120                     ; 2973 				uc_fault_cnt++;
16122  3b8d 0c16          	inc	(OFST+0,sp)
16124                     ; 2974 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16124                     ; 2975 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16124                     ; 2976 				){
16126  3b8f 0d16          	tnz	(OFST+0,sp)
16127  3b91 270d          	jreq	L1347
16129  3b93 7b16          	ld	a,(OFST+0,sp)
16130  3b95 a105          	cp	a,#5
16131  3b97 2407          	jruge	L1347
16133  3b99 c60004        	ld	a,_uc_Test_Page_Now
16134  3b9c a104          	cp	a,#4
16135  3b9e 2713          	jreq	L7247
16136  3ba0               L1347:
16138  3ba0 7b16          	ld	a,(OFST+0,sp)
16139  3ba2 a105          	cp	a,#5
16140  3ba4 2523          	jrult	L3247
16142  3ba6 7b16          	ld	a,(OFST+0,sp)
16143  3ba8 a109          	cp	a,#9
16144  3baa 241d          	jruge	L3247
16146  3bac c60004        	ld	a,_uc_Test_Page_Now
16147  3baf a105          	cp	a,#5
16148  3bb1 2616          	jrne	L3247
16149  3bb3               L7247:
16150                     ; 2977 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
16152  3bb3 7b16          	ld	a,(OFST+0,sp)
16153  3bb5 5f            	clrw	x
16154  3bb6 97            	ld	xl,a
16155  3bb7 5a            	decw	x
16156  3bb8 a604          	ld	a,#4
16157  3bba cd0000        	call	c_smodx
16159  3bbd d60000        	ld	a,(_LCD_Line,x)
16160  3bc0 cd0000        	call	_Set_LCD_Address
16162                     ; 2978 					Display_LCD_String("Flt_HVLow");
16164  3bc3 ae0221        	ldw	x,#L7263
16165  3bc6 cd0000        	call	_Display_LCD_String
16167  3bc9               L3247:
16168                     ; 2982 			if(can_diag[0] & (U8)(0x10)){
16170  3bc9 7b03          	ld	a,(OFST-19,sp)
16171  3bcb a510          	bcp	a,#16
16172  3bcd 273c          	jreq	L5347
16173                     ; 2983 				uc_fault_cnt++;
16175  3bcf 0c16          	inc	(OFST+0,sp)
16177                     ; 2984 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16177                     ; 2985 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16177                     ; 2986 				){
16179  3bd1 0d16          	tnz	(OFST+0,sp)
16180  3bd3 270d          	jreq	L3447
16182  3bd5 7b16          	ld	a,(OFST+0,sp)
16183  3bd7 a105          	cp	a,#5
16184  3bd9 2407          	jruge	L3447
16186  3bdb c60004        	ld	a,_uc_Test_Page_Now
16187  3bde a104          	cp	a,#4
16188  3be0 2713          	jreq	L1447
16189  3be2               L3447:
16191  3be2 7b16          	ld	a,(OFST+0,sp)
16192  3be4 a105          	cp	a,#5
16193  3be6 2523          	jrult	L5347
16195  3be8 7b16          	ld	a,(OFST+0,sp)
16196  3bea a109          	cp	a,#9
16197  3bec 241d          	jruge	L5347
16199  3bee c60004        	ld	a,_uc_Test_Page_Now
16200  3bf1 a105          	cp	a,#5
16201  3bf3 2616          	jrne	L5347
16202  3bf5               L1447:
16203                     ; 2987 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16205  3bf5 7b16          	ld	a,(OFST+0,sp)
16206  3bf7 5f            	clrw	x
16207  3bf8 97            	ld	xl,a
16208  3bf9 5a            	decw	x
16209  3bfa a604          	ld	a,#4
16210  3bfc cd0000        	call	c_smodx
16212  3bff d60000        	ld	a,(_LCD_Line,x)
16213  3c02 cd0000        	call	_Set_LCD_Address
16215                     ; 2988 					Display_LCD_String("Flt_HVHigh");
16217  3c05 ae0216        	ldw	x,#L3463
16218  3c08 cd0000        	call	_Display_LCD_String
16220  3c0b               L5347:
16221                     ; 2991 			if(can_diag[1] & (U8)(0x01)){
16223  3c0b 7b04          	ld	a,(OFST-18,sp)
16224  3c0d a501          	bcp	a,#1
16225  3c0f 273c          	jreq	L7447
16226                     ; 2992 				uc_fault_cnt++;
16228  3c11 0c16          	inc	(OFST+0,sp)
16230                     ; 2993 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16230                     ; 2994 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16230                     ; 2995 				){
16232  3c13 0d16          	tnz	(OFST+0,sp)
16233  3c15 270d          	jreq	L5547
16235  3c17 7b16          	ld	a,(OFST+0,sp)
16236  3c19 a105          	cp	a,#5
16237  3c1b 2407          	jruge	L5547
16239  3c1d c60004        	ld	a,_uc_Test_Page_Now
16240  3c20 a104          	cp	a,#4
16241  3c22 2713          	jreq	L3547
16242  3c24               L5547:
16244  3c24 7b16          	ld	a,(OFST+0,sp)
16245  3c26 a105          	cp	a,#5
16246  3c28 2523          	jrult	L7447
16248  3c2a 7b16          	ld	a,(OFST+0,sp)
16249  3c2c a109          	cp	a,#9
16250  3c2e 241d          	jruge	L7447
16252  3c30 c60004        	ld	a,_uc_Test_Page_Now
16253  3c33 a105          	cp	a,#5
16254  3c35 2616          	jrne	L7447
16255  3c37               L3547:
16256                     ; 2996 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
16258  3c37 7b16          	ld	a,(OFST+0,sp)
16259  3c39 5f            	clrw	x
16260  3c3a 97            	ld	xl,a
16261  3c3b 5a            	decw	x
16262  3c3c a604          	ld	a,#4
16263  3c3e cd0000        	call	c_smodx
16265  3c41 d60000        	ld	a,(_LCD_Line,x)
16266  3c44 cd0000        	call	_Set_LCD_Address
16268                     ; 2997 					Display_LCD_String("Flt_PCBThmShut");
16270  3c47 ae01ef        	ldw	x,#L7073
16271  3c4a cd0000        	call	_Display_LCD_String
16273  3c4d               L7447:
16274                     ; 3000 			if(can_diag[1] & (U8)(0x02)){
16276  3c4d 7b04          	ld	a,(OFST-18,sp)
16277  3c4f a502          	bcp	a,#2
16278  3c51 273c          	jreq	L1647
16279                     ; 3001 				uc_fault_cnt++;
16281  3c53 0c16          	inc	(OFST+0,sp)
16283                     ; 3002 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16283                     ; 3003 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16283                     ; 3004 				){
16285  3c55 0d16          	tnz	(OFST+0,sp)
16286  3c57 270d          	jreq	L7647
16288  3c59 7b16          	ld	a,(OFST+0,sp)
16289  3c5b a105          	cp	a,#5
16290  3c5d 2407          	jruge	L7647
16292  3c5f c60004        	ld	a,_uc_Test_Page_Now
16293  3c62 a104          	cp	a,#4
16294  3c64 2713          	jreq	L5647
16295  3c66               L7647:
16297  3c66 7b16          	ld	a,(OFST+0,sp)
16298  3c68 a105          	cp	a,#5
16299  3c6a 2523          	jrult	L1647
16301  3c6c 7b16          	ld	a,(OFST+0,sp)
16302  3c6e a109          	cp	a,#9
16303  3c70 241d          	jruge	L1647
16305  3c72 c60004        	ld	a,_uc_Test_Page_Now
16306  3c75 a105          	cp	a,#5
16307  3c77 2616          	jrne	L1647
16308  3c79               L5647:
16309                     ; 3005 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16311  3c79 7b16          	ld	a,(OFST+0,sp)
16312  3c7b 5f            	clrw	x
16313  3c7c 97            	ld	xl,a
16314  3c7d 5a            	decw	x
16315  3c7e a604          	ld	a,#4
16316  3c80 cd0000        	call	c_smodx
16318  3c83 d60000        	ld	a,(_LCD_Line,x)
16319  3c86 cd0000        	call	_Set_LCD_Address
16321                     ; 3006 					Display_LCD_String("Fail_LVSen");
16323  3c89 ae01ca        	ldw	x,#L3573
16324  3c8c cd0000        	call	_Display_LCD_String
16326  3c8f               L1647:
16327                     ; 3011 			if(can_diag[1] & (U8)(0x04)){
16329  3c8f 7b04          	ld	a,(OFST-18,sp)
16330  3c91 a504          	bcp	a,#4
16331  3c93 273c          	jreq	L3747
16332                     ; 3012 				uc_fault_cnt++;
16334  3c95 0c16          	inc	(OFST+0,sp)
16336                     ; 3013 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16336                     ; 3014 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16336                     ; 3015 				){
16338  3c97 0d16          	tnz	(OFST+0,sp)
16339  3c99 270d          	jreq	L1057
16341  3c9b 7b16          	ld	a,(OFST+0,sp)
16342  3c9d a105          	cp	a,#5
16343  3c9f 2407          	jruge	L1057
16345  3ca1 c60004        	ld	a,_uc_Test_Page_Now
16346  3ca4 a104          	cp	a,#4
16347  3ca6 2713          	jreq	L7747
16348  3ca8               L1057:
16350  3ca8 7b16          	ld	a,(OFST+0,sp)
16351  3caa a105          	cp	a,#5
16352  3cac 2523          	jrult	L3747
16354  3cae 7b16          	ld	a,(OFST+0,sp)
16355  3cb0 a109          	cp	a,#9
16356  3cb2 241d          	jruge	L3747
16358  3cb4 c60004        	ld	a,_uc_Test_Page_Now
16359  3cb7 a105          	cp	a,#5
16360  3cb9 2616          	jrne	L3747
16361  3cbb               L7747:
16362                     ; 3016 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16364  3cbb 7b16          	ld	a,(OFST+0,sp)
16365  3cbd 5f            	clrw	x
16366  3cbe 97            	ld	xl,a
16367  3cbf 5a            	decw	x
16368  3cc0 a604          	ld	a,#4
16369  3cc2 cd0000        	call	c_smodx
16371  3cc5 d60000        	ld	a,(_LCD_Line,x)
16372  3cc8 cd0000        	call	_Set_LCD_Address
16374                     ; 3017 					Display_LCD_String("Fail_HVSen");
16376  3ccb ae01d5        	ldw	x,#L7373
16377  3cce cd0000        	call	_Display_LCD_String
16379  3cd1               L3747:
16380                     ; 3021 			if(can_diag[1] & (U8)(0x08)){
16382  3cd1 7b04          	ld	a,(OFST-18,sp)
16383  3cd3 a508          	bcp	a,#8
16384  3cd5 273c          	jreq	L5057
16385                     ; 3022 				uc_fault_cnt++;
16387  3cd7 0c16          	inc	(OFST+0,sp)
16389                     ; 3023 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16389                     ; 3024 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16389                     ; 3025 				){
16391  3cd9 0d16          	tnz	(OFST+0,sp)
16392  3cdb 270d          	jreq	L3157
16394  3cdd 7b16          	ld	a,(OFST+0,sp)
16395  3cdf a105          	cp	a,#5
16396  3ce1 2407          	jruge	L3157
16398  3ce3 c60004        	ld	a,_uc_Test_Page_Now
16399  3ce6 a104          	cp	a,#4
16400  3ce8 2713          	jreq	L1157
16401  3cea               L3157:
16403  3cea 7b16          	ld	a,(OFST+0,sp)
16404  3cec a105          	cp	a,#5
16405  3cee 2523          	jrult	L5057
16407  3cf0 7b16          	ld	a,(OFST+0,sp)
16408  3cf2 a109          	cp	a,#9
16409  3cf4 241d          	jruge	L5057
16411  3cf6 c60004        	ld	a,_uc_Test_Page_Now
16412  3cf9 a105          	cp	a,#5
16413  3cfb 2616          	jrne	L5057
16414  3cfd               L1157:
16415                     ; 3026 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16417  3cfd 7b16          	ld	a,(OFST+0,sp)
16418  3cff 5f            	clrw	x
16419  3d00 97            	ld	xl,a
16420  3d01 5a            	decw	x
16421  3d02 a604          	ld	a,#4
16422  3d04 cd0000        	call	c_smodx
16424  3d07 d60000        	ld	a,(_LCD_Line,x)
16425  3d0a cd0000        	call	_Set_LCD_Address
16427                     ; 3027 					Display_LCD_String("Fail_PCBTempSen");
16429  3d0d ae0012        	ldw	x,#L7157
16430  3d10 cd0000        	call	_Display_LCD_String
16432  3d13               L5057:
16433                     ; 3031 			if(can_diag[1] & (U8)(0x10)){
16435  3d13 7b04          	ld	a,(OFST-18,sp)
16436  3d15 a510          	bcp	a,#16
16437  3d17 273c          	jreq	L1257
16438                     ; 3032 				uc_fault_cnt++;
16440  3d19 0c16          	inc	(OFST+0,sp)
16442                     ; 3033 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16442                     ; 3034 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16442                     ; 3035 				){
16444  3d1b 0d16          	tnz	(OFST+0,sp)
16445  3d1d 270d          	jreq	L7257
16447  3d1f 7b16          	ld	a,(OFST+0,sp)
16448  3d21 a105          	cp	a,#5
16449  3d23 2407          	jruge	L7257
16451  3d25 c60004        	ld	a,_uc_Test_Page_Now
16452  3d28 a104          	cp	a,#4
16453  3d2a 2713          	jreq	L5257
16454  3d2c               L7257:
16456  3d2c 7b16          	ld	a,(OFST+0,sp)
16457  3d2e a105          	cp	a,#5
16458  3d30 2523          	jrult	L1257
16460  3d32 7b16          	ld	a,(OFST+0,sp)
16461  3d34 a109          	cp	a,#9
16462  3d36 241d          	jruge	L1257
16464  3d38 c60004        	ld	a,_uc_Test_Page_Now
16465  3d3b a105          	cp	a,#5
16466  3d3d 2616          	jrne	L1257
16467  3d3f               L5257:
16468                     ; 3036 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16470  3d3f 7b16          	ld	a,(OFST+0,sp)
16471  3d41 5f            	clrw	x
16472  3d42 97            	ld	xl,a
16473  3d43 5a            	decw	x
16474  3d44 a604          	ld	a,#4
16475  3d46 cd0000        	call	c_smodx
16477  3d49 d60000        	ld	a,(_LCD_Line,x)
16478  3d4c cd0000        	call	_Set_LCD_Address
16480                     ; 3037 					Display_LCD_String("Flt_MsgTimeOut");
16482  3d4f ae01e0        	ldw	x,#L3273
16483  3d52 cd0000        	call	_Display_LCD_String
16485  3d55               L1257:
16486                     ; 3041 			if(can_diag[1] & (U8)(0x20)){
16488  3d55 7b04          	ld	a,(OFST-18,sp)
16489  3d57 a520          	bcp	a,#32
16490  3d59 273c          	jreq	L3357
16491                     ; 3042 				uc_fault_cnt++;
16493  3d5b 0c16          	inc	(OFST+0,sp)
16495                     ; 3043 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(4)))
16495                     ; 3044 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(5)))		     
16495                     ; 3045 				){
16497  3d5d 0d16          	tnz	(OFST+0,sp)
16498  3d5f 270d          	jreq	L1457
16500  3d61 7b16          	ld	a,(OFST+0,sp)
16501  3d63 a105          	cp	a,#5
16502  3d65 2407          	jruge	L1457
16504  3d67 c60004        	ld	a,_uc_Test_Page_Now
16505  3d6a a104          	cp	a,#4
16506  3d6c 2713          	jreq	L7357
16507  3d6e               L1457:
16509  3d6e 7b16          	ld	a,(OFST+0,sp)
16510  3d70 a105          	cp	a,#5
16511  3d72 2523          	jrult	L3357
16513  3d74 7b16          	ld	a,(OFST+0,sp)
16514  3d76 a109          	cp	a,#9
16515  3d78 241d          	jruge	L3357
16517  3d7a c60004        	ld	a,_uc_Test_Page_Now
16518  3d7d a105          	cp	a,#5
16519  3d7f 2616          	jrne	L3357
16520  3d81               L7357:
16521                     ; 3046 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
16523  3d81 7b16          	ld	a,(OFST+0,sp)
16524  3d83 5f            	clrw	x
16525  3d84 97            	ld	xl,a
16526  3d85 5a            	decw	x
16527  3d86 a604          	ld	a,#4
16528  3d88 cd0000        	call	c_smodx
16530  3d8b d60000        	ld	a,(_LCD_Line,x)
16531  3d8e cd0000        	call	_Set_LCD_Address
16533                     ; 3047 					Display_LCD_String("Flt_InterLock");
16535  3d91 ae0004        	ldw	x,#L5457
16536  3d94 cd0000        	call	_Display_LCD_String
16538  3d97               L3357:
16539                     ; 3051 			if(!uc_fault_cnt){
16541  3d97 0d16          	tnz	(OFST+0,sp)
16542  3d99 260c          	jrne	L5566
16543                     ; 3052 				Set_LCD_Address(LCD_Line[0]);
16545  3d9b c60000        	ld	a,_LCD_Line
16546  3d9e cd0000        	call	_Set_LCD_Address
16548                     ; 3053 				Display_LCD_String("Normal");
16550  3da1 ae0183        	ldw	x,#L3504
16551  3da4 cd0000        	call	_Display_LCD_String
16553  3da7               L5566:
16554                     ; 3058 	if((b_Com_On_flag == ON)){
16556  3da7 c6000d        	ld	a,_uc_Test_Ctrl_Reg
16557  3daa a508          	bcp	a,#8
16558  3dac 270d          	jreq	L1557
16559                     ; 3059 		Set_LCD_Address((unsigned char)(0x00+15));
16561  3dae a60f          	ld	a,#15
16562  3db0 cd0000        	call	_Set_LCD_Address
16564                     ; 3062 		Display_LCD_String("Y");	// YJS 20230314
16566  3db3 ae0181        	ldw	x,#L7504
16567  3db6 cd0000        	call	_Display_LCD_String
16570  3db9 200b          	jra	L3557
16571  3dbb               L1557:
16572                     ; 3064 		Set_LCD_Address((unsigned char)(0x00+15));
16574  3dbb a60f          	ld	a,#15
16575  3dbd cd0000        	call	_Set_LCD_Address
16577                     ; 3065 		Display_LCD_String("N");
16579  3dc0 ae0244        	ldw	x,#L5543
16580  3dc3 cd0000        	call	_Display_LCD_String
16582  3dc6               L3557:
16583                     ; 3068 	return;
16585  3dc6 acde2fde      	jpf	L613
16612                     ; 3072 void Test_Controller_Routine(void)
16612                     ; 3073 {
16613                     	switch	.text
16614  3dca               _Test_Controller_Routine:
16618                     ; 3081 	Test_Ctrl_LCD_Display_Control();
16620  3dca cd2a96        	call	_Test_Ctrl_LCD_Display_Control
16622                     ; 3083 	Test_Ctrl_Swtich_Control();
16624  3dcd cd03ca        	call	_Test_Ctrl_Swtich_Control
16626                     ; 3088 	Cycle_Test_Control_Routine();
16628  3dd0 cd077c        	call	_Cycle_Test_Control_Routine
16630                     ; 3091 	return;
16633  3dd3 81            	ret
16669                     ; 3096 void Test_Ctrl_Reset_Values(void)
16669                     ; 3097 {
16670                     	switch	.text
16671  3dd4               _Test_Ctrl_Reset_Values:
16675                     ; 3098 	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
16677  3dd4 725f000d      	clr	_uc_Test_Ctrl_Reg
16678                     ; 3099 	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
16680  3dd8 725f000e      	clr	_uc_Model_Select_Reg
16681                     ; 3100 	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register
16683  3ddc 725f000c      	clr	_uc_Rx_TimeOut_Reg
16684                     ; 3102 	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
16686  3de0 725f0004      	clr	_uc_Test_Page_Now
16687                     ; 3103 	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
16689  3de4 725f0003      	clr	_uc_Test_Page_Pre
16690                     ; 3104 	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number
16692  3de8 725f0002      	clr	_uc_Test_Data_Select_Num
16693                     ; 3106 	uc_Perc_Unit = 1;		// Duty_Moving_Unit
16695  3dec 35010001      	mov	_uc_Perc_Unit,#1
16696                     ; 3108 	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
16698  3df0 5f            	clrw	x
16699  3df1 cf0007        	ldw	_ui_Rx1_TimeOut_Cnt,x
16700                     ; 3109 	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter
16702  3df4 5f            	clrw	x
16703  3df5 cf0005        	ldw	_ui_Rx2_TimeOut_Cnt,x
16704                     ; 3111 	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
16706  3df8 725f0009      	clr	_uc_Heater_Enable_Flag
16707                     ; 3112 	uc_Target_Duty_Perc[HTR_ZONE_1] = 0;		// Target_Duty_Percentage
16709  3dfc 725f000a      	clr	_uc_Target_Duty_Perc
16710                     ; 3113 	uc_Target_Duty_Perc[HTR_ZONE_2] = 0;		// Target_Duty_Percentage
16712  3e00 725f000b      	clr	_uc_Target_Duty_Perc+1
16713                     ; 3114 	HEATER_zone_status=HTR_ZONE_1;
16715  3e04 725f0000      	clr	_HEATER_zone_status
16716                     ; 3115 	return;
16719  3e08 81            	ret
16957                     	xdef	_Test_Ctrl_LCD_Display_Control
16958                     	xdef	_Test_Ctrl_Text_Display_Handling
16959                     	xdef	_Cycle_Test_Control_Routine
16960                     	xdef	_Test_48h_On
16961                     	xdef	_Test_1h_OFF_1h_On
16962                     	xdef	_Test_10m_OFF_10m_On
16963                     	xdef	_Test_30s_OFF_30s_On
16964                     	xdef	_Test_Ctrl_Swtich_Control
16965                     	xdef	_Test_Ctrl_Value_Change
16966                     	xdef	_Model_Select_LCD_Display_Control
16967                     	xdef	_Model_Select_Switch_Control
16968                     	xdef	_Model_Select_Display_Handling
16969                     	xdef	_First_Switch_Control
16970                     	xdef	_Reset_Long_Test_Timer
16971                     	xdef	_Long_Test_Timer_Count
16972                     	xdef	_Reset_Cycle_Test_Timer
16973                     	xdef	_Cycle_Test_Timer_Count
16974                     	xdef	_ui_Test_1hour_cnt
16975                     	xdef	_ui_Test_1min_cnt
16976                     	xdef	_ui_Test_1sec_cnt
16977                     	xdef	_ui_Test_10ms_cnt
16978                     	xdef	_ui_Total_hour_cnt
16979                     	xdef	_ui_1hour_cnt
16980                     	xdef	_ui_1min_cnt
16981                     	xdef	_ui_1sec_cnt
16982                     	xdef	_ui_10ms_cnt
16983                     	xdef	_ui_Test_Target
16984                     	xdef	_ui_Test_Cycle
16985                     	xdef	_uc_Test_Step
16986                     	xdef	_uc_Test_Mode
16987                     	xdef	_uc_Test_Pre_Mode
16988                     	switch	.bss
16989  0000               _uc_Target_Display_Mode:
16990  0000 00            	ds.b	1
16991                     	xdef	_uc_Target_Display_Mode
16992  0001               _uc_Perc_Unit:
16993  0001 00            	ds.b	1
16994                     	xdef	_uc_Perc_Unit
16995  0002               _uc_Test_Data_Select_Num:
16996  0002 00            	ds.b	1
16997                     	xdef	_uc_Test_Data_Select_Num
16998  0003               _uc_Test_Page_Pre:
16999  0003 00            	ds.b	1
17000                     	xdef	_uc_Test_Page_Pre
17001  0004               _uc_Test_Page_Now:
17002  0004 00            	ds.b	1
17003                     	xdef	_uc_Test_Page_Now
17004                     	xref	_Start_Zig_Display
17005                     	xref	_HEATER_zone_status
17006                     	xdef	_Test_Ctrl_Reset_Values
17007                     	xdef	_Test_Controller_Routine
17008                     	xdef	_Model_Select_Routine
17009                     	xdef	_Test_Controller_First_Routine
17010  0005               _ui_Rx2_TimeOut_Cnt:
17011  0005 0000          	ds.b	2
17012                     	xdef	_ui_Rx2_TimeOut_Cnt
17013  0007               _ui_Rx1_TimeOut_Cnt:
17014  0007 0000          	ds.b	2
17015                     	xdef	_ui_Rx1_TimeOut_Cnt
17016                     	xdef	_uc_Rx_Data
17017  0009               _uc_Heater_Enable_Flag:
17018  0009 00            	ds.b	1
17019                     	xdef	_uc_Heater_Enable_Flag
17020  000a               _uc_Target_Duty_Perc:
17021  000a 0000          	ds.b	2
17022                     	xdef	_uc_Target_Duty_Perc
17023  000c               _uc_Rx_TimeOut_Reg:
17024  000c 00            	ds.b	1
17025                     	xdef	_uc_Rx_TimeOut_Reg
17026  000d               _uc_Test_Ctrl_Reg:
17027  000d 00            	ds.b	1
17028                     	xdef	_uc_Test_Ctrl_Reg
17029  000e               _uc_Model_Select_Reg:
17030  000e 00            	ds.b	1
17031                     	xdef	_uc_Model_Select_Reg
17032                     	xref	_uc_Button_Status_Reg
17033                     	xref	_Num_Display_LCD
17034                     	xref	_Display_LCD_String
17035                     	xref	_Set_LCD_Address
17036                     	xref	_LCD_Dis_Data
17037                     	xref	_LCD_Line
17038                     	xref	_uc_LCD_Blink_Reg
17039                     	xref	_uc_System_Ctrl_Reg
17040                     	switch	.const
17041  0004               L5457:
17042  0004 466c745f496e  	dc.b	"Flt_InterLock",0
17043  0012               L7157:
17044  0012 4661696c5f50  	dc.b	"Fail_PCBTempSen",0
17045  0022               L5737:
17046  0022 466c745f5074  	dc.b	"Flt_Ptc",0
17047  002a               L1637:
17048  002a 466c745f436f  	dc.b	"Flt_CoreTempSen",0
17049  003a               L5437:
17050  003a 466c745f4375  	dc.b	"Flt_CurrentSen",0
17051  0049               L1337:
17052  0049 466c745f4f76  	dc.b	"Flt_OverCurrent",0
17053  0059               L5137:
17054  0059 466c745f436f  	dc.b	"Flt_CoreTemp",0
17055  0066               L3146:
17056  0066 3438685f4f6e  	dc.b	"48h_On",0
17057  006d               L5046:
17058  006d 31685f4f4646  	dc.b	"1h_OFF_1h_On",0
17059  007a               L7736:
17060  007a 31306d5f4f46  	dc.b	"10m_OFF_10m_On",0
17061  0089               L1736:
17062  0089 3330735f4f46  	dc.b	"30s_OFF_30s_On",0
17063  0098               L3726:
17064  0098 3a00          	dc.b	":",0
17065  009a               L3626:
17066  009a 303000        	dc.b	"00",0
17067  009d               L5526:
17068  009d 30303000      	dc.b	"000",0
17069  00a1               L7426:
17070  00a1 3030303a3030  	dc.b	"000:00:00",0
17071  00ab               L7326:
17072  00ab 4f46462c3438  	dc.b	"OFF,48hour",0
17073  00b6               L1326:
17074  00b6 4f6e2c343868  	dc.b	"On,48hour",0
17075  00c0               L1226:
17076  00c0 4f46462c3168  	dc.b	"OFF,1hour",0
17077  00ca               L3126:
17078  00ca 4f6e2c31686f  	dc.b	"On,1hour",0
17079  00d3               L3026:
17080  00d3 4f46462c3130  	dc.b	"OFF,10min",0
17081  00dd               L5716:
17082  00dd 4f6e2c31306d  	dc.b	"On,10min",0
17083  00e6               L5616:
17084  00e6 4f46462c3330  	dc.b	"OFF,30sec",0
17085  00f0               L7516:
17086  00f0 4f6e2c333073  	dc.b	"On,30sec",0
17087  00f9               L7416:
17088  00f9 53544f5000    	dc.b	"STOP",0
17089  00fe               L7316:
17090  00fe 34386800      	dc.b	"48h",0
17091  0102               L1316:
17092  0102 3168746f3168  	dc.b	"1hto1h",0
17093  0109               L3216:
17094  0109 31306d746f31  	dc.b	"10mto10m",0
17095  0112               L5116:
17096  0112 333073746f33  	dc.b	"30sto30s",0
17097  011b               L1116:
17098  011b 2f00          	dc.b	"/",0
17099  011d               L7706:
17100  011d 546573745f4d  	dc.b	"Test_Mode4",0
17101  0128               L1706:
17102  0128 546573745f4d  	dc.b	"Test_Mode3",0
17103  0133               L3606:
17104  0133 546573745f4d  	dc.b	"Test_Mode2",0
17105  013e               L5506:
17106  013e 546573745f4d  	dc.b	"Test_Mode1",0
17107  0149               L7406:
17108  0149 4d6f64653a00  	dc.b	"Mode:",0
17109  014f               L1406:
17110  014f 3438685f4f4e  	dc.b	"48h_ON",0
17111  0156               L3306:
17112  0156 31685f4f4646  	dc.b	"1h_OFF_1h_ON",0
17113  0163               L5206:
17114  0163 31306d5f4f46  	dc.b	"10m_OFF_10m_ON",0
17115  0172               L7106:
17116  0172 3330735f4f4e  	dc.b	"30s_ON_30s_OFF",0
17117  0181               L7504:
17118  0181 5900          	dc.b	"Y",0
17119  0183               L3504:
17120  0183 4e6f726d616c  	dc.b	"Normal",0
17121  018a               L7404:
17122  018a 4661696c5f6f  	dc.b	"Fail_openLoad",0
17123  0198               L3304:
17124  0198 4661696c5f49  	dc.b	"Fail_IGBT",0
17125  01a2               L7104:
17126  01a2 4661696c5f50  	dc.b	"Fail_PCB1Temp",0
17127  01b0               L3004:
17128  01b0 4661696c5f43  	dc.b	"Fail_CoreTemp",0
17129  01be               L7673:
17130  01be 4661696c5f43  	dc.b	"Fail_CurSen",0
17131  01ca               L3573:
17132  01ca 4661696c5f4c  	dc.b	"Fail_LVSen",0
17133  01d5               L7373:
17134  01d5 4661696c5f48  	dc.b	"Fail_HVSen",0
17135  01e0               L3273:
17136  01e0 466c745f4d73  	dc.b	"Flt_MsgTimeOut",0
17137  01ef               L7073:
17138  01ef 466c745f5043  	dc.b	"Flt_PCBThmShut",0
17139  01fe               L3763:
17140  01fe 466c745f5468  	dc.b	"Flt_ThmShut",0
17141  020a               L7563:
17142  020a 466c745f4f76  	dc.b	"Flt_OverCur",0
17143  0216               L3463:
17144  0216 466c745f4856  	dc.b	"Flt_HVHigh",0
17145  0221               L7263:
17146  0221 466c745f4856  	dc.b	"Flt_HVLow",0
17147  022b               L3163:
17148  022b 466c745f4c56  	dc.b	"Flt_LVHigh",0
17149  0236               L7753:
17150  0236 466c745f4c56  	dc.b	"Flt_LVLow",0
17151  0240               L1453:
17152  0240 2d00          	dc.b	"-",0
17153  0242               L3643:
17154  0242 3100          	dc.b	"1",0
17155  0244               L5543:
17156  0244 4e00          	dc.b	"N",0
17157  0246               L5133:
17158  0246 4d415800      	dc.b	"MAX",0
17159  024a               L7323:
17160  024a 4c6d697400    	dc.b	"Lmit",0
17161  024f               L1323:
17162  024f 466c7400      	dc.b	"Flt",0
17163  0253               L3223:
17164  0253 4f70657200    	dc.b	"Oper",0
17165  0258               L5123:
17166  0258 53746f7000    	dc.b	"Stop",0
17167  025d               L7023:
17168  025d 4e4300        	dc.b	"NC",0
17169  0260               L3023:
17170  0260 5a3200        	dc.b	"Z2",0
17171  0263               L7713:
17172  0263 5a3100        	dc.b	"Z1",0
17173  0266               L7513:
17174  0266 202020202020  	dc.b	"        Fd:",0
17175  0272               L5413:
17176  0272 202020202020  	dc.b	"        /",0
17177  027c               L7113:
17178  027c 2500          	dc.b	"%",0
17179  027e               L5113:
17180  027e 3000          	dc.b	"0",0
17181  0280               L1113:
17182  0280 3500          	dc.b	"5",0
17183  0282               L5013:
17184  0282 2e00          	dc.b	".",0
17185  0284               L1013:
17186  0284 445f556e6974  	dc.b	"D_Unit:",0
17187  028c               L7703:
17188  028c 2a5461726765  	dc.b	"*Target Watt(OS)",0
17189  029d               L3703:
17190  029d 2a5461726765  	dc.b	"*Target Perc",0
17191  02aa               L7603:
17192  02aa 2a4f5054494f  	dc.b	"*OPTION*",0
17193  02b3               L7003:
17194  02b3 5665723a00    	dc.b	"Ver:",0
17195  02b8               L5003:
17196  02b8 43743a00      	dc.b	"Ct:",0
17197  02bc               L3003:
17198  02bc 43723a202020  	dc.b	"Cr:     Pw:",0
17199  02c8               L1003:
17200  02c8 523a2020463a  	dc.b	"R:  F:  HV:",0
17201  02d4               L7772:
17202  02d4 54703a202020  	dc.b	"Tp:     Fd:",0
17203  02e0               L3772:
17204  02e0 54643a202020  	dc.b	"Td:     Fd:",0
17205  02ec               L7672:
17206  02ec 416c3a202020  	dc.b	"Al:     /",0
17207  02f6               L5672:
17208  02f6 54323a00      	dc.b	"T2:",0
17209  02fa               L3672:
17210  02fa 54313a00      	dc.b	"T1:",0
17211  02fe               L1672:
17212  02fe 53543a00      	dc.b	"ST:",0
17213  0302               L7572:
17214  0302 53703a00      	dc.b	"Sp:",0
17215  0306               L5572:
17216  0306 433a00        	dc.b	"C:",0
17217  0309               L1302:
17218  0309 00            	dc.b	0
17219  030a               L7202:
17220  030a 2a4856434320  	dc.b	"*HVCC Model*",0
17221                     	xref.b	c_lreg
17222                     	xref.b	c_x
17223                     	xref.b	c_y
17243                     	xref	c_smodx
17244                     	xref	c_sdivx
17245                     	xref	c_ludv
17246                     	xref	c_umul
17247                     	xref	c_strcpx
17248                     	end

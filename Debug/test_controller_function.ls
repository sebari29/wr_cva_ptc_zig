   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2655                     	switch	.data
2656  0000               _uc_Rx_Data:
2657  0000 00            	dc.b	0
2658  0001 000000000000  	ds.b	7
2659  0008 000000000000  	ds.b	24
2695                     ; 37 void First_Switch_Control(void)
2695                     ; 38 {
2697                     	switch	.text
2698  0000               _First_Switch_Control:
2702                     ; 39 	if(b_ENTER_Button_Flag){
2704  0000 c60000        	ld	a,_uc_Button_Status_Reg
2705  0003 a520          	bcp	a,#32
2706  0005 2718          	jreq	L1271
2707                     ; 40 		b_First_Logic_On = ON;
2709  0007 72100000      	bset	_uc_System_Ctrl_Reg,#0
2710                     ; 41 		b_Model_Select_flag = OFF;		// Model_Selection_Skipped
2712  000b 7211000d      	bres	_uc_Test_Ctrl_Reg,#0
2713                     ; 42 		b_Data_Select_flag = OFF;
2715  000f 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
2716                     ; 44 		uc_Test_Page_Pre = (U8)(1);
2718  0013 35010003      	mov	_uc_Test_Page_Pre,#1
2719                     ; 45 		uc_Test_Data_Select_Num = (U8)(0);
2721  0017 725f0002      	clr	_uc_Test_Data_Select_Num
2722                     ; 47 		b_ENTER_Button_Flag = OFF;
2724  001b 721b0000      	bres	_uc_Button_Status_Reg,#5
2725  001f               L1271:
2726                     ; 50 	return;
2729  001f 81            	ret
2756                     ; 55 void Test_Controller_First_Routine(void)
2756                     ; 56 {
2757                     	switch	.text
2758  0020               _Test_Controller_First_Routine:
2762                     ; 57 	Start_Zig_Display();
2764  0020 cd0000        	call	_Start_Zig_Display
2766                     ; 58 	First_Switch_Control();
2768  0023 addb          	call	_First_Switch_Control
2770                     ; 59 	b_Com_On_flag = OFF;//YJS 20230314
2772  0025 7217000d      	bres	_uc_Test_Ctrl_Reg,#3
2773                     ; 60 	return;
2776  0029 81            	ret
2803                     ; 66 void Model_Select_Display_Handling(void)
2803                     ; 67 {
2804                     	switch	.text
2805  002a               _Model_Select_Display_Handling:
2809                     ; 68 	switch(uc_Test_Page_Now){
2811  002a 725d0004      	tnz	_uc_Test_Page_Now
2812  002e 262e          	jrne	L5371
2815  0030               L3371:
2816                     ; 71 		case 0:	strcpy(LCD_Dis_Data[0],"*HVCC Model*");	
2818  0030 ae017a        	ldw	x,#L3571
2819  0033 89            	pushw	x
2820  0034 ae0000        	ldw	x,#_LCD_Dis_Data
2821  0037 cd0000        	call	_strcpy
2823  003a 85            	popw	x
2824                     ; 72 				strcpy(LCD_Dis_Data[1],"");	// 
2826  003b ae0179        	ldw	x,#L5571
2827  003e 89            	pushw	x
2828  003f ae0010        	ldw	x,#_LCD_Dis_Data+16
2829  0042 cd0000        	call	_strcpy
2831  0045 85            	popw	x
2832                     ; 73 				strcpy(LCD_Dis_Data[2],"");	// 
2834  0046 ae0179        	ldw	x,#L5571
2835  0049 89            	pushw	x
2836  004a ae0020        	ldw	x,#_LCD_Dis_Data+32
2837  004d cd0000        	call	_strcpy
2839  0050 85            	popw	x
2840                     ; 74 				strcpy(LCD_Dis_Data[3],"");		
2842  0051 ae0179        	ldw	x,#L5571
2843  0054 89            	pushw	x
2844  0055 ae0030        	ldw	x,#_LCD_Dis_Data+48
2845  0058 cd0000        	call	_strcpy
2847  005b 85            	popw	x
2848                     ; 76 				break;
2850  005c 202c          	jra	L1571
2851  005e               L5371:
2852                     ; 78 		default: 
2852                     ; 79 				strcpy(LCD_Dis_Data[0],"");	// Null
2854  005e ae0179        	ldw	x,#L5571
2855  0061 89            	pushw	x
2856  0062 ae0000        	ldw	x,#_LCD_Dis_Data
2857  0065 cd0000        	call	_strcpy
2859  0068 85            	popw	x
2860                     ; 80 				strcpy(LCD_Dis_Data[1],"");	// Null
2862  0069 ae0179        	ldw	x,#L5571
2863  006c 89            	pushw	x
2864  006d ae0010        	ldw	x,#_LCD_Dis_Data+16
2865  0070 cd0000        	call	_strcpy
2867  0073 85            	popw	x
2868                     ; 81 				strcpy(LCD_Dis_Data[2],"");	// Null
2870  0074 ae0179        	ldw	x,#L5571
2871  0077 89            	pushw	x
2872  0078 ae0020        	ldw	x,#_LCD_Dis_Data+32
2873  007b cd0000        	call	_strcpy
2875  007e 85            	popw	x
2876                     ; 82 				strcpy(LCD_Dis_Data[3],"");	// Null
2878  007f ae0179        	ldw	x,#L5571
2879  0082 89            	pushw	x
2880  0083 ae0030        	ldw	x,#_LCD_Dis_Data+48
2881  0086 cd0000        	call	_strcpy
2883  0089 85            	popw	x
2884                     ; 84 				break;
2885  008a               L1571:
2886                     ; 87 	return;
2889  008a 81            	ret
2914                     ; 93 void Model_Select_Switch_Control(void)
2914                     ; 94 {
2915                     	switch	.text
2916  008b               _Model_Select_Switch_Control:
2920                     ; 95 	if(b_UP_Button_Flag){
2922  008b c60000        	ld	a,_uc_Button_Status_Reg
2923  008e a502          	bcp	a,#2
2924  0090 2704          	jreq	L1771
2925                     ; 97 		b_UP_Button_Flag = OFF;
2927  0092 72130000      	bres	_uc_Button_Status_Reg,#1
2928  0096               L1771:
2929                     ; 100 	if(b_DOWN_Button_Flag){
2931  0096 c60000        	ld	a,_uc_Button_Status_Reg
2932  0099 a504          	bcp	a,#4
2933  009b 2704          	jreq	L3771
2934                     ; 102 		b_DOWN_Button_Flag = OFF;
2936  009d 72150000      	bres	_uc_Button_Status_Reg,#2
2937  00a1               L3771:
2938                     ; 105 	if(b_ENTER_Button_Flag){
2940  00a1 c60000        	ld	a,_uc_Button_Status_Reg
2941  00a4 a520          	bcp	a,#32
2942  00a6 2704          	jreq	L5771
2943                     ; 107 		b_ENTER_Button_Flag = OFF;
2945  00a8 721b0000      	bres	_uc_Button_Status_Reg,#5
2946  00ac               L5771:
2947                     ; 111 	return;
2950  00ac 81            	ret
2993                     ; 117 void Model_Select_LCD_Display_Control(void)
2993                     ; 118 {
2994                     	switch	.text
2995  00ad               _Model_Select_LCD_Display_Control:
2997  00ad 88            	push	a
2998       00000001      OFST:	set	1
3001                     ; 121 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
3003  00ae c60004        	ld	a,_uc_Test_Page_Now
3004  00b1 c10003        	cp	a,_uc_Test_Page_Pre
3005  00b4 2703          	jreq	L3102
3008  00b6 cd002a        	call	_Model_Select_Display_Handling
3010  00b9               L3102:
3011                     ; 122 	uc_Test_Page_Pre = uc_Test_Page_Now ;
3013  00b9 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
3014                     ; 125 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
3016  00be 725d0004      	tnz	_uc_Test_Page_Now
3017  00c2 2643          	jrne	L5102
3018                     ; 126 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3020  00c4 0f01          	clr	(OFST+0,sp)
3021  00c6               L7102:
3022                     ; 127 			Set_LCD_Address(LCD_Line[uc_line_index]);
3024  00c6 7b01          	ld	a,(OFST+0,sp)
3025  00c8 5f            	clrw	x
3026  00c9 97            	ld	xl,a
3027  00ca d60000        	ld	a,(_LCD_Line,x)
3028  00cd cd0000        	call	_Set_LCD_Address
3030                     ; 129 			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3032  00d0 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3033  00d3 a502          	bcp	a,#2
3034  00d5 271c          	jreq	L5202
3036  00d7 7b01          	ld	a,(OFST+0,sp)
3037  00d9 c10002        	cp	a,_uc_Test_Data_Select_Num
3038  00dc 2615          	jrne	L5202
3039                     ; 130 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3041  00de c60000        	ld	a,_uc_LCD_Blink_Reg
3042  00e1 a502          	bcp	a,#2
3043  00e3 271a          	jreq	L1302
3046  00e5 7b01          	ld	a,(OFST+0,sp)
3047  00e7 97            	ld	xl,a
3048  00e8 a610          	ld	a,#16
3049  00ea 42            	mul	x,a
3050  00eb 1c0000        	addw	x,#_LCD_Dis_Data
3051  00ee cd0000        	call	_Display_LCD_String
3053  00f1 200c          	jra	L1302
3054  00f3               L5202:
3055                     ; 131 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3057  00f3 7b01          	ld	a,(OFST+0,sp)
3058  00f5 97            	ld	xl,a
3059  00f6 a610          	ld	a,#16
3060  00f8 42            	mul	x,a
3061  00f9 1c0000        	addw	x,#_LCD_Dis_Data
3062  00fc cd0000        	call	_Display_LCD_String
3064  00ff               L1302:
3065                     ; 126 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3067  00ff 0c01          	inc	(OFST+0,sp)
3070  0101 7b01          	ld	a,(OFST+0,sp)
3071  0103 a104          	cp	a,#4
3072  0105 25bf          	jrult	L7102
3073  0107               L5102:
3074                     ; 135 	return;
3077  0107 84            	pop	a
3078  0108 81            	ret
3104                     ; 140 void Model_Select_Routine(void)
3104                     ; 141 {
3105                     	switch	.text
3106  0109               _Model_Select_Routine:
3110                     ; 142 	Model_Select_LCD_Display_Control();
3112  0109 ada2          	call	_Model_Select_LCD_Display_Control
3114                     ; 143 	Model_Select_Switch_Control();	
3116  010b cd008b        	call	_Model_Select_Switch_Control
3118                     ; 145 	return;
3121  010e 81            	ret
3167                     ; 151 void Test_Ctrl_Value_Change(U8 uc_st)
3167                     ; 152 {
3168                     	switch	.text
3169  010f               _Test_Ctrl_Value_Change:
3171  010f 88            	push	a
3172  0110 5204          	subw	sp,#4
3173       00000004      OFST:	set	4
3176                     ; 157 	if(uc_st == 1){	
3178  0112 a101          	cp	a,#1
3179  0114 2703          	jreq	L22
3180  0116 cc0257        	jp	L1602
3181  0119               L22:
3182                     ; 158   		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3184  0119 725d0002      	tnz	_uc_Test_Data_Select_Num
3185  011d 260c          	jrne	L3602
3188  011f c60009        	ld	a,_uc_Heater_Enable_Flag
3189  0122 a801          	xor	a,	#1
3190  0124 c70009        	ld	_uc_Heater_Enable_Flag,a
3192  0127 ac090309      	jpf	L5512
3193  012b               L3602:
3194                     ; 159 		else if(uc_Test_Data_Select_Num == (U8)(1)){			
3196  012b c60002        	ld	a,_uc_Test_Data_Select_Num
3197  012e a101          	cp	a,#1
3198  0130 2703          	jreq	L42
3199  0132 cc0309        	jp	L5512
3200  0135               L42:
3201                     ; 160 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode		
3203  0135 c60000        	ld	a,_uc_Target_Display_Mode
3204  0138 a101          	cp	a,#1
3205  013a 2703          	jreq	L62
3206  013c cc01ff        	jp	L1702
3207  013f               L62:
3208                     ; 161 if (HEATER_zone_status == HTR_ZONE_1)
3210  013f 725d0000      	tnz	_HEATER_zone_status
3211  0143 265d          	jrne	L3702
3212                     ; 163 				if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(20); }
3214  0145 c6000a        	ld	a,_uc_Target_Duty_Perc
3215  0148 a114          	cp	a,#20
3216  014a 2408          	jruge	L5702
3219  014c 3514000a      	mov	_uc_Target_Duty_Perc,#20
3221  0150 ac090309      	jpf	L5512
3222  0154               L5702:
3223                     ; 165 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3225  0154 c60001        	ld	a,_uc_Perc_Unit
3226  0157 5f            	clrw	x
3227  0158 97            	ld	xl,a
3228  0159 1f01          	ldw	(OFST-3,sp),x
3229  015b c6000a        	ld	a,_uc_Target_Duty_Perc
3230  015e 5f            	clrw	x
3231  015f 97            	ld	xl,a
3232  0160 72fb01        	addw	x,(OFST-3,sp)
3233  0163 1f03          	ldw	(OFST-1,sp),x
3234                     ; 167 					if((uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3236  0165 c6000a        	ld	a,_uc_Target_Duty_Perc
3237  0168 a1b4          	cp	a,#180
3238  016a 240f          	jruge	L1012
3240  016c 1e03          	ldw	x,(OFST-1,sp)
3241  016e a300b4        	cpw	x,#180
3242  0171 2508          	jrult	L1012
3245  0173 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3247  0177 ac090309      	jpf	L5512
3248  017b               L1012:
3249                     ; 168 					else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3251  017b c6000a        	ld	a,_uc_Target_Duty_Perc
3252  017e a1b4          	cp	a,#180
3253  0180 2608          	jrne	L5012
3256  0182 35be000a      	mov	_uc_Target_Duty_Perc,#190
3258  0186 ac090309      	jpf	L5512
3259  018a               L5012:
3260                     ; 169 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3262  018a 1e03          	ldw	x,(OFST-1,sp)
3263  018c a300bf        	cpw	x,#191
3264  018f 2508          	jrult	L1112
3267  0191 35be000a      	mov	_uc_Target_Duty_Perc,#190
3269  0195 ac090309      	jpf	L5512
3270  0199               L1112:
3271                     ; 170 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3273  0199 7b04          	ld	a,(OFST+0,sp)
3274  019b c7000a        	ld	_uc_Target_Duty_Perc,a
3275  019e ac090309      	jpf	L5512
3276  01a2               L3702:
3277                     ; 175 				if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(20); }
3279  01a2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3280  01a5 a114          	cp	a,#20
3281  01a7 2408          	jruge	L7112
3284  01a9 3514000b      	mov	_uc_Target_Duty_Perc+1,#20
3286  01ad ac090309      	jpf	L5512
3287  01b1               L7112:
3288                     ; 177 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3290  01b1 c60001        	ld	a,_uc_Perc_Unit
3291  01b4 5f            	clrw	x
3292  01b5 97            	ld	xl,a
3293  01b6 1f01          	ldw	(OFST-3,sp),x
3294  01b8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3295  01bb 5f            	clrw	x
3296  01bc 97            	ld	xl,a
3297  01bd 72fb01        	addw	x,(OFST-3,sp)
3298  01c0 1f03          	ldw	(OFST-1,sp),x
3299                     ; 179 					if((uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3301  01c2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3302  01c5 a1b4          	cp	a,#180
3303  01c7 240f          	jruge	L3212
3305  01c9 1e03          	ldw	x,(OFST-1,sp)
3306  01cb a300b4        	cpw	x,#180
3307  01ce 2508          	jrult	L3212
3310  01d0 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3312  01d4 ac090309      	jpf	L5512
3313  01d8               L3212:
3314                     ; 180 					else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3316  01d8 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3317  01db a1b4          	cp	a,#180
3318  01dd 2608          	jrne	L7212
3321  01df 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3323  01e3 ac090309      	jpf	L5512
3324  01e7               L7212:
3325                     ; 181 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3327  01e7 1e03          	ldw	x,(OFST-1,sp)
3328  01e9 a300bf        	cpw	x,#191
3329  01ec 2508          	jrult	L3312
3332  01ee 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3334  01f2 ac090309      	jpf	L5512
3335  01f6               L3312:
3336                     ; 182 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3338  01f6 7b04          	ld	a,(OFST+0,sp)
3339  01f8 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3340  01fb ac090309      	jpf	L5512
3341  01ff               L1702:
3342                     ; 187 if (HEATER_zone_status == HTR_ZONE_1)
3344  01ff 725d0000      	tnz	_HEATER_zone_status
3345  0203 2629          	jrne	L1412
3346                     ; 189 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3348  0205 c60001        	ld	a,_uc_Perc_Unit
3349  0208 5f            	clrw	x
3350  0209 97            	ld	xl,a
3351  020a 1f01          	ldw	(OFST-3,sp),x
3352  020c c6000a        	ld	a,_uc_Target_Duty_Perc
3353  020f 5f            	clrw	x
3354  0210 97            	ld	xl,a
3355  0211 72fb01        	addw	x,(OFST-3,sp)
3356  0214 1f03          	ldw	(OFST-1,sp),x
3357                     ; 190 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(200); }
3359  0216 1e03          	ldw	x,(OFST-1,sp)
3360  0218 a300c8        	cpw	x,#200
3361  021b 2508          	jrult	L3412
3364  021d 35c8000a      	mov	_uc_Target_Duty_Perc,#200
3366  0221 ac090309      	jpf	L5512
3367  0225               L3412:
3368                     ; 191 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3370  0225 7b04          	ld	a,(OFST+0,sp)
3371  0227 c7000a        	ld	_uc_Target_Duty_Perc,a
3372  022a ac090309      	jpf	L5512
3373  022e               L1412:
3374                     ; 195 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3376  022e c60001        	ld	a,_uc_Perc_Unit
3377  0231 5f            	clrw	x
3378  0232 97            	ld	xl,a
3379  0233 1f01          	ldw	(OFST-3,sp),x
3380  0235 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3381  0238 5f            	clrw	x
3382  0239 97            	ld	xl,a
3383  023a 72fb01        	addw	x,(OFST-3,sp)
3384  023d 1f03          	ldw	(OFST-1,sp),x
3385                     ; 196 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(200); }
3387  023f 1e03          	ldw	x,(OFST-1,sp)
3388  0241 a300c8        	cpw	x,#200
3389  0244 2508          	jrult	L1512
3392  0246 35c8000b      	mov	_uc_Target_Duty_Perc+1,#200
3394  024a ac090309      	jpf	L5512
3395  024e               L1512:
3396                     ; 197 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3398  024e 7b04          	ld	a,(OFST+0,sp)
3399  0250 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3400  0253 ac090309      	jpf	L5512
3401  0257               L1602:
3402                     ; 204 	else if(uc_st == 0){	
3404  0257 0d05          	tnz	(OFST+1,sp)
3405  0259 2703          	jreq	L03
3406  025b cc0309        	jp	L5512
3407  025e               L03:
3408                     ; 205 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3410  025e 725d0002      	tnz	_uc_Test_Data_Select_Num
3411  0262 260c          	jrne	L1612
3414  0264 c60009        	ld	a,_uc_Heater_Enable_Flag
3415  0267 a801          	xor	a,	#1
3416  0269 c70009        	ld	_uc_Heater_Enable_Flag,a
3418  026c ac090309      	jpf	L5512
3419  0270               L1612:
3420                     ; 206 		else if(uc_Test_Data_Select_Num == (U8)(1)){
3422  0270 c60002        	ld	a,_uc_Test_Data_Select_Num
3423  0273 a101          	cp	a,#1
3424  0275 2703          	jreq	L23
3425  0277 cc0309        	jp	L5512
3426  027a               L23:
3427                     ; 207 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode	
3429  027a c60000        	ld	a,_uc_Target_Display_Mode
3430  027d a101          	cp	a,#1
3431  027f 2652          	jrne	L7612
3432                     ; 208 if (HEATER_zone_status == HTR_ZONE_1)
3434  0281 725d0000      	tnz	_HEATER_zone_status
3435  0285 2626          	jrne	L1712
3436                     ; 210 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ 
3438  0287 c6000a        	ld	a,_uc_Target_Duty_Perc
3439  028a c10001        	cp	a,_uc_Perc_Unit
3440  028d 2518          	jrult	L3712
3441                     ; 212 					if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3443  028f c6000a        	ld	a,_uc_Target_Duty_Perc
3444  0292 a1be          	cp	a,#190
3445  0294 2606          	jrne	L5712
3448  0296 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3450  029a 206d          	jra	L5512
3451  029c               L5712:
3452                     ; 213 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3454  029c c6000a        	ld	a,_uc_Target_Duty_Perc
3455  029f c00001        	sub	a,_uc_Perc_Unit
3456  02a2 c7000a        	ld	_uc_Target_Duty_Perc,a
3457  02a5 2062          	jra	L5512
3458  02a7               L3712:
3459                     ; 215 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3461  02a7 725f000a      	clr	_uc_Target_Duty_Perc
3462  02ab 205c          	jra	L5512
3463  02ad               L1712:
3464                     ; 219 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ 
3466  02ad c6000b        	ld	a,_uc_Target_Duty_Perc+1
3467  02b0 c10001        	cp	a,_uc_Perc_Unit
3468  02b3 2518          	jrult	L5022
3469                     ; 221 					if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3471  02b5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3472  02b8 a1be          	cp	a,#190
3473  02ba 2606          	jrne	L7022
3476  02bc 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3478  02c0 2047          	jra	L5512
3479  02c2               L7022:
3480                     ; 222 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3482  02c2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3483  02c5 c00001        	sub	a,_uc_Perc_Unit
3484  02c8 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3485  02cb 203c          	jra	L5512
3486  02cd               L5022:
3487                     ; 224 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3489  02cd 725f000b      	clr	_uc_Target_Duty_Perc+1
3490  02d1 2036          	jra	L5512
3491  02d3               L7612:
3492                     ; 228 if (HEATER_zone_status == HTR_ZONE_1)
3494  02d3 725d0000      	tnz	_HEATER_zone_status
3495  02d7 2619          	jrne	L7122
3496                     ; 230 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3498  02d9 c6000a        	ld	a,_uc_Target_Duty_Perc
3499  02dc c10001        	cp	a,_uc_Perc_Unit
3500  02df 250b          	jrult	L1222
3503  02e1 c6000a        	ld	a,_uc_Target_Duty_Perc
3504  02e4 c00001        	sub	a,_uc_Perc_Unit
3505  02e7 c7000a        	ld	_uc_Target_Duty_Perc,a
3507  02ea 201d          	jra	L5512
3508  02ec               L1222:
3509                     ; 231 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3511  02ec 725f000a      	clr	_uc_Target_Duty_Perc
3512  02f0 2017          	jra	L5512
3513  02f2               L7122:
3514                     ; 235 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3516  02f2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3517  02f5 c10001        	cp	a,_uc_Perc_Unit
3518  02f8 250b          	jrult	L7222
3521  02fa c6000b        	ld	a,_uc_Target_Duty_Perc+1
3522  02fd c00001        	sub	a,_uc_Perc_Unit
3523  0300 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3525  0303 2004          	jra	L5512
3526  0305               L7222:
3527                     ; 236 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3529  0305 725f000b      	clr	_uc_Target_Duty_Perc+1
3530  0309               L5512:
3531                     ; 242 	return ;
3534  0309 5b05          	addw	sp,#5
3535  030b 81            	ret
3569                     ; 247 void Test_Ctrl_Swtich_Control(void)
3569                     ; 248 {
3570                     	switch	.text
3571  030c               _Test_Ctrl_Swtich_Control:
3575                     ; 250 	if(b_UP_Button_Flag== ON){
3577  030c c60000        	ld	a,_uc_Button_Status_Reg
3578  030f a502          	bcp	a,#2
3579  0311 2762          	jreq	L3422
3580                     ; 252 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit < (U8)(130)){ uc_Perc_Unit++;}}
3582  0313 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3583  0316 a510          	bcp	a,#16
3584  0318 270d          	jreq	L5422
3587  031a c60001        	ld	a,_uc_Perc_Unit
3588  031d a182          	cp	a,#130
3589  031f 244e          	jruge	L1522
3592  0321 725c0001      	inc	_uc_Perc_Unit
3593  0325 2048          	jra	L1522
3594  0327               L5422:
3595                     ; 254 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
3597  0327 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3598  032a a504          	bcp	a,#4
3599  032c 2707          	jreq	L3522
3602  032e a601          	ld	a,#1
3603  0330 cd010f        	call	_Test_Ctrl_Value_Change
3606  0333 203a          	jra	L1522
3607  0335               L3522:
3608                     ; 255 			else if(b_Data_Select_flag == ON){
3610  0335 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3611  0338 a502          	bcp	a,#2
3612  033a 2712          	jreq	L7522
3613                     ; 256 				if(uc_Test_Page_Now == (U8)(0)){
3615  033c 725d0004      	tnz	_uc_Test_Page_Now
3616  0340 262d          	jrne	L1522
3617                     ; 257 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3619  0342 725d0002      	tnz	_uc_Test_Data_Select_Num
3620  0346 2727          	jreq	L1522
3623  0348 725a0002      	dec	_uc_Test_Data_Select_Num
3624  034c 2021          	jra	L1522
3625  034e               L7522:
3626                     ; 260 				if(uc_Test_Page_Now > 0){
3628  034e 725d0004      	tnz	_uc_Test_Page_Now
3629  0352 271b          	jreq	L1522
3630                     ; 261 					uc_Test_Page_Now--;
3632  0354 725a0004      	dec	_uc_Test_Page_Now
3633                     ; 262 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3635  0358 725d0004      	tnz	_uc_Test_Page_Now
3636  035c 2606          	jrne	L1722
3639  035e 725f0002      	clr	_uc_Test_Data_Select_Num
3641  0362 200b          	jra	L1522
3642  0364               L1722:
3643                     ; 263 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3645  0364 c60004        	ld	a,_uc_Test_Page_Now
3646  0367 a101          	cp	a,#1
3647  0369 2604          	jrne	L1522
3650  036b 35040002      	mov	_uc_Test_Data_Select_Num,#4
3651  036f               L1522:
3652                     ; 267 		b_UP_Button_Flag = OFF;
3654  036f 72130000      	bres	_uc_Button_Status_Reg,#1
3656  0373 2067          	jra	L7722
3657  0375               L3422:
3658                     ; 271 	else if(b_DOWN_Button_Flag== ON){ 
3660  0375 c60000        	ld	a,_uc_Button_Status_Reg
3661  0378 a504          	bcp	a,#4
3662  037a 2760          	jreq	L7722
3663                     ; 273 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit > (U8)(1)){ uc_Perc_Unit--;}}
3665  037c c6000d        	ld	a,_uc_Test_Ctrl_Reg
3666  037f a510          	bcp	a,#16
3667  0381 270d          	jreq	L3032
3670  0383 c60001        	ld	a,_uc_Perc_Unit
3671  0386 a102          	cp	a,#2
3672  0388 254e          	jrult	L7032
3675  038a 725a0001      	dec	_uc_Perc_Unit
3676  038e 2048          	jra	L7032
3677  0390               L3032:
3678                     ; 276 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
3680  0390 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3681  0393 a504          	bcp	a,#4
3682  0395 2706          	jreq	L1132
3685  0397 4f            	clr	a
3686  0398 cd010f        	call	_Test_Ctrl_Value_Change
3689  039b 203b          	jra	L7032
3690  039d               L1132:
3691                     ; 278 			else if(b_Data_Select_flag == ON){
3693  039d c6000d        	ld	a,_uc_Test_Ctrl_Reg
3694  03a0 a502          	bcp	a,#2
3695  03a2 2712          	jreq	L5132
3696                     ; 279 				if(uc_Test_Page_Now == (U8)(0)){
3698  03a4 725d0004      	tnz	_uc_Test_Page_Now
3699  03a8 262e          	jrne	L7032
3700                     ; 280 					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
3702  03aa 725d0002      	tnz	_uc_Test_Data_Select_Num
3703  03ae 2628          	jrne	L7032
3706  03b0 725c0002      	inc	_uc_Test_Data_Select_Num
3707  03b4 2022          	jra	L7032
3708  03b6               L5132:
3709                     ; 283 				if(uc_Test_Page_Now < 4){
3711  03b6 c60004        	ld	a,_uc_Test_Page_Now
3712  03b9 a104          	cp	a,#4
3713  03bb 241b          	jruge	L7032
3714                     ; 284 					uc_Test_Page_Now++;
3716  03bd 725c0004      	inc	_uc_Test_Page_Now
3717                     ; 286 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3719  03c1 725d0004      	tnz	_uc_Test_Page_Now
3720  03c5 2606          	jrne	L7232
3723  03c7 725f0002      	clr	_uc_Test_Data_Select_Num
3725  03cb 200b          	jra	L7032
3726  03cd               L7232:
3727                     ; 287 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3729  03cd c60004        	ld	a,_uc_Test_Page_Now
3730  03d0 a101          	cp	a,#1
3731  03d2 2604          	jrne	L7032
3734  03d4 35040002      	mov	_uc_Test_Data_Select_Num,#4
3735  03d8               L7032:
3736                     ; 291 		b_DOWN_Button_Flag = OFF;
3738  03d8 72150000      	bres	_uc_Button_Status_Reg,#2
3739  03dc               L7722:
3740                     ; 295 	if(b_SET_Button_Flag== ON){
3742  03dc c60000        	ld	a,_uc_Button_Status_Reg
3743  03df a508          	bcp	a,#8
3744  03e1 2746          	jreq	L5332
3745                     ; 296 		if(b_Test_Option_flag){ uc_Target_Display_Mode ^= ON; uc_Test_Page_Pre = (U8)(10);}
3747  03e3 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3748  03e6 a510          	bcp	a,#16
3749  03e8 270e          	jreq	L7332
3752  03ea c60000        	ld	a,_uc_Target_Display_Mode
3753  03ed a801          	xor	a,	#1
3754  03ef c70000        	ld	_uc_Target_Display_Mode,a
3757  03f2 350a0003      	mov	_uc_Test_Page_Pre,#10
3759  03f6 202d          	jra	L1432
3760  03f8               L7332:
3761                     ; 297 		else if(uc_Test_Page_Now < 2){
3763  03f8 c60004        	ld	a,_uc_Test_Page_Now
3764  03fb a102          	cp	a,#2
3765  03fd 2426          	jruge	L1432
3766                     ; 299 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
3768  03ff c6000d        	ld	a,_uc_Test_Ctrl_Reg
3769  0402 a502          	bcp	a,#2
3770  0404 2606          	jrne	L5432
3773  0406 7212000d      	bset	_uc_Test_Ctrl_Reg,#1
3775  040a 2015          	jra	L7432
3776  040c               L5432:
3777                     ; 301 				if(b_Data_Setting_flag == OFF){
3779  040c c6000d        	ld	a,_uc_Test_Ctrl_Reg
3780  040f a504          	bcp	a,#4
3781  0411 2606          	jrne	L1532
3782                     ; 302 					b_Data_Setting_flag = ON;
3784  0413 7214000d      	bset	_uc_Test_Ctrl_Reg,#2
3786  0417 2008          	jra	L7432
3787  0419               L1532:
3788                     ; 304 					b_Data_Setting_flag = OFF;
3790  0419 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
3791                     ; 305 					b_Data_Select_flag = OFF;
3793  041d 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
3794  0421               L7432:
3795                     ; 308 			b_SET_Button_Flag = OFF;
3797  0421 72170000      	bres	_uc_Button_Status_Reg,#3
3798  0425               L1432:
3799                     ; 311 		b_SET_Button_Flag = OFF;
3801  0425 72170000      	bres	_uc_Button_Status_Reg,#3
3802  0429               L5332:
3803                     ; 315 	if(b_ONOFF_Button_Flag== ON){
3805  0429 c60000        	ld	a,_uc_Button_Status_Reg
3806  042c a501          	bcp	a,#1
3807  042e 2704          	jreq	L5532
3808                     ; 320 		b_ONOFF_Button_Flag = OFF;
3810  0430 72110000      	bres	_uc_Button_Status_Reg,#0
3811  0434               L5532:
3812                     ; 324 	if(b_OPTION_Button_Flag == ON){
3814  0434 c60000        	ld	a,_uc_Button_Status_Reg
3815  0437 a510          	bcp	a,#16
3816  0439 2715          	jreq	L7532
3817                     ; 326 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
3819  043b c6000d        	ld	a,_uc_Test_Ctrl_Reg
3820  043e a510          	bcp	a,#16
3821  0440 2606          	jrne	L1632
3824  0442 7218000d      	bset	_uc_Test_Ctrl_Reg,#4
3826  0446 2004          	jra	L3632
3827  0448               L1632:
3828                     ; 327 		else{b_Test_Option_flag = OFF; }
3830  0448 7219000d      	bres	_uc_Test_Ctrl_Reg,#4
3831  044c               L3632:
3832                     ; 329 		b_OPTION_Button_Flag = OFF;
3834  044c 72190000      	bres	_uc_Button_Status_Reg,#4
3835  0450               L7532:
3836                     ; 334 	if(b_ENTER_Button_Flag == ON){
3838  0450 c60000        	ld	a,_uc_Button_Status_Reg
3839  0453 a520          	bcp	a,#32
3840  0455 2721          	jreq	L5632
3841                     ; 335 		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
3843  0457 c60000        	ld	a,_uc_System_Ctrl_Reg
3844  045a a501          	bcp	a,#1
3845  045c 2606          	jrne	L7632
3848  045e 72100000      	bset	_uc_System_Ctrl_Reg,#0
3850  0462 2010          	jra	L1732
3851  0464               L7632:
3852                     ; 341 if (HEATER_zone_status != HTR_ZONE_1)
3854  0464 725d0000      	tnz	_HEATER_zone_status
3855  0468 2706          	jreq	L3732
3856                     ; 342 HEATER_zone_status = HTR_ZONE_1;
3858  046a 725f0000      	clr	_HEATER_zone_status
3860  046e 2004          	jra	L1732
3861  0470               L3732:
3862                     ; 343 else HEATER_zone_status=HTR_ZONE_2;
3864  0470 35010000      	mov	_HEATER_zone_status,#1
3865  0474               L1732:
3866                     ; 346 		b_ENTER_Button_Flag = OFF;
3868  0474 721b0000      	bres	_uc_Button_Status_Reg,#5
3869  0478               L5632:
3870                     ; 349 	return;
3873  0478 81            	ret
3901                     ; 354 void Test_Ctrl_Text_Display_Handling(void)
3901                     ; 355 {
3902                     	switch	.text
3903  0479               _Test_Ctrl_Text_Display_Handling:
3907                     ; 356 	switch(uc_Test_Page_Now){
3909  0479 c60004        	ld	a,_uc_Test_Page_Now
3911                     ; 379 				break;
3912  047c 4d            	tnz	a
3913  047d 2731          	jreq	L7732
3914  047f 4a            	dec	a
3915  0480 276f          	jreq	L1042
3916  0482               L3042:
3917                     ; 373 		default:
3917                     ; 374 				strcpy(LCD_Dis_Data[0],"");	// Null
3919  0482 ae0179        	ldw	x,#L5571
3920  0485 89            	pushw	x
3921  0486 ae0000        	ldw	x,#_LCD_Dis_Data
3922  0489 cd0000        	call	_strcpy
3924  048c 85            	popw	x
3925                     ; 375 				strcpy(LCD_Dis_Data[1],"");	// Null
3927  048d ae0179        	ldw	x,#L5571
3928  0490 89            	pushw	x
3929  0491 ae0010        	ldw	x,#_LCD_Dis_Data+16
3930  0494 cd0000        	call	_strcpy
3932  0497 85            	popw	x
3933                     ; 376 				strcpy(LCD_Dis_Data[2],"");	// Null
3935  0498 ae0179        	ldw	x,#L5571
3936  049b 89            	pushw	x
3937  049c ae0020        	ldw	x,#_LCD_Dis_Data+32
3938  049f cd0000        	call	_strcpy
3940  04a2 85            	popw	x
3941                     ; 377 				strcpy(LCD_Dis_Data[3],"");	// Null
3943  04a3 ae0179        	ldw	x,#L5571
3944  04a6 89            	pushw	x
3945  04a7 ae0030        	ldw	x,#_LCD_Dis_Data+48
3946  04aa cd0000        	call	_strcpy
3948  04ad 85            	popw	x
3949                     ; 379 				break;
3951  04ae 206d          	jra	L7142
3952  04b0               L7732:
3953                     ; 359 		case 0:	strcpy(LCD_Dis_Data[0],"Al:     /");		// PTC_Allowance: / Status 
3955  04b0 ae016f        	ldw	x,#L1242
3956  04b3 89            	pushw	x
3957  04b4 ae0000        	ldw	x,#_LCD_Dis_Data
3958  04b7 cd0000        	call	_strcpy
3960  04ba 85            	popw	x
3961                     ; 360 				if(!uc_Target_Display_Mode){ strcpy(LCD_Dis_Data[1],"Td:     Fd:"); }	// Target Duty:   / Feedback Duty:
3963  04bb 725d0000      	tnz	_uc_Target_Display_Mode
3964  04bf 260d          	jrne	L3242
3967  04c1 ae0163        	ldw	x,#L5242
3968  04c4 89            	pushw	x
3969  04c5 ae0010        	ldw	x,#_LCD_Dis_Data+16
3970  04c8 cd0000        	call	_strcpy
3972  04cb 85            	popw	x
3974  04cc 200b          	jra	L7242
3975  04ce               L3242:
3976                     ; 361 				else{ strcpy(LCD_Dis_Data[1],"Tp:     Fd:"); }	// Target Duty:   / Feedback Duty:
3978  04ce ae0157        	ldw	x,#L1342
3979  04d1 89            	pushw	x
3980  04d2 ae0010        	ldw	x,#_LCD_Dis_Data+16
3981  04d5 cd0000        	call	_strcpy
3983  04d8 85            	popw	x
3984  04d9               L7242:
3985                     ; 362 				strcpy(LCD_Dis_Data[2],"R:  F:  HV:");	// Ready: / Fault: / HV:
3987  04d9 ae014b        	ldw	x,#L3342
3988  04dc 89            	pushw	x
3989  04dd ae0020        	ldw	x,#_LCD_Dis_Data+32
3990  04e0 cd0000        	call	_strcpy
3992  04e3 85            	popw	x
3993                     ; 363 				strcpy(LCD_Dis_Data[3],"Cr:     Pw:");	// Current:  / Power:
3995  04e4 ae013f        	ldw	x,#L5342
3996  04e7 89            	pushw	x
3997  04e8 ae0030        	ldw	x,#_LCD_Dis_Data+48
3998  04eb cd0000        	call	_strcpy
4000  04ee 85            	popw	x
4001                     ; 364 				break;
4003  04ef 202c          	jra	L7142
4004  04f1               L1042:
4005                     ; 367 		case 1:	strcpy(LCD_Dis_Data[0],"Ct:");			// Core Temp:
4007  04f1 ae013b        	ldw	x,#L7342
4008  04f4 89            	pushw	x
4009  04f5 ae0000        	ldw	x,#_LCD_Dis_Data
4010  04f8 cd0000        	call	_strcpy
4012  04fb 85            	popw	x
4013                     ; 368 				strcpy(LCD_Dis_Data[1],"Ver:");		// Software_Version:
4015  04fc ae0136        	ldw	x,#L1442
4016  04ff 89            	pushw	x
4017  0500 ae0010        	ldw	x,#_LCD_Dis_Data+16
4018  0503 cd0000        	call	_strcpy
4020  0506 85            	popw	x
4021                     ; 369 				strcpy(LCD_Dis_Data[2],"");	// Core Temp:
4023  0507 ae0179        	ldw	x,#L5571
4024  050a 89            	pushw	x
4025  050b ae0020        	ldw	x,#_LCD_Dis_Data+32
4026  050e cd0000        	call	_strcpy
4028  0511 85            	popw	x
4029                     ; 370 				strcpy(LCD_Dis_Data[3],"");	// Core Temp
4031  0512 ae0179        	ldw	x,#L5571
4032  0515 89            	pushw	x
4033  0516 ae0030        	ldw	x,#_LCD_Dis_Data+48
4034  0519 cd0000        	call	_strcpy
4036  051c 85            	popw	x
4037                     ; 371 				break;
4039  051d               L7142:
4040                     ; 382 	return;
4043  051d 81            	ret
4135                     .const:	section	.text
4136  0000               L25:
4137  0000 000003e8      	dc.l	1000
4138                     ; 387 static void MV_Ctrl_LCD_Display_Control(void)
4138                     ; 388 {
4139                     	switch	.text
4140  051e               L3442_MV_Ctrl_LCD_Display_Control:
4142  051e 5216          	subw	sp,#22
4143       00000016      OFST:	set	22
4146                     ; 395 if (HEATER_zone_status==HTR_ZONE_1)
4148  0520 725d0000      	tnz	_HEATER_zone_status
4149  0524 263a          	jrne	L7742
4150                     ; 397 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4152  0526 0f15          	clr	(OFST-1,sp)
4153  0528               L1052:
4154                     ; 399 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS1][uc_buffer];
4156  0528 96            	ldw	x,sp
4157  0529 1c000d        	addw	x,#OFST-9
4158  052c 9f            	ld	a,xl
4159  052d 5e            	swapw	x
4160  052e 1b15          	add	a,(OFST-1,sp)
4161  0530 2401          	jrnc	L24
4162  0532 5c            	incw	x
4163  0533               L24:
4164  0533 02            	rlwa	x,a
4165  0534 7b15          	ld	a,(OFST-1,sp)
4166  0536 905f          	clrw	y
4167  0538 9097          	ld	yl,a
4168  053a 90d60000      	ld	a,(_uc_Rx_Data,y)
4169  053e f7            	ld	(x),a
4170                     ; 400 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
4172  053f 96            	ldw	x,sp
4173  0540 1c0003        	addw	x,#OFST-19
4174  0543 9f            	ld	a,xl
4175  0544 5e            	swapw	x
4176  0545 1b15          	add	a,(OFST-1,sp)
4177  0547 2401          	jrnc	L44
4178  0549 5c            	incw	x
4179  054a               L44:
4180  054a 02            	rlwa	x,a
4181  054b 7b15          	ld	a,(OFST-1,sp)
4182  054d 905f          	clrw	y
4183  054f 9097          	ld	yl,a
4184  0551 90d60008      	ld	a,(_uc_Rx_Data+8,y)
4185  0555 f7            	ld	(x),a
4186                     ; 397 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4188  0556 0c15          	inc	(OFST-1,sp)
4191  0558 7b15          	ld	a,(OFST-1,sp)
4192  055a a108          	cp	a,#8
4193  055c 25ca          	jrult	L1052
4195  055e 2038          	jra	L7052
4196  0560               L7742:
4197                     ; 405 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4199  0560 0f15          	clr	(OFST-1,sp)
4200  0562               L1152:
4201                     ; 407 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
4203  0562 96            	ldw	x,sp
4204  0563 1c000d        	addw	x,#OFST-9
4205  0566 9f            	ld	a,xl
4206  0567 5e            	swapw	x
4207  0568 1b15          	add	a,(OFST-1,sp)
4208  056a 2401          	jrnc	L64
4209  056c 5c            	incw	x
4210  056d               L64:
4211  056d 02            	rlwa	x,a
4212  056e 7b15          	ld	a,(OFST-1,sp)
4213  0570 905f          	clrw	y
4214  0572 9097          	ld	yl,a
4215  0574 90d60010      	ld	a,(_uc_Rx_Data+16,y)
4216  0578 f7            	ld	(x),a
4217                     ; 408 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
4219  0579 96            	ldw	x,sp
4220  057a 1c0003        	addw	x,#OFST-19
4221  057d 9f            	ld	a,xl
4222  057e 5e            	swapw	x
4223  057f 1b15          	add	a,(OFST-1,sp)
4224  0581 2401          	jrnc	L05
4225  0583 5c            	incw	x
4226  0584               L05:
4227  0584 02            	rlwa	x,a
4228  0585 7b15          	ld	a,(OFST-1,sp)
4229  0587 905f          	clrw	y
4230  0589 9097          	ld	yl,a
4231  058b 90d60018      	ld	a,(_uc_Rx_Data+24,y)
4232  058f f7            	ld	(x),a
4233                     ; 405 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4235  0590 0c15          	inc	(OFST-1,sp)
4238  0592 7b15          	ld	a,(OFST-1,sp)
4239  0594 a108          	cp	a,#8
4240  0596 25ca          	jrult	L1152
4241  0598               L7052:
4242                     ; 411 	if(b_Test_Option_flag == ON){
4244  0598 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4245  059b a510          	bcp	a,#16
4246  059d 2779          	jreq	L7152
4247                     ; 412 		Set_LCD_Address(LCD_Line[0]);
4249  059f c60000        	ld	a,_LCD_Line
4250  05a2 cd0000        	call	_Set_LCD_Address
4252                     ; 413 		Display_LCD_String("*OPTION*");
4254  05a5 ae012d        	ldw	x,#L1252
4255  05a8 cd0000        	call	_Display_LCD_String
4257                     ; 415 		if(uc_Target_Display_Mode == (U8)(0)){
4259  05ab 725d0000      	tnz	_uc_Target_Display_Mode
4260  05af 260e          	jrne	L3252
4261                     ; 416 			Set_LCD_Address(LCD_Line[1]);
4263  05b1 c60001        	ld	a,_LCD_Line+1
4264  05b4 cd0000        	call	_Set_LCD_Address
4266                     ; 417 			Display_LCD_String("*Target Perc");
4268  05b7 ae0120        	ldw	x,#L5252
4269  05ba cd0000        	call	_Display_LCD_String
4272  05bd 200c          	jra	L7252
4273  05bf               L3252:
4274                     ; 420 			Set_LCD_Address(LCD_Line[1]);
4276  05bf c60001        	ld	a,_LCD_Line+1
4277  05c2 cd0000        	call	_Set_LCD_Address
4279                     ; 421 			Display_LCD_String("*Target Watt(OS)");
4281  05c5 ae010f        	ldw	x,#L1352
4282  05c8 cd0000        	call	_Display_LCD_String
4284  05cb               L7252:
4285                     ; 424 		Set_LCD_Address(LCD_Line[2]);
4287  05cb c60002        	ld	a,_LCD_Line+2
4288  05ce cd0000        	call	_Set_LCD_Address
4290                     ; 425 		Display_LCD_String("D_Unit:");
4292  05d1 ae0107        	ldw	x,#L3352
4293  05d4 cd0000        	call	_Display_LCD_String
4295                     ; 427 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4297  05d7 c60002        	ld	a,_LCD_Line+2
4298  05da ab07          	add	a,#7
4299  05dc cd0000        	call	_Set_LCD_Address
4301                     ; 428 		if(b_Blink_250_Flag){
4303  05df c60000        	ld	a,_uc_LCD_Blink_Reg
4304  05e2 a502          	bcp	a,#2
4305  05e4 272e          	jreq	L5352
4306                     ; 429 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
4308  05e6 c60001        	ld	a,_uc_Perc_Unit
4309  05e9 44            	srl	a
4310  05ea 5f            	clrw	x
4311  05eb 97            	ld	xl,a
4312  05ec cd0000        	call	_Num_Display_LCD
4314                     ; 430 			Display_LCD_String(".");
4316  05ef ae0105        	ldw	x,#L7352
4317  05f2 cd0000        	call	_Display_LCD_String
4319                     ; 431 			uc_buffer = uc_Perc_Unit %(U8)(2);
4321  05f5 c60001        	ld	a,_uc_Perc_Unit
4322  05f8 a401          	and	a,#1
4323  05fa 6b15          	ld	(OFST-1,sp),a
4324                     ; 432 			if(uc_buffer){ Display_LCD_String("5"); }
4326  05fc 0d15          	tnz	(OFST-1,sp)
4327  05fe 2708          	jreq	L1452
4330  0600 ae0103        	ldw	x,#L3452
4331  0603 cd0000        	call	_Display_LCD_String
4334  0606 2006          	jra	L5452
4335  0608               L1452:
4336                     ; 433 			else{ Display_LCD_String("0"); }
4338  0608 ae0101        	ldw	x,#L7452
4339  060b cd0000        	call	_Display_LCD_String
4341  060e               L5452:
4342                     ; 434 			Display_LCD_String("%");
4344  060e ae00ff        	ldw	x,#L1552
4345  0611 cd0000        	call	_Display_LCD_String
4347  0614               L5352:
4348                     ; 436 		return;
4350  0614 ac8c108c      	jpf	L65
4351  0618               L7152:
4352                     ; 439 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
4354  0618 c60004        	ld	a,_uc_Test_Page_Now
4355  061b c10003        	cp	a,_uc_Test_Page_Pre
4356  061e 270f          	jreq	L3552
4357                     ; 440 		Test_Ctrl_Text_Display_Handling(); 
4359  0620 cd0479        	call	_Test_Ctrl_Text_Display_Handling
4361                     ; 441 		b_Data_Select_flag = OFF;
4363  0623 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
4364                     ; 442 		b_Data_Setting_flag = OFF;
4366  0627 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
4367                     ; 443 		uc_Test_Data_Select_Num = (U8)(0);
4369  062b 725f0002      	clr	_uc_Test_Data_Select_Num
4370  062f               L3552:
4371                     ; 445 	uc_Test_Page_Pre = uc_Test_Page_Now ;
4373  062f 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
4374                     ; 448 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
4376  0634 725d0004      	tnz	_uc_Test_Page_Now
4377  0638 2703          	jreq	L06
4378  063a cc0bae        	jp	L5552
4379  063d               L06:
4380                     ; 449 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4382  063d 0f16          	clr	(OFST+0,sp)
4383  063f               L7552:
4384                     ; 451 			Set_LCD_Address(LCD_Line[uc_line_index]);
4386  063f 7b16          	ld	a,(OFST+0,sp)
4387  0641 5f            	clrw	x
4388  0642 97            	ld	xl,a
4389  0643 d60000        	ld	a,(_LCD_Line,x)
4390  0646 cd0000        	call	_Set_LCD_Address
4392                     ; 453 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
4394  0649 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4395  064c a502          	bcp	a,#2
4396  064e 2763          	jreq	L5652
4398  0650 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4399  0653 a504          	bcp	a,#4
4400  0655 265c          	jrne	L5652
4401                     ; 454 				if(uc_line_index == uc_Test_Data_Select_Num){ 
4403  0657 7b16          	ld	a,(OFST+0,sp)
4404  0659 c10002        	cp	a,_uc_Test_Data_Select_Num
4405  065c 2647          	jrne	L7652
4406                     ; 455 					if(uc_Test_Data_Select_Num == (U8)(0)){
4408  065e 725d0002      	tnz	_uc_Test_Data_Select_Num
4409  0662 261d          	jrne	L1752
4410                     ; 456 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4412  0664 c60000        	ld	a,_uc_LCD_Blink_Reg
4413  0667 a502          	bcp	a,#2
4414  0669 270e          	jreq	L3752
4417  066b 7b16          	ld	a,(OFST+0,sp)
4418  066d 97            	ld	xl,a
4419  066e a610          	ld	a,#16
4420  0670 42            	mul	x,a
4421  0671 1c0000        	addw	x,#_LCD_Dis_Data
4422  0674 cd0000        	call	_Display_LCD_String
4425  0677 2046          	jra	L5162
4426  0679               L3752:
4427                     ; 457 						else{ Display_LCD_String("        /"); }
4429  0679 ae00f5        	ldw	x,#L7752
4430  067c cd0000        	call	_Display_LCD_String
4432  067f 203e          	jra	L5162
4433  0681               L1752:
4434                     ; 459 					else if(uc_Test_Data_Select_Num == (U8)(1)){
4436  0681 c60002        	ld	a,_uc_Test_Data_Select_Num
4437  0684 a101          	cp	a,#1
4438  0686 2637          	jrne	L5162
4439                     ; 460 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4441  0688 c60000        	ld	a,_uc_LCD_Blink_Reg
4442  068b a502          	bcp	a,#2
4443  068d 270e          	jreq	L5062
4446  068f 7b16          	ld	a,(OFST+0,sp)
4447  0691 97            	ld	xl,a
4448  0692 a610          	ld	a,#16
4449  0694 42            	mul	x,a
4450  0695 1c0000        	addw	x,#_LCD_Dis_Data
4451  0698 cd0000        	call	_Display_LCD_String
4454  069b 2022          	jra	L5162
4455  069d               L5062:
4456                     ; 461 						else{ Display_LCD_String("        Fd:"); }
4458  069d ae00e9        	ldw	x,#L1162
4459  06a0 cd0000        	call	_Display_LCD_String
4461  06a3 201a          	jra	L5162
4462  06a5               L7652:
4463                     ; 464 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
4465  06a5 7b16          	ld	a,(OFST+0,sp)
4466  06a7 97            	ld	xl,a
4467  06a8 a610          	ld	a,#16
4468  06aa 42            	mul	x,a
4469  06ab 1c0000        	addw	x,#_LCD_Dis_Data
4470  06ae cd0000        	call	_Display_LCD_String
4472  06b1 200c          	jra	L5162
4473  06b3               L5652:
4474                     ; 465 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
4476  06b3 7b16          	ld	a,(OFST+0,sp)
4477  06b5 97            	ld	xl,a
4478  06b6 a610          	ld	a,#16
4479  06b8 42            	mul	x,a
4480  06b9 1c0000        	addw	x,#_LCD_Dis_Data
4481  06bc cd0000        	call	_Display_LCD_String
4483  06bf               L5162:
4484                     ; 468 			if(uc_line_index == (U8)(0)){		// LINE 1
4486  06bf 0d16          	tnz	(OFST+0,sp)
4487  06c1 2703          	jreq	L26
4488  06c3 cc077e        	jp	L7162
4489  06c6               L26:
4490                     ; 471 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4492  06c6 7b16          	ld	a,(OFST+0,sp)
4493  06c8 5f            	clrw	x
4494  06c9 97            	ld	xl,a
4495  06ca d60000        	ld	a,(_LCD_Line,x)
4496  06cd ab03          	add	a,#3
4497  06cf cd0000        	call	_Set_LCD_Address
4499                     ; 473 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4501  06d2 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4502  06d5 a504          	bcp	a,#4
4503  06d7 2718          	jreq	L1262
4505  06d9 7b16          	ld	a,(OFST+0,sp)
4506  06db c10002        	cp	a,_uc_Test_Data_Select_Num
4507  06de 2611          	jrne	L1262
4508                     ; 474 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
4510  06e0 c60000        	ld	a,_uc_LCD_Blink_Reg
4511  06e3 a502          	bcp	a,#2
4512  06e5 2712          	jreq	L5262
4515  06e7 c60009        	ld	a,_uc_Heater_Enable_Flag
4516  06ea 5f            	clrw	x
4517  06eb 97            	ld	xl,a
4518  06ec cd0000        	call	_Num_Display_LCD
4520  06ef 2008          	jra	L5262
4521  06f1               L1262:
4522                     ; 475 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
4524  06f1 c60009        	ld	a,_uc_Heater_Enable_Flag
4525  06f4 5f            	clrw	x
4526  06f5 97            	ld	xl,a
4527  06f6 cd0000        	call	_Num_Display_LCD
4529  06f9               L5262:
4530                     ; 479 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
4532  06f9 7b16          	ld	a,(OFST+0,sp)
4533  06fb 5f            	clrw	x
4534  06fc 97            	ld	xl,a
4535  06fd d60000        	ld	a,(_LCD_Line,x)
4536  0700 ab05          	add	a,#5
4537  0702 cd0000        	call	_Set_LCD_Address
4539                     ; 480 				if (HEATER_zone_status == HTR_ZONE_1)
4541  0705 725d0000      	tnz	_HEATER_zone_status
4542  0709 2608          	jrne	L7262
4543                     ; 481 				Display_LCD_String("Z1");
4545  070b ae00e6        	ldw	x,#L1362
4546  070e cd0000        	call	_Display_LCD_String
4549  0711 2006          	jra	L3362
4550  0713               L7262:
4551                     ; 482 				else Display_LCD_String("Z2");
4553  0713 ae00e3        	ldw	x,#L5362
4554  0716 cd0000        	call	_Display_LCD_String
4556  0719               L3362:
4557                     ; 484 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
4559  0719 7b16          	ld	a,(OFST+0,sp)
4560  071b 5f            	clrw	x
4561  071c 97            	ld	xl,a
4562  071d d60000        	ld	a,(_LCD_Line,x)
4563  0720 ab09          	add	a,#9
4564  0722 cd0000        	call	_Set_LCD_Address
4566                     ; 486 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
4568  0725 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
4569  0728 a501          	bcp	a,#1
4570  072a 270a          	jreq	L7362
4573  072c ae00e0        	ldw	x,#L1462
4574  072f cd0000        	call	_Display_LCD_String
4577  0732 ac9f0b9f      	jpf	L3762
4578  0736               L7362:
4579                     ; 489 					uc_buffer = (U8)((can_data[0] & 0x06) >> 1);//YJS
4581  0736 7b0d          	ld	a,(OFST-9,sp)
4582  0738 a406          	and	a,#6
4583  073a 44            	srl	a
4584  073b 6b15          	ld	(OFST-1,sp),a
4585                     ; 490 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
4587  073d 0d15          	tnz	(OFST-1,sp)
4588  073f 260a          	jrne	L5462
4591  0741 ae00db        	ldw	x,#L7462
4592  0744 cd0000        	call	_Display_LCD_String
4595  0747 ac9f0b9f      	jpf	L3762
4596  074b               L5462:
4597                     ; 491 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
4599  074b 7b15          	ld	a,(OFST-1,sp)
4600  074d a101          	cp	a,#1
4601  074f 260a          	jrne	L3562
4604  0751 ae00d6        	ldw	x,#L5562
4605  0754 cd0000        	call	_Display_LCD_String
4608  0757 ac9f0b9f      	jpf	L3762
4609  075b               L3562:
4610                     ; 492 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
4612  075b 7b15          	ld	a,(OFST-1,sp)
4613  075d a102          	cp	a,#2
4614  075f 260a          	jrne	L1662
4617  0761 ae00d2        	ldw	x,#L3662
4618  0764 cd0000        	call	_Display_LCD_String
4621  0767 ac9f0b9f      	jpf	L3762
4622  076b               L1662:
4623                     ; 493 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
4625  076b 7b15          	ld	a,(OFST-1,sp)
4626  076d a103          	cp	a,#3
4627  076f 2703          	jreq	L46
4628  0771 cc0b9f        	jp	L3762
4629  0774               L46:
4632  0774 ae00cd        	ldw	x,#L1762
4633  0777 cd0000        	call	_Display_LCD_String
4635  077a ac9f0b9f      	jpf	L3762
4636  077e               L7162:
4637                     ; 502 			else if(uc_line_index == (U8)(1)){	// LINE 2
4639  077e 7b16          	ld	a,(OFST+0,sp)
4640  0780 a101          	cp	a,#1
4641  0782 2703          	jreq	L66
4642  0784 cc0a93        	jp	L5762
4643  0787               L66:
4644                     ; 505 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4646  0787 7b16          	ld	a,(OFST+0,sp)
4647  0789 5f            	clrw	x
4648  078a 97            	ld	xl,a
4649  078b d60000        	ld	a,(_LCD_Line,x)
4650  078e ab03          	add	a,#3
4651  0790 cd0000        	call	_Set_LCD_Address
4653                     ; 506 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4655  0793 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4656  0796 a504          	bcp	a,#4
4657  0798 2603          	jrne	L07
4658  079a cc0901        	jp	L7762
4659  079d               L07:
4661  079d 7b16          	ld	a,(OFST+0,sp)
4662  079f c10002        	cp	a,_uc_Test_Data_Select_Num
4663  07a2 2703          	jreq	L27
4664  07a4 cc0901        	jp	L7762
4665  07a7               L27:
4666                     ; 507 					if(b_Blink_250_Flag){
4668  07a7 c60000        	ld	a,_uc_LCD_Blink_Reg
4669  07aa a502          	bcp	a,#2
4670  07ac 2603          	jrne	L47
4671  07ae cc0a41        	jp	L5772
4672  07b1               L47:
4673                     ; 508 						if(!uc_Target_Display_Mode){	// Percentage_Display
4675  07b1 725d0000      	tnz	_uc_Target_Display_Mode
4676  07b5 2676          	jrne	L3072
4677                     ; 509 if (HEATER_zone_status == HTR_ZONE_1)
4679  07b7 725d0000      	tnz	_HEATER_zone_status
4680  07bb 2638          	jrne	L5072
4681                     ; 511 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
4683  07bd c6000a        	ld	a,_uc_Target_Duty_Perc
4684  07c0 44            	srl	a
4685  07c1 5f            	clrw	x
4686  07c2 97            	ld	xl,a
4687  07c3 cd0000        	call	_Num_Display_LCD
4689                     ; 512 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
4691  07c6 c6000a        	ld	a,_uc_Target_Duty_Perc
4692  07c9 a1c8          	cp	a,#200
4693  07cb 2503          	jrult	L67
4694  07cd cc0a41        	jp	L5772
4695  07d0               L67:
4696                     ; 513 								Display_LCD_String(".");
4698  07d0 ae0105        	ldw	x,#L7352
4699  07d3 cd0000        	call	_Display_LCD_String
4701                     ; 514 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
4703  07d6 c6000a        	ld	a,_uc_Target_Duty_Perc
4704  07d9 a401          	and	a,#1
4705  07db 6b15          	ld	(OFST-1,sp),a
4706                     ; 515 								if(uc_buffer){ Display_LCD_String("5"); }
4708  07dd 0d15          	tnz	(OFST-1,sp)
4709  07df 270a          	jreq	L1172
4712  07e1 ae0103        	ldw	x,#L3452
4713  07e4 cd0000        	call	_Display_LCD_String
4716  07e7 ac410a41      	jpf	L5772
4717  07eb               L1172:
4718                     ; 516 								else{ Display_LCD_String("0"); }
4720  07eb ae0101        	ldw	x,#L7452
4721  07ee cd0000        	call	_Display_LCD_String
4723  07f1 ac410a41      	jpf	L5772
4724  07f5               L5072:
4725                     ; 521 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
4727  07f5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4728  07f8 44            	srl	a
4729  07f9 5f            	clrw	x
4730  07fa 97            	ld	xl,a
4731  07fb cd0000        	call	_Num_Display_LCD
4733                     ; 522 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
4735  07fe c6000b        	ld	a,_uc_Target_Duty_Perc+1
4736  0801 a1c8          	cp	a,#200
4737  0803 2503          	jrult	L001
4738  0805 cc0a41        	jp	L5772
4739  0808               L001:
4740                     ; 523 								Display_LCD_String(".");
4742  0808 ae0105        	ldw	x,#L7352
4743  080b cd0000        	call	_Display_LCD_String
4745                     ; 524 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
4747  080e c6000b        	ld	a,_uc_Target_Duty_Perc+1
4748  0811 a401          	and	a,#1
4749  0813 6b15          	ld	(OFST-1,sp),a
4750                     ; 525 								if(uc_buffer){ Display_LCD_String("5"); }
4752  0815 0d15          	tnz	(OFST-1,sp)
4753  0817 270a          	jreq	L1272
4756  0819 ae0103        	ldw	x,#L3452
4757  081c cd0000        	call	_Display_LCD_String
4760  081f ac410a41      	jpf	L5772
4761  0823               L1272:
4762                     ; 526 								else{ Display_LCD_String("0"); }
4764  0823 ae0101        	ldw	x,#L7452
4765  0826 cd0000        	call	_Display_LCD_String
4767  0829 ac410a41      	jpf	L5772
4768  082d               L3072:
4769                     ; 531 if (HEATER_zone_status == HTR_ZONE_1)
4771  082d 725d0000      	tnz	_HEATER_zone_status
4772  0831 2667          	jrne	L7272
4773                     ; 533 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
4775  0833 c6000a        	ld	a,_uc_Target_Duty_Perc
4776  0836 a114          	cp	a,#20
4777  0838 2408          	jruge	L1372
4780  083a 5f            	clrw	x
4781  083b cd0000        	call	_Num_Display_LCD
4784  083e ac410a41      	jpf	L5772
4785  0842               L1372:
4786                     ; 534 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
4788  0842 c6000a        	ld	a,_uc_Target_Duty_Perc
4789  0845 a114          	cp	a,#20
4790  0847 260a          	jrne	L5372
4793  0849 ae0064        	ldw	x,#100
4794  084c cd0000        	call	_Num_Display_LCD
4797  084f ac410a41      	jpf	L5772
4798  0853               L5372:
4799                     ; 535 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
4801  0853 c6000a        	ld	a,_uc_Target_Duty_Perc
4802  0856 a1b4          	cp	a,#180
4803  0858 260a          	jrne	L1472
4806  085a ae1838        	ldw	x,#6200
4807  085d cd0000        	call	_Num_Display_LCD
4810  0860 ac410a41      	jpf	L5772
4811  0864               L1472:
4812                     ; 536 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
4814  0864 c6000a        	ld	a,_uc_Target_Duty_Perc
4815  0867 a1be          	cp	a,#190
4816  0869 260a          	jrne	L5472
4819  086b ae00c9        	ldw	x,#L7472
4820  086e cd0000        	call	_Display_LCD_String
4823  0871 ac410a41      	jpf	L5772
4824  0875               L5472:
4825                     ; 537 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
4827  0875 c6000a        	ld	a,_uc_Target_Duty_Perc
4828  0878 5f            	clrw	x
4829  0879 97            	ld	xl,a
4830  087a 1d0014        	subw	x,#20
4831  087d 90ae94ed      	ldw	y,#38125
4832  0881 cd0000        	call	c_umul
4834  0884 ae0000        	ldw	x,#L25
4835  0887 cd0000        	call	c_ludv
4837  088a be02          	ldw	x,c_lreg+2
4838  088c 1c0064        	addw	x,#100
4839  088f 1f0b          	ldw	(OFST-11,sp),x
4842  0891 1e0b          	ldw	x,(OFST-11,sp)
4843  0893 cd0000        	call	_Num_Display_LCD
4845  0896 ac410a41      	jpf	L5772
4846  089a               L7272:
4847                     ; 541 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
4849  089a c6000b        	ld	a,_uc_Target_Duty_Perc+1
4850  089d a114          	cp	a,#20
4851  089f 2408          	jruge	L5572
4854  08a1 5f            	clrw	x
4855  08a2 cd0000        	call	_Num_Display_LCD
4858  08a5 ac410a41      	jpf	L5772
4859  08a9               L5572:
4860                     ; 542 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
4862  08a9 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4863  08ac a114          	cp	a,#20
4864  08ae 260a          	jrne	L1672
4867  08b0 ae0064        	ldw	x,#100
4868  08b3 cd0000        	call	_Num_Display_LCD
4871  08b6 ac410a41      	jpf	L5772
4872  08ba               L1672:
4873                     ; 543 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
4875  08ba c6000b        	ld	a,_uc_Target_Duty_Perc+1
4876  08bd a1b4          	cp	a,#180
4877  08bf 260a          	jrne	L5672
4880  08c1 ae1838        	ldw	x,#6200
4881  08c4 cd0000        	call	_Num_Display_LCD
4884  08c7 ac410a41      	jpf	L5772
4885  08cb               L5672:
4886                     ; 544 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
4888  08cb c6000b        	ld	a,_uc_Target_Duty_Perc+1
4889  08ce a1be          	cp	a,#190
4890  08d0 260a          	jrne	L1772
4893  08d2 ae00c9        	ldw	x,#L7472
4894  08d5 cd0000        	call	_Display_LCD_String
4897  08d8 ac410a41      	jpf	L5772
4898  08dc               L1772:
4899                     ; 545 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
4901  08dc c6000b        	ld	a,_uc_Target_Duty_Perc+1
4902  08df 5f            	clrw	x
4903  08e0 97            	ld	xl,a
4904  08e1 1d0014        	subw	x,#20
4905  08e4 90ae94ed      	ldw	y,#38125
4906  08e8 cd0000        	call	c_umul
4908  08eb ae0000        	ldw	x,#L25
4909  08ee cd0000        	call	c_ludv
4911  08f1 be02          	ldw	x,c_lreg+2
4912  08f3 1c0064        	addw	x,#100
4913  08f6 1f0b          	ldw	(OFST-11,sp),x
4916  08f8 1e0b          	ldw	x,(OFST-11,sp)
4917  08fa cd0000        	call	_Num_Display_LCD
4919  08fd ac410a41      	jpf	L5772
4920  0901               L7762:
4921                     ; 550 					if(!uc_Target_Display_Mode){
4923  0901 725d0000      	tnz	_uc_Target_Display_Mode
4924  0905 2676          	jrne	L7772
4925                     ; 551 if (HEATER_zone_status == HTR_ZONE_1)
4927  0907 725d0000      	tnz	_HEATER_zone_status
4928  090b 2638          	jrne	L1003
4929                     ; 553 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
4931  090d c6000a        	ld	a,_uc_Target_Duty_Perc
4932  0910 44            	srl	a
4933  0911 5f            	clrw	x
4934  0912 97            	ld	xl,a
4935  0913 cd0000        	call	_Num_Display_LCD
4937                     ; 554 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
4939  0916 c6000a        	ld	a,_uc_Target_Duty_Perc
4940  0919 a1c8          	cp	a,#200
4941  091b 2503          	jrult	L201
4942  091d cc0a41        	jp	L5772
4943  0920               L201:
4944                     ; 555 							Display_LCD_String(".");
4946  0920 ae0105        	ldw	x,#L7352
4947  0923 cd0000        	call	_Display_LCD_String
4949                     ; 556 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
4951  0926 c6000a        	ld	a,_uc_Target_Duty_Perc
4952  0929 a401          	and	a,#1
4953  092b 6b15          	ld	(OFST-1,sp),a
4954                     ; 557 							if(uc_buffer){ Display_LCD_String("5"); }
4956  092d 0d15          	tnz	(OFST-1,sp)
4957  092f 270a          	jreq	L5003
4960  0931 ae0103        	ldw	x,#L3452
4961  0934 cd0000        	call	_Display_LCD_String
4964  0937 ac410a41      	jpf	L5772
4965  093b               L5003:
4966                     ; 558 							else{ Display_LCD_String("0"); }
4968  093b ae0101        	ldw	x,#L7452
4969  093e cd0000        	call	_Display_LCD_String
4971  0941 ac410a41      	jpf	L5772
4972  0945               L1003:
4973                     ; 563 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
4975  0945 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4976  0948 44            	srl	a
4977  0949 5f            	clrw	x
4978  094a 97            	ld	xl,a
4979  094b cd0000        	call	_Num_Display_LCD
4981                     ; 564 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
4983  094e c6000b        	ld	a,_uc_Target_Duty_Perc+1
4984  0951 a1c8          	cp	a,#200
4985  0953 2503          	jrult	L401
4986  0955 cc0a41        	jp	L5772
4987  0958               L401:
4988                     ; 565 							Display_LCD_String(".");
4990  0958 ae0105        	ldw	x,#L7352
4991  095b cd0000        	call	_Display_LCD_String
4993                     ; 566 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
4995  095e c6000b        	ld	a,_uc_Target_Duty_Perc+1
4996  0961 a401          	and	a,#1
4997  0963 6b15          	ld	(OFST-1,sp),a
4998                     ; 567 							if(uc_buffer){ Display_LCD_String("5"); }
5000  0965 0d15          	tnz	(OFST-1,sp)
5001  0967 270a          	jreq	L5103
5004  0969 ae0103        	ldw	x,#L3452
5005  096c cd0000        	call	_Display_LCD_String
5008  096f ac410a41      	jpf	L5772
5009  0973               L5103:
5010                     ; 568 							else{ Display_LCD_String("0"); }
5012  0973 ae0101        	ldw	x,#L7452
5013  0976 cd0000        	call	_Display_LCD_String
5015  0979 ac410a41      	jpf	L5772
5016  097d               L7772:
5017                     ; 573 if (HEATER_zone_status == HTR_ZONE_1)
5019  097d 725d0000      	tnz	_HEATER_zone_status
5020  0981 2663          	jrne	L3203
5021                     ; 575 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
5023  0983 c6000a        	ld	a,_uc_Target_Duty_Perc
5024  0986 a114          	cp	a,#20
5025  0988 2408          	jruge	L5203
5028  098a 5f            	clrw	x
5029  098b cd0000        	call	_Num_Display_LCD
5032  098e ac410a41      	jpf	L5772
5033  0992               L5203:
5034                     ; 576 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
5036  0992 c6000a        	ld	a,_uc_Target_Duty_Perc
5037  0995 a114          	cp	a,#20
5038  0997 260a          	jrne	L1303
5041  0999 ae0064        	ldw	x,#100
5042  099c cd0000        	call	_Num_Display_LCD
5045  099f ac410a41      	jpf	L5772
5046  09a3               L1303:
5047                     ; 577 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
5049  09a3 c6000a        	ld	a,_uc_Target_Duty_Perc
5050  09a6 a1b4          	cp	a,#180
5051  09a8 260a          	jrne	L5303
5054  09aa ae1838        	ldw	x,#6200
5055  09ad cd0000        	call	_Num_Display_LCD
5058  09b0 ac410a41      	jpf	L5772
5059  09b4               L5303:
5060                     ; 578 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
5062  09b4 c6000a        	ld	a,_uc_Target_Duty_Perc
5063  09b7 a1b5          	cp	a,#181
5064  09b9 2508          	jrult	L1403
5067  09bb ae00c9        	ldw	x,#L7472
5068  09be cd0000        	call	_Display_LCD_String
5071  09c1 207e          	jra	L5772
5072  09c3               L1403:
5073                     ; 579 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
5075  09c3 c6000a        	ld	a,_uc_Target_Duty_Perc
5076  09c6 5f            	clrw	x
5077  09c7 97            	ld	xl,a
5078  09c8 1d0014        	subw	x,#20
5079  09cb 90ae94ed      	ldw	y,#38125
5080  09cf cd0000        	call	c_umul
5082  09d2 ae0000        	ldw	x,#L25
5083  09d5 cd0000        	call	c_ludv
5085  09d8 be02          	ldw	x,c_lreg+2
5086  09da 1c0064        	addw	x,#100
5087  09dd 1f0b          	ldw	(OFST-11,sp),x
5090  09df 1e0b          	ldw	x,(OFST-11,sp)
5091  09e1 cd0000        	call	_Num_Display_LCD
5093  09e4 205b          	jra	L5772
5094  09e6               L3203:
5095                     ; 583 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
5097  09e6 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5098  09e9 a114          	cp	a,#20
5099  09eb 2406          	jruge	L7403
5102  09ed 5f            	clrw	x
5103  09ee cd0000        	call	_Num_Display_LCD
5106  09f1 204e          	jra	L5772
5107  09f3               L7403:
5108                     ; 584 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
5110  09f3 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5111  09f6 a114          	cp	a,#20
5112  09f8 2608          	jrne	L3503
5115  09fa ae0064        	ldw	x,#100
5116  09fd cd0000        	call	_Num_Display_LCD
5119  0a00 203f          	jra	L5772
5120  0a02               L3503:
5121                     ; 585 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
5123  0a02 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5124  0a05 a1b4          	cp	a,#180
5125  0a07 2608          	jrne	L7503
5128  0a09 ae1838        	ldw	x,#6200
5129  0a0c cd0000        	call	_Num_Display_LCD
5132  0a0f 2030          	jra	L5772
5133  0a11               L7503:
5134                     ; 586 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
5136  0a11 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5137  0a14 a1b5          	cp	a,#181
5138  0a16 2508          	jrult	L3603
5141  0a18 ae00c9        	ldw	x,#L7472
5142  0a1b cd0000        	call	_Display_LCD_String
5145  0a1e 2021          	jra	L5772
5146  0a20               L3603:
5147                     ; 587 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
5149  0a20 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5150  0a23 5f            	clrw	x
5151  0a24 97            	ld	xl,a
5152  0a25 1d0014        	subw	x,#20
5153  0a28 90ae94ed      	ldw	y,#38125
5154  0a2c cd0000        	call	c_umul
5156  0a2f ae0000        	ldw	x,#L25
5157  0a32 cd0000        	call	c_ludv
5159  0a35 be02          	ldw	x,c_lreg+2
5160  0a37 1c0064        	addw	x,#100
5161  0a3a 1f0b          	ldw	(OFST-11,sp),x
5164  0a3c 1e0b          	ldw	x,(OFST-11,sp)
5165  0a3e cd0000        	call	_Num_Display_LCD
5167  0a41               L5772:
5168                     ; 593 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5170  0a41 7b16          	ld	a,(OFST+0,sp)
5171  0a43 5f            	clrw	x
5172  0a44 97            	ld	xl,a
5173  0a45 d60000        	ld	a,(_LCD_Line,x)
5174  0a48 ab0b          	add	a,#11
5175  0a4a cd0000        	call	_Set_LCD_Address
5177                     ; 594 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5179  0a4d c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5180  0a50 a501          	bcp	a,#1
5181  0a52 270a          	jreq	L7603
5184  0a54 ae00e0        	ldw	x,#L1462
5185  0a57 cd0000        	call	_Display_LCD_String
5188  0a5a ac9f0b9f      	jpf	L3762
5189  0a5e               L7603:
5190                     ; 596 					Num_Display_LCD(can_data[6] /(U8)(2));
5192  0a5e 7b13          	ld	a,(OFST-3,sp)
5193  0a60 44            	srl	a
5194  0a61 5f            	clrw	x
5195  0a62 97            	ld	xl,a
5196  0a63 cd0000        	call	_Num_Display_LCD
5198                     ; 597 					if(can_data[6] < (U8)(200)){
5200  0a66 7b13          	ld	a,(OFST-3,sp)
5201  0a68 a1c8          	cp	a,#200
5202  0a6a 2503          	jrult	L601
5203  0a6c cc0b9f        	jp	L3762
5204  0a6f               L601:
5205                     ; 598 						Display_LCD_String(".");
5207  0a6f ae0105        	ldw	x,#L7352
5208  0a72 cd0000        	call	_Display_LCD_String
5210                     ; 599 						uc_buffer = can_data[6] % (U8)(2);
5212  0a75 7b13          	ld	a,(OFST-3,sp)
5213  0a77 a401          	and	a,#1
5214  0a79 6b15          	ld	(OFST-1,sp),a
5215                     ; 600 						if(uc_buffer){ Display_LCD_String("5"); }
5217  0a7b 0d15          	tnz	(OFST-1,sp)
5218  0a7d 270a          	jreq	L5703
5221  0a7f ae0103        	ldw	x,#L3452
5222  0a82 cd0000        	call	_Display_LCD_String
5225  0a85 ac9f0b9f      	jpf	L3762
5226  0a89               L5703:
5227                     ; 601 						else{ Display_LCD_String("0"); }
5229  0a89 ae0101        	ldw	x,#L7452
5230  0a8c cd0000        	call	_Display_LCD_String
5232  0a8f ac9f0b9f      	jpf	L3762
5233  0a93               L5762:
5234                     ; 607 			else if(uc_line_index == (U8)(2)){	// LINE 3
5236  0a93 7b16          	ld	a,(OFST+0,sp)
5237  0a95 a102          	cp	a,#2
5238  0a97 2703          	jreq	L011
5239  0a99 cc0b26        	jp	L3013
5240  0a9c               L011:
5241                     ; 610 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
5243  0a9c 7b16          	ld	a,(OFST+0,sp)
5244  0a9e 5f            	clrw	x
5245  0a9f 97            	ld	xl,a
5246  0aa0 d60000        	ld	a,(_LCD_Line,x)
5247  0aa3 ab02          	add	a,#2
5248  0aa5 cd0000        	call	_Set_LCD_Address
5250                     ; 611 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
5252  0aa8 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5253  0aab a501          	bcp	a,#1
5254  0aad 2708          	jreq	L5013
5257  0aaf ae00c7        	ldw	x,#L7013
5258  0ab2 cd0000        	call	_Display_LCD_String
5261  0ab5 2014          	jra	L1113
5262  0ab7               L5013:
5263                     ; 613 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
5265  0ab7 7b0d          	ld	a,(OFST-9,sp)
5266  0ab9 a501          	bcp	a,#1
5267  0abb 2708          	jreq	L3113
5270  0abd ae00c5        	ldw	x,#L5113
5271  0ac0 cd0000        	call	_Display_LCD_String
5274  0ac3 2006          	jra	L1113
5275  0ac5               L3113:
5276                     ; 614 					else{ Display_LCD_String("0"); }
5278  0ac5 ae0101        	ldw	x,#L7452
5279  0ac8 cd0000        	call	_Display_LCD_String
5281  0acb               L1113:
5282                     ; 617 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
5284  0acb 7b16          	ld	a,(OFST+0,sp)
5285  0acd 5f            	clrw	x
5286  0ace 97            	ld	xl,a
5287  0acf d60000        	ld	a,(_LCD_Line,x)
5288  0ad2 ab06          	add	a,#6
5289  0ad4 cd0000        	call	_Set_LCD_Address
5291                     ; 618 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
5293  0ad7 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5294  0ada a502          	bcp	a,#2
5295  0adc 2708          	jreq	L1213
5298  0ade ae00c7        	ldw	x,#L7013
5299  0ae1 cd0000        	call	_Display_LCD_String
5302  0ae4 2014          	jra	L3213
5303  0ae6               L1213:
5304                     ; 620 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
5306  0ae6 7b03          	ld	a,(OFST-19,sp)
5307  0ae8 a501          	bcp	a,#1
5308  0aea 2708          	jreq	L5213
5311  0aec ae00c5        	ldw	x,#L5113
5312  0aef cd0000        	call	_Display_LCD_String
5315  0af2 2006          	jra	L3213
5316  0af4               L5213:
5317                     ; 621 					else{ Display_LCD_String("0"); }
5319  0af4 ae0101        	ldw	x,#L7452
5320  0af7 cd0000        	call	_Display_LCD_String
5322  0afa               L3213:
5323                     ; 624 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5325  0afa 7b16          	ld	a,(OFST+0,sp)
5326  0afc 5f            	clrw	x
5327  0afd 97            	ld	xl,a
5328  0afe d60000        	ld	a,(_LCD_Line,x)
5329  0b01 ab0b          	add	a,#11
5330  0b03 cd0000        	call	_Set_LCD_Address
5332                     ; 625 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5334  0b06 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5335  0b09 a501          	bcp	a,#1
5336  0b0b 270a          	jreq	L1313
5339  0b0d ae00e0        	ldw	x,#L1462
5340  0b10 cd0000        	call	_Display_LCD_String
5343  0b13 ac9f0b9f      	jpf	L3762
5344  0b17               L1313:
5345                     ; 627 					ui_buffer = (U16)(can_data[4]) * (U16)(4);//YJS 2->4
5347  0b17 7b11          	ld	a,(OFST-5,sp)
5348  0b19 97            	ld	xl,a
5349  0b1a a604          	ld	a,#4
5350  0b1c 42            	mul	x,a
5351  0b1d 1f0b          	ldw	(OFST-11,sp),x
5352                     ; 628 					Num_Display_LCD(ui_buffer);
5354  0b1f 1e0b          	ldw	x,(OFST-11,sp)
5355  0b21 cd0000        	call	_Num_Display_LCD
5357  0b24 2079          	jra	L3762
5358  0b26               L3013:
5359                     ; 633 			else if(uc_line_index == (U8)(3)){	// LINE 4
5361  0b26 7b16          	ld	a,(OFST+0,sp)
5362  0b28 a103          	cp	a,#3
5363  0b2a 2673          	jrne	L3762
5364                     ; 636 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5366  0b2c 7b16          	ld	a,(OFST+0,sp)
5367  0b2e 5f            	clrw	x
5368  0b2f 97            	ld	xl,a
5369  0b30 d60000        	ld	a,(_LCD_Line,x)
5370  0b33 ab03          	add	a,#3
5371  0b35 cd0000        	call	_Set_LCD_Address
5373                     ; 638 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5375  0b38 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5376  0b3b a501          	bcp	a,#1
5377  0b3d 2708          	jreq	L1413
5380  0b3f ae00e0        	ldw	x,#L1462
5381  0b42 cd0000        	call	_Display_LCD_String
5384  0b45 2027          	jra	L3413
5385  0b47               L1413:
5386                     ; 640 					Num_Display_LCD(can_data[5] / (U8)(5));
5388  0b47 7b12          	ld	a,(OFST-4,sp)
5389  0b49 5f            	clrw	x
5390  0b4a 97            	ld	xl,a
5391  0b4b a605          	ld	a,#5
5392  0b4d cd0000        	call	c_sdivx
5394  0b50 cd0000        	call	_Num_Display_LCD
5396                     ; 641 					Display_LCD_String(".");
5398  0b53 ae0105        	ldw	x,#L7352
5399  0b56 cd0000        	call	_Display_LCD_String
5401                     ; 642 					uc_buffer = can_data[5] % (U8)(5);
5403  0b59 7b12          	ld	a,(OFST-4,sp)
5404  0b5b ae0005        	ldw	x,#5
5405  0b5e 51            	exgw	x,y
5406  0b5f 5f            	clrw	x
5407  0b60 97            	ld	xl,a
5408  0b61 65            	divw	x,y
5409  0b62 909f          	ld	a,yl
5410  0b64 6b15          	ld	(OFST-1,sp),a
5411                     ; 643 					Num_Display_LCD(uc_buffer * (U8)(2));
5413  0b66 7b15          	ld	a,(OFST-1,sp)
5414  0b68 5f            	clrw	x
5415  0b69 97            	ld	xl,a
5416  0b6a 58            	sllw	x
5417  0b6b cd0000        	call	_Num_Display_LCD
5419  0b6e               L3413:
5420                     ; 649 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5422  0b6e 7b16          	ld	a,(OFST+0,sp)
5423  0b70 5f            	clrw	x
5424  0b71 97            	ld	xl,a
5425  0b72 d60000        	ld	a,(_LCD_Line,x)
5426  0b75 ab0b          	add	a,#11
5427  0b77 cd0000        	call	_Set_LCD_Address
5429                     ; 651 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5431  0b7a c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5432  0b7d a501          	bcp	a,#1
5433  0b7f 2708          	jreq	L5413
5436  0b81 ae00e0        	ldw	x,#L1462
5437  0b84 cd0000        	call	_Display_LCD_String
5440  0b87 2016          	jra	L3762
5441  0b89               L5413:
5442                     ; 653 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
5444  0b89 7b0f          	ld	a,(OFST-7,sp)
5445  0b8b 5f            	clrw	x
5446  0b8c 97            	ld	xl,a
5447  0b8d 1f01          	ldw	(OFST-21,sp),x
5448  0b8f 7b10          	ld	a,(OFST-6,sp)
5449  0b91 5f            	clrw	x
5450  0b92 97            	ld	xl,a
5451  0b93 4f            	clr	a
5452  0b94 02            	rlwa	x,a
5453  0b95 72fb01        	addw	x,(OFST-21,sp)
5454  0b98 1f0b          	ldw	(OFST-11,sp),x
5455                     ; 654 					Num_Display_LCD(ui_buffer);
5457  0b9a 1e0b          	ldw	x,(OFST-11,sp)
5458  0b9c cd0000        	call	_Num_Display_LCD
5460  0b9f               L3762:
5461                     ; 449 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5463  0b9f 0c16          	inc	(OFST+0,sp)
5466  0ba1 7b16          	ld	a,(OFST+0,sp)
5467  0ba3 a104          	cp	a,#4
5468  0ba5 2403          	jruge	L211
5469  0ba7 cc063f        	jp	L7552
5470  0baa               L211:
5472  0baa ac6d106d      	jpf	L1513
5473  0bae               L5552:
5474                     ; 664 	else if(uc_Test_Page_Now == (U8)(1)){
5476  0bae c60004        	ld	a,_uc_Test_Page_Now
5477  0bb1 a101          	cp	a,#1
5478  0bb3 2703          	jreq	L411
5479  0bb5 cc0c66        	jp	L3513
5480  0bb8               L411:
5481                     ; 665 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5483  0bb8 0f16          	clr	(OFST+0,sp)
5484  0bba               L5513:
5485                     ; 667 			Set_LCD_Address(LCD_Line[uc_line_index]);
5487  0bba 7b16          	ld	a,(OFST+0,sp)
5488  0bbc 5f            	clrw	x
5489  0bbd 97            	ld	xl,a
5490  0bbe d60000        	ld	a,(_LCD_Line,x)
5491  0bc1 cd0000        	call	_Set_LCD_Address
5493                     ; 668 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
5495  0bc4 7b16          	ld	a,(OFST+0,sp)
5496  0bc6 97            	ld	xl,a
5497  0bc7 a610          	ld	a,#16
5498  0bc9 42            	mul	x,a
5499  0bca 1c0000        	addw	x,#_LCD_Dis_Data
5500  0bcd cd0000        	call	_Display_LCD_String
5502                     ; 671 			if(uc_line_index == (U8)(0)){		// LINE 1
5504  0bd0 0d16          	tnz	(OFST+0,sp)
5505  0bd2 2641          	jrne	L3613
5506                     ; 674 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5508  0bd4 7b16          	ld	a,(OFST+0,sp)
5509  0bd6 5f            	clrw	x
5510  0bd7 97            	ld	xl,a
5511  0bd8 d60000        	ld	a,(_LCD_Line,x)
5512  0bdb ab03          	add	a,#3
5513  0bdd cd0000        	call	_Set_LCD_Address
5515                     ; 675 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5517  0be0 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5518  0be3 a501          	bcp	a,#1
5519  0be5 2708          	jreq	L5613
5522  0be7 ae00e0        	ldw	x,#L1462
5523  0bea cd0000        	call	_Display_LCD_String
5526  0bed 2026          	jra	L3613
5527  0bef               L5613:
5528                     ; 677 					if(can_data[1] < (U8)(40)){
5530  0bef 7b0e          	ld	a,(OFST-8,sp)
5531  0bf1 a128          	cp	a,#40
5532  0bf3 2416          	jruge	L1713
5533                     ; 678 						Display_LCD_String("-");
5535  0bf5 ae00c3        	ldw	x,#L3713
5536  0bf8 cd0000        	call	_Display_LCD_String
5538                     ; 679 						Num_Display_LCD((U8)(40) - can_data[1]);
5540  0bfb a600          	ld	a,#0
5541  0bfd 97            	ld	xl,a
5542  0bfe a628          	ld	a,#40
5543  0c00 100e          	sub	a,(OFST-8,sp)
5544  0c02 2401          	jrnc	L45
5545  0c04 5a            	decw	x
5546  0c05               L45:
5547  0c05 02            	rlwa	x,a
5548  0c06 cd0000        	call	_Num_Display_LCD
5551  0c09 200a          	jra	L3613
5552  0c0b               L1713:
5553                     ; 682 						Num_Display_LCD(can_data[1] - (U8)(40));
5555  0c0b 7b0e          	ld	a,(OFST-8,sp)
5556  0c0d 5f            	clrw	x
5557  0c0e 97            	ld	xl,a
5558  0c0f 1d0028        	subw	x,#40
5559  0c12 cd0000        	call	_Num_Display_LCD
5561  0c15               L3613:
5562                     ; 688 			if(uc_line_index == (U8)(1)){		// LINE 2
5564  0c15 7b16          	ld	a,(OFST+0,sp)
5565  0c17 a101          	cp	a,#1
5566  0c19 2634          	jrne	L7713
5567                     ; 691 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
5569  0c1b 7b16          	ld	a,(OFST+0,sp)
5570  0c1d 5f            	clrw	x
5571  0c1e 97            	ld	xl,a
5572  0c1f d60000        	ld	a,(_LCD_Line,x)
5573  0c22 ab04          	add	a,#4
5574  0c24 cd0000        	call	_Set_LCD_Address
5576                     ; 692 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5578  0c27 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5579  0c2a a502          	bcp	a,#2
5580  0c2c 2708          	jreq	L1023
5583  0c2e ae00e0        	ldw	x,#L1462
5584  0c31 cd0000        	call	_Display_LCD_String
5587  0c34 2019          	jra	L7713
5588  0c36               L1023:
5589                     ; 699 					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
5591  0c36 7b09          	ld	a,(OFST-13,sp)
5592  0c38 4e            	swap	a
5593  0c39 a40f          	and	a,#15
5594  0c3b 5f            	clrw	x
5595  0c3c 97            	ld	xl,a
5596  0c3d cd0000        	call	_Num_Display_LCD
5598                     ; 700 					Display_LCD_String(".");
5600  0c40 ae0105        	ldw	x,#L7352
5601  0c43 cd0000        	call	_Display_LCD_String
5603                     ; 701 					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
5605  0c46 7b09          	ld	a,(OFST-13,sp)
5606  0c48 a40f          	and	a,#15
5607  0c4a 5f            	clrw	x
5608  0c4b 97            	ld	xl,a
5609  0c4c cd0000        	call	_Num_Display_LCD
5611  0c4f               L7713:
5612                     ; 707 			if(uc_line_index == (U8)(2)){		// LINE 2
5614  0c4f 7b16          	ld	a,(OFST+0,sp)
5615  0c51 a102          	cp	a,#2
5616                     ; 712 			if(uc_line_index == (U8)(3)){		// LINE 3
5618  0c53 7b16          	ld	a,(OFST+0,sp)
5619  0c55 a103          	cp	a,#3
5620                     ; 665 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5622  0c57 0c16          	inc	(OFST+0,sp)
5625  0c59 7b16          	ld	a,(OFST+0,sp)
5626  0c5b a104          	cp	a,#4
5627  0c5d 2403          	jruge	L611
5628  0c5f cc0bba        	jp	L5513
5629  0c62               L611:
5631  0c62 ac6d106d      	jpf	L1513
5632  0c66               L3513:
5633                     ; 719 		if(b_Rx2_Msg_TimeOut_Flag){
5635  0c66 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5636  0c69 a502          	bcp	a,#2
5637  0c6b 2710          	jreq	L3123
5638                     ; 720 			Set_LCD_Address(LCD_Line[0]);	
5640  0c6d c60000        	ld	a,_LCD_Line
5641  0c70 cd0000        	call	_Set_LCD_Address
5643                     ; 721 			Display_LCD_String("NC");
5645  0c73 ae00e0        	ldw	x,#L1462
5646  0c76 cd0000        	call	_Display_LCD_String
5649  0c79 ac6d106d      	jpf	L1513
5650  0c7d               L3123:
5651                     ; 724 			uc_fault_cnt = (U8)(0);
5653  0c7d 0f16          	clr	(OFST+0,sp)
5654                     ; 726 			if(can_diag[1] & (U8)(0x01)){
5656  0c7f 7b04          	ld	a,(OFST-18,sp)
5657  0c81 a501          	bcp	a,#1
5658  0c83 273c          	jreq	L7123
5659                     ; 727 				uc_fault_cnt++;
5661  0c85 0c16          	inc	(OFST+0,sp)
5662                     ; 728 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5662                     ; 729 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5662                     ; 730 				){
5664  0c87 0d16          	tnz	(OFST+0,sp)
5665  0c89 270d          	jreq	L5223
5667  0c8b 7b16          	ld	a,(OFST+0,sp)
5668  0c8d a105          	cp	a,#5
5669  0c8f 2407          	jruge	L5223
5671  0c91 c60004        	ld	a,_uc_Test_Page_Now
5672  0c94 a102          	cp	a,#2
5673  0c96 2713          	jreq	L3223
5674  0c98               L5223:
5676  0c98 7b16          	ld	a,(OFST+0,sp)
5677  0c9a a105          	cp	a,#5
5678  0c9c 2523          	jrult	L7123
5680  0c9e 7b16          	ld	a,(OFST+0,sp)
5681  0ca0 a109          	cp	a,#9
5682  0ca2 241d          	jruge	L7123
5684  0ca4 c60004        	ld	a,_uc_Test_Page_Now
5685  0ca7 a103          	cp	a,#3
5686  0ca9 2616          	jrne	L7123
5687  0cab               L3223:
5688                     ; 731 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5690  0cab 7b16          	ld	a,(OFST+0,sp)
5691  0cad 5f            	clrw	x
5692  0cae 97            	ld	xl,a
5693  0caf 5a            	decw	x
5694  0cb0 a604          	ld	a,#4
5695  0cb2 cd0000        	call	c_smodx
5697  0cb5 d60000        	ld	a,(_LCD_Line,x)
5698  0cb8 cd0000        	call	_Set_LCD_Address
5700                     ; 732 					Display_LCD_String("Flt_LVLow");
5702  0cbb ae00b9        	ldw	x,#L1323
5703  0cbe cd0000        	call	_Display_LCD_String
5705  0cc1               L7123:
5706                     ; 736 			if(can_diag[1] & (U8)(0x02)){
5708  0cc1 7b04          	ld	a,(OFST-18,sp)
5709  0cc3 a502          	bcp	a,#2
5710  0cc5 273c          	jreq	L3323
5711                     ; 737 				uc_fault_cnt++;
5713  0cc7 0c16          	inc	(OFST+0,sp)
5714                     ; 738 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5714                     ; 739 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5714                     ; 740 				){
5716  0cc9 0d16          	tnz	(OFST+0,sp)
5717  0ccb 270d          	jreq	L1423
5719  0ccd 7b16          	ld	a,(OFST+0,sp)
5720  0ccf a105          	cp	a,#5
5721  0cd1 2407          	jruge	L1423
5723  0cd3 c60004        	ld	a,_uc_Test_Page_Now
5724  0cd6 a102          	cp	a,#2
5725  0cd8 2713          	jreq	L7323
5726  0cda               L1423:
5728  0cda 7b16          	ld	a,(OFST+0,sp)
5729  0cdc a105          	cp	a,#5
5730  0cde 2523          	jrult	L3323
5732  0ce0 7b16          	ld	a,(OFST+0,sp)
5733  0ce2 a109          	cp	a,#9
5734  0ce4 241d          	jruge	L3323
5736  0ce6 c60004        	ld	a,_uc_Test_Page_Now
5737  0ce9 a103          	cp	a,#3
5738  0ceb 2616          	jrne	L3323
5739  0ced               L7323:
5740                     ; 741 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5742  0ced 7b16          	ld	a,(OFST+0,sp)
5743  0cef 5f            	clrw	x
5744  0cf0 97            	ld	xl,a
5745  0cf1 5a            	decw	x
5746  0cf2 a604          	ld	a,#4
5747  0cf4 cd0000        	call	c_smodx
5749  0cf7 d60000        	ld	a,(_LCD_Line,x)
5750  0cfa cd0000        	call	_Set_LCD_Address
5752                     ; 742 					Display_LCD_String("Flt_LVHigh");
5754  0cfd ae00ae        	ldw	x,#L5423
5755  0d00 cd0000        	call	_Display_LCD_String
5757  0d03               L3323:
5758                     ; 746 			if(can_diag[1] & (U8)(0x04)){
5760  0d03 7b04          	ld	a,(OFST-18,sp)
5761  0d05 a504          	bcp	a,#4
5762  0d07 273c          	jreq	L7423
5763                     ; 747 				uc_fault_cnt++;
5765  0d09 0c16          	inc	(OFST+0,sp)
5766                     ; 748 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5766                     ; 749 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5766                     ; 750 				){
5768  0d0b 0d16          	tnz	(OFST+0,sp)
5769  0d0d 270d          	jreq	L5523
5771  0d0f 7b16          	ld	a,(OFST+0,sp)
5772  0d11 a105          	cp	a,#5
5773  0d13 2407          	jruge	L5523
5775  0d15 c60004        	ld	a,_uc_Test_Page_Now
5776  0d18 a102          	cp	a,#2
5777  0d1a 2713          	jreq	L3523
5778  0d1c               L5523:
5780  0d1c 7b16          	ld	a,(OFST+0,sp)
5781  0d1e a105          	cp	a,#5
5782  0d20 2523          	jrult	L7423
5784  0d22 7b16          	ld	a,(OFST+0,sp)
5785  0d24 a109          	cp	a,#9
5786  0d26 241d          	jruge	L7423
5788  0d28 c60004        	ld	a,_uc_Test_Page_Now
5789  0d2b a103          	cp	a,#3
5790  0d2d 2616          	jrne	L7423
5791  0d2f               L3523:
5792                     ; 751 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5794  0d2f 7b16          	ld	a,(OFST+0,sp)
5795  0d31 5f            	clrw	x
5796  0d32 97            	ld	xl,a
5797  0d33 5a            	decw	x
5798  0d34 a604          	ld	a,#4
5799  0d36 cd0000        	call	c_smodx
5801  0d39 d60000        	ld	a,(_LCD_Line,x)
5802  0d3c cd0000        	call	_Set_LCD_Address
5804                     ; 752 					Display_LCD_String("Flt_HVLow");
5806  0d3f ae00a4        	ldw	x,#L1623
5807  0d42 cd0000        	call	_Display_LCD_String
5809  0d45               L7423:
5810                     ; 756 			if(can_diag[1] & (U8)(0x08)){
5812  0d45 7b04          	ld	a,(OFST-18,sp)
5813  0d47 a508          	bcp	a,#8
5814  0d49 273c          	jreq	L3623
5815                     ; 757 				uc_fault_cnt++;
5817  0d4b 0c16          	inc	(OFST+0,sp)
5818                     ; 758 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5818                     ; 759 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5818                     ; 760 				){
5820  0d4d 0d16          	tnz	(OFST+0,sp)
5821  0d4f 270d          	jreq	L1723
5823  0d51 7b16          	ld	a,(OFST+0,sp)
5824  0d53 a105          	cp	a,#5
5825  0d55 2407          	jruge	L1723
5827  0d57 c60004        	ld	a,_uc_Test_Page_Now
5828  0d5a a102          	cp	a,#2
5829  0d5c 2713          	jreq	L7623
5830  0d5e               L1723:
5832  0d5e 7b16          	ld	a,(OFST+0,sp)
5833  0d60 a105          	cp	a,#5
5834  0d62 2523          	jrult	L3623
5836  0d64 7b16          	ld	a,(OFST+0,sp)
5837  0d66 a109          	cp	a,#9
5838  0d68 241d          	jruge	L3623
5840  0d6a c60004        	ld	a,_uc_Test_Page_Now
5841  0d6d a103          	cp	a,#3
5842  0d6f 2616          	jrne	L3623
5843  0d71               L7623:
5844                     ; 761 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
5846  0d71 7b16          	ld	a,(OFST+0,sp)
5847  0d73 5f            	clrw	x
5848  0d74 97            	ld	xl,a
5849  0d75 5a            	decw	x
5850  0d76 a604          	ld	a,#4
5851  0d78 cd0000        	call	c_smodx
5853  0d7b d60000        	ld	a,(_LCD_Line,x)
5854  0d7e cd0000        	call	_Set_LCD_Address
5856                     ; 762 					Display_LCD_String("Flt_HVHigh");
5858  0d81 ae0099        	ldw	x,#L5723
5859  0d84 cd0000        	call	_Display_LCD_String
5861  0d87               L3623:
5862                     ; 766 			if(can_diag[1] & (U8)(0x10)){
5864  0d87 7b04          	ld	a,(OFST-18,sp)
5865  0d89 a510          	bcp	a,#16
5866  0d8b 273c          	jreq	L7723
5867                     ; 767 				uc_fault_cnt++;
5869  0d8d 0c16          	inc	(OFST+0,sp)
5870                     ; 768 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5870                     ; 769 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5870                     ; 770 				){
5872  0d8f 0d16          	tnz	(OFST+0,sp)
5873  0d91 270d          	jreq	L5033
5875  0d93 7b16          	ld	a,(OFST+0,sp)
5876  0d95 a105          	cp	a,#5
5877  0d97 2407          	jruge	L5033
5879  0d99 c60004        	ld	a,_uc_Test_Page_Now
5880  0d9c a102          	cp	a,#2
5881  0d9e 2713          	jreq	L3033
5882  0da0               L5033:
5884  0da0 7b16          	ld	a,(OFST+0,sp)
5885  0da2 a105          	cp	a,#5
5886  0da4 2523          	jrult	L7723
5888  0da6 7b16          	ld	a,(OFST+0,sp)
5889  0da8 a109          	cp	a,#9
5890  0daa 241d          	jruge	L7723
5892  0dac c60004        	ld	a,_uc_Test_Page_Now
5893  0daf a103          	cp	a,#3
5894  0db1 2616          	jrne	L7723
5895  0db3               L3033:
5896                     ; 771 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5898  0db3 7b16          	ld	a,(OFST+0,sp)
5899  0db5 5f            	clrw	x
5900  0db6 97            	ld	xl,a
5901  0db7 5a            	decw	x
5902  0db8 a604          	ld	a,#4
5903  0dba cd0000        	call	c_smodx
5905  0dbd d60000        	ld	a,(_LCD_Line,x)
5906  0dc0 cd0000        	call	_Set_LCD_Address
5908                     ; 772 					Display_LCD_String("Flt_OverCur");
5910  0dc3 ae008d        	ldw	x,#L1133
5911  0dc6 cd0000        	call	_Display_LCD_String
5913  0dc9               L7723:
5914                     ; 778 			if(can_diag[1] & (U8)(0x20)){
5916  0dc9 7b04          	ld	a,(OFST-18,sp)
5917  0dcb a520          	bcp	a,#32
5918  0dcd 273c          	jreq	L3133
5919                     ; 780 				uc_fault_cnt++;
5921  0dcf 0c16          	inc	(OFST+0,sp)
5922                     ; 781 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5922                     ; 782 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5922                     ; 783 				){
5924  0dd1 0d16          	tnz	(OFST+0,sp)
5925  0dd3 270d          	jreq	L1233
5927  0dd5 7b16          	ld	a,(OFST+0,sp)
5928  0dd7 a105          	cp	a,#5
5929  0dd9 2407          	jruge	L1233
5931  0ddb c60004        	ld	a,_uc_Test_Page_Now
5932  0dde a102          	cp	a,#2
5933  0de0 2713          	jreq	L7133
5934  0de2               L1233:
5936  0de2 7b16          	ld	a,(OFST+0,sp)
5937  0de4 a105          	cp	a,#5
5938  0de6 2523          	jrult	L3133
5940  0de8 7b16          	ld	a,(OFST+0,sp)
5941  0dea a109          	cp	a,#9
5942  0dec 241d          	jruge	L3133
5944  0dee c60004        	ld	a,_uc_Test_Page_Now
5945  0df1 a103          	cp	a,#3
5946  0df3 2616          	jrne	L3133
5947  0df5               L7133:
5948                     ; 784 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5950  0df5 7b16          	ld	a,(OFST+0,sp)
5951  0df7 5f            	clrw	x
5952  0df8 97            	ld	xl,a
5953  0df9 5a            	decw	x
5954  0dfa a604          	ld	a,#4
5955  0dfc cd0000        	call	c_smodx
5957  0dff d60000        	ld	a,(_LCD_Line,x)
5958  0e02 cd0000        	call	_Set_LCD_Address
5960                     ; 785 					Display_LCD_String("Flt_ThmShut");
5962  0e05 ae0081        	ldw	x,#L5233
5963  0e08 cd0000        	call	_Display_LCD_String
5965  0e0b               L3133:
5966                     ; 791 			if(can_diag[1] & (U8)(0x40)){
5968  0e0b 7b04          	ld	a,(OFST-18,sp)
5969  0e0d a540          	bcp	a,#64
5970  0e0f 273c          	jreq	L7233
5971                     ; 793 				uc_fault_cnt++;
5973  0e11 0c16          	inc	(OFST+0,sp)
5974                     ; 794 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5974                     ; 795 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5974                     ; 796 				){
5976  0e13 0d16          	tnz	(OFST+0,sp)
5977  0e15 270d          	jreq	L5333
5979  0e17 7b16          	ld	a,(OFST+0,sp)
5980  0e19 a105          	cp	a,#5
5981  0e1b 2407          	jruge	L5333
5983  0e1d c60004        	ld	a,_uc_Test_Page_Now
5984  0e20 a102          	cp	a,#2
5985  0e22 2713          	jreq	L3333
5986  0e24               L5333:
5988  0e24 7b16          	ld	a,(OFST+0,sp)
5989  0e26 a105          	cp	a,#5
5990  0e28 2523          	jrult	L7233
5992  0e2a 7b16          	ld	a,(OFST+0,sp)
5993  0e2c a109          	cp	a,#9
5994  0e2e 241d          	jruge	L7233
5996  0e30 c60004        	ld	a,_uc_Test_Page_Now
5997  0e33 a103          	cp	a,#3
5998  0e35 2616          	jrne	L7233
5999  0e37               L3333:
6000                     ; 797 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
6002  0e37 7b16          	ld	a,(OFST+0,sp)
6003  0e39 5f            	clrw	x
6004  0e3a 97            	ld	xl,a
6005  0e3b 5a            	decw	x
6006  0e3c a604          	ld	a,#4
6007  0e3e cd0000        	call	c_smodx
6009  0e41 d60000        	ld	a,(_LCD_Line,x)
6010  0e44 cd0000        	call	_Set_LCD_Address
6012                     ; 798 					Display_LCD_String("Flt_PCBThmShut");
6014  0e47 ae0072        	ldw	x,#L1433
6015  0e4a cd0000        	call	_Display_LCD_String
6017  0e4d               L7233:
6018                     ; 802 			if(can_diag[3] & (U8)(0x01)){
6020  0e4d 7b06          	ld	a,(OFST-16,sp)
6021  0e4f a501          	bcp	a,#1
6022  0e51 273c          	jreq	L3433
6023                     ; 803 				uc_fault_cnt++;
6025  0e53 0c16          	inc	(OFST+0,sp)
6026                     ; 804 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6026                     ; 805 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6026                     ; 806 				){
6028  0e55 0d16          	tnz	(OFST+0,sp)
6029  0e57 270d          	jreq	L1533
6031  0e59 7b16          	ld	a,(OFST+0,sp)
6032  0e5b a105          	cp	a,#5
6033  0e5d 2407          	jruge	L1533
6035  0e5f c60004        	ld	a,_uc_Test_Page_Now
6036  0e62 a102          	cp	a,#2
6037  0e64 2713          	jreq	L7433
6038  0e66               L1533:
6040  0e66 7b16          	ld	a,(OFST+0,sp)
6041  0e68 a105          	cp	a,#5
6042  0e6a 2523          	jrult	L3433
6044  0e6c 7b16          	ld	a,(OFST+0,sp)
6045  0e6e a109          	cp	a,#9
6046  0e70 241d          	jruge	L3433
6048  0e72 c60004        	ld	a,_uc_Test_Page_Now
6049  0e75 a103          	cp	a,#3
6050  0e77 2616          	jrne	L3433
6051  0e79               L7433:
6052                     ; 807 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6054  0e79 7b16          	ld	a,(OFST+0,sp)
6055  0e7b 5f            	clrw	x
6056  0e7c 97            	ld	xl,a
6057  0e7d 5a            	decw	x
6058  0e7e a604          	ld	a,#4
6059  0e80 cd0000        	call	c_smodx
6061  0e83 d60000        	ld	a,(_LCD_Line,x)
6062  0e86 cd0000        	call	_Set_LCD_Address
6064                     ; 808 					Display_LCD_String("Flt_MsgTimeOut");
6066  0e89 ae0063        	ldw	x,#L5533
6067  0e8c cd0000        	call	_Display_LCD_String
6069  0e8f               L3433:
6070                     ; 812 			if(can_diag[4] & (U8)(0x01)){
6072  0e8f 7b07          	ld	a,(OFST-15,sp)
6073  0e91 a501          	bcp	a,#1
6074  0e93 273c          	jreq	L7533
6075                     ; 813 				uc_fault_cnt++;
6077  0e95 0c16          	inc	(OFST+0,sp)
6078                     ; 814 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6078                     ; 815 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6078                     ; 816 				){
6080  0e97 0d16          	tnz	(OFST+0,sp)
6081  0e99 270d          	jreq	L5633
6083  0e9b 7b16          	ld	a,(OFST+0,sp)
6084  0e9d a105          	cp	a,#5
6085  0e9f 2407          	jruge	L5633
6087  0ea1 c60004        	ld	a,_uc_Test_Page_Now
6088  0ea4 a102          	cp	a,#2
6089  0ea6 2713          	jreq	L3633
6090  0ea8               L5633:
6092  0ea8 7b16          	ld	a,(OFST+0,sp)
6093  0eaa a105          	cp	a,#5
6094  0eac 2523          	jrult	L7533
6096  0eae 7b16          	ld	a,(OFST+0,sp)
6097  0eb0 a109          	cp	a,#9
6098  0eb2 241d          	jruge	L7533
6100  0eb4 c60004        	ld	a,_uc_Test_Page_Now
6101  0eb7 a103          	cp	a,#3
6102  0eb9 2616          	jrne	L7533
6103  0ebb               L3633:
6104                     ; 817 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6106  0ebb 7b16          	ld	a,(OFST+0,sp)
6107  0ebd 5f            	clrw	x
6108  0ebe 97            	ld	xl,a
6109  0ebf 5a            	decw	x
6110  0ec0 a604          	ld	a,#4
6111  0ec2 cd0000        	call	c_smodx
6113  0ec5 d60000        	ld	a,(_LCD_Line,x)
6114  0ec8 cd0000        	call	_Set_LCD_Address
6116                     ; 818 					Display_LCD_String("Fail_HVSen");
6118  0ecb ae0058        	ldw	x,#L1733
6119  0ece cd0000        	call	_Display_LCD_String
6121  0ed1               L7533:
6122                     ; 822 			if(can_diag[4] & (U8)(0x02)){
6124  0ed1 7b07          	ld	a,(OFST-15,sp)
6125  0ed3 a502          	bcp	a,#2
6126  0ed5 273c          	jreq	L3733
6127                     ; 823 				uc_fault_cnt++;
6129  0ed7 0c16          	inc	(OFST+0,sp)
6130                     ; 824 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6130                     ; 825 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6130                     ; 826 				){
6132  0ed9 0d16          	tnz	(OFST+0,sp)
6133  0edb 270d          	jreq	L1043
6135  0edd 7b16          	ld	a,(OFST+0,sp)
6136  0edf a105          	cp	a,#5
6137  0ee1 2407          	jruge	L1043
6139  0ee3 c60004        	ld	a,_uc_Test_Page_Now
6140  0ee6 a102          	cp	a,#2
6141  0ee8 2713          	jreq	L7733
6142  0eea               L1043:
6144  0eea 7b16          	ld	a,(OFST+0,sp)
6145  0eec a105          	cp	a,#5
6146  0eee 2523          	jrult	L3733
6148  0ef0 7b16          	ld	a,(OFST+0,sp)
6149  0ef2 a109          	cp	a,#9
6150  0ef4 241d          	jruge	L3733
6152  0ef6 c60004        	ld	a,_uc_Test_Page_Now
6153  0ef9 a103          	cp	a,#3
6154  0efb 2616          	jrne	L3733
6155  0efd               L7733:
6156                     ; 827 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6158  0efd 7b16          	ld	a,(OFST+0,sp)
6159  0eff 5f            	clrw	x
6160  0f00 97            	ld	xl,a
6161  0f01 5a            	decw	x
6162  0f02 a604          	ld	a,#4
6163  0f04 cd0000        	call	c_smodx
6165  0f07 d60000        	ld	a,(_LCD_Line,x)
6166  0f0a cd0000        	call	_Set_LCD_Address
6168                     ; 828 					Display_LCD_String("Fail_LVSen");
6170  0f0d ae004d        	ldw	x,#L5043
6171  0f10 cd0000        	call	_Display_LCD_String
6173  0f13               L3733:
6174                     ; 832 			if(can_diag[4] & (U8)(0x04)){
6176  0f13 7b07          	ld	a,(OFST-15,sp)
6177  0f15 a504          	bcp	a,#4
6178  0f17 273c          	jreq	L7043
6179                     ; 833 				uc_fault_cnt++;
6181  0f19 0c16          	inc	(OFST+0,sp)
6182                     ; 834 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6182                     ; 835 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6182                     ; 836 				){
6184  0f1b 0d16          	tnz	(OFST+0,sp)
6185  0f1d 270d          	jreq	L5143
6187  0f1f 7b16          	ld	a,(OFST+0,sp)
6188  0f21 a105          	cp	a,#5
6189  0f23 2407          	jruge	L5143
6191  0f25 c60004        	ld	a,_uc_Test_Page_Now
6192  0f28 a102          	cp	a,#2
6193  0f2a 2713          	jreq	L3143
6194  0f2c               L5143:
6196  0f2c 7b16          	ld	a,(OFST+0,sp)
6197  0f2e a105          	cp	a,#5
6198  0f30 2523          	jrult	L7043
6200  0f32 7b16          	ld	a,(OFST+0,sp)
6201  0f34 a109          	cp	a,#9
6202  0f36 241d          	jruge	L7043
6204  0f38 c60004        	ld	a,_uc_Test_Page_Now
6205  0f3b a103          	cp	a,#3
6206  0f3d 2616          	jrne	L7043
6207  0f3f               L3143:
6208                     ; 837 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6210  0f3f 7b16          	ld	a,(OFST+0,sp)
6211  0f41 5f            	clrw	x
6212  0f42 97            	ld	xl,a
6213  0f43 5a            	decw	x
6214  0f44 a604          	ld	a,#4
6215  0f46 cd0000        	call	c_smodx
6217  0f49 d60000        	ld	a,(_LCD_Line,x)
6218  0f4c cd0000        	call	_Set_LCD_Address
6220                     ; 838 					Display_LCD_String("Fail_CurSen");
6222  0f4f ae0041        	ldw	x,#L1243
6223  0f52 cd0000        	call	_Display_LCD_String
6225  0f55               L7043:
6226                     ; 844 			if(can_diag[4] & (U8)(0x08)){
6228  0f55 7b07          	ld	a,(OFST-15,sp)
6229  0f57 a508          	bcp	a,#8
6230  0f59 273c          	jreq	L3243
6231                     ; 846 				uc_fault_cnt++;
6233  0f5b 0c16          	inc	(OFST+0,sp)
6234                     ; 847 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6234                     ; 848 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6234                     ; 849 				){
6236  0f5d 0d16          	tnz	(OFST+0,sp)
6237  0f5f 270d          	jreq	L1343
6239  0f61 7b16          	ld	a,(OFST+0,sp)
6240  0f63 a105          	cp	a,#5
6241  0f65 2407          	jruge	L1343
6243  0f67 c60004        	ld	a,_uc_Test_Page_Now
6244  0f6a a102          	cp	a,#2
6245  0f6c 2713          	jreq	L7243
6246  0f6e               L1343:
6248  0f6e 7b16          	ld	a,(OFST+0,sp)
6249  0f70 a105          	cp	a,#5
6250  0f72 2523          	jrult	L3243
6252  0f74 7b16          	ld	a,(OFST+0,sp)
6253  0f76 a109          	cp	a,#9
6254  0f78 241d          	jruge	L3243
6256  0f7a c60004        	ld	a,_uc_Test_Page_Now
6257  0f7d a103          	cp	a,#3
6258  0f7f 2616          	jrne	L3243
6259  0f81               L7243:
6260                     ; 850 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
6262  0f81 7b16          	ld	a,(OFST+0,sp)
6263  0f83 5f            	clrw	x
6264  0f84 97            	ld	xl,a
6265  0f85 5a            	decw	x
6266  0f86 a604          	ld	a,#4
6267  0f88 cd0000        	call	c_smodx
6269  0f8b d60000        	ld	a,(_LCD_Line,x)
6270  0f8e cd0000        	call	_Set_LCD_Address
6272                     ; 851 					Display_LCD_String("Fail_CoreTemp");
6274  0f91 ae0033        	ldw	x,#L5343
6275  0f94 cd0000        	call	_Display_LCD_String
6277  0f97               L3243:
6278                     ; 857 			if(can_diag[4] & (U8)(0x10)){
6280  0f97 7b07          	ld	a,(OFST-15,sp)
6281  0f99 a510          	bcp	a,#16
6282  0f9b 273c          	jreq	L7343
6283                     ; 859 				uc_fault_cnt++;
6285  0f9d 0c16          	inc	(OFST+0,sp)
6286                     ; 860 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6286                     ; 861 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6286                     ; 862 				){
6288  0f9f 0d16          	tnz	(OFST+0,sp)
6289  0fa1 270d          	jreq	L5443
6291  0fa3 7b16          	ld	a,(OFST+0,sp)
6292  0fa5 a105          	cp	a,#5
6293  0fa7 2407          	jruge	L5443
6295  0fa9 c60004        	ld	a,_uc_Test_Page_Now
6296  0fac a102          	cp	a,#2
6297  0fae 2713          	jreq	L3443
6298  0fb0               L5443:
6300  0fb0 7b16          	ld	a,(OFST+0,sp)
6301  0fb2 a105          	cp	a,#5
6302  0fb4 2523          	jrult	L7343
6304  0fb6 7b16          	ld	a,(OFST+0,sp)
6305  0fb8 a109          	cp	a,#9
6306  0fba 241d          	jruge	L7343
6308  0fbc c60004        	ld	a,_uc_Test_Page_Now
6309  0fbf a103          	cp	a,#3
6310  0fc1 2616          	jrne	L7343
6311  0fc3               L3443:
6312                     ; 863 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6314  0fc3 7b16          	ld	a,(OFST+0,sp)
6315  0fc5 5f            	clrw	x
6316  0fc6 97            	ld	xl,a
6317  0fc7 5a            	decw	x
6318  0fc8 a604          	ld	a,#4
6319  0fca cd0000        	call	c_smodx
6321  0fcd d60000        	ld	a,(_LCD_Line,x)
6322  0fd0 cd0000        	call	_Set_LCD_Address
6324                     ; 864 					Display_LCD_String("Fail_PCB1Temp");
6326  0fd3 ae0025        	ldw	x,#L1543
6327  0fd6 cd0000        	call	_Display_LCD_String
6329  0fd9               L7343:
6330                     ; 870 			if(can_diag[4] & (U8)(0x20)){
6332  0fd9 7b07          	ld	a,(OFST-15,sp)
6333  0fdb a520          	bcp	a,#32
6334  0fdd 273c          	jreq	L3543
6335                     ; 872 				uc_fault_cnt++;
6337  0fdf 0c16          	inc	(OFST+0,sp)
6338                     ; 873 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6338                     ; 874 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6338                     ; 875 				){
6340  0fe1 0d16          	tnz	(OFST+0,sp)
6341  0fe3 270d          	jreq	L1643
6343  0fe5 7b16          	ld	a,(OFST+0,sp)
6344  0fe7 a105          	cp	a,#5
6345  0fe9 2407          	jruge	L1643
6347  0feb c60004        	ld	a,_uc_Test_Page_Now
6348  0fee a102          	cp	a,#2
6349  0ff0 2713          	jreq	L7543
6350  0ff2               L1643:
6352  0ff2 7b16          	ld	a,(OFST+0,sp)
6353  0ff4 a105          	cp	a,#5
6354  0ff6 2523          	jrult	L3543
6356  0ff8 7b16          	ld	a,(OFST+0,sp)
6357  0ffa a109          	cp	a,#9
6358  0ffc 241d          	jruge	L3543
6360  0ffe c60004        	ld	a,_uc_Test_Page_Now
6361  1001 a103          	cp	a,#3
6362  1003 2616          	jrne	L3543
6363  1005               L7543:
6364                     ; 876 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6366  1005 7b16          	ld	a,(OFST+0,sp)
6367  1007 5f            	clrw	x
6368  1008 97            	ld	xl,a
6369  1009 5a            	decw	x
6370  100a a604          	ld	a,#4
6371  100c cd0000        	call	c_smodx
6373  100f d60000        	ld	a,(_LCD_Line,x)
6374  1012 cd0000        	call	_Set_LCD_Address
6376                     ; 877 					Display_LCD_String("Fail_IGBT");
6378  1015 ae001b        	ldw	x,#L5643
6379  1018 cd0000        	call	_Display_LCD_String
6381  101b               L3543:
6382                     ; 881 			if(can_diag[4] & (U8)(0x40)){
6384  101b 7b07          	ld	a,(OFST-15,sp)
6385  101d a540          	bcp	a,#64
6386  101f 273c          	jreq	L7643
6387                     ; 882 				uc_fault_cnt++;
6389  1021 0c16          	inc	(OFST+0,sp)
6390                     ; 883 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6390                     ; 884 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6390                     ; 885 				){
6392  1023 0d16          	tnz	(OFST+0,sp)
6393  1025 270d          	jreq	L5743
6395  1027 7b16          	ld	a,(OFST+0,sp)
6396  1029 a105          	cp	a,#5
6397  102b 2407          	jruge	L5743
6399  102d c60004        	ld	a,_uc_Test_Page_Now
6400  1030 a102          	cp	a,#2
6401  1032 2713          	jreq	L3743
6402  1034               L5743:
6404  1034 7b16          	ld	a,(OFST+0,sp)
6405  1036 a105          	cp	a,#5
6406  1038 2523          	jrult	L7643
6408  103a 7b16          	ld	a,(OFST+0,sp)
6409  103c a109          	cp	a,#9
6410  103e 241d          	jruge	L7643
6412  1040 c60004        	ld	a,_uc_Test_Page_Now
6413  1043 a103          	cp	a,#3
6414  1045 2616          	jrne	L7643
6415  1047               L3743:
6416                     ; 886 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6418  1047 7b16          	ld	a,(OFST+0,sp)
6419  1049 5f            	clrw	x
6420  104a 97            	ld	xl,a
6421  104b 5a            	decw	x
6422  104c a604          	ld	a,#4
6423  104e cd0000        	call	c_smodx
6425  1051 d60000        	ld	a,(_LCD_Line,x)
6426  1054 cd0000        	call	_Set_LCD_Address
6428                     ; 887 					Display_LCD_String("Fail_openLoad");
6430  1057 ae000d        	ldw	x,#L1053
6431  105a cd0000        	call	_Display_LCD_String
6433  105d               L7643:
6434                     ; 891 			if(!uc_fault_cnt){
6436  105d 0d16          	tnz	(OFST+0,sp)
6437  105f 260c          	jrne	L1513
6438                     ; 892 				Set_LCD_Address(LCD_Line[0]);
6440  1061 c60000        	ld	a,_LCD_Line
6441  1064 cd0000        	call	_Set_LCD_Address
6443                     ; 893 				Display_LCD_String("Normal");
6445  1067 ae0006        	ldw	x,#L5053
6446  106a cd0000        	call	_Display_LCD_String
6448  106d               L1513:
6449                     ; 898 	if((b_Com_On_flag == ON)){
6451  106d c6000d        	ld	a,_uc_Test_Ctrl_Reg
6452  1070 a508          	bcp	a,#8
6453  1072 270d          	jreq	L7053
6454                     ; 899 		Set_LCD_Address((unsigned char)(0x00+15));
6456  1074 a60f          	ld	a,#15
6457  1076 cd0000        	call	_Set_LCD_Address
6459                     ; 902 		Display_LCD_String("Y");	// YJS 20230314
6461  1079 ae0004        	ldw	x,#L1153
6462  107c cd0000        	call	_Display_LCD_String
6465  107f 200b          	jra	L3153
6466  1081               L7053:
6467                     ; 904 		Set_LCD_Address((unsigned char)(0x00+15));
6469  1081 a60f          	ld	a,#15
6470  1083 cd0000        	call	_Set_LCD_Address
6472                     ; 905 		Display_LCD_String("N");
6474  1086 ae00c7        	ldw	x,#L7013
6475  1089 cd0000        	call	_Display_LCD_String
6477  108c               L3153:
6478                     ; 908 	return;
6479  108c               L65:
6482  108c 5b16          	addw	sp,#22
6483  108e 81            	ret
6575                     ; 910 static void SU2I_Ctrl_LCD_Display_Control(void)
6575                     ; 911 {
6576                     	switch	.text
6577  108f               L5153_SU2I_Ctrl_LCD_Display_Control:
6579  108f 5216          	subw	sp,#22
6580       00000016      OFST:	set	22
6583                     ; 918 if (HEATER_zone_status==HTR_ZONE_1)
6585  1091 725d0000      	tnz	_HEATER_zone_status
6586  1095 263a          	jrne	L1553
6587                     ; 920 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6589  1097 0f16          	clr	(OFST+0,sp)
6590  1099               L3553:
6591                     ; 922 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
6593  1099 96            	ldw	x,sp
6594  109a 1c000d        	addw	x,#OFST-9
6595  109d 9f            	ld	a,xl
6596  109e 5e            	swapw	x
6597  109f 1b16          	add	a,(OFST+0,sp)
6598  10a1 2401          	jrnc	L221
6599  10a3 5c            	incw	x
6600  10a4               L221:
6601  10a4 02            	rlwa	x,a
6602  10a5 7b16          	ld	a,(OFST+0,sp)
6603  10a7 905f          	clrw	y
6604  10a9 9097          	ld	yl,a
6605  10ab 90d60008      	ld	a,(_uc_Rx_Data+8,y)
6606  10af f7            	ld	(x),a
6607                     ; 923 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
6609  10b0 96            	ldw	x,sp
6610  10b1 1c0003        	addw	x,#OFST-19
6611  10b4 9f            	ld	a,xl
6612  10b5 5e            	swapw	x
6613  10b6 1b16          	add	a,(OFST+0,sp)
6614  10b8 2401          	jrnc	L421
6615  10ba 5c            	incw	x
6616  10bb               L421:
6617  10bb 02            	rlwa	x,a
6618  10bc 7b16          	ld	a,(OFST+0,sp)
6619  10be 905f          	clrw	y
6620  10c0 9097          	ld	yl,a
6621  10c2 90d60018      	ld	a,(_uc_Rx_Data+24,y)
6622  10c6 f7            	ld	(x),a
6623                     ; 920 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6625  10c7 0c16          	inc	(OFST+0,sp)
6628  10c9 7b16          	ld	a,(OFST+0,sp)
6629  10cb a108          	cp	a,#8
6630  10cd 25ca          	jrult	L3553
6632  10cf 2038          	jra	L1653
6633  10d1               L1553:
6634                     ; 928 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6636  10d1 0f16          	clr	(OFST+0,sp)
6637  10d3               L3653:
6638                     ; 930 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
6640  10d3 96            	ldw	x,sp
6641  10d4 1c000d        	addw	x,#OFST-9
6642  10d7 9f            	ld	a,xl
6643  10d8 5e            	swapw	x
6644  10d9 1b16          	add	a,(OFST+0,sp)
6645  10db 2401          	jrnc	L621
6646  10dd 5c            	incw	x
6647  10de               L621:
6648  10de 02            	rlwa	x,a
6649  10df 7b16          	ld	a,(OFST+0,sp)
6650  10e1 905f          	clrw	y
6651  10e3 9097          	ld	yl,a
6652  10e5 90d60010      	ld	a,(_uc_Rx_Data+16,y)
6653  10e9 f7            	ld	(x),a
6654                     ; 931 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
6656  10ea 96            	ldw	x,sp
6657  10eb 1c0003        	addw	x,#OFST-19
6658  10ee 9f            	ld	a,xl
6659  10ef 5e            	swapw	x
6660  10f0 1b16          	add	a,(OFST+0,sp)
6661  10f2 2401          	jrnc	L031
6662  10f4 5c            	incw	x
6663  10f5               L031:
6664  10f5 02            	rlwa	x,a
6665  10f6 7b16          	ld	a,(OFST+0,sp)
6666  10f8 905f          	clrw	y
6667  10fa 9097          	ld	yl,a
6668  10fc 90d60018      	ld	a,(_uc_Rx_Data+24,y)
6669  1100 f7            	ld	(x),a
6670                     ; 928 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6672  1101 0c16          	inc	(OFST+0,sp)
6675  1103 7b16          	ld	a,(OFST+0,sp)
6676  1105 a108          	cp	a,#8
6677  1107 25ca          	jrult	L3653
6678  1109               L1653:
6679                     ; 934 	if(b_Test_Option_flag == ON){
6681  1109 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6682  110c a510          	bcp	a,#16
6683  110e 2779          	jreq	L1753
6684                     ; 935 		Set_LCD_Address(LCD_Line[0]);
6686  1110 c60000        	ld	a,_LCD_Line
6687  1113 cd0000        	call	_Set_LCD_Address
6689                     ; 936 		Display_LCD_String("*OPTION*");
6691  1116 ae012d        	ldw	x,#L1252
6692  1119 cd0000        	call	_Display_LCD_String
6694                     ; 938 		if(uc_Target_Display_Mode == (U8)(0)){
6696  111c 725d0000      	tnz	_uc_Target_Display_Mode
6697  1120 260e          	jrne	L3753
6698                     ; 939 			Set_LCD_Address(LCD_Line[1]);
6700  1122 c60001        	ld	a,_LCD_Line+1
6701  1125 cd0000        	call	_Set_LCD_Address
6703                     ; 940 			Display_LCD_String("*Target Perc");
6705  1128 ae0120        	ldw	x,#L5252
6706  112b cd0000        	call	_Display_LCD_String
6709  112e 200c          	jra	L5753
6710  1130               L3753:
6711                     ; 943 			Set_LCD_Address(LCD_Line[1]);
6713  1130 c60001        	ld	a,_LCD_Line+1
6714  1133 cd0000        	call	_Set_LCD_Address
6716                     ; 944 			Display_LCD_String("*Target Watt(OS)");
6718  1136 ae010f        	ldw	x,#L1352
6719  1139 cd0000        	call	_Display_LCD_String
6721  113c               L5753:
6722                     ; 947 		Set_LCD_Address(LCD_Line[2]);
6724  113c c60002        	ld	a,_LCD_Line+2
6725  113f cd0000        	call	_Set_LCD_Address
6727                     ; 948 		Display_LCD_String("D_Unit:");
6729  1142 ae0107        	ldw	x,#L3352
6730  1145 cd0000        	call	_Display_LCD_String
6732                     ; 950 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
6734  1148 c60002        	ld	a,_LCD_Line+2
6735  114b ab07          	add	a,#7
6736  114d cd0000        	call	_Set_LCD_Address
6738                     ; 951 		if(b_Blink_250_Flag){
6740  1150 c60000        	ld	a,_uc_LCD_Blink_Reg
6741  1153 a502          	bcp	a,#2
6742  1155 272e          	jreq	L7753
6743                     ; 952 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
6745  1157 c60001        	ld	a,_uc_Perc_Unit
6746  115a 44            	srl	a
6747  115b 5f            	clrw	x
6748  115c 97            	ld	xl,a
6749  115d cd0000        	call	_Num_Display_LCD
6751                     ; 953 			Display_LCD_String(".");
6753  1160 ae0105        	ldw	x,#L7352
6754  1163 cd0000        	call	_Display_LCD_String
6756                     ; 954 			uc_buffer = uc_Perc_Unit %(U8)(2);
6758  1166 c60001        	ld	a,_uc_Perc_Unit
6759  1169 a401          	and	a,#1
6760  116b 6b16          	ld	(OFST+0,sp),a
6761                     ; 955 			if(uc_buffer){ Display_LCD_String("5"); }
6763  116d 0d16          	tnz	(OFST+0,sp)
6764  116f 2708          	jreq	L1063
6767  1171 ae0103        	ldw	x,#L3452
6768  1174 cd0000        	call	_Display_LCD_String
6771  1177 2006          	jra	L3063
6772  1179               L1063:
6773                     ; 956 			else{ Display_LCD_String("0"); }
6775  1179 ae0101        	ldw	x,#L7452
6776  117c cd0000        	call	_Display_LCD_String
6778  117f               L3063:
6779                     ; 957 			Display_LCD_String("%");
6781  117f ae00ff        	ldw	x,#L1552
6782  1182 cd0000        	call	_Display_LCD_String
6784  1185               L7753:
6785                     ; 959 		return;
6787  1185 acac1bac      	jpf	L431
6788  1189               L1753:
6789                     ; 962 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
6791  1189 c60004        	ld	a,_uc_Test_Page_Now
6792  118c c10003        	cp	a,_uc_Test_Page_Pre
6793  118f 270f          	jreq	L5063
6794                     ; 963 		Test_Ctrl_Text_Display_Handling(); 
6796  1191 cd0479        	call	_Test_Ctrl_Text_Display_Handling
6798                     ; 964 		b_Data_Select_flag = OFF;
6800  1194 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
6801                     ; 965 		b_Data_Setting_flag = OFF;
6803  1198 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
6804                     ; 966 		uc_Test_Data_Select_Num = (U8)(0);
6806  119c 725f0002      	clr	_uc_Test_Data_Select_Num
6807  11a0               L5063:
6808                     ; 968 	uc_Test_Page_Pre = uc_Test_Page_Now ;
6810  11a0 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
6811                     ; 971 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
6813  11a5 725d0004      	tnz	_uc_Test_Page_Now
6814  11a9 2703          	jreq	L631
6815  11ab cc1721        	jp	L7063
6816  11ae               L631:
6817                     ; 972 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
6819  11ae 0f15          	clr	(OFST-1,sp)
6820  11b0               L1163:
6821                     ; 974 			Set_LCD_Address(LCD_Line[uc_line_index]);
6823  11b0 7b15          	ld	a,(OFST-1,sp)
6824  11b2 5f            	clrw	x
6825  11b3 97            	ld	xl,a
6826  11b4 d60000        	ld	a,(_LCD_Line,x)
6827  11b7 cd0000        	call	_Set_LCD_Address
6829                     ; 976 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
6831  11ba c6000d        	ld	a,_uc_Test_Ctrl_Reg
6832  11bd a502          	bcp	a,#2
6833  11bf 2763          	jreq	L7163
6835  11c1 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6836  11c4 a504          	bcp	a,#4
6837  11c6 265c          	jrne	L7163
6838                     ; 977 				if(uc_line_index == uc_Test_Data_Select_Num){ 
6840  11c8 7b15          	ld	a,(OFST-1,sp)
6841  11ca c10002        	cp	a,_uc_Test_Data_Select_Num
6842  11cd 2647          	jrne	L1263
6843                     ; 978 					if(uc_Test_Data_Select_Num == (U8)(0)){
6845  11cf 725d0002      	tnz	_uc_Test_Data_Select_Num
6846  11d3 261d          	jrne	L3263
6847                     ; 979 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
6849  11d5 c60000        	ld	a,_uc_LCD_Blink_Reg
6850  11d8 a502          	bcp	a,#2
6851  11da 270e          	jreq	L5263
6854  11dc 7b15          	ld	a,(OFST-1,sp)
6855  11de 97            	ld	xl,a
6856  11df a610          	ld	a,#16
6857  11e1 42            	mul	x,a
6858  11e2 1c0000        	addw	x,#_LCD_Dis_Data
6859  11e5 cd0000        	call	_Display_LCD_String
6862  11e8 2046          	jra	L3463
6863  11ea               L5263:
6864                     ; 980 						else{ Display_LCD_String("        /"); }
6866  11ea ae00f5        	ldw	x,#L7752
6867  11ed cd0000        	call	_Display_LCD_String
6869  11f0 203e          	jra	L3463
6870  11f2               L3263:
6871                     ; 982 					else if(uc_Test_Data_Select_Num == (U8)(1)){
6873  11f2 c60002        	ld	a,_uc_Test_Data_Select_Num
6874  11f5 a101          	cp	a,#1
6875  11f7 2637          	jrne	L3463
6876                     ; 983 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
6878  11f9 c60000        	ld	a,_uc_LCD_Blink_Reg
6879  11fc a502          	bcp	a,#2
6880  11fe 270e          	jreq	L5363
6883  1200 7b15          	ld	a,(OFST-1,sp)
6884  1202 97            	ld	xl,a
6885  1203 a610          	ld	a,#16
6886  1205 42            	mul	x,a
6887  1206 1c0000        	addw	x,#_LCD_Dis_Data
6888  1209 cd0000        	call	_Display_LCD_String
6891  120c 2022          	jra	L3463
6892  120e               L5363:
6893                     ; 984 						else{ Display_LCD_String("        Fd:"); }
6895  120e ae00e9        	ldw	x,#L1162
6896  1211 cd0000        	call	_Display_LCD_String
6898  1214 201a          	jra	L3463
6899  1216               L1263:
6900                     ; 987 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
6902  1216 7b15          	ld	a,(OFST-1,sp)
6903  1218 97            	ld	xl,a
6904  1219 a610          	ld	a,#16
6905  121b 42            	mul	x,a
6906  121c 1c0000        	addw	x,#_LCD_Dis_Data
6907  121f cd0000        	call	_Display_LCD_String
6909  1222 200c          	jra	L3463
6910  1224               L7163:
6911                     ; 988 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
6913  1224 7b15          	ld	a,(OFST-1,sp)
6914  1226 97            	ld	xl,a
6915  1227 a610          	ld	a,#16
6916  1229 42            	mul	x,a
6917  122a 1c0000        	addw	x,#_LCD_Dis_Data
6918  122d cd0000        	call	_Display_LCD_String
6920  1230               L3463:
6921                     ; 991 			if(uc_line_index == (U8)(0)){		// LINE 1
6923  1230 0d15          	tnz	(OFST-1,sp)
6924  1232 2703          	jreq	L041
6925  1234 cc12f0        	jp	L5463
6926  1237               L041:
6927                     ; 994 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
6929  1237 7b15          	ld	a,(OFST-1,sp)
6930  1239 5f            	clrw	x
6931  123a 97            	ld	xl,a
6932  123b d60000        	ld	a,(_LCD_Line,x)
6933  123e ab03          	add	a,#3
6934  1240 cd0000        	call	_Set_LCD_Address
6936                     ; 996 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
6938  1243 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6939  1246 a504          	bcp	a,#4
6940  1248 2718          	jreq	L7463
6942  124a 7b15          	ld	a,(OFST-1,sp)
6943  124c c10002        	cp	a,_uc_Test_Data_Select_Num
6944  124f 2611          	jrne	L7463
6945                     ; 997 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
6947  1251 c60000        	ld	a,_uc_LCD_Blink_Reg
6948  1254 a502          	bcp	a,#2
6949  1256 2712          	jreq	L3563
6952  1258 c60009        	ld	a,_uc_Heater_Enable_Flag
6953  125b 5f            	clrw	x
6954  125c 97            	ld	xl,a
6955  125d cd0000        	call	_Num_Display_LCD
6957  1260 2008          	jra	L3563
6958  1262               L7463:
6959                     ; 998 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
6961  1262 c60009        	ld	a,_uc_Heater_Enable_Flag
6962  1265 5f            	clrw	x
6963  1266 97            	ld	xl,a
6964  1267 cd0000        	call	_Num_Display_LCD
6966  126a               L3563:
6967                     ; 1002 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
6969  126a 7b15          	ld	a,(OFST-1,sp)
6970  126c 5f            	clrw	x
6971  126d 97            	ld	xl,a
6972  126e d60000        	ld	a,(_LCD_Line,x)
6973  1271 ab05          	add	a,#5
6974  1273 cd0000        	call	_Set_LCD_Address
6976                     ; 1003 				if (HEATER_zone_status == HTR_ZONE_1)
6978  1276 725d0000      	tnz	_HEATER_zone_status
6979  127a 2608          	jrne	L5563
6980                     ; 1004 				Display_LCD_String("Z1");
6982  127c ae00e6        	ldw	x,#L1362
6983  127f cd0000        	call	_Display_LCD_String
6986  1282 2006          	jra	L7563
6987  1284               L5563:
6988                     ; 1005 				else Display_LCD_String("Z2");
6990  1284 ae00e3        	ldw	x,#L5362
6991  1287 cd0000        	call	_Display_LCD_String
6993  128a               L7563:
6994                     ; 1007 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
6996  128a 7b15          	ld	a,(OFST-1,sp)
6997  128c 5f            	clrw	x
6998  128d 97            	ld	xl,a
6999  128e d60000        	ld	a,(_LCD_Line,x)
7000  1291 ab09          	add	a,#9
7001  1293 cd0000        	call	_Set_LCD_Address
7003                     ; 1009 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7005  1296 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7006  1299 a501          	bcp	a,#1
7007  129b 270a          	jreq	L1663
7010  129d ae00e0        	ldw	x,#L1462
7011  12a0 cd0000        	call	_Display_LCD_String
7014  12a3 ac121712      	jpf	L3073
7015  12a7               L1663:
7016                     ; 1011 					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
7018  12a7 7b0d          	ld	a,(OFST-9,sp)
7019  12a9 a40c          	and	a,#12
7020  12ab 44            	srl	a
7021  12ac 44            	srl	a
7022  12ad 6b16          	ld	(OFST+0,sp),a
7023                     ; 1012 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
7025  12af 0d16          	tnz	(OFST+0,sp)
7026  12b1 260a          	jrne	L5663
7029  12b3 ae00db        	ldw	x,#L7462
7030  12b6 cd0000        	call	_Display_LCD_String
7033  12b9 ac121712      	jpf	L3073
7034  12bd               L5663:
7035                     ; 1013 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
7037  12bd 7b16          	ld	a,(OFST+0,sp)
7038  12bf a101          	cp	a,#1
7039  12c1 260a          	jrne	L1763
7042  12c3 ae00d6        	ldw	x,#L5562
7043  12c6 cd0000        	call	_Display_LCD_String
7046  12c9 ac121712      	jpf	L3073
7047  12cd               L1763:
7048                     ; 1014 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
7050  12cd 7b16          	ld	a,(OFST+0,sp)
7051  12cf a102          	cp	a,#2
7052  12d1 260a          	jrne	L5763
7055  12d3 ae00d2        	ldw	x,#L3662
7056  12d6 cd0000        	call	_Display_LCD_String
7059  12d9 ac121712      	jpf	L3073
7060  12dd               L5763:
7061                     ; 1015 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
7063  12dd 7b16          	ld	a,(OFST+0,sp)
7064  12df a103          	cp	a,#3
7065  12e1 2703          	jreq	L241
7066  12e3 cc1712        	jp	L3073
7067  12e6               L241:
7070  12e6 ae00cd        	ldw	x,#L1762
7071  12e9 cd0000        	call	_Display_LCD_String
7073  12ec ac121712      	jpf	L3073
7074  12f0               L5463:
7075                     ; 1021 			else if(uc_line_index == (U8)(1)){	// LINE 2
7077  12f0 7b15          	ld	a,(OFST-1,sp)
7078  12f2 a101          	cp	a,#1
7079  12f4 2703          	jreq	L441
7080  12f6 cc1605        	jp	L5073
7081  12f9               L441:
7082                     ; 1024 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7084  12f9 7b15          	ld	a,(OFST-1,sp)
7085  12fb 5f            	clrw	x
7086  12fc 97            	ld	xl,a
7087  12fd d60000        	ld	a,(_LCD_Line,x)
7088  1300 ab03          	add	a,#3
7089  1302 cd0000        	call	_Set_LCD_Address
7091                     ; 1025 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
7093  1305 c6000d        	ld	a,_uc_Test_Ctrl_Reg
7094  1308 a504          	bcp	a,#4
7095  130a 2603          	jrne	L641
7096  130c cc1473        	jp	L7073
7097  130f               L641:
7099  130f 7b15          	ld	a,(OFST-1,sp)
7100  1311 c10002        	cp	a,_uc_Test_Data_Select_Num
7101  1314 2703          	jreq	L051
7102  1316 cc1473        	jp	L7073
7103  1319               L051:
7104                     ; 1026 					if(b_Blink_250_Flag){
7106  1319 c60000        	ld	a,_uc_LCD_Blink_Reg
7107  131c a502          	bcp	a,#2
7108  131e 2603          	jrne	L251
7109  1320 cc15b3        	jp	L3004
7110  1323               L251:
7111                     ; 1027 						if(!uc_Target_Display_Mode){	// Percentage_Display
7113  1323 725d0000      	tnz	_uc_Target_Display_Mode
7114  1327 2676          	jrne	L3173
7115                     ; 1028 if (HEATER_zone_status == HTR_ZONE_1)
7117  1329 725d0000      	tnz	_HEATER_zone_status
7118  132d 2638          	jrne	L5173
7119                     ; 1030 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
7121  132f c6000a        	ld	a,_uc_Target_Duty_Perc
7122  1332 44            	srl	a
7123  1333 5f            	clrw	x
7124  1334 97            	ld	xl,a
7125  1335 cd0000        	call	_Num_Display_LCD
7127                     ; 1031 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
7129  1338 c6000a        	ld	a,_uc_Target_Duty_Perc
7130  133b a1c8          	cp	a,#200
7131  133d 2503          	jrult	L451
7132  133f cc15b3        	jp	L3004
7133  1342               L451:
7134                     ; 1032 								Display_LCD_String(".");
7136  1342 ae0105        	ldw	x,#L7352
7137  1345 cd0000        	call	_Display_LCD_String
7139                     ; 1033 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
7141  1348 c6000a        	ld	a,_uc_Target_Duty_Perc
7142  134b a401          	and	a,#1
7143  134d 6b16          	ld	(OFST+0,sp),a
7144                     ; 1034 								if(uc_buffer){ Display_LCD_String("5"); }
7146  134f 0d16          	tnz	(OFST+0,sp)
7147  1351 270a          	jreq	L1273
7150  1353 ae0103        	ldw	x,#L3452
7151  1356 cd0000        	call	_Display_LCD_String
7154  1359 acb315b3      	jpf	L3004
7155  135d               L1273:
7156                     ; 1035 								else{ Display_LCD_String("0"); }
7158  135d ae0101        	ldw	x,#L7452
7159  1360 cd0000        	call	_Display_LCD_String
7161  1363 acb315b3      	jpf	L3004
7162  1367               L5173:
7163                     ; 1040 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
7165  1367 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7166  136a 44            	srl	a
7167  136b 5f            	clrw	x
7168  136c 97            	ld	xl,a
7169  136d cd0000        	call	_Num_Display_LCD
7171                     ; 1041 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
7173  1370 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7174  1373 a1c8          	cp	a,#200
7175  1375 2503          	jrult	L651
7176  1377 cc15b3        	jp	L3004
7177  137a               L651:
7178                     ; 1042 								Display_LCD_String(".");
7180  137a ae0105        	ldw	x,#L7352
7181  137d cd0000        	call	_Display_LCD_String
7183                     ; 1043 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
7185  1380 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7186  1383 a401          	and	a,#1
7187  1385 6b16          	ld	(OFST+0,sp),a
7188                     ; 1044 								if(uc_buffer){ Display_LCD_String("5"); }
7190  1387 0d16          	tnz	(OFST+0,sp)
7191  1389 270a          	jreq	L1373
7194  138b ae0103        	ldw	x,#L3452
7195  138e cd0000        	call	_Display_LCD_String
7198  1391 acb315b3      	jpf	L3004
7199  1395               L1373:
7200                     ; 1045 								else{ Display_LCD_String("0"); }
7202  1395 ae0101        	ldw	x,#L7452
7203  1398 cd0000        	call	_Display_LCD_String
7205  139b acb315b3      	jpf	L3004
7206  139f               L3173:
7207                     ; 1050 if (HEATER_zone_status == HTR_ZONE_1)
7209  139f 725d0000      	tnz	_HEATER_zone_status
7210  13a3 2667          	jrne	L7373
7211                     ; 1052 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
7213  13a5 c6000a        	ld	a,_uc_Target_Duty_Perc
7214  13a8 a114          	cp	a,#20
7215  13aa 2408          	jruge	L1473
7218  13ac 5f            	clrw	x
7219  13ad cd0000        	call	_Num_Display_LCD
7222  13b0 acb315b3      	jpf	L3004
7223  13b4               L1473:
7224                     ; 1053 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
7226  13b4 c6000a        	ld	a,_uc_Target_Duty_Perc
7227  13b7 a114          	cp	a,#20
7228  13b9 260a          	jrne	L5473
7231  13bb ae0064        	ldw	x,#100
7232  13be cd0000        	call	_Num_Display_LCD
7235  13c1 acb315b3      	jpf	L3004
7236  13c5               L5473:
7237                     ; 1054 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
7239  13c5 c6000a        	ld	a,_uc_Target_Duty_Perc
7240  13c8 a1b4          	cp	a,#180
7241  13ca 260a          	jrne	L1573
7244  13cc ae1838        	ldw	x,#6200
7245  13cf cd0000        	call	_Num_Display_LCD
7248  13d2 acb315b3      	jpf	L3004
7249  13d6               L1573:
7250                     ; 1055 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
7252  13d6 c6000a        	ld	a,_uc_Target_Duty_Perc
7253  13d9 a1be          	cp	a,#190
7254  13db 260a          	jrne	L5573
7257  13dd ae00c9        	ldw	x,#L7472
7258  13e0 cd0000        	call	_Display_LCD_String
7261  13e3 acb315b3      	jpf	L3004
7262  13e7               L5573:
7263                     ; 1056 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7265  13e7 c6000a        	ld	a,_uc_Target_Duty_Perc
7266  13ea 5f            	clrw	x
7267  13eb 97            	ld	xl,a
7268  13ec 1d0014        	subw	x,#20
7269  13ef 90ae94ed      	ldw	y,#38125
7270  13f3 cd0000        	call	c_umul
7272  13f6 ae0000        	ldw	x,#L25
7273  13f9 cd0000        	call	c_ludv
7275  13fc be02          	ldw	x,c_lreg+2
7276  13fe 1c0064        	addw	x,#100
7277  1401 1f0b          	ldw	(OFST-11,sp),x
7280  1403 1e0b          	ldw	x,(OFST-11,sp)
7281  1405 cd0000        	call	_Num_Display_LCD
7283  1408 acb315b3      	jpf	L3004
7284  140c               L7373:
7285                     ; 1060 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
7287  140c c6000b        	ld	a,_uc_Target_Duty_Perc+1
7288  140f a114          	cp	a,#20
7289  1411 2408          	jruge	L3673
7292  1413 5f            	clrw	x
7293  1414 cd0000        	call	_Num_Display_LCD
7296  1417 acb315b3      	jpf	L3004
7297  141b               L3673:
7298                     ; 1061 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
7300  141b c6000b        	ld	a,_uc_Target_Duty_Perc+1
7301  141e a114          	cp	a,#20
7302  1420 260a          	jrne	L7673
7305  1422 ae0064        	ldw	x,#100
7306  1425 cd0000        	call	_Num_Display_LCD
7309  1428 acb315b3      	jpf	L3004
7310  142c               L7673:
7311                     ; 1062 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
7313  142c c6000b        	ld	a,_uc_Target_Duty_Perc+1
7314  142f a1b4          	cp	a,#180
7315  1431 260a          	jrne	L3773
7318  1433 ae1838        	ldw	x,#6200
7319  1436 cd0000        	call	_Num_Display_LCD
7322  1439 acb315b3      	jpf	L3004
7323  143d               L3773:
7324                     ; 1063 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
7326  143d c6000b        	ld	a,_uc_Target_Duty_Perc+1
7327  1440 a1be          	cp	a,#190
7328  1442 260a          	jrne	L7773
7331  1444 ae00c9        	ldw	x,#L7472
7332  1447 cd0000        	call	_Display_LCD_String
7335  144a acb315b3      	jpf	L3004
7336  144e               L7773:
7337                     ; 1064 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7339  144e c6000b        	ld	a,_uc_Target_Duty_Perc+1
7340  1451 5f            	clrw	x
7341  1452 97            	ld	xl,a
7342  1453 1d0014        	subw	x,#20
7343  1456 90ae94ed      	ldw	y,#38125
7344  145a cd0000        	call	c_umul
7346  145d ae0000        	ldw	x,#L25
7347  1460 cd0000        	call	c_ludv
7349  1463 be02          	ldw	x,c_lreg+2
7350  1465 1c0064        	addw	x,#100
7351  1468 1f0b          	ldw	(OFST-11,sp),x
7354  146a 1e0b          	ldw	x,(OFST-11,sp)
7355  146c cd0000        	call	_Num_Display_LCD
7357  146f acb315b3      	jpf	L3004
7358  1473               L7073:
7359                     ; 1069 					if(!uc_Target_Display_Mode){
7361  1473 725d0000      	tnz	_uc_Target_Display_Mode
7362  1477 2676          	jrne	L5004
7363                     ; 1070 if (HEATER_zone_status == HTR_ZONE_1)
7365  1479 725d0000      	tnz	_HEATER_zone_status
7366  147d 2638          	jrne	L7004
7367                     ; 1072 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
7369  147f c6000a        	ld	a,_uc_Target_Duty_Perc
7370  1482 44            	srl	a
7371  1483 5f            	clrw	x
7372  1484 97            	ld	xl,a
7373  1485 cd0000        	call	_Num_Display_LCD
7375                     ; 1073 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
7377  1488 c6000a        	ld	a,_uc_Target_Duty_Perc
7378  148b a1c8          	cp	a,#200
7379  148d 2503          	jrult	L061
7380  148f cc15b3        	jp	L3004
7381  1492               L061:
7382                     ; 1074 							Display_LCD_String(".");
7384  1492 ae0105        	ldw	x,#L7352
7385  1495 cd0000        	call	_Display_LCD_String
7387                     ; 1075 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
7389  1498 c6000a        	ld	a,_uc_Target_Duty_Perc
7390  149b a401          	and	a,#1
7391  149d 6b16          	ld	(OFST+0,sp),a
7392                     ; 1076 							if(uc_buffer){ Display_LCD_String("5"); }
7394  149f 0d16          	tnz	(OFST+0,sp)
7395  14a1 270a          	jreq	L3104
7398  14a3 ae0103        	ldw	x,#L3452
7399  14a6 cd0000        	call	_Display_LCD_String
7402  14a9 acb315b3      	jpf	L3004
7403  14ad               L3104:
7404                     ; 1077 							else{ Display_LCD_String("0"); }
7406  14ad ae0101        	ldw	x,#L7452
7407  14b0 cd0000        	call	_Display_LCD_String
7409  14b3 acb315b3      	jpf	L3004
7410  14b7               L7004:
7411                     ; 1082 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
7413  14b7 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7414  14ba 44            	srl	a
7415  14bb 5f            	clrw	x
7416  14bc 97            	ld	xl,a
7417  14bd cd0000        	call	_Num_Display_LCD
7419                     ; 1083 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
7421  14c0 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7422  14c3 a1c8          	cp	a,#200
7423  14c5 2503          	jrult	L261
7424  14c7 cc15b3        	jp	L3004
7425  14ca               L261:
7426                     ; 1084 							Display_LCD_String(".");
7428  14ca ae0105        	ldw	x,#L7352
7429  14cd cd0000        	call	_Display_LCD_String
7431                     ; 1085 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
7433  14d0 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7434  14d3 a401          	and	a,#1
7435  14d5 6b16          	ld	(OFST+0,sp),a
7436                     ; 1086 							if(uc_buffer){ Display_LCD_String("5"); }
7438  14d7 0d16          	tnz	(OFST+0,sp)
7439  14d9 270a          	jreq	L3204
7442  14db ae0103        	ldw	x,#L3452
7443  14de cd0000        	call	_Display_LCD_String
7446  14e1 acb315b3      	jpf	L3004
7447  14e5               L3204:
7448                     ; 1087 							else{ Display_LCD_String("0"); }
7450  14e5 ae0101        	ldw	x,#L7452
7451  14e8 cd0000        	call	_Display_LCD_String
7453  14eb acb315b3      	jpf	L3004
7454  14ef               L5004:
7455                     ; 1092 if (HEATER_zone_status == HTR_ZONE_1)
7457  14ef 725d0000      	tnz	_HEATER_zone_status
7458  14f3 2663          	jrne	L1304
7459                     ; 1094 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
7461  14f5 c6000a        	ld	a,_uc_Target_Duty_Perc
7462  14f8 a114          	cp	a,#20
7463  14fa 2408          	jruge	L3304
7466  14fc 5f            	clrw	x
7467  14fd cd0000        	call	_Num_Display_LCD
7470  1500 acb315b3      	jpf	L3004
7471  1504               L3304:
7472                     ; 1095 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
7474  1504 c6000a        	ld	a,_uc_Target_Duty_Perc
7475  1507 a114          	cp	a,#20
7476  1509 260a          	jrne	L7304
7479  150b ae0064        	ldw	x,#100
7480  150e cd0000        	call	_Num_Display_LCD
7483  1511 acb315b3      	jpf	L3004
7484  1515               L7304:
7485                     ; 1096 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
7487  1515 c6000a        	ld	a,_uc_Target_Duty_Perc
7488  1518 a1b4          	cp	a,#180
7489  151a 260a          	jrne	L3404
7492  151c ae1838        	ldw	x,#6200
7493  151f cd0000        	call	_Num_Display_LCD
7496  1522 acb315b3      	jpf	L3004
7497  1526               L3404:
7498                     ; 1097 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
7500  1526 c6000a        	ld	a,_uc_Target_Duty_Perc
7501  1529 a1b5          	cp	a,#181
7502  152b 2508          	jrult	L7404
7505  152d ae00c9        	ldw	x,#L7472
7506  1530 cd0000        	call	_Display_LCD_String
7509  1533 207e          	jra	L3004
7510  1535               L7404:
7511                     ; 1098 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7513  1535 c6000a        	ld	a,_uc_Target_Duty_Perc
7514  1538 5f            	clrw	x
7515  1539 97            	ld	xl,a
7516  153a 1d0014        	subw	x,#20
7517  153d 90ae94ed      	ldw	y,#38125
7518  1541 cd0000        	call	c_umul
7520  1544 ae0000        	ldw	x,#L25
7521  1547 cd0000        	call	c_ludv
7523  154a be02          	ldw	x,c_lreg+2
7524  154c 1c0064        	addw	x,#100
7525  154f 1f0b          	ldw	(OFST-11,sp),x
7528  1551 1e0b          	ldw	x,(OFST-11,sp)
7529  1553 cd0000        	call	_Num_Display_LCD
7531  1556 205b          	jra	L3004
7532  1558               L1304:
7533                     ; 1102 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
7535  1558 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7536  155b a114          	cp	a,#20
7537  155d 2406          	jruge	L5504
7540  155f 5f            	clrw	x
7541  1560 cd0000        	call	_Num_Display_LCD
7544  1563 204e          	jra	L3004
7545  1565               L5504:
7546                     ; 1103 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
7548  1565 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7549  1568 a114          	cp	a,#20
7550  156a 2608          	jrne	L1604
7553  156c ae0064        	ldw	x,#100
7554  156f cd0000        	call	_Num_Display_LCD
7557  1572 203f          	jra	L3004
7558  1574               L1604:
7559                     ; 1104 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
7561  1574 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7562  1577 a1b4          	cp	a,#180
7563  1579 2608          	jrne	L5604
7566  157b ae1838        	ldw	x,#6200
7567  157e cd0000        	call	_Num_Display_LCD
7570  1581 2030          	jra	L3004
7571  1583               L5604:
7572                     ; 1105 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
7574  1583 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7575  1586 a1b5          	cp	a,#181
7576  1588 2508          	jrult	L1704
7579  158a ae00c9        	ldw	x,#L7472
7580  158d cd0000        	call	_Display_LCD_String
7583  1590 2021          	jra	L3004
7584  1592               L1704:
7585                     ; 1106 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7587  1592 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7588  1595 5f            	clrw	x
7589  1596 97            	ld	xl,a
7590  1597 1d0014        	subw	x,#20
7591  159a 90ae94ed      	ldw	y,#38125
7592  159e cd0000        	call	c_umul
7594  15a1 ae0000        	ldw	x,#L25
7595  15a4 cd0000        	call	c_ludv
7597  15a7 be02          	ldw	x,c_lreg+2
7598  15a9 1c0064        	addw	x,#100
7599  15ac 1f0b          	ldw	(OFST-11,sp),x
7602  15ae 1e0b          	ldw	x,(OFST-11,sp)
7603  15b0 cd0000        	call	_Num_Display_LCD
7605  15b3               L3004:
7606                     ; 1112 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7608  15b3 7b15          	ld	a,(OFST-1,sp)
7609  15b5 5f            	clrw	x
7610  15b6 97            	ld	xl,a
7611  15b7 d60000        	ld	a,(_LCD_Line,x)
7612  15ba ab0b          	add	a,#11
7613  15bc cd0000        	call	_Set_LCD_Address
7615                     ; 1113 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7617  15bf c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7618  15c2 a501          	bcp	a,#1
7619  15c4 270a          	jreq	L5704
7622  15c6 ae00e0        	ldw	x,#L1462
7623  15c9 cd0000        	call	_Display_LCD_String
7626  15cc ac121712      	jpf	L3073
7627  15d0               L5704:
7628                     ; 1115 					Num_Display_LCD(can_data[4] /(U8)(2));
7630  15d0 7b11          	ld	a,(OFST-5,sp)
7631  15d2 44            	srl	a
7632  15d3 5f            	clrw	x
7633  15d4 97            	ld	xl,a
7634  15d5 cd0000        	call	_Num_Display_LCD
7636                     ; 1116 					if(can_data[6] < (U8)(200)){
7638  15d8 7b13          	ld	a,(OFST-3,sp)
7639  15da a1c8          	cp	a,#200
7640  15dc 2503          	jrult	L461
7641  15de cc1712        	jp	L3073
7642  15e1               L461:
7643                     ; 1117 						Display_LCD_String(".");
7645  15e1 ae0105        	ldw	x,#L7352
7646  15e4 cd0000        	call	_Display_LCD_String
7648                     ; 1118 						uc_buffer = can_data[4] % (U8)(2);
7650  15e7 7b11          	ld	a,(OFST-5,sp)
7651  15e9 a401          	and	a,#1
7652  15eb 6b16          	ld	(OFST+0,sp),a
7653                     ; 1119 						if(uc_buffer){ Display_LCD_String("5"); }
7655  15ed 0d16          	tnz	(OFST+0,sp)
7656  15ef 270a          	jreq	L3014
7659  15f1 ae0103        	ldw	x,#L3452
7660  15f4 cd0000        	call	_Display_LCD_String
7663  15f7 ac121712      	jpf	L3073
7664  15fb               L3014:
7665                     ; 1120 						else{ Display_LCD_String("0"); }
7667  15fb ae0101        	ldw	x,#L7452
7668  15fe cd0000        	call	_Display_LCD_String
7670  1601 ac121712      	jpf	L3073
7671  1605               L5073:
7672                     ; 1126 			else if(uc_line_index == (U8)(2)){	// LINE 3
7674  1605 7b15          	ld	a,(OFST-1,sp)
7675  1607 a102          	cp	a,#2
7676  1609 2703          	jreq	L661
7677  160b cc1699        	jp	L1114
7678  160e               L661:
7679                     ; 1129 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
7681  160e 7b15          	ld	a,(OFST-1,sp)
7682  1610 5f            	clrw	x
7683  1611 97            	ld	xl,a
7684  1612 d60000        	ld	a,(_LCD_Line,x)
7685  1615 ab02          	add	a,#2
7686  1617 cd0000        	call	_Set_LCD_Address
7688                     ; 1130 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
7690  161a c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7691  161d a501          	bcp	a,#1
7692  161f 2708          	jreq	L3114
7695  1621 ae00c7        	ldw	x,#L7013
7696  1624 cd0000        	call	_Display_LCD_String
7699  1627 2014          	jra	L5114
7700  1629               L3114:
7701                     ; 1132 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
7703  1629 7b0d          	ld	a,(OFST-9,sp)
7704  162b a501          	bcp	a,#1
7705  162d 2708          	jreq	L7114
7708  162f ae00c5        	ldw	x,#L5113
7709  1632 cd0000        	call	_Display_LCD_String
7712  1635 2006          	jra	L5114
7713  1637               L7114:
7714                     ; 1133 					else{ Display_LCD_String("0"); }
7716  1637 ae0101        	ldw	x,#L7452
7717  163a cd0000        	call	_Display_LCD_String
7719  163d               L5114:
7720                     ; 1136 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
7722  163d 7b15          	ld	a,(OFST-1,sp)
7723  163f 5f            	clrw	x
7724  1640 97            	ld	xl,a
7725  1641 d60000        	ld	a,(_LCD_Line,x)
7726  1644 ab06          	add	a,#6
7727  1646 cd0000        	call	_Set_LCD_Address
7729                     ; 1137 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
7731  1649 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7732  164c a502          	bcp	a,#2
7733  164e 2708          	jreq	L3214
7736  1650 ae00c7        	ldw	x,#L7013
7737  1653 cd0000        	call	_Display_LCD_String
7740  1656 2014          	jra	L5214
7741  1658               L3214:
7742                     ; 1139 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
7744  1658 7b03          	ld	a,(OFST-19,sp)
7745  165a a501          	bcp	a,#1
7746  165c 2708          	jreq	L7214
7749  165e ae00c5        	ldw	x,#L5113
7750  1661 cd0000        	call	_Display_LCD_String
7753  1664 2006          	jra	L5214
7754  1666               L7214:
7755                     ; 1140 					else{ Display_LCD_String("0"); }
7757  1666 ae0101        	ldw	x,#L7452
7758  1669 cd0000        	call	_Display_LCD_String
7760  166c               L5214:
7761                     ; 1143 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7763  166c 7b15          	ld	a,(OFST-1,sp)
7764  166e 5f            	clrw	x
7765  166f 97            	ld	xl,a
7766  1670 d60000        	ld	a,(_LCD_Line,x)
7767  1673 ab0b          	add	a,#11
7768  1675 cd0000        	call	_Set_LCD_Address
7770                     ; 1144 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7772  1678 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7773  167b a501          	bcp	a,#1
7774  167d 270a          	jreq	L3314
7777  167f ae00e0        	ldw	x,#L1462
7778  1682 cd0000        	call	_Display_LCD_String
7781  1685 ac121712      	jpf	L3073
7782  1689               L3314:
7783                     ; 1147 					ui_buffer = (U16)(uc_Rx_Data[0][3]) * (U16)(4);//YJS 2->4
7785  1689 c60003        	ld	a,_uc_Rx_Data+3
7786  168c 97            	ld	xl,a
7787  168d a604          	ld	a,#4
7788  168f 42            	mul	x,a
7789  1690 1f0b          	ldw	(OFST-11,sp),x
7790                     ; 1148 					Num_Display_LCD(ui_buffer);
7792  1692 1e0b          	ldw	x,(OFST-11,sp)
7793  1694 cd0000        	call	_Num_Display_LCD
7795  1697 2079          	jra	L3073
7796  1699               L1114:
7797                     ; 1154 			else if(uc_line_index == (U8)(3)){	// LINE 4
7799  1699 7b15          	ld	a,(OFST-1,sp)
7800  169b a103          	cp	a,#3
7801  169d 2673          	jrne	L3073
7802                     ; 1157 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7804  169f 7b15          	ld	a,(OFST-1,sp)
7805  16a1 5f            	clrw	x
7806  16a2 97            	ld	xl,a
7807  16a3 d60000        	ld	a,(_LCD_Line,x)
7808  16a6 ab03          	add	a,#3
7809  16a8 cd0000        	call	_Set_LCD_Address
7811                     ; 1159 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7813  16ab c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7814  16ae a501          	bcp	a,#1
7815  16b0 2708          	jreq	L3414
7818  16b2 ae00e0        	ldw	x,#L1462
7819  16b5 cd0000        	call	_Display_LCD_String
7822  16b8 2027          	jra	L5414
7823  16ba               L3414:
7824                     ; 1161 					Num_Display_LCD(can_data[6] / (U8)(5));
7826  16ba 7b13          	ld	a,(OFST-3,sp)
7827  16bc 5f            	clrw	x
7828  16bd 97            	ld	xl,a
7829  16be a605          	ld	a,#5
7830  16c0 cd0000        	call	c_sdivx
7832  16c3 cd0000        	call	_Num_Display_LCD
7834                     ; 1162 					Display_LCD_String(".");
7836  16c6 ae0105        	ldw	x,#L7352
7837  16c9 cd0000        	call	_Display_LCD_String
7839                     ; 1163 					uc_buffer = can_data[6] % (U8)(5);
7841  16cc 7b13          	ld	a,(OFST-3,sp)
7842  16ce ae0005        	ldw	x,#5
7843  16d1 51            	exgw	x,y
7844  16d2 5f            	clrw	x
7845  16d3 97            	ld	xl,a
7846  16d4 65            	divw	x,y
7847  16d5 909f          	ld	a,yl
7848  16d7 6b16          	ld	(OFST+0,sp),a
7849                     ; 1164 					Num_Display_LCD(uc_buffer * (U8)(2));
7851  16d9 7b16          	ld	a,(OFST+0,sp)
7852  16db 5f            	clrw	x
7853  16dc 97            	ld	xl,a
7854  16dd 58            	sllw	x
7855  16de cd0000        	call	_Num_Display_LCD
7857  16e1               L5414:
7858                     ; 1170 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7860  16e1 7b15          	ld	a,(OFST-1,sp)
7861  16e3 5f            	clrw	x
7862  16e4 97            	ld	xl,a
7863  16e5 d60000        	ld	a,(_LCD_Line,x)
7864  16e8 ab0b          	add	a,#11
7865  16ea cd0000        	call	_Set_LCD_Address
7867                     ; 1172 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7869  16ed c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7870  16f0 a501          	bcp	a,#1
7871  16f2 2708          	jreq	L7414
7874  16f4 ae00e0        	ldw	x,#L1462
7875  16f7 cd0000        	call	_Display_LCD_String
7878  16fa 2016          	jra	L3073
7879  16fc               L7414:
7880                     ; 1174 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
7882  16fc 7b0f          	ld	a,(OFST-7,sp)
7883  16fe 5f            	clrw	x
7884  16ff 97            	ld	xl,a
7885  1700 1f01          	ldw	(OFST-21,sp),x
7886  1702 7b10          	ld	a,(OFST-6,sp)
7887  1704 5f            	clrw	x
7888  1705 97            	ld	xl,a
7889  1706 4f            	clr	a
7890  1707 02            	rlwa	x,a
7891  1708 72fb01        	addw	x,(OFST-21,sp)
7892  170b 1f0b          	ldw	(OFST-11,sp),x
7893                     ; 1175 					Num_Display_LCD(ui_buffer);
7895  170d 1e0b          	ldw	x,(OFST-11,sp)
7896  170f cd0000        	call	_Num_Display_LCD
7898  1712               L3073:
7899                     ; 972 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
7901  1712 0c15          	inc	(OFST-1,sp)
7904  1714 7b15          	ld	a,(OFST-1,sp)
7905  1716 a104          	cp	a,#4
7906  1718 2403          	jruge	L071
7907  171a cc11b0        	jp	L1163
7908  171d               L071:
7910  171d ac8d1b8d      	jpf	L3514
7911  1721               L7063:
7912                     ; 1185 	else if(uc_Test_Page_Now == (U8)(1)){
7914  1721 c60004        	ld	a,_uc_Test_Page_Now
7915  1724 a101          	cp	a,#1
7916  1726 2703          	jreq	L271
7917  1728 cc17c8        	jp	L5514
7918  172b               L271:
7919                     ; 1186 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
7921  172b 0f15          	clr	(OFST-1,sp)
7922  172d               L7514:
7923                     ; 1188 			Set_LCD_Address(LCD_Line[uc_line_index]);
7925  172d 7b15          	ld	a,(OFST-1,sp)
7926  172f 5f            	clrw	x
7927  1730 97            	ld	xl,a
7928  1731 d60000        	ld	a,(_LCD_Line,x)
7929  1734 cd0000        	call	_Set_LCD_Address
7931                     ; 1189 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
7933  1737 7b15          	ld	a,(OFST-1,sp)
7934  1739 97            	ld	xl,a
7935  173a a610          	ld	a,#16
7936  173c 42            	mul	x,a
7937  173d 1c0000        	addw	x,#_LCD_Dis_Data
7938  1740 cd0000        	call	_Display_LCD_String
7940                     ; 1192 			if(uc_line_index == (U8)(0)){		// LINE 1
7942  1743 0d15          	tnz	(OFST-1,sp)
7943  1745 2641          	jrne	L5614
7944                     ; 1195 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7946  1747 7b15          	ld	a,(OFST-1,sp)
7947  1749 5f            	clrw	x
7948  174a 97            	ld	xl,a
7949  174b d60000        	ld	a,(_LCD_Line,x)
7950  174e ab03          	add	a,#3
7951  1750 cd0000        	call	_Set_LCD_Address
7953                     ; 1196 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7955  1753 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7956  1756 a501          	bcp	a,#1
7957  1758 2708          	jreq	L7614
7960  175a ae00e0        	ldw	x,#L1462
7961  175d cd0000        	call	_Display_LCD_String
7964  1760 2026          	jra	L5614
7965  1762               L7614:
7966                     ; 1198 					if(can_data[1] < (U8)(40)){
7968  1762 7b0e          	ld	a,(OFST-8,sp)
7969  1764 a128          	cp	a,#40
7970  1766 2416          	jruge	L3714
7971                     ; 1199 						Display_LCD_String("-");
7973  1768 ae00c3        	ldw	x,#L3713
7974  176b cd0000        	call	_Display_LCD_String
7976                     ; 1200 						Num_Display_LCD((U8)(40) - can_data[1]);
7978  176e a600          	ld	a,#0
7979  1770 97            	ld	xl,a
7980  1771 a628          	ld	a,#40
7981  1773 100e          	sub	a,(OFST-8,sp)
7982  1775 2401          	jrnc	L231
7983  1777 5a            	decw	x
7984  1778               L231:
7985  1778 02            	rlwa	x,a
7986  1779 cd0000        	call	_Num_Display_LCD
7989  177c 200a          	jra	L5614
7990  177e               L3714:
7991                     ; 1203 						Num_Display_LCD(can_data[1] - (U8)(40));
7993  177e 7b0e          	ld	a,(OFST-8,sp)
7994  1780 5f            	clrw	x
7995  1781 97            	ld	xl,a
7996  1782 1d0028        	subw	x,#40
7997  1785 cd0000        	call	_Num_Display_LCD
7999  1788               L5614:
8000                     ; 1209 			if(uc_line_index == (U8)(1)){		// LINE 2
8002  1788 7b15          	ld	a,(OFST-1,sp)
8003  178a a101          	cp	a,#1
8004  178c 2623          	jrne	L7714
8005                     ; 1212 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
8007  178e 7b15          	ld	a,(OFST-1,sp)
8008  1790 5f            	clrw	x
8009  1791 97            	ld	xl,a
8010  1792 d60000        	ld	a,(_LCD_Line,x)
8011  1795 ab04          	add	a,#4
8012  1797 cd0000        	call	_Set_LCD_Address
8014                     ; 1213 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
8016  179a c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8017  179d a502          	bcp	a,#2
8018  179f 2708          	jreq	L1024
8021  17a1 ae00e0        	ldw	x,#L1462
8022  17a4 cd0000        	call	_Display_LCD_String
8025  17a7 2008          	jra	L7714
8026  17a9               L1024:
8027                     ; 1216 					Num_Display_LCD(uc_Rx_Data[0][7]);  				//SoftWare Version Display
8029  17a9 c60007        	ld	a,_uc_Rx_Data+7
8030  17ac 5f            	clrw	x
8031  17ad 97            	ld	xl,a
8032  17ae cd0000        	call	_Num_Display_LCD
8034  17b1               L7714:
8035                     ; 1228 			if(uc_line_index == (U8)(2)){		// LINE 2
8037  17b1 7b15          	ld	a,(OFST-1,sp)
8038  17b3 a102          	cp	a,#2
8039                     ; 1233 			if(uc_line_index == (U8)(3)){		// LINE 3
8041  17b5 7b15          	ld	a,(OFST-1,sp)
8042  17b7 a103          	cp	a,#3
8043                     ; 1186 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
8045  17b9 0c15          	inc	(OFST-1,sp)
8048  17bb 7b15          	ld	a,(OFST-1,sp)
8049  17bd a104          	cp	a,#4
8050  17bf 2403          	jruge	L471
8051  17c1 cc172d        	jp	L7514
8052  17c4               L471:
8054  17c4 ac8d1b8d      	jpf	L3514
8055  17c8               L5514:
8056                     ; 1240 		if(b_Rx2_Msg_TimeOut_Flag){
8058  17c8 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8059  17cb a502          	bcp	a,#2
8060  17cd 2710          	jreq	L3124
8061                     ; 1241 			Set_LCD_Address(LCD_Line[0]);	
8063  17cf c60000        	ld	a,_LCD_Line
8064  17d2 cd0000        	call	_Set_LCD_Address
8066                     ; 1242 			Display_LCD_String("NC");
8068  17d5 ae00e0        	ldw	x,#L1462
8069  17d8 cd0000        	call	_Display_LCD_String
8072  17db ac8d1b8d      	jpf	L3514
8073  17df               L3124:
8074                     ; 1245 			uc_fault_cnt = (U8)(0);
8076  17df 0f16          	clr	(OFST+0,sp)
8077                     ; 1247 			if(can_diag[0] & (U8)(0x02)){
8079  17e1 7b03          	ld	a,(OFST-19,sp)
8080  17e3 a502          	bcp	a,#2
8081  17e5 273c          	jreq	L7124
8082                     ; 1248 				uc_fault_cnt++;
8084  17e7 0c16          	inc	(OFST+0,sp)
8085                     ; 1249 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8085                     ; 1250 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8085                     ; 1251 				){
8087  17e9 0d16          	tnz	(OFST+0,sp)
8088  17eb 270d          	jreq	L5224
8090  17ed 7b16          	ld	a,(OFST+0,sp)
8091  17ef a105          	cp	a,#5
8092  17f1 2407          	jruge	L5224
8094  17f3 c60004        	ld	a,_uc_Test_Page_Now
8095  17f6 a102          	cp	a,#2
8096  17f8 2713          	jreq	L3224
8097  17fa               L5224:
8099  17fa 7b16          	ld	a,(OFST+0,sp)
8100  17fc a105          	cp	a,#5
8101  17fe 2523          	jrult	L7124
8103  1800 7b16          	ld	a,(OFST+0,sp)
8104  1802 a109          	cp	a,#9
8105  1804 241d          	jruge	L7124
8107  1806 c60004        	ld	a,_uc_Test_Page_Now
8108  1809 a103          	cp	a,#3
8109  180b 2616          	jrne	L7124
8110  180d               L3224:
8111                     ; 1252 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8113  180d 7b16          	ld	a,(OFST+0,sp)
8114  180f 5f            	clrw	x
8115  1810 97            	ld	xl,a
8116  1811 5a            	decw	x
8117  1812 a604          	ld	a,#4
8118  1814 cd0000        	call	c_smodx
8120  1817 d60000        	ld	a,(_LCD_Line,x)
8121  181a cd0000        	call	_Set_LCD_Address
8123                     ; 1253 					Display_LCD_String("Flt_LVLow");
8125  181d ae00b9        	ldw	x,#L1323
8126  1820 cd0000        	call	_Display_LCD_String
8128  1823               L7124:
8129                     ; 1257 			if(can_diag[0] & (U8)(0x04)){
8131  1823 7b03          	ld	a,(OFST-19,sp)
8132  1825 a504          	bcp	a,#4
8133  1827 273c          	jreq	L1324
8134                     ; 1258 				uc_fault_cnt++;
8136  1829 0c16          	inc	(OFST+0,sp)
8137                     ; 1259 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8137                     ; 1260 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8137                     ; 1261 				){
8139  182b 0d16          	tnz	(OFST+0,sp)
8140  182d 270d          	jreq	L7324
8142  182f 7b16          	ld	a,(OFST+0,sp)
8143  1831 a105          	cp	a,#5
8144  1833 2407          	jruge	L7324
8146  1835 c60004        	ld	a,_uc_Test_Page_Now
8147  1838 a102          	cp	a,#2
8148  183a 2713          	jreq	L5324
8149  183c               L7324:
8151  183c 7b16          	ld	a,(OFST+0,sp)
8152  183e a105          	cp	a,#5
8153  1840 2523          	jrult	L1324
8155  1842 7b16          	ld	a,(OFST+0,sp)
8156  1844 a109          	cp	a,#9
8157  1846 241d          	jruge	L1324
8159  1848 c60004        	ld	a,_uc_Test_Page_Now
8160  184b a103          	cp	a,#3
8161  184d 2616          	jrne	L1324
8162  184f               L5324:
8163                     ; 1262 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8165  184f 7b16          	ld	a,(OFST+0,sp)
8166  1851 5f            	clrw	x
8167  1852 97            	ld	xl,a
8168  1853 5a            	decw	x
8169  1854 a604          	ld	a,#4
8170  1856 cd0000        	call	c_smodx
8172  1859 d60000        	ld	a,(_LCD_Line,x)
8173  185c cd0000        	call	_Set_LCD_Address
8175                     ; 1263 					Display_LCD_String("Flt_LVHigh");
8177  185f ae00ae        	ldw	x,#L5423
8178  1862 cd0000        	call	_Display_LCD_String
8180  1865               L1324:
8181                     ; 1267 			if(can_diag[0] & (U8)(0x08)){
8183  1865 7b03          	ld	a,(OFST-19,sp)
8184  1867 a508          	bcp	a,#8
8185  1869 273c          	jreq	L3424
8186                     ; 1268 				uc_fault_cnt++;
8188  186b 0c16          	inc	(OFST+0,sp)
8189                     ; 1269 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8189                     ; 1270 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8189                     ; 1271 				){
8191  186d 0d16          	tnz	(OFST+0,sp)
8192  186f 270d          	jreq	L1524
8194  1871 7b16          	ld	a,(OFST+0,sp)
8195  1873 a105          	cp	a,#5
8196  1875 2407          	jruge	L1524
8198  1877 c60004        	ld	a,_uc_Test_Page_Now
8199  187a a102          	cp	a,#2
8200  187c 2713          	jreq	L7424
8201  187e               L1524:
8203  187e 7b16          	ld	a,(OFST+0,sp)
8204  1880 a105          	cp	a,#5
8205  1882 2523          	jrult	L3424
8207  1884 7b16          	ld	a,(OFST+0,sp)
8208  1886 a109          	cp	a,#9
8209  1888 241d          	jruge	L3424
8211  188a c60004        	ld	a,_uc_Test_Page_Now
8212  188d a103          	cp	a,#3
8213  188f 2616          	jrne	L3424
8214  1891               L7424:
8215                     ; 1272 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8217  1891 7b16          	ld	a,(OFST+0,sp)
8218  1893 5f            	clrw	x
8219  1894 97            	ld	xl,a
8220  1895 5a            	decw	x
8221  1896 a604          	ld	a,#4
8222  1898 cd0000        	call	c_smodx
8224  189b d60000        	ld	a,(_LCD_Line,x)
8225  189e cd0000        	call	_Set_LCD_Address
8227                     ; 1273 					Display_LCD_String("Flt_HVLow");
8229  18a1 ae00a4        	ldw	x,#L1623
8230  18a4 cd0000        	call	_Display_LCD_String
8232  18a7               L3424:
8233                     ; 1277 			if(can_diag[0] & (U8)(0x10)){
8235  18a7 7b03          	ld	a,(OFST-19,sp)
8236  18a9 a510          	bcp	a,#16
8237  18ab 273c          	jreq	L5524
8238                     ; 1278 				uc_fault_cnt++;
8240  18ad 0c16          	inc	(OFST+0,sp)
8241                     ; 1279 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8241                     ; 1280 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8241                     ; 1281 				){
8243  18af 0d16          	tnz	(OFST+0,sp)
8244  18b1 270d          	jreq	L3624
8246  18b3 7b16          	ld	a,(OFST+0,sp)
8247  18b5 a105          	cp	a,#5
8248  18b7 2407          	jruge	L3624
8250  18b9 c60004        	ld	a,_uc_Test_Page_Now
8251  18bc a102          	cp	a,#2
8252  18be 2713          	jreq	L1624
8253  18c0               L3624:
8255  18c0 7b16          	ld	a,(OFST+0,sp)
8256  18c2 a105          	cp	a,#5
8257  18c4 2523          	jrult	L5524
8259  18c6 7b16          	ld	a,(OFST+0,sp)
8260  18c8 a109          	cp	a,#9
8261  18ca 241d          	jruge	L5524
8263  18cc c60004        	ld	a,_uc_Test_Page_Now
8264  18cf a103          	cp	a,#3
8265  18d1 2616          	jrne	L5524
8266  18d3               L1624:
8267                     ; 1282 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
8269  18d3 7b16          	ld	a,(OFST+0,sp)
8270  18d5 5f            	clrw	x
8271  18d6 97            	ld	xl,a
8272  18d7 5a            	decw	x
8273  18d8 a604          	ld	a,#4
8274  18da cd0000        	call	c_smodx
8276  18dd d60000        	ld	a,(_LCD_Line,x)
8277  18e0 cd0000        	call	_Set_LCD_Address
8279                     ; 1283 					Display_LCD_String("Flt_HVHigh");
8281  18e3 ae0099        	ldw	x,#L5723
8282  18e6 cd0000        	call	_Display_LCD_String
8284  18e9               L5524:
8285                     ; 1287 			if(can_data[7] & (U8)(0x2)){
8287  18e9 7b14          	ld	a,(OFST-2,sp)
8288  18eb a502          	bcp	a,#2
8289  18ed 273c          	jreq	L7624
8290                     ; 1288 				uc_fault_cnt++;
8292  18ef 0c16          	inc	(OFST+0,sp)
8293                     ; 1289 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8293                     ; 1290 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8293                     ; 1291 				){
8295  18f1 0d16          	tnz	(OFST+0,sp)
8296  18f3 270d          	jreq	L5724
8298  18f5 7b16          	ld	a,(OFST+0,sp)
8299  18f7 a105          	cp	a,#5
8300  18f9 2407          	jruge	L5724
8302  18fb c60004        	ld	a,_uc_Test_Page_Now
8303  18fe a102          	cp	a,#2
8304  1900 2713          	jreq	L3724
8305  1902               L5724:
8307  1902 7b16          	ld	a,(OFST+0,sp)
8308  1904 a105          	cp	a,#5
8309  1906 2523          	jrult	L7624
8311  1908 7b16          	ld	a,(OFST+0,sp)
8312  190a a109          	cp	a,#9
8313  190c 241d          	jruge	L7624
8315  190e c60004        	ld	a,_uc_Test_Page_Now
8316  1911 a103          	cp	a,#3
8317  1913 2616          	jrne	L7624
8318  1915               L3724:
8319                     ; 1292 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8321  1915 7b16          	ld	a,(OFST+0,sp)
8322  1917 5f            	clrw	x
8323  1918 97            	ld	xl,a
8324  1919 5a            	decw	x
8325  191a a604          	ld	a,#4
8326  191c cd0000        	call	c_smodx
8328  191f d60000        	ld	a,(_LCD_Line,x)
8329  1922 cd0000        	call	_Set_LCD_Address
8331                     ; 1293 					Display_LCD_String("Flt_OverCur");
8333  1925 ae008d        	ldw	x,#L1133
8334  1928 cd0000        	call	_Display_LCD_String
8336  192b               L7624:
8337                     ; 1296 			if(can_data[7] & (U8)(0x1)){
8339  192b 7b14          	ld	a,(OFST-2,sp)
8340  192d a501          	bcp	a,#1
8341  192f 273c          	jreq	L1034
8342                     ; 1297 				uc_fault_cnt++;
8344  1931 0c16          	inc	(OFST+0,sp)
8345                     ; 1298 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8345                     ; 1299 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8345                     ; 1300 				){
8347  1933 0d16          	tnz	(OFST+0,sp)
8348  1935 270d          	jreq	L7034
8350  1937 7b16          	ld	a,(OFST+0,sp)
8351  1939 a105          	cp	a,#5
8352  193b 2407          	jruge	L7034
8354  193d c60004        	ld	a,_uc_Test_Page_Now
8355  1940 a102          	cp	a,#2
8356  1942 2713          	jreq	L5034
8357  1944               L7034:
8359  1944 7b16          	ld	a,(OFST+0,sp)
8360  1946 a105          	cp	a,#5
8361  1948 2523          	jrult	L1034
8363  194a 7b16          	ld	a,(OFST+0,sp)
8364  194c a109          	cp	a,#9
8365  194e 241d          	jruge	L1034
8367  1950 c60004        	ld	a,_uc_Test_Page_Now
8368  1953 a103          	cp	a,#3
8369  1955 2616          	jrne	L1034
8370  1957               L5034:
8371                     ; 1301 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8373  1957 7b16          	ld	a,(OFST+0,sp)
8374  1959 5f            	clrw	x
8375  195a 97            	ld	xl,a
8376  195b 5a            	decw	x
8377  195c a604          	ld	a,#4
8378  195e cd0000        	call	c_smodx
8380  1961 d60000        	ld	a,(_LCD_Line,x)
8381  1964 cd0000        	call	_Set_LCD_Address
8383                     ; 1302 					Display_LCD_String("Flt_ThmShut");
8385  1967 ae0081        	ldw	x,#L5233
8386  196a cd0000        	call	_Display_LCD_String
8388  196d               L1034:
8389                     ; 1306 			if(can_diag[1] & (U8)(0x1)){
8391  196d 7b04          	ld	a,(OFST-18,sp)
8392  196f a501          	bcp	a,#1
8393  1971 273c          	jreq	L3134
8394                     ; 1307 				uc_fault_cnt++;
8396  1973 0c16          	inc	(OFST+0,sp)
8397                     ; 1308 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8397                     ; 1309 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8397                     ; 1310 				){
8399  1975 0d16          	tnz	(OFST+0,sp)
8400  1977 270d          	jreq	L1234
8402  1979 7b16          	ld	a,(OFST+0,sp)
8403  197b a105          	cp	a,#5
8404  197d 2407          	jruge	L1234
8406  197f c60004        	ld	a,_uc_Test_Page_Now
8407  1982 a102          	cp	a,#2
8408  1984 2713          	jreq	L7134
8409  1986               L1234:
8411  1986 7b16          	ld	a,(OFST+0,sp)
8412  1988 a105          	cp	a,#5
8413  198a 2523          	jrult	L3134
8415  198c 7b16          	ld	a,(OFST+0,sp)
8416  198e a109          	cp	a,#9
8417  1990 241d          	jruge	L3134
8419  1992 c60004        	ld	a,_uc_Test_Page_Now
8420  1995 a103          	cp	a,#3
8421  1997 2616          	jrne	L3134
8422  1999               L7134:
8423                     ; 1311 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
8425  1999 7b16          	ld	a,(OFST+0,sp)
8426  199b 5f            	clrw	x
8427  199c 97            	ld	xl,a
8428  199d 5a            	decw	x
8429  199e a604          	ld	a,#4
8430  19a0 cd0000        	call	c_smodx
8432  19a3 d60000        	ld	a,(_LCD_Line,x)
8433  19a6 cd0000        	call	_Set_LCD_Address
8435                     ; 1312 					Display_LCD_String("Flt_PCBThmShut");
8437  19a9 ae0072        	ldw	x,#L1433
8438  19ac cd0000        	call	_Display_LCD_String
8440  19af               L3134:
8441                     ; 1316 			if(can_diag[1] & (U8)(0x10)){
8443  19af 7b04          	ld	a,(OFST-18,sp)
8444  19b1 a510          	bcp	a,#16
8445  19b3 273c          	jreq	L5234
8446                     ; 1317 				uc_fault_cnt++;
8448  19b5 0c16          	inc	(OFST+0,sp)
8449                     ; 1318 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8449                     ; 1319 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8449                     ; 1320 				){
8451  19b7 0d16          	tnz	(OFST+0,sp)
8452  19b9 270d          	jreq	L3334
8454  19bb 7b16          	ld	a,(OFST+0,sp)
8455  19bd a105          	cp	a,#5
8456  19bf 2407          	jruge	L3334
8458  19c1 c60004        	ld	a,_uc_Test_Page_Now
8459  19c4 a102          	cp	a,#2
8460  19c6 2713          	jreq	L1334
8461  19c8               L3334:
8463  19c8 7b16          	ld	a,(OFST+0,sp)
8464  19ca a105          	cp	a,#5
8465  19cc 2523          	jrult	L5234
8467  19ce 7b16          	ld	a,(OFST+0,sp)
8468  19d0 a109          	cp	a,#9
8469  19d2 241d          	jruge	L5234
8471  19d4 c60004        	ld	a,_uc_Test_Page_Now
8472  19d7 a103          	cp	a,#3
8473  19d9 2616          	jrne	L5234
8474  19db               L1334:
8475                     ; 1321 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8477  19db 7b16          	ld	a,(OFST+0,sp)
8478  19dd 5f            	clrw	x
8479  19de 97            	ld	xl,a
8480  19df 5a            	decw	x
8481  19e0 a604          	ld	a,#4
8482  19e2 cd0000        	call	c_smodx
8484  19e5 d60000        	ld	a,(_LCD_Line,x)
8485  19e8 cd0000        	call	_Set_LCD_Address
8487                     ; 1322 					Display_LCD_String("Flt_MsgTimeOut");
8489  19eb ae0063        	ldw	x,#L5533
8490  19ee cd0000        	call	_Display_LCD_String
8492  19f1               L5234:
8493                     ; 1326 			if(can_diag[1] & (U8)(0x04)){
8495  19f1 7b04          	ld	a,(OFST-18,sp)
8496  19f3 a504          	bcp	a,#4
8497  19f5 273c          	jreq	L7334
8498                     ; 1327 				uc_fault_cnt++;
8500  19f7 0c16          	inc	(OFST+0,sp)
8501                     ; 1328 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8501                     ; 1329 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8501                     ; 1330 				){
8503  19f9 0d16          	tnz	(OFST+0,sp)
8504  19fb 270d          	jreq	L5434
8506  19fd 7b16          	ld	a,(OFST+0,sp)
8507  19ff a105          	cp	a,#5
8508  1a01 2407          	jruge	L5434
8510  1a03 c60004        	ld	a,_uc_Test_Page_Now
8511  1a06 a102          	cp	a,#2
8512  1a08 2713          	jreq	L3434
8513  1a0a               L5434:
8515  1a0a 7b16          	ld	a,(OFST+0,sp)
8516  1a0c a105          	cp	a,#5
8517  1a0e 2523          	jrult	L7334
8519  1a10 7b16          	ld	a,(OFST+0,sp)
8520  1a12 a109          	cp	a,#9
8521  1a14 241d          	jruge	L7334
8523  1a16 c60004        	ld	a,_uc_Test_Page_Now
8524  1a19 a103          	cp	a,#3
8525  1a1b 2616          	jrne	L7334
8526  1a1d               L3434:
8527                     ; 1331 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8529  1a1d 7b16          	ld	a,(OFST+0,sp)
8530  1a1f 5f            	clrw	x
8531  1a20 97            	ld	xl,a
8532  1a21 5a            	decw	x
8533  1a22 a604          	ld	a,#4
8534  1a24 cd0000        	call	c_smodx
8536  1a27 d60000        	ld	a,(_LCD_Line,x)
8537  1a2a cd0000        	call	_Set_LCD_Address
8539                     ; 1332 					Display_LCD_String("Fail_HVSen");
8541  1a2d ae0058        	ldw	x,#L1733
8542  1a30 cd0000        	call	_Display_LCD_String
8544  1a33               L7334:
8545                     ; 1336 			if(can_diag[1] & (U8)(0x02)){
8547  1a33 7b04          	ld	a,(OFST-18,sp)
8548  1a35 a502          	bcp	a,#2
8549  1a37 273c          	jreq	L1534
8550                     ; 1337 				uc_fault_cnt++;
8552  1a39 0c16          	inc	(OFST+0,sp)
8553                     ; 1338 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8553                     ; 1339 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8553                     ; 1340 				){
8555  1a3b 0d16          	tnz	(OFST+0,sp)
8556  1a3d 270d          	jreq	L7534
8558  1a3f 7b16          	ld	a,(OFST+0,sp)
8559  1a41 a105          	cp	a,#5
8560  1a43 2407          	jruge	L7534
8562  1a45 c60004        	ld	a,_uc_Test_Page_Now
8563  1a48 a102          	cp	a,#2
8564  1a4a 2713          	jreq	L5534
8565  1a4c               L7534:
8567  1a4c 7b16          	ld	a,(OFST+0,sp)
8568  1a4e a105          	cp	a,#5
8569  1a50 2523          	jrult	L1534
8571  1a52 7b16          	ld	a,(OFST+0,sp)
8572  1a54 a109          	cp	a,#9
8573  1a56 241d          	jruge	L1534
8575  1a58 c60004        	ld	a,_uc_Test_Page_Now
8576  1a5b a103          	cp	a,#3
8577  1a5d 2616          	jrne	L1534
8578  1a5f               L5534:
8579                     ; 1341 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8581  1a5f 7b16          	ld	a,(OFST+0,sp)
8582  1a61 5f            	clrw	x
8583  1a62 97            	ld	xl,a
8584  1a63 5a            	decw	x
8585  1a64 a604          	ld	a,#4
8586  1a66 cd0000        	call	c_smodx
8588  1a69 d60000        	ld	a,(_LCD_Line,x)
8589  1a6c cd0000        	call	_Set_LCD_Address
8591                     ; 1342 					Display_LCD_String("Fail_LVSen");
8593  1a6f ae004d        	ldw	x,#L5043
8594  1a72 cd0000        	call	_Display_LCD_String
8596  1a75               L1534:
8597                     ; 1346 			if(can_data[7] & (U8)(0x04)){
8599  1a75 7b14          	ld	a,(OFST-2,sp)
8600  1a77 a504          	bcp	a,#4
8601  1a79 273c          	jreq	L3634
8602                     ; 1347 				uc_fault_cnt++;
8604  1a7b 0c16          	inc	(OFST+0,sp)
8605                     ; 1348 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8605                     ; 1349 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8605                     ; 1350 				){
8607  1a7d 0d16          	tnz	(OFST+0,sp)
8608  1a7f 270d          	jreq	L1734
8610  1a81 7b16          	ld	a,(OFST+0,sp)
8611  1a83 a105          	cp	a,#5
8612  1a85 2407          	jruge	L1734
8614  1a87 c60004        	ld	a,_uc_Test_Page_Now
8615  1a8a a102          	cp	a,#2
8616  1a8c 2713          	jreq	L7634
8617  1a8e               L1734:
8619  1a8e 7b16          	ld	a,(OFST+0,sp)
8620  1a90 a105          	cp	a,#5
8621  1a92 2523          	jrult	L3634
8623  1a94 7b16          	ld	a,(OFST+0,sp)
8624  1a96 a109          	cp	a,#9
8625  1a98 241d          	jruge	L3634
8627  1a9a c60004        	ld	a,_uc_Test_Page_Now
8628  1a9d a103          	cp	a,#3
8629  1a9f 2616          	jrne	L3634
8630  1aa1               L7634:
8631                     ; 1351 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8633  1aa1 7b16          	ld	a,(OFST+0,sp)
8634  1aa3 5f            	clrw	x
8635  1aa4 97            	ld	xl,a
8636  1aa5 5a            	decw	x
8637  1aa6 a604          	ld	a,#4
8638  1aa8 cd0000        	call	c_smodx
8640  1aab d60000        	ld	a,(_LCD_Line,x)
8641  1aae cd0000        	call	_Set_LCD_Address
8643                     ; 1352 					Display_LCD_String("Fail_CurSen");
8645  1ab1 ae0041        	ldw	x,#L1243
8646  1ab4 cd0000        	call	_Display_LCD_String
8648  1ab7               L3634:
8649                     ; 1358 			if(can_data[7] & (U8)(0x08)){
8651  1ab7 7b14          	ld	a,(OFST-2,sp)
8652  1ab9 a508          	bcp	a,#8
8653  1abb 273c          	jreq	L5734
8654                     ; 1360 				uc_fault_cnt++;
8656  1abd 0c16          	inc	(OFST+0,sp)
8657                     ; 1361 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8657                     ; 1362 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8657                     ; 1363 				){
8659  1abf 0d16          	tnz	(OFST+0,sp)
8660  1ac1 270d          	jreq	L3044
8662  1ac3 7b16          	ld	a,(OFST+0,sp)
8663  1ac5 a105          	cp	a,#5
8664  1ac7 2407          	jruge	L3044
8666  1ac9 c60004        	ld	a,_uc_Test_Page_Now
8667  1acc a102          	cp	a,#2
8668  1ace 2713          	jreq	L1044
8669  1ad0               L3044:
8671  1ad0 7b16          	ld	a,(OFST+0,sp)
8672  1ad2 a105          	cp	a,#5
8673  1ad4 2523          	jrult	L5734
8675  1ad6 7b16          	ld	a,(OFST+0,sp)
8676  1ad8 a109          	cp	a,#9
8677  1ada 241d          	jruge	L5734
8679  1adc c60004        	ld	a,_uc_Test_Page_Now
8680  1adf a103          	cp	a,#3
8681  1ae1 2616          	jrne	L5734
8682  1ae3               L1044:
8683                     ; 1364 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
8685  1ae3 7b16          	ld	a,(OFST+0,sp)
8686  1ae5 5f            	clrw	x
8687  1ae6 97            	ld	xl,a
8688  1ae7 5a            	decw	x
8689  1ae8 a604          	ld	a,#4
8690  1aea cd0000        	call	c_smodx
8692  1aed d60000        	ld	a,(_LCD_Line,x)
8693  1af0 cd0000        	call	_Set_LCD_Address
8695                     ; 1365 					Display_LCD_String("Fail_CoreTemp");
8697  1af3 ae0033        	ldw	x,#L5343
8698  1af6 cd0000        	call	_Display_LCD_String
8700  1af9               L5734:
8701                     ; 1371 			if(can_diag[1] & (U8)(0x8)){
8703  1af9 7b04          	ld	a,(OFST-18,sp)
8704  1afb a508          	bcp	a,#8
8705  1afd 273c          	jreq	L7044
8706                     ; 1373 				uc_fault_cnt++;
8708  1aff 0c16          	inc	(OFST+0,sp)
8709                     ; 1374 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8709                     ; 1375 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8709                     ; 1376 				){
8711  1b01 0d16          	tnz	(OFST+0,sp)
8712  1b03 270d          	jreq	L5144
8714  1b05 7b16          	ld	a,(OFST+0,sp)
8715  1b07 a105          	cp	a,#5
8716  1b09 2407          	jruge	L5144
8718  1b0b c60004        	ld	a,_uc_Test_Page_Now
8719  1b0e a102          	cp	a,#2
8720  1b10 2713          	jreq	L3144
8721  1b12               L5144:
8723  1b12 7b16          	ld	a,(OFST+0,sp)
8724  1b14 a105          	cp	a,#5
8725  1b16 2523          	jrult	L7044
8727  1b18 7b16          	ld	a,(OFST+0,sp)
8728  1b1a a109          	cp	a,#9
8729  1b1c 241d          	jruge	L7044
8731  1b1e c60004        	ld	a,_uc_Test_Page_Now
8732  1b21 a103          	cp	a,#3
8733  1b23 2616          	jrne	L7044
8734  1b25               L3144:
8735                     ; 1377 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8737  1b25 7b16          	ld	a,(OFST+0,sp)
8738  1b27 5f            	clrw	x
8739  1b28 97            	ld	xl,a
8740  1b29 5a            	decw	x
8741  1b2a a604          	ld	a,#4
8742  1b2c cd0000        	call	c_smodx
8744  1b2f d60000        	ld	a,(_LCD_Line,x)
8745  1b32 cd0000        	call	_Set_LCD_Address
8747                     ; 1378 					Display_LCD_String("Fail_PCB1Temp");
8749  1b35 ae0025        	ldw	x,#L1543
8750  1b38 cd0000        	call	_Display_LCD_String
8752  1b3b               L7044:
8753                     ; 1384 			if(can_data[5] == (U8)(0xff)){
8755  1b3b 7b12          	ld	a,(OFST-4,sp)
8756  1b3d a1ff          	cp	a,#255
8757  1b3f 263c          	jrne	L1244
8758                     ; 1386 				uc_fault_cnt++;
8760  1b41 0c16          	inc	(OFST+0,sp)
8761                     ; 1387 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8761                     ; 1388 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8761                     ; 1389 				){
8763  1b43 0d16          	tnz	(OFST+0,sp)
8764  1b45 270d          	jreq	L7244
8766  1b47 7b16          	ld	a,(OFST+0,sp)
8767  1b49 a105          	cp	a,#5
8768  1b4b 2407          	jruge	L7244
8770  1b4d c60004        	ld	a,_uc_Test_Page_Now
8771  1b50 a102          	cp	a,#2
8772  1b52 2713          	jreq	L5244
8773  1b54               L7244:
8775  1b54 7b16          	ld	a,(OFST+0,sp)
8776  1b56 a105          	cp	a,#5
8777  1b58 2523          	jrult	L1244
8779  1b5a 7b16          	ld	a,(OFST+0,sp)
8780  1b5c a109          	cp	a,#9
8781  1b5e 241d          	jruge	L1244
8783  1b60 c60004        	ld	a,_uc_Test_Page_Now
8784  1b63 a103          	cp	a,#3
8785  1b65 2616          	jrne	L1244
8786  1b67               L5244:
8787                     ; 1390 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8789  1b67 7b16          	ld	a,(OFST+0,sp)
8790  1b69 5f            	clrw	x
8791  1b6a 97            	ld	xl,a
8792  1b6b 5a            	decw	x
8793  1b6c a604          	ld	a,#4
8794  1b6e cd0000        	call	c_smodx
8796  1b71 d60000        	ld	a,(_LCD_Line,x)
8797  1b74 cd0000        	call	_Set_LCD_Address
8799                     ; 1391 					Display_LCD_String("Fail_IGBT");
8801  1b77 ae001b        	ldw	x,#L5643
8802  1b7a cd0000        	call	_Display_LCD_String
8804  1b7d               L1244:
8805                     ; 1405 			if(!uc_fault_cnt){
8807  1b7d 0d16          	tnz	(OFST+0,sp)
8808  1b7f 260c          	jrne	L3514
8809                     ; 1406 				Set_LCD_Address(LCD_Line[0]);
8811  1b81 c60000        	ld	a,_LCD_Line
8812  1b84 cd0000        	call	_Set_LCD_Address
8814                     ; 1407 				Display_LCD_String("Normal");
8816  1b87 ae0006        	ldw	x,#L5053
8817  1b8a cd0000        	call	_Display_LCD_String
8819  1b8d               L3514:
8820                     ; 1412 	if((b_Com_On_flag == ON)){
8822  1b8d c6000d        	ld	a,_uc_Test_Ctrl_Reg
8823  1b90 a508          	bcp	a,#8
8824  1b92 270d          	jreq	L5344
8825                     ; 1413 		Set_LCD_Address((unsigned char)(0x00+15));
8827  1b94 a60f          	ld	a,#15
8828  1b96 cd0000        	call	_Set_LCD_Address
8830                     ; 1416 		Display_LCD_String("Y");	// YJS 20230314
8832  1b99 ae0004        	ldw	x,#L1153
8833  1b9c cd0000        	call	_Display_LCD_String
8836  1b9f 200b          	jra	L7344
8837  1ba1               L5344:
8838                     ; 1418 		Set_LCD_Address((unsigned char)(0x00+15));
8840  1ba1 a60f          	ld	a,#15
8841  1ba3 cd0000        	call	_Set_LCD_Address
8843                     ; 1419 		Display_LCD_String("N");
8845  1ba6 ae00c7        	ldw	x,#L7013
8846  1ba9 cd0000        	call	_Display_LCD_String
8848  1bac               L7344:
8849                     ; 1422 	return;
8850  1bac               L431:
8853  1bac 5b16          	addw	sp,#22
8854  1bae 81            	ret
8880                     ; 1425 void Test_Controller_Routine(void)
8880                     ; 1426 {
8881                     	switch	.text
8882  1baf               _Test_Controller_Routine:
8886                     ; 1430 	SU2I_Ctrl_LCD_Display_Control();
8888  1baf cd108f        	call	L5153_SU2I_Ctrl_LCD_Display_Control
8890                     ; 1432 	Test_Ctrl_Swtich_Control();
8892  1bb2 cd030c        	call	_Test_Ctrl_Swtich_Control
8894                     ; 1434 	return;
8897  1bb5 81            	ret
8933                     ; 1439 void Test_Ctrl_Reset_Values(void)
8933                     ; 1440 {
8934                     	switch	.text
8935  1bb6               _Test_Ctrl_Reset_Values:
8939                     ; 1441 	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
8941  1bb6 725f000d      	clr	_uc_Test_Ctrl_Reg
8942                     ; 1442 	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
8944  1bba 725f000e      	clr	_uc_Model_Select_Reg
8945                     ; 1443 	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register
8947  1bbe 725f000c      	clr	_uc_Rx_TimeOut_Reg
8948                     ; 1445 	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
8950  1bc2 725f0004      	clr	_uc_Test_Page_Now
8951                     ; 1446 	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
8953  1bc6 725f0003      	clr	_uc_Test_Page_Pre
8954                     ; 1447 	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number
8956  1bca 725f0002      	clr	_uc_Test_Data_Select_Num
8957                     ; 1449 	uc_Perc_Unit = 1;		// Duty_Moving_Unit
8959  1bce 35010001      	mov	_uc_Perc_Unit,#1
8960                     ; 1451 	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
8962  1bd2 5f            	clrw	x
8963  1bd3 cf0007        	ldw	_ui_Rx1_TimeOut_Cnt,x
8964                     ; 1452 	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter
8966  1bd6 5f            	clrw	x
8967  1bd7 cf0005        	ldw	_ui_Rx2_TimeOut_Cnt,x
8968                     ; 1454 	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
8970  1bda 725f0009      	clr	_uc_Heater_Enable_Flag
8971                     ; 1455 	uc_Target_Duty_Perc[HTR_ZONE_1] = 0;		// Target_Duty_Percentage
8973  1bde 725f000a      	clr	_uc_Target_Duty_Perc
8974                     ; 1456 	uc_Target_Duty_Perc[HTR_ZONE_2] = 0;		// Target_Duty_Percentage
8976  1be2 725f000b      	clr	_uc_Target_Duty_Perc+1
8977                     ; 1457 	HEATER_zone_status=HTR_ZONE_1;
8979  1be6 725f0000      	clr	_HEATER_zone_status
8980                     ; 1458 	return;
8983  1bea 81            	ret
9123                     	xdef	_Test_Ctrl_Text_Display_Handling
9124                     	xdef	_Test_Ctrl_Swtich_Control
9125                     	xdef	_Test_Ctrl_Value_Change
9126                     	xdef	_Model_Select_LCD_Display_Control
9127                     	xdef	_Model_Select_Switch_Control
9128                     	xdef	_Model_Select_Display_Handling
9129                     	xdef	_First_Switch_Control
9130                     	switch	.bss
9131  0000               _uc_Target_Display_Mode:
9132  0000 00            	ds.b	1
9133                     	xdef	_uc_Target_Display_Mode
9134  0001               _uc_Perc_Unit:
9135  0001 00            	ds.b	1
9136                     	xdef	_uc_Perc_Unit
9137  0002               _uc_Test_Data_Select_Num:
9138  0002 00            	ds.b	1
9139                     	xdef	_uc_Test_Data_Select_Num
9140  0003               _uc_Test_Page_Pre:
9141  0003 00            	ds.b	1
9142                     	xdef	_uc_Test_Page_Pre
9143  0004               _uc_Test_Page_Now:
9144  0004 00            	ds.b	1
9145                     	xdef	_uc_Test_Page_Now
9146                     	xref	_strcpy
9147                     	xref	_Start_Zig_Display
9148                     	xref	_HEATER_zone_status
9149                     	xdef	_Test_Ctrl_Reset_Values
9150                     	xdef	_Test_Controller_Routine
9151                     	xdef	_Model_Select_Routine
9152                     	xdef	_Test_Controller_First_Routine
9153  0005               _ui_Rx2_TimeOut_Cnt:
9154  0005 0000          	ds.b	2
9155                     	xdef	_ui_Rx2_TimeOut_Cnt
9156  0007               _ui_Rx1_TimeOut_Cnt:
9157  0007 0000          	ds.b	2
9158                     	xdef	_ui_Rx1_TimeOut_Cnt
9159                     	xdef	_uc_Rx_Data
9160  0009               _uc_Heater_Enable_Flag:
9161  0009 00            	ds.b	1
9162                     	xdef	_uc_Heater_Enable_Flag
9163  000a               _uc_Target_Duty_Perc:
9164  000a 0000          	ds.b	2
9165                     	xdef	_uc_Target_Duty_Perc
9166  000c               _uc_Rx_TimeOut_Reg:
9167  000c 00            	ds.b	1
9168                     	xdef	_uc_Rx_TimeOut_Reg
9169  000d               _uc_Test_Ctrl_Reg:
9170  000d 00            	ds.b	1
9171                     	xdef	_uc_Test_Ctrl_Reg
9172  000e               _uc_Model_Select_Reg:
9173  000e 00            	ds.b	1
9174                     	xdef	_uc_Model_Select_Reg
9175                     	xref	_uc_Button_Status_Reg
9176                     	xref	_Num_Display_LCD
9177                     	xref	_Display_LCD_String
9178                     	xref	_Set_LCD_Address
9179                     	xref	_LCD_Dis_Data
9180                     	xref	_LCD_Line
9181                     	xref	_uc_LCD_Blink_Reg
9182                     	xref	_uc_System_Ctrl_Reg
9183                     	switch	.const
9184  0004               L1153:
9185  0004 5900          	dc.b	"Y",0
9186  0006               L5053:
9187  0006 4e6f726d616c  	dc.b	"Normal",0
9188  000d               L1053:
9189  000d 4661696c5f6f  	dc.b	"Fail_openLoad",0
9190  001b               L5643:
9191  001b 4661696c5f49  	dc.b	"Fail_IGBT",0
9192  0025               L1543:
9193  0025 4661696c5f50  	dc.b	"Fail_PCB1Temp",0
9194  0033               L5343:
9195  0033 4661696c5f43  	dc.b	"Fail_CoreTemp",0
9196  0041               L1243:
9197  0041 4661696c5f43  	dc.b	"Fail_CurSen",0
9198  004d               L5043:
9199  004d 4661696c5f4c  	dc.b	"Fail_LVSen",0
9200  0058               L1733:
9201  0058 4661696c5f48  	dc.b	"Fail_HVSen",0
9202  0063               L5533:
9203  0063 466c745f4d73  	dc.b	"Flt_MsgTimeOut",0
9204  0072               L1433:
9205  0072 466c745f5043  	dc.b	"Flt_PCBThmShut",0
9206  0081               L5233:
9207  0081 466c745f5468  	dc.b	"Flt_ThmShut",0
9208  008d               L1133:
9209  008d 466c745f4f76  	dc.b	"Flt_OverCur",0
9210  0099               L5723:
9211  0099 466c745f4856  	dc.b	"Flt_HVHigh",0
9212  00a4               L1623:
9213  00a4 466c745f4856  	dc.b	"Flt_HVLow",0
9214  00ae               L5423:
9215  00ae 466c745f4c56  	dc.b	"Flt_LVHigh",0
9216  00b9               L1323:
9217  00b9 466c745f4c56  	dc.b	"Flt_LVLow",0
9218  00c3               L3713:
9219  00c3 2d00          	dc.b	"-",0
9220  00c5               L5113:
9221  00c5 3100          	dc.b	"1",0
9222  00c7               L7013:
9223  00c7 4e00          	dc.b	"N",0
9224  00c9               L7472:
9225  00c9 4d415800      	dc.b	"MAX",0
9226  00cd               L1762:
9227  00cd 4c6d697400    	dc.b	"Lmit",0
9228  00d2               L3662:
9229  00d2 466c7400      	dc.b	"Flt",0
9230  00d6               L5562:
9231  00d6 4f70657200    	dc.b	"Oper",0
9232  00db               L7462:
9233  00db 53746f7000    	dc.b	"Stop",0
9234  00e0               L1462:
9235  00e0 4e4300        	dc.b	"NC",0
9236  00e3               L5362:
9237  00e3 5a3200        	dc.b	"Z2",0
9238  00e6               L1362:
9239  00e6 5a3100        	dc.b	"Z1",0
9240  00e9               L1162:
9241  00e9 202020202020  	dc.b	"        Fd:",0
9242  00f5               L7752:
9243  00f5 202020202020  	dc.b	"        /",0
9244  00ff               L1552:
9245  00ff 2500          	dc.b	"%",0
9246  0101               L7452:
9247  0101 3000          	dc.b	"0",0
9248  0103               L3452:
9249  0103 3500          	dc.b	"5",0
9250  0105               L7352:
9251  0105 2e00          	dc.b	".",0
9252  0107               L3352:
9253  0107 445f556e6974  	dc.b	"D_Unit:",0
9254  010f               L1352:
9255  010f 2a5461726765  	dc.b	"*Target Watt(OS)",0
9256  0120               L5252:
9257  0120 2a5461726765  	dc.b	"*Target Perc",0
9258  012d               L1252:
9259  012d 2a4f5054494f  	dc.b	"*OPTION*",0
9260  0136               L1442:
9261  0136 5665723a00    	dc.b	"Ver:",0
9262  013b               L7342:
9263  013b 43743a00      	dc.b	"Ct:",0
9264  013f               L5342:
9265  013f 43723a202020  	dc.b	"Cr:     Pw:",0
9266  014b               L3342:
9267  014b 523a2020463a  	dc.b	"R:  F:  HV:",0
9268  0157               L1342:
9269  0157 54703a202020  	dc.b	"Tp:     Fd:",0
9270  0163               L5242:
9271  0163 54643a202020  	dc.b	"Td:     Fd:",0
9272  016f               L1242:
9273  016f 416c3a202020  	dc.b	"Al:     /",0
9274  0179               L5571:
9275  0179 00            	dc.b	0
9276  017a               L3571:
9277  017a 2a4856434320  	dc.b	"*HVCC Model*",0
9278                     	xref.b	c_lreg
9279                     	xref.b	c_x
9280                     	xref.b	c_y
9300                     	xref	c_smodx
9301                     	xref	c_sdivx
9302                     	xref	c_ludv
9303                     	xref	c_umul
9304                     	end

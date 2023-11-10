   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _SAIC_Test_Register:
2660  0000 00            	dc.b	0
2661  0001               _SAIC_Lin_Com_Register:
2662  0001 00            	dc.b	0
2663  0002               _SAIC_ID_Status:
2664  0002 00            	dc.b	0
2665  0003               _SAIC_RX_Over_Time:
2666  0003 0000          	dc.w	0
2667  0005               _SAIC_Data_Step:
2668  0005 00            	dc.b	0
2669  0006               _SAIC_Test_Pg:
2670  0006 00            	dc.b	0
2671  0007               _SAIC_Pre_Pg:
2672  0007 08            	dc.b	8
2673  0008               _SAIC_Unit:
2674  0008 01            	dc.b	1
2675  0009               _SAIC_PTC_Status:
2676  0009 00            	dc.b	0
2677  000a 000000000000  	ds.b	6
2678  0010               _SAIC_TxLin_Data:
2679  0010 00            	dc.b	0
2680  0011 000000000000  	ds.b	8
2681  0019               _SAIC_Rx1_Lin_Data:
2682  0019 00            	dc.b	0
2683  001a 000000000000  	ds.b	8
2684  0022               _SAIC_Rx2_Lin_Data:
2685  0022 00            	dc.b	0
2686  0023 000000000000  	ds.b	8
2736                     ; 26 void SAIC_PTC_Reset(void)
2736                     ; 27 {
2737                     	switch	.text
2738  0000               f_SAIC_PTC_Reset:
2742                     ; 28 	SAIC_Test_Pg = 0;	//display page reset
2744  0000 725f0006      	clr	_SAIC_Test_Pg
2745                     ; 29 	SAIC_Pre_Pg = 8;
2747  0004 35080007      	mov	_SAIC_Pre_Pg,#8
2748                     ; 30 	SAIC_Data_Step = 0; //data select reset
2750  0008 725f0005      	clr	_SAIC_Data_Step
2751                     ; 33 	PTC_Status_Flag = 0;
2753  000c 725f0000      	clr	_PTC_Status_Flag
2754                     ; 34 	PTC_BATT_VALUE = 0;
2756  0010 5f            	clrw	x
2757  0011 cf0000        	ldw	_PTC_BATT_VALUE,x
2758                     ; 35 	PTC_Cur_VALUE = 0;
2760  0014 725f0000      	clr	_PTC_Cur_VALUE
2761                     ; 36 	PTC_PWR_VALUE = 0;
2763  0018 cf0000        	ldw	_PTC_PWR_VALUE,x
2764                     ; 37 	PTC_Fdback_Duty = 0;
2766  001b 725f0000      	clr	_PTC_Fdback_Duty
2767                     ; 38 	PTC_LCore_Temp = 0;
2769  001f 725f0000      	clr	_PTC_LCore_Temp
2770                     ; 39 	PTC_RCore_Temp = 0;
2772  0023 725f0000      	clr	_PTC_RCore_Temp
2773                     ; 40 	PTC_Limit_Cause = 0;
2775  0027 725f0000      	clr	_PTC_Limit_Cause
2776                     ; 41 	PTC_SW_Ver = 0;
2778  002b 725f0000      	clr	_PTC_SW_Ver
2779                     ; 42 	PTC_Status1 = 0;
2781  002f 725f0000      	clr	_PTC_Status1
2782                     ; 43 	PTC_Status2 = 0;
2784  0033 725f0000      	clr	_PTC_Status2
2785                     ; 44 	PTC_Status3 = 0;
2787  0037 725f0000      	clr	_PTC_Status3
2788                     ; 45 	PTC_AllowOperation= 0;
2790  003b 725f0000      	clr	_PTC_AllowOperation
2791                     ; 46 	PTC_Heat_Duty = 0;
2793  003f 725f0000      	clr	_PTC_Heat_Duty
2794                     ; 48 	PTC_AllowOperation= 0;
2796  0043 725f0000      	clr	_PTC_AllowOperation
2797                     ; 51 	SAIC_Test_Register = 0;
2799  0047 725f0000      	clr	_SAIC_Test_Register
2800                     ; 53 	SAIC_PTC_Status[0] = 0;
2802  004b 725f0009      	clr	_SAIC_PTC_Status
2803                     ; 54 	SAIC_PTC_Status[1] = 0;
2805  004f 725f000a      	clr	_SAIC_PTC_Status+1
2806                     ; 55 	SAIC_PTC_Status[2] = 0;
2808  0053 725f000b      	clr	_SAIC_PTC_Status+2
2809                     ; 56 	SAIC_PTC_Status[3] = 0;
2811  0057 725f000c      	clr	_SAIC_PTC_Status+3
2812                     ; 57 	SAIC_PTC_Status[4] = 0;
2814  005b 725f000d      	clr	_SAIC_PTC_Status+4
2815                     ; 58 	SAIC_PTC_Status[5] = 0;
2817  005f 725f000e      	clr	_SAIC_PTC_Status+5
2818                     ; 59 	SAIC_PTC_Status[6] = 0;
2820  0063 725f000f      	clr	_SAIC_PTC_Status+6
2821                     ; 60 	SAIC_PTC_Status[7] = 0;
2823  0067 725f0010      	clr	_SAIC_PTC_Status+7
2824                     ; 61 	SAIC_PTC_Status[8] = 0;
2826  006b 725f0011      	clr	_SAIC_PTC_Status+8
2827                     ; 63 	SAIC_Unit = 1;
2829  006f 35010008      	mov	_SAIC_Unit,#1
2830                     ; 65 	return;
2833  0073 87            	retf	
2859                     ; 70 void SAIC_Display_Handling(void)
2859                     ; 71 {
2860                     	switch	.text
2861  0074               f_SAIC_Display_Handling:
2865                     ; 72 	switch(SAIC_Test_Pg){
2867  0074 c60006        	ld	a,_SAIC_Test_Pg
2869                     ; 134 		default: break;
2870  0077 272b          	jreq	L1271
2871  0079 4a            	dec	a
2872  007a 2753          	jreq	L3271
2873  007c 4a            	dec	a
2874  007d 277b          	jreq	L5271
2875  007f 4a            	dec	a
2876  0080 2604ac250125  	jreq	L7271
2877  0086 4a            	dec	a
2878  0087 2604ac500150  	jreq	L1371
2879  008d 4a            	dec	a
2880  008e 2604ac790179  	jreq	L3371
2881  0094 4a            	dec	a
2882  0095 2604aca201a2  	jreq	L5371
2883  009b a004          	sub	a,#4
2884  009d 2604acbf01bf  	jreq	L5471
2886  00a3 87            	retf	
2887  00a4               L1271:
2888                     ; 74 		case 0:
2888                     ; 75 				strcpy(LCD_Dis_Data[0],"PAllow:");
2890  00a4 ae0117        	ldw	x,#L5671
2891  00a7 89            	pushw	x
2892  00a8 ae0000        	ldw	x,#_LCD_Dis_Data
2893  00ab 8d000000      	callf	f_strcpy
2895  00af 85            	popw	x
2896                     ; 76 				strcpy(LCD_Dis_Data[1],"TD:      FD:");
2898  00b0 ae010a        	ldw	x,#L7671
2899  00b3 89            	pushw	x
2900  00b4 ae0010        	ldw	x,#_LCD_Dis_Data+16
2901  00b7 8d000000      	callf	f_strcpy
2903  00bb 85            	popw	x
2904                     ; 77 				strcpy(LCD_Dis_Data[2],"PTCRdy:");
2906  00bc ae0102        	ldw	x,#L1771
2907  00bf 89            	pushw	x
2908  00c0 ae0020        	ldw	x,#_LCD_Dis_Data+32
2909  00c3 8d000000      	callf	f_strcpy
2911  00c7 85            	popw	x
2912                     ; 78 				strcpy(LCD_Dis_Data[3],"PTCFa:");
2914  00c8 ae00fb        	ldw	x,#L3771
2916                     ; 79 				break;
2918  00cb ace601e6      	jpf	LC001
2919  00cf               L3271:
2920                     ; 81 		case 1:
2920                     ; 82 				strcpy(LCD_Dis_Data[0],"HV :");
2922  00cf ae00f6        	ldw	x,#L5771
2923  00d2 89            	pushw	x
2924  00d3 ae0000        	ldw	x,#_LCD_Dis_Data
2925  00d6 8d000000      	callf	f_strcpy
2927  00da 85            	popw	x
2928                     ; 83 				strcpy(LCD_Dis_Data[1],"Cur:");
2930  00db ae00f1        	ldw	x,#L7771
2931  00de 89            	pushw	x
2932  00df ae0010        	ldw	x,#_LCD_Dis_Data+16
2933  00e2 8d000000      	callf	f_strcpy
2935  00e6 85            	popw	x
2936                     ; 84 				strcpy(LCD_Dis_Data[2],"Pwr:");
2938  00e7 ae00ec        	ldw	x,#L1002
2939  00ea 89            	pushw	x
2940  00eb ae0020        	ldw	x,#_LCD_Dis_Data+32
2941  00ee 8d000000      	callf	f_strcpy
2943  00f2 85            	popw	x
2944                     ; 85 				strcpy(LCD_Dis_Data[3],"CoT:");
2946  00f3 ae00e7        	ldw	x,#L3002
2948                     ; 86 				break;
2950  00f6 ace601e6      	jpf	LC001
2951  00fa               L5271:
2952                     ; 88 		case 2:
2952                     ; 89 				strcpy(LCD_Dis_Data[0],"SW_Ver:");
2954  00fa ae00df        	ldw	x,#L5002
2955  00fd 89            	pushw	x
2956  00fe ae0000        	ldw	x,#_LCD_Dis_Data
2957  0101 8d000000      	callf	f_strcpy
2959  0105 85            	popw	x
2960                     ; 90 				strcpy(LCD_Dis_Data[1],"PSt1:");
2962  0106 ae00d9        	ldw	x,#L7002
2963  0109 89            	pushw	x
2964  010a ae0010        	ldw	x,#_LCD_Dis_Data+16
2965  010d 8d000000      	callf	f_strcpy
2967  0111 85            	popw	x
2968                     ; 91 				strcpy(LCD_Dis_Data[2],"PSt2:");
2970  0112 ae00d3        	ldw	x,#L1102
2971  0115 89            	pushw	x
2972  0116 ae0020        	ldw	x,#_LCD_Dis_Data+32
2973  0119 8d000000      	callf	f_strcpy
2975  011d 85            	popw	x
2976                     ; 92 				strcpy(LCD_Dis_Data[3],"PSt3:");
2978  011e ae00cd        	ldw	x,#L3102
2980                     ; 93 				break;
2982  0121 ace601e6      	jpf	LC001
2983  0125               L7271:
2984                     ; 95 		case 3:
2984                     ; 96 				strcpy(LCD_Dis_Data[0],"LVLw:");
2986  0125 ae00c7        	ldw	x,#L5102
2987  0128 89            	pushw	x
2988  0129 ae0000        	ldw	x,#_LCD_Dis_Data
2989  012c 8d000000      	callf	f_strcpy
2991  0130 85            	popw	x
2992                     ; 97 				strcpy(LCD_Dis_Data[1],"LVHg:");
2994  0131 ae00c1        	ldw	x,#L7102
2995  0134 89            	pushw	x
2996  0135 ae0010        	ldw	x,#_LCD_Dis_Data+16
2997  0138 8d000000      	callf	f_strcpy
2999  013c 85            	popw	x
3000                     ; 98 				strcpy(LCD_Dis_Data[2],"HVLw:");
3002  013d ae00bb        	ldw	x,#L1202
3003  0140 89            	pushw	x
3004  0141 ae0020        	ldw	x,#_LCD_Dis_Data+32
3005  0144 8d000000      	callf	f_strcpy
3007  0148 85            	popw	x
3008                     ; 99 				strcpy(LCD_Dis_Data[3],"HVHg:");
3010  0149 ae00b5        	ldw	x,#L3202
3012                     ; 100 				break;
3014  014c ace601e6      	jpf	LC001
3015  0150               L1371:
3016                     ; 102 		case 4:
3016                     ; 103 				strcpy(LCD_Dis_Data[0],"OCur:");
3018  0150 ae00af        	ldw	x,#L5202
3019  0153 89            	pushw	x
3020  0154 ae0000        	ldw	x,#_LCD_Dis_Data
3021  0157 8d000000      	callf	f_strcpy
3023  015b 85            	popw	x
3024                     ; 104 				strcpy(LCD_Dis_Data[1],"CThm:");
3026  015c ae00a9        	ldw	x,#L7202
3027  015f 89            	pushw	x
3028  0160 ae0010        	ldw	x,#_LCD_Dis_Data+16
3029  0163 8d000000      	callf	f_strcpy
3031  0167 85            	popw	x
3032                     ; 105 				strcpy(LCD_Dis_Data[2],"PThm:");
3034  0168 ae00a3        	ldw	x,#L1302
3035  016b 89            	pushw	x
3036  016c ae0020        	ldw	x,#_LCD_Dis_Data+32
3037  016f 8d000000      	callf	f_strcpy
3039  0173 85            	popw	x
3040                     ; 106 				strcpy(LCD_Dis_Data[3],"11To:");
3042  0174 ae009d        	ldw	x,#L3302
3044                     ; 107 				break;
3046  0177 206d          	jpf	LC001
3047  0179               L3371:
3048                     ; 109 		case 5:
3048                     ; 110 				strcpy(LCD_Dis_Data[0],"FHVSn:");
3050  0179 ae0096        	ldw	x,#L5302
3051  017c 89            	pushw	x
3052  017d ae0000        	ldw	x,#_LCD_Dis_Data
3053  0180 8d000000      	callf	f_strcpy
3055  0184 85            	popw	x
3056                     ; 111 				strcpy(LCD_Dis_Data[1],"FLVSn:");
3058  0185 ae008f        	ldw	x,#L7302
3059  0188 89            	pushw	x
3060  0189 ae0010        	ldw	x,#_LCD_Dis_Data+16
3061  018c 8d000000      	callf	f_strcpy
3063  0190 85            	popw	x
3064                     ; 112 				strcpy(LCD_Dis_Data[2],"FCurSn:");
3066  0191 ae0087        	ldw	x,#L1402
3067  0194 89            	pushw	x
3068  0195 ae0020        	ldw	x,#_LCD_Dis_Data+32
3069  0198 8d000000      	callf	f_strcpy
3071  019c 85            	popw	x
3072                     ; 113 				strcpy(LCD_Dis_Data[3],"FCoTSn:");
3074  019d ae007f        	ldw	x,#L3402
3076                     ; 114 				break;
3078  01a0 2044          	jpf	LC001
3079  01a2               L5371:
3080                     ; 116 		case 6:
3080                     ; 117 				strcpy(LCD_Dis_Data[0],"FP1Sn:");
3082  01a2 ae0078        	ldw	x,#L5402
3083  01a5 89            	pushw	x
3084  01a6 ae0000        	ldw	x,#_LCD_Dis_Data
3085  01a9 8d000000      	callf	f_strcpy
3087  01ad 85            	popw	x
3088                     ; 118 				strcpy(LCD_Dis_Data[1],"FP2Sn:");
3090  01ae ae0071        	ldw	x,#L7402
3091  01b1 89            	pushw	x
3092  01b2 ae0010        	ldw	x,#_LCD_Dis_Data+16
3093  01b5 8d000000      	callf	f_strcpy
3095  01b9 85            	popw	x
3096                     ; 119 				strcpy(LCD_Dis_Data[2],"PTCLmt:");
3098  01ba ae0069        	ldw	x,#L1502
3100                     ; 120 				strcpy(LCD_Dis_Data[3],"");
3102                     ; 121 				break;
3104  01bd 201b          	jpf	LC002
3105                     ; 123 		case 7:  	break;
3107                     ; 125 		case 8:  break;
3109                     ; 126 		case 9:  break;	
3111  01bf               L5471:
3112                     ; 127 		case 10:  
3112                     ; 128 				strcpy(LCD_Dis_Data[0],"*Option*");
3114  01bf ae005f        	ldw	x,#L5502
3115  01c2 89            	pushw	x
3116  01c3 ae0000        	ldw	x,#_LCD_Dis_Data
3117  01c6 8d000000      	callf	f_strcpy
3119  01ca 85            	popw	x
3120                     ; 129 				strcpy(LCD_Dis_Data[1],"D_Unit : ");
3122  01cb ae0055        	ldw	x,#L7502
3123  01ce 89            	pushw	x
3124  01cf ae0010        	ldw	x,#_LCD_Dis_Data+16
3125  01d2 8d000000      	callf	f_strcpy
3127  01d6 85            	popw	x
3128                     ; 130 				strcpy(LCD_Dis_Data[2],"");
3130  01d7 ae0068        	ldw	x,#L3502
3132                     ; 131 				strcpy(LCD_Dis_Data[3],"");
3134  01da               LC002:
3135  01da 89            	pushw	x
3136  01db ae0020        	ldw	x,#_LCD_Dis_Data+32
3137  01de 8d000000      	callf	f_strcpy
3138  01e2 85            	popw	x
3140  01e3 ae0068        	ldw	x,#L3502
3142  01e6               LC001:
3143  01e6 89            	pushw	x
3144  01e7 ae0030        	ldw	x,#_LCD_Dis_Data+48
3145  01ea 8d000000      	callf	f_strcpy
3146  01ee 85            	popw	x
3147                     ; 132 				break;		
3149                     ; 134 		default: break;
3151                     ; 136 	return;
3154  01ef 87            	retf	
3232                     ; 140 void SAIC_LCD_Display(void)
3232                     ; 141 {
3233                     	switch	.text
3234  01f0               f_SAIC_LCD_Display:
3236  01f0 5203          	subw	sp,#3
3237       00000003      OFST:	set	3
3240                     ; 145 	Set_LCD_Address((unsigned char)(LCD_Line[2]+14));
3242  01f2 c60002        	ld	a,_LCD_Line+2
3243  01f5 ab0e          	add	a,#14
3244  01f7 8d000000      	callf	f_Set_LCD_Address
3246                     ; 146 	Display_LCD_String("SA");
3248  01fb ae0052        	ldw	x,#L3012
3249  01fe 8d000000      	callf	f_Display_LCD_String
3251                     ; 149 	if(SAIC_Test_Pg != SAIC_Pre_Pg){ SAIC_Display_Handling();} 
3253  0202 c60006        	ld	a,_SAIC_Test_Pg
3254  0205 c10007        	cp	a,_SAIC_Pre_Pg
3255  0208 2704          	jreq	L5012
3258  020a 8d740074      	callf	f_SAIC_Display_Handling
3260  020e               L5012:
3261                     ; 150 	SAIC_Pre_Pg = SAIC_Test_Pg;
3263  020e 5500060007    	mov	_SAIC_Pre_Pg,_SAIC_Test_Pg
3264                     ; 153 	if(SAIC_Test_Pg == 0){			//page 1
3266  0213 725d0006      	tnz	_SAIC_Test_Pg
3267  0217 2704ac5f035f  	jrne	L7012
3268                     ; 154 		for(i=0; i<4; i++){
3270  021d 4f            	clr	a
3271  021e 6b03          	ld	(OFST+0,sp),a
3272  0220               L1112:
3273                     ; 156 			Set_LCD_Address(LCD_Line[i]);
3275  0220 5f            	clrw	x
3276  0221 97            	ld	xl,a
3277  0222 d60000        	ld	a,(_LCD_Line,x)
3278  0225 8d000000      	callf	f_Set_LCD_Address
3280                     ; 157 			if((SAIC_Data_Select_flag == ON) && (SAIC_Data_Setting_flag == OFF) && (i == SAIC_Data_Step)){
3282  0229 7201000023    	btjf	_SAIC_Test_Register,#0,L7112
3284  022e 720200001e    	btjt	_SAIC_Test_Register,#1,L7112
3286  0233 7b03          	ld	a,(OFST+0,sp)
3287  0235 c10005        	cp	a,_SAIC_Data_Step
3288  0238 2617          	jrne	L7112
3289                     ; 158 				if(Blink_50){
3291  023a 725d0000      	tnz	_Blink_50
3292  023e 2713          	jreq	LC004
3293                     ; 159 					if(i==0){ 	Display_LCD_String("      ");}
3295  0240 7b03          	ld	a,(OFST+0,sp)
3296  0242 2605          	jrne	L3212
3299  0244 ae004b        	ldw	x,#L5212
3302  0247 2011          	jpf	LC003
3303  0249               L3212:
3304                     ; 160 					else if(i==1){Display_LCD_String("         FD:");  }
3306  0249 4a            	dec	a
3307  024a 2612          	jrne	L7312
3310  024c ae003e        	ldw	x,#L3312
3312  024f 2009          	jpf	LC003
3313                     ; 162 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3315  0251               L7112:
3316                     ; 164 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3318  0251 7b03          	ld	a,(OFST+0,sp)
3319  0253               LC004:
3321  0253 97            	ld	xl,a
3322  0254 a610          	ld	a,#16
3323  0256 42            	mul	x,a
3324  0257 1c0000        	addw	x,#_LCD_Dis_Data
3325  025a               LC003:
3326  025a 8d000000      	callf	f_Display_LCD_String
3328  025e               L7312:
3329                     ; 167 			if(i==0){
3331  025e 7b03          	ld	a,(OFST+0,sp)
3332  0260 262f          	jrne	L1412
3333                     ; 168 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3335  0262 5f            	clrw	x
3336  0263 97            	ld	xl,a
3337  0264 d60000        	ld	a,(_LCD_Line,x)
3338  0267 ab08          	add	a,#8
3339  0269 8d000000      	callf	f_Set_LCD_Address
3341                     ; 169 				if((SAIC_Data_Setting_flag == ON) && (i == SAIC_Data_Step)){
3343  026d 7203000018    	btjf	_SAIC_Test_Register,#1,L5412
3345  0272 7b03          	ld	a,(OFST+0,sp)
3346  0274 c10005        	cp	a,_SAIC_Data_Step
3347  0277 2611          	jrne	L5412
3348                     ; 170 					if(Blink_50){Display_LCD_String("     ");}
3350  0279 725d0000      	tnz	_Blink_50
3351  027d 270b          	jreq	L5412
3354  027f ae0038        	ldw	x,#L7412
3355  0282 8d000000      	callf	f_Display_LCD_String
3358  0286 ac430343      	jra	L5512
3359  028a               L5412:
3360                     ; 171 					else{ Num_Display_LCD(PTC_AllowOperation);}
3362                     ; 172 				}else{ Num_Display_LCD(PTC_AllowOperation);}
3365  028a c60000        	ld	a,_PTC_AllowOperation
3367  028d ac3d033d      	jpf	LC007
3368  0291               L1412:
3369                     ; 174 			else if(i==1){
3371  0291 a101          	cp	a,#1
3372  0293 2704ac150315  	jrne	L7512
3373                     ; 176 				Set_LCD_Address((unsigned char)(LCD_Line[i]+3));
3375  0299 5f            	clrw	x
3376  029a 97            	ld	xl,a
3377  029b d60000        	ld	a,(_LCD_Line,x)
3378  029e ab03          	add	a,#3
3379  02a0 8d000000      	callf	f_Set_LCD_Address
3381                     ; 177 				if((SAIC_Data_Setting_flag == ON) && (i == SAIC_Data_Step)){
3383  02a4 720300001e    	btjf	_SAIC_Test_Register,#1,L5712
3385  02a9 7b03          	ld	a,(OFST+0,sp)
3386  02ab c10005        	cp	a,_SAIC_Data_Step
3387  02ae 2617          	jrne	L5712
3388                     ; 179 					if((UP_Long_SW)||(DN_Long_SW)){
3390  02b0 720c000005    	btjt	_SW_Status,#6,L5612
3392  02b5 720f000002    	btjf	_SW_Status,#7,L3612
3393  02ba               L5612:
3394                     ; 180 						Num_Display_LCD(PTC_Heat_Duty/2);
3396                     ; 181 						Display_LCD_String(".");
3398                     ; 182 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3400                     ; 183 						Display_LCD_String("%");
3403  02ba 200b          	jpf	L5712
3404  02bc               L3612:
3405                     ; 185 					else if(Blink_50){Display_LCD_String("     ");}
3407  02bc 725d0000      	tnz	_Blink_50
3408  02c0 2705          	jreq	L5712
3411  02c2 ae0038        	ldw	x,#L7412
3414  02c5 2021          	jra	L1022
3415  02c7               L5712:
3416                     ; 187 						Num_Display_LCD(PTC_Heat_Duty/2);
3418                     ; 188 						Display_LCD_String(".");
3420                     ; 189 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3422                     ; 190 						Display_LCD_String("%");
3424                     ; 193 					Num_Display_LCD(PTC_Heat_Duty/2);
3427                     ; 194 					Display_LCD_String(".");
3430                     ; 195 					Num_Display_LCD((PTC_Heat_Duty%2)*5);
3433                     ; 196 					Display_LCD_String("%");
3437  02c7 c60000        	ld	a,_PTC_Heat_Duty
3438  02ca 44            	srl	a
3439  02cb 5f            	clrw	x
3440  02cc 97            	ld	xl,a
3441  02cd 8d000000      	callf	f_Num_Display_LCD
3444  02d1 ae0036        	ldw	x,#L7612
3445  02d4 8d000000      	callf	f_Display_LCD_String
3448  02d8 c60000        	ld	a,_PTC_Heat_Duty
3449  02db a401          	and	a,#1
3450  02dd 97            	ld	xl,a
3451  02de a605          	ld	a,#5
3452  02e0 42            	mul	x,a
3453  02e1 8d000000      	callf	f_Num_Display_LCD
3456  02e5 ae0034        	ldw	x,#L1712
3458  02e8               L1022:
3459  02e8 8d000000      	callf	f_Display_LCD_String
3460                     ; 200 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));	
3462  02ec 7b03          	ld	a,(OFST+0,sp)
3463  02ee 5f            	clrw	x
3464  02ef 97            	ld	xl,a
3465  02f0 d60000        	ld	a,(_LCD_Line,x)
3466  02f3 ab0c          	add	a,#12
3467  02f5 8d000000      	callf	f_Set_LCD_Address
3469                     ; 201 				Num_Display_LCD(PTC_Fdback_Duty/2);
3471  02f9 c60000        	ld	a,_PTC_Fdback_Duty
3472  02fc 44            	srl	a
3473  02fd 5f            	clrw	x
3474  02fe 97            	ld	xl,a
3475  02ff 8d000000      	callf	f_Num_Display_LCD
3477                     ; 202 				Display_LCD_String(".");
3479  0303 ae0036        	ldw	x,#L7612
3480  0306 8d000000      	callf	f_Display_LCD_String
3482                     ; 203 				Num_Display_LCD((PTC_Fdback_Duty%2)*5);
3484  030a c60000        	ld	a,_PTC_Fdback_Duty
3485  030d a401          	and	a,#1
3486  030f 97            	ld	xl,a
3487  0310 a605          	ld	a,#5
3488  0312 42            	mul	x,a
3491  0313 202a          	jpf	LC006
3492  0315               L7512:
3493                     ; 208 			else if(i==2){
3495  0315 a102          	cp	a,#2
3496  0317 2610          	jrne	L5022
3497                     ; 209 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3499  0319 5f            	clrw	x
3500  031a 97            	ld	xl,a
3501  031b d60000        	ld	a,(_LCD_Line,x)
3502  031e ab08          	add	a,#8
3503  0320 8d000000      	callf	f_Set_LCD_Address
3505                     ; 210 				Num_Display_LCD(PTC_Status_Flag & 0x01);		// PTC Ready flag
3507  0324 c60000        	ld	a,_PTC_Status_Flag
3510  0327 2012          	jpf	LC008
3511  0329               L5022:
3512                     ; 212 			else if(i==3){
3514  0329 a103          	cp	a,#3
3515  032b 2616          	jrne	L5512
3516                     ; 213 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3518  032d 5f            	clrw	x
3519  032e 97            	ld	xl,a
3520  032f d60000        	ld	a,(_LCD_Line,x)
3521  0332 ab08          	add	a,#8
3522  0334 8d000000      	callf	f_Set_LCD_Address
3524                     ; 214 				Num_Display_LCD(SAIC_Rx2_Lin_Data[0] & 0x01);		// PTC Fault Flag
3526  0338 c60022        	ld	a,_SAIC_Rx2_Lin_Data
3527  033b               LC008:
3528  033b a401          	and	a,#1
3529  033d               LC007:
3530  033d 5f            	clrw	x
3531  033e 97            	ld	xl,a
3532  033f               LC006:
3533  033f 8d000000      	callf	f_Num_Display_LCD
3535  0343               L5512:
3536                     ; 154 		for(i=0; i<4; i++){
3538  0343 0c03          	inc	(OFST+0,sp)
3541  0345 7b03          	ld	a,(OFST+0,sp)
3542  0347 a104          	cp	a,#4
3543  0349 2404ac200220  	jrult	L1112
3544                     ; 218 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3546  034f c60003        	ld	a,_LCD_Line+3
3547  0352 ab0d          	add	a,#13
3548  0354 8d000000      	callf	f_Set_LCD_Address
3550                     ; 219 		Display_LCD_String("TX");
3552  0358 ae0031        	ldw	x,#L3122
3554                     ; 220 		Num_Display_LCD(SAIC_Test_Pg+1);  
3557  035b ac520752      	jpf	LC018
3558  035f               L7012:
3559                     ; 223 	else if(SAIC_Test_Pg == 10){
3561  035f c60006        	ld	a,_SAIC_Test_Pg
3562  0362 a10a          	cp	a,#10
3563  0364 2704ac080408  	jrne	L7122
3564                     ; 224 		for(i=0; i<2; i++){
3566  036a 4f            	clr	a
3567  036b 6b03          	ld	(OFST+0,sp),a
3568  036d               L1222:
3569                     ; 225 			Set_LCD_Address(LCD_Line[i]);
3571  036d 5f            	clrw	x
3572  036e 97            	ld	xl,a
3573  036f d60000        	ld	a,(_LCD_Line,x)
3574  0372 8d000000      	callf	f_Set_LCD_Address
3576                     ; 227 			if((SAIC_Data_Select_flag == ON) && (SAIC_Data_Setting_flag == OFF) && (i == SAIC_Data_Step)){
3578  0376 7201000017    	btjf	_SAIC_Test_Register,#0,L7222
3580  037b 7202000012    	btjt	_SAIC_Test_Register,#1,L7222
3582  0380 7b03          	ld	a,(OFST+0,sp)
3583  0382 c10005        	cp	a,_SAIC_Data_Step
3584  0385 260b          	jrne	L7222
3585                     ; 229 				if(Blink_50){Display_LCD_String("     ");}
3587  0387 725d0000      	tnz	_Blink_50
3588  038b 2707          	jreq	LC010
3591  038d ae0038        	ldw	x,#L7412
3594  0390 2009          	jra	L5322
3595                     ; 230 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3597  0392               L7222:
3598                     ; 232 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3600  0392 7b03          	ld	a,(OFST+0,sp)
3601  0394               LC010:
3603  0394 97            	ld	xl,a
3604  0395 a610          	ld	a,#16
3605  0397 42            	mul	x,a
3606  0398 1c0000        	addw	x,#_LCD_Dis_Data
3608  039b               L5322:
3609  039b 8d000000      	callf	f_Display_LCD_String
3610                     ; 234 			if(i==1){
3612  039f 7b03          	ld	a,(OFST+0,sp)
3613  03a1 a101          	cp	a,#1
3614  03a3 2653          	jrne	L7322
3615                     ; 235 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3617  03a5 5f            	clrw	x
3618  03a6 97            	ld	xl,a
3619  03a7 d60000        	ld	a,(_LCD_Line,x)
3620  03aa ab08          	add	a,#8
3621  03ac 8d000000      	callf	f_Set_LCD_Address
3623                     ; 236 				if((SAIC_Data_Setting_flag == ON) && (i == SAIC_Data_Step)){
3625  03b0 720300001e    	btjf	_SAIC_Test_Register,#1,L1522
3627  03b5 7b03          	ld	a,(OFST+0,sp)
3628  03b7 c10005        	cp	a,_SAIC_Data_Step
3629  03ba 2617          	jrne	L1522
3630                     ; 237 					if((UP_Long_SW)||(DN_Long_SW)){
3632  03bc 720c000005    	btjt	_SW_Status,#6,L5422
3634  03c1 720f000002    	btjf	_SW_Status,#7,L3422
3635  03c6               L5422:
3636                     ; 238 						Num_Display_LCD(SAIC_Unit/2);
3638                     ; 239 						Display_LCD_String(".");
3640                     ; 240 						Num_Display_LCD((SAIC_Unit%2)*5);
3642                     ; 241 						Display_LCD_String("%");
3645  03c6 200b          	jpf	L1522
3646  03c8               L3422:
3647                     ; 243 					else if(Blink_50){Display_LCD_String("     ");}
3649  03c8 725d0000      	tnz	_Blink_50
3650  03cc 2705          	jreq	L1522
3653  03ce ae0038        	ldw	x,#L7412
3656  03d1 2021          	jpf	LC011
3657  03d3               L1522:
3658                     ; 245 						Num_Display_LCD(SAIC_Unit/2);
3660                     ; 246 						Display_LCD_String(".");
3662                     ; 247 						Num_Display_LCD((SAIC_Unit%2)*5);
3664                     ; 248 						Display_LCD_String("%");
3666                     ; 251 					Num_Display_LCD(SAIC_Unit/2);
3669                     ; 252 					Display_LCD_String(".");
3672                     ; 253 					Num_Display_LCD((SAIC_Unit%2)*5);
3675                     ; 254 					Display_LCD_String("%");
3679  03d3 c60008        	ld	a,_SAIC_Unit
3680  03d6 44            	srl	a
3681  03d7 5f            	clrw	x
3682  03d8 97            	ld	xl,a
3683  03d9 8d000000      	callf	f_Num_Display_LCD
3686  03dd ae0036        	ldw	x,#L7612
3687  03e0 8d000000      	callf	f_Display_LCD_String
3690  03e4 c60008        	ld	a,_SAIC_Unit
3691  03e7 a401          	and	a,#1
3692  03e9 97            	ld	xl,a
3693  03ea a605          	ld	a,#5
3694  03ec 42            	mul	x,a
3695  03ed 8d000000      	callf	f_Num_Display_LCD
3698  03f1 ae0034        	ldw	x,#L1712
3699  03f4               LC011:
3700  03f4 8d000000      	callf	f_Display_LCD_String
3702  03f8               L7322:
3703                     ; 224 		for(i=0; i<2; i++){
3705  03f8 0c03          	inc	(OFST+0,sp)
3708  03fa 7b03          	ld	a,(OFST+0,sp)
3709  03fc a102          	cp	a,#2
3710  03fe 2404ac6d036d  	jrult	L1222
3712  0404 ac600760      	jra	L5122
3713  0408               L7122:
3714                     ; 261 		for(i=0;i<4;i++){
3716  0408 4f            	clr	a
3717  0409 6b03          	ld	(OFST+0,sp),a
3718  040b               L1622:
3719                     ; 262 			Set_LCD_Address(LCD_Line[i]);
3721  040b 5f            	clrw	x
3722  040c 97            	ld	xl,a
3723  040d d60000        	ld	a,(_LCD_Line,x)
3724  0410 8d000000      	callf	f_Set_LCD_Address
3726                     ; 263 			Display_LCD_String(LCD_Dis_Data[i]);
3728  0414 7b03          	ld	a,(OFST+0,sp)
3729  0416 97            	ld	xl,a
3730  0417 a610          	ld	a,#16
3731  0419 42            	mul	x,a
3732  041a 1c0000        	addw	x,#_LCD_Dis_Data
3733  041d 8d000000      	callf	f_Display_LCD_String
3735                     ; 261 		for(i=0;i<4;i++){
3737  0421 0c03          	inc	(OFST+0,sp)
3740  0423 7b03          	ld	a,(OFST+0,sp)
3741  0425 a104          	cp	a,#4
3742  0427 25e2          	jrult	L1622
3743                     ; 267 		if(SAIC_Test_Pg == 1){
3745  0429 c60006        	ld	a,_SAIC_Test_Pg
3746  042c 4a            	dec	a
3747  042d 2704ac180518  	jrne	L7622
3748                     ; 269 			Set_LCD_Address((unsigned char)(LCD_Line[0]+5));
3750  0433 c60000        	ld	a,_LCD_Line
3751  0436 ab05          	add	a,#5
3752  0438 8d000000      	callf	f_Set_LCD_Address
3754                     ; 270 			if(PTC_BATT_VALUE == 510){Display_LCD_String("Fa");}
3756  043c ce0000        	ldw	x,_PTC_BATT_VALUE
3757  043f a301fe        	cpw	x,#510
3758  0442 2609          	jrne	L1722
3761  0444 ae002e        	ldw	x,#L3722
3762  0447 8d000000      	callf	f_Display_LCD_String
3765  044b 2004          	jra	L5722
3766  044d               L1722:
3767                     ; 271 			else{ Num_Display_LCD(PTC_BATT_VALUE);}  	//HV Display
3769  044d 8d000000      	callf	f_Num_Display_LCD
3771  0451               L5722:
3772                     ; 273 			Set_LCD_Address((unsigned char)(LCD_Line[0]+9));
3774  0451 c60000        	ld	a,_LCD_Line
3775  0454 ab09          	add	a,#9
3776  0456 8d000000      	callf	f_Set_LCD_Address
3778                     ; 274 			Display_LCD_String("V");
3780  045a ae002c        	ldw	x,#L7722
3781  045d 8d000000      	callf	f_Display_LCD_String
3783                     ; 277 			Set_LCD_Address((unsigned char)(LCD_Line[1]+5));		//Current Display
3785  0461 c60001        	ld	a,_LCD_Line+1
3786  0464 ab05          	add	a,#5
3787  0466 8d000000      	callf	f_Set_LCD_Address
3789                     ; 278 			Num_Display_LCD(PTC_Cur_VALUE/5);   
3791  046a c60000        	ld	a,_PTC_Cur_VALUE
3792  046d 5f            	clrw	x
3793  046e 97            	ld	xl,a
3794  046f a605          	ld	a,#5
3795  0471 8d000000      	callf	d_sdivx
3797  0475 8d000000      	callf	f_Num_Display_LCD
3799                     ; 279 			Display_LCD_String(".");
3801  0479 ae0036        	ldw	x,#L7612
3802  047c 8d000000      	callf	f_Display_LCD_String
3804                     ; 280 			Num_Display_LCD(((PTC_Cur_VALUE%5)*2));
3806  0480 c60000        	ld	a,_PTC_Cur_VALUE
3807  0483 5f            	clrw	x
3808  0484 97            	ld	xl,a
3809  0485 a605          	ld	a,#5
3810  0487 8d000000      	callf	d_smodx
3812  048b 58            	sllw	x
3813  048c 8d000000      	callf	f_Num_Display_LCD
3815                     ; 282 			Set_LCD_Address((unsigned char)(LCD_Line[1]+9));
3817  0490 c60001        	ld	a,_LCD_Line+1
3818  0493 ab09          	add	a,#9
3819  0495 8d000000      	callf	f_Set_LCD_Address
3821                     ; 283 			Display_LCD_String("A");
3823  0499 ae002a        	ldw	x,#L1032
3824  049c 8d000000      	callf	f_Display_LCD_String
3826                     ; 286 			Set_LCD_Address((unsigned char)(LCD_Line[2]+5));		//Power Display
3828  04a0 c60002        	ld	a,_LCD_Line+2
3829  04a3 ab05          	add	a,#5
3830  04a5 8d000000      	callf	f_Set_LCD_Address
3832                     ; 287 			if(PTC_PWR_VALUE == 0xFFFF){Display_LCD_String("Fa");}
3834  04a9 ce0000        	ldw	x,_PTC_PWR_VALUE
3835  04ac a3ffff        	cpw	x,#65535
3836  04af 2609          	jrne	L3032
3839  04b1 ae002e        	ldw	x,#L3722
3840  04b4 8d000000      	callf	f_Display_LCD_String
3843  04b8 2004          	jra	L5032
3844  04ba               L3032:
3845                     ; 288 			else{ Num_Display_LCD(PTC_PWR_VALUE);}   
3847  04ba 8d000000      	callf	f_Num_Display_LCD
3849  04be               L5032:
3850                     ; 290 			Set_LCD_Address((unsigned char)(LCD_Line[2]+9));
3852  04be c60002        	ld	a,_LCD_Line+2
3853  04c1 ab09          	add	a,#9
3854  04c3 8d000000      	callf	f_Set_LCD_Address
3856                     ; 291 			Display_LCD_String("W");
3858  04c7 ae0028        	ldw	x,#L7032
3859  04ca 8d000000      	callf	f_Display_LCD_String
3861                     ; 294 			Set_LCD_Address((unsigned char)(LCD_Line[3]+5));
3863  04ce c60003        	ld	a,_LCD_Line+3
3864  04d1 ab05          	add	a,#5
3865  04d3 8d000000      	callf	f_Set_LCD_Address
3867                     ; 295 			if(PTC_RCore_Temp == 0xFF){Display_LCD_String("Fa");}
3869  04d7 c60000        	ld	a,_PTC_RCore_Temp
3870  04da a1ff          	cp	a,#255
3871  04dc 2609          	jrne	L1132
3874  04de ae002e        	ldw	x,#L3722
3875  04e1 8d000000      	callf	f_Display_LCD_String
3878  04e5 2021          	jra	L3132
3879  04e7               L1132:
3880                     ; 296 			else if(PTC_RCore_Temp < 40){
3882  04e7 a128          	cp	a,#40
3883  04e9 2414          	jruge	L5132
3884                     ; 297 				Display_LCD_String("-");
3886  04eb ae0026        	ldw	x,#L7132
3887  04ee 8d000000      	callf	f_Display_LCD_String
3889                     ; 298 				Num_Display_LCD(40-PTC_RCore_Temp);
3891  04f2 4f            	clr	a
3892  04f3 97            	ld	xl,a
3893  04f4 a628          	ld	a,#40
3894  04f6 c00000        	sub	a,_PTC_RCore_Temp
3895  04f9 2401          	jrnc	L443
3896  04fb 5a            	decw	x
3897  04fc               L443:
3898  04fc 02            	rlwa	x,a
3901  04fd 2005          	jpf	LC013
3902  04ff               L5132:
3903                     ; 299 			}else{ Num_Display_LCD(PTC_RCore_Temp-40);}  	//Left Coretemp Display
3905  04ff 5f            	clrw	x
3906  0500 97            	ld	xl,a
3907  0501 1d0028        	subw	x,#40
3908  0504               LC013:
3909  0504 8d000000      	callf	f_Num_Display_LCD
3911  0508               L3132:
3912                     ; 301 			Set_LCD_Address((unsigned char)(LCD_Line[3]+9));
3914  0508 c60003        	ld	a,_LCD_Line+3
3915  050b ab09          	add	a,#9
3916  050d 8d000000      	callf	f_Set_LCD_Address
3918                     ; 302 			Display_LCD_String("C");
3920  0511 ae0024        	ldw	x,#L3232
3923  0514 acf205f2      	jpf	LC017
3924  0518               L7622:
3925                     ; 307 		else if(SAIC_Test_Pg == 2){
3927  0518 c60006        	ld	a,_SAIC_Test_Pg
3928  051b a102          	cp	a,#2
3929  051d 2704acfa05fa  	jrne	L7232
3930                     ; 310 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
3932  0523 c60000        	ld	a,_LCD_Line
3933  0526 ab08          	add	a,#8
3934  0528 8d000000      	callf	f_Set_LCD_Address
3936                     ; 311 			Num_Display_LCD(PTC_SW_Ver>>4);  			//SoftWare Version Display
3938  052c c60000        	ld	a,_PTC_SW_Ver
3939  052f 4e            	swap	a
3940  0530 a40f          	and	a,#15
3941  0532 5f            	clrw	x
3942  0533 97            	ld	xl,a
3943  0534 8d000000      	callf	f_Num_Display_LCD
3945                     ; 312 			Display_LCD_String(".");
3947  0538 ae0036        	ldw	x,#L7612
3948  053b 8d000000      	callf	f_Display_LCD_String
3950                     ; 313 			Num_Display_LCD(PTC_SW_Ver&0x0F);  			//SoftWare Version Display
3952  053f c60000        	ld	a,_PTC_SW_Ver
3953  0542 a40f          	and	a,#15
3954  0544 5f            	clrw	x
3955  0545 97            	ld	xl,a
3956  0546 8d000000      	callf	f_Num_Display_LCD
3958                     ; 315 			Ptc1State = (unsigned char)((PTC_Status_Flag & 0x0C)>>2);
3960  054a c60000        	ld	a,_PTC_Status_Flag
3961  054d a40c          	and	a,#12
3962  054f 44            	srl	a
3963  0550 44            	srl	a
3964  0551 6b01          	ld	(OFST-2,sp),a
3965                     ; 316 			Ptc2State = (unsigned char)((PTC_Status_Flag & 0x30)>>4);
3967  0553 c60000        	ld	a,_PTC_Status_Flag
3968  0556 4e            	swap	a
3969  0557 a403          	and	a,#3
3970  0559 6b02          	ld	(OFST-1,sp),a
3971                     ; 317 			Ptc3State = (unsigned char)((PTC_Status_Flag & 0xC0)>>6);
3973  055b c60000        	ld	a,_PTC_Status_Flag
3974  055e 4e            	swap	a
3975  055f a40c          	and	a,#12
3976  0561 44            	srl	a
3977  0562 44            	srl	a
3978  0563 6b03          	ld	(OFST+0,sp),a
3979                     ; 320 			Set_LCD_Address((unsigned char)(LCD_Line[1]+6));
3981  0565 c60001        	ld	a,_LCD_Line+1
3982  0568 ab06          	add	a,#6
3983  056a 8d000000      	callf	f_Set_LCD_Address
3985                     ; 322 			if(Ptc1State == 0){Display_LCD_String("STOP");}
3987  056e 7b01          	ld	a,(OFST-2,sp)
3988  0570 2605          	jrne	L1332
3991  0572 ae001f        	ldw	x,#L3332
3994  0575 2019          	jpf	LC014
3995  0577               L1332:
3996                     ; 323 			else if(Ptc1State == 1){Display_LCD_String("Oper");}
3998  0577 a101          	cp	a,#1
3999  0579 2605          	jrne	L7332
4002  057b ae001a        	ldw	x,#L1432
4005  057e 2010          	jpf	LC014
4006  0580               L7332:
4007                     ; 324 			else if(Ptc1State == 2){Display_LCD_String("fail");}
4009  0580 a102          	cp	a,#2
4010  0582 2605          	jrne	L5432
4013  0584 ae0015        	ldw	x,#L7432
4016  0587 2007          	jpf	LC014
4017  0589               L5432:
4018                     ; 325 			else if(Ptc1State == 3){Display_LCD_String("Limit");}
4020  0589 a103          	cp	a,#3
4021  058b 2607          	jrne	L5332
4024  058d ae000f        	ldw	x,#L5532
4025  0590               LC014:
4026  0590 8d000000      	callf	f_Display_LCD_String
4028  0594               L5332:
4029                     ; 328 			Set_LCD_Address((unsigned char)(LCD_Line[2]+6));
4031  0594 c60002        	ld	a,_LCD_Line+2
4032  0597 ab06          	add	a,#6
4033  0599 8d000000      	callf	f_Set_LCD_Address
4035                     ; 329 			if(Ptc2State == 0){Display_LCD_String("STOP");}
4037  059d 7b02          	ld	a,(OFST-1,sp)
4038  059f 2605          	jrne	L7532
4041  05a1 ae001f        	ldw	x,#L3332
4044  05a4 2019          	jpf	LC015
4045  05a6               L7532:
4046                     ; 330 			else if(Ptc2State == 1){Display_LCD_String("Oper");}
4048  05a6 a101          	cp	a,#1
4049  05a8 2605          	jrne	L3632
4052  05aa ae001a        	ldw	x,#L1432
4055  05ad 2010          	jpf	LC015
4056  05af               L3632:
4057                     ; 331 			else if(Ptc2State == 2){Display_LCD_String("fail");}
4059  05af a102          	cp	a,#2
4060  05b1 2605          	jrne	L7632
4063  05b3 ae0015        	ldw	x,#L7432
4066  05b6 2007          	jpf	LC015
4067  05b8               L7632:
4068                     ; 332 			else if(Ptc2State == 3){Display_LCD_String("Limit");}
4070  05b8 a103          	cp	a,#3
4071  05ba 2607          	jrne	L1632
4074  05bc ae000f        	ldw	x,#L5532
4075  05bf               LC015:
4076  05bf 8d000000      	callf	f_Display_LCD_String
4078  05c3               L1632:
4079                     ; 335 			Set_LCD_Address((unsigned char)(LCD_Line[3]+6));
4081  05c3 c60003        	ld	a,_LCD_Line+3
4082  05c6 ab06          	add	a,#6
4083  05c8 8d000000      	callf	f_Set_LCD_Address
4085                     ; 336 			if(Ptc3State == 0){Display_LCD_String("STOP");}
4087  05cc 7b03          	ld	a,(OFST+0,sp)
4088  05ce 2605          	jrne	L5732
4091  05d0 ae001f        	ldw	x,#L3332
4094  05d3 201d          	jpf	LC017
4095  05d5               L5732:
4096                     ; 337 			else if(Ptc3State == 1){Display_LCD_String("Oper");}
4098  05d5 a101          	cp	a,#1
4099  05d7 2605          	jrne	L1042
4102  05d9 ae001a        	ldw	x,#L1432
4105  05dc 2014          	jpf	LC017
4106  05de               L1042:
4107                     ; 338 			else if(Ptc3State == 2){Display_LCD_String("fail");}
4109  05de a102          	cp	a,#2
4110  05e0 2605          	jrne	L5042
4113  05e2 ae0015        	ldw	x,#L7432
4116  05e5 200b          	jpf	LC017
4117  05e7               L5042:
4118                     ; 339 			else if(Ptc3State == 3){Display_LCD_String("Limit");}
4120  05e7 a103          	cp	a,#3
4121  05e9 2704ac490749  	jrne	L5232
4124  05ef ae000f        	ldw	x,#L5532
4125  05f2               LC017:
4126  05f2 8d000000      	callf	f_Display_LCD_String
4128  05f6 ac490749      	jra	L5232
4129  05fa               L7232:
4130                     ; 342 		else if(SAIC_Test_Pg == 3){
4132  05fa c60006        	ld	a,_SAIC_Test_Pg
4133  05fd a103          	cp	a,#3
4134  05ff 2653          	jrne	L5142
4135                     ; 344 			Set_LCD_Address((unsigned char)(LCD_Line[0]+6));
4137  0601 c60000        	ld	a,_LCD_Line
4138  0604 ab06          	add	a,#6
4139  0606 8d000000      	callf	f_Set_LCD_Address
4141                     ; 345 			Num_Display_LCD(SAIC_Rx2_Lin_Data[1] & 0x01);  		//LV Low Flag
4143  060a c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4144  060d a401          	and	a,#1
4145  060f 5f            	clrw	x
4146  0610 97            	ld	xl,a
4147  0611 8d000000      	callf	f_Num_Display_LCD
4149                     ; 347 			Set_LCD_Address((unsigned char)(LCD_Line[1]+6));
4151  0615 c60001        	ld	a,_LCD_Line+1
4152  0618 ab06          	add	a,#6
4153  061a 8d000000      	callf	f_Set_LCD_Address
4155                     ; 348 			Num_Display_LCD((SAIC_Rx2_Lin_Data[1] & 0x02)>>1);  	//LV High Flag
4157  061e c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4158  0621 a402          	and	a,#2
4159  0623 44            	srl	a
4160  0624 5f            	clrw	x
4161  0625 97            	ld	xl,a
4162  0626 8d000000      	callf	f_Num_Display_LCD
4164                     ; 350 			Set_LCD_Address((unsigned char)(LCD_Line[2]+6));
4166  062a c60002        	ld	a,_LCD_Line+2
4167  062d ab06          	add	a,#6
4168  062f 8d000000      	callf	f_Set_LCD_Address
4170                     ; 351 			Num_Display_LCD((SAIC_Rx2_Lin_Data[1] & 0x04)>>2);  	//HV Low  Flag
4172  0633 c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4173  0636 a404          	and	a,#4
4174  0638 44            	srl	a
4175  0639 44            	srl	a
4176  063a 5f            	clrw	x
4177  063b 97            	ld	xl,a
4178  063c 8d000000      	callf	f_Num_Display_LCD
4180                     ; 353 			Set_LCD_Address((unsigned char)(LCD_Line[3]+6));
4182  0640 c60003        	ld	a,_LCD_Line+3
4183  0643 ab06          	add	a,#6
4184  0645 8d000000      	callf	f_Set_LCD_Address
4186                     ; 354 			Num_Display_LCD((SAIC_Rx2_Lin_Data[1] & 0x08)>>3);  	//HV High Flag
4188  0649 c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4189  064c a408          	and	a,#8
4190  064e 44            	srl	a
4191  064f 44            	srl	a
4194  0650 ac020702      	jpf	LC019
4195  0654               L5142:
4196                     ; 356 		else if(SAIC_Test_Pg == 4){
4198  0654 c60006        	ld	a,_SAIC_Test_Pg
4199  0657 a104          	cp	a,#4
4200  0659 2652          	jrne	L1242
4201                     ; 357 			Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
4203  065b c60000        	ld	a,_LCD_Line
4204  065e ab07          	add	a,#7
4205  0660 8d000000      	callf	f_Set_LCD_Address
4207                     ; 358 			Num_Display_LCD((SAIC_Rx2_Lin_Data[1] & 0x10)>>4);  		//Over Current fail Flag
4209  0664 c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4210  0667 4e            	swap	a
4211  0668 a401          	and	a,#1
4212  066a 5f            	clrw	x
4213  066b 97            	ld	xl,a
4214  066c 8d000000      	callf	f_Num_Display_LCD
4216                     ; 360 			Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
4218  0670 c60001        	ld	a,_LCD_Line+1
4219  0673 ab07          	add	a,#7
4220  0675 8d000000      	callf	f_Set_LCD_Address
4222                     ; 361 			Num_Display_LCD((SAIC_Rx2_Lin_Data[1] & 0x80)>>7);	  	//Core Thermal Shutdown fail Flag
4224  0679 c60023        	ld	a,_SAIC_Rx2_Lin_Data+1
4225  067c a480          	and	a,#128
4226  067e 49            	rlc	a
4227  067f 4f            	clr	a
4228  0680 49            	rlc	a
4229  0681 5f            	clrw	x
4230  0682 97            	ld	xl,a
4231  0683 8d000000      	callf	f_Num_Display_LCD
4233                     ; 363 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4235  0687 c60002        	ld	a,_LCD_Line+2
4236  068a ab07          	add	a,#7
4237  068c 8d000000      	callf	f_Set_LCD_Address
4239                     ; 364 			Num_Display_LCD(SAIC_Rx2_Lin_Data[2] & 0x01);  			//PCB Thermal Shut dowm fail Flag
4241  0690 c60024        	ld	a,_SAIC_Rx2_Lin_Data+2
4242  0693 a401          	and	a,#1
4243  0695 5f            	clrw	x
4244  0696 97            	ld	xl,a
4245  0697 8d000000      	callf	f_Num_Display_LCD
4247                     ; 366 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4249  069b c60003        	ld	a,_LCD_Line+3
4250  069e ab07          	add	a,#7
4251  06a0 8d000000      	callf	f_Set_LCD_Address
4253                     ; 367 			Num_Display_LCD(SAIC_Rx2_Lin_Data[3] & 0x01);  			//Time out ID 111
4255  06a4 c60025        	ld	a,_SAIC_Rx2_Lin_Data+3
4256  06a7 a401          	and	a,#1
4259  06a9 ac430743      	jpf	LC016
4260  06ad               L1242:
4261                     ; 369 		else if(SAIC_Test_Pg == 5){
4263  06ad c60006        	ld	a,_SAIC_Test_Pg
4264  06b0 a105          	cp	a,#5
4265  06b2 2651          	jrne	L5242
4266                     ; 370 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4268  06b4 c60000        	ld	a,_LCD_Line
4269  06b7 ab08          	add	a,#8
4270  06b9 8d000000      	callf	f_Set_LCD_Address
4272                     ; 371 			Num_Display_LCD(SAIC_Rx2_Lin_Data[4] & 0x01);  			//Failure HV Sensor
4274  06bd c60026        	ld	a,_SAIC_Rx2_Lin_Data+4
4275  06c0 a401          	and	a,#1
4276  06c2 5f            	clrw	x
4277  06c3 97            	ld	xl,a
4278  06c4 8d000000      	callf	f_Num_Display_LCD
4280                     ; 373 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4282  06c8 c60001        	ld	a,_LCD_Line+1
4283  06cb ab08          	add	a,#8
4284  06cd 8d000000      	callf	f_Set_LCD_Address
4286                     ; 374 			Num_Display_LCD((SAIC_Rx2_Lin_Data[4] & 0x02)>>1);	  	//Failure LV Sensor
4288  06d1 c60026        	ld	a,_SAIC_Rx2_Lin_Data+4
4289  06d4 a402          	and	a,#2
4290  06d6 44            	srl	a
4291  06d7 5f            	clrw	x
4292  06d8 97            	ld	xl,a
4293  06d9 8d000000      	callf	f_Num_Display_LCD
4295                     ; 376 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4297  06dd c60002        	ld	a,_LCD_Line+2
4298  06e0 ab08          	add	a,#8
4299  06e2 8d000000      	callf	f_Set_LCD_Address
4301                     ; 377 			Num_Display_LCD((SAIC_Rx2_Lin_Data[4] & 0x04)>>2);  		//Failure Current Sensor
4303  06e6 c60026        	ld	a,_SAIC_Rx2_Lin_Data+4
4304  06e9 a404          	and	a,#4
4305  06eb 44            	srl	a
4306  06ec 44            	srl	a
4307  06ed 5f            	clrw	x
4308  06ee 97            	ld	xl,a
4309  06ef 8d000000      	callf	f_Num_Display_LCD
4311                     ; 379 			Set_LCD_Address((unsigned char)(LCD_Line[3]+8));
4313  06f3 c60003        	ld	a,_LCD_Line+3
4314  06f6 ab08          	add	a,#8
4315  06f8 8d000000      	callf	f_Set_LCD_Address
4317                     ; 380 			Num_Display_LCD((PS_PTC_Status[4] & 0x20)>>5);  		//Failure Left Core temp sensor
4319  06fc c60004        	ld	a,_PS_PTC_Status+4
4320  06ff 4e            	swap	a
4321  0700 a402          	and	a,#2
4322  0702               LC019:
4323  0702 44            	srl	a
4326  0703 203e          	jpf	LC016
4327  0705               L5242:
4328                     ; 382 		else if(SAIC_Test_Pg == 6){
4330  0705 c60006        	ld	a,_SAIC_Test_Pg
4331  0708 a106          	cp	a,#6
4332  070a 263d          	jrne	L5232
4333                     ; 384 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4335  070c c60000        	ld	a,_LCD_Line
4336  070f ab08          	add	a,#8
4337  0711 8d000000      	callf	f_Set_LCD_Address
4339                     ; 385 			Num_Display_LCD((SAIC_Rx2_Lin_Data[4] & 0x80)>>7);	  	//Failure PCB Temp1 Sensor
4341  0715 c60026        	ld	a,_SAIC_Rx2_Lin_Data+4
4342  0718 a480          	and	a,#128
4343  071a 49            	rlc	a
4344  071b 4f            	clr	a
4345  071c 49            	rlc	a
4346  071d 5f            	clrw	x
4347  071e 97            	ld	xl,a
4348  071f 8d000000      	callf	f_Num_Display_LCD
4350                     ; 387 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4352  0723 c60001        	ld	a,_LCD_Line+1
4353  0726 ab08          	add	a,#8
4354  0728 8d000000      	callf	f_Set_LCD_Address
4356                     ; 388 			Num_Display_LCD(SAIC_Rx2_Lin_Data[4] & 0x01);  			//Failure PCB Temp2 Sensor
4358  072c c60026        	ld	a,_SAIC_Rx2_Lin_Data+4
4359  072f a401          	and	a,#1
4360  0731 5f            	clrw	x
4361  0732 97            	ld	xl,a
4362  0733 8d000000      	callf	f_Num_Display_LCD
4364                     ; 390 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4366  0737 c60002        	ld	a,_LCD_Line+2
4367  073a ab08          	add	a,#8
4368  073c 8d000000      	callf	f_Set_LCD_Address
4370                     ; 391 			Num_Display_LCD(PTC_Limit_Cause);  						//Limit Cause
4372  0740 c60000        	ld	a,_PTC_Limit_Cause
4373  0743               LC016:
4374  0743 5f            	clrw	x
4375  0744 97            	ld	xl,a
4376  0745 8d000000      	callf	f_Num_Display_LCD
4378  0749               L5232:
4379                     ; 394 		Set_LCD_Address((unsigned char)(0xD0+13));
4381  0749 a6dd          	ld	a,#221
4382  074b 8d000000      	callf	f_Set_LCD_Address
4384                     ; 395 		Display_LCD_String("RX");
4386  074f ae000c        	ldw	x,#L3342
4388                     ; 396 		Num_Display_LCD(SAIC_Test_Pg+1);  
4390  0752               LC018:
4391  0752 8d000000      	callf	f_Display_LCD_String
4393  0756 c60006        	ld	a,_SAIC_Test_Pg
4394  0759 5f            	clrw	x
4395  075a 97            	ld	xl,a
4396  075b 5c            	incw	x
4397  075c 8d000000      	callf	f_Num_Display_LCD
4399  0760               L5122:
4400                     ; 400 	if(SAIC_Trans_flag == ON){
4402  0760 a60d          	ld	a,#13
4403  0762 7205000014    	btjf	_SAIC_Test_Register,#2,L5342
4404                     ; 401 		Set_LCD_Address((unsigned char)(0x00+13));
4406  0767 8d000000      	callf	f_Set_LCD_Address
4408                     ; 402 		if(Blink_30){Display_LCD_String("COM");}
4410  076b 725d0000      	tnz	_Blink_30
4411  076f 2705          	jreq	L7342
4414  0771 ae0008        	ldw	x,#L1442
4417  0774 200c          	jra	L7442
4418  0776               L7342:
4419                     ; 403 		else{Display_LCD_String("   ");}
4421  0776 ae0004        	ldw	x,#L5442
4423  0779 2007          	jra	L7442
4424  077b               L5342:
4425                     ; 406 		Set_LCD_Address((unsigned char)(0x00+13));
4427  077b 8d000000      	callf	f_Set_LCD_Address
4429                     ; 407 		Display_LCD_String("NON");
4431  077f ae0000        	ldw	x,#L1542
4433  0782               L7442:
4434  0782 8d000000      	callf	f_Display_LCD_String
4435                     ; 411 	return;
4438  0786 5b03          	addw	sp,#3
4439  0788 87            	retf	
4476                     ; 416 void SAIC_Test_Value_Change(unsigned char ST)
4476                     ; 417 {
4477                     	switch	.text
4478  0789               f_SAIC_Test_Value_Change:
4480  0789 88            	push	a
4481       00000000      OFST:	set	0
4484                     ; 419 	if(ST == 1){
4486  078a 4a            	dec	a
4487  078b 2640          	jrne	L7642
4488                     ; 421 		if(SAIC_Option_flag){
4490  078d 7207000013    	btjf	_SAIC_Test_Register,#3,L1742
4491                     ; 422 			if(SAIC_Data_Step == 1){if(SAIC_Unit<200){SAIC_Unit++;}}
4493  0792 c60005        	ld	a,_SAIC_Data_Step
4494  0795 4a            	dec	a
4495  0796 267b          	jrne	L3152
4498  0798 c60008        	ld	a,_SAIC_Unit
4499  079b a1c8          	cp	a,#200
4500  079d 2474          	jruge	L3152
4503  079f 725c0008      	inc	_SAIC_Unit
4504  07a3 206e          	jra	L3152
4505  07a5               L1742:
4506                     ; 426 			if(SAIC_Data_Step == 0){PTC_AllowOperation ^= 1;}
4508  07a5 725d0005      	tnz	_SAIC_Data_Step
4511  07a9 2744          	jreq	LC021
4512                     ; 427 			else if(SAIC_Data_Step == 1){
4514  07ab c60005        	ld	a,_SAIC_Data_Step
4515  07ae 4a            	dec	a
4516  07af 2662          	jrne	L3152
4517                     ; 428 				if((PTC_Heat_Duty+ SAIC_Unit)>200){PTC_Heat_Duty = 200;}
4519  07b1 c60000        	ld	a,_PTC_Heat_Duty
4520  07b4 5f            	clrw	x
4521  07b5 cb0008        	add	a,_SAIC_Unit
4522  07b8 59            	rlcw	x
4523  07b9 02            	rlwa	x,a
4524  07ba a300c9        	cpw	x,#201
4525  07bd 2f06          	jrslt	L7052
4528  07bf 35c80000      	mov	_PTC_Heat_Duty,#200
4530  07c3 204e          	jra	L3152
4531  07c5               L7052:
4532                     ; 429 				else{PTC_Heat_Duty += SAIC_Unit;}
4534  07c5 c60000        	ld	a,_PTC_Heat_Duty
4535  07c8 cb0008        	add	a,_SAIC_Unit
4536  07cb 2043          	jpf	LC020
4537  07cd               L7642:
4538                     ; 434 	else if(ST == 0){
4540  07cd 7b01          	ld	a,(OFST+1,sp)
4541  07cf 2642          	jrne	L3152
4542                     ; 435 		if(SAIC_Option_flag){
4544  07d1 7207000013    	btjf	_SAIC_Test_Register,#3,L7152
4545                     ; 436 			if(SAIC_Data_Step == 1){if(SAIC_Unit>1){SAIC_Unit--;}  }
4547  07d6 c60005        	ld	a,_SAIC_Data_Step
4548  07d9 4a            	dec	a
4549  07da 2637          	jrne	L3152
4552  07dc c60008        	ld	a,_SAIC_Unit
4553  07df a102          	cp	a,#2
4554  07e1 2530          	jrult	L3152
4557  07e3 725a0008      	dec	_SAIC_Unit
4558  07e7 202a          	jra	L3152
4559  07e9               L7152:
4560                     ; 439 			if(SAIC_Data_Step == 0){PTC_AllowOperation ^= 1;}
4562  07e9 725d0005      	tnz	_SAIC_Data_Step
4563  07ed 260a          	jrne	L7252
4566  07ef               LC021:
4568  07ef c60000        	ld	a,_PTC_AllowOperation
4569  07f2 a801          	xor	a,#1
4570  07f4 c70000        	ld	_PTC_AllowOperation,a
4572  07f7 201a          	jra	L3152
4573  07f9               L7252:
4574                     ; 440 			else if(SAIC_Data_Step == 1){
4576  07f9 c60005        	ld	a,_SAIC_Data_Step
4577  07fc 4a            	dec	a
4578  07fd 2614          	jrne	L3152
4579                     ; 441 				if(PTC_Heat_Duty < SAIC_Unit){PTC_Heat_Duty = 0;}
4581  07ff c60000        	ld	a,_PTC_Heat_Duty
4582  0802 c10008        	cp	a,_SAIC_Unit
4583  0805 2406          	jruge	L5352
4586  0807 725f0000      	clr	_PTC_Heat_Duty
4588  080b 2006          	jra	L3152
4589  080d               L5352:
4590                     ; 442 				else{PTC_Heat_Duty -= SAIC_Unit;}
4592  080d c00008        	sub	a,_SAIC_Unit
4593  0810               LC020:
4594  0810 c70000        	ld	_PTC_Heat_Duty,a
4595  0813               L3152:
4596                     ; 446 	return ;
4599  0813 84            	pop	a
4600  0814 87            	retf	
4631                     ; 450 void SAIC_Switch_Control(void)
4631                     ; 451 {
4632                     	switch	.text
4633  0815               f_SAIC_Switch_Control:
4637                     ; 452 	if(UP_SW_flag == ON){
4639  0815 7203000051    	btjf	_SW_Status,#1,L1552
4640                     ; 455 		if(SAIC_Data_Setting_flag == ON){	SAIC_Test_Value_Change(1);}
4642  081a 7203000008    	btjf	_SAIC_Test_Register,#1,L3552
4645  081f a601          	ld	a,#1
4646  0821 8d890789      	callf	f_SAIC_Test_Value_Change
4649  0825 203e          	jra	L5552
4650  0827               L3552:
4651                     ; 457 		else if(SAIC_Data_Select_flag == ON){
4653  0827 720100001a    	btjf	_SAIC_Test_Register,#0,L7552
4654                     ; 458 			if(SAIC_Option_flag){
4656  082c 7207000009    	btjf	_SAIC_Test_Register,#3,L1652
4657                     ; 459 				if(SAIC_Data_Step > 1){ SAIC_Data_Step--;}
4659  0831 c60005        	ld	a,_SAIC_Data_Step
4660  0834 a102          	cp	a,#2
4661  0836 252d          	jrult	L5552
4663  0838 2006          	jpf	LC022
4664  083a               L1652:
4665                     ; 462 				if(SAIC_Data_Step > 0){ SAIC_Data_Step--;}	
4667  083a 725d0005      	tnz	_SAIC_Data_Step
4668  083e 2725          	jreq	L5552
4671  0840               LC022:
4673  0840 725a0005      	dec	_SAIC_Data_Step
4674  0844 201f          	jra	L5552
4675  0846               L7552:
4676                     ; 465 			if(SAIC_Option_flag==0){
4678  0846 720600001a    	btjt	_SAIC_Test_Register,#3,L5552
4679                     ; 466 				if(SAIC_Test_Pg > 0){ SAIC_Test_Pg--;}
4681  084b 725d0006      	tnz	_SAIC_Test_Pg
4682  084f 2706          	jreq	L5752
4685  0851 725a0006      	dec	_SAIC_Test_Pg
4687  0855 2004          	jra	L7752
4688  0857               L5752:
4689                     ; 467 				else{SAIC_Test_Pg = 6;}
4691  0857 35060006      	mov	_SAIC_Test_Pg,#6
4692  085b               L7752:
4693                     ; 469 				if(SAIC_Test_Pg == 0){SAIC_Data_Step = 0;}
4695  085b 725d0006      	tnz	_SAIC_Test_Pg
4696  085f 2604          	jrne	L5552
4699  0861 725f0005      	clr	_SAIC_Data_Step
4700  0865               L5552:
4701                     ; 472 		UP_SW_flag = OFF;
4703  0865 72130000      	bres	_SW_Status,#1
4705  0869 2046          	jra	L3062
4706  086b               L1552:
4707                     ; 475 	else if(DN_SW_flag == ON){ 
4709  086b 7205000041    	btjf	_SW_Status,#2,L3062
4710                     ; 478 		if(SAIC_Data_Setting_flag == ON){	SAIC_Test_Value_Change(0);}
4712  0870 7203000007    	btjf	_SAIC_Test_Register,#1,L7062
4715  0875 4f            	clr	a
4716  0876 8d890789      	callf	f_SAIC_Test_Value_Change
4719  087a 2031          	jra	L1162
4720  087c               L7062:
4721                     ; 480 		else if(SAIC_Data_Select_flag == ON){
4723  087c 720100000c    	btjf	_SAIC_Test_Register,#0,L3162
4724                     ; 481 			if(SAIC_Option_flag){
4726                     ; 482 				if(SAIC_Data_Step < 1){ SAIC_Data_Step++;}
4728                     ; 483 			}else{ if(SAIC_Data_Step < 1){ SAIC_Data_Step++;}}
4733  0881 725d0005      	tnz	_SAIC_Data_Step
4734  0885 2626          	jrne	L1162
4736  0887 725c0005      	inc	_SAIC_Data_Step
4737  088b 2020          	jra	L1162
4738  088d               L3162:
4739                     ; 486 			if(SAIC_Option_flag==0){
4741  088d 720600001b    	btjt	_SAIC_Test_Register,#3,L1162
4742                     ; 487 				if(SAIC_Test_Pg < 6 ){ SAIC_Test_Pg++;}
4744  0892 c60006        	ld	a,_SAIC_Test_Pg
4745  0895 a106          	cp	a,#6
4746  0897 2406          	jruge	L1362
4749  0899 725c0006      	inc	_SAIC_Test_Pg
4751  089d 2004          	jra	L3362
4752  089f               L1362:
4753                     ; 488 				else{SAIC_Test_Pg = 0;}
4755  089f 725f0006      	clr	_SAIC_Test_Pg
4756  08a3               L3362:
4757                     ; 490 				if(SAIC_Test_Pg == 0){SAIC_Data_Step = 0;}
4759  08a3 725d0006      	tnz	_SAIC_Test_Pg
4760  08a7 2604          	jrne	L1162
4763  08a9 725f0005      	clr	_SAIC_Data_Step
4764  08ad               L1162:
4765                     ; 493 		DN_SW_flag = OFF;
4767  08ad 72150000      	bres	_SW_Status,#2
4768  08b1               L3062:
4769                     ; 498 	if(SET_SW_flag == ON){
4771  08b1 720700002f    	btjf	_SW_Status,#3,L7362
4772                     ; 499 		if((SAIC_Test_Pg==0)||(SAIC_Test_Pg==10)){
4774  08b6 725d0006      	tnz	_SAIC_Test_Pg
4775  08ba 2707          	jreq	L3462
4777  08bc c60006        	ld	a,_SAIC_Test_Pg
4778  08bf a10a          	cp	a,#10
4779  08c1 2622          	jrne	L7362
4780  08c3               L3462:
4781                     ; 501 			if(SAIC_Data_Select_flag == OFF){SAIC_Data_Select_flag= ON;}
4783  08c3 7200000006    	btjt	_SAIC_Test_Register,#0,L5462
4786  08c8 72100000      	bset	_SAIC_Test_Register,#0
4788  08cc 2013          	jra	L7462
4789  08ce               L5462:
4790                     ; 503 				if(SAIC_Data_Setting_flag == OFF){
4792  08ce 7202000006    	btjt	_SAIC_Test_Register,#1,L1562
4793                     ; 504 					SAIC_Data_Setting_flag = ON;
4795  08d3 72120000      	bset	_SAIC_Test_Register,#1
4797  08d7 2008          	jra	L7462
4798  08d9               L1562:
4799                     ; 506 					SAIC_Data_Setting_flag = OFF;
4801  08d9 72130000      	bres	_SAIC_Test_Register,#1
4802                     ; 507 					SAIC_Data_Select_flag = OFF;
4804  08dd 72110000      	bres	_SAIC_Test_Register,#0
4805  08e1               L7462:
4806                     ; 510 			SET_SW_flag = OFF;
4808  08e1 72170000      	bres	_SW_Status,#3
4809  08e5               L7362:
4810                     ; 514 	if(ON_OFF_SW_flag == ON){
4812  08e5 7201000013    	btjf	_SW_Status,#0,L5562
4813                     ; 515 		if(SAIC_Trans_flag == OFF){SAIC_Trans_flag = ON;}
4815  08ea 7204000006    	btjt	_SAIC_Test_Register,#2,L7562
4818  08ef 72140000      	bset	_SAIC_Test_Register,#2
4820  08f3 2004          	jra	L1662
4821  08f5               L7562:
4822                     ; 516 		else{ SAIC_Trans_flag = OFF;  }
4824  08f5 72150000      	bres	_SAIC_Test_Register,#2
4825  08f9               L1662:
4826                     ; 518 		ON_OFF_SW_flag = OFF;
4828  08f9 72110000      	bres	_SW_Status,#0
4829  08fd               L5562:
4830                     ; 521 	if(OP_SW_flag == ON){
4832  08fd 720900002b    	btjf	_SW_Status,#4,L3662
4833                     ; 522 		if(SAIC_Option_flag == OFF){
4835  0902 720600000e    	btjt	_SAIC_Test_Register,#3,L5662
4836                     ; 523 			SAIC_Option_flag = ON;
4838  0907 72160000      	bset	_SAIC_Test_Register,#3
4839                     ; 524 			SAIC_Test_Pg = 10;
4841  090b 350a0006      	mov	_SAIC_Test_Pg,#10
4842                     ; 525 			SAIC_Data_Step = 1;
4844  090f 35010005      	mov	_SAIC_Data_Step,#1
4846  0913 2014          	jra	L7662
4847  0915               L5662:
4848                     ; 528 			SAIC_Option_flag = OFF;
4850  0915 72170000      	bres	_SAIC_Test_Register,#3
4851                     ; 529 			SAIC_Data_Select_flag = OFF;
4853  0919 72110000      	bres	_SAIC_Test_Register,#0
4854                     ; 530 			SAIC_Data_Setting_flag = OFF;
4856  091d 72130000      	bres	_SAIC_Test_Register,#1
4857                     ; 532 			SAIC_Test_Pg = 0;
4859  0921 725f0006      	clr	_SAIC_Test_Pg
4860                     ; 533 			SAIC_Data_Step = 0;
4862  0925 725f0005      	clr	_SAIC_Data_Step
4863  0929               L7662:
4864                     ; 535 		OP_SW_flag = OFF;
4866  0929 72190000      	bres	_SW_Status,#4
4867  092d               L3662:
4868                     ; 539 	if(EN_SW_flag == ON){
4870  092d 720b000014    	btjf	_SW_Status,#5,L1762
4871                     ; 540 		Device_Select_Mode = ON;
4873  0932 72100000      	bset	_Mode_Select_Status,#0
4874                     ; 541 		SAIC_PTC_flag = OFF;
4876  0936 72150000      	bres	_LIN20_Select_Device,#2
4877                     ; 542 		SAIC_Trans_flag = OFF;
4879  093a 72150000      	bres	_SAIC_Test_Register,#2
4880                     ; 545 		SAIC_PTC_Reset();
4882  093e 8d000000      	callf	f_SAIC_PTC_Reset
4884                     ; 546 		EN_SW_flag = OFF;
4886  0942 721b0000      	bres	_SW_Status,#5
4887  0946               L1762:
4888                     ; 549 	return;
4891  0946 87            	retf	
4918                     ; 553 void SAIC_Tx_Data_Handling(void)
4918                     ; 554 {
4919                     	switch	.text
4920  0947               f_SAIC_Tx_Data_Handling:
4924                     ; 555 	SAIC_TxLin_Data[0] = PTC_AllowOperation;
4926  0947 5500000010    	mov	_SAIC_TxLin_Data,_PTC_AllowOperation
4927                     ; 556 	SAIC_TxLin_Data[1] = PTC_Heat_Duty;
4929  094c 5500000011    	mov	_SAIC_TxLin_Data+1,_PTC_Heat_Duty
4930                     ; 557 	SAIC_TxLin_Data[2] = 0;
4932  0951 725f0012      	clr	_SAIC_TxLin_Data+2
4933                     ; 558 	SAIC_TxLin_Data[3] = 0;
4935  0955 725f0013      	clr	_SAIC_TxLin_Data+3
4936                     ; 559 	SAIC_TxLin_Data[4] = 0;
4938  0959 725f0014      	clr	_SAIC_TxLin_Data+4
4939                     ; 560 	SAIC_TxLin_Data[5] = 0;
4941  095d 725f0015      	clr	_SAIC_TxLin_Data+5
4942                     ; 561 	SAIC_TxLin_Data[6] = 0;
4944  0961 725f0016      	clr	_SAIC_TxLin_Data+6
4945                     ; 562 	SAIC_TxLin_Data[7] = 0;
4947  0965 725f0017      	clr	_SAIC_TxLin_Data+7
4948                     ; 563 	SAIC_TxLin_Data[8] = Lin_Measure_Extend_Checksum(0x11,SAIC_TxLin_Data);
4950  0969 ae0010        	ldw	x,#_SAIC_TxLin_Data
4951  096c 89            	pushw	x
4952  096d a611          	ld	a,#17
4953  096f 8d000000      	callf	f_Lin_Measure_Extend_Checksum
4955  0973 c70018        	ld	_SAIC_TxLin_Data+8,a
4956  0976 85            	popw	x
4957                     ; 566 	return;
4960  0977 87            	retf	
5001                     ; 569 void SAIC_Rx_Data_Handling(void)
5001                     ; 570 {
5002                     	switch	.text
5003  0978               f_SAIC_Rx_Data_Handling:
5005  0978 88            	push	a
5006       00000001      OFST:	set	1
5009                     ; 573 	if(SAIC_Rep1_Complete){
5011  0979 720700013c    	btjf	_SAIC_Lin_Com_Register,#3,L7172
5012                     ; 574 		PTC_Status_Flag = SAIC_Rx1_Lin_Data[0];
5014  097e 5500190000    	mov	_PTC_Status_Flag,_SAIC_Rx1_Lin_Data
5015                     ; 575 		PTC_RCore_Temp =  SAIC_Rx1_Lin_Data[1];
5017  0983 55001a0000    	mov	_PTC_RCore_Temp,_SAIC_Rx1_Lin_Data+1
5018                     ; 576 		PTC_PWR_VALUE = (SAIC_Rx1_Lin_Data[3]<<8) + SAIC_Rx1_Lin_Data[2];
5020  0988 5f            	clrw	x
5021  0989 c6001c        	ld	a,_SAIC_Rx1_Lin_Data+3
5022  098c 97            	ld	xl,a
5023  098d 4f            	clr	a
5024  098e cb001b        	add	a,_SAIC_Rx1_Lin_Data+2
5025  0991 2401          	jrnc	L065
5026  0993 5c            	incw	x
5027  0994               L065:
5028  0994 c70001        	ld	_PTC_PWR_VALUE+1,a
5029  0997 9f            	ld	a,xl
5030  0998 c70000        	ld	_PTC_PWR_VALUE,a
5031                     ; 577 		PTC_BATT_VALUE = (unsigned int)(SAIC_Rx1_Lin_Data[4] * 2);
5033  099b 5f            	clrw	x
5034  099c c6001d        	ld	a,_SAIC_Rx1_Lin_Data+4
5035  099f 97            	ld	xl,a
5036  09a0 58            	sllw	x
5037  09a1 cf0000        	ldw	_PTC_BATT_VALUE,x
5038                     ; 578 		PTC_Cur_VALUE = SAIC_Rx1_Lin_Data[5];
5040  09a4 55001e0000    	mov	_PTC_Cur_VALUE,_SAIC_Rx1_Lin_Data+5
5041                     ; 579 		PTC_Fdback_Duty = SAIC_Rx1_Lin_Data[6];
5043  09a9 55001f0000    	mov	_PTC_Fdback_Duty,_SAIC_Rx1_Lin_Data+6
5044                     ; 582 		SAIC_Rep1_Complete = OFF;
5046                     ; 584 		SAIC_RX_Over_Time = 0;	
5048  09ae 5f            	clrw	x
5049  09af 72170001      	bres	_SAIC_Lin_Com_Register,#3
5050  09b3 cf0003        	ldw	_SAIC_RX_Over_Time,x
5051                     ; 585 		SAIC_Rx_Over_Time= OFF;
5053  09b6 721b0001      	bres	_SAIC_Lin_Com_Register,#5
5054  09ba               L7172:
5055                     ; 588 	if(SAIC_Rep2_Complete){
5057  09ba 7209000116    	btjf	_SAIC_Lin_Com_Register,#4,L1272
5058                     ; 589 		SAIC_Rep2_Complete = OFF;
5060  09bf 72190001      	bres	_SAIC_Lin_Com_Register,#4
5061                     ; 590 		for(index = 0; index < 8; index++){
5063  09c3 0f01          	clr	(OFST+0,sp)
5064  09c5               L3272:
5067  09c5 0c01          	inc	(OFST+0,sp)
5070  09c7 7b01          	ld	a,(OFST+0,sp)
5071  09c9 a108          	cp	a,#8
5072  09cb 25f8          	jrult	L3272
5073                     ; 595 		SAIC_RX_Over_Time = 0;	
5075  09cd 5f            	clrw	x
5076  09ce cf0003        	ldw	_SAIC_RX_Over_Time,x
5077                     ; 596 		SAIC_Rx_Over_Time= OFF;
5079  09d1 721b0001      	bres	_SAIC_Lin_Com_Register,#5
5080  09d5               L1272:
5081                     ; 601 	return;
5084  09d5 84            	pop	a
5085  09d6 87            	retf	
5123                     ; 605 void SAIC_Transmit_Tx_DATA(void)
5123                     ; 606 {
5124                     	switch	.text
5125  09d7               f_SAIC_Transmit_Tx_DATA:
5127  09d7 88            	push	a
5128       00000001      OFST:	set	1
5131                     ; 609 	if(SAIC_BCM_Trans_Header == OFF){return;}
5133  09d8 7200000102    	btjt	_SAIC_Lin_Com_Register,#0,L5472
5137  09dd 84            	pop	a
5138  09de 87            	retf	
5139  09df               L5472:
5140                     ; 611 		SAIC_BCM_Trans_Header = OFF;
5142  09df 72110001      	bres	_SAIC_Lin_Com_Register,#0
5143                     ; 613 		if(SAIC_ID_Status == 0){
5145  09e3 725d0002      	tnz	_SAIC_ID_Status
5146  09e7 261c          	jrne	L1572
5147                     ; 614 			LIN_Header_Transmission(0x11);		// id:0x11
5149  09e9 a611          	ld	a,#17
5150  09eb 8d000000      	callf	f_LIN_Header_Transmission
5152                     ; 615 			for(Index = 0; Index<9; Index++){	LIN_Transmission_Data(SAIC_TxLin_Data[Index]);}	
5154  09ef 4f            	clr	a
5155  09f0 6b01          	ld	(OFST+0,sp),a
5156  09f2               L3572:
5159  09f2 5f            	clrw	x
5160  09f3 97            	ld	xl,a
5161  09f4 d60010        	ld	a,(_SAIC_TxLin_Data,x)
5162  09f7 8d000000      	callf	f_LIN_Transmission_Data
5166  09fb 0c01          	inc	(OFST+0,sp)
5169  09fd 7b01          	ld	a,(OFST+0,sp)
5170  09ff a109          	cp	a,#9
5171  0a01 25ef          	jrult	L3572
5173  0a03 202b          	jra	L7472
5174  0a05               L1572:
5175                     ; 617 		else if(SAIC_ID_Status == 1){
5177  0a05 c60002        	ld	a,_SAIC_ID_Status
5178  0a08 4a            	dec	a
5179  0a09 2610          	jrne	L3672
5180                     ; 618 			LIN_Header_Transmission(0x14);		// ID:0x14
5182  0a0b a614          	ld	a,#20
5183  0a0d 8d000000      	callf	f_LIN_Header_Transmission
5185                     ; 619 			Lin_Rx_Cnt = 0;
5187  0a11 725f0000      	clr	_Lin_Rx_Cnt
5188                     ; 620 			SAIC_PTC_Rep1_flag = ON;
5190  0a15 72120001      	bset	_SAIC_Lin_Com_Register,#1
5192  0a19 2015          	jra	L7472
5193  0a1b               L3672:
5194                     ; 622 		else if(SAIC_ID_Status == 2){
5196  0a1b c60002        	ld	a,_SAIC_ID_Status
5197  0a1e a102          	cp	a,#2
5198  0a20 260e          	jrne	L7472
5199                     ; 623 			LIN_Header_Transmission(0x55);		// ID:0x55
5201  0a22 a655          	ld	a,#85
5202  0a24 8d000000      	callf	f_LIN_Header_Transmission
5204                     ; 624 			Lin_Rx_Cnt = 0;
5206  0a28 725f0000      	clr	_Lin_Rx_Cnt
5207                     ; 625 			SAIC_PTC_Rep2_flag = ON;
5209  0a2c 72140001      	bset	_SAIC_Lin_Com_Register,#2
5210  0a30               L7472:
5211                     ; 628 	return;
5214  0a30 84            	pop	a
5215  0a31 87            	retf	
5242                     ; 632 void SAIC_ComTest_Routine(void)
5242                     ; 633 {
5243                     	switch	.text
5244  0a32               f_SAIC_ComTest_Routine:
5248                     ; 634 	if(SAIC_Trans_flag == OFF){return;}
5250  0a32 7204000001    	btjt	_SAIC_Test_Register,#2,L1003
5254  0a37 87            	retf	
5255  0a38               L1003:
5256                     ; 636 		SAIC_Tx_Data_Handling();
5258  0a38 8d470947      	callf	f_SAIC_Tx_Data_Handling
5260                     ; 637 		SAIC_Rx_Data_Handling();
5262  0a3c 8d780978      	callf	f_SAIC_Rx_Data_Handling
5264                     ; 638 		SAIC_Transmit_Tx_DATA();
5267                     ; 640 	return;
5270  0a40 2095          	jpf	f_SAIC_Transmit_Tx_DATA
5296                     ; 644 void SAIC_Test_Routine(void)
5296                     ; 645 {
5297                     	switch	.text
5298  0a42               f_SAIC_Test_Routine:
5302                     ; 648 	if(!SAIC_PTC_flag){ return;}
5304  0a42 7204000001    	btjt	_LIN20_Select_Device,#2,L5103
5308  0a47 87            	retf	
5309  0a48               L5103:
5310                     ; 651 		SAIC_LCD_Display();
5312  0a48 8df001f0      	callf	f_SAIC_LCD_Display
5314                     ; 652 		SAIC_Switch_Control();
5316  0a4c 8d150815      	callf	f_SAIC_Switch_Control
5318                     ; 653 		SAIC_ComTest_Routine();
5321                     ; 656 	return ;
5324  0a50 20e0          	jpf	f_SAIC_ComTest_Routine
5451                     	xdef	f_SAIC_ComTest_Routine
5452                     	xdef	f_SAIC_Transmit_Tx_DATA
5453                     	xdef	f_SAIC_Rx_Data_Handling
5454                     	xdef	f_SAIC_Tx_Data_Handling
5455                     	xdef	f_SAIC_Switch_Control
5456                     	xdef	f_SAIC_Test_Value_Change
5457                     	xdef	f_SAIC_LCD_Display
5458                     	xdef	f_SAIC_Display_Handling
5459                     	xdef	f_SAIC_PTC_Reset
5460                     	xdef	_SAIC_TxLin_Data
5461                     	xdef	_SAIC_PTC_Status
5462                     	xdef	_SAIC_Unit
5463                     	xdef	_SAIC_Pre_Pg
5464                     	xdef	_SAIC_Test_Pg
5465                     	xdef	_SAIC_Data_Step
5466                     	xref	f_strcpy
5467                     	xdef	f_SAIC_Test_Routine
5468                     	xdef	_SAIC_ID_Status
5469                     	xdef	_SAIC_Rx2_Lin_Data
5470                     	xdef	_SAIC_Rx1_Lin_Data
5471                     	xdef	_SAIC_RX_Over_Time
5472                     	xdef	_SAIC_Lin_Com_Register
5473                     	xdef	_SAIC_Test_Register
5474                     	xref	_PS_PTC_Status
5475                     	xref	_Lin_Rx_Cnt
5476                     	xref	f_LIN_Transmission_Data
5477                     	xref	f_LIN_Header_Transmission
5478                     	xref	f_Lin_Measure_Extend_Checksum
5479                     	xref	_LCD_Dis_Data
5480                     	xref	_LCD_Line
5481                     	xref	f_Num_Display_LCD
5482                     	xref	_PTC_Status3
5483                     	xref	_PTC_Status2
5484                     	xref	_PTC_Status1
5485                     	xref	_PTC_SW_Ver
5486                     	xref	_PTC_Limit_Cause
5487                     	xref	_PTC_RCore_Temp
5488                     	xref	_PTC_LCore_Temp
5489                     	xref	_PTC_Fdback_Duty
5490                     	xref	_PTC_PWR_VALUE
5491                     	xref	_PTC_Cur_VALUE
5492                     	xref	_PTC_BATT_VALUE
5493                     	xref	_PTC_Status_Flag
5494                     	xref	_PTC_Heat_Duty
5495                     	xref	_PTC_AllowOperation
5496                     	xref	f_Display_LCD_String
5497                     	xref	f_Set_LCD_Address
5498                     	xref	_Blink_30
5499                     	xref	_Blink_50
5500                     	xref	_SW_Status
5501                     	xref	_LIN20_Select_Device
5502                     	xref	_Mode_Select_Status
5503                     .const:	section	.text
5504  0000               L1542:
5505  0000 4e4f4e00      	dc.b	"NON",0
5506  0004               L5442:
5507  0004 20202000      	dc.b	"   ",0
5508  0008               L1442:
5509  0008 434f4d00      	dc.b	"COM",0
5510  000c               L3342:
5511  000c 525800        	dc.b	"RX",0
5512  000f               L5532:
5513  000f 4c696d697400  	dc.b	"Limit",0
5514  0015               L7432:
5515  0015 6661696c00    	dc.b	"fail",0
5516  001a               L1432:
5517  001a 4f70657200    	dc.b	"Oper",0
5518  001f               L3332:
5519  001f 53544f5000    	dc.b	"STOP",0
5520  0024               L3232:
5521  0024 4300          	dc.b	"C",0
5522  0026               L7132:
5523  0026 2d00          	dc.b	"-",0
5524  0028               L7032:
5525  0028 5700          	dc.b	"W",0
5526  002a               L1032:
5527  002a 4100          	dc.b	"A",0
5528  002c               L7722:
5529  002c 5600          	dc.b	"V",0
5530  002e               L3722:
5531  002e 466100        	dc.b	"Fa",0
5532  0031               L3122:
5533  0031 545800        	dc.b	"TX",0
5534  0034               L1712:
5535  0034 2500          	dc.b	"%",0
5536  0036               L7612:
5537  0036 2e00          	dc.b	".",0
5538  0038               L7412:
5539  0038 202020202000  	dc.b	"     ",0
5540  003e               L3312:
5541  003e 202020202020  	dc.b	"         FD:",0
5542  004b               L5212:
5543  004b 202020202020  	dc.b	"      ",0
5544  0052               L3012:
5545  0052 534100        	dc.b	"SA",0
5546  0055               L7502:
5547  0055 445f556e6974  	dc.b	"D_Unit : ",0
5548  005f               L5502:
5549  005f 2a4f7074696f  	dc.b	"*Option*",0
5550  0068               L3502:
5551  0068 00            	dc.b	0
5552  0069               L1502:
5553  0069 5054434c6d74  	dc.b	"PTCLmt:",0
5554  0071               L7402:
5555  0071 465032536e3a  	dc.b	"FP2Sn:",0
5556  0078               L5402:
5557  0078 465031536e3a  	dc.b	"FP1Sn:",0
5558  007f               L3402:
5559  007f 46436f54536e  	dc.b	"FCoTSn:",0
5560  0087               L1402:
5561  0087 46437572536e  	dc.b	"FCurSn:",0
5562  008f               L7302:
5563  008f 464c56536e3a  	dc.b	"FLVSn:",0
5564  0096               L5302:
5565  0096 464856536e3a  	dc.b	"FHVSn:",0
5566  009d               L3302:
5567  009d 3131546f3a00  	dc.b	"11To:",0
5568  00a3               L1302:
5569  00a3 5054686d3a00  	dc.b	"PThm:",0
5570  00a9               L7202:
5571  00a9 4354686d3a00  	dc.b	"CThm:",0
5572  00af               L5202:
5573  00af 4f4375723a00  	dc.b	"OCur:",0
5574  00b5               L3202:
5575  00b5 485648673a00  	dc.b	"HVHg:",0
5576  00bb               L1202:
5577  00bb 48564c773a00  	dc.b	"HVLw:",0
5578  00c1               L7102:
5579  00c1 4c5648673a00  	dc.b	"LVHg:",0
5580  00c7               L5102:
5581  00c7 4c564c773a00  	dc.b	"LVLw:",0
5582  00cd               L3102:
5583  00cd 505374333a00  	dc.b	"PSt3:",0
5584  00d3               L1102:
5585  00d3 505374323a00  	dc.b	"PSt2:",0
5586  00d9               L7002:
5587  00d9 505374313a00  	dc.b	"PSt1:",0
5588  00df               L5002:
5589  00df 53575f566572  	dc.b	"SW_Ver:",0
5590  00e7               L3002:
5591  00e7 436f543a00    	dc.b	"CoT:",0
5592  00ec               L1002:
5593  00ec 5077723a00    	dc.b	"Pwr:",0
5594  00f1               L7771:
5595  00f1 4375723a00    	dc.b	"Cur:",0
5596  00f6               L5771:
5597  00f6 4856203a00    	dc.b	"HV :",0
5598  00fb               L3771:
5599  00fb 50544346613a  	dc.b	"PTCFa:",0
5600  0102               L1771:
5601  0102 505443526479  	dc.b	"PTCRdy:",0
5602  010a               L7671:
5603  010a 54443a202020  	dc.b	"TD:      FD:",0
5604  0117               L5671:
5605  0117 50416c6c6f77  	dc.b	"PAllow:",0
5606                     	xref.b	c_x
5626                     	xref	d_smodx
5627                     	xref	d_sdivx
5628                     	end

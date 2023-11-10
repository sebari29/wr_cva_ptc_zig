   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _PS_PTC_Status:
2660  0000 00            	dc.b	0
2661  0001 000000000000  	ds.b	6
2662  0007               _PS_PTC_Debug:
2663  0007 00            	dc.b	0
2664  0008 000000000000  	ds.b	7
2665  000f               _PS_Data_Step:
2666  000f 00            	dc.b	0
2667  0010               _PS_Test_Pg:
2668  0010 00            	dc.b	0
2669  0011               _PS_Pre_Pg:
2670  0011 08            	dc.b	8
2671  0012               _PS_Unit:
2672  0012 01            	dc.b	1
2721                     ; 29 void PS_PTC_Reset(void)
2721                     ; 30 {
2722                     	switch	.text
2723  0000               f_PS_PTC_Reset:
2727                     ; 31 	PS_Test_Pg = 0;	//display page reset
2729  0000 725f0010      	clr	_PS_Test_Pg
2730                     ; 32 	PS_Pre_Pg = 8;
2732  0004 35080011      	mov	_PS_Pre_Pg,#8
2733                     ; 33 	PS_Data_Step = 0; //data select reset
2735  0008 725f000f      	clr	_PS_Data_Step
2736                     ; 36 	PTC_BATT_VALUE = 0;
2738  000c 5f            	clrw	x
2739  000d cf0000        	ldw	_PTC_BATT_VALUE,x
2740                     ; 37 	PTC_Cur_VALUE = 0;
2742  0010 725f0000      	clr	_PTC_Cur_VALUE
2743                     ; 38 	PTC_PWR_VALUE = 0;
2745  0014 cf0000        	ldw	_PTC_PWR_VALUE,x
2746                     ; 39 	PTC_Fdback_Duty = 0;
2748  0017 725f0000      	clr	_PTC_Fdback_Duty
2749                     ; 40 	PTC_LCore_Temp = 0;
2751  001b 725f0000      	clr	_PTC_LCore_Temp
2752                     ; 41 	PTC_RCore_Temp = 0;
2754  001f 725f0000      	clr	_PTC_RCore_Temp
2755                     ; 42 	PTC_Limit_Cause = 0;
2757  0023 725f0000      	clr	_PTC_Limit_Cause
2758                     ; 43 	PTC_SW_Ver = 0;
2760  0027 725f0000      	clr	_PTC_SW_Ver
2761                     ; 44 	PTC_Status1 = 0;
2763  002b 725f0000      	clr	_PTC_Status1
2764                     ; 45 	PTC_Status2 = 0;
2766  002f 725f0000      	clr	_PTC_Status2
2767                     ; 46 	PTC_Status3 = 0;
2769  0033 725f0000      	clr	_PTC_Status3
2770                     ; 47 	PTC_AllowOperation= 0;
2772  0037 725f0000      	clr	_PTC_AllowOperation
2773                     ; 48 	PTC_Heat_Duty = 0;
2775  003b 725f0000      	clr	_PTC_Heat_Duty
2776                     ; 50 	PTC_AllowOperation= 0;
2778  003f 725f0000      	clr	_PTC_AllowOperation
2779                     ; 53 	PS_Test_Register = 0;
2781  0043 725f0000      	clr	_PS_Test_Register
2782                     ; 54 	CAN_Operation_App = 0;	
2784  0047 725f0000      	clr	_CAN_Operation_App
2785                     ; 56 	PS_PTC_Status[0] = 0;
2787  004b 725f0000      	clr	_PS_PTC_Status
2788                     ; 57 	PS_PTC_Status[1] = 0;
2790  004f 725f0001      	clr	_PS_PTC_Status+1
2791                     ; 58 	PS_PTC_Status[2] = 0;
2793  0053 725f0002      	clr	_PS_PTC_Status+2
2794                     ; 59 	PS_PTC_Status[3] = 0;
2796  0057 725f0003      	clr	_PS_PTC_Status+3
2797                     ; 60 	PS_PTC_Status[4] = 0;
2799  005b 725f0004      	clr	_PS_PTC_Status+4
2800                     ; 61 	PS_PTC_Status[5] = 0;
2802  005f 725f0005      	clr	_PS_PTC_Status+5
2803                     ; 62 	PS_PTC_Status[6] = 0;
2805  0063 725f0006      	clr	_PS_PTC_Status+6
2806                     ; 63 	PS_PTC_Status[7] = 0;
2808  0067 725f0007      	clr	_PS_PTC_Status+7
2809                     ; 64 	PS_PTC_Status[8] = 0;
2811  006b 725f0008      	clr	_PS_PTC_Status+8
2812                     ; 66 	PS_Unit = 1;
2814  006f 35010012      	mov	_PS_Unit,#1
2815                     ; 68 	return;
2818  0073 87            	retf	
2844                     ; 71 void PS_Display_Handling(void)
2844                     ; 72 {
2845                     	switch	.text
2846  0074               f_PS_Display_Handling:
2850                     ; 73 	switch(PS_Test_Pg){
2852  0074 c60010        	ld	a,_PS_Test_Pg
2854                     ; 145 		default: break;
2855  0077 a10b          	cp	a,#11
2856  0079 2504ac230223  	jruge	L1671
2857  007f 8d000000      	callf	d_jctab
2859  0083               L231:
2860  0083 0017          	dc.w	L1271-L231
2861  0085 0042          	dc.w	L3271-L231
2862  0087 006d          	dc.w	L5271-L231
2863  0089 0098          	dc.w	L7271-L231
2864  008b 00c3          	dc.w	L1371-L231
2865  008d 00ee          	dc.w	L3371-L231
2866  008f 0119          	dc.w	L5371-L231
2867  0091 0136          	dc.w	L7371-L231
2868  0093 015f          	dc.w	L1471-L231
2869  0095 0170          	dc.w	L3471-L231
2870  0097 0170          	dc.w	L3471-L231
2872  0099 87            	retf	
2873  009a               L1271:
2874                     ; 75 		case 0:
2874                     ; 76 				strcpy(LCD_Dis_Data[0],"PAllow:");
2876  009a ae0147        	ldw	x,#L3671
2877  009d 89            	pushw	x
2878  009e ae0000        	ldw	x,#_LCD_Dis_Data
2879  00a1 8d000000      	callf	f_strcpy
2881  00a5 85            	popw	x
2882                     ; 77 				strcpy(LCD_Dis_Data[1],"TD:      FD:");
2884  00a6 ae013a        	ldw	x,#L5671
2885  00a9 89            	pushw	x
2886  00aa ae0010        	ldw	x,#_LCD_Dis_Data+16
2887  00ad 8d000000      	callf	f_strcpy
2889  00b1 85            	popw	x
2890                     ; 78 				strcpy(LCD_Dis_Data[2],"PTCRdy:");
2892  00b2 ae0132        	ldw	x,#L7671
2893  00b5 89            	pushw	x
2894  00b6 ae0020        	ldw	x,#_LCD_Dis_Data+32
2895  00b9 8d000000      	callf	f_strcpy
2897  00bd 85            	popw	x
2898                     ; 79 				strcpy(LCD_Dis_Data[3],"PTCFa:");
2900  00be ae012b        	ldw	x,#L1771
2902                     ; 80 				break;
2904  00c1 ac1a021a      	jpf	LC001
2905  00c5               L3271:
2906                     ; 82 		case 1:
2906                     ; 83 				strcpy(LCD_Dis_Data[0],"HV :");
2908  00c5 ae0126        	ldw	x,#L3771
2909  00c8 89            	pushw	x
2910  00c9 ae0000        	ldw	x,#_LCD_Dis_Data
2911  00cc 8d000000      	callf	f_strcpy
2913  00d0 85            	popw	x
2914                     ; 84 				strcpy(LCD_Dis_Data[1],"Cur:");
2916  00d1 ae0121        	ldw	x,#L5771
2917  00d4 89            	pushw	x
2918  00d5 ae0010        	ldw	x,#_LCD_Dis_Data+16
2919  00d8 8d000000      	callf	f_strcpy
2921  00dc 85            	popw	x
2922                     ; 85 				strcpy(LCD_Dis_Data[2],"Pwr:");
2924  00dd ae011c        	ldw	x,#L7771
2925  00e0 89            	pushw	x
2926  00e1 ae0020        	ldw	x,#_LCD_Dis_Data+32
2927  00e4 8d000000      	callf	f_strcpy
2929  00e8 85            	popw	x
2930                     ; 86 				strcpy(LCD_Dis_Data[3],"CoT:");
2932  00e9 ae0117        	ldw	x,#L1002
2934                     ; 87 				break;
2936  00ec ac1a021a      	jpf	LC001
2937  00f0               L5271:
2938                     ; 89 		case 2:
2938                     ; 90 				strcpy(LCD_Dis_Data[0],"SW_Ver:");
2940  00f0 ae010f        	ldw	x,#L3002
2941  00f3 89            	pushw	x
2942  00f4 ae0000        	ldw	x,#_LCD_Dis_Data
2943  00f7 8d000000      	callf	f_strcpy
2945  00fb 85            	popw	x
2946                     ; 91 				strcpy(LCD_Dis_Data[1],"PSt1:");
2948  00fc ae0109        	ldw	x,#L5002
2949  00ff 89            	pushw	x
2950  0100 ae0010        	ldw	x,#_LCD_Dis_Data+16
2951  0103 8d000000      	callf	f_strcpy
2953  0107 85            	popw	x
2954                     ; 92 				strcpy(LCD_Dis_Data[2],"PSt2:");
2956  0108 ae0103        	ldw	x,#L7002
2957  010b 89            	pushw	x
2958  010c ae0020        	ldw	x,#_LCD_Dis_Data+32
2959  010f 8d000000      	callf	f_strcpy
2961  0113 85            	popw	x
2962                     ; 93 				strcpy(LCD_Dis_Data[3],"PSt3:");
2964  0114 ae00fd        	ldw	x,#L1102
2966                     ; 94 				break;
2968  0117 ac1a021a      	jpf	LC001
2969  011b               L7271:
2970                     ; 96 		case 3:
2970                     ; 97 				strcpy(LCD_Dis_Data[0],"LVLw:");
2972  011b ae00f7        	ldw	x,#L3102
2973  011e 89            	pushw	x
2974  011f ae0000        	ldw	x,#_LCD_Dis_Data
2975  0122 8d000000      	callf	f_strcpy
2977  0126 85            	popw	x
2978                     ; 98 				strcpy(LCD_Dis_Data[1],"LVHg:");
2980  0127 ae00f1        	ldw	x,#L5102
2981  012a 89            	pushw	x
2982  012b ae0010        	ldw	x,#_LCD_Dis_Data+16
2983  012e 8d000000      	callf	f_strcpy
2985  0132 85            	popw	x
2986                     ; 99 				strcpy(LCD_Dis_Data[2],"HVLw:");
2988  0133 ae00eb        	ldw	x,#L7102
2989  0136 89            	pushw	x
2990  0137 ae0020        	ldw	x,#_LCD_Dis_Data+32
2991  013a 8d000000      	callf	f_strcpy
2993  013e 85            	popw	x
2994                     ; 100 				strcpy(LCD_Dis_Data[3],"HVHg:");
2996  013f ae00e5        	ldw	x,#L1202
2998                     ; 101 				break;
3000  0142 ac1a021a      	jpf	LC001
3001  0146               L1371:
3002                     ; 103 		case 4:
3002                     ; 104 				strcpy(LCD_Dis_Data[0],"OCur:");
3004  0146 ae00df        	ldw	x,#L3202
3005  0149 89            	pushw	x
3006  014a ae0000        	ldw	x,#_LCD_Dis_Data
3007  014d 8d000000      	callf	f_strcpy
3009  0151 85            	popw	x
3010                     ; 105 				strcpy(LCD_Dis_Data[1],"CThm:");
3012  0152 ae00d9        	ldw	x,#L5202
3013  0155 89            	pushw	x
3014  0156 ae0010        	ldw	x,#_LCD_Dis_Data+16
3015  0159 8d000000      	callf	f_strcpy
3017  015d 85            	popw	x
3018                     ; 106 				strcpy(LCD_Dis_Data[2],"PThm:");
3020  015e ae00d3        	ldw	x,#L7202
3021  0161 89            	pushw	x
3022  0162 ae0020        	ldw	x,#_LCD_Dis_Data+32
3023  0165 8d000000      	callf	f_strcpy
3025  0169 85            	popw	x
3026                     ; 107 				strcpy(LCD_Dis_Data[3],"111To:");
3028  016a ae00cc        	ldw	x,#L1302
3030                     ; 108 				break;
3032  016d ac1a021a      	jpf	LC001
3033  0171               L3371:
3034                     ; 110 		case 5:
3034                     ; 111 				strcpy(LCD_Dis_Data[0],"FHVSn:");
3036  0171 ae00c5        	ldw	x,#L3302
3037  0174 89            	pushw	x
3038  0175 ae0000        	ldw	x,#_LCD_Dis_Data
3039  0178 8d000000      	callf	f_strcpy
3041  017c 85            	popw	x
3042                     ; 112 				strcpy(LCD_Dis_Data[1],"FLVSn:");
3044  017d ae00be        	ldw	x,#L5302
3045  0180 89            	pushw	x
3046  0181 ae0010        	ldw	x,#_LCD_Dis_Data+16
3047  0184 8d000000      	callf	f_strcpy
3049  0188 85            	popw	x
3050                     ; 113 				strcpy(LCD_Dis_Data[2],"FCurSn:");
3052  0189 ae00b6        	ldw	x,#L7302
3053  018c 89            	pushw	x
3054  018d ae0020        	ldw	x,#_LCD_Dis_Data+32
3055  0190 8d000000      	callf	f_strcpy
3057  0194 85            	popw	x
3058                     ; 114 				strcpy(LCD_Dis_Data[3],"FCoTSn:");
3060  0195 ae00ae        	ldw	x,#L1402
3062                     ; 115 				break;
3064  0198 ac1a021a      	jpf	LC001
3065  019c               L5371:
3066                     ; 117 		case 6:
3066                     ; 118 				strcpy(LCD_Dis_Data[0],"FP1Sn:");
3068  019c ae00a7        	ldw	x,#L3402
3069  019f 89            	pushw	x
3070  01a0 ae0000        	ldw	x,#_LCD_Dis_Data
3071  01a3 8d000000      	callf	f_strcpy
3073  01a7 85            	popw	x
3074                     ; 119 				strcpy(LCD_Dis_Data[1],"FP2Sn:");
3076  01a8 ae00a0        	ldw	x,#L5402
3077  01ab 89            	pushw	x
3078  01ac ae0010        	ldw	x,#_LCD_Dis_Data+16
3079  01af 8d000000      	callf	f_strcpy
3081  01b3 85            	popw	x
3082                     ; 120 				strcpy(LCD_Dis_Data[2],"PTCLmt:");
3084  01b4 ae0098        	ldw	x,#L7402
3086                     ; 121 				strcpy(LCD_Dis_Data[3],"");
3088                     ; 122 				break;
3090  01b7 2055          	jpf	LC002
3091  01b9               L7371:
3092                     ; 124 		case 7:  
3092                     ; 125 				strcpy(LCD_Dis_Data[0],"D_IG1T:");
3094  01b9 ae008f        	ldw	x,#L3502
3095  01bc 89            	pushw	x
3096  01bd ae0000        	ldw	x,#_LCD_Dis_Data
3097  01c0 8d000000      	callf	f_strcpy
3099  01c4 85            	popw	x
3100                     ; 126 				strcpy(LCD_Dis_Data[1],"D_IG2T:");
3102  01c5 ae0087        	ldw	x,#L5502
3103  01c8 89            	pushw	x
3104  01c9 ae0010        	ldw	x,#_LCD_Dis_Data+16
3105  01cc 8d000000      	callf	f_strcpy
3107  01d0 85            	popw	x
3108                     ; 127 				strcpy(LCD_Dis_Data[2],"D_HPCBT:");
3110  01d1 ae007e        	ldw	x,#L7502
3111  01d4 89            	pushw	x
3112  01d5 ae0020        	ldw	x,#_LCD_Dis_Data+32
3113  01d8 8d000000      	callf	f_strcpy
3115  01dc 85            	popw	x
3116                     ; 128 				strcpy(LCD_Dis_Data[3],"D_LPCBT:");
3118  01dd ae0075        	ldw	x,#L1602
3120                     ; 129 				break;
3122  01e0 2038          	jpf	LC001
3123  01e2               L1471:
3124                     ; 131 		case 8:  	
3124                     ; 132 				strcpy(LCD_Dis_Data[0],"D_LV:");
3126  01e2 ae006f        	ldw	x,#L3602
3127  01e5 89            	pushw	x
3128  01e6 ae0000        	ldw	x,#_LCD_Dis_Data
3129  01e9 8d000000      	callf	f_strcpy
3131  01ed 85            	popw	x
3132                     ; 133 				strcpy(LCD_Dis_Data[1],"D_ODT:");
3134  01ee ae0068        	ldw	x,#L5602
3136                     ; 134 				strcpy(LCD_Dis_Data[2],"");
3138                     ; 135 				strcpy(LCD_Dis_Data[3],"");
3140                     ; 136 				break;
3142  01f1 200f          	jpf	LC003
3143  01f3               L3471:
3144                     ; 137 		case 9:  	
3144                     ; 138 		case 10:  
3144                     ; 139 				strcpy(LCD_Dis_Data[0],"*Option*");
3146  01f3 ae005f        	ldw	x,#L7602
3147  01f6 89            	pushw	x
3148  01f7 ae0000        	ldw	x,#_LCD_Dis_Data
3149  01fa 8d000000      	callf	f_strcpy
3151  01fe 85            	popw	x
3152                     ; 140 				strcpy(LCD_Dis_Data[1],"D_Unit : ");
3154  01ff ae0055        	ldw	x,#L1702
3156                     ; 141 				strcpy(LCD_Dis_Data[2],"");
3158  0202               LC003:
3159  0202 89            	pushw	x
3160  0203 ae0010        	ldw	x,#_LCD_Dis_Data+16
3161  0206 8d000000      	callf	f_strcpy
3162  020a 85            	popw	x
3164  020b ae0097        	ldw	x,#L1502
3166                     ; 142 				strcpy(LCD_Dis_Data[3],"");
3168  020e               LC002:
3169  020e 89            	pushw	x
3170  020f ae0020        	ldw	x,#_LCD_Dis_Data+32
3171  0212 8d000000      	callf	f_strcpy
3172  0216 85            	popw	x
3175  0217 ae0097        	ldw	x,#L1502
3177  021a               LC001:
3178  021a 89            	pushw	x
3179  021b ae0030        	ldw	x,#_LCD_Dis_Data+48
3180  021e 8d000000      	callf	f_strcpy
3181  0222 85            	popw	x
3182                     ; 143 				break;		
3184                     ; 145 		default: break;
3186  0223               L1671:
3187                     ; 147 	return;
3190  0223 87            	retf	
3267                     ; 150 void PS_LCD_Display(void)
3267                     ; 151 {
3268                     	switch	.text
3269  0224               f_PS_LCD_Display:
3271  0224 5203          	subw	sp,#3
3272       00000003      OFST:	set	3
3275                     ; 155 	Set_LCD_Address((unsigned char)(LCD_Line[2]+14));
3277  0226 c60002        	ld	a,_LCD_Line+2
3278  0229 ab0e          	add	a,#14
3279  022b 8d000000      	callf	f_Set_LCD_Address
3281                     ; 156 	Display_LCD_String("PS");
3283  022f ae0052        	ldw	x,#L5112
3284  0232 8d000000      	callf	f_Display_LCD_String
3286                     ; 159 	if(PS_Test_Pg != PS_Pre_Pg){ PS_Display_Handling();} 
3288  0236 c60010        	ld	a,_PS_Test_Pg
3289  0239 c10011        	cp	a,_PS_Pre_Pg
3290  023c 2704          	jreq	L7112
3293  023e 8d740074      	callf	f_PS_Display_Handling
3295  0242               L7112:
3296                     ; 160 	PS_Pre_Pg = PS_Test_Pg;
3298  0242 5500100011    	mov	_PS_Pre_Pg,_PS_Test_Pg
3299                     ; 163 	if(PS_Test_Pg == 0){			//page 1
3301  0247 725d0010      	tnz	_PS_Test_Pg
3302  024b 2704ac930393  	jrne	L1212
3303                     ; 164 		for(i=0; i<4; i++){
3305  0251 4f            	clr	a
3306  0252 6b03          	ld	(OFST+0,sp),a
3307  0254               L3212:
3308                     ; 166 			Set_LCD_Address(LCD_Line[i]);
3310  0254 5f            	clrw	x
3311  0255 97            	ld	xl,a
3312  0256 d60000        	ld	a,(_LCD_Line,x)
3313  0259 8d000000      	callf	f_Set_LCD_Address
3315                     ; 167 			if((PS_Data_Select_flag == ON) && (PS_Data_Setting_flag == OFF) && (i == PS_Data_Step)){
3317  025d 7201000023    	btjf	_PS_Test_Register,#0,L1312
3319  0262 720200001e    	btjt	_PS_Test_Register,#1,L1312
3321  0267 7b03          	ld	a,(OFST+0,sp)
3322  0269 c1000f        	cp	a,_PS_Data_Step
3323  026c 2617          	jrne	L1312
3324                     ; 168 				if(Blink_50){
3326  026e 725d0000      	tnz	_Blink_50
3327  0272 2713          	jreq	LC005
3328                     ; 169 					if(i==0){ 	Display_LCD_String("      ");}
3330  0274 7b03          	ld	a,(OFST+0,sp)
3331  0276 2605          	jrne	L5312
3334  0278 ae004b        	ldw	x,#L7312
3337  027b 2011          	jpf	LC004
3338  027d               L5312:
3339                     ; 170 					else if(i==1){Display_LCD_String("         FD:");  }
3341  027d 4a            	dec	a
3342  027e 2612          	jrne	L1512
3345  0280 ae003e        	ldw	x,#L5412
3347  0283 2009          	jpf	LC004
3348                     ; 172 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3350  0285               L1312:
3351                     ; 174 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3353  0285 7b03          	ld	a,(OFST+0,sp)
3354  0287               LC005:
3356  0287 97            	ld	xl,a
3357  0288 a610          	ld	a,#16
3358  028a 42            	mul	x,a
3359  028b 1c0000        	addw	x,#_LCD_Dis_Data
3360  028e               LC004:
3361  028e 8d000000      	callf	f_Display_LCD_String
3363  0292               L1512:
3364                     ; 177 			if(i==0){
3366  0292 7b03          	ld	a,(OFST+0,sp)
3367  0294 262f          	jrne	L3512
3368                     ; 178 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3370  0296 5f            	clrw	x
3371  0297 97            	ld	xl,a
3372  0298 d60000        	ld	a,(_LCD_Line,x)
3373  029b ab08          	add	a,#8
3374  029d 8d000000      	callf	f_Set_LCD_Address
3376                     ; 179 				if((PS_Data_Setting_flag == ON) && (i == PS_Data_Step)){
3378  02a1 7203000018    	btjf	_PS_Test_Register,#1,L7512
3380  02a6 7b03          	ld	a,(OFST+0,sp)
3381  02a8 c1000f        	cp	a,_PS_Data_Step
3382  02ab 2611          	jrne	L7512
3383                     ; 180 					if(Blink_50){Display_LCD_String("     ");}
3385  02ad 725d0000      	tnz	_Blink_50
3386  02b1 270b          	jreq	L7512
3389  02b3 ae0038        	ldw	x,#L1612
3390  02b6 8d000000      	callf	f_Display_LCD_String
3393  02ba ac770377      	jra	L7612
3394  02be               L7512:
3395                     ; 181 					else{ Num_Display_LCD(PTC_AllowOperation);}
3397                     ; 182 				}else{ Num_Display_LCD(PTC_AllowOperation);}
3400  02be c60000        	ld	a,_PTC_AllowOperation
3402  02c1 ac710371      	jpf	LC008
3403  02c5               L3512:
3404                     ; 184 			else if(i==1){
3406  02c5 a101          	cp	a,#1
3407  02c7 2704ac490349  	jrne	L1712
3408                     ; 186 				Set_LCD_Address((unsigned char)(LCD_Line[i]+3));
3410  02cd 5f            	clrw	x
3411  02ce 97            	ld	xl,a
3412  02cf d60000        	ld	a,(_LCD_Line,x)
3413  02d2 ab03          	add	a,#3
3414  02d4 8d000000      	callf	f_Set_LCD_Address
3416                     ; 187 				if((PS_Data_Setting_flag == ON) && (i == PS_Data_Step)){
3418  02d8 720300001e    	btjf	_PS_Test_Register,#1,L7022
3420  02dd 7b03          	ld	a,(OFST+0,sp)
3421  02df c1000f        	cp	a,_PS_Data_Step
3422  02e2 2617          	jrne	L7022
3423                     ; 189 					if((UP_Long_SW)||(DN_Long_SW)){
3425  02e4 720c000005    	btjt	_SW_Status,#6,L7712
3427  02e9 720f000002    	btjf	_SW_Status,#7,L5712
3428  02ee               L7712:
3429                     ; 190 						Num_Display_LCD(PTC_Heat_Duty/2);
3431                     ; 191 						Display_LCD_String(".");
3433                     ; 192 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3435                     ; 193 						Display_LCD_String("%");
3438  02ee 200b          	jpf	L7022
3439  02f0               L5712:
3440                     ; 195 					else if(Blink_50){Display_LCD_String("     ");}
3442  02f0 725d0000      	tnz	_Blink_50
3443  02f4 2705          	jreq	L7022
3446  02f6 ae0038        	ldw	x,#L1612
3449  02f9 2021          	jra	L3122
3450  02fb               L7022:
3451                     ; 197 						Num_Display_LCD(PTC_Heat_Duty/2);
3453                     ; 198 						Display_LCD_String(".");
3455                     ; 199 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3457                     ; 200 						Display_LCD_String("%");
3459                     ; 203 					Num_Display_LCD(PTC_Heat_Duty/2);
3462                     ; 204 					Display_LCD_String(".");
3465                     ; 205 					Num_Display_LCD((PTC_Heat_Duty%2)*5);
3468                     ; 206 					Display_LCD_String("%");
3472  02fb c60000        	ld	a,_PTC_Heat_Duty
3473  02fe 44            	srl	a
3474  02ff 5f            	clrw	x
3475  0300 97            	ld	xl,a
3476  0301 8d000000      	callf	f_Num_Display_LCD
3479  0305 ae0036        	ldw	x,#L1022
3480  0308 8d000000      	callf	f_Display_LCD_String
3483  030c c60000        	ld	a,_PTC_Heat_Duty
3484  030f a401          	and	a,#1
3485  0311 97            	ld	xl,a
3486  0312 a605          	ld	a,#5
3487  0314 42            	mul	x,a
3488  0315 8d000000      	callf	f_Num_Display_LCD
3491  0319 ae0034        	ldw	x,#L3022
3493  031c               L3122:
3494  031c 8d000000      	callf	f_Display_LCD_String
3495                     ; 210 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));	
3497  0320 7b03          	ld	a,(OFST+0,sp)
3498  0322 5f            	clrw	x
3499  0323 97            	ld	xl,a
3500  0324 d60000        	ld	a,(_LCD_Line,x)
3501  0327 ab0c          	add	a,#12
3502  0329 8d000000      	callf	f_Set_LCD_Address
3504                     ; 211 				Num_Display_LCD(PTC_Fdback_Duty/2);
3506  032d c60000        	ld	a,_PTC_Fdback_Duty
3507  0330 44            	srl	a
3508  0331 5f            	clrw	x
3509  0332 97            	ld	xl,a
3510  0333 8d000000      	callf	f_Num_Display_LCD
3512                     ; 212 				Display_LCD_String(".");
3514  0337 ae0036        	ldw	x,#L1022
3515  033a 8d000000      	callf	f_Display_LCD_String
3517                     ; 213 				Num_Display_LCD((PTC_Fdback_Duty%2)*5);
3519  033e c60000        	ld	a,_PTC_Fdback_Duty
3520  0341 a401          	and	a,#1
3521  0343 97            	ld	xl,a
3522  0344 a605          	ld	a,#5
3523  0346 42            	mul	x,a
3526  0347 202a          	jpf	LC007
3527  0349               L1712:
3528                     ; 218 			else if(i==2){
3530  0349 a102          	cp	a,#2
3531  034b 2610          	jrne	L7122
3532                     ; 219 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3534  034d 5f            	clrw	x
3535  034e 97            	ld	xl,a
3536  034f d60000        	ld	a,(_LCD_Line,x)
3537  0352 ab08          	add	a,#8
3538  0354 8d000000      	callf	f_Set_LCD_Address
3540                     ; 220 				Num_Display_LCD(PS_PTC_Status[0] & 0x01);		// PTC Ready flag
3542  0358 c60000        	ld	a,_PS_PTC_Status
3545  035b 2012          	jpf	LC009
3546  035d               L7122:
3547                     ; 222 			else if(i==3){
3549  035d a103          	cp	a,#3
3550  035f 2616          	jrne	L7612
3551                     ; 223 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3553  0361 5f            	clrw	x
3554  0362 97            	ld	xl,a
3555  0363 d60000        	ld	a,(_LCD_Line,x)
3556  0366 ab08          	add	a,#8
3557  0368 8d000000      	callf	f_Set_LCD_Address
3559                     ; 224 				Num_Display_LCD(PS_PTC_Status[1] & 0x01);		// PTC Fault Flag
3561  036c c60001        	ld	a,_PS_PTC_Status+1
3562  036f               LC009:
3563  036f a401          	and	a,#1
3564  0371               LC008:
3565  0371 5f            	clrw	x
3566  0372 97            	ld	xl,a
3567  0373               LC007:
3568  0373 8d000000      	callf	f_Num_Display_LCD
3570  0377               L7612:
3571                     ; 164 		for(i=0; i<4; i++){
3573  0377 0c03          	inc	(OFST+0,sp)
3576  0379 7b03          	ld	a,(OFST+0,sp)
3577  037b a104          	cp	a,#4
3578  037d 2404ac540254  	jrult	L3212
3579                     ; 228 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3581  0383 c60003        	ld	a,_LCD_Line+3
3582  0386 ab0d          	add	a,#13
3583  0388 8d000000      	callf	f_Set_LCD_Address
3585                     ; 229 		Display_LCD_String("TX");
3587  038c ae0031        	ldw	x,#L5222
3589                     ; 230 		Num_Display_LCD(PS_Test_Pg+1);  
3592  038f acd508d5      	jpf	LC023
3593  0393               L1212:
3594                     ; 233 	else if(PS_Test_Pg == 10){
3596  0393 c60010        	ld	a,_PS_Test_Pg
3597  0396 a10a          	cp	a,#10
3598  0398 2704ac3c043c  	jrne	L1322
3599                     ; 234 		for(i=0; i<2; i++){
3601  039e 4f            	clr	a
3602  039f 6b03          	ld	(OFST+0,sp),a
3603  03a1               L3322:
3604                     ; 235 			Set_LCD_Address(LCD_Line[i]);
3606  03a1 5f            	clrw	x
3607  03a2 97            	ld	xl,a
3608  03a3 d60000        	ld	a,(_LCD_Line,x)
3609  03a6 8d000000      	callf	f_Set_LCD_Address
3611                     ; 237 			if((PS_Data_Select_flag == ON) && (PS_Data_Setting_flag == OFF) && (i == PS_Data_Step)){
3613  03aa 7201000017    	btjf	_PS_Test_Register,#0,L1422
3615  03af 7202000012    	btjt	_PS_Test_Register,#1,L1422
3617  03b4 7b03          	ld	a,(OFST+0,sp)
3618  03b6 c1000f        	cp	a,_PS_Data_Step
3619  03b9 260b          	jrne	L1422
3620                     ; 239 				if(Blink_50){Display_LCD_String("     ");}
3622  03bb 725d0000      	tnz	_Blink_50
3623  03bf 2707          	jreq	LC011
3626  03c1 ae0038        	ldw	x,#L1612
3629  03c4 2009          	jra	L7422
3630                     ; 240 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3632  03c6               L1422:
3633                     ; 242 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3635  03c6 7b03          	ld	a,(OFST+0,sp)
3636  03c8               LC011:
3638  03c8 97            	ld	xl,a
3639  03c9 a610          	ld	a,#16
3640  03cb 42            	mul	x,a
3641  03cc 1c0000        	addw	x,#_LCD_Dis_Data
3643  03cf               L7422:
3644  03cf 8d000000      	callf	f_Display_LCD_String
3645                     ; 244 			if(i==1){
3647  03d3 7b03          	ld	a,(OFST+0,sp)
3648  03d5 a101          	cp	a,#1
3649  03d7 2653          	jrne	L1522
3650                     ; 245 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3652  03d9 5f            	clrw	x
3653  03da 97            	ld	xl,a
3654  03db d60000        	ld	a,(_LCD_Line,x)
3655  03de ab08          	add	a,#8
3656  03e0 8d000000      	callf	f_Set_LCD_Address
3658                     ; 246 				if((PS_Data_Setting_flag == ON) && (i == PS_Data_Step)){
3660  03e4 720300001e    	btjf	_PS_Test_Register,#1,L3622
3662  03e9 7b03          	ld	a,(OFST+0,sp)
3663  03eb c1000f        	cp	a,_PS_Data_Step
3664  03ee 2617          	jrne	L3622
3665                     ; 247 					if((UP_Long_SW)||(DN_Long_SW)){
3667  03f0 720c000005    	btjt	_SW_Status,#6,L7522
3669  03f5 720f000002    	btjf	_SW_Status,#7,L5522
3670  03fa               L7522:
3671                     ; 248 						Num_Display_LCD(PS_Unit/2);
3673                     ; 249 						Display_LCD_String(".");
3675                     ; 250 						Num_Display_LCD((PS_Unit%2)*5);
3677                     ; 251 						Display_LCD_String("%");
3680  03fa 200b          	jpf	L3622
3681  03fc               L5522:
3682                     ; 253 					else if(Blink_50){Display_LCD_String("     ");}
3684  03fc 725d0000      	tnz	_Blink_50
3685  0400 2705          	jreq	L3622
3688  0402 ae0038        	ldw	x,#L1612
3691  0405 2021          	jpf	LC012
3692  0407               L3622:
3693                     ; 255 						Num_Display_LCD(PS_Unit/2);
3695                     ; 256 						Display_LCD_String(".");
3697                     ; 257 						Num_Display_LCD((PS_Unit%2)*5);
3699                     ; 258 						Display_LCD_String("%");
3701                     ; 261 					Num_Display_LCD(PS_Unit/2);
3704                     ; 262 					Display_LCD_String(".");
3707                     ; 263 					Num_Display_LCD((PS_Unit%2)*5);
3710                     ; 264 					Display_LCD_String("%");
3714  0407 c60012        	ld	a,_PS_Unit
3715  040a 44            	srl	a
3716  040b 5f            	clrw	x
3717  040c 97            	ld	xl,a
3718  040d 8d000000      	callf	f_Num_Display_LCD
3721  0411 ae0036        	ldw	x,#L1022
3722  0414 8d000000      	callf	f_Display_LCD_String
3725  0418 c60012        	ld	a,_PS_Unit
3726  041b a401          	and	a,#1
3727  041d 97            	ld	xl,a
3728  041e a605          	ld	a,#5
3729  0420 42            	mul	x,a
3730  0421 8d000000      	callf	f_Num_Display_LCD
3733  0425 ae0034        	ldw	x,#L3022
3734  0428               LC012:
3735  0428 8d000000      	callf	f_Display_LCD_String
3737  042c               L1522:
3738                     ; 234 		for(i=0; i<2; i++){
3740  042c 0c03          	inc	(OFST+0,sp)
3743  042e 7b03          	ld	a,(OFST+0,sp)
3744  0430 a102          	cp	a,#2
3745  0432 2404aca103a1  	jrult	L3322
3747  0438 ace308e3      	jra	L7222
3748  043c               L1322:
3749                     ; 271 		for(i=0;i<4;i++){
3751  043c 4f            	clr	a
3752  043d 6b03          	ld	(OFST+0,sp),a
3753  043f               L3722:
3754                     ; 272 			Set_LCD_Address(LCD_Line[i]);
3756  043f 5f            	clrw	x
3757  0440 97            	ld	xl,a
3758  0441 d60000        	ld	a,(_LCD_Line,x)
3759  0444 8d000000      	callf	f_Set_LCD_Address
3761                     ; 273 			Display_LCD_String(LCD_Dis_Data[i]);
3763  0448 7b03          	ld	a,(OFST+0,sp)
3764  044a 97            	ld	xl,a
3765  044b a610          	ld	a,#16
3766  044d 42            	mul	x,a
3767  044e 1c0000        	addw	x,#_LCD_Dis_Data
3768  0451 8d000000      	callf	f_Display_LCD_String
3770                     ; 271 		for(i=0;i<4;i++){
3772  0455 0c03          	inc	(OFST+0,sp)
3775  0457 7b03          	ld	a,(OFST+0,sp)
3776  0459 a104          	cp	a,#4
3777  045b 25e2          	jrult	L3722
3778                     ; 277 		if(PS_Test_Pg == 1){
3780  045d c60010        	ld	a,_PS_Test_Pg
3781  0460 4a            	dec	a
3782  0461 2704ac4c054c  	jrne	L1032
3783                     ; 279 			Set_LCD_Address((unsigned char)(LCD_Line[0]+5));
3785  0467 c60000        	ld	a,_LCD_Line
3786  046a ab05          	add	a,#5
3787  046c 8d000000      	callf	f_Set_LCD_Address
3789                     ; 280 			if(PTC_BATT_VALUE == 510){Display_LCD_String("Fa");}
3791  0470 ce0000        	ldw	x,_PTC_BATT_VALUE
3792  0473 a301fe        	cpw	x,#510
3793  0476 2609          	jrne	L3032
3796  0478 ae002e        	ldw	x,#L5032
3797  047b 8d000000      	callf	f_Display_LCD_String
3800  047f 2004          	jra	L7032
3801  0481               L3032:
3802                     ; 281 			else{ Num_Display_LCD(PTC_BATT_VALUE);}  	//HV Display
3804  0481 8d000000      	callf	f_Num_Display_LCD
3806  0485               L7032:
3807                     ; 283 			Set_LCD_Address((unsigned char)(LCD_Line[0]+9));
3809  0485 c60000        	ld	a,_LCD_Line
3810  0488 ab09          	add	a,#9
3811  048a 8d000000      	callf	f_Set_LCD_Address
3813                     ; 284 			Display_LCD_String("V");
3815  048e ae002c        	ldw	x,#L1132
3816  0491 8d000000      	callf	f_Display_LCD_String
3818                     ; 287 			Set_LCD_Address((unsigned char)(LCD_Line[1]+5));		//Current Display
3820  0495 c60001        	ld	a,_LCD_Line+1
3821  0498 ab05          	add	a,#5
3822  049a 8d000000      	callf	f_Set_LCD_Address
3824                     ; 288 			Num_Display_LCD(PTC_Cur_VALUE/5);   
3826  049e c60000        	ld	a,_PTC_Cur_VALUE
3827  04a1 5f            	clrw	x
3828  04a2 97            	ld	xl,a
3829  04a3 a605          	ld	a,#5
3830  04a5 8d000000      	callf	d_sdivx
3832  04a9 8d000000      	callf	f_Num_Display_LCD
3834                     ; 289 			Display_LCD_String(".");
3836  04ad ae0036        	ldw	x,#L1022
3837  04b0 8d000000      	callf	f_Display_LCD_String
3839                     ; 290 			Num_Display_LCD(((PTC_Cur_VALUE%5)*2));
3841  04b4 c60000        	ld	a,_PTC_Cur_VALUE
3842  04b7 5f            	clrw	x
3843  04b8 97            	ld	xl,a
3844  04b9 a605          	ld	a,#5
3845  04bb 8d000000      	callf	d_smodx
3847  04bf 58            	sllw	x
3848  04c0 8d000000      	callf	f_Num_Display_LCD
3850                     ; 292 			Set_LCD_Address((unsigned char)(LCD_Line[1]+9));
3852  04c4 c60001        	ld	a,_LCD_Line+1
3853  04c7 ab09          	add	a,#9
3854  04c9 8d000000      	callf	f_Set_LCD_Address
3856                     ; 293 			Display_LCD_String("A");
3858  04cd ae002a        	ldw	x,#L3132
3859  04d0 8d000000      	callf	f_Display_LCD_String
3861                     ; 296 			Set_LCD_Address((unsigned char)(LCD_Line[2]+5));		//Power Display
3863  04d4 c60002        	ld	a,_LCD_Line+2
3864  04d7 ab05          	add	a,#5
3865  04d9 8d000000      	callf	f_Set_LCD_Address
3867                     ; 297 			if(PTC_PWR_VALUE == 0xFFFF){Display_LCD_String("Fa");}
3869  04dd ce0000        	ldw	x,_PTC_PWR_VALUE
3870  04e0 a3ffff        	cpw	x,#65535
3871  04e3 2609          	jrne	L5132
3874  04e5 ae002e        	ldw	x,#L5032
3875  04e8 8d000000      	callf	f_Display_LCD_String
3878  04ec 2004          	jra	L7132
3879  04ee               L5132:
3880                     ; 298 			else{ Num_Display_LCD(PTC_PWR_VALUE);}   
3882  04ee 8d000000      	callf	f_Num_Display_LCD
3884  04f2               L7132:
3885                     ; 300 			Set_LCD_Address((unsigned char)(LCD_Line[2]+9));
3887  04f2 c60002        	ld	a,_LCD_Line+2
3888  04f5 ab09          	add	a,#9
3889  04f7 8d000000      	callf	f_Set_LCD_Address
3891                     ; 301 			Display_LCD_String("W");
3893  04fb ae0028        	ldw	x,#L1232
3894  04fe 8d000000      	callf	f_Display_LCD_String
3896                     ; 304 			Set_LCD_Address((unsigned char)(LCD_Line[3]+5));
3898  0502 c60003        	ld	a,_LCD_Line+3
3899  0505 ab05          	add	a,#5
3900  0507 8d000000      	callf	f_Set_LCD_Address
3902                     ; 305 			if(PTC_RCore_Temp == 0xFF){Display_LCD_String("Fa");}
3904  050b c60000        	ld	a,_PTC_RCore_Temp
3905  050e a1ff          	cp	a,#255
3906  0510 2609          	jrne	L3232
3909  0512 ae002e        	ldw	x,#L5032
3910  0515 8d000000      	callf	f_Display_LCD_String
3913  0519 2021          	jra	L5232
3914  051b               L3232:
3915                     ; 306 			else if(PTC_RCore_Temp < 40){
3917  051b a128          	cp	a,#40
3918  051d 2414          	jruge	L7232
3919                     ; 307 				Display_LCD_String("-");
3921  051f ae0026        	ldw	x,#L1332
3922  0522 8d000000      	callf	f_Display_LCD_String
3924                     ; 308 				Num_Display_LCD(40-PTC_RCore_Temp);
3926  0526 4f            	clr	a
3927  0527 97            	ld	xl,a
3928  0528 a628          	ld	a,#40
3929  052a c00000        	sub	a,_PTC_RCore_Temp
3930  052d 2401          	jrnc	L073
3931  052f 5a            	decw	x
3932  0530               L073:
3933  0530 02            	rlwa	x,a
3936  0531 2005          	jpf	LC014
3937  0533               L7232:
3938                     ; 309 			}else{ Num_Display_LCD(PTC_RCore_Temp-40);}  	//Left Coretemp Display
3940  0533 5f            	clrw	x
3941  0534 97            	ld	xl,a
3942  0535 1d0028        	subw	x,#40
3943  0538               LC014:
3944  0538 8d000000      	callf	f_Num_Display_LCD
3946  053c               L5232:
3947                     ; 311 			Set_LCD_Address((unsigned char)(LCD_Line[3]+9));
3949  053c c60003        	ld	a,_LCD_Line+3
3950  053f ab09          	add	a,#9
3951  0541 8d000000      	callf	f_Set_LCD_Address
3953                     ; 312 			Display_LCD_String("C");
3955  0545 ae0024        	ldw	x,#L5332
3958  0548 ac5a085a      	jpf	LC022
3959  054c               L1032:
3960                     ; 317 		else if(PS_Test_Pg == 2){
3962  054c c60010        	ld	a,_PS_Test_Pg
3963  054f a102          	cp	a,#2
3964  0551 2704ac300630  	jrne	L1432
3965                     ; 320 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
3967  0557 c60000        	ld	a,_LCD_Line
3968  055a ab08          	add	a,#8
3969  055c 8d000000      	callf	f_Set_LCD_Address
3971                     ; 321 			Num_Display_LCD(PTC_SW_Ver>>4);  			//SoftWare Version Display
3973  0560 c60000        	ld	a,_PTC_SW_Ver
3974  0563 4e            	swap	a
3975  0564 a40f          	and	a,#15
3976  0566 5f            	clrw	x
3977  0567 97            	ld	xl,a
3978  0568 8d000000      	callf	f_Num_Display_LCD
3980                     ; 322 			Display_LCD_String(".");
3982  056c ae0036        	ldw	x,#L1022
3983  056f 8d000000      	callf	f_Display_LCD_String
3985                     ; 323 			Num_Display_LCD(PTC_SW_Ver&0x0F);  			//SoftWare Version Display
3987  0573 c60000        	ld	a,_PTC_SW_Ver
3988  0576 a40f          	and	a,#15
3989  0578 5f            	clrw	x
3990  0579 97            	ld	xl,a
3991  057a 8d000000      	callf	f_Num_Display_LCD
3993                     ; 325 			Ptc1State = (unsigned char)((PS_PTC_Status[0] & 0x0C)>>2);
3995  057e c60000        	ld	a,_PS_PTC_Status
3996  0581 a40c          	and	a,#12
3997  0583 44            	srl	a
3998  0584 44            	srl	a
3999  0585 6b01          	ld	(OFST-2,sp),a
4000                     ; 326 			Ptc2State = (unsigned char)((PS_PTC_Status[0] & 0x30)>>4);
4002  0587 c60000        	ld	a,_PS_PTC_Status
4003  058a 4e            	swap	a
4004  058b a403          	and	a,#3
4005  058d 6b02          	ld	(OFST-1,sp),a
4006                     ; 327 			Ptc3State = (unsigned char)((PS_PTC_Status[0] & 0xC0)>>6);
4008  058f c60000        	ld	a,_PS_PTC_Status
4009  0592 4e            	swap	a
4010  0593 a40c          	and	a,#12
4011  0595 44            	srl	a
4012  0596 44            	srl	a
4013  0597 6b03          	ld	(OFST+0,sp),a
4014                     ; 330 			Set_LCD_Address((unsigned char)(LCD_Line[1]+6));
4016  0599 c60001        	ld	a,_LCD_Line+1
4017  059c ab06          	add	a,#6
4018  059e 8d000000      	callf	f_Set_LCD_Address
4020                     ; 332 			if(Ptc1State == 0){Display_LCD_String("STOP");}
4022  05a2 7b01          	ld	a,(OFST-2,sp)
4023  05a4 2605          	jrne	L3432
4026  05a6 ae001f        	ldw	x,#L5432
4029  05a9 2019          	jpf	LC015
4030  05ab               L3432:
4031                     ; 333 			else if(Ptc1State == 1){Display_LCD_String("Oper");}
4033  05ab a101          	cp	a,#1
4034  05ad 2605          	jrne	L1532
4037  05af ae001a        	ldw	x,#L3532
4040  05b2 2010          	jpf	LC015
4041  05b4               L1532:
4042                     ; 334 			else if(Ptc1State == 2){Display_LCD_String("fail");}
4044  05b4 a102          	cp	a,#2
4045  05b6 2605          	jrne	L7532
4048  05b8 ae0015        	ldw	x,#L1632
4051  05bb 2007          	jpf	LC015
4052  05bd               L7532:
4053                     ; 335 			else if(Ptc1State == 3){Display_LCD_String("Limit");}
4055  05bd a103          	cp	a,#3
4056  05bf 2607          	jrne	L7432
4059  05c1 ae000f        	ldw	x,#L7632
4060  05c4               LC015:
4061  05c4 8d000000      	callf	f_Display_LCD_String
4063  05c8               L7432:
4064                     ; 338 			Set_LCD_Address((unsigned char)(LCD_Line[2]+6));
4066  05c8 c60002        	ld	a,_LCD_Line+2
4067  05cb ab06          	add	a,#6
4068  05cd 8d000000      	callf	f_Set_LCD_Address
4070                     ; 339 			if(Ptc2State == 0){Display_LCD_String("STOP");}
4072  05d1 7b02          	ld	a,(OFST-1,sp)
4073  05d3 2605          	jrne	L1732
4076  05d5 ae001f        	ldw	x,#L5432
4079  05d8 2019          	jpf	LC016
4080  05da               L1732:
4081                     ; 340 			else if(Ptc2State == 1){Display_LCD_String("Oper");}
4083  05da a101          	cp	a,#1
4084  05dc 2605          	jrne	L5732
4087  05de ae001a        	ldw	x,#L3532
4090  05e1 2010          	jpf	LC016
4091  05e3               L5732:
4092                     ; 341 			else if(Ptc2State == 2){Display_LCD_String("fail");}
4094  05e3 a102          	cp	a,#2
4095  05e5 2605          	jrne	L1042
4098  05e7 ae0015        	ldw	x,#L1632
4101  05ea 2007          	jpf	LC016
4102  05ec               L1042:
4103                     ; 342 			else if(Ptc2State == 3){Display_LCD_String("Limit");}
4105  05ec a103          	cp	a,#3
4106  05ee 2607          	jrne	L3732
4109  05f0 ae000f        	ldw	x,#L7632
4110  05f3               LC016:
4111  05f3 8d000000      	callf	f_Display_LCD_String
4113  05f7               L3732:
4114                     ; 345 			Set_LCD_Address((unsigned char)(LCD_Line[3]+6));
4116  05f7 c60003        	ld	a,_LCD_Line+3
4117  05fa ab06          	add	a,#6
4118  05fc 8d000000      	callf	f_Set_LCD_Address
4120                     ; 346 			if(Ptc3State == 0){Display_LCD_String("STOP");}
4122  0600 7b03          	ld	a,(OFST+0,sp)
4123  0602 2607          	jrne	L7042
4126  0604 ae001f        	ldw	x,#L5432
4129  0607 ac5a085a      	jpf	LC022
4130  060b               L7042:
4131                     ; 347 			else if(Ptc3State == 1){Display_LCD_String("Oper");}
4133  060b a101          	cp	a,#1
4134  060d 2607          	jrne	L3142
4137  060f ae001a        	ldw	x,#L3532
4140  0612 ac5a085a      	jpf	LC022
4141  0616               L3142:
4142                     ; 348 			else if(Ptc3State == 2){Display_LCD_String("fail");}
4144  0616 a102          	cp	a,#2
4145  0618 2607          	jrne	L7142
4148  061a ae0015        	ldw	x,#L1632
4151  061d ac5a085a      	jpf	LC022
4152  0621               L7142:
4153                     ; 349 			else if(Ptc3State == 3){Display_LCD_String("Limit");}
4155  0621 a103          	cp	a,#3
4156  0623 2704accc08cc  	jrne	L7332
4159  0629 ae000f        	ldw	x,#L7632
4161  062c ac5a085a      	jpf	LC022
4162  0630               L1432:
4163                     ; 352 		else if(PS_Test_Pg == 3){
4165  0630 c60010        	ld	a,_PS_Test_Pg
4166  0633 a103          	cp	a,#3
4167  0635 2654          	jrne	L7242
4168                     ; 354 			Set_LCD_Address((unsigned char)(LCD_Line[0]+6));
4170  0637 c60000        	ld	a,_LCD_Line
4171  063a ab06          	add	a,#6
4172  063c 8d000000      	callf	f_Set_LCD_Address
4174                     ; 355 			Num_Display_LCD(PS_PTC_Status[2] & 0x01);  		//LV Low Flag
4176  0640 c60002        	ld	a,_PS_PTC_Status+2
4177  0643 a401          	and	a,#1
4178  0645 5f            	clrw	x
4179  0646 97            	ld	xl,a
4180  0647 8d000000      	callf	f_Num_Display_LCD
4182                     ; 357 			Set_LCD_Address((unsigned char)(LCD_Line[1]+6));
4184  064b c60001        	ld	a,_LCD_Line+1
4185  064e ab06          	add	a,#6
4186  0650 8d000000      	callf	f_Set_LCD_Address
4188                     ; 358 			Num_Display_LCD((PS_PTC_Status[2] & 0x02)>>1);  	//LV High Flag
4190  0654 c60002        	ld	a,_PS_PTC_Status+2
4191  0657 a402          	and	a,#2
4192  0659 44            	srl	a
4193  065a 5f            	clrw	x
4194  065b 97            	ld	xl,a
4195  065c 8d000000      	callf	f_Num_Display_LCD
4197                     ; 360 			Set_LCD_Address((unsigned char)(LCD_Line[2]+6));
4199  0660 c60002        	ld	a,_LCD_Line+2
4200  0663 ab06          	add	a,#6
4201  0665 8d000000      	callf	f_Set_LCD_Address
4203                     ; 361 			Num_Display_LCD((PS_PTC_Status[2] & 0x04)>>2);  	//HV Low  Flag
4205  0669 c60002        	ld	a,_PS_PTC_Status+2
4206  066c a404          	and	a,#4
4207  066e 44            	srl	a
4208  066f 44            	srl	a
4209  0670 5f            	clrw	x
4210  0671 97            	ld	xl,a
4211  0672 8d000000      	callf	f_Num_Display_LCD
4213                     ; 363 			Set_LCD_Address((unsigned char)(LCD_Line[3]+6));
4215  0676 c60003        	ld	a,_LCD_Line+3
4216  0679 ab06          	add	a,#6
4217  067b 8d000000      	callf	f_Set_LCD_Address
4219                     ; 364 			Num_Display_LCD((PS_PTC_Status[2] & 0x08)>>3);  	//HV High Flag
4221  067f c60002        	ld	a,_PS_PTC_Status+2
4222  0682 a408          	and	a,#8
4223  0684 44            	srl	a
4224  0685 44            	srl	a
4225  0686 44            	srl	a
4228  0687 acc608c6      	jpf	LC021
4229  068b               L7242:
4230                     ; 366 		else if(PS_Test_Pg == 4){
4232  068b c60010        	ld	a,_PS_Test_Pg
4233  068e a104          	cp	a,#4
4234  0690 2652          	jrne	L3342
4235                     ; 367 			Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
4237  0692 c60000        	ld	a,_LCD_Line
4238  0695 ab07          	add	a,#7
4239  0697 8d000000      	callf	f_Set_LCD_Address
4241                     ; 368 			Num_Display_LCD((PS_PTC_Status[2] & 0x10)>>4);  		//Over Current fail Flag
4243  069b c60002        	ld	a,_PS_PTC_Status+2
4244  069e 4e            	swap	a
4245  069f a401          	and	a,#1
4246  06a1 5f            	clrw	x
4247  06a2 97            	ld	xl,a
4248  06a3 8d000000      	callf	f_Num_Display_LCD
4250                     ; 370 			Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
4252  06a7 c60001        	ld	a,_LCD_Line+1
4253  06aa ab07          	add	a,#7
4254  06ac 8d000000      	callf	f_Set_LCD_Address
4256                     ; 371 			Num_Display_LCD((PS_PTC_Status[2] & 0x80)>>7);	  	//Core Thermal Shutdown fail Flag
4258  06b0 c60002        	ld	a,_PS_PTC_Status+2
4259  06b3 a480          	and	a,#128
4260  06b5 49            	rlc	a
4261  06b6 4f            	clr	a
4262  06b7 49            	rlc	a
4263  06b8 5f            	clrw	x
4264  06b9 97            	ld	xl,a
4265  06ba 8d000000      	callf	f_Num_Display_LCD
4267                     ; 373 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4269  06be c60002        	ld	a,_LCD_Line+2
4270  06c1 ab07          	add	a,#7
4271  06c3 8d000000      	callf	f_Set_LCD_Address
4273                     ; 374 			Num_Display_LCD(PS_PTC_Status[3] & 0x01);  			//PCB Thermal Shut dowm fail Flag
4275  06c7 c60003        	ld	a,_PS_PTC_Status+3
4276  06ca a401          	and	a,#1
4277  06cc 5f            	clrw	x
4278  06cd 97            	ld	xl,a
4279  06ce 8d000000      	callf	f_Num_Display_LCD
4281                     ; 376 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4283  06d2 c60003        	ld	a,_LCD_Line+3
4284  06d5 ab07          	add	a,#7
4285  06d7 8d000000      	callf	f_Set_LCD_Address
4287                     ; 377 			Num_Display_LCD(PS_PTC_Status[4] & 0x01);  			//Time out ID 111
4289  06db c60004        	ld	a,_PS_PTC_Status+4
4290  06de a401          	and	a,#1
4293  06e0 acc608c6      	jpf	LC021
4294  06e4               L3342:
4295                     ; 379 		else if(PS_Test_Pg == 5){
4297  06e4 c60010        	ld	a,_PS_Test_Pg
4298  06e7 a105          	cp	a,#5
4299  06e9 2653          	jrne	L7342
4300                     ; 380 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4302  06eb c60000        	ld	a,_LCD_Line
4303  06ee ab08          	add	a,#8
4304  06f0 8d000000      	callf	f_Set_LCD_Address
4306                     ; 381 			Num_Display_LCD(PS_PTC_Status[5] & 0x01);  			//Failure HV Sensor
4308  06f4 c60005        	ld	a,_PS_PTC_Status+5
4309  06f7 a401          	and	a,#1
4310  06f9 5f            	clrw	x
4311  06fa 97            	ld	xl,a
4312  06fb 8d000000      	callf	f_Num_Display_LCD
4314                     ; 383 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4316  06ff c60001        	ld	a,_LCD_Line+1
4317  0702 ab08          	add	a,#8
4318  0704 8d000000      	callf	f_Set_LCD_Address
4320                     ; 384 			Num_Display_LCD((PS_PTC_Status[5] & 0x02)>>1);	  	//Failure LV Sensor
4322  0708 c60005        	ld	a,_PS_PTC_Status+5
4323  070b a402          	and	a,#2
4324  070d 44            	srl	a
4325  070e 5f            	clrw	x
4326  070f 97            	ld	xl,a
4327  0710 8d000000      	callf	f_Num_Display_LCD
4329                     ; 386 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4331  0714 c60002        	ld	a,_LCD_Line+2
4332  0717 ab08          	add	a,#8
4333  0719 8d000000      	callf	f_Set_LCD_Address
4335                     ; 387 			Num_Display_LCD((PS_PTC_Status[5] & 0x04)>>2);  		//Failure Current Sensor
4337  071d c60005        	ld	a,_PS_PTC_Status+5
4338  0720 a404          	and	a,#4
4339  0722 44            	srl	a
4340  0723 44            	srl	a
4341  0724 5f            	clrw	x
4342  0725 97            	ld	xl,a
4343  0726 8d000000      	callf	f_Num_Display_LCD
4345                     ; 389 			Set_LCD_Address((unsigned char)(LCD_Line[3]+8));
4347  072a c60003        	ld	a,_LCD_Line+3
4348  072d ab08          	add	a,#8
4349  072f 8d000000      	callf	f_Set_LCD_Address
4351                     ; 390 			Num_Display_LCD((PS_PTC_Status[5] & 0x20)>>5);  		//Failure Left Core temp sensor
4353  0733 c60005        	ld	a,_PS_PTC_Status+5
4354  0736 4e            	swap	a
4355  0737 a402          	and	a,#2
4356  0739 44            	srl	a
4359  073a acc608c6      	jpf	LC021
4360  073e               L7342:
4361                     ; 392 		else if(PS_Test_Pg == 6){
4363  073e c60010        	ld	a,_PS_Test_Pg
4364  0741 a106          	cp	a,#6
4365  0743 263b          	jrne	L3442
4366                     ; 394 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4368  0745 c60000        	ld	a,_LCD_Line
4369  0748 ab08          	add	a,#8
4370  074a 8d000000      	callf	f_Set_LCD_Address
4372                     ; 395 			Num_Display_LCD((PS_PTC_Status[5] & 0x80)>>7);	  	//Failure PCB Temp1 Sensor
4374  074e c60005        	ld	a,_PS_PTC_Status+5
4375  0751 a480          	and	a,#128
4376  0753 49            	rlc	a
4377  0754 4f            	clr	a
4378  0755 49            	rlc	a
4379  0756 5f            	clrw	x
4380  0757 97            	ld	xl,a
4381  0758 8d000000      	callf	f_Num_Display_LCD
4383                     ; 397 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4385  075c c60001        	ld	a,_LCD_Line+1
4386  075f ab08          	add	a,#8
4387  0761 8d000000      	callf	f_Set_LCD_Address
4389                     ; 398 			Num_Display_LCD(PS_PTC_Status[6] & 0x01);  			//Failure PCB Temp2 Sensor
4391  0765 c60006        	ld	a,_PS_PTC_Status+6
4392  0768 a401          	and	a,#1
4393  076a 5f            	clrw	x
4394  076b 97            	ld	xl,a
4395  076c 8d000000      	callf	f_Num_Display_LCD
4397                     ; 400 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4399  0770 c60002        	ld	a,_LCD_Line+2
4400  0773 ab08          	add	a,#8
4401  0775 8d000000      	callf	f_Set_LCD_Address
4403                     ; 401 			Num_Display_LCD(PTC_Limit_Cause);  						//Limit Cause
4405  0779 c60000        	ld	a,_PTC_Limit_Cause
4408  077c acc608c6      	jpf	LC021
4409  0780               L3442:
4410                     ; 403 		else if(PS_Test_Pg == 7){
4412  0780 c60010        	ld	a,_PS_Test_Pg
4413  0783 a107          	cp	a,#7
4414  0785 2704ac850885  	jrne	L7442
4415                     ; 404 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4417  078b c60000        	ld	a,_LCD_Line
4418  078e ab08          	add	a,#8
4419  0790 8d000000      	callf	f_Set_LCD_Address
4421                     ; 405 			if(PS_PTC_Debug[0] == 0xFF){Display_LCD_String("Fa");}
4423  0794 c60007        	ld	a,_PS_PTC_Debug
4424  0797 4c            	inc	a
4425  0798 2609          	jrne	L1542
4428  079a ae002e        	ldw	x,#L5032
4429  079d 8d000000      	callf	f_Display_LCD_String
4432  07a1 2027          	jra	L3542
4433  07a3               L1542:
4434                     ; 406 			else if(PS_PTC_Debug[0] < 40){
4436  07a3 c60007        	ld	a,_PS_PTC_Debug
4437  07a6 a128          	cp	a,#40
4438  07a8 2414          	jruge	L5542
4439                     ; 407 				Display_LCD_String("-");
4441  07aa ae0026        	ldw	x,#L1332
4442  07ad 8d000000      	callf	f_Display_LCD_String
4444                     ; 408 				Num_Display_LCD(40-PS_PTC_Debug[0]);
4446  07b1 4f            	clr	a
4447  07b2 97            	ld	xl,a
4448  07b3 a628          	ld	a,#40
4449  07b5 c00007        	sub	a,_PS_PTC_Debug
4450  07b8 2401          	jrnc	L255
4451  07ba 5a            	decw	x
4452  07bb               L255:
4453  07bb 02            	rlwa	x,a
4456  07bc 2008          	jpf	LC017
4457  07be               L5542:
4458                     ; 410 			else{ Num_Display_LCD(PS_PTC_Debug[0]-40);}
4460  07be c60007        	ld	a,_PS_PTC_Debug
4461  07c1 5f            	clrw	x
4462  07c2 97            	ld	xl,a
4463  07c3 1d0028        	subw	x,#40
4464  07c6               LC017:
4465  07c6 8d000000      	callf	f_Num_Display_LCD
4467  07ca               L3542:
4468                     ; 412 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4470  07ca c60001        	ld	a,_LCD_Line+1
4471  07cd ab08          	add	a,#8
4472  07cf 8d000000      	callf	f_Set_LCD_Address
4474                     ; 413 			if(PS_PTC_Debug[1] == 0xFF){Display_LCD_String("Fa");}
4476  07d3 c60008        	ld	a,_PS_PTC_Debug+1
4477  07d6 4c            	inc	a
4478  07d7 2609          	jrne	L1642
4481  07d9 ae002e        	ldw	x,#L5032
4482  07dc 8d000000      	callf	f_Display_LCD_String
4485  07e0 2027          	jra	L3642
4486  07e2               L1642:
4487                     ; 414 			else if(PS_PTC_Debug[1] < 40){
4489  07e2 c60008        	ld	a,_PS_PTC_Debug+1
4490  07e5 a128          	cp	a,#40
4491  07e7 2414          	jruge	L5642
4492                     ; 415 				Display_LCD_String("-");
4494  07e9 ae0026        	ldw	x,#L1332
4495  07ec 8d000000      	callf	f_Display_LCD_String
4497                     ; 416 				Num_Display_LCD(40-PS_PTC_Debug[1]);
4499  07f0 4f            	clr	a
4500  07f1 97            	ld	xl,a
4501  07f2 a628          	ld	a,#40
4502  07f4 c00008        	sub	a,_PS_PTC_Debug+1
4503  07f7 2401          	jrnc	L665
4504  07f9 5a            	decw	x
4505  07fa               L665:
4506  07fa 02            	rlwa	x,a
4509  07fb 2008          	jpf	LC018
4510  07fd               L5642:
4511                     ; 418 			else{ Num_Display_LCD(PS_PTC_Debug[1]-40);}
4513  07fd c60008        	ld	a,_PS_PTC_Debug+1
4514  0800 5f            	clrw	x
4515  0801 97            	ld	xl,a
4516  0802 1d0028        	subw	x,#40
4517  0805               LC018:
4518  0805 8d000000      	callf	f_Num_Display_LCD
4520  0809               L3642:
4521                     ; 420 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4523  0809 c60002        	ld	a,_LCD_Line+2
4524  080c ab08          	add	a,#8
4525  080e 8d000000      	callf	f_Set_LCD_Address
4527                     ; 421 			if(PS_PTC_Debug[2] == 0xFF){Display_LCD_String("Fa");}
4529  0812 c60009        	ld	a,_PS_PTC_Debug+2
4530  0815 4c            	inc	a
4531  0816 2609          	jrne	L1742
4534  0818 ae002e        	ldw	x,#L5032
4535  081b 8d000000      	callf	f_Display_LCD_String
4538  081f 2027          	jra	L3742
4539  0821               L1742:
4540                     ; 422 			else if(PS_PTC_Debug[2] < 40){
4542  0821 c60009        	ld	a,_PS_PTC_Debug+2
4543  0824 a128          	cp	a,#40
4544  0826 2414          	jruge	L5742
4545                     ; 423 				Display_LCD_String("-");
4547  0828 ae0026        	ldw	x,#L1332
4548  082b 8d000000      	callf	f_Display_LCD_String
4550                     ; 424 				Num_Display_LCD(40-PS_PTC_Debug[2]);
4552  082f 4f            	clr	a
4553  0830 97            	ld	xl,a
4554  0831 a628          	ld	a,#40
4555  0833 c00009        	sub	a,_PS_PTC_Debug+2
4556  0836 2401          	jrnc	L206
4557  0838 5a            	decw	x
4558  0839               L206:
4559  0839 02            	rlwa	x,a
4562  083a 2008          	jpf	LC019
4563  083c               L5742:
4564                     ; 426 			else{ Num_Display_LCD(PS_PTC_Debug[2]-40);}
4566  083c c60009        	ld	a,_PS_PTC_Debug+2
4567  083f 5f            	clrw	x
4568  0840 97            	ld	xl,a
4569  0841 1d0028        	subw	x,#40
4570  0844               LC019:
4571  0844 8d000000      	callf	f_Num_Display_LCD
4573  0848               L3742:
4574                     ; 428 			Set_LCD_Address((unsigned char)(LCD_Line[3]+8));
4576  0848 c60003        	ld	a,_LCD_Line+3
4577  084b ab08          	add	a,#8
4578  084d 8d000000      	callf	f_Set_LCD_Address
4580                     ; 429 			if(PS_PTC_Debug[3] == 0xFF){Display_LCD_String("Fa");}
4582  0851 c6000a        	ld	a,_PS_PTC_Debug+3
4583  0854 4c            	inc	a
4584  0855 2609          	jrne	L1052
4587  0857 ae002e        	ldw	x,#L5032
4588  085a               LC022:
4589  085a 8d000000      	callf	f_Display_LCD_String
4592  085e 206c          	jra	L7332
4593  0860               L1052:
4594                     ; 430 			else if(PS_PTC_Debug[3] < 40){
4596  0860 c6000a        	ld	a,_PS_PTC_Debug+3
4597  0863 a128          	cp	a,#40
4598  0865 2414          	jruge	L5052
4599                     ; 431 				Display_LCD_String("-");
4601  0867 ae0026        	ldw	x,#L1332
4602  086a 8d000000      	callf	f_Display_LCD_String
4604                     ; 432 				Num_Display_LCD(40-PS_PTC_Debug[3]);
4606  086e 4f            	clr	a
4607  086f 97            	ld	xl,a
4608  0870 a628          	ld	a,#40
4609  0872 c0000a        	sub	a,_PS_PTC_Debug+3
4610  0875 2401          	jrnc	L616
4611  0877 5a            	decw	x
4612  0878               L616:
4613  0878 02            	rlwa	x,a
4616  0879 204d          	jpf	LC020
4617  087b               L5052:
4618                     ; 434 			else{ Num_Display_LCD(PS_PTC_Debug[3]-40);}
4620  087b c6000a        	ld	a,_PS_PTC_Debug+3
4621  087e 5f            	clrw	x
4622  087f 97            	ld	xl,a
4623  0880 1d0028        	subw	x,#40
4625  0883 2043          	jpf	LC020
4626  0885               L7442:
4627                     ; 437 		else if(PS_Test_Pg == 8){
4629  0885 c60010        	ld	a,_PS_Test_Pg
4630  0888 a108          	cp	a,#8
4631  088a 2640          	jrne	L7332
4632                     ; 438 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4634  088c c60000        	ld	a,_LCD_Line
4635  088f ab08          	add	a,#8
4636  0891 8d000000      	callf	f_Set_LCD_Address
4638                     ; 439 			Num_Display_LCD(PS_PTC_Debug[4]/10);
4640  0895 c6000b        	ld	a,_PS_PTC_Debug+4
4641  0898 5f            	clrw	x
4642  0899 97            	ld	xl,a
4643  089a a60a          	ld	a,#10
4644  089c 8d000000      	callf	d_sdivx
4646  08a0 8d000000      	callf	f_Num_Display_LCD
4648                     ; 440 			Display_LCD_String(".");
4650  08a4 ae0036        	ldw	x,#L1022
4651  08a7 8d000000      	callf	f_Display_LCD_String
4653                     ; 441 			Num_Display_LCD(PS_PTC_Debug[4]%10);
4655  08ab c6000b        	ld	a,_PS_PTC_Debug+4
4656  08ae 5f            	clrw	x
4657  08af 97            	ld	xl,a
4658  08b0 a60a          	ld	a,#10
4659  08b2 8d000000      	callf	d_smodx
4661  08b6 8d000000      	callf	f_Num_Display_LCD
4663                     ; 443 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4665  08ba c60001        	ld	a,_LCD_Line+1
4666  08bd ab08          	add	a,#8
4667  08bf 8d000000      	callf	f_Set_LCD_Address
4669                     ; 444 			Num_Display_LCD(PS_PTC_Debug[5]);
4671  08c3 c6000c        	ld	a,_PS_PTC_Debug+5
4672  08c6               LC021:
4673  08c6 5f            	clrw	x
4674  08c7 97            	ld	xl,a
4675  08c8               LC020:
4676  08c8 8d000000      	callf	f_Num_Display_LCD
4678  08cc               L7332:
4679                     ; 448 		Set_LCD_Address((unsigned char)(0xD0+13));
4681  08cc a6dd          	ld	a,#221
4682  08ce 8d000000      	callf	f_Set_LCD_Address
4684                     ; 449 		Display_LCD_String("RX");
4686  08d2 ae000c        	ldw	x,#L5152
4688                     ; 450 		Num_Display_LCD(PS_Test_Pg+1);  
4690  08d5               LC023:
4691  08d5 8d000000      	callf	f_Display_LCD_String
4693  08d9 c60010        	ld	a,_PS_Test_Pg
4694  08dc 5f            	clrw	x
4695  08dd 97            	ld	xl,a
4696  08de 5c            	incw	x
4697  08df 8d000000      	callf	f_Num_Display_LCD
4699  08e3               L7222:
4700                     ; 454 	if(PS_Trans_flag == ON){
4702  08e3 a60d          	ld	a,#13
4703  08e5 7205000014    	btjf	_PS_Test_Register,#2,L7152
4704                     ; 455 		Set_LCD_Address((unsigned char)(0x00+13));
4706  08ea 8d000000      	callf	f_Set_LCD_Address
4708                     ; 456 		if(Blink_30){Display_LCD_String("COM");}
4710  08ee 725d0000      	tnz	_Blink_30
4711  08f2 2705          	jreq	L1252
4714  08f4 ae0008        	ldw	x,#L3252
4717  08f7 200c          	jra	L1352
4718  08f9               L1252:
4719                     ; 457 		else{Display_LCD_String("   ");}
4721  08f9 ae0004        	ldw	x,#L7252
4723  08fc 2007          	jra	L1352
4724  08fe               L7152:
4725                     ; 460 		Set_LCD_Address((unsigned char)(0x00+13));
4727  08fe 8d000000      	callf	f_Set_LCD_Address
4729                     ; 461 		Display_LCD_String("NON");
4731  0902 ae0000        	ldw	x,#L3352
4733  0905               L1352:
4734  0905 8d000000      	callf	f_Display_LCD_String
4735                     ; 465 	return;
4738  0909 5b03          	addw	sp,#3
4739  090b 87            	retf	
4776                     ; 468 void PS_Test_Value_Change(unsigned char ST)
4776                     ; 469 {
4777                     	switch	.text
4778  090c               f_PS_Test_Value_Change:
4780  090c 88            	push	a
4781       00000000      OFST:	set	0
4784                     ; 471 	if(ST == 1){
4786  090d 4a            	dec	a
4787  090e 2640          	jrne	L1552
4788                     ; 473 		if(PS_Option_flag){
4790  0910 7207000013    	btjf	_PS_Test_Register,#3,L3552
4791                     ; 474 			if(PS_Data_Step == 1){if(PS_Unit<200){PS_Unit++;}}
4793  0915 c6000f        	ld	a,_PS_Data_Step
4794  0918 4a            	dec	a
4795  0919 267b          	jrne	L5752
4798  091b c60012        	ld	a,_PS_Unit
4799  091e a1c8          	cp	a,#200
4800  0920 2474          	jruge	L5752
4803  0922 725c0012      	inc	_PS_Unit
4804  0926 206e          	jra	L5752
4805  0928               L3552:
4806                     ; 478 			if(PS_Data_Step == 0){PTC_AllowOperation ^= 1;}
4808  0928 725d000f      	tnz	_PS_Data_Step
4811  092c 2744          	jreq	LC025
4812                     ; 479 			else if(PS_Data_Step == 1){
4814  092e c6000f        	ld	a,_PS_Data_Step
4815  0931 4a            	dec	a
4816  0932 2662          	jrne	L5752
4817                     ; 480 				if((PTC_Heat_Duty+ PS_Unit)>200){PTC_Heat_Duty = 200;}
4819  0934 c60000        	ld	a,_PTC_Heat_Duty
4820  0937 5f            	clrw	x
4821  0938 cb0012        	add	a,_PS_Unit
4822  093b 59            	rlcw	x
4823  093c 02            	rlwa	x,a
4824  093d a300c9        	cpw	x,#201
4825  0940 2f06          	jrslt	L1752
4828  0942 35c80000      	mov	_PTC_Heat_Duty,#200
4830  0946 204e          	jra	L5752
4831  0948               L1752:
4832                     ; 481 				else{PTC_Heat_Duty += PS_Unit;}
4834  0948 c60000        	ld	a,_PTC_Heat_Duty
4835  094b cb0012        	add	a,_PS_Unit
4836  094e 2043          	jpf	LC024
4837  0950               L1552:
4838                     ; 486 	else if(ST == 0){
4840  0950 7b01          	ld	a,(OFST+1,sp)
4841  0952 2642          	jrne	L5752
4842                     ; 487 		if(PS_Option_flag){
4844  0954 7207000013    	btjf	_PS_Test_Register,#3,L1062
4845                     ; 488 			if(PS_Data_Step == 1){if(PS_Unit>1){PS_Unit--;}  }
4847  0959 c6000f        	ld	a,_PS_Data_Step
4848  095c 4a            	dec	a
4849  095d 2637          	jrne	L5752
4852  095f c60012        	ld	a,_PS_Unit
4853  0962 a102          	cp	a,#2
4854  0964 2530          	jrult	L5752
4857  0966 725a0012      	dec	_PS_Unit
4858  096a 202a          	jra	L5752
4859  096c               L1062:
4860                     ; 491 			if(PS_Data_Step == 0){PTC_AllowOperation ^= 1;}
4862  096c 725d000f      	tnz	_PS_Data_Step
4863  0970 260a          	jrne	L1162
4866  0972               LC025:
4868  0972 c60000        	ld	a,_PTC_AllowOperation
4869  0975 a801          	xor	a,#1
4870  0977 c70000        	ld	_PTC_AllowOperation,a
4872  097a 201a          	jra	L5752
4873  097c               L1162:
4874                     ; 492 			else if(PS_Data_Step == 1){
4876  097c c6000f        	ld	a,_PS_Data_Step
4877  097f 4a            	dec	a
4878  0980 2614          	jrne	L5752
4879                     ; 493 				if(PTC_Heat_Duty < PS_Unit){PTC_Heat_Duty = 0;}
4881  0982 c60000        	ld	a,_PTC_Heat_Duty
4882  0985 c10012        	cp	a,_PS_Unit
4883  0988 2406          	jruge	L7162
4886  098a 725f0000      	clr	_PTC_Heat_Duty
4888  098e 2006          	jra	L5752
4889  0990               L7162:
4890                     ; 494 				else{PTC_Heat_Duty -= PS_Unit;}
4892  0990 c00012        	sub	a,_PS_Unit
4893  0993               LC024:
4894  0993 c70000        	ld	_PTC_Heat_Duty,a
4895  0996               L5752:
4896                     ; 498 	return ;
4899  0996 84            	pop	a
4900  0997 87            	retf	
4930                     ; 502 void PS_Switch_Control(void)
4930                     ; 503 {
4931                     	switch	.text
4932  0998               f_PS_Switch_Control:
4936                     ; 504 	if(UP_SW_flag == ON){
4938  0998 7203000051    	btjf	_SW_Status,#1,L3362
4939                     ; 507 		if(PS_Data_Setting_flag == ON){	PS_Test_Value_Change(1);}
4941  099d 7203000008    	btjf	_PS_Test_Register,#1,L5362
4944  09a2 a601          	ld	a,#1
4945  09a4 8d0c090c      	callf	f_PS_Test_Value_Change
4948  09a8 203e          	jra	L7362
4949  09aa               L5362:
4950                     ; 509 		else if(PS_Data_Select_flag == ON){
4952  09aa 720100001a    	btjf	_PS_Test_Register,#0,L1462
4953                     ; 510 			if(PS_Option_flag){
4955  09af 7207000009    	btjf	_PS_Test_Register,#3,L3462
4956                     ; 511 				if(PS_Data_Step > 1){ PS_Data_Step--;}
4958  09b4 c6000f        	ld	a,_PS_Data_Step
4959  09b7 a102          	cp	a,#2
4960  09b9 252d          	jrult	L7362
4962  09bb 2006          	jpf	LC026
4963  09bd               L3462:
4964                     ; 514 				if(PS_Data_Step > 0){ PS_Data_Step--;}	
4966  09bd 725d000f      	tnz	_PS_Data_Step
4967  09c1 2725          	jreq	L7362
4970  09c3               LC026:
4972  09c3 725a000f      	dec	_PS_Data_Step
4973  09c7 201f          	jra	L7362
4974  09c9               L1462:
4975                     ; 517 			if(PS_Option_flag==0){
4977  09c9 720600001a    	btjt	_PS_Test_Register,#3,L7362
4978                     ; 518 				if(PS_Test_Pg > 0){ PS_Test_Pg--;}
4980  09ce 725d0010      	tnz	_PS_Test_Pg
4981  09d2 2706          	jreq	L7562
4984  09d4 725a0010      	dec	_PS_Test_Pg
4986  09d8 2004          	jra	L1662
4987  09da               L7562:
4988                     ; 519 				else{PS_Test_Pg = 8;}
4990  09da 35080010      	mov	_PS_Test_Pg,#8
4991  09de               L1662:
4992                     ; 521 				if(PS_Test_Pg == 0){PS_Data_Step = 0;}
4994  09de 725d0010      	tnz	_PS_Test_Pg
4995  09e2 2604          	jrne	L7362
4998  09e4 725f000f      	clr	_PS_Data_Step
4999  09e8               L7362:
5000                     ; 524 		UP_SW_flag = OFF;
5002  09e8 72130000      	bres	_SW_Status,#1
5004  09ec 2046          	jra	L5662
5005  09ee               L3362:
5006                     ; 527 	else if(DN_SW_flag == ON){ 
5008  09ee 7205000041    	btjf	_SW_Status,#2,L5662
5009                     ; 530 		if(PS_Data_Setting_flag == ON){	PS_Test_Value_Change(0);}
5011  09f3 7203000007    	btjf	_PS_Test_Register,#1,L1762
5014  09f8 4f            	clr	a
5015  09f9 8d0c090c      	callf	f_PS_Test_Value_Change
5018  09fd 2031          	jra	L3762
5019  09ff               L1762:
5020                     ; 532 		else if(PS_Data_Select_flag == ON){
5022  09ff 720100000c    	btjf	_PS_Test_Register,#0,L5762
5023                     ; 533 			if(PS_Option_flag){
5025                     ; 534 				if(PS_Data_Step < 1){ PS_Data_Step++;}
5027                     ; 535 			}else{ if(PS_Data_Step < 1){ PS_Data_Step++;}}
5032  0a04 725d000f      	tnz	_PS_Data_Step
5033  0a08 2626          	jrne	L3762
5035  0a0a 725c000f      	inc	_PS_Data_Step
5036  0a0e 2020          	jra	L3762
5037  0a10               L5762:
5038                     ; 538 			if(PS_Option_flag==0){
5040  0a10 720600001b    	btjt	_PS_Test_Register,#3,L3762
5041                     ; 539 				if(PS_Test_Pg < 8 ){ PS_Test_Pg++;}
5043  0a15 c60010        	ld	a,_PS_Test_Pg
5044  0a18 a108          	cp	a,#8
5045  0a1a 2406          	jruge	L3172
5048  0a1c 725c0010      	inc	_PS_Test_Pg
5050  0a20 2004          	jra	L5172
5051  0a22               L3172:
5052                     ; 540 				else{PS_Test_Pg = 0;}
5054  0a22 725f0010      	clr	_PS_Test_Pg
5055  0a26               L5172:
5056                     ; 542 				if(PS_Test_Pg == 0){PS_Data_Step = 0;}
5058  0a26 725d0010      	tnz	_PS_Test_Pg
5059  0a2a 2604          	jrne	L3762
5062  0a2c 725f000f      	clr	_PS_Data_Step
5063  0a30               L3762:
5064                     ; 545 		DN_SW_flag = OFF;
5066  0a30 72150000      	bres	_SW_Status,#2
5067  0a34               L5662:
5068                     ; 550 	if(SET_SW_flag == ON){
5070  0a34 720700002f    	btjf	_SW_Status,#3,L1272
5071                     ; 551 		if((PS_Test_Pg==0)||(PS_Test_Pg==10)){
5073  0a39 725d0010      	tnz	_PS_Test_Pg
5074  0a3d 2707          	jreq	L5272
5076  0a3f c60010        	ld	a,_PS_Test_Pg
5077  0a42 a10a          	cp	a,#10
5078  0a44 2622          	jrne	L1272
5079  0a46               L5272:
5080                     ; 553 			if(PS_Data_Select_flag == OFF){PS_Data_Select_flag= ON;}
5082  0a46 7200000006    	btjt	_PS_Test_Register,#0,L7272
5085  0a4b 72100000      	bset	_PS_Test_Register,#0
5087  0a4f 2013          	jra	L1372
5088  0a51               L7272:
5089                     ; 555 				if(PS_Data_Setting_flag == OFF){
5091  0a51 7202000006    	btjt	_PS_Test_Register,#1,L3372
5092                     ; 556 					PS_Data_Setting_flag = ON;
5094  0a56 72120000      	bset	_PS_Test_Register,#1
5096  0a5a 2008          	jra	L1372
5097  0a5c               L3372:
5098                     ; 558 					PS_Data_Setting_flag = OFF;
5100  0a5c 72130000      	bres	_PS_Test_Register,#1
5101                     ; 559 					PS_Data_Select_flag = OFF;
5103  0a60 72110000      	bres	_PS_Test_Register,#0
5104  0a64               L1372:
5105                     ; 562 			SET_SW_flag = OFF;
5107  0a64 72170000      	bres	_SW_Status,#3
5108  0a68               L1272:
5109                     ; 566 	if(ON_OFF_SW_flag == ON){
5111  0a68 7201000013    	btjf	_SW_Status,#0,L7372
5112                     ; 567 		if(PS_Trans_flag == OFF){PS_Trans_flag = ON;}
5114  0a6d 7204000006    	btjt	_PS_Test_Register,#2,L1472
5117  0a72 72140000      	bset	_PS_Test_Register,#2
5119  0a76 2004          	jra	L3472
5120  0a78               L1472:
5121                     ; 568 		else{ PS_Trans_flag = OFF;  }
5123  0a78 72150000      	bres	_PS_Test_Register,#2
5124  0a7c               L3472:
5125                     ; 570 		ON_OFF_SW_flag = OFF;
5127  0a7c 72110000      	bres	_SW_Status,#0
5128  0a80               L7372:
5129                     ; 573 	if(OP_SW_flag == ON){
5131  0a80 720900002b    	btjf	_SW_Status,#4,L5472
5132                     ; 574 		if(PS_Option_flag == OFF){
5134  0a85 720600000e    	btjt	_PS_Test_Register,#3,L7472
5135                     ; 575 			PS_Option_flag = ON;
5137  0a8a 72160000      	bset	_PS_Test_Register,#3
5138                     ; 576 			PS_Test_Pg = 10;
5140  0a8e 350a0010      	mov	_PS_Test_Pg,#10
5141                     ; 577 			PS_Data_Step = 1;
5143  0a92 3501000f      	mov	_PS_Data_Step,#1
5145  0a96 2014          	jra	L1572
5146  0a98               L7472:
5147                     ; 580 			PS_Option_flag = OFF;
5149  0a98 72170000      	bres	_PS_Test_Register,#3
5150                     ; 581 			PS_Data_Select_flag = OFF;
5152  0a9c 72110000      	bres	_PS_Test_Register,#0
5153                     ; 582 			PS_Data_Setting_flag = OFF;
5155  0aa0 72130000      	bres	_PS_Test_Register,#1
5156                     ; 584 			PS_Test_Pg = 0;
5158  0aa4 725f0010      	clr	_PS_Test_Pg
5159                     ; 585 			PS_Data_Step = 0;
5161  0aa8 725f000f      	clr	_PS_Data_Step
5162  0aac               L1572:
5163                     ; 587 		OP_SW_flag = OFF;
5165  0aac 72190000      	bres	_SW_Status,#4
5166  0ab0               L5472:
5167                     ; 591 	if(EN_SW_flag == ON){
5169  0ab0 720b000018    	btjf	_SW_Status,#5,L3572
5170                     ; 592 		Device_Select_Mode = ON;
5172  0ab5 72100000      	bset	_Mode_Select_Status,#0
5173                     ; 593 		PS_PTC_flag = OFF;
5175  0ab9 721b0000      	bres	_Can_Select_Device,#5
5176                     ; 594 		PS_Trans_flag = OFF;
5178  0abd 72150000      	bres	_PS_Test_Register,#2
5179                     ; 596 		Can_Select_Device = 0;
5181  0ac1 725f0000      	clr	_Can_Select_Device
5182                     ; 597 		PS_PTC_Reset();
5184  0ac5 8d000000      	callf	f_PS_PTC_Reset
5186                     ; 598 		EN_SW_flag = OFF;
5188  0ac9 721b0000      	bres	_SW_Status,#5
5189  0acd               L3572:
5190                     ; 601 	return;
5193  0acd 87            	retf	
5219                     ; 605 void PS_Test_Routine(void)
5219                     ; 606 {
5220                     	switch	.text
5221  0ace               f_PS_Test_Routine:
5225                     ; 609 	if(!PS_PTC_flag){ return;}
5227  0ace 720a000001    	btjt	_Can_Select_Device,#5,L5672
5231  0ad3 87            	retf	
5232  0ad4               L5672:
5233                     ; 611 		CAN_Management_Routine();		// CAN communication Management
5235  0ad4 8d000000      	callf	f_CAN_Management_Routine
5237                     ; 612 		PS_LCD_Display();
5239  0ad8 8d240224      	callf	f_PS_LCD_Display
5241                     ; 613 		PS_Switch_Control();
5244                     ; 616 	return ;
5247  0adc ac980998      	jpf	f_PS_Switch_Control
5326                     	xdef	_PS_Unit
5327                     	xdef	_PS_Pre_Pg
5328                     	xdef	_PS_Test_Pg
5329                     	xdef	_PS_Data_Step
5330                     	xdef	f_PS_Switch_Control
5331                     	xdef	f_PS_Test_Value_Change
5332                     	xdef	f_PS_LCD_Display
5333                     	xdef	f_PS_Display_Handling
5334                     	xdef	f_PS_PTC_Reset
5335                     	xref	f_strcpy
5336                     	xdef	f_PS_Test_Routine
5337                     	xdef	_PS_PTC_Debug
5338                     	xdef	_PS_PTC_Status
5339                     	switch	.bss
5340  0000               _PS_Test_Register:
5341  0000 00            	ds.b	1
5342                     	xdef	_PS_Test_Register
5343                     	xref	_LCD_Dis_Data
5344                     	xref	_LCD_Line
5345                     	xref	f_Num_Display_LCD
5346                     	xref	f_CAN_Management_Routine
5347                     	xref	_PTC_Status3
5348                     	xref	_PTC_Status2
5349                     	xref	_PTC_Status1
5350                     	xref	_PTC_SW_Ver
5351                     	xref	_PTC_Limit_Cause
5352                     	xref	_PTC_RCore_Temp
5353                     	xref	_PTC_LCore_Temp
5354                     	xref	_PTC_Fdback_Duty
5355                     	xref	_PTC_PWR_VALUE
5356                     	xref	_PTC_Cur_VALUE
5357                     	xref	_PTC_BATT_VALUE
5358                     	xref	_PTC_Heat_Duty
5359                     	xref	_PTC_AllowOperation
5360                     	xref	_CAN_Operation_App
5361                     	xref	f_Display_LCD_String
5362                     	xref	f_Set_LCD_Address
5363                     	xref	_Blink_30
5364                     	xref	_Blink_50
5365                     	xref	_SW_Status
5366                     	xref	_Can_Select_Device
5367                     	xref	_Mode_Select_Status
5368                     .const:	section	.text
5369  0000               L3352:
5370  0000 4e4f4e00      	dc.b	"NON",0
5371  0004               L7252:
5372  0004 20202000      	dc.b	"   ",0
5373  0008               L3252:
5374  0008 434f4d00      	dc.b	"COM",0
5375  000c               L5152:
5376  000c 525800        	dc.b	"RX",0
5377  000f               L7632:
5378  000f 4c696d697400  	dc.b	"Limit",0
5379  0015               L1632:
5380  0015 6661696c00    	dc.b	"fail",0
5381  001a               L3532:
5382  001a 4f70657200    	dc.b	"Oper",0
5383  001f               L5432:
5384  001f 53544f5000    	dc.b	"STOP",0
5385  0024               L5332:
5386  0024 4300          	dc.b	"C",0
5387  0026               L1332:
5388  0026 2d00          	dc.b	"-",0
5389  0028               L1232:
5390  0028 5700          	dc.b	"W",0
5391  002a               L3132:
5392  002a 4100          	dc.b	"A",0
5393  002c               L1132:
5394  002c 5600          	dc.b	"V",0
5395  002e               L5032:
5396  002e 466100        	dc.b	"Fa",0
5397  0031               L5222:
5398  0031 545800        	dc.b	"TX",0
5399  0034               L3022:
5400  0034 2500          	dc.b	"%",0
5401  0036               L1022:
5402  0036 2e00          	dc.b	".",0
5403  0038               L1612:
5404  0038 202020202000  	dc.b	"     ",0
5405  003e               L5412:
5406  003e 202020202020  	dc.b	"         FD:",0
5407  004b               L7312:
5408  004b 202020202020  	dc.b	"      ",0
5409  0052               L5112:
5410  0052 505300        	dc.b	"PS",0
5411  0055               L1702:
5412  0055 445f556e6974  	dc.b	"D_Unit : ",0
5413  005f               L7602:
5414  005f 2a4f7074696f  	dc.b	"*Option*",0
5415  0068               L5602:
5416  0068 445f4f44543a  	dc.b	"D_ODT:",0
5417  006f               L3602:
5418  006f 445f4c563a00  	dc.b	"D_LV:",0
5419  0075               L1602:
5420  0075 445f4c504342  	dc.b	"D_LPCBT:",0
5421  007e               L7502:
5422  007e 445f48504342  	dc.b	"D_HPCBT:",0
5423  0087               L5502:
5424  0087 445f49473254  	dc.b	"D_IG2T:",0
5425  008f               L3502:
5426  008f 445f49473154  	dc.b	"D_IG1T:",0
5427  0097               L1502:
5428  0097 00            	dc.b	0
5429  0098               L7402:
5430  0098 5054434c6d74  	dc.b	"PTCLmt:",0
5431  00a0               L5402:
5432  00a0 465032536e3a  	dc.b	"FP2Sn:",0
5433  00a7               L3402:
5434  00a7 465031536e3a  	dc.b	"FP1Sn:",0
5435  00ae               L1402:
5436  00ae 46436f54536e  	dc.b	"FCoTSn:",0
5437  00b6               L7302:
5438  00b6 46437572536e  	dc.b	"FCurSn:",0
5439  00be               L5302:
5440  00be 464c56536e3a  	dc.b	"FLVSn:",0
5441  00c5               L3302:
5442  00c5 464856536e3a  	dc.b	"FHVSn:",0
5443  00cc               L1302:
5444  00cc 313131546f3a  	dc.b	"111To:",0
5445  00d3               L7202:
5446  00d3 5054686d3a00  	dc.b	"PThm:",0
5447  00d9               L5202:
5448  00d9 4354686d3a00  	dc.b	"CThm:",0
5449  00df               L3202:
5450  00df 4f4375723a00  	dc.b	"OCur:",0
5451  00e5               L1202:
5452  00e5 485648673a00  	dc.b	"HVHg:",0
5453  00eb               L7102:
5454  00eb 48564c773a00  	dc.b	"HVLw:",0
5455  00f1               L5102:
5456  00f1 4c5648673a00  	dc.b	"LVHg:",0
5457  00f7               L3102:
5458  00f7 4c564c773a00  	dc.b	"LVLw:",0
5459  00fd               L1102:
5460  00fd 505374333a00  	dc.b	"PSt3:",0
5461  0103               L7002:
5462  0103 505374323a00  	dc.b	"PSt2:",0
5463  0109               L5002:
5464  0109 505374313a00  	dc.b	"PSt1:",0
5465  010f               L3002:
5466  010f 53575f566572  	dc.b	"SW_Ver:",0
5467  0117               L1002:
5468  0117 436f543a00    	dc.b	"CoT:",0
5469  011c               L7771:
5470  011c 5077723a00    	dc.b	"Pwr:",0
5471  0121               L5771:
5472  0121 4375723a00    	dc.b	"Cur:",0
5473  0126               L3771:
5474  0126 4856203a00    	dc.b	"HV :",0
5475  012b               L1771:
5476  012b 50544346613a  	dc.b	"PTCFa:",0
5477  0132               L7671:
5478  0132 505443526479  	dc.b	"PTCRdy:",0
5479  013a               L5671:
5480  013a 54443a202020  	dc.b	"TD:      FD:",0
5481  0147               L3671:
5482  0147 50416c6c6f77  	dc.b	"PAllow:",0
5483                     	xref.b	c_x
5503                     	xref	d_smodx
5504                     	xref	d_sdivx
5505                     	xref	d_jctab
5506                     	end

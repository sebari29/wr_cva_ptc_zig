   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _LMFC_PTC_Status:
2660  0000 00            	dc.b	0
2661  0001 000000000000  	ds.b	6
2662  0007               _LMFC_PTC_Debug:
2663  0007 00            	dc.b	0
2664  0008 000000000000  	ds.b	7
2665  000f               _LMFC_Data_Step:
2666  000f 00            	dc.b	0
2667  0010               _LMFC_Test_Pg:
2668  0010 00            	dc.b	0
2669  0011               _LMFC_Pre_Pg:
2670  0011 08            	dc.b	8
2671  0012               _LMFC_Unit:
2672  0012 01            	dc.b	1
2673  0013               _LMFC_Ramp_Delay:
2674  0013 0001          	dc.w	1
2675  0015               _LMFC_Ramp_UD:
2676  0015 01            	dc.b	1
2677  0016               _LMFC_Ramp_T_Cnt:
2678  0016 00000000      	dc.l	0
2728                     ; 27 void LMFC_PTC_Reset(void)
2728                     ; 28 {
2729                     	switch	.text
2730  0000               f_LMFC_PTC_Reset:
2734                     ; 29 	LMFC_Test_Pg = 0;	//display page reset
2736  0000 725f0010      	clr	_LMFC_Test_Pg
2737                     ; 30 	LMFC_Pre_Pg = 8;
2739  0004 35080011      	mov	_LMFC_Pre_Pg,#8
2740                     ; 31 	LMFC_Data_Step = 0; //data select reset
2742  0008 725f000f      	clr	_LMFC_Data_Step
2743                     ; 32 	LMFC_Test_Register = 0;
2745  000c 725f0000      	clr	_LMFC_Test_Register
2746                     ; 33 	LMFC_Unit = 1;
2748  0010 35010012      	mov	_LMFC_Unit,#1
2749                     ; 35 	LMFC_PTC_Status[0] = 0;
2751  0014 725f0000      	clr	_LMFC_PTC_Status
2752                     ; 36 	LMFC_PTC_Status[1] = 0;
2754  0018 725f0001      	clr	_LMFC_PTC_Status+1
2755                     ; 37 	LMFC_PTC_Status[2] = 0;
2757  001c 725f0002      	clr	_LMFC_PTC_Status+2
2758                     ; 38 	LMFC_PTC_Status[3] = 0;
2760  0020 725f0003      	clr	_LMFC_PTC_Status+3
2761                     ; 39 	LMFC_PTC_Status[4] = 0;
2763  0024 725f0004      	clr	_LMFC_PTC_Status+4
2764                     ; 40 	LMFC_PTC_Status[5] = 0;
2766  0028 725f0005      	clr	_LMFC_PTC_Status+5
2767                     ; 41 	LMFC_PTC_Status[6] = 0;
2769  002c 725f0006      	clr	_LMFC_PTC_Status+6
2770                     ; 44 	PTC_BATT_VALUE = 0;
2772  0030 5f            	clrw	x
2773  0031 cf0000        	ldw	_PTC_BATT_VALUE,x
2774                     ; 45 	PTC_Cur_VALUE = 0;
2776  0034 725f0000      	clr	_PTC_Cur_VALUE
2777                     ; 46 	PTC_PWR_VALUE = 0;
2779  0038 cf0000        	ldw	_PTC_PWR_VALUE,x
2780                     ; 47 	PTC_Fdback_Duty = 0;
2782  003b 725f0000      	clr	_PTC_Fdback_Duty
2783                     ; 48 	PTC_LCore_Temp = 0;
2785  003f 725f0000      	clr	_PTC_LCore_Temp
2786                     ; 49 	PTC_RCore_Temp = 0;
2788  0043 725f0000      	clr	_PTC_RCore_Temp
2789                     ; 50 	PTC_Limit_Cause = 0;
2791  0047 725f0000      	clr	_PTC_Limit_Cause
2792                     ; 51 	PTC_SW_Ver = 0;
2794  004b 725f0000      	clr	_PTC_SW_Ver
2795                     ; 52 	PTC_Status1 = 0;
2797  004f 725f0000      	clr	_PTC_Status1
2798                     ; 53 	PTC_Status2 = 0;
2800  0053 725f0000      	clr	_PTC_Status2
2801                     ; 54 	PTC_Status3 = 0;
2803  0057 725f0000      	clr	_PTC_Status3
2804                     ; 55 	PTC_AllowOperation= 0;
2806  005b 725f0000      	clr	_PTC_AllowOperation
2807                     ; 56 	PTC_Heat_Duty = 0;
2809  005f 725f0000      	clr	_PTC_Heat_Duty
2810                     ; 57 	PTC_AllowOperation= 0;
2812  0063 725f0000      	clr	_PTC_AllowOperation
2813                     ; 61 	CAN_Operation_App = 0;	
2815  0067 725f0000      	clr	_CAN_Operation_App
2816                     ; 63 	return;
2819  006b 87            	retf	
2845                     ; 67 void LMFC_Display_Handling(void)
2845                     ; 68 {
2846                     	switch	.text
2847  006c               f_LMFC_Display_Handling:
2851                     ; 69 	switch(LMFC_Test_Pg){
2853  006c c60010        	ld	a,_LMFC_Test_Pg
2855                     ; 136 		default: break;
2856  006f a10b          	cp	a,#11
2857  0071 2504ac140214  	jruge	L7571
2858  0077 8d000000      	callf	d_jctab
2860  007b               L221:
2861  007b 0017          	dc.w	L1271-L221
2862  007d 0042          	dc.w	L3271-L221
2863  007f 006d          	dc.w	L5271-L221
2864  0081 0098          	dc.w	L7271-L221
2865  0083 00c3          	dc.w	L1371-L221
2866  0085 00ee          	dc.w	L3371-L221
2867  0087 0117          	dc.w	L5371-L221
2868  0089 0140          	dc.w	L7371-L221
2869  008b 0169          	dc.w	L1471-L221
2870  008d 0169          	dc.w	L1471-L221
2871  008f 0169          	dc.w	L1471-L221
2873  0091 87            	retf	
2874  0092               L1271:
2875                     ; 71 		case 0:
2875                     ; 72 				strcpy(LCD_Dis_Data[0],"PtcAlw:");
2877  0092 ae017b        	ldw	x,#L1671
2878  0095 89            	pushw	x
2879  0096 ae0000        	ldw	x,#_LCD_Dis_Data
2880  0099 8d000000      	callf	f_strcpy
2882  009d 85            	popw	x
2883                     ; 73 				strcpy(LCD_Dis_Data[1],"TD:      FD:");
2885  009e ae016e        	ldw	x,#L3671
2886  00a1 89            	pushw	x
2887  00a2 ae0010        	ldw	x,#_LCD_Dis_Data+16
2888  00a5 8d000000      	callf	f_strcpy
2890  00a9 85            	popw	x
2891                     ; 74 				strcpy(LCD_Dis_Data[2],"PtcRdy:");
2893  00aa ae0166        	ldw	x,#L5671
2894  00ad 89            	pushw	x
2895  00ae ae0020        	ldw	x,#_LCD_Dis_Data+32
2896  00b1 8d000000      	callf	f_strcpy
2898  00b5 85            	popw	x
2899                     ; 75 				strcpy(LCD_Dis_Data[3],"PtcFau:");
2901  00b6 ae015e        	ldw	x,#L7671
2903                     ; 76 				break;
2905  00b9 ac0b020b      	jpf	LC001
2906  00bd               L3271:
2907                     ; 78 		case 1:
2907                     ; 79 				strcpy(LCD_Dis_Data[0],"HV :");
2909  00bd ae0159        	ldw	x,#L1771
2910  00c0 89            	pushw	x
2911  00c1 ae0000        	ldw	x,#_LCD_Dis_Data
2912  00c4 8d000000      	callf	f_strcpy
2914  00c8 85            	popw	x
2915                     ; 80 				strcpy(LCD_Dis_Data[1],"Cur:");
2917  00c9 ae0154        	ldw	x,#L3771
2918  00cc 89            	pushw	x
2919  00cd ae0010        	ldw	x,#_LCD_Dis_Data+16
2920  00d0 8d000000      	callf	f_strcpy
2922  00d4 85            	popw	x
2923                     ; 81 				strcpy(LCD_Dis_Data[2],"Pwr:");
2925  00d5 ae014f        	ldw	x,#L5771
2926  00d8 89            	pushw	x
2927  00d9 ae0020        	ldw	x,#_LCD_Dis_Data+32
2928  00dc 8d000000      	callf	f_strcpy
2930  00e0 85            	popw	x
2931                     ; 82 				strcpy(LCD_Dis_Data[3],"C1:    C2:");
2933  00e1 ae0144        	ldw	x,#L7771
2935                     ; 83 				break;
2937  00e4 ac0b020b      	jpf	LC001
2938  00e8               L5271:
2939                     ; 85 		case 2:
2939                     ; 86 				strcpy(LCD_Dis_Data[0],"PtcSte:");
2941  00e8 ae013c        	ldw	x,#L1002
2942  00eb 89            	pushw	x
2943  00ec ae0000        	ldw	x,#_LCD_Dis_Data
2944  00ef 8d000000      	callf	f_strcpy
2946  00f3 85            	popw	x
2947                     ; 87 				strcpy(LCD_Dis_Data[1],"111Tot:");
2949  00f4 ae0134        	ldw	x,#L3002
2950  00f7 89            	pushw	x
2951  00f8 ae0010        	ldw	x,#_LCD_Dis_Data+16
2952  00fb 8d000000      	callf	f_strcpy
2954  00ff 85            	popw	x
2955                     ; 88 				strcpy(LCD_Dis_Data[2],"LVLow :");
2957  0100 ae012c        	ldw	x,#L5002
2958  0103 89            	pushw	x
2959  0104 ae0020        	ldw	x,#_LCD_Dis_Data+32
2960  0107 8d000000      	callf	f_strcpy
2962  010b 85            	popw	x
2963                     ; 89 				strcpy(LCD_Dis_Data[3],"LVHigh:");
2965  010c ae0124        	ldw	x,#L7002
2967                     ; 90 				break;
2969  010f ac0b020b      	jpf	LC001
2970  0113               L7271:
2971                     ; 92 		case 3:
2971                     ; 93 				strcpy(LCD_Dis_Data[0],"HVLow :");
2973  0113 ae011c        	ldw	x,#L1102
2974  0116 89            	pushw	x
2975  0117 ae0000        	ldw	x,#_LCD_Dis_Data
2976  011a 8d000000      	callf	f_strcpy
2978  011e 85            	popw	x
2979                     ; 94 				strcpy(LCD_Dis_Data[1],"HVHigh:");
2981  011f ae0114        	ldw	x,#L3102
2982  0122 89            	pushw	x
2983  0123 ae0010        	ldw	x,#_LCD_Dis_Data+16
2984  0126 8d000000      	callf	f_strcpy
2986  012a 85            	popw	x
2987                     ; 95 				strcpy(LCD_Dis_Data[2],"OvrCur:");
2989  012b ae010c        	ldw	x,#L5102
2990  012e 89            	pushw	x
2991  012f ae0020        	ldw	x,#_LCD_Dis_Data+32
2992  0132 8d000000      	callf	f_strcpy
2994  0136 85            	popw	x
2995                     ; 96 				strcpy(LCD_Dis_Data[3],"OtlThm:");
2997  0137 ae0104        	ldw	x,#L7102
2999                     ; 97 				break;
3001  013a ac0b020b      	jpf	LC001
3002  013e               L1371:
3003                     ; 99 		case 4:
3003                     ; 100 				strcpy(LCD_Dis_Data[0],"PcbThm:");
3005  013e ae00fc        	ldw	x,#L1202
3006  0141 89            	pushw	x
3007  0142 ae0000        	ldw	x,#_LCD_Dis_Data
3008  0145 8d000000      	callf	f_strcpy
3010  0149 85            	popw	x
3011                     ; 101 				strcpy(LCD_Dis_Data[1],"FHVSn:");
3013  014a ae00f5        	ldw	x,#L3202
3014  014d 89            	pushw	x
3015  014e ae0010        	ldw	x,#_LCD_Dis_Data+16
3016  0151 8d000000      	callf	f_strcpy
3018  0155 85            	popw	x
3019                     ; 102 				strcpy(LCD_Dis_Data[2],"FLVSn:");
3021  0156 ae00ee        	ldw	x,#L5202
3022  0159 89            	pushw	x
3023  015a ae0020        	ldw	x,#_LCD_Dis_Data+32
3024  015d 8d000000      	callf	f_strcpy
3026  0161 85            	popw	x
3027                     ; 103 				strcpy(LCD_Dis_Data[3],"FCurSn:");
3029  0162 ae00e6        	ldw	x,#L7202
3031                     ; 104 				break;
3033  0165 ac0b020b      	jpf	LC001
3034  0169               L3371:
3035                     ; 106 		case 5:
3035                     ; 107 				strcpy(LCD_Dis_Data[0],"FPcbTSn:");
3037  0169 ae00dd        	ldw	x,#L1302
3038  016c 89            	pushw	x
3039  016d ae0000        	ldw	x,#_LCD_Dis_Data
3040  0170 8d000000      	callf	f_strcpy
3042  0174 85            	popw	x
3043                     ; 108 				strcpy(LCD_Dis_Data[1],"FOltTSn:");
3045  0175 ae00d4        	ldw	x,#L3302
3046  0178 89            	pushw	x
3047  0179 ae0010        	ldw	x,#_LCD_Dis_Data+16
3048  017c 8d000000      	callf	f_strcpy
3050  0180 85            	popw	x
3051                     ; 109 				strcpy(LCD_Dis_Data[2],"PTCLmt:");
3053  0181 ae00cc        	ldw	x,#L5302
3054  0184 89            	pushw	x
3055  0185 ae0020        	ldw	x,#_LCD_Dis_Data+32
3056  0188 8d000000      	callf	f_strcpy
3058  018c 85            	popw	x
3059                     ; 110 				strcpy(LCD_Dis_Data[3],"SW_Ver:");
3061  018d ae00c4        	ldw	x,#L7302
3063                     ; 111 				break;
3065  0190 2079          	jpf	LC001
3066  0192               L5371:
3067                     ; 113 		case 6:  
3067                     ; 114 				strcpy(LCD_Dis_Data[0],"D_IG1T:");
3069  0192 ae00bc        	ldw	x,#L1402
3070  0195 89            	pushw	x
3071  0196 ae0000        	ldw	x,#_LCD_Dis_Data
3072  0199 8d000000      	callf	f_strcpy
3074  019d 85            	popw	x
3075                     ; 115 				strcpy(LCD_Dis_Data[1],"D_IG2T:");
3077  019e ae00b4        	ldw	x,#L3402
3078  01a1 89            	pushw	x
3079  01a2 ae0010        	ldw	x,#_LCD_Dis_Data+16
3080  01a5 8d000000      	callf	f_strcpy
3082  01a9 85            	popw	x
3083                     ; 116 				strcpy(LCD_Dis_Data[2],"D_HPCBT:");
3085  01aa ae00ab        	ldw	x,#L5402
3086  01ad 89            	pushw	x
3087  01ae ae0020        	ldw	x,#_LCD_Dis_Data+32
3088  01b1 8d000000      	callf	f_strcpy
3090  01b5 85            	popw	x
3091                     ; 117 				strcpy(LCD_Dis_Data[3],"D_LPCBT:");
3093  01b6 ae00a2        	ldw	x,#L7402
3095                     ; 118 				break;
3097  01b9 2050          	jpf	LC001
3098  01bb               L7371:
3099                     ; 120 		case 7:  	
3099                     ; 121 				strcpy(LCD_Dis_Data[0],"D_LV:");
3101  01bb ae009c        	ldw	x,#L1502
3102  01be 89            	pushw	x
3103  01bf ae0000        	ldw	x,#_LCD_Dis_Data
3104  01c2 8d000000      	callf	f_strcpy
3106  01c6 85            	popw	x
3107                     ; 122 				strcpy(LCD_Dis_Data[1],"D_ODT:");
3109  01c7 ae0095        	ldw	x,#L3502
3110  01ca 89            	pushw	x
3111  01cb ae0010        	ldw	x,#_LCD_Dis_Data+16
3112  01ce 8d000000      	callf	f_strcpy
3114  01d2 85            	popw	x
3115                     ; 123 				strcpy(LCD_Dis_Data[2],"");
3117  01d3 ae0094        	ldw	x,#L5502
3118  01d6 89            	pushw	x
3119  01d7 ae0020        	ldw	x,#_LCD_Dis_Data+32
3120  01da 8d000000      	callf	f_strcpy
3122  01de 85            	popw	x
3123                     ; 124 				strcpy(LCD_Dis_Data[3],"");
3125  01df ae0094        	ldw	x,#L5502
3127                     ; 125 				break;
3129  01e2 2027          	jpf	LC001
3130  01e4               L1471:
3131                     ; 127 		case 8: 	
3131                     ; 128 		case 9:  	
3131                     ; 129 		case 10:  
3131                     ; 130 				strcpy(LCD_Dis_Data[0],"*Option*");
3133  01e4 ae008b        	ldw	x,#L7502
3134  01e7 89            	pushw	x
3135  01e8 ae0000        	ldw	x,#_LCD_Dis_Data
3136  01eb 8d000000      	callf	f_strcpy
3138  01ef 85            	popw	x
3139                     ; 131 				strcpy(LCD_Dis_Data[1],"D_Unit : ");
3141  01f0 ae0081        	ldw	x,#L1602
3142  01f3 89            	pushw	x
3143  01f4 ae0010        	ldw	x,#_LCD_Dis_Data+16
3144  01f7 8d000000      	callf	f_strcpy
3146  01fb 85            	popw	x
3147                     ; 132 				strcpy(LCD_Dis_Data[2],"R_Dlay:");
3149  01fc ae0079        	ldw	x,#L3602
3150  01ff 89            	pushw	x
3151  0200 ae0020        	ldw	x,#_LCD_Dis_Data+32
3152  0203 8d000000      	callf	f_strcpy
3154  0207 85            	popw	x
3155                     ; 133 				strcpy(LCD_Dis_Data[3],"R_U/D:");
3157  0208 ae0072        	ldw	x,#L5602
3159  020b               LC001:
3160  020b 89            	pushw	x
3161  020c ae0030        	ldw	x,#_LCD_Dis_Data+48
3162  020f 8d000000      	callf	f_strcpy
3163  0213 85            	popw	x
3164                     ; 134 				break;		
3166                     ; 136 		default: break;
3168  0214               L7571:
3169                     ; 138 	return;
3172  0214 87            	retf	
3238                     ; 143 void LMFC_LCD_Display(void)
3238                     ; 144 {
3239                     	switch	.text
3240  0215               f_LMFC_LCD_Display:
3242  0215 88            	push	a
3243       00000001      OFST:	set	1
3246                     ; 148 	if(LMFC_Test_Pg != 10){
3248  0216 c60010        	ld	a,_LMFC_Test_Pg
3249  0219 a10a          	cp	a,#10
3250  021b 2710          	jreq	L5012
3251                     ; 149 		Set_LCD_Address((unsigned char)(LCD_Line[2]+12));
3253  021d c60002        	ld	a,_LCD_Line+2
3254  0220 ab0c          	add	a,#12
3255  0222 8d000000      	callf	f_Set_LCD_Address
3257                     ; 150 		Display_LCD_String("LMFC");
3259  0226 ae006d        	ldw	x,#L7012
3260  0229 8d000000      	callf	f_Display_LCD_String
3262  022d               L5012:
3263                     ; 153 	if(LMFC_Test_Pg != LMFC_Pre_Pg){ LMFC_Display_Handling();} 
3265  022d c60010        	ld	a,_LMFC_Test_Pg
3266  0230 c10011        	cp	a,_LMFC_Pre_Pg
3267  0233 2704          	jreq	L1112
3270  0235 8d6c006c      	callf	f_LMFC_Display_Handling
3272  0239               L1112:
3273                     ; 154 	LMFC_Pre_Pg = LMFC_Test_Pg;
3275  0239 5500100011    	mov	_LMFC_Pre_Pg,_LMFC_Test_Pg
3276                     ; 157 	if(LMFC_Test_Pg == 0){			//page 1
3278  023e 725d0010      	tnz	_LMFC_Test_Pg
3279  0242 2704ac8a038a  	jrne	L3112
3280                     ; 158 		for(i=0; i<4; i++){
3282  0248 4f            	clr	a
3283  0249 6b01          	ld	(OFST+0,sp),a
3284  024b               L5112:
3285                     ; 160 			Set_LCD_Address(LCD_Line[i]);
3287  024b 5f            	clrw	x
3288  024c 97            	ld	xl,a
3289  024d d60000        	ld	a,(_LCD_Line,x)
3290  0250 8d000000      	callf	f_Set_LCD_Address
3292                     ; 161 			if((LMFC_Data_Select_flag == ON) && (LMFC_Data_Setting_flag == OFF) && (i == LMFC_Data_Step)){
3294  0254 7201000023    	btjf	_LMFC_Test_Register,#0,L3212
3296  0259 720200001e    	btjt	_LMFC_Test_Register,#1,L3212
3298  025e 7b01          	ld	a,(OFST+0,sp)
3299  0260 c1000f        	cp	a,_LMFC_Data_Step
3300  0263 2617          	jrne	L3212
3301                     ; 162 				if(Blink_50){
3303  0265 725d0000      	tnz	_Blink_50
3304  0269 2713          	jreq	LC003
3305                     ; 163 					if(i==0){ 	Display_LCD_String("      ");}
3307  026b 7b01          	ld	a,(OFST+0,sp)
3308  026d 2605          	jrne	L7212
3311  026f ae0066        	ldw	x,#L1312
3314  0272 2011          	jpf	LC002
3315  0274               L7212:
3316                     ; 164 					else if(i==1){Display_LCD_String("         FD:");  }
3318  0274 4a            	dec	a
3319  0275 2612          	jrne	L3412
3322  0277 ae0059        	ldw	x,#L7312
3324  027a 2009          	jpf	LC002
3325                     ; 166 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3327  027c               L3212:
3328                     ; 168 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3330  027c 7b01          	ld	a,(OFST+0,sp)
3331  027e               LC003:
3333  027e 97            	ld	xl,a
3334  027f a610          	ld	a,#16
3335  0281 42            	mul	x,a
3336  0282 1c0000        	addw	x,#_LCD_Dis_Data
3337  0285               LC002:
3338  0285 8d000000      	callf	f_Display_LCD_String
3340  0289               L3412:
3341                     ; 171 			if(i==0){
3343  0289 7b01          	ld	a,(OFST+0,sp)
3344  028b 262f          	jrne	L5412
3345                     ; 172 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3347  028d 5f            	clrw	x
3348  028e 97            	ld	xl,a
3349  028f d60000        	ld	a,(_LCD_Line,x)
3350  0292 ab08          	add	a,#8
3351  0294 8d000000      	callf	f_Set_LCD_Address
3353                     ; 173 				if((LMFC_Data_Setting_flag == ON) && (i == LMFC_Data_Step)){
3355  0298 7203000018    	btjf	_LMFC_Test_Register,#1,L1512
3357  029d 7b01          	ld	a,(OFST+0,sp)
3358  029f c1000f        	cp	a,_LMFC_Data_Step
3359  02a2 2611          	jrne	L1512
3360                     ; 174 					if(Blink_50){Display_LCD_String("     ");}
3362  02a4 725d0000      	tnz	_Blink_50
3363  02a8 270b          	jreq	L1512
3366  02aa ae0053        	ldw	x,#L3512
3367  02ad 8d000000      	callf	f_Display_LCD_String
3370  02b1 ac6e036e      	jra	L1612
3371  02b5               L1512:
3372                     ; 175 					else{ Num_Display_LCD(PTC_AllowOperation);}
3374                     ; 176 				}else{ Num_Display_LCD(PTC_AllowOperation);}
3377  02b5 c60000        	ld	a,_PTC_AllowOperation
3379  02b8 ac680368      	jpf	LC006
3380  02bc               L5412:
3381                     ; 178 			else if(i==1){
3383  02bc a101          	cp	a,#1
3384  02be 2704ac400340  	jrne	L3612
3385                     ; 180 				Set_LCD_Address((unsigned char)(LCD_Line[i]+3));
3387  02c4 5f            	clrw	x
3388  02c5 97            	ld	xl,a
3389  02c6 d60000        	ld	a,(_LCD_Line,x)
3390  02c9 ab03          	add	a,#3
3391  02cb 8d000000      	callf	f_Set_LCD_Address
3393                     ; 181 				if((LMFC_Data_Setting_flag == ON) && (i == LMFC_Data_Step)){
3395  02cf 720300001e    	btjf	_LMFC_Test_Register,#1,L1022
3397  02d4 7b01          	ld	a,(OFST+0,sp)
3398  02d6 c1000f        	cp	a,_LMFC_Data_Step
3399  02d9 2617          	jrne	L1022
3400                     ; 183 					if((UP_Long_SW)||(DN_Long_SW)){
3402  02db 720c000005    	btjt	_SW_Status,#6,L1712
3404  02e0 720f000002    	btjf	_SW_Status,#7,L7612
3405  02e5               L1712:
3406                     ; 184 						Num_Display_LCD(PTC_Heat_Duty/2);
3408                     ; 185 						Display_LCD_String(".");
3410                     ; 186 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3412                     ; 187 						Display_LCD_String("%");
3415  02e5 200b          	jpf	L1022
3416  02e7               L7612:
3417                     ; 189 					else if(Blink_50){Display_LCD_String("     ");}
3419  02e7 725d0000      	tnz	_Blink_50
3420  02eb 2705          	jreq	L1022
3423  02ed ae0053        	ldw	x,#L3512
3426  02f0 2021          	jra	L5022
3427  02f2               L1022:
3428                     ; 191 						Num_Display_LCD(PTC_Heat_Duty/2);
3430                     ; 192 						Display_LCD_String(".");
3432                     ; 193 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3434                     ; 194 						Display_LCD_String("%");
3436                     ; 197 					Num_Display_LCD(PTC_Heat_Duty/2);
3439                     ; 198 					Display_LCD_String(".");
3442                     ; 199 					Num_Display_LCD((PTC_Heat_Duty%2)*5);
3445                     ; 200 					Display_LCD_String("%");
3449  02f2 c60000        	ld	a,_PTC_Heat_Duty
3450  02f5 44            	srl	a
3451  02f6 5f            	clrw	x
3452  02f7 97            	ld	xl,a
3453  02f8 8d000000      	callf	f_Num_Display_LCD
3456  02fc ae0051        	ldw	x,#L3712
3457  02ff 8d000000      	callf	f_Display_LCD_String
3460  0303 c60000        	ld	a,_PTC_Heat_Duty
3461  0306 a401          	and	a,#1
3462  0308 97            	ld	xl,a
3463  0309 a605          	ld	a,#5
3464  030b 42            	mul	x,a
3465  030c 8d000000      	callf	f_Num_Display_LCD
3468  0310 ae004f        	ldw	x,#L5712
3470  0313               L5022:
3471  0313 8d000000      	callf	f_Display_LCD_String
3472                     ; 204 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));	
3474  0317 7b01          	ld	a,(OFST+0,sp)
3475  0319 5f            	clrw	x
3476  031a 97            	ld	xl,a
3477  031b d60000        	ld	a,(_LCD_Line,x)
3478  031e ab0c          	add	a,#12
3479  0320 8d000000      	callf	f_Set_LCD_Address
3481                     ; 205 				Num_Display_LCD(PTC_Fdback_Duty/2);
3483  0324 c60000        	ld	a,_PTC_Fdback_Duty
3484  0327 44            	srl	a
3485  0328 5f            	clrw	x
3486  0329 97            	ld	xl,a
3487  032a 8d000000      	callf	f_Num_Display_LCD
3489                     ; 206 				Display_LCD_String(".");
3491  032e ae0051        	ldw	x,#L3712
3492  0331 8d000000      	callf	f_Display_LCD_String
3494                     ; 207 				Num_Display_LCD((PTC_Fdback_Duty%2)*5);
3496  0335 c60000        	ld	a,_PTC_Fdback_Duty
3497  0338 a401          	and	a,#1
3498  033a 97            	ld	xl,a
3499  033b a605          	ld	a,#5
3500  033d 42            	mul	x,a
3503  033e 202a          	jpf	LC005
3504  0340               L3612:
3505                     ; 212 			else if(i==2){
3507  0340 a102          	cp	a,#2
3508  0342 2610          	jrne	L1122
3509                     ; 213 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3511  0344 5f            	clrw	x
3512  0345 97            	ld	xl,a
3513  0346 d60000        	ld	a,(_LCD_Line,x)
3514  0349 ab08          	add	a,#8
3515  034b 8d000000      	callf	f_Set_LCD_Address
3517                     ; 214 				Num_Display_LCD(LMFC_PTC_Status[0] & 0x01);		// PTC Ready flag
3519  034f c60000        	ld	a,_LMFC_PTC_Status
3522  0352 2012          	jpf	LC007
3523  0354               L1122:
3524                     ; 216 			else if(i==3){
3526  0354 a103          	cp	a,#3
3527  0356 2616          	jrne	L1612
3528                     ; 217 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3530  0358 5f            	clrw	x
3531  0359 97            	ld	xl,a
3532  035a d60000        	ld	a,(_LCD_Line,x)
3533  035d ab08          	add	a,#8
3534  035f 8d000000      	callf	f_Set_LCD_Address
3536                     ; 218 				Num_Display_LCD(LMFC_PTC_Status[1] & 0x01);		// PTC Fault Flag
3538  0363 c60001        	ld	a,_LMFC_PTC_Status+1
3539  0366               LC007:
3540  0366 a401          	and	a,#1
3541  0368               LC006:
3542  0368 5f            	clrw	x
3543  0369 97            	ld	xl,a
3544  036a               LC005:
3545  036a 8d000000      	callf	f_Num_Display_LCD
3547  036e               L1612:
3548                     ; 158 		for(i=0; i<4; i++){
3550  036e 0c01          	inc	(OFST+0,sp)
3553  0370 7b01          	ld	a,(OFST+0,sp)
3554  0372 a104          	cp	a,#4
3555  0374 2404ac4b024b  	jrult	L5112
3556                     ; 222 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3558  037a c60003        	ld	a,_LCD_Line+3
3559  037d ab0d          	add	a,#13
3560  037f 8d000000      	callf	f_Set_LCD_Address
3562                     ; 223 		Display_LCD_String("TX");
3564  0383 ae004c        	ldw	x,#L7122
3566                     ; 224 		Num_Display_LCD(LMFC_Test_Pg+1);  
3569  0386 ac0a090a      	jpf	LC027
3570  038a               L3112:
3571                     ; 227 	else if(LMFC_Test_Pg == 10){
3573  038a c60010        	ld	a,_LMFC_Test_Pg
3574  038d a10a          	cp	a,#10
3575  038f 2704acdf04df  	jrne	L3222
3576                     ; 228 		for(i=0; i<4; i++){
3578  0395 4f            	clr	a
3579  0396 6b01          	ld	(OFST+0,sp),a
3580  0398               L5222:
3581                     ; 229 			Set_LCD_Address(LCD_Line[i]);
3583  0398 5f            	clrw	x
3584  0399 97            	ld	xl,a
3585  039a d60000        	ld	a,(_LCD_Line,x)
3586  039d 8d000000      	callf	f_Set_LCD_Address
3588                     ; 231 			if((LMFC_Data_Select_flag == ON) && (LMFC_Data_Setting_flag == OFF) && (i == LMFC_Data_Step)){
3590  03a1 7201000017    	btjf	_LMFC_Test_Register,#0,L3322
3592  03a6 7202000012    	btjt	_LMFC_Test_Register,#1,L3322
3594  03ab 7b01          	ld	a,(OFST+0,sp)
3595  03ad c1000f        	cp	a,_LMFC_Data_Step
3596  03b0 260b          	jrne	L3322
3597                     ; 233 				if(Blink_50){Display_LCD_String("     ");}
3599  03b2 725d0000      	tnz	_Blink_50
3600  03b6 2707          	jreq	LC009
3603  03b8 ae0053        	ldw	x,#L3512
3606  03bb 2009          	jra	L1422
3607                     ; 234 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3609  03bd               L3322:
3610                     ; 236 			else{ Display_LCD_String(LCD_Dis_Data[i]);}
3612  03bd 7b01          	ld	a,(OFST+0,sp)
3613  03bf               LC009:
3615  03bf 97            	ld	xl,a
3616  03c0 a610          	ld	a,#16
3617  03c2 42            	mul	x,a
3618  03c3 1c0000        	addw	x,#_LCD_Dis_Data
3620  03c6               L1422:
3621  03c6 8d000000      	callf	f_Display_LCD_String
3622                     ; 238 			if(i==1){
3624  03ca 7b01          	ld	a,(OFST+0,sp)
3625  03cc a101          	cp	a,#1
3626  03ce 2655          	jrne	L3422
3627                     ; 239 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3629  03d0 5f            	clrw	x
3630  03d1 97            	ld	xl,a
3631  03d2 d60000        	ld	a,(_LCD_Line,x)
3632  03d5 ab08          	add	a,#8
3633  03d7 8d000000      	callf	f_Set_LCD_Address
3635                     ; 240 				if((LMFC_Data_Setting_flag == ON) && (i == LMFC_Data_Step)){
3637  03db 7203000020    	btjf	_LMFC_Test_Register,#1,L5522
3639  03e0 7b01          	ld	a,(OFST+0,sp)
3640  03e2 c1000f        	cp	a,_LMFC_Data_Step
3641  03e5 2619          	jrne	L5522
3642                     ; 241 					if((UP_Long_SW)||(DN_Long_SW)){
3644  03e7 720c000005    	btjt	_SW_Status,#6,L1522
3646  03ec 720f000002    	btjf	_SW_Status,#7,L7422
3647  03f1               L1522:
3648                     ; 242 						Num_Display_LCD(LMFC_Unit/2);
3650                     ; 243 						Display_LCD_String(".");
3652                     ; 244 						Num_Display_LCD((LMFC_Unit%2)*5);
3654                     ; 245 						Display_LCD_String("%");
3657  03f1 200d          	jpf	L5522
3658  03f3               L7422:
3659                     ; 247 					else if(Blink_50){Display_LCD_String("     ");}
3661  03f3 725d0000      	tnz	_Blink_50
3662  03f7 2707          	jreq	L5522
3665  03f9 ae0053        	ldw	x,#L3512
3668  03fc accb04cb      	jpf	LC010
3669  0400               L5522:
3670                     ; 249 						Num_Display_LCD(LMFC_Unit/2);
3672                     ; 250 						Display_LCD_String(".");
3674                     ; 251 						Num_Display_LCD((LMFC_Unit%2)*5);
3676                     ; 252 						Display_LCD_String("%");
3678                     ; 255 					Num_Display_LCD(LMFC_Unit/2);
3681                     ; 256 					Display_LCD_String(".");
3684                     ; 257 					Num_Display_LCD((LMFC_Unit%2)*5);
3687                     ; 258 					Display_LCD_String("%");
3691  0400 c60012        	ld	a,_LMFC_Unit
3692  0403 44            	srl	a
3693  0404 5f            	clrw	x
3694  0405 97            	ld	xl,a
3695  0406 8d000000      	callf	f_Num_Display_LCD
3698  040a ae0051        	ldw	x,#L3712
3699  040d 8d000000      	callf	f_Display_LCD_String
3702  0411 c60012        	ld	a,_LMFC_Unit
3703  0414 a401          	and	a,#1
3704  0416 97            	ld	xl,a
3705  0417 a605          	ld	a,#5
3706  0419 42            	mul	x,a
3707  041a 8d000000      	callf	f_Num_Display_LCD
3710  041e ae004f        	ldw	x,#L5712
3712  0421 accb04cb      	jpf	LC010
3713  0425               L3422:
3714                     ; 261 			else if(i==2){
3716  0425 a102          	cp	a,#2
3717  0427 2655          	jrne	L5622
3718                     ; 262 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3720  0429 5f            	clrw	x
3721  042a 97            	ld	xl,a
3722  042b d60000        	ld	a,(_LCD_Line,x)
3723  042e ab08          	add	a,#8
3724  0430 8d000000      	callf	f_Set_LCD_Address
3726                     ; 263 				if((LMFC_Data_Setting_flag == ON) && (i == LMFC_Data_Step)){
3728  0434 7203000043    	btjf	_LMFC_Test_Register,#1,L7622
3730  0439 7b01          	ld	a,(OFST+0,sp)
3731  043b c1000f        	cp	a,_LMFC_Data_Step
3732  043e 2617          	jrne	L3032
3733                     ; 264 					if((UP_Long_SW)||(DN_Long_SW)){
3735  0440 720c000005    	btjt	_SW_Status,#6,L3722
3737  0445 720f000002    	btjf	_SW_Status,#7,L1722
3738  044a               L3722:
3739                     ; 265 						Num_Display_LCD(LMFC_Ramp_Delay/60);
3741                     ; 266 						Display_LCD_String("m");
3743                     ; 267 						Num_Display_LCD(LMFC_Ramp_Delay%60);
3745                     ; 268 						Display_LCD_String("s");
3748  044a 200b          	jpf	L3032
3749  044c               L1722:
3750                     ; 270 					else if(Blink_50){Display_LCD_String("        ");}
3752  044c 725d0000      	tnz	_Blink_50
3753  0450 2705          	jreq	L3032
3756  0452               LC012:
3758  0452 ae003f        	ldw	x,#L5032
3761  0455 2074          	jpf	LC010
3762  0457               L3032:
3763                     ; 272 						Num_Display_LCD(LMFC_Ramp_Delay/60);
3766                     ; 273 						Display_LCD_String("m");
3769                     ; 274 						Num_Display_LCD(LMFC_Ramp_Delay%60);
3772                     ; 275 						Display_LCD_String("s");
3776  0457 ce0013        	ldw	x,_LMFC_Ramp_Delay
3777  045a 90ae003c      	ldw	y,#60
3778  045e 65            	divw	x,y
3779  045f 8d000000      	callf	f_Num_Display_LCD
3782  0463 ae004a        	ldw	x,#L5722
3783  0466 8d000000      	callf	f_Display_LCD_String
3786  046a ce0013        	ldw	x,_LMFC_Ramp_Delay
3787  046d 90ae003c      	ldw	y,#60
3788  0471 65            	divw	x,y
3789  0472 93            	ldw	x,y
3790  0473 8d000000      	callf	f_Num_Display_LCD
3793  0477 ae0048        	ldw	x,#L7722
3795  047a 204f          	jpf	LC010
3796  047c               L7622:
3797                     ; 278 					Num_Display_LCD(LMFC_Ramp_Delay/60);
3799                     ; 279 					Display_LCD_String("m");
3801                     ; 280 					Num_Display_LCD(LMFC_Ramp_Delay%60);
3803                     ; 281 					Display_LCD_String("s");
3805  047c 20d9          	jpf	L3032
3806  047e               L5622:
3807                     ; 284 			else if(i==3){
3809  047e a103          	cp	a,#3
3810  0480 264d          	jrne	L3622
3811                     ; 286 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3813  0482 5f            	clrw	x
3814  0483 97            	ld	xl,a
3815  0484 d60000        	ld	a,(_LCD_Line,x)
3816  0487 ab08          	add	a,#8
3817  0489 8d000000      	callf	f_Set_LCD_Address
3819                     ; 287 				if((LMFC_Data_Setting_flag == ON) && (i == LMFC_Data_Step)){
3821  048d 7203000023    	btjf	_LMFC_Test_Register,#1,L7132
3823  0492 7b01          	ld	a,(OFST+0,sp)
3824  0494 c1000f        	cp	a,_LMFC_Data_Step
3825  0497 261c          	jrne	L7132
3826                     ; 288 					if(Blink_50){Display_LCD_String("        ");}
3828  0499 725d0000      	tnz	_Blink_50
3832  049d 26b3          	jrne	LC012
3833                     ; 290 						if(LMFC_Ramp_UD==0){Display_LCD_String("DOWN");}
3835  049f 725d0015      	tnz	_LMFC_Ramp_UD
3836  04a3 2605          	jrne	L5232
3839  04a5               LC015:
3841  04a5 ae003a        	ldw	x,#L7232
3844  04a8 2021          	jpf	LC010
3845  04aa               L5232:
3846                     ; 291 						else if(LMFC_Ramp_UD==1){Display_LCD_String("OFF");}
3848  04aa c60015        	ld	a,_LMFC_Ramp_UD
3849  04ad 4a            	dec	a
3850  04ae 2611          	jrne	L3532
3853  04b0               LC016:
3855  04b0 ae0036        	ldw	x,#L5332
3858  04b3 2016          	jpf	LC010
3859                     ; 292 						else if(LMFC_Ramp_UD==2){Display_LCD_String("UP");}
3862  04b5               L7132:
3863                     ; 295 					if(LMFC_Ramp_UD==0){Display_LCD_String("DOWN");}
3865  04b5 725d0015      	tnz	_LMFC_Ramp_UD
3869  04b9 27ea          	jreq	LC015
3870                     ; 296 					else if(LMFC_Ramp_UD==1){Display_LCD_String("OFF");}
3872  04bb c60015        	ld	a,_LMFC_Ramp_UD
3873  04be 4a            	dec	a
3877  04bf 27ef          	jreq	LC016
3878  04c1               L3532:
3879                     ; 297 					else if(LMFC_Ramp_UD==2){Display_LCD_String("UP");}
3884  04c1 c60015        	ld	a,_LMFC_Ramp_UD
3885  04c4 a102          	cp	a,#2
3886  04c6 2607          	jrne	L3622
3888  04c8 ae0033        	ldw	x,#L3432
3889  04cb               LC010:
3890  04cb 8d000000      	callf	f_Display_LCD_String
3892  04cf               L3622:
3893                     ; 228 		for(i=0; i<4; i++){
3895  04cf 0c01          	inc	(OFST+0,sp)
3898  04d1 7b01          	ld	a,(OFST+0,sp)
3899  04d3 a104          	cp	a,#4
3900  04d5 2404ac980398  	jrult	L5222
3902  04db ac180918      	jra	L1222
3903  04df               L3222:
3904                     ; 304 		for(i=0;i<4;i++){
3906  04df 4f            	clr	a
3907  04e0 6b01          	ld	(OFST+0,sp),a
3908  04e2               L3632:
3909                     ; 305 			Set_LCD_Address(LCD_Line[i]);
3911  04e2 5f            	clrw	x
3912  04e3 97            	ld	xl,a
3913  04e4 d60000        	ld	a,(_LCD_Line,x)
3914  04e7 8d000000      	callf	f_Set_LCD_Address
3916                     ; 306 			Display_LCD_String(LCD_Dis_Data[i]);
3918  04eb 7b01          	ld	a,(OFST+0,sp)
3919  04ed 97            	ld	xl,a
3920  04ee a610          	ld	a,#16
3921  04f0 42            	mul	x,a
3922  04f1 1c0000        	addw	x,#_LCD_Dis_Data
3923  04f4 8d000000      	callf	f_Display_LCD_String
3925                     ; 304 		for(i=0;i<4;i++){
3927  04f8 0c01          	inc	(OFST+0,sp)
3930  04fa 7b01          	ld	a,(OFST+0,sp)
3931  04fc a104          	cp	a,#4
3932  04fe 25e2          	jrult	L3632
3933                     ; 310 		if(LMFC_Test_Pg == 1){
3935  0500 c60010        	ld	a,_LMFC_Test_Pg
3936  0503 4a            	dec	a
3937  0504 2704ac1c061c  	jrne	L1732
3938                     ; 312 			Set_LCD_Address((unsigned char)(LCD_Line[0]+5));
3940  050a c60000        	ld	a,_LCD_Line
3941  050d ab05          	add	a,#5
3942  050f 8d000000      	callf	f_Set_LCD_Address
3944                     ; 313 			if(PTC_BATT_VALUE == 0xFF){Display_LCD_String("Fa");}
3946  0513 ce0000        	ldw	x,_PTC_BATT_VALUE
3947  0516 a300ff        	cpw	x,#255
3948  0519 2609          	jrne	L3732
3951  051b ae0030        	ldw	x,#L5732
3952  051e 8d000000      	callf	f_Display_LCD_String
3955  0522 2005          	jra	L7732
3956  0524               L3732:
3957                     ; 314 			else{ Num_Display_LCD(PTC_BATT_VALUE*2);}  	//HV Display
3959  0524 58            	sllw	x
3960  0525 8d000000      	callf	f_Num_Display_LCD
3962  0529               L7732:
3963                     ; 316 			Set_LCD_Address((unsigned char)(LCD_Line[0]+9));
3965  0529 c60000        	ld	a,_LCD_Line
3966  052c ab09          	add	a,#9
3967  052e 8d000000      	callf	f_Set_LCD_Address
3969                     ; 317 			Display_LCD_String("V");
3971  0532 ae002e        	ldw	x,#L1042
3972  0535 8d000000      	callf	f_Display_LCD_String
3974                     ; 320 			Set_LCD_Address((unsigned char)(LCD_Line[1]+5));		//Current Display
3976  0539 c60001        	ld	a,_LCD_Line+1
3977  053c ab05          	add	a,#5
3978  053e 8d000000      	callf	f_Set_LCD_Address
3980                     ; 321 			Num_Display_LCD(PTC_Cur_VALUE/5);   
3982  0542 c60000        	ld	a,_PTC_Cur_VALUE
3983  0545 5f            	clrw	x
3984  0546 97            	ld	xl,a
3985  0547 a605          	ld	a,#5
3986  0549 8d000000      	callf	d_sdivx
3988  054d 8d000000      	callf	f_Num_Display_LCD
3990                     ; 322 			Display_LCD_String(".");
3992  0551 ae0051        	ldw	x,#L3712
3993  0554 8d000000      	callf	f_Display_LCD_String
3995                     ; 323 			Num_Display_LCD(((PTC_Cur_VALUE%5)*2));
3997  0558 c60000        	ld	a,_PTC_Cur_VALUE
3998  055b 5f            	clrw	x
3999  055c 97            	ld	xl,a
4000  055d a605          	ld	a,#5
4001  055f 8d000000      	callf	d_smodx
4003  0563 58            	sllw	x
4004  0564 8d000000      	callf	f_Num_Display_LCD
4006                     ; 325 			Set_LCD_Address((unsigned char)(LCD_Line[1]+9));
4008  0568 c60001        	ld	a,_LCD_Line+1
4009  056b ab09          	add	a,#9
4010  056d 8d000000      	callf	f_Set_LCD_Address
4012                     ; 326 			Display_LCD_String("A");
4014  0571 ae002c        	ldw	x,#L3042
4015  0574 8d000000      	callf	f_Display_LCD_String
4017                     ; 329 			Set_LCD_Address((unsigned char)(LCD_Line[2]+5));		//Power Display
4019  0578 c60002        	ld	a,_LCD_Line+2
4020  057b ab05          	add	a,#5
4021  057d 8d000000      	callf	f_Set_LCD_Address
4023                     ; 330 			if(PTC_PWR_VALUE == 0xFF){Display_LCD_String("Fa");}
4025  0581 ce0000        	ldw	x,_PTC_PWR_VALUE
4026  0584 a300ff        	cpw	x,#255
4027  0587 2609          	jrne	L5042
4030  0589 ae0030        	ldw	x,#L5732
4031  058c 8d000000      	callf	f_Display_LCD_String
4034  0590 200c          	jra	L7042
4035  0592               L5042:
4036                     ; 331 			else{ Num_Display_LCD(PTC_PWR_VALUE*50);}   
4038  0592 90ae0032      	ldw	y,#50
4039  0596 8d000000      	callf	d_imul
4041  059a 8d000000      	callf	f_Num_Display_LCD
4043  059e               L7042:
4044                     ; 333 			Set_LCD_Address((unsigned char)(LCD_Line[2]+9));
4046  059e c60002        	ld	a,_LCD_Line+2
4047  05a1 ab09          	add	a,#9
4048  05a3 8d000000      	callf	f_Set_LCD_Address
4050                     ; 334 			Display_LCD_String("W");
4052  05a7 ae002a        	ldw	x,#L1142
4053  05aa 8d000000      	callf	f_Display_LCD_String
4055                     ; 337 			Set_LCD_Address((unsigned char)(LCD_Line[3]+3));
4057  05ae c60003        	ld	a,_LCD_Line+3
4058  05b1 ab03          	add	a,#3
4059  05b3 8d000000      	callf	f_Set_LCD_Address
4061                     ; 338 			if(PTC_LCore_Temp == 0xFF){Display_LCD_String("Fa");}
4063  05b7 c60000        	ld	a,_PTC_LCore_Temp
4064  05ba a1ff          	cp	a,#255
4065  05bc 2609          	jrne	L3142
4068  05be ae0030        	ldw	x,#L5732
4069  05c1 8d000000      	callf	f_Display_LCD_String
4072  05c5 2021          	jra	L5142
4073  05c7               L3142:
4074                     ; 339 			else if(PTC_LCore_Temp<40){
4076  05c7 a128          	cp	a,#40
4077  05c9 2414          	jruge	L7142
4078                     ; 340 				Display_LCD_String("-");
4080  05cb ae0028        	ldw	x,#L1242
4081  05ce 8d000000      	callf	f_Display_LCD_String
4083                     ; 341 				Num_Display_LCD(40-PTC_LCore_Temp);
4085  05d2 4f            	clr	a
4086  05d3 97            	ld	xl,a
4087  05d4 a628          	ld	a,#40
4088  05d6 c00000        	sub	a,_PTC_LCore_Temp
4089  05d9 2401          	jrnc	L434
4090  05db 5a            	decw	x
4091  05dc               L434:
4092  05dc 02            	rlwa	x,a
4095  05dd 2005          	jpf	LC017
4096  05df               L7142:
4097                     ; 342 			}else{ Num_Display_LCD(PTC_LCore_Temp-40);}  	//Left Coretemp Display
4099  05df 5f            	clrw	x
4100  05e0 97            	ld	xl,a
4101  05e1 1d0028        	subw	x,#40
4102  05e4               LC017:
4103  05e4 8d000000      	callf	f_Num_Display_LCD
4105  05e8               L5142:
4106                     ; 345 			Set_LCD_Address((unsigned char)(LCD_Line[3]+10));
4108  05e8 c60003        	ld	a,_LCD_Line+3
4109  05eb ab0a          	add	a,#10
4110  05ed 8d000000      	callf	f_Set_LCD_Address
4112                     ; 346 			if(PTC_RCore_Temp == 0xFF){Display_LCD_String("Fa");}
4114  05f1 c60000        	ld	a,_PTC_RCore_Temp
4115  05f4 a1ff          	cp	a,#255
4119  05f6 2604ac8c088c  	jreq	LC026
4120                     ; 347 			else if(PTC_RCore_Temp<40){
4122  05fc a128          	cp	a,#40
4123  05fe 2504acb308b3  	jruge	LC025
4124                     ; 348 				Display_LCD_String("-");
4126  0604 ae0028        	ldw	x,#L1242
4127  0607 8d000000      	callf	f_Display_LCD_String
4129                     ; 349 				Num_Display_LCD(40-PTC_RCore_Temp);
4131  060b 4f            	clr	a
4132  060c 97            	ld	xl,a
4133  060d a628          	ld	a,#40
4134  060f c00000        	sub	a,_PTC_RCore_Temp
4135  0612 2504acad08ad  	jrnc	L246
4138  0618 acac08ac      	jpf	LC028
4139                     ; 350 			}else{ Num_Display_LCD(PTC_RCore_Temp-40);}  	//Left Coretemp Display
4141  061c               L1732:
4142                     ; 358 		else if(LMFC_Test_Pg == 2){
4144  061c c60010        	ld	a,_LMFC_Test_Pg
4145  061f a102          	cp	a,#2
4146  0621 2673          	jrne	L7342
4147                     ; 360 			PtcState = (unsigned char)((LMFC_PTC_Status[0] & 0x0C)>>2);
4149  0623 c60000        	ld	a,_LMFC_PTC_Status
4150  0626 a40c          	and	a,#12
4151  0628 44            	srl	a
4152  0629 44            	srl	a
4153  062a 6b01          	ld	(OFST+0,sp),a
4154                     ; 361 			Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
4156  062c c60000        	ld	a,_LCD_Line
4157  062f ab07          	add	a,#7
4158  0631 8d000000      	callf	f_Set_LCD_Address
4160                     ; 362 			if(PtcState == 0){Display_LCD_String("STOP");}			// PTC Status Display
4162  0635 7b01          	ld	a,(OFST+0,sp)
4163  0637 2605          	jrne	L1442
4166  0639 ae0023        	ldw	x,#L3442
4169  063c 2019          	jpf	LC018
4170  063e               L1442:
4171                     ; 363 			else if(PtcState == 1){Display_LCD_String("Oper");}
4173  063e a101          	cp	a,#1
4174  0640 2605          	jrne	L7442
4177  0642 ae001e        	ldw	x,#L1542
4180  0645 2010          	jpf	LC018
4181  0647               L7442:
4182                     ; 364 			else if(PtcState == 2){Display_LCD_String("fail");}
4184  0647 a102          	cp	a,#2
4185  0649 2605          	jrne	L5542
4188  064b ae0019        	ldw	x,#L7542
4191  064e 2007          	jpf	LC018
4192  0650               L5542:
4193                     ; 365 			else if(PtcState == 3){Display_LCD_String("Limit");}
4195  0650 a103          	cp	a,#3
4196  0652 2607          	jrne	L5442
4199  0654 ae0013        	ldw	x,#L5642
4200  0657               LC018:
4201  0657 8d000000      	callf	f_Display_LCD_String
4203  065b               L5442:
4204                     ; 368 			Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
4206  065b c60001        	ld	a,_LCD_Line+1
4207  065e ab07          	add	a,#7
4208  0660 8d000000      	callf	f_Set_LCD_Address
4210                     ; 369 			Num_Display_LCD(LMFC_PTC_Status[5] & 0x01);  		//Time out ID 111
4212  0664 c60005        	ld	a,_LMFC_PTC_Status+5
4213  0667 a401          	and	a,#1
4214  0669 5f            	clrw	x
4215  066a 97            	ld	xl,a
4216  066b 8d000000      	callf	f_Num_Display_LCD
4218                     ; 371 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4220  066f c60002        	ld	a,_LCD_Line+2
4221  0672 ab07          	add	a,#7
4222  0674 8d000000      	callf	f_Set_LCD_Address
4224                     ; 372 			Num_Display_LCD(LMFC_PTC_Status[2] & 0x01);  		//LV Low Flag
4226  0678 c60002        	ld	a,_LMFC_PTC_Status+2
4227  067b a401          	and	a,#1
4228  067d 5f            	clrw	x
4229  067e 97            	ld	xl,a
4230  067f 8d000000      	callf	f_Num_Display_LCD
4232                     ; 374 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4234  0683 c60003        	ld	a,_LCD_Line+3
4235  0686 ab07          	add	a,#7
4236  0688 8d000000      	callf	f_Set_LCD_Address
4238                     ; 375 			Num_Display_LCD((LMFC_PTC_Status[2] & 0x02)>>1);  	//LV Low Flag
4240  068c c60002        	ld	a,_LMFC_PTC_Status+2
4241  068f a402          	and	a,#2
4242  0691 44            	srl	a
4245  0692 acfb08fb      	jpf	LC023
4246  0696               L7342:
4247                     ; 378 		else if(LMFC_Test_Pg == 3){
4249  0696 c60010        	ld	a,_LMFC_Test_Pg
4250  0699 a103          	cp	a,#3
4251  069b 2654          	jrne	L1742
4252                     ; 380 			Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
4254  069d c60000        	ld	a,_LCD_Line
4255  06a0 ab07          	add	a,#7
4256  06a2 8d000000      	callf	f_Set_LCD_Address
4258                     ; 381 			Num_Display_LCD((LMFC_PTC_Status[2] & 0x04)>>2);	//HV Low Flag
4260  06a6 c60002        	ld	a,_LMFC_PTC_Status+2
4261  06a9 a404          	and	a,#4
4262  06ab 44            	srl	a
4263  06ac 44            	srl	a
4264  06ad 5f            	clrw	x
4265  06ae 97            	ld	xl,a
4266  06af 8d000000      	callf	f_Num_Display_LCD
4268                     ; 383 			Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
4270  06b3 c60001        	ld	a,_LCD_Line+1
4271  06b6 ab07          	add	a,#7
4272  06b8 8d000000      	callf	f_Set_LCD_Address
4274                     ; 384 			Num_Display_LCD((LMFC_PTC_Status[2] & 0x08)>>3);  	//HV High Flag
4276  06bc c60002        	ld	a,_LMFC_PTC_Status+2
4277  06bf a408          	and	a,#8
4278  06c1 44            	srl	a
4279  06c2 44            	srl	a
4280  06c3 44            	srl	a
4281  06c4 5f            	clrw	x
4282  06c5 97            	ld	xl,a
4283  06c6 8d000000      	callf	f_Num_Display_LCD
4285                     ; 386 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4287  06ca c60002        	ld	a,_LCD_Line+2
4288  06cd ab07          	add	a,#7
4289  06cf 8d000000      	callf	f_Set_LCD_Address
4291                     ; 387 			Num_Display_LCD((LMFC_PTC_Status[2] & 0x10)>>4);  	//Over Current  Flag
4293  06d3 c60002        	ld	a,_LMFC_PTC_Status+2
4294  06d6 4e            	swap	a
4295  06d7 a401          	and	a,#1
4296  06d9 5f            	clrw	x
4297  06da 97            	ld	xl,a
4298  06db 8d000000      	callf	f_Num_Display_LCD
4300                     ; 389 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4302  06df c60003        	ld	a,_LCD_Line+3
4303  06e2 ab07          	add	a,#7
4304  06e4 8d000000      	callf	f_Set_LCD_Address
4306                     ; 390 			Num_Display_LCD(LMFC_PTC_Status[3] & 0x01);  		//Outlet Thermal Fault flag
4308  06e8 c60003        	ld	a,_LMFC_PTC_Status+3
4309  06eb a401          	and	a,#1
4312  06ed acfb08fb      	jpf	LC023
4313  06f1               L1742:
4314                     ; 392 		else if(LMFC_Test_Pg == 4){
4316  06f1 c60010        	ld	a,_LMFC_Test_Pg
4317  06f4 a104          	cp	a,#4
4318  06f6 2653          	jrne	L5742
4319                     ; 393 			Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
4321  06f8 c60000        	ld	a,_LCD_Line
4322  06fb ab07          	add	a,#7
4323  06fd 8d000000      	callf	f_Set_LCD_Address
4325                     ; 394 			Num_Display_LCD((LMFC_PTC_Status[3] & 0x04)>>2);  	//PCB Thermal Shut dowm fail Flag
4327  0701 c60003        	ld	a,_LMFC_PTC_Status+3
4328  0704 a404          	and	a,#4
4329  0706 44            	srl	a
4330  0707 44            	srl	a
4331  0708 5f            	clrw	x
4332  0709 97            	ld	xl,a
4333  070a 8d000000      	callf	f_Num_Display_LCD
4335                     ; 396 			Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
4337  070e c60001        	ld	a,_LCD_Line+1
4338  0711 ab07          	add	a,#7
4339  0713 8d000000      	callf	f_Set_LCD_Address
4341                     ; 397 			Num_Display_LCD(LMFC_PTC_Status[4] & 0x01);  		//Failure High Voltage Sensor Flag
4343  0717 c60004        	ld	a,_LMFC_PTC_Status+4
4344  071a a401          	and	a,#1
4345  071c 5f            	clrw	x
4346  071d 97            	ld	xl,a
4347  071e 8d000000      	callf	f_Num_Display_LCD
4349                     ; 399 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4351  0722 c60002        	ld	a,_LCD_Line+2
4352  0725 ab07          	add	a,#7
4353  0727 8d000000      	callf	f_Set_LCD_Address
4355                     ; 400 			Num_Display_LCD((LMFC_PTC_Status[4] & 0x02)>>1);  	//Failure Low Voltage Sensor Flag
4357  072b c60004        	ld	a,_LMFC_PTC_Status+4
4358  072e a402          	and	a,#2
4359  0730 44            	srl	a
4360  0731 5f            	clrw	x
4361  0732 97            	ld	xl,a
4362  0733 8d000000      	callf	f_Num_Display_LCD
4364                     ; 402 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4366  0737 c60003        	ld	a,_LCD_Line+3
4367  073a ab07          	add	a,#7
4368  073c 8d000000      	callf	f_Set_LCD_Address
4370                     ; 403 			Num_Display_LCD((LMFC_PTC_Status[4] & 0x04)>>2);  	//Failure Current Sensor Flag
4372  0740 c60004        	ld	a,_LMFC_PTC_Status+4
4373  0743 a404          	and	a,#4
4374  0745 44            	srl	a
4375  0746 44            	srl	a
4378  0747 acfb08fb      	jpf	LC023
4379  074b               L5742:
4380                     ; 405 		else if(LMFC_Test_Pg == 5){
4382  074b c60010        	ld	a,_LMFC_Test_Pg
4383  074e a105          	cp	a,#5
4384  0750 2663          	jrne	L1052
4385                     ; 406 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4387  0752 c60000        	ld	a,_LCD_Line
4388  0755 ab08          	add	a,#8
4389  0757 8d000000      	callf	f_Set_LCD_Address
4391                     ; 407 			Num_Display_LCD((LMFC_PTC_Status[4] & 0x08)>>3);  	//Failure PCB Temp Sensor Flag
4393  075b c60004        	ld	a,_LMFC_PTC_Status+4
4394  075e a408          	and	a,#8
4395  0760 44            	srl	a
4396  0761 44            	srl	a
4397  0762 44            	srl	a
4398  0763 5f            	clrw	x
4399  0764 97            	ld	xl,a
4400  0765 8d000000      	callf	f_Num_Display_LCD
4402                     ; 409 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4404  0769 c60001        	ld	a,_LCD_Line+1
4405  076c ab08          	add	a,#8
4406  076e 8d000000      	callf	f_Set_LCD_Address
4408                     ; 410 			Num_Display_LCD((LMFC_PTC_Status[4] & 0x10)>>4);	//Failure Outlet Temp Sensor Flag
4410  0772 c60004        	ld	a,_LMFC_PTC_Status+4
4411  0775 4e            	swap	a
4412  0776 a401          	and	a,#1
4413  0778 5f            	clrw	x
4414  0779 97            	ld	xl,a
4415  077a 8d000000      	callf	f_Num_Display_LCD
4417                     ; 412 			Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4419  077e c60002        	ld	a,_LCD_Line+2
4420  0781 ab07          	add	a,#7
4421  0783 8d000000      	callf	f_Set_LCD_Address
4423                     ; 413 			Num_Display_LCD(PTC_Limit_Cause);  					//Failure Outlet Temp Sensor Flag
4425  0787 c60000        	ld	a,_PTC_Limit_Cause
4426  078a 5f            	clrw	x
4427  078b 97            	ld	xl,a
4428  078c 8d000000      	callf	f_Num_Display_LCD
4430                     ; 415 			Set_LCD_Address((unsigned char)(LCD_Line[3]+7));
4432  0790 c60003        	ld	a,_LCD_Line+3
4433  0793 ab07          	add	a,#7
4434  0795 8d000000      	callf	f_Set_LCD_Address
4436                     ; 416 			Num_Display_LCD(PTC_SW_Ver>>4);  			//SoftWare Version Display
4438  0799 c60000        	ld	a,_PTC_SW_Ver
4439  079c 4e            	swap	a
4440  079d a40f          	and	a,#15
4441  079f 5f            	clrw	x
4442  07a0 97            	ld	xl,a
4443  07a1 8d000000      	callf	f_Num_Display_LCD
4445                     ; 417 			Display_LCD_String(".");
4447  07a5 ae0051        	ldw	x,#L3712
4448  07a8 8d000000      	callf	f_Display_LCD_String
4450                     ; 418 			Num_Display_LCD(PTC_SW_Ver&0x0F);  			//SoftWare Version Display
4452  07ac c60000        	ld	a,_PTC_SW_Ver
4453  07af a40f          	and	a,#15
4456  07b1 acfb08fb      	jpf	LC023
4457  07b5               L1052:
4458                     ; 420 		else if(LMFC_Test_Pg == 6){
4460  07b5 c60010        	ld	a,_LMFC_Test_Pg
4461  07b8 a106          	cp	a,#6
4462  07ba 2704acba08ba  	jrne	L5052
4463                     ; 421 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4465  07c0 c60000        	ld	a,_LCD_Line
4466  07c3 ab08          	add	a,#8
4467  07c5 8d000000      	callf	f_Set_LCD_Address
4469                     ; 422 			if(LMFC_PTC_Debug[0] == 0xFF){Display_LCD_String("Fa");}
4471  07c9 c60007        	ld	a,_LMFC_PTC_Debug
4472  07cc 4c            	inc	a
4473  07cd 2609          	jrne	L7052
4476  07cf ae0030        	ldw	x,#L5732
4477  07d2 8d000000      	callf	f_Display_LCD_String
4480  07d6 2027          	jra	L1152
4481  07d8               L7052:
4482                     ; 423 			else if(LMFC_PTC_Debug[0] < 40){
4484  07d8 c60007        	ld	a,_LMFC_PTC_Debug
4485  07db a128          	cp	a,#40
4486  07dd 2414          	jruge	L3152
4487                     ; 424 				Display_LCD_String("-");
4489  07df ae0028        	ldw	x,#L1242
4490  07e2 8d000000      	callf	f_Display_LCD_String
4492                     ; 425 				Num_Display_LCD(40-LMFC_PTC_Debug[0]);
4494  07e6 4f            	clr	a
4495  07e7 97            	ld	xl,a
4496  07e8 a628          	ld	a,#40
4497  07ea c00007        	sub	a,_LMFC_PTC_Debug
4498  07ed 2401          	jrnc	L675
4499  07ef 5a            	decw	x
4500  07f0               L675:
4501  07f0 02            	rlwa	x,a
4504  07f1 2008          	jpf	LC019
4505  07f3               L3152:
4506                     ; 427 			else{ Num_Display_LCD(LMFC_PTC_Debug[0]-40);}
4508  07f3 c60007        	ld	a,_LMFC_PTC_Debug
4509  07f6 5f            	clrw	x
4510  07f7 97            	ld	xl,a
4511  07f8 1d0028        	subw	x,#40
4512  07fb               LC019:
4513  07fb 8d000000      	callf	f_Num_Display_LCD
4515  07ff               L1152:
4516                     ; 429 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4518  07ff c60001        	ld	a,_LCD_Line+1
4519  0802 ab08          	add	a,#8
4520  0804 8d000000      	callf	f_Set_LCD_Address
4522                     ; 430 			if(LMFC_PTC_Debug[1] == 0xFF){Display_LCD_String("Fa");}
4524  0808 c60008        	ld	a,_LMFC_PTC_Debug+1
4525  080b 4c            	inc	a
4526  080c 2609          	jrne	L7152
4529  080e ae0030        	ldw	x,#L5732
4530  0811 8d000000      	callf	f_Display_LCD_String
4533  0815 2027          	jra	L1252
4534  0817               L7152:
4535                     ; 431 			else if(LMFC_PTC_Debug[1] < 40){
4537  0817 c60008        	ld	a,_LMFC_PTC_Debug+1
4538  081a a128          	cp	a,#40
4539  081c 2414          	jruge	L3252
4540                     ; 432 				Display_LCD_String("-");
4542  081e ae0028        	ldw	x,#L1242
4543  0821 8d000000      	callf	f_Display_LCD_String
4545                     ; 433 				Num_Display_LCD(40-LMFC_PTC_Debug[1]);
4547  0825 4f            	clr	a
4548  0826 97            	ld	xl,a
4549  0827 a628          	ld	a,#40
4550  0829 c00008        	sub	a,_LMFC_PTC_Debug+1
4551  082c 2401          	jrnc	L216
4552  082e 5a            	decw	x
4553  082f               L216:
4554  082f 02            	rlwa	x,a
4557  0830 2008          	jpf	LC020
4558  0832               L3252:
4559                     ; 435 			else{ Num_Display_LCD(LMFC_PTC_Debug[1]-40);}
4561  0832 c60008        	ld	a,_LMFC_PTC_Debug+1
4562  0835 5f            	clrw	x
4563  0836 97            	ld	xl,a
4564  0837 1d0028        	subw	x,#40
4565  083a               LC020:
4566  083a 8d000000      	callf	f_Num_Display_LCD
4568  083e               L1252:
4569                     ; 437 			Set_LCD_Address((unsigned char)(LCD_Line[2]+8));
4571  083e c60002        	ld	a,_LCD_Line+2
4572  0841 ab08          	add	a,#8
4573  0843 8d000000      	callf	f_Set_LCD_Address
4575                     ; 438 			if(LMFC_PTC_Debug[2] == 0xFF){Display_LCD_String("Fa");}
4577  0847 c60009        	ld	a,_LMFC_PTC_Debug+2
4578  084a 4c            	inc	a
4579  084b 2609          	jrne	L7252
4582  084d ae0030        	ldw	x,#L5732
4583  0850 8d000000      	callf	f_Display_LCD_String
4586  0854 2027          	jra	L1352
4587  0856               L7252:
4588                     ; 439 			else if(LMFC_PTC_Debug[2] < 40){
4590  0856 c60009        	ld	a,_LMFC_PTC_Debug+2
4591  0859 a128          	cp	a,#40
4592  085b 2414          	jruge	L3352
4593                     ; 440 				Display_LCD_String("-");
4595  085d ae0028        	ldw	x,#L1242
4596  0860 8d000000      	callf	f_Display_LCD_String
4598                     ; 441 				Num_Display_LCD(40-LMFC_PTC_Debug[2]);
4600  0864 4f            	clr	a
4601  0865 97            	ld	xl,a
4602  0866 a628          	ld	a,#40
4603  0868 c00009        	sub	a,_LMFC_PTC_Debug+2
4604  086b 2401          	jrnc	L626
4605  086d 5a            	decw	x
4606  086e               L626:
4607  086e 02            	rlwa	x,a
4610  086f 2008          	jpf	LC021
4611  0871               L3352:
4612                     ; 443 			else{ Num_Display_LCD(LMFC_PTC_Debug[2]-40);}
4614  0871 c60009        	ld	a,_LMFC_PTC_Debug+2
4615  0874 5f            	clrw	x
4616  0875 97            	ld	xl,a
4617  0876 1d0028        	subw	x,#40
4618  0879               LC021:
4619  0879 8d000000      	callf	f_Num_Display_LCD
4621  087d               L1352:
4622                     ; 445 			Set_LCD_Address((unsigned char)(LCD_Line[3]+8));
4624  087d c60003        	ld	a,_LCD_Line+3
4625  0880 ab08          	add	a,#8
4626  0882 8d000000      	callf	f_Set_LCD_Address
4628                     ; 446 			if(LMFC_PTC_Debug[3] == 0xFF){Display_LCD_String("Fa");}
4630  0886 c6000a        	ld	a,_LMFC_PTC_Debug+3
4631  0889 4c            	inc	a
4632  088a 2609          	jrne	L7352
4635  088c               LC026:
4637  088c ae0030        	ldw	x,#L5732
4638  088f 8d000000      	callf	f_Display_LCD_String
4641  0893 206c          	jra	L5342
4642  0895               L7352:
4643                     ; 447 			else if(LMFC_PTC_Debug[3] < 40){
4645  0895 c6000a        	ld	a,_LMFC_PTC_Debug+3
4646  0898 a128          	cp	a,#40
4647  089a 2414          	jruge	L3452
4648                     ; 448 				Display_LCD_String("-");
4650  089c ae0028        	ldw	x,#L1242
4651  089f 8d000000      	callf	f_Display_LCD_String
4653                     ; 449 				Num_Display_LCD(40-LMFC_PTC_Debug[3]);
4655  08a3 4f            	clr	a
4656  08a4 97            	ld	xl,a
4657  08a5 a628          	ld	a,#40
4658  08a7 c0000a        	sub	a,_LMFC_PTC_Debug+3
4659  08aa 2401          	jrnc	L246
4660  08ac               LC028:
4661  08ac 5a            	decw	x
4662  08ad               L246:
4663  08ad 02            	rlwa	x,a
4666  08ae 204d          	jpf	LC022
4667  08b0               L3452:
4668                     ; 451 			else{ Num_Display_LCD(LMFC_PTC_Debug[3]-40);}
4670  08b0 c6000a        	ld	a,_LMFC_PTC_Debug+3
4671  08b3               LC025:
4673  08b3 5f            	clrw	x
4674  08b4 97            	ld	xl,a
4675  08b5 1d0028        	subw	x,#40
4677  08b8 2043          	jpf	LC022
4678  08ba               L5052:
4679                     ; 454 		else if(LMFC_Test_Pg == 7){
4681  08ba c60010        	ld	a,_LMFC_Test_Pg
4682  08bd a107          	cp	a,#7
4683  08bf 2640          	jrne	L5342
4684                     ; 455 			Set_LCD_Address((unsigned char)(LCD_Line[0]+8));
4686  08c1 c60000        	ld	a,_LCD_Line
4687  08c4 ab08          	add	a,#8
4688  08c6 8d000000      	callf	f_Set_LCD_Address
4690                     ; 456 			Num_Display_LCD(LMFC_PTC_Debug[4]/10);
4692  08ca c6000b        	ld	a,_LMFC_PTC_Debug+4
4693  08cd 5f            	clrw	x
4694  08ce 97            	ld	xl,a
4695  08cf a60a          	ld	a,#10
4696  08d1 8d000000      	callf	d_sdivx
4698  08d5 8d000000      	callf	f_Num_Display_LCD
4700                     ; 457 			Display_LCD_String(".");
4702  08d9 ae0051        	ldw	x,#L3712
4703  08dc 8d000000      	callf	f_Display_LCD_String
4705                     ; 458 			Num_Display_LCD(LMFC_PTC_Debug[4]%10);
4707  08e0 c6000b        	ld	a,_LMFC_PTC_Debug+4
4708  08e3 5f            	clrw	x
4709  08e4 97            	ld	xl,a
4710  08e5 a60a          	ld	a,#10
4711  08e7 8d000000      	callf	d_smodx
4713  08eb 8d000000      	callf	f_Num_Display_LCD
4715                     ; 460 			Set_LCD_Address((unsigned char)(LCD_Line[1]+8));
4717  08ef c60001        	ld	a,_LCD_Line+1
4718  08f2 ab08          	add	a,#8
4719  08f4 8d000000      	callf	f_Set_LCD_Address
4721                     ; 461 			Num_Display_LCD(LMFC_PTC_Debug[5]);
4723  08f8 c6000c        	ld	a,_LMFC_PTC_Debug+5
4724  08fb               LC023:
4725  08fb 5f            	clrw	x
4726  08fc 97            	ld	xl,a
4727  08fd               LC022:
4728  08fd 8d000000      	callf	f_Num_Display_LCD
4730  0901               L5342:
4731                     ; 465 		Set_LCD_Address((unsigned char)(0xD0+13));
4733  0901 a6dd          	ld	a,#221
4734  0903 8d000000      	callf	f_Set_LCD_Address
4736                     ; 466 		Display_LCD_String("RX");
4738  0907 ae0010        	ldw	x,#L3552
4740                     ; 467 		Num_Display_LCD(LMFC_Test_Pg+1);  
4742  090a               LC027:
4743  090a 8d000000      	callf	f_Display_LCD_String
4745  090e c60010        	ld	a,_LMFC_Test_Pg
4746  0911 5f            	clrw	x
4747  0912 97            	ld	xl,a
4748  0913 5c            	incw	x
4749  0914 8d000000      	callf	f_Num_Display_LCD
4751  0918               L1222:
4752                     ; 471 	if(LMFC_Trans_flag == ON){
4754  0918 a60d          	ld	a,#13
4755  091a 7205000014    	btjf	_LMFC_Test_Register,#2,L5552
4756                     ; 472 		Set_LCD_Address((unsigned char)(0x00+13));
4758  091f 8d000000      	callf	f_Set_LCD_Address
4760                     ; 473 		if(Blink_30){Display_LCD_String("COM");}
4762  0923 725d0000      	tnz	_Blink_30
4763  0927 2705          	jreq	L7552
4766  0929 ae000c        	ldw	x,#L1652
4769  092c 200c          	jra	L7652
4770  092e               L7552:
4771                     ; 474 		else{Display_LCD_String("   ");}
4773  092e ae0008        	ldw	x,#L5652
4775  0931 2007          	jra	L7652
4776  0933               L5552:
4777                     ; 477 		Set_LCD_Address((unsigned char)(0x00+13));
4779  0933 8d000000      	callf	f_Set_LCD_Address
4781                     ; 478 		Display_LCD_String("NON");
4783  0937 ae0004        	ldw	x,#L1752
4785  093a               L7652:
4786  093a 8d000000      	callf	f_Display_LCD_String
4787                     ; 482 	return;
4790  093e 84            	pop	a
4791  093f 87            	retf	
4830                     .const:	section	.text
4831  0000               L407:
4832  0000 0000ea60      	dc.l	60000
4833                     ; 486 void LMFC_Test_Value_Change(unsigned char ST)
4833                     ; 487 {
4834                     	switch	.text
4835  0940               f_LMFC_Test_Value_Change:
4837  0940 88            	push	a
4838       00000000      OFST:	set	0
4841                     ; 489 	if(ST == 1){
4843  0941 4a            	dec	a
4844  0942 2704acc609c6  	jrne	L7062
4845                     ; 491 		if(LMFC_Option_flag){
4847  0948 7207000051    	btjf	_LMFC_Test_Register,#3,L1162
4848                     ; 492 			if(LMFC_Data_Step == 1){ if(LMFC_Unit<200){LMFC_Unit++;}}
4850  094d c6000f        	ld	a,_LMFC_Data_Step
4851  0950 4a            	dec	a
4852  0951 2613          	jrne	L3162
4855  0953 c60012        	ld	a,_LMFC_Unit
4856  0956 a1c8          	cp	a,#200
4857  0958 2504ac370a37  	jruge	L7462
4860  095e 725c0012      	inc	_LMFC_Unit
4861  0962 ac370a37      	jra	L7462
4862  0966               L3162:
4863                     ; 493 			else if(LMFC_Data_Step == 2){ if(LMFC_Ramp_Delay<60000){LMFC_Ramp_Delay++;}}
4865  0966 c6000f        	ld	a,_LMFC_Data_Step
4866  0969 a102          	cp	a,#2
4867  096b 261b          	jrne	L1262
4870  096d ce0013        	ldw	x,_LMFC_Ramp_Delay
4871  0970 8d000000      	callf	d_uitolx
4873  0974 ae0000        	ldw	x,#L407
4874  0977 8d000000      	callf	d_lcmp
4876  097b 2ee5          	jrsge	L7462
4879  097d ce0013        	ldw	x,_LMFC_Ramp_Delay
4880  0980 5c            	incw	x
4881  0981 cf0013        	ldw	_LMFC_Ramp_Delay,x
4882  0984 ac370a37      	jra	L7462
4883  0988               L1262:
4884                     ; 494 			else if(LMFC_Data_Step == 3){ if(LMFC_Ramp_UD<2){LMFC_Ramp_UD++;}}
4886  0988 c6000f        	ld	a,_LMFC_Data_Step
4887  098b a103          	cp	a,#3
4888  098d 26f5          	jrne	L7462
4891  098f c60015        	ld	a,_LMFC_Ramp_UD
4892  0992 a102          	cp	a,#2
4893  0994 24ee          	jruge	L7462
4896  0996 725c0015      	inc	_LMFC_Ramp_UD
4897  099a ac370a37      	jra	L7462
4898  099e               L1162:
4899                     ; 498 			if(LMFC_Data_Step == 0){PTC_AllowOperation ^= 1;}
4901  099e 725d000f      	tnz	_LMFC_Data_Step
4904  09a2 276f          	jreq	LC030
4905                     ; 499 			else if(LMFC_Data_Step == 1){
4907  09a4 c6000f        	ld	a,_LMFC_Data_Step
4908  09a7 4a            	dec	a
4909  09a8 26f0          	jrne	L7462
4910                     ; 500 				if((PTC_Heat_Duty+ LMFC_Unit)>200){PTC_Heat_Duty = 200;}
4912  09aa c60000        	ld	a,_PTC_Heat_Duty
4913  09ad 5f            	clrw	x
4914  09ae cb0012        	add	a,_LMFC_Unit
4915  09b1 59            	rlcw	x
4916  09b2 02            	rlwa	x,a
4917  09b3 a300c9        	cpw	x,#201
4918  09b6 2f06          	jrslt	L3462
4921  09b8 35c80000      	mov	_PTC_Heat_Duty,#200
4923  09bc 2079          	jra	L7462
4924  09be               L3462:
4925                     ; 501 				else{PTC_Heat_Duty += LMFC_Unit;}
4927  09be c60000        	ld	a,_PTC_Heat_Duty
4928  09c1 cb0012        	add	a,_LMFC_Unit
4929  09c4 206e          	jpf	LC029
4930  09c6               L7062:
4931                     ; 506 	else if(ST == 0){
4933  09c6 7b01          	ld	a,(OFST+1,sp)
4934  09c8 266d          	jrne	L7462
4935                     ; 507 		if(LMFC_Option_flag){
4937  09ca 720700003e    	btjf	_LMFC_Test_Register,#3,L3562
4938                     ; 508 			if(LMFC_Data_Step == 1){if(LMFC_Unit>1){LMFC_Unit--;}  }
4940  09cf c6000f        	ld	a,_LMFC_Data_Step
4941  09d2 4a            	dec	a
4942  09d3 260d          	jrne	L5562
4945  09d5 c60012        	ld	a,_LMFC_Unit
4946  09d8 a102          	cp	a,#2
4947  09da 255b          	jrult	L7462
4950  09dc 725a0012      	dec	_LMFC_Unit
4951  09e0 2055          	jra	L7462
4952  09e2               L5562:
4953                     ; 509 			else if(LMFC_Data_Step == 2){ if(LMFC_Ramp_Delay>1){LMFC_Ramp_Delay--;}}
4955  09e2 c6000f        	ld	a,_LMFC_Data_Step
4956  09e5 a102          	cp	a,#2
4957  09e7 2611          	jrne	L3662
4960  09e9 ce0013        	ldw	x,_LMFC_Ramp_Delay
4961  09ec a30002        	cpw	x,#2
4962  09ef 2546          	jrult	L7462
4965  09f1 ce0013        	ldw	x,_LMFC_Ramp_Delay
4966  09f4 5a            	decw	x
4967  09f5 cf0013        	ldw	_LMFC_Ramp_Delay,x
4968  09f8 203d          	jra	L7462
4969  09fa               L3662:
4970                     ; 510 			else if(LMFC_Data_Step == 3){ if(LMFC_Ramp_UD>0){LMFC_Ramp_UD--;}}
4972  09fa c6000f        	ld	a,_LMFC_Data_Step
4973  09fd a103          	cp	a,#3
4974  09ff 2636          	jrne	L7462
4977  0a01 725d0015      	tnz	_LMFC_Ramp_UD
4978  0a05 2730          	jreq	L7462
4981  0a07 725a0015      	dec	_LMFC_Ramp_UD
4982  0a0b 202a          	jra	L7462
4983  0a0d               L3562:
4984                     ; 513 			if(LMFC_Data_Step == 0){PTC_AllowOperation ^= 1;}
4986  0a0d 725d000f      	tnz	_LMFC_Data_Step
4987  0a11 260a          	jrne	L7762
4990  0a13               LC030:
4992  0a13 c60000        	ld	a,_PTC_AllowOperation
4993  0a16 a801          	xor	a,#1
4994  0a18 c70000        	ld	_PTC_AllowOperation,a
4996  0a1b 201a          	jra	L7462
4997  0a1d               L7762:
4998                     ; 514 			else if(LMFC_Data_Step == 1){
5000  0a1d c6000f        	ld	a,_LMFC_Data_Step
5001  0a20 4a            	dec	a
5002  0a21 2614          	jrne	L7462
5003                     ; 515 				if(PTC_Heat_Duty < LMFC_Unit){PTC_Heat_Duty = 0;}
5005  0a23 c60000        	ld	a,_PTC_Heat_Duty
5006  0a26 c10012        	cp	a,_LMFC_Unit
5007  0a29 2406          	jruge	L5072
5010  0a2b 725f0000      	clr	_PTC_Heat_Duty
5012  0a2f 2006          	jra	L7462
5013  0a31               L5072:
5014                     ; 516 				else{PTC_Heat_Duty -= LMFC_Unit;}
5016  0a31 c00012        	sub	a,_LMFC_Unit
5017  0a34               LC029:
5018  0a34 c70000        	ld	_PTC_Heat_Duty,a
5019  0a37               L7462:
5020                     ; 520 	return ;
5023  0a37 84            	pop	a
5024  0a38 87            	retf	
5055                     ; 524 void LMFC_Switch_Control(void)
5055                     ; 525 {
5056                     	switch	.text
5057  0a39               f_LMFC_Switch_Control:
5061                     ; 526 	if(UP_SW_flag == ON){
5063  0a39 7203000051    	btjf	_SW_Status,#1,L1272
5064                     ; 529 		if(LMFC_Data_Setting_flag == ON){	LMFC_Test_Value_Change(1);}
5066  0a3e 7203000008    	btjf	_LMFC_Test_Register,#1,L3272
5069  0a43 a601          	ld	a,#1
5070  0a45 8d400940      	callf	f_LMFC_Test_Value_Change
5073  0a49 203e          	jra	L5272
5074  0a4b               L3272:
5075                     ; 531 		else if(LMFC_Data_Select_flag){
5077  0a4b 720100001a    	btjf	_LMFC_Test_Register,#0,L7272
5078                     ; 532 			if(LMFC_Option_flag){
5080  0a50 7207000009    	btjf	_LMFC_Test_Register,#3,L1372
5081                     ; 533 				if(LMFC_Data_Step > 1){ LMFC_Data_Step--;}
5083  0a55 c6000f        	ld	a,_LMFC_Data_Step
5084  0a58 a102          	cp	a,#2
5085  0a5a 252d          	jrult	L5272
5087  0a5c 2006          	jpf	LC031
5088  0a5e               L1372:
5089                     ; 536 				if(LMFC_Data_Step > 0){ LMFC_Data_Step--;}	
5091  0a5e 725d000f      	tnz	_LMFC_Data_Step
5092  0a62 2725          	jreq	L5272
5095  0a64               LC031:
5097  0a64 725a000f      	dec	_LMFC_Data_Step
5098  0a68 201f          	jra	L5272
5099  0a6a               L7272:
5100                     ; 539 			if(!LMFC_Option_flag){
5102  0a6a 720600001a    	btjt	_LMFC_Test_Register,#3,L5272
5103                     ; 540 				if(LMFC_Test_Pg > 0){ LMFC_Test_Pg--;}
5105  0a6f 725d0010      	tnz	_LMFC_Test_Pg
5106  0a73 2706          	jreq	L5472
5109  0a75 725a0010      	dec	_LMFC_Test_Pg
5111  0a79 2004          	jra	L7472
5112  0a7b               L5472:
5113                     ; 541 				else{LMFC_Test_Pg = 7;}
5115  0a7b 35070010      	mov	_LMFC_Test_Pg,#7
5116  0a7f               L7472:
5117                     ; 543 				if(LMFC_Test_Pg == 0){LMFC_Data_Step = 0;}
5119  0a7f 725d0010      	tnz	_LMFC_Test_Pg
5120  0a83 2604          	jrne	L5272
5123  0a85 725f000f      	clr	_LMFC_Data_Step
5124  0a89               L5272:
5125                     ; 546 		UP_SW_flag = OFF;
5127  0a89 72130000      	bres	_SW_Status,#1
5129  0a8d 2054          	jra	L3572
5130  0a8f               L1272:
5131                     ; 549 	else if(DN_SW_flag == ON){ 
5133  0a8f 720500004f    	btjf	_SW_Status,#2,L3572
5134                     ; 552 		if(LMFC_Data_Setting_flag == ON){	LMFC_Test_Value_Change(0);}
5136  0a94 7203000007    	btjf	_LMFC_Test_Register,#1,L7572
5139  0a99 4f            	clr	a
5140  0a9a 8d400940      	callf	f_LMFC_Test_Value_Change
5143  0a9e 203f          	jra	L1672
5144  0aa0               L7572:
5145                     ; 554 		else if(LMFC_Data_Select_flag == ON){
5147  0aa0 720100001a    	btjf	_LMFC_Test_Register,#0,L3672
5148                     ; 555 			if(LMFC_Option_flag){
5150  0aa5 7207000009    	btjf	_LMFC_Test_Register,#3,L5672
5151                     ; 556 				if(LMFC_Data_Step < 3){ LMFC_Data_Step++;}
5153  0aaa c6000f        	ld	a,_LMFC_Data_Step
5154  0aad a103          	cp	a,#3
5155  0aaf 242e          	jruge	L1672
5157  0ab1 2006          	jpf	LC032
5158  0ab3               L5672:
5159                     ; 557 			}else{ if(LMFC_Data_Step < 1){ LMFC_Data_Step++;}}
5161  0ab3 725d000f      	tnz	_LMFC_Data_Step
5162  0ab7 2626          	jrne	L1672
5165  0ab9               LC032:
5167  0ab9 725c000f      	inc	_LMFC_Data_Step
5168  0abd 2020          	jra	L1672
5169  0abf               L3672:
5170                     ; 560 			if(LMFC_Option_flag==0){
5172  0abf 720600001b    	btjt	_LMFC_Test_Register,#3,L1672
5173                     ; 561 				if(LMFC_Test_Pg < 7 ){ LMFC_Test_Pg++;}
5175  0ac4 c60010        	ld	a,_LMFC_Test_Pg
5176  0ac7 a107          	cp	a,#7
5177  0ac9 2406          	jruge	L1003
5180  0acb 725c0010      	inc	_LMFC_Test_Pg
5182  0acf 2004          	jra	L3003
5183  0ad1               L1003:
5184                     ; 562 				else{LMFC_Test_Pg = 0;}
5186  0ad1 725f0010      	clr	_LMFC_Test_Pg
5187  0ad5               L3003:
5188                     ; 564 				if(LMFC_Test_Pg == 0){LMFC_Data_Step = 0;}
5190  0ad5 725d0010      	tnz	_LMFC_Test_Pg
5191  0ad9 2604          	jrne	L1672
5194  0adb 725f000f      	clr	_LMFC_Data_Step
5195  0adf               L1672:
5196                     ; 567 		DN_SW_flag = OFF;
5198  0adf 72150000      	bres	_SW_Status,#2
5199  0ae3               L3572:
5200                     ; 572 	if(SET_SW_flag == ON){
5202  0ae3 720700002f    	btjf	_SW_Status,#3,L7003
5203                     ; 573 		if((LMFC_Test_Pg==0)||(LMFC_Test_Pg==10)){
5205  0ae8 725d0010      	tnz	_LMFC_Test_Pg
5206  0aec 2707          	jreq	L3103
5208  0aee c60010        	ld	a,_LMFC_Test_Pg
5209  0af1 a10a          	cp	a,#10
5210  0af3 2622          	jrne	L7003
5211  0af5               L3103:
5212                     ; 575 			if(LMFC_Data_Select_flag == OFF){LMFC_Data_Select_flag= ON;}
5214  0af5 7200000006    	btjt	_LMFC_Test_Register,#0,L5103
5217  0afa 72100000      	bset	_LMFC_Test_Register,#0
5219  0afe 2013          	jra	L7103
5220  0b00               L5103:
5221                     ; 577 				if(LMFC_Data_Setting_flag == OFF){
5223  0b00 7202000006    	btjt	_LMFC_Test_Register,#1,L1203
5224                     ; 578 					LMFC_Data_Setting_flag = ON;
5226  0b05 72120000      	bset	_LMFC_Test_Register,#1
5228  0b09 2008          	jra	L7103
5229  0b0b               L1203:
5230                     ; 580 					LMFC_Data_Setting_flag = OFF;
5232  0b0b 72130000      	bres	_LMFC_Test_Register,#1
5233                     ; 581 					LMFC_Data_Select_flag = OFF;
5235  0b0f 72110000      	bres	_LMFC_Test_Register,#0
5236  0b13               L7103:
5237                     ; 584 			SET_SW_flag = OFF;
5239  0b13 72170000      	bres	_SW_Status,#3
5240  0b17               L7003:
5241                     ; 588 	if(ON_OFF_SW_flag == ON){
5243  0b17 7201000013    	btjf	_SW_Status,#0,L5203
5244                     ; 589 		if(LMFC_Trans_flag == OFF){LMFC_Trans_flag = ON;}
5246  0b1c 7204000006    	btjt	_LMFC_Test_Register,#2,L7203
5249  0b21 72140000      	bset	_LMFC_Test_Register,#2
5251  0b25 2004          	jra	L1303
5252  0b27               L7203:
5253                     ; 590 		else{ LMFC_Trans_flag = OFF;  }
5255  0b27 72150000      	bres	_LMFC_Test_Register,#2
5256  0b2b               L1303:
5257                     ; 592 		ON_OFF_SW_flag = OFF;
5259  0b2b 72110000      	bres	_SW_Status,#0
5260  0b2f               L5203:
5261                     ; 595 	if(OP_SW_flag == ON){
5263  0b2f 720900002b    	btjf	_SW_Status,#4,L3303
5264                     ; 596 		if(LMFC_Option_flag == OFF){
5266  0b34 720600000e    	btjt	_LMFC_Test_Register,#3,L5303
5267                     ; 597 			LMFC_Option_flag = ON;
5269  0b39 72160000      	bset	_LMFC_Test_Register,#3
5270                     ; 598 			LMFC_Test_Pg = 10;
5272  0b3d 350a0010      	mov	_LMFC_Test_Pg,#10
5273                     ; 599 			LMFC_Data_Step = 1;
5275  0b41 3501000f      	mov	_LMFC_Data_Step,#1
5277  0b45 2014          	jra	L7303
5278  0b47               L5303:
5279                     ; 602 			LMFC_Option_flag = OFF;
5281  0b47 72170000      	bres	_LMFC_Test_Register,#3
5282                     ; 603 			LMFC_Data_Select_flag = OFF;
5284  0b4b 72110000      	bres	_LMFC_Test_Register,#0
5285                     ; 604 			LMFC_Data_Setting_flag = OFF;
5287  0b4f 72130000      	bres	_LMFC_Test_Register,#1
5288                     ; 606 			LMFC_Test_Pg = 0;
5290  0b53 725f0010      	clr	_LMFC_Test_Pg
5291                     ; 607 			LMFC_Data_Step = 0;
5293  0b57 725f000f      	clr	_LMFC_Data_Step
5294  0b5b               L7303:
5295                     ; 609 		OP_SW_flag = OFF;
5297  0b5b 72190000      	bres	_SW_Status,#4
5298  0b5f               L3303:
5299                     ; 613 	if(EN_SW_flag == ON){
5301  0b5f 720b000018    	btjf	_SW_Status,#5,L1403
5302                     ; 614 		Device_Select_Mode = ON;
5304  0b64 72100000      	bset	_Mode_Select_Status,#0
5305                     ; 615 		LMFC_PTC_flag = OFF;
5307  0b68 72190000      	bres	_Can_Select_Device,#4
5308                     ; 616 		LMFC_Trans_flag = OFF;
5310  0b6c 72150000      	bres	_LMFC_Test_Register,#2
5311                     ; 618 		Can_Select_Device = 0;
5313  0b70 725f0000      	clr	_Can_Select_Device
5314                     ; 619 		LMFC_PTC_Reset();
5316  0b74 8d000000      	callf	f_LMFC_PTC_Reset
5318                     ; 620 		EN_SW_flag = OFF;
5320  0b78 721b0000      	bres	_SW_Status,#5
5321  0b7c               L1403:
5322                     ; 623 	return;
5325  0b7c 87            	retf	
5351                     ; 626 void LMFC_Test_Routine(void)
5351                     ; 627 {
5352                     	switch	.text
5353  0b7d               f_LMFC_Test_Routine:
5357                     ; 630 	if(LMFC_PTC_flag == OFF){return;}
5359  0b7d 7208000001    	btjt	_Can_Select_Device,#4,L3503
5363  0b82 87            	retf	
5364  0b83               L3503:
5365                     ; 632 		CAN_Management_Routine();		// CAN communication Management
5367  0b83 8d000000      	callf	f_CAN_Management_Routine
5369                     ; 633 		LMFC_LCD_Display();
5371  0b87 8d150215      	callf	f_LMFC_LCD_Display
5373                     ; 634 		LMFC_Switch_Control();
5376                     ; 637 	return ;
5379  0b8b ac390a39      	jpf	f_LMFC_Switch_Control
5485                     	xdef	f_LMFC_Switch_Control
5486                     	xdef	f_LMFC_Test_Value_Change
5487                     	xdef	f_LMFC_LCD_Display
5488                     	xdef	f_LMFC_Display_Handling
5489                     	xdef	f_LMFC_PTC_Reset
5490                     	xdef	_LMFC_Pre_Pg
5491                     	xdef	_LMFC_Test_Pg
5492                     	xdef	_LMFC_Data_Step
5493                     	xref	f_strcpy
5494                     	xdef	f_LMFC_Test_Routine
5495                     	xdef	_LMFC_Unit
5496                     	xdef	_LMFC_Ramp_UD
5497                     	xdef	_LMFC_Ramp_Delay
5498                     	xdef	_LMFC_Ramp_T_Cnt
5499                     	xdef	_LMFC_PTC_Debug
5500                     	xdef	_LMFC_PTC_Status
5501                     	switch	.bss
5502  0000               _LMFC_Test_Register:
5503  0000 00            	ds.b	1
5504                     	xdef	_LMFC_Test_Register
5505                     	xref	_LCD_Dis_Data
5506                     	xref	_LCD_Line
5507                     	xref	f_Num_Display_LCD
5508                     	xref	f_CAN_Management_Routine
5509                     	xref	_PTC_Status3
5510                     	xref	_PTC_Status2
5511                     	xref	_PTC_Status1
5512                     	xref	_PTC_SW_Ver
5513                     	xref	_PTC_Limit_Cause
5514                     	xref	_PTC_RCore_Temp
5515                     	xref	_PTC_LCore_Temp
5516                     	xref	_PTC_Fdback_Duty
5517                     	xref	_PTC_PWR_VALUE
5518                     	xref	_PTC_Cur_VALUE
5519                     	xref	_PTC_BATT_VALUE
5520                     	xref	_PTC_Heat_Duty
5521                     	xref	_PTC_AllowOperation
5522                     	xref	_CAN_Operation_App
5523                     	xref	f_Display_LCD_String
5524                     	xref	f_Set_LCD_Address
5525                     	xref	_Blink_30
5526                     	xref	_Blink_50
5527                     	xref	_SW_Status
5528                     	xref	_Can_Select_Device
5529                     	xref	_Mode_Select_Status
5530                     	switch	.const
5531  0004               L1752:
5532  0004 4e4f4e00      	dc.b	"NON",0
5533  0008               L5652:
5534  0008 20202000      	dc.b	"   ",0
5535  000c               L1652:
5536  000c 434f4d00      	dc.b	"COM",0
5537  0010               L3552:
5538  0010 525800        	dc.b	"RX",0
5539  0013               L5642:
5540  0013 4c696d697400  	dc.b	"Limit",0
5541  0019               L7542:
5542  0019 6661696c00    	dc.b	"fail",0
5543  001e               L1542:
5544  001e 4f70657200    	dc.b	"Oper",0
5545  0023               L3442:
5546  0023 53544f5000    	dc.b	"STOP",0
5547  0028               L1242:
5548  0028 2d00          	dc.b	"-",0
5549  002a               L1142:
5550  002a 5700          	dc.b	"W",0
5551  002c               L3042:
5552  002c 4100          	dc.b	"A",0
5553  002e               L1042:
5554  002e 5600          	dc.b	"V",0
5555  0030               L5732:
5556  0030 466100        	dc.b	"Fa",0
5557  0033               L3432:
5558  0033 555000        	dc.b	"UP",0
5559  0036               L5332:
5560  0036 4f464600      	dc.b	"OFF",0
5561  003a               L7232:
5562  003a 444f574e00    	dc.b	"DOWN",0
5563  003f               L5032:
5564  003f 202020202020  	dc.b	"        ",0
5565  0048               L7722:
5566  0048 7300          	dc.b	"s",0
5567  004a               L5722:
5568  004a 6d00          	dc.b	"m",0
5569  004c               L7122:
5570  004c 545800        	dc.b	"TX",0
5571  004f               L5712:
5572  004f 2500          	dc.b	"%",0
5573  0051               L3712:
5574  0051 2e00          	dc.b	".",0
5575  0053               L3512:
5576  0053 202020202000  	dc.b	"     ",0
5577  0059               L7312:
5578  0059 202020202020  	dc.b	"         FD:",0
5579  0066               L1312:
5580  0066 202020202020  	dc.b	"      ",0
5581  006d               L7012:
5582  006d 4c4d464300    	dc.b	"LMFC",0
5583  0072               L5602:
5584  0072 525f552f443a  	dc.b	"R_U/D:",0
5585  0079               L3602:
5586  0079 525f446c6179  	dc.b	"R_Dlay:",0
5587  0081               L1602:
5588  0081 445f556e6974  	dc.b	"D_Unit : ",0
5589  008b               L7502:
5590  008b 2a4f7074696f  	dc.b	"*Option*",0
5591  0094               L5502:
5592  0094 00            	dc.b	0
5593  0095               L3502:
5594  0095 445f4f44543a  	dc.b	"D_ODT:",0
5595  009c               L1502:
5596  009c 445f4c563a00  	dc.b	"D_LV:",0
5597  00a2               L7402:
5598  00a2 445f4c504342  	dc.b	"D_LPCBT:",0
5599  00ab               L5402:
5600  00ab 445f48504342  	dc.b	"D_HPCBT:",0
5601  00b4               L3402:
5602  00b4 445f49473254  	dc.b	"D_IG2T:",0
5603  00bc               L1402:
5604  00bc 445f49473154  	dc.b	"D_IG1T:",0
5605  00c4               L7302:
5606  00c4 53575f566572  	dc.b	"SW_Ver:",0
5607  00cc               L5302:
5608  00cc 5054434c6d74  	dc.b	"PTCLmt:",0
5609  00d4               L3302:
5610  00d4 464f6c745453  	dc.b	"FOltTSn:",0
5611  00dd               L1302:
5612  00dd 465063625453  	dc.b	"FPcbTSn:",0
5613  00e6               L7202:
5614  00e6 46437572536e  	dc.b	"FCurSn:",0
5615  00ee               L5202:
5616  00ee 464c56536e3a  	dc.b	"FLVSn:",0
5617  00f5               L3202:
5618  00f5 464856536e3a  	dc.b	"FHVSn:",0
5619  00fc               L1202:
5620  00fc 50636254686d  	dc.b	"PcbThm:",0
5621  0104               L7102:
5622  0104 4f746c54686d  	dc.b	"OtlThm:",0
5623  010c               L5102:
5624  010c 4f7672437572  	dc.b	"OvrCur:",0
5625  0114               L3102:
5626  0114 485648696768  	dc.b	"HVHigh:",0
5627  011c               L1102:
5628  011c 48564c6f7720  	dc.b	"HVLow :",0
5629  0124               L7002:
5630  0124 4c5648696768  	dc.b	"LVHigh:",0
5631  012c               L5002:
5632  012c 4c564c6f7720  	dc.b	"LVLow :",0
5633  0134               L3002:
5634  0134 313131546f74  	dc.b	"111Tot:",0
5635  013c               L1002:
5636  013c 507463537465  	dc.b	"PtcSte:",0
5637  0144               L7771:
5638  0144 43313a202020  	dc.b	"C1:    C2:",0
5639  014f               L5771:
5640  014f 5077723a00    	dc.b	"Pwr:",0
5641  0154               L3771:
5642  0154 4375723a00    	dc.b	"Cur:",0
5643  0159               L1771:
5644  0159 4856203a00    	dc.b	"HV :",0
5645  015e               L7671:
5646  015e 507463466175  	dc.b	"PtcFau:",0
5647  0166               L5671:
5648  0166 507463526479  	dc.b	"PtcRdy:",0
5649  016e               L3671:
5650  016e 54443a202020  	dc.b	"TD:      FD:",0
5651  017b               L1671:
5652  017b 507463416c77  	dc.b	"PtcAlw:",0
5653                     	xref.b	c_x
5673                     	xref	d_lcmp
5674                     	xref	d_uitolx
5675                     	xref	d_imul
5676                     	xref	d_smodx
5677                     	xref	d_sdivx
5678                     	xref	d_jctab
5679                     	end

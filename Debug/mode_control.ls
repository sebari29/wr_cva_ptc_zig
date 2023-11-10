   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _Select_Device_Step:
2660  0000 01            	dc.b	1
2661  0001               _Select_LIN13_Step:
2662  0001 01            	dc.b	1
2663  0002               _Select_LIN20_Step:
2664  0002 01            	dc.b	1
2665  0003               _Select_LowCan_Step:
2666  0003 01            	dc.b	1
2667  0004               _Select_HICan_Step:
2668  0004 01            	dc.b	1
2669  0005               _Select_J2602_Step:
2670  0005 01            	dc.b	1
2703                     ; 34 void All_Function_Disable(void)
2703                     ; 35 {
2704                     	switch	.text
2705  0000               f_All_Function_Disable:
2709                     ; 36 	CAN_Disable();
2711  0000 8d000000      	callf	f_CAN_Disable
2713                     ; 37 	LIN13_Disable();
2715  0004 8d000000      	callf	f_LIN13_Disable
2717                     ; 38 	LIN20_Disable();
2720                     ; 40 	return;
2723  0008 ac000000      	jpf	f_LIN20_Disable
2752                     ; 46 void Function_Select_Control(void)
2752                     ; 47 {
2753                     	switch	.text
2754  000c               f_Function_Select_Control:
2758                     ; 48 	if(Fuction_Select_Mode == OFF){ return;}
2760  000c 7202000001    	btjt	_Mode_Select_Status,#1,L1371
2764  0011 87            	retf	
2765  0012               L1371:
2766                     ; 50 	Lin_13_Select_Control();		//Model Select Routine
2768  0012 8d5b005b      	callf	f_Lin_13_Select_Control
2770                     ; 51 	Lin_20_Select_Control();
2772  0016 8d6f016f      	callf	f_Lin_20_Select_Control
2774                     ; 52 	LowCan_Select_Control();
2776  001a 8dca03ca      	callf	f_LowCan_Select_Control
2778                     ; 53 	HICan_Select_Control();
2780  001e 8df804f8      	callf	f_HICan_Select_Control
2782                     ; 54 	Lin_J2602_Select_Control();
2785                     ; 56 	return;
2788  0022 acae02ae      	jpf	f_Lin_J2602_Select_Control
2822                     ; 59 void Lin_13_Select_Display_Handling(unsigned char ST)
2822                     ; 60 {
2823                     	switch	.text
2824  0026               f_Lin_13_Select_Display_Handling:
2828                     ; 62 	if(ST<4){
2830  0026 a104          	cp	a,#4
2831  0028 2430          	jruge	L7471
2832                     ; 63 		strcpy(LCD_Dis_Data[0],"*SELECT MODEL*");
2834  002a ae00dc        	ldw	x,#L1571
2835  002d 89            	pushw	x
2836  002e ae0000        	ldw	x,#_LCD_Dis_Data
2837  0031 8d000000      	callf	f_strcpy
2839  0035 85            	popw	x
2840                     ; 64 		strcpy(LCD_Dis_Data[1],"T6_PTC");
2842  0036 ae00d5        	ldw	x,#L3571
2843  0039 89            	pushw	x
2844  003a ae0010        	ldw	x,#_LCD_Dis_Data+16
2845  003d 8d000000      	callf	f_strcpy
2847  0041 85            	popw	x
2848                     ; 65 		strcpy(LCD_Dis_Data[2],"");
2850  0042 ae00d4        	ldw	x,#L5571
2851  0045 89            	pushw	x
2852  0046 ae0020        	ldw	x,#_LCD_Dis_Data+32
2853  0049 8d000000      	callf	f_strcpy
2855  004d 85            	popw	x
2856                     ; 66 		strcpy(LCD_Dis_Data[3],"");
2858  004e ae00d4        	ldw	x,#L5571
2859  0051 89            	pushw	x
2860  0052 ae0030        	ldw	x,#_LCD_Dis_Data+48
2861  0055 8d000000      	callf	f_strcpy
2863  0059 85            	popw	x
2864  005a               L7471:
2865                     ; 68 	return;
2868  005a 87            	retf	
2912                     ; 72 void Lin_13_Select_Control(void)
2912                     ; 73 {
2913                     	switch	.text
2914  005b               f_Lin_13_Select_Control:
2916  005b 88            	push	a
2917       00000001      OFST:	set	1
2920                     ; 76 	if(LIN_13_flag == OFF){return ;}
2922  005c 7204000002    	btjt	_Select_Fuction_flag,#2,L3771
2926  0061 84            	pop	a
2927  0062 87            	retf	
2928  0063               L3771:
2929                     ; 78 	if(UP_SW_flag == ON){
2931  0063 7203000011    	btjf	_SW_Status,#1,L5771
2932                     ; 79 		if(Select_LIN13_Step > 1){ Select_LIN13_Step--; }
2934  0068 c60001        	ld	a,_Select_LIN13_Step
2935  006b a102          	cp	a,#2
2936  006d 2504          	jrult	L7771
2939  006f 725a0001      	dec	_Select_LIN13_Step
2940  0073               L7771:
2941                     ; 81 		UP_SW_flag = OFF;
2943  0073 72130000      	bres	_SW_Status,#1
2945  0077 2013          	jra	L1002
2946  0079               L5771:
2947                     ; 82 	}else if(DN_SW_flag == ON){ 
2949  0079 720500000e    	btjf	_SW_Status,#2,L1002
2950                     ; 83 		if(Select_LIN13_Step < 1){ Select_LIN13_Step++; }
2952  007e 725d0001      	tnz	_Select_LIN13_Step
2953  0082 2604          	jrne	L5002
2956  0084 725c0001      	inc	_Select_LIN13_Step
2957  0088               L5002:
2958                     ; 85 		DN_SW_flag = OFF;
2960  0088 72150000      	bres	_SW_Status,#2
2961  008c               L1002:
2962                     ; 88 	if(Select_LIN13_Step <4){			//page 1
2964  008c c60001        	ld	a,_Select_LIN13_Step
2965  008f a104          	cp	a,#4
2966  0091 2448          	jruge	L7002
2967                     ; 89 		Lin_13_Select_Display_Handling(Select_LIN13_Step);
2969  0093 c60001        	ld	a,_Select_LIN13_Step
2970  0096 8d260026      	callf	f_Lin_13_Select_Display_Handling
2972                     ; 90 		for(i=0; i<2; i++){
2974  009a 4f            	clr	a
2975  009b 6b01          	ld	(OFST+0,sp),a
2976  009d               L1102:
2977                     ; 91 			Set_LCD_Address(LCD_Line[i]);
2979  009d 5f            	clrw	x
2980  009e 97            	ld	xl,a
2981  009f d60000        	ld	a,(_LCD_Line,x)
2982  00a2 8d000000      	callf	f_Set_LCD_Address
2984                     ; 92 			if(i == Select_LIN13_Step){
2986  00a6 7b01          	ld	a,(OFST+0,sp)
2987  00a8 c10001        	cp	a,_Select_LIN13_Step
2988  00ab 260b          	jrne	L1202
2989                     ; 93 				if(Blink_50){Display_LCD_String("                ");}
2991  00ad 725d0000      	tnz	_Blink_50
2992  00b1 2705          	jreq	L1202
2995  00b3 ae00c3        	ldw	x,#L3202
2998  00b6 2007          	jra	L7202
2999  00b8               L1202:
3000                     ; 94 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3002                     ; 95 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3005  00b8 97            	ld	xl,a
3006  00b9 a610          	ld	a,#16
3007  00bb 42            	mul	x,a
3008  00bc 1c0000        	addw	x,#_LCD_Dis_Data
3010  00bf               L7202:
3011  00bf 8d000000      	callf	f_Display_LCD_String
3012                     ; 90 		for(i=0; i<2; i++){
3014  00c3 0c01          	inc	(OFST+0,sp)
3017  00c5 7b01          	ld	a,(OFST+0,sp)
3018  00c7 a102          	cp	a,#2
3019  00c9 25d2          	jrult	L1102
3020                     ; 98 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3022  00cb c60003        	ld	a,_LCD_Line+3
3023  00ce ab0d          	add	a,#13
3024  00d0 8d000000      	callf	f_Set_LCD_Address
3026                     ; 99 		Display_LCD_String("Pg1");
3028  00d4 ae00bf        	ldw	x,#L1302
3029  00d7 8d000000      	callf	f_Display_LCD_String
3031  00db               L7002:
3032                     ; 103 	if(SET_SW_flag == ON){
3034  00db 7207000037    	btjf	_SW_Status,#3,L3302
3035                     ; 104 		if(Select_LIN13_Step <4){
3037  00e0 c60001        	ld	a,_Select_LIN13_Step
3038  00e3 a104          	cp	a,#4
3039  00e5 2407          	jruge	L5302
3040                     ; 105 			Set_LCD_Address(LCD_Line[Select_LIN13_Step]);
3042  00e7 c60001        	ld	a,_Select_LIN13_Step
3043  00ea 5f            	clrw	x
3044  00eb 97            	ld	xl,a
3047  00ec 2008          	jra	L7302
3048  00ee               L5302:
3049                     ; 107 			Set_LCD_Address(LCD_Line[Select_LIN13_Step-4]);
3051  00ee c60001        	ld	a,_Select_LIN13_Step
3052  00f1 5f            	clrw	x
3053  00f2 97            	ld	xl,a
3054  00f3 1d0004        	subw	x,#4
3056  00f6               L7302:
3057  00f6 d60000        	ld	a,(_LCD_Line,x)
3058  00f9 8d000000      	callf	f_Set_LCD_Address
3059                     ; 110 			if(Select_LIN13_Step == 1){T6_PTC_flag = ON;}
3061  00fd c60001        	ld	a,_Select_LIN13_Step
3062  0100 4a            	dec	a
3063  0101 2604          	jrne	L1402
3066  0103 72100000      	bset	_LIN13_Select_Device,#0
3067  0107               L1402:
3068                     ; 112 			Select_LIN13_Step = 1;
3070  0107 35010001      	mov	_Select_LIN13_Step,#1
3071                     ; 113 			Fuction_Select_Mode = OFF;
3073  010b 72130000      	bres	_Mode_Select_Status,#1
3074                     ; 114 			LIN_13_flag = OFF;				//Select LIN13 Device
3076  010f 72150000      	bres	_Select_Fuction_flag,#2
3077                     ; 116 		SET_SW_flag = OFF;
3079  0113 72170000      	bres	_SW_Status,#3
3080  0117               L3302:
3081                     ; 119 	if(EN_SW_flag == ON){
3083  0117 720b00001c    	btjf	_SW_Status,#5,L3402
3084                     ; 120 		Select_LIN13_Step = 1;
3086  011c 35010001      	mov	_Select_LIN13_Step,#1
3087                     ; 121 		LIN13_Select_Device = 0;
3089  0120 725f0000      	clr	_LIN13_Select_Device
3090                     ; 122 		Select_Fuction_flag = 0;
3092  0124 725f0000      	clr	_Select_Fuction_flag
3093                     ; 123 		Fuction_Select_Mode = OFF;
3095  0128 72130000      	bres	_Mode_Select_Status,#1
3096                     ; 124 		Device_Select_Mode = ON;
3098  012c 72100000      	bset	_Mode_Select_Status,#0
3099                     ; 125 		LIN_EN = 0;
3101  0130 7215500f      	bres	_PD_ODR,#2
3102                     ; 127 		EN_SW_flag = OFF;
3104  0134 721b0000      	bres	_SW_Status,#5
3105  0138               L3402:
3106                     ; 130 	return;
3109  0138 84            	pop	a
3110  0139 87            	retf	
3144                     ; 133 void Lin_20_Select_Display_Handling(unsigned char ST)
3144                     ; 134 {
3145                     	switch	.text
3146  013a               f_Lin_20_Select_Display_Handling:
3150                     ; 136 	if(ST<4){
3152  013a a104          	cp	a,#4
3153  013c 2430          	jruge	L1602
3154                     ; 137 		strcpy(LCD_Dis_Data[0],"*SELECT MODEL*");
3156  013e ae00dc        	ldw	x,#L1571
3157  0141 89            	pushw	x
3158  0142 ae0000        	ldw	x,#_LCD_Dis_Data
3159  0145 8d000000      	callf	f_strcpy
3161  0149 85            	popw	x
3162                     ; 138 		strcpy(LCD_Dis_Data[1],"FIAT500_PTC");
3164  014a ae00b3        	ldw	x,#L3602
3165  014d 89            	pushw	x
3166  014e ae0010        	ldw	x,#_LCD_Dis_Data+16
3167  0151 8d000000      	callf	f_strcpy
3169  0155 85            	popw	x
3170                     ; 139 		strcpy(LCD_Dis_Data[2],"FIAT_Monitor");
3172  0156 ae00a6        	ldw	x,#L5602
3173  0159 89            	pushw	x
3174  015a ae0020        	ldw	x,#_LCD_Dis_Data+32
3175  015d 8d000000      	callf	f_strcpy
3177  0161 85            	popw	x
3178                     ; 140 		strcpy(LCD_Dis_Data[3],"SAIC_PTC");
3180  0162 ae009d        	ldw	x,#L7602
3181  0165 89            	pushw	x
3182  0166 ae0030        	ldw	x,#_LCD_Dis_Data+48
3183  0169 8d000000      	callf	f_strcpy
3185  016d 85            	popw	x
3186  016e               L1602:
3187                     ; 142 	return;
3190  016e 87            	retf	
3236                     ; 146 void Lin_20_Select_Control(void)
3236                     ; 147 {
3237                     	switch	.text
3238  016f               f_Lin_20_Select_Control:
3240  016f 88            	push	a
3241       00000001      OFST:	set	1
3244                     ; 150 	if(LIN_20_flag == OFF){return ;}
3246  0170 7206000002    	btjt	_Select_Fuction_flag,#3,L5012
3250  0175 84            	pop	a
3251  0176 87            	retf	
3252  0177               L5012:
3253                     ; 152 	if(UP_SW_flag == ON){
3255  0177 7203000011    	btjf	_SW_Status,#1,L7012
3256                     ; 153 		if(Select_LIN20_Step > 1){ Select_LIN20_Step--;}
3258  017c c60002        	ld	a,_Select_LIN20_Step
3259  017f a102          	cp	a,#2
3260  0181 2504          	jrult	L1112
3263  0183 725a0002      	dec	_Select_LIN20_Step
3264  0187               L1112:
3265                     ; 154 		UP_SW_flag = OFF;
3267  0187 72130000      	bres	_SW_Status,#1
3269  018b 2014          	jra	L3112
3270  018d               L7012:
3271                     ; 155 	}else if(DN_SW_flag == ON){ 
3273  018d 720500000f    	btjf	_SW_Status,#2,L3112
3274                     ; 156 		if(Select_LIN20_Step < 3){ Select_LIN20_Step++;}
3276  0192 c60002        	ld	a,_Select_LIN20_Step
3277  0195 a103          	cp	a,#3
3278  0197 2404          	jruge	L7112
3281  0199 725c0002      	inc	_Select_LIN20_Step
3282  019d               L7112:
3283                     ; 157 		DN_SW_flag = OFF;
3285  019d 72150000      	bres	_SW_Status,#2
3286  01a1               L3112:
3287                     ; 160 	if(Select_LIN20_Step <4){			//page 1
3289  01a1 c60002        	ld	a,_Select_LIN20_Step
3290  01a4 a104          	cp	a,#4
3291  01a6 2448          	jruge	L1212
3292                     ; 161 		Lin_20_Select_Display_Handling(Select_LIN20_Step);
3294  01a8 c60002        	ld	a,_Select_LIN20_Step
3295  01ab 8d3a013a      	callf	f_Lin_20_Select_Display_Handling
3297                     ; 162 		for(i=0; i<4; i++){
3299  01af 4f            	clr	a
3300  01b0 6b01          	ld	(OFST+0,sp),a
3301  01b2               L3212:
3302                     ; 163 			Set_LCD_Address(LCD_Line[i]);
3304  01b2 5f            	clrw	x
3305  01b3 97            	ld	xl,a
3306  01b4 d60000        	ld	a,(_LCD_Line,x)
3307  01b7 8d000000      	callf	f_Set_LCD_Address
3309                     ; 164 			if(i == Select_LIN20_Step){
3311  01bb 7b01          	ld	a,(OFST+0,sp)
3312  01bd c10002        	cp	a,_Select_LIN20_Step
3313  01c0 260b          	jrne	L3312
3314                     ; 165 				if(Blink_50){Display_LCD_String("                ");}
3316  01c2 725d0000      	tnz	_Blink_50
3317  01c6 2705          	jreq	L3312
3320  01c8 ae00c3        	ldw	x,#L3202
3323  01cb 2007          	jra	L7312
3324  01cd               L3312:
3325                     ; 166 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3327                     ; 167 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3330  01cd 97            	ld	xl,a
3331  01ce a610          	ld	a,#16
3332  01d0 42            	mul	x,a
3333  01d1 1c0000        	addw	x,#_LCD_Dis_Data
3335  01d4               L7312:
3336  01d4 8d000000      	callf	f_Display_LCD_String
3337                     ; 162 		for(i=0; i<4; i++){
3339  01d8 0c01          	inc	(OFST+0,sp)
3342  01da 7b01          	ld	a,(OFST+0,sp)
3343  01dc a104          	cp	a,#4
3344  01de 25d2          	jrult	L3212
3345                     ; 170 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3347  01e0 c60003        	ld	a,_LCD_Line+3
3348  01e3 ab0d          	add	a,#13
3349  01e5 8d000000      	callf	f_Set_LCD_Address
3351                     ; 171 		Display_LCD_String("Pg1");
3353  01e9 ae00bf        	ldw	x,#L1302
3354  01ec 8d000000      	callf	f_Display_LCD_String
3356  01f0               L1212:
3357                     ; 174 	Select_LIN20_Step = 1;
3359  01f0 35010002      	mov	_Select_LIN20_Step,#1
3360                     ; 175 	SET_SW_flag = ON;
3362  01f4 72160000      	bset	_SW_Status,#3
3363                     ; 178 	if(SET_SW_flag == ON){
3365  01f8 7207000059    	btjf	_SW_Status,#3,L1412
3366                     ; 179 		if(Select_LIN20_Step <4){
3368  01fd c60002        	ld	a,_Select_LIN20_Step
3369  0200 a104          	cp	a,#4
3370  0202 2407          	jruge	L3412
3371                     ; 180 			Set_LCD_Address(LCD_Line[Select_LIN20_Step]);
3373  0204 c60002        	ld	a,_Select_LIN20_Step
3374  0207 5f            	clrw	x
3375  0208 97            	ld	xl,a
3378  0209 2008          	jra	L5412
3379  020b               L3412:
3380                     ; 182 			Set_LCD_Address(LCD_Line[Select_LIN20_Step-4]);
3382  020b c60002        	ld	a,_Select_LIN20_Step
3383  020e 5f            	clrw	x
3384  020f 97            	ld	xl,a
3385  0210 1d0004        	subw	x,#4
3387  0213               L5412:
3388  0213 d60000        	ld	a,(_LCD_Line,x)
3389  0216 8d000000      	callf	f_Set_LCD_Address
3390                     ; 185 			if(Select_LIN20_Step == 1){
3392  021a c60002        	ld	a,_Select_LIN20_Step
3393  021d 4a            	dec	a
3394  021e 2606          	jrne	L7412
3395                     ; 186 				FIAT500_PTC_flag = ON;
3397  0220 72100000      	bset	_LIN20_Select_Device,#0
3398                     ; 187 				LIN20_Enable();
3401  0224 201c          	jpf	LC003
3402  0226               L7412:
3403                     ; 189 			else if(Select_LIN20_Step == 2){ 
3405  0226 c60002        	ld	a,_Select_LIN20_Step
3406  0229 a102          	cp	a,#2
3407  022b 260a          	jrne	L3512
3408                     ; 190 				FIAT500_MT_flag = ON;
3410  022d 72120000      	bset	_LIN20_Select_Device,#1
3411                     ; 191 				LIN20_MT_Enable();
3413  0231 8d000000      	callf	f_LIN20_MT_Enable
3416  0235 200f          	jra	L1512
3417  0237               L3512:
3418                     ; 193 			else if(Select_LIN20_Step == 3){
3420  0237 c60002        	ld	a,_Select_LIN20_Step
3421  023a a103          	cp	a,#3
3422  023c 2608          	jrne	L1512
3423                     ; 194 				SAIC_PTC_flag = ON;
3425  023e 72140000      	bset	_LIN20_Select_Device,#2
3426                     ; 195 				LIN20_Enable();
3428  0242               LC003:
3430  0242 8d000000      	callf	f_LIN20_Enable
3432  0246               L1512:
3433                     ; 198 			Select_LIN20_Step = 1;
3435  0246 35010002      	mov	_Select_LIN20_Step,#1
3436                     ; 199 			Fuction_Select_Mode = OFF;
3438  024a 72130000      	bres	_Mode_Select_Status,#1
3439                     ; 200 			LIN_20_flag = OFF;				//Select LIN13 Device
3441  024e 72170000      	bres	_Select_Fuction_flag,#3
3442                     ; 202 		SET_SW_flag = OFF;
3444  0252 72170000      	bres	_SW_Status,#3
3445  0256               L1412:
3446                     ; 205 	if(EN_SW_flag == ON){
3448  0256 720b00001c    	btjf	_SW_Status,#5,L1612
3449                     ; 206 		Select_LIN20_Step = 1;
3451  025b 35010002      	mov	_Select_LIN20_Step,#1
3452                     ; 207 		LIN20_Select_Device = 0;
3454  025f 725f0000      	clr	_LIN20_Select_Device
3455                     ; 208 		Select_Fuction_flag = 0;
3457  0263 725f0000      	clr	_Select_Fuction_flag
3458                     ; 209 		Fuction_Select_Mode = OFF;
3460  0267 72130000      	bres	_Mode_Select_Status,#1
3461                     ; 210 		Device_Select_Mode = ON;
3463  026b 72100000      	bset	_Mode_Select_Status,#0
3464                     ; 211 		LIN_EN = 0;
3466  026f 7215500f      	bres	_PD_ODR,#2
3467                     ; 213 		EN_SW_flag = OFF;
3469  0273 721b0000      	bres	_SW_Status,#5
3470  0277               L1612:
3471                     ; 215 	return;
3474  0277 84            	pop	a
3475  0278 87            	retf	
3509                     ; 218 void Lin_J2602_Select_Display_Handling(unsigned char ST)
3509                     ; 219 {
3510                     	switch	.text
3511  0279               f_Lin_J2602_Select_Display_Handling:
3515                     ; 221 	if(ST<4){
3517  0279 a104          	cp	a,#4
3518  027b 2430          	jruge	L7712
3519                     ; 222 		strcpy(LCD_Dis_Data[0],"*SELECT MODEL*");
3521  027d ae00dc        	ldw	x,#L1571
3522  0280 89            	pushw	x
3523  0281 ae0000        	ldw	x,#_LCD_Dis_Data
3524  0284 8d000000      	callf	f_strcpy
3526  0288 85            	popw	x
3527                     ; 223 		strcpy(LCD_Dis_Data[1],"LGE_CHCM");
3529  0289 ae0094        	ldw	x,#L1022
3530  028c 89            	pushw	x
3531  028d ae0010        	ldw	x,#_LCD_Dis_Data+16
3532  0290 8d000000      	callf	f_strcpy
3534  0294 85            	popw	x
3535                     ; 224 		strcpy(LCD_Dis_Data[2],"");
3537  0295 ae00d4        	ldw	x,#L5571
3538  0298 89            	pushw	x
3539  0299 ae0020        	ldw	x,#_LCD_Dis_Data+32
3540  029c 8d000000      	callf	f_strcpy
3542  02a0 85            	popw	x
3543                     ; 225 		strcpy(LCD_Dis_Data[3],"");
3545  02a1 ae00d4        	ldw	x,#L5571
3546  02a4 89            	pushw	x
3547  02a5 ae0030        	ldw	x,#_LCD_Dis_Data+48
3548  02a8 8d000000      	callf	f_strcpy
3550  02ac 85            	popw	x
3551  02ad               L7712:
3552                     ; 227 	return;
3555  02ad 87            	retf	
3602                     ; 231 void Lin_J2602_Select_Control(void)
3602                     ; 232 {
3603                     	switch	.text
3604  02ae               f_Lin_J2602_Select_Control:
3606  02ae 88            	push	a
3607       00000001      OFST:	set	1
3610                     ; 235 	if(LIN_J2602_flag== OFF){return ;}
3612  02af 720a000002    	btjt	_Select_Fuction_flag,#5,L7122
3616  02b4 84            	pop	a
3617  02b5 87            	retf	
3618  02b6               L7122:
3619                     ; 237 	if(UP_SW_flag == ON){
3621  02b6 7203000011    	btjf	_SW_Status,#1,L1222
3622                     ; 238 		if(Select_J2602_Step > 1){ Select_LIN20_Step--;}
3624  02bb c60005        	ld	a,_Select_J2602_Step
3625  02be a102          	cp	a,#2
3626  02c0 2504          	jrult	L3222
3629  02c2 725a0002      	dec	_Select_LIN20_Step
3630  02c6               L3222:
3631                     ; 239 		UP_SW_flag = OFF;
3633  02c6 72130000      	bres	_SW_Status,#1
3635  02ca 2013          	jra	L5222
3636  02cc               L1222:
3637                     ; 240 	}else if(DN_SW_flag == ON){ 
3639  02cc 720500000e    	btjf	_SW_Status,#2,L5222
3640                     ; 241 		if(Select_J2602_Step < 1){ Select_LIN20_Step++;}
3642  02d1 725d0005      	tnz	_Select_J2602_Step
3643  02d5 2604          	jrne	L1322
3646  02d7 725c0002      	inc	_Select_LIN20_Step
3647  02db               L1322:
3648                     ; 242 		DN_SW_flag = OFF;
3650  02db 72150000      	bres	_SW_Status,#2
3651  02df               L5222:
3652                     ; 245 	if(Select_J2602_Step <4){			//page 1
3654  02df c60005        	ld	a,_Select_J2602_Step
3655  02e2 a104          	cp	a,#4
3656  02e4 2448          	jruge	L3322
3657                     ; 246 		Lin_J2602_Select_Display_Handling(Select_J2602_Step);
3659  02e6 c60005        	ld	a,_Select_J2602_Step
3660  02e9 8d790279      	callf	f_Lin_J2602_Select_Display_Handling
3662                     ; 247 		for(i=0; i<2; i++){
3664  02ed 4f            	clr	a
3665  02ee 6b01          	ld	(OFST+0,sp),a
3666  02f0               L5322:
3667                     ; 248 			Set_LCD_Address(LCD_Line[i]);
3669  02f0 5f            	clrw	x
3670  02f1 97            	ld	xl,a
3671  02f2 d60000        	ld	a,(_LCD_Line,x)
3672  02f5 8d000000      	callf	f_Set_LCD_Address
3674                     ; 249 			if(i == Select_J2602_Step){
3676  02f9 7b01          	ld	a,(OFST+0,sp)
3677  02fb c10005        	cp	a,_Select_J2602_Step
3678  02fe 260b          	jrne	L5422
3679                     ; 250 				if(Blink_50){Display_LCD_String("                ");}
3681  0300 725d0000      	tnz	_Blink_50
3682  0304 2705          	jreq	L5422
3685  0306 ae00c3        	ldw	x,#L3202
3688  0309 2007          	jra	L1522
3689  030b               L5422:
3690                     ; 251 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3692                     ; 252 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3695  030b 97            	ld	xl,a
3696  030c a610          	ld	a,#16
3697  030e 42            	mul	x,a
3698  030f 1c0000        	addw	x,#_LCD_Dis_Data
3700  0312               L1522:
3701  0312 8d000000      	callf	f_Display_LCD_String
3702                     ; 247 		for(i=0; i<2; i++){
3704  0316 0c01          	inc	(OFST+0,sp)
3707  0318 7b01          	ld	a,(OFST+0,sp)
3708  031a a102          	cp	a,#2
3709  031c 25d2          	jrult	L5322
3710                     ; 255 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
3712  031e c60003        	ld	a,_LCD_Line+3
3713  0321 ab0d          	add	a,#13
3714  0323 8d000000      	callf	f_Set_LCD_Address
3716                     ; 256 		Display_LCD_String("Pg1");
3718  0327 ae00bf        	ldw	x,#L1302
3719  032a 8d000000      	callf	f_Display_LCD_String
3721  032e               L3322:
3722                     ; 260 	if(SET_SW_flag == ON){
3724  032e 720700003f    	btjf	_SW_Status,#3,L3522
3725                     ; 261 		if(Select_LIN20_Step <4){
3727  0333 c60002        	ld	a,_Select_LIN20_Step
3728  0336 a104          	cp	a,#4
3729  0338 2407          	jruge	L5522
3730                     ; 262 			Set_LCD_Address(LCD_Line[Select_J2602_Step]);
3732  033a c60005        	ld	a,_Select_J2602_Step
3733  033d 5f            	clrw	x
3734  033e 97            	ld	xl,a
3737  033f 2008          	jra	L7522
3738  0341               L5522:
3739                     ; 264 			Set_LCD_Address(LCD_Line[Select_J2602_Step-4]);
3741  0341 c60005        	ld	a,_Select_J2602_Step
3742  0344 5f            	clrw	x
3743  0345 97            	ld	xl,a
3744  0346 1d0004        	subw	x,#4
3746  0349               L7522:
3747  0349 d60000        	ld	a,(_LCD_Line,x)
3748  034c 8d000000      	callf	f_Set_LCD_Address
3749                     ; 267 		if(Select_J2602_Step == 1){
3751  0350 c60005        	ld	a,_Select_J2602_Step
3752  0353 4a            	dec	a
3753  0354 260c          	jrne	L1622
3754                     ; 268 			LGE_CHCM_Flag = ON;
3756  0356 72100000      	bset	_LIN_J2602_Select_Device,#0
3757                     ; 269 			LIN_J2602_Enable();
3759  035a 8d000000      	callf	f_LIN_J2602_Enable
3761                     ; 270 			CHCM_Reset_Values();
3763  035e 8d000000      	callf	f_CHCM_Reset_Values
3765  0362               L1622:
3766                     ; 273 		Select_J2602_Step = 1;
3768  0362 35010005      	mov	_Select_J2602_Step,#1
3769                     ; 274 		Fuction_Select_Mode = OFF;
3771  0366 72130000      	bres	_Mode_Select_Status,#1
3772                     ; 275 		LIN_J2602_flag = OFF;				//Select LIN13 Device
3774  036a 721b0000      	bres	_Select_Fuction_flag,#5
3775                     ; 277 		SET_SW_flag = OFF;
3777  036e 72170000      	bres	_SW_Status,#3
3778  0372               L3522:
3779                     ; 280 	if(EN_SW_flag == ON){
3781  0372 720b00001c    	btjf	_SW_Status,#5,L3622
3782                     ; 281 		Select_J2602_Step = 1;
3784  0377 35010005      	mov	_Select_J2602_Step,#1
3785                     ; 282 		LIN_J2602_Select_Device = 0;
3787  037b 725f0000      	clr	_LIN_J2602_Select_Device
3788                     ; 283 		Select_Fuction_flag = 0;
3790  037f 725f0000      	clr	_Select_Fuction_flag
3791                     ; 284 		Fuction_Select_Mode = OFF;
3793  0383 72130000      	bres	_Mode_Select_Status,#1
3794                     ; 285 		Device_Select_Mode = ON;
3796  0387 72100000      	bset	_Mode_Select_Status,#0
3797                     ; 286 		LIN_EN = 0;
3799  038b 7215500f      	bres	_PD_ODR,#2
3800                     ; 288 		EN_SW_flag = OFF;
3802  038f 721b0000      	bres	_SW_Status,#5
3803  0393               L3622:
3804                     ; 290 	return;
3807  0393 84            	pop	a
3808  0394 87            	retf	
3842                     ; 293 void LowCan_Select_Display_Handling(unsigned char ST)
3842                     ; 294 {
3843                     	switch	.text
3844  0395               f_LowCan_Select_Display_Handling:
3848                     ; 296 	if(ST<4){
3850  0395 a104          	cp	a,#4
3851  0397 2430          	jruge	L1032
3852                     ; 297 		strcpy(LCD_Dis_Data[0],"*SELECT MODEL*");
3854  0399 ae00dc        	ldw	x,#L1571
3855  039c 89            	pushw	x
3856  039d ae0000        	ldw	x,#_LCD_Dis_Data
3857  03a0 8d000000      	callf	f_strcpy
3859  03a4 85            	popw	x
3860                     ; 298 		strcpy(LCD_Dis_Data[1],"MDS_PTC_V56");
3862  03a5 ae0088        	ldw	x,#L3032
3863  03a8 89            	pushw	x
3864  03a9 ae0010        	ldw	x,#_LCD_Dis_Data+16
3865  03ac 8d000000      	callf	f_strcpy
3867  03b0 85            	popw	x
3868                     ; 299 		strcpy(LCD_Dis_Data[2],"MDS_PTC_V58");
3870  03b1 ae007c        	ldw	x,#L5032
3871  03b4 89            	pushw	x
3872  03b5 ae0020        	ldw	x,#_LCD_Dis_Data+32
3873  03b8 8d000000      	callf	f_strcpy
3875  03bc 85            	popw	x
3876                     ; 300 		strcpy(LCD_Dis_Data[3],"");
3878  03bd ae00d4        	ldw	x,#L5571
3879  03c0 89            	pushw	x
3880  03c1 ae0030        	ldw	x,#_LCD_Dis_Data+48
3881  03c4 8d000000      	callf	f_strcpy
3883  03c8 85            	popw	x
3884  03c9               L1032:
3885                     ; 302 	return;
3888  03c9 87            	retf	
3932                     ; 305 void LowCan_Select_Control(void)
3932                     ; 306 {
3933                     	switch	.text
3934  03ca               f_LowCan_Select_Control:
3936  03ca 88            	push	a
3937       00000001      OFST:	set	1
3940                     ; 309 	if(LCAN_flag == OFF){return;}
3942  03cb 7202000002    	btjt	_Select_Fuction_flag,#1,L3232
3946  03d0 84            	pop	a
3947  03d1 87            	retf	
3948  03d2               L3232:
3949                     ; 311 	if(UP_SW_flag == ON){
3951  03d2 7203000011    	btjf	_SW_Status,#1,L5232
3952                     ; 312 		if(Select_LowCan_Step > 1){ Select_LowCan_Step--;}
3954  03d7 c60003        	ld	a,_Select_LowCan_Step
3955  03da a102          	cp	a,#2
3956  03dc 2504          	jrult	L7232
3959  03de 725a0003      	dec	_Select_LowCan_Step
3960  03e2               L7232:
3961                     ; 313 		UP_SW_flag = OFF;
3963  03e2 72130000      	bres	_SW_Status,#1
3965  03e6 2014          	jra	L1332
3966  03e8               L5232:
3967                     ; 315 	}else if(DN_SW_flag == ON){ 
3969  03e8 720500000f    	btjf	_SW_Status,#2,L1332
3970                     ; 316 		if(Select_LowCan_Step < 2){ Select_LowCan_Step++;}
3972  03ed c60003        	ld	a,_Select_LowCan_Step
3973  03f0 a102          	cp	a,#2
3974  03f2 2404          	jruge	L5332
3977  03f4 725c0003      	inc	_Select_LowCan_Step
3978  03f8               L5332:
3979                     ; 317 		DN_SW_flag = OFF;
3981  03f8 72150000      	bres	_SW_Status,#2
3982  03fc               L1332:
3983                     ; 320 	if(Select_LowCan_Step <4){			//page 1
3985  03fc c60003        	ld	a,_Select_LowCan_Step
3986  03ff a104          	cp	a,#4
3987  0401 2448          	jruge	L7332
3988                     ; 322 		LowCan_Select_Display_Handling(Select_LowCan_Step);
3990  0403 c60003        	ld	a,_Select_LowCan_Step
3991  0406 8d950395      	callf	f_LowCan_Select_Display_Handling
3993                     ; 324 		for(i=0; i<4; i++){
3995  040a 4f            	clr	a
3996  040b 6b01          	ld	(OFST+0,sp),a
3997  040d               L1432:
3998                     ; 325 			Set_LCD_Address(LCD_Line[i]);
4000  040d 5f            	clrw	x
4001  040e 97            	ld	xl,a
4002  040f d60000        	ld	a,(_LCD_Line,x)
4003  0412 8d000000      	callf	f_Set_LCD_Address
4005                     ; 326 			if(i == Select_LowCan_Step){
4007  0416 7b01          	ld	a,(OFST+0,sp)
4008  0418 c10003        	cp	a,_Select_LowCan_Step
4009  041b 260b          	jrne	L1532
4010                     ; 327 				if(Blink_50){Display_LCD_String("                ");}
4012  041d 725d0000      	tnz	_Blink_50
4013  0421 2705          	jreq	L1532
4016  0423 ae00c3        	ldw	x,#L3202
4019  0426 2007          	jra	L5532
4020  0428               L1532:
4021                     ; 328 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4023                     ; 329 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4026  0428 97            	ld	xl,a
4027  0429 a610          	ld	a,#16
4028  042b 42            	mul	x,a
4029  042c 1c0000        	addw	x,#_LCD_Dis_Data
4031  042f               L5532:
4032  042f 8d000000      	callf	f_Display_LCD_String
4033                     ; 324 		for(i=0; i<4; i++){
4035  0433 0c01          	inc	(OFST+0,sp)
4038  0435 7b01          	ld	a,(OFST+0,sp)
4039  0437 a104          	cp	a,#4
4040  0439 25d2          	jrult	L1432
4041                     ; 332 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
4043  043b c60003        	ld	a,_LCD_Line+3
4044  043e ab0d          	add	a,#13
4045  0440 8d000000      	callf	f_Set_LCD_Address
4047                     ; 333 		Display_LCD_String("Pg1");
4049  0444 ae00bf        	ldw	x,#L1302
4050  0447 8d000000      	callf	f_Display_LCD_String
4052  044b               L7332:
4053                     ; 337 	if(SET_SW_flag == ON){
4055  044b 7207000054    	btjf	_SW_Status,#3,L7532
4056                     ; 338 		if(Select_LowCan_Step <4){
4058  0450 c60003        	ld	a,_Select_LowCan_Step
4059  0453 a104          	cp	a,#4
4060  0455 2407          	jruge	L1632
4061                     ; 339 			Set_LCD_Address(LCD_Line[Select_LowCan_Step]);
4063  0457 c60003        	ld	a,_Select_LowCan_Step
4064  045a 5f            	clrw	x
4065  045b 97            	ld	xl,a
4068  045c 2008          	jra	L3632
4069  045e               L1632:
4070                     ; 341 			Set_LCD_Address(LCD_Line[Select_LowCan_Step-4]);
4072  045e c60003        	ld	a,_Select_LowCan_Step
4073  0461 5f            	clrw	x
4074  0462 97            	ld	xl,a
4075  0463 1d0004        	subw	x,#4
4077  0466               L3632:
4078  0466 d60000        	ld	a,(_LCD_Line,x)
4079  0469 8d000000      	callf	f_Set_LCD_Address
4080                     ; 344 			if(Select_LowCan_Step == 1){
4082  046d c60003        	ld	a,_Select_LowCan_Step
4083  0470 4a            	dec	a
4084  0471 260a          	jrne	L5632
4085                     ; 345 				ModelS_PTC_flag = ON;
4087  0473 72120000      	bset	_Can_Select_Device,#1
4088                     ; 346 				ModelS_PTC_V56_flag = ON;		//Model-S Enable flag
4090  0477 72140000      	bset	_Can_Select_Device,#2
4091                     ; 347 				CAN_Enable();			//CAN Enalbe
4093                     ; 348 				Can_Enable = ON;			//Can Routine Start
4095  047b 200f          	jpf	LC006
4096  047d               L5632:
4097                     ; 350 			else if(Select_LowCan_Step == 2){
4099  047d c60003        	ld	a,_Select_LowCan_Step
4100  0480 a102          	cp	a,#2
4101  0482 2610          	jrne	L7632
4102                     ; 351 				ModelS_PTC_flag = ON;
4104  0484 72120000      	bset	_Can_Select_Device,#1
4105                     ; 352 				ModelS_PTC_V58_flag = ON;		// Model-S V58 Enable Flag
4107  0488 72160000      	bset	_Can_Select_Device,#3
4108                     ; 353 				CAN_Enable();			//CAN Enalbe
4111                     ; 354 				Can_Enable = ON;			//Can Routine Start
4113  048c               LC006:
4115  048c 8d000000      	callf	f_CAN_Enable
4117  0490 72100000      	bset	_Can_Select_Device,#0
4118  0494               L7632:
4119                     ; 357 			Select_LowCan_Step = 1;
4121  0494 35010003      	mov	_Select_LowCan_Step,#1
4122                     ; 358 			Fuction_Select_Mode = OFF;
4124  0498 72130000      	bres	_Mode_Select_Status,#1
4125                     ; 359 			LCAN_flag = OFF;				//Select LIN13 Device
4127  049c 72130000      	bres	_Select_Fuction_flag,#1
4128                     ; 361 		SET_SW_flag = OFF;
4130  04a0 72170000      	bres	_SW_Status,#3
4131  04a4               L7532:
4132                     ; 364 	if(EN_SW_flag == ON){
4134  04a4 720b000018    	btjf	_SW_Status,#5,L3732
4135                     ; 365 		Select_LowCan_Step = 1;
4137  04a9 35010003      	mov	_Select_LowCan_Step,#1
4138                     ; 366 		Can_Select_Device = 0;
4140  04ad 725f0000      	clr	_Can_Select_Device
4141                     ; 367 		Select_Fuction_flag = 0;
4143  04b1 725f0000      	clr	_Select_Fuction_flag
4144                     ; 368 		Fuction_Select_Mode = OFF;
4146  04b5 72130000      	bres	_Mode_Select_Status,#1
4147                     ; 369 		Device_Select_Mode = ON;
4149  04b9 72100000      	bset	_Mode_Select_Status,#0
4150                     ; 371 		EN_SW_flag = OFF;
4152  04bd 721b0000      	bres	_SW_Status,#5
4153  04c1               L3732:
4154                     ; 373 	return;
4157  04c1 84            	pop	a
4158  04c2 87            	retf	
4192                     ; 376 void HICan_Select_Display_Handling(unsigned char ST)
4192                     ; 377 {
4193                     	switch	.text
4194  04c3               f_HICan_Select_Display_Handling:
4198                     ; 379 	if(ST<4){
4200  04c3 a104          	cp	a,#4
4201  04c5 2430          	jruge	L1142
4202                     ; 380 		strcpy(LCD_Dis_Data[0],"*SELECT MODEL*");
4204  04c7 ae00dc        	ldw	x,#L1571
4205  04ca 89            	pushw	x
4206  04cb ae0000        	ldw	x,#_LCD_Dis_Data
4207  04ce 8d000000      	callf	f_strcpy
4209  04d2 85            	popw	x
4210                     ; 381 		strcpy(LCD_Dis_Data[1],"LMFC_PTC");
4212  04d3 ae0073        	ldw	x,#L3142
4213  04d6 89            	pushw	x
4214  04d7 ae0010        	ldw	x,#_LCD_Dis_Data+16
4215  04da 8d000000      	callf	f_strcpy
4217  04de 85            	popw	x
4218                     ; 382 		strcpy(LCD_Dis_Data[2],"PS/AE_PTC");
4220  04df ae0069        	ldw	x,#L5142
4221  04e2 89            	pushw	x
4222  04e3 ae0020        	ldw	x,#_LCD_Dis_Data+32
4223  04e6 8d000000      	callf	f_strcpy
4225  04ea 85            	popw	x
4226                     ; 383 		strcpy(LCD_Dis_Data[3],"MODEL-X-R");
4228  04eb ae005f        	ldw	x,#L7142
4229  04ee 89            	pushw	x
4230  04ef ae0030        	ldw	x,#_LCD_Dis_Data+48
4231  04f2 8d000000      	callf	f_strcpy
4233  04f6 85            	popw	x
4234  04f7               L1142:
4235                     ; 385 	return;
4238  04f7 87            	retf	
4282                     ; 388 void HICan_Select_Control(void)
4282                     ; 389 {
4283                     	switch	.text
4284  04f8               f_HICan_Select_Control:
4286  04f8 88            	push	a
4287       00000001      OFST:	set	1
4290                     ; 392 	if(HCAN_flag == OFF){return;}
4292  04f9 7200000002    	btjt	_Select_Fuction_flag,#0,L5342
4296  04fe 84            	pop	a
4297  04ff 87            	retf	
4298  0500               L5342:
4299                     ; 394 	if(UP_SW_flag == ON){
4301  0500 7203000011    	btjf	_SW_Status,#1,L7342
4302                     ; 395 		if(Select_HICan_Step > 1){ Select_HICan_Step--;}
4304  0505 c60004        	ld	a,_Select_HICan_Step
4305  0508 a102          	cp	a,#2
4306  050a 2504          	jrult	L1442
4309  050c 725a0004      	dec	_Select_HICan_Step
4310  0510               L1442:
4311                     ; 396 		UP_SW_flag = OFF;
4313  0510 72130000      	bres	_SW_Status,#1
4315  0514 2014          	jra	L3442
4316  0516               L7342:
4317                     ; 398 	}else if(DN_SW_flag == ON){ 
4319  0516 720500000f    	btjf	_SW_Status,#2,L3442
4320                     ; 399 		if(Select_HICan_Step < 3){ Select_HICan_Step++;}
4322  051b c60004        	ld	a,_Select_HICan_Step
4323  051e a103          	cp	a,#3
4324  0520 2404          	jruge	L7442
4327  0522 725c0004      	inc	_Select_HICan_Step
4328  0526               L7442:
4329                     ; 400 		DN_SW_flag = OFF;
4331  0526 72150000      	bres	_SW_Status,#2
4332  052a               L3442:
4333                     ; 403 	if(Select_HICan_Step <4){			//page 1
4335  052a c60004        	ld	a,_Select_HICan_Step
4336  052d a104          	cp	a,#4
4337  052f 2448          	jruge	L1542
4338                     ; 404 		HICan_Select_Display_Handling(Select_HICan_Step);		
4340  0531 c60004        	ld	a,_Select_HICan_Step
4341  0534 8dc304c3      	callf	f_HICan_Select_Display_Handling
4343                     ; 405 		for(i=0; i<4; i++){
4345  0538 4f            	clr	a
4346  0539 6b01          	ld	(OFST+0,sp),a
4347  053b               L3542:
4348                     ; 406 			Set_LCD_Address(LCD_Line[i]);
4350  053b 5f            	clrw	x
4351  053c 97            	ld	xl,a
4352  053d d60000        	ld	a,(_LCD_Line,x)
4353  0540 8d000000      	callf	f_Set_LCD_Address
4355                     ; 407 			if(i == Select_HICan_Step){
4357  0544 7b01          	ld	a,(OFST+0,sp)
4358  0546 c10004        	cp	a,_Select_HICan_Step
4359  0549 260b          	jrne	L3642
4360                     ; 408 				if(Blink_50){Display_LCD_String("                ");}
4362  054b 725d0000      	tnz	_Blink_50
4363  054f 2705          	jreq	L3642
4366  0551 ae00c3        	ldw	x,#L3202
4369  0554 2007          	jra	L7642
4370  0556               L3642:
4371                     ; 409 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4373                     ; 410 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4376  0556 97            	ld	xl,a
4377  0557 a610          	ld	a,#16
4378  0559 42            	mul	x,a
4379  055a 1c0000        	addw	x,#_LCD_Dis_Data
4381  055d               L7642:
4382  055d 8d000000      	callf	f_Display_LCD_String
4383                     ; 405 		for(i=0; i<4; i++){
4385  0561 0c01          	inc	(OFST+0,sp)
4388  0563 7b01          	ld	a,(OFST+0,sp)
4389  0565 a104          	cp	a,#4
4390  0567 25d2          	jrult	L3542
4391                     ; 412 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
4393  0569 c60003        	ld	a,_LCD_Line+3
4394  056c ab0d          	add	a,#13
4395  056e 8d000000      	callf	f_Set_LCD_Address
4397                     ; 413 		Display_LCD_String("Pg1");
4399  0572 ae00bf        	ldw	x,#L1302
4400  0575 8d000000      	callf	f_Display_LCD_String
4402  0579               L1542:
4403                     ; 417 	if(SET_SW_flag == ON){
4405  0579 7207000059    	btjf	_SW_Status,#3,L1742
4406                     ; 418 		if(Select_HICan_Step <4){
4408  057e c60004        	ld	a,_Select_HICan_Step
4409  0581 a104          	cp	a,#4
4410  0583 2407          	jruge	L3742
4411                     ; 419 			Set_LCD_Address(LCD_Line[Select_HICan_Step]);
4413  0585 c60004        	ld	a,_Select_HICan_Step
4414  0588 5f            	clrw	x
4415  0589 97            	ld	xl,a
4418  058a 2008          	jra	L5742
4419  058c               L3742:
4420                     ; 421 			Set_LCD_Address(LCD_Line[Select_HICan_Step-4]);
4422  058c c60004        	ld	a,_Select_HICan_Step
4423  058f 5f            	clrw	x
4424  0590 97            	ld	xl,a
4425  0591 1d0004        	subw	x,#4
4427  0594               L5742:
4428  0594 d60000        	ld	a,(_LCD_Line,x)
4429  0597 8d000000      	callf	f_Set_LCD_Address
4430                     ; 424 		if(Select_HICan_Step == 1){
4432  059b c60004        	ld	a,_Select_HICan_Step
4433  059e 4a            	dec	a
4434  059f 2606          	jrne	L7742
4435                     ; 425 			LMFC_PTC_flag = ON;		//LMFC_PTC Enable flag
4437  05a1 72180000      	bset	_Can_Select_Device,#4
4438                     ; 426 			CAN_Enable();			//CAN Enalbe
4440                     ; 427 			Can_Enable = ON;			//Can Routine Start
4442  05a5 2018          	jpf	LC008
4443  05a7               L7742:
4444                     ; 429 		else if(Select_HICan_Step == 2){
4446  05a7 c60004        	ld	a,_Select_HICan_Step
4447  05aa a102          	cp	a,#2
4448  05ac 2606          	jrne	L3052
4449                     ; 430 			PS_PTC_flag = ON;
4451  05ae 721a0000      	bset	_Can_Select_Device,#5
4452                     ; 431 			CAN_Enable();			//CAN Enalbe
4454                     ; 432 			Can_Enable = ON;			//Can Routine Start
4456  05b2 200b          	jpf	LC008
4457  05b4               L3052:
4458                     ; 434 		else if(Select_HICan_Step == 3){
4460  05b4 c60004        	ld	a,_Select_HICan_Step
4461  05b7 a103          	cp	a,#3
4462  05b9 260c          	jrne	L1052
4463                     ; 435 			ModelX_PTC_flag = ON;
4465  05bb 721c0000      	bset	_Can_Select_Device,#6
4466                     ; 436 			CAN_Enable();			//CAN Enalbe
4469                     ; 437 			Can_Enable = ON;
4471  05bf               LC008:
4474  05bf 8d000000      	callf	f_CAN_Enable
4477  05c3 72100000      	bset	_Can_Select_Device,#0
4478  05c7               L1052:
4479                     ; 439 		Select_HICan_Step = 1;
4481  05c7 35010004      	mov	_Select_HICan_Step,#1
4482                     ; 440 		Fuction_Select_Mode = OFF;
4484  05cb 72130000      	bres	_Mode_Select_Status,#1
4485                     ; 441 		HCAN_flag = OFF;				//Select LIN13 Device
4487  05cf 72110000      	bres	_Select_Fuction_flag,#0
4488                     ; 443 		SET_SW_flag = OFF;
4490  05d3 72170000      	bres	_SW_Status,#3
4491  05d7               L1742:
4492                     ; 446 	if(EN_SW_flag == ON){
4494  05d7 720b000018    	btjf	_SW_Status,#5,L1152
4495                     ; 447 		Select_HICan_Step = 1;
4497  05dc 35010004      	mov	_Select_HICan_Step,#1
4498                     ; 448 		Can_Select_Device = 0;
4500  05e0 725f0000      	clr	_Can_Select_Device
4501                     ; 449 		Select_Fuction_flag = 0;
4503  05e4 725f0000      	clr	_Select_Fuction_flag
4504                     ; 450 		Fuction_Select_Mode = OFF;
4506  05e8 72130000      	bres	_Mode_Select_Status,#1
4507                     ; 451 		Device_Select_Mode = ON;
4509  05ec 72100000      	bset	_Mode_Select_Status,#0
4510                     ; 453 		EN_SW_flag = OFF;
4512  05f0 721b0000      	bres	_SW_Status,#5
4513  05f4               L1152:
4514                     ; 455 	return;
4517  05f4 84            	pop	a
4518  05f5 87            	retf	
4554                     ; 460 void Mode_Set_Routine(unsigned char MD)
4554                     ; 461 {
4555                     	switch	.text
4556  05f6               f_Mode_Set_Routine:
4560                     ; 462 	switch(MD){
4563                     ; 491 		default : break;
4564  05f6 4a            	dec	a
4565  05f7 2710          	jreq	L3152
4566  05f9 4a            	dec	a
4567  05fa 2716          	jreq	L5152
4568  05fc 4a            	dec	a
4569  05fd 271c          	jreq	L7152
4570  05ff 4a            	dec	a
4571  0600 2727          	jreq	L1252
4572  0602 4a            	dec	a
4573  0603 272e          	jreq	L3252
4574  0605 4a            	dec	a
4575  0606 2733          	jreq	L5252
4577  0608 87            	retf	
4578  0609               L3152:
4579                     ; 463 		case 1: 	All_Function_Disable();
4581  0609 8d000000      	callf	f_All_Function_Disable
4583                     ; 464 				HCAN_flag = ON;
4585  060d 72100000      	bset	_Select_Fuction_flag,#0
4586                     ; 465 				break;
4589  0611 87            	retf	
4590  0612               L5152:
4591                     ; 467 		case 2: 	All_Function_Disable();
4593  0612 8d000000      	callf	f_All_Function_Disable
4595                     ; 468 				LCAN_flag = ON;
4597  0616 72120000      	bset	_Select_Fuction_flag,#1
4598                     ; 469 				break;
4601  061a 87            	retf	
4602  061b               L7152:
4603                     ; 471 		case 3: 	LIN_13_flag = ON;
4605  061b 72140000      	bset	_Select_Fuction_flag,#2
4606                     ; 472 			    	All_Function_Disable();
4608  061f 8d000000      	callf	f_All_Function_Disable
4610                     ; 473 				LIN13_Enable();
4612  0623 8d000000      	callf	f_LIN13_Enable
4614                     ; 474 				LIN_EN = 1;		//Lin Transceiver Enable
4615                     ; 475 				break;
4617  0627 201e          	jpf	LC009
4618  0629               L1252:
4619                     ; 477 		case 4: 	LIN_20_flag = ON;
4621  0629 72160000      	bset	_Select_Fuction_flag,#3
4622                     ; 478 				All_Function_Disable();
4624  062d 8d000000      	callf	f_All_Function_Disable
4626                     ; 479 				LIN_EN = 1;		//Lin Transceiver Enable
4627                     ; 480 		            	break;
4629  0631 2014          	jpf	LC009
4630  0633               L3252:
4631                     ; 482 		case 5: 	PWM_MD_flag = ON;
4633  0633 72180000      	bset	_Select_Fuction_flag,#4
4634                     ; 483 				All_Function_Disable();
4637                     ; 484 				break;
4640  0637 ac000000      	jpf	f_All_Function_Disable
4641  063b               L5252:
4642                     ; 486 		case 6 : LIN_J2602_flag = ON;
4644  063b 721a0000      	bset	_Select_Fuction_flag,#5
4645                     ; 487 				All_Function_Disable();
4647  063f 8d000000      	callf	f_All_Function_Disable
4649                     ; 488 				LIN_J2602_Enable();
4651  0643 8d000000      	callf	f_LIN_J2602_Enable
4653                     ; 489 				LIN_EN = 1;
4655  0647               LC009:
4658  0647 7214500f      	bset	_PD_ODR,#2
4659                     ; 491 		default : break;
4661                     ; 493 	return;
4664  064b 87            	retf	
4698                     ; 497 void Mode_Select_Display_Handling(unsigned char ST)
4698                     ; 498 {
4699                     	switch	.text
4700  064c               f_Mode_Select_Display_Handling:
4702  064c 88            	push	a
4703       00000000      OFST:	set	0
4706                     ; 500 	if(ST<4){
4708  064d a104          	cp	a,#4
4709  064f 2429          	jruge	L5652
4710                     ; 501 		strcpy(LCD_Dis_Data[0],"*SELECT DEVICE*");
4712  0651 ae004f        	ldw	x,#L7652
4713  0654 89            	pushw	x
4714  0655 ae0000        	ldw	x,#_LCD_Dis_Data
4715  0658 8d000000      	callf	f_strcpy
4717  065c 85            	popw	x
4718                     ; 502 		strcpy(LCD_Dis_Data[1],"CAN_HSpeed");
4720  065d ae0044        	ldw	x,#L1752
4721  0660 89            	pushw	x
4722  0661 ae0010        	ldw	x,#_LCD_Dis_Data+16
4723  0664 8d000000      	callf	f_strcpy
4725  0668 85            	popw	x
4726                     ; 503 		strcpy(LCD_Dis_Data[2],"CAN_LSpeed");
4728  0669 ae0039        	ldw	x,#L3752
4729  066c 89            	pushw	x
4730  066d ae0020        	ldw	x,#_LCD_Dis_Data+32
4731  0670 8d000000      	callf	f_strcpy
4733  0674 85            	popw	x
4734                     ; 504 		strcpy(LCD_Dis_Data[3],"LIN_1.3");
4736  0675 ae0031        	ldw	x,#L5752
4739  0678 202d          	jpf	LC010
4740  067a               L5652:
4741                     ; 506 	else if(ST<8){
4743  067a 7b01          	ld	a,(OFST+1,sp)
4744  067c a108          	cp	a,#8
4745  067e 2430          	jruge	L7752
4746                     ; 507 		strcpy(LCD_Dis_Data[0],"LIN_2.0");
4748  0680 ae0029        	ldw	x,#L3062
4749  0683 89            	pushw	x
4750  0684 ae0000        	ldw	x,#_LCD_Dis_Data
4751  0687 8d000000      	callf	f_strcpy
4753  068b 85            	popw	x
4754                     ; 508 		strcpy(LCD_Dis_Data[1],"PWM Module");
4756  068c ae001e        	ldw	x,#L5062
4757  068f 89            	pushw	x
4758  0690 ae0010        	ldw	x,#_LCD_Dis_Data+16
4759  0693 8d000000      	callf	f_strcpy
4761  0697 85            	popw	x
4762                     ; 509 		strcpy(LCD_Dis_Data[2],"LIN_J2602");
4764  0698 ae0014        	ldw	x,#L7062
4765  069b 89            	pushw	x
4766  069c ae0020        	ldw	x,#_LCD_Dis_Data+32
4767  069f 8d000000      	callf	f_strcpy
4769  06a3 85            	popw	x
4770                     ; 510 		strcpy(LCD_Dis_Data[3],"");
4772  06a4 ae00d4        	ldw	x,#L5571
4774  06a7               LC010:
4775  06a7 89            	pushw	x
4776  06a8 ae0030        	ldw	x,#_LCD_Dis_Data+48
4777  06ab 8d000000      	callf	f_strcpy
4778  06af 85            	popw	x
4779  06b0               L7752:
4780                     ; 512 	return;
4783  06b0 84            	pop	a
4784  06b1 87            	retf	
4826                     ; 517 void Mode_Select_Control(void)
4826                     ; 518 {
4827                     	switch	.text
4828  06b2               f_Mode_Select_Control:
4830  06b2 88            	push	a
4831       00000001      OFST:	set	1
4834                     ; 521 	if(Device_Select_Mode == OFF){return;}
4836  06b3 7200000002    	btjt	_Mode_Select_Status,#0,L5262
4840  06b8 84            	pop	a
4841  06b9 87            	retf	
4842  06ba               L5262:
4843                     ; 524 	if(UP_SW_flag == ON){
4845  06ba 7203000011    	btjf	_SW_Status,#1,L7262
4846                     ; 525 		if(Select_Device_Step > 1){ 
4848  06bf c60000        	ld	a,_Select_Device_Step
4849  06c2 a102          	cp	a,#2
4850  06c4 2504          	jrult	L1362
4851                     ; 526 			Select_Device_Step--; 
4853  06c6 725a0000      	dec	_Select_Device_Step
4854  06ca               L1362:
4855                     ; 529 		UP_SW_flag = OFF;
4857  06ca 72130000      	bres	_SW_Status,#1
4859  06ce 2014          	jra	L3362
4860  06d0               L7262:
4861                     ; 530 	}else if(DN_SW_flag == ON){ 
4863  06d0 720500000f    	btjf	_SW_Status,#2,L3362
4864                     ; 531 		if(Select_Device_Step < 6){ 
4866  06d5 c60000        	ld	a,_Select_Device_Step
4867  06d8 a106          	cp	a,#6
4868  06da 2404          	jruge	L7362
4869                     ; 532 			Select_Device_Step++;
4871  06dc 725c0000      	inc	_Select_Device_Step
4872  06e0               L7362:
4873                     ; 535 		DN_SW_flag = OFF;
4875  06e0 72150000      	bres	_SW_Status,#2
4876  06e4               L3362:
4877                     ; 539 	if(Select_Device_Step <4){			
4879  06e4 c60000        	ld	a,_Select_Device_Step
4880  06e7 a104          	cp	a,#4
4881  06e9 2446          	jruge	L1462
4882                     ; 540 		Mode_Select_Display_Handling(Select_Device_Step);	//page 1
4884  06eb c60000        	ld	a,_Select_Device_Step
4885  06ee 8d4c064c      	callf	f_Mode_Select_Display_Handling
4887                     ; 542 		for(i=0; i<4; i++){
4889  06f2 4f            	clr	a
4890  06f3 6b01          	ld	(OFST+0,sp),a
4891  06f5               L3462:
4892                     ; 543 			Set_LCD_Address(LCD_Line[i]);
4894  06f5 5f            	clrw	x
4895  06f6 97            	ld	xl,a
4896  06f7 d60000        	ld	a,(_LCD_Line,x)
4897  06fa 8d000000      	callf	f_Set_LCD_Address
4899                     ; 544 			if(i == Select_Device_Step){
4901  06fe 7b01          	ld	a,(OFST+0,sp)
4902  0700 c10000        	cp	a,_Select_Device_Step
4903  0703 260b          	jrne	L3562
4904                     ; 545 				if(Blink_50){Display_LCD_String("                ");}
4906  0705 725d0000      	tnz	_Blink_50
4907  0709 2705          	jreq	L3562
4910  070b ae00c3        	ldw	x,#L3202
4913  070e 2007          	jra	L7562
4914  0710               L3562:
4915                     ; 546 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4917                     ; 547 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4920  0710 97            	ld	xl,a
4921  0711 a610          	ld	a,#16
4922  0713 42            	mul	x,a
4923  0714 1c0000        	addw	x,#_LCD_Dis_Data
4925  0717               L7562:
4926  0717 8d000000      	callf	f_Display_LCD_String
4927                     ; 542 		for(i=0; i<4; i++){
4929  071b 0c01          	inc	(OFST+0,sp)
4932  071d 7b01          	ld	a,(OFST+0,sp)
4933  071f a104          	cp	a,#4
4934  0721 25d2          	jrult	L3462
4935                     ; 550 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
4937  0723 c60003        	ld	a,_LCD_Line+3
4938  0726 ab0d          	add	a,#13
4939  0728 8d000000      	callf	f_Set_LCD_Address
4941                     ; 551 		Display_LCD_String("Pg1");
4943  072c ae00bf        	ldw	x,#L1302
4946  072f 2052          	jra	L1662
4947  0731               L1462:
4948                     ; 554 		Mode_Select_Display_Handling(Select_Device_Step);	//page 2
4950  0731 c60000        	ld	a,_Select_Device_Step
4951  0734 8d4c064c      	callf	f_Mode_Select_Display_Handling
4953                     ; 555 		for(i=0; i<3; i++){
4955  0738 4f            	clr	a
4956  0739 6b01          	ld	(OFST+0,sp),a
4957  073b               L3662:
4958                     ; 556 			Set_LCD_Address(LCD_Line[i]);
4960  073b 5f            	clrw	x
4961  073c 97            	ld	xl,a
4962  073d d60000        	ld	a,(_LCD_Line,x)
4963  0740 8d000000      	callf	f_Set_LCD_Address
4965                     ; 557 			if(i == (Select_Device_Step-4)){
4967  0744 c60000        	ld	a,_Select_Device_Step
4968  0747 5f            	clrw	x
4969  0748 97            	ld	xl,a
4970  0749 1d0004        	subw	x,#4
4971  074c 7b01          	ld	a,(OFST+0,sp)
4972  074e 905f          	clrw	y
4973  0750 9097          	ld	yl,a
4974  0752 90bf00        	ldw	c_y,y
4975  0755 b300          	cpw	x,c_y
4976  0757 260b          	jrne	L3762
4977                     ; 558 				if(Blink_50){Display_LCD_String("               ");}
4979  0759 725d0000      	tnz	_Blink_50
4980  075d 2705          	jreq	L3762
4983  075f ae0004        	ldw	x,#L5762
4986  0762 2007          	jra	L1072
4987  0764               L3762:
4988                     ; 559 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4990                     ; 560 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4993  0764 97            	ld	xl,a
4994  0765 a610          	ld	a,#16
4995  0767 42            	mul	x,a
4996  0768 1c0000        	addw	x,#_LCD_Dis_Data
4998  076b               L1072:
4999  076b 8d000000      	callf	f_Display_LCD_String
5000                     ; 555 		for(i=0; i<3; i++){
5002  076f 0c01          	inc	(OFST+0,sp)
5005  0771 7b01          	ld	a,(OFST+0,sp)
5006  0773 a103          	cp	a,#3
5007  0775 25c4          	jrult	L3662
5008                     ; 563 		Set_LCD_Address((unsigned char)(LCD_Line[3]+13));
5010  0777 c60003        	ld	a,_LCD_Line+3
5011  077a ab0d          	add	a,#13
5012  077c 8d000000      	callf	f_Set_LCD_Address
5014                     ; 564 		Display_LCD_String("Pg2");
5016  0780 ae0000        	ldw	x,#L3072
5018  0783               L1662:
5019  0783 8d000000      	callf	f_Display_LCD_String
5020                     ; 568 	Select_Device_Step = 4;
5022  0787 35040000      	mov	_Select_Device_Step,#4
5023                     ; 569 	SET_SW_flag = ON;
5025  078b 72160000      	bset	_SW_Status,#3
5026                     ; 571 	if(SET_SW_flag == ON){
5028  078f 7207000025    	btjf	_SW_Status,#3,L5072
5029                     ; 573 		if(Select_Device_Step % 5){
5031  0794 c60000        	ld	a,_Select_Device_Step
5032  0797 5f            	clrw	x
5033  0798 97            	ld	xl,a
5034  0799 a605          	ld	a,#5
5035  079b 8d000000      	callf	d_smodx
5037  079f 5d            	tnzw	x
5038  07a0 2713          	jreq	L7072
5039                     ; 575 			Mode_Set_Routine(Select_Device_Step);
5041  07a2 c60000        	ld	a,_Select_Device_Step
5042  07a5 8df605f6      	callf	f_Mode_Set_Routine
5044                     ; 576 			Select_Device_Step = 1;
5046  07a9 35010000      	mov	_Select_Device_Step,#1
5047                     ; 577 			Device_Select_Mode = OFF;				//Clear device setting mode
5049  07ad 72110000      	bres	_Mode_Select_Status,#0
5050                     ; 578 			Fuction_Select_Mode = ON;
5052  07b1 72120000      	bset	_Mode_Select_Status,#1
5053  07b5               L7072:
5054                     ; 581 		SET_SW_flag = OFF;
5056  07b5 72170000      	bres	_SW_Status,#3
5057  07b9               L5072:
5058                     ; 586 	return;
5061  07b9 84            	pop	a
5062  07ba 87            	retf	
5130                     	xdef	f_Mode_Select_Display_Handling
5131                     	xdef	f_HICan_Select_Display_Handling
5132                     	xdef	f_LowCan_Select_Display_Handling
5133                     	xdef	f_Lin_J2602_Select_Display_Handling
5134                     	xdef	f_Lin_20_Select_Display_Handling
5135                     	xdef	f_Lin_13_Select_Display_Handling
5136                     	xdef	f_All_Function_Disable
5137                     	xdef	_Select_J2602_Step
5138                     	xdef	_Select_HICan_Step
5139                     	xdef	_Select_LowCan_Step
5140                     	xdef	_Select_LIN20_Step
5141                     	xdef	_Select_LIN13_Step
5142                     	xdef	_Select_Device_Step
5143                     	xdef	f_Mode_Set_Routine
5144                     	xdef	f_LowCan_Select_Control
5145                     	xdef	f_Lin_20_Select_Control
5146                     	xref	f_strcpy
5147                     	xref	f_CHCM_Reset_Values
5148                     	xdef	f_Lin_J2602_Select_Control
5149                     	xdef	f_HICan_Select_Control
5150                     	xdef	f_Function_Select_Control
5151                     	xdef	f_Lin_13_Select_Control
5152                     	xdef	f_Mode_Select_Control
5153                     	xref	_LCD_Dis_Data
5154                     	xref	_LCD_Line
5155                     	xref	f_Display_LCD_String
5156                     	xref	f_Set_LCD_Address
5157                     	xref	f_LIN_J2602_Enable
5158                     	xref	f_LIN20_Disable
5159                     	xref	f_LIN20_MT_Enable
5160                     	xref	f_LIN20_Enable
5161                     	xref	f_LIN13_Disable
5162                     	xref	f_LIN13_Enable
5163                     	xref	f_CAN_Disable
5164                     	xref	f_CAN_Enable
5165                     	xref	_Blink_50
5166                     	xref	_SW_Status
5167                     	xref	_LIN_J2602_Select_Device
5168                     	xref	_Can_Select_Device
5169                     	xref	_LIN20_Select_Device
5170                     	xref	_LIN13_Select_Device
5171                     	xref	_Select_Fuction_flag
5172                     	xref	_Mode_Select_Status
5173                     .const:	section	.text
5174  0000               L3072:
5175  0000 50673200      	dc.b	"Pg2",0
5176  0004               L5762:
5177  0004 202020202020  	dc.b	"               ",0
5178  0014               L7062:
5179  0014 4c494e5f4a32  	dc.b	"LIN_J2602",0
5180  001e               L5062:
5181  001e 50574d204d6f  	dc.b	"PWM Module",0
5182  0029               L3062:
5183  0029 4c494e5f322e  	dc.b	"LIN_2.0",0
5184  0031               L5752:
5185  0031 4c494e5f312e  	dc.b	"LIN_1.3",0
5186  0039               L3752:
5187  0039 43414e5f4c53  	dc.b	"CAN_LSpeed",0
5188  0044               L1752:
5189  0044 43414e5f4853  	dc.b	"CAN_HSpeed",0
5190  004f               L7652:
5191  004f 2a53454c4543  	dc.b	"*SELECT DEVICE*",0
5192  005f               L7142:
5193  005f 4d4f44454c2d  	dc.b	"MODEL-X-R",0
5194  0069               L5142:
5195  0069 50532f41455f  	dc.b	"PS/AE_PTC",0
5196  0073               L3142:
5197  0073 4c4d46435f50  	dc.b	"LMFC_PTC",0
5198  007c               L5032:
5199  007c 4d44535f5054  	dc.b	"MDS_PTC_V58",0
5200  0088               L3032:
5201  0088 4d44535f5054  	dc.b	"MDS_PTC_V56",0
5202  0094               L1022:
5203  0094 4c47455f4348  	dc.b	"LGE_CHCM",0
5204  009d               L7602:
5205  009d 534149435f50  	dc.b	"SAIC_PTC",0
5206  00a6               L5602:
5207  00a6 464941545f4d  	dc.b	"FIAT_Monitor",0
5208  00b3               L3602:
5209  00b3 464941543530  	dc.b	"FIAT500_PTC",0
5210  00bf               L1302:
5211  00bf 50673100      	dc.b	"Pg1",0
5212  00c3               L3202:
5213  00c3 202020202020  	dc.b	"                ",0
5214  00d4               L5571:
5215  00d4 00            	dc.b	0
5216  00d5               L3571:
5217  00d5 54365f505443  	dc.b	"T6_PTC",0
5218  00dc               L1571:
5219  00dc 2a53454c4543  	dc.b	"*SELECT MODEL*",0
5220                     	xref.b	c_x
5221                     	xref.b	c_y
5241                     	xref	d_smodx
5242                     	end

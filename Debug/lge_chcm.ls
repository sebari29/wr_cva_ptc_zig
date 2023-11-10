   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _CHCM_Oper_Data:
2660  0000 0000          	dc.w	0
2661  0002 000000000000  	ds.b	6
2662  0008               _CHCM_ENABLE:
2663  0008 00            	dc.b	0
2664  0009               _CHCM_OperHeat:
2665  0009 00            	dc.b	0
2666  000a               _CHCM_HV_CUR:
2667  000a 00            	dc.b	0
2668  000b               _CHCM_Fault:
2669  000b 00            	dc.b	0
2670  000c               _CHCM_Operation_Status:
2671  000c 00            	dc.b	0
2672  000d               _CHCM_Recieve_Cnt:
2673  000d 00            	dc.b	0
2674  000e               _CHCM_Dunit:
2675  000e 01            	dc.b	1
2676  000f               _CHCM_Data_Step:
2677  000f 00            	dc.b	0
2678  0010               _CHCM_Test_Pg:
2679  0010 00            	dc.b	0
2680  0011               _CHCM_Test_Pre_Pg:
2681  0011 08            	dc.b	8
2682  0012               _CHCM_TxLin_Data:
2683  0012 00            	dc.b	0
2684  0013 000000000000  	ds.b	8
2685  001b               _CHCM_RxLin_Data:
2686  001b 00            	dc.b	0
2687  001c 000000000000  	ds.b	8
2726                     ; 41 void CHCM_Reset_Values(void)
2726                     ; 42 {
2727                     	switch	.text
2728  0000               f_CHCM_Reset_Values:
2732                     ; 43 	CHCM_Oper_Data[0] = 0;
2734  0000 5f            	clrw	x
2735  0001 cf0000        	ldw	_CHCM_Oper_Data,x
2736                     ; 44 	CHCM_Oper_Data[1] = 0;
2738  0004 cf0002        	ldw	_CHCM_Oper_Data+2,x
2739                     ; 45 	CHCM_Oper_Data[2] = 0;
2741  0007 cf0004        	ldw	_CHCM_Oper_Data+4,x
2742                     ; 46 	CHCM_Oper_Data[3] = 0;
2744  000a cf0006        	ldw	_CHCM_Oper_Data+6,x
2745                     ; 48 	CHCM_OperHeat = 0;
2747  000d 725f0009      	clr	_CHCM_OperHeat
2748                     ; 49 	CHCM_ENABLE = 0;
2750  0011 725f0008      	clr	_CHCM_ENABLE
2751                     ; 50 	CHCM_HV_CUR = 0;
2753  0015 725f000a      	clr	_CHCM_HV_CUR
2754                     ; 51 	CHCM_Operation_Status = 0;
2756  0019 725f000c      	clr	_CHCM_Operation_Status
2757                     ; 53 	CHCM_Data_Step = 0;
2759  001d 725f000f      	clr	_CHCM_Data_Step
2760                     ; 54 	CHCM_Test_Pg = 0;
2762  0021 725f0010      	clr	_CHCM_Test_Pg
2763                     ; 55 	CHCM_Test_Pre_Pg = 8;
2765  0025 35080011      	mov	_CHCM_Test_Pre_Pg,#8
2766                     ; 56 	Lin_Rx_Cnt = 0;
2768  0029 725f0000      	clr	_Lin_Rx_Cnt
2769                     ; 58 	CHCM_Dunit = 1;
2771  002d 3501000e      	mov	_CHCM_Dunit,#1
2772                     ; 60 	return;
2775  0031 87            	retf	
2811                     ; 65 void CHCM_Test_Value_Change(unsigned char ST)
2811                     ; 66 {
2812                     	switch	.text
2813  0032               f_CHCM_Test_Value_Change:
2815  0032 88            	push	a
2816       00000000      OFST:	set	0
2819                     ; 68 	if(ST == 1){	
2821  0033 4a            	dec	a
2822  0034 262c          	jrne	L5371
2823                     ; 70 		if(CHCM_Data_Step == (unsigned char)0){ CHCM_ENABLE ^= 1;}
2825  0036 725d000f      	tnz	_CHCM_Data_Step
2826  003a 260a          	jrne	L7371
2829  003c c60008        	ld	a,_CHCM_ENABLE
2830  003f a801          	xor	a,#1
2831  0041 c70008        	ld	_CHCM_ENABLE,a
2833  0044 204d          	jra	L7471
2834  0046               L7371:
2835                     ; 71 		else if(CHCM_Data_Step == (unsigned char)1){
2837  0046 c6000f        	ld	a,_CHCM_Data_Step
2838  0049 4a            	dec	a
2839  004a 2647          	jrne	L7471
2840                     ; 73 			CHCM_OperHeat += CHCM_Dunit;
2842  004c c60009        	ld	a,_CHCM_OperHeat
2843  004f cb000e        	add	a,_CHCM_Dunit
2844  0052 c70009        	ld	_CHCM_OperHeat,a
2845                     ; 74 			if(CHCM_OperHeat > 100){CHCM_OperHeat = 100;}
2847  0055 c60009        	ld	a,_CHCM_OperHeat
2848  0058 a165          	cp	a,#101
2849  005a 2537          	jrult	L7471
2852  005c 35640009      	mov	_CHCM_OperHeat,#100
2853  0060 2031          	jra	L7471
2854  0062               L5371:
2855                     ; 78 	else if(ST == 0){	
2857  0062 7b01          	ld	a,(OFST+1,sp)
2858  0064 262d          	jrne	L7471
2859                     ; 79 		if(CHCM_Data_Step == (unsigned char)0){ CHCM_ENABLE ^= 1;}
2861  0066 725d000f      	tnz	_CHCM_Data_Step
2862  006a 260a          	jrne	L3571
2865  006c c60008        	ld	a,_CHCM_ENABLE
2866  006f a801          	xor	a,#1
2867  0071 c70008        	ld	_CHCM_ENABLE,a
2869  0074 201d          	jra	L7471
2870  0076               L3571:
2871                     ; 80 		else if(CHCM_Data_Step == (unsigned char)1){
2873  0076 c6000f        	ld	a,_CHCM_Data_Step
2874  0079 4a            	dec	a
2875  007a 2617          	jrne	L7471
2876                     ; 82 			if(CHCM_OperHeat < CHCM_Dunit){CHCM_OperHeat = 0;}
2878  007c c60009        	ld	a,_CHCM_OperHeat
2879  007f c1000e        	cp	a,_CHCM_Dunit
2880  0082 2406          	jruge	L1671
2883  0084 725f0009      	clr	_CHCM_OperHeat
2885  0088 2009          	jra	L7471
2886  008a               L1671:
2887                     ; 83 			else{CHCM_OperHeat -= CHCM_Dunit;}
2889  008a c60009        	ld	a,_CHCM_OperHeat
2890  008d c0000e        	sub	a,_CHCM_Dunit
2891  0090 c70009        	ld	_CHCM_OperHeat,a
2892  0093               L7471:
2893                     ; 87 	return ;
2896  0093 84            	pop	a
2897  0094 87            	retf	
2930                     ; 91 void CHCM_Switch_Control(void)
2930                     ; 92 {
2931                     	switch	.text
2932  0095               f_CHCM_Switch_Control:
2936                     ; 93 	if(UP_SW_flag == ON){
2938  0095 7203000049    	btjf	_SW_Status,#1,L5771
2939                     ; 95 		if(CHCM_Option_flag == ON){
2941  009a 720700020c    	btjf	_LGE_Test_Register,#3,L7771
2942                     ; 96 			if(CHCM_Dunit<100){ CHCM_Dunit++;}
2944  009f c6000e        	ld	a,_CHCM_Dunit
2945  00a2 a164          	cp	a,#100
2946  00a4 2404          	jruge	L1002
2949  00a6 725c000e      	inc	_CHCM_Dunit
2950  00aa               L1002:
2951                     ; 97 			return;
2954  00aa 87            	retf	
2955  00ab               L7771:
2956                     ; 100 		if(CHCM_Data_Setting_flag == ON){	CHCM_Test_Value_Change(1);}
2958  00ab 7203000208    	btjf	_LGE_Test_Register,#1,L3002
2961  00b0 a601          	ld	a,#1
2962  00b2 8d320032      	callf	f_CHCM_Test_Value_Change
2965  00b6 2025          	jra	L5002
2966  00b8               L3002:
2967                     ; 101 		else if(CHCM_Data_Select_flag == ON){
2969  00b8 720100020c    	btjf	_LGE_Test_Register,#0,L7002
2970                     ; 102 			if(CHCM_Data_Step > 0){ 
2972  00bd 725d000f      	tnz	_CHCM_Data_Step
2973  00c1 271a          	jreq	L5002
2974                     ; 103 				CHCM_Data_Step--; 
2976  00c3 725a000f      	dec	_CHCM_Data_Step
2977  00c7 2014          	jra	L5002
2978  00c9               L7002:
2979                     ; 106 			if(CHCM_Test_Pg > 0){
2981  00c9 725d0010      	tnz	_CHCM_Test_Pg
2982  00cd 270e          	jreq	L5002
2983                     ; 107 				CHCM_Test_Pg--;
2985  00cf 725a0010      	dec	_CHCM_Test_Pg
2986                     ; 108 				if(CHCM_Test_Pg == 0){CHCM_Data_Step = 0;}
2988  00d3 725d0010      	tnz	_CHCM_Test_Pg
2989  00d7 2604          	jrne	L5002
2992  00d9 725f000f      	clr	_CHCM_Data_Step
2993  00dd               L5002:
2994                     ; 112 		UP_SW_flag = OFF;
2996  00dd 72130000      	bres	_SW_Status,#1
2998  00e1 204b          	jra	L1202
2999  00e3               L5771:
3000                     ; 115 	else if(DN_SW_flag == ON){ 
3002  00e3 7205000046    	btjf	_SW_Status,#2,L1202
3003                     ; 117 		if(CHCM_Option_flag == ON){
3005  00e8 720700020c    	btjf	_LGE_Test_Register,#3,L5202
3006                     ; 118 			if(CHCM_Dunit>1){ CHCM_Dunit--;}
3008  00ed c6000e        	ld	a,_CHCM_Dunit
3009  00f0 a102          	cp	a,#2
3010  00f2 2504          	jrult	L7202
3013  00f4 725a000e      	dec	_CHCM_Dunit
3014  00f8               L7202:
3015                     ; 119 			return;
3018  00f8 87            	retf	
3019  00f9               L5202:
3020                     ; 123 		if(CHCM_Data_Setting_flag == ON){	CHCM_Test_Value_Change(0);}
3022  00f9 7203000207    	btjf	_LGE_Test_Register,#1,L1302
3025  00fe 4f            	clr	a
3026  00ff 8d320032      	callf	f_CHCM_Test_Value_Change
3029  0103 2025          	jra	L3302
3030  0105               L1302:
3031                     ; 125 		else if(CHCM_Data_Select_flag == ON){
3033  0105 720100020c    	btjf	_LGE_Test_Register,#0,L5302
3034                     ; 126 			if(CHCM_Data_Step < 1){ 
3036  010a 725d000f      	tnz	_CHCM_Data_Step
3037  010e 261a          	jrne	L3302
3038                     ; 127 				CHCM_Data_Step++;
3040  0110 725c000f      	inc	_CHCM_Data_Step
3041  0114 2014          	jra	L3302
3042  0116               L5302:
3043                     ; 130 			if(CHCM_Test_Pg == 0){
3045  0116 725d0010      	tnz	_CHCM_Test_Pg
3046  011a 260e          	jrne	L3302
3047                     ; 131 				CHCM_Test_Pg++;
3049  011c 725c0010      	inc	_CHCM_Test_Pg
3050                     ; 133 				if(CHCM_Test_Pg == 0){CHCM_Data_Step = 0;}
3052  0120 725d0010      	tnz	_CHCM_Test_Pg
3053  0124 2604          	jrne	L3302
3056  0126 725f000f      	clr	_CHCM_Data_Step
3057  012a               L3302:
3058                     ; 136 		DN_SW_flag = OFF;
3060  012a 72150000      	bres	_SW_Status,#2
3061  012e               L1202:
3062                     ; 141 	if(SET_SW_flag == ON){
3064  012e 7207000028    	btjf	_SW_Status,#3,L7402
3065                     ; 142 		if(CHCM_Test_Pg < 1){
3067  0133 725d0010      	tnz	_CHCM_Test_Pg
3068  0137 2622          	jrne	L7402
3069                     ; 144 			if(CHCM_Data_Select_flag == OFF){CHCM_Data_Select_flag= ON;}
3071  0139 7200000206    	btjt	_LGE_Test_Register,#0,L3502
3074  013e 72100002      	bset	_LGE_Test_Register,#0
3076  0142 2013          	jra	L5502
3077  0144               L3502:
3078                     ; 146 				if(CHCM_Data_Setting_flag == OFF){
3080  0144 7202000206    	btjt	_LGE_Test_Register,#1,L7502
3081                     ; 147 					CHCM_Data_Setting_flag = ON;
3083  0149 72120002      	bset	_LGE_Test_Register,#1
3085  014d 2008          	jra	L5502
3086  014f               L7502:
3087                     ; 149 					CHCM_Data_Setting_flag = OFF;
3089  014f 72130002      	bres	_LGE_Test_Register,#1
3090                     ; 150 					CHCM_Data_Select_flag = OFF;
3092  0153 72110002      	bres	_LGE_Test_Register,#0
3093  0157               L5502:
3094                     ; 153 			SET_SW_flag = OFF;
3096  0157 72170000      	bres	_SW_Status,#3
3097  015b               L7402:
3098                     ; 157 	if(ON_OFF_SW_flag == ON){
3100  015b 7201000013    	btjf	_SW_Status,#0,L3602
3101                     ; 158 		if(CHCM_Trans_flag == OFF){CHCM_Trans_flag = ON;}
3103  0160 7204000206    	btjt	_LGE_Test_Register,#2,L5602
3106  0165 72140002      	bset	_LGE_Test_Register,#2
3108  0169 2004          	jra	L7602
3109  016b               L5602:
3110                     ; 159 		else{ CHCM_Trans_flag = OFF;  }
3112  016b 72150002      	bres	_LGE_Test_Register,#2
3113  016f               L7602:
3114                     ; 161 		ON_OFF_SW_flag = OFF;
3116  016f 72110000      	bres	_SW_Status,#0
3117  0173               L3602:
3118                     ; 164 	if(OP_SW_flag == ON){
3120  0173 7209000013    	btjf	_SW_Status,#4,L1702
3121                     ; 166 		if(CHCM_Option_flag == OFF){CHCM_Option_flag = ON;}
3123  0178 7206000206    	btjt	_LGE_Test_Register,#3,L3702
3126  017d 72160002      	bset	_LGE_Test_Register,#3
3128  0181 2004          	jra	L5702
3129  0183               L3702:
3130                     ; 167 		else{CHCM_Option_flag = OFF;}
3132  0183 72170002      	bres	_LGE_Test_Register,#3
3133  0187               L5702:
3134                     ; 169 		OP_SW_flag = OFF;
3136  0187 72190000      	bres	_SW_Status,#4
3137  018b               L1702:
3138                     ; 173 	if(EN_SW_flag == ON){
3140  018b 720b000018    	btjf	_SW_Status,#5,L7702
3141                     ; 174 		Device_Select_Mode = ON;
3143  0190 72100000      	bset	_Mode_Select_Status,#0
3144                     ; 175 		LGE_CHCM_Flag = OFF;
3146  0194 72110000      	bres	_LIN_J2602_Select_Device,#0
3147                     ; 176 		CHCM_Trans_flag = OFF;
3149  0198 72150002      	bres	_LGE_Test_Register,#2
3150                     ; 178 		CHCM_Reset_Values();	
3152  019c 8d000000      	callf	f_CHCM_Reset_Values
3154                     ; 179 		LIN_EN = 0;
3156  01a0 7215500f      	bres	_PD_ODR,#2
3157                     ; 180 		EN_SW_flag = OFF;
3159  01a4 721b0000      	bres	_SW_Status,#5
3160  01a8               L7702:
3161                     ; 182 	return;
3164  01a8 87            	retf	
3190                     ; 186 void CHCM_Display_Handling(void)
3190                     ; 187 {
3191                     	switch	.text
3192  01a9               f_CHCM_Display_Handling:
3196                     ; 188 	switch(CHCM_Test_Pg){
3198  01a9 725d0010      	tnz	_CHCM_Test_Pg
3199  01ad 2630          	jrne	L7112
3202                     ; 190 		case 0:
3202                     ; 191 				strcpy(LCD_Dis_Data[0],"ENBLE:");
3204  01af ae004a        	ldw	x,#L1212
3205  01b2 89            	pushw	x
3206  01b3 ae0000        	ldw	x,#_LCD_Dis_Data
3207  01b6 8d000000      	callf	f_strcpy
3209  01ba 85            	popw	x
3210                     ; 192 				strcpy(LCD_Dis_Data[1],"OperH:");
3212  01bb ae0043        	ldw	x,#L3212
3213  01be 89            	pushw	x
3214  01bf ae0010        	ldw	x,#_LCD_Dis_Data+16
3215  01c2 8d000000      	callf	f_strcpy
3217  01c6 85            	popw	x
3218                     ; 193 				strcpy(LCD_Dis_Data[2],"H-CUR:");
3220  01c7 ae003c        	ldw	x,#L5212
3221  01ca 89            	pushw	x
3222  01cb ae0020        	ldw	x,#_LCD_Dis_Data+32
3223  01ce 8d000000      	callf	f_strcpy
3225  01d2 85            	popw	x
3226                     ; 194 				strcpy(LCD_Dis_Data[3],"Fult:  Fail:");
3228  01d3 ae002f        	ldw	x,#L7212
3229  01d6 89            	pushw	x
3230  01d7 ae0030        	ldw	x,#_LCD_Dis_Data+48
3231  01da 8d000000      	callf	f_strcpy
3233  01de 85            	popw	x
3234                     ; 195 				break;
3236                     ; 198 		default: break;
3238  01df               L7112:
3239                     ; 200 	return;
3242  01df 87            	retf	
3298                     ; 205 void CHCM_LCD_Display(void)
3298                     ; 206 {
3299                     	switch	.text
3300  01e0               f_CHCM_LCD_Display:
3302  01e0 5203          	subw	sp,#3
3303       00000003      OFST:	set	3
3306                     ; 210 	Set_LCD_Address((unsigned char)(LCD_Line[2]+14));
3308  01e2 c60002        	ld	a,_LCD_Line+2
3309  01e5 ab0e          	add	a,#14
3310  01e7 8d000000      	callf	f_Set_LCD_Address
3312                     ; 211 	Display_LCD_String("LG");
3314  01eb ae002c        	ldw	x,#L7412
3315  01ee 8d000000      	callf	f_Display_LCD_String
3317                     ; 213 	if(CHCM_Option_flag == ON){
3319  01f2 7207000242    	btjf	_LGE_Test_Register,#3,L1512
3320                     ; 214 		Set_LCD_Address(LCD_Line[0]);
3322  01f7 c60000        	ld	a,_LCD_Line
3323  01fa 8d000000      	callf	f_Set_LCD_Address
3325                     ; 215 		Display_LCD_String("*OPTION*");
3327  01fe ae0023        	ldw	x,#L3512
3328  0201 8d000000      	callf	f_Display_LCD_String
3330                     ; 216 		Set_LCD_Address(LCD_Line[1]);
3332  0205 c60001        	ld	a,_LCD_Line+1
3333  0208 8d000000      	callf	f_Set_LCD_Address
3335                     ; 217 		Display_LCD_String("H-Unit:");
3337  020c ae001b        	ldw	x,#L5512
3338  020f 8d000000      	callf	f_Display_LCD_String
3340                     ; 219 		Set_LCD_Address((unsigned char)(LCD_Line[1]+9));
3342  0213 c60001        	ld	a,_LCD_Line+1
3343  0216 ab09          	add	a,#9
3344  0218 8d000000      	callf	f_Set_LCD_Address
3346                     ; 220 		if(Blink_50){Display_LCD_String("     ");}
3348  021c 725d0000      	tnz	_Blink_50
3349  0220 2707          	jreq	L7512
3352  0222 ae0015        	ldw	x,#L1612
3355  0225 acc803c8      	jra	L1232
3356  0229               L7512:
3357                     ; 222 			Num_Display_LCD(CHCM_Dunit);
3359  0229 c6000e        	ld	a,_CHCM_Dunit
3360  022c 5f            	clrw	x
3361  022d 97            	ld	xl,a
3362  022e 8d000000      	callf	f_Num_Display_LCD
3364                     ; 223 			Display_LCD_String("%");
3366  0232 ae0013        	ldw	x,#L5612
3368                     ; 225 		return;
3370  0235 acc803c8      	jra	L1232
3371  0239               L1512:
3372                     ; 228 	if(CHCM_Test_Pg != CHCM_Test_Pre_Pg){ CHCM_Display_Handling();}
3374  0239 c60010        	ld	a,_CHCM_Test_Pg
3375  023c c10011        	cp	a,_CHCM_Test_Pre_Pg
3376  023f 2704          	jreq	L7612
3379  0241 8da901a9      	callf	f_CHCM_Display_Handling
3381  0245               L7612:
3382                     ; 229 	CHCM_Test_Pre_Pg = CHCM_Test_Pg ;
3384  0245 5500100011    	mov	_CHCM_Test_Pre_Pg,_CHCM_Test_Pg
3385                     ; 232 	if(CHCM_Test_Pg == 0){			//page 1
3387  024a 725d0010      	tnz	_CHCM_Test_Pg
3388  024e 2704aca603a6  	jrne	L1712
3389                     ; 233 		for(i=0; i<4; i++){
3391  0254 4f            	clr	a
3392  0255 6b03          	ld	(OFST+0,sp),a
3393  0257               L3712:
3394                     ; 234 			Set_LCD_Address(LCD_Line[i]);
3396  0257 5f            	clrw	x
3397  0258 97            	ld	xl,a
3398  0259 d60000        	ld	a,(_LCD_Line,x)
3399  025c 8d000000      	callf	f_Set_LCD_Address
3401                     ; 236 			if((CHCM_Data_Select_flag == ON) && (CHCM_Data_Setting_flag == OFF) && (i == CHCM_Data_Step)){
3403  0260 7201000217    	btjf	_LGE_Test_Register,#0,L1022
3405  0265 7202000212    	btjt	_LGE_Test_Register,#1,L1022
3407  026a 7b03          	ld	a,(OFST+0,sp)
3408  026c c1000f        	cp	a,_CHCM_Data_Step
3409  026f 260b          	jrne	L1022
3410                     ; 237 				if(Blink_50){Display_LCD_String("     ");}
3412  0271 725d0000      	tnz	_Blink_50
3413  0275 2707          	jreq	LC001
3416  0277 ae0015        	ldw	x,#L1612
3419  027a 2009          	jra	L7022
3420                     ; 238 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3422  027c               L1022:
3423                     ; 239 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3425  027c 7b03          	ld	a,(OFST+0,sp)
3426  027e               LC001:
3428  027e 97            	ld	xl,a
3429  027f a610          	ld	a,#16
3430  0281 42            	mul	x,a
3431  0282 1c0000        	addw	x,#_LCD_Dis_Data
3433  0285               L7022:
3434  0285 8d000000      	callf	f_Display_LCD_String
3435                     ; 241 			Set_LCD_Address((unsigned char)(LCD_Line[i] + 7));
3437  0289 7b03          	ld	a,(OFST+0,sp)
3438  028b 5f            	clrw	x
3439  028c 97            	ld	xl,a
3440  028d d60000        	ld	a,(_LCD_Line,x)
3441  0290 ab07          	add	a,#7
3442  0292 8d000000      	callf	f_Set_LCD_Address
3444                     ; 243 			if(i==0){
3446  0296 7b03          	ld	a,(OFST+0,sp)
3447  0298 2627          	jrne	L1122
3448                     ; 245 				if((CHCM_Data_Setting_flag == ON) && (i == CHCM_Data_Step)){
3450  029a 7203000219    	btjf	_LGE_Test_Register,#1,L3122
3452  029f c1000f        	cp	a,_CHCM_Data_Step
3453  02a2 2614          	jrne	L3122
3454                     ; 246 					if(Blink_50){Display_LCD_String("     ");}
3456  02a4 725d0000      	tnz	_Blink_50
3457  02a8 2705          	jreq	L5122
3460  02aa ae0015        	ldw	x,#L1612
3463  02ad 204c          	jpf	LC004
3464  02af               L5122:
3465                     ; 248 						Num_Display_LCD(CHCM_ENABLE);
3467  02af c60008        	ld	a,_CHCM_ENABLE
3468  02b2 5f            	clrw	x
3469  02b3 97            	ld	xl,a
3471  02b4 ac890389      	jpf	LC003
3472  02b8               L3122:
3473                     ; 251 					Num_Display_LCD(CHCM_ENABLE);
3475  02b8 c60008        	ld	a,_CHCM_ENABLE
3476  02bb 5f            	clrw	x
3477  02bc 97            	ld	xl,a
3479  02bd ac890389      	jpf	LC003
3480  02c1               L1122:
3481                     ; 255 			else if(i==1){
3483  02c1 a101          	cp	a,#1
3484  02c3 2625          	jrne	L5222
3485                     ; 256 				if((CHCM_Data_Setting_flag == ON) && (i == CHCM_Data_Step)){ 
3487  02c5 720300021e    	btjf	_LGE_Test_Register,#1,L7222
3489  02ca c1000f        	cp	a,_CHCM_Data_Step
3490  02cd 260b          	jrne	L1322
3491                     ; 257 					if(Blink_50){Display_LCD_String("     ");}
3493  02cf 725d0000      	tnz	_Blink_50
3494  02d3 2705          	jreq	L1322
3497  02d5 ae0015        	ldw	x,#L1612
3500  02d8 2021          	jpf	LC004
3501  02da               L1322:
3502                     ; 259 						Num_Display_LCD(CHCM_OperHeat);
3505                     ; 260 						Display_LCD_String("%");
3508  02da c60009        	ld	a,_CHCM_OperHeat
3509  02dd 5f            	clrw	x
3510  02de 97            	ld	xl,a
3511  02df 8d000000      	callf	f_Num_Display_LCD
3513  02e3 ae0013        	ldw	x,#L5612
3515  02e6 2013          	jpf	LC004
3516  02e8               L7222:
3517                     ; 264 					Num_Display_LCD(CHCM_OperHeat);
3519                     ; 265 					Display_LCD_String("%");
3521  02e8 20f0          	jpf	L1322
3522  02ea               L5222:
3523                     ; 269 			else if(i==2){
3525  02ea a102          	cp	a,#2
3526  02ec 263e          	jrne	L1422
3527                     ; 270 				if((CHCM_Rx_Over_Time == ON) ||(CHCM_Trans_flag == OFF)){ Display_LCD_String("N");}
3529  02ee 720c000105    	btjt	_LGE_Lin_Com_Register,#6,L5422
3531  02f3 720400020b    	btjt	_LGE_Test_Register,#2,L3422
3532  02f8               L5422:
3536  02f8 ae0011        	ldw	x,#L7422
3537  02fb               LC004:
3538  02fb 8d000000      	callf	f_Display_LCD_String
3541  02ff ac8d038d      	jra	L3222
3542  0303               L3422:
3543                     ; 272 					h_cur_buffer = (unsigned int)(CHCM_HV_CUR) * (unsigned int)(5);
3545  0303 c6000a        	ld	a,_CHCM_HV_CUR
3546  0306 5f            	clrw	x
3547  0307 97            	ld	xl,a
3548  0308 90ae0005      	ldw	y,#5
3549  030c 8d000000      	callf	d_imul
3551  0310 1f01          	ldw	(OFST-2,sp),x
3552                     ; 273 					Num_Display_LCD(h_cur_buffer / 10);
3554  0312 90ae000a      	ldw	y,#10
3555  0316 65            	divw	x,y
3556  0317 8d000000      	callf	f_Num_Display_LCD
3558                     ; 274 					Display_LCD_String(".");
3560  031b ae000f        	ldw	x,#L3522
3561  031e 8d000000      	callf	f_Display_LCD_String
3563                     ; 275 					Num_Display_LCD(h_cur_buffer % 10);
3565  0322 1e01          	ldw	x,(OFST-2,sp)
3566  0324 90ae000a      	ldw	y,#10
3567  0328 65            	divw	x,y
3568  0329 93            	ldw	x,y
3570  032a 205d          	jpf	LC003
3571  032c               L1422:
3572                     ; 277 			}else if(i==3){
3574  032c a103          	cp	a,#3
3575  032e 265d          	jrne	L3222
3576                     ; 278 				Set_LCD_Address((unsigned char)(LCD_Line[i] + 5));
3578  0330 5f            	clrw	x
3579  0331 97            	ld	xl,a
3580  0332 d60000        	ld	a,(_LCD_Line,x)
3581  0335 ab05          	add	a,#5
3582  0337 8d000000      	callf	f_Set_LCD_Address
3584                     ; 279 				if((CHCM_Rx_Over_Time == ON) ||(CHCM_Trans_flag == OFF)){ Display_LCD_String("N");}
3586  033b 720c000105    	btjt	_LGE_Lin_Com_Register,#6,L3622
3588  0340 7204000220    	btjt	_LGE_Test_Register,#2,L1622
3589  0345               L3622:
3592  0345 ae0011        	ldw	x,#L7422
3593  0348 8d000000      	callf	f_Display_LCD_String
3596  034c               L5622:
3597                     ; 284 				Set_LCD_Address((unsigned char)(LCD_Line[i] + 12));
3599  034c 7b03          	ld	a,(OFST+0,sp)
3600  034e 5f            	clrw	x
3601  034f 97            	ld	xl,a
3602  0350 d60000        	ld	a,(_LCD_Line,x)
3603  0353 ab0c          	add	a,#12
3604  0355 8d000000      	callf	f_Set_LCD_Address
3606                     ; 285 				if((CHCM_Rx_Over_Time == ON) ||(CHCM_Trans_flag == OFF)){ Display_LCD_String("N");}
3608  0359 720c00011a    	btjt	_LGE_Lin_Com_Register,#6,L5722
3610  035e 7204000219    	btjt	_LGE_Test_Register,#2,L3722
3611  0363 2093          	jra	L5422
3612  0365               L1622:
3613                     ; 281 					if(CHCM_Operation_Status == 0x02){Num_Display_LCD(1);}
3615  0365 c6000c        	ld	a,_CHCM_Operation_Status
3616  0368 a102          	cp	a,#2
3617  036a 2605          	jrne	L7622
3620  036c ae0001        	ldw	x,#1
3623  036f 2001          	jpf	LC002
3624  0371               L7622:
3625                     ; 282 					else{Num_Display_LCD(0);}
3627  0371 5f            	clrw	x
3628  0372               LC002:
3629  0372 8d000000      	callf	f_Num_Display_LCD
3631  0376 20d4          	jra	L5622
3632  0378               L5722:
3633                     ; 285 				if((CHCM_Rx_Over_Time == ON) ||(CHCM_Trans_flag == OFF)){ Display_LCD_String("N");}
3636  0378 acf802f8      	jpf	L5422
3637  037c               L3722:
3638                     ; 287 					if(CHCM_Operation_Status == 0x03){Num_Display_LCD(1);}
3640  037c c6000c        	ld	a,_CHCM_Operation_Status
3641  037f a103          	cp	a,#3
3642  0381 2605          	jrne	L1032
3645  0383 ae0001        	ldw	x,#1
3648  0386 2001          	jpf	LC003
3649  0388               L1032:
3650                     ; 288 					else{Num_Display_LCD(0);}
3652  0388 5f            	clrw	x
3653  0389               LC003:
3654  0389 8d000000      	callf	f_Num_Display_LCD
3656  038d               L3222:
3657                     ; 233 		for(i=0; i<4; i++){
3659  038d 0c03          	inc	(OFST+0,sp)
3662  038f 7b03          	ld	a,(OFST+0,sp)
3663  0391 a104          	cp	a,#4
3664  0393 2404ac570257  	jrult	L3712
3665                     ; 293 		Set_LCD_Address((unsigned char)(0xD0+14));
3667  0399 a6de          	ld	a,#222
3668  039b 8d000000      	callf	f_Set_LCD_Address
3670                     ; 294 		Display_LCD_String("TX");
3672  039f ae000c        	ldw	x,#L5032
3673  03a2 8d000000      	callf	f_Display_LCD_String
3675  03a6               L1712:
3676                     ; 299 	if((CHCM_Trans_flag == ON)){
3678  03a6 a60d          	ld	a,#13
3679  03a8 7205000214    	btjf	_LGE_Test_Register,#2,L7032
3680                     ; 300 		Set_LCD_Address((unsigned char)(0x00+13));
3682  03ad 8d000000      	callf	f_Set_LCD_Address
3684                     ; 301 		if(Blink_30){Display_LCD_String("COM");}
3686  03b1 725d0000      	tnz	_Blink_30
3687  03b5 2705          	jreq	L1132
3690  03b7 ae0008        	ldw	x,#L3132
3693  03ba 200c          	jra	L1232
3694  03bc               L1132:
3695                     ; 302 		else{Display_LCD_String("   ");}
3697  03bc ae0004        	ldw	x,#L7132
3699  03bf 2007          	jra	L1232
3700  03c1               L7032:
3701                     ; 305 		Set_LCD_Address((unsigned char)(0x00+13));
3703  03c1 8d000000      	callf	f_Set_LCD_Address
3705                     ; 306 		Display_LCD_String("NON");
3707  03c5 ae0000        	ldw	x,#L3232
3709  03c8               L1232:
3710  03c8 8d000000      	callf	f_Display_LCD_String
3711                     ; 309 	return;
3714  03cc 5b03          	addw	sp,#3
3715  03ce 87            	retf	
3786                     ; 340 unsigned char CHCM_Extend_Checksum(unsigned char id,unsigned char length ,unsigned char *Data)
3786                     ; 341 {
3787                     	switch	.text
3788  03cf               f_CHCM_Extend_Checksum:
3790  03cf 89            	pushw	x
3791  03d0 5204          	subw	sp,#4
3792       00000004      OFST:	set	4
3795                     ; 343 	unsigned char Checksum = 0;
3797                     ; 344 	unsigned int Check_buff= 0;
3799                     ; 346 	Checksum = LIN_Measure_PID_Parity(id);
3801  03d2 9e            	ld	a,xh
3802  03d3 8d000000      	callf	f_LIN_Measure_PID_Parity
3804  03d7 6b02          	ld	(OFST-2,sp),a
3805                     ; 348 	for(Offset = 0; Offset <length; Offset++){
3807  03d9 0f01          	clr	(OFST-3,sp)
3809  03db 2020          	jra	L1632
3810  03dd               L5532:
3811                     ; 350 		Check_buff = Checksum +*(Data + Offset);
3813  03dd 7b0a          	ld	a,(OFST+6,sp)
3814  03df 97            	ld	xl,a
3815  03e0 7b0b          	ld	a,(OFST+7,sp)
3816  03e2 1b01          	add	a,(OFST-3,sp)
3817  03e4 2401          	jrnc	L071
3818  03e6 5c            	incw	x
3819  03e7               L071:
3820  03e7 02            	rlwa	x,a
3821  03e8 f6            	ld	a,(x)
3822  03e9 5f            	clrw	x
3823  03ea 1b02          	add	a,(OFST-2,sp)
3824  03ec 59            	rlcw	x
3825  03ed 02            	rlwa	x,a
3826  03ee 1f03          	ldw	(OFST-1,sp),x
3827                     ; 352 		if(Check_buff > 0xFF){  
3829  03f0 a30100        	cpw	x,#256
3830  03f3 7b04          	ld	a,(OFST+0,sp)
3831  03f5 2502          	jrult	L5632
3832                     ; 353 			Checksum = (unsigned char)(Check_buff);
3834                     ; 354 			Checksum += (unsigned char)(Check_buff>>8);
3836  03f7 1b03          	add	a,(OFST-1,sp)
3838  03f9               L5632:
3839                     ; 356 		else{ Checksum = (unsigned char)(Check_buff); }
3841  03f9 6b02          	ld	(OFST-2,sp),a
3842                     ; 357 		Check_buff = 0;
3844                     ; 348 	for(Offset = 0; Offset <length; Offset++){
3846  03fb 0c01          	inc	(OFST-3,sp)
3847  03fd               L1632:
3850  03fd 7b01          	ld	a,(OFST-3,sp)
3851  03ff 1106          	cp	a,(OFST+2,sp)
3852  0401 25da          	jrult	L5532
3853                     ; 359 	Checksum = (unsigned char)(0xFF - Checksum);
3855  0403 a6ff          	ld	a,#255
3856  0405 1002          	sub	a,(OFST-2,sp)
3857                     ; 361 	return (unsigned char)(Checksum);
3861  0407 5b06          	addw	sp,#6
3862  0409 87            	retf	
3889                     ; 365 void CHCM_Tx_Data_Handling(void)
3889                     ; 366 {
3890                     	switch	.text
3891  040a               f_CHCM_Tx_Data_Handling:
3895                     ; 367 	CHCM_TxLin_Data[0] = (unsigned char)(0x7F & CHCM_OperHeat);
3897  040a c60009        	ld	a,_CHCM_OperHeat
3898  040d a47f          	and	a,#127
3899  040f c70012        	ld	_CHCM_TxLin_Data,a
3900                     ; 369 	CHCM_TxLin_Data[1] = (unsigned char)(0x01 & CHCM_ENABLE);
3902  0412 c60008        	ld	a,_CHCM_ENABLE
3903  0415 a401          	and	a,#1
3904  0417 c70013        	ld	_CHCM_TxLin_Data+1,a
3905                     ; 370 	CHCM_TxLin_Data[2] = CHCM_Extend_Checksum(0x14,2,CHCM_TxLin_Data);
3907  041a ae0012        	ldw	x,#_CHCM_TxLin_Data
3908  041d 89            	pushw	x
3909  041e ae0002        	ldw	x,#2
3910  0421 a614          	ld	a,#20
3911  0423 95            	ld	xh,a
3912  0424 8dcf03cf      	callf	f_CHCM_Extend_Checksum
3914  0428 c70014        	ld	_CHCM_TxLin_Data+2,a
3915  042b 85            	popw	x
3916                     ; 371 	return;
3919  042c 87            	retf	
3957                     ; 374 void CHCM_Transmit_Tx_DATA(void)
3957                     ; 375 {
3958                     	switch	.text
3959  042d               f_CHCM_Transmit_Tx_DATA:
3961  042d 88            	push	a
3962       00000001      OFST:	set	1
3965                     ; 378 	if(CHCM_BCM_Trans_Header == OFF){return;}
3967  042e 7200000102    	btjt	_LGE_Lin_Com_Register,#0,L5142
3971  0433 84            	pop	a
3972  0434 87            	retf	
3973  0435               L5142:
3974                     ; 381 		if(CHCM_Trans_ID == ON){
3976  0435 7203000124    	btjf	_LGE_Lin_Com_Register,#1,L1242
3977                     ; 382 			CHCM_SHCM_Rep_flag = OFF;
3979  043a 72150001      	bres	_LGE_Lin_Com_Register,#2
3980                     ; 383 			CHCM_Tx_Data_Handling();
3982  043e 8d0a040a      	callf	f_CHCM_Tx_Data_Handling
3984                     ; 384 			LIN_Header_Transmission(0x14);
3986  0442 a614          	ld	a,#20
3987  0444 8d000000      	callf	f_LIN_Header_Transmission
3989                     ; 386 			for(Index = 0; Index<=2; Index++){	
3991  0448 4f            	clr	a
3992  0449 6b01          	ld	(OFST+0,sp),a
3993  044b               L3242:
3994                     ; 388 				LIN_Transmission_Data(CHCM_TxLin_Data[Index]);
3996  044b 5f            	clrw	x
3997  044c 97            	ld	xl,a
3998  044d d60012        	ld	a,(_CHCM_TxLin_Data,x)
3999  0450 8d000000      	callf	f_LIN_Transmission_Data
4001                     ; 386 			for(Index = 0; Index<=2; Index++){	
4003  0454 0c01          	inc	(OFST+0,sp)
4006  0456 7b01          	ld	a,(OFST+0,sp)
4007  0458 a103          	cp	a,#3
4008  045a 25ef          	jrult	L3242
4010  045c 200e          	jra	L1342
4011  045e               L1242:
4012                     ; 392 			LIN_Header_Transmission(0x15);
4014  045e a615          	ld	a,#21
4015  0460 8d000000      	callf	f_LIN_Header_Transmission
4017                     ; 393 			Lin_Rx_Cnt = 0;
4019  0464 725f0000      	clr	_Lin_Rx_Cnt
4020                     ; 394 			CHCM_SHCM_Rep_flag = ON;
4022  0468 72140001      	bset	_LGE_Lin_Com_Register,#2
4023  046c               L1342:
4024                     ; 396 		CHCM_BCM_Trans_Header = OFF;
4026  046c 72110001      	bres	_LGE_Lin_Com_Register,#0
4027                     ; 398 	return;
4030  0470 84            	pop	a
4031  0471 87            	retf	
4070                     ; 404 void CHCM_Rx_Data_Handling(void)
4070                     ; 405 {
4071                     	switch	.text
4072  0472               f_CHCM_Rx_Data_Handling:
4074  0472 88            	push	a
4075       00000001      OFST:	set	1
4078                     ; 408 	if(CHCM_Response_Complete == ON){
4080  0473 7207000144    	btjf	_LGE_Lin_Com_Register,#3,L7442
4081                     ; 409 		buff = LIN_Measure_PID_Parity(0x15);
4083  0478 a615          	ld	a,#21
4084  047a 8d000000      	callf	f_LIN_Measure_PID_Parity
4086  047e 6b01          	ld	(OFST+0,sp),a
4087                     ; 410 		buff = CHCM_Extend_Checksum(buff,4,CHCM_RxLin_Data);
4089  0480 ae001b        	ldw	x,#_CHCM_RxLin_Data
4090  0483 89            	pushw	x
4091  0484 ae0004        	ldw	x,#4
4092  0487 7b03          	ld	a,(OFST+2,sp)
4093  0489 95            	ld	xh,a
4094  048a 8dcf03cf      	callf	f_CHCM_Extend_Checksum
4096  048e 85            	popw	x
4097  048f 6b01          	ld	(OFST+0,sp),a
4098                     ; 412 		if(buff == CHCM_RxLin_Data[4]){
4100  0491 c6001f        	ld	a,_CHCM_RxLin_Data+4
4101  0494 1101          	cp	a,(OFST+0,sp)
4102  0496 2618          	jrne	L1542
4103                     ; 414 			CHCM_Operation_Status =  (unsigned char)((CHCM_RxLin_Data[2] & 0x06) >> 1);
4105  0498 c6001d        	ld	a,_CHCM_RxLin_Data+2
4106  049b a406          	and	a,#6
4107  049d 44            	srl	a
4108  049e c7000c        	ld	_CHCM_Operation_Status,a
4109                     ; 415 			CHCM_HV_CUR = CHCM_RxLin_Data[3];
4111  04a1 55001e000a    	mov	_CHCM_HV_CUR,_CHCM_RxLin_Data+3
4112                     ; 417 			CHCM_Rx_Over_Time = OFF;
4114  04a6 721d0001      	bres	_LGE_Lin_Com_Register,#6
4115                     ; 418 			CHCM_Recieve_Cnt = 0;
4117  04aa 725f000d      	clr	_CHCM_Recieve_Cnt
4119  04ae 2008          	jra	L3542
4120  04b0               L1542:
4121                     ; 421 			CHCM_Operation_Status = 0;
4123  04b0 725f000c      	clr	_CHCM_Operation_Status
4124                     ; 422 			CHCM_HV_CUR = 0;
4126  04b4 725f000a      	clr	_CHCM_HV_CUR
4127  04b8               L3542:
4128                     ; 425 		CHCM_Response_Complete = OFF;
4130  04b8 72170001      	bres	_LGE_Lin_Com_Register,#3
4131  04bc               L7442:
4132                     ; 428 	return;
4135  04bc 84            	pop	a
4136  04bd 87            	retf	
4162                     ; 435 void CHCM_ComTest_Routine(void)
4162                     ; 436 {
4163                     	switch	.text
4164  04be               f_CHCM_ComTest_Routine:
4168                     ; 437 	if(CHCM_Trans_flag == OFF){return;}
4170  04be 7204000201    	btjt	_LGE_Test_Register,#2,L5642
4174  04c3 87            	retf	
4175  04c4               L5642:
4176                     ; 440 		CHCM_Rx_Data_Handling();
4178  04c4 8d720472      	callf	f_CHCM_Rx_Data_Handling
4180                     ; 441 		CHCM_Transmit_Tx_DATA();
4183                     ; 443 	return;
4186  04c8 ac2d042d      	jpf	f_CHCM_Transmit_Tx_DATA
4213                     ; 447 void LGE_CHCM_Test_Routine(void)
4213                     ; 448 {
4214                     	switch	.text
4215  04cc               f_LGE_CHCM_Test_Routine:
4219                     ; 449 	if(LGE_CHCM_Flag == ON){
4221  04cc 720100000c    	btjf	_LIN_J2602_Select_Device,#0,L1052
4222                     ; 450 		CHCM_LCD_Display();
4224  04d1 8de001e0      	callf	f_CHCM_LCD_Display
4226                     ; 451 		CHCM_Switch_Control();
4228  04d5 8d950095      	callf	f_CHCM_Switch_Control
4230                     ; 452 		CHCM_ComTest_Routine();
4232  04d9 8dbe04be      	callf	f_CHCM_ComTest_Routine
4234  04dd               L1052:
4235                     ; 456 	return ;
4238  04dd 87            	retf	
4401                     	xdef	f_CHCM_ComTest_Routine
4402                     	xdef	f_CHCM_Rx_Data_Handling
4403                     	xdef	f_CHCM_Transmit_Tx_DATA
4404                     	xdef	f_CHCM_Tx_Data_Handling
4405                     	xdef	f_CHCM_Extend_Checksum
4406                     	xdef	f_CHCM_LCD_Display
4407                     	xdef	f_CHCM_Display_Handling
4408                     	xdef	f_CHCM_Switch_Control
4409                     	xdef	f_CHCM_Test_Value_Change
4410                     	xdef	_CHCM_TxLin_Data
4411                     	xdef	_CHCM_Test_Pre_Pg
4412                     	xdef	_CHCM_Test_Pg
4413                     	xdef	_CHCM_Data_Step
4414                     	xdef	_CHCM_Dunit
4415                     	xdef	_CHCM_Operation_Status
4416                     	xdef	_CHCM_Fault
4417                     	xdef	_CHCM_HV_CUR
4418                     	switch	.bss
4419  0000               _CHCM_Heat_Duty:
4420  0000 00            	ds.b	1
4421                     	xdef	_CHCM_Heat_Duty
4422                     	xdef	_CHCM_OperHeat
4423                     	xdef	_CHCM_ENABLE
4424                     	xdef	_CHCM_Oper_Data
4425                     	xref	f_strcpy
4426                     	xdef	_CHCM_Recieve_Cnt
4427                     	xdef	_CHCM_RxLin_Data
4428  0001               _LGE_Lin_Com_Register:
4429  0001 00            	ds.b	1
4430                     	xdef	_LGE_Lin_Com_Register
4431  0002               _LGE_Test_Register:
4432  0002 00            	ds.b	1
4433                     	xdef	_LGE_Test_Register
4434                     	xdef	f_CHCM_Reset_Values
4435                     	xdef	f_LGE_CHCM_Test_Routine
4436                     	xref	_Lin_Rx_Cnt
4437                     	xref	f_LIN_Transmission_Data
4438                     	xref	f_LIN_Header_Transmission
4439                     	xref	f_LIN_Measure_PID_Parity
4440                     	xref	_LCD_Dis_Data
4441                     	xref	_LCD_Line
4442                     	xref	f_Num_Display_LCD
4443                     	xref	f_Display_LCD_String
4444                     	xref	f_Set_LCD_Address
4445                     	xref	_Blink_30
4446                     	xref	_Blink_50
4447                     	xref	_SW_Status
4448                     	xref	_LIN_J2602_Select_Device
4449                     	xref	_Mode_Select_Status
4450                     .const:	section	.text
4451  0000               L3232:
4452  0000 4e4f4e00      	dc.b	"NON",0
4453  0004               L7132:
4454  0004 20202000      	dc.b	"   ",0
4455  0008               L3132:
4456  0008 434f4d00      	dc.b	"COM",0
4457  000c               L5032:
4458  000c 545800        	dc.b	"TX",0
4459  000f               L3522:
4460  000f 2e00          	dc.b	".",0
4461  0011               L7422:
4462  0011 4e00          	dc.b	"N",0
4463  0013               L5612:
4464  0013 2500          	dc.b	"%",0
4465  0015               L1612:
4466  0015 202020202000  	dc.b	"     ",0
4467  001b               L5512:
4468  001b 482d556e6974  	dc.b	"H-Unit:",0
4469  0023               L3512:
4470  0023 2a4f5054494f  	dc.b	"*OPTION*",0
4471  002c               L7412:
4472  002c 4c4700        	dc.b	"LG",0
4473  002f               L7212:
4474  002f 46756c743a20  	dc.b	"Fult:  Fail:",0
4475  003c               L5212:
4476  003c 482d4355523a  	dc.b	"H-CUR:",0
4477  0043               L3212:
4478  0043 4f706572483a  	dc.b	"OperH:",0
4479  004a               L1212:
4480  004a 454e424c453a  	dc.b	"ENBLE:",0
4481                     	xref.b	c_x
4501                     	xref	d_imul
4502                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _FIAT_Oper_Data:
2660  0000 0000          	dc.w	0
2661  0002 000000000000  	ds.b	6
2662  0008               _FIAT_AEH_VALUE:
2663  0008 00            	dc.b	0
2664  0009 000000000000  	ds.b	7
2665  0010               _HV_Batt_Value:
2666  0010 ffff          	dc.w	-1
2667  0012               _OperHeat:
2668  0012 ff            	dc.b	255
2669  0013               _AEH_Curr:
2670  0013 ff            	dc.b	255
2671  0014               _TempSenPCB:
2672  0014 ff            	dc.b	255
2673  0015               _TempSenCore:
2674  0015 ff            	dc.b	255
2675  0016               _FIAT_Fault:
2676  0016 03            	dc.b	3
2677  0017               _FIAT_Data_Step:
2678  0017 00            	dc.b	0
2679  0018               _FIAT_Test_Pg:
2680  0018 00            	dc.b	0
2681  0019               _FIAT_Test_Pre_Pg:
2682  0019 08            	dc.b	8
2683  001a               _FIAT_TxLin_Data:
2684  001a 00            	dc.b	0
2685  001b 000000000000  	ds.b	8
2686  0023               _FIAT_RxLin_Data:
2687  0023 00            	dc.b	0
2688  0024 000000000000  	ds.b	8
2689  002c               _SD_TxLin_Data1:
2690  002c 00            	dc.b	0
2691  002d 000000000000  	ds.b	8
2692  0035               _SD_TxLin_Data2:
2693  0035 00            	dc.b	0
2694  0036 000000000000  	ds.b	8
2695  003e               _D_Req:
2696  003e 00            	dc.b	0
2697  003f               _PTC_Req_Per:
2698  003f 0000          	dc.w	0
2699  0041               _PTC_Req_Pwr:
2700  0041 0000          	dc.w	0
2701  0043               _PTC_Lim_Pwr:
2702  0043 0000          	dc.w	0
2703  0045               _FIAT_Dunit:
2704  0045 0001          	dc.w	1
2705  0047               _PTC_Pwr:
2706  0047 0000          	dc.w	0
2707  0049               _PTC_Limit:
2708  0049 00            	dc.b	0
2709  004a               _POW_Save:
2710  004a 00            	dc.b	0
2711  004b               _PTC_State:
2712  004b 00            	dc.b	0
2713  004c               _PTC_cur:
2714  004c 00            	dc.b	0
2715  004d               _uc_Rx1_Lin_Data:
2716  004d 00            	dc.b	0
2717  004e 0000          	ds.b	2
2718  0050               _uc_Rx2_Lin_Data:
2719  0050 00            	dc.b	0
2720  0051 000000000000  	ds.b	7
2721  0058               _uc_Rx3_Lin_Data:
2722  0058 00            	dc.b	0
2723  0059 000000000000  	ds.b	7
2724  0060               _uc_Duty_Unit:
2725  0060 01            	dc.b	1
2767                     ; 75 void FIAT_Reset_Values(void)
2767                     ; 76 {
2768                     	switch	.text
2769  0000               f_FIAT_Reset_Values:
2773                     ; 77 	FIAT_Oper_Data[0] = 0;
2775  0000 5f            	clrw	x
2776  0001 cf0000        	ldw	_FIAT_Oper_Data,x
2777                     ; 78 	FIAT_Oper_Data[1] = 0;
2779  0004 cf0002        	ldw	_FIAT_Oper_Data+2,x
2780                     ; 79 	FIAT_Oper_Data[2] = 0;
2782  0007 cf0004        	ldw	_FIAT_Oper_Data+4,x
2783                     ; 80 	FIAT_Oper_Data[3] = 0;
2785  000a cf0006        	ldw	_FIAT_Oper_Data+6,x
2786                     ; 82 	FIAT_AEH_VALUE[0] = 0;
2788  000d 725f0008      	clr	_FIAT_AEH_VALUE
2789                     ; 83 	FIAT_AEH_VALUE[1] = 0;
2791  0011 725f0009      	clr	_FIAT_AEH_VALUE+1
2792                     ; 84 	FIAT_AEH_VALUE[2] = 0;
2794  0015 725f000a      	clr	_FIAT_AEH_VALUE+2
2795                     ; 85 	FIAT_AEH_VALUE[3] = 0;
2797  0019 725f000b      	clr	_FIAT_AEH_VALUE+3
2798                     ; 86 	FIAT_AEH_VALUE[4] = 0;
2800  001d 725f000c      	clr	_FIAT_AEH_VALUE+4
2801                     ; 87 	FIAT_AEH_VALUE[5] = 0;
2803  0021 725f000d      	clr	_FIAT_AEH_VALUE+5
2804                     ; 88 	FIAT_AEH_VALUE[6] = 0;
2806  0025 725f000e      	clr	_FIAT_AEH_VALUE+6
2807                     ; 89 	FIAT_AEH_VALUE[7] = 0;
2809  0029 725f000f      	clr	_FIAT_AEH_VALUE+7
2810                     ; 91 	HV_Batt_Value=0xFFFF;
2812  002d 5a            	decw	x
2813  002e cf0010        	ldw	_HV_Batt_Value,x
2814                     ; 92 	OperHeat = 0xFF;
2816  0031 35ff0012      	mov	_OperHeat,#255
2817                     ; 93 	AEH_Curr = 0xFF;
2819  0035 35ff0013      	mov	_AEH_Curr,#255
2820                     ; 94 	TempSenPCB = 0xFF;
2822  0039 35ff0014      	mov	_TempSenPCB,#255
2823                     ; 95 	TempSenCore = 0xFF;
2825  003d 35ff0015      	mov	_TempSenCore,#255
2826                     ; 96 	PTC_Pwr = 0;
2828  0041 5f            	clrw	x
2829  0042 cf0047        	ldw	_PTC_Pwr,x
2830                     ; 99 	PTC_Pwr = 0;
2832  0045 cf0047        	ldw	_PTC_Pwr,x
2833                     ; 100 	PTC_State = 0;
2835  0048 725f004b      	clr	_PTC_State
2836                     ; 101 	PTC_Limit = 0;
2838  004c 725f0049      	clr	_PTC_Limit
2839                     ; 102 	POW_Save = 0;
2841  0050 725f004a      	clr	_POW_Save
2842                     ; 103 	FIAT_Dunit = 1;
2844  0054 5c            	incw	x
2845  0055 cf0045        	ldw	_FIAT_Dunit,x
2846                     ; 105 	return;
2849  0058 87            	retf	
2896                     ; 110 void FIAT_Test_Value_Change(unsigned char ST)
2896                     ; 111 {
2897                     	switch	.text
2898  0059               f_FIAT_Test_Value_Change:
2900  0059 88            	push	a
2901  005a 88            	push	a
2902       00000001      OFST:	set	1
2905                     ; 115 	if(ST == 1){	
2907  005b 4a            	dec	a
2908  005c 2704ac210121  	jrne	L7371
2909                     ; 116 		if(FIAT_Data_Step == (U8)(0)){	// FET1_Switching_Duty_Up
2911  0062 725d0017      	tnz	_FIAT_Data_Step
2912  0066 2617          	jrne	L1471
2913                     ; 117 			if(ui_FET1_Duty < (U16)(1000)){ ui_FET1_Duty++; }
2915  0068 ce0007        	ldw	x,_ui_FET1_Duty
2916  006b a303e8        	cpw	x,#1000
2917  006e 2504acca01ca  	jruge	L7102
2920  0074 ce0007        	ldw	x,_ui_FET1_Duty
2921  0077 5c            	incw	x
2922  0078 cf0007        	ldw	_ui_FET1_Duty,x
2923  007b acca01ca      	jra	L7102
2924  007f               L1471:
2925                     ; 119 		else if(FIAT_Data_Step == (U8)(1)){	// FET2_Switching_Duty_Up
2927  007f c60017        	ld	a,_FIAT_Data_Step
2928  0082 4a            	dec	a
2929  0083 2613          	jrne	L7471
2930                     ; 120 			if(ui_FET2_Duty < (U16)(1000)){ ui_FET2_Duty++; }
2932  0085 ce0005        	ldw	x,_ui_FET2_Duty
2933  0088 a303e8        	cpw	x,#1000
2934  008b 24ee          	jruge	L7102
2937  008d ce0005        	ldw	x,_ui_FET2_Duty
2938  0090 5c            	incw	x
2939  0091 cf0005        	ldw	_ui_FET2_Duty,x
2940  0094 acca01ca      	jra	L7102
2941  0098               L7471:
2942                     ; 122 		else if(FIAT_Data_Step == (U8)(2)){	// FET3_Switching_Duty_Up
2944  0098 c60017        	ld	a,_FIAT_Data_Step
2945  009b a102          	cp	a,#2
2946  009d 2613          	jrne	L5571
2947                     ; 123 			if(ui_FET3_Duty < (U16)(1000)){ ui_FET3_Duty++; }
2949  009f ce0003        	ldw	x,_ui_FET3_Duty
2950  00a2 a303e8        	cpw	x,#1000
2951  00a5 24ed          	jruge	L7102
2954  00a7 ce0003        	ldw	x,_ui_FET3_Duty
2955  00aa 5c            	incw	x
2956  00ab cf0003        	ldw	_ui_FET3_Duty,x
2957  00ae acca01ca      	jra	L7102
2958  00b2               L5571:
2959                     ; 126 		else if(FIAT_Data_Step == (U8)(4)){	// PTC_Target_Percentage_Up
2961  00b2 c60017        	ld	a,_FIAT_Data_Step
2962  00b5 a104          	cp	a,#4
2963  00b7 2622          	jrne	L3671
2964                     ; 127 			if(uc_Ctr_TARVL < (U8)(100)){
2966  00b9 c60002        	ld	a,_uc_Ctr_TARVL
2967  00bc a164          	cp	a,#100
2968  00be 24ee          	jruge	L7102
2969                     ; 128 				uc_buffer = uc_Ctr_TARVL + uc_Duty_Unit;
2971  00c0 c60002        	ld	a,_uc_Ctr_TARVL
2972  00c3 cb0060        	add	a,_uc_Duty_Unit
2973  00c6 6b01          	ld	(OFST+0,sp),a
2974                     ; 129 				if(uc_buffer > (U8)(100)){ uc_Ctr_TARVL = (U8)(100); }
2976  00c8 a165          	cp	a,#101
2977  00ca 2508          	jrult	L7671
2980  00cc 35640002      	mov	_uc_Ctr_TARVL,#100
2982  00d0 acca01ca      	jra	L7102
2983  00d4               L7671:
2984                     ; 130 				else{ uc_Ctr_TARVL = uc_buffer; }
2986  00d4 c70002        	ld	_uc_Ctr_TARVL,a
2987  00d7 acca01ca      	jra	L7102
2988  00db               L3671:
2989                     ; 133 		else if(FIAT_Data_Step == (U8)(5)){	// PTC_Load_Control
2991  00db c60017        	ld	a,_FIAT_Data_Step
2992  00de a105          	cp	a,#5
2993  00e0 261c          	jrne	L5771
2994                     ; 134 			if(uc_Ctr_LD == (U8)(0)){ uc_Ctr_LD = (U8)(2); }	// Data_Rolling
2996  00e2 725d0001      	tnz	_uc_Ctr_LD
2997  00e6 2608          	jrne	L7771
3000  00e8 35020001      	mov	_uc_Ctr_LD,#2
3002  00ec acca01ca      	jra	L7102
3003  00f0               L7771:
3004                     ; 135 			else if(uc_Ctr_LD > (U8)(0)){ uc_Ctr_LD--; }		
3006  00f0 725d0001      	tnz	_uc_Ctr_LD
3007  00f4 27f6          	jreq	L7102
3010  00f6 725a0001      	dec	_uc_Ctr_LD
3011  00fa acca01ca      	jra	L7102
3012  00fe               L5771:
3013                     ; 137 		else if(FIAT_Data_Step == (U8)(6)){	// PTC_HV_DIAG_Active_Control
3015  00fe c60017        	ld	a,_FIAT_Data_Step
3016  0101 a106          	cp	a,#6
3017  0103 26f5          	jrne	L7102
3018                     ; 138 			if(uc_Ctr_U_DIAG == (U8)(0)){ uc_Ctr_U_DIAG = (U8)(2); }	// Data_Rolling
3020  0105 725d0000      	tnz	_uc_Ctr_U_DIAG
3021  0109 2608          	jrne	L1102
3024  010b 35020000      	mov	_uc_Ctr_U_DIAG,#2
3026  010f acca01ca      	jra	L7102
3027  0113               L1102:
3028                     ; 139 			else if(uc_Ctr_U_DIAG > (U8)(0)){ uc_Ctr_U_DIAG--; }	
3030  0113 725d0000      	tnz	_uc_Ctr_U_DIAG
3031  0117 27f6          	jreq	L7102
3034  0119 725a0000      	dec	_uc_Ctr_U_DIAG
3035  011d acca01ca      	jra	L7102
3036  0121               L7371:
3037                     ; 143 	else if(ST == 0){	
3039  0121 7b02          	ld	a,(OFST+1,sp)
3040  0123 26f8          	jrne	L7102
3041                     ; 144 		if(FIAT_Data_Step == (U8)(0)){	// FET1_Switching_Duty_Up
3043  0125 725d0017      	tnz	_FIAT_Data_Step
3044  0129 2610          	jrne	L3202
3045                     ; 145 			if(ui_FET1_Duty > (U16)(0)){ ui_FET1_Duty--; }
3047  012b ce0007        	ldw	x,_ui_FET1_Duty
3048  012e 27ed          	jreq	L7102
3051  0130 ce0007        	ldw	x,_ui_FET1_Duty
3052  0133 5a            	decw	x
3053  0134 cf0007        	ldw	_ui_FET1_Duty,x
3054  0137 acca01ca      	jra	L7102
3055  013b               L3202:
3056                     ; 147 		else if(FIAT_Data_Step == (U8)(1)){	// FET2_Switching_Duty_Up
3058  013b c60017        	ld	a,_FIAT_Data_Step
3059  013e 4a            	dec	a
3060  013f 260e          	jrne	L1302
3061                     ; 148 			if(ui_FET2_Duty > (U16)(0)){ ui_FET2_Duty--; }
3063  0141 ce0005        	ldw	x,_ui_FET2_Duty
3064  0144 27f1          	jreq	L7102
3067  0146 ce0005        	ldw	x,_ui_FET2_Duty
3068  0149 5a            	decw	x
3069  014a cf0005        	ldw	_ui_FET2_Duty,x
3070  014d 207b          	jra	L7102
3071  014f               L1302:
3072                     ; 150 		else if(FIAT_Data_Step == (U8)(2)){	// FET3_Switching_Duty_Up
3074  014f c60017        	ld	a,_FIAT_Data_Step
3075  0152 a102          	cp	a,#2
3076  0154 260e          	jrne	L7302
3077                     ; 151 			if(ui_FET3_Duty > (U16)(0)){ ui_FET3_Duty--; }
3079  0156 ce0003        	ldw	x,_ui_FET3_Duty
3080  0159 276f          	jreq	L7102
3083  015b ce0003        	ldw	x,_ui_FET3_Duty
3084  015e 5a            	decw	x
3085  015f cf0003        	ldw	_ui_FET3_Duty,x
3086  0162 2066          	jra	L7102
3087  0164               L7302:
3088                     ; 154 		else if(FIAT_Data_Step == (U8)(4)){	// PTC_Target_Percentage_Up
3090  0164 c60017        	ld	a,_FIAT_Data_Step
3091  0167 a104          	cp	a,#4
3092  0169 261f          	jrne	L5402
3093                     ; 155 			if(uc_Ctr_TARVL > (U8)(0)){
3095  016b 725d0002      	tnz	_uc_Ctr_TARVL
3096  016f 2759          	jreq	L7102
3097                     ; 156 				if(uc_Duty_Unit >= uc_Ctr_TARVL){ uc_Ctr_TARVL = (U8)(0); }
3099  0171 c60060        	ld	a,_uc_Duty_Unit
3100  0174 c10002        	cp	a,_uc_Ctr_TARVL
3101  0177 2506          	jrult	L1502
3104  0179 725f0002      	clr	_uc_Ctr_TARVL
3106  017d 204b          	jra	L7102
3107  017f               L1502:
3108                     ; 157 				else{ uc_Ctr_TARVL -= uc_Duty_Unit; }
3110  017f c60002        	ld	a,_uc_Ctr_TARVL
3111  0182 c00060        	sub	a,_uc_Duty_Unit
3112  0185 c70002        	ld	_uc_Ctr_TARVL,a
3113  0188 2040          	jra	L7102
3114  018a               L5402:
3115                     ; 160 		else if(FIAT_Data_Step == (U8)(5)){	// PTC_Load_Control
3117  018a c60017        	ld	a,_FIAT_Data_Step
3118  018d a105          	cp	a,#5
3119  018f 261a          	jrne	L7502
3120                     ; 161 			if(uc_Ctr_LD == (U8)(2)){ uc_Ctr_LD = (U8)(0); }	// Data_Rolling
3122  0191 c60001        	ld	a,_uc_Ctr_LD
3123  0194 a102          	cp	a,#2
3124  0196 2606          	jrne	L1602
3127  0198 725f0001      	clr	_uc_Ctr_LD
3129  019c 202c          	jra	L7102
3130  019e               L1602:
3131                     ; 162 			else if(uc_Ctr_LD < (U8)(2)){ uc_Ctr_LD++; }
3133  019e c60001        	ld	a,_uc_Ctr_LD
3134  01a1 a102          	cp	a,#2
3135  01a3 2425          	jruge	L7102
3138  01a5 725c0001      	inc	_uc_Ctr_LD
3139  01a9 201f          	jra	L7102
3140  01ab               L7502:
3141                     ; 164 		else if(FIAT_Data_Step == (U8)(6)){	// PTC_HV_DIAG_Active_Control
3143  01ab c60017        	ld	a,_FIAT_Data_Step
3144  01ae a106          	cp	a,#6
3145  01b0 2618          	jrne	L7102
3146                     ; 165 			if(uc_Ctr_U_DIAG == (U8)(2)){ uc_Ctr_U_DIAG = (U8)(0); }	// Data_Rolling
3148  01b2 c60000        	ld	a,_uc_Ctr_U_DIAG
3149  01b5 a102          	cp	a,#2
3150  01b7 2606          	jrne	L3702
3153  01b9 725f0000      	clr	_uc_Ctr_U_DIAG
3155  01bd 200b          	jra	L7102
3156  01bf               L3702:
3157                     ; 166 			else if(uc_Ctr_U_DIAG < (U8)(2)){ uc_Ctr_U_DIAG++; }
3159  01bf c60000        	ld	a,_uc_Ctr_U_DIAG
3160  01c2 a102          	cp	a,#2
3161  01c4 2404          	jruge	L7102
3164  01c6 725c0000      	inc	_uc_Ctr_U_DIAG
3165  01ca               L7102:
3166                     ; 170 	return ;
3169  01ca 85            	popw	x
3170  01cb 87            	retf	
3204                     ; 174 void FIAT_Switch_Control(void)
3204                     ; 175 {
3205                     	switch	.text
3206  01cc               f_FIAT_Switch_Control:
3210                     ; 176 	if(UP_SW_flag == ON){
3212  01cc 720300006e    	btjf	_SW_Status,#1,L1112
3213                     ; 178 		if(FIAT_Option_flag == ON){
3215  01d1 7207000c0c    	btjf	_FIAT_Test_Register,#3,L3112
3216                     ; 179 			if(uc_Duty_Unit < 100){ uc_Duty_Unit++;}
3218  01d6 c60060        	ld	a,_uc_Duty_Unit
3219  01d9 a164          	cp	a,#100
3220  01db 2404          	jruge	L5112
3223  01dd 725c0060      	inc	_uc_Duty_Unit
3224  01e1               L5112:
3225                     ; 180 			return;
3228  01e1 87            	retf	
3229  01e2               L3112:
3230                     ; 183 		if(FIAT_Data_Setting_flag == ON){	FIAT_Test_Value_Change(1);}
3232  01e2 7203000c08    	btjf	_FIAT_Test_Register,#1,L7112
3235  01e7 a601          	ld	a,#1
3236  01e9 8d590059      	callf	f_FIAT_Test_Value_Change
3239  01ed 204a          	jra	L1212
3240  01ef               L7112:
3241                     ; 184 		else if(FIAT_Data_Select_flag == ON){
3243  01ef 7201000c25    	btjf	_FIAT_Test_Register,#0,L3212
3244                     ; 185 			if(FIAT_Test_Pg == (U8)(0)){
3246  01f4 725d0018      	tnz	_FIAT_Test_Pg
3247  01f8 260c          	jrne	L5212
3248                     ; 186 				if(FIAT_Data_Step > 0){ FIAT_Data_Step--; }
3250  01fa 725d0017      	tnz	_FIAT_Data_Step
3251  01fe 2739          	jreq	L1212
3254  0200 725a0017      	dec	_FIAT_Data_Step
3255  0204 2033          	jra	L1212
3256  0206               L5212:
3257                     ; 188 			else if(FIAT_Test_Pg == (U8)(1)){
3259  0206 c60018        	ld	a,_FIAT_Test_Pg
3260  0209 4a            	dec	a
3261  020a 262d          	jrne	L1212
3262                     ; 189 				if(FIAT_Data_Step > 4){ FIAT_Data_Step--; }
3264  020c c60017        	ld	a,_FIAT_Data_Step
3265  020f a105          	cp	a,#5
3266  0211 2526          	jrult	L1212
3269  0213 725a0017      	dec	_FIAT_Data_Step
3270  0217 2020          	jra	L1212
3271  0219               L3212:
3272                     ; 192 			if(FIAT_Test_Pg > 0){
3274  0219 725d0018      	tnz	_FIAT_Test_Pg
3275  021d 271a          	jreq	L1212
3276                     ; 193 				FIAT_Test_Pg--;
3278  021f 725a0018      	dec	_FIAT_Test_Pg
3279                     ; 194 				if(FIAT_Test_Pg == (U8)(0)){ FIAT_Data_Step = 0; }
3281  0223 725d0018      	tnz	_FIAT_Test_Pg
3282  0227 2606          	jrne	L3412
3285  0229 725f0017      	clr	_FIAT_Data_Step
3287  022d 200a          	jra	L1212
3288  022f               L3412:
3289                     ; 195 				else if(FIAT_Test_Pg == (U8)(1)){ FIAT_Data_Step = 4; }
3291  022f c60018        	ld	a,_FIAT_Test_Pg
3292  0232 4a            	dec	a
3293  0233 2604          	jrne	L1212
3296  0235 35040017      	mov	_FIAT_Data_Step,#4
3297  0239               L1212:
3298                     ; 201 		UP_SW_flag = OFF;
3300  0239 72130000      	bres	_SW_Status,#1
3302  023d 2072          	jra	L1512
3303  023f               L1112:
3304                     ; 203 	}else if(DN_SW_flag == ON){ 
3306  023f 720500006d    	btjf	_SW_Status,#2,L1512
3307                     ; 205 		if(FIAT_Option_flag == ON){
3309  0244 7207000c0c    	btjf	_FIAT_Test_Register,#3,L5512
3310                     ; 206 			if(uc_Duty_Unit > 1){ uc_Duty_Unit--;}
3312  0249 c60060        	ld	a,_uc_Duty_Unit
3313  024c a102          	cp	a,#2
3314  024e 2504          	jrult	L7512
3317  0250 725a0060      	dec	_uc_Duty_Unit
3318  0254               L7512:
3319                     ; 207 			return;
3322  0254 87            	retf	
3323  0255               L5512:
3324                     ; 211 		if(FIAT_Data_Setting_flag == ON){	FIAT_Test_Value_Change(0);}
3326  0255 7203000c07    	btjf	_FIAT_Test_Register,#1,L1612
3329  025a 4f            	clr	a
3330  025b 8d590059      	callf	f_FIAT_Test_Value_Change
3333  025f 204c          	jra	L3612
3334  0261               L1612:
3335                     ; 213 		else if(FIAT_Data_Select_flag == ON){
3337  0261 7201000c26    	btjf	_FIAT_Test_Register,#0,L5612
3338                     ; 214 			if(FIAT_Test_Pg == (U8)(0)){
3340  0266 725d0018      	tnz	_FIAT_Test_Pg
3341  026a 260d          	jrne	L7612
3342                     ; 215 				if(FIAT_Data_Step < 2){ FIAT_Data_Step++; }
3344  026c c60017        	ld	a,_FIAT_Data_Step
3345  026f a102          	cp	a,#2
3346  0271 243a          	jruge	L3612
3349  0273 725c0017      	inc	_FIAT_Data_Step
3350  0277 2034          	jra	L3612
3351  0279               L7612:
3352                     ; 217 			else if(FIAT_Test_Pg == (U8)(1)){
3354  0279 c60018        	ld	a,_FIAT_Test_Pg
3355  027c 4a            	dec	a
3356  027d 262e          	jrne	L3612
3357                     ; 218 				if(FIAT_Data_Step < 6){ FIAT_Data_Step++; }
3359  027f c60017        	ld	a,_FIAT_Data_Step
3360  0282 a106          	cp	a,#6
3361  0284 2427          	jruge	L3612
3364  0286 725c0017      	inc	_FIAT_Data_Step
3365  028a 2021          	jra	L3612
3366  028c               L5612:
3367                     ; 221 			if(FIAT_Test_Pg < 3){
3369  028c c60018        	ld	a,_FIAT_Test_Pg
3370  028f a103          	cp	a,#3
3371  0291 241a          	jruge	L3612
3372                     ; 222 				FIAT_Test_Pg++;
3374  0293 725c0018      	inc	_FIAT_Test_Pg
3375                     ; 224 				if(FIAT_Test_Pg == (U8)(0)){ FIAT_Data_Step = 0; }
3377  0297 725d0018      	tnz	_FIAT_Test_Pg
3378  029b 2606          	jrne	L5022
3381  029d 725f0017      	clr	_FIAT_Data_Step
3383  02a1 200a          	jra	L3612
3384  02a3               L5022:
3385                     ; 225 				else if(FIAT_Test_Pg == (U8)(1)){ FIAT_Data_Step = 4; }
3387  02a3 c60018        	ld	a,_FIAT_Test_Pg
3388  02a6 4a            	dec	a
3389  02a7 2604          	jrne	L3612
3392  02a9 35040017      	mov	_FIAT_Data_Step,#4
3393  02ad               L3612:
3394                     ; 228 		DN_SW_flag = OFF;
3396  02ad 72150000      	bres	_SW_Status,#2
3397  02b1               L1512:
3398                     ; 233 	if(SET_SW_flag == ON){
3400  02b1 7207000029    	btjf	_SW_Status,#3,L3122
3401                     ; 234 		if(FIAT_Test_Pg < 2){
3403  02b6 c60018        	ld	a,_FIAT_Test_Pg
3404  02b9 a102          	cp	a,#2
3405  02bb 2422          	jruge	L3122
3406                     ; 236 			if(FIAT_Data_Select_flag == OFF){FIAT_Data_Select_flag= ON;}
3408  02bd 7200000c06    	btjt	_FIAT_Test_Register,#0,L7122
3411  02c2 7210000c      	bset	_FIAT_Test_Register,#0
3413  02c6 2013          	jra	L1222
3414  02c8               L7122:
3415                     ; 238 				if(FIAT_Data_Setting_flag == OFF){
3417  02c8 7202000c06    	btjt	_FIAT_Test_Register,#1,L3222
3418                     ; 239 					FIAT_Data_Setting_flag = ON;
3420  02cd 7212000c      	bset	_FIAT_Test_Register,#1
3422  02d1 2008          	jra	L1222
3423  02d3               L3222:
3424                     ; 241 					FIAT_Data_Setting_flag = OFF;
3426  02d3 7213000c      	bres	_FIAT_Test_Register,#1
3427                     ; 242 					FIAT_Data_Select_flag = OFF;
3429  02d7 7211000c      	bres	_FIAT_Test_Register,#0
3430  02db               L1222:
3431                     ; 245 			SET_SW_flag = OFF;
3433  02db 72170000      	bres	_SW_Status,#3
3434  02df               L3122:
3435                     ; 249 	if(ON_OFF_SW_flag == ON){
3437  02df 7201000023    	btjf	_SW_Status,#0,L7222
3438                     ; 250 		if(FIAT_Trans_flag == OFF){FIAT_Trans_flag = ON;}
3440  02e4 7204000c06    	btjt	_FIAT_Test_Register,#2,L1322
3443  02e9 7214000c      	bset	_FIAT_Test_Register,#2
3445  02ed 2014          	jra	L3322
3446  02ef               L1322:
3447                     ; 252 			FIAT_Trans_flag = OFF;  
3449  02ef 7215000c      	bres	_FIAT_Test_Register,#2
3450                     ; 253 			FIAT_Rx_Over_Time = OFF;
3452  02f3 721d000b      	bres	_FIAT_Lin_Com_Register,#6
3453                     ; 255 			FIAT_Tx1_Event = OFF;
3455  02f7 7213000b      	bres	_FIAT_Lin_Com_Register,#1
3456                     ; 256 			FIAT_Tx2_Event = OFF;
3458  02fb 7215000b      	bres	_FIAT_Lin_Com_Register,#2
3459                     ; 257 			FIAT_Rx_Event = OFF;
3461  02ff 7217000b      	bres	_FIAT_Lin_Com_Register,#3
3462  0303               L3322:
3463                     ; 261 		ON_OFF_SW_flag = OFF;
3465  0303 72110000      	bres	_SW_Status,#0
3466  0307               L7222:
3467                     ; 264 	if(OP_SW_flag == ON){
3469  0307 7209000013    	btjf	_SW_Status,#4,L5322
3470                     ; 266 		if(FIAT_Option_flag == OFF){FIAT_Option_flag = ON;}
3472  030c 7206000c06    	btjt	_FIAT_Test_Register,#3,L7322
3475  0311 7216000c      	bset	_FIAT_Test_Register,#3
3477  0315 2004          	jra	L1422
3478  0317               L7322:
3479                     ; 267 		else{FIAT_Option_flag = OFF;}
3481  0317 7217000c      	bres	_FIAT_Test_Register,#3
3482  031b               L1422:
3483                     ; 269 		OP_SW_flag = OFF;
3485  031b 72190000      	bres	_SW_Status,#4
3486  031f               L5322:
3487                     ; 273 	if(EN_SW_flag == ON){
3489  031f 720b000018    	btjf	_SW_Status,#5,L3422
3490                     ; 274 		Device_Select_Mode = ON;
3492  0324 72100000      	bset	_Mode_Select_Status,#0
3493                     ; 275 		FIAT500_PTC_flag = OFF;
3495  0328 72110000      	bres	_LIN20_Select_Device,#0
3496                     ; 276 		FIAT_Trans_flag = OFF;
3498  032c 7215000c      	bres	_FIAT_Test_Register,#2
3499                     ; 278 		FIAT_Reset_Values();	
3501  0330 8d000000      	callf	f_FIAT_Reset_Values
3503                     ; 279 		LIN_EN = 0;
3505  0334 7215500f      	bres	_PD_ODR,#2
3506                     ; 280 		EN_SW_flag = OFF;
3508  0338 721b0000      	bres	_SW_Status,#5
3509  033c               L3422:
3510                     ; 282 	return;
3513  033c 87            	retf	
3539                     ; 285 void FIAT_Display_Handling(void)
3539                     ; 286 {
3540                     	switch	.text
3541  033d               f_FIAT_Display_Handling:
3545                     ; 287 	switch(FIAT_Test_Pg){
3547  033d c60018        	ld	a,_FIAT_Test_Pg
3549                     ; 324 		default: break;
3550  0340 2711          	jreq	L5422
3551  0342 4a            	dec	a
3552  0343 272b          	jreq	L7422
3553  0345 4a            	dec	a
3554  0346 2751          	jreq	L1522
3555  0348 4a            	dec	a
3556  0349 2777          	jreq	L3522
3557  034b 4a            	dec	a
3558  034c 2604acdf03df  	jreq	L5522
3560  0352 87            	retf	
3561  0353               L5422:
3562                     ; 289 		case 0:	strcpy(LCD_Dis_Data[0],"D00:");	// FET1_Switching_Duty_Control
3564  0353 ae00c8        	ldw	x,#L5722
3565  0356 89            	pushw	x
3566  0357 ae0000        	ldw	x,#_LCD_Dis_Data
3567  035a 8d000000      	callf	f_strcpy
3569  035e 85            	popw	x
3570                     ; 290 				strcpy(LCD_Dis_Data[1],"D01:");	// FET2_Switching_Duty_Control
3572  035f ae00c3        	ldw	x,#L7722
3573  0362 89            	pushw	x
3574  0363 ae0010        	ldw	x,#_LCD_Dis_Data+16
3575  0366 8d000000      	callf	f_strcpy
3577  036a 85            	popw	x
3578                     ; 291 				strcpy(LCD_Dis_Data[2],"D02:");	// FET3_Switching_Duty_Control
3580  036b ae00be        	ldw	x,#L1032
3582                     ; 292 				strcpy(LCD_Dis_Data[3],"");		// Null
3584                     ; 293 				break;
3586  036e 201b          	jpf	LC002
3587  0370               L7422:
3588                     ; 295 		case 1:	strcpy(LCD_Dis_Data[0],"TAR:");	// Target_Power_Percentage_Control
3590  0370 ae00b8        	ldw	x,#L5032
3591  0373 89            	pushw	x
3592  0374 ae0000        	ldw	x,#_LCD_Dis_Data
3593  0377 8d000000      	callf	f_strcpy
3595  037b 85            	popw	x
3596                     ; 296 				strcpy(LCD_Dis_Data[1],"LD :");		// Heater_Load_Active_Inactive_Control
3598  037c ae00b3        	ldw	x,#L7032
3599  037f 89            	pushw	x
3600  0380 ae0010        	ldw	x,#_LCD_Dis_Data+16
3601  0383 8d000000      	callf	f_strcpy
3603  0387 85            	popw	x
3604                     ; 297 				strcpy(LCD_Dis_Data[2],"UDI:");	// Voltage_Diagnositcs_Active_Inactive_Control
3606  0388 ae00ae        	ldw	x,#L1132
3608                     ; 298 				strcpy(LCD_Dis_Data[3],"");		// Null
3610  038b               LC002:
3611  038b 89            	pushw	x
3612  038c ae0020        	ldw	x,#_LCD_Dis_Data+32
3613  038f 8d000000      	callf	f_strcpy
3614  0393 85            	popw	x
3617  0394 ae00bd        	ldw	x,#L3032
3619                     ; 300 				break;
3621  0397 206d          	jpf	LC001
3622  0399               L1522:
3623                     ; 302 		case 2: 	strcpy(LCD_Dis_Data[0],"HV :");		// Input_HV_Value_Display
3625  0399 ae00a9        	ldw	x,#L3132
3626  039c 89            	pushw	x
3627  039d ae0000        	ldw	x,#_LCD_Dis_Data
3628  03a0 8d000000      	callf	f_strcpy
3630  03a4 85            	popw	x
3631                     ; 303 				strcpy(LCD_Dis_Data[1],"CUR:");	// Consumption_Current_Display
3633  03a5 ae00a4        	ldw	x,#L5132
3634  03a8 89            	pushw	x
3635  03a9 ae0010        	ldw	x,#_LCD_Dis_Data+16
3636  03ac 8d000000      	callf	f_strcpy
3638  03b0 85            	popw	x
3639                     ; 304 				strcpy(LCD_Dis_Data[2],"PWR:");	// Consumption_Power_Display
3641  03b1 ae009f        	ldw	x,#L7132
3642  03b4 89            	pushw	x
3643  03b5 ae0020        	ldw	x,#_LCD_Dis_Data+32
3644  03b8 8d000000      	callf	f_strcpy
3646  03bc 85            	popw	x
3647                     ; 305 				strcpy(LCD_Dis_Data[3],"TPW:");	// Target_Power_Dispaly
3649  03bd ae009a        	ldw	x,#L1232
3651                     ; 307 				break;
3653  03c0 2044          	jpf	LC001
3654  03c2               L3522:
3655                     ; 309 		case 3: 	strcpy(LCD_Dis_Data[0],"IGN:");	// IGN_Voltage_Display
3657  03c2 ae0095        	ldw	x,#L3232
3658  03c5 89            	pushw	x
3659  03c6 ae0000        	ldw	x,#_LCD_Dis_Data
3660  03c9 8d000000      	callf	f_strcpy
3662  03cd 85            	popw	x
3663                     ; 310 				strcpy(LCD_Dis_Data[1],"SW-D:");	// FET_Siwtching_Duty_Display
3665  03ce ae008f        	ldw	x,#L5232
3666  03d1 89            	pushw	x
3667  03d2 ae0010        	ldw	x,#_LCD_Dis_Data+16
3668  03d5 8d000000      	callf	f_strcpy
3670  03d9 85            	popw	x
3671                     ; 311 				strcpy(LCD_Dis_Data[2],"CU-A");	// Current_Sensor_AD_Conversion_Value_Display
3673  03da ae008a        	ldw	x,#L7232
3675                     ; 312 				strcpy(LCD_Dis_Data[3],"");
3677                     ; 314 				break;
3679  03dd 20ac          	jpf	LC002
3680  03df               L5522:
3681                     ; 316 		case 4: 	strcpy(LCD_Dis_Data[0],"SC :    TOUT:");
3683  03df ae007c        	ldw	x,#L1332
3684  03e2 89            	pushw	x
3685  03e3 ae0000        	ldw	x,#_LCD_Dis_Data
3686  03e6 8d000000      	callf	f_strcpy
3688  03ea 85            	popw	x
3689                     ; 317 				strcpy(LCD_Dis_Data[1],"OVL:    UU :");
3691  03eb ae006f        	ldw	x,#L3332
3692  03ee 89            	pushw	x
3693  03ef ae0010        	ldw	x,#_LCD_Dis_Data+16
3694  03f2 8d000000      	callf	f_strcpy
3696  03f6 85            	popw	x
3697                     ; 318 				strcpy(LCD_Dis_Data[2],"IDLG:    OTMP:");
3699  03f7 ae0060        	ldw	x,#L5332
3700  03fa 89            	pushw	x
3701  03fb ae0020        	ldw	x,#_LCD_Dis_Data+32
3702  03fe 8d000000      	callf	f_strcpy
3704  0402 85            	popw	x
3705                     ; 319 				strcpy(LCD_Dis_Data[3],"CERR:");
3707  0403 ae005a        	ldw	x,#L7332
3709  0406               LC001:
3710  0406 89            	pushw	x
3711  0407 ae0030        	ldw	x,#_LCD_Dis_Data+48
3712  040a 8d000000      	callf	f_strcpy
3713  040e 85            	popw	x
3714                     ; 321 				break;
3716                     ; 324 		default: break;
3718                     ; 326 	return;
3721  040f 87            	retf	
3782                     ; 331 void FIAT500_LCD_Display(void)
3782                     ; 332 {
3783                     	switch	.text
3784  0410               f_FIAT500_LCD_Display:
3786  0410 5205          	subw	sp,#5
3787       00000005      OFST:	set	5
3790                     ; 336 	if(FIAT_Option_flag == ON){
3792  0412 7207000c40    	btjf	_FIAT_Test_Register,#3,L7532
3793                     ; 337 		Set_LCD_Address(LCD_Line[0]);
3795  0417 c60000        	ld	a,_LCD_Line
3796  041a 8d000000      	callf	f_Set_LCD_Address
3798                     ; 338 		Display_LCD_String("*OPTION*");
3800  041e ae0051        	ldw	x,#L1632
3801  0421 8d000000      	callf	f_Display_LCD_String
3803                     ; 339 		Set_LCD_Address(LCD_Line[1]);
3805  0425 c60001        	ld	a,_LCD_Line+1
3806  0428 8d000000      	callf	f_Set_LCD_Address
3808                     ; 340 		Display_LCD_String("D_Unit:");
3810  042c ae0049        	ldw	x,#L3632
3811  042f 8d000000      	callf	f_Display_LCD_String
3813                     ; 342 		Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
3815  0433 c60001        	ld	a,_LCD_Line+1
3816  0436 ab07          	add	a,#7
3817  0438 8d000000      	callf	f_Set_LCD_Address
3819                     ; 343 		if(Blink_50){Display_LCD_String("     ");}
3821  043c 725d0000      	tnz	_Blink_50
3822  0440 2707          	jreq	L5632
3825  0442 ae0043        	ldw	x,#L7632
3828  0445 ac1f0a1f      	jra	L3303
3829  0449               L5632:
3830                     ; 345 			Num_Display_LCD(FIAT_Dunit);
3832  0449 ce0045        	ldw	x,_FIAT_Dunit
3833  044c 8d000000      	callf	f_Num_Display_LCD
3835                     ; 346 			Display_LCD_String("%");
3837  0450 ae0041        	ldw	x,#L3732
3839                     ; 348 		return;
3841  0453 ac1f0a1f      	jra	L3303
3842  0457               L7532:
3843                     ; 351 	if(FIAT_Test_Pg != FIAT_Test_Pre_Pg){ FIAT_Display_Handling();}
3845  0457 c60018        	ld	a,_FIAT_Test_Pg
3846  045a c10019        	cp	a,_FIAT_Test_Pre_Pg
3847  045d 2704          	jreq	L5732
3850  045f 8d3d033d      	callf	f_FIAT_Display_Handling
3852  0463               L5732:
3853                     ; 352 	FIAT_Test_Pre_Pg = FIAT_Test_Pg ;
3855  0463 5500180019    	mov	_FIAT_Test_Pre_Pg,_FIAT_Test_Pg
3856                     ; 355 	if(FIAT_Test_Pg == 0){			//page 1
3858  0468 725d0018      	tnz	_FIAT_Test_Pg
3859  046c 2704ac600560  	jrne	L7732
3860                     ; 356 		for(i=0; i<4; i++){
3862  0472 4f            	clr	a
3863  0473 6b05          	ld	(OFST+0,sp),a
3864  0475               L1042:
3865                     ; 357 			Set_LCD_Address(LCD_Line[i]);
3867  0475 5f            	clrw	x
3868  0476 97            	ld	xl,a
3869  0477 d60000        	ld	a,(_LCD_Line,x)
3870  047a 8d000000      	callf	f_Set_LCD_Address
3872                     ; 359 			if((FIAT_Data_Select_flag == ON) && (FIAT_Data_Setting_flag == OFF) && (i == FIAT_Data_Step)){
3874  047e 7201000c17    	btjf	_FIAT_Test_Register,#0,L7042
3876  0483 7202000c12    	btjt	_FIAT_Test_Register,#1,L7042
3878  0488 7b05          	ld	a,(OFST+0,sp)
3879  048a c10017        	cp	a,_FIAT_Data_Step
3880  048d 260b          	jrne	L7042
3881                     ; 360 				if(Blink_50){Display_LCD_String("     ");}
3883  048f 725d0000      	tnz	_Blink_50
3884  0493 2707          	jreq	LC003
3887  0495 ae0043        	ldw	x,#L7632
3890  0498 2009          	jra	L5142
3891                     ; 361 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3893  049a               L7042:
3894                     ; 362 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3896  049a 7b05          	ld	a,(OFST+0,sp)
3897  049c               LC003:
3899  049c 97            	ld	xl,a
3900  049d a610          	ld	a,#16
3901  049f 42            	mul	x,a
3902  04a0 1c0000        	addw	x,#_LCD_Dis_Data
3904  04a3               L5142:
3905  04a3 8d000000      	callf	f_Display_LCD_String
3906                     ; 364 			Set_LCD_Address((U8)(LCD_Line[i] + 5));
3908  04a7 7b05          	ld	a,(OFST+0,sp)
3909  04a9 5f            	clrw	x
3910  04aa 97            	ld	xl,a
3911  04ab d60000        	ld	a,(_LCD_Line,x)
3912  04ae ab05          	add	a,#5
3913  04b0 8d000000      	callf	f_Set_LCD_Address
3915                     ; 367 			if(i==0){		// LINE 1
3917  04b4 7b05          	ld	a,(OFST+0,sp)
3918  04b6 262a          	jrne	L7142
3919                     ; 368 				if((FIAT_Data_Setting_flag == ON) && (i == FIAT_Data_Step)){
3921  04b8 7203000c23    	btjf	_FIAT_Test_Register,#1,L1242
3923  04bd c10017        	cp	a,_FIAT_Data_Step
3924  04c0 2606          	jrne	L3242
3925                     ; 369 					if(Blink_50){Display_LCD_String("       ");}
3927  04c2 725d0000      	tnz	_Blink_50
3931  04c6 265c          	jrne	LC009
3932  04c8               L3242:
3933                     ; 371 						Num_Display_LCD(ui_FET1_Duty / (U16)(10));
3936                     ; 372 						Display_LCD_String(".");
3939                     ; 373 						Num_Display_LCD(ui_FET1_Duty % (U16)(10));
3942  04c8 ce0007        	ldw	x,_ui_FET1_Duty
3943  04cb 90ae000a      	ldw	y,#10
3944  04cf 65            	divw	x,y
3945  04d0 8d000000      	callf	f_Num_Display_LCD
3947  04d4 ae0037        	ldw	x,#L1342
3948  04d7 8d000000      	callf	f_Display_LCD_String
3950  04db ce0007        	ldw	x,_ui_FET1_Duty
3952                     ; 374 						Display_LCD_String("%");
3954  04de 205f          	jpf	LC005
3955  04e0               L1242:
3956                     ; 377 					Num_Display_LCD(ui_FET1_Duty / (U16)(10));
3958                     ; 378 					Display_LCD_String(".");
3960                     ; 379 					Num_Display_LCD(ui_FET1_Duty % (U16)(10));
3962                     ; 380 					Display_LCD_String("%");
3964  04e0 20e6          	jpf	L3242
3965  04e2               L7142:
3966                     ; 384 			else if(i==1){	// LINE 2
3968  04e2 a101          	cp	a,#1
3969  04e4 262a          	jrne	L7342
3970                     ; 385 				if((FIAT_Data_Setting_flag == ON) && (i == FIAT_Data_Step)){
3972  04e6 7203000c23    	btjf	_FIAT_Test_Register,#1,L1442
3974  04eb c10017        	cp	a,_FIAT_Data_Step
3975  04ee 2606          	jrne	L3442
3976                     ; 386 					if(Blink_50){Display_LCD_String("       ");}
3978  04f0 725d0000      	tnz	_Blink_50
3982  04f4 262e          	jrne	LC009
3983  04f6               L3442:
3984                     ; 388 						Num_Display_LCD(ui_FET2_Duty / (U16)(10));
3987                     ; 389 						Display_LCD_String(".");
3990                     ; 390 						Num_Display_LCD(ui_FET2_Duty % (U16)(10));
3993  04f6 ce0005        	ldw	x,_ui_FET2_Duty
3994  04f9 90ae000a      	ldw	y,#10
3995  04fd 65            	divw	x,y
3996  04fe 8d000000      	callf	f_Num_Display_LCD
3998  0502 ae0037        	ldw	x,#L1342
3999  0505 8d000000      	callf	f_Display_LCD_String
4001  0509 ce0005        	ldw	x,_ui_FET2_Duty
4003                     ; 391 						Display_LCD_String("%");
4005  050c 2031          	jpf	LC005
4006  050e               L1442:
4007                     ; 394 					Num_Display_LCD(ui_FET2_Duty / (U16)(10));
4009                     ; 395 					Display_LCD_String(".");
4011                     ; 396 					Num_Display_LCD(ui_FET2_Duty % (U16)(10));
4013                     ; 397 					Display_LCD_String("%");
4015  050e 20e6          	jpf	L3442
4016  0510               L7342:
4017                     ; 401 			else if(i==2){	// LINE 3
4019  0510 a102          	cp	a,#2
4020  0512 263c          	jrne	L5342
4021                     ; 402 				if((FIAT_Data_Setting_flag == ON) && (i == FIAT_Data_Step)){
4023  0514 7203000c10    	btjf	_FIAT_Test_Register,#1,L7542
4025  0519 c10017        	cp	a,_FIAT_Data_Step
4026  051c 260b          	jrne	L7542
4027                     ; 403 					if(Blink_50){Display_LCD_String("       ");}
4029  051e 725d0000      	tnz	_Blink_50
4030  0522 2705          	jreq	L7542
4033  0524               LC009:
4036  0524 ae0039        	ldw	x,#L5242
4039  0527 2023          	jpf	LC004
4040  0529               L7542:
4041                     ; 405 						Num_Display_LCD(ui_FET3_Duty / (U16)(10));
4043                     ; 406 						Display_LCD_String(".");
4045                     ; 407 						Num_Display_LCD(ui_FET3_Duty % (U16)(10));
4047                     ; 408 						Display_LCD_String("%");
4049                     ; 411 					Num_Display_LCD(ui_FET3_Duty / (U16)(10));
4052                     ; 412 					Display_LCD_String(".");
4055                     ; 413 					Num_Display_LCD(ui_FET3_Duty % (U16)(10));
4058  0529 ce0003        	ldw	x,_ui_FET3_Duty
4059  052c 90ae000a      	ldw	y,#10
4060  0530 65            	divw	x,y
4061  0531 8d000000      	callf	f_Num_Display_LCD
4063  0535 ae0037        	ldw	x,#L1342
4064  0538 8d000000      	callf	f_Display_LCD_String
4066  053c ce0003        	ldw	x,_ui_FET3_Duty
4068                     ; 414 					Display_LCD_String("%");
4070  053f               LC005:
4071  053f 90ae000a      	ldw	y,#10
4072  0543 65            	divw	x,y
4073  0544 93            	ldw	x,y
4074  0545 8d000000      	callf	f_Num_Display_LCD
4080  0549 ae0041        	ldw	x,#L3732
4081  054c               LC004:
4082  054c 8d000000      	callf	f_Display_LCD_String
4084  0550               L5342:
4085                     ; 356 		for(i=0; i<4; i++){
4087  0550 0c05          	inc	(OFST+0,sp)
4090  0552 7b05          	ld	a,(OFST+0,sp)
4091  0554 a104          	cp	a,#4
4092  0556 2404ac750475  	jrult	L1042
4094  055c acfd09fd      	jra	L5642
4095  0560               L7732:
4096                     ; 419 	else if(FIAT_Test_Pg == 1){
4098  0560 c60018        	ld	a,_FIAT_Test_Pg
4099  0563 4a            	dec	a
4100  0564 2704acb706b7  	jrne	L7642
4101                     ; 420 		for(i=0; i<4; i++){
4103  056a 6b05          	ld	(OFST+0,sp),a
4104  056c               L1742:
4105                     ; 422 			Set_LCD_Address(LCD_Line[i]);
4107  056c 5f            	clrw	x
4108  056d 97            	ld	xl,a
4109  056e d60000        	ld	a,(_LCD_Line,x)
4110  0571 8d000000      	callf	f_Set_LCD_Address
4112                     ; 423 			if((FIAT_Data_Select_flag == ON) && (FIAT_Data_Setting_flag == OFF) && (i == FIAT_Data_Step-4)){
4114  0575 7201000c25    	btjf	_FIAT_Test_Register,#0,L7742
4116  057a 7202000c20    	btjt	_FIAT_Test_Register,#1,L7742
4118  057f c60017        	ld	a,_FIAT_Data_Step
4119  0582 5f            	clrw	x
4120  0583 97            	ld	xl,a
4121  0584 1d0004        	subw	x,#4
4122  0587 7b05          	ld	a,(OFST+0,sp)
4123  0589 905f          	clrw	y
4124  058b 9097          	ld	yl,a
4125  058d 90bf00        	ldw	c_y,y
4126  0590 b300          	cpw	x,c_y
4127  0592 260b          	jrne	L7742
4128                     ; 424 				if(Blink_50){Display_LCD_String("     ");}
4130  0594 725d0000      	tnz	_Blink_50
4131  0598 2707          	jreq	LC010
4134  059a ae0043        	ldw	x,#L7632
4137  059d 2009          	jra	L5052
4138                     ; 425 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4140  059f               L7742:
4141                     ; 426 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4143  059f 7b05          	ld	a,(OFST+0,sp)
4144  05a1               LC010:
4146  05a1 97            	ld	xl,a
4147  05a2 a610          	ld	a,#16
4148  05a4 42            	mul	x,a
4149  05a5 1c0000        	addw	x,#_LCD_Dis_Data
4151  05a8               L5052:
4152  05a8 8d000000      	callf	f_Display_LCD_String
4153                     ; 428 			Set_LCD_Address((U8)(LCD_Line[i] + 5));
4155  05ac 7b05          	ld	a,(OFST+0,sp)
4156  05ae 5f            	clrw	x
4157  05af 97            	ld	xl,a
4158  05b0 d60000        	ld	a,(_LCD_Line,x)
4159  05b3 ab05          	add	a,#5
4160  05b5 8d000000      	callf	f_Set_LCD_Address
4162                     ; 431 			if(i==0){		// LINE 1
4164  05b9 7b05          	ld	a,(OFST+0,sp)
4165  05bb 2637          	jrne	L7052
4166                     ; 432 				if((FIAT_Data_Setting_flag == ON) && (i == (FIAT_Data_Step-4))){
4168  05bd 7203000c20    	btjf	_FIAT_Test_Register,#1,L3152
4170  05c2 c60017        	ld	a,_FIAT_Data_Step
4171  05c5 5f            	clrw	x
4172  05c6 97            	ld	xl,a
4173  05c7 1d0004        	subw	x,#4
4174  05ca 7b05          	ld	a,(OFST+0,sp)
4175  05cc 905f          	clrw	y
4176  05ce 9097          	ld	yl,a
4177  05d0 90bf00        	ldw	c_y,y
4178  05d3 b300          	cpw	x,c_y
4179  05d5 260b          	jrne	L3152
4180                     ; 433 					if(Blink_50){Display_LCD_String("       ");}
4182  05d7 725d0000      	tnz	_Blink_50
4183  05db 2705          	jreq	L3152
4186  05dd ae0039        	ldw	x,#L5242
4189  05e0 200c          	jpf	LC011
4190  05e2               L3152:
4191                     ; 435 						Num_Display_LCD(uc_Ctr_TARVL);
4193                     ; 436 						Display_LCD_String("%");
4195                     ; 439 					Num_Display_LCD(uc_Ctr_TARVL);
4198                     ; 440 					Display_LCD_String("%");
4201  05e2 c60002        	ld	a,_uc_Ctr_TARVL
4202  05e5 5f            	clrw	x
4203  05e6 97            	ld	xl,a
4204  05e7 8d000000      	callf	f_Num_Display_LCD
4206  05eb ae0041        	ldw	x,#L3732
4207  05ee               LC011:
4208  05ee 8d000000      	callf	f_Display_LCD_String
4210  05f2 7b05          	ld	a,(OFST+0,sp)
4211  05f4               L7052:
4212                     ; 444 			if(i==1){		// LINE 2
4214  05f4 4a            	dec	a
4215  05f5 2655          	jrne	L1252
4216                     ; 445 				if((FIAT_Data_Setting_flag == ON) && (i == (FIAT_Data_Step-4))){
4218  05f7 7203000c31    	btjf	_FIAT_Test_Register,#1,L3252
4220  05fc c60017        	ld	a,_FIAT_Data_Step
4221  05ff 5f            	clrw	x
4222  0600 97            	ld	xl,a
4223  0601 1d0004        	subw	x,#4
4224  0604 7b05          	ld	a,(OFST+0,sp)
4225  0606 905f          	clrw	y
4226  0608 9097          	ld	yl,a
4227  060a 90bf00        	ldw	c_y,y
4228  060d b300          	cpw	x,c_y
4229  060f 261c          	jrne	L3252
4230                     ; 446 					if(Blink_50){Display_LCD_String("       ");}
4232  0611 725d0000      	tnz	_Blink_50
4233  0615 2705          	jreq	L5252
4236  0617 ae0039        	ldw	x,#L5242
4239  061a 202c          	jpf	LC013
4240  061c               L5252:
4241                     ; 448 						if(uc_Ctr_LD == (U8)(0)){ Display_LCD_String("No LD");}		// No Load Shedding
4243  061c 725d0001      	tnz	_uc_Ctr_LD
4247  0620 2711          	jreq	LC016
4248                     ; 449 						else if(uc_Ctr_LD == (U8)(1)){ Display_LCD_String("LD");}	// Load Shedding
4250  0622 c60001        	ld	a,_uc_Ctr_LD
4251  0625 4a            	dec	a
4252  0626 2616          	jrne	L7552
4255  0628               LC015:
4257  0628 ae002e        	ldw	x,#L1452
4260  062b 201b          	jpf	LC013
4261                     ; 450 						else if(uc_Ctr_LD == (U8)(2)){ Display_LCD_String("Invld");}	// Invalid Value
4264  062d               L3252:
4265                     ; 453 					if(uc_Ctr_LD == (U8)(0)){ Display_LCD_String("No LD");}			// No Load Shedding
4267  062d 725d0001      	tnz	_uc_Ctr_LD
4268  0631 2605          	jrne	L3552
4271  0633               LC016:
4273  0633 ae0031        	ldw	x,#L3352
4276  0636 2010          	jpf	LC013
4277  0638               L3552:
4278                     ; 454 					else if(uc_Ctr_LD == (U8)(1)){ Display_LCD_String("LD");}		// Load Shedding
4280  0638 c60001        	ld	a,_uc_Ctr_LD
4281  063b 4a            	dec	a
4285  063c 27ea          	jreq	LC015
4286  063e               L7552:
4287                     ; 455 					else if(uc_Ctr_LD == (U8)(2)){ Display_LCD_String("Invld");}		// Invalid Value
4292  063e c60001        	ld	a,_uc_Ctr_LD
4293  0641 a102          	cp	a,#2
4294  0643 2607          	jrne	L1252
4296  0645 ae0028        	ldw	x,#L7452
4297  0648               LC013:
4298  0648 8d000000      	callf	f_Display_LCD_String
4300  064c               L1252:
4301                     ; 458 			if(i==2){		// LINE 2
4303  064c 7b05          	ld	a,(OFST+0,sp)
4304  064e a102          	cp	a,#2
4305  0650 2655          	jrne	L5652
4306                     ; 459 				if((FIAT_Data_Setting_flag == ON) && (i == (FIAT_Data_Step-4))){
4308  0652 7203000c31    	btjf	_FIAT_Test_Register,#1,L7652
4310  0657 c60017        	ld	a,_FIAT_Data_Step
4311  065a 5f            	clrw	x
4312  065b 97            	ld	xl,a
4313  065c 1d0004        	subw	x,#4
4314  065f 7b05          	ld	a,(OFST+0,sp)
4315  0661 905f          	clrw	y
4316  0663 9097          	ld	yl,a
4317  0665 90bf00        	ldw	c_y,y
4318  0668 b300          	cpw	x,c_y
4319  066a 261c          	jrne	L7652
4320                     ; 460 					if(Blink_50){Display_LCD_String("       ");}
4322  066c 725d0000      	tnz	_Blink_50
4323  0670 2705          	jreq	L1752
4326  0672 ae0039        	ldw	x,#L5242
4329  0675 202c          	jpf	LC017
4330  0677               L1752:
4331                     ; 462 						if(uc_Ctr_U_DIAG == (U8)(0)){ Display_LCD_String("VD Act");}		// Voltage Diagnostics Active
4333  0677 725d0000      	tnz	_uc_Ctr_U_DIAG
4337  067b 2711          	jreq	LC020
4338                     ; 463 						else if(uc_Ctr_U_DIAG == (U8)(1)){ Display_LCD_String("VD InAct");}	// Voltage Diagnositcs Inactive
4340  067d c60000        	ld	a,_uc_Ctr_U_DIAG
4341  0680 4a            	dec	a
4342  0681 2616          	jrne	L1262
4345  0683               LC019:
4347  0683 ae0018        	ldw	x,#L5062
4350  0686 201b          	jpf	LC017
4351                     ; 464 						else if(uc_Ctr_U_DIAG == (U8)(2)){ Display_LCD_String("Invld");}		// Invalid Value
4354  0688               L7652:
4355                     ; 467 					if(uc_Ctr_U_DIAG == (U8)(0)){ Display_LCD_String("VD Act");}			// Voltage Diagnostics Active
4357  0688 725d0000      	tnz	_uc_Ctr_U_DIAG
4358  068c 2605          	jrne	L5162
4361  068e               LC020:
4363  068e ae0021        	ldw	x,#L7752
4366  0691 2010          	jpf	LC017
4367  0693               L5162:
4368                     ; 468 					else if(uc_Ctr_U_DIAG == (U8)(1)){ Display_LCD_String("VD InAct");}		// Voltage Diagnositcs Inactive
4370  0693 c60000        	ld	a,_uc_Ctr_U_DIAG
4371  0696 4a            	dec	a
4375  0697 27ea          	jreq	LC019
4376  0699               L1262:
4377                     ; 469 					else if(uc_Ctr_U_DIAG == (U8)(2)){ Display_LCD_String("Invld");}			// Invalid Value
4382  0699 c60000        	ld	a,_uc_Ctr_U_DIAG
4383  069c a102          	cp	a,#2
4384  069e 2607          	jrne	L5652
4386  06a0 ae0028        	ldw	x,#L7452
4387  06a3               LC017:
4388  06a3 8d000000      	callf	f_Display_LCD_String
4390  06a7               L5652:
4391                     ; 420 		for(i=0; i<4; i++){
4393  06a7 0c05          	inc	(OFST+0,sp)
4396  06a9 7b05          	ld	a,(OFST+0,sp)
4397  06ab a104          	cp	a,#4
4398  06ad 2404ac6c056c  	jrult	L1742
4400  06b3 acfd09fd      	jra	L5642
4401  06b7               L7642:
4402                     ; 474 	else if(FIAT_Test_Pg == 2){
4404  06b7 c60018        	ld	a,_FIAT_Test_Pg
4405  06ba a102          	cp	a,#2
4406  06bc 2704acee07ee  	jrne	L1362
4407                     ; 475 		for(i=0; i<4; i++){
4409  06c2 4f            	clr	a
4410  06c3 6b05          	ld	(OFST+0,sp),a
4411  06c5               L3362:
4412                     ; 477 			Set_LCD_Address(LCD_Line[i]);
4414  06c5 5f            	clrw	x
4415  06c6 97            	ld	xl,a
4416  06c7 d60000        	ld	a,(_LCD_Line,x)
4417  06ca 8d000000      	callf	f_Set_LCD_Address
4419                     ; 478 			Display_LCD_String(LCD_Dis_Data[i]);
4421  06ce 7b05          	ld	a,(OFST+0,sp)
4422  06d0 97            	ld	xl,a
4423  06d1 a610          	ld	a,#16
4424  06d3 42            	mul	x,a
4425  06d4 1c0000        	addw	x,#_LCD_Dis_Data
4426  06d7 8d000000      	callf	f_Display_LCD_String
4428                     ; 480 			Set_LCD_Address((U8)(LCD_Line[i] + 5));
4430  06db 7b05          	ld	a,(OFST+0,sp)
4431  06dd 5f            	clrw	x
4432  06de 97            	ld	xl,a
4433  06df d60000        	ld	a,(_LCD_Line,x)
4434  06e2 ab05          	add	a,#5
4435  06e4 8d000000      	callf	f_Set_LCD_Address
4437                     ; 483 			if(i==0){		// LINE 1
4439  06e8 7b05          	ld	a,(OFST+0,sp)
4440  06ea 2646          	jrne	L1462
4441                     ; 484 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN ");}
4443  06ec 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L5462
4445  06f1 7204000c05    	btjt	_FIAT_Test_Register,#2,L3462
4446  06f6               L5462:
4449  06f6 ae0014        	ldw	x,#L7462
4452  06f9 2031          	jpf	LC021
4453  06fb               L3462:
4454                     ; 486 					ui_buffer = (U16)(uc_Rx2_Lin_Data[1] << 8) + (U16)(uc_Rx2_Lin_Data[0]);	// Sum of High Voltage Data
4456  06fb c60050        	ld	a,_uc_Rx2_Lin_Data
4457  06fe 5f            	clrw	x
4458  06ff 97            	ld	xl,a
4459  0700 1f01          	ldw	(OFST-4,sp),x
4460  0702 c60051        	ld	a,_uc_Rx2_Lin_Data+1
4461  0705 97            	ld	xl,a
4462  0706 4f            	clr	a
4463  0707 02            	rlwa	x,a
4464  0708 72fb01        	addw	x,(OFST-4,sp)
4465  070b 1f03          	ldw	(OFST-2,sp),x
4466                     ; 487 					Num_Display_LCD(ui_buffer / (U16)(10));
4468  070d 90ae000a      	ldw	y,#10
4469  0711 65            	divw	x,y
4470  0712 8d000000      	callf	f_Num_Display_LCD
4472                     ; 488 					Display_LCD_String(".");
4474  0716 ae0037        	ldw	x,#L1342
4475  0719 8d000000      	callf	f_Display_LCD_String
4477                     ; 489 					Num_Display_LCD(ui_buffer % (U16)(10));
4479  071d 1e03          	ldw	x,(OFST-2,sp)
4480  071f 90ae000a      	ldw	y,#10
4481  0723 65            	divw	x,y
4482  0724 93            	ldw	x,y
4483  0725 8d000000      	callf	f_Num_Display_LCD
4485                     ; 490 					Display_LCD_String("V");
4487  0729 ae0012        	ldw	x,#L3562
4488  072c               LC021:
4489  072c 8d000000      	callf	f_Display_LCD_String
4491  0730 7b05          	ld	a,(OFST+0,sp)
4492  0732               L1462:
4493                     ; 495 			if(i==1){		// LINE 2
4495  0732 a101          	cp	a,#1
4496  0734 2646          	jrne	L5562
4497                     ; 496 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN ");}
4499  0736 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L1662
4501  073b 7204000c05    	btjt	_FIAT_Test_Register,#2,L7562
4502  0740               L1662:
4505  0740 ae0014        	ldw	x,#L7462
4508  0743 2031          	jpf	LC022
4509  0745               L7562:
4510                     ; 498 					ui_buffer = (U16)(uc_Rx2_Lin_Data[5] << 8) + (U16)(uc_Rx2_Lin_Data[4]);	// Sum of Current Value Data
4512  0745 c60054        	ld	a,_uc_Rx2_Lin_Data+4
4513  0748 5f            	clrw	x
4514  0749 97            	ld	xl,a
4515  074a 1f01          	ldw	(OFST-4,sp),x
4516  074c c60055        	ld	a,_uc_Rx2_Lin_Data+5
4517  074f 97            	ld	xl,a
4518  0750 4f            	clr	a
4519  0751 02            	rlwa	x,a
4520  0752 72fb01        	addw	x,(OFST-4,sp)
4521  0755 1f03          	ldw	(OFST-2,sp),x
4522                     ; 499 					Num_Display_LCD(ui_buffer / (U16)(10));
4524  0757 90ae000a      	ldw	y,#10
4525  075b 65            	divw	x,y
4526  075c 8d000000      	callf	f_Num_Display_LCD
4528                     ; 500 					Display_LCD_String(".");
4530  0760 ae0037        	ldw	x,#L1342
4531  0763 8d000000      	callf	f_Display_LCD_String
4533                     ; 501 					Num_Display_LCD(ui_buffer % (U16)(10));
4535  0767 1e03          	ldw	x,(OFST-2,sp)
4536  0769 90ae000a      	ldw	y,#10
4537  076d 65            	divw	x,y
4538  076e 93            	ldw	x,y
4539  076f 8d000000      	callf	f_Num_Display_LCD
4541                     ; 502 					Display_LCD_String("A");
4543  0773 ae0010        	ldw	x,#L5662
4544  0776               LC022:
4545  0776 8d000000      	callf	f_Display_LCD_String
4547  077a 7b05          	ld	a,(OFST+0,sp)
4548  077c               L5562:
4549                     ; 507 			if(i==2){		// LINE 3
4551  077c a102          	cp	a,#2
4552  077e 262e          	jrne	L7662
4553                     ; 508 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN ");}
4555  0780 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L3762
4557  0785 7204000c05    	btjt	_FIAT_Test_Register,#2,L1762
4558  078a               L3762:
4561  078a ae0014        	ldw	x,#L7462
4564  078d 2019          	jpf	LC023
4565  078f               L1762:
4566                     ; 510 					ui_buffer = (U16)(uc_Rx2_Lin_Data[7] << 8) + (U16)(uc_Rx2_Lin_Data[6]);	// Sum of Current Value Data
4568  078f c60056        	ld	a,_uc_Rx2_Lin_Data+6
4569  0792 5f            	clrw	x
4570  0793 97            	ld	xl,a
4571  0794 1f01          	ldw	(OFST-4,sp),x
4572  0796 c60057        	ld	a,_uc_Rx2_Lin_Data+7
4573  0799 97            	ld	xl,a
4574  079a 4f            	clr	a
4575  079b 02            	rlwa	x,a
4576  079c 72fb01        	addw	x,(OFST-4,sp)
4577  079f 1f03          	ldw	(OFST-2,sp),x
4578                     ; 511 					Num_Display_LCD(ui_buffer);
4580  07a1 8d000000      	callf	f_Num_Display_LCD
4582                     ; 512 					Display_LCD_String("W");
4584  07a5 ae000e        	ldw	x,#L7762
4585  07a8               LC023:
4586  07a8 8d000000      	callf	f_Display_LCD_String
4588  07ac 7b05          	ld	a,(OFST+0,sp)
4589  07ae               L7662:
4590                     ; 517 			if(i==3){		// LINE 3
4592  07ae a103          	cp	a,#3
4593  07b0 262c          	jrne	L1072
4594                     ; 518 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN ");}
4596  07b2 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L5072
4598  07b7 7204000c05    	btjt	_FIAT_Test_Register,#2,L3072
4599  07bc               L5072:
4602  07bc ae0014        	ldw	x,#L7462
4605  07bf 2019          	jpf	LC024
4606  07c1               L3072:
4607                     ; 520 					ui_buffer = (U16)(uc_Rx3_Lin_Data[3] << 8) + (U16)(uc_Rx3_Lin_Data[2]);	// Sum of Target Power Data
4609  07c1 c6005a        	ld	a,_uc_Rx3_Lin_Data+2
4610  07c4 5f            	clrw	x
4611  07c5 97            	ld	xl,a
4612  07c6 1f01          	ldw	(OFST-4,sp),x
4613  07c8 c6005b        	ld	a,_uc_Rx3_Lin_Data+3
4614  07cb 97            	ld	xl,a
4615  07cc 4f            	clr	a
4616  07cd 02            	rlwa	x,a
4617  07ce 72fb01        	addw	x,(OFST-4,sp)
4618  07d1 1f03          	ldw	(OFST-2,sp),x
4619                     ; 521 					Num_Display_LCD(ui_buffer);
4621  07d3 8d000000      	callf	f_Num_Display_LCD
4623                     ; 522 					Display_LCD_String("W");
4625  07d7 ae000e        	ldw	x,#L7762
4626  07da               LC024:
4627  07da 8d000000      	callf	f_Display_LCD_String
4629  07de               L1072:
4630                     ; 475 		for(i=0; i<4; i++){
4632  07de 0c05          	inc	(OFST+0,sp)
4635  07e0 7b05          	ld	a,(OFST+0,sp)
4636  07e2 a104          	cp	a,#4
4637  07e4 2404acc506c5  	jrult	L3362
4639  07ea acfd09fd      	jra	L5642
4640  07ee               L1362:
4641                     ; 529 	else if(FIAT_Test_Pg == 3){
4643  07ee c60018        	ld	a,_FIAT_Test_Pg
4644  07f1 a103          	cp	a,#3
4645  07f3 2704acf308f3  	jrne	L3172
4646                     ; 530 		for(i=0; i<4; i++){
4648  07f9 4f            	clr	a
4649  07fa 6b05          	ld	(OFST+0,sp),a
4650  07fc               L5172:
4651                     ; 531 			Set_LCD_Address(LCD_Line[i]);
4653  07fc 5f            	clrw	x
4654  07fd 97            	ld	xl,a
4655  07fe d60000        	ld	a,(_LCD_Line,x)
4656  0801 8d000000      	callf	f_Set_LCD_Address
4658                     ; 532 			Display_LCD_String(LCD_Dis_Data[i]);
4660  0805 7b05          	ld	a,(OFST+0,sp)
4661  0807 97            	ld	xl,a
4662  0808 a610          	ld	a,#16
4663  080a 42            	mul	x,a
4664  080b 1c0000        	addw	x,#_LCD_Dis_Data
4665  080e 8d000000      	callf	f_Display_LCD_String
4667                     ; 534 			Set_LCD_Address((U8)(LCD_Line[i] + 5));
4669  0812 7b05          	ld	a,(OFST+0,sp)
4670  0814 5f            	clrw	x
4671  0815 97            	ld	xl,a
4672  0816 d60000        	ld	a,(_LCD_Line,x)
4673  0819 ab05          	add	a,#5
4674  081b 8d000000      	callf	f_Set_LCD_Address
4676                     ; 537 			if(i==0){		// LINE 1
4678  081f 7b05          	ld	a,(OFST+0,sp)
4679  0821 2646          	jrne	L3272
4680                     ; 538 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
4682  0823 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L7272
4684  0828 7204000c05    	btjt	_FIAT_Test_Register,#2,L5272
4685  082d               L7272:
4688  082d ae0009        	ldw	x,#L1372
4691  0830 2031          	jpf	LC025
4692  0832               L5272:
4693                     ; 540 					ui_buffer = (U16)(uc_Rx3_Lin_Data[5] << 8) + (U16)(uc_Rx3_Lin_Data[4]);	// Sum of IGN Voltage Data
4695  0832 c6005c        	ld	a,_uc_Rx3_Lin_Data+4
4696  0835 5f            	clrw	x
4697  0836 97            	ld	xl,a
4698  0837 1f01          	ldw	(OFST-4,sp),x
4699  0839 c6005d        	ld	a,_uc_Rx3_Lin_Data+5
4700  083c 97            	ld	xl,a
4701  083d 4f            	clr	a
4702  083e 02            	rlwa	x,a
4703  083f 72fb01        	addw	x,(OFST-4,sp)
4704  0842 1f03          	ldw	(OFST-2,sp),x
4705                     ; 541 					Num_Display_LCD(ui_buffer / (U16)(10));
4707  0844 90ae000a      	ldw	y,#10
4708  0848 65            	divw	x,y
4709  0849 8d000000      	callf	f_Num_Display_LCD
4711                     ; 542 					Display_LCD_String(".");
4713  084d ae0037        	ldw	x,#L1342
4714  0850 8d000000      	callf	f_Display_LCD_String
4716                     ; 543 					Num_Display_LCD(ui_buffer % (U16)(10));
4718  0854 1e03          	ldw	x,(OFST-2,sp)
4719  0856 90ae000a      	ldw	y,#10
4720  085a 65            	divw	x,y
4721  085b 93            	ldw	x,y
4722  085c 8d000000      	callf	f_Num_Display_LCD
4724                     ; 544 					Display_LCD_String("V");
4726  0860 ae0012        	ldw	x,#L3562
4727  0863               LC025:
4728  0863 8d000000      	callf	f_Display_LCD_String
4730  0867 7b05          	ld	a,(OFST+0,sp)
4731  0869               L3272:
4732                     ; 549 			if(i==1){		// LINE 2
4734  0869 a101          	cp	a,#1
4735  086b 2646          	jrne	L5372
4736                     ; 550 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
4738  086d 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L1472
4740  0872 7204000c05    	btjt	_FIAT_Test_Register,#2,L7372
4741  0877               L1472:
4744  0877 ae0009        	ldw	x,#L1372
4747  087a 2031          	jpf	LC026
4748  087c               L7372:
4749                     ; 552 					ui_buffer = (U16)(uc_Rx3_Lin_Data[1] << 8) + (U16)(uc_Rx3_Lin_Data[2]);	// Sum of IGN Voltage Data
4751  087c c6005a        	ld	a,_uc_Rx3_Lin_Data+2
4752  087f 5f            	clrw	x
4753  0880 97            	ld	xl,a
4754  0881 1f01          	ldw	(OFST-4,sp),x
4755  0883 c60059        	ld	a,_uc_Rx3_Lin_Data+1
4756  0886 97            	ld	xl,a
4757  0887 4f            	clr	a
4758  0888 02            	rlwa	x,a
4759  0889 72fb01        	addw	x,(OFST-4,sp)
4760  088c 1f03          	ldw	(OFST-2,sp),x
4761                     ; 553 					Num_Display_LCD(ui_buffer / (U16)(10));
4763  088e 90ae000a      	ldw	y,#10
4764  0892 65            	divw	x,y
4765  0893 8d000000      	callf	f_Num_Display_LCD
4767                     ; 554 					Display_LCD_String(".");
4769  0897 ae0037        	ldw	x,#L1342
4770  089a 8d000000      	callf	f_Display_LCD_String
4772                     ; 555 					Num_Display_LCD(ui_buffer % (U16)(10));
4774  089e 1e03          	ldw	x,(OFST-2,sp)
4775  08a0 90ae000a      	ldw	y,#10
4776  08a4 65            	divw	x,y
4777  08a5 93            	ldw	x,y
4778  08a6 8d000000      	callf	f_Num_Display_LCD
4780                     ; 556 					Display_LCD_String("%");
4782  08aa ae0041        	ldw	x,#L3732
4783  08ad               LC026:
4784  08ad 8d000000      	callf	f_Display_LCD_String
4786  08b1 7b05          	ld	a,(OFST+0,sp)
4787  08b3               L5372:
4788                     ; 561 			if(i==2){		// LINE 3
4790  08b3 a102          	cp	a,#2
4791  08b5 262c          	jrne	L5472
4792                     ; 562 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
4794  08b7 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L1572
4796  08bc 7204000c05    	btjt	_FIAT_Test_Register,#2,L7472
4797  08c1               L1572:
4800  08c1 ae0009        	ldw	x,#L1372
4803  08c4 2019          	jpf	LC027
4804  08c6               L7472:
4805                     ; 564 					ui_buffer = (U16)(uc_Rx2_Lin_Data[5] << 8) + (U16)(uc_Rx2_Lin_Data[4]);	// Sum of Current AD
4807  08c6 c60054        	ld	a,_uc_Rx2_Lin_Data+4
4808  08c9 5f            	clrw	x
4809  08ca 97            	ld	xl,a
4810  08cb 1f01          	ldw	(OFST-4,sp),x
4811  08cd c60055        	ld	a,_uc_Rx2_Lin_Data+5
4812  08d0 97            	ld	xl,a
4813  08d1 4f            	clr	a
4814  08d2 02            	rlwa	x,a
4815  08d3 72fb01        	addw	x,(OFST-4,sp)
4816  08d6 1f03          	ldw	(OFST-2,sp),x
4817                     ; 565 					Num_Display_LCD(ui_buffer);
4819  08d8 8d000000      	callf	f_Num_Display_LCD
4821                     ; 566 					Display_LCD_String("AD");
4823  08dc ae0006        	ldw	x,#L5572
4824  08df               LC027:
4825  08df 8d000000      	callf	f_Display_LCD_String
4827  08e3               L5472:
4828                     ; 530 		for(i=0; i<4; i++){
4830  08e3 0c05          	inc	(OFST+0,sp)
4833  08e5 7b05          	ld	a,(OFST+0,sp)
4834  08e7 a104          	cp	a,#4
4835  08e9 2404acfc07fc  	jrult	L5172
4837  08ef acfd09fd      	jra	L5642
4838  08f3               L3172:
4839                     ; 573 	else if(FIAT_Test_Pg == 4){
4841  08f3 c60018        	ld	a,_FIAT_Test_Pg
4842  08f6 a104          	cp	a,#4
4843  08f8 26f5          	jrne	L5642
4844                     ; 574 		for(i=0; i<4; i++){
4846  08fa 4f            	clr	a
4847  08fb 6b05          	ld	(OFST+0,sp),a
4848  08fd               L3672:
4849                     ; 575 			Set_LCD_Address(LCD_Line[i]);
4851  08fd 5f            	clrw	x
4852  08fe 97            	ld	xl,a
4853  08ff d60000        	ld	a,(_LCD_Line,x)
4854  0902 8d000000      	callf	f_Set_LCD_Address
4856                     ; 576 			Display_LCD_String(LCD_Dis_Data[i]);
4858  0906 7b05          	ld	a,(OFST+0,sp)
4859  0908 97            	ld	xl,a
4860  0909 a610          	ld	a,#16
4861  090b 42            	mul	x,a
4862  090c 1c0000        	addw	x,#_LCD_Dis_Data
4863  090f 8d000000      	callf	f_Display_LCD_String
4865                     ; 579 			if(i==0){		// LINE 1
4867  0913 7b05          	ld	a,(OFST+0,sp)
4868  0915 265e          	jrne	L1772
4869                     ; 580 				Set_LCD_Address((U8)(LCD_Line[i] + 5));
4871  0917 5f            	clrw	x
4872  0918 97            	ld	xl,a
4873  0919 d60000        	ld	a,(_LCD_Line,x)
4874  091c ab05          	add	a,#5
4875  091e 8d000000      	callf	f_Set_LCD_Address
4877                     ; 582 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
4879  0922 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L5772
4881  0927 7204000c16    	btjt	_FIAT_Test_Register,#2,L3772
4882  092c               L5772:
4885  092c ae0009        	ldw	x,#L1372
4888  092f               L7772:
4889  092f 8d000000      	callf	f_Display_LCD_String
4890                     ; 591 				Set_LCD_Address((U8)(LCD_Line[i] + 8));
4892  0933 7b05          	ld	a,(OFST+0,sp)
4893  0935 5f            	clrw	x
4894  0936 97            	ld	xl,a
4895  0937 d60000        	ld	a,(_LCD_Line,x)
4896  093a ab08          	add	a,#8
4897  093c 8d000000      	callf	f_Set_LCD_Address
4899  0940 2033          	jra	L1772
4900  0942               L3772:
4901                     ; 584 					ui_buffer = (U16)(uc_Rx3_Lin_Data[5] << 8) + (U16)(uc_Rx3_Lin_Data[4]);	// Sum of IGN Voltage Data
4903  0942 c6005c        	ld	a,_uc_Rx3_Lin_Data+4
4904  0945 5f            	clrw	x
4905  0946 97            	ld	xl,a
4906  0947 1f01          	ldw	(OFST-4,sp),x
4907  0949 c6005d        	ld	a,_uc_Rx3_Lin_Data+5
4908  094c 97            	ld	xl,a
4909  094d 4f            	clr	a
4910  094e 02            	rlwa	x,a
4911  094f 72fb01        	addw	x,(OFST-4,sp)
4912  0952 1f03          	ldw	(OFST-2,sp),x
4913                     ; 585 					Num_Display_LCD(ui_buffer / (U16)(10));
4915  0954 90ae000a      	ldw	y,#10
4916  0958 65            	divw	x,y
4917  0959 8d000000      	callf	f_Num_Display_LCD
4919                     ; 586 					Display_LCD_String(".");
4921  095d ae0037        	ldw	x,#L1342
4922  0960 8d000000      	callf	f_Display_LCD_String
4924                     ; 587 					Num_Display_LCD(ui_buffer % (U16)(10));
4926  0964 1e03          	ldw	x,(OFST-2,sp)
4927  0966 90ae000a      	ldw	y,#10
4928  096a 65            	divw	x,y
4929  096b 93            	ldw	x,y
4930  096c 8d000000      	callf	f_Num_Display_LCD
4932                     ; 588 					Display_LCD_String("V");
4934  0970 ae0012        	ldw	x,#L3562
4936  0973 20ba          	jra	L7772
4937  0975               L1772:
4938                     ; 596 			if(i==1){		// LINE 2
4940  0975 7b05          	ld	a,(OFST+0,sp)
4941  0977 a101          	cp	a,#1
4942  0979 2646          	jrne	L1003
4943                     ; 597 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
4945  097b 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L5003
4947  0980 7204000c05    	btjt	_FIAT_Test_Register,#2,L3003
4948  0985               L5003:
4951  0985 ae0009        	ldw	x,#L1372
4954  0988 2031          	jpf	LC028
4955  098a               L3003:
4956                     ; 599 					ui_buffer = (U16)(uc_Rx3_Lin_Data[1] << 8) + (U16)(uc_Rx3_Lin_Data[2]);	// Sum of IGN Voltage Data
4958  098a c6005a        	ld	a,_uc_Rx3_Lin_Data+2
4959  098d 5f            	clrw	x
4960  098e 97            	ld	xl,a
4961  098f 1f01          	ldw	(OFST-4,sp),x
4962  0991 c60059        	ld	a,_uc_Rx3_Lin_Data+1
4963  0994 97            	ld	xl,a
4964  0995 4f            	clr	a
4965  0996 02            	rlwa	x,a
4966  0997 72fb01        	addw	x,(OFST-4,sp)
4967  099a 1f03          	ldw	(OFST-2,sp),x
4968                     ; 600 					Num_Display_LCD(ui_buffer / (U16)(10));
4970  099c 90ae000a      	ldw	y,#10
4971  09a0 65            	divw	x,y
4972  09a1 8d000000      	callf	f_Num_Display_LCD
4974                     ; 601 					Display_LCD_String(".");
4976  09a5 ae0037        	ldw	x,#L1342
4977  09a8 8d000000      	callf	f_Display_LCD_String
4979                     ; 602 					Num_Display_LCD(ui_buffer % (U16)(10));
4981  09ac 1e03          	ldw	x,(OFST-2,sp)
4982  09ae 90ae000a      	ldw	y,#10
4983  09b2 65            	divw	x,y
4984  09b3 93            	ldw	x,y
4985  09b4 8d000000      	callf	f_Num_Display_LCD
4987                     ; 603 					Display_LCD_String("%");
4989  09b8 ae0041        	ldw	x,#L3732
4990  09bb               LC028:
4991  09bb 8d000000      	callf	f_Display_LCD_String
4993  09bf 7b05          	ld	a,(OFST+0,sp)
4994  09c1               L1003:
4995                     ; 608 			if(i==2){		// LINE 3
4997  09c1 a102          	cp	a,#2
4998  09c3 262c          	jrne	L1103
4999                     ; 609 				if((FIAT_Rx_Over_Time == ON) ||(FIAT_Trans_flag == OFF)){ Display_LCD_String("NN  ");}
5001  09c5 720c000b05    	btjt	_FIAT_Lin_Com_Register,#6,L5103
5003  09ca 7204000c05    	btjt	_FIAT_Test_Register,#2,L3103
5004  09cf               L5103:
5007  09cf ae0009        	ldw	x,#L1372
5010  09d2 2019          	jpf	LC029
5011  09d4               L3103:
5012                     ; 611 					ui_buffer = (U16)(uc_Rx2_Lin_Data[5] << 8) + (U16)(uc_Rx2_Lin_Data[4]);	// Sum of Current AD
5014  09d4 c60054        	ld	a,_uc_Rx2_Lin_Data+4
5015  09d7 5f            	clrw	x
5016  09d8 97            	ld	xl,a
5017  09d9 1f01          	ldw	(OFST-4,sp),x
5018  09db c60055        	ld	a,_uc_Rx2_Lin_Data+5
5019  09de 97            	ld	xl,a
5020  09df 4f            	clr	a
5021  09e0 02            	rlwa	x,a
5022  09e1 72fb01        	addw	x,(OFST-4,sp)
5023  09e4 1f03          	ldw	(OFST-2,sp),x
5024                     ; 612 					Num_Display_LCD(ui_buffer);
5026  09e6 8d000000      	callf	f_Num_Display_LCD
5028                     ; 613 					Display_LCD_String("AD");
5030  09ea ae0006        	ldw	x,#L5572
5031  09ed               LC029:
5032  09ed 8d000000      	callf	f_Display_LCD_String
5034  09f1               L1103:
5035                     ; 574 		for(i=0; i<4; i++){
5037  09f1 0c05          	inc	(OFST+0,sp)
5040  09f3 7b05          	ld	a,(OFST+0,sp)
5041  09f5 a104          	cp	a,#4
5042  09f7 2404acfd08fd  	jrult	L3672
5043  09fd               L5642:
5044                     ; 621 	if((FIAT_Trans_flag == ON)){
5046  09fd a60f          	ld	a,#15
5047  09ff 7205000c14    	btjf	_FIAT_Test_Register,#2,L1203
5048                     ; 622 		Set_LCD_Address((unsigned char)(0x00+15));
5050  0a04 8d000000      	callf	f_Set_LCD_Address
5052                     ; 623 		if(Blink_30){Display_LCD_String("C");}
5054  0a08 725d0000      	tnz	_Blink_30
5055  0a0c 2705          	jreq	L3203
5058  0a0e ae0004        	ldw	x,#L5203
5061  0a11 200c          	jra	L3303
5062  0a13               L3203:
5063                     ; 624 		else{Display_LCD_String(" ");}
5065  0a13 ae0002        	ldw	x,#L1303
5067  0a16 2007          	jra	L3303
5068  0a18               L1203:
5069                     ; 627 		Set_LCD_Address((unsigned char)(0x00+15));
5071  0a18 8d000000      	callf	f_Set_LCD_Address
5073                     ; 628 		Display_LCD_String("N");
5075  0a1c ae0000        	ldw	x,#L5303
5077  0a1f               L3303:
5078  0a1f 8d000000      	callf	f_Display_LCD_String
5079                     ; 631 	return;
5082  0a23 5b05          	addw	sp,#5
5083  0a25 87            	retf	
5122                     ; 637 void FIAT_Rx_Data_Handling(void)
5122                     ; 638 {
5123                     	switch	.text
5124  0a26               f_FIAT_Rx_Data_Handling:
5126  0a26 88            	push	a
5127       00000001      OFST:	set	1
5130                     ; 641 	if(FIAT_Response_Complete == ON){
5132  0a27 720b000b3f    	btjf	_FIAT_Lin_Com_Register,#5,L3503
5133                     ; 642 		buff = LIN_Measure_PID_Parity(0x30);
5135  0a2c a630          	ld	a,#48
5136  0a2e 8d000000      	callf	f_LIN_Measure_PID_Parity
5138  0a32 6b01          	ld	(OFST+0,sp),a
5139                     ; 643 		buff = Lin_Measure_Extend_Checksum(buff,FIAT_RxLin_Data);
5141  0a34 ae0023        	ldw	x,#_FIAT_RxLin_Data
5142  0a37 89            	pushw	x
5143  0a38 7b03          	ld	a,(OFST+2,sp)
5144  0a3a 8d000000      	callf	f_Lin_Measure_Extend_Checksum
5146  0a3e 85            	popw	x
5147  0a3f 6b01          	ld	(OFST+0,sp),a
5148                     ; 645 		if(buff == FIAT_RxLin_Data[8]){
5150  0a41 c6002b        	ld	a,_FIAT_RxLin_Data+8
5151  0a44 1101          	cp	a,(OFST+0,sp)
5152  0a46 2617          	jrne	L5503
5153                     ; 646 			PTC_cur = FIAT_RxLin_Data[0];
5155  0a48 550023004c    	mov	_PTC_cur,_FIAT_RxLin_Data
5156                     ; 647 			PTC_State = (U8)(FIAT_RxLin_Data[2] & 0x07);
5158  0a4d c60025        	ld	a,_FIAT_RxLin_Data+2
5159  0a50 a407          	and	a,#7
5160  0a52 c7004b        	ld	_PTC_State,a
5161                     ; 649 			FIAT_Rx_Over_Time = OFF;
5163  0a55 721d000b      	bres	_FIAT_Lin_Com_Register,#6
5164                     ; 650 			FIAT_Recieve_Cnt = 0;
5166  0a59 725f0000      	clr	_FIAT_Recieve_Cnt
5168  0a5d 2008          	jra	L7503
5169  0a5f               L5503:
5170                     ; 653 			PTC_cur = 0;
5172  0a5f 725f004c      	clr	_PTC_cur
5173                     ; 654 			PTC_State = 0;
5175  0a63 725f004b      	clr	_PTC_State
5176  0a67               L7503:
5177                     ; 657 		FIAT_Response_Complete = OFF;
5179  0a67 721b000b      	bres	_FIAT_Lin_Com_Register,#5
5180  0a6b               L3503:
5181                     ; 661 	if(FIAT_Rx_Over_Time == ON){
5183  0a6b 720d000b08    	btjf	_FIAT_Lin_Com_Register,#6,L1603
5184                     ; 662 		PTC_cur = 0;
5186  0a70 725f004c      	clr	_PTC_cur
5187                     ; 663 		PTC_State = 0;
5189  0a74 725f004b      	clr	_PTC_State
5190  0a78               L1603:
5191                     ; 665 	return;
5194  0a78 84            	pop	a
5195  0a79 87            	retf	
5223                     ; 669 void FIAT_Tx_Data_Handling(void)
5223                     ; 670 {
5224                     	switch	.text
5225  0a7a               f_FIAT_Tx_Data_Handling:
5229                     ; 671 	SD_TxLin_Data1[0] = (U8)(PTC_Req_Per);
5231  0a7a 550040002c    	mov	_SD_TxLin_Data1,_PTC_Req_Per+1
5232                     ; 672 	SD_TxLin_Data1[1] = (U8)(D_Req);
5234  0a7f 55003e002d    	mov	_SD_TxLin_Data1+1,_D_Req
5235                     ; 673 	SD_TxLin_Data1[2] = (U8)(0);
5237  0a84 725f002e      	clr	_SD_TxLin_Data1+2
5238                     ; 674 	SD_TxLin_Data1[3] = (U8)(0);
5240  0a88 725f002f      	clr	_SD_TxLin_Data1+3
5241                     ; 675 	SD_TxLin_Data1[4] = Lin_Measure_Extend_Checksum(LIN_Measure_PID_Parity(0x1C) ,SD_TxLin_Data1);
5243  0a8c ae002c        	ldw	x,#_SD_TxLin_Data1
5244  0a8f 89            	pushw	x
5245  0a90 a61c          	ld	a,#28
5246  0a92 8d000000      	callf	f_LIN_Measure_PID_Parity
5248  0a96 8d000000      	callf	f_Lin_Measure_Extend_Checksum
5250  0a9a c70030        	ld	_SD_TxLin_Data1+4,a
5251  0a9d 85            	popw	x
5252                     ; 681 	return;
5255  0a9e 87            	retf	
5292                     ; 685 void FIAT_Transmit_Tx_DATA(void)
5292                     ; 686 {
5293                     	switch	.text
5294  0a9f               f_FIAT_Transmit_Tx_DATA:
5296  0a9f 88            	push	a
5297       00000001      OFST:	set	1
5300                     ; 689 	if(FIAT_BCM_Trans_Header == OFF){return;}
5302  0aa0 7200000b02    	btjt	_FIAT_Lin_Com_Register,#0,L7013
5306  0aa5 84            	pop	a
5307  0aa6 87            	retf	
5308  0aa7               L7013:
5309                     ; 692 		if(FIAT_Rx_Event){
5311  0aa7 7207000b18    	btjf	_FIAT_Lin_Com_Register,#3,L3113
5312                     ; 693 			FIAT_Tx1_Event = OFF;
5314  0aac 7213000b      	bres	_FIAT_Lin_Com_Register,#1
5315                     ; 695 			FIAT_Rx_Event= OFF;
5317                     ; 697 			LIN_Header_Transmission(0x30);
5319  0ab0 a630          	ld	a,#48
5320  0ab2 7217000b      	bres	_FIAT_Lin_Com_Register,#3
5321  0ab6 8d000000      	callf	f_LIN_Header_Transmission
5323                     ; 698 			Lin_Rx_Cnt = 0;
5325  0aba 725f0000      	clr	_Lin_Rx_Cnt
5326                     ; 699 			FIAT_SHCM_Rep_flag = ON;
5328  0abe 7218000b      	bset	_FIAT_Lin_Com_Register,#4
5330  0ac2 2027          	jra	L5113
5331  0ac4               L3113:
5332                     ; 706 		else if(FIAT_Tx1_Event){
5334  0ac4 7203000b22    	btjf	_FIAT_Lin_Com_Register,#1,L5113
5335                     ; 707 			FIAT_Tx1_Event = OFF;
5337  0ac9 7213000b      	bres	_FIAT_Lin_Com_Register,#1
5338                     ; 708 			FIAT_SHCM_Rep_flag = OFF;
5340                     ; 709 			LIN_Header_Transmission(0x1C);
5342  0acd a61c          	ld	a,#28
5343  0acf 7219000b      	bres	_FIAT_Lin_Com_Register,#4
5344  0ad3 8d000000      	callf	f_LIN_Header_Transmission
5346                     ; 710 			for(Index = 0; Index<5; Index++){	LIN_Transmission_Data(SD_TxLin_Data1[Index]);}	
5348  0ad7 4f            	clr	a
5349  0ad8 6b01          	ld	(OFST+0,sp),a
5350  0ada               L1213:
5353  0ada 5f            	clrw	x
5354  0adb 97            	ld	xl,a
5355  0adc d6002c        	ld	a,(_SD_TxLin_Data1,x)
5356  0adf 8d000000      	callf	f_LIN_Transmission_Data
5360  0ae3 0c01          	inc	(OFST+0,sp)
5363  0ae5 7b01          	ld	a,(OFST+0,sp)
5364  0ae7 a105          	cp	a,#5
5365  0ae9 25ef          	jrult	L1213
5366  0aeb               L5113:
5367                     ; 713 		FIAT_BCM_Trans_Header = OFF;
5369  0aeb 7211000b      	bres	_FIAT_Lin_Com_Register,#0
5370                     ; 715 	return;
5373  0aef 84            	pop	a
5374  0af0 87            	retf	
5401                     ; 720 void FIAT_ComTest_Routine(void)
5401                     ; 721 {
5402                     	switch	.text
5403  0af1               f_FIAT_ComTest_Routine:
5407                     ; 722 	if(FIAT_Trans_flag == OFF){return;}
5409  0af1 7204000c01    	btjt	_FIAT_Test_Register,#2,L7313
5413  0af6 87            	retf	
5414  0af7               L7313:
5415                     ; 724 		FIAT_Tx_Data_Handling();
5417  0af7 8d7a0a7a      	callf	f_FIAT_Tx_Data_Handling
5419                     ; 725 		FIAT_Rx_Data_Handling();
5421  0afb 8d260a26      	callf	f_FIAT_Rx_Data_Handling
5423                     ; 726 		FIAT_Transmit_Tx_DATA();
5426                     ; 728 	return;
5429  0aff 209e          	jpf	f_FIAT_Transmit_Tx_DATA
5456                     ; 732 void FIAT500_Test_Routine(void)
5456                     ; 733 {
5457                     	switch	.text
5458  0b01               f_FIAT500_Test_Routine:
5462                     ; 736 	if(FIAT500_PTC_flag == ON){
5464  0b01 720100000c    	btjf	_LIN20_Select_Device,#0,L3513
5465                     ; 737 		FIAT500_LCD_Display();
5467  0b06 8d100410      	callf	f_FIAT500_LCD_Display
5469                     ; 738 		FIAT_Switch_Control();
5471  0b0a 8dcc01cc      	callf	f_FIAT_Switch_Control
5473                     ; 739 		FIAT_ComTest_Routine();
5475  0b0e 8df10af1      	callf	f_FIAT_ComTest_Routine
5477  0b12               L3513:
5478                     ; 743 	return ;
5481  0b12 87            	retf	
5856                     	xdef	f_FIAT_ComTest_Routine
5857                     	xdef	f_FIAT_Transmit_Tx_DATA
5858                     	xdef	f_FIAT_Tx_Data_Handling
5859                     	xdef	f_FIAT_Rx_Data_Handling
5860                     	xdef	f_FIAT500_LCD_Display
5861                     	xdef	f_FIAT_Display_Handling
5862                     	xdef	f_FIAT_Switch_Control
5863                     	xdef	f_FIAT_Test_Value_Change
5864                     	xdef	f_FIAT_Reset_Values
5865                     	xdef	_uc_Duty_Unit
5866                     	xdef	_uc_Rx3_Lin_Data
5867                     	xdef	_uc_Rx2_Lin_Data
5868                     	xdef	_uc_Rx1_Lin_Data
5869                     	switch	.bss
5870  0000               _uc_Ctr_U_DIAG:
5871  0000 00            	ds.b	1
5872                     	xdef	_uc_Ctr_U_DIAG
5873  0001               _uc_Ctr_LD:
5874  0001 00            	ds.b	1
5875                     	xdef	_uc_Ctr_LD
5876  0002               _uc_Ctr_TARVL:
5877  0002 00            	ds.b	1
5878                     	xdef	_uc_Ctr_TARVL
5879  0003               _ui_FET3_Duty:
5880  0003 0000          	ds.b	2
5881                     	xdef	_ui_FET3_Duty
5882  0005               _ui_FET2_Duty:
5883  0005 0000          	ds.b	2
5884                     	xdef	_ui_FET2_Duty
5885  0007               _ui_FET1_Duty:
5886  0007 0000          	ds.b	2
5887                     	xdef	_ui_FET1_Duty
5888                     	xdef	_PTC_cur
5889                     	xdef	_PTC_State
5890                     	xdef	_POW_Save
5891                     	xdef	_PTC_Limit
5892                     	xdef	_PTC_Pwr
5893                     	xdef	_FIAT_Dunit
5894                     	xdef	_PTC_Lim_Pwr
5895                     	xdef	_PTC_Req_Pwr
5896                     	xdef	_PTC_Req_Per
5897                     	xdef	_D_Req
5898  0009               _test:
5899  0009 00            	ds.b	1
5900                     	xdef	_test
5901                     	xdef	_SD_TxLin_Data2
5902                     	xdef	_SD_TxLin_Data1
5903                     	xdef	_FIAT_TxLin_Data
5904                     	xdef	_FIAT_Test_Pre_Pg
5905                     	xdef	_FIAT_Test_Pg
5906                     	xdef	_FIAT_Data_Step
5907                     	xdef	_FIAT_Fault
5908                     	xdef	_TempSenCore
5909                     	xdef	_TempSenPCB
5910                     	xdef	_AEH_Curr
5911                     	xdef	_OperHeat
5912                     	xdef	_HV_Batt_Value
5913                     	xdef	_FIAT_AEH_VALUE
5914  000a               _Heat_Duty:
5915  000a 00            	ds.b	1
5916                     	xdef	_Heat_Duty
5917                     	xdef	_FIAT_Oper_Data
5918                     	xref	f_strcpy
5919                     	xdef	_FIAT_RxLin_Data
5920  000b               _FIAT_Lin_Com_Register:
5921  000b 00            	ds.b	1
5922                     	xdef	_FIAT_Lin_Com_Register
5923  000c               _FIAT_Test_Register:
5924  000c 00            	ds.b	1
5925                     	xdef	_FIAT_Test_Register
5926                     	xdef	f_FIAT500_Test_Routine
5927                     	xref	_Lin_Rx_Cnt
5928                     	xref	_FIAT_Recieve_Cnt
5929                     	xref	f_LIN_Transmission_Data
5930                     	xref	f_LIN_Header_Transmission
5931                     	xref	f_Lin_Measure_Extend_Checksum
5932                     	xref	f_LIN_Measure_PID_Parity
5933                     	xref	_LCD_Dis_Data
5934                     	xref	_LCD_Line
5935                     	xref	f_Num_Display_LCD
5936                     	xref	f_Display_LCD_String
5937                     	xref	f_Set_LCD_Address
5938                     	xref	_Blink_30
5939                     	xref	_Blink_50
5940                     	xref	_SW_Status
5941                     	xref	_LIN20_Select_Device
5942                     	xref	_Mode_Select_Status
5943                     .const:	section	.text
5944  0000               L5303:
5945  0000 4e00          	dc.b	"N",0
5946  0002               L1303:
5947  0002 2000          	dc.b	" ",0
5948  0004               L5203:
5949  0004 4300          	dc.b	"C",0
5950  0006               L5572:
5951  0006 414400        	dc.b	"AD",0
5952  0009               L1372:
5953  0009 4e4e202000    	dc.b	"NN  ",0
5954  000e               L7762:
5955  000e 5700          	dc.b	"W",0
5956  0010               L5662:
5957  0010 4100          	dc.b	"A",0
5958  0012               L3562:
5959  0012 5600          	dc.b	"V",0
5960  0014               L7462:
5961  0014 4e4e2000      	dc.b	"NN ",0
5962  0018               L5062:
5963  0018 564420496e41  	dc.b	"VD InAct",0
5964  0021               L7752:
5965  0021 564420416374  	dc.b	"VD Act",0
5966  0028               L7452:
5967  0028 496e766c6400  	dc.b	"Invld",0
5968  002e               L1452:
5969  002e 4c4400        	dc.b	"LD",0
5970  0031               L3352:
5971  0031 4e6f204c4400  	dc.b	"No LD",0
5972  0037               L1342:
5973  0037 2e00          	dc.b	".",0
5974  0039               L5242:
5975  0039 202020202020  	dc.b	"       ",0
5976  0041               L3732:
5977  0041 2500          	dc.b	"%",0
5978  0043               L7632:
5979  0043 202020202000  	dc.b	"     ",0
5980  0049               L3632:
5981  0049 445f556e6974  	dc.b	"D_Unit:",0
5982  0051               L1632:
5983  0051 2a4f5054494f  	dc.b	"*OPTION*",0
5984  005a               L7332:
5985  005a 434552523a00  	dc.b	"CERR:",0
5986  0060               L5332:
5987  0060 49444c473a20  	dc.b	"IDLG:    OTMP:",0
5988  006f               L3332:
5989  006f 4f564c3a2020  	dc.b	"OVL:    UU :",0
5990  007c               L1332:
5991  007c 5343203a2020  	dc.b	"SC :    TOUT:",0
5992  008a               L7232:
5993  008a 43552d4100    	dc.b	"CU-A",0
5994  008f               L5232:
5995  008f 53572d443a00  	dc.b	"SW-D:",0
5996  0095               L3232:
5997  0095 49474e3a00    	dc.b	"IGN:",0
5998  009a               L1232:
5999  009a 5450573a00    	dc.b	"TPW:",0
6000  009f               L7132:
6001  009f 5057523a00    	dc.b	"PWR:",0
6002  00a4               L5132:
6003  00a4 4355523a00    	dc.b	"CUR:",0
6004  00a9               L3132:
6005  00a9 4856203a00    	dc.b	"HV :",0
6006  00ae               L1132:
6007  00ae 5544493a00    	dc.b	"UDI:",0
6008  00b3               L7032:
6009  00b3 4c44203a00    	dc.b	"LD :",0
6010  00b8               L5032:
6011  00b8 5441523a00    	dc.b	"TAR:",0
6012  00bd               L3032:
6013  00bd 00            	dc.b	0
6014  00be               L1032:
6015  00be 4430323a00    	dc.b	"D02:",0
6016  00c3               L7722:
6017  00c3 4430313a00    	dc.b	"D01:",0
6018  00c8               L5722:
6019  00c8 4430303a00    	dc.b	"D00:",0
6020                     	xref.b	c_y
6040                     	end

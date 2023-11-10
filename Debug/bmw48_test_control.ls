   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _uc_Rx1_Lin_Data:
2660  0000 00            	dc.b	0
2661  0001 00            	ds.b	1
2662  0002               _uc_Rx2_Lin_Data:
2663  0002 00            	dc.b	0
2664  0003 000000000000  	ds.b	7
2665  000a               _uc_Rx3_Lin_Data:
2666  000a 00            	dc.b	0
2667  000b 000000000000  	ds.b	7
2708                     ; 43 void Test_Ctrl_Reset_Values(void)
2708                     ; 44 {
2709                     	switch	.text
2710  0000               f_Test_Ctrl_Reset_Values:
2714                     ; 45 	uc_Test_Page_Now = (U8)(1);		// Test_Controller_Page_Now
2716  0000 35010003      	mov	_uc_Test_Page_Now,#1
2717                     ; 46 	uc_Test_Page_Pre = (U8)(0);		// Test_Controller_Page_Previous
2719  0004 725f0002      	clr	_uc_Test_Page_Pre
2720                     ; 48 	uc_Test_Data_Select_Num = (U8)(4);	// Test_Controller_Data_Selection_Number
2722  0008 35040001      	mov	_uc_Test_Data_Select_Num,#4
2723                     ; 50 	ui_FET1_Duty = (U8)(0);		// FET1_Direct_Control_Duty
2725  000c 5f            	clrw	x
2726  000d cf0011        	ldw	_ui_FET1_Duty,x
2727                     ; 51 	ui_FET2_Duty = (U8)(0);		// FET2_Direct_Control_Duty
2729  0010 cf000f        	ldw	_ui_FET2_Duty,x
2730                     ; 52 	ui_FET3_Duty = (U8)(0);		// FET3_Direct_Control_Duty
2732  0013 cf000d        	ldw	_ui_FET3_Duty,x
2733                     ; 54 	uc_Ctr_TARVL = (U8)(0);		// PTC_Control_Percentage
2735  0016 725f000c      	clr	_uc_Ctr_TARVL
2736                     ; 55 	uc_Ctr_LD = (U8)(0);			// PTC_Load_Control_Flag
2738  001a 725f000b      	clr	_uc_Ctr_LD
2739                     ; 56 	uc_Ctr_U_DIAG = (U8)(0);		// Voltage_Diag_Control_Flag
2741  001e 725f000a      	clr	_uc_Ctr_U_DIAG
2742                     ; 58 	uc_Duty_Unit = (U8)(1);		// Duty_Moving_Unit
2744  0022 35010000      	mov	_uc_Duty_Unit,#1
2745                     ; 60 	return;
2748  0026 87            	retf	
2795                     ; 65 void Test_Ctrl_Value_Change(U8 uc_st)
2795                     ; 66 {
2796                     	switch	.text
2797  0027               f_Test_Ctrl_Value_Change:
2799  0027 88            	push	a
2800  0028 88            	push	a
2801       00000001      OFST:	set	1
2804                     ; 70 	if(uc_st == 1){	
2806  0029 4a            	dec	a
2807  002a 2704acef00ef  	jrne	L7371
2808                     ; 71 		if(uc_Test_Data_Select_Num == (U8)(0)){	// FET1_Switching_Duty_Up
2810  0030 725d0001      	tnz	_uc_Test_Data_Select_Num
2811  0034 2617          	jrne	L1471
2812                     ; 72 			if(ui_FET1_Duty < (U16)(1000)){ ui_FET1_Duty++; }
2814  0036 ce0011        	ldw	x,_ui_FET1_Duty
2815  0039 a303e8        	cpw	x,#1000
2816  003c 2504ac980198  	jruge	L7102
2819  0042 ce0011        	ldw	x,_ui_FET1_Duty
2820  0045 5c            	incw	x
2821  0046 cf0011        	ldw	_ui_FET1_Duty,x
2822  0049 ac980198      	jra	L7102
2823  004d               L1471:
2824                     ; 74 		else if(uc_Test_Data_Select_Num == (U8)(1)){	// FET2_Switching_Duty_Up
2826  004d c60001        	ld	a,_uc_Test_Data_Select_Num
2827  0050 4a            	dec	a
2828  0051 2613          	jrne	L7471
2829                     ; 75 			if(ui_FET2_Duty < (U16)(1000)){ ui_FET2_Duty++; }
2831  0053 ce000f        	ldw	x,_ui_FET2_Duty
2832  0056 a303e8        	cpw	x,#1000
2833  0059 24ee          	jruge	L7102
2836  005b ce000f        	ldw	x,_ui_FET2_Duty
2837  005e 5c            	incw	x
2838  005f cf000f        	ldw	_ui_FET2_Duty,x
2839  0062 ac980198      	jra	L7102
2840  0066               L7471:
2841                     ; 77 		else if(uc_Test_Data_Select_Num == (U8)(2)){	// FET3_Switching_Duty_Up
2843  0066 c60001        	ld	a,_uc_Test_Data_Select_Num
2844  0069 a102          	cp	a,#2
2845  006b 2613          	jrne	L5571
2846                     ; 78 			if(ui_FET3_Duty < (U16)(1000)){ ui_FET3_Duty++; }
2848  006d ce000d        	ldw	x,_ui_FET3_Duty
2849  0070 a303e8        	cpw	x,#1000
2850  0073 24ed          	jruge	L7102
2853  0075 ce000d        	ldw	x,_ui_FET3_Duty
2854  0078 5c            	incw	x
2855  0079 cf000d        	ldw	_ui_FET3_Duty,x
2856  007c ac980198      	jra	L7102
2857  0080               L5571:
2858                     ; 81 		else if(uc_Test_Data_Select_Num == (U8)(4)){	// PTC_Target_Percentage_Up
2860  0080 c60001        	ld	a,_uc_Test_Data_Select_Num
2861  0083 a104          	cp	a,#4
2862  0085 2622          	jrne	L3671
2863                     ; 82 			if(uc_Ctr_TARVL < (U8)(100)){
2865  0087 c6000c        	ld	a,_uc_Ctr_TARVL
2866  008a a164          	cp	a,#100
2867  008c 24ee          	jruge	L7102
2868                     ; 83 				uc_buffer = (U8)(uc_Ctr_TARVL + uc_Duty_Unit);
2870  008e c6000c        	ld	a,_uc_Ctr_TARVL
2871  0091 cb0000        	add	a,_uc_Duty_Unit
2872  0094 6b01          	ld	(OFST+0,sp),a
2873                     ; 84 				if(uc_buffer > (U8)(100)){ uc_Ctr_TARVL = (U8)(100); }
2875  0096 a165          	cp	a,#101
2876  0098 2508          	jrult	L7671
2879  009a 3564000c      	mov	_uc_Ctr_TARVL,#100
2881  009e ac980198      	jra	L7102
2882  00a2               L7671:
2883                     ; 85 				else{ uc_Ctr_TARVL = uc_buffer; }
2885  00a2 c7000c        	ld	_uc_Ctr_TARVL,a
2886  00a5 ac980198      	jra	L7102
2887  00a9               L3671:
2888                     ; 88 		else if(uc_Test_Data_Select_Num == (U8)(5)){	// PTC_Load_Control
2890  00a9 c60001        	ld	a,_uc_Test_Data_Select_Num
2891  00ac a105          	cp	a,#5
2892  00ae 261c          	jrne	L5771
2893                     ; 89 			if(uc_Ctr_LD == (U8)(0)){ uc_Ctr_LD = (U8)(2); }	// Data_Rolling
2895  00b0 725d000b      	tnz	_uc_Ctr_LD
2896  00b4 2608          	jrne	L7771
2899  00b6 3502000b      	mov	_uc_Ctr_LD,#2
2901  00ba ac980198      	jra	L7102
2902  00be               L7771:
2903                     ; 90 			else if(uc_Ctr_LD > (U8)(0)){ uc_Ctr_LD--; }		
2905  00be 725d000b      	tnz	_uc_Ctr_LD
2906  00c2 27f6          	jreq	L7102
2909  00c4 725a000b      	dec	_uc_Ctr_LD
2910  00c8 ac980198      	jra	L7102
2911  00cc               L5771:
2912                     ; 92 		else if(uc_Test_Data_Select_Num == (U8)(6)){	// PTC_HV_DIAG_Active_Control
2914  00cc c60001        	ld	a,_uc_Test_Data_Select_Num
2915  00cf a106          	cp	a,#6
2916  00d1 26f5          	jrne	L7102
2917                     ; 93 			if(uc_Ctr_U_DIAG == (U8)(0)){ uc_Ctr_U_DIAG = (U8)(2); }	// Data_Rolling
2919  00d3 725d000a      	tnz	_uc_Ctr_U_DIAG
2920  00d7 2608          	jrne	L1102
2923  00d9 3502000a      	mov	_uc_Ctr_U_DIAG,#2
2925  00dd ac980198      	jra	L7102
2926  00e1               L1102:
2927                     ; 94 			else if(uc_Ctr_U_DIAG > (U8)(0)){ uc_Ctr_U_DIAG--; }	
2929  00e1 725d000a      	tnz	_uc_Ctr_U_DIAG
2930  00e5 27f6          	jreq	L7102
2933  00e7 725a000a      	dec	_uc_Ctr_U_DIAG
2934  00eb ac980198      	jra	L7102
2935  00ef               L7371:
2936                     ; 98 	else if(uc_st == 0){	
2938  00ef 7b02          	ld	a,(OFST+1,sp)
2939  00f1 26f8          	jrne	L7102
2940                     ; 99 		if(uc_Test_Data_Select_Num == (U8)(0)){	// FET1_Switching_Duty_Up
2942  00f3 725d0001      	tnz	_uc_Test_Data_Select_Num
2943  00f7 2610          	jrne	L3202
2944                     ; 100 			if(ui_FET1_Duty > (U16)(0)){ ui_FET1_Duty--; }
2946  00f9 ce0011        	ldw	x,_ui_FET1_Duty
2947  00fc 27ed          	jreq	L7102
2950  00fe ce0011        	ldw	x,_ui_FET1_Duty
2951  0101 5a            	decw	x
2952  0102 cf0011        	ldw	_ui_FET1_Duty,x
2953  0105 ac980198      	jra	L7102
2954  0109               L3202:
2955                     ; 102 		else if(uc_Test_Data_Select_Num == (U8)(1)){	// FET2_Switching_Duty_Up
2957  0109 c60001        	ld	a,_uc_Test_Data_Select_Num
2958  010c 4a            	dec	a
2959  010d 260e          	jrne	L1302
2960                     ; 103 			if(ui_FET2_Duty > (U16)(0)){ ui_FET2_Duty--; }
2962  010f ce000f        	ldw	x,_ui_FET2_Duty
2963  0112 27f1          	jreq	L7102
2966  0114 ce000f        	ldw	x,_ui_FET2_Duty
2967  0117 5a            	decw	x
2968  0118 cf000f        	ldw	_ui_FET2_Duty,x
2969  011b 207b          	jra	L7102
2970  011d               L1302:
2971                     ; 105 		else if(uc_Test_Data_Select_Num == (U8)(2)){	// FET3_Switching_Duty_Up
2973  011d c60001        	ld	a,_uc_Test_Data_Select_Num
2974  0120 a102          	cp	a,#2
2975  0122 260e          	jrne	L7302
2976                     ; 106 			if(ui_FET3_Duty > (U16)(0)){ ui_FET3_Duty--; }
2978  0124 ce000d        	ldw	x,_ui_FET3_Duty
2979  0127 276f          	jreq	L7102
2982  0129 ce000d        	ldw	x,_ui_FET3_Duty
2983  012c 5a            	decw	x
2984  012d cf000d        	ldw	_ui_FET3_Duty,x
2985  0130 2066          	jra	L7102
2986  0132               L7302:
2987                     ; 109 		else if(uc_Test_Data_Select_Num == (U8)(4)){	// PTC_Target_Percentage_Up
2989  0132 c60001        	ld	a,_uc_Test_Data_Select_Num
2990  0135 a104          	cp	a,#4
2991  0137 261f          	jrne	L5402
2992                     ; 110 			if(uc_Ctr_TARVL > (U8)(0)){
2994  0139 725d000c      	tnz	_uc_Ctr_TARVL
2995  013d 2759          	jreq	L7102
2996                     ; 111 				if(uc_Duty_Unit >= uc_Ctr_TARVL){ uc_Ctr_TARVL = (U8)(0); }
2998  013f c60000        	ld	a,_uc_Duty_Unit
2999  0142 c1000c        	cp	a,_uc_Ctr_TARVL
3000  0145 2506          	jrult	L1502
3003  0147 725f000c      	clr	_uc_Ctr_TARVL
3005  014b 204b          	jra	L7102
3006  014d               L1502:
3007                     ; 112 				else{ uc_Ctr_TARVL -= uc_Duty_Unit; }
3009  014d c6000c        	ld	a,_uc_Ctr_TARVL
3010  0150 c00000        	sub	a,_uc_Duty_Unit
3011  0153 c7000c        	ld	_uc_Ctr_TARVL,a
3012  0156 2040          	jra	L7102
3013  0158               L5402:
3014                     ; 115 		else if(uc_Test_Data_Select_Num == (U8)(5)){	// PTC_Load_Control
3016  0158 c60001        	ld	a,_uc_Test_Data_Select_Num
3017  015b a105          	cp	a,#5
3018  015d 261a          	jrne	L7502
3019                     ; 116 			if(uc_Ctr_LD == (U8)(2)){ uc_Ctr_LD = (U8)(0); }	// Data_Rolling
3021  015f c6000b        	ld	a,_uc_Ctr_LD
3022  0162 a102          	cp	a,#2
3023  0164 2606          	jrne	L1602
3026  0166 725f000b      	clr	_uc_Ctr_LD
3028  016a 202c          	jra	L7102
3029  016c               L1602:
3030                     ; 117 			else if(uc_Ctr_LD < (U8)(2)){ uc_Ctr_LD++; }
3032  016c c6000b        	ld	a,_uc_Ctr_LD
3033  016f a102          	cp	a,#2
3034  0171 2425          	jruge	L7102
3037  0173 725c000b      	inc	_uc_Ctr_LD
3038  0177 201f          	jra	L7102
3039  0179               L7502:
3040                     ; 119 		else if(uc_Test_Data_Select_Num == (U8)(6)){	// PTC_HV_DIAG_Active_Control
3042  0179 c60001        	ld	a,_uc_Test_Data_Select_Num
3043  017c a106          	cp	a,#6
3044  017e 2618          	jrne	L7102
3045                     ; 120 			if(uc_Ctr_U_DIAG == (U8)(2)){ uc_Ctr_U_DIAG = (U8)(0); }	// Data_Rolling
3047  0180 c6000a        	ld	a,_uc_Ctr_U_DIAG
3048  0183 a102          	cp	a,#2
3049  0185 2606          	jrne	L3702
3052  0187 725f000a      	clr	_uc_Ctr_U_DIAG
3054  018b 200b          	jra	L7102
3055  018d               L3702:
3056                     ; 121 			else if(uc_Ctr_U_DIAG < (U8)(2)){ uc_Ctr_U_DIAG++; }
3058  018d c6000a        	ld	a,_uc_Ctr_U_DIAG
3059  0190 a102          	cp	a,#2
3060  0192 2404          	jruge	L7102
3063  0194 725c000a      	inc	_uc_Ctr_U_DIAG
3064  0198               L7102:
3065                     ; 125 	return ;
3068  0198 85            	popw	x
3069  0199 87            	retf	
3101                     ; 130 void Test_Ctrl_Swtich_Control(void)
3101                     ; 131 {
3102                     	switch	.text
3103  019a               f_Test_Ctrl_Swtich_Control:
3107                     ; 133 	if(UP_SW_flag == ON){
3109  019a 720300006f    	btjf	_SW_Status,#1,L1112
3110                     ; 135 		if(b_Test_Option_flag == ON){ if(uc_Duty_Unit < 100){ uc_Duty_Unit++;}}
3112  019f 720700140d    	btjf	_uc_Test_Ctrl_Reg,#3,L3112
3115  01a4 c60000        	ld	a,_uc_Duty_Unit
3116  01a7 a164          	cp	a,#100
3117  01a9 245d          	jruge	L7112
3120  01ab 725c0000      	inc	_uc_Duty_Unit
3121  01af 2057          	jra	L7112
3122  01b1               L3112:
3123                     ; 137 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
3125  01b1 7203001408    	btjf	_uc_Test_Ctrl_Reg,#1,L1212
3128  01b6 a601          	ld	a,#1
3129  01b8 8d270027      	callf	f_Test_Ctrl_Value_Change
3132  01bc 204a          	jra	L7112
3133  01be               L1212:
3134                     ; 138 			else if(b_Data_Select_flag == ON){
3136  01be 7201001425    	btjf	_uc_Test_Ctrl_Reg,#0,L5212
3137                     ; 139 				if(uc_Test_Page_Now == (U8)(0)){
3139  01c3 725d0003      	tnz	_uc_Test_Page_Now
3140  01c7 260c          	jrne	L7212
3141                     ; 140 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3143  01c9 725d0001      	tnz	_uc_Test_Data_Select_Num
3144  01cd 2739          	jreq	L7112
3147  01cf 725a0001      	dec	_uc_Test_Data_Select_Num
3148  01d3 2033          	jra	L7112
3149  01d5               L7212:
3150                     ; 142 				else if(uc_Test_Page_Now == (U8)(1)){
3152  01d5 c60003        	ld	a,_uc_Test_Page_Now
3153  01d8 4a            	dec	a
3154  01d9 262d          	jrne	L7112
3155                     ; 143 					if(uc_Test_Data_Select_Num > 4){ uc_Test_Data_Select_Num--; }
3157  01db c60001        	ld	a,_uc_Test_Data_Select_Num
3158  01de a105          	cp	a,#5
3159  01e0 2526          	jrult	L7112
3162  01e2 725a0001      	dec	_uc_Test_Data_Select_Num
3163  01e6 2020          	jra	L7112
3164  01e8               L5212:
3165                     ; 146 				if(uc_Test_Page_Now > 0){
3167  01e8 725d0003      	tnz	_uc_Test_Page_Now
3168  01ec 271a          	jreq	L7112
3169                     ; 147 					uc_Test_Page_Now--;
3171  01ee 725a0003      	dec	_uc_Test_Page_Now
3172                     ; 148 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3174  01f2 725d0003      	tnz	_uc_Test_Page_Now
3175  01f6 2606          	jrne	L5412
3178  01f8 725f0001      	clr	_uc_Test_Data_Select_Num
3180  01fc 200a          	jra	L7112
3181  01fe               L5412:
3182                     ; 149 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3184  01fe c60003        	ld	a,_uc_Test_Page_Now
3185  0201 4a            	dec	a
3186  0202 2604          	jrne	L7112
3189  0204 35040001      	mov	_uc_Test_Data_Select_Num,#4
3190  0208               L7112:
3191                     ; 153 		UP_SW_flag = OFF;
3193  0208 72130000      	bres	_SW_Status,#1
3195  020c 2073          	jra	L3512
3196  020e               L1112:
3197                     ; 157 	else if(DN_SW_flag == ON){ 
3199  020e 720500006e    	btjf	_SW_Status,#2,L3512
3200                     ; 159 		if(b_Test_Option_flag == ON){ if(uc_Duty_Unit > 1){ uc_Duty_Unit--;}}
3202  0213 720700140d    	btjf	_uc_Test_Ctrl_Reg,#3,L7512
3205  0218 c60000        	ld	a,_uc_Duty_Unit
3206  021b a102          	cp	a,#2
3207  021d 255e          	jrult	L3612
3210  021f 725a0000      	dec	_uc_Duty_Unit
3211  0223 2058          	jra	L3612
3212  0225               L7512:
3213                     ; 162 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
3215  0225 7203001407    	btjf	_uc_Test_Ctrl_Reg,#1,L5612
3218  022a 4f            	clr	a
3219  022b 8d270027      	callf	f_Test_Ctrl_Value_Change
3222  022f 204c          	jra	L3612
3223  0231               L5612:
3224                     ; 164 			else if(b_Data_Select_flag == ON){
3226  0231 7201001426    	btjf	_uc_Test_Ctrl_Reg,#0,L1712
3227                     ; 165 				if(uc_Test_Page_Now == (U8)(0)){
3229  0236 725d0003      	tnz	_uc_Test_Page_Now
3230  023a 260d          	jrne	L3712
3231                     ; 166 					if(uc_Test_Data_Select_Num < 2){ uc_Test_Data_Select_Num++; }
3233  023c c60001        	ld	a,_uc_Test_Data_Select_Num
3234  023f a102          	cp	a,#2
3235  0241 243a          	jruge	L3612
3238  0243 725c0001      	inc	_uc_Test_Data_Select_Num
3239  0247 2034          	jra	L3612
3240  0249               L3712:
3241                     ; 168 				else if(uc_Test_Page_Now == (U8)(1)){
3243  0249 c60003        	ld	a,_uc_Test_Page_Now
3244  024c 4a            	dec	a
3245  024d 262e          	jrne	L3612
3246                     ; 169 					if(uc_Test_Data_Select_Num < 6){ uc_Test_Data_Select_Num++; }
3248  024f c60001        	ld	a,_uc_Test_Data_Select_Num
3249  0252 a106          	cp	a,#6
3250  0254 2427          	jruge	L3612
3253  0256 725c0001      	inc	_uc_Test_Data_Select_Num
3254  025a 2021          	jra	L3612
3255  025c               L1712:
3256                     ; 172 				if(uc_Test_Page_Now < 4){
3258  025c c60003        	ld	a,_uc_Test_Page_Now
3259  025f a104          	cp	a,#4
3260  0261 241a          	jruge	L3612
3261                     ; 173 					uc_Test_Page_Now++;
3263  0263 725c0003      	inc	_uc_Test_Page_Now
3264                     ; 175 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3266  0267 725d0003      	tnz	_uc_Test_Page_Now
3267  026b 2606          	jrne	L1122
3270  026d 725f0001      	clr	_uc_Test_Data_Select_Num
3272  0271 200a          	jra	L3612
3273  0273               L1122:
3274                     ; 176 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3276  0273 c60003        	ld	a,_uc_Test_Page_Now
3277  0276 4a            	dec	a
3278  0277 2604          	jrne	L3612
3281  0279 35040001      	mov	_uc_Test_Data_Select_Num,#4
3282  027d               L3612:
3283                     ; 180 		DN_SW_flag = OFF;
3285  027d 72150000      	bres	_SW_Status,#2
3286  0281               L3512:
3287                     ; 184 	if(SET_SW_flag == ON){
3289  0281 7207000029    	btjf	_SW_Status,#3,L7122
3290                     ; 185 		if(uc_Test_Page_Now < 2){
3292  0286 c60003        	ld	a,_uc_Test_Page_Now
3293  0289 a102          	cp	a,#2
3294  028b 2422          	jruge	L7122
3295                     ; 187 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
3297  028d 7200001406    	btjt	_uc_Test_Ctrl_Reg,#0,L3222
3300  0292 72100014      	bset	_uc_Test_Ctrl_Reg,#0
3302  0296 2013          	jra	L5222
3303  0298               L3222:
3304                     ; 189 				if(b_Data_Setting_flag == OFF){
3306  0298 7202001406    	btjt	_uc_Test_Ctrl_Reg,#1,L7222
3307                     ; 190 					b_Data_Setting_flag = ON;
3309  029d 72120014      	bset	_uc_Test_Ctrl_Reg,#1
3311  02a1 2008          	jra	L5222
3312  02a3               L7222:
3313                     ; 192 					b_Data_Setting_flag = OFF;
3315  02a3 72130014      	bres	_uc_Test_Ctrl_Reg,#1
3316                     ; 193 					b_Data_Select_flag = OFF;
3318  02a7 72110014      	bres	_uc_Test_Ctrl_Reg,#0
3319  02ab               L5222:
3320                     ; 196 			SET_SW_flag = OFF;
3322  02ab 72170000      	bres	_SW_Status,#3
3323  02af               L7122:
3324                     ; 201 	if(ON_OFF_SW_flag == ON){
3326  02af 7201000013    	btjf	_SW_Status,#0,L3322
3327                     ; 202 		if(b_Lin_Com_On_flag == OFF){b_Lin_Com_On_flag = ON;}
3329  02b4 7204001406    	btjt	_uc_Test_Ctrl_Reg,#2,L5322
3332  02b9 72140014      	bset	_uc_Test_Ctrl_Reg,#2
3334  02bd 2004          	jra	L7322
3335  02bf               L5322:
3336                     ; 204 			b_Lin_Com_On_flag = OFF;  
3338  02bf 72150014      	bres	_uc_Test_Ctrl_Reg,#2
3339  02c3               L7322:
3340                     ; 207 		ON_OFF_SW_flag = OFF;
3342  02c3 72110000      	bres	_SW_Status,#0
3343  02c7               L3322:
3344                     ; 211 	if(OP_SW_flag == ON){
3346  02c7 7209000017    	btjf	_SW_Status,#4,L1422
3347                     ; 213 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; Clear_Display_LCD();}
3349  02cc 7206001406    	btjt	_uc_Test_Ctrl_Reg,#3,L3422
3352  02d1 72160014      	bset	_uc_Test_Ctrl_Reg,#3
3356  02d5 2004          	jra	L5422
3357  02d7               L3422:
3358                     ; 214 		else{b_Test_Option_flag = OFF; Clear_Display_LCD();}
3360  02d7 72170014      	bres	_uc_Test_Ctrl_Reg,#3
3364  02db               L5422:
3366  02db 8d000000      	callf	f_Clear_Display_LCD
3367                     ; 216 		OP_SW_flag = OFF;
3369  02df 72190000      	bres	_SW_Status,#4
3370  02e3               L1422:
3371                     ; 221 	if(EN_SW_flag == ON){
3373  02e3 720b00001f    	btjf	_SW_Status,#5,L7422
3374                     ; 222 		if(!b_First_Logic_On){ b_First_Logic_On= ON; Clear_Display_LCD(); }
3376  02e8 720000000a    	btjt	_uc_System_Ctrl_Reg,#0,L1522
3379  02ed 72100000      	bset	_uc_System_Ctrl_Reg,#0
3382  02f1 8d000000      	callf	f_Clear_Display_LCD
3385  02f5 200c          	jra	L3522
3386  02f7               L1522:
3387                     ; 225 			b_Lin_Com_On_flag = OFF;
3389  02f7 72150014      	bres	_uc_Test_Ctrl_Reg,#2
3390                     ; 226 			b_First_Logic_On = OFF;
3392  02fb 72110000      	bres	_uc_System_Ctrl_Reg,#0
3393                     ; 227 			Test_Ctrl_Reset_Values();	
3395  02ff 8d000000      	callf	f_Test_Ctrl_Reset_Values
3397  0303               L3522:
3398                     ; 229 		EN_SW_flag = OFF;
3400  0303 721b0000      	bres	_SW_Status,#5
3401  0307               L7422:
3402                     ; 232 	return;
3405  0307 87            	retf	
3431                     ; 237 void Test_Ctrl_Text_Display_Handling(void)
3431                     ; 238 {
3432                     	switch	.text
3433  0308               f_Test_Ctrl_Text_Display_Handling:
3437                     ; 239 	switch(uc_Test_Page_Now){
3439  0308 c60003        	ld	a,_uc_Test_Page_Now
3441                     ; 282 		default: break;
3442  030b 2711          	jreq	L5522
3443  030d 4a            	dec	a
3444  030e 272b          	jreq	L7522
3445  0310 4a            	dec	a
3446  0311 2751          	jreq	L1622
3447  0313 4a            	dec	a
3448  0314 2777          	jreq	L3622
3449  0316 4a            	dec	a
3450  0317 2604acaa03aa  	jreq	L5622
3452  031d 87            	retf	
3453  031e               L5522:
3454                     ; 242 		case 0:	strcpy(LCD_Dis_Data[0],"D00:");	// FET1_Switching_Duty_Control
3456  031e ae00cd        	ldw	x,#L5032
3457  0321 89            	pushw	x
3458  0322 ae0000        	ldw	x,#_LCD_Dis_Data
3459  0325 8d000000      	callf	f_strcpy
3461  0329 85            	popw	x
3462                     ; 243 				strcpy(LCD_Dis_Data[1],"D01:");	// FET2_Switching_Duty_Control
3464  032a ae00c8        	ldw	x,#L7032
3465  032d 89            	pushw	x
3466  032e ae0010        	ldw	x,#_LCD_Dis_Data+16
3467  0331 8d000000      	callf	f_strcpy
3469  0335 85            	popw	x
3470                     ; 244 				strcpy(LCD_Dis_Data[2],"D02:");	// FET3_Switching_Duty_Control
3472  0336 ae00c3        	ldw	x,#L1132
3474                     ; 245 				strcpy(LCD_Dis_Data[3],"");		// Null
3476                     ; 247 				break;
3478  0339 201b          	jpf	LC002
3479  033b               L7522:
3480                     ; 250 		case 1:	strcpy(LCD_Dis_Data[0],"TAR:");	// Target_Power_Percentage_Control
3482  033b ae00bd        	ldw	x,#L5132
3483  033e 89            	pushw	x
3484  033f ae0000        	ldw	x,#_LCD_Dis_Data
3485  0342 8d000000      	callf	f_strcpy
3487  0346 85            	popw	x
3488                     ; 251 				strcpy(LCD_Dis_Data[1],"LD :");		// Heater_Load_Active_Inactive_Control
3490  0347 ae00b8        	ldw	x,#L7132
3491  034a 89            	pushw	x
3492  034b ae0010        	ldw	x,#_LCD_Dis_Data+16
3493  034e 8d000000      	callf	f_strcpy
3495  0352 85            	popw	x
3496                     ; 252 				strcpy(LCD_Dis_Data[2],"UDI:");	// Voltage_Diagnositcs_Active_Inactive_Control
3498  0353 ae00b3        	ldw	x,#L1232
3500                     ; 253 				strcpy(LCD_Dis_Data[3],"");		// Null
3502  0356               LC002:
3503  0356 89            	pushw	x
3504  0357 ae0020        	ldw	x,#_LCD_Dis_Data+32
3505  035a 8d000000      	callf	f_strcpy
3506  035e 85            	popw	x
3509  035f ae00c2        	ldw	x,#L3132
3511                     ; 255 				break;
3513  0362 206d          	jpf	LC001
3514  0364               L1622:
3515                     ; 258 		case 2: 	strcpy(LCD_Dis_Data[0],"HV :");		// Input_HV_Value_Display
3517  0364 ae00ae        	ldw	x,#L3232
3518  0367 89            	pushw	x
3519  0368 ae0000        	ldw	x,#_LCD_Dis_Data
3520  036b 8d000000      	callf	f_strcpy
3522  036f 85            	popw	x
3523                     ; 259 				strcpy(LCD_Dis_Data[1],"CUR:");	// Consumption_Current_Display
3525  0370 ae00a9        	ldw	x,#L5232
3526  0373 89            	pushw	x
3527  0374 ae0010        	ldw	x,#_LCD_Dis_Data+16
3528  0377 8d000000      	callf	f_strcpy
3530  037b 85            	popw	x
3531                     ; 260 				strcpy(LCD_Dis_Data[2],"PWR:");	// Consumption_Power_Display
3533  037c ae00a4        	ldw	x,#L7232
3534  037f 89            	pushw	x
3535  0380 ae0020        	ldw	x,#_LCD_Dis_Data+32
3536  0383 8d000000      	callf	f_strcpy
3538  0387 85            	popw	x
3539                     ; 261 				strcpy(LCD_Dis_Data[3],"TPW:");	// Target_Power_Dispaly
3541  0388 ae009f        	ldw	x,#L1332
3543                     ; 263 				break;
3545  038b 2044          	jpf	LC001
3546  038d               L3622:
3547                     ; 266 		case 3: 	strcpy(LCD_Dis_Data[0],"IGN:");	// IGN_Voltage_Display
3549  038d ae009a        	ldw	x,#L3332
3550  0390 89            	pushw	x
3551  0391 ae0000        	ldw	x,#_LCD_Dis_Data
3552  0394 8d000000      	callf	f_strcpy
3554  0398 85            	popw	x
3555                     ; 267 				strcpy(LCD_Dis_Data[1],"SWD:");	// FET_Siwtching_Duty_Display
3557  0399 ae0095        	ldw	x,#L5332
3558  039c 89            	pushw	x
3559  039d ae0010        	ldw	x,#_LCD_Dis_Data+16
3560  03a0 8d000000      	callf	f_strcpy
3562  03a4 85            	popw	x
3563                     ; 268 				strcpy(LCD_Dis_Data[2],"CUA");	// Current_Sensor_AD_Conversion_Value_Display
3565  03a5 ae0091        	ldw	x,#L7332
3567                     ; 269 				strcpy(LCD_Dis_Data[3],"");
3569                     ; 271 				break;
3571  03a8 20ac          	jpf	LC002
3572  03aa               L5622:
3573                     ; 274 		case 4: 	strcpy(LCD_Dis_Data[0],"SC:    Tm:");
3575  03aa ae0086        	ldw	x,#L1432
3576  03ad 89            	pushw	x
3577  03ae ae0000        	ldw	x,#_LCD_Dis_Data
3578  03b1 8d000000      	callf	f_strcpy
3580  03b5 85            	popw	x
3581                     ; 275 				strcpy(LCD_Dis_Data[1],"OV:    UU:");
3583  03b6 ae007b        	ldw	x,#L3432
3584  03b9 89            	pushw	x
3585  03ba ae0010        	ldw	x,#_LCD_Dis_Data+16
3586  03bd 8d000000      	callf	f_strcpy
3588  03c1 85            	popw	x
3589                     ; 276 				strcpy(LCD_Dis_Data[2],"ID:    OT:");
3591  03c2 ae0070        	ldw	x,#L5432
3592  03c5 89            	pushw	x
3593  03c6 ae0020        	ldw	x,#_LCD_Dis_Data+32
3594  03c9 8d000000      	callf	f_strcpy
3596  03cd 85            	popw	x
3597                     ; 277 				strcpy(LCD_Dis_Data[3],"CE:");
3599  03ce ae006c        	ldw	x,#L7432
3601  03d1               LC001:
3602  03d1 89            	pushw	x
3603  03d2 ae0030        	ldw	x,#_LCD_Dis_Data+48
3604  03d5 8d000000      	callf	f_strcpy
3605  03d9 85            	popw	x
3606                     ; 279 				break;
3608                     ; 282 		default: break;
3610                     ; 285 	return;
3613  03da 87            	retf	
3682                     ; 290 void Test_Ctrl_LCD_Display_Control(void)
3682                     ; 291 {
3683                     	switch	.text
3684  03db               f_Test_Ctrl_LCD_Display_Control:
3686  03db 5206          	subw	sp,#6
3687       00000006      OFST:	set	6
3690                     ; 297 	if(b_Test_Option_flag == ON){
3692  03dd 7207001441    	btjf	_uc_Test_Ctrl_Reg,#3,L1732
3693                     ; 298 		Set_LCD_Address(LCD_Line[0]);
3695  03e2 c60000        	ld	a,_LCD_Line
3696  03e5 8d000000      	callf	f_Set_LCD_Address
3698                     ; 299 		Display_LCD_String("*OPTION*");
3700  03e9 ae0063        	ldw	x,#L3732
3701  03ec 8d000000      	callf	f_Display_LCD_String
3703                     ; 300 		Set_LCD_Address(LCD_Line[1]);
3705  03f0 c60001        	ld	a,_LCD_Line+1
3706  03f3 8d000000      	callf	f_Set_LCD_Address
3708                     ; 301 		Display_LCD_String("D_Unit:");
3710  03f7 ae005b        	ldw	x,#L5732
3711  03fa 8d000000      	callf	f_Display_LCD_String
3713                     ; 303 		Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
3715  03fe c60001        	ld	a,_LCD_Line+1
3716  0401 ab07          	add	a,#7
3717  0403 8d000000      	callf	f_Set_LCD_Address
3719                     ; 304 		if(b_Blink_250_Flag){Display_LCD_String("     ");}
3721  0407 7203000007    	btjf	_uc_LCD_Blink_Reg,#1,L7732
3724  040c ae0055        	ldw	x,#L1042
3727  040f ac030b03      	jra	L3123
3728  0413               L7732:
3729                     ; 306 			Num_Display_LCD(uc_Duty_Unit);
3731  0413 c60000        	ld	a,_uc_Duty_Unit
3732  0416 5f            	clrw	x
3733  0417 97            	ld	xl,a
3734  0418 8d000000      	callf	f_Num_Display_LCD
3736                     ; 307 			Display_LCD_String("%");
3738  041c ae0053        	ldw	x,#L5042
3740                     ; 309 		return;
3742  041f ac030b03      	jra	L3123
3743  0423               L1732:
3744                     ; 312 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Test_Ctrl_Text_Display_Handling(); Clear_Display_LCD();}
3746  0423 c60003        	ld	a,_uc_Test_Page_Now
3747  0426 c10002        	cp	a,_uc_Test_Page_Pre
3748  0429 2708          	jreq	L7042
3751  042b 8d080308      	callf	f_Test_Ctrl_Text_Display_Handling
3755  042f 8d000000      	callf	f_Clear_Display_LCD
3757  0433               L7042:
3758                     ; 313 	uc_Test_Page_Pre = uc_Test_Page_Now ;
3760  0433 5500030002    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
3761                     ; 316 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
3763  0438 725d0003      	tnz	_uc_Test_Page_Now
3764  043c 2704ac320532  	jrne	L1142
3765                     ; 317 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3767  0442 4f            	clr	a
3768  0443 6b06          	ld	(OFST+0,sp),a
3769  0445               L3142:
3770                     ; 318 			Set_LCD_Address(LCD_Line[uc_line_index]);
3772  0445 5f            	clrw	x
3773  0446 97            	ld	xl,a
3774  0447 d60000        	ld	a,(_LCD_Line,x)
3775  044a 8d000000      	callf	f_Set_LCD_Address
3777                     ; 320 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF) && (uc_line_index == uc_Test_Data_Select_Num)){
3779  044e 7201001418    	btjf	_uc_Test_Ctrl_Reg,#0,L1242
3781  0453 7202001413    	btjt	_uc_Test_Ctrl_Reg,#1,L1242
3783  0458 7b06          	ld	a,(OFST+0,sp)
3784  045a c10001        	cp	a,_uc_Test_Data_Select_Num
3785  045d 260c          	jrne	L1242
3786                     ; 321 				if(b_Blink_250_Flag){Display_LCD_String("     ");}
3788  045f 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L3242
3791  0464 ae0055        	ldw	x,#L1042
3794  0467 200b          	jra	L7242
3795  0469               L3242:
3796                     ; 322 				else{Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3798  0469 2002          	jpf	LC003
3799  046b               L1242:
3800                     ; 323 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3802  046b 7b06          	ld	a,(OFST+0,sp)
3803  046d               LC003:
3805  046d 97            	ld	xl,a
3806  046e a610          	ld	a,#16
3807  0470 42            	mul	x,a
3808  0471 1c0000        	addw	x,#_LCD_Dis_Data
3810  0474               L7242:
3811  0474 8d000000      	callf	f_Display_LCD_String
3812                     ; 325 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
3814  0478 7b06          	ld	a,(OFST+0,sp)
3815  047a 5f            	clrw	x
3816  047b 97            	ld	xl,a
3817  047c d60000        	ld	a,(_LCD_Line,x)
3818  047f ab05          	add	a,#5
3819  0481 8d000000      	callf	f_Set_LCD_Address
3821                     ; 328 			if(uc_line_index == (U8)(0)){		// LINE 1
3823  0485 7b06          	ld	a,(OFST+0,sp)
3824  0487 262b          	jrne	L1342
3825                     ; 329 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3827  0489 7203001424    	btjf	_uc_Test_Ctrl_Reg,#1,L3342
3829  048e c10001        	cp	a,_uc_Test_Data_Select_Num
3830  0491 2607          	jrne	L5342
3831                     ; 330 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
3833  0493 7203000002    	btjf	_uc_LCD_Blink_Reg,#1,L5342
3837  0498 205c          	jpf	LC009
3838  049a               L5342:
3839                     ; 332 						Num_Display_LCD(ui_FET1_Duty / (U16)(10));
3842                     ; 333 						Display_LCD_String(".");
3845                     ; 334 						Num_Display_LCD(ui_FET1_Duty % (U16)(10));
3848  049a ce0011        	ldw	x,_ui_FET1_Duty
3849  049d 90ae000a      	ldw	y,#10
3850  04a1 65            	divw	x,y
3851  04a2 8d000000      	callf	f_Num_Display_LCD
3853  04a6 ae0049        	ldw	x,#L3442
3854  04a9 8d000000      	callf	f_Display_LCD_String
3856  04ad ce0011        	ldw	x,_ui_FET1_Duty
3858                     ; 335 						Display_LCD_String("%");
3860  04b0 205f          	jpf	LC005
3861  04b2               L3342:
3862                     ; 338 					Num_Display_LCD(ui_FET1_Duty / (U16)(10));
3864                     ; 339 					Display_LCD_String(".");
3866                     ; 340 					Num_Display_LCD(ui_FET1_Duty % (U16)(10));
3868                     ; 341 					Display_LCD_String("%");
3870  04b2 20e6          	jpf	L5342
3871  04b4               L1342:
3872                     ; 345 			else if(uc_line_index == (U8)(1)){	// LINE 2
3874  04b4 a101          	cp	a,#1
3875  04b6 262b          	jrne	L1542
3876                     ; 346 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3878  04b8 7203001424    	btjf	_uc_Test_Ctrl_Reg,#1,L3542
3880  04bd c10001        	cp	a,_uc_Test_Data_Select_Num
3881  04c0 2607          	jrne	L5542
3882                     ; 347 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
3884  04c2 7203000002    	btjf	_uc_LCD_Blink_Reg,#1,L5542
3888  04c7 202d          	jpf	LC009
3889  04c9               L5542:
3890                     ; 349 						Num_Display_LCD(ui_FET2_Duty / (U16)(10));
3893                     ; 350 						Display_LCD_String(".");
3896                     ; 351 						Num_Display_LCD(ui_FET2_Duty % (U16)(10));
3899  04c9 ce000f        	ldw	x,_ui_FET2_Duty
3900  04cc 90ae000a      	ldw	y,#10
3901  04d0 65            	divw	x,y
3902  04d1 8d000000      	callf	f_Num_Display_LCD
3904  04d5 ae0049        	ldw	x,#L3442
3905  04d8 8d000000      	callf	f_Display_LCD_String
3907  04dc ce000f        	ldw	x,_ui_FET2_Duty
3909                     ; 352 						Display_LCD_String("%");
3911  04df 2030          	jpf	LC005
3912  04e1               L3542:
3913                     ; 355 					Num_Display_LCD(ui_FET2_Duty / (U16)(10));
3915                     ; 356 					Display_LCD_String(".");
3917                     ; 357 					Num_Display_LCD(ui_FET2_Duty % (U16)(10));
3919                     ; 358 					Display_LCD_String("%");
3921  04e1 20e6          	jpf	L5542
3922  04e3               L1542:
3923                     ; 362 			else if(uc_line_index == (U8)(2)){	// LINE 3
3925  04e3 a102          	cp	a,#2
3926  04e5 263b          	jrne	L7442
3927                     ; 363 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3929  04e7 720300140f    	btjf	_uc_Test_Ctrl_Reg,#1,L1742
3931  04ec c10001        	cp	a,_uc_Test_Data_Select_Num
3932  04ef 260a          	jrne	L1742
3933                     ; 364 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
3935  04f1 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L1742
3938  04f6               LC009:
3941  04f6 ae004b        	ldw	x,#L7342
3944  04f9 2023          	jpf	LC004
3945  04fb               L1742:
3946                     ; 366 						Num_Display_LCD(ui_FET3_Duty / (U16)(10));
3948                     ; 367 						Display_LCD_String(".");
3950                     ; 368 						Num_Display_LCD(ui_FET3_Duty % (U16)(10));
3952                     ; 369 						Display_LCD_String("%");
3954                     ; 372 					Num_Display_LCD(ui_FET3_Duty / (U16)(10));
3957                     ; 373 					Display_LCD_String(".");
3960                     ; 374 					Num_Display_LCD(ui_FET3_Duty % (U16)(10));
3963  04fb ce000d        	ldw	x,_ui_FET3_Duty
3964  04fe 90ae000a      	ldw	y,#10
3965  0502 65            	divw	x,y
3966  0503 8d000000      	callf	f_Num_Display_LCD
3968  0507 ae0049        	ldw	x,#L3442
3969  050a 8d000000      	callf	f_Display_LCD_String
3971  050e ce000d        	ldw	x,_ui_FET3_Duty
3973                     ; 375 					Display_LCD_String("%");
3975  0511               LC005:
3976  0511 90ae000a      	ldw	y,#10
3977  0515 65            	divw	x,y
3978  0516 93            	ldw	x,y
3979  0517 8d000000      	callf	f_Num_Display_LCD
3985  051b ae0053        	ldw	x,#L5042
3986  051e               LC004:
3987  051e 8d000000      	callf	f_Display_LCD_String
3989  0522               L7442:
3990                     ; 317 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3992  0522 0c06          	inc	(OFST+0,sp)
3995  0524 7b06          	ld	a,(OFST+0,sp)
3996  0526 a104          	cp	a,#4
3997  0528 2404ac450445  	jrult	L3142
3998                     ; 380 		Set_LCD_Address(LCD_Line[3] + 0x14);
4000                     ; 381 		Display_LCD_String("TX");
4003  052e ac830683      	jpf	LC037
4004  0532               L1142:
4005                     ; 385 	else if(uc_Test_Page_Now == (U8)(1)){
4007  0532 c60003        	ld	a,_uc_Test_Page_Now
4008  0535 4a            	dec	a
4009  0536 2704ac930693  	jrne	L3052
4010                     ; 386 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4012  053c 6b06          	ld	(OFST+0,sp),a
4013  053e               L5052:
4014                     ; 388 			Set_LCD_Address(LCD_Line[uc_line_index]);
4016  053e 5f            	clrw	x
4017  053f 97            	ld	xl,a
4018  0540 d60000        	ld	a,(_LCD_Line,x)
4019  0543 8d000000      	callf	f_Set_LCD_Address
4021                     ; 389 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF) && (uc_line_index == (uc_Test_Data_Select_Num-4))){
4023  0547 7201001426    	btjf	_uc_Test_Ctrl_Reg,#0,L3152
4025  054c 7202001421    	btjt	_uc_Test_Ctrl_Reg,#1,L3152
4027  0551 c60001        	ld	a,_uc_Test_Data_Select_Num
4028  0554 5f            	clrw	x
4029  0555 97            	ld	xl,a
4030  0556 1d0004        	subw	x,#4
4031  0559 7b06          	ld	a,(OFST+0,sp)
4032  055b 905f          	clrw	y
4033  055d 9097          	ld	yl,a
4034  055f 90bf00        	ldw	c_y,y
4035  0562 b300          	cpw	x,c_y
4036  0564 260c          	jrne	L3152
4037                     ; 390 				if(b_Blink_250_Flag){Display_LCD_String("     ");}
4039  0566 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L5152
4042  056b ae0055        	ldw	x,#L1042
4045  056e 200b          	jra	L1252
4046  0570               L5152:
4047                     ; 391 				else{Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4049  0570 2002          	jpf	LC010
4050  0572               L3152:
4051                     ; 392 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4053  0572 7b06          	ld	a,(OFST+0,sp)
4054  0574               LC010:
4056  0574 97            	ld	xl,a
4057  0575 a610          	ld	a,#16
4058  0577 42            	mul	x,a
4059  0578 1c0000        	addw	x,#_LCD_Dis_Data
4061  057b               L1252:
4062  057b 8d000000      	callf	f_Display_LCD_String
4063                     ; 394 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
4065  057f 7b06          	ld	a,(OFST+0,sp)
4066  0581 5f            	clrw	x
4067  0582 97            	ld	xl,a
4068  0583 d60000        	ld	a,(_LCD_Line,x)
4069  0586 ab05          	add	a,#5
4070  0588 8d000000      	callf	f_Set_LCD_Address
4072                     ; 397 			if(uc_line_index == (U8)(0)){		// LINE 1
4074  058c 7b06          	ld	a,(OFST+0,sp)
4075  058e 2636          	jrne	L3252
4076                     ; 398 				if((b_Data_Setting_flag == ON) && (uc_line_index == (uc_Test_Data_Select_Num-4))){
4078  0590 720300141f    	btjf	_uc_Test_Ctrl_Reg,#1,L7252
4080  0595 c60001        	ld	a,_uc_Test_Data_Select_Num
4081  0598 5f            	clrw	x
4082  0599 97            	ld	xl,a
4083  059a 1d0004        	subw	x,#4
4084  059d 7b06          	ld	a,(OFST+0,sp)
4085  059f 905f          	clrw	y
4086  05a1 9097          	ld	yl,a
4087  05a3 90bf00        	ldw	c_y,y
4088  05a6 b300          	cpw	x,c_y
4089  05a8 260a          	jrne	L7252
4090                     ; 399 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
4092  05aa 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L7252
4095  05af ae004b        	ldw	x,#L7342
4098  05b2 200c          	jpf	LC011
4099  05b4               L7252:
4100                     ; 401 						Num_Display_LCD(uc_Ctr_TARVL);
4102                     ; 402 						Display_LCD_String("%");
4104                     ; 405 					Num_Display_LCD(uc_Ctr_TARVL);
4107                     ; 406 					Display_LCD_String("%");
4110  05b4 c6000c        	ld	a,_uc_Ctr_TARVL
4111  05b7 5f            	clrw	x
4112  05b8 97            	ld	xl,a
4113  05b9 8d000000      	callf	f_Num_Display_LCD
4115  05bd ae0053        	ldw	x,#L5042
4116  05c0               LC011:
4117  05c0 8d000000      	callf	f_Display_LCD_String
4119  05c4 7b06          	ld	a,(OFST+0,sp)
4120  05c6               L3252:
4121                     ; 410 			if(uc_line_index == (U8)(1)){		// LINE 2
4123  05c6 4a            	dec	a
4124  05c7 2654          	jrne	L5352
4125                     ; 411 				if((b_Data_Setting_flag == ON) && (uc_line_index == (uc_Test_Data_Select_Num-4))){
4127  05c9 7203001430    	btjf	_uc_Test_Ctrl_Reg,#1,L7352
4129  05ce c60001        	ld	a,_uc_Test_Data_Select_Num
4130  05d1 5f            	clrw	x
4131  05d2 97            	ld	xl,a
4132  05d3 1d0004        	subw	x,#4
4133  05d6 7b06          	ld	a,(OFST+0,sp)
4134  05d8 905f          	clrw	y
4135  05da 9097          	ld	yl,a
4136  05dc 90bf00        	ldw	c_y,y
4137  05df b300          	cpw	x,c_y
4138  05e1 261b          	jrne	L7352
4139                     ; 412 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
4141  05e3 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L1452
4144  05e8 ae004b        	ldw	x,#L7342
4147  05eb 202c          	jpf	LC013
4148  05ed               L1452:
4149                     ; 414 						if(uc_Ctr_LD == (U8)(0)){ Display_LCD_String("No LD");}		// No Load Shedding
4151  05ed 725d000b      	tnz	_uc_Ctr_LD
4155  05f1 2711          	jreq	LC016
4156                     ; 415 						else if(uc_Ctr_LD == (U8)(1)){ Display_LCD_String("LD");}	// Load Shedding
4158  05f3 c6000b        	ld	a,_uc_Ctr_LD
4159  05f6 4a            	dec	a
4160  05f7 2616          	jrne	L3752
4163  05f9               LC015:
4165  05f9 ae003d        	ldw	x,#L5552
4168  05fc 201b          	jpf	LC013
4169                     ; 416 						else if(uc_Ctr_LD == (U8)(2)){ Display_LCD_String("Invld");}	// Invalid Value
4172  05fe               L7352:
4173                     ; 419 					if(uc_Ctr_LD == (U8)(0)){ Display_LCD_String("No LD");}			// No Load Shedding
4175  05fe 725d000b      	tnz	_uc_Ctr_LD
4176  0602 2605          	jrne	L7652
4179  0604               LC016:
4181  0604 ae0040        	ldw	x,#L7452
4184  0607 2010          	jpf	LC013
4185  0609               L7652:
4186                     ; 420 					else if(uc_Ctr_LD == (U8)(1)){ Display_LCD_String("LD");}		// Load Shedding
4188  0609 c6000b        	ld	a,_uc_Ctr_LD
4189  060c 4a            	dec	a
4193  060d 27ea          	jreq	LC015
4194  060f               L3752:
4195                     ; 421 					else if(uc_Ctr_LD == (U8)(2)){ Display_LCD_String("Invld");}		// Invalid Value
4200  060f c6000b        	ld	a,_uc_Ctr_LD
4201  0612 a102          	cp	a,#2
4202  0614 2607          	jrne	L5352
4204  0616 ae0037        	ldw	x,#L3652
4205  0619               LC013:
4206  0619 8d000000      	callf	f_Display_LCD_String
4208  061d               L5352:
4209                     ; 424 			if(uc_line_index == (U8)(2)){		// LINE 2
4211  061d 7b06          	ld	a,(OFST+0,sp)
4212  061f a102          	cp	a,#2
4213  0621 2654          	jrne	L1062
4214                     ; 425 				if((b_Data_Setting_flag == ON) && (uc_line_index == (uc_Test_Data_Select_Num-4))){
4216  0623 7203001430    	btjf	_uc_Test_Ctrl_Reg,#1,L3062
4218  0628 c60001        	ld	a,_uc_Test_Data_Select_Num
4219  062b 5f            	clrw	x
4220  062c 97            	ld	xl,a
4221  062d 1d0004        	subw	x,#4
4222  0630 7b06          	ld	a,(OFST+0,sp)
4223  0632 905f          	clrw	y
4224  0634 9097          	ld	yl,a
4225  0636 90bf00        	ldw	c_y,y
4226  0639 b300          	cpw	x,c_y
4227  063b 261b          	jrne	L3062
4228                     ; 426 					if(b_Blink_250_Flag){Display_LCD_String("       ");}
4230  063d 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L5062
4233  0642 ae004b        	ldw	x,#L7342
4236  0645 202c          	jpf	LC017
4237  0647               L5062:
4238                     ; 428 						if(uc_Ctr_U_DIAG == (U8)(0)){ Display_LCD_String("VD Act");}		// Voltage Diagnostics Active
4240  0647 725d000a      	tnz	_uc_Ctr_U_DIAG
4244  064b 2711          	jreq	LC020
4245                     ; 429 						else if(uc_Ctr_U_DIAG == (U8)(1)){ Display_LCD_String("VD InAct");}	// Voltage Diagnositcs Inactive
4247  064d c6000a        	ld	a,_uc_Ctr_U_DIAG
4248  0650 4a            	dec	a
4249  0651 2616          	jrne	L5362
4252  0653               LC019:
4254  0653 ae0027        	ldw	x,#L1262
4257  0656 201b          	jpf	LC017
4258                     ; 430 						else if(uc_Ctr_U_DIAG == (U8)(2)){ Display_LCD_String("Invld");}		// Invalid Value
4261  0658               L3062:
4262                     ; 433 					if(uc_Ctr_U_DIAG == (U8)(0)){ Display_LCD_String("VD Act");}			// Voltage Diagnostics Active
4264  0658 725d000a      	tnz	_uc_Ctr_U_DIAG
4265  065c 2605          	jrne	L1362
4268  065e               LC020:
4270  065e ae0030        	ldw	x,#L3162
4273  0661 2010          	jpf	LC017
4274  0663               L1362:
4275                     ; 434 					else if(uc_Ctr_U_DIAG == (U8)(1)){ Display_LCD_String("VD InAct");}		// Voltage Diagnositcs Inactive
4277  0663 c6000a        	ld	a,_uc_Ctr_U_DIAG
4278  0666 4a            	dec	a
4282  0667 27ea          	jreq	LC019
4283  0669               L5362:
4284                     ; 435 					else if(uc_Ctr_U_DIAG == (U8)(2)){ Display_LCD_String("Invld");}			// Invalid Value
4289  0669 c6000a        	ld	a,_uc_Ctr_U_DIAG
4290  066c a102          	cp	a,#2
4291  066e 2607          	jrne	L1062
4293  0670 ae0037        	ldw	x,#L3652
4294  0673               LC017:
4295  0673 8d000000      	callf	f_Display_LCD_String
4297  0677               L1062:
4298                     ; 386 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4300  0677 0c06          	inc	(OFST+0,sp)
4303  0679 7b06          	ld	a,(OFST+0,sp)
4304  067b a104          	cp	a,#4
4305  067d 2404ac3e053e  	jrult	L5052
4306                     ; 439 		Set_LCD_Address(LCD_Line[3] + 0x14);
4309                     ; 440 		Display_LCD_String("TX");
4311  0683               LC037:
4313  0683 c60003        	ld	a,_LCD_Line+3
4314  0686 ab14          	add	a,#20
4315  0688 8d000000      	callf	f_Set_LCD_Address
4317  068c ae0046        	ldw	x,#L7742
4320  068f acde0ade      	jpf	LC035
4321  0693               L3052:
4322                     ; 444 	else if(uc_Test_Page_Now == (U8)(2)){
4324  0693 c60003        	ld	a,_uc_Test_Page_Now
4325  0696 a102          	cp	a,#2
4326  0698 2704acca07ca  	jrne	L5462
4327                     ; 445 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4329  069e 4f            	clr	a
4330  069f 6b06          	ld	(OFST+0,sp),a
4331  06a1               L7462:
4332                     ; 447 			Set_LCD_Address(LCD_Line[uc_line_index]);
4334  06a1 5f            	clrw	x
4335  06a2 97            	ld	xl,a
4336  06a3 d60000        	ld	a,(_LCD_Line,x)
4337  06a6 8d000000      	callf	f_Set_LCD_Address
4339                     ; 448 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
4341  06aa 7b06          	ld	a,(OFST+0,sp)
4342  06ac 97            	ld	xl,a
4343  06ad a610          	ld	a,#16
4344  06af 42            	mul	x,a
4345  06b0 1c0000        	addw	x,#_LCD_Dis_Data
4346  06b3 8d000000      	callf	f_Display_LCD_String
4348                     ; 450 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
4350  06b7 7b06          	ld	a,(OFST+0,sp)
4351  06b9 5f            	clrw	x
4352  06ba 97            	ld	xl,a
4353  06bb d60000        	ld	a,(_LCD_Line,x)
4354  06be ab05          	add	a,#5
4355  06c0 8d000000      	callf	f_Set_LCD_Address
4357                     ; 453 			if(uc_line_index == (U8)(0)){		// LINE 1
4359  06c4 7b06          	ld	a,(OFST+0,sp)
4360  06c6 2646          	jrne	L5562
4361                     ; 454 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN ");}
4363  06c8 7202001305    	btjt	_uc_Rx_TimeOut_Reg,#1,L1662
4365  06cd 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L7562
4366  06d2               L1662:
4369  06d2 ae0023        	ldw	x,#L3662
4372  06d5 2031          	jpf	LC021
4373  06d7               L7562:
4374                     ; 456 					ui_buffer = (U16)(uc_Rx2_Lin_Data[1] << 8) + (U16)(uc_Rx2_Lin_Data[0]);	// Sum of High Voltage Data
4376  06d7 c60002        	ld	a,_uc_Rx2_Lin_Data
4377  06da 5f            	clrw	x
4378  06db 97            	ld	xl,a
4379  06dc 1f01          	ldw	(OFST-5,sp),x
4380  06de c60003        	ld	a,_uc_Rx2_Lin_Data+1
4381  06e1 97            	ld	xl,a
4382  06e2 4f            	clr	a
4383  06e3 02            	rlwa	x,a
4384  06e4 72fb01        	addw	x,(OFST-5,sp)
4385  06e7 1f03          	ldw	(OFST-3,sp),x
4386                     ; 457 					Num_Display_LCD(ui_buffer / (U16)(10));
4388  06e9 90ae000a      	ldw	y,#10
4389  06ed 65            	divw	x,y
4390  06ee 8d000000      	callf	f_Num_Display_LCD
4392                     ; 458 					Display_LCD_String(".");
4394  06f2 ae0049        	ldw	x,#L3442
4395  06f5 8d000000      	callf	f_Display_LCD_String
4397                     ; 459 					Num_Display_LCD(ui_buffer % (U16)(10));
4399  06f9 1e03          	ldw	x,(OFST-3,sp)
4400  06fb 90ae000a      	ldw	y,#10
4401  06ff 65            	divw	x,y
4402  0700 93            	ldw	x,y
4403  0701 8d000000      	callf	f_Num_Display_LCD
4405                     ; 460 					Display_LCD_String("V");
4407  0705 ae0021        	ldw	x,#L7662
4408  0708               LC021:
4409  0708 8d000000      	callf	f_Display_LCD_String
4411  070c 7b06          	ld	a,(OFST+0,sp)
4412  070e               L5562:
4413                     ; 465 			if(uc_line_index == (U8)(1)){		// LINE 2
4415  070e a101          	cp	a,#1
4416  0710 2646          	jrne	L1762
4417                     ; 466 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN ");}
4419  0712 7202001305    	btjt	_uc_Rx_TimeOut_Reg,#1,L5762
4421  0717 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L3762
4422  071c               L5762:
4425  071c ae0023        	ldw	x,#L3662
4428  071f 2031          	jpf	LC022
4429  0721               L3762:
4430                     ; 468 					ui_buffer = (U16)(uc_Rx2_Lin_Data[5] << 8) + (U16)(uc_Rx2_Lin_Data[4]);	// Sum of Current Value Data
4432  0721 c60006        	ld	a,_uc_Rx2_Lin_Data+4
4433  0724 5f            	clrw	x
4434  0725 97            	ld	xl,a
4435  0726 1f01          	ldw	(OFST-5,sp),x
4436  0728 c60007        	ld	a,_uc_Rx2_Lin_Data+5
4437  072b 97            	ld	xl,a
4438  072c 4f            	clr	a
4439  072d 02            	rlwa	x,a
4440  072e 72fb01        	addw	x,(OFST-5,sp)
4441  0731 1f03          	ldw	(OFST-3,sp),x
4442                     ; 469 					Num_Display_LCD(ui_buffer / (U16)(10));
4444  0733 90ae000a      	ldw	y,#10
4445  0737 65            	divw	x,y
4446  0738 8d000000      	callf	f_Num_Display_LCD
4448                     ; 470 					Display_LCD_String(".");
4450  073c ae0049        	ldw	x,#L3442
4451  073f 8d000000      	callf	f_Display_LCD_String
4453                     ; 471 					Num_Display_LCD(ui_buffer % (U16)(10));
4455  0743 1e03          	ldw	x,(OFST-3,sp)
4456  0745 90ae000a      	ldw	y,#10
4457  0749 65            	divw	x,y
4458  074a 93            	ldw	x,y
4459  074b 8d000000      	callf	f_Num_Display_LCD
4461                     ; 472 					Display_LCD_String("A");
4463  074f ae001f        	ldw	x,#L1072
4464  0752               LC022:
4465  0752 8d000000      	callf	f_Display_LCD_String
4467  0756 7b06          	ld	a,(OFST+0,sp)
4468  0758               L1762:
4469                     ; 477 			if(uc_line_index == (U8)(2)){		// LINE 3
4471  0758 a102          	cp	a,#2
4472  075a 262e          	jrne	L3072
4473                     ; 478 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN ");}
4475  075c 7202001305    	btjt	_uc_Rx_TimeOut_Reg,#1,L7072
4477  0761 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L5072
4478  0766               L7072:
4481  0766 ae0023        	ldw	x,#L3662
4484  0769 2019          	jpf	LC023
4485  076b               L5072:
4486                     ; 480 					ui_buffer = (U16)(uc_Rx2_Lin_Data[7] << 8) + (U16)(uc_Rx2_Lin_Data[6]);	// Sum of Current Value Data
4488  076b c60008        	ld	a,_uc_Rx2_Lin_Data+6
4489  076e 5f            	clrw	x
4490  076f 97            	ld	xl,a
4491  0770 1f01          	ldw	(OFST-5,sp),x
4492  0772 c60009        	ld	a,_uc_Rx2_Lin_Data+7
4493  0775 97            	ld	xl,a
4494  0776 4f            	clr	a
4495  0777 02            	rlwa	x,a
4496  0778 72fb01        	addw	x,(OFST-5,sp)
4497  077b 1f03          	ldw	(OFST-3,sp),x
4498                     ; 481 					Num_Display_LCD(ui_buffer);
4500  077d 8d000000      	callf	f_Num_Display_LCD
4502                     ; 482 					Display_LCD_String("W");
4504  0781 ae001d        	ldw	x,#L3172
4505  0784               LC023:
4506  0784 8d000000      	callf	f_Display_LCD_String
4508  0788 7b06          	ld	a,(OFST+0,sp)
4509  078a               L3072:
4510                     ; 487 			if(uc_line_index == (U8)(3)){		// LINE 4
4512  078a a103          	cp	a,#3
4513  078c 262c          	jrne	L5172
4514                     ; 488 				if((b_Rx3_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN ");}
4516  078e 7204001305    	btjt	_uc_Rx_TimeOut_Reg,#2,L1272
4518  0793 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L7172
4519  0798               L1272:
4522  0798 ae0023        	ldw	x,#L3662
4525  079b 2019          	jpf	LC024
4526  079d               L7172:
4527                     ; 490 					ui_buffer = (U16)(uc_Rx3_Lin_Data[3] << 8) + (U16)(uc_Rx3_Lin_Data[2]);	// Sum of Target Power Data
4529  079d c6000c        	ld	a,_uc_Rx3_Lin_Data+2
4530  07a0 5f            	clrw	x
4531  07a1 97            	ld	xl,a
4532  07a2 1f01          	ldw	(OFST-5,sp),x
4533  07a4 c6000d        	ld	a,_uc_Rx3_Lin_Data+3
4534  07a7 97            	ld	xl,a
4535  07a8 4f            	clr	a
4536  07a9 02            	rlwa	x,a
4537  07aa 72fb01        	addw	x,(OFST-5,sp)
4538  07ad 1f03          	ldw	(OFST-3,sp),x
4539                     ; 491 					Num_Display_LCD(ui_buffer);
4541  07af 8d000000      	callf	f_Num_Display_LCD
4543                     ; 492 					Display_LCD_String("W");
4545  07b3 ae001d        	ldw	x,#L3172
4546  07b6               LC024:
4547  07b6 8d000000      	callf	f_Display_LCD_String
4549  07ba               L5172:
4550                     ; 445 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4552  07ba 0c06          	inc	(OFST+0,sp)
4555  07bc 7b06          	ld	a,(OFST+0,sp)
4556  07be a104          	cp	a,#4
4557  07c0 2404aca106a1  	jrult	L7462
4558                     ; 496 		Set_LCD_Address(LCD_Line[3] + 0x14);
4560                     ; 497 		Display_LCD_String("RX");
4563  07c6 acd20ad2      	jpf	LC036
4564  07ca               L5462:
4565                     ; 501 	else if(uc_Test_Page_Now == (U8)(3)){
4567  07ca c60003        	ld	a,_uc_Test_Page_Now
4568  07cd a103          	cp	a,#3
4569  07cf 2704accf08cf  	jrne	L1372
4570                     ; 502 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4572  07d5 4f            	clr	a
4573  07d6 6b06          	ld	(OFST+0,sp),a
4574  07d8               L3372:
4575                     ; 503 			Set_LCD_Address(LCD_Line[uc_line_index]);
4577  07d8 5f            	clrw	x
4578  07d9 97            	ld	xl,a
4579  07da d60000        	ld	a,(_LCD_Line,x)
4580  07dd 8d000000      	callf	f_Set_LCD_Address
4582                     ; 504 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
4584  07e1 7b06          	ld	a,(OFST+0,sp)
4585  07e3 97            	ld	xl,a
4586  07e4 a610          	ld	a,#16
4587  07e6 42            	mul	x,a
4588  07e7 1c0000        	addw	x,#_LCD_Dis_Data
4589  07ea 8d000000      	callf	f_Display_LCD_String
4591                     ; 506 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
4593  07ee 7b06          	ld	a,(OFST+0,sp)
4594  07f0 5f            	clrw	x
4595  07f1 97            	ld	xl,a
4596  07f2 d60000        	ld	a,(_LCD_Line,x)
4597  07f5 ab05          	add	a,#5
4598  07f7 8d000000      	callf	f_Set_LCD_Address
4600                     ; 509 			if(uc_line_index == (U8)(0)){		// LINE 1
4602  07fb 7b06          	ld	a,(OFST+0,sp)
4603  07fd 2646          	jrne	L1472
4604                     ; 510 				if((b_Rx3_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4606  07ff 7204001305    	btjt	_uc_Rx_TimeOut_Reg,#2,L5472
4608  0804 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L3472
4609  0809               L5472:
4612  0809 ae0015        	ldw	x,#L7472
4615  080c 2031          	jpf	LC025
4616  080e               L3472:
4617                     ; 512 					ui_buffer = (U16)(uc_Rx3_Lin_Data[5] << 8) + (U16)(uc_Rx3_Lin_Data[4]);	// Sum of IGN Voltage Data
4619  080e c6000e        	ld	a,_uc_Rx3_Lin_Data+4
4620  0811 5f            	clrw	x
4621  0812 97            	ld	xl,a
4622  0813 1f01          	ldw	(OFST-5,sp),x
4623  0815 c6000f        	ld	a,_uc_Rx3_Lin_Data+5
4624  0818 97            	ld	xl,a
4625  0819 4f            	clr	a
4626  081a 02            	rlwa	x,a
4627  081b 72fb01        	addw	x,(OFST-5,sp)
4628  081e 1f03          	ldw	(OFST-3,sp),x
4629                     ; 513 					Num_Display_LCD(ui_buffer / (U16)(10));
4631  0820 90ae000a      	ldw	y,#10
4632  0824 65            	divw	x,y
4633  0825 8d000000      	callf	f_Num_Display_LCD
4635                     ; 514 					Display_LCD_String(".");
4637  0829 ae0049        	ldw	x,#L3442
4638  082c 8d000000      	callf	f_Display_LCD_String
4640                     ; 515 					Num_Display_LCD(ui_buffer % (U16)(10));
4642  0830 1e03          	ldw	x,(OFST-3,sp)
4643  0832 90ae000a      	ldw	y,#10
4644  0836 65            	divw	x,y
4645  0837 93            	ldw	x,y
4646  0838 8d000000      	callf	f_Num_Display_LCD
4648                     ; 516 					Display_LCD_String("V");
4650  083c ae0021        	ldw	x,#L7662
4651  083f               LC025:
4652  083f 8d000000      	callf	f_Display_LCD_String
4654  0843 7b06          	ld	a,(OFST+0,sp)
4655  0845               L1472:
4656                     ; 521 			if(uc_line_index == (U8)(1)){		// LINE 2
4658  0845 a101          	cp	a,#1
4659  0847 2646          	jrne	L3572
4660                     ; 522 				if((b_Rx3_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4662  0849 7204001305    	btjt	_uc_Rx_TimeOut_Reg,#2,L7572
4664  084e 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L5572
4665  0853               L7572:
4668  0853 ae0015        	ldw	x,#L7472
4671  0856 2031          	jpf	LC026
4672  0858               L5572:
4673                     ; 524 					ui_buffer = (U16)(uc_Rx3_Lin_Data[1] << 8) + (U16)(uc_Rx3_Lin_Data[0]);	// Sum of IGN Voltage Data
4675  0858 c6000a        	ld	a,_uc_Rx3_Lin_Data
4676  085b 5f            	clrw	x
4677  085c 97            	ld	xl,a
4678  085d 1f01          	ldw	(OFST-5,sp),x
4679  085f c6000b        	ld	a,_uc_Rx3_Lin_Data+1
4680  0862 97            	ld	xl,a
4681  0863 4f            	clr	a
4682  0864 02            	rlwa	x,a
4683  0865 72fb01        	addw	x,(OFST-5,sp)
4684  0868 1f03          	ldw	(OFST-3,sp),x
4685                     ; 525 					Num_Display_LCD(ui_buffer / (U16)(10));
4687  086a 90ae000a      	ldw	y,#10
4688  086e 65            	divw	x,y
4689  086f 8d000000      	callf	f_Num_Display_LCD
4691                     ; 526 					Display_LCD_String(".");
4693  0873 ae0049        	ldw	x,#L3442
4694  0876 8d000000      	callf	f_Display_LCD_String
4696                     ; 527 					Num_Display_LCD(ui_buffer % (U16)(10));
4698  087a 1e03          	ldw	x,(OFST-3,sp)
4699  087c 90ae000a      	ldw	y,#10
4700  0880 65            	divw	x,y
4701  0881 93            	ldw	x,y
4702  0882 8d000000      	callf	f_Num_Display_LCD
4704                     ; 528 					Display_LCD_String("%");
4706  0886 ae0053        	ldw	x,#L5042
4707  0889               LC026:
4708  0889 8d000000      	callf	f_Display_LCD_String
4710  088d 7b06          	ld	a,(OFST+0,sp)
4711  088f               L3572:
4712                     ; 533 			if(uc_line_index == (U8)(2)){		// LINE 3
4714  088f a102          	cp	a,#2
4715  0891 262c          	jrne	L3672
4716                     ; 534 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4718  0893 7202001305    	btjt	_uc_Rx_TimeOut_Reg,#1,L7672
4720  0898 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L5672
4721  089d               L7672:
4724  089d ae0015        	ldw	x,#L7472
4727  08a0 2019          	jpf	LC027
4728  08a2               L5672:
4729                     ; 536 					ui_buffer = (U16)(uc_Rx2_Lin_Data[3] << 8) + (U16)(uc_Rx2_Lin_Data[2]);	// Sum of Current AD
4731  08a2 c60004        	ld	a,_uc_Rx2_Lin_Data+2
4732  08a5 5f            	clrw	x
4733  08a6 97            	ld	xl,a
4734  08a7 1f01          	ldw	(OFST-5,sp),x
4735  08a9 c60005        	ld	a,_uc_Rx2_Lin_Data+3
4736  08ac 97            	ld	xl,a
4737  08ad 4f            	clr	a
4738  08ae 02            	rlwa	x,a
4739  08af 72fb01        	addw	x,(OFST-5,sp)
4740  08b2 1f03          	ldw	(OFST-3,sp),x
4741                     ; 537 					Num_Display_LCD(ui_buffer);
4743  08b4 8d000000      	callf	f_Num_Display_LCD
4745                     ; 538 					Display_LCD_String("AD");
4747  08b8 ae0012        	ldw	x,#L3772
4748  08bb               LC027:
4749  08bb 8d000000      	callf	f_Display_LCD_String
4751  08bf               L3672:
4752                     ; 502 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4754  08bf 0c06          	inc	(OFST+0,sp)
4757  08c1 7b06          	ld	a,(OFST+0,sp)
4758  08c3 a104          	cp	a,#4
4759  08c5 2404acd807d8  	jrult	L3372
4760                     ; 542 		Set_LCD_Address(LCD_Line[3] + 0x14);
4762                     ; 543 		Display_LCD_String("RX");
4765  08cb acd20ad2      	jpf	LC036
4766  08cf               L1372:
4767                     ; 547 	else if(uc_Test_Page_Now == (U8)(4)){
4769  08cf c60003        	ld	a,_uc_Test_Page_Now
4770  08d2 a104          	cp	a,#4
4771  08d4 2704ace20ae2  	jrne	L1052
4772                     ; 548 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4774  08da 4f            	clr	a
4775  08db 6b06          	ld	(OFST+0,sp),a
4776  08dd               L1003:
4777                     ; 549 			Set_LCD_Address(LCD_Line[uc_line_index]);
4779  08dd 5f            	clrw	x
4780  08de 97            	ld	xl,a
4781  08df d60000        	ld	a,(_LCD_Line,x)
4782  08e2 8d000000      	callf	f_Set_LCD_Address
4784                     ; 550 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
4786  08e6 7b06          	ld	a,(OFST+0,sp)
4787  08e8 97            	ld	xl,a
4788  08e9 a610          	ld	a,#16
4789  08eb 42            	mul	x,a
4790  08ec 1c0000        	addw	x,#_LCD_Dis_Data
4791  08ef 8d000000      	callf	f_Display_LCD_String
4793                     ; 553 			if(uc_line_index == (U8)(0)){		// LINE 1
4795  08f3 7b06          	ld	a,(OFST+0,sp)
4796  08f5 2704ac790979  	jrne	L7003
4797                     ; 554 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4799  08fb 5f            	clrw	x
4800  08fc 97            	ld	xl,a
4801  08fd d60000        	ld	a,(_LCD_Line,x)
4802  0900 ab03          	add	a,#3
4803  0902 8d000000      	callf	f_Set_LCD_Address
4805                     ; 555 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4807  0906 7200001305    	btjt	_uc_Rx_TimeOut_Reg,#0,L3103
4809  090b 7204001420    	btjt	_uc_Test_Ctrl_Reg,#2,L1103
4810  0910               L3103:
4813  0910 ae0015        	ldw	x,#L7472
4814  0913               LC028:
4815  0913 8d000000      	callf	f_Display_LCD_String
4818  0917               L5103:
4819                     ; 563 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 10));
4821  0917 7b06          	ld	a,(OFST+0,sp)
4822  0919 5f            	clrw	x
4823  091a 97            	ld	xl,a
4824  091b d60000        	ld	a,(_LCD_Line,x)
4825  091e ab0a          	add	a,#10
4826  0920 8d000000      	callf	f_Set_LCD_Address
4828                     ; 564 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4830  0924 7200001327    	btjt	_uc_Rx_TimeOut_Reg,#0,L1403
4832  0929 7204001427    	btjt	_uc_Test_Ctrl_Reg,#2,L7303
4833  092e 2020          	jra	L1403
4834  0930               L1103:
4835                     ; 557 					uc_buffer = (U8)(uc_Rx1_Lin_Data[0] & 0x03);		// Read_ERR_ST_SC_BK_PTC_LIN DATA
4837  0930 c60000        	ld	a,_uc_Rx1_Lin_Data
4838  0933 a403          	and	a,#3
4839  0935 6b05          	ld	(OFST-1,sp),a
4840                     ; 558 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
4842  0937 2605          	jrne	L7103
4845  0939 ae000e        	ldw	x,#L1203
4848  093c 20d5          	jpf	LC028
4849  093e               L7103:
4850                     ; 559 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
4852  093e a101          	cp	a,#1
4853  0940 2605          	jrne	L5203
4856  0942 ae000a        	ldw	x,#L7203
4859  0945 20cc          	jpf	LC028
4860  0947               L5203:
4861                     ; 560 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
4863  0947 a102          	cp	a,#2
4864  0949 26cc          	jrne	L5103
4867  094b ae0006        	ldw	x,#L5303
4869  094e 20c3          	jpf	LC028
4870  0950               L1403:
4871                     ; 564 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4873  0950 ae0015        	ldw	x,#L7472
4876  0953 2020          	jpf	LC029
4877  0955               L7303:
4878                     ; 566 					uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0x0C)>>2);	// Read_ERR_ST_TMOUT_BK_PTC_LIN DATA
4880  0955 c60000        	ld	a,_uc_Rx1_Lin_Data
4881  0958 a40c          	and	a,#12
4882  095a 44            	srl	a
4883  095b 44            	srl	a
4884  095c 6b05          	ld	(OFST-1,sp),a
4885                     ; 567 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
4887  095e 2605          	jrne	L5403
4890  0960 ae000e        	ldw	x,#L1203
4893  0963 2010          	jpf	LC029
4894  0965               L5403:
4895                     ; 568 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
4897  0965 a101          	cp	a,#1
4898  0967 2605          	jrne	L1503
4901  0969 ae000a        	ldw	x,#L7203
4904  096c 2007          	jpf	LC029
4905  096e               L1503:
4906                     ; 569 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
4908  096e a102          	cp	a,#2
4909  0970 2607          	jrne	L7003
4912  0972 ae0006        	ldw	x,#L5303
4913  0975               LC029:
4914  0975 8d000000      	callf	f_Display_LCD_String
4916  0979               L7003:
4917                     ; 574 			if(uc_line_index == (U8)(1)){		// LINE 2
4919  0979 7b06          	ld	a,(OFST+0,sp)
4920  097b a101          	cp	a,#1
4921  097d 2704ac030a03  	jrne	L7503
4922                     ; 575 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4924  0983 5f            	clrw	x
4925  0984 97            	ld	xl,a
4926  0985 d60000        	ld	a,(_LCD_Line,x)
4927  0988 ab03          	add	a,#3
4928  098a 8d000000      	callf	f_Set_LCD_Address
4930                     ; 576 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4932  098e 7200001305    	btjt	_uc_Rx_TimeOut_Reg,#0,L3603
4934  0993 7204001420    	btjt	_uc_Test_Ctrl_Reg,#2,L1603
4935  0998               L3603:
4938  0998 ae0015        	ldw	x,#L7472
4939  099b               LC030:
4940  099b 8d000000      	callf	f_Display_LCD_String
4943  099f               L5603:
4944                     ; 584 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 10));
4946  099f 7b06          	ld	a,(OFST+0,sp)
4947  09a1 5f            	clrw	x
4948  09a2 97            	ld	xl,a
4949  09a3 d60000        	ld	a,(_LCD_Line,x)
4950  09a6 ab0a          	add	a,#10
4951  09a8 8d000000      	callf	f_Set_LCD_Address
4953                     ; 585 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4955  09ac 7200001328    	btjt	_uc_Rx_TimeOut_Reg,#0,L3013
4957  09b1 7204001428    	btjt	_uc_Test_Ctrl_Reg,#2,L1013
4958  09b6 2021          	jra	L3013
4959  09b8               L1603:
4960                     ; 578 					uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0x30)>>4);	// Read_ERR_ST_OVL_BK_PTC_LIN DATA
4962  09b8 c60000        	ld	a,_uc_Rx1_Lin_Data
4963  09bb 4e            	swap	a
4964  09bc a403          	and	a,#3
4965  09be 6b05          	ld	(OFST-1,sp),a
4966                     ; 579 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
4968  09c0 2605          	jrne	L7603
4971  09c2 ae000e        	ldw	x,#L1203
4974  09c5 20d4          	jpf	LC030
4975  09c7               L7603:
4976                     ; 580 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
4978  09c7 a101          	cp	a,#1
4979  09c9 2605          	jrne	L3703
4982  09cb ae000a        	ldw	x,#L7203
4985  09ce 20cb          	jpf	LC030
4986  09d0               L3703:
4987                     ; 581 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
4989  09d0 a102          	cp	a,#2
4990  09d2 26cb          	jrne	L5603
4993  09d4 ae0006        	ldw	x,#L5303
4995  09d7 20c2          	jpf	LC030
4996  09d9               L3013:
4997                     ; 585 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
4999  09d9 ae0015        	ldw	x,#L7472
5002  09dc 2021          	jpf	LC031
5003  09de               L1013:
5004                     ; 587 					uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0xC0)>>6);	// Read_ERR_ST_UU_BK_PTC_LIN DATA
5006  09de c60000        	ld	a,_uc_Rx1_Lin_Data
5007  09e1 4e            	swap	a
5008  09e2 a40c          	and	a,#12
5009  09e4 44            	srl	a
5010  09e5 44            	srl	a
5011  09e6 6b05          	ld	(OFST-1,sp),a
5012                     ; 588 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
5014  09e8 2605          	jrne	L7013
5017  09ea ae000e        	ldw	x,#L1203
5020  09ed 2010          	jpf	LC031
5021  09ef               L7013:
5022                     ; 589 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
5024  09ef a101          	cp	a,#1
5025  09f1 2605          	jrne	L3113
5028  09f3 ae000a        	ldw	x,#L7203
5031  09f6 2007          	jpf	LC031
5032  09f8               L3113:
5033                     ; 590 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
5035  09f8 a102          	cp	a,#2
5036  09fa 2607          	jrne	L7503
5039  09fc ae0006        	ldw	x,#L5303
5040  09ff               LC031:
5041  09ff 8d000000      	callf	f_Display_LCD_String
5043  0a03               L7503:
5044                     ; 595 			if(uc_line_index == (U8)(2)){		// LINE 3
5046  0a03 7b06          	ld	a,(OFST+0,sp)
5047  0a05 a102          	cp	a,#2
5048  0a07 2704ac8b0a8b  	jrne	L1213
5049                     ; 596 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5051  0a0d 5f            	clrw	x
5052  0a0e 97            	ld	xl,a
5053  0a0f d60000        	ld	a,(_LCD_Line,x)
5054  0a12 ab03          	add	a,#3
5055  0a14 8d000000      	callf	f_Set_LCD_Address
5057                     ; 597 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
5059  0a18 7200001305    	btjt	_uc_Rx_TimeOut_Reg,#0,L5213
5061  0a1d 7204001420    	btjt	_uc_Test_Ctrl_Reg,#2,L3213
5062  0a22               L5213:
5065  0a22 ae0015        	ldw	x,#L7472
5066  0a25               LC032:
5067  0a25 8d000000      	callf	f_Display_LCD_String
5070  0a29               L7213:
5071                     ; 605 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 10));
5073  0a29 7b06          	ld	a,(OFST+0,sp)
5074  0a2b 5f            	clrw	x
5075  0a2c 97            	ld	xl,a
5076  0a2d d60000        	ld	a,(_LCD_Line,x)
5077  0a30 ab0a          	add	a,#10
5078  0a32 8d000000      	callf	f_Set_LCD_Address
5080                     ; 606 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
5082  0a36 7200001327    	btjt	_uc_Rx_TimeOut_Reg,#0,L5413
5084  0a3b 7204001427    	btjt	_uc_Test_Ctrl_Reg,#2,L3413
5085  0a40 2020          	jra	L5413
5086  0a42               L3213:
5087                     ; 599 					uc_buffer = (U8)(uc_Rx1_Lin_Data[1] & 0x03);		// Read_ERR_ST_IDLG_BK_PTC_LIN DATA
5089  0a42 c60001        	ld	a,_uc_Rx1_Lin_Data+1
5090  0a45 a403          	and	a,#3
5091  0a47 6b05          	ld	(OFST-1,sp),a
5092                     ; 600 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
5094  0a49 2605          	jrne	L1313
5097  0a4b ae000e        	ldw	x,#L1203
5100  0a4e 20d5          	jpf	LC032
5101  0a50               L1313:
5102                     ; 601 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
5104  0a50 a101          	cp	a,#1
5105  0a52 2605          	jrne	L5313
5108  0a54 ae000a        	ldw	x,#L7203
5111  0a57 20cc          	jpf	LC032
5112  0a59               L5313:
5113                     ; 602 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
5115  0a59 a102          	cp	a,#2
5116  0a5b 26cc          	jrne	L7213
5119  0a5d ae0006        	ldw	x,#L5303
5121  0a60 20c3          	jpf	LC032
5122  0a62               L5413:
5123                     ; 606 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
5125  0a62 ae0015        	ldw	x,#L7472
5128  0a65 2020          	jpf	LC033
5129  0a67               L3413:
5130                     ; 608 					uc_buffer = (U8)((uc_Rx1_Lin_Data[1] & 0x0C)>>2);	// Read_ERR_ST_OTMP_BK_PTC_LIN DATA
5132  0a67 c60001        	ld	a,_uc_Rx1_Lin_Data+1
5133  0a6a a40c          	and	a,#12
5134  0a6c 44            	srl	a
5135  0a6d 44            	srl	a
5136  0a6e 6b05          	ld	(OFST-1,sp),a
5137                     ; 609 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
5139  0a70 2605          	jrne	L1513
5142  0a72 ae000e        	ldw	x,#L1203
5145  0a75 2010          	jpf	LC033
5146  0a77               L1513:
5147                     ; 610 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
5149  0a77 a101          	cp	a,#1
5150  0a79 2605          	jrne	L5513
5153  0a7b ae000a        	ldw	x,#L7203
5156  0a7e 2007          	jpf	LC033
5157  0a80               L5513:
5158                     ; 611 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Ivd"); }
5160  0a80 a102          	cp	a,#2
5161  0a82 2607          	jrne	L1213
5164  0a84 ae0006        	ldw	x,#L5303
5165  0a87               LC033:
5166  0a87 8d000000      	callf	f_Display_LCD_String
5168  0a8b               L1213:
5169                     ; 616 			if(uc_line_index == (U8)(3)){		// LINE 3
5171  0a8b 7b06          	ld	a,(OFST+0,sp)
5172  0a8d a103          	cp	a,#3
5173  0a8f 2635          	jrne	L3613
5174                     ; 617 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5176  0a91 5f            	clrw	x
5177  0a92 97            	ld	xl,a
5178  0a93 d60000        	ld	a,(_LCD_Line,x)
5179  0a96 ab03          	add	a,#3
5180  0a98 8d000000      	callf	f_Set_LCD_Address
5182                     ; 618 				if((b_Rx1_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NN  ");}
5184  0a9c 7200001305    	btjt	_uc_Rx_TimeOut_Reg,#0,L7613
5186  0aa1 7204001405    	btjt	_uc_Test_Ctrl_Reg,#2,L5613
5187  0aa6               L7613:
5190  0aa6 ae0015        	ldw	x,#L7472
5193  0aa9 2017          	jpf	LC034
5194  0aab               L5613:
5195                     ; 620 					uc_buffer = (U8)((uc_Rx1_Lin_Data[1] & 0x80)>>7);		// Read_COMM_ERR_BK_PTC_LIN DATA
5197  0aab c60001        	ld	a,_uc_Rx1_Lin_Data+1
5198  0aae a480          	and	a,#128
5199  0ab0 49            	rlc	a
5200  0ab1 4f            	clr	a
5201  0ab2 49            	rlc	a
5202  0ab3 6b05          	ld	(OFST-1,sp),a
5203                     ; 621 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Nor"); }
5205  0ab5 2605          	jrne	L3713
5208  0ab7 ae000e        	ldw	x,#L1203
5211  0aba 2006          	jpf	LC034
5212  0abc               L3713:
5213                     ; 622 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Err"); }
5215  0abc 4a            	dec	a
5216  0abd 2607          	jrne	L3613
5219  0abf ae000a        	ldw	x,#L7203
5220  0ac2               LC034:
5221  0ac2 8d000000      	callf	f_Display_LCD_String
5223  0ac6               L3613:
5224                     ; 548 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5226  0ac6 0c06          	inc	(OFST+0,sp)
5229  0ac8 7b06          	ld	a,(OFST+0,sp)
5230  0aca a104          	cp	a,#4
5231  0acc 2404acdd08dd  	jrult	L1003
5232                     ; 626 		Set_LCD_Address(LCD_Line[3] + 0x14);
5235                     ; 627 		Display_LCD_String("RX");
5237  0ad2               LC036:
5240  0ad2 c60003        	ld	a,_LCD_Line+3
5241  0ad5 ab14          	add	a,#20
5242  0ad7 8d000000      	callf	f_Set_LCD_Address
5245  0adb ae001a        	ldw	x,#L5272
5246  0ade               LC035:
5247  0ade 8d000000      	callf	f_Display_LCD_String
5249  0ae2               L1052:
5250                     ; 630 	if((b_Lin_Com_On_flag == ON)){
5252  0ae2 a60f          	ld	a,#15
5253  0ae4 7205001413    	btjf	_uc_Test_Ctrl_Reg,#2,L1023
5254                     ; 631 		Set_LCD_Address((unsigned char)(0x00+15));
5256  0ae9 8d000000      	callf	f_Set_LCD_Address
5258                     ; 632 		if(b_Blink_250_Flag){Display_LCD_String("C");}
5260  0aed 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L3023
5263  0af2 ae0004        	ldw	x,#L5023
5266  0af5 200c          	jra	L3123
5267  0af7               L3023:
5268                     ; 633 		else{Display_LCD_String(" ");}
5270  0af7 ae0002        	ldw	x,#L1123
5272  0afa 2007          	jra	L3123
5273  0afc               L1023:
5274                     ; 636 		Set_LCD_Address((unsigned char)(0x00+15));
5276  0afc 8d000000      	callf	f_Set_LCD_Address
5278                     ; 637 		Display_LCD_String("N");
5280  0b00 ae0000        	ldw	x,#L5123
5282  0b03               L3123:
5283  0b03 8d000000      	callf	f_Display_LCD_String
5284                     ; 640 	return;
5287  0b07 5b06          	addw	sp,#6
5288  0b09 87            	retf	
5315                     ; 644 void BMW48_Test_Controller_Routine(void)
5315                     ; 645 {
5316                     	switch	.text
5317  0b0a               f_BMW48_Test_Controller_Routine:
5321                     ; 646 	if(b_First_Logic_On == OFF){ Start_Zig_Display(); }			// First_Start_LCD_Display
5323  0b0a 7200000006    	btjt	_uc_System_Ctrl_Reg,#0,L7223
5326  0b0f 8d000000      	callf	f_Start_Zig_Display
5329  0b13 2004          	jra	L1323
5330  0b15               L7223:
5331                     ; 647 	else{ Test_Ctrl_LCD_Display_Control(); }
5333  0b15 8ddb03db      	callf	f_Test_Ctrl_LCD_Display_Control
5335  0b19               L1323:
5336                     ; 648 	Test_Ctrl_Swtich_Control();
5339                     ; 650 	return;
5342  0b19 ac9a019a      	jpf	f_Test_Ctrl_Swtich_Control
5522                     	xdef	f_Test_Ctrl_LCD_Display_Control
5523                     	xdef	f_Test_Ctrl_Text_Display_Handling
5524                     	xdef	f_Test_Ctrl_Swtich_Control
5525                     	xdef	f_Test_Ctrl_Value_Change
5526                     	switch	.bss
5527  0000               _uc_Duty_Unit:
5528  0000 00            	ds.b	1
5529                     	xdef	_uc_Duty_Unit
5530  0001               _uc_Test_Data_Select_Num:
5531  0001 00            	ds.b	1
5532                     	xdef	_uc_Test_Data_Select_Num
5533  0002               _uc_Test_Page_Pre:
5534  0002 00            	ds.b	1
5535                     	xdef	_uc_Test_Page_Pre
5536  0003               _uc_Test_Page_Now:
5537  0003 00            	ds.b	1
5538                     	xdef	_uc_Test_Page_Now
5539                     	xref	f_strcpy
5540                     	xref	f_Start_Zig_Display
5541                     	xdef	f_BMW48_Test_Controller_Routine
5542                     	xdef	f_Test_Ctrl_Reset_Values
5543  0004               _ui_Rx3_TimeOut_Cnt:
5544  0004 0000          	ds.b	2
5545                     	xdef	_ui_Rx3_TimeOut_Cnt
5546  0006               _ui_Rx2_TimeOut_Cnt:
5547  0006 0000          	ds.b	2
5548                     	xdef	_ui_Rx2_TimeOut_Cnt
5549  0008               _ui_Rx1_TimeOut_Cnt:
5550  0008 0000          	ds.b	2
5551                     	xdef	_ui_Rx1_TimeOut_Cnt
5552                     	xdef	_uc_Rx3_Lin_Data
5553                     	xdef	_uc_Rx2_Lin_Data
5554                     	xdef	_uc_Rx1_Lin_Data
5555  000a               _uc_Ctr_U_DIAG:
5556  000a 00            	ds.b	1
5557                     	xdef	_uc_Ctr_U_DIAG
5558  000b               _uc_Ctr_LD:
5559  000b 00            	ds.b	1
5560                     	xdef	_uc_Ctr_LD
5561  000c               _uc_Ctr_TARVL:
5562  000c 00            	ds.b	1
5563                     	xdef	_uc_Ctr_TARVL
5564  000d               _ui_FET3_Duty:
5565  000d 0000          	ds.b	2
5566                     	xdef	_ui_FET3_Duty
5567  000f               _ui_FET2_Duty:
5568  000f 0000          	ds.b	2
5569                     	xdef	_ui_FET2_Duty
5570  0011               _ui_FET1_Duty:
5571  0011 0000          	ds.b	2
5572                     	xdef	_ui_FET1_Duty
5573  0013               _uc_Rx_TimeOut_Reg:
5574  0013 00            	ds.b	1
5575                     	xdef	_uc_Rx_TimeOut_Reg
5576  0014               _uc_Test_Ctrl_Reg:
5577  0014 00            	ds.b	1
5578                     	xdef	_uc_Test_Ctrl_Reg
5579                     	xref	_SW_Status
5580                     	xref	f_Num_Display_LCD
5581                     	xref	f_Clear_Display_LCD
5582                     	xref	f_Display_LCD_String
5583                     	xref	f_Set_LCD_Address
5584                     	xref	_LCD_Dis_Data
5585                     	xref	_LCD_Line
5586                     	xref	_uc_LCD_Blink_Reg
5587                     	xref	_uc_System_Ctrl_Reg
5588                     .const:	section	.text
5589  0000               L5123:
5590  0000 4e00          	dc.b	"N",0
5591  0002               L1123:
5592  0002 2000          	dc.b	" ",0
5593  0004               L5023:
5594  0004 4300          	dc.b	"C",0
5595  0006               L5303:
5596  0006 49766400      	dc.b	"Ivd",0
5597  000a               L7203:
5598  000a 45727200      	dc.b	"Err",0
5599  000e               L1203:
5600  000e 4e6f7200      	dc.b	"Nor",0
5601  0012               L3772:
5602  0012 414400        	dc.b	"AD",0
5603  0015               L7472:
5604  0015 4e4e202000    	dc.b	"NN  ",0
5605  001a               L5272:
5606  001a 525800        	dc.b	"RX",0
5607  001d               L3172:
5608  001d 5700          	dc.b	"W",0
5609  001f               L1072:
5610  001f 4100          	dc.b	"A",0
5611  0021               L7662:
5612  0021 5600          	dc.b	"V",0
5613  0023               L3662:
5614  0023 4e4e2000      	dc.b	"NN ",0
5615  0027               L1262:
5616  0027 564420496e41  	dc.b	"VD InAct",0
5617  0030               L3162:
5618  0030 564420416374  	dc.b	"VD Act",0
5619  0037               L3652:
5620  0037 496e766c6400  	dc.b	"Invld",0
5621  003d               L5552:
5622  003d 4c4400        	dc.b	"LD",0
5623  0040               L7452:
5624  0040 4e6f204c4400  	dc.b	"No LD",0
5625  0046               L7742:
5626  0046 545800        	dc.b	"TX",0
5627  0049               L3442:
5628  0049 2e00          	dc.b	".",0
5629  004b               L7342:
5630  004b 202020202020  	dc.b	"       ",0
5631  0053               L5042:
5632  0053 2500          	dc.b	"%",0
5633  0055               L1042:
5634  0055 202020202000  	dc.b	"     ",0
5635  005b               L5732:
5636  005b 445f556e6974  	dc.b	"D_Unit:",0
5637  0063               L3732:
5638  0063 2a4f5054494f  	dc.b	"*OPTION*",0
5639  006c               L7432:
5640  006c 43453a00      	dc.b	"CE:",0
5641  0070               L5432:
5642  0070 49443a202020  	dc.b	"ID:    OT:",0
5643  007b               L3432:
5644  007b 4f563a202020  	dc.b	"OV:    UU:",0
5645  0086               L1432:
5646  0086 53433a202020  	dc.b	"SC:    Tm:",0
5647  0091               L7332:
5648  0091 43554100      	dc.b	"CUA",0
5649  0095               L5332:
5650  0095 5357443a00    	dc.b	"SWD:",0
5651  009a               L3332:
5652  009a 49474e3a00    	dc.b	"IGN:",0
5653  009f               L1332:
5654  009f 5450573a00    	dc.b	"TPW:",0
5655  00a4               L7232:
5656  00a4 5057523a00    	dc.b	"PWR:",0
5657  00a9               L5232:
5658  00a9 4355523a00    	dc.b	"CUR:",0
5659  00ae               L3232:
5660  00ae 4856203a00    	dc.b	"HV :",0
5661  00b3               L1232:
5662  00b3 5544493a00    	dc.b	"UDI:",0
5663  00b8               L7132:
5664  00b8 4c44203a00    	dc.b	"LD :",0
5665  00bd               L5132:
5666  00bd 5441523a00    	dc.b	"TAR:",0
5667  00c2               L3132:
5668  00c2 00            	dc.b	0
5669  00c3               L1132:
5670  00c3 4430323a00    	dc.b	"D02:",0
5671  00c8               L7032:
5672  00c8 4430313a00    	dc.b	"D01:",0
5673  00cd               L5032:
5674  00cd 4430303a00    	dc.b	"D00:",0
5675                     	xref.b	c_y
5695                     	end

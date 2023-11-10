   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _MD_Data_Step:
2660  0000 00            	dc.b	0
2661  0001               _MD_Test_Pg:
2662  0001 00            	dc.b	0
2663  0002               _MD_Pre_Pg:
2664  0002 07            	dc.b	7
2665  0003               _MD_T_Unit:
2666  0003 0000000a      	dc.l	10
2667  0007               _MD_Unit:
2668  0007 01            	dc.b	1
2669  0008               _MD_Vehicle_Logic:
2670  0008 01            	dc.b	1
2671  0009               _MD_ID206_Data:
2672  0009 00            	dc.b	0
2673  000a 000000000000  	ds.b	7
2674  0011               _MD_ID306_Data:
2675  0011 00            	dc.b	0
2676  0012 000000000000  	ds.b	7
2677  0019               _MD_ID506_Data:
2678  0019 00            	dc.b	0
2679  001a 000000000000  	ds.b	7
2680  0021               _MD_ID316_Data:
2681  0021 00            	dc.b	0
2682  0022 000000000000  	ds.b	7
2683  0029               _MD_ID205_Data:
2684  0029 00            	dc.b	0
2685  002a 000000000000  	ds.b	7
2686  0031               _MD_ID355_Data:
2687  0031 00            	dc.b	0
2688  0032 000000000000  	ds.b	7
2743                     ; 33 void ModelS_Reset(void)
2743                     ; 34 {
2744                     	switch	.text
2745  0000               f_ModelS_Reset:
2749                     ; 35 	MD_Test_Pg = 0;	//display page reset
2751  0000 725f0001      	clr	_MD_Test_Pg
2752                     ; 36 	MD_Pre_Pg = 8;
2754  0004 35080002      	mov	_MD_Pre_Pg,#8
2755                     ; 37 	MD_Data_Step = 0; //data select reset
2757  0008 725f0000      	clr	_MD_Data_Step
2758                     ; 40 	PTC_BATT_VALUE = 0;
2760  000c 5f            	clrw	x
2761  000d cf0000        	ldw	_PTC_BATT_VALUE,x
2762                     ; 41 	PTC_Cur_VALUE = 0;
2764  0010 725f0000      	clr	_PTC_Cur_VALUE
2765                     ; 42 	PTC_PWR_VALUE = 0;
2767  0014 cf0000        	ldw	_PTC_PWR_VALUE,x
2768                     ; 43 	PTC_Fdback_Duty = 0;
2770  0017 725f0000      	clr	_PTC_Fdback_Duty
2771                     ; 44 	PTC_LCore_Temp = 0;
2773  001b 725f0000      	clr	_PTC_LCore_Temp
2774                     ; 45 	PTC_RCore_Temp = 0;
2776  001f 725f0000      	clr	_PTC_RCore_Temp
2777                     ; 46 	PTC_IGBT1_Temp = 0;
2779  0023 725f0000      	clr	_PTC_IGBT1_Temp
2780                     ; 47 	PTC_IGBT2_Temp = 0;
2782  0027 725f0000      	clr	_PTC_IGBT2_Temp
2783                     ; 48 	PTC_PCB1_Temp = 0;
2785  002b 725f0000      	clr	_PTC_PCB1_Temp
2786                     ; 49 	PTC_PCB2_Temp = 0;
2788  002f 725f0000      	clr	_PTC_PCB2_Temp
2789                     ; 50 	PTC_Limit_Cause = 0;
2791  0033 725f0000      	clr	_PTC_Limit_Cause
2792                     ; 51 	PTC_SW_Ver = 0;
2794  0037 725f0000      	clr	_PTC_SW_Ver
2795                     ; 52 	PTC_Status1 = 0;
2797  003b 725f0000      	clr	_PTC_Status1
2798                     ; 53 	PTC_Status2 = 0;
2800  003f 725f0000      	clr	_PTC_Status2
2801                     ; 54 	PTC_Status3 = 0;
2803  0043 725f0000      	clr	_PTC_Status3
2804                     ; 55 	PTC_AllowOperation= 0;
2806  0047 725f0000      	clr	_PTC_AllowOperation
2807                     ; 56 	PTC_Heat_Duty = 0;
2809  004b 725f0000      	clr	_PTC_Heat_Duty
2810                     ; 58 	PTC_AllowOperation= 0;
2812  004f 725f0000      	clr	_PTC_AllowOperation
2813                     ; 62 	CAN_Operation_App = 0;	
2815  0053 725f0000      	clr	_CAN_Operation_App
2816                     ; 63 	MD_Unit = 1;
2818  0057 35010007      	mov	_MD_Unit,#1
2819                     ; 65 	 MD_Unit = 1;
2821  005b 35010007      	mov	_MD_Unit,#1
2822                     ; 66 	MD_T_UpDn = 0;
2824  005f cf0004        	ldw	_MD_T_UpDn,x
2825                     ; 67 	MD_T_Unit = 60;
2827  0062 ae003c        	ldw	x,#60
2828  0065 cf0005        	ldw	_MD_T_Unit+2,x
2829  0068 5f            	clrw	x
2830  0069 cf0003        	ldw	_MD_T_Unit,x
2831                     ; 68 	MD_T_Cnt = 0;
2833  006c cf0002        	ldw	_MD_T_Cnt+2,x
2834  006f cf0000        	ldw	_MD_T_Cnt,x
2835                     ; 72 	return;
2838  0072 87            	retf	
2865                     ; 78 void ModelS_Display_Handling(void)
2865                     ; 79 {
2866                     	switch	.text
2867  0073               f_ModelS_Display_Handling:
2871                     ; 80 	if(ModelS_PTC_V56_flag){
2873  0073 7204000004ac  	btjf	_Can_Select_Device,#2,L1002
2874                     ; 83 		switch(MD_Test_Pg){
2876  007c c60001        	ld	a,_MD_Test_Pg
2878                     ; 130 			default: break;
2879  007f a10b          	cp	a,#11
2880  0081 2504ac2f022f  	jruge	L5302
2881  0087 8d000000      	callf	d_jctab
2883  008b               L27:
2884  008b 0017          	dc.w	L1271-L27
2885  008d 0042          	dc.w	L3271-L27
2886  008f 0053          	dc.w	L5271-L27
2887  0091 0053          	dc.w	L5271-L27
2888  0093 0053          	dc.w	L5271-L27
2889  0095 007e          	dc.w	L3371-L27
2890  0097 007e          	dc.w	L3371-L27
2891  0099 007e          	dc.w	L3371-L27
2892  009b 007e          	dc.w	L3371-L27
2893  009d 007e          	dc.w	L3371-L27
2894  009f 007e          	dc.w	L3371-L27
2896  00a1 87            	retf	
2897  00a2               L1271:
2898                     ; 85 			case 0:
2898                     ; 86 					strcpy(LCD_Dis_Data[0],"PAw:");		// PTC Allow
2900  00a2 ae039a        	ldw	x,#L7002
2901  00a5 89            	pushw	x
2902  00a6 ae0000        	ldw	x,#_LCD_Dis_Data
2903  00a9 8d000000      	callf	f_strcpy
2905  00ad 85            	popw	x
2906                     ; 87 					strcpy(LCD_Dis_Data[1],"TDt:    FDt:");	// Target Duty:   Feedback Duty:
2908  00ae ae038d        	ldw	x,#L1102
2909  00b1 89            	pushw	x
2910  00b2 ae0010        	ldw	x,#_LCD_Dis_Data+16
2911  00b5 8d000000      	callf	f_strcpy
2913  00b9 85            	popw	x
2914                     ; 88 					strcpy(LCD_Dis_Data[2],"R:  F:  PWR:");	// PTC Ready:    PTC Fault:
2916  00ba ae0380        	ldw	x,#L3102
2917  00bd 89            	pushw	x
2918  00be ae0020        	ldw	x,#_LCD_Dis_Data+32
2919  00c1 8d000000      	callf	f_strcpy
2921  00c5 85            	popw	x
2922                     ; 89 					strcpy(LCD_Dis_Data[3],"HV :    Cur:");	// HV:		HV Current:
2924  00c6 ae0373        	ldw	x,#L5102
2926                     ; 90 					break;
2928  00c9 ac260226      	jpf	LC001
2929  00cd               L3271:
2930                     ; 92 			case 1:
2930                     ; 93 					strcpy(LCD_Dis_Data[0],"LCT:    RCT:");		// Left Core Temp:	Right Core Temp:
2932  00cd ae0366        	ldw	x,#L7102
2933  00d0 89            	pushw	x
2934  00d1 ae0000        	ldw	x,#_LCD_Dis_Data
2935  00d4 8d000000      	callf	f_strcpy
2937  00d8 85            	popw	x
2938                     ; 94 					strcpy(LCD_Dis_Data[1],"SWV:");	
2940  00d9 ae0361        	ldw	x,#L1202
2942                     ; 95 					strcpy(LCD_Dis_Data[2],"");	
2944                     ; 96 					strcpy(LCD_Dis_Data[3],"");	
2946                     ; 97 					break;
2948  00dc 200f          	jpf	LC005
2949  00de               L5271:
2950                     ; 99 			case 2:
2950                     ; 100 					strcpy(LCD_Dis_Data[0],"");	
2952                     ; 101 					strcpy(LCD_Dis_Data[1],"");	
2954                     ; 102 					strcpy(LCD_Dis_Data[2],"");	
2956                     ; 103 					strcpy(LCD_Dis_Data[3],"");	
2958                     ; 104 					break;
2960                     ; 106 			case 3:
2960                     ; 107 					strcpy(LCD_Dis_Data[0],"");	
2962                     ; 108 					strcpy(LCD_Dis_Data[1],"");	
2964                     ; 109 					strcpy(LCD_Dis_Data[2],"");			
2966                     ; 110 					strcpy(LCD_Dis_Data[3],"");
2968                     ; 111 					break;
2970                     ; 113 			case 4:	strcpy(LCD_Dis_Data[0],"");	
2973                     ; 114 					strcpy(LCD_Dis_Data[1],"");	
2982  00de ae0360        	ldw	x,#L3202
2983  00e1 89            	pushw	x
2984  00e2 ae0000        	ldw	x,#_LCD_Dis_Data
2985  00e5 8d000000      	callf	f_strcpy
2986  00e9 85            	popw	x
2994  00ea ae0360        	ldw	x,#L3202
2996                     ; 115 					strcpy(LCD_Dis_Data[2],"");			
2998  00ed               LC005:
2999  00ed 89            	pushw	x
3000  00ee ae0010        	ldw	x,#_LCD_Dis_Data+16
3001  00f1 8d000000      	callf	f_strcpy
3002  00f5 85            	popw	x
3011  00f6 ae0360        	ldw	x,#L3202
3013                     ; 116 					strcpy(LCD_Dis_Data[3],"");
3015  00f9               LC004:
3016  00f9 89            	pushw	x
3017  00fa ae0020        	ldw	x,#_LCD_Dis_Data+32
3018  00fd 8d000000      	callf	f_strcpy
3019  0101 85            	popw	x
3029  0102 ae0360        	ldw	x,#L3202
3031                     ; 117 					break;				
3033  0105 ac260226      	jpf	LC001
3034  0109               L3371:
3035                     ; 118 			case 5:														
3035                     ; 119 			case 6:
3035                     ; 120 			case 7:
3035                     ; 121 			case 8:
3035                     ; 122 			case 9:  
3035                     ; 123 			case 10:  
3035                     ; 124 					strcpy(LCD_Dis_Data[0],"*Option*");
3037                     ; 125 					strcpy(LCD_Dis_Data[1],"D_Unit: ");
3039                     ; 126 					strcpy(LCD_Dis_Data[2],"T_Time:");
3041                     ; 127 					strcpy(LCD_Dis_Data[3],"Up/Dn: ");
3043                     ; 128 					break;		
3045  0109 acff01ff      	jpf	L5671
3046                     ; 130 			default: break;
3049  010d               L1002:
3050                     ; 134 	else if(ModelS_PTC_V58_flag){
3052  010d 7206000004ac  	btjf	_Can_Select_Device,#3,L7302
3053                     ; 136 		switch(MD_Test_Pg){
3055  0116 c60001        	ld	a,_MD_Test_Pg
3057                     ; 175 			default: break;
3058  0119 a10b          	cp	a,#11
3059  011b 2504ac2f022f  	jruge	L5302
3060  0121 8d000000      	callf	d_jctab
3062  0125               L651:
3063  0125 0017          	dc.w	L7371-L651
3064  0127 0042          	dc.w	L1471-L651
3065  0129 006d          	dc.w	L3471-L651
3066  012b 006d          	dc.w	L3471-L651
3067  012d 006d          	dc.w	L3471-L651
3068  012f 0071          	dc.w	L1571-L651
3069  0131 0071          	dc.w	L1571-L651
3070  0133 0071          	dc.w	L1571-L651
3071  0135 0071          	dc.w	L1571-L651
3072  0137 0071          	dc.w	L1571-L651
3073  0139 0071          	dc.w	L1571-L651
3075  013b 87            	retf	
3076  013c               L7371:
3077                     ; 138 			case 0:	strcpy(LCD_Dis_Data[0],"PAw:    P:");		// PTC Allow
3079  013c ae0333        	ldw	x,#L5402
3080  013f 89            	pushw	x
3081  0140 ae0000        	ldw	x,#_LCD_Dis_Data
3082  0143 8d000000      	callf	f_strcpy
3084  0147 85            	popw	x
3085                     ; 139 					strcpy(LCD_Dis_Data[1],"TDt:    FDt:");	// Target Duty:   Feedback Duty:
3087  0148 ae038d        	ldw	x,#L1102
3088  014b 89            	pushw	x
3089  014c ae0010        	ldw	x,#_LCD_Dis_Data+16
3090  014f 8d000000      	callf	f_strcpy
3092  0153 85            	popw	x
3093                     ; 140 					strcpy(LCD_Dis_Data[2],"R:  F:  PWR:");	// PTC Ready:    PTC Fault:
3095  0154 ae0380        	ldw	x,#L3102
3096  0157 89            	pushw	x
3097  0158 ae0020        	ldw	x,#_LCD_Dis_Data+32
3098  015b 8d000000      	callf	f_strcpy
3100  015f 85            	popw	x
3101                     ; 141 					strcpy(LCD_Dis_Data[3],"HV :    Cur:");	// HV:		HV Current:
3103  0160 ae0373        	ldw	x,#L5102
3105                     ; 142 					break;
3107  0163 ac260226      	jpf	LC001
3108  0167               L1471:
3109                     ; 143 			case 1:	strcpy(LCD_Dis_Data[0],"LCT:    RCT:");		// Left Core Temp:	Right Core Temp:
3111  0167 ae0366        	ldw	x,#L7102
3112  016a 89            	pushw	x
3113  016b ae0000        	ldw	x,#_LCD_Dis_Data
3114  016e 8d000000      	callf	f_strcpy
3116  0172 85            	popw	x
3117                     ; 144 					strcpy(LCD_Dis_Data[1],"IG1:    IG2:");		// IGBT	
3119  0173 ae0326        	ldw	x,#L7402
3120  0176 89            	pushw	x
3121  0177 ae0010        	ldw	x,#_LCD_Dis_Data+16
3122  017a 8d000000      	callf	f_strcpy
3124  017e 85            	popw	x
3125                     ; 145 					strcpy(LCD_Dis_Data[2],"PLV:    PHV:");	
3127  017f ae0319        	ldw	x,#L1502
3128  0182 89            	pushw	x
3129  0183 ae0020        	ldw	x,#_LCD_Dis_Data+32
3130  0186 8d000000      	callf	f_strcpy
3132  018a 85            	popw	x
3133                     ; 146 					strcpy(LCD_Dis_Data[3],"SWV:");	
3135  018b ae0361        	ldw	x,#L1202
3137                     ; 147 					break;
3139  018e ac260226      	jpf	LC001
3140  0192               L3471:
3141                     ; 148 			case 2:	strcpy(LCD_Dis_Data[0],"");	
3143                     ; 149 					strcpy(LCD_Dis_Data[1],"");	
3145                     ; 150 					strcpy(LCD_Dis_Data[2],"");	
3147                     ; 151 					strcpy(LCD_Dis_Data[3],"");	
3149                     ; 152 					break;
3151                     ; 153 			case 3:	strcpy(LCD_Dis_Data[0],"");	
3153                     ; 154 					strcpy(LCD_Dis_Data[1],"");	
3155                     ; 155 					strcpy(LCD_Dis_Data[2],"");			
3157                     ; 156 					strcpy(LCD_Dis_Data[3],"");
3159                     ; 157 					break;
3161                     ; 158 			case 4:	strcpy(LCD_Dis_Data[0],"");	
3163                     ; 159 					strcpy(LCD_Dis_Data[1],"");	
3165                     ; 160 					strcpy(LCD_Dis_Data[2],"");			
3167                     ; 161 					strcpy(LCD_Dis_Data[3],"");
3169                     ; 162 					break;				
3171  0192 acde00de      	jpf	L5271
3172  0196               L1571:
3173                     ; 163 			case 5:														
3173                     ; 164 			case 6:
3173                     ; 165 			case 7:
3173                     ; 166 			case 8:
3173                     ; 167 			case 9:  
3173                     ; 168 			case 10:  
3173                     ; 169 					strcpy(LCD_Dis_Data[0],"Vehcle:");
3175  0196 ae0311        	ldw	x,#L3502
3177                     ; 170 					strcpy(LCD_Dis_Data[1],"D_Unit: ");
3179                     ; 171 					strcpy(LCD_Dis_Data[2],"T_Time:");
3181                     ; 172 					strcpy(LCD_Dis_Data[3],"Up/Dn: ");
3183                     ; 173 					break;		
3185  0199 2067          	jpf	LC002
3186                     ; 175 			default: break;
3189  019b               L7302:
3190                     ; 178 	else if(ModelX_PTC_flag){
3192  019b 720c000004ac  	btjf	_Can_Select_Device,#6,L5302
3193                     ; 180 		switch(MD_Test_Pg){
3195  01a4 c60001        	ld	a,_MD_Test_Pg
3197                     ; 211 			default: break;
3198  01a7 270e          	jreq	L5571
3199  01a9 4a            	dec	a
3200  01aa 2734          	jreq	L7571
3201  01ac 4a            	dec	a
3202  01ad 27e3          	jreq	L5271
3203  01af 4a            	dec	a
3204  01b0 27e0          	jreq	L5271
3205  01b2 a007          	sub	a,#7
3206  01b4 2749          	jreq	L5671
3208  01b6 87            	retf	
3209  01b7               L5571:
3210                     ; 182 			case 0:	strcpy(LCD_Dis_Data[0],"PAw:");		// PTC Allow
3212  01b7 ae039a        	ldw	x,#L7002
3213  01ba 89            	pushw	x
3214  01bb ae0000        	ldw	x,#_LCD_Dis_Data
3215  01be 8d000000      	callf	f_strcpy
3217  01c2 85            	popw	x
3218                     ; 183 					strcpy(LCD_Dis_Data[1],"TDt:    FDt:");	// Target Duty:   Feedback Duty:
3220  01c3 ae038d        	ldw	x,#L1102
3221  01c6 89            	pushw	x
3222  01c7 ae0010        	ldw	x,#_LCD_Dis_Data+16
3223  01ca 8d000000      	callf	f_strcpy
3225  01ce 85            	popw	x
3226                     ; 184 					strcpy(LCD_Dis_Data[2],"R:  F:  PWR:");	// PTC Ready:    PTC Fault:    PTC_POWER:
3228  01cf ae0380        	ldw	x,#L3102
3229  01d2 89            	pushw	x
3230  01d3 ae0020        	ldw	x,#_LCD_Dis_Data+32
3231  01d6 8d000000      	callf	f_strcpy
3233  01da 85            	popw	x
3234                     ; 185 					strcpy(LCD_Dis_Data[3],"HV :    Cur:");	// HV:		HV Current:
3236  01db ae0373        	ldw	x,#L5102
3238                     ; 186 					break;
3240  01de 2046          	jpf	LC001
3241  01e0               L7571:
3242                     ; 188 			case 1:	strcpy(LCD_Dis_Data[0],"CORE_T:");		
3244  01e0 ae0309        	ldw	x,#L5602
3245  01e3 89            	pushw	x
3246  01e4 ae0000        	ldw	x,#_LCD_Dis_Data
3247  01e7 8d000000      	callf	f_strcpy
3249  01eb 85            	popw	x
3250                     ; 189 					strcpy(LCD_Dis_Data[1],"IGBT_T:");		
3252  01ec ae0301        	ldw	x,#L7602
3253  01ef 89            	pushw	x
3254  01f0 ae0010        	ldw	x,#_LCD_Dis_Data+16
3255  01f3 8d000000      	callf	f_strcpy
3257  01f7 85            	popw	x
3258                     ; 190 					strcpy(LCD_Dis_Data[2],"PCB_T :");	
3260  01f8 ae02f9        	ldw	x,#L1702
3262                     ; 191 					strcpy(LCD_Dis_Data[3],"");	
3264                     ; 192 					break;
3266  01fb acf900f9      	jpf	LC004
3267                     ; 193 			case 2:	strcpy(LCD_Dis_Data[0],"");	
3269                     ; 194 					strcpy(LCD_Dis_Data[1],"");	
3271                     ; 195 					strcpy(LCD_Dis_Data[2],"");	
3273                     ; 196 					strcpy(LCD_Dis_Data[3],"");	
3275                     ; 197 					break;
3277                     ; 198 			case 3:	strcpy(LCD_Dis_Data[0],"");	
3279                     ; 199 					strcpy(LCD_Dis_Data[1],"");	
3281                     ; 200 					strcpy(LCD_Dis_Data[2],"");	
3283                     ; 201 					strcpy(LCD_Dis_Data[3],"");	
3285                     ; 202 					break;
3287  01ff               L5671:
3288                     ; 204 			case 10:  
3288                     ; 205 					strcpy(LCD_Dis_Data[0],"*Option*");
3291  01ff ae0357        	ldw	x,#L5202
3293                     ; 206 					strcpy(LCD_Dis_Data[1],"D_Unit: ");
3296                     ; 207 					strcpy(LCD_Dis_Data[2],"T_Time:");
3299                     ; 208 					strcpy(LCD_Dis_Data[3],"Up/Dn: ");
3301  0202               LC002:
3302  0202 89            	pushw	x
3303  0203 ae0000        	ldw	x,#_LCD_Dis_Data
3304  0206 8d000000      	callf	f_strcpy
3305  020a 85            	popw	x
3308  020b ae034e        	ldw	x,#L7202
3309  020e 89            	pushw	x
3310  020f ae0010        	ldw	x,#_LCD_Dis_Data+16
3311  0212 8d000000      	callf	f_strcpy
3312  0216 85            	popw	x
3315  0217 ae0346        	ldw	x,#L1302
3316  021a 89            	pushw	x
3317  021b ae0020        	ldw	x,#_LCD_Dis_Data+32
3318  021e 8d000000      	callf	f_strcpy
3319  0222 85            	popw	x
3322  0223 ae033e        	ldw	x,#L3302
3324  0226               LC001:
3325  0226 89            	pushw	x
3326  0227 ae0030        	ldw	x,#_LCD_Dis_Data+48
3327  022a 8d000000      	callf	f_strcpy
3328  022e 85            	popw	x
3329                     ; 209 					break;	
3331                     ; 211 			default: break;
3333  022f               L5302:
3334                     ; 216 	return;
3337  022f 87            	retf	
3376                     .const:	section	.text
3377  0000               L232:
3378  0000 00000708      	dc.l	1800
3379  0004               L432:
3380  0004 0000000b      	dc.l	11
3381                     ; 220 void ModelS_V56_Value_Change(unsigned char ST)
3381                     ; 221 {
3382                     	switch	.text
3383  0230               f_ModelS_V56_Value_Change:
3385  0230 88            	push	a
3386       00000000      OFST:	set	0
3389                     ; 223 	if(ST == 1){
3391  0231 4a            	dec	a
3392  0232 2704acbf02bf  	jrne	L7012
3393                     ; 225 		if(MD_Option_flag){
3395  0238 7207000657    	btjf	_MD_Test_Register,#3,L1112
3396                     ; 226 			if(MD_Data_Step == 1){if(MD_Unit<200){MD_Unit++;}}
3398  023d c60000        	ld	a,_MD_Data_Step
3399  0240 4a            	dec	a
3400  0241 2613          	jrne	L3112
3403  0243 c60007        	ld	a,_MD_Unit
3404  0246 a1c8          	cp	a,#200
3405  0248 2504ac3c033c  	jruge	L5412
3408  024e 725c0007      	inc	_MD_Unit
3409  0252 ac3c033c      	jra	L5412
3410  0256               L3112:
3411                     ; 227 			else if(MD_Data_Step == 2){if(MD_T_Unit<1800){MD_T_Unit +=10;}}
3413  0256 c60000        	ld	a,_MD_Data_Step
3414  0259 a102          	cp	a,#2
3415  025b 261d          	jrne	L1212
3418  025d ae0003        	ldw	x,#_MD_T_Unit
3419  0260 8d000000      	callf	d_ltor
3421  0264 ae0000        	ldw	x,#L232
3422  0267 8d000000      	callf	d_lcmp
3424  026b 24e5          	jruge	L5412
3427  026d ae0003        	ldw	x,#_MD_T_Unit
3428  0270 a60a          	ld	a,#10
3429  0272 8d000000      	callf	d_lgadc
3431  0276 ac3c033c      	jra	L5412
3432  027a               L1212:
3433                     ; 228 			else if(MD_Data_Step == 3){ if(MD_T_UpDn<3){MD_T_UpDn++;}}
3435  027a c60000        	ld	a,_MD_Data_Step
3436  027d a103          	cp	a,#3
3437  027f 26f5          	jrne	L5412
3440  0281 ce0004        	ldw	x,_MD_T_UpDn
3441  0284 a30003        	cpw	x,#3
3442  0287 24ed          	jruge	L5412
3445  0289 ce0004        	ldw	x,_MD_T_UpDn
3446  028c 5c            	incw	x
3447  028d cf0004        	ldw	_MD_T_UpDn,x
3448  0290 ac3c033c      	jra	L5412
3449  0294               L1112:
3450                     ; 232 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
3452  0294 725d0000      	tnz	_MD_Data_Step
3453  0298 260c          	jrne	L5312
3456  029a c60000        	ld	a,_PTC_AllowOperation
3457  029d a801          	xor	a,#1
3458  029f c70000        	ld	_PTC_AllowOperation,a
3460  02a2 ac3c033c      	jra	L5412
3461  02a6               L5312:
3462                     ; 233 			else if(MD_Data_Step == 1){
3464  02a6 c60000        	ld	a,_MD_Data_Step
3465  02a9 4a            	dec	a
3466  02aa 26f6          	jrne	L5412
3467                     ; 234 				PTC_Heat_Duty += MD_Unit;
3469  02ac c60000        	ld	a,_PTC_Heat_Duty
3470  02af cb0007        	add	a,_MD_Unit
3471  02b2 c70000        	ld	_PTC_Heat_Duty,a
3472                     ; 235 				if( PTC_Heat_Duty > 200){PTC_Heat_Duty = 200;}
3474  02b5 a1c9          	cp	a,#201
3475  02b7 25e9          	jrult	L5412
3478  02b9 35c80000      	mov	_PTC_Heat_Duty,#200
3479  02bd 207d          	jra	L5412
3480  02bf               L7012:
3481                     ; 240 	else if(ST == 0){
3483  02bf 7b01          	ld	a,(OFST+1,sp)
3484  02c1 2679          	jrne	L5412
3485                     ; 241 		if(MD_Option_flag){
3487  02c3 720700064a    	btjf	_MD_Test_Register,#3,L1512
3488                     ; 242 			if(MD_Data_Step == 1){if(MD_Unit>1){MD_Unit--;}  }
3490  02c8 c60000        	ld	a,_MD_Data_Step
3491  02cb 4a            	dec	a
3492  02cc 260d          	jrne	L3512
3495  02ce c60007        	ld	a,_MD_Unit
3496  02d1 a102          	cp	a,#2
3497  02d3 2567          	jrult	L5412
3500  02d5 725a0007      	dec	_MD_Unit
3501  02d9 2061          	jra	L5412
3502  02db               L3512:
3503                     ; 243 			else if(MD_Data_Step == 2){if(MD_T_Unit>10){MD_T_Unit -=10;}}
3505  02db c60000        	ld	a,_MD_Data_Step
3506  02de a102          	cp	a,#2
3507  02e0 261b          	jrne	L1612
3510  02e2 ae0003        	ldw	x,#_MD_T_Unit
3511  02e5 8d000000      	callf	d_ltor
3513  02e9 ae0004        	ldw	x,#L432
3514  02ec 8d000000      	callf	d_lcmp
3516  02f0 254a          	jrult	L5412
3519  02f2 ae0003        	ldw	x,#_MD_T_Unit
3520  02f5 a60a          	ld	a,#10
3521  02f7 8d000000      	callf	d_lgsbc
3523  02fb 203f          	jra	L5412
3524  02fd               L1612:
3525                     ; 244 			else if(MD_Data_Step == 3){if(MD_T_UpDn>0){MD_T_UpDn--;}}
3527  02fd c60000        	ld	a,_MD_Data_Step
3528  0300 a103          	cp	a,#3
3529  0302 2638          	jrne	L5412
3532  0304 ce0004        	ldw	x,_MD_T_UpDn
3533  0307 2733          	jreq	L5412
3536  0309 ce0004        	ldw	x,_MD_T_UpDn
3537  030c 5a            	decw	x
3538  030d cf0004        	ldw	_MD_T_UpDn,x
3539  0310 202a          	jra	L5412
3540  0312               L1512:
3541                     ; 247 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
3543  0312 725d0000      	tnz	_MD_Data_Step
3544  0316 260a          	jrne	L5712
3547  0318 c60000        	ld	a,_PTC_AllowOperation
3548  031b a801          	xor	a,#1
3549  031d c70000        	ld	_PTC_AllowOperation,a
3551  0320 201a          	jra	L5412
3552  0322               L5712:
3553                     ; 248 			else if(MD_Data_Step == 1){
3555  0322 c60000        	ld	a,_MD_Data_Step
3556  0325 4a            	dec	a
3557  0326 2614          	jrne	L5412
3558                     ; 249 				if(PTC_Heat_Duty <MD_Unit){PTC_Heat_Duty = 0;}
3560  0328 c60000        	ld	a,_PTC_Heat_Duty
3561  032b c10007        	cp	a,_MD_Unit
3562  032e 2406          	jruge	L3022
3565  0330 725f0000      	clr	_PTC_Heat_Duty
3567  0334 2006          	jra	L5412
3568  0336               L3022:
3569                     ; 250 				else{PTC_Heat_Duty -= MD_Unit;}
3571  0336 c00007        	sub	a,_MD_Unit
3572  0339 c70000        	ld	_PTC_Heat_Duty,a
3573  033c               L5412:
3574                     ; 256 	return;
3577  033c 84            	pop	a
3578  033d 87            	retf	
3636                     	switch	.const
3637  0008               L624:
3638  0008 0000003c      	dc.l	60
3639                     ; 262 void ModelS_V56_LCD_Display(void)
3639                     ; 263 {
3640                     	switch	.text
3641  033e               f_ModelS_V56_LCD_Display:
3643  033e 89            	pushw	x
3644       00000002      OFST:	set	2
3647                     ; 266 	unsigned char fault_cnt=0;
3649  033f 0f01          	clr	(OFST-1,sp)
3650                     ; 269 	if(MD_Test_Pg != MD_Pre_Pg){ ModelS_Display_Handling();} 
3652  0341 c60001        	ld	a,_MD_Test_Pg
3653  0344 c10002        	cp	a,_MD_Pre_Pg
3654  0347 2704          	jreq	L5222
3657  0349 8d730073      	callf	f_ModelS_Display_Handling
3659  034d               L5222:
3660                     ; 270 	MD_Pre_Pg = MD_Test_Pg;
3662  034d 5500010002    	mov	_MD_Pre_Pg,_MD_Test_Pg
3663                     ; 273 	if(MD_Test_Pg == 0){			//page 1
3665  0352 725d0001      	tnz	_MD_Test_Pg
3666  0356 2704ac650565  	jrne	L7222
3667                     ; 274 		for(i=0; i<4; i++){
3669  035c 4f            	clr	a
3670  035d 6b02          	ld	(OFST+0,sp),a
3671  035f               L1322:
3672                     ; 275 			Set_LCD_Address(LCD_Line[i]);
3674  035f 5f            	clrw	x
3675  0360 97            	ld	xl,a
3676  0361 d60000        	ld	a,(_LCD_Line,x)
3677  0364 8d000000      	callf	f_Set_LCD_Address
3679                     ; 277 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
3681  0368 7201000626    	btjf	_MD_Test_Register,#0,L7322
3683  036d 7202000621    	btjt	_MD_Test_Register,#1,L7322
3685  0372 7b02          	ld	a,(OFST+0,sp)
3686  0374 c10000        	cp	a,_MD_Data_Step
3687  0377 261a          	jrne	L7322
3688                     ; 278 				if(Blink_50){
3690  0379 725d0000      	tnz	_Blink_50
3691  037d 2716          	jreq	LC008
3692                     ; 279 					if(i == 1){ 
3694  037f a101          	cp	a,#1
3695  0381 261d          	jrne	L1522
3696                     ; 280 						Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3698  0383 5f            	clrw	x
3699  0384 97            	ld	xl,a
3700  0385 d60000        	ld	a,(_LCD_Line,x)
3701  0388 ab08          	add	a,#8
3702  038a 8d000000      	callf	f_Set_LCD_Address
3704                     ; 281 						Display_LCD_String("FDt:");
3706  038e ae02f4        	ldw	x,#L5422
3708  0391 2009          	jpf	LC007
3709                     ; 284 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3711  0393               L7322:
3712                     ; 285 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3714  0393 7b02          	ld	a,(OFST+0,sp)
3715  0395               LC008:
3717  0395 97            	ld	xl,a
3718  0396 a610          	ld	a,#16
3719  0398 42            	mul	x,a
3720  0399 1c0000        	addw	x,#_LCD_Dis_Data
3721  039c               LC007:
3722  039c 8d000000      	callf	f_Display_LCD_String
3724  03a0               L1522:
3725                     ; 287 			if(i==0){
3727  03a0 7b02          	ld	a,(OFST+0,sp)
3728  03a2 2704ac2a042a  	jrne	L3522
3729                     ; 288 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
3731  03a8 5f            	clrw	x
3732  03a9 97            	ld	xl,a
3733  03aa d60000        	ld	a,(_LCD_Line,x)
3734  03ad ab04          	add	a,#4
3735  03af 8d000000      	callf	f_Set_LCD_Address
3737                     ; 289 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
3739  03b3 7203000616    	btjf	_MD_Test_Register,#1,L7522
3741  03b8 7b02          	ld	a,(OFST+0,sp)
3742  03ba c10000        	cp	a,_MD_Data_Step
3743  03bd 260f          	jrne	L7522
3744                     ; 290 					if(Blink_50){Display_LCD_String(" ");}
3746  03bf 725d0000      	tnz	_Blink_50
3747  03c3 2709          	jreq	L7522
3750  03c5 ae02f2        	ldw	x,#L1622
3751  03c8 8d000000      	callf	f_Display_LCD_String
3754  03cc 2009          	jra	L5622
3755  03ce               L7522:
3756                     ; 291 					else{ Num_Display_LCD(PTC_AllowOperation);}
3758                     ; 292 				}else{ Num_Display_LCD(PTC_AllowOperation);}
3761  03ce c60000        	ld	a,_PTC_AllowOperation
3762  03d1 5f            	clrw	x
3763  03d2 97            	ld	xl,a
3764  03d3 8d000000      	callf	f_Num_Display_LCD
3766  03d7               L5622:
3767                     ; 294 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
3769  03d7 7b02          	ld	a,(OFST+0,sp)
3770  03d9 5f            	clrw	x
3771  03da 97            	ld	xl,a
3772  03db d60000        	ld	a,(_LCD_Line,x)
3773  03de ab08          	add	a,#8
3774  03e0 8d000000      	callf	f_Set_LCD_Address
3776                     ; 295 				if((MD_ID206_Data[2] & 0x03) == 0x03 && (Blink_30)){ Display_LCD_String("LIMIT"); }
3778  03e4 c6000b        	ld	a,_MD_ID206_Data+2
3779  03e7 a403          	and	a,#3
3780  03e9 a103          	cp	a,#3
3781  03eb 260b          	jrne	L7622
3783  03ed 725d0000      	tnz	_Blink_30
3784  03f1 2705          	jreq	L7622
3787  03f3 ae02ec        	ldw	x,#L1722
3790  03f6 202a          	jpf	LC012
3791  03f8               L7622:
3792                     ; 296 				else if((MD_ID206_Data[2] & 0x03) == 0x02 && (Blink_30)){ Display_LCD_String("FAIL");}
3794  03f8 c6000b        	ld	a,_MD_ID206_Data+2
3795  03fb a403          	and	a,#3
3796  03fd a102          	cp	a,#2
3797  03ff 260b          	jrne	L5722
3799  0401 725d0000      	tnz	_Blink_30
3800  0405 2705          	jreq	L5722
3803  0407 ae02e7        	ldw	x,#L7722
3806  040a 2016          	jpf	LC012
3807  040c               L5722:
3808                     ; 297 				else if((MD_ID206_Data[2] & 0x03) == 0x01 && (Blink_30)){ Display_LCD_String("OPER"); }
3810  040c c6000b        	ld	a,_MD_ID206_Data+2
3811  040f a403          	and	a,#3
3812  0411 4a            	dec	a
3813  0412 260b          	jrne	L3032
3815  0414 725d0000      	tnz	_Blink_30
3816  0418 2705          	jreq	L3032
3819  041a ae02e2        	ldw	x,#L5032
3822  041d 2003          	jpf	LC012
3823  041f               L3032:
3824                     ; 298 				else{Display_LCD_String("STOP");}
3826  041f ae02dd        	ldw	x,#L1132
3827  0422               LC012:
3828  0422 8d000000      	callf	f_Display_LCD_String
3830  0426 ac550555      	jra	L3132
3831  042a               L3522:
3832                     ; 300 			else if(i==1){
3834  042a a101          	cp	a,#1
3835  042c 2676          	jrne	L5132
3836                     ; 301 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
3838  042e 5f            	clrw	x
3839  042f 97            	ld	xl,a
3840  0430 d60000        	ld	a,(_LCD_Line,x)
3841  0433 ab04          	add	a,#4
3842  0435 8d000000      	callf	f_Set_LCD_Address
3844                     ; 302 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
3846  0439 7203000616    	btjf	_MD_Test_Register,#1,L1232
3848  043e 7b02          	ld	a,(OFST+0,sp)
3849  0440 c10000        	cp	a,_MD_Data_Step
3850  0443 260f          	jrne	L1232
3851                     ; 303 					if(Blink_50){Display_LCD_String("   ");}
3853  0445 725d0000      	tnz	_Blink_50
3854  0449 2709          	jreq	L1232
3857  044b ae02d9        	ldw	x,#L3232
3858  044e 8d000000      	callf	f_Display_LCD_String
3861  0452 2025          	jra	L3332
3862  0454               L1232:
3863                     ; 305 						Num_Display_LCD(PTC_Heat_Duty/2);
3865                     ; 306 						if(PTC_Heat_Duty < 200){
3866                     ; 307 							Display_LCD_String(".");
3868                     ; 308 							Num_Display_LCD((PTC_Heat_Duty%2)*5);
3870                     ; 312 					Num_Display_LCD(PTC_Heat_Duty/2);
3873                     ; 313 					if(PTC_Heat_Duty < 200){
3875                     ; 314 						Display_LCD_String(".");
3878                     ; 315 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
3881  0454 c60000        	ld	a,_PTC_Heat_Duty
3882  0457 44            	srl	a
3883  0458 5f            	clrw	x
3884  0459 97            	ld	xl,a
3885  045a 8d000000      	callf	f_Num_Display_LCD
3887  045e c60000        	ld	a,_PTC_Heat_Duty
3888  0461 a1c8          	cp	a,#200
3889  0463 2414          	jruge	L3332
3891  0465 ae02d7        	ldw	x,#L1332
3892  0468 8d000000      	callf	f_Display_LCD_String
3894  046c c60000        	ld	a,_PTC_Heat_Duty
3895  046f a401          	and	a,#1
3896  0471 97            	ld	xl,a
3897  0472 a605          	ld	a,#5
3898  0474 42            	mul	x,a
3899  0475 8d000000      	callf	f_Num_Display_LCD
3901  0479               L3332:
3902                     ; 319 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
3904  0479 7b02          	ld	a,(OFST+0,sp)
3905  047b 5f            	clrw	x
3906  047c 97            	ld	xl,a
3907  047d d60000        	ld	a,(_LCD_Line,x)
3908  0480 ab0c          	add	a,#12
3909  0482 8d000000      	callf	f_Set_LCD_Address
3911                     ; 320 				Num_Display_LCD(MD_ID206_Data[6]/2);
3913  0486 c6000f        	ld	a,_MD_ID206_Data+6
3914  0489 44            	srl	a
3915  048a 5f            	clrw	x
3916  048b 97            	ld	xl,a
3917  048c 8d000000      	callf	f_Num_Display_LCD
3919                     ; 321 				Display_LCD_String(".");
3921  0490 ae02d7        	ldw	x,#L1332
3922  0493 8d000000      	callf	f_Display_LCD_String
3924                     ; 322 				Num_Display_LCD((MD_ID206_Data[6]%2)*5);
3926  0497 c6000f        	ld	a,_MD_ID206_Data+6
3927  049a a401          	and	a,#1
3928  049c 97            	ld	xl,a
3929  049d a605          	ld	a,#5
3930  049f 42            	mul	x,a
3933  04a0 ac510551      	jpf	LC011
3934  04a4               L5132:
3935                     ; 326 			else if(i==2){
3937  04a4 a102          	cp	a,#2
3938  04a6 2661          	jrne	L1432
3939                     ; 327 				Set_LCD_Address((unsigned char)(LCD_Line[i]+2));
3941  04a8 5f            	clrw	x
3942  04a9 97            	ld	xl,a
3943  04aa d60000        	ld	a,(_LCD_Line,x)
3944  04ad ab02          	add	a,#2
3945  04af 8d000000      	callf	f_Set_LCD_Address
3947                     ; 328 				Num_Display_LCD(MD_ID206_Data[0] & 0x01);
3949  04b3 c60009        	ld	a,_MD_ID206_Data
3950  04b6 a401          	and	a,#1
3951  04b8 5f            	clrw	x
3952  04b9 97            	ld	xl,a
3953  04ba 8d000000      	callf	f_Num_Display_LCD
3955                     ; 329 				Set_LCD_Address((unsigned char)(LCD_Line[i]+6));
3957  04be 7b02          	ld	a,(OFST+0,sp)
3958  04c0 5f            	clrw	x
3959  04c1 97            	ld	xl,a
3960  04c2 d60000        	ld	a,(_LCD_Line,x)
3961  04c5 ab06          	add	a,#6
3962  04c7 8d000000      	callf	f_Set_LCD_Address
3964                     ; 330 				Num_Display_LCD(MD_ID306_Data[0] & 0x01);
3966  04cb c60011        	ld	a,_MD_ID306_Data
3967  04ce a401          	and	a,#1
3968  04d0 5f            	clrw	x
3969  04d1 97            	ld	xl,a
3970  04d2 8d000000      	callf	f_Num_Display_LCD
3972                     ; 331 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
3974  04d6 7b02          	ld	a,(OFST+0,sp)
3975  04d8 5f            	clrw	x
3976  04d9 97            	ld	xl,a
3977  04da d60000        	ld	a,(_LCD_Line,x)
3978  04dd ab0c          	add	a,#12
3979  04df 8d000000      	callf	f_Set_LCD_Address
3981                     ; 332 				if(((MD_ID206_Data[3] << 8)+MD_ID206_Data[2]) >= 10000){Num_Display_LCD(9999);}
3983  04e3 c6000c        	ld	a,_MD_ID206_Data+3
3984  04e6 5f            	clrw	x
3985  04e7 97            	ld	xl,a
3986  04e8 4f            	clr	a
3987  04e9 cb000b        	add	a,_MD_ID206_Data+2
3988  04ec 2401          	jrnc	L043
3989  04ee 5c            	incw	x
3990  04ef               L043:
3991  04ef 02            	rlwa	x,a
3992  04f0 a32710        	cpw	x,#10000
3993  04f3 2f05          	jrslt	L3432
3996  04f5 ae270f        	ldw	x,#9999
3999  04f8 2057          	jpf	LC011
4000  04fa               L3432:
4001                     ; 333 				else{Num_Display_LCD((MD_ID206_Data[3] << 8)+MD_ID206_Data[2]);}	// Consumption Power
4003  04fa c6000c        	ld	a,_MD_ID206_Data+3
4004  04fd 5f            	clrw	x
4005  04fe 97            	ld	xl,a
4006  04ff 4f            	clr	a
4007  0500 cb000b        	add	a,_MD_ID206_Data+2
4008  0503 2401          	jrnc	L643
4009  0505 5c            	incw	x
4010  0506               L643:
4011  0506 02            	rlwa	x,a
4013  0507 2048          	jpf	LC011
4014  0509               L1432:
4015                     ; 336 			else if(i==3){
4017  0509 a103          	cp	a,#3
4018  050b 2648          	jrne	L3132
4019                     ; 337 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
4021  050d 5f            	clrw	x
4022  050e 97            	ld	xl,a
4023  050f d60000        	ld	a,(_LCD_Line,x)
4024  0512 ab04          	add	a,#4
4025  0514 8d000000      	callf	f_Set_LCD_Address
4027                     ; 338 				Num_Display_LCD(MD_ID206_Data[4] * 2);
4029  0518 c6000d        	ld	a,_MD_ID206_Data+4
4030  051b 5f            	clrw	x
4031  051c 97            	ld	xl,a
4032  051d 58            	sllw	x
4033  051e 8d000000      	callf	f_Num_Display_LCD
4035                     ; 339 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
4037  0522 7b02          	ld	a,(OFST+0,sp)
4038  0524 5f            	clrw	x
4039  0525 97            	ld	xl,a
4040  0526 d60000        	ld	a,(_LCD_Line,x)
4041  0529 ab0c          	add	a,#12
4042  052b 8d000000      	callf	f_Set_LCD_Address
4044                     ; 340 				Num_Display_LCD(MD_ID206_Data[5] / 5);
4046  052f c6000e        	ld	a,_MD_ID206_Data+5
4047  0532 5f            	clrw	x
4048  0533 97            	ld	xl,a
4049  0534 a605          	ld	a,#5
4050  0536 8d000000      	callf	d_sdivx
4052  053a 8d000000      	callf	f_Num_Display_LCD
4054                     ; 341 				Display_LCD_String(".");
4056  053e ae02d7        	ldw	x,#L1332
4057  0541 8d000000      	callf	f_Display_LCD_String
4059                     ; 342 				Num_Display_LCD((MD_ID206_Data[5] % 5) * 2);
4061  0545 c6000e        	ld	a,_MD_ID206_Data+5
4062  0548 5f            	clrw	x
4063  0549 97            	ld	xl,a
4064  054a a605          	ld	a,#5
4065  054c 8d000000      	callf	d_smodx
4067  0550 58            	sllw	x
4068  0551               LC011:
4069  0551 8d000000      	callf	f_Num_Display_LCD
4071  0555               L3132:
4072                     ; 274 		for(i=0; i<4; i++){
4074  0555 0c02          	inc	(OFST+0,sp)
4077  0557 7b02          	ld	a,(OFST+0,sp)
4078  0559 a104          	cp	a,#4
4079  055b 2404ac5f035f  	jrult	L1322
4081  0561 ac7f0c7f      	jra	L3532
4082  0565               L7222:
4083                     ; 346 	else if(MD_Test_Pg == 10){
4085  0565 c60001        	ld	a,_MD_Test_Pg
4086  0568 a10a          	cp	a,#10
4087  056a 2704acbe06be  	jrne	L5532
4088                     ; 347 		for(i=0; i<4; i++){
4090  0570 4f            	clr	a
4091  0571 6b02          	ld	(OFST+0,sp),a
4092  0573               L7532:
4093                     ; 348 			Set_LCD_Address(LCD_Line[i]);
4095  0573 5f            	clrw	x
4096  0574 97            	ld	xl,a
4097  0575 d60000        	ld	a,(_LCD_Line,x)
4098  0578 8d000000      	callf	f_Set_LCD_Address
4100                     ; 350 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
4102  057c 7201000617    	btjf	_MD_Test_Register,#0,L5632
4104  0581 7202000612    	btjt	_MD_Test_Register,#1,L5632
4106  0586 7b02          	ld	a,(OFST+0,sp)
4107  0588 c10000        	cp	a,_MD_Data_Step
4108  058b 260b          	jrne	L5632
4109                     ; 351 				if(Blink_50){Display_LCD_String("     ");}
4111  058d 725d0000      	tnz	_Blink_50
4112  0591 2707          	jreq	LC013
4115  0593 ae02d1        	ldw	x,#L1732
4118  0596 2009          	jra	L5732
4119                     ; 352 				else{Display_LCD_String(LCD_Dis_Data[i]);}
4121  0598               L5632:
4122                     ; 353 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
4124  0598 7b02          	ld	a,(OFST+0,sp)
4125  059a               LC013:
4127  059a 97            	ld	xl,a
4128  059b a610          	ld	a,#16
4129  059d 42            	mul	x,a
4130  059e 1c0000        	addw	x,#_LCD_Dis_Data
4132  05a1               L5732:
4133  05a1 8d000000      	callf	f_Display_LCD_String
4134                     ; 355 			if(i==1){
4136  05a5 7b02          	ld	a,(OFST+0,sp)
4137  05a7 a101          	cp	a,#1
4138  05a9 2642          	jrne	L7732
4139                     ; 356 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
4141  05ab 5f            	clrw	x
4142  05ac 97            	ld	xl,a
4143  05ad d60000        	ld	a,(_LCD_Line,x)
4144  05b0 ab08          	add	a,#8
4145  05b2 8d000000      	callf	f_Set_LCD_Address
4147                     ; 357 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
4149  05b6 720300060d    	btjf	_MD_Test_Register,#1,L3042
4151  05bb 7b02          	ld	a,(OFST+0,sp)
4152  05bd c10000        	cp	a,_MD_Data_Step
4153  05c0 2606          	jrne	L3042
4154                     ; 358 					if(Blink_50){Display_LCD_String("     ");}
4156  05c2 725d0000      	tnz	_Blink_50
4160  05c6 2646          	jrne	LC017
4161  05c8               L3042:
4162                     ; 360 						Num_Display_LCD(MD_Unit/2);
4164                     ; 361 						Display_LCD_String(".");
4166                     ; 362 						Num_Display_LCD((MD_Unit%2)*5);
4168                     ; 363 						Display_LCD_String("%");
4170                     ; 366 					Num_Display_LCD(MD_Unit/2);
4173                     ; 367 					Display_LCD_String(".");
4176                     ; 368 					Num_Display_LCD((MD_Unit%2)*5);
4179                     ; 369 					Display_LCD_String("%");
4182  05c8 c60007        	ld	a,_MD_Unit
4183  05cb 44            	srl	a
4184  05cc 5f            	clrw	x
4185  05cd 97            	ld	xl,a
4186  05ce 8d000000      	callf	f_Num_Display_LCD
4188  05d2 ae02d7        	ldw	x,#L1332
4189  05d5 8d000000      	callf	f_Display_LCD_String
4191  05d9 c60007        	ld	a,_MD_Unit
4192  05dc a401          	and	a,#1
4193  05de 97            	ld	xl,a
4194  05df a605          	ld	a,#5
4195  05e1 42            	mul	x,a
4196  05e2 8d000000      	callf	f_Num_Display_LCD
4198  05e6 ae02cf        	ldw	x,#L7042
4200  05e9 acaa06aa      	jpf	LC014
4201  05ed               L7732:
4202                     ; 373 			else if(i==2){
4204  05ed a102          	cp	a,#2
4205  05ef 2658          	jrne	L5142
4206                     ; 374 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
4208  05f1 5f            	clrw	x
4209  05f2 97            	ld	xl,a
4210  05f3 d60000        	ld	a,(_LCD_Line,x)
4211  05f6 ab08          	add	a,#8
4212  05f8 8d000000      	callf	f_Set_LCD_Address
4214                     ; 376 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
4216  05fc 7203000614    	btjf	_MD_Test_Register,#1,L1242
4218  0601 7b02          	ld	a,(OFST+0,sp)
4219  0603 c10000        	cp	a,_MD_Data_Step
4220  0606 260d          	jrne	L1242
4221                     ; 377 					if(Blink_50){Display_LCD_String("     ");}
4223  0608 725d0000      	tnz	_Blink_50
4224  060c 2707          	jreq	L1242
4227  060e               LC017:
4230  060e ae02d1        	ldw	x,#L1732
4233  0611 acaa06aa      	jpf	LC014
4234  0615               L1242:
4235                     ; 379 						Num_Display_LCD((unsigned int)(MD_T_Unit/60));
4239                     ; 380 						Display_LCD_String("m");
4241                     ; 381 						Num_Display_LCD((unsigned int)(MD_T_Unit%60));
4245                     ; 382 						Display_LCD_String("s");
4247                     ; 386 					Num_Display_LCD((unsigned int)(MD_T_Unit/60));
4252                     ; 387 					Display_LCD_String("m");
4255                     ; 388 					Num_Display_LCD((unsigned int)(MD_T_Unit%60));
4260                     ; 389 					Display_LCD_String("s");
4263  0615 ae0003        	ldw	x,#_MD_T_Unit
4264  0618 8d000000      	callf	d_ltor
4265  061c ae0008        	ldw	x,#L624
4266  061f 8d000000      	callf	d_ludv
4267  0623 be02          	ldw	x,c_lreg+2
4268  0625 8d000000      	callf	f_Num_Display_LCD
4270  0629 ae02cd        	ldw	x,#L5242
4271  062c 8d000000      	callf	f_Display_LCD_String
4273  0630 ae0003        	ldw	x,#_MD_T_Unit
4274  0633 8d000000      	callf	d_ltor
4275  0637 ae0008        	ldw	x,#L624
4276  063a 8d000000      	callf	d_lumd
4277  063e be02          	ldw	x,c_lreg+2
4278  0640 8d000000      	callf	f_Num_Display_LCD
4280  0644 ae02cb        	ldw	x,#L7242
4282  0647 2061          	jpf	LC014
4283  0649               L5142:
4284                     ; 393 			else if(i==3){
4286  0649 a103          	cp	a,#3
4287  064b 2661          	jrne	L3142
4288                     ; 394 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
4290  064d 5f            	clrw	x
4291  064e 97            	ld	xl,a
4292  064f d60000        	ld	a,(_LCD_Line,x)
4293  0652 ab08          	add	a,#8
4294  0654 8d000000      	callf	f_Set_LCD_Address
4296                     ; 396 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
4298  0658 720300062f    	btjf	_MD_Test_Register,#1,L7342
4300  065d 7b02          	ld	a,(OFST+0,sp)
4301  065f c10000        	cp	a,_MD_Data_Step
4302  0662 2628          	jrne	L7342
4303                     ; 397 					if(Blink_50){Display_LCD_String("     ");}
4305  0664 725d0000      	tnz	_Blink_50
4309  0668 26a4          	jrne	LC017
4310                     ; 399 						if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
4312  066a ce0004        	ldw	x,_MD_T_UpDn
4313  066d 2605          	jrne	L5442
4316  066f               LC018:
4318  066f ae02c7        	ldw	x,#L7442
4321  0672 2036          	jpf	LC014
4322  0674               L5442:
4323                     ; 400 						else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
4325  0674 ce0004        	ldw	x,_MD_T_UpDn
4326  0677 5a            	decw	x
4327  0678 2605          	jrne	L3542
4330  067a               LC019:
4332  067a ae02c4        	ldw	x,#L5542
4335  067d 202b          	jpf	LC014
4336  067f               L3542:
4337                     ; 401 						else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
4339  067f ce0004        	ldw	x,_MD_T_UpDn
4340  0682 a30002        	cpw	x,#2
4341  0685 2618          	jrne	L5052
4344  0687               LC020:
4346  0687 ae02bf        	ldw	x,#L3642
4349  068a 201e          	jpf	LC014
4350                     ; 402 						else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
4353  068c               L7342:
4354                     ; 406 					if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
4356  068c ce0004        	ldw	x,_MD_T_UpDn
4360  068f 27de          	jreq	LC018
4361                     ; 407 					else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
4363  0691 ce0004        	ldw	x,_MD_T_UpDn
4364  0694 5a            	decw	x
4368  0695 27e3          	jreq	LC019
4369                     ; 408 					else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
4371  0697 ce0004        	ldw	x,_MD_T_UpDn
4372  069a a30002        	cpw	x,#2
4376  069d 27e8          	jreq	LC020
4377  069f               L5052:
4378                     ; 409 					else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
4383  069f ce0004        	ldw	x,_MD_T_UpDn
4384  06a2 a30003        	cpw	x,#3
4385  06a5 2607          	jrne	L3142
4387  06a7 ae02b9        	ldw	x,#L1742
4388  06aa               LC014:
4389  06aa 8d000000      	callf	f_Display_LCD_String
4391  06ae               L3142:
4392                     ; 347 		for(i=0; i<4; i++){
4394  06ae 0c02          	inc	(OFST+0,sp)
4397  06b0 7b02          	ld	a,(OFST+0,sp)
4398  06b2 a104          	cp	a,#4
4399  06b4 2404ac730573  	jrult	L7532
4401  06ba ac7f0c7f      	jra	L3532
4402  06be               L5532:
4403                     ; 418 		for(i=0;i<4;i++){
4405  06be 4f            	clr	a
4406  06bf 6b02          	ld	(OFST+0,sp),a
4407  06c1               L5152:
4408                     ; 419 			Set_LCD_Address(LCD_Line[i]);
4410  06c1 5f            	clrw	x
4411  06c2 97            	ld	xl,a
4412  06c3 d60000        	ld	a,(_LCD_Line,x)
4413  06c6 8d000000      	callf	f_Set_LCD_Address
4415                     ; 420 			Display_LCD_String(LCD_Dis_Data[i]);
4417  06ca 7b02          	ld	a,(OFST+0,sp)
4418  06cc 97            	ld	xl,a
4419  06cd a610          	ld	a,#16
4420  06cf 42            	mul	x,a
4421  06d0 1c0000        	addw	x,#_LCD_Dis_Data
4422  06d3 8d000000      	callf	f_Display_LCD_String
4424                     ; 418 		for(i=0;i<4;i++){
4426  06d7 0c02          	inc	(OFST+0,sp)
4429  06d9 7b02          	ld	a,(OFST+0,sp)
4430  06db a104          	cp	a,#4
4431  06dd 25e2          	jrult	L5152
4432                     ; 423 		if(MD_Test_Pg == 1){	
4434  06df c60001        	ld	a,_MD_Test_Pg
4435  06e2 4a            	dec	a
4436  06e3 2704ac940794  	jrne	L3252
4437                     ; 425 			Set_LCD_Address((unsigned char)(LCD_Line[0]+4));
4439  06e9 c60000        	ld	a,_LCD_Line
4440  06ec ab04          	add	a,#4
4441  06ee 8d000000      	callf	f_Set_LCD_Address
4443                     ; 426 			if(MD_ID206_Data[7] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
4445  06f2 c60010        	ld	a,_MD_ID206_Data+7
4446  06f5 a1f1          	cp	a,#241
4447  06f7 2509          	jrult	L5252
4450  06f9 ae02b6        	ldw	x,#L7252
4451  06fc 8d000000      	callf	f_Display_LCD_String
4454  0700 2027          	jra	L1352
4455  0702               L5252:
4456                     ; 427 			else if(MD_ID206_Data[7] < 40){
4458  0702 c60010        	ld	a,_MD_ID206_Data+7
4459  0705 a128          	cp	a,#40
4460  0707 2414          	jruge	L3352
4461                     ; 428 				Display_LCD_String("-");
4463  0709 ae02b4        	ldw	x,#L5352
4464  070c 8d000000      	callf	f_Display_LCD_String
4466                     ; 429 				Num_Display_LCD(40-MD_ID206_Data[7]);
4468  0710 4f            	clr	a
4469  0711 97            	ld	xl,a
4470  0712 a628          	ld	a,#40
4471  0714 c00010        	sub	a,_MD_ID206_Data+7
4472  0717 2401          	jrnc	L605
4473  0719 5a            	decw	x
4474  071a               L605:
4475  071a 02            	rlwa	x,a
4478  071b 2008          	jpf	LC022
4479  071d               L3352:
4480                     ; 430 			}else{ Num_Display_LCD(MD_ID206_Data[7]-40);}  	
4482  071d c60010        	ld	a,_MD_ID206_Data+7
4483  0720 5f            	clrw	x
4484  0721 97            	ld	xl,a
4485  0722 1d0028        	subw	x,#40
4486  0725               LC022:
4487  0725 8d000000      	callf	f_Num_Display_LCD
4489  0729               L1352:
4490                     ; 432 			Set_LCD_Address((unsigned char)(LCD_Line[0]+12));
4492  0729 c60000        	ld	a,_LCD_Line
4493  072c ab0c          	add	a,#12
4494  072e 8d000000      	callf	f_Set_LCD_Address
4496                     ; 433 			if(MD_ID206_Data[1] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
4498  0732 c6000a        	ld	a,_MD_ID206_Data+1
4499  0735 a1f1          	cp	a,#241
4500  0737 2509          	jrult	L1452
4503  0739 ae02b6        	ldw	x,#L7252
4504  073c 8d000000      	callf	f_Display_LCD_String
4507  0740 2027          	jra	L3452
4508  0742               L1452:
4509                     ; 434 			else if(MD_ID206_Data[1] < 40){
4511  0742 c6000a        	ld	a,_MD_ID206_Data+1
4512  0745 a128          	cp	a,#40
4513  0747 2414          	jruge	L5452
4514                     ; 435 				Display_LCD_String("-");
4516  0749 ae02b4        	ldw	x,#L5352
4517  074c 8d000000      	callf	f_Display_LCD_String
4519                     ; 436 				Num_Display_LCD(40-MD_ID206_Data[1]);
4521  0750 4f            	clr	a
4522  0751 97            	ld	xl,a
4523  0752 a628          	ld	a,#40
4524  0754 c0000a        	sub	a,_MD_ID206_Data+1
4525  0757 2401          	jrnc	L225
4526  0759 5a            	decw	x
4527  075a               L225:
4528  075a 02            	rlwa	x,a
4531  075b 2008          	jpf	LC023
4532  075d               L5452:
4533                     ; 437 			}else{ Num_Display_LCD(MD_ID206_Data[1]-40);} 
4535  075d c6000a        	ld	a,_MD_ID206_Data+1
4536  0760 5f            	clrw	x
4537  0761 97            	ld	xl,a
4538  0762 1d0028        	subw	x,#40
4539  0765               LC023:
4540  0765 8d000000      	callf	f_Num_Display_LCD
4542  0769               L3452:
4543                     ; 439 			Set_LCD_Address((unsigned char)(LCD_Line[1]+4));
4545  0769 c60001        	ld	a,_LCD_Line+1
4546  076c ab04          	add	a,#4
4547  076e 8d000000      	callf	f_Set_LCD_Address
4549                     ; 440 			Num_Display_LCD(MD_ID306_Data[7] / 16);
4551  0772 c60018        	ld	a,_MD_ID306_Data+7
4552  0775 4e            	swap	a
4553  0776 a40f          	and	a,#15
4554  0778 5f            	clrw	x
4555  0779 97            	ld	xl,a
4556  077a 8d000000      	callf	f_Num_Display_LCD
4558                     ; 441 			Display_LCD_String(".");
4560  077e ae02d7        	ldw	x,#L1332
4561  0781 8d000000      	callf	f_Display_LCD_String
4563                     ; 442 			Num_Display_LCD(MD_ID306_Data[7] % 16);
4565  0785 c60018        	ld	a,_MD_ID306_Data+7
4566  0788 a40f          	and	a,#15
4567  078a 5f            	clrw	x
4568  078b 97            	ld	xl,a
4569  078c 8d000000      	callf	f_Num_Display_LCD
4572  0790 ac7f0c7f      	jra	L3532
4573  0794               L3252:
4574                     ; 448 			Set_LCD_Address((unsigned char)(LCD_Line[3]+14));
4576  0794 c60003        	ld	a,_LCD_Line+3
4577  0797 ab0e          	add	a,#14
4578  0799 8d000000      	callf	f_Set_LCD_Address
4580                     ; 449 			Display_LCD_String("D");
4582  079d ae02b2        	ldw	x,#L3552
4583  07a0 8d000000      	callf	f_Display_LCD_String
4585                     ; 450 			Num_Display_LCD(MD_Test_Pg-1);
4587  07a4 c60001        	ld	a,_MD_Test_Pg
4588  07a7 5f            	clrw	x
4589  07a8 97            	ld	xl,a
4590  07a9 5a            	decw	x
4591  07aa 8d000000      	callf	f_Num_Display_LCD
4593                     ; 453 			if(MD_ID306_Data[1] & 0x01){
4595  07ae 720100124c    	btjf	_MD_ID306_Data+1,#0,L5552
4596                     ; 454 				fault_cnt++;
4598  07b3 0c01          	inc	(OFST-1,sp)
4599                     ; 455 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4599                     ; 456 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4599                     ; 457 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4601  07b5 270d          	jreq	L3652
4603  07b7 7b01          	ld	a,(OFST-1,sp)
4604  07b9 a105          	cp	a,#5
4605  07bb 2407          	jruge	L3652
4607  07bd c60001        	ld	a,_MD_Test_Pg
4608  07c0 a102          	cp	a,#2
4609  07c2 2722          	jreq	L1652
4610  07c4               L3652:
4612  07c4 7b01          	ld	a,(OFST-1,sp)
4613  07c6 a105          	cp	a,#5
4614  07c8 250d          	jrult	L1752
4616  07ca a109          	cp	a,#9
4617  07cc 2409          	jruge	L1752
4619  07ce c60001        	ld	a,_MD_Test_Pg
4620  07d1 a103          	cp	a,#3
4621  07d3 2711          	jreq	L1652
4622  07d5 7b01          	ld	a,(OFST-1,sp)
4623  07d7               L1752:
4625  07d7 a109          	cp	a,#9
4626  07d9 2524          	jrult	L5552
4628  07db a10d          	cp	a,#13
4629  07dd 2420          	jruge	L5552
4631  07df c60001        	ld	a,_MD_Test_Pg
4632  07e2 a104          	cp	a,#4
4633  07e4 2619          	jrne	L5552
4634  07e6               L1652:
4635                     ; 458 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4637  07e6 7b01          	ld	a,(OFST-1,sp)
4638  07e8 5f            	clrw	x
4639  07e9 97            	ld	xl,a
4640  07ea 5a            	decw	x
4641  07eb a604          	ld	a,#4
4642  07ed 8d000000      	callf	d_smodx
4644  07f1 d60000        	ld	a,(_LCD_Line,x)
4645  07f4 8d000000      	callf	f_Set_LCD_Address
4647                     ; 459 					Display_LCD_String("Flt_LV_Low ");
4649  07f8 ae02a6        	ldw	x,#L5752
4650  07fb 8d000000      	callf	f_Display_LCD_String
4652  07ff               L5552:
4653                     ; 463 			if(MD_ID306_Data[1] & 0x02){
4655  07ff 720300124c    	btjf	_MD_ID306_Data+1,#1,L7752
4656                     ; 464 				fault_cnt++;
4658  0804 0c01          	inc	(OFST-1,sp)
4659                     ; 465 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4659                     ; 466 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4659                     ; 467 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4661  0806 270d          	jreq	L5062
4663  0808 7b01          	ld	a,(OFST-1,sp)
4664  080a a105          	cp	a,#5
4665  080c 2407          	jruge	L5062
4667  080e c60001        	ld	a,_MD_Test_Pg
4668  0811 a102          	cp	a,#2
4669  0813 2722          	jreq	L3062
4670  0815               L5062:
4672  0815 7b01          	ld	a,(OFST-1,sp)
4673  0817 a105          	cp	a,#5
4674  0819 250d          	jrult	L3162
4676  081b a109          	cp	a,#9
4677  081d 2409          	jruge	L3162
4679  081f c60001        	ld	a,_MD_Test_Pg
4680  0822 a103          	cp	a,#3
4681  0824 2711          	jreq	L3062
4682  0826 7b01          	ld	a,(OFST-1,sp)
4683  0828               L3162:
4685  0828 a109          	cp	a,#9
4686  082a 2524          	jrult	L7752
4688  082c a10d          	cp	a,#13
4689  082e 2420          	jruge	L7752
4691  0830 c60001        	ld	a,_MD_Test_Pg
4692  0833 a104          	cp	a,#4
4693  0835 2619          	jrne	L7752
4694  0837               L3062:
4695                     ; 468 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4697  0837 7b01          	ld	a,(OFST-1,sp)
4698  0839 5f            	clrw	x
4699  083a 97            	ld	xl,a
4700  083b 5a            	decw	x
4701  083c a604          	ld	a,#4
4702  083e 8d000000      	callf	d_smodx
4704  0842 d60000        	ld	a,(_LCD_Line,x)
4705  0845 8d000000      	callf	f_Set_LCD_Address
4707                     ; 469 					Display_LCD_String("Flt_LV_High ");
4709  0849 ae0299        	ldw	x,#L7162
4710  084c 8d000000      	callf	f_Display_LCD_String
4712  0850               L7752:
4713                     ; 473 			if(MD_ID306_Data[1] & 0x04){
4715  0850 720500124c    	btjf	_MD_ID306_Data+1,#2,L1262
4716                     ; 474 				fault_cnt++;
4718  0855 0c01          	inc	(OFST-1,sp)
4719                     ; 475 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4719                     ; 476 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4719                     ; 477 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4721  0857 270d          	jreq	L7262
4723  0859 7b01          	ld	a,(OFST-1,sp)
4724  085b a105          	cp	a,#5
4725  085d 2407          	jruge	L7262
4727  085f c60001        	ld	a,_MD_Test_Pg
4728  0862 a102          	cp	a,#2
4729  0864 2722          	jreq	L5262
4730  0866               L7262:
4732  0866 7b01          	ld	a,(OFST-1,sp)
4733  0868 a105          	cp	a,#5
4734  086a 250d          	jrult	L5362
4736  086c a109          	cp	a,#9
4737  086e 2409          	jruge	L5362
4739  0870 c60001        	ld	a,_MD_Test_Pg
4740  0873 a103          	cp	a,#3
4741  0875 2711          	jreq	L5262
4742  0877 7b01          	ld	a,(OFST-1,sp)
4743  0879               L5362:
4745  0879 a109          	cp	a,#9
4746  087b 2524          	jrult	L1262
4748  087d a10d          	cp	a,#13
4749  087f 2420          	jruge	L1262
4751  0881 c60001        	ld	a,_MD_Test_Pg
4752  0884 a104          	cp	a,#4
4753  0886 2619          	jrne	L1262
4754  0888               L5262:
4755                     ; 478 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4757  0888 7b01          	ld	a,(OFST-1,sp)
4758  088a 5f            	clrw	x
4759  088b 97            	ld	xl,a
4760  088c 5a            	decw	x
4761  088d a604          	ld	a,#4
4762  088f 8d000000      	callf	d_smodx
4764  0893 d60000        	ld	a,(_LCD_Line,x)
4765  0896 8d000000      	callf	f_Set_LCD_Address
4767                     ; 479 					Display_LCD_String("Flt_HV_Low ");
4769  089a ae028d        	ldw	x,#L1462
4770  089d 8d000000      	callf	f_Display_LCD_String
4772  08a1               L1262:
4773                     ; 483 			if(MD_ID306_Data[1] & 0x08){
4775  08a1 720700124c    	btjf	_MD_ID306_Data+1,#3,L3462
4776                     ; 484 				fault_cnt++;
4778  08a6 0c01          	inc	(OFST-1,sp)
4779                     ; 485 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4779                     ; 486 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4779                     ; 487 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4781  08a8 270d          	jreq	L1562
4783  08aa 7b01          	ld	a,(OFST-1,sp)
4784  08ac a105          	cp	a,#5
4785  08ae 2407          	jruge	L1562
4787  08b0 c60001        	ld	a,_MD_Test_Pg
4788  08b3 a102          	cp	a,#2
4789  08b5 2722          	jreq	L7462
4790  08b7               L1562:
4792  08b7 7b01          	ld	a,(OFST-1,sp)
4793  08b9 a105          	cp	a,#5
4794  08bb 250d          	jrult	L7562
4796  08bd a109          	cp	a,#9
4797  08bf 2409          	jruge	L7562
4799  08c1 c60001        	ld	a,_MD_Test_Pg
4800  08c4 a103          	cp	a,#3
4801  08c6 2711          	jreq	L7462
4802  08c8 7b01          	ld	a,(OFST-1,sp)
4803  08ca               L7562:
4805  08ca a109          	cp	a,#9
4806  08cc 2524          	jrult	L3462
4808  08ce a10d          	cp	a,#13
4809  08d0 2420          	jruge	L3462
4811  08d2 c60001        	ld	a,_MD_Test_Pg
4812  08d5 a104          	cp	a,#4
4813  08d7 2619          	jrne	L3462
4814  08d9               L7462:
4815                     ; 488 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4817  08d9 7b01          	ld	a,(OFST-1,sp)
4818  08db 5f            	clrw	x
4819  08dc 97            	ld	xl,a
4820  08dd 5a            	decw	x
4821  08de a604          	ld	a,#4
4822  08e0 8d000000      	callf	d_smodx
4824  08e4 d60000        	ld	a,(_LCD_Line,x)
4825  08e7 8d000000      	callf	f_Set_LCD_Address
4827                     ; 489 					Display_LCD_String("Flt_HV_High ");
4829  08eb ae0280        	ldw	x,#L3662
4830  08ee 8d000000      	callf	f_Display_LCD_String
4832  08f2               L3462:
4833                     ; 493 			if(MD_ID306_Data[1] & 0x10){
4835  08f2 720900124c    	btjf	_MD_ID306_Data+1,#4,L5662
4836                     ; 494 				fault_cnt++;
4838  08f7 0c01          	inc	(OFST-1,sp)
4839                     ; 495 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4839                     ; 496 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4839                     ; 497 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4841  08f9 270d          	jreq	L3762
4843  08fb 7b01          	ld	a,(OFST-1,sp)
4844  08fd a105          	cp	a,#5
4845  08ff 2407          	jruge	L3762
4847  0901 c60001        	ld	a,_MD_Test_Pg
4848  0904 a102          	cp	a,#2
4849  0906 2722          	jreq	L1762
4850  0908               L3762:
4852  0908 7b01          	ld	a,(OFST-1,sp)
4853  090a a105          	cp	a,#5
4854  090c 250d          	jrult	L1072
4856  090e a109          	cp	a,#9
4857  0910 2409          	jruge	L1072
4859  0912 c60001        	ld	a,_MD_Test_Pg
4860  0915 a103          	cp	a,#3
4861  0917 2711          	jreq	L1762
4862  0919 7b01          	ld	a,(OFST-1,sp)
4863  091b               L1072:
4865  091b a109          	cp	a,#9
4866  091d 2524          	jrult	L5662
4868  091f a10d          	cp	a,#13
4869  0921 2420          	jruge	L5662
4871  0923 c60001        	ld	a,_MD_Test_Pg
4872  0926 a104          	cp	a,#4
4873  0928 2619          	jrne	L5662
4874  092a               L1762:
4875                     ; 498 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4877  092a 7b01          	ld	a,(OFST-1,sp)
4878  092c 5f            	clrw	x
4879  092d 97            	ld	xl,a
4880  092e 5a            	decw	x
4881  092f a604          	ld	a,#4
4882  0931 8d000000      	callf	d_smodx
4884  0935 d60000        	ld	a,(_LCD_Line,x)
4885  0938 8d000000      	callf	f_Set_LCD_Address
4887                     ; 499 					Display_LCD_String("Flt_Over_Cur ");
4889  093c ae0272        	ldw	x,#L5072
4890  093f 8d000000      	callf	f_Display_LCD_String
4892  0943               L5662:
4893                     ; 503 			if(MD_ID306_Data[1] & 0x80){
4895  0943 720f00124c    	btjf	_MD_ID306_Data+1,#7,L7072
4896                     ; 504 				fault_cnt++;
4898  0948 0c01          	inc	(OFST-1,sp)
4899                     ; 505 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4899                     ; 506 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4899                     ; 507 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4901  094a 270d          	jreq	L5172
4903  094c 7b01          	ld	a,(OFST-1,sp)
4904  094e a105          	cp	a,#5
4905  0950 2407          	jruge	L5172
4907  0952 c60001        	ld	a,_MD_Test_Pg
4908  0955 a102          	cp	a,#2
4909  0957 2722          	jreq	L3172
4910  0959               L5172:
4912  0959 7b01          	ld	a,(OFST-1,sp)
4913  095b a105          	cp	a,#5
4914  095d 250d          	jrult	L3272
4916  095f a109          	cp	a,#9
4917  0961 2409          	jruge	L3272
4919  0963 c60001        	ld	a,_MD_Test_Pg
4920  0966 a103          	cp	a,#3
4921  0968 2711          	jreq	L3172
4922  096a 7b01          	ld	a,(OFST-1,sp)
4923  096c               L3272:
4925  096c a109          	cp	a,#9
4926  096e 2524          	jrult	L7072
4928  0970 a10d          	cp	a,#13
4929  0972 2420          	jruge	L7072
4931  0974 c60001        	ld	a,_MD_Test_Pg
4932  0977 a104          	cp	a,#4
4933  0979 2619          	jrne	L7072
4934  097b               L3172:
4935                     ; 508 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4937  097b 7b01          	ld	a,(OFST-1,sp)
4938  097d 5f            	clrw	x
4939  097e 97            	ld	xl,a
4940  097f 5a            	decw	x
4941  0980 a604          	ld	a,#4
4942  0982 8d000000      	callf	d_smodx
4944  0986 d60000        	ld	a,(_LCD_Line,x)
4945  0989 8d000000      	callf	f_Set_LCD_Address
4947                     ; 509 					Display_LCD_String("Flt_Over_Core ");
4949  098d ae0263        	ldw	x,#L7272
4950  0990 8d000000      	callf	f_Display_LCD_String
4952  0994               L7072:
4953                     ; 513 			if(MD_ID306_Data[2] & 0x01){
4955  0994 720100134c    	btjf	_MD_ID306_Data+2,#0,L1372
4956                     ; 514 				fault_cnt++;
4958  0999 0c01          	inc	(OFST-1,sp)
4959                     ; 515 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
4959                     ; 516 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
4959                     ; 517 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
4961  099b 270d          	jreq	L7372
4963  099d 7b01          	ld	a,(OFST-1,sp)
4964  099f a105          	cp	a,#5
4965  09a1 2407          	jruge	L7372
4967  09a3 c60001        	ld	a,_MD_Test_Pg
4968  09a6 a102          	cp	a,#2
4969  09a8 2722          	jreq	L5372
4970  09aa               L7372:
4972  09aa 7b01          	ld	a,(OFST-1,sp)
4973  09ac a105          	cp	a,#5
4974  09ae 250d          	jrult	L5472
4976  09b0 a109          	cp	a,#9
4977  09b2 2409          	jruge	L5472
4979  09b4 c60001        	ld	a,_MD_Test_Pg
4980  09b7 a103          	cp	a,#3
4981  09b9 2711          	jreq	L5372
4982  09bb 7b01          	ld	a,(OFST-1,sp)
4983  09bd               L5472:
4985  09bd a109          	cp	a,#9
4986  09bf 2524          	jrult	L1372
4988  09c1 a10d          	cp	a,#13
4989  09c3 2420          	jruge	L1372
4991  09c5 c60001        	ld	a,_MD_Test_Pg
4992  09c8 a104          	cp	a,#4
4993  09ca 2619          	jrne	L1372
4994  09cc               L5372:
4995                     ; 518 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
4997  09cc 7b01          	ld	a,(OFST-1,sp)
4998  09ce 5f            	clrw	x
4999  09cf 97            	ld	xl,a
5000  09d0 5a            	decw	x
5001  09d1 a604          	ld	a,#4
5002  09d3 8d000000      	callf	d_smodx
5004  09d7 d60000        	ld	a,(_LCD_Line,x)
5005  09da 8d000000      	callf	f_Set_LCD_Address
5007                     ; 519 					Display_LCD_String("Flt_Over_Core ");
5009  09de ae0263        	ldw	x,#L7272
5010  09e1 8d000000      	callf	f_Display_LCD_String
5012  09e5               L1372:
5013                     ; 523 			if(MD_ID306_Data[3] & 0x02){
5015  09e5 720300144c    	btjf	_MD_ID306_Data+3,#1,L1572
5016                     ; 524 				fault_cnt++;
5018  09ea 0c01          	inc	(OFST-1,sp)
5019                     ; 525 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5019                     ; 526 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5019                     ; 527 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5021  09ec 270d          	jreq	L7572
5023  09ee 7b01          	ld	a,(OFST-1,sp)
5024  09f0 a105          	cp	a,#5
5025  09f2 2407          	jruge	L7572
5027  09f4 c60001        	ld	a,_MD_Test_Pg
5028  09f7 a102          	cp	a,#2
5029  09f9 2722          	jreq	L5572
5030  09fb               L7572:
5032  09fb 7b01          	ld	a,(OFST-1,sp)
5033  09fd a105          	cp	a,#5
5034  09ff 250d          	jrult	L5672
5036  0a01 a109          	cp	a,#9
5037  0a03 2409          	jruge	L5672
5039  0a05 c60001        	ld	a,_MD_Test_Pg
5040  0a08 a103          	cp	a,#3
5041  0a0a 2711          	jreq	L5572
5042  0a0c 7b01          	ld	a,(OFST-1,sp)
5043  0a0e               L5672:
5045  0a0e a109          	cp	a,#9
5046  0a10 2524          	jrult	L1572
5048  0a12 a10d          	cp	a,#13
5049  0a14 2420          	jruge	L1572
5051  0a16 c60001        	ld	a,_MD_Test_Pg
5052  0a19 a104          	cp	a,#4
5053  0a1b 2619          	jrne	L1572
5054  0a1d               L5572:
5055                     ; 528 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5057  0a1d 7b01          	ld	a,(OFST-1,sp)
5058  0a1f 5f            	clrw	x
5059  0a20 97            	ld	xl,a
5060  0a21 5a            	decw	x
5061  0a22 a604          	ld	a,#4
5062  0a24 8d000000      	callf	d_smodx
5064  0a28 d60000        	ld	a,(_LCD_Line,x)
5065  0a2b 8d000000      	callf	f_Set_LCD_Address
5067                     ; 529 					Display_LCD_String("Flt_Frame_TOUT ");
5069  0a2f ae0253        	ldw	x,#L1772
5070  0a32 8d000000      	callf	f_Display_LCD_String
5072  0a36               L1572:
5073                     ; 533 			if(MD_ID306_Data[4] & 0x01){
5075  0a36 720100154c    	btjf	_MD_ID306_Data+4,#0,L3772
5076                     ; 534 				fault_cnt++;
5078  0a3b 0c01          	inc	(OFST-1,sp)
5079                     ; 535 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5079                     ; 536 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5079                     ; 537 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5081  0a3d 270d          	jreq	L1003
5083  0a3f 7b01          	ld	a,(OFST-1,sp)
5084  0a41 a105          	cp	a,#5
5085  0a43 2407          	jruge	L1003
5087  0a45 c60001        	ld	a,_MD_Test_Pg
5088  0a48 a102          	cp	a,#2
5089  0a4a 2722          	jreq	L7772
5090  0a4c               L1003:
5092  0a4c 7b01          	ld	a,(OFST-1,sp)
5093  0a4e a105          	cp	a,#5
5094  0a50 250d          	jrult	L7003
5096  0a52 a109          	cp	a,#9
5097  0a54 2409          	jruge	L7003
5099  0a56 c60001        	ld	a,_MD_Test_Pg
5100  0a59 a103          	cp	a,#3
5101  0a5b 2711          	jreq	L7772
5102  0a5d 7b01          	ld	a,(OFST-1,sp)
5103  0a5f               L7003:
5105  0a5f a109          	cp	a,#9
5106  0a61 2524          	jrult	L3772
5108  0a63 a10d          	cp	a,#13
5109  0a65 2420          	jruge	L3772
5111  0a67 c60001        	ld	a,_MD_Test_Pg
5112  0a6a a104          	cp	a,#4
5113  0a6c 2619          	jrne	L3772
5114  0a6e               L7772:
5115                     ; 538 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5117  0a6e 7b01          	ld	a,(OFST-1,sp)
5118  0a70 5f            	clrw	x
5119  0a71 97            	ld	xl,a
5120  0a72 5a            	decw	x
5121  0a73 a604          	ld	a,#4
5122  0a75 8d000000      	callf	d_smodx
5124  0a79 d60000        	ld	a,(_LCD_Line,x)
5125  0a7c 8d000000      	callf	f_Set_LCD_Address
5127                     ; 539 					Display_LCD_String("Fail_HV_Sen ");
5129  0a80 ae0246        	ldw	x,#L3103
5130  0a83 8d000000      	callf	f_Display_LCD_String
5132  0a87               L3772:
5133                     ; 543 			if(MD_ID306_Data[4] & 0x02){
5135  0a87 720300154c    	btjf	_MD_ID306_Data+4,#1,L5103
5136                     ; 544 				fault_cnt++;
5138  0a8c 0c01          	inc	(OFST-1,sp)
5139                     ; 545 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5139                     ; 546 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5139                     ; 547 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5141  0a8e 270d          	jreq	L3203
5143  0a90 7b01          	ld	a,(OFST-1,sp)
5144  0a92 a105          	cp	a,#5
5145  0a94 2407          	jruge	L3203
5147  0a96 c60001        	ld	a,_MD_Test_Pg
5148  0a99 a102          	cp	a,#2
5149  0a9b 2722          	jreq	L1203
5150  0a9d               L3203:
5152  0a9d 7b01          	ld	a,(OFST-1,sp)
5153  0a9f a105          	cp	a,#5
5154  0aa1 250d          	jrult	L1303
5156  0aa3 a109          	cp	a,#9
5157  0aa5 2409          	jruge	L1303
5159  0aa7 c60001        	ld	a,_MD_Test_Pg
5160  0aaa a103          	cp	a,#3
5161  0aac 2711          	jreq	L1203
5162  0aae 7b01          	ld	a,(OFST-1,sp)
5163  0ab0               L1303:
5165  0ab0 a109          	cp	a,#9
5166  0ab2 2524          	jrult	L5103
5168  0ab4 a10d          	cp	a,#13
5169  0ab6 2420          	jruge	L5103
5171  0ab8 c60001        	ld	a,_MD_Test_Pg
5172  0abb a104          	cp	a,#4
5173  0abd 2619          	jrne	L5103
5174  0abf               L1203:
5175                     ; 548 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5177  0abf 7b01          	ld	a,(OFST-1,sp)
5178  0ac1 5f            	clrw	x
5179  0ac2 97            	ld	xl,a
5180  0ac3 5a            	decw	x
5181  0ac4 a604          	ld	a,#4
5182  0ac6 8d000000      	callf	d_smodx
5184  0aca d60000        	ld	a,(_LCD_Line,x)
5185  0acd 8d000000      	callf	f_Set_LCD_Address
5187                     ; 549 					Display_LCD_String("Fail_LV_Sen ");
5189  0ad1 ae0239        	ldw	x,#L5303
5190  0ad4 8d000000      	callf	f_Display_LCD_String
5192  0ad8               L5103:
5193                     ; 553 			if(MD_ID306_Data[4] & 0x04){
5195  0ad8 720500154c    	btjf	_MD_ID306_Data+4,#2,L7303
5196                     ; 554 				fault_cnt++;
5198  0add 0c01          	inc	(OFST-1,sp)
5199                     ; 555 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5199                     ; 556 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5199                     ; 557 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5201  0adf 270d          	jreq	L5403
5203  0ae1 7b01          	ld	a,(OFST-1,sp)
5204  0ae3 a105          	cp	a,#5
5205  0ae5 2407          	jruge	L5403
5207  0ae7 c60001        	ld	a,_MD_Test_Pg
5208  0aea a102          	cp	a,#2
5209  0aec 2722          	jreq	L3403
5210  0aee               L5403:
5212  0aee 7b01          	ld	a,(OFST-1,sp)
5213  0af0 a105          	cp	a,#5
5214  0af2 250d          	jrult	L3503
5216  0af4 a109          	cp	a,#9
5217  0af6 2409          	jruge	L3503
5219  0af8 c60001        	ld	a,_MD_Test_Pg
5220  0afb a103          	cp	a,#3
5221  0afd 2711          	jreq	L3403
5222  0aff 7b01          	ld	a,(OFST-1,sp)
5223  0b01               L3503:
5225  0b01 a109          	cp	a,#9
5226  0b03 2524          	jrult	L7303
5228  0b05 a10d          	cp	a,#13
5229  0b07 2420          	jruge	L7303
5231  0b09 c60001        	ld	a,_MD_Test_Pg
5232  0b0c a104          	cp	a,#4
5233  0b0e 2619          	jrne	L7303
5234  0b10               L3403:
5235                     ; 558 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5237  0b10 7b01          	ld	a,(OFST-1,sp)
5238  0b12 5f            	clrw	x
5239  0b13 97            	ld	xl,a
5240  0b14 5a            	decw	x
5241  0b15 a604          	ld	a,#4
5242  0b17 8d000000      	callf	d_smodx
5244  0b1b d60000        	ld	a,(_LCD_Line,x)
5245  0b1e 8d000000      	callf	f_Set_LCD_Address
5247                     ; 559 					Display_LCD_String("Fail_Cur_Sen ");
5249  0b22 ae022b        	ldw	x,#L7503
5250  0b25 8d000000      	callf	f_Display_LCD_String
5252  0b29               L7303:
5253                     ; 563 			if(MD_ID306_Data[4] & 0x20){
5255  0b29 720b00154c    	btjf	_MD_ID306_Data+4,#5,L1603
5256                     ; 564 				fault_cnt++;
5258  0b2e 0c01          	inc	(OFST-1,sp)
5259                     ; 565 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5259                     ; 566 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5259                     ; 567 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5261  0b30 270d          	jreq	L7603
5263  0b32 7b01          	ld	a,(OFST-1,sp)
5264  0b34 a105          	cp	a,#5
5265  0b36 2407          	jruge	L7603
5267  0b38 c60001        	ld	a,_MD_Test_Pg
5268  0b3b a102          	cp	a,#2
5269  0b3d 2722          	jreq	L5603
5270  0b3f               L7603:
5272  0b3f 7b01          	ld	a,(OFST-1,sp)
5273  0b41 a105          	cp	a,#5
5274  0b43 250d          	jrult	L5703
5276  0b45 a109          	cp	a,#9
5277  0b47 2409          	jruge	L5703
5279  0b49 c60001        	ld	a,_MD_Test_Pg
5280  0b4c a103          	cp	a,#3
5281  0b4e 2711          	jreq	L5603
5282  0b50 7b01          	ld	a,(OFST-1,sp)
5283  0b52               L5703:
5285  0b52 a109          	cp	a,#9
5286  0b54 2524          	jrult	L1603
5288  0b56 a10d          	cp	a,#13
5289  0b58 2420          	jruge	L1603
5291  0b5a c60001        	ld	a,_MD_Test_Pg
5292  0b5d a104          	cp	a,#4
5293  0b5f 2619          	jrne	L1603
5294  0b61               L5603:
5295                     ; 568 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5297  0b61 7b01          	ld	a,(OFST-1,sp)
5298  0b63 5f            	clrw	x
5299  0b64 97            	ld	xl,a
5300  0b65 5a            	decw	x
5301  0b66 a604          	ld	a,#4
5302  0b68 8d000000      	callf	d_smodx
5304  0b6c d60000        	ld	a,(_LCD_Line,x)
5305  0b6f 8d000000      	callf	f_Set_LCD_Address
5307                     ; 569 					Display_LCD_String("Fail_LeftC_Sen ");
5309  0b73 ae021b        	ldw	x,#L1013
5310  0b76 8d000000      	callf	f_Display_LCD_String
5312  0b7a               L1603:
5313                     ; 573 			if(MD_ID306_Data[4] & 0x40){
5315  0b7a 720d00154c    	btjf	_MD_ID306_Data+4,#6,L3013
5316                     ; 574 				fault_cnt++;
5318  0b7f 0c01          	inc	(OFST-1,sp)
5319                     ; 575 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5319                     ; 576 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5319                     ; 577 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5321  0b81 270d          	jreq	L1113
5323  0b83 7b01          	ld	a,(OFST-1,sp)
5324  0b85 a105          	cp	a,#5
5325  0b87 2407          	jruge	L1113
5327  0b89 c60001        	ld	a,_MD_Test_Pg
5328  0b8c a102          	cp	a,#2
5329  0b8e 2722          	jreq	L7013
5330  0b90               L1113:
5332  0b90 7b01          	ld	a,(OFST-1,sp)
5333  0b92 a105          	cp	a,#5
5334  0b94 250d          	jrult	L7113
5336  0b96 a109          	cp	a,#9
5337  0b98 2409          	jruge	L7113
5339  0b9a c60001        	ld	a,_MD_Test_Pg
5340  0b9d a103          	cp	a,#3
5341  0b9f 2711          	jreq	L7013
5342  0ba1 7b01          	ld	a,(OFST-1,sp)
5343  0ba3               L7113:
5345  0ba3 a109          	cp	a,#9
5346  0ba5 2524          	jrult	L3013
5348  0ba7 a10d          	cp	a,#13
5349  0ba9 2420          	jruge	L3013
5351  0bab c60001        	ld	a,_MD_Test_Pg
5352  0bae a104          	cp	a,#4
5353  0bb0 2619          	jrne	L3013
5354  0bb2               L7013:
5355                     ; 578 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5357  0bb2 7b01          	ld	a,(OFST-1,sp)
5358  0bb4 5f            	clrw	x
5359  0bb5 97            	ld	xl,a
5360  0bb6 5a            	decw	x
5361  0bb7 a604          	ld	a,#4
5362  0bb9 8d000000      	callf	d_smodx
5364  0bbd d60000        	ld	a,(_LCD_Line,x)
5365  0bc0 8d000000      	callf	f_Set_LCD_Address
5367                     ; 579 					Display_LCD_String("Fail_RightC_Sen ");
5369  0bc4 ae020a        	ldw	x,#L3213
5370  0bc7 8d000000      	callf	f_Display_LCD_String
5372  0bcb               L3013:
5373                     ; 583 			if(MD_ID306_Data[4] & 0x80){
5375  0bcb 720f00154c    	btjf	_MD_ID306_Data+4,#7,L5213
5376                     ; 584 				fault_cnt++;
5378  0bd0 0c01          	inc	(OFST-1,sp)
5379                     ; 585 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5379                     ; 586 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5379                     ; 587 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5381  0bd2 270d          	jreq	L3313
5383  0bd4 7b01          	ld	a,(OFST-1,sp)
5384  0bd6 a105          	cp	a,#5
5385  0bd8 2407          	jruge	L3313
5387  0bda c60001        	ld	a,_MD_Test_Pg
5388  0bdd a102          	cp	a,#2
5389  0bdf 2722          	jreq	L1313
5390  0be1               L3313:
5392  0be1 7b01          	ld	a,(OFST-1,sp)
5393  0be3 a105          	cp	a,#5
5394  0be5 250d          	jrult	L1413
5396  0be7 a109          	cp	a,#9
5397  0be9 2409          	jruge	L1413
5399  0beb c60001        	ld	a,_MD_Test_Pg
5400  0bee a103          	cp	a,#3
5401  0bf0 2711          	jreq	L1313
5402  0bf2 7b01          	ld	a,(OFST-1,sp)
5403  0bf4               L1413:
5405  0bf4 a109          	cp	a,#9
5406  0bf6 2524          	jrult	L5213
5408  0bf8 a10d          	cp	a,#13
5409  0bfa 2420          	jruge	L5213
5411  0bfc c60001        	ld	a,_MD_Test_Pg
5412  0bff a104          	cp	a,#4
5413  0c01 2619          	jrne	L5213
5414  0c03               L1313:
5415                     ; 588 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5417  0c03 7b01          	ld	a,(OFST-1,sp)
5418  0c05 5f            	clrw	x
5419  0c06 97            	ld	xl,a
5420  0c07 5a            	decw	x
5421  0c08 a604          	ld	a,#4
5422  0c0a 8d000000      	callf	d_smodx
5424  0c0e d60000        	ld	a,(_LCD_Line,x)
5425  0c11 8d000000      	callf	f_Set_LCD_Address
5427                     ; 589 					Display_LCD_String("Fail_PCB1_Sen ");
5429  0c15 ae01fb        	ldw	x,#L5413
5430  0c18 8d000000      	callf	f_Display_LCD_String
5432  0c1c               L5213:
5433                     ; 593 			if(MD_ID306_Data[4] & 0x80){
5435  0c1c 720f00154c    	btjf	_MD_ID306_Data+4,#7,L7413
5436                     ; 594 				fault_cnt++;
5438  0c21 0c01          	inc	(OFST-1,sp)
5439                     ; 595 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
5439                     ; 596 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
5439                     ; 597 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
5441  0c23 270d          	jreq	L5513
5443  0c25 7b01          	ld	a,(OFST-1,sp)
5444  0c27 a105          	cp	a,#5
5445  0c29 2407          	jruge	L5513
5447  0c2b c60001        	ld	a,_MD_Test_Pg
5448  0c2e a102          	cp	a,#2
5449  0c30 2722          	jreq	L3513
5450  0c32               L5513:
5452  0c32 7b01          	ld	a,(OFST-1,sp)
5453  0c34 a105          	cp	a,#5
5454  0c36 250d          	jrult	L3613
5456  0c38 a109          	cp	a,#9
5457  0c3a 2409          	jruge	L3613
5459  0c3c c60001        	ld	a,_MD_Test_Pg
5460  0c3f a103          	cp	a,#3
5461  0c41 2711          	jreq	L3513
5462  0c43 7b01          	ld	a,(OFST-1,sp)
5463  0c45               L3613:
5465  0c45 a109          	cp	a,#9
5466  0c47 2524          	jrult	L7413
5468  0c49 a10d          	cp	a,#13
5469  0c4b 2420          	jruge	L7413
5471  0c4d c60001        	ld	a,_MD_Test_Pg
5472  0c50 a104          	cp	a,#4
5473  0c52 2619          	jrne	L7413
5474  0c54               L3513:
5475                     ; 598 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
5477  0c54 7b01          	ld	a,(OFST-1,sp)
5478  0c56 5f            	clrw	x
5479  0c57 97            	ld	xl,a
5480  0c58 5a            	decw	x
5481  0c59 a604          	ld	a,#4
5482  0c5b 8d000000      	callf	d_smodx
5484  0c5f d60000        	ld	a,(_LCD_Line,x)
5485  0c62 8d000000      	callf	f_Set_LCD_Address
5487                     ; 599 					Display_LCD_String("Fail_PCB1_Sen ");
5489  0c66 ae01fb        	ldw	x,#L5413
5490  0c69 8d000000      	callf	f_Display_LCD_String
5492  0c6d               L7413:
5493                     ; 603 			if(!fault_cnt){
5495  0c6d 7b01          	ld	a,(OFST-1,sp)
5496  0c6f 260e          	jrne	L3532
5497                     ; 604 				Set_LCD_Address(LCD_Line[0]);
5499  0c71 c60000        	ld	a,_LCD_Line
5500  0c74 8d000000      	callf	f_Set_LCD_Address
5502                     ; 605 				Display_LCD_String("NON");
5504  0c78 ae01f7        	ldw	x,#L1713
5505  0c7b 8d000000      	callf	f_Display_LCD_String
5507  0c7f               L3532:
5508                     ; 611 	if(MD_Trans_flag == ON){
5510  0c7f a60f          	ld	a,#15
5511  0c81 7205000614    	btjf	_MD_Test_Register,#2,L3713
5512                     ; 612 		Set_LCD_Address((unsigned char)(0x00+15));
5514  0c86 8d000000      	callf	f_Set_LCD_Address
5516                     ; 613 		if(Blink_30){Display_LCD_String("C");}
5518  0c8a 725d0000      	tnz	_Blink_30
5519  0c8e 2705          	jreq	L5713
5522  0c90 ae01f5        	ldw	x,#L7713
5525  0c93 200c          	jra	L3023
5526  0c95               L5713:
5527                     ; 614 		else{Display_LCD_String(" ");}
5529  0c95 ae02f2        	ldw	x,#L1622
5531  0c98 2007          	jra	L3023
5532  0c9a               L3713:
5533                     ; 617 		Set_LCD_Address((unsigned char)(0x00+15));
5535  0c9a 8d000000      	callf	f_Set_LCD_Address
5537                     ; 618 		Display_LCD_String("N");
5539  0c9e ae01f3        	ldw	x,#L5023
5541  0ca1               L3023:
5542  0ca1 8d000000      	callf	f_Display_LCD_String
5543                     ; 621 	return;
5546  0ca5 85            	popw	x
5547  0ca6 87            	retf	
5578                     ; 625 void MedelS_V56_Switch_Control(void)
5578                     ; 626 {
5579                     	switch	.text
5580  0ca7               f_MedelS_V56_Switch_Control:
5584                     ; 627 	if(UP_SW_flag == ON){
5586  0ca7 7203000051    	btjf	_SW_Status,#1,L7123
5587                     ; 629 		if(MD_Data_Setting_flag == ON){	ModelS_V56_Value_Change(1);}
5589  0cac 7203000608    	btjf	_MD_Test_Register,#1,L1223
5592  0cb1 a601          	ld	a,#1
5593  0cb3 8d300230      	callf	f_ModelS_V56_Value_Change
5596  0cb7 203e          	jra	L3223
5597  0cb9               L1223:
5598                     ; 630 		else if(MD_Data_Select_flag == ON){
5600  0cb9 720100061a    	btjf	_MD_Test_Register,#0,L5223
5601                     ; 631 			if(MD_Option_flag){if(MD_Data_Step > 1){ MD_Data_Step--;}}
5603  0cbe 7207000609    	btjf	_MD_Test_Register,#3,L7223
5606  0cc3 c60000        	ld	a,_MD_Data_Step
5607  0cc6 a102          	cp	a,#2
5608  0cc8 252d          	jrult	L3223
5610  0cca 2006          	jpf	LC024
5611  0ccc               L7223:
5612                     ; 632 			else{ if(MD_Data_Step > 0){ MD_Data_Step--;}	}
5614  0ccc 725d0000      	tnz	_MD_Data_Step
5615  0cd0 2725          	jreq	L3223
5618  0cd2               LC024:
5620  0cd2 725a0000      	dec	_MD_Data_Step
5621  0cd6 201f          	jra	L3223
5622  0cd8               L5223:
5623                     ; 634 			if(!MD_Option_flag){
5625  0cd8 720600061a    	btjt	_MD_Test_Register,#3,L3223
5626                     ; 635 				if(MD_Test_Pg > 0){ MD_Test_Pg--;}
5628  0cdd 725d0001      	tnz	_MD_Test_Pg
5629  0ce1 2706          	jreq	L3423
5632  0ce3 725a0001      	dec	_MD_Test_Pg
5634  0ce7 2004          	jra	L5423
5635  0ce9               L3423:
5636                     ; 636 				else{MD_Test_Pg = 4;}
5638  0ce9 35040001      	mov	_MD_Test_Pg,#4
5639  0ced               L5423:
5640                     ; 637 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
5642  0ced 725d0001      	tnz	_MD_Test_Pg
5643  0cf1 2604          	jrne	L3223
5646  0cf3 725f0000      	clr	_MD_Data_Step
5647  0cf7               L3223:
5648                     ; 640 		UP_SW_flag = OFF;
5650  0cf7 72130000      	bres	_SW_Status,#1
5652  0cfb 2054          	jra	L1523
5653  0cfd               L7123:
5654                     ; 643 	else if(DN_SW_flag == ON){ 
5656  0cfd 720500004f    	btjf	_SW_Status,#2,L1523
5657                     ; 646 		if(MD_Data_Setting_flag == ON){	ModelS_V56_Value_Change(0);}
5659  0d02 7203000607    	btjf	_MD_Test_Register,#1,L5523
5662  0d07 4f            	clr	a
5663  0d08 8d300230      	callf	f_ModelS_V56_Value_Change
5666  0d0c 203f          	jra	L7523
5667  0d0e               L5523:
5668                     ; 648 		else if(MD_Data_Select_flag == ON){
5670  0d0e 720100061a    	btjf	_MD_Test_Register,#0,L1623
5671                     ; 649 			if(MD_Option_flag){
5673  0d13 7207000609    	btjf	_MD_Test_Register,#3,L3623
5674                     ; 650 				if(MD_Data_Step < 3){ MD_Data_Step++;}
5676  0d18 c60000        	ld	a,_MD_Data_Step
5677  0d1b a103          	cp	a,#3
5678  0d1d 242e          	jruge	L7523
5680  0d1f 2006          	jpf	LC025
5681  0d21               L3623:
5682                     ; 651 			}else{ if(MD_Data_Step < 1){ MD_Data_Step++;}}
5684  0d21 725d0000      	tnz	_MD_Data_Step
5685  0d25 2626          	jrne	L7523
5688  0d27               LC025:
5690  0d27 725c0000      	inc	_MD_Data_Step
5691  0d2b 2020          	jra	L7523
5692  0d2d               L1623:
5693                     ; 654 			if(!MD_Option_flag){
5695  0d2d 720600061b    	btjt	_MD_Test_Register,#3,L7523
5696                     ; 655 				if(MD_Test_Pg < 4 ){
5698  0d32 c60001        	ld	a,_MD_Test_Pg
5699  0d35 a104          	cp	a,#4
5700  0d37 2406          	jruge	L7723
5701                     ; 656 					MD_Test_Pg++;
5703  0d39 725c0001      	inc	_MD_Test_Pg
5705  0d3d 2004          	jra	L1033
5706  0d3f               L7723:
5707                     ; 657 				}else{MD_Test_Pg = 0;}
5709  0d3f 725f0001      	clr	_MD_Test_Pg
5710  0d43               L1033:
5711                     ; 658 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
5713  0d43 725d0001      	tnz	_MD_Test_Pg
5714  0d47 2604          	jrne	L7523
5717  0d49 725f0000      	clr	_MD_Data_Step
5718  0d4d               L7523:
5719                     ; 661 		DN_SW_flag = OFF;
5721  0d4d 72150000      	bres	_SW_Status,#2
5722  0d51               L1523:
5723                     ; 666 	if(SET_SW_flag == ON){
5725  0d51 720700002f    	btjf	_SW_Status,#3,L5033
5726                     ; 667 		if((MD_Test_Pg==0)||(MD_Test_Pg==10)){
5728  0d56 725d0001      	tnz	_MD_Test_Pg
5729  0d5a 2707          	jreq	L1133
5731  0d5c c60001        	ld	a,_MD_Test_Pg
5732  0d5f a10a          	cp	a,#10
5733  0d61 2622          	jrne	L5033
5734  0d63               L1133:
5735                     ; 669 			if(MD_Data_Select_flag == OFF){MD_Data_Select_flag= ON;}
5737  0d63 7200000606    	btjt	_MD_Test_Register,#0,L3133
5740  0d68 72100006      	bset	_MD_Test_Register,#0
5742  0d6c 2013          	jra	L5133
5743  0d6e               L3133:
5744                     ; 671 				if(MD_Data_Setting_flag == OFF){
5746  0d6e 7202000606    	btjt	_MD_Test_Register,#1,L7133
5747                     ; 672 					MD_Data_Setting_flag = ON;
5749  0d73 72120006      	bset	_MD_Test_Register,#1
5751  0d77 2008          	jra	L5133
5752  0d79               L7133:
5753                     ; 674 					MD_Data_Setting_flag = OFF;
5755  0d79 72130006      	bres	_MD_Test_Register,#1
5756                     ; 675 					MD_Data_Select_flag = OFF;
5758  0d7d 72110006      	bres	_MD_Test_Register,#0
5759  0d81               L5133:
5760                     ; 678 			SET_SW_flag = OFF;
5762  0d81 72170000      	bres	_SW_Status,#3
5763  0d85               L5033:
5764                     ; 682 	if(ON_OFF_SW_flag == ON){
5766  0d85 7201000013    	btjf	_SW_Status,#0,L3233
5767                     ; 683 		if(MD_Trans_flag == OFF){MD_Trans_flag = ON;}
5769  0d8a 7204000606    	btjt	_MD_Test_Register,#2,L5233
5772  0d8f 72140006      	bset	_MD_Test_Register,#2
5774  0d93 2004          	jra	L7233
5775  0d95               L5233:
5776                     ; 684 		else{ MD_Trans_flag = OFF;  }
5778  0d95 72150006      	bres	_MD_Test_Register,#2
5779  0d99               L7233:
5780                     ; 686 		ON_OFF_SW_flag = OFF;
5782  0d99 72110000      	bres	_SW_Status,#0
5783  0d9d               L3233:
5784                     ; 689 	if(OP_SW_flag == ON){
5786  0d9d 720900002b    	btjf	_SW_Status,#4,L1333
5787                     ; 690 		if(MD_Option_flag == OFF){
5789  0da2 720600060e    	btjt	_MD_Test_Register,#3,L3333
5790                     ; 691 			MD_Option_flag = ON;
5792  0da7 72160006      	bset	_MD_Test_Register,#3
5793                     ; 692 			MD_Test_Pg = 10;
5795  0dab 350a0001      	mov	_MD_Test_Pg,#10
5796                     ; 693 			MD_Data_Step = 1;
5798  0daf 35010000      	mov	_MD_Data_Step,#1
5800  0db3 2014          	jra	L5333
5801  0db5               L3333:
5802                     ; 696 			MD_Option_flag = OFF;
5804  0db5 72170006      	bres	_MD_Test_Register,#3
5805                     ; 697 			MD_Data_Select_flag = OFF;
5807  0db9 72110006      	bres	_MD_Test_Register,#0
5808                     ; 698 			MD_Data_Setting_flag = OFF;
5810  0dbd 72130006      	bres	_MD_Test_Register,#1
5811                     ; 700 			MD_Test_Pg = 0;
5813  0dc1 725f0001      	clr	_MD_Test_Pg
5814                     ; 701 			MD_Data_Step = 0;
5816  0dc5 725f0000      	clr	_MD_Data_Step
5817  0dc9               L5333:
5818                     ; 704 		OP_SW_flag = OFF;
5820  0dc9 72190000      	bres	_SW_Status,#4
5821  0dcd               L1333:
5822                     ; 707 	if(EN_SW_flag == ON){
5824  0dcd 720b000020    	btjf	_SW_Status,#5,L7333
5825                     ; 708 		MD_Data_Select_flag = OFF;
5827  0dd2 72110006      	bres	_MD_Test_Register,#0
5828                     ; 709 		MD_Data_Setting_flag = OFF;	
5830  0dd6 72130006      	bres	_MD_Test_Register,#1
5831                     ; 710 		Device_Select_Mode = ON;
5833  0dda 72100000      	bset	_Mode_Select_Status,#0
5834                     ; 711 		MD_Option_flag = OFF;
5836  0dde 72170006      	bres	_MD_Test_Register,#3
5837                     ; 712 		MD_Trans_flag = OFF;
5839  0de2 72150006      	bres	_MD_Test_Register,#2
5840                     ; 714 		Can_Select_Device = 0;
5842  0de6 725f0000      	clr	_Can_Select_Device
5843                     ; 715 		ModelS_Reset();
5845  0dea 8d000000      	callf	f_ModelS_Reset
5847                     ; 716 		EN_SW_flag = OFF;
5849  0dee 721b0000      	bres	_SW_Status,#5
5850  0df2               L7333:
5851                     ; 719 	return;
5854  0df2 87            	retf	
5894                     ; 723 void ModelS_V58_Value_Change(unsigned char ST)
5894                     ; 724 {
5895                     	switch	.text
5896  0df3               f_ModelS_V58_Value_Change:
5898  0df3 88            	push	a
5899       00000000      OFST:	set	0
5902                     ; 726 	if(ST == 1){
5904  0df4 4a            	dec	a
5905  0df5 2704ac9c0e9c  	jrne	L5533
5906                     ; 728 		if(MD_Option_flag){
5908  0dfb 720700066f    	btjf	_MD_Test_Register,#3,L7533
5909                     ; 729 			if(MD_Data_Step == 0){
5911  0e00 725d0000      	tnz	_MD_Data_Step
5912  0e04 2616          	jrne	L1633
5913                     ; 730 				if(MD_Vehicle_Logic == 1){MD_Vehicle_Logic = 2;}
5915  0e06 c60008        	ld	a,_MD_Vehicle_Logic
5916  0e09 4a            	dec	a
5917  0e0a 2608          	jrne	L3633
5920  0e0c 35020008      	mov	_MD_Vehicle_Logic,#2
5922  0e10 ac310f31      	jra	L3243
5923  0e14               L3633:
5924                     ; 731 				else{MD_Vehicle_Logic = 1;}
5926  0e14 35010008      	mov	_MD_Vehicle_Logic,#1
5927  0e18 ac310f31      	jra	L3243
5928  0e1c               L1633:
5929                     ; 733 			else if(MD_Data_Step == 1){if(MD_Unit<200){MD_Unit++;}}
5931  0e1c c60000        	ld	a,_MD_Data_Step
5932  0e1f 4a            	dec	a
5933  0e20 260f          	jrne	L1733
5936  0e22 c60007        	ld	a,_MD_Unit
5937  0e25 a1c8          	cp	a,#200
5938  0e27 24ef          	jruge	L3243
5941  0e29 725c0007      	inc	_MD_Unit
5942  0e2d ac310f31      	jra	L3243
5943  0e31               L1733:
5944                     ; 734 			else if(MD_Data_Step == 2){if(MD_T_Unit<1800){MD_T_Unit +=10;}}
5946  0e31 c60000        	ld	a,_MD_Data_Step
5947  0e34 a102          	cp	a,#2
5948  0e36 261d          	jrne	L7733
5951  0e38 ae0003        	ldw	x,#_MD_T_Unit
5952  0e3b 8d000000      	callf	d_ltor
5954  0e3f ae0000        	ldw	x,#L232
5955  0e42 8d000000      	callf	d_lcmp
5957  0e46 24e5          	jruge	L3243
5960  0e48 ae0003        	ldw	x,#_MD_T_Unit
5961  0e4b a60a          	ld	a,#10
5962  0e4d 8d000000      	callf	d_lgadc
5964  0e51 ac310f31      	jra	L3243
5965  0e55               L7733:
5966                     ; 735 			else if(MD_Data_Step == 3){ if(MD_T_UpDn<3){MD_T_UpDn++;}}
5968  0e55 c60000        	ld	a,_MD_Data_Step
5969  0e58 a103          	cp	a,#3
5970  0e5a 26f5          	jrne	L3243
5973  0e5c ce0004        	ldw	x,_MD_T_UpDn
5974  0e5f a30003        	cpw	x,#3
5975  0e62 24ed          	jruge	L3243
5978  0e64 ce0004        	ldw	x,_MD_T_UpDn
5979  0e67 5c            	incw	x
5980  0e68 cf0004        	ldw	_MD_T_UpDn,x
5981  0e6b ac310f31      	jra	L3243
5982  0e6f               L7533:
5983                     ; 739 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
5985  0e6f 725d0000      	tnz	_MD_Data_Step
5986  0e73 260c          	jrne	L3143
5989  0e75 c60000        	ld	a,_PTC_AllowOperation
5990  0e78 a801          	xor	a,#1
5991  0e7a c70000        	ld	_PTC_AllowOperation,a
5993  0e7d ac310f31      	jra	L3243
5994  0e81               L3143:
5995                     ; 740 			else if(MD_Data_Step == 1){
5997  0e81 c60000        	ld	a,_MD_Data_Step
5998  0e84 4a            	dec	a
5999  0e85 26f6          	jrne	L3243
6000                     ; 741 				PTC_Heat_Duty += MD_Unit;
6002  0e87 c60000        	ld	a,_PTC_Heat_Duty
6003  0e8a cb0007        	add	a,_MD_Unit
6004  0e8d c70000        	ld	_PTC_Heat_Duty,a
6005                     ; 742 				if( PTC_Heat_Duty > 200){PTC_Heat_Duty = 200;}
6007  0e90 a1c9          	cp	a,#201
6008  0e92 25e9          	jrult	L3243
6011  0e94 35c80000      	mov	_PTC_Heat_Duty,#200
6012  0e98 ac310f31      	jra	L3243
6013  0e9c               L5533:
6014                     ; 747 	else if(ST == 0){
6016  0e9c 7b01          	ld	a,(OFST+1,sp)
6017  0e9e 26f8          	jrne	L3243
6018                     ; 748 		if(MD_Option_flag){
6020  0ea0 7207000662    	btjf	_MD_Test_Register,#3,L7243
6021                     ; 749 			if(MD_Data_Step == 0){
6023  0ea5 725d0000      	tnz	_MD_Data_Step
6024  0ea9 2612          	jrne	L1343
6025                     ; 750 				if(MD_Vehicle_Logic == 1){MD_Vehicle_Logic = 2;}
6027  0eab c60008        	ld	a,_MD_Vehicle_Logic
6028  0eae 4a            	dec	a
6029  0eaf 2606          	jrne	L3343
6032  0eb1 35020008      	mov	_MD_Vehicle_Logic,#2
6034  0eb5 207a          	jra	L3243
6035  0eb7               L3343:
6036                     ; 751 				else{MD_Vehicle_Logic = 1;}
6038  0eb7 35010008      	mov	_MD_Vehicle_Logic,#1
6039  0ebb 2074          	jra	L3243
6040  0ebd               L1343:
6041                     ; 753 			else if(MD_Data_Step == 1){if(MD_Unit>1){MD_Unit--;}  }
6043  0ebd c60000        	ld	a,_MD_Data_Step
6044  0ec0 4a            	dec	a
6045  0ec1 260d          	jrne	L1443
6048  0ec3 c60007        	ld	a,_MD_Unit
6049  0ec6 a102          	cp	a,#2
6050  0ec8 2567          	jrult	L3243
6053  0eca 725a0007      	dec	_MD_Unit
6054  0ece 2061          	jra	L3243
6055  0ed0               L1443:
6056                     ; 754 			else if(MD_Data_Step == 2){if(MD_T_Unit>10){MD_T_Unit -=10;}}
6058  0ed0 c60000        	ld	a,_MD_Data_Step
6059  0ed3 a102          	cp	a,#2
6060  0ed5 261b          	jrne	L7443
6063  0ed7 ae0003        	ldw	x,#_MD_T_Unit
6064  0eda 8d000000      	callf	d_ltor
6066  0ede ae0004        	ldw	x,#L432
6067  0ee1 8d000000      	callf	d_lcmp
6069  0ee5 254a          	jrult	L3243
6072  0ee7 ae0003        	ldw	x,#_MD_T_Unit
6073  0eea a60a          	ld	a,#10
6074  0eec 8d000000      	callf	d_lgsbc
6076  0ef0 203f          	jra	L3243
6077  0ef2               L7443:
6078                     ; 755 			else if(MD_Data_Step == 3){if(MD_T_UpDn>0){MD_T_UpDn--;}}
6080  0ef2 c60000        	ld	a,_MD_Data_Step
6081  0ef5 a103          	cp	a,#3
6082  0ef7 2638          	jrne	L3243
6085  0ef9 ce0004        	ldw	x,_MD_T_UpDn
6086  0efc 2733          	jreq	L3243
6089  0efe ce0004        	ldw	x,_MD_T_UpDn
6090  0f01 5a            	decw	x
6091  0f02 cf0004        	ldw	_MD_T_UpDn,x
6092  0f05 202a          	jra	L3243
6093  0f07               L7243:
6094                     ; 758 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
6096  0f07 725d0000      	tnz	_MD_Data_Step
6097  0f0b 260a          	jrne	L3643
6100  0f0d c60000        	ld	a,_PTC_AllowOperation
6101  0f10 a801          	xor	a,#1
6102  0f12 c70000        	ld	_PTC_AllowOperation,a
6104  0f15 201a          	jra	L3243
6105  0f17               L3643:
6106                     ; 759 			else if(MD_Data_Step == 1){
6108  0f17 c60000        	ld	a,_MD_Data_Step
6109  0f1a 4a            	dec	a
6110  0f1b 2614          	jrne	L3243
6111                     ; 760 				if(PTC_Heat_Duty <MD_Unit){PTC_Heat_Duty = 0;}
6113  0f1d c60000        	ld	a,_PTC_Heat_Duty
6114  0f20 c10007        	cp	a,_MD_Unit
6115  0f23 2406          	jruge	L1743
6118  0f25 725f0000      	clr	_PTC_Heat_Duty
6120  0f29 2006          	jra	L3243
6121  0f2b               L1743:
6122                     ; 761 				else{PTC_Heat_Duty -= MD_Unit;}
6124  0f2b c00007        	sub	a,_MD_Unit
6125  0f2e c70000        	ld	_PTC_Heat_Duty,a
6126  0f31               L3243:
6127                     ; 767 	return;
6130  0f31 84            	pop	a
6131  0f32 87            	retf	
6191                     ; 771 void ModelS_V58_LCD_Display(void)
6191                     ; 772 {
6192                     	switch	.text
6193  0f33               f_ModelS_V58_LCD_Display:
6195  0f33 89            	pushw	x
6196       00000002      OFST:	set	2
6199                     ; 774 	unsigned char fault_cnt=0;
6201  0f34 0f02          	clr	(OFST+0,sp)
6202                     ; 777 	if(MD_Test_Pg != MD_Pre_Pg){ ModelS_Display_Handling();} 
6204  0f36 c60001        	ld	a,_MD_Test_Pg
6205  0f39 c10002        	cp	a,_MD_Pre_Pg
6206  0f3c 2704          	jreq	L3153
6209  0f3e 8d730073      	callf	f_ModelS_Display_Handling
6211  0f42               L3153:
6212                     ; 778 	MD_Pre_Pg = MD_Test_Pg;
6214  0f42 5500010002    	mov	_MD_Pre_Pg,_MD_Test_Pg
6215                     ; 781 	if(MD_Test_Pg == 0){			//page 1
6217  0f47 725d0001      	tnz	_MD_Test_Pg
6218  0f4b 2704ac4b114b  	jrne	L5153
6219                     ; 782 		for(i=0; i<4; i++){
6221  0f51 4f            	clr	a
6222  0f52 6b01          	ld	(OFST-1,sp),a
6223  0f54               L7153:
6224                     ; 783 			Set_LCD_Address(LCD_Line[i]);
6226  0f54 5f            	clrw	x
6227  0f55 97            	ld	xl,a
6228  0f56 d60000        	ld	a,(_LCD_Line,x)
6229  0f59 8d000000      	callf	f_Set_LCD_Address
6231                     ; 785 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
6233  0f5d 720100063a    	btjf	_MD_Test_Register,#0,L5253
6235  0f62 7202000635    	btjt	_MD_Test_Register,#1,L5253
6237  0f67 7b01          	ld	a,(OFST-1,sp)
6238  0f69 c10000        	cp	a,_MD_Data_Step
6239  0f6c 262e          	jrne	L5253
6240                     ; 786 				if(Blink_50){
6242  0f6e 725d0000      	tnz	_Blink_50
6243  0f72 272a          	jreq	LC027
6244                     ; 787 					if(i == 0){
6246  0f74 7b01          	ld	a,(OFST-1,sp)
6247  0f76 2610          	jrne	L1353
6248                     ; 788 						Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6250  0f78 5f            	clrw	x
6251  0f79 97            	ld	xl,a
6252  0f7a d60000        	ld	a,(_LCD_Line,x)
6253  0f7d ab08          	add	a,#8
6254  0f7f 8d000000      	callf	f_Set_LCD_Address
6256                     ; 789 						Display_LCD_String("P:");			
6258  0f83 ae01f0        	ldw	x,#L3353
6261  0f86 201d          	jpf	LC026
6262  0f88               L1353:
6263                     ; 791 					else if(i == 1){ 
6265  0f88 a101          	cp	a,#1
6266  0f8a 261d          	jrne	L3453
6267                     ; 792 						Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6269  0f8c 5f            	clrw	x
6270  0f8d 97            	ld	xl,a
6271  0f8e d60000        	ld	a,(_LCD_Line,x)
6272  0f91 ab08          	add	a,#8
6273  0f93 8d000000      	callf	f_Set_LCD_Address
6275                     ; 793 						Display_LCD_String("FDt:");
6277  0f97 ae02f4        	ldw	x,#L5422
6279  0f9a 2009          	jpf	LC026
6280                     ; 796 				else{Display_LCD_String(LCD_Dis_Data[i]);}
6282  0f9c               L5253:
6283                     ; 797 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
6285  0f9c 7b01          	ld	a,(OFST-1,sp)
6286  0f9e               LC027:
6288  0f9e 97            	ld	xl,a
6289  0f9f a610          	ld	a,#16
6290  0fa1 42            	mul	x,a
6291  0fa2 1c0000        	addw	x,#_LCD_Dis_Data
6292  0fa5               LC026:
6293  0fa5 8d000000      	callf	f_Display_LCD_String
6295  0fa9               L3453:
6296                     ; 799 			if(i==0){
6298  0fa9 7b01          	ld	a,(OFST-1,sp)
6299  0fab 2663          	jrne	L5453
6300                     ; 800 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
6302  0fad 5f            	clrw	x
6303  0fae 97            	ld	xl,a
6304  0faf d60000        	ld	a,(_LCD_Line,x)
6305  0fb2 ab04          	add	a,#4
6306  0fb4 8d000000      	callf	f_Set_LCD_Address
6308                     ; 801 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6310  0fb8 7203000616    	btjf	_MD_Test_Register,#1,L1553
6312  0fbd 7b01          	ld	a,(OFST-1,sp)
6313  0fbf c10000        	cp	a,_MD_Data_Step
6314  0fc2 260f          	jrne	L1553
6315                     ; 802 					if(Blink_50){Display_LCD_String(" ");}
6317  0fc4 725d0000      	tnz	_Blink_50
6318  0fc8 2709          	jreq	L1553
6321  0fca ae02f2        	ldw	x,#L1622
6322  0fcd 8d000000      	callf	f_Display_LCD_String
6325  0fd1 2009          	jra	L5553
6326  0fd3               L1553:
6327                     ; 803 					else{ Num_Display_LCD(PTC_AllowOperation);}
6329                     ; 804 				}else{ Num_Display_LCD(PTC_AllowOperation);}
6332  0fd3 c60000        	ld	a,_PTC_AllowOperation
6333  0fd6 5f            	clrw	x
6334  0fd7 97            	ld	xl,a
6335  0fd8 8d000000      	callf	f_Num_Display_LCD
6337  0fdc               L5553:
6338                     ; 806 				Set_LCD_Address((unsigned char)(LCD_Line[i]+10));
6340  0fdc 7b01          	ld	a,(OFST-1,sp)
6341  0fde 5f            	clrw	x
6342  0fdf 97            	ld	xl,a
6343  0fe0 d60000        	ld	a,(_LCD_Line,x)
6344  0fe3 ab0a          	add	a,#10
6345  0fe5 8d000000      	callf	f_Set_LCD_Address
6347                     ; 807 				if((MD_ID306_Data[0] & 0xF0) == 0xA0){ Display_LCD_String("LHD"); }
6349  0fe9 c60011        	ld	a,_MD_ID306_Data
6350  0fec a4f0          	and	a,#240
6351  0fee a1a0          	cp	a,#160
6352  0ff0 2605          	jrne	L7553
6355  0ff2 ae01ec        	ldw	x,#L1653
6358  0ff5 2011          	jpf	LC031
6359  0ff7               L7553:
6360                     ; 808 				else if((MD_ID306_Data[0] & 0xF0) == 0xB0){ Display_LCD_String("RHD");}
6362  0ff7 c60011        	ld	a,_MD_ID306_Data
6363  0ffa a4f0          	and	a,#240
6364  0ffc a1b0          	cp	a,#176
6365  0ffe 2605          	jrne	L5653
6368  1000 ae01e8        	ldw	x,#L7653
6371  1003 2003          	jpf	LC031
6372  1005               L5653:
6373                     ; 809 				else{ Display_LCD_String("NON"); }
6375  1005 ae01f7        	ldw	x,#L1713
6376  1008               LC031:
6377  1008 8d000000      	callf	f_Display_LCD_String
6379  100c ac3b113b      	jra	L3753
6380  1010               L5453:
6381                     ; 812 			else if(i==1){
6383  1010 a101          	cp	a,#1
6384  1012 2676          	jrne	L5753
6385                     ; 813 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
6387  1014 5f            	clrw	x
6388  1015 97            	ld	xl,a
6389  1016 d60000        	ld	a,(_LCD_Line,x)
6390  1019 ab04          	add	a,#4
6391  101b 8d000000      	callf	f_Set_LCD_Address
6393                     ; 814 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6395  101f 7203000616    	btjf	_MD_Test_Register,#1,L1063
6397  1024 7b01          	ld	a,(OFST-1,sp)
6398  1026 c10000        	cp	a,_MD_Data_Step
6399  1029 260f          	jrne	L1063
6400                     ; 815 					if(Blink_50){Display_LCD_String("   ");}
6402  102b 725d0000      	tnz	_Blink_50
6403  102f 2709          	jreq	L1063
6406  1031 ae02d9        	ldw	x,#L3232
6407  1034 8d000000      	callf	f_Display_LCD_String
6410  1038 2025          	jra	L7063
6411  103a               L1063:
6412                     ; 817 						Num_Display_LCD(PTC_Heat_Duty/2);
6414                     ; 818 						if(PTC_Heat_Duty < 200){
6415                     ; 819 							Display_LCD_String(".");
6417                     ; 820 							Num_Display_LCD((PTC_Heat_Duty%2)*5);
6419                     ; 824 					Num_Display_LCD(PTC_Heat_Duty/2);
6422                     ; 825 					if(PTC_Heat_Duty < 200){
6424                     ; 826 						Display_LCD_String(".");
6427                     ; 827 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
6430  103a c60000        	ld	a,_PTC_Heat_Duty
6431  103d 44            	srl	a
6432  103e 5f            	clrw	x
6433  103f 97            	ld	xl,a
6434  1040 8d000000      	callf	f_Num_Display_LCD
6436  1044 c60000        	ld	a,_PTC_Heat_Duty
6437  1047 a1c8          	cp	a,#200
6438  1049 2414          	jruge	L7063
6440  104b ae02d7        	ldw	x,#L1332
6441  104e 8d000000      	callf	f_Display_LCD_String
6443  1052 c60000        	ld	a,_PTC_Heat_Duty
6444  1055 a401          	and	a,#1
6445  1057 97            	ld	xl,a
6446  1058 a605          	ld	a,#5
6447  105a 42            	mul	x,a
6448  105b 8d000000      	callf	f_Num_Display_LCD
6450  105f               L7063:
6451                     ; 831 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
6453  105f 7b01          	ld	a,(OFST-1,sp)
6454  1061 5f            	clrw	x
6455  1062 97            	ld	xl,a
6456  1063 d60000        	ld	a,(_LCD_Line,x)
6457  1066 ab0c          	add	a,#12
6458  1068 8d000000      	callf	f_Set_LCD_Address
6460                     ; 832 				Num_Display_LCD(MD_ID206_Data[6]/2);
6462  106c c6000f        	ld	a,_MD_ID206_Data+6
6463  106f 44            	srl	a
6464  1070 5f            	clrw	x
6465  1071 97            	ld	xl,a
6466  1072 8d000000      	callf	f_Num_Display_LCD
6468                     ; 833 				Display_LCD_String(".");
6470  1076 ae02d7        	ldw	x,#L1332
6471  1079 8d000000      	callf	f_Display_LCD_String
6473                     ; 834 				Num_Display_LCD((MD_ID206_Data[6]%2)*5);
6475  107d c6000f        	ld	a,_MD_ID206_Data+6
6476  1080 a401          	and	a,#1
6477  1082 97            	ld	xl,a
6478  1083 a605          	ld	a,#5
6479  1085 42            	mul	x,a
6482  1086 ac371137      	jpf	LC030
6483  108a               L5753:
6484                     ; 838 			else if(i==2){
6486  108a a102          	cp	a,#2
6487  108c 2661          	jrne	L5163
6488                     ; 839 				Set_LCD_Address((unsigned char)(LCD_Line[i]+2));
6490  108e 5f            	clrw	x
6491  108f 97            	ld	xl,a
6492  1090 d60000        	ld	a,(_LCD_Line,x)
6493  1093 ab02          	add	a,#2
6494  1095 8d000000      	callf	f_Set_LCD_Address
6496                     ; 840 				Num_Display_LCD(MD_ID206_Data[0] & 0x01);
6498  1099 c60009        	ld	a,_MD_ID206_Data
6499  109c a401          	and	a,#1
6500  109e 5f            	clrw	x
6501  109f 97            	ld	xl,a
6502  10a0 8d000000      	callf	f_Num_Display_LCD
6504                     ; 841 				Set_LCD_Address((unsigned char)(LCD_Line[i]+6));
6506  10a4 7b01          	ld	a,(OFST-1,sp)
6507  10a6 5f            	clrw	x
6508  10a7 97            	ld	xl,a
6509  10a8 d60000        	ld	a,(_LCD_Line,x)
6510  10ab ab06          	add	a,#6
6511  10ad 8d000000      	callf	f_Set_LCD_Address
6513                     ; 842 				Num_Display_LCD(MD_ID306_Data[0] & 0x01);
6515  10b1 c60011        	ld	a,_MD_ID306_Data
6516  10b4 a401          	and	a,#1
6517  10b6 5f            	clrw	x
6518  10b7 97            	ld	xl,a
6519  10b8 8d000000      	callf	f_Num_Display_LCD
6521                     ; 843 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
6523  10bc 7b01          	ld	a,(OFST-1,sp)
6524  10be 5f            	clrw	x
6525  10bf 97            	ld	xl,a
6526  10c0 d60000        	ld	a,(_LCD_Line,x)
6527  10c3 ab0c          	add	a,#12
6528  10c5 8d000000      	callf	f_Set_LCD_Address
6530                     ; 844 				if(((MD_ID206_Data[3] << 8)+MD_ID206_Data[2]) >= 10000){Num_Display_LCD(9999);}
6532  10c9 c6000c        	ld	a,_MD_ID206_Data+3
6533  10cc 5f            	clrw	x
6534  10cd 97            	ld	xl,a
6535  10ce 4f            	clr	a
6536  10cf cb000b        	add	a,_MD_ID206_Data+2
6537  10d2 2401          	jrnc	L477
6538  10d4 5c            	incw	x
6539  10d5               L477:
6540  10d5 02            	rlwa	x,a
6541  10d6 a32710        	cpw	x,#10000
6542  10d9 2f05          	jrslt	L7163
6545  10db ae270f        	ldw	x,#9999
6548  10de 2057          	jpf	LC030
6549  10e0               L7163:
6550                     ; 845 				else{Num_Display_LCD((MD_ID206_Data[3] << 8)+MD_ID206_Data[2]);}	// Consumption Power
6552  10e0 c6000c        	ld	a,_MD_ID206_Data+3
6553  10e3 5f            	clrw	x
6554  10e4 97            	ld	xl,a
6555  10e5 4f            	clr	a
6556  10e6 cb000b        	add	a,_MD_ID206_Data+2
6557  10e9 2401          	jrnc	L2001
6558  10eb 5c            	incw	x
6559  10ec               L2001:
6560  10ec 02            	rlwa	x,a
6562  10ed 2048          	jpf	LC030
6563  10ef               L5163:
6564                     ; 848 			else if(i==3){
6566  10ef a103          	cp	a,#3
6567  10f1 2648          	jrne	L3753
6568                     ; 849 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
6570  10f3 5f            	clrw	x
6571  10f4 97            	ld	xl,a
6572  10f5 d60000        	ld	a,(_LCD_Line,x)
6573  10f8 ab04          	add	a,#4
6574  10fa 8d000000      	callf	f_Set_LCD_Address
6576                     ; 850 				Num_Display_LCD(MD_ID206_Data[4] * 2);
6578  10fe c6000d        	ld	a,_MD_ID206_Data+4
6579  1101 5f            	clrw	x
6580  1102 97            	ld	xl,a
6581  1103 58            	sllw	x
6582  1104 8d000000      	callf	f_Num_Display_LCD
6584                     ; 851 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
6586  1108 7b01          	ld	a,(OFST-1,sp)
6587  110a 5f            	clrw	x
6588  110b 97            	ld	xl,a
6589  110c d60000        	ld	a,(_LCD_Line,x)
6590  110f ab0c          	add	a,#12
6591  1111 8d000000      	callf	f_Set_LCD_Address
6593                     ; 852 				Num_Display_LCD(MD_ID206_Data[5] / 5);
6595  1115 c6000e        	ld	a,_MD_ID206_Data+5
6596  1118 5f            	clrw	x
6597  1119 97            	ld	xl,a
6598  111a a605          	ld	a,#5
6599  111c 8d000000      	callf	d_sdivx
6601  1120 8d000000      	callf	f_Num_Display_LCD
6603                     ; 853 				Display_LCD_String(".");
6605  1124 ae02d7        	ldw	x,#L1332
6606  1127 8d000000      	callf	f_Display_LCD_String
6608                     ; 854 				Num_Display_LCD((MD_ID206_Data[5] % 5) * 2);
6610  112b c6000e        	ld	a,_MD_ID206_Data+5
6611  112e 5f            	clrw	x
6612  112f 97            	ld	xl,a
6613  1130 a605          	ld	a,#5
6614  1132 8d000000      	callf	d_smodx
6616  1136 58            	sllw	x
6617  1137               LC030:
6618  1137 8d000000      	callf	f_Num_Display_LCD
6620  113b               L3753:
6621                     ; 782 		for(i=0; i<4; i++){
6623  113b 0c01          	inc	(OFST-1,sp)
6626  113d 7b01          	ld	a,(OFST-1,sp)
6627  113f a104          	cp	a,#4
6628  1141 2404ac540f54  	jrult	L7153
6630  1147 acf01df0      	jra	L7263
6631  114b               L5153:
6632                     ; 858 	else if(MD_Test_Pg == 10){
6634  114b c60001        	ld	a,_MD_Test_Pg
6635  114e a10a          	cp	a,#10
6636  1150 2704ac121312  	jrne	L1363
6637                     ; 859 		for(i=0; i<4; i++){
6639  1156 4f            	clr	a
6640  1157 6b01          	ld	(OFST-1,sp),a
6641  1159               L3363:
6642                     ; 860 			Set_LCD_Address(LCD_Line[i]);
6644  1159 5f            	clrw	x
6645  115a 97            	ld	xl,a
6646  115b d60000        	ld	a,(_LCD_Line,x)
6647  115e 8d000000      	callf	f_Set_LCD_Address
6649                     ; 862 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
6651  1162 7201000617    	btjf	_MD_Test_Register,#0,L1463
6653  1167 7202000612    	btjt	_MD_Test_Register,#1,L1463
6655  116c 7b01          	ld	a,(OFST-1,sp)
6656  116e c10000        	cp	a,_MD_Data_Step
6657  1171 260b          	jrne	L1463
6658                     ; 863 				if(Blink_50){Display_LCD_String("     ");}
6660  1173 725d0000      	tnz	_Blink_50
6661  1177 2707          	jreq	LC032
6664  1179 ae02d1        	ldw	x,#L1732
6667  117c 2009          	jra	L7463
6668                     ; 864 				else{Display_LCD_String(LCD_Dis_Data[i]);}
6670  117e               L1463:
6671                     ; 865 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
6673  117e 7b01          	ld	a,(OFST-1,sp)
6674  1180               LC032:
6676  1180 97            	ld	xl,a
6677  1181 a610          	ld	a,#16
6678  1183 42            	mul	x,a
6679  1184 1c0000        	addw	x,#_LCD_Dis_Data
6681  1187               L7463:
6682  1187 8d000000      	callf	f_Display_LCD_String
6683                     ; 867 			if(i == 0){
6685  118b 7b01          	ld	a,(OFST-1,sp)
6686  118d 2657          	jrne	L1563
6687                     ; 868 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6689  118f 5f            	clrw	x
6690  1190 97            	ld	xl,a
6691  1191 d60000        	ld	a,(_LCD_Line,x)
6692  1194 ab08          	add	a,#8
6693  1196 8d000000      	callf	f_Set_LCD_Address
6695                     ; 869 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6697  119a 720300062c    	btjf	_MD_Test_Register,#1,L3563
6699  119f 7b01          	ld	a,(OFST-1,sp)
6700  11a1 c10000        	cp	a,_MD_Data_Step
6701  11a4 2625          	jrne	L3563
6702                     ; 870 					if(Blink_50){Display_LCD_String("     ");}
6704  11a6 725d0000      	tnz	_Blink_50
6708  11aa 265b          	jrne	LC035
6709                     ; 872 						if(MD_Vehicle_Logic == 1){Display_LCD_String("LHD");}
6711  11ac c60008        	ld	a,_MD_Vehicle_Logic
6712  11af 4a            	dec	a
6713  11b0 2607          	jrne	L1663
6716  11b2 ae01ec        	ldw	x,#L1653
6719  11b5 acfe12fe      	jpf	LC033
6720  11b9               L1663:
6721                     ; 873 						else if(MD_Vehicle_Logic == 2){Display_LCD_String("RHD");}
6723  11b9 c60008        	ld	a,_MD_Vehicle_Logic
6724  11bc a102          	cp	a,#2
6725  11be 2704ac021302  	jrne	L7763
6728  11c4 ae01e8        	ldw	x,#L7653
6730  11c7 acfe12fe      	jpf	LC033
6731  11cb               L3563:
6732                     ; 876 					if(MD_Vehicle_Logic == 1){Display_LCD_String("LHD");}
6734  11cb c60008        	ld	a,_MD_Vehicle_Logic
6735  11ce 4a            	dec	a
6736  11cf 2607          	jrne	L1763
6739  11d1 ae01ec        	ldw	x,#L1653
6742  11d4 acfe12fe      	jpf	LC033
6743  11d8               L1763:
6744                     ; 877 					else if(MD_Vehicle_Logic == 2){Display_LCD_String("RHD");}
6746  11d8 c60008        	ld	a,_MD_Vehicle_Logic
6747  11db a102          	cp	a,#2
6748  11dd 26e1          	jrne	L7763
6751  11df ae01e8        	ldw	x,#L7653
6753  11e2 acfe12fe      	jpf	LC033
6754  11e6               L1563:
6755                     ; 880 			else if(i==1){
6757  11e6 a101          	cp	a,#1
6758  11e8 2649          	jrne	L1073
6759                     ; 881 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6761  11ea 5f            	clrw	x
6762  11eb 97            	ld	xl,a
6763  11ec d60000        	ld	a,(_LCD_Line,x)
6764  11ef ab08          	add	a,#8
6765  11f1 8d000000      	callf	f_Set_LCD_Address
6767                     ; 882 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6769  11f5 7203000614    	btjf	_MD_Test_Register,#1,L5073
6771  11fa 7b01          	ld	a,(OFST-1,sp)
6772  11fc c10000        	cp	a,_MD_Data_Step
6773  11ff 260d          	jrne	L5073
6774                     ; 883 					if(Blink_50){Display_LCD_String("     ");}
6776  1201 725d0000      	tnz	_Blink_50
6777  1205 2707          	jreq	L5073
6780  1207               LC035:
6784  1207 ae02d1        	ldw	x,#L1732
6787  120a acfe12fe      	jpf	LC033
6788  120e               L5073:
6789                     ; 885 						Num_Display_LCD(MD_Unit/2);
6791                     ; 886 						Display_LCD_String(".");
6793                     ; 887 						Num_Display_LCD((MD_Unit%2)*5);
6795                     ; 888 						Display_LCD_String("%");
6797                     ; 891 					Num_Display_LCD(MD_Unit/2);
6800                     ; 892 					Display_LCD_String(".");
6803                     ; 893 					Num_Display_LCD((MD_Unit%2)*5);
6806                     ; 894 					Display_LCD_String("%");
6809  120e c60007        	ld	a,_MD_Unit
6810  1211 44            	srl	a
6811  1212 5f            	clrw	x
6812  1213 97            	ld	xl,a
6813  1214 8d000000      	callf	f_Num_Display_LCD
6815  1218 ae02d7        	ldw	x,#L1332
6816  121b 8d000000      	callf	f_Display_LCD_String
6818  121f c60007        	ld	a,_MD_Unit
6819  1222 a401          	and	a,#1
6820  1224 97            	ld	xl,a
6821  1225 a605          	ld	a,#5
6822  1227 42            	mul	x,a
6823  1228 8d000000      	callf	f_Num_Display_LCD
6825  122c ae02cf        	ldw	x,#L7042
6827  122f acfe12fe      	jpf	LC033
6828  1233               L1073:
6829                     ; 898 			else if(i==2){
6831  1233 a102          	cp	a,#2
6832  1235 2653          	jrne	L5173
6833                     ; 899 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6835  1237 5f            	clrw	x
6836  1238 97            	ld	xl,a
6837  1239 d60000        	ld	a,(_LCD_Line,x)
6838  123c ab08          	add	a,#8
6839  123e 8d000000      	callf	f_Set_LCD_Address
6841                     ; 901 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6843  1242 7203000641    	btjf	_MD_Test_Register,#1,L7173
6845  1247 7b01          	ld	a,(OFST-1,sp)
6846  1249 c10000        	cp	a,_MD_Data_Step
6847  124c 2606          	jrne	L1273
6848                     ; 902 					if(Blink_50){Display_LCD_String("     ");}
6850  124e 725d0000      	tnz	_Blink_50
6854  1252 26b3          	jrne	LC035
6855  1254               L1273:
6856                     ; 904 						Num_Display_LCD((unsigned int)(MD_T_Unit/60));
6861                     ; 905 						Display_LCD_String("m");
6864                     ; 906 						Num_Display_LCD((unsigned int)(MD_T_Unit%60));
6869                     ; 907 						Display_LCD_String("s");
6872  1254 ae0003        	ldw	x,#_MD_T_Unit
6873  1257 8d000000      	callf	d_ltor
6874  125b ae0008        	ldw	x,#L624
6875  125e 8d000000      	callf	d_ludv
6876  1262 be02          	ldw	x,c_lreg+2
6877  1264 8d000000      	callf	f_Num_Display_LCD
6879  1268 ae02cd        	ldw	x,#L5242
6880  126b 8d000000      	callf	f_Display_LCD_String
6882  126f ae0003        	ldw	x,#_MD_T_Unit
6883  1272 8d000000      	callf	d_ltor
6884  1276 ae0008        	ldw	x,#L624
6885  1279 8d000000      	callf	d_lumd
6886  127d be02          	ldw	x,c_lreg+2
6887  127f 8d000000      	callf	f_Num_Display_LCD
6889  1283 ae02cb        	ldw	x,#L7242
6891  1286 2076          	jpf	LC033
6892  1288               L7173:
6893                     ; 911 					Num_Display_LCD((unsigned int)(MD_T_Unit/60));
6897                     ; 912 					Display_LCD_String("m");
6899                     ; 913 					Num_Display_LCD((unsigned int)(MD_T_Unit%60));
6903                     ; 914 					Display_LCD_String("s");
6905  1288 20ca          	jpf	L1273
6906  128a               L5173:
6907                     ; 918 			else if(i==3){
6909  128a a103          	cp	a,#3
6910  128c 2674          	jrne	L7763
6911                     ; 919 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
6913  128e 5f            	clrw	x
6914  128f 97            	ld	xl,a
6915  1290 d60000        	ld	a,(_LCD_Line,x)
6916  1293 ab08          	add	a,#8
6917  1295 8d000000      	callf	f_Set_LCD_Address
6919                     ; 921 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
6921  1299 7203000633    	btjf	_MD_Test_Register,#1,L3373
6923  129e 7b01          	ld	a,(OFST-1,sp)
6924  12a0 c10000        	cp	a,_MD_Data_Step
6925  12a3 262c          	jrne	L3373
6926                     ; 922 					if(Blink_50){Display_LCD_String("     ");}
6928  12a5 725d0000      	tnz	_Blink_50
6932  12a9 2704ac071207  	jrne	LC035
6933                     ; 924 						if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
6935  12af ce0004        	ldw	x,_MD_T_UpDn
6936  12b2 2605          	jrne	L1473
6939  12b4 ae02c7        	ldw	x,#L7442
6942  12b7 2045          	jpf	LC033
6943  12b9               L1473:
6944                     ; 925 						else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
6946  12b9 ce0004        	ldw	x,_MD_T_UpDn
6947  12bc 5a            	decw	x
6948  12bd 2605          	jrne	L5473
6951  12bf ae02c4        	ldw	x,#L5542
6954  12c2 203a          	jpf	LC033
6955  12c4               L5473:
6956                     ; 926 						else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
6958  12c4 ce0004        	ldw	x,_MD_T_UpDn
6959  12c7 a30002        	cpw	x,#2
6960  12ca 2627          	jrne	L1773
6963  12cc ae02bf        	ldw	x,#L3642
6966  12cf 202d          	jpf	LC033
6967                     ; 927 						else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
6970  12d1               L3373:
6971                     ; 931 					if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
6973  12d1 ce0004        	ldw	x,_MD_T_UpDn
6974  12d4 2605          	jrne	L1673
6977  12d6 ae02c7        	ldw	x,#L7442
6980  12d9 2023          	jpf	LC033
6981  12db               L1673:
6982                     ; 932 					else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
6984  12db ce0004        	ldw	x,_MD_T_UpDn
6985  12de 5a            	decw	x
6986  12df 2605          	jrne	L5673
6989  12e1 ae02c4        	ldw	x,#L5542
6992  12e4 2018          	jpf	LC033
6993  12e6               L5673:
6994                     ; 933 					else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
6996  12e6 ce0004        	ldw	x,_MD_T_UpDn
6997  12e9 a30002        	cpw	x,#2
6998  12ec 2605          	jrne	L1773
7001  12ee ae02bf        	ldw	x,#L3642
7004  12f1 200b          	jpf	LC033
7005  12f3               L1773:
7006                     ; 934 					else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
7011  12f3 ce0004        	ldw	x,_MD_T_UpDn
7012  12f6 a30003        	cpw	x,#3
7013  12f9 2607          	jrne	L7763
7015  12fb ae02b9        	ldw	x,#L1742
7016  12fe               LC033:
7017  12fe 8d000000      	callf	f_Display_LCD_String
7019  1302               L7763:
7020                     ; 859 		for(i=0; i<4; i++){
7022  1302 0c01          	inc	(OFST-1,sp)
7025  1304 7b01          	ld	a,(OFST-1,sp)
7026  1306 a104          	cp	a,#4
7027  1308 2404ac591159  	jrult	L3363
7029  130e acf01df0      	jra	L7263
7030  1312               L1363:
7031                     ; 942 		for(i=0;i<4;i++){
7033  1312 4f            	clr	a
7034  1313 6b01          	ld	(OFST-1,sp),a
7035  1315               L1004:
7036                     ; 943 			Set_LCD_Address(LCD_Line[i]);
7038  1315 5f            	clrw	x
7039  1316 97            	ld	xl,a
7040  1317 d60000        	ld	a,(_LCD_Line,x)
7041  131a 8d000000      	callf	f_Set_LCD_Address
7043                     ; 944 			Display_LCD_String(LCD_Dis_Data[i]);
7045  131e 7b01          	ld	a,(OFST-1,sp)
7046  1320 97            	ld	xl,a
7047  1321 a610          	ld	a,#16
7048  1323 42            	mul	x,a
7049  1324 1c0000        	addw	x,#_LCD_Dis_Data
7050  1327 8d000000      	callf	f_Display_LCD_String
7052                     ; 942 		for(i=0;i<4;i++){
7054  132b 0c01          	inc	(OFST-1,sp)
7057  132d 7b01          	ld	a,(OFST-1,sp)
7058  132f a104          	cp	a,#4
7059  1331 25e2          	jrult	L1004
7060                     ; 947 		if(MD_Test_Pg == 1){	
7062  1333 c60001        	ld	a,_MD_Test_Pg
7063  1336 4a            	dec	a
7064  1337 2704ace814e8  	jrne	L7004
7065                     ; 949 			Set_LCD_Address((unsigned char)(LCD_Line[0]+4));
7067  133d c60000        	ld	a,_LCD_Line
7068  1340 ab04          	add	a,#4
7069  1342 8d000000      	callf	f_Set_LCD_Address
7071                     ; 950 			if(MD_ID316_Data[0] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7073  1346 c60021        	ld	a,_MD_ID316_Data
7074  1349 a1f1          	cp	a,#241
7075  134b 2509          	jrult	L1104
7078  134d ae02b6        	ldw	x,#L7252
7079  1350 8d000000      	callf	f_Display_LCD_String
7082  1354 2027          	jra	L3104
7083  1356               L1104:
7084                     ; 951 			else if(MD_ID316_Data[0] < 40){
7086  1356 c60021        	ld	a,_MD_ID316_Data
7087  1359 a128          	cp	a,#40
7088  135b 2414          	jruge	L5104
7089                     ; 952 				Display_LCD_String("-");
7091  135d ae02b4        	ldw	x,#L5352
7092  1360 8d000000      	callf	f_Display_LCD_String
7094                     ; 953 				Num_Display_LCD(40-MD_ID316_Data[0]);
7096  1364 4f            	clr	a
7097  1365 97            	ld	xl,a
7098  1366 a628          	ld	a,#40
7099  1368 c00021        	sub	a,_MD_ID316_Data
7100  136b 2401          	jrnc	L4511
7101  136d 5a            	decw	x
7102  136e               L4511:
7103  136e 02            	rlwa	x,a
7106  136f 2008          	jpf	LC038
7107  1371               L5104:
7108                     ; 954 			}else{ Num_Display_LCD(MD_ID316_Data[0]-40);}  	
7110  1371 c60021        	ld	a,_MD_ID316_Data
7111  1374 5f            	clrw	x
7112  1375 97            	ld	xl,a
7113  1376 1d0028        	subw	x,#40
7114  1379               LC038:
7115  1379 8d000000      	callf	f_Num_Display_LCD
7117  137d               L3104:
7118                     ; 956 			Set_LCD_Address((unsigned char)(LCD_Line[0]+12));
7120  137d c60000        	ld	a,_LCD_Line
7121  1380 ab0c          	add	a,#12
7122  1382 8d000000      	callf	f_Set_LCD_Address
7124                     ; 957 			if(MD_ID316_Data[1] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7126  1386 c60022        	ld	a,_MD_ID316_Data+1
7127  1389 a1f1          	cp	a,#241
7128  138b 2509          	jrult	L1204
7131  138d ae02b6        	ldw	x,#L7252
7132  1390 8d000000      	callf	f_Display_LCD_String
7135  1394 2027          	jra	L3204
7136  1396               L1204:
7137                     ; 958 			else if(MD_ID316_Data[1] < 40){
7139  1396 c60022        	ld	a,_MD_ID316_Data+1
7140  1399 a128          	cp	a,#40
7141  139b 2414          	jruge	L5204
7142                     ; 959 				Display_LCD_String("-");
7144  139d ae02b4        	ldw	x,#L5352
7145  13a0 8d000000      	callf	f_Display_LCD_String
7147                     ; 960 				Num_Display_LCD(40-MD_ID316_Data[1]);
7149  13a4 4f            	clr	a
7150  13a5 97            	ld	xl,a
7151  13a6 a628          	ld	a,#40
7152  13a8 c00022        	sub	a,_MD_ID316_Data+1
7153  13ab 2401          	jrnc	L0711
7154  13ad 5a            	decw	x
7155  13ae               L0711:
7156  13ae 02            	rlwa	x,a
7159  13af 2008          	jpf	LC039
7160  13b1               L5204:
7161                     ; 961 			}else{ Num_Display_LCD(MD_ID316_Data[1]-40);} 
7163  13b1 c60022        	ld	a,_MD_ID316_Data+1
7164  13b4 5f            	clrw	x
7165  13b5 97            	ld	xl,a
7166  13b6 1d0028        	subw	x,#40
7167  13b9               LC039:
7168  13b9 8d000000      	callf	f_Num_Display_LCD
7170  13bd               L3204:
7171                     ; 964 			Set_LCD_Address((unsigned char)(LCD_Line[1]+4));
7173  13bd c60001        	ld	a,_LCD_Line+1
7174  13c0 ab04          	add	a,#4
7175  13c2 8d000000      	callf	f_Set_LCD_Address
7177                     ; 965 			if(MD_ID316_Data[2] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7179  13c6 c60023        	ld	a,_MD_ID316_Data+2
7180  13c9 a1f1          	cp	a,#241
7181  13cb 2509          	jrult	L1304
7184  13cd ae02b6        	ldw	x,#L7252
7185  13d0 8d000000      	callf	f_Display_LCD_String
7188  13d4 2027          	jra	L3304
7189  13d6               L1304:
7190                     ; 966 			else if(MD_ID316_Data[2] < 40){
7192  13d6 c60023        	ld	a,_MD_ID316_Data+2
7193  13d9 a128          	cp	a,#40
7194  13db 2414          	jruge	L5304
7195                     ; 967 				Display_LCD_String("-");
7197  13dd ae02b4        	ldw	x,#L5352
7198  13e0 8d000000      	callf	f_Display_LCD_String
7200                     ; 968 				Num_Display_LCD(40-MD_ID316_Data[2]);
7202  13e4 4f            	clr	a
7203  13e5 97            	ld	xl,a
7204  13e6 a628          	ld	a,#40
7205  13e8 c00023        	sub	a,_MD_ID316_Data+2
7206  13eb 2401          	jrnc	L4021
7207  13ed 5a            	decw	x
7208  13ee               L4021:
7209  13ee 02            	rlwa	x,a
7212  13ef 2008          	jpf	LC040
7213  13f1               L5304:
7214                     ; 969 			}else{ Num_Display_LCD(MD_ID316_Data[2]-40);}  	
7216  13f1 c60023        	ld	a,_MD_ID316_Data+2
7217  13f4 5f            	clrw	x
7218  13f5 97            	ld	xl,a
7219  13f6 1d0028        	subw	x,#40
7220  13f9               LC040:
7221  13f9 8d000000      	callf	f_Num_Display_LCD
7223  13fd               L3304:
7224                     ; 971 			Set_LCD_Address((unsigned char)(LCD_Line[1]+12));
7226  13fd c60001        	ld	a,_LCD_Line+1
7227  1400 ab0c          	add	a,#12
7228  1402 8d000000      	callf	f_Set_LCD_Address
7230                     ; 972 			if(MD_ID316_Data[3] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7232  1406 c60024        	ld	a,_MD_ID316_Data+3
7233  1409 a1f1          	cp	a,#241
7234  140b 2509          	jrult	L1404
7237  140d ae02b6        	ldw	x,#L7252
7238  1410 8d000000      	callf	f_Display_LCD_String
7241  1414 2027          	jra	L3404
7242  1416               L1404:
7243                     ; 973 			else if(MD_ID316_Data[3] < 40){
7245  1416 c60024        	ld	a,_MD_ID316_Data+3
7246  1419 a128          	cp	a,#40
7247  141b 2414          	jruge	L5404
7248                     ; 974 				Display_LCD_String("-");
7250  141d ae02b4        	ldw	x,#L5352
7251  1420 8d000000      	callf	f_Display_LCD_String
7253                     ; 975 				Num_Display_LCD(40-MD_ID316_Data[3]);
7255  1424 4f            	clr	a
7256  1425 97            	ld	xl,a
7257  1426 a628          	ld	a,#40
7258  1428 c00024        	sub	a,_MD_ID316_Data+3
7259  142b 2401          	jrnc	L0221
7260  142d 5a            	decw	x
7261  142e               L0221:
7262  142e 02            	rlwa	x,a
7265  142f 2008          	jpf	LC041
7266  1431               L5404:
7267                     ; 976 			}else{ Num_Display_LCD(MD_ID316_Data[3]-40);} 
7269  1431 c60024        	ld	a,_MD_ID316_Data+3
7270  1434 5f            	clrw	x
7271  1435 97            	ld	xl,a
7272  1436 1d0028        	subw	x,#40
7273  1439               LC041:
7274  1439 8d000000      	callf	f_Num_Display_LCD
7276  143d               L3404:
7277                     ; 979 			Set_LCD_Address((unsigned char)(LCD_Line[2]+4));
7279  143d c60002        	ld	a,_LCD_Line+2
7280  1440 ab04          	add	a,#4
7281  1442 8d000000      	callf	f_Set_LCD_Address
7283                     ; 980 			if(MD_ID316_Data[4] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7285  1446 c60025        	ld	a,_MD_ID316_Data+4
7286  1449 a1f1          	cp	a,#241
7287  144b 2509          	jrult	L1504
7290  144d ae02b6        	ldw	x,#L7252
7291  1450 8d000000      	callf	f_Display_LCD_String
7294  1454 2027          	jra	L3504
7295  1456               L1504:
7296                     ; 981 			else if(MD_ID316_Data[4] < 40){
7298  1456 c60025        	ld	a,_MD_ID316_Data+4
7299  1459 a128          	cp	a,#40
7300  145b 2414          	jruge	L5504
7301                     ; 982 				Display_LCD_String("-");
7303  145d ae02b4        	ldw	x,#L5352
7304  1460 8d000000      	callf	f_Display_LCD_String
7306                     ; 983 				Num_Display_LCD(40-MD_ID316_Data[4]);
7308  1464 4f            	clr	a
7309  1465 97            	ld	xl,a
7310  1466 a628          	ld	a,#40
7311  1468 c00025        	sub	a,_MD_ID316_Data+4
7312  146b 2401          	jrnc	L4321
7313  146d 5a            	decw	x
7314  146e               L4321:
7315  146e 02            	rlwa	x,a
7318  146f 2008          	jpf	LC042
7319  1471               L5504:
7320                     ; 984 			}else{ Num_Display_LCD(MD_ID316_Data[4]-40);}  	
7322  1471 c60025        	ld	a,_MD_ID316_Data+4
7323  1474 5f            	clrw	x
7324  1475 97            	ld	xl,a
7325  1476 1d0028        	subw	x,#40
7326  1479               LC042:
7327  1479 8d000000      	callf	f_Num_Display_LCD
7329  147d               L3504:
7330                     ; 986 			Set_LCD_Address((unsigned char)(LCD_Line[2]+12));
7332  147d c60002        	ld	a,_LCD_Line+2
7333  1480 ab0c          	add	a,#12
7334  1482 8d000000      	callf	f_Set_LCD_Address
7336                     ; 987 			if(MD_ID316_Data[5] >= 0xF1){Display_LCD_String("Fa");}	// Left Core Temp Value
7338  1486 c60026        	ld	a,_MD_ID316_Data+5
7339  1489 a1f1          	cp	a,#241
7340  148b 2509          	jrult	L1604
7343  148d ae02b6        	ldw	x,#L7252
7344  1490 8d000000      	callf	f_Display_LCD_String
7347  1494 2027          	jra	L3604
7348  1496               L1604:
7349                     ; 988 			else if(MD_ID316_Data[5] < 40){
7351  1496 c60026        	ld	a,_MD_ID316_Data+5
7352  1499 a128          	cp	a,#40
7353  149b 2414          	jruge	L5604
7354                     ; 989 				Display_LCD_String("-");
7356  149d ae02b4        	ldw	x,#L5352
7357  14a0 8d000000      	callf	f_Display_LCD_String
7359                     ; 990 				Num_Display_LCD(40-MD_ID316_Data[5]);
7361  14a4 4f            	clr	a
7362  14a5 97            	ld	xl,a
7363  14a6 a628          	ld	a,#40
7364  14a8 c00026        	sub	a,_MD_ID316_Data+5
7365  14ab 2401          	jrnc	L0521
7366  14ad 5a            	decw	x
7367  14ae               L0521:
7368  14ae 02            	rlwa	x,a
7371  14af 2008          	jpf	LC043
7372  14b1               L5604:
7373                     ; 991 			}else{ Num_Display_LCD(MD_ID316_Data[5]-40);} 
7375  14b1 c60026        	ld	a,_MD_ID316_Data+5
7376  14b4 5f            	clrw	x
7377  14b5 97            	ld	xl,a
7378  14b6 1d0028        	subw	x,#40
7379  14b9               LC043:
7380  14b9 8d000000      	callf	f_Num_Display_LCD
7382  14bd               L3604:
7383                     ; 995 			Set_LCD_Address((unsigned char)(LCD_Line[3]+4));
7385  14bd c60003        	ld	a,_LCD_Line+3
7386  14c0 ab04          	add	a,#4
7387  14c2 8d000000      	callf	f_Set_LCD_Address
7389                     ; 996 			Num_Display_LCD(MD_ID306_Data[7] / 16);
7391  14c6 c60018        	ld	a,_MD_ID306_Data+7
7392  14c9 4e            	swap	a
7393  14ca a40f          	and	a,#15
7394  14cc 5f            	clrw	x
7395  14cd 97            	ld	xl,a
7396  14ce 8d000000      	callf	f_Num_Display_LCD
7398                     ; 997 			Display_LCD_String(".");
7400  14d2 ae02d7        	ldw	x,#L1332
7401  14d5 8d000000      	callf	f_Display_LCD_String
7403                     ; 998 			Num_Display_LCD(MD_ID306_Data[7] % 16);
7405  14d9 c60018        	ld	a,_MD_ID306_Data+7
7406  14dc a40f          	and	a,#15
7407  14de 5f            	clrw	x
7408  14df 97            	ld	xl,a
7409  14e0 8d000000      	callf	f_Num_Display_LCD
7412  14e4 acf01df0      	jra	L7263
7413  14e8               L7004:
7414                     ; 1002 			Set_LCD_Address((unsigned char)(LCD_Line[3]+14));
7416  14e8 c60003        	ld	a,_LCD_Line+3
7417  14eb ab0e          	add	a,#14
7418  14ed 8d000000      	callf	f_Set_LCD_Address
7420                     ; 1003 			Display_LCD_String("D");
7422  14f1 ae02b2        	ldw	x,#L3552
7423  14f4 8d000000      	callf	f_Display_LCD_String
7425                     ; 1004 			Num_Display_LCD(MD_Test_Pg-1);
7427  14f8 c60001        	ld	a,_MD_Test_Pg
7428  14fb 5f            	clrw	x
7429  14fc 97            	ld	xl,a
7430  14fd 5a            	decw	x
7431  14fe 8d000000      	callf	f_Num_Display_LCD
7433                     ; 1007 			if(MD_ID306_Data[1] & 0x01){
7435  1502 720100124c    	btjf	_MD_ID306_Data+1,#0,L3704
7436                     ; 1008 				fault_cnt++;
7438  1507 0c02          	inc	(OFST+0,sp)
7439                     ; 1009 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7439                     ; 1010 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7439                     ; 1011 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7441  1509 270d          	jreq	L1014
7443  150b 7b02          	ld	a,(OFST+0,sp)
7444  150d a105          	cp	a,#5
7445  150f 2407          	jruge	L1014
7447  1511 c60001        	ld	a,_MD_Test_Pg
7448  1514 a102          	cp	a,#2
7449  1516 2722          	jreq	L7704
7450  1518               L1014:
7452  1518 7b02          	ld	a,(OFST+0,sp)
7453  151a a105          	cp	a,#5
7454  151c 250d          	jrult	L7014
7456  151e a109          	cp	a,#9
7457  1520 2409          	jruge	L7014
7459  1522 c60001        	ld	a,_MD_Test_Pg
7460  1525 a103          	cp	a,#3
7461  1527 2711          	jreq	L7704
7462  1529 7b02          	ld	a,(OFST+0,sp)
7463  152b               L7014:
7465  152b a109          	cp	a,#9
7466  152d 2524          	jrult	L3704
7468  152f a10d          	cp	a,#13
7469  1531 2420          	jruge	L3704
7471  1533 c60001        	ld	a,_MD_Test_Pg
7472  1536 a104          	cp	a,#4
7473  1538 2619          	jrne	L3704
7474  153a               L7704:
7475                     ; 1012 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7477  153a 7b02          	ld	a,(OFST+0,sp)
7478  153c 5f            	clrw	x
7479  153d 97            	ld	xl,a
7480  153e 5a            	decw	x
7481  153f a604          	ld	a,#4
7482  1541 8d000000      	callf	d_smodx
7484  1545 d60000        	ld	a,(_LCD_Line,x)
7485  1548 8d000000      	callf	f_Set_LCD_Address
7487                     ; 1013 					Display_LCD_String("Flt_LV_Low ");
7489  154c ae02a6        	ldw	x,#L5752
7490  154f 8d000000      	callf	f_Display_LCD_String
7492  1553               L3704:
7493                     ; 1017 			if(MD_ID306_Data[1] & 0x02){
7495  1553 720300124c    	btjf	_MD_ID306_Data+1,#1,L3114
7496                     ; 1018 				fault_cnt++;
7498  1558 0c02          	inc	(OFST+0,sp)
7499                     ; 1019 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7499                     ; 1020 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7499                     ; 1021 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7501  155a 270d          	jreq	L1214
7503  155c 7b02          	ld	a,(OFST+0,sp)
7504  155e a105          	cp	a,#5
7505  1560 2407          	jruge	L1214
7507  1562 c60001        	ld	a,_MD_Test_Pg
7508  1565 a102          	cp	a,#2
7509  1567 2722          	jreq	L7114
7510  1569               L1214:
7512  1569 7b02          	ld	a,(OFST+0,sp)
7513  156b a105          	cp	a,#5
7514  156d 250d          	jrult	L7214
7516  156f a109          	cp	a,#9
7517  1571 2409          	jruge	L7214
7519  1573 c60001        	ld	a,_MD_Test_Pg
7520  1576 a103          	cp	a,#3
7521  1578 2711          	jreq	L7114
7522  157a 7b02          	ld	a,(OFST+0,sp)
7523  157c               L7214:
7525  157c a109          	cp	a,#9
7526  157e 2524          	jrult	L3114
7528  1580 a10d          	cp	a,#13
7529  1582 2420          	jruge	L3114
7531  1584 c60001        	ld	a,_MD_Test_Pg
7532  1587 a104          	cp	a,#4
7533  1589 2619          	jrne	L3114
7534  158b               L7114:
7535                     ; 1022 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7537  158b 7b02          	ld	a,(OFST+0,sp)
7538  158d 5f            	clrw	x
7539  158e 97            	ld	xl,a
7540  158f 5a            	decw	x
7541  1590 a604          	ld	a,#4
7542  1592 8d000000      	callf	d_smodx
7544  1596 d60000        	ld	a,(_LCD_Line,x)
7545  1599 8d000000      	callf	f_Set_LCD_Address
7547                     ; 1023 					Display_LCD_String("Flt_LV_High ");
7549  159d ae0299        	ldw	x,#L7162
7550  15a0 8d000000      	callf	f_Display_LCD_String
7552  15a4               L3114:
7553                     ; 1027 			if(MD_ID306_Data[1] & 0x04){
7555  15a4 720500124c    	btjf	_MD_ID306_Data+1,#2,L3314
7556                     ; 1028 				fault_cnt++;
7558  15a9 0c02          	inc	(OFST+0,sp)
7559                     ; 1029 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7559                     ; 1030 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7559                     ; 1031 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7561  15ab 270d          	jreq	L1414
7563  15ad 7b02          	ld	a,(OFST+0,sp)
7564  15af a105          	cp	a,#5
7565  15b1 2407          	jruge	L1414
7567  15b3 c60001        	ld	a,_MD_Test_Pg
7568  15b6 a102          	cp	a,#2
7569  15b8 2722          	jreq	L7314
7570  15ba               L1414:
7572  15ba 7b02          	ld	a,(OFST+0,sp)
7573  15bc a105          	cp	a,#5
7574  15be 250d          	jrult	L7414
7576  15c0 a109          	cp	a,#9
7577  15c2 2409          	jruge	L7414
7579  15c4 c60001        	ld	a,_MD_Test_Pg
7580  15c7 a103          	cp	a,#3
7581  15c9 2711          	jreq	L7314
7582  15cb 7b02          	ld	a,(OFST+0,sp)
7583  15cd               L7414:
7585  15cd a109          	cp	a,#9
7586  15cf 2524          	jrult	L3314
7588  15d1 a10d          	cp	a,#13
7589  15d3 2420          	jruge	L3314
7591  15d5 c60001        	ld	a,_MD_Test_Pg
7592  15d8 a104          	cp	a,#4
7593  15da 2619          	jrne	L3314
7594  15dc               L7314:
7595                     ; 1032 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7597  15dc 7b02          	ld	a,(OFST+0,sp)
7598  15de 5f            	clrw	x
7599  15df 97            	ld	xl,a
7600  15e0 5a            	decw	x
7601  15e1 a604          	ld	a,#4
7602  15e3 8d000000      	callf	d_smodx
7604  15e7 d60000        	ld	a,(_LCD_Line,x)
7605  15ea 8d000000      	callf	f_Set_LCD_Address
7607                     ; 1033 					Display_LCD_String("Flt_HV_Low ");
7609  15ee ae028d        	ldw	x,#L1462
7610  15f1 8d000000      	callf	f_Display_LCD_String
7612  15f5               L3314:
7613                     ; 1037 			if(MD_ID306_Data[1] & 0x08){
7615  15f5 720700124c    	btjf	_MD_ID306_Data+1,#3,L3514
7616                     ; 1038 				fault_cnt++;
7618  15fa 0c02          	inc	(OFST+0,sp)
7619                     ; 1039 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7619                     ; 1040 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7619                     ; 1041 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7621  15fc 270d          	jreq	L1614
7623  15fe 7b02          	ld	a,(OFST+0,sp)
7624  1600 a105          	cp	a,#5
7625  1602 2407          	jruge	L1614
7627  1604 c60001        	ld	a,_MD_Test_Pg
7628  1607 a102          	cp	a,#2
7629  1609 2722          	jreq	L7514
7630  160b               L1614:
7632  160b 7b02          	ld	a,(OFST+0,sp)
7633  160d a105          	cp	a,#5
7634  160f 250d          	jrult	L7614
7636  1611 a109          	cp	a,#9
7637  1613 2409          	jruge	L7614
7639  1615 c60001        	ld	a,_MD_Test_Pg
7640  1618 a103          	cp	a,#3
7641  161a 2711          	jreq	L7514
7642  161c 7b02          	ld	a,(OFST+0,sp)
7643  161e               L7614:
7645  161e a109          	cp	a,#9
7646  1620 2524          	jrult	L3514
7648  1622 a10d          	cp	a,#13
7649  1624 2420          	jruge	L3514
7651  1626 c60001        	ld	a,_MD_Test_Pg
7652  1629 a104          	cp	a,#4
7653  162b 2619          	jrne	L3514
7654  162d               L7514:
7655                     ; 1042 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7657  162d 7b02          	ld	a,(OFST+0,sp)
7658  162f 5f            	clrw	x
7659  1630 97            	ld	xl,a
7660  1631 5a            	decw	x
7661  1632 a604          	ld	a,#4
7662  1634 8d000000      	callf	d_smodx
7664  1638 d60000        	ld	a,(_LCD_Line,x)
7665  163b 8d000000      	callf	f_Set_LCD_Address
7667                     ; 1043 					Display_LCD_String("Flt_HV_High ");
7669  163f ae0280        	ldw	x,#L3662
7670  1642 8d000000      	callf	f_Display_LCD_String
7672  1646               L3514:
7673                     ; 1047 			if(MD_ID306_Data[1] & 0x10){
7675  1646 720900124c    	btjf	_MD_ID306_Data+1,#4,L3714
7676                     ; 1048 				fault_cnt++;
7678  164b 0c02          	inc	(OFST+0,sp)
7679                     ; 1049 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7679                     ; 1050 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7679                     ; 1051 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7681  164d 270d          	jreq	L1024
7683  164f 7b02          	ld	a,(OFST+0,sp)
7684  1651 a105          	cp	a,#5
7685  1653 2407          	jruge	L1024
7687  1655 c60001        	ld	a,_MD_Test_Pg
7688  1658 a102          	cp	a,#2
7689  165a 2722          	jreq	L7714
7690  165c               L1024:
7692  165c 7b02          	ld	a,(OFST+0,sp)
7693  165e a105          	cp	a,#5
7694  1660 250d          	jrult	L7024
7696  1662 a109          	cp	a,#9
7697  1664 2409          	jruge	L7024
7699  1666 c60001        	ld	a,_MD_Test_Pg
7700  1669 a103          	cp	a,#3
7701  166b 2711          	jreq	L7714
7702  166d 7b02          	ld	a,(OFST+0,sp)
7703  166f               L7024:
7705  166f a109          	cp	a,#9
7706  1671 2524          	jrult	L3714
7708  1673 a10d          	cp	a,#13
7709  1675 2420          	jruge	L3714
7711  1677 c60001        	ld	a,_MD_Test_Pg
7712  167a a104          	cp	a,#4
7713  167c 2619          	jrne	L3714
7714  167e               L7714:
7715                     ; 1052 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7717  167e 7b02          	ld	a,(OFST+0,sp)
7718  1680 5f            	clrw	x
7719  1681 97            	ld	xl,a
7720  1682 5a            	decw	x
7721  1683 a604          	ld	a,#4
7722  1685 8d000000      	callf	d_smodx
7724  1689 d60000        	ld	a,(_LCD_Line,x)
7725  168c 8d000000      	callf	f_Set_LCD_Address
7727                     ; 1053 					Display_LCD_String("Flt_Over_Cur ");
7729  1690 ae0272        	ldw	x,#L5072
7730  1693 8d000000      	callf	f_Display_LCD_String
7732  1697               L3714:
7733                     ; 1057 			if(MD_ID306_Data[1] & 0x80){
7735  1697 720f00124c    	btjf	_MD_ID306_Data+1,#7,L3124
7736                     ; 1058 				fault_cnt++;
7738  169c 0c02          	inc	(OFST+0,sp)
7739                     ; 1059 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7739                     ; 1060 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7739                     ; 1061 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7741  169e 270d          	jreq	L1224
7743  16a0 7b02          	ld	a,(OFST+0,sp)
7744  16a2 a105          	cp	a,#5
7745  16a4 2407          	jruge	L1224
7747  16a6 c60001        	ld	a,_MD_Test_Pg
7748  16a9 a102          	cp	a,#2
7749  16ab 2722          	jreq	L7124
7750  16ad               L1224:
7752  16ad 7b02          	ld	a,(OFST+0,sp)
7753  16af a105          	cp	a,#5
7754  16b1 250d          	jrult	L7224
7756  16b3 a109          	cp	a,#9
7757  16b5 2409          	jruge	L7224
7759  16b7 c60001        	ld	a,_MD_Test_Pg
7760  16ba a103          	cp	a,#3
7761  16bc 2711          	jreq	L7124
7762  16be 7b02          	ld	a,(OFST+0,sp)
7763  16c0               L7224:
7765  16c0 a109          	cp	a,#9
7766  16c2 2524          	jrult	L3124
7768  16c4 a10d          	cp	a,#13
7769  16c6 2420          	jruge	L3124
7771  16c8 c60001        	ld	a,_MD_Test_Pg
7772  16cb a104          	cp	a,#4
7773  16cd 2619          	jrne	L3124
7774  16cf               L7124:
7775                     ; 1062 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7777  16cf 7b02          	ld	a,(OFST+0,sp)
7778  16d1 5f            	clrw	x
7779  16d2 97            	ld	xl,a
7780  16d3 5a            	decw	x
7781  16d4 a604          	ld	a,#4
7782  16d6 8d000000      	callf	d_smodx
7784  16da d60000        	ld	a,(_LCD_Line,x)
7785  16dd 8d000000      	callf	f_Set_LCD_Address
7787                     ; 1063 					Display_LCD_String("Flt_Over_LCore ");
7789  16e1 ae01d8        	ldw	x,#L3324
7790  16e4 8d000000      	callf	f_Display_LCD_String
7792  16e8               L3124:
7793                     ; 1067 			if(MD_ID306_Data[2] & 0x04){
7795  16e8 720500134c    	btjf	_MD_ID306_Data+2,#2,L5324
7796                     ; 1068 				fault_cnt++;
7798  16ed 0c02          	inc	(OFST+0,sp)
7799                     ; 1069 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7799                     ; 1070 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7799                     ; 1071 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7801  16ef 270d          	jreq	L3424
7803  16f1 7b02          	ld	a,(OFST+0,sp)
7804  16f3 a105          	cp	a,#5
7805  16f5 2407          	jruge	L3424
7807  16f7 c60001        	ld	a,_MD_Test_Pg
7808  16fa a102          	cp	a,#2
7809  16fc 2722          	jreq	L1424
7810  16fe               L3424:
7812  16fe 7b02          	ld	a,(OFST+0,sp)
7813  1700 a105          	cp	a,#5
7814  1702 250d          	jrult	L1524
7816  1704 a109          	cp	a,#9
7817  1706 2409          	jruge	L1524
7819  1708 c60001        	ld	a,_MD_Test_Pg
7820  170b a103          	cp	a,#3
7821  170d 2711          	jreq	L1424
7822  170f 7b02          	ld	a,(OFST+0,sp)
7823  1711               L1524:
7825  1711 a109          	cp	a,#9
7826  1713 2524          	jrult	L5324
7828  1715 a10d          	cp	a,#13
7829  1717 2420          	jruge	L5324
7831  1719 c60001        	ld	a,_MD_Test_Pg
7832  171c a104          	cp	a,#4
7833  171e 2619          	jrne	L5324
7834  1720               L1424:
7835                     ; 1072 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7837  1720 7b02          	ld	a,(OFST+0,sp)
7838  1722 5f            	clrw	x
7839  1723 97            	ld	xl,a
7840  1724 5a            	decw	x
7841  1725 a604          	ld	a,#4
7842  1727 8d000000      	callf	d_smodx
7844  172b d60000        	ld	a,(_LCD_Line,x)
7845  172e 8d000000      	callf	f_Set_LCD_Address
7847                     ; 1073 					Display_LCD_String("Flt_Over_RCore ");
7849  1732 ae01c8        	ldw	x,#L5524
7850  1735 8d000000      	callf	f_Display_LCD_String
7852  1739               L5324:
7853                     ; 1077 			if(MD_ID306_Data[2] & 0x01){
7855  1739 720100134c    	btjf	_MD_ID306_Data+2,#0,L7524
7856                     ; 1078 				fault_cnt++;
7858  173e 0c02          	inc	(OFST+0,sp)
7859                     ; 1079 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7859                     ; 1080 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7859                     ; 1081 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7861  1740 270d          	jreq	L5624
7863  1742 7b02          	ld	a,(OFST+0,sp)
7864  1744 a105          	cp	a,#5
7865  1746 2407          	jruge	L5624
7867  1748 c60001        	ld	a,_MD_Test_Pg
7868  174b a102          	cp	a,#2
7869  174d 2722          	jreq	L3624
7870  174f               L5624:
7872  174f 7b02          	ld	a,(OFST+0,sp)
7873  1751 a105          	cp	a,#5
7874  1753 250d          	jrult	L3724
7876  1755 a109          	cp	a,#9
7877  1757 2409          	jruge	L3724
7879  1759 c60001        	ld	a,_MD_Test_Pg
7880  175c a103          	cp	a,#3
7881  175e 2711          	jreq	L3624
7882  1760 7b02          	ld	a,(OFST+0,sp)
7883  1762               L3724:
7885  1762 a109          	cp	a,#9
7886  1764 2524          	jrult	L7524
7888  1766 a10d          	cp	a,#13
7889  1768 2420          	jruge	L7524
7891  176a c60001        	ld	a,_MD_Test_Pg
7892  176d a104          	cp	a,#4
7893  176f 2619          	jrne	L7524
7894  1771               L3624:
7895                     ; 1082 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7897  1771 7b02          	ld	a,(OFST+0,sp)
7898  1773 5f            	clrw	x
7899  1774 97            	ld	xl,a
7900  1775 5a            	decw	x
7901  1776 a604          	ld	a,#4
7902  1778 8d000000      	callf	d_smodx
7904  177c d60000        	ld	a,(_LCD_Line,x)
7905  177f 8d000000      	callf	f_Set_LCD_Address
7907                     ; 1083 					Display_LCD_String("Flt_Over_PCB1 ");
7909  1783 ae01b9        	ldw	x,#L7724
7910  1786 8d000000      	callf	f_Display_LCD_String
7912  178a               L7524:
7913                     ; 1087 			if(MD_ID306_Data[2] & 0x02){
7915  178a 720300134c    	btjf	_MD_ID306_Data+2,#1,L1034
7916                     ; 1088 				fault_cnt++;
7918  178f 0c02          	inc	(OFST+0,sp)
7919                     ; 1089 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7919                     ; 1090 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7919                     ; 1091 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7921  1791 270d          	jreq	L7034
7923  1793 7b02          	ld	a,(OFST+0,sp)
7924  1795 a105          	cp	a,#5
7925  1797 2407          	jruge	L7034
7927  1799 c60001        	ld	a,_MD_Test_Pg
7928  179c a102          	cp	a,#2
7929  179e 2722          	jreq	L5034
7930  17a0               L7034:
7932  17a0 7b02          	ld	a,(OFST+0,sp)
7933  17a2 a105          	cp	a,#5
7934  17a4 250d          	jrult	L5134
7936  17a6 a109          	cp	a,#9
7937  17a8 2409          	jruge	L5134
7939  17aa c60001        	ld	a,_MD_Test_Pg
7940  17ad a103          	cp	a,#3
7941  17af 2711          	jreq	L5034
7942  17b1 7b02          	ld	a,(OFST+0,sp)
7943  17b3               L5134:
7945  17b3 a109          	cp	a,#9
7946  17b5 2524          	jrult	L1034
7948  17b7 a10d          	cp	a,#13
7949  17b9 2420          	jruge	L1034
7951  17bb c60001        	ld	a,_MD_Test_Pg
7952  17be a104          	cp	a,#4
7953  17c0 2619          	jrne	L1034
7954  17c2               L5034:
7955                     ; 1092 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
7957  17c2 7b02          	ld	a,(OFST+0,sp)
7958  17c4 5f            	clrw	x
7959  17c5 97            	ld	xl,a
7960  17c6 5a            	decw	x
7961  17c7 a604          	ld	a,#4
7962  17c9 8d000000      	callf	d_smodx
7964  17cd d60000        	ld	a,(_LCD_Line,x)
7965  17d0 8d000000      	callf	f_Set_LCD_Address
7967                     ; 1093 					Display_LCD_String("Flt_Over_PCB2 ");
7969  17d4 ae01aa        	ldw	x,#L1234
7970  17d7 8d000000      	callf	f_Display_LCD_String
7972  17db               L1034:
7973                     ; 1097 			if(MD_ID306_Data[2] & 0x08){
7975  17db 720700134c    	btjf	_MD_ID306_Data+2,#3,L3234
7976                     ; 1098 				fault_cnt++;
7978  17e0 0c02          	inc	(OFST+0,sp)
7979                     ; 1099 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
7979                     ; 1100 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
7979                     ; 1101 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
7981  17e2 270d          	jreq	L1334
7983  17e4 7b02          	ld	a,(OFST+0,sp)
7984  17e6 a105          	cp	a,#5
7985  17e8 2407          	jruge	L1334
7987  17ea c60001        	ld	a,_MD_Test_Pg
7988  17ed a102          	cp	a,#2
7989  17ef 2722          	jreq	L7234
7990  17f1               L1334:
7992  17f1 7b02          	ld	a,(OFST+0,sp)
7993  17f3 a105          	cp	a,#5
7994  17f5 250d          	jrult	L7334
7996  17f7 a109          	cp	a,#9
7997  17f9 2409          	jruge	L7334
7999  17fb c60001        	ld	a,_MD_Test_Pg
8000  17fe a103          	cp	a,#3
8001  1800 2711          	jreq	L7234
8002  1802 7b02          	ld	a,(OFST+0,sp)
8003  1804               L7334:
8005  1804 a109          	cp	a,#9
8006  1806 2524          	jrult	L3234
8008  1808 a10d          	cp	a,#13
8009  180a 2420          	jruge	L3234
8011  180c c60001        	ld	a,_MD_Test_Pg
8012  180f a104          	cp	a,#4
8013  1811 2619          	jrne	L3234
8014  1813               L7234:
8015                     ; 1102 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8017  1813 7b02          	ld	a,(OFST+0,sp)
8018  1815 5f            	clrw	x
8019  1816 97            	ld	xl,a
8020  1817 5a            	decw	x
8021  1818 a604          	ld	a,#4
8022  181a 8d000000      	callf	d_smodx
8024  181e d60000        	ld	a,(_LCD_Line,x)
8025  1821 8d000000      	callf	f_Set_LCD_Address
8027                     ; 1103 					Display_LCD_String("Flt_Over_IGBT1 ");
8029  1825 ae019a        	ldw	x,#L3434
8030  1828 8d000000      	callf	f_Display_LCD_String
8032  182c               L3234:
8033                     ; 1107 			if(MD_ID306_Data[2] & 0x10){
8035  182c 720900134c    	btjf	_MD_ID306_Data+2,#4,L5434
8036                     ; 1108 				fault_cnt++;
8038  1831 0c02          	inc	(OFST+0,sp)
8039                     ; 1109 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8039                     ; 1110 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8039                     ; 1111 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8041  1833 270d          	jreq	L3534
8043  1835 7b02          	ld	a,(OFST+0,sp)
8044  1837 a105          	cp	a,#5
8045  1839 2407          	jruge	L3534
8047  183b c60001        	ld	a,_MD_Test_Pg
8048  183e a102          	cp	a,#2
8049  1840 2722          	jreq	L1534
8050  1842               L3534:
8052  1842 7b02          	ld	a,(OFST+0,sp)
8053  1844 a105          	cp	a,#5
8054  1846 250d          	jrult	L1634
8056  1848 a109          	cp	a,#9
8057  184a 2409          	jruge	L1634
8059  184c c60001        	ld	a,_MD_Test_Pg
8060  184f a103          	cp	a,#3
8061  1851 2711          	jreq	L1534
8062  1853 7b02          	ld	a,(OFST+0,sp)
8063  1855               L1634:
8065  1855 a109          	cp	a,#9
8066  1857 2524          	jrult	L5434
8068  1859 a10d          	cp	a,#13
8069  185b 2420          	jruge	L5434
8071  185d c60001        	ld	a,_MD_Test_Pg
8072  1860 a104          	cp	a,#4
8073  1862 2619          	jrne	L5434
8074  1864               L1534:
8075                     ; 1112 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8077  1864 7b02          	ld	a,(OFST+0,sp)
8078  1866 5f            	clrw	x
8079  1867 97            	ld	xl,a
8080  1868 5a            	decw	x
8081  1869 a604          	ld	a,#4
8082  186b 8d000000      	callf	d_smodx
8084  186f d60000        	ld	a,(_LCD_Line,x)
8085  1872 8d000000      	callf	f_Set_LCD_Address
8087                     ; 1113 					Display_LCD_String("Flt_Over_IGBT2 ");
8089  1876 ae018a        	ldw	x,#L5634
8090  1879 8d000000      	callf	f_Display_LCD_String
8092  187d               L5434:
8093                     ; 1117 			if(MD_ID306_Data[3] & 0x02){
8095  187d 720300144c    	btjf	_MD_ID306_Data+3,#1,L7634
8096                     ; 1118 				fault_cnt++;
8098  1882 0c02          	inc	(OFST+0,sp)
8099                     ; 1119 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8099                     ; 1120 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8099                     ; 1121 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8101  1884 270d          	jreq	L5734
8103  1886 7b02          	ld	a,(OFST+0,sp)
8104  1888 a105          	cp	a,#5
8105  188a 2407          	jruge	L5734
8107  188c c60001        	ld	a,_MD_Test_Pg
8108  188f a102          	cp	a,#2
8109  1891 2722          	jreq	L3734
8110  1893               L5734:
8112  1893 7b02          	ld	a,(OFST+0,sp)
8113  1895 a105          	cp	a,#5
8114  1897 250d          	jrult	L3044
8116  1899 a109          	cp	a,#9
8117  189b 2409          	jruge	L3044
8119  189d c60001        	ld	a,_MD_Test_Pg
8120  18a0 a103          	cp	a,#3
8121  18a2 2711          	jreq	L3734
8122  18a4 7b02          	ld	a,(OFST+0,sp)
8123  18a6               L3044:
8125  18a6 a109          	cp	a,#9
8126  18a8 2524          	jrult	L7634
8128  18aa a10d          	cp	a,#13
8129  18ac 2420          	jruge	L7634
8131  18ae c60001        	ld	a,_MD_Test_Pg
8132  18b1 a104          	cp	a,#4
8133  18b3 2619          	jrne	L7634
8134  18b5               L3734:
8135                     ; 1122 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8137  18b5 7b02          	ld	a,(OFST+0,sp)
8138  18b7 5f            	clrw	x
8139  18b8 97            	ld	xl,a
8140  18b9 5a            	decw	x
8141  18ba a604          	ld	a,#4
8142  18bc 8d000000      	callf	d_smodx
8144  18c0 d60000        	ld	a,(_LCD_Line,x)
8145  18c3 8d000000      	callf	f_Set_LCD_Address
8147                     ; 1123 					Display_LCD_String("Flt_Frame_TOUT ");
8149  18c7 ae0253        	ldw	x,#L1772
8150  18ca 8d000000      	callf	f_Display_LCD_String
8152  18ce               L7634:
8153                     ; 1127 			if(MD_ID306_Data[3] & 0x04){
8155  18ce 720500144c    	btjf	_MD_ID306_Data+3,#2,L7044
8156                     ; 1128 				fault_cnt++;
8158  18d3 0c02          	inc	(OFST+0,sp)
8159                     ; 1129 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8159                     ; 1130 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8159                     ; 1131 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8161  18d5 270d          	jreq	L5144
8163  18d7 7b02          	ld	a,(OFST+0,sp)
8164  18d9 a105          	cp	a,#5
8165  18db 2407          	jruge	L5144
8167  18dd c60001        	ld	a,_MD_Test_Pg
8168  18e0 a102          	cp	a,#2
8169  18e2 2722          	jreq	L3144
8170  18e4               L5144:
8172  18e4 7b02          	ld	a,(OFST+0,sp)
8173  18e6 a105          	cp	a,#5
8174  18e8 250d          	jrult	L3244
8176  18ea a109          	cp	a,#9
8177  18ec 2409          	jruge	L3244
8179  18ee c60001        	ld	a,_MD_Test_Pg
8180  18f1 a103          	cp	a,#3
8181  18f3 2711          	jreq	L3144
8182  18f5 7b02          	ld	a,(OFST+0,sp)
8183  18f7               L3244:
8185  18f7 a109          	cp	a,#9
8186  18f9 2524          	jrult	L7044
8188  18fb a10d          	cp	a,#13
8189  18fd 2420          	jruge	L7044
8191  18ff c60001        	ld	a,_MD_Test_Pg
8192  1902 a104          	cp	a,#4
8193  1904 2619          	jrne	L7044
8194  1906               L3144:
8195                     ; 1132 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8197  1906 7b02          	ld	a,(OFST+0,sp)
8198  1908 5f            	clrw	x
8199  1909 97            	ld	xl,a
8200  190a 5a            	decw	x
8201  190b a604          	ld	a,#4
8202  190d 8d000000      	callf	d_smodx
8204  1911 d60000        	ld	a,(_LCD_Line,x)
8205  1914 8d000000      	callf	f_Set_LCD_Address
8207                     ; 1133 					Display_LCD_String("Flt_PTC_Mistch ");
8209  1918 ae017a        	ldw	x,#L7244
8210  191b 8d000000      	callf	f_Display_LCD_String
8212  191f               L7044:
8213                     ; 1137 			if(MD_ID306_Data[3] & 0x08){
8215  191f 720700144c    	btjf	_MD_ID306_Data+3,#3,L1344
8216                     ; 1138 				fault_cnt++;
8218  1924 0c02          	inc	(OFST+0,sp)
8219                     ; 1139 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8219                     ; 1140 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8219                     ; 1141 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8221  1926 270d          	jreq	L7344
8223  1928 7b02          	ld	a,(OFST+0,sp)
8224  192a a105          	cp	a,#5
8225  192c 2407          	jruge	L7344
8227  192e c60001        	ld	a,_MD_Test_Pg
8228  1931 a102          	cp	a,#2
8229  1933 2722          	jreq	L5344
8230  1935               L7344:
8232  1935 7b02          	ld	a,(OFST+0,sp)
8233  1937 a105          	cp	a,#5
8234  1939 250d          	jrult	L5444
8236  193b a109          	cp	a,#9
8237  193d 2409          	jruge	L5444
8239  193f c60001        	ld	a,_MD_Test_Pg
8240  1942 a103          	cp	a,#3
8241  1944 2711          	jreq	L5344
8242  1946 7b02          	ld	a,(OFST+0,sp)
8243  1948               L5444:
8245  1948 a109          	cp	a,#9
8246  194a 2524          	jrult	L1344
8248  194c a10d          	cp	a,#13
8249  194e 2420          	jruge	L1344
8251  1950 c60001        	ld	a,_MD_Test_Pg
8252  1953 a104          	cp	a,#4
8253  1955 2619          	jrne	L1344
8254  1957               L5344:
8255                     ; 1142 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8257  1957 7b02          	ld	a,(OFST+0,sp)
8258  1959 5f            	clrw	x
8259  195a 97            	ld	xl,a
8260  195b 5a            	decw	x
8261  195c a604          	ld	a,#4
8262  195e 8d000000      	callf	d_smodx
8264  1962 d60000        	ld	a,(_LCD_Line,x)
8265  1965 8d000000      	callf	f_Set_LCD_Address
8267                     ; 1143 					Display_LCD_String("Fail_OPT_IGBT1 ");
8269  1969 ae016a        	ldw	x,#L1544
8270  196c 8d000000      	callf	f_Display_LCD_String
8272  1970               L1344:
8273                     ; 1147 			if(MD_ID306_Data[3] & 0x10){
8275  1970 720900144c    	btjf	_MD_ID306_Data+3,#4,L3544
8276                     ; 1148 				fault_cnt++;
8278  1975 0c02          	inc	(OFST+0,sp)
8279                     ; 1149 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8279                     ; 1150 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8279                     ; 1151 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8281  1977 270d          	jreq	L1644
8283  1979 7b02          	ld	a,(OFST+0,sp)
8284  197b a105          	cp	a,#5
8285  197d 2407          	jruge	L1644
8287  197f c60001        	ld	a,_MD_Test_Pg
8288  1982 a102          	cp	a,#2
8289  1984 2722          	jreq	L7544
8290  1986               L1644:
8292  1986 7b02          	ld	a,(OFST+0,sp)
8293  1988 a105          	cp	a,#5
8294  198a 250d          	jrult	L7644
8296  198c a109          	cp	a,#9
8297  198e 2409          	jruge	L7644
8299  1990 c60001        	ld	a,_MD_Test_Pg
8300  1993 a103          	cp	a,#3
8301  1995 2711          	jreq	L7544
8302  1997 7b02          	ld	a,(OFST+0,sp)
8303  1999               L7644:
8305  1999 a109          	cp	a,#9
8306  199b 2524          	jrult	L3544
8308  199d a10d          	cp	a,#13
8309  199f 2420          	jruge	L3544
8311  19a1 c60001        	ld	a,_MD_Test_Pg
8312  19a4 a104          	cp	a,#4
8313  19a6 2619          	jrne	L3544
8314  19a8               L7544:
8315                     ; 1152 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8317  19a8 7b02          	ld	a,(OFST+0,sp)
8318  19aa 5f            	clrw	x
8319  19ab 97            	ld	xl,a
8320  19ac 5a            	decw	x
8321  19ad a604          	ld	a,#4
8322  19af 8d000000      	callf	d_smodx
8324  19b3 d60000        	ld	a,(_LCD_Line,x)
8325  19b6 8d000000      	callf	f_Set_LCD_Address
8327                     ; 1153 					Display_LCD_String("Fail_STT_IGBT1 ");
8329  19ba ae015a        	ldw	x,#L3744
8330  19bd 8d000000      	callf	f_Display_LCD_String
8332  19c1               L3544:
8333                     ; 1157 			if(MD_ID306_Data[3] & 0x20){
8335  19c1 720b00144c    	btjf	_MD_ID306_Data+3,#5,L5744
8336                     ; 1158 				fault_cnt++;
8338  19c6 0c02          	inc	(OFST+0,sp)
8339                     ; 1159 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8339                     ; 1160 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8339                     ; 1161 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8341  19c8 270d          	jreq	L3054
8343  19ca 7b02          	ld	a,(OFST+0,sp)
8344  19cc a105          	cp	a,#5
8345  19ce 2407          	jruge	L3054
8347  19d0 c60001        	ld	a,_MD_Test_Pg
8348  19d3 a102          	cp	a,#2
8349  19d5 2722          	jreq	L1054
8350  19d7               L3054:
8352  19d7 7b02          	ld	a,(OFST+0,sp)
8353  19d9 a105          	cp	a,#5
8354  19db 250d          	jrult	L1154
8356  19dd a109          	cp	a,#9
8357  19df 2409          	jruge	L1154
8359  19e1 c60001        	ld	a,_MD_Test_Pg
8360  19e4 a103          	cp	a,#3
8361  19e6 2711          	jreq	L1054
8362  19e8 7b02          	ld	a,(OFST+0,sp)
8363  19ea               L1154:
8365  19ea a109          	cp	a,#9
8366  19ec 2524          	jrult	L5744
8368  19ee a10d          	cp	a,#13
8369  19f0 2420          	jruge	L5744
8371  19f2 c60001        	ld	a,_MD_Test_Pg
8372  19f5 a104          	cp	a,#4
8373  19f7 2619          	jrne	L5744
8374  19f9               L1054:
8375                     ; 1162 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8377  19f9 7b02          	ld	a,(OFST+0,sp)
8378  19fb 5f            	clrw	x
8379  19fc 97            	ld	xl,a
8380  19fd 5a            	decw	x
8381  19fe a604          	ld	a,#4
8382  1a00 8d000000      	callf	d_smodx
8384  1a04 d60000        	ld	a,(_LCD_Line,x)
8385  1a07 8d000000      	callf	f_Set_LCD_Address
8387                     ; 1163 					Display_LCD_String("Fail_OPT_IGBT2 ");
8389  1a0b ae014a        	ldw	x,#L5154
8390  1a0e 8d000000      	callf	f_Display_LCD_String
8392  1a12               L5744:
8393                     ; 1167 			if(MD_ID306_Data[3] & 0x40){
8395  1a12 720d00144c    	btjf	_MD_ID306_Data+3,#6,L7154
8396                     ; 1168 				fault_cnt++;
8398  1a17 0c02          	inc	(OFST+0,sp)
8399                     ; 1169 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8399                     ; 1170 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8399                     ; 1171 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8401  1a19 270d          	jreq	L5254
8403  1a1b 7b02          	ld	a,(OFST+0,sp)
8404  1a1d a105          	cp	a,#5
8405  1a1f 2407          	jruge	L5254
8407  1a21 c60001        	ld	a,_MD_Test_Pg
8408  1a24 a102          	cp	a,#2
8409  1a26 2722          	jreq	L3254
8410  1a28               L5254:
8412  1a28 7b02          	ld	a,(OFST+0,sp)
8413  1a2a a105          	cp	a,#5
8414  1a2c 250d          	jrult	L3354
8416  1a2e a109          	cp	a,#9
8417  1a30 2409          	jruge	L3354
8419  1a32 c60001        	ld	a,_MD_Test_Pg
8420  1a35 a103          	cp	a,#3
8421  1a37 2711          	jreq	L3254
8422  1a39 7b02          	ld	a,(OFST+0,sp)
8423  1a3b               L3354:
8425  1a3b a109          	cp	a,#9
8426  1a3d 2524          	jrult	L7154
8428  1a3f a10d          	cp	a,#13
8429  1a41 2420          	jruge	L7154
8431  1a43 c60001        	ld	a,_MD_Test_Pg
8432  1a46 a104          	cp	a,#4
8433  1a48 2619          	jrne	L7154
8434  1a4a               L3254:
8435                     ; 1172 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8437  1a4a 7b02          	ld	a,(OFST+0,sp)
8438  1a4c 5f            	clrw	x
8439  1a4d 97            	ld	xl,a
8440  1a4e 5a            	decw	x
8441  1a4f a604          	ld	a,#4
8442  1a51 8d000000      	callf	d_smodx
8444  1a55 d60000        	ld	a,(_LCD_Line,x)
8445  1a58 8d000000      	callf	f_Set_LCD_Address
8447                     ; 1173 					Display_LCD_String("Fail_STT_IGBT2 ");
8449  1a5c ae013a        	ldw	x,#L7354
8450  1a5f 8d000000      	callf	f_Display_LCD_String
8452  1a63               L7154:
8453                     ; 1177 			if(MD_ID306_Data[4] & 0x01){
8455  1a63 720100154c    	btjf	_MD_ID306_Data+4,#0,L1454
8456                     ; 1178 				fault_cnt++;
8458  1a68 0c02          	inc	(OFST+0,sp)
8459                     ; 1179 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8459                     ; 1180 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8459                     ; 1181 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8461  1a6a 270d          	jreq	L7454
8463  1a6c 7b02          	ld	a,(OFST+0,sp)
8464  1a6e a105          	cp	a,#5
8465  1a70 2407          	jruge	L7454
8467  1a72 c60001        	ld	a,_MD_Test_Pg
8468  1a75 a102          	cp	a,#2
8469  1a77 2722          	jreq	L5454
8470  1a79               L7454:
8472  1a79 7b02          	ld	a,(OFST+0,sp)
8473  1a7b a105          	cp	a,#5
8474  1a7d 250d          	jrult	L5554
8476  1a7f a109          	cp	a,#9
8477  1a81 2409          	jruge	L5554
8479  1a83 c60001        	ld	a,_MD_Test_Pg
8480  1a86 a103          	cp	a,#3
8481  1a88 2711          	jreq	L5454
8482  1a8a 7b02          	ld	a,(OFST+0,sp)
8483  1a8c               L5554:
8485  1a8c a109          	cp	a,#9
8486  1a8e 2524          	jrult	L1454
8488  1a90 a10d          	cp	a,#13
8489  1a92 2420          	jruge	L1454
8491  1a94 c60001        	ld	a,_MD_Test_Pg
8492  1a97 a104          	cp	a,#4
8493  1a99 2619          	jrne	L1454
8494  1a9b               L5454:
8495                     ; 1182 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8497  1a9b 7b02          	ld	a,(OFST+0,sp)
8498  1a9d 5f            	clrw	x
8499  1a9e 97            	ld	xl,a
8500  1a9f 5a            	decw	x
8501  1aa0 a604          	ld	a,#4
8502  1aa2 8d000000      	callf	d_smodx
8504  1aa6 d60000        	ld	a,(_LCD_Line,x)
8505  1aa9 8d000000      	callf	f_Set_LCD_Address
8507                     ; 1183 					Display_LCD_String("Fail_HV_Sen ");
8509  1aad ae0246        	ldw	x,#L3103
8510  1ab0 8d000000      	callf	f_Display_LCD_String
8512  1ab4               L1454:
8513                     ; 1187 			if(MD_ID306_Data[4] & 0x02){
8515  1ab4 720300154c    	btjf	_MD_ID306_Data+4,#1,L1654
8516                     ; 1188 				fault_cnt++;
8518  1ab9 0c02          	inc	(OFST+0,sp)
8519                     ; 1189 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8519                     ; 1190 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8519                     ; 1191 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8521  1abb 270d          	jreq	L7654
8523  1abd 7b02          	ld	a,(OFST+0,sp)
8524  1abf a105          	cp	a,#5
8525  1ac1 2407          	jruge	L7654
8527  1ac3 c60001        	ld	a,_MD_Test_Pg
8528  1ac6 a102          	cp	a,#2
8529  1ac8 2722          	jreq	L5654
8530  1aca               L7654:
8532  1aca 7b02          	ld	a,(OFST+0,sp)
8533  1acc a105          	cp	a,#5
8534  1ace 250d          	jrult	L5754
8536  1ad0 a109          	cp	a,#9
8537  1ad2 2409          	jruge	L5754
8539  1ad4 c60001        	ld	a,_MD_Test_Pg
8540  1ad7 a103          	cp	a,#3
8541  1ad9 2711          	jreq	L5654
8542  1adb 7b02          	ld	a,(OFST+0,sp)
8543  1add               L5754:
8545  1add a109          	cp	a,#9
8546  1adf 2524          	jrult	L1654
8548  1ae1 a10d          	cp	a,#13
8549  1ae3 2420          	jruge	L1654
8551  1ae5 c60001        	ld	a,_MD_Test_Pg
8552  1ae8 a104          	cp	a,#4
8553  1aea 2619          	jrne	L1654
8554  1aec               L5654:
8555                     ; 1192 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8557  1aec 7b02          	ld	a,(OFST+0,sp)
8558  1aee 5f            	clrw	x
8559  1aef 97            	ld	xl,a
8560  1af0 5a            	decw	x
8561  1af1 a604          	ld	a,#4
8562  1af3 8d000000      	callf	d_smodx
8564  1af7 d60000        	ld	a,(_LCD_Line,x)
8565  1afa 8d000000      	callf	f_Set_LCD_Address
8567                     ; 1193 					Display_LCD_String("Fail_LV_Sen ");
8569  1afe ae0239        	ldw	x,#L5303
8570  1b01 8d000000      	callf	f_Display_LCD_String
8572  1b05               L1654:
8573                     ; 1197 			if(MD_ID306_Data[4] & 0x04){
8575  1b05 720500154c    	btjf	_MD_ID306_Data+4,#2,L1064
8576                     ; 1198 				fault_cnt++;
8578  1b0a 0c02          	inc	(OFST+0,sp)
8579                     ; 1199 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8579                     ; 1200 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8579                     ; 1201 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8581  1b0c 270d          	jreq	L7064
8583  1b0e 7b02          	ld	a,(OFST+0,sp)
8584  1b10 a105          	cp	a,#5
8585  1b12 2407          	jruge	L7064
8587  1b14 c60001        	ld	a,_MD_Test_Pg
8588  1b17 a102          	cp	a,#2
8589  1b19 2722          	jreq	L5064
8590  1b1b               L7064:
8592  1b1b 7b02          	ld	a,(OFST+0,sp)
8593  1b1d a105          	cp	a,#5
8594  1b1f 250d          	jrult	L5164
8596  1b21 a109          	cp	a,#9
8597  1b23 2409          	jruge	L5164
8599  1b25 c60001        	ld	a,_MD_Test_Pg
8600  1b28 a103          	cp	a,#3
8601  1b2a 2711          	jreq	L5064
8602  1b2c 7b02          	ld	a,(OFST+0,sp)
8603  1b2e               L5164:
8605  1b2e a109          	cp	a,#9
8606  1b30 2524          	jrult	L1064
8608  1b32 a10d          	cp	a,#13
8609  1b34 2420          	jruge	L1064
8611  1b36 c60001        	ld	a,_MD_Test_Pg
8612  1b39 a104          	cp	a,#4
8613  1b3b 2619          	jrne	L1064
8614  1b3d               L5064:
8615                     ; 1202 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8617  1b3d 7b02          	ld	a,(OFST+0,sp)
8618  1b3f 5f            	clrw	x
8619  1b40 97            	ld	xl,a
8620  1b41 5a            	decw	x
8621  1b42 a604          	ld	a,#4
8622  1b44 8d000000      	callf	d_smodx
8624  1b48 d60000        	ld	a,(_LCD_Line,x)
8625  1b4b 8d000000      	callf	f_Set_LCD_Address
8627                     ; 1203 					Display_LCD_String("Fail_Cur_Sen ");
8629  1b4f ae022b        	ldw	x,#L7503
8630  1b52 8d000000      	callf	f_Display_LCD_String
8632  1b56               L1064:
8633                     ; 1207 			if(MD_ID306_Data[4] & 0x20){
8635  1b56 720b00154c    	btjf	_MD_ID306_Data+4,#5,L1264
8636                     ; 1208 				fault_cnt++;
8638  1b5b 0c02          	inc	(OFST+0,sp)
8639                     ; 1209 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8639                     ; 1210 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8639                     ; 1211 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8641  1b5d 270d          	jreq	L7264
8643  1b5f 7b02          	ld	a,(OFST+0,sp)
8644  1b61 a105          	cp	a,#5
8645  1b63 2407          	jruge	L7264
8647  1b65 c60001        	ld	a,_MD_Test_Pg
8648  1b68 a102          	cp	a,#2
8649  1b6a 2722          	jreq	L5264
8650  1b6c               L7264:
8652  1b6c 7b02          	ld	a,(OFST+0,sp)
8653  1b6e a105          	cp	a,#5
8654  1b70 250d          	jrult	L5364
8656  1b72 a109          	cp	a,#9
8657  1b74 2409          	jruge	L5364
8659  1b76 c60001        	ld	a,_MD_Test_Pg
8660  1b79 a103          	cp	a,#3
8661  1b7b 2711          	jreq	L5264
8662  1b7d 7b02          	ld	a,(OFST+0,sp)
8663  1b7f               L5364:
8665  1b7f a109          	cp	a,#9
8666  1b81 2524          	jrult	L1264
8668  1b83 a10d          	cp	a,#13
8669  1b85 2420          	jruge	L1264
8671  1b87 c60001        	ld	a,_MD_Test_Pg
8672  1b8a a104          	cp	a,#4
8673  1b8c 2619          	jrne	L1264
8674  1b8e               L5264:
8675                     ; 1212 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8677  1b8e 7b02          	ld	a,(OFST+0,sp)
8678  1b90 5f            	clrw	x
8679  1b91 97            	ld	xl,a
8680  1b92 5a            	decw	x
8681  1b93 a604          	ld	a,#4
8682  1b95 8d000000      	callf	d_smodx
8684  1b99 d60000        	ld	a,(_LCD_Line,x)
8685  1b9c 8d000000      	callf	f_Set_LCD_Address
8687                     ; 1213 					Display_LCD_String("Fail_OPT_LCore ");
8689  1ba0 ae012a        	ldw	x,#L1464
8690  1ba3 8d000000      	callf	f_Display_LCD_String
8692  1ba7               L1264:
8693                     ; 1217 			if(MD_ID306_Data[4] & 0x40){
8695  1ba7 720d00154c    	btjf	_MD_ID306_Data+4,#6,L3464
8696                     ; 1218 				fault_cnt++;
8698  1bac 0c02          	inc	(OFST+0,sp)
8699                     ; 1219 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8699                     ; 1220 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8699                     ; 1221 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8701  1bae 270d          	jreq	L1564
8703  1bb0 7b02          	ld	a,(OFST+0,sp)
8704  1bb2 a105          	cp	a,#5
8705  1bb4 2407          	jruge	L1564
8707  1bb6 c60001        	ld	a,_MD_Test_Pg
8708  1bb9 a102          	cp	a,#2
8709  1bbb 2722          	jreq	L7464
8710  1bbd               L1564:
8712  1bbd 7b02          	ld	a,(OFST+0,sp)
8713  1bbf a105          	cp	a,#5
8714  1bc1 250d          	jrult	L7564
8716  1bc3 a109          	cp	a,#9
8717  1bc5 2409          	jruge	L7564
8719  1bc7 c60001        	ld	a,_MD_Test_Pg
8720  1bca a103          	cp	a,#3
8721  1bcc 2711          	jreq	L7464
8722  1bce 7b02          	ld	a,(OFST+0,sp)
8723  1bd0               L7564:
8725  1bd0 a109          	cp	a,#9
8726  1bd2 2524          	jrult	L3464
8728  1bd4 a10d          	cp	a,#13
8729  1bd6 2420          	jruge	L3464
8731  1bd8 c60001        	ld	a,_MD_Test_Pg
8732  1bdb a104          	cp	a,#4
8733  1bdd 2619          	jrne	L3464
8734  1bdf               L7464:
8735                     ; 1222 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8737  1bdf 7b02          	ld	a,(OFST+0,sp)
8738  1be1 5f            	clrw	x
8739  1be2 97            	ld	xl,a
8740  1be3 5a            	decw	x
8741  1be4 a604          	ld	a,#4
8742  1be6 8d000000      	callf	d_smodx
8744  1bea d60000        	ld	a,(_LCD_Line,x)
8745  1bed 8d000000      	callf	f_Set_LCD_Address
8747                     ; 1223 					Display_LCD_String("Fail_STT_LCore ");
8749  1bf1 ae011a        	ldw	x,#L3664
8750  1bf4 8d000000      	callf	f_Display_LCD_String
8752  1bf8               L3464:
8753                     ; 1227 			if(MD_ID306_Data[4] & 0x80){
8755  1bf8 720f00154c    	btjf	_MD_ID306_Data+4,#7,L5664
8756                     ; 1228 				fault_cnt++;
8758  1bfd 0c02          	inc	(OFST+0,sp)
8759                     ; 1229 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8759                     ; 1230 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8759                     ; 1231 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8761  1bff 270d          	jreq	L3764
8763  1c01 7b02          	ld	a,(OFST+0,sp)
8764  1c03 a105          	cp	a,#5
8765  1c05 2407          	jruge	L3764
8767  1c07 c60001        	ld	a,_MD_Test_Pg
8768  1c0a a102          	cp	a,#2
8769  1c0c 2722          	jreq	L1764
8770  1c0e               L3764:
8772  1c0e 7b02          	ld	a,(OFST+0,sp)
8773  1c10 a105          	cp	a,#5
8774  1c12 250d          	jrult	L1074
8776  1c14 a109          	cp	a,#9
8777  1c16 2409          	jruge	L1074
8779  1c18 c60001        	ld	a,_MD_Test_Pg
8780  1c1b a103          	cp	a,#3
8781  1c1d 2711          	jreq	L1764
8782  1c1f 7b02          	ld	a,(OFST+0,sp)
8783  1c21               L1074:
8785  1c21 a109          	cp	a,#9
8786  1c23 2524          	jrult	L5664
8788  1c25 a10d          	cp	a,#13
8789  1c27 2420          	jruge	L5664
8791  1c29 c60001        	ld	a,_MD_Test_Pg
8792  1c2c a104          	cp	a,#4
8793  1c2e 2619          	jrne	L5664
8794  1c30               L1764:
8795                     ; 1232 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8797  1c30 7b02          	ld	a,(OFST+0,sp)
8798  1c32 5f            	clrw	x
8799  1c33 97            	ld	xl,a
8800  1c34 5a            	decw	x
8801  1c35 a604          	ld	a,#4
8802  1c37 8d000000      	callf	d_smodx
8804  1c3b d60000        	ld	a,(_LCD_Line,x)
8805  1c3e 8d000000      	callf	f_Set_LCD_Address
8807                     ; 1233 					Display_LCD_String("Fail_OPT_PCB1 ");
8809  1c42 ae010b        	ldw	x,#L5074
8810  1c45 8d000000      	callf	f_Display_LCD_String
8812  1c49               L5664:
8813                     ; 1237 			if(MD_ID306_Data[5] & 0x01){
8815  1c49 720100164c    	btjf	_MD_ID306_Data+5,#0,L7074
8816                     ; 1238 				fault_cnt++;
8818  1c4e 0c02          	inc	(OFST+0,sp)
8819                     ; 1239 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8819                     ; 1240 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8819                     ; 1241 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8821  1c50 270d          	jreq	L5174
8823  1c52 7b02          	ld	a,(OFST+0,sp)
8824  1c54 a105          	cp	a,#5
8825  1c56 2407          	jruge	L5174
8827  1c58 c60001        	ld	a,_MD_Test_Pg
8828  1c5b a102          	cp	a,#2
8829  1c5d 2722          	jreq	L3174
8830  1c5f               L5174:
8832  1c5f 7b02          	ld	a,(OFST+0,sp)
8833  1c61 a105          	cp	a,#5
8834  1c63 250d          	jrult	L3274
8836  1c65 a109          	cp	a,#9
8837  1c67 2409          	jruge	L3274
8839  1c69 c60001        	ld	a,_MD_Test_Pg
8840  1c6c a103          	cp	a,#3
8841  1c6e 2711          	jreq	L3174
8842  1c70 7b02          	ld	a,(OFST+0,sp)
8843  1c72               L3274:
8845  1c72 a109          	cp	a,#9
8846  1c74 2524          	jrult	L7074
8848  1c76 a10d          	cp	a,#13
8849  1c78 2420          	jruge	L7074
8851  1c7a c60001        	ld	a,_MD_Test_Pg
8852  1c7d a104          	cp	a,#4
8853  1c7f 2619          	jrne	L7074
8854  1c81               L3174:
8855                     ; 1242 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8857  1c81 7b02          	ld	a,(OFST+0,sp)
8858  1c83 5f            	clrw	x
8859  1c84 97            	ld	xl,a
8860  1c85 5a            	decw	x
8861  1c86 a604          	ld	a,#4
8862  1c88 8d000000      	callf	d_smodx
8864  1c8c d60000        	ld	a,(_LCD_Line,x)
8865  1c8f 8d000000      	callf	f_Set_LCD_Address
8867                     ; 1243 					Display_LCD_String("Fail_STT_PCB1 ");
8869  1c93 ae00fc        	ldw	x,#L7274
8870  1c96 8d000000      	callf	f_Display_LCD_String
8872  1c9a               L7074:
8873                     ; 1247 			if(MD_ID306_Data[5] & 0x10){
8875  1c9a 720900164c    	btjf	_MD_ID306_Data+5,#4,L1374
8876                     ; 1248 				fault_cnt++;
8878  1c9f 0c02          	inc	(OFST+0,sp)
8879                     ; 1249 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8879                     ; 1250 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8879                     ; 1251 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8881  1ca1 270d          	jreq	L7374
8883  1ca3 7b02          	ld	a,(OFST+0,sp)
8884  1ca5 a105          	cp	a,#5
8885  1ca7 2407          	jruge	L7374
8887  1ca9 c60001        	ld	a,_MD_Test_Pg
8888  1cac a102          	cp	a,#2
8889  1cae 2722          	jreq	L5374
8890  1cb0               L7374:
8892  1cb0 7b02          	ld	a,(OFST+0,sp)
8893  1cb2 a105          	cp	a,#5
8894  1cb4 250d          	jrult	L5474
8896  1cb6 a109          	cp	a,#9
8897  1cb8 2409          	jruge	L5474
8899  1cba c60001        	ld	a,_MD_Test_Pg
8900  1cbd a103          	cp	a,#3
8901  1cbf 2711          	jreq	L5374
8902  1cc1 7b02          	ld	a,(OFST+0,sp)
8903  1cc3               L5474:
8905  1cc3 a109          	cp	a,#9
8906  1cc5 2524          	jrult	L1374
8908  1cc7 a10d          	cp	a,#13
8909  1cc9 2420          	jruge	L1374
8911  1ccb c60001        	ld	a,_MD_Test_Pg
8912  1cce a104          	cp	a,#4
8913  1cd0 2619          	jrne	L1374
8914  1cd2               L5374:
8915                     ; 1252 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8917  1cd2 7b02          	ld	a,(OFST+0,sp)
8918  1cd4 5f            	clrw	x
8919  1cd5 97            	ld	xl,a
8920  1cd6 5a            	decw	x
8921  1cd7 a604          	ld	a,#4
8922  1cd9 8d000000      	callf	d_smodx
8924  1cdd d60000        	ld	a,(_LCD_Line,x)
8925  1ce0 8d000000      	callf	f_Set_LCD_Address
8927                     ; 1253 					Display_LCD_String("Fail_OPT_PCB2 ");
8929  1ce4 ae00ed        	ldw	x,#L1574
8930  1ce7 8d000000      	callf	f_Display_LCD_String
8932  1ceb               L1374:
8933                     ; 1257 			if(MD_ID306_Data[5] & 0x20){
8935  1ceb 720b00164c    	btjf	_MD_ID306_Data+5,#5,L3574
8936                     ; 1258 				fault_cnt++;
8938  1cf0 0c02          	inc	(OFST+0,sp)
8939                     ; 1259 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8939                     ; 1260 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8939                     ; 1261 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
8941  1cf2 270d          	jreq	L1674
8943  1cf4 7b02          	ld	a,(OFST+0,sp)
8944  1cf6 a105          	cp	a,#5
8945  1cf8 2407          	jruge	L1674
8947  1cfa c60001        	ld	a,_MD_Test_Pg
8948  1cfd a102          	cp	a,#2
8949  1cff 2722          	jreq	L7574
8950  1d01               L1674:
8952  1d01 7b02          	ld	a,(OFST+0,sp)
8953  1d03 a105          	cp	a,#5
8954  1d05 250d          	jrult	L7674
8956  1d07 a109          	cp	a,#9
8957  1d09 2409          	jruge	L7674
8959  1d0b c60001        	ld	a,_MD_Test_Pg
8960  1d0e a103          	cp	a,#3
8961  1d10 2711          	jreq	L7574
8962  1d12 7b02          	ld	a,(OFST+0,sp)
8963  1d14               L7674:
8965  1d14 a109          	cp	a,#9
8966  1d16 2524          	jrult	L3574
8968  1d18 a10d          	cp	a,#13
8969  1d1a 2420          	jruge	L3574
8971  1d1c c60001        	ld	a,_MD_Test_Pg
8972  1d1f a104          	cp	a,#4
8973  1d21 2619          	jrne	L3574
8974  1d23               L7574:
8975                     ; 1262 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
8977  1d23 7b02          	ld	a,(OFST+0,sp)
8978  1d25 5f            	clrw	x
8979  1d26 97            	ld	xl,a
8980  1d27 5a            	decw	x
8981  1d28 a604          	ld	a,#4
8982  1d2a 8d000000      	callf	d_smodx
8984  1d2e d60000        	ld	a,(_LCD_Line,x)
8985  1d31 8d000000      	callf	f_Set_LCD_Address
8987                     ; 1263 					Display_LCD_String("Fail_STT_PCB2 ");
8989  1d35 ae00de        	ldw	x,#L3774
8990  1d38 8d000000      	callf	f_Display_LCD_String
8992  1d3c               L3574:
8993                     ; 1267 			if(MD_ID306_Data[5] & 0x40){
8995  1d3c 720d00164c    	btjf	_MD_ID306_Data+5,#6,L5774
8996                     ; 1268 				fault_cnt++;
8998  1d41 0c02          	inc	(OFST+0,sp)
8999                     ; 1269 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
8999                     ; 1270 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
8999                     ; 1271 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
9001  1d43 270d          	jreq	L3005
9003  1d45 7b02          	ld	a,(OFST+0,sp)
9004  1d47 a105          	cp	a,#5
9005  1d49 2407          	jruge	L3005
9007  1d4b c60001        	ld	a,_MD_Test_Pg
9008  1d4e a102          	cp	a,#2
9009  1d50 2722          	jreq	L1005
9010  1d52               L3005:
9012  1d52 7b02          	ld	a,(OFST+0,sp)
9013  1d54 a105          	cp	a,#5
9014  1d56 250d          	jrult	L1105
9016  1d58 a109          	cp	a,#9
9017  1d5a 2409          	jruge	L1105
9019  1d5c c60001        	ld	a,_MD_Test_Pg
9020  1d5f a103          	cp	a,#3
9021  1d61 2711          	jreq	L1005
9022  1d63 7b02          	ld	a,(OFST+0,sp)
9023  1d65               L1105:
9025  1d65 a109          	cp	a,#9
9026  1d67 2524          	jrult	L5774
9028  1d69 a10d          	cp	a,#13
9029  1d6b 2420          	jruge	L5774
9031  1d6d c60001        	ld	a,_MD_Test_Pg
9032  1d70 a104          	cp	a,#4
9033  1d72 2619          	jrne	L5774
9034  1d74               L1005:
9035                     ; 1272 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
9037  1d74 7b02          	ld	a,(OFST+0,sp)
9038  1d76 5f            	clrw	x
9039  1d77 97            	ld	xl,a
9040  1d78 5a            	decw	x
9041  1d79 a604          	ld	a,#4
9042  1d7b 8d000000      	callf	d_smodx
9044  1d7f d60000        	ld	a,(_LCD_Line,x)
9045  1d82 8d000000      	callf	f_Set_LCD_Address
9047                     ; 1273 					Display_LCD_String("Fail_OPT_RCore ");
9049  1d86 ae00ce        	ldw	x,#L5105
9050  1d89 8d000000      	callf	f_Display_LCD_String
9052  1d8d               L5774:
9053                     ; 1277 			if(MD_ID306_Data[5] & 0x80){
9055  1d8d 720f00164c    	btjf	_MD_ID306_Data+5,#7,L7105
9056                     ; 1278 				fault_cnt++;
9058  1d92 0c02          	inc	(OFST+0,sp)
9059                     ; 1279 				if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
9059                     ; 1280 					||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))
9059                     ; 1281 					||((fault_cnt > 8) && (fault_cnt <=12) && (MD_Test_Pg == 4)) ){
9061  1d94 270d          	jreq	L5205
9063  1d96 7b02          	ld	a,(OFST+0,sp)
9064  1d98 a105          	cp	a,#5
9065  1d9a 2407          	jruge	L5205
9067  1d9c c60001        	ld	a,_MD_Test_Pg
9068  1d9f a102          	cp	a,#2
9069  1da1 2722          	jreq	L3205
9070  1da3               L5205:
9072  1da3 7b02          	ld	a,(OFST+0,sp)
9073  1da5 a105          	cp	a,#5
9074  1da7 250d          	jrult	L3305
9076  1da9 a109          	cp	a,#9
9077  1dab 2409          	jruge	L3305
9079  1dad c60001        	ld	a,_MD_Test_Pg
9080  1db0 a103          	cp	a,#3
9081  1db2 2711          	jreq	L3205
9082  1db4 7b02          	ld	a,(OFST+0,sp)
9083  1db6               L3305:
9085  1db6 a109          	cp	a,#9
9086  1db8 2524          	jrult	L7105
9088  1dba a10d          	cp	a,#13
9089  1dbc 2420          	jruge	L7105
9091  1dbe c60001        	ld	a,_MD_Test_Pg
9092  1dc1 a104          	cp	a,#4
9093  1dc3 2619          	jrne	L7105
9094  1dc5               L3205:
9095                     ; 1282 					Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
9097  1dc5 7b02          	ld	a,(OFST+0,sp)
9098  1dc7 5f            	clrw	x
9099  1dc8 97            	ld	xl,a
9100  1dc9 5a            	decw	x
9101  1dca a604          	ld	a,#4
9102  1dcc 8d000000      	callf	d_smodx
9104  1dd0 d60000        	ld	a,(_LCD_Line,x)
9105  1dd3 8d000000      	callf	f_Set_LCD_Address
9107                     ; 1283 					Display_LCD_String("Fail_STT_RCore ");
9109  1dd7 ae00be        	ldw	x,#L7305
9110  1dda 8d000000      	callf	f_Display_LCD_String
9112  1dde               L7105:
9113                     ; 1287 			if(!fault_cnt){
9115  1dde 7b02          	ld	a,(OFST+0,sp)
9116  1de0 260e          	jrne	L7263
9117                     ; 1288 				Set_LCD_Address(LCD_Line[0]);
9119  1de2 c60000        	ld	a,_LCD_Line
9120  1de5 8d000000      	callf	f_Set_LCD_Address
9122                     ; 1289 				Display_LCD_String("NON");
9124  1de9 ae01f7        	ldw	x,#L1713
9125  1dec 8d000000      	callf	f_Display_LCD_String
9127  1df0               L7263:
9128                     ; 1296 	if(MD_Trans_flag == ON){
9130  1df0 a60f          	ld	a,#15
9131  1df2 7205000614    	btjf	_MD_Test_Register,#2,L3405
9132                     ; 1297 		Set_LCD_Address((unsigned char)(0x00+15));
9134  1df7 8d000000      	callf	f_Set_LCD_Address
9136                     ; 1298 		if(Blink_30){Display_LCD_String("C");}
9138  1dfb 725d0000      	tnz	_Blink_30
9139  1dff 2705          	jreq	L5405
9142  1e01 ae01f5        	ldw	x,#L7713
9145  1e04 200c          	jra	L1505
9146  1e06               L5405:
9147                     ; 1299 		else{Display_LCD_String(" ");}
9149  1e06 ae02f2        	ldw	x,#L1622
9151  1e09 2007          	jra	L1505
9152  1e0b               L3405:
9153                     ; 1302 		Set_LCD_Address((unsigned char)(0x00+15));
9155  1e0b 8d000000      	callf	f_Set_LCD_Address
9157                     ; 1303 		Display_LCD_String("N");
9159  1e0f ae01f3        	ldw	x,#L5023
9161  1e12               L1505:
9162  1e12 8d000000      	callf	f_Display_LCD_String
9163                     ; 1307 	return;
9166  1e16 85            	popw	x
9167  1e17 87            	retf	
9198                     ; 1310 void MedelS_V58_Switch_Control(void)
9198                     ; 1311 {
9199                     	switch	.text
9200  1e18               f_MedelS_V58_Switch_Control:
9204                     ; 1312 	if(UP_SW_flag == ON){
9206  1e18 7203000043    	btjf	_SW_Status,#1,L3605
9207                     ; 1314 		if(MD_Data_Setting_flag == ON){	ModelS_V58_Value_Change(1);}
9209  1e1d 7203000608    	btjf	_MD_Test_Register,#1,L5605
9212  1e22 a601          	ld	a,#1
9213  1e24 8df30df3      	callf	f_ModelS_V58_Value_Change
9216  1e28 2030          	jra	L7605
9217  1e2a               L5605:
9218                     ; 1315 		else if(MD_Data_Select_flag == ON){
9220  1e2a 720100060c    	btjf	_MD_Test_Register,#0,L1705
9221                     ; 1316 			if(MD_Data_Step > 0){ MD_Data_Step--;}
9223  1e2f 725d0000      	tnz	_MD_Data_Step
9224  1e33 2725          	jreq	L7605
9227  1e35 725a0000      	dec	_MD_Data_Step
9228  1e39 201f          	jra	L7605
9229  1e3b               L1705:
9230                     ; 1318 			if(!MD_Option_flag){
9232  1e3b 720600061a    	btjt	_MD_Test_Register,#3,L7605
9233                     ; 1319 				if(MD_Test_Pg > 0){ MD_Test_Pg--;}
9235  1e40 725d0001      	tnz	_MD_Test_Pg
9236  1e44 2706          	jreq	L1015
9239  1e46 725a0001      	dec	_MD_Test_Pg
9241  1e4a 2004          	jra	L3015
9242  1e4c               L1015:
9243                     ; 1320 				else{MD_Test_Pg = 4;}
9245  1e4c 35040001      	mov	_MD_Test_Pg,#4
9246  1e50               L3015:
9247                     ; 1321 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
9249  1e50 725d0001      	tnz	_MD_Test_Pg
9250  1e54 2604          	jrne	L7605
9253  1e56 725f0000      	clr	_MD_Data_Step
9254  1e5a               L7605:
9255                     ; 1324 		UP_SW_flag = OFF;
9257  1e5a 72130000      	bres	_SW_Status,#1
9259  1e5e 2047          	jra	L7015
9260  1e60               L3605:
9261                     ; 1327 	else if(DN_SW_flag == ON){ 
9263  1e60 7205000042    	btjf	_SW_Status,#2,L7015
9264                     ; 1330 		if(MD_Data_Setting_flag == ON){	ModelS_V58_Value_Change(0);}
9266  1e65 7203000607    	btjf	_MD_Test_Register,#1,L3115
9269  1e6a 4f            	clr	a
9270  1e6b 8df30df3      	callf	f_ModelS_V58_Value_Change
9273  1e6f 2032          	jra	L5115
9274  1e71               L3115:
9275                     ; 1332 		else if(MD_Data_Select_flag == ON){
9277  1e71 720100060d    	btjf	_MD_Test_Register,#0,L7115
9278                     ; 1333 			if(MD_Data_Step < 3){ MD_Data_Step++;}
9280  1e76 c60000        	ld	a,_MD_Data_Step
9281  1e79 a103          	cp	a,#3
9282  1e7b 2426          	jruge	L5115
9285  1e7d 725c0000      	inc	_MD_Data_Step
9286  1e81 2020          	jra	L5115
9287  1e83               L7115:
9288                     ; 1335 			if(!MD_Option_flag){
9290  1e83 720600061b    	btjt	_MD_Test_Register,#3,L5115
9291                     ; 1336 				if(MD_Test_Pg < 4 ){
9293  1e88 c60001        	ld	a,_MD_Test_Pg
9294  1e8b a104          	cp	a,#4
9295  1e8d 2406          	jruge	L7215
9296                     ; 1337 					MD_Test_Pg++;
9298  1e8f 725c0001      	inc	_MD_Test_Pg
9300  1e93 2004          	jra	L1315
9301  1e95               L7215:
9302                     ; 1338 				}else{MD_Test_Pg = 0;}
9304  1e95 725f0001      	clr	_MD_Test_Pg
9305  1e99               L1315:
9306                     ; 1339 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
9308  1e99 725d0001      	tnz	_MD_Test_Pg
9309  1e9d 2604          	jrne	L5115
9312  1e9f 725f0000      	clr	_MD_Data_Step
9313  1ea3               L5115:
9314                     ; 1342 		DN_SW_flag = OFF;
9316  1ea3 72150000      	bres	_SW_Status,#2
9317  1ea7               L7015:
9318                     ; 1347 	if(SET_SW_flag == ON){
9320  1ea7 720700002f    	btjf	_SW_Status,#3,L5315
9321                     ; 1348 		if((MD_Test_Pg==0)||(MD_Test_Pg==10)){
9323  1eac 725d0001      	tnz	_MD_Test_Pg
9324  1eb0 2707          	jreq	L1415
9326  1eb2 c60001        	ld	a,_MD_Test_Pg
9327  1eb5 a10a          	cp	a,#10
9328  1eb7 2622          	jrne	L5315
9329  1eb9               L1415:
9330                     ; 1350 			if(MD_Data_Select_flag == OFF){MD_Data_Select_flag= ON;}
9332  1eb9 7200000606    	btjt	_MD_Test_Register,#0,L3415
9335  1ebe 72100006      	bset	_MD_Test_Register,#0
9337  1ec2 2013          	jra	L5415
9338  1ec4               L3415:
9339                     ; 1352 				if(MD_Data_Setting_flag == OFF){
9341  1ec4 7202000606    	btjt	_MD_Test_Register,#1,L7415
9342                     ; 1353 					MD_Data_Setting_flag = ON;
9344  1ec9 72120006      	bset	_MD_Test_Register,#1
9346  1ecd 2008          	jra	L5415
9347  1ecf               L7415:
9348                     ; 1355 					MD_Data_Setting_flag = OFF;
9350  1ecf 72130006      	bres	_MD_Test_Register,#1
9351                     ; 1356 					MD_Data_Select_flag = OFF;
9353  1ed3 72110006      	bres	_MD_Test_Register,#0
9354  1ed7               L5415:
9355                     ; 1359 			SET_SW_flag = OFF;
9357  1ed7 72170000      	bres	_SW_Status,#3
9358  1edb               L5315:
9359                     ; 1363 	if(ON_OFF_SW_flag == ON){
9361  1edb 7201000013    	btjf	_SW_Status,#0,L3515
9362                     ; 1364 		if(MD_Trans_flag == OFF){MD_Trans_flag = ON;}
9364  1ee0 7204000606    	btjt	_MD_Test_Register,#2,L5515
9367  1ee5 72140006      	bset	_MD_Test_Register,#2
9369  1ee9 2004          	jra	L7515
9370  1eeb               L5515:
9371                     ; 1365 		else{ MD_Trans_flag = OFF;  }
9373  1eeb 72150006      	bres	_MD_Test_Register,#2
9374  1eef               L7515:
9375                     ; 1367 		ON_OFF_SW_flag = OFF;
9377  1eef 72110000      	bres	_SW_Status,#0
9378  1ef3               L3515:
9379                     ; 1370 	if(OP_SW_flag == ON){
9381  1ef3 720900002f    	btjf	_SW_Status,#4,L1615
9382                     ; 1371 		if(MD_Option_flag == OFF){
9384  1ef8 7206000612    	btjt	_MD_Test_Register,#3,L3615
9385                     ; 1372 			MD_Option_flag = ON;
9387  1efd 72160006      	bset	_MD_Test_Register,#3
9388                     ; 1373 			MD_Data_Select_flag = OFF;
9390  1f01 72110006      	bres	_MD_Test_Register,#0
9391                     ; 1374 			MD_Data_Setting_flag = OFF;
9393  1f05 72130006      	bres	_MD_Test_Register,#1
9394                     ; 1375 			MD_Test_Pg = 10;
9396  1f09 350a0001      	mov	_MD_Test_Pg,#10
9397                     ; 1376 			MD_Data_Step = 0;
9399  1f0d 2010          	jra	L5615
9400  1f0f               L3615:
9401                     ; 1379 			MD_Option_flag = OFF;
9403  1f0f 72170006      	bres	_MD_Test_Register,#3
9404                     ; 1380 			MD_Data_Select_flag = OFF;
9406  1f13 72110006      	bres	_MD_Test_Register,#0
9407                     ; 1381 			MD_Data_Setting_flag = OFF;
9409  1f17 72130006      	bres	_MD_Test_Register,#1
9410                     ; 1383 			MD_Test_Pg = 0;
9412  1f1b 725f0001      	clr	_MD_Test_Pg
9413                     ; 1384 			MD_Data_Step = 0;
9415  1f1f               L5615:
9417  1f1f 725f0000      	clr	_MD_Data_Step
9418                     ; 1387 		OP_SW_flag = OFF;
9420  1f23 72190000      	bres	_SW_Status,#4
9421  1f27               L1615:
9422                     ; 1390 	if(EN_SW_flag == ON){
9424  1f27 720b000020    	btjf	_SW_Status,#5,L7615
9425                     ; 1391 		Device_Select_Mode = ON;
9427  1f2c 72100000      	bset	_Mode_Select_Status,#0
9428                     ; 1392 		MD_Data_Select_flag = OFF;
9430  1f30 72110006      	bres	_MD_Test_Register,#0
9431                     ; 1393 		MD_Data_Setting_flag = OFF;
9433  1f34 72130006      	bres	_MD_Test_Register,#1
9434                     ; 1394 		MD_Option_flag = OFF;
9436  1f38 72170006      	bres	_MD_Test_Register,#3
9437                     ; 1395 		MD_Trans_flag = OFF;
9439  1f3c 72150006      	bres	_MD_Test_Register,#2
9440                     ; 1397 		Can_Select_Device = 0;
9442  1f40 725f0000      	clr	_Can_Select_Device
9443                     ; 1398 		ModelS_Reset();
9445  1f44 8d000000      	callf	f_ModelS_Reset
9447                     ; 1399 		EN_SW_flag = OFF;
9449  1f48 721b0000      	bres	_SW_Status,#5
9450  1f4c               L7615:
9451                     ; 1402 	return;
9454  1f4c 87            	retf	
9519                     ; 1408 void ModelX_Rear_LCD_Display(void)
9519                     ; 1409 {
9520                     	switch	.text
9521  1f4d               f_ModelX_Rear_LCD_Display:
9523  1f4d 5204          	subw	sp,#4
9524       00000004      OFST:	set	4
9527                     ; 1411 	unsigned char fault_cnt=0;
9529  1f4f 0f03          	clr	(OFST-1,sp)
9530                     ; 1414 	if(MD_Test_Pg != MD_Pre_Pg){ ModelS_Display_Handling();} 
9532  1f51 c60001        	ld	a,_MD_Test_Pg
9533  1f54 c10002        	cp	a,_MD_Pre_Pg
9534  1f57 2704          	jreq	L1125
9537  1f59 8d730073      	callf	f_ModelS_Display_Handling
9539  1f5d               L1125:
9540                     ; 1415 	MD_Pre_Pg = MD_Test_Pg;
9542  1f5d 5500010002    	mov	_MD_Pre_Pg,_MD_Test_Pg
9543                     ; 1418 	if(MD_Test_Pg == 0){			//page 1
9545  1f62 725d0001      	tnz	_MD_Test_Pg
9546  1f66 2704ac292129  	jrne	L3125
9547                     ; 1419 		for(i=0; i<4; i++){
9549  1f6c 4f            	clr	a
9550  1f6d 6b04          	ld	(OFST+0,sp),a
9551  1f6f               L5125:
9552                     ; 1420 			Set_LCD_Address(LCD_Line[i]);
9554  1f6f 5f            	clrw	x
9555  1f70 97            	ld	xl,a
9556  1f71 d60000        	ld	a,(_LCD_Line,x)
9557  1f74 8d000000      	callf	f_Set_LCD_Address
9559                     ; 1422 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
9561  1f78 7201000626    	btjf	_MD_Test_Register,#0,L3225
9563  1f7d 7202000621    	btjt	_MD_Test_Register,#1,L3225
9565  1f82 7b04          	ld	a,(OFST+0,sp)
9566  1f84 c10000        	cp	a,_MD_Data_Step
9567  1f87 261a          	jrne	L3225
9568                     ; 1423 				if(Blink_50){
9570  1f89 725d0000      	tnz	_Blink_50
9571  1f8d 2716          	jreq	LC045
9572                     ; 1424 					if(i == 1){ 
9574  1f8f a101          	cp	a,#1
9575  1f91 261d          	jrne	L3325
9576                     ; 1425 						Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
9578  1f93 5f            	clrw	x
9579  1f94 97            	ld	xl,a
9580  1f95 d60000        	ld	a,(_LCD_Line,x)
9581  1f98 ab08          	add	a,#8
9582  1f9a 8d000000      	callf	f_Set_LCD_Address
9584                     ; 1426 						Display_LCD_String("FDt:");
9586  1f9e ae02f4        	ldw	x,#L5422
9588  1fa1 2009          	jpf	LC044
9589                     ; 1429 				else{Display_LCD_String(LCD_Dis_Data[i]);}
9591  1fa3               L3225:
9592                     ; 1430 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
9594  1fa3 7b04          	ld	a,(OFST+0,sp)
9595  1fa5               LC045:
9597  1fa5 97            	ld	xl,a
9598  1fa6 a610          	ld	a,#16
9599  1fa8 42            	mul	x,a
9600  1fa9 1c0000        	addw	x,#_LCD_Dis_Data
9601  1fac               LC044:
9602  1fac 8d000000      	callf	f_Display_LCD_String
9604  1fb0               L3325:
9605                     ; 1432 			if(i==0){
9607  1fb0 7b04          	ld	a,(OFST+0,sp)
9608  1fb2 263a          	jrne	L5325
9609                     ; 1433 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
9611  1fb4 5f            	clrw	x
9612  1fb5 97            	ld	xl,a
9613  1fb6 d60000        	ld	a,(_LCD_Line,x)
9614  1fb9 ab04          	add	a,#4
9615  1fbb 8d000000      	callf	f_Set_LCD_Address
9617                     ; 1434 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
9619  1fbf 7203000621    	btjf	_MD_Test_Register,#1,L7325
9621  1fc4 7b04          	ld	a,(OFST+0,sp)
9622  1fc6 c10000        	cp	a,_MD_Data_Step
9623  1fc9 261a          	jrne	L7325
9624                     ; 1435 					if(Blink_50){Display_LCD_String(" ");}
9626  1fcb 725d0000      	tnz	_Blink_50
9627  1fcf 270b          	jreq	L1425
9630  1fd1 ae02f2        	ldw	x,#L1622
9631  1fd4 8d000000      	callf	f_Display_LCD_String
9634  1fd8 ac192119      	jra	L7425
9635  1fdc               L1425:
9636                     ; 1436 					else{ Num_Display_LCD(PTC_AllowOperation);}
9638  1fdc c60000        	ld	a,_PTC_AllowOperation
9639  1fdf 5f            	clrw	x
9640  1fe0 97            	ld	xl,a
9642  1fe1 ac152115      	jpf	LC047
9643  1fe5               L7325:
9644                     ; 1437 				}else{ Num_Display_LCD(PTC_AllowOperation);}
9646  1fe5 c60000        	ld	a,_PTC_AllowOperation
9647  1fe8 5f            	clrw	x
9648  1fe9 97            	ld	xl,a
9650  1fea ac152115      	jpf	LC047
9651  1fee               L5325:
9652                     ; 1439 			else if(i==1){
9654  1fee a101          	cp	a,#1
9655  1ff0 2676          	jrne	L1525
9656                     ; 1440 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
9658  1ff2 5f            	clrw	x
9659  1ff3 97            	ld	xl,a
9660  1ff4 d60000        	ld	a,(_LCD_Line,x)
9661  1ff7 ab04          	add	a,#4
9662  1ff9 8d000000      	callf	f_Set_LCD_Address
9664                     ; 1441 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
9666  1ffd 7203000616    	btjf	_MD_Test_Register,#1,L5525
9668  2002 7b04          	ld	a,(OFST+0,sp)
9669  2004 c10000        	cp	a,_MD_Data_Step
9670  2007 260f          	jrne	L5525
9671                     ; 1442 					if(Blink_50){Display_LCD_String("   ");}
9673  2009 725d0000      	tnz	_Blink_50
9674  200d 2709          	jreq	L5525
9677  200f ae02d9        	ldw	x,#L3232
9678  2012 8d000000      	callf	f_Display_LCD_String
9681  2016 2025          	jra	L3625
9682  2018               L5525:
9683                     ; 1444 						Num_Display_LCD(PTC_Heat_Duty/2);
9685                     ; 1445 						if(PTC_Heat_Duty < 200){
9686                     ; 1446 							Display_LCD_String(".");
9688                     ; 1447 							Num_Display_LCD((PTC_Heat_Duty%2)*5);
9690                     ; 1451 					Num_Display_LCD(PTC_Heat_Duty/2);
9693                     ; 1452 					if(PTC_Heat_Duty < 200){
9695                     ; 1453 						Display_LCD_String(".");
9698                     ; 1454 						Num_Display_LCD((PTC_Heat_Duty%2)*5);
9701  2018 c60000        	ld	a,_PTC_Heat_Duty
9702  201b 44            	srl	a
9703  201c 5f            	clrw	x
9704  201d 97            	ld	xl,a
9705  201e 8d000000      	callf	f_Num_Display_LCD
9707  2022 c60000        	ld	a,_PTC_Heat_Duty
9708  2025 a1c8          	cp	a,#200
9709  2027 2414          	jruge	L3625
9711  2029 ae02d7        	ldw	x,#L1332
9712  202c 8d000000      	callf	f_Display_LCD_String
9714  2030 c60000        	ld	a,_PTC_Heat_Duty
9715  2033 a401          	and	a,#1
9716  2035 97            	ld	xl,a
9717  2036 a605          	ld	a,#5
9718  2038 42            	mul	x,a
9719  2039 8d000000      	callf	f_Num_Display_LCD
9721  203d               L3625:
9722                     ; 1458 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
9724  203d 7b04          	ld	a,(OFST+0,sp)
9725  203f 5f            	clrw	x
9726  2040 97            	ld	xl,a
9727  2041 d60000        	ld	a,(_LCD_Line,x)
9728  2044 ab0c          	add	a,#12
9729  2046 8d000000      	callf	f_Set_LCD_Address
9731                     ; 1459 				Num_Display_LCD(MD_ID205_Data[6]/2);
9733  204a c6002f        	ld	a,_MD_ID205_Data+6
9734  204d 44            	srl	a
9735  204e 5f            	clrw	x
9736  204f 97            	ld	xl,a
9737  2050 8d000000      	callf	f_Num_Display_LCD
9739                     ; 1460 				Display_LCD_String(".");
9741  2054 ae02d7        	ldw	x,#L1332
9742  2057 8d000000      	callf	f_Display_LCD_String
9744                     ; 1461 				Num_Display_LCD((MD_ID205_Data[6]%2)*5);
9746  205b c6002f        	ld	a,_MD_ID205_Data+6
9747  205e a401          	and	a,#1
9748  2060 97            	ld	xl,a
9749  2061 a605          	ld	a,#5
9750  2063 42            	mul	x,a
9753  2064 ac152115      	jpf	LC047
9754  2068               L1525:
9755                     ; 1465 			else if(i==2){
9757  2068 a102          	cp	a,#2
9758  206a 2661          	jrne	L1725
9759                     ; 1467 				Set_LCD_Address((unsigned char)(LCD_Line[i]+2));
9761  206c 5f            	clrw	x
9762  206d 97            	ld	xl,a
9763  206e d60000        	ld	a,(_LCD_Line,x)
9764  2071 ab02          	add	a,#2
9765  2073 8d000000      	callf	f_Set_LCD_Address
9767                     ; 1468 				Num_Display_LCD(MD_ID205_Data[0] & 0x01);
9769  2077 c60029        	ld	a,_MD_ID205_Data
9770  207a a401          	and	a,#1
9771  207c 5f            	clrw	x
9772  207d 97            	ld	xl,a
9773  207e 8d000000      	callf	f_Num_Display_LCD
9775                     ; 1470 				Set_LCD_Address((unsigned char)(LCD_Line[i]+6));
9777  2082 7b04          	ld	a,(OFST+0,sp)
9778  2084 5f            	clrw	x
9779  2085 97            	ld	xl,a
9780  2086 d60000        	ld	a,(_LCD_Line,x)
9781  2089 ab06          	add	a,#6
9782  208b 8d000000      	callf	f_Set_LCD_Address
9784                     ; 1471 				Num_Display_LCD((MD_ID205_Data[0] & 0x02) >> 1);
9786  208f c60029        	ld	a,_MD_ID205_Data
9787  2092 a402          	and	a,#2
9788  2094 44            	srl	a
9789  2095 5f            	clrw	x
9790  2096 97            	ld	xl,a
9791  2097 8d000000      	callf	f_Num_Display_LCD
9793                     ; 1473 				ui_ptc_power = (U16)(MD_ID205_Data[4]) * (U16)(2) * (U16)(MD_ID205_Data[5]) * (U16)(2) / (U16)(10);   
9795  209b c6002d        	ld	a,_MD_ID205_Data+4
9796  209e 5f            	clrw	x
9797  209f 97            	ld	xl,a
9798  20a0 58            	sllw	x
9799  20a1 c6002e        	ld	a,_MD_ID205_Data+5
9800  20a4 905f          	clrw	y
9801  20a6 9097          	ld	yl,a
9802  20a8 8d000000      	callf	d_imul
9804  20ac 58            	sllw	x
9805  20ad 90ae000a      	ldw	y,#10
9806  20b1 65            	divw	x,y
9807  20b2 1f01          	ldw	(OFST-3,sp),x
9808                     ; 1474 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
9810  20b4 5f            	clrw	x
9811  20b5 7b04          	ld	a,(OFST+0,sp)
9812  20b7 97            	ld	xl,a
9813  20b8 d60000        	ld	a,(_LCD_Line,x)
9814  20bb ab0c          	add	a,#12
9815  20bd 8d000000      	callf	f_Set_LCD_Address
9817                     ; 1475 				if(ui_ptc_power >= 10000){Num_Display_LCD(9999);}
9819  20c1 1e01          	ldw	x,(OFST-3,sp)
9820  20c3 a32710        	cpw	x,#10000
9821  20c6 254d          	jrult	LC047
9824  20c8 ae270f        	ldw	x,#9999
9827  20cb 2048          	jpf	LC047
9828                     ; 1476 				else{Num_Display_LCD(ui_ptc_power);}	// Consumption Power
9830  20cd               L1725:
9831                     ; 1479 			else if(i==3){
9833  20cd a103          	cp	a,#3
9834  20cf 2648          	jrne	L7425
9835                     ; 1481 				Set_LCD_Address((unsigned char)(LCD_Line[i]+4));
9837  20d1 5f            	clrw	x
9838  20d2 97            	ld	xl,a
9839  20d3 d60000        	ld	a,(_LCD_Line,x)
9840  20d6 ab04          	add	a,#4
9841  20d8 8d000000      	callf	f_Set_LCD_Address
9843                     ; 1482 				Num_Display_LCD(MD_ID205_Data[4] * 2);
9845  20dc c6002d        	ld	a,_MD_ID205_Data+4
9846  20df 5f            	clrw	x
9847  20e0 97            	ld	xl,a
9848  20e1 58            	sllw	x
9849  20e2 8d000000      	callf	f_Num_Display_LCD
9851                     ; 1484 				Set_LCD_Address((unsigned char)(LCD_Line[i]+12));
9853  20e6 7b04          	ld	a,(OFST+0,sp)
9854  20e8 5f            	clrw	x
9855  20e9 97            	ld	xl,a
9856  20ea d60000        	ld	a,(_LCD_Line,x)
9857  20ed ab0c          	add	a,#12
9858  20ef 8d000000      	callf	f_Set_LCD_Address
9860                     ; 1485 				Num_Display_LCD(MD_ID205_Data[5] / 5);
9862  20f3 c6002e        	ld	a,_MD_ID205_Data+5
9863  20f6 5f            	clrw	x
9864  20f7 97            	ld	xl,a
9865  20f8 a605          	ld	a,#5
9866  20fa 8d000000      	callf	d_sdivx
9868  20fe 8d000000      	callf	f_Num_Display_LCD
9870                     ; 1486 				Display_LCD_String(".");
9872  2102 ae02d7        	ldw	x,#L1332
9873  2105 8d000000      	callf	f_Display_LCD_String
9875                     ; 1487 				Num_Display_LCD((MD_ID205_Data[5] % 5) * 2);
9877  2109 c6002e        	ld	a,_MD_ID205_Data+5
9878  210c 5f            	clrw	x
9879  210d 97            	ld	xl,a
9880  210e a605          	ld	a,#5
9881  2110 8d000000      	callf	d_smodx
9883  2114 58            	sllw	x
9884  2115               LC047:
9886  2115 8d000000      	callf	f_Num_Display_LCD
9888  2119               L7425:
9889                     ; 1419 		for(i=0; i<4; i++){
9891  2119 0c04          	inc	(OFST+0,sp)
9894  211b 7b04          	ld	a,(OFST+0,sp)
9895  211d a104          	cp	a,#4
9896  211f 2404ac6f1f6f  	jrult	L5125
9898  2125 ac8e288e      	jra	L3035
9899  2129               L3125:
9900                     ; 1491 	else if(MD_Test_Pg == 1){
9902  2129 c60001        	ld	a,_MD_Test_Pg
9903  212c 4a            	dec	a
9904  212d 2704ac282228  	jrne	L5035
9905                     ; 1492 		for(i=0;i<4;i++){
9907  2133 6b04          	ld	(OFST+0,sp),a
9908  2135               L7035:
9909                     ; 1493 			Set_LCD_Address(LCD_Line[i]);
9911  2135 5f            	clrw	x
9912  2136 97            	ld	xl,a
9913  2137 d60000        	ld	a,(_LCD_Line,x)
9914  213a 8d000000      	callf	f_Set_LCD_Address
9916                     ; 1494 			Display_LCD_String(LCD_Dis_Data[i]);
9918  213e 7b04          	ld	a,(OFST+0,sp)
9919  2140 97            	ld	xl,a
9920  2141 a610          	ld	a,#16
9921  2143 42            	mul	x,a
9922  2144 1c0000        	addw	x,#_LCD_Dis_Data
9923  2147 8d000000      	callf	f_Display_LCD_String
9925                     ; 1492 		for(i=0;i<4;i++){
9927  214b 0c04          	inc	(OFST+0,sp)
9930  214d 7b04          	ld	a,(OFST+0,sp)
9931  214f a104          	cp	a,#4
9932  2151 25e2          	jrult	L7035
9933                     ; 1497 		Set_LCD_Address((unsigned char)(LCD_Line[0]+7));
9935  2153 c60000        	ld	a,_LCD_Line
9936  2156 ab07          	add	a,#7
9937  2158 8d000000      	callf	f_Set_LCD_Address
9939                     ; 1498 		if(MD_ID205_Data[1] >= 0xF1){Display_LCD_String("Fa");}	// Core Temp Value
9941  215c c6002a        	ld	a,_MD_ID205_Data+1
9942  215f a1f1          	cp	a,#241
9943  2161 2509          	jrult	L5135
9946  2163 ae02b6        	ldw	x,#L7252
9947  2166 8d000000      	callf	f_Display_LCD_String
9950  216a 2027          	jra	L7135
9951  216c               L5135:
9952                     ; 1499 		else if(MD_ID205_Data[1] < 40){
9954  216c c6002a        	ld	a,_MD_ID205_Data+1
9955  216f a128          	cp	a,#40
9956  2171 2414          	jruge	L1235
9957                     ; 1500 			Display_LCD_String("-");
9959  2173 ae02b4        	ldw	x,#L5352
9960  2176 8d000000      	callf	f_Display_LCD_String
9962                     ; 1501 			Num_Display_LCD(40-MD_ID205_Data[1]);
9964  217a 4f            	clr	a
9965  217b 97            	ld	xl,a
9966  217c a628          	ld	a,#40
9967  217e c0002a        	sub	a,_MD_ID205_Data+1
9968  2181 2401          	jrnc	L4261
9969  2183 5a            	decw	x
9970  2184               L4261:
9971  2184 02            	rlwa	x,a
9974  2185 2008          	jpf	LC048
9975  2187               L1235:
9976                     ; 1502 		}else{ Num_Display_LCD(MD_ID205_Data[1]-40);}
9978  2187 c6002a        	ld	a,_MD_ID205_Data+1
9979  218a 5f            	clrw	x
9980  218b 97            	ld	xl,a
9981  218c 1d0028        	subw	x,#40
9982  218f               LC048:
9983  218f 8d000000      	callf	f_Num_Display_LCD
9985  2193               L7135:
9986                     ; 1503 		Display_LCD_String("c");
9988  2193 ae00bc        	ldw	x,#L5235
9989  2196 8d000000      	callf	f_Display_LCD_String
9991                     ; 1505 		Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
9993  219a c60001        	ld	a,_LCD_Line+1
9994  219d ab07          	add	a,#7
9995  219f 8d000000      	callf	f_Set_LCD_Address
9997                     ; 1506 		if(MD_ID205_Data[3] >= 0xF1){Display_LCD_String("Fa");}	// IGBT Temp Value
9999  21a3 c6002c        	ld	a,_MD_ID205_Data+3
10000  21a6 a1f1          	cp	a,#241
10001  21a8 2509          	jrult	L7235
10004  21aa ae02b6        	ldw	x,#L7252
10005  21ad 8d000000      	callf	f_Display_LCD_String
10008  21b1 2027          	jra	L1335
10009  21b3               L7235:
10010                     ; 1507 		else if(MD_ID205_Data[3] < 40){
10012  21b3 c6002c        	ld	a,_MD_ID205_Data+3
10013  21b6 a128          	cp	a,#40
10014  21b8 2414          	jruge	L3335
10015                     ; 1508 			Display_LCD_String("-");
10017  21ba ae02b4        	ldw	x,#L5352
10018  21bd 8d000000      	callf	f_Display_LCD_String
10020                     ; 1509 			Num_Display_LCD(40-MD_ID205_Data[3]);
10022  21c1 4f            	clr	a
10023  21c2 97            	ld	xl,a
10024  21c3 a628          	ld	a,#40
10025  21c5 c0002c        	sub	a,_MD_ID205_Data+3
10026  21c8 2401          	jrnc	L2461
10027  21ca 5a            	decw	x
10028  21cb               L2461:
10029  21cb 02            	rlwa	x,a
10032  21cc 2008          	jpf	LC049
10033  21ce               L3335:
10034                     ; 1510 		}else{ Num_Display_LCD(MD_ID205_Data[3]-40);}
10036  21ce c6002c        	ld	a,_MD_ID205_Data+3
10037  21d1 5f            	clrw	x
10038  21d2 97            	ld	xl,a
10039  21d3 1d0028        	subw	x,#40
10040  21d6               LC049:
10041  21d6 8d000000      	callf	f_Num_Display_LCD
10043  21da               L1335:
10044                     ; 1511 		Display_LCD_String("c");
10046  21da ae00bc        	ldw	x,#L5235
10047  21dd 8d000000      	callf	f_Display_LCD_String
10049                     ; 1513 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
10051  21e1 c60002        	ld	a,_LCD_Line+2
10052  21e4 ab07          	add	a,#7
10053  21e6 8d000000      	callf	f_Set_LCD_Address
10055                     ; 1514 		if(MD_ID205_Data[2] >= 0xF1){Display_LCD_String("Fa");}	// IGBT Temp Value
10057  21ea c6002b        	ld	a,_MD_ID205_Data+2
10058  21ed a1f1          	cp	a,#241
10059  21ef 2509          	jrult	L7335
10062  21f1 ae02b6        	ldw	x,#L7252
10063  21f4 8d000000      	callf	f_Display_LCD_String
10066  21f8 2027          	jra	L1435
10067  21fa               L7335:
10068                     ; 1515 		else if(MD_ID205_Data[2] < 40){
10070  21fa c6002b        	ld	a,_MD_ID205_Data+2
10071  21fd a128          	cp	a,#40
10072  21ff 2414          	jruge	L3435
10073                     ; 1516 			Display_LCD_String("-");
10075  2201 ae02b4        	ldw	x,#L5352
10076  2204 8d000000      	callf	f_Display_LCD_String
10078                     ; 1517 			Num_Display_LCD(40-MD_ID205_Data[2]);
10080  2208 4f            	clr	a
10081  2209 97            	ld	xl,a
10082  220a a628          	ld	a,#40
10083  220c c0002b        	sub	a,_MD_ID205_Data+2
10084  220f 2401          	jrnc	L0661
10085  2211 5a            	decw	x
10086  2212               L0661:
10087  2212 02            	rlwa	x,a
10090  2213 2008          	jpf	LC050
10091  2215               L3435:
10092                     ; 1518 		}else{ Num_Display_LCD(MD_ID205_Data[2]-40);}
10094  2215 c6002b        	ld	a,_MD_ID205_Data+2
10095  2218 5f            	clrw	x
10096  2219 97            	ld	xl,a
10097  221a 1d0028        	subw	x,#40
10098  221d               LC050:
10099  221d 8d000000      	callf	f_Num_Display_LCD
10101  2221               L1435:
10102                     ; 1519 		Display_LCD_String("c");
10104  2221 ae00bc        	ldw	x,#L5235
10107  2224 ac8a288a      	jpf	LC060
10108  2228               L5035:
10109                     ; 1522 	else if(MD_Test_Pg == 10){
10111  2228 c60001        	ld	a,_MD_Test_Pg
10112  222b a10a          	cp	a,#10
10113  222d 2704ac812381  	jrne	L1535
10114                     ; 1523 		for(i=0; i<4; i++){
10116  2233 4f            	clr	a
10117  2234 6b04          	ld	(OFST+0,sp),a
10118  2236               L3535:
10119                     ; 1524 			Set_LCD_Address(LCD_Line[i]);
10121  2236 5f            	clrw	x
10122  2237 97            	ld	xl,a
10123  2238 d60000        	ld	a,(_LCD_Line,x)
10124  223b 8d000000      	callf	f_Set_LCD_Address
10126                     ; 1526 			if((MD_Data_Select_flag == ON) && (MD_Data_Setting_flag == OFF) && (i == MD_Data_Step)){
10128  223f 7201000617    	btjf	_MD_Test_Register,#0,L1635
10130  2244 7202000612    	btjt	_MD_Test_Register,#1,L1635
10132  2249 7b04          	ld	a,(OFST+0,sp)
10133  224b c10000        	cp	a,_MD_Data_Step
10134  224e 260b          	jrne	L1635
10135                     ; 1527 				if(Blink_50){Display_LCD_String("     ");}
10137  2250 725d0000      	tnz	_Blink_50
10138  2254 2707          	jreq	LC051
10141  2256 ae02d1        	ldw	x,#L1732
10144  2259 2009          	jra	L7635
10145                     ; 1528 				else{Display_LCD_String(LCD_Dis_Data[i]);}
10147  225b               L1635:
10148                     ; 1529 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
10150  225b 7b04          	ld	a,(OFST+0,sp)
10151  225d               LC051:
10153  225d 97            	ld	xl,a
10154  225e a610          	ld	a,#16
10155  2260 42            	mul	x,a
10156  2261 1c0000        	addw	x,#_LCD_Dis_Data
10158  2264               L7635:
10159  2264 8d000000      	callf	f_Display_LCD_String
10160                     ; 1531 			if(i==1){
10162  2268 7b04          	ld	a,(OFST+0,sp)
10163  226a a101          	cp	a,#1
10164  226c 2642          	jrne	L1735
10165                     ; 1532 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
10167  226e 5f            	clrw	x
10168  226f 97            	ld	xl,a
10169  2270 d60000        	ld	a,(_LCD_Line,x)
10170  2273 ab08          	add	a,#8
10171  2275 8d000000      	callf	f_Set_LCD_Address
10173                     ; 1533 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
10175  2279 720300060d    	btjf	_MD_Test_Register,#1,L5735
10177  227e 7b04          	ld	a,(OFST+0,sp)
10178  2280 c10000        	cp	a,_MD_Data_Step
10179  2283 2606          	jrne	L5735
10180                     ; 1534 					if(Blink_50){Display_LCD_String("     ");}
10182  2285 725d0000      	tnz	_Blink_50
10186  2289 2646          	jrne	LC055
10187  228b               L5735:
10188                     ; 1536 						Num_Display_LCD(MD_Unit/2);
10190                     ; 1537 						Display_LCD_String(".");
10192                     ; 1538 						Num_Display_LCD((MD_Unit%2)*5);
10194                     ; 1539 						Display_LCD_String("%");
10196                     ; 1542 					Num_Display_LCD(MD_Unit/2);
10199                     ; 1543 					Display_LCD_String(".");
10202                     ; 1544 					Num_Display_LCD((MD_Unit%2)*5);
10205                     ; 1545 					Display_LCD_String("%");
10208  228b c60007        	ld	a,_MD_Unit
10209  228e 44            	srl	a
10210  228f 5f            	clrw	x
10211  2290 97            	ld	xl,a
10212  2291 8d000000      	callf	f_Num_Display_LCD
10214  2295 ae02d7        	ldw	x,#L1332
10215  2298 8d000000      	callf	f_Display_LCD_String
10217  229c c60007        	ld	a,_MD_Unit
10218  229f a401          	and	a,#1
10219  22a1 97            	ld	xl,a
10220  22a2 a605          	ld	a,#5
10221  22a4 42            	mul	x,a
10222  22a5 8d000000      	callf	f_Num_Display_LCD
10224  22a9 ae02cf        	ldw	x,#L7042
10226  22ac ac6d236d      	jpf	LC052
10227  22b0               L1735:
10228                     ; 1549 			else if(i==2){
10230  22b0 a102          	cp	a,#2
10231  22b2 2658          	jrne	L5045
10232                     ; 1550 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
10234  22b4 5f            	clrw	x
10235  22b5 97            	ld	xl,a
10236  22b6 d60000        	ld	a,(_LCD_Line,x)
10237  22b9 ab08          	add	a,#8
10238  22bb 8d000000      	callf	f_Set_LCD_Address
10240                     ; 1552 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
10242  22bf 7203000614    	btjf	_MD_Test_Register,#1,L1145
10244  22c4 7b04          	ld	a,(OFST+0,sp)
10245  22c6 c10000        	cp	a,_MD_Data_Step
10246  22c9 260d          	jrne	L1145
10247                     ; 1553 					if(Blink_50){Display_LCD_String("     ");}
10249  22cb 725d0000      	tnz	_Blink_50
10250  22cf 2707          	jreq	L1145
10253  22d1               LC055:
10256  22d1 ae02d1        	ldw	x,#L1732
10259  22d4 ac6d236d      	jpf	LC052
10260  22d8               L1145:
10261                     ; 1555 						Num_Display_LCD((unsigned int)(MD_T_Unit/60));
10265                     ; 1556 						Display_LCD_String("m");
10267                     ; 1557 						Num_Display_LCD((unsigned int)(MD_T_Unit%60));
10271                     ; 1558 						Display_LCD_String("s");
10273                     ; 1562 					Num_Display_LCD((unsigned int)(MD_T_Unit/60));
10278                     ; 1563 					Display_LCD_String("m");
10281                     ; 1564 					Num_Display_LCD((unsigned int)(MD_T_Unit%60));
10286                     ; 1565 					Display_LCD_String("s");
10289  22d8 ae0003        	ldw	x,#_MD_T_Unit
10290  22db 8d000000      	callf	d_ltor
10291  22df ae0008        	ldw	x,#L624
10292  22e2 8d000000      	callf	d_ludv
10293  22e6 be02          	ldw	x,c_lreg+2
10294  22e8 8d000000      	callf	f_Num_Display_LCD
10296  22ec ae02cd        	ldw	x,#L5242
10297  22ef 8d000000      	callf	f_Display_LCD_String
10299  22f3 ae0003        	ldw	x,#_MD_T_Unit
10300  22f6 8d000000      	callf	d_ltor
10301  22fa ae0008        	ldw	x,#L624
10302  22fd 8d000000      	callf	d_lumd
10303  2301 be02          	ldw	x,c_lreg+2
10304  2303 8d000000      	callf	f_Num_Display_LCD
10306  2307 ae02cb        	ldw	x,#L7242
10308  230a 2061          	jpf	LC052
10309  230c               L5045:
10310                     ; 1569 			else if(i==3){
10312  230c a103          	cp	a,#3
10313  230e 2661          	jrne	L3045
10314                     ; 1570 				Set_LCD_Address((unsigned char)(LCD_Line[i]+8));
10316  2310 5f            	clrw	x
10317  2311 97            	ld	xl,a
10318  2312 d60000        	ld	a,(_LCD_Line,x)
10319  2315 ab08          	add	a,#8
10320  2317 8d000000      	callf	f_Set_LCD_Address
10322                     ; 1572 				if((MD_Data_Setting_flag == ON) && (i == MD_Data_Step)){
10324  231b 720300062f    	btjf	_MD_Test_Register,#1,L3245
10326  2320 7b04          	ld	a,(OFST+0,sp)
10327  2322 c10000        	cp	a,_MD_Data_Step
10328  2325 2628          	jrne	L3245
10329                     ; 1573 					if(Blink_50){Display_LCD_String("     ");}
10331  2327 725d0000      	tnz	_Blink_50
10335  232b 26a4          	jrne	LC055
10336                     ; 1575 						if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
10338  232d ce0004        	ldw	x,_MD_T_UpDn
10339  2330 2605          	jrne	L1345
10342  2332               LC056:
10344  2332 ae02c7        	ldw	x,#L7442
10347  2335 2036          	jpf	LC052
10348  2337               L1345:
10349                     ; 1576 						else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
10351  2337 ce0004        	ldw	x,_MD_T_UpDn
10352  233a 5a            	decw	x
10353  233b 2605          	jrne	L5345
10356  233d               LC057:
10358  233d ae02c4        	ldw	x,#L5542
10361  2340 202b          	jpf	LC052
10362  2342               L5345:
10363                     ; 1577 						else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
10365  2342 ce0004        	ldw	x,_MD_T_UpDn
10366  2345 a30002        	cpw	x,#2
10367  2348 2618          	jrne	L1645
10370  234a               LC058:
10372  234a ae02bf        	ldw	x,#L3642
10375  234d 201e          	jpf	LC052
10376                     ; 1578 						else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
10379  234f               L3245:
10380                     ; 1582 					if(MD_T_UpDn == 0){	Display_LCD_String("OFF");}
10382  234f ce0004        	ldw	x,_MD_T_UpDn
10386  2352 27de          	jreq	LC056
10387                     ; 1583 					else if(MD_T_UpDn == 1){ Display_LCD_String("UP");}
10389  2354 ce0004        	ldw	x,_MD_T_UpDn
10390  2357 5a            	decw	x
10394  2358 27e3          	jreq	LC057
10395                     ; 1584 					else if(MD_T_UpDn == 2){ Display_LCD_String("DOWN");}
10397  235a ce0004        	ldw	x,_MD_T_UpDn
10398  235d a30002        	cpw	x,#2
10402  2360 27e8          	jreq	LC058
10403  2362               L1645:
10404                     ; 1585 					else if(MD_T_UpDn == 3){ Display_LCD_String("UP&DN");}
10409  2362 ce0004        	ldw	x,_MD_T_UpDn
10410  2365 a30003        	cpw	x,#3
10411  2368 2607          	jrne	L3045
10413  236a ae02b9        	ldw	x,#L1742
10414  236d               LC052:
10415  236d 8d000000      	callf	f_Display_LCD_String
10417  2371               L3045:
10418                     ; 1523 		for(i=0; i<4; i++){
10420  2371 0c04          	inc	(OFST+0,sp)
10423  2373 7b04          	ld	a,(OFST+0,sp)
10424  2375 a104          	cp	a,#4
10425  2377 2404ac362236  	jrult	L3535
10427  237d ac8e288e      	jra	L3035
10428  2381               L1535:
10429                     ; 1591 		for(i=0;i<4;i++){
10431  2381 4f            	clr	a
10432  2382 6b04          	ld	(OFST+0,sp),a
10433  2384               L1745:
10434                     ; 1592 			Set_LCD_Address(LCD_Line[i]);
10436  2384 5f            	clrw	x
10437  2385 97            	ld	xl,a
10438  2386 d60000        	ld	a,(_LCD_Line,x)
10439  2389 8d000000      	callf	f_Set_LCD_Address
10441                     ; 1593 			Display_LCD_String(LCD_Dis_Data[i]);
10443  238d 7b04          	ld	a,(OFST+0,sp)
10444  238f 97            	ld	xl,a
10445  2390 a610          	ld	a,#16
10446  2392 42            	mul	x,a
10447  2393 1c0000        	addw	x,#_LCD_Dis_Data
10448  2396 8d000000      	callf	f_Display_LCD_String
10450                     ; 1591 		for(i=0;i<4;i++){
10452  239a 0c04          	inc	(OFST+0,sp)
10455  239c 7b04          	ld	a,(OFST+0,sp)
10456  239e a104          	cp	a,#4
10457  23a0 25e2          	jrult	L1745
10458                     ; 1595 		Set_LCD_Address((unsigned char)(LCD_Line[3]+14));
10460  23a2 c60003        	ld	a,_LCD_Line+3
10461  23a5 ab0e          	add	a,#14
10462  23a7 8d000000      	callf	f_Set_LCD_Address
10464                     ; 1596 		Display_LCD_String("D");
10466  23ab ae02b2        	ldw	x,#L3552
10467  23ae 8d000000      	callf	f_Display_LCD_String
10469                     ; 1597 		Num_Display_LCD(MD_Test_Pg-1);
10471  23b2 c60001        	ld	a,_MD_Test_Pg
10472  23b5 5f            	clrw	x
10473  23b6 97            	ld	xl,a
10474  23b7 5a            	decw	x
10475  23b8 8d000000      	callf	f_Num_Display_LCD
10477                     ; 1600 		if(MD_ID355_Data[0] & 0x01){
10479  23bc 720100313b    	btjf	_MD_ID355_Data,#0,L7745
10480                     ; 1601 			fault_cnt++;
10482  23c1 0c03          	inc	(OFST-1,sp)
10483                     ; 1602 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10483                     ; 1603 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10485  23c3 270d          	jreq	L5055
10487  23c5 7b03          	ld	a,(OFST-1,sp)
10488  23c7 a105          	cp	a,#5
10489  23c9 2407          	jruge	L5055
10491  23cb c60001        	ld	a,_MD_Test_Pg
10492  23ce a102          	cp	a,#2
10493  23d0 2711          	jreq	L3055
10494  23d2               L5055:
10496  23d2 7b03          	ld	a,(OFST-1,sp)
10497  23d4 a105          	cp	a,#5
10498  23d6 2524          	jrult	L7745
10500  23d8 a109          	cp	a,#9
10501  23da 2420          	jruge	L7745
10503  23dc c60001        	ld	a,_MD_Test_Pg
10504  23df a103          	cp	a,#3
10505  23e1 2619          	jrne	L7745
10506  23e3               L3055:
10507                     ; 1604 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10509  23e3 7b03          	ld	a,(OFST-1,sp)
10510  23e5 5f            	clrw	x
10511  23e6 97            	ld	xl,a
10512  23e7 5a            	decw	x
10513  23e8 a604          	ld	a,#4
10514  23ea 8d000000      	callf	d_smodx
10516  23ee d60000        	ld	a,(_LCD_Line,x)
10517  23f1 8d000000      	callf	f_Set_LCD_Address
10519                     ; 1605 				Display_LCD_String("Flt_LV_Low ");
10521  23f5 ae02a6        	ldw	x,#L5752
10522  23f8 8d000000      	callf	f_Display_LCD_String
10524  23fc               L7745:
10525                     ; 1609 		if(MD_ID355_Data[0] & 0x02){
10527  23fc 720300313b    	btjf	_MD_ID355_Data,#1,L1155
10528                     ; 1610 			fault_cnt++;
10530  2401 0c03          	inc	(OFST-1,sp)
10531                     ; 1611 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10531                     ; 1612 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10533  2403 270d          	jreq	L7155
10535  2405 7b03          	ld	a,(OFST-1,sp)
10536  2407 a105          	cp	a,#5
10537  2409 2407          	jruge	L7155
10539  240b c60001        	ld	a,_MD_Test_Pg
10540  240e a102          	cp	a,#2
10541  2410 2711          	jreq	L5155
10542  2412               L7155:
10544  2412 7b03          	ld	a,(OFST-1,sp)
10545  2414 a105          	cp	a,#5
10546  2416 2524          	jrult	L1155
10548  2418 a109          	cp	a,#9
10549  241a 2420          	jruge	L1155
10551  241c c60001        	ld	a,_MD_Test_Pg
10552  241f a103          	cp	a,#3
10553  2421 2619          	jrne	L1155
10554  2423               L5155:
10555                     ; 1613 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10557  2423 7b03          	ld	a,(OFST-1,sp)
10558  2425 5f            	clrw	x
10559  2426 97            	ld	xl,a
10560  2427 5a            	decw	x
10561  2428 a604          	ld	a,#4
10562  242a 8d000000      	callf	d_smodx
10564  242e d60000        	ld	a,(_LCD_Line,x)
10565  2431 8d000000      	callf	f_Set_LCD_Address
10567                     ; 1614 				Display_LCD_String("Flt_LV_High ");
10569  2435 ae0299        	ldw	x,#L7162
10570  2438 8d000000      	callf	f_Display_LCD_String
10572  243c               L1155:
10573                     ; 1618 		if(MD_ID355_Data[0] & 0x04){
10575  243c 720500313b    	btjf	_MD_ID355_Data,#2,L3255
10576                     ; 1619 			fault_cnt++;
10578  2441 0c03          	inc	(OFST-1,sp)
10579                     ; 1620 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10579                     ; 1621 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10581  2443 270d          	jreq	L1355
10583  2445 7b03          	ld	a,(OFST-1,sp)
10584  2447 a105          	cp	a,#5
10585  2449 2407          	jruge	L1355
10587  244b c60001        	ld	a,_MD_Test_Pg
10588  244e a102          	cp	a,#2
10589  2450 2711          	jreq	L7255
10590  2452               L1355:
10592  2452 7b03          	ld	a,(OFST-1,sp)
10593  2454 a105          	cp	a,#5
10594  2456 2524          	jrult	L3255
10596  2458 a109          	cp	a,#9
10597  245a 2420          	jruge	L3255
10599  245c c60001        	ld	a,_MD_Test_Pg
10600  245f a103          	cp	a,#3
10601  2461 2619          	jrne	L3255
10602  2463               L7255:
10603                     ; 1622 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10605  2463 7b03          	ld	a,(OFST-1,sp)
10606  2465 5f            	clrw	x
10607  2466 97            	ld	xl,a
10608  2467 5a            	decw	x
10609  2468 a604          	ld	a,#4
10610  246a 8d000000      	callf	d_smodx
10612  246e d60000        	ld	a,(_LCD_Line,x)
10613  2471 8d000000      	callf	f_Set_LCD_Address
10615                     ; 1623 				Display_LCD_String("Flt_HV_Low ");
10617  2475 ae028d        	ldw	x,#L1462
10618  2478 8d000000      	callf	f_Display_LCD_String
10620  247c               L3255:
10621                     ; 1627 		if(MD_ID355_Data[0] & 0x08){
10623  247c 720700313b    	btjf	_MD_ID355_Data,#3,L5355
10624                     ; 1628 			fault_cnt++;
10626  2481 0c03          	inc	(OFST-1,sp)
10627                     ; 1629 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10627                     ; 1630 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10629  2483 270d          	jreq	L3455
10631  2485 7b03          	ld	a,(OFST-1,sp)
10632  2487 a105          	cp	a,#5
10633  2489 2407          	jruge	L3455
10635  248b c60001        	ld	a,_MD_Test_Pg
10636  248e a102          	cp	a,#2
10637  2490 2711          	jreq	L1455
10638  2492               L3455:
10640  2492 7b03          	ld	a,(OFST-1,sp)
10641  2494 a105          	cp	a,#5
10642  2496 2524          	jrult	L5355
10644  2498 a109          	cp	a,#9
10645  249a 2420          	jruge	L5355
10647  249c c60001        	ld	a,_MD_Test_Pg
10648  249f a103          	cp	a,#3
10649  24a1 2619          	jrne	L5355
10650  24a3               L1455:
10651                     ; 1631 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10653  24a3 7b03          	ld	a,(OFST-1,sp)
10654  24a5 5f            	clrw	x
10655  24a6 97            	ld	xl,a
10656  24a7 5a            	decw	x
10657  24a8 a604          	ld	a,#4
10658  24aa 8d000000      	callf	d_smodx
10660  24ae d60000        	ld	a,(_LCD_Line,x)
10661  24b1 8d000000      	callf	f_Set_LCD_Address
10663                     ; 1632 				Display_LCD_String("Flt_HV_High ");
10665  24b5 ae0280        	ldw	x,#L3662
10666  24b8 8d000000      	callf	f_Display_LCD_String
10668  24bc               L5355:
10669                     ; 1636 		if(MD_ID355_Data[0] & 0x10){
10671  24bc 720900313b    	btjf	_MD_ID355_Data,#4,L7455
10672                     ; 1637 			fault_cnt++;
10674  24c1 0c03          	inc	(OFST-1,sp)
10675                     ; 1638 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10675                     ; 1639 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10677  24c3 270d          	jreq	L5555
10679  24c5 7b03          	ld	a,(OFST-1,sp)
10680  24c7 a105          	cp	a,#5
10681  24c9 2407          	jruge	L5555
10683  24cb c60001        	ld	a,_MD_Test_Pg
10684  24ce a102          	cp	a,#2
10685  24d0 2711          	jreq	L3555
10686  24d2               L5555:
10688  24d2 7b03          	ld	a,(OFST-1,sp)
10689  24d4 a105          	cp	a,#5
10690  24d6 2524          	jrult	L7455
10692  24d8 a109          	cp	a,#9
10693  24da 2420          	jruge	L7455
10695  24dc c60001        	ld	a,_MD_Test_Pg
10696  24df a103          	cp	a,#3
10697  24e1 2619          	jrne	L7455
10698  24e3               L3555:
10699                     ; 1640 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10701  24e3 7b03          	ld	a,(OFST-1,sp)
10702  24e5 5f            	clrw	x
10703  24e6 97            	ld	xl,a
10704  24e7 5a            	decw	x
10705  24e8 a604          	ld	a,#4
10706  24ea 8d000000      	callf	d_smodx
10708  24ee d60000        	ld	a,(_LCD_Line,x)
10709  24f1 8d000000      	callf	f_Set_LCD_Address
10711                     ; 1641 				Display_LCD_String("Flt_Over_Cur ");
10713  24f5 ae0272        	ldw	x,#L5072
10714  24f8 8d000000      	callf	f_Display_LCD_String
10716  24fc               L7455:
10717                     ; 1645 		if(MD_ID355_Data[0] & 0x20){
10719  24fc 720b00313b    	btjf	_MD_ID355_Data,#5,L1655
10720                     ; 1646 			fault_cnt++;
10722  2501 0c03          	inc	(OFST-1,sp)
10723                     ; 1647 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10723                     ; 1648 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10725  2503 270d          	jreq	L7655
10727  2505 7b03          	ld	a,(OFST-1,sp)
10728  2507 a105          	cp	a,#5
10729  2509 2407          	jruge	L7655
10731  250b c60001        	ld	a,_MD_Test_Pg
10732  250e a102          	cp	a,#2
10733  2510 2711          	jreq	L5655
10734  2512               L7655:
10736  2512 7b03          	ld	a,(OFST-1,sp)
10737  2514 a105          	cp	a,#5
10738  2516 2524          	jrult	L1655
10740  2518 a109          	cp	a,#9
10741  251a 2420          	jruge	L1655
10743  251c c60001        	ld	a,_MD_Test_Pg
10744  251f a103          	cp	a,#3
10745  2521 2619          	jrne	L1655
10746  2523               L5655:
10747                     ; 1649 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10749  2523 7b03          	ld	a,(OFST-1,sp)
10750  2525 5f            	clrw	x
10751  2526 97            	ld	xl,a
10752  2527 5a            	decw	x
10753  2528 a604          	ld	a,#4
10754  252a 8d000000      	callf	d_smodx
10756  252e d60000        	ld	a,(_LCD_Line,x)
10757  2531 8d000000      	callf	f_Set_LCD_Address
10759                     ; 1650 				Display_LCD_String("Flt_OverT_Core ");
10761  2535 ae00ac        	ldw	x,#L3755
10762  2538 8d000000      	callf	f_Display_LCD_String
10764  253c               L1655:
10765                     ; 1654 		if(MD_ID355_Data[0] & 0x40){
10767  253c 720d00313b    	btjf	_MD_ID355_Data,#6,L5755
10768                     ; 1655 			fault_cnt++;
10770  2541 0c03          	inc	(OFST-1,sp)
10771                     ; 1656 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10771                     ; 1657 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10773  2543 270d          	jreq	L3065
10775  2545 7b03          	ld	a,(OFST-1,sp)
10776  2547 a105          	cp	a,#5
10777  2549 2407          	jruge	L3065
10779  254b c60001        	ld	a,_MD_Test_Pg
10780  254e a102          	cp	a,#2
10781  2550 2711          	jreq	L1065
10782  2552               L3065:
10784  2552 7b03          	ld	a,(OFST-1,sp)
10785  2554 a105          	cp	a,#5
10786  2556 2524          	jrult	L5755
10788  2558 a109          	cp	a,#9
10789  255a 2420          	jruge	L5755
10791  255c c60001        	ld	a,_MD_Test_Pg
10792  255f a103          	cp	a,#3
10793  2561 2619          	jrne	L5755
10794  2563               L1065:
10795                     ; 1658 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10797  2563 7b03          	ld	a,(OFST-1,sp)
10798  2565 5f            	clrw	x
10799  2566 97            	ld	xl,a
10800  2567 5a            	decw	x
10801  2568 a604          	ld	a,#4
10802  256a 8d000000      	callf	d_smodx
10804  256e d60000        	ld	a,(_LCD_Line,x)
10805  2571 8d000000      	callf	f_Set_LCD_Address
10807                     ; 1659 				Display_LCD_String("Flt_OverT_PCB ");
10809  2575 ae009d        	ldw	x,#L7065
10810  2578 8d000000      	callf	f_Display_LCD_String
10812  257c               L5755:
10813                     ; 1663 		if(MD_ID355_Data[0] & 0x80){
10815  257c 720f00313b    	btjf	_MD_ID355_Data,#7,L1165
10816                     ; 1664 			fault_cnt++;
10818  2581 0c03          	inc	(OFST-1,sp)
10819                     ; 1665 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10819                     ; 1666 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10821  2583 270d          	jreq	L7165
10823  2585 7b03          	ld	a,(OFST-1,sp)
10824  2587 a105          	cp	a,#5
10825  2589 2407          	jruge	L7165
10827  258b c60001        	ld	a,_MD_Test_Pg
10828  258e a102          	cp	a,#2
10829  2590 2711          	jreq	L5165
10830  2592               L7165:
10832  2592 7b03          	ld	a,(OFST-1,sp)
10833  2594 a105          	cp	a,#5
10834  2596 2524          	jrult	L1165
10836  2598 a109          	cp	a,#9
10837  259a 2420          	jruge	L1165
10839  259c c60001        	ld	a,_MD_Test_Pg
10840  259f a103          	cp	a,#3
10841  25a1 2619          	jrne	L1165
10842  25a3               L5165:
10843                     ; 1667 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10845  25a3 7b03          	ld	a,(OFST-1,sp)
10846  25a5 5f            	clrw	x
10847  25a6 97            	ld	xl,a
10848  25a7 5a            	decw	x
10849  25a8 a604          	ld	a,#4
10850  25aa 8d000000      	callf	d_smodx
10852  25ae d60000        	ld	a,(_LCD_Line,x)
10853  25b1 8d000000      	callf	f_Set_LCD_Address
10855                     ; 1668 				Display_LCD_String("Flt_OverT_IGBT ");
10857  25b5 ae008d        	ldw	x,#L3265
10858  25b8 8d000000      	callf	f_Display_LCD_String
10860  25bc               L1165:
10861                     ; 1672 		if(MD_ID355_Data[2] & 0x01){
10863  25bc 720100333b    	btjf	_MD_ID355_Data+2,#0,L5265
10864                     ; 1673 			fault_cnt++;
10866  25c1 0c03          	inc	(OFST-1,sp)
10867                     ; 1674 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10867                     ; 1675 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10869  25c3 270d          	jreq	L3365
10871  25c5 7b03          	ld	a,(OFST-1,sp)
10872  25c7 a105          	cp	a,#5
10873  25c9 2407          	jruge	L3365
10875  25cb c60001        	ld	a,_MD_Test_Pg
10876  25ce a102          	cp	a,#2
10877  25d0 2711          	jreq	L1365
10878  25d2               L3365:
10880  25d2 7b03          	ld	a,(OFST-1,sp)
10881  25d4 a105          	cp	a,#5
10882  25d6 2524          	jrult	L5265
10884  25d8 a109          	cp	a,#9
10885  25da 2420          	jruge	L5265
10887  25dc c60001        	ld	a,_MD_Test_Pg
10888  25df a103          	cp	a,#3
10889  25e1 2619          	jrne	L5265
10890  25e3               L1365:
10891                     ; 1676 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10893  25e3 7b03          	ld	a,(OFST-1,sp)
10894  25e5 5f            	clrw	x
10895  25e6 97            	ld	xl,a
10896  25e7 5a            	decw	x
10897  25e8 a604          	ld	a,#4
10898  25ea 8d000000      	callf	d_smodx
10900  25ee d60000        	ld	a,(_LCD_Line,x)
10901  25f1 8d000000      	callf	f_Set_LCD_Address
10903                     ; 1677 				Display_LCD_String("Flt_Msg_TOUT ");
10905  25f5 ae007f        	ldw	x,#L7365
10906  25f8 8d000000      	callf	f_Display_LCD_String
10908  25fc               L5265:
10909                     ; 1681 		if(MD_ID355_Data[2] & 0x02){
10911  25fc 720300333b    	btjf	_MD_ID355_Data+2,#1,L1465
10912                     ; 1682 			fault_cnt++;
10914  2601 0c03          	inc	(OFST-1,sp)
10915                     ; 1683 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10915                     ; 1684 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10917  2603 270d          	jreq	L7465
10919  2605 7b03          	ld	a,(OFST-1,sp)
10920  2607 a105          	cp	a,#5
10921  2609 2407          	jruge	L7465
10923  260b c60001        	ld	a,_MD_Test_Pg
10924  260e a102          	cp	a,#2
10925  2610 2711          	jreq	L5465
10926  2612               L7465:
10928  2612 7b03          	ld	a,(OFST-1,sp)
10929  2614 a105          	cp	a,#5
10930  2616 2524          	jrult	L1465
10932  2618 a109          	cp	a,#9
10933  261a 2420          	jruge	L1465
10935  261c c60001        	ld	a,_MD_Test_Pg
10936  261f a103          	cp	a,#3
10937  2621 2619          	jrne	L1465
10938  2623               L5465:
10939                     ; 1685 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10941  2623 7b03          	ld	a,(OFST-1,sp)
10942  2625 5f            	clrw	x
10943  2626 97            	ld	xl,a
10944  2627 5a            	decw	x
10945  2628 a604          	ld	a,#4
10946  262a 8d000000      	callf	d_smodx
10948  262e d60000        	ld	a,(_LCD_Line,x)
10949  2631 8d000000      	callf	f_Set_LCD_Address
10951                     ; 1686 				Display_LCD_String("Fail_LV_Sen ");
10953  2635 ae0239        	ldw	x,#L5303
10954  2638 8d000000      	callf	f_Display_LCD_String
10956  263c               L1465:
10957                     ; 1690 		if(MD_ID355_Data[2] & 0x04){
10959  263c 720500333b    	btjf	_MD_ID355_Data+2,#2,L3565
10960                     ; 1691 			fault_cnt++;
10962  2641 0c03          	inc	(OFST-1,sp)
10963                     ; 1692 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
10963                     ; 1693 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
10965  2643 270d          	jreq	L1665
10967  2645 7b03          	ld	a,(OFST-1,sp)
10968  2647 a105          	cp	a,#5
10969  2649 2407          	jruge	L1665
10971  264b c60001        	ld	a,_MD_Test_Pg
10972  264e a102          	cp	a,#2
10973  2650 2711          	jreq	L7565
10974  2652               L1665:
10976  2652 7b03          	ld	a,(OFST-1,sp)
10977  2654 a105          	cp	a,#5
10978  2656 2524          	jrult	L3565
10980  2658 a109          	cp	a,#9
10981  265a 2420          	jruge	L3565
10983  265c c60001        	ld	a,_MD_Test_Pg
10984  265f a103          	cp	a,#3
10985  2661 2619          	jrne	L3565
10986  2663               L7565:
10987                     ; 1694 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
10989  2663 7b03          	ld	a,(OFST-1,sp)
10990  2665 5f            	clrw	x
10991  2666 97            	ld	xl,a
10992  2667 5a            	decw	x
10993  2668 a604          	ld	a,#4
10994  266a 8d000000      	callf	d_smodx
10996  266e d60000        	ld	a,(_LCD_Line,x)
10997  2671 8d000000      	callf	f_Set_LCD_Address
10999                     ; 1695 				Display_LCD_String("Fail_HV_Sen ");
11001  2675 ae0246        	ldw	x,#L3103
11002  2678 8d000000      	callf	f_Display_LCD_String
11004  267c               L3565:
11005                     ; 1699 		if(MD_ID355_Data[2] & 0x08){
11007  267c 720700333b    	btjf	_MD_ID355_Data+2,#3,L5665
11008                     ; 1700 			fault_cnt++;
11010  2681 0c03          	inc	(OFST-1,sp)
11011                     ; 1701 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11011                     ; 1702 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11013  2683 270d          	jreq	L3765
11015  2685 7b03          	ld	a,(OFST-1,sp)
11016  2687 a105          	cp	a,#5
11017  2689 2407          	jruge	L3765
11019  268b c60001        	ld	a,_MD_Test_Pg
11020  268e a102          	cp	a,#2
11021  2690 2711          	jreq	L1765
11022  2692               L3765:
11024  2692 7b03          	ld	a,(OFST-1,sp)
11025  2694 a105          	cp	a,#5
11026  2696 2524          	jrult	L5665
11028  2698 a109          	cp	a,#9
11029  269a 2420          	jruge	L5665
11031  269c c60001        	ld	a,_MD_Test_Pg
11032  269f a103          	cp	a,#3
11033  26a1 2619          	jrne	L5665
11034  26a3               L1765:
11035                     ; 1703 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11037  26a3 7b03          	ld	a,(OFST-1,sp)
11038  26a5 5f            	clrw	x
11039  26a6 97            	ld	xl,a
11040  26a7 5a            	decw	x
11041  26a8 a604          	ld	a,#4
11042  26aa 8d000000      	callf	d_smodx
11044  26ae d60000        	ld	a,(_LCD_Line,x)
11045  26b1 8d000000      	callf	f_Set_LCD_Address
11047                     ; 1704 				Display_LCD_String("Fail_Cur_Sen ");
11049  26b5 ae022b        	ldw	x,#L7503
11050  26b8 8d000000      	callf	f_Display_LCD_String
11052  26bc               L5665:
11053                     ; 1708 		if(MD_ID355_Data[2] & 0x10){
11055  26bc 720900333b    	btjf	_MD_ID355_Data+2,#4,L7765
11056                     ; 1709 			fault_cnt++;
11058  26c1 0c03          	inc	(OFST-1,sp)
11059                     ; 1710 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11059                     ; 1711 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11061  26c3 270d          	jreq	L5075
11063  26c5 7b03          	ld	a,(OFST-1,sp)
11064  26c7 a105          	cp	a,#5
11065  26c9 2407          	jruge	L5075
11067  26cb c60001        	ld	a,_MD_Test_Pg
11068  26ce a102          	cp	a,#2
11069  26d0 2711          	jreq	L3075
11070  26d2               L5075:
11072  26d2 7b03          	ld	a,(OFST-1,sp)
11073  26d4 a105          	cp	a,#5
11074  26d6 2524          	jrult	L7765
11076  26d8 a109          	cp	a,#9
11077  26da 2420          	jruge	L7765
11079  26dc c60001        	ld	a,_MD_Test_Pg
11080  26df a103          	cp	a,#3
11081  26e1 2619          	jrne	L7765
11082  26e3               L3075:
11083                     ; 1712 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11085  26e3 7b03          	ld	a,(OFST-1,sp)
11086  26e5 5f            	clrw	x
11087  26e6 97            	ld	xl,a
11088  26e7 5a            	decw	x
11089  26e8 a604          	ld	a,#4
11090  26ea 8d000000      	callf	d_smodx
11092  26ee d60000        	ld	a,(_LCD_Line,x)
11093  26f1 8d000000      	callf	f_Set_LCD_Address
11095                     ; 1713 				Display_LCD_String("Fail_Opn_CoreT ");
11097  26f5 ae006f        	ldw	x,#L1175
11098  26f8 8d000000      	callf	f_Display_LCD_String
11100  26fc               L7765:
11101                     ; 1717 		if(MD_ID355_Data[2] & 0x20){
11103  26fc 720b00333b    	btjf	_MD_ID355_Data+2,#5,L3175
11104                     ; 1718 			fault_cnt++;
11106  2701 0c03          	inc	(OFST-1,sp)
11107                     ; 1719 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11107                     ; 1720 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11109  2703 270d          	jreq	L1275
11111  2705 7b03          	ld	a,(OFST-1,sp)
11112  2707 a105          	cp	a,#5
11113  2709 2407          	jruge	L1275
11115  270b c60001        	ld	a,_MD_Test_Pg
11116  270e a102          	cp	a,#2
11117  2710 2711          	jreq	L7175
11118  2712               L1275:
11120  2712 7b03          	ld	a,(OFST-1,sp)
11121  2714 a105          	cp	a,#5
11122  2716 2524          	jrult	L3175
11124  2718 a109          	cp	a,#9
11125  271a 2420          	jruge	L3175
11127  271c c60001        	ld	a,_MD_Test_Pg
11128  271f a103          	cp	a,#3
11129  2721 2619          	jrne	L3175
11130  2723               L7175:
11131                     ; 1721 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11133  2723 7b03          	ld	a,(OFST-1,sp)
11134  2725 5f            	clrw	x
11135  2726 97            	ld	xl,a
11136  2727 5a            	decw	x
11137  2728 a604          	ld	a,#4
11138  272a 8d000000      	callf	d_smodx
11140  272e d60000        	ld	a,(_LCD_Line,x)
11141  2731 8d000000      	callf	f_Set_LCD_Address
11143                     ; 1722 				Display_LCD_String("Fail_Srt_CoreT ");
11145  2735 ae005f        	ldw	x,#L5275
11146  2738 8d000000      	callf	f_Display_LCD_String
11148  273c               L3175:
11149                     ; 1726 		if(MD_ID355_Data[2] & 0x40){
11151  273c 720d00333b    	btjf	_MD_ID355_Data+2,#6,L7275
11152                     ; 1727 			fault_cnt++;
11154  2741 0c03          	inc	(OFST-1,sp)
11155                     ; 1728 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11155                     ; 1729 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11157  2743 270d          	jreq	L5375
11159  2745 7b03          	ld	a,(OFST-1,sp)
11160  2747 a105          	cp	a,#5
11161  2749 2407          	jruge	L5375
11163  274b c60001        	ld	a,_MD_Test_Pg
11164  274e a102          	cp	a,#2
11165  2750 2711          	jreq	L3375
11166  2752               L5375:
11168  2752 7b03          	ld	a,(OFST-1,sp)
11169  2754 a105          	cp	a,#5
11170  2756 2524          	jrult	L7275
11172  2758 a109          	cp	a,#9
11173  275a 2420          	jruge	L7275
11175  275c c60001        	ld	a,_MD_Test_Pg
11176  275f a103          	cp	a,#3
11177  2761 2619          	jrne	L7275
11178  2763               L3375:
11179                     ; 1730 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11181  2763 7b03          	ld	a,(OFST-1,sp)
11182  2765 5f            	clrw	x
11183  2766 97            	ld	xl,a
11184  2767 5a            	decw	x
11185  2768 a604          	ld	a,#4
11186  276a 8d000000      	callf	d_smodx
11188  276e d60000        	ld	a,(_LCD_Line,x)
11189  2771 8d000000      	callf	f_Set_LCD_Address
11191                     ; 1731 				Display_LCD_String("Fail_Opn_PCBT ");
11193  2775 ae0050        	ldw	x,#L1475
11194  2778 8d000000      	callf	f_Display_LCD_String
11196  277c               L7275:
11197                     ; 1735 		if(MD_ID355_Data[2] & 0x80){
11199  277c 720f00333b    	btjf	_MD_ID355_Data+2,#7,L3475
11200                     ; 1736 			fault_cnt++;
11202  2781 0c03          	inc	(OFST-1,sp)
11203                     ; 1737 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11203                     ; 1738 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11205  2783 270d          	jreq	L1575
11207  2785 7b03          	ld	a,(OFST-1,sp)
11208  2787 a105          	cp	a,#5
11209  2789 2407          	jruge	L1575
11211  278b c60001        	ld	a,_MD_Test_Pg
11212  278e a102          	cp	a,#2
11213  2790 2711          	jreq	L7475
11214  2792               L1575:
11216  2792 7b03          	ld	a,(OFST-1,sp)
11217  2794 a105          	cp	a,#5
11218  2796 2524          	jrult	L3475
11220  2798 a109          	cp	a,#9
11221  279a 2420          	jruge	L3475
11223  279c c60001        	ld	a,_MD_Test_Pg
11224  279f a103          	cp	a,#3
11225  27a1 2619          	jrne	L3475
11226  27a3               L7475:
11227                     ; 1739 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11229  27a3 7b03          	ld	a,(OFST-1,sp)
11230  27a5 5f            	clrw	x
11231  27a6 97            	ld	xl,a
11232  27a7 5a            	decw	x
11233  27a8 a604          	ld	a,#4
11234  27aa 8d000000      	callf	d_smodx
11236  27ae d60000        	ld	a,(_LCD_Line,x)
11237  27b1 8d000000      	callf	f_Set_LCD_Address
11239                     ; 1740 				Display_LCD_String("Fail_Srt_PCBT ");
11241  27b5 ae0041        	ldw	x,#L5575
11242  27b8 8d000000      	callf	f_Display_LCD_String
11244  27bc               L3475:
11245                     ; 1744 		if(MD_ID355_Data[3] & 0x01){
11247  27bc 720100343b    	btjf	_MD_ID355_Data+3,#0,L7575
11248                     ; 1745 			fault_cnt++;
11250  27c1 0c03          	inc	(OFST-1,sp)
11251                     ; 1746 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11251                     ; 1747 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11253  27c3 270d          	jreq	L5675
11255  27c5 7b03          	ld	a,(OFST-1,sp)
11256  27c7 a105          	cp	a,#5
11257  27c9 2407          	jruge	L5675
11259  27cb c60001        	ld	a,_MD_Test_Pg
11260  27ce a102          	cp	a,#2
11261  27d0 2711          	jreq	L3675
11262  27d2               L5675:
11264  27d2 7b03          	ld	a,(OFST-1,sp)
11265  27d4 a105          	cp	a,#5
11266  27d6 2524          	jrult	L7575
11268  27d8 a109          	cp	a,#9
11269  27da 2420          	jruge	L7575
11271  27dc c60001        	ld	a,_MD_Test_Pg
11272  27df a103          	cp	a,#3
11273  27e1 2619          	jrne	L7575
11274  27e3               L3675:
11275                     ; 1748 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11277  27e3 7b03          	ld	a,(OFST-1,sp)
11278  27e5 5f            	clrw	x
11279  27e6 97            	ld	xl,a
11280  27e7 5a            	decw	x
11281  27e8 a604          	ld	a,#4
11282  27ea 8d000000      	callf	d_smodx
11284  27ee d60000        	ld	a,(_LCD_Line,x)
11285  27f1 8d000000      	callf	f_Set_LCD_Address
11287                     ; 1749 				Display_LCD_String("Fail_Opn_IGT ");
11289  27f5 ae0033        	ldw	x,#L1775
11290  27f8 8d000000      	callf	f_Display_LCD_String
11292  27fc               L7575:
11293                     ; 1753 		if(MD_ID355_Data[3] & 0x02){
11295  27fc 720300343b    	btjf	_MD_ID355_Data+3,#1,L3775
11296                     ; 1754 			fault_cnt++;
11298  2801 0c03          	inc	(OFST-1,sp)
11299                     ; 1755 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11299                     ; 1756 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11301  2803 270d          	jreq	L1006
11303  2805 7b03          	ld	a,(OFST-1,sp)
11304  2807 a105          	cp	a,#5
11305  2809 2407          	jruge	L1006
11307  280b c60001        	ld	a,_MD_Test_Pg
11308  280e a102          	cp	a,#2
11309  2810 2711          	jreq	L7775
11310  2812               L1006:
11312  2812 7b03          	ld	a,(OFST-1,sp)
11313  2814 a105          	cp	a,#5
11314  2816 2524          	jrult	L3775
11316  2818 a109          	cp	a,#9
11317  281a 2420          	jruge	L3775
11319  281c c60001        	ld	a,_MD_Test_Pg
11320  281f a103          	cp	a,#3
11321  2821 2619          	jrne	L3775
11322  2823               L7775:
11323                     ; 1757 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11325  2823 7b03          	ld	a,(OFST-1,sp)
11326  2825 5f            	clrw	x
11327  2826 97            	ld	xl,a
11328  2827 5a            	decw	x
11329  2828 a604          	ld	a,#4
11330  282a 8d000000      	callf	d_smodx
11332  282e d60000        	ld	a,(_LCD_Line,x)
11333  2831 8d000000      	callf	f_Set_LCD_Address
11335                     ; 1758 				Display_LCD_String("Fail_Srt_IGT ");
11337  2835 ae0025        	ldw	x,#L5006
11338  2838 8d000000      	callf	f_Display_LCD_String
11340  283c               L3775:
11341                     ; 1762 		if(MD_ID355_Data[3] & 0x04){
11343  283c 720500343b    	btjf	_MD_ID355_Data+3,#2,L7006
11344                     ; 1763 			fault_cnt++;
11346  2841 0c03          	inc	(OFST-1,sp)
11347                     ; 1764 			if(((fault_cnt > 0) && (fault_cnt <=4) && (MD_Test_Pg == 2)) 
11347                     ; 1765 				||((fault_cnt > 4) && (fault_cnt <=8) && (MD_Test_Pg == 3))){
11349  2843 270d          	jreq	L5106
11351  2845 7b03          	ld	a,(OFST-1,sp)
11352  2847 a105          	cp	a,#5
11353  2849 2407          	jruge	L5106
11355  284b c60001        	ld	a,_MD_Test_Pg
11356  284e a102          	cp	a,#2
11357  2850 2711          	jreq	L3106
11358  2852               L5106:
11360  2852 7b03          	ld	a,(OFST-1,sp)
11361  2854 a105          	cp	a,#5
11362  2856 2524          	jrult	L7006
11364  2858 a109          	cp	a,#9
11365  285a 2420          	jruge	L7006
11367  285c c60001        	ld	a,_MD_Test_Pg
11368  285f a103          	cp	a,#3
11369  2861 2619          	jrne	L7006
11370  2863               L3106:
11371                     ; 1766 				Set_LCD_Address((unsigned char)(LCD_Line[(fault_cnt-1)%4]));
11373  2863 7b03          	ld	a,(OFST-1,sp)
11374  2865 5f            	clrw	x
11375  2866 97            	ld	xl,a
11376  2867 5a            	decw	x
11377  2868 a604          	ld	a,#4
11378  286a 8d000000      	callf	d_smodx
11380  286e d60000        	ld	a,(_LCD_Line,x)
11381  2871 8d000000      	callf	f_Set_LCD_Address
11383                     ; 1767 				Display_LCD_String("Fail_IGBT_Srt ");
11385  2875 ae0016        	ldw	x,#L1206
11386  2878 8d000000      	callf	f_Display_LCD_String
11388  287c               L7006:
11389                     ; 1771 		if(!fault_cnt){
11391  287c 7b03          	ld	a,(OFST-1,sp)
11392  287e 260e          	jrne	L3035
11393                     ; 1772 			Set_LCD_Address(LCD_Line[0]);
11395  2880 c60000        	ld	a,_LCD_Line
11396  2883 8d000000      	callf	f_Set_LCD_Address
11398                     ; 1773 			Display_LCD_String("NON");
11400  2887 ae01f7        	ldw	x,#L1713
11401  288a               LC060:
11402  288a 8d000000      	callf	f_Display_LCD_String
11404  288e               L3035:
11405                     ; 1778 	if(MD_Trans_flag == ON){
11407  288e a60f          	ld	a,#15
11408  2890 7205000614    	btjf	_MD_Test_Register,#2,L5206
11409                     ; 1779 		Set_LCD_Address((unsigned char)(0x00+15));
11411  2895 8d000000      	callf	f_Set_LCD_Address
11413                     ; 1780 		if(Blink_30){Display_LCD_String("C");}
11415  2899 725d0000      	tnz	_Blink_30
11416  289d 2705          	jreq	L7206
11419  289f ae01f5        	ldw	x,#L7713
11422  28a2 200c          	jra	L3306
11423  28a4               L7206:
11424                     ; 1781 		else{Display_LCD_String(" ");}
11426  28a4 ae02f2        	ldw	x,#L1622
11428  28a7 2007          	jra	L3306
11429  28a9               L5206:
11430                     ; 1784 		Set_LCD_Address((unsigned char)(0x00+15));
11432  28a9 8d000000      	callf	f_Set_LCD_Address
11434                     ; 1785 		Display_LCD_String("N");
11436  28ad ae01f3        	ldw	x,#L5023
11438  28b0               L3306:
11439  28b0 8d000000      	callf	f_Display_LCD_String
11440                     ; 1788 	if(MD_T_UpDn){
11442  28b4 ce0004        	ldw	x,_MD_T_UpDn
11443  28b7 2752          	jreq	L5306
11444                     ; 1789 		if(MD_T_UpDn == 1){
11446  28b9 ce0004        	ldw	x,_MD_T_UpDn
11447  28bc a30001        	cpw	x,#1
11448  28bf 2611          	jrne	L7306
11449                     ; 1790 			Set_LCD_Address((unsigned char)(0x00+12));
11451  28c1 a60c          	ld	a,#12
11452  28c3 8d000000      	callf	f_Set_LCD_Address
11454                     ; 1791 			if(Blink_30){Display_LCD_String("UP");}
11456  28c7 725d0000      	tnz	_Blink_30
11457  28cb 2737          	jreq	L5606
11460  28cd ae02c4        	ldw	x,#L5542
11463  28d0 2035          	jpf	LC061
11464                     ; 1792 			else{Display_LCD_String("  ");}
11466  28d2               L7306:
11467                     ; 1795 		else if(MD_T_UpDn == 2){
11469  28d2 ce0004        	ldw	x,_MD_T_UpDn
11470  28d5 a30002        	cpw	x,#2
11471  28d8 2611          	jrne	L1506
11472                     ; 1796 			Set_LCD_Address((unsigned char)(0x00+12));
11474  28da a60c          	ld	a,#12
11475  28dc 8d000000      	callf	f_Set_LCD_Address
11477                     ; 1797 			if(Blink_30){Display_LCD_String("DN");}
11479  28e0 725d0000      	tnz	_Blink_30
11480  28e4 271e          	jreq	L5606
11483  28e6 ae0010        	ldw	x,#L5506
11486  28e9 201c          	jpf	LC061
11487                     ; 1798 			else{Display_LCD_String("  ");}
11489  28eb               L1506:
11490                     ; 1800 		else if(MD_T_UpDn == 3){
11492  28eb ce0004        	ldw	x,_MD_T_UpDn
11493  28ee a30003        	cpw	x,#3
11494  28f1 2618          	jrne	L5306
11495                     ; 1801 			Set_LCD_Address((unsigned char)(0x00+11));
11497  28f3 a60b          	ld	a,#11
11498  28f5 8d000000      	callf	f_Set_LCD_Address
11500                     ; 1802 			if(Blink_30){Display_LCD_String("U&D");}
11502  28f9 725d0000      	tnz	_Blink_30
11503  28fd 2705          	jreq	L5606
11506  28ff ae000c        	ldw	x,#L7606
11509  2902 2003          	jpf	LC061
11510  2904               L5606:
11511                     ; 1803 			else{Display_LCD_String("  ");}
11515  2904 ae0013        	ldw	x,#L5406
11516  2907               LC061:
11517  2907 8d000000      	callf	f_Display_LCD_String
11519  290b               L5306:
11520                     ; 1807 	return;
11523  290b 5b04          	addw	sp,#4
11524  290d 87            	retf	
11563                     ; 1812 void ModelX_Value_Change(unsigned char ST)
11563                     ; 1813 {
11564                     	switch	.text
11565  290e               f_ModelX_Value_Change:
11567  290e 88            	push	a
11568       00000000      OFST:	set	0
11571                     ; 1815 	if(ST == 1){
11573  290f 4a            	dec	a
11574  2910 2704acd129d1  	jrne	L7016
11575                     ; 1817 		if(MD_Option_flag){
11577  2916 7206000604ac  	btjf	_MD_Test_Register,#3,L1116
11578                     ; 1818 			if(MD_Data_Step == 1){if(MD_Unit<200){MD_Unit++;}}
11580  291f c60000        	ld	a,_MD_Data_Step
11581  2922 4a            	dec	a
11582  2923 2613          	jrne	L3116
11585  2925 c60007        	ld	a,_MD_Unit
11586  2928 a1c8          	cp	a,#200
11587  292a 2504ac792a79  	jruge	L1616
11590  2930 725c0007      	inc	_MD_Unit
11591  2934 ac792a79      	jra	L1616
11592  2938               L3116:
11593                     ; 1819 			else if(MD_Data_Step == 2){if(MD_T_Unit<1800){MD_T_Unit +=10;}}
11595  2938 c60000        	ld	a,_MD_Data_Step
11596  293b a102          	cp	a,#2
11597  293d 261d          	jrne	L1216
11600  293f ae0003        	ldw	x,#_MD_T_Unit
11601  2942 8d000000      	callf	d_ltor
11603  2946 ae0000        	ldw	x,#L232
11604  2949 8d000000      	callf	d_lcmp
11606  294d 24e5          	jruge	L1616
11609  294f ae0003        	ldw	x,#_MD_T_Unit
11610  2952 a60a          	ld	a,#10
11611  2954 8d000000      	callf	d_lgadc
11613  2958 ac792a79      	jra	L1616
11614  295c               L1216:
11615                     ; 1820 			else if(MD_Data_Step == 3){ 
11617  295c c60000        	ld	a,_MD_Data_Step
11618  295f a103          	cp	a,#3
11619  2961 26f5          	jrne	L1616
11620                     ; 1822 				if(MD_T_UpDn == 0){MD_T_UpDn = 2;}		// off -> down
11622  2963 ce0004        	ldw	x,_MD_T_UpDn
11623  2966 260a          	jrne	L1316
11626  2968 ae0002        	ldw	x,#2
11627  296b cf0004        	ldw	_MD_T_UpDn,x
11629  296e ac792a79      	jra	L1616
11630  2972               L1316:
11631                     ; 1823 				else if(MD_T_UpDn == 2){MD_T_UpDn = 3;}	// down -> up&down
11633  2972 ce0004        	ldw	x,_MD_T_UpDn
11634  2975 a30002        	cpw	x,#2
11635  2978 260a          	jrne	L5316
11638  297a ae0003        	ldw	x,#3
11639  297d cf0004        	ldw	_MD_T_UpDn,x
11641  2980 ac792a79      	jra	L1616
11642  2984               L5316:
11643                     ; 1824 				else if(MD_T_UpDn == 3){MD_T_UpDn = 1;}	// up&down -> up
11645  2984 ce0004        	ldw	x,_MD_T_UpDn
11646  2987 a30003        	cpw	x,#3
11647  298a 260a          	jrne	L1416
11650  298c ae0001        	ldw	x,#1
11651  298f cf0004        	ldw	_MD_T_UpDn,x
11653  2992 ac792a79      	jra	L1616
11654  2996               L1416:
11655                     ; 1825 				else if(MD_T_UpDn == 1){MD_T_UpDn = 0;}	// up -> off
11657  2996 ce0004        	ldw	x,_MD_T_UpDn
11658  2999 5a            	decw	x
11659  299a 26f6          	jrne	L1616
11662  299c 5f            	clrw	x
11663  299d cf0004        	ldw	_MD_T_UpDn,x
11664  29a0 ac792a79      	jra	L1616
11665  29a4               L1116:
11666                     ; 1830 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
11668  29a4 725d0000      	tnz	_MD_Data_Step
11669  29a8 260c          	jrne	L1516
11672  29aa c60000        	ld	a,_PTC_AllowOperation
11673  29ad a801          	xor	a,#1
11674  29af c70000        	ld	_PTC_AllowOperation,a
11676  29b2 ac792a79      	jra	L1616
11677  29b6               L1516:
11678                     ; 1831 			else if(MD_Data_Step == 1){
11680  29b6 c60000        	ld	a,_MD_Data_Step
11681  29b9 4a            	dec	a
11682  29ba 26f6          	jrne	L1616
11683                     ; 1832 				PTC_Heat_Duty += MD_Unit;
11685  29bc c60000        	ld	a,_PTC_Heat_Duty
11686  29bf cb0007        	add	a,_MD_Unit
11687  29c2 c70000        	ld	_PTC_Heat_Duty,a
11688                     ; 1833 				if( PTC_Heat_Duty > 200){PTC_Heat_Duty = 200;}
11690  29c5 a1c9          	cp	a,#201
11691  29c7 25e9          	jrult	L1616
11694  29c9 35c80000      	mov	_PTC_Heat_Duty,#200
11695  29cd ac792a79      	jra	L1616
11696  29d1               L7016:
11697                     ; 1838 	else if(ST == 0){
11699  29d1 7b01          	ld	a,(OFST+1,sp)
11700  29d3 26f8          	jrne	L1616
11701                     ; 1839 		if(MD_Option_flag){
11703  29d5 7207000675    	btjf	_MD_Test_Register,#3,L5616
11704                     ; 1840 			if(MD_Data_Step == 1){if(MD_Unit>1){MD_Unit--;}  }
11706  29da c60000        	ld	a,_MD_Data_Step
11707  29dd 4a            	dec	a
11708  29de 260f          	jrne	L7616
11711  29e0 c60007        	ld	a,_MD_Unit
11712  29e3 a102          	cp	a,#2
11713  29e5 25e6          	jrult	L1616
11716  29e7 725a0007      	dec	_MD_Unit
11717  29eb ac792a79      	jra	L1616
11718  29ef               L7616:
11719                     ; 1841 			else if(MD_Data_Step == 2){if(MD_T_Unit>10){MD_T_Unit -=10;}}
11721  29ef c60000        	ld	a,_MD_Data_Step
11722  29f2 a102          	cp	a,#2
11723  29f4 261b          	jrne	L5716
11726  29f6 ae0003        	ldw	x,#_MD_T_Unit
11727  29f9 8d000000      	callf	d_ltor
11729  29fd ae0004        	ldw	x,#L432
11730  2a00 8d000000      	callf	d_lcmp
11732  2a04 2573          	jrult	L1616
11735  2a06 ae0003        	ldw	x,#_MD_T_Unit
11736  2a09 a60a          	ld	a,#10
11737  2a0b 8d000000      	callf	d_lgsbc
11739  2a0f 2068          	jra	L1616
11740  2a11               L5716:
11741                     ; 1842 			else if(MD_Data_Step == 3){
11743  2a11 c60000        	ld	a,_MD_Data_Step
11744  2a14 a103          	cp	a,#3
11745  2a16 2661          	jrne	L1616
11746                     ; 1844 				if(MD_T_UpDn == 0){ MD_T_UpDn = 1;}	// off ->Up
11748  2a18 ce0004        	ldw	x,_MD_T_UpDn
11749  2a1b 2606          	jrne	L5026
11752  2a1d 5c            	incw	x
11753  2a1e cf0004        	ldw	_MD_T_UpDn,x
11755  2a21 2056          	jra	L1616
11756  2a23               L5026:
11757                     ; 1845 				else if(MD_T_UpDn == 1){ MD_T_UpDn = 3;}	// up ->Up&down
11759  2a23 ce0004        	ldw	x,_MD_T_UpDn
11760  2a26 5a            	decw	x
11761  2a27 2608          	jrne	L1126
11764  2a29 ae0003        	ldw	x,#3
11765  2a2c cf0004        	ldw	_MD_T_UpDn,x
11767  2a2f 2048          	jra	L1616
11768  2a31               L1126:
11769                     ; 1846 				else if(MD_T_UpDn == 3){ MD_T_UpDn = 2;}	// Up&down -> down
11771  2a31 ce0004        	ldw	x,_MD_T_UpDn
11772  2a34 a30003        	cpw	x,#3
11773  2a37 2608          	jrne	L5126
11776  2a39 ae0002        	ldw	x,#2
11777  2a3c cf0004        	ldw	_MD_T_UpDn,x
11779  2a3f 2038          	jra	L1616
11780  2a41               L5126:
11781                     ; 1847 				else if(MD_T_UpDn == 2){MD_T_UpDn = 0;}	// down -> off
11783  2a41 ce0004        	ldw	x,_MD_T_UpDn
11784  2a44 a30002        	cpw	x,#2
11785  2a47 2630          	jrne	L1616
11788  2a49 5f            	clrw	x
11789  2a4a cf0004        	ldw	_MD_T_UpDn,x
11790  2a4d 202a          	jra	L1616
11791  2a4f               L5616:
11792                     ; 1851 			if(MD_Data_Step == 0){PTC_AllowOperation ^= 1;}
11794  2a4f 725d0000      	tnz	_MD_Data_Step
11795  2a53 260a          	jrne	L5226
11798  2a55 c60000        	ld	a,_PTC_AllowOperation
11799  2a58 a801          	xor	a,#1
11800  2a5a c70000        	ld	_PTC_AllowOperation,a
11802  2a5d 201a          	jra	L1616
11803  2a5f               L5226:
11804                     ; 1852 			else if(MD_Data_Step == 1){
11806  2a5f c60000        	ld	a,_MD_Data_Step
11807  2a62 4a            	dec	a
11808  2a63 2614          	jrne	L1616
11809                     ; 1853 				if(PTC_Heat_Duty <MD_Unit){PTC_Heat_Duty = 0;}
11811  2a65 c60000        	ld	a,_PTC_Heat_Duty
11812  2a68 c10007        	cp	a,_MD_Unit
11813  2a6b 2406          	jruge	L3326
11816  2a6d 725f0000      	clr	_PTC_Heat_Duty
11818  2a71 2006          	jra	L1616
11819  2a73               L3326:
11820                     ; 1854 				else{PTC_Heat_Duty -= MD_Unit;}
11822  2a73 c00007        	sub	a,_MD_Unit
11823  2a76 c70000        	ld	_PTC_Heat_Duty,a
11824  2a79               L1616:
11825                     ; 1860 	return;
11828  2a79 84            	pop	a
11829  2a7a 87            	retf	
11860                     ; 1864 void ModelX_Switch_Control(void)
11860                     ; 1865 {
11861                     	switch	.text
11862  2a7b               f_ModelX_Switch_Control:
11866                     ; 1866 	if(UP_SW_flag == ON){
11868  2a7b 7203000051    	btjf	_SW_Status,#1,L7426
11869                     ; 1868 		if(MD_Data_Setting_flag == ON){	ModelX_Value_Change(1);}
11871  2a80 7203000608    	btjf	_MD_Test_Register,#1,L1526
11874  2a85 a601          	ld	a,#1
11875  2a87 8d0e290e      	callf	f_ModelX_Value_Change
11878  2a8b 203e          	jra	L3526
11879  2a8d               L1526:
11880                     ; 1869 		else if(MD_Data_Select_flag == ON){
11882  2a8d 720100061a    	btjf	_MD_Test_Register,#0,L5526
11883                     ; 1870 			if(MD_Option_flag){if(MD_Data_Step > 1){ MD_Data_Step--;}}
11885  2a92 7207000609    	btjf	_MD_Test_Register,#3,L7526
11888  2a97 c60000        	ld	a,_MD_Data_Step
11889  2a9a a102          	cp	a,#2
11890  2a9c 252d          	jrult	L3526
11892  2a9e 2006          	jpf	LC063
11893  2aa0               L7526:
11894                     ; 1871 			else{ if(MD_Data_Step > 0){ MD_Data_Step--;}	}
11896  2aa0 725d0000      	tnz	_MD_Data_Step
11897  2aa4 2725          	jreq	L3526
11900  2aa6               LC063:
11902  2aa6 725a0000      	dec	_MD_Data_Step
11903  2aaa 201f          	jra	L3526
11904  2aac               L5526:
11905                     ; 1873 			if(!MD_Option_flag){ 
11907  2aac 720600061a    	btjt	_MD_Test_Register,#3,L3526
11908                     ; 1874 				if(MD_Test_Pg > 0){ MD_Test_Pg--;}
11910  2ab1 725d0001      	tnz	_MD_Test_Pg
11911  2ab5 2706          	jreq	L3726
11914  2ab7 725a0001      	dec	_MD_Test_Pg
11916  2abb 2004          	jra	L5726
11917  2abd               L3726:
11918                     ; 1875 				else{MD_Test_Pg = 3;}
11920  2abd 35030001      	mov	_MD_Test_Pg,#3
11921  2ac1               L5726:
11922                     ; 1876 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
11924  2ac1 725d0001      	tnz	_MD_Test_Pg
11925  2ac5 2604          	jrne	L3526
11928  2ac7 725f0000      	clr	_MD_Data_Step
11929  2acb               L3526:
11930                     ; 1879 		UP_SW_flag = OFF;
11932  2acb 72130000      	bres	_SW_Status,#1
11934  2acf 2054          	jra	L1036
11935  2ad1               L7426:
11936                     ; 1882 	else if(DN_SW_flag == ON){ 
11938  2ad1 720500004f    	btjf	_SW_Status,#2,L1036
11939                     ; 1885 		if(MD_Data_Setting_flag == ON){	ModelX_Value_Change(0);}
11941  2ad6 7203000607    	btjf	_MD_Test_Register,#1,L5036
11944  2adb 4f            	clr	a
11945  2adc 8d0e290e      	callf	f_ModelX_Value_Change
11948  2ae0 203f          	jra	L7036
11949  2ae2               L5036:
11950                     ; 1887 		else if(MD_Data_Select_flag == ON){
11952  2ae2 720100061a    	btjf	_MD_Test_Register,#0,L1136
11953                     ; 1888 			if(MD_Option_flag){
11955  2ae7 7207000609    	btjf	_MD_Test_Register,#3,L3136
11956                     ; 1889 				if(MD_Data_Step < 3){ MD_Data_Step++;}
11958  2aec c60000        	ld	a,_MD_Data_Step
11959  2aef a103          	cp	a,#3
11960  2af1 242e          	jruge	L7036
11962  2af3 2006          	jpf	LC064
11963  2af5               L3136:
11964                     ; 1890 			}else{ if(MD_Data_Step < 1){ MD_Data_Step++;}}
11966  2af5 725d0000      	tnz	_MD_Data_Step
11967  2af9 2626          	jrne	L7036
11970  2afb               LC064:
11972  2afb 725c0000      	inc	_MD_Data_Step
11973  2aff 2020          	jra	L7036
11974  2b01               L1136:
11975                     ; 1893 			if(!MD_Option_flag){ 
11977  2b01 720600061b    	btjt	_MD_Test_Register,#3,L7036
11978                     ; 1894 				if(MD_Test_Pg < 3 ){
11980  2b06 c60001        	ld	a,_MD_Test_Pg
11981  2b09 a103          	cp	a,#3
11982  2b0b 2406          	jruge	L7236
11983                     ; 1895 					MD_Test_Pg++;
11985  2b0d 725c0001      	inc	_MD_Test_Pg
11987  2b11 2004          	jra	L1336
11988  2b13               L7236:
11989                     ; 1896 				}else{MD_Test_Pg = 0;}
11991  2b13 725f0001      	clr	_MD_Test_Pg
11992  2b17               L1336:
11993                     ; 1897 				if(MD_Test_Pg == 0){MD_Data_Step = 0;}
11995  2b17 725d0001      	tnz	_MD_Test_Pg
11996  2b1b 2604          	jrne	L7036
11999  2b1d 725f0000      	clr	_MD_Data_Step
12000  2b21               L7036:
12001                     ; 1900 		DN_SW_flag = OFF;
12003  2b21 72150000      	bres	_SW_Status,#2
12004  2b25               L1036:
12005                     ; 1905 	if(SET_SW_flag == ON){
12007  2b25 720700002f    	btjf	_SW_Status,#3,L5336
12008                     ; 1906 		if((MD_Test_Pg==0)||(MD_Test_Pg==10)){
12010  2b2a 725d0001      	tnz	_MD_Test_Pg
12011  2b2e 2707          	jreq	L1436
12013  2b30 c60001        	ld	a,_MD_Test_Pg
12014  2b33 a10a          	cp	a,#10
12015  2b35 2622          	jrne	L5336
12016  2b37               L1436:
12017                     ; 1908 			if(MD_Data_Select_flag == OFF){MD_Data_Select_flag= ON;}
12019  2b37 7200000606    	btjt	_MD_Test_Register,#0,L3436
12022  2b3c 72100006      	bset	_MD_Test_Register,#0
12024  2b40 2013          	jra	L5436
12025  2b42               L3436:
12026                     ; 1910 				if(MD_Data_Setting_flag == OFF){
12028  2b42 7202000606    	btjt	_MD_Test_Register,#1,L7436
12029                     ; 1911 					MD_Data_Setting_flag = ON;
12031  2b47 72120006      	bset	_MD_Test_Register,#1
12033  2b4b 2008          	jra	L5436
12034  2b4d               L7436:
12035                     ; 1913 					MD_Data_Setting_flag = OFF;
12037  2b4d 72130006      	bres	_MD_Test_Register,#1
12038                     ; 1914 					MD_Data_Select_flag = OFF;
12040  2b51 72110006      	bres	_MD_Test_Register,#0
12041  2b55               L5436:
12042                     ; 1917 			SET_SW_flag = OFF;
12044  2b55 72170000      	bres	_SW_Status,#3
12045  2b59               L5336:
12046                     ; 1921 	if(ON_OFF_SW_flag == ON){
12048  2b59 7201000013    	btjf	_SW_Status,#0,L3536
12049                     ; 1922 		if(MD_Trans_flag == OFF){MD_Trans_flag = ON;}
12051  2b5e 7204000606    	btjt	_MD_Test_Register,#2,L5536
12054  2b63 72140006      	bset	_MD_Test_Register,#2
12056  2b67 2004          	jra	L7536
12057  2b69               L5536:
12058                     ; 1923 		else{ MD_Trans_flag = OFF;  }
12060  2b69 72150006      	bres	_MD_Test_Register,#2
12061  2b6d               L7536:
12062                     ; 1925 		ON_OFF_SW_flag = OFF;
12064  2b6d 72110000      	bres	_SW_Status,#0
12065  2b71               L3536:
12066                     ; 1928 	if(OP_SW_flag == ON){
12068  2b71 720900002b    	btjf	_SW_Status,#4,L1636
12069                     ; 1929 		if(MD_Option_flag == OFF){
12071  2b76 720600060e    	btjt	_MD_Test_Register,#3,L3636
12072                     ; 1930 			MD_Option_flag = ON;
12074  2b7b 72160006      	bset	_MD_Test_Register,#3
12075                     ; 1931 			MD_Test_Pg = 10;
12077  2b7f 350a0001      	mov	_MD_Test_Pg,#10
12078                     ; 1932 			MD_Data_Step = 1;
12080  2b83 35010000      	mov	_MD_Data_Step,#1
12082  2b87 2014          	jra	L5636
12083  2b89               L3636:
12084                     ; 1935 			MD_Option_flag = OFF;
12086  2b89 72170006      	bres	_MD_Test_Register,#3
12087                     ; 1936 			MD_Data_Select_flag = OFF;
12089  2b8d 72110006      	bres	_MD_Test_Register,#0
12090                     ; 1937 			MD_Data_Setting_flag = OFF;
12092  2b91 72130006      	bres	_MD_Test_Register,#1
12093                     ; 1939 			MD_Test_Pg = 0;
12095  2b95 725f0001      	clr	_MD_Test_Pg
12096                     ; 1940 			MD_Data_Step = 0;
12098  2b99 725f0000      	clr	_MD_Data_Step
12099  2b9d               L5636:
12100                     ; 1943 		OP_SW_flag = OFF;
12102  2b9d 72190000      	bres	_SW_Status,#4
12103  2ba1               L1636:
12104                     ; 1946 	if(EN_SW_flag == ON){
12106  2ba1 720b000020    	btjf	_SW_Status,#5,L7636
12107                     ; 1947 		MD_Data_Select_flag = OFF;
12109  2ba6 72110006      	bres	_MD_Test_Register,#0
12110                     ; 1948 		MD_Data_Setting_flag = OFF;	
12112  2baa 72130006      	bres	_MD_Test_Register,#1
12113                     ; 1949 		Device_Select_Mode = ON;
12115  2bae 72100000      	bset	_Mode_Select_Status,#0
12116                     ; 1950 		MD_Option_flag = OFF;
12118  2bb2 72170006      	bres	_MD_Test_Register,#3
12119                     ; 1951 		MD_Trans_flag = OFF;
12121  2bb6 72150006      	bres	_MD_Test_Register,#2
12122                     ; 1953 		Can_Select_Device = 0;
12124  2bba 725f0000      	clr	_Can_Select_Device
12125                     ; 1954 		ModelS_Reset();
12127  2bbe 8d000000      	callf	f_ModelS_Reset
12129                     ; 1955 		EN_SW_flag = OFF;
12131  2bc2 721b0000      	bres	_SW_Status,#5
12132  2bc6               L7636:
12133                     ; 1958 	return;
12136  2bc6 87            	retf	
12167                     ; 1965 void ModelS_Test_Routine(void)
12167                     ; 1966 {
12168                     	switch	.text
12169  2bc7               f_ModelS_Test_Routine:
12173                     ; 1969 	if(ModelS_PTC_V56_flag){
12175  2bc7 720500000c    	btjf	_Can_Select_Device,#2,L1046
12176                     ; 1970 		CAN_Management_Routine();		// CAN communication Management
12178  2bcc 8d000000      	callf	f_CAN_Management_Routine
12180                     ; 1971 		ModelS_V56_LCD_Display();
12182  2bd0 8d3e033e      	callf	f_ModelS_V56_LCD_Display
12184                     ; 1972 		MedelS_V56_Switch_Control();
12189  2bd4 aca70ca7      	jpf	f_MedelS_V56_Switch_Control
12190  2bd8               L1046:
12191                     ; 1975 	else if(ModelS_PTC_V58_flag){
12193  2bd8 720700000c    	btjf	_Can_Select_Device,#3,L5046
12194                     ; 1976 		CAN_Management_Routine();		// CAN communication Management
12196  2bdd 8d000000      	callf	f_CAN_Management_Routine
12198                     ; 1977 		ModelS_V58_LCD_Display();
12200  2be1 8d330f33      	callf	f_ModelS_V58_LCD_Display
12202                     ; 1978 		MedelS_V58_Switch_Control();
12207  2be5 ac181e18      	jpf	f_MedelS_V58_Switch_Control
12208  2be9               L5046:
12209                     ; 1980 	else if(ModelX_PTC_flag){
12211  2be9 720d00000c    	btjf	_Can_Select_Device,#6,L3046
12212                     ; 1981 		CAN_Management_Routine();
12214  2bee 8d000000      	callf	f_CAN_Management_Routine
12216                     ; 1982 		ModelX_Rear_LCD_Display();
12218  2bf2 8d4d1f4d      	callf	f_ModelX_Rear_LCD_Display
12220                     ; 1983 		ModelX_Switch_Control();
12222  2bf6 8d7b2a7b      	callf	f_ModelX_Switch_Control
12224  2bfa               L3046:
12225                     ; 1986 	return ;
12228  2bfa 87            	retf	
12383                     	xdef	f_ModelX_Switch_Control
12384                     	xdef	f_ModelX_Value_Change
12385                     	xdef	f_ModelX_Rear_LCD_Display
12386                     	xdef	f_MedelS_V58_Switch_Control
12387                     	xdef	f_ModelS_V58_LCD_Display
12388                     	xdef	f_ModelS_V58_Value_Change
12389                     	xdef	f_MedelS_V56_Switch_Control
12390                     	xdef	f_ModelS_V56_LCD_Display
12391                     	xdef	f_ModelS_V56_Value_Change
12392                     	xdef	f_ModelS_Display_Handling
12393                     	xdef	f_ModelS_Reset
12394                     	xdef	_MD_Pre_Pg
12395                     	xdef	_MD_Test_Pg
12396                     	xdef	_MD_Data_Step
12397                     	xref	f_strcpy
12398                     	xdef	_MD_ID355_Data
12399                     	xdef	_MD_ID205_Data
12400                     	xdef	_MD_ID316_Data
12401                     	xdef	_MD_ID506_Data
12402                     	xdef	_MD_ID306_Data
12403                     	xdef	_MD_ID206_Data
12404                     	xdef	_MD_Vehicle_Logic
12405                     	xdef	_MD_Unit
12406                     	switch	.bss
12407  0000               _MD_T_Cnt:
12408  0000 00000000      	ds.b	4
12409                     	xdef	_MD_T_Cnt
12410                     	xdef	_MD_T_Unit
12411  0004               _MD_T_UpDn:
12412  0004 0000          	ds.b	2
12413                     	xdef	_MD_T_UpDn
12414  0006               _MD_Test_Register:
12415  0006 00            	ds.b	1
12416                     	xdef	_MD_Test_Register
12417                     	xdef	f_ModelS_Test_Routine
12418                     	xref	_LCD_Dis_Data
12419                     	xref	_LCD_Line
12420                     	xref	f_Num_Display_LCD
12421                     	xref	f_CAN_Management_Routine
12422                     	xref	_PTC_Status3
12423                     	xref	_PTC_Status2
12424                     	xref	_PTC_Status1
12425                     	xref	_PTC_SW_Ver
12426                     	xref	_PTC_Limit_Cause
12427                     	xref	_PTC_PCB2_Temp
12428                     	xref	_PTC_PCB1_Temp
12429                     	xref	_PTC_IGBT2_Temp
12430                     	xref	_PTC_IGBT1_Temp
12431                     	xref	_PTC_RCore_Temp
12432                     	xref	_PTC_LCore_Temp
12433                     	xref	_PTC_Fdback_Duty
12434                     	xref	_PTC_PWR_VALUE
12435                     	xref	_PTC_Cur_VALUE
12436                     	xref	_PTC_BATT_VALUE
12437                     	xref	_PTC_Heat_Duty
12438                     	xref	_PTC_AllowOperation
12439                     	xref	_CAN_Operation_App
12440                     	xref	f_Display_LCD_String
12441                     	xref	f_Set_LCD_Address
12442                     	xref	_Blink_30
12443                     	xref	_Blink_50
12444                     	xref	_SW_Status
12445                     	xref	_Can_Select_Device
12446                     	xref	_Mode_Select_Status
12447                     	switch	.const
12448  000c               L7606:
12449  000c 55264400      	dc.b	"U&D",0
12450  0010               L5506:
12451  0010 444e00        	dc.b	"DN",0
12452  0013               L5406:
12453  0013 202000        	dc.b	"  ",0
12454  0016               L1206:
12455  0016 4661696c5f49  	dc.b	"Fail_IGBT_Srt ",0
12456  0025               L5006:
12457  0025 4661696c5f53  	dc.b	"Fail_Srt_IGT ",0
12458  0033               L1775:
12459  0033 4661696c5f4f  	dc.b	"Fail_Opn_IGT ",0
12460  0041               L5575:
12461  0041 4661696c5f53  	dc.b	"Fail_Srt_PCBT ",0
12462  0050               L1475:
12463  0050 4661696c5f4f  	dc.b	"Fail_Opn_PCBT ",0
12464  005f               L5275:
12465  005f 4661696c5f53  	dc.b	"Fail_Srt_CoreT ",0
12466  006f               L1175:
12467  006f 4661696c5f4f  	dc.b	"Fail_Opn_CoreT ",0
12468  007f               L7365:
12469  007f 466c745f4d73  	dc.b	"Flt_Msg_TOUT ",0
12470  008d               L3265:
12471  008d 466c745f4f76  	dc.b	"Flt_OverT_IGBT ",0
12472  009d               L7065:
12473  009d 466c745f4f76  	dc.b	"Flt_OverT_PCB ",0
12474  00ac               L3755:
12475  00ac 466c745f4f76  	dc.b	"Flt_OverT_Core ",0
12476  00bc               L5235:
12477  00bc 6300          	dc.b	"c",0
12478  00be               L7305:
12479  00be 4661696c5f53  	dc.b	"Fail_STT_RCore ",0
12480  00ce               L5105:
12481  00ce 4661696c5f4f  	dc.b	"Fail_OPT_RCore ",0
12482  00de               L3774:
12483  00de 4661696c5f53  	dc.b	"Fail_STT_PCB2 ",0
12484  00ed               L1574:
12485  00ed 4661696c5f4f  	dc.b	"Fail_OPT_PCB2 ",0
12486  00fc               L7274:
12487  00fc 4661696c5f53  	dc.b	"Fail_STT_PCB1 ",0
12488  010b               L5074:
12489  010b 4661696c5f4f  	dc.b	"Fail_OPT_PCB1 ",0
12490  011a               L3664:
12491  011a 4661696c5f53  	dc.b	"Fail_STT_LCore ",0
12492  012a               L1464:
12493  012a 4661696c5f4f  	dc.b	"Fail_OPT_LCore ",0
12494  013a               L7354:
12495  013a 4661696c5f53  	dc.b	"Fail_STT_IGBT2 ",0
12496  014a               L5154:
12497  014a 4661696c5f4f  	dc.b	"Fail_OPT_IGBT2 ",0
12498  015a               L3744:
12499  015a 4661696c5f53  	dc.b	"Fail_STT_IGBT1 ",0
12500  016a               L1544:
12501  016a 4661696c5f4f  	dc.b	"Fail_OPT_IGBT1 ",0
12502  017a               L7244:
12503  017a 466c745f5054  	dc.b	"Flt_PTC_Mistch ",0
12504  018a               L5634:
12505  018a 466c745f4f76  	dc.b	"Flt_Over_IGBT2 ",0
12506  019a               L3434:
12507  019a 466c745f4f76  	dc.b	"Flt_Over_IGBT1 ",0
12508  01aa               L1234:
12509  01aa 466c745f4f76  	dc.b	"Flt_Over_PCB2 ",0
12510  01b9               L7724:
12511  01b9 466c745f4f76  	dc.b	"Flt_Over_PCB1 ",0
12512  01c8               L5524:
12513  01c8 466c745f4f76  	dc.b	"Flt_Over_RCore ",0
12514  01d8               L3324:
12515  01d8 466c745f4f76  	dc.b	"Flt_Over_LCore ",0
12516  01e8               L7653:
12517  01e8 52484400      	dc.b	"RHD",0
12518  01ec               L1653:
12519  01ec 4c484400      	dc.b	"LHD",0
12520  01f0               L3353:
12521  01f0 503a00        	dc.b	"P:",0
12522  01f3               L5023:
12523  01f3 4e00          	dc.b	"N",0
12524  01f5               L7713:
12525  01f5 4300          	dc.b	"C",0
12526  01f7               L1713:
12527  01f7 4e4f4e00      	dc.b	"NON",0
12528  01fb               L5413:
12529  01fb 4661696c5f50  	dc.b	"Fail_PCB1_Sen ",0
12530  020a               L3213:
12531  020a 4661696c5f52  	dc.b	"Fail_RightC_Sen ",0
12532  021b               L1013:
12533  021b 4661696c5f4c  	dc.b	"Fail_LeftC_Sen ",0
12534  022b               L7503:
12535  022b 4661696c5f43  	dc.b	"Fail_Cur_Sen ",0
12536  0239               L5303:
12537  0239 4661696c5f4c  	dc.b	"Fail_LV_Sen ",0
12538  0246               L3103:
12539  0246 4661696c5f48  	dc.b	"Fail_HV_Sen ",0
12540  0253               L1772:
12541  0253 466c745f4672  	dc.b	"Flt_Frame_TOUT ",0
12542  0263               L7272:
12543  0263 466c745f4f76  	dc.b	"Flt_Over_Core ",0
12544  0272               L5072:
12545  0272 466c745f4f76  	dc.b	"Flt_Over_Cur ",0
12546  0280               L3662:
12547  0280 466c745f4856  	dc.b	"Flt_HV_High ",0
12548  028d               L1462:
12549  028d 466c745f4856  	dc.b	"Flt_HV_Low ",0
12550  0299               L7162:
12551  0299 466c745f4c56  	dc.b	"Flt_LV_High ",0
12552  02a6               L5752:
12553  02a6 466c745f4c56  	dc.b	"Flt_LV_Low ",0
12554  02b2               L3552:
12555  02b2 4400          	dc.b	"D",0
12556  02b4               L5352:
12557  02b4 2d00          	dc.b	"-",0
12558  02b6               L7252:
12559  02b6 466100        	dc.b	"Fa",0
12560  02b9               L1742:
12561  02b9 555026444e00  	dc.b	"UP&DN",0
12562  02bf               L3642:
12563  02bf 444f574e00    	dc.b	"DOWN",0
12564  02c4               L5542:
12565  02c4 555000        	dc.b	"UP",0
12566  02c7               L7442:
12567  02c7 4f464600      	dc.b	"OFF",0
12568  02cb               L7242:
12569  02cb 7300          	dc.b	"s",0
12570  02cd               L5242:
12571  02cd 6d00          	dc.b	"m",0
12572  02cf               L7042:
12573  02cf 2500          	dc.b	"%",0
12574  02d1               L1732:
12575  02d1 202020202000  	dc.b	"     ",0
12576  02d7               L1332:
12577  02d7 2e00          	dc.b	".",0
12578  02d9               L3232:
12579  02d9 20202000      	dc.b	"   ",0
12580  02dd               L1132:
12581  02dd 53544f5000    	dc.b	"STOP",0
12582  02e2               L5032:
12583  02e2 4f50455200    	dc.b	"OPER",0
12584  02e7               L7722:
12585  02e7 4641494c00    	dc.b	"FAIL",0
12586  02ec               L1722:
12587  02ec 4c494d495400  	dc.b	"LIMIT",0
12588  02f2               L1622:
12589  02f2 2000          	dc.b	" ",0
12590  02f4               L5422:
12591  02f4 4644743a00    	dc.b	"FDt:",0
12592  02f9               L1702:
12593  02f9 5043425f5420  	dc.b	"PCB_T :",0
12594  0301               L7602:
12595  0301 494742545f54  	dc.b	"IGBT_T:",0
12596  0309               L5602:
12597  0309 434f52455f54  	dc.b	"CORE_T:",0
12598  0311               L3502:
12599  0311 566568636c65  	dc.b	"Vehcle:",0
12600  0319               L1502:
12601  0319 504c563a2020  	dc.b	"PLV:    PHV:",0
12602  0326               L7402:
12603  0326 4947313a2020  	dc.b	"IG1:    IG2:",0
12604  0333               L5402:
12605  0333 5041773a2020  	dc.b	"PAw:    P:",0
12606  033e               L3302:
12607  033e 55702f446e3a  	dc.b	"Up/Dn: ",0
12608  0346               L1302:
12609  0346 545f54696d65  	dc.b	"T_Time:",0
12610  034e               L7202:
12611  034e 445f556e6974  	dc.b	"D_Unit: ",0
12612  0357               L5202:
12613  0357 2a4f7074696f  	dc.b	"*Option*",0
12614  0360               L3202:
12615  0360 00            	dc.b	0
12616  0361               L1202:
12617  0361 5357563a00    	dc.b	"SWV:",0
12618  0366               L7102:
12619  0366 4c43543a2020  	dc.b	"LCT:    RCT:",0
12620  0373               L5102:
12621  0373 4856203a2020  	dc.b	"HV :    Cur:",0
12622  0380               L3102:
12623  0380 523a2020463a  	dc.b	"R:  F:  PWR:",0
12624  038d               L1102:
12625  038d 5444743a2020  	dc.b	"TDt:    FDt:",0
12626  039a               L7002:
12627  039a 5041773a00    	dc.b	"PAw:",0
12628                     	xref.b	c_lreg
12629                     	xref.b	c_x
12649                     	xref	d_imul
12650                     	xref	d_lumd
12651                     	xref	d_ludv
12652                     	xref	d_smodx
12653                     	xref	d_sdivx
12654                     	xref	d_lgsbc
12655                     	xref	d_lgadc
12656                     	xref	d_lcmp
12657                     	xref	d_ltor
12658                     	xref	d_jctab
12659                     	end

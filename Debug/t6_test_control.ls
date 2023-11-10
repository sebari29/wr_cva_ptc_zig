   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _T6_Oper_Data:
2660  0000 0000          	dc.w	0
2661  0002 0000          	dc.w	0
2662  0004 006e          	dc.w	110
2663  0006 012c          	dc.w	300
2664  0008 0007          	dc.w	7
2665  000a               _T6_Data_Step:
2666  000a 00            	dc.b	0
2667  000b               _T6_Test_Pg:
2668  000b 00            	dc.b	0
2669  000c               _T6_Test_Pre_Pg:
2670  000c 08            	dc.b	8
2671  000d               _T6_DUnit:
2672  000d 01            	dc.b	1
2673  000e               _T6_SHCM_VALUE:
2674  000e 00            	dc.b	0
2675  000f 000000000000  	ds.b	7
2676  0016               _T6_TxLin_Data:
2677  0016 00            	dc.b	0
2678  0017 000000000000  	ds.b	8
2679  001f               _T6_RxLin_Data:
2680  001f 00            	dc.b	0
2681  0020 000000000000  	ds.b	8
2718                     ; 27 void T6_Reset_Values(void)
2718                     ; 28 {
2719                     	switch	.text
2720  0000               f_T6_Reset_Values:
2724                     ; 29 	T6_Data_Step = 0;
2726  0000 725f000a      	clr	_T6_Data_Step
2727                     ; 32 	T6_Oper_Data[0] = 0; 
2729  0004 5f            	clrw	x
2730  0005 cf0000        	ldw	_T6_Oper_Data,x
2731                     ; 33 	T6_Oper_Data[1] = 0;
2733  0008 cf0002        	ldw	_T6_Oper_Data+2,x
2734                     ; 34 	T6_Oper_Data[2] = 110;
2736  000b ae006e        	ldw	x,#110
2737  000e cf0004        	ldw	_T6_Oper_Data+4,x
2738                     ; 35 	T6_Oper_Data[3] = 300;
2740  0011 ae012c        	ldw	x,#300
2741  0014 cf0006        	ldw	_T6_Oper_Data+6,x
2742                     ; 36 	T6_Oper_Data[4] = 7;
2744  0017 ae0007        	ldw	x,#7
2745  001a cf0008        	ldw	_T6_Oper_Data+8,x
2746                     ; 38 	T6_SHCM_VALUE[0] = 0; 
2748  001d 725f000e      	clr	_T6_SHCM_VALUE
2749                     ; 39 	T6_SHCM_VALUE[1] = 0;
2751  0021 725f000f      	clr	_T6_SHCM_VALUE+1
2752                     ; 40 	T6_SHCM_VALUE[2] = 0;
2754  0025 725f0010      	clr	_T6_SHCM_VALUE+2
2755                     ; 41 	T6_SHCM_VALUE[3] = 0;
2757  0029 725f0011      	clr	_T6_SHCM_VALUE+3
2758                     ; 42 	T6_SHCM_VALUE[4] = 0;
2760  002d 725f0012      	clr	_T6_SHCM_VALUE+4
2761                     ; 43 	T6_SHCM_VALUE[5] = 0;
2763  0031 725f0013      	clr	_T6_SHCM_VALUE+5
2764                     ; 45 	T6_Data_Step = 0;
2766  0035 725f000a      	clr	_T6_Data_Step
2767                     ; 46 	T6_Test_Pg = 0;
2769  0039 725f000b      	clr	_T6_Test_Pg
2770                     ; 47 	T6_Test_Pre_Pg = 8;
2772  003d 3508000c      	mov	_T6_Test_Pre_Pg,#8
2773                     ; 48 	Recieve_Cnt = 0;
2775  0041 725f0000      	clr	_Recieve_Cnt
2776                     ; 49 	Lin_Rx_Cnt = 0;
2778  0045 725f0000      	clr	_Lin_Rx_Cnt
2779                     ; 51 	T6_DUnit = 1;
2781  0049 3501000d      	mov	_T6_DUnit,#1
2782                     ; 53 	return;
2785  004d 87            	retf	
2820                     ; 57 void T6_Test_Value_Change(unsigned char ST)
2820                     ; 58 {
2821                     	switch	.text
2822  004e               f_T6_Test_Value_Change:
2824  004e 88            	push	a
2825  004f 89            	pushw	x
2826       00000002      OFST:	set	2
2829                     ; 60 	if(ST == 1){
2831  0050 4a            	dec	a
2832  0051 2704ac090109  	jrne	L5371
2833                     ; 61 		if(T6_Data_Step == 0){T6_Oper_Data[T6_Data_Step] ^= 1;}
2835  0057 725d000a      	tnz	_T6_Data_Step
2838  005b 2604ac130113  	jreq	LC004
2839                     ; 62 		else if(T6_Data_Step == 1){
2841  0061 c6000a        	ld	a,_T6_Data_Step
2842  0064 4a            	dec	a
2843  0065 2637          	jrne	L3471
2844                     ; 64 			T6_Oper_Data[T6_Data_Step] += T6_DUnit;
2846  0067 c6000d        	ld	a,_T6_DUnit
2847  006a 5f            	clrw	x
2848  006b 97            	ld	xl,a
2849  006c 1f01          	ldw	(OFST-1,sp),x
2850  006e 5f            	clrw	x
2851  006f c6000a        	ld	a,_T6_Data_Step
2852  0072 97            	ld	xl,a
2853  0073 58            	sllw	x
2854  0074 9093          	ldw	y,x
2855  0076 de0000        	ldw	x,(_T6_Oper_Data,x)
2856  0079 72fb01        	addw	x,(OFST-1,sp)
2857  007c 90df0000      	ldw	(_T6_Oper_Data,y),x
2858                     ; 65 			if( T6_Oper_Data[T6_Data_Step]  > 100){T6_Oper_Data[T6_Data_Step]  = 100;}
2860  0080 5f            	clrw	x
2861  0081 c6000a        	ld	a,_T6_Data_Step
2862  0084 97            	ld	xl,a
2863  0085 58            	sllw	x
2864  0086 9093          	ldw	y,x
2865  0088 90de0000      	ldw	y,(_T6_Oper_Data,y)
2866  008c 90a30065      	cpw	y,#101
2867  0090 2404aca901a9  	jrult	L1771
2870  0096 90ae0064      	ldw	y,#100
2871  009a ac480148      	jpf	LC003
2872  009e               L3471:
2873                     ; 67 		}else if(T6_Data_Step == 2){
2875  009e c6000a        	ld	a,_T6_Data_Step
2876  00a1 a102          	cp	a,#2
2877  00a3 261c          	jrne	L1571
2878                     ; 68 			if(T6_Oper_Data[T6_Data_Step] <255){ T6_Oper_Data[T6_Data_Step] ++;}
2880  00a5 c6000a        	ld	a,_T6_Data_Step
2881  00a8 5f            	clrw	x
2882  00a9 97            	ld	xl,a
2883  00aa 58            	sllw	x
2884  00ab 9093          	ldw	y,x
2885  00ad 90de0000      	ldw	y,(_T6_Oper_Data,y)
2886  00b1 90a300ff      	cpw	y,#255
2887  00b5 24db          	jruge	L1771
2890  00b7 9093          	ldw	y,x
2891  00b9 de0000        	ldw	x,(_T6_Oper_Data,x)
2892  00bc 5c            	incw	x
2893  00bd aca501a5      	jpf	LC001
2894  00c1               L1571:
2895                     ; 69 		}else if(T6_Data_Step == 3){
2897  00c1 c6000a        	ld	a,_T6_Data_Step
2898  00c4 a103          	cp	a,#3
2899  00c6 261e          	jrne	L7571
2900                     ; 70 			if(T6_Oper_Data[T6_Data_Step] <8191){ T6_Oper_Data[T6_Data_Step] += 50;}
2902  00c8 c6000a        	ld	a,_T6_Data_Step
2903  00cb 5f            	clrw	x
2904  00cc 97            	ld	xl,a
2905  00cd 58            	sllw	x
2906  00ce 9093          	ldw	y,x
2907  00d0 90de0000      	ldw	y,(_T6_Oper_Data,y)
2908  00d4 90a31fff      	cpw	y,#8191
2909  00d8 24b8          	jruge	L1771
2912  00da 9093          	ldw	y,x
2913  00dc de0000        	ldw	x,(_T6_Oper_Data,x)
2914  00df 1c0032        	addw	x,#50
2915  00e2 aca501a5      	jpf	LC001
2916  00e6               L7571:
2917                     ; 71 		}else if(T6_Data_Step == 4){
2919  00e6 c6000a        	ld	a,_T6_Data_Step
2920  00e9 a104          	cp	a,#4
2921  00eb 26a5          	jrne	L1771
2922                     ; 72 			if(T6_Oper_Data[T6_Data_Step] <10){ T6_Oper_Data[T6_Data_Step] ++;}
2924  00ed c6000a        	ld	a,_T6_Data_Step
2925  00f0 5f            	clrw	x
2926  00f1 97            	ld	xl,a
2927  00f2 58            	sllw	x
2928  00f3 9093          	ldw	y,x
2929  00f5 90de0000      	ldw	y,(_T6_Oper_Data,y)
2930  00f9 90a3000a      	cpw	y,#10
2931  00fd 2493          	jruge	L1771
2934  00ff 9093          	ldw	y,x
2935  0101 de0000        	ldw	x,(_T6_Oper_Data,x)
2936  0104 5c            	incw	x
2937  0105 aca501a5      	jpf	LC001
2938  0109               L5371:
2939                     ; 76 	else if(ST == 0){
2941  0109 7b03          	ld	a,(OFST+1,sp)
2942  010b 2685          	jrne	L1771
2943                     ; 77 		if(T6_Data_Step == 0){T6_Oper_Data[T6_Data_Step] ^= 1;}
2945  010d 725d000a      	tnz	_T6_Data_Step
2946  0111 2612          	jrne	L5771
2949  0113               LC004:
2951  0113 c6000a        	ld	a,_T6_Data_Step
2952  0116 5f            	clrw	x
2953  0117 97            	ld	xl,a
2954  0118 58            	sllw	x
2955  0119 d60001        	ld	a,(_T6_Oper_Data+1,x)
2956  011c a801          	xor	a,#1
2957  011e d70001        	ld	(_T6_Oper_Data+1,x),a
2959  0121 aca901a9      	jra	L1771
2960  0125               L5771:
2961                     ; 78 		else if(T6_Data_Step == 1){
2963  0125 c6000a        	ld	a,_T6_Data_Step
2964  0128 4a            	dec	a
2965  0129 2639          	jrne	L1002
2966                     ; 80 			if(T6_Oper_Data[T6_Data_Step] <T6_DUnit){T6_Oper_Data[T6_Data_Step] = 0;}
2968  012b c6000a        	ld	a,_T6_Data_Step
2969  012e 5f            	clrw	x
2970  012f 97            	ld	xl,a
2971  0130 58            	sllw	x
2972  0131 c6000d        	ld	a,_T6_DUnit
2973  0134 905f          	clrw	y
2974  0136 9097          	ld	yl,a
2975  0138 90bf00        	ldw	c_y,y
2976  013b 9093          	ldw	y,x
2977  013d 90de0000      	ldw	y,(_T6_Oper_Data,y)
2978  0141 90b300        	cpw	y,c_y
2979  0144 2407          	jruge	L3002
2982  0146 905f          	clrw	y
2983  0148               LC003:
2984  0148 df0000        	ldw	(_T6_Oper_Data,x),y
2986  014b 205c          	jra	L1771
2987  014d               L3002:
2988                     ; 81 			else{T6_Oper_Data[T6_Data_Step] -= T6_DUnit;}
2990  014d c6000d        	ld	a,_T6_DUnit
2991  0150 5f            	clrw	x
2992  0151 97            	ld	xl,a
2993  0152 1f01          	ldw	(OFST-1,sp),x
2994  0154 5f            	clrw	x
2995  0155 c6000a        	ld	a,_T6_Data_Step
2996  0158 97            	ld	xl,a
2997  0159 58            	sllw	x
2998  015a 9093          	ldw	y,x
2999  015c de0000        	ldw	x,(_T6_Oper_Data,x)
3000  015f 72f001        	subw	x,(OFST-1,sp)
3001  0162 2041          	jpf	LC001
3002  0164               L1002:
3003                     ; 83 		}else if(T6_Data_Step == 2){
3005  0164 c6000a        	ld	a,_T6_Data_Step
3006  0167 a102          	cp	a,#2
3007                     ; 84 			if(T6_Oper_Data[T6_Data_Step] >0){ T6_Oper_Data[T6_Data_Step]--;}
3009  0169 2726          	jreq	LC002
3010                     ; 85 		}else if(T6_Data_Step == 3){
3012  016b c6000a        	ld	a,_T6_Data_Step
3013  016e a103          	cp	a,#3
3014  0170 2618          	jrne	L7102
3015                     ; 86 			if(T6_Oper_Data[T6_Data_Step] >0){ T6_Oper_Data[T6_Data_Step] -= 50;}
3017  0172 c6000a        	ld	a,_T6_Data_Step
3018  0175 5f            	clrw	x
3019  0176 97            	ld	xl,a
3020  0177 58            	sllw	x
3021  0178 d60001        	ld	a,(_T6_Oper_Data+1,x)
3022  017b da0000        	or	a,(_T6_Oper_Data,x)
3023  017e 2729          	jreq	L1771
3026  0180 9093          	ldw	y,x
3027  0182 de0000        	ldw	x,(_T6_Oper_Data,x)
3028  0185 1d0032        	subw	x,#50
3029  0188 201b          	jpf	LC001
3030  018a               L7102:
3031                     ; 87 		}else if(T6_Data_Step == 4){
3033  018a c6000a        	ld	a,_T6_Data_Step
3034  018d a104          	cp	a,#4
3035  018f 2618          	jrne	L1771
3036                     ; 88 			if(T6_Oper_Data[T6_Data_Step] >0){ T6_Oper_Data[T6_Data_Step] --;}
3040  0191               LC002:
3042  0191 c6000a        	ld	a,_T6_Data_Step
3043  0194 5f            	clrw	x
3044  0195 97            	ld	xl,a
3045  0196 58            	sllw	x
3046  0197 d60001        	ld	a,(_T6_Oper_Data+1,x)
3047  019a da0000        	or	a,(_T6_Oper_Data,x)
3048  019d 270a          	jreq	L1771
3050  019f 9093          	ldw	y,x
3051  01a1 de0000        	ldw	x,(_T6_Oper_Data,x)
3052  01a4 5a            	decw	x
3053  01a5               LC001:
3054  01a5 90df0000      	ldw	(_T6_Oper_Data,y),x
3055  01a9               L1771:
3056                     ; 92 	return ;
3059  01a9 5b03          	addw	sp,#3
3060  01ab 87            	retf	
3086                     ; 96 void T6_Display_Handling(void)
3086                     ; 97 {
3087                     	switch	.text
3088  01ac               f_T6_Display_Handling:
3092                     ; 98 	switch(T6_Test_Pg){
3094  01ac c6000b        	ld	a,_T6_Test_Pg
3096                     ; 128 		default: break;
3097  01af 270a          	jreq	L1302
3098  01b1 4a            	dec	a
3099  01b2 2730          	jreq	L3302
3100  01b4 4a            	dec	a
3101  01b5 273e          	jreq	L5302
3102  01b7 4a            	dec	a
3103  01b8 2764          	jreq	L7302
3105  01ba 87            	retf	
3106  01bb               L1302:
3107                     ; 100 		case 0:
3107                     ; 101 				strcpy(LCD_Dis_Data[0],"AltF=");
3109  01bb ae007a        	ldw	x,#L7502
3110  01be 89            	pushw	x
3111  01bf ae0000        	ldw	x,#_LCD_Dis_Data
3112  01c2 8d000000      	callf	f_strcpy
3114  01c6 85            	popw	x
3115                     ; 102 				strcpy(LCD_Dis_Data[1],"Heat=");
3117  01c7 ae0074        	ldw	x,#L1602
3118  01ca 89            	pushw	x
3119  01cb ae0010        	ldw	x,#_LCD_Dis_Data+16
3120  01ce 8d000000      	callf	f_strcpy
3122  01d2 85            	popw	x
3123                     ; 103 				strcpy(LCD_Dis_Data[2],"EngT=");
3125  01d3 ae006e        	ldw	x,#L3602
3126  01d6 89            	pushw	x
3127  01d7 ae0020        	ldw	x,#_LCD_Dis_Data+32
3128  01da 8d000000      	callf	f_strcpy
3130  01de 85            	popw	x
3131                     ; 104 				strcpy(LCD_Dis_Data[3],"RPM =");
3133  01df ae0068        	ldw	x,#L5602
3135                     ; 105 				break;
3137  01e2 2061          	jpf	LC005
3138  01e4               L3302:
3139                     ; 107 		case 1:
3139                     ; 108 				strcpy(LCD_Dis_Data[0],"PWR =");
3141  01e4 ae0062        	ldw	x,#L7602
3142  01e7 89            	pushw	x
3143  01e8 ae0000        	ldw	x,#_LCD_Dis_Data
3144  01eb 8d000000      	callf	f_strcpy
3146  01ef 85            	popw	x
3147                     ; 109 				strcpy(LCD_Dis_Data[1],"");
3149  01f0 ae0061        	ldw	x,#L1702
3151                     ; 110 				strcpy(LCD_Dis_Data[2],"");
3153                     ; 111 				strcpy(LCD_Dis_Data[3],"");
3155                     ; 112 				break;
3157  01f3 2038          	jpf	LC006
3158  01f5               L5302:
3159                     ; 114 		case 2:
3159                     ; 115 				strcpy(LCD_Dis_Data[0],"Otemp:");
3161  01f5 ae005a        	ldw	x,#L3702
3162  01f8 89            	pushw	x
3163  01f9 ae0000        	ldw	x,#_LCD_Dis_Data
3164  01fc 8d000000      	callf	f_strcpy
3166  0200 85            	popw	x
3167                     ; 116 				strcpy(LCD_Dis_Data[1],"OVt  :");
3169  0201 ae0053        	ldw	x,#L5702
3170  0204 89            	pushw	x
3171  0205 ae0010        	ldw	x,#_LCD_Dis_Data+16
3172  0208 8d000000      	callf	f_strcpy
3174  020c 85            	popw	x
3175                     ; 117 				strcpy(LCD_Dis_Data[2],"Ocur :");
3177  020d ae004c        	ldw	x,#L7702
3178  0210 89            	pushw	x
3179  0211 ae0020        	ldw	x,#_LCD_Dis_Data+32
3180  0214 8d000000      	callf	f_strcpy
3182  0218 85            	popw	x
3183                     ; 118 				strcpy(LCD_Dis_Data[3],"UVt  :");
3185  0219 ae0045        	ldw	x,#L1012
3187                     ; 119 				break;
3189  021c 2027          	jpf	LC005
3190  021e               L7302:
3191                     ; 121 		case 3:
3191                     ; 122 				strcpy(LCD_Dis_Data[0],"TpSF:");
3193  021e ae003f        	ldw	x,#L3012
3194  0221 89            	pushw	x
3195  0222 ae0000        	ldw	x,#_LCD_Dis_Data
3196  0225 8d000000      	callf	f_strcpy
3198  0229 85            	popw	x
3199                     ; 123 				strcpy(LCD_Dis_Data[1],"GenF:");
3201  022a ae0039        	ldw	x,#L5012
3203                     ; 124 				strcpy(LCD_Dis_Data[2],"");
3206                     ; 125 				strcpy(LCD_Dis_Data[3],"");
3208  022d               LC006:
3209  022d 89            	pushw	x
3210  022e ae0010        	ldw	x,#_LCD_Dis_Data+16
3211  0231 8d000000      	callf	f_strcpy
3212  0235 85            	popw	x
3214  0236 ae0061        	ldw	x,#L1702
3215  0239 89            	pushw	x
3216  023a ae0020        	ldw	x,#_LCD_Dis_Data+32
3217  023d 8d000000      	callf	f_strcpy
3218  0241 85            	popw	x
3220  0242 ae0061        	ldw	x,#L1702
3222  0245               LC005:
3223  0245 89            	pushw	x
3224  0246 ae0030        	ldw	x,#_LCD_Dis_Data+48
3225  0249 8d000000      	callf	f_strcpy
3226  024d 85            	popw	x
3227                     ; 126 				break;
3229                     ; 128 		default: break;
3231                     ; 130 	return;
3234  024e 87            	retf	
3280                     ; 133 void T6_LCD_Display(void)
3280                     ; 134 {
3281                     	switch	.text
3282  024f               f_T6_LCD_Display:
3284  024f 88            	push	a
3285       00000001      OFST:	set	1
3288                     ; 137 	Set_LCD_Address((unsigned char)(LCD_Line[2]+14));
3290  0250 c60002        	ld	a,_LCD_Line+2
3291  0253 ab0e          	add	a,#14
3292  0255 8d000000      	callf	f_Set_LCD_Address
3294                     ; 138 	Display_LCD_String("T6");
3296  0259 ae0036        	ldw	x,#L3212
3297  025c 8d000000      	callf	f_Display_LCD_String
3299                     ; 140 	if(T6_Option_flag == ON){
3301  0260 7207000142    	btjf	_T6_Test_Register,#3,L5212
3302                     ; 141 		Set_LCD_Address(LCD_Line[0]);
3304  0265 c60000        	ld	a,_LCD_Line
3305  0268 8d000000      	callf	f_Set_LCD_Address
3307                     ; 142 		Display_LCD_String("*OPTION*");
3309  026c ae002d        	ldw	x,#L7212
3310  026f 8d000000      	callf	f_Display_LCD_String
3312                     ; 143 		Set_LCD_Address(LCD_Line[1]);
3314  0273 c60001        	ld	a,_LCD_Line+1
3315  0276 8d000000      	callf	f_Set_LCD_Address
3317                     ; 144 		Display_LCD_String("D-Unit:");
3319  027a ae0025        	ldw	x,#L1312
3320  027d 8d000000      	callf	f_Display_LCD_String
3322                     ; 146 		Set_LCD_Address((unsigned char)(LCD_Line[1]+9));
3324  0281 c60001        	ld	a,_LCD_Line+1
3325  0284 ab09          	add	a,#9
3326  0286 8d000000      	callf	f_Set_LCD_Address
3328                     ; 147 		if(Blink_50){Display_LCD_String("     ");}
3330  028a 725d0000      	tnz	_Blink_50
3331  028e 2705          	jreq	L3312
3334  0290 ae001f        	ldw	x,#L5312
3337  0293 200c          	jra	L7312
3338  0295               L3312:
3339                     ; 149 			Num_Display_LCD(T6_DUnit);
3341  0295 c6000d        	ld	a,_T6_DUnit
3342  0298 5f            	clrw	x
3343  0299 97            	ld	xl,a
3344  029a 8d000000      	callf	f_Num_Display_LCD
3346                     ; 150 			Display_LCD_String("%");
3348  029e ae001d        	ldw	x,#L1412
3350  02a1               L7312:
3351  02a1 8d000000      	callf	f_Display_LCD_String
3352                     ; 152 		return;
3355  02a5 84            	pop	a
3356  02a6 87            	retf	
3357  02a7               L5212:
3358                     ; 155 	if(T6_Test_Pg != T6_Test_Pre_Pg){ T6_Display_Handling();  }
3360  02a7 c6000b        	ld	a,_T6_Test_Pg
3361  02aa c1000c        	cp	a,_T6_Test_Pre_Pg
3362  02ad 2704          	jreq	L3412
3365  02af 8dac01ac      	callf	f_T6_Display_Handling
3367  02b3               L3412:
3368                     ; 156 	T6_Test_Pre_Pg = T6_Test_Pg;
3370  02b3 55000b000c    	mov	_T6_Test_Pre_Pg,_T6_Test_Pg
3371                     ; 160 	if(T6_Test_Pg == 0){			//page 1
3373  02b8 725d000b      	tnz	_T6_Test_Pg
3374  02bc 2704ac9c039c  	jrne	L5412
3375                     ; 161 		for(i=0; i<4; i++){
3377  02c2 4f            	clr	a
3378  02c3 6b01          	ld	(OFST+0,sp),a
3379  02c5               L7412:
3380                     ; 162 			Set_LCD_Address(LCD_Line[i]);
3382  02c5 5f            	clrw	x
3383  02c6 97            	ld	xl,a
3384  02c7 d60000        	ld	a,(_LCD_Line,x)
3385  02ca 8d000000      	callf	f_Set_LCD_Address
3387                     ; 164 			if((T6_Data_Select_flag == ON) && (T6_Data_Setting_flag == OFF) && (i == T6_Data_Step)){
3389  02ce 7201000117    	btjf	_T6_Test_Register,#0,L5512
3391  02d3 7202000112    	btjt	_T6_Test_Register,#1,L5512
3393  02d8 7b01          	ld	a,(OFST+0,sp)
3394  02da c1000a        	cp	a,_T6_Data_Step
3395  02dd 260b          	jrne	L5512
3396                     ; 165 				if(Blink_50){Display_LCD_String("     ");}
3398  02df 725d0000      	tnz	_Blink_50
3399  02e3 2707          	jreq	LC007
3402  02e5 ae001f        	ldw	x,#L5312
3405  02e8 2009          	jra	L3612
3406                     ; 166 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3408  02ea               L5512:
3409                     ; 167 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3411  02ea 7b01          	ld	a,(OFST+0,sp)
3412  02ec               LC007:
3414  02ec 97            	ld	xl,a
3415  02ed a610          	ld	a,#16
3416  02ef 42            	mul	x,a
3417  02f0 1c0000        	addw	x,#_LCD_Dis_Data
3419  02f3               L3612:
3420  02f3 8d000000      	callf	f_Display_LCD_String
3421                     ; 169 			Set_LCD_Address((unsigned char)(LCD_Line[i] + 6));
3423  02f7 7b01          	ld	a,(OFST+0,sp)
3424  02f9 5f            	clrw	x
3425  02fa 97            	ld	xl,a
3426  02fb d60000        	ld	a,(_LCD_Line,x)
3427  02fe ab06          	add	a,#6
3428  0300 8d000000      	callf	f_Set_LCD_Address
3430                     ; 171 			if((T6_Data_Setting_flag == ON) && (i == T6_Data_Step)){
3432  0304 7203000141    	btjf	_T6_Test_Register,#1,L5612
3434  0309 7b01          	ld	a,(OFST+0,sp)
3435  030b c1000a        	cp	a,_T6_Data_Step
3436  030e 263a          	jrne	L5612
3437                     ; 172 				if(Blink_50){Display_LCD_String("     ");}
3439  0310 725d0000      	tnz	_Blink_50
3440  0314 2709          	jreq	L7612
3443  0316 ae001f        	ldw	x,#L5312
3444  0319 8d000000      	callf	f_Display_LCD_String
3447  031d 206d          	jra	L1122
3448  031f               L7612:
3449                     ; 174 					if(i == 2){
3451  031f a102          	cp	a,#2
3452  0321 261a          	jrne	L3712
3453                     ; 175 						if(T6_Oper_Data[i] < 60){
3455  0323 5f            	clrw	x
3456  0324 97            	ld	xl,a
3457  0325 58            	sllw	x
3458  0326 9093          	ldw	y,x
3459  0328 90de0000      	ldw	y,(_T6_Oper_Data,y)
3460  032c 90a3003c      	cpw	y,#60
3461                     ; 176 							Display_LCD_String("-");
3463                     ; 177 							Num_Display_LCD((60 - T6_Oper_Data[i]));
3466  0330 252d          	jrult	LC012
3467  0332               L5712:
3468                     ; 178 						}else{Num_Display_LCD((T6_Oper_Data[i] - 60));}
3471  0332 5f            	clrw	x
3472  0333 97            	ld	xl,a
3473  0334 58            	sllw	x
3474  0335 de0000        	ldw	x,(_T6_Oper_Data,x)
3475  0338 1d003c        	subw	x,#60
3477  033b 204b          	jpf	LC008
3478  033d               L3712:
3479                     ; 179 					}else if(i == 3){ Num_Display_LCD((T6_Oper_Data[i]*2));}
3481  033d a103          	cp	a,#3
3482  033f 2641          	jrne	L3222
3485  0341               LC010:
3487  0341 5f            	clrw	x
3488  0342 97            	ld	xl,a
3489  0343 58            	sllw	x
3490  0344 de0000        	ldw	x,(_T6_Oper_Data,x)
3491  0347 58            	sllw	x
3494  0348 203e          	jpf	LC008
3495                     ; 180 					else{ Num_Display_LCD(T6_Oper_Data[i]);}
3497  034a               L5612:
3498                     ; 183 				if(i == 2){
3500  034a 7b01          	ld	a,(OFST+0,sp)
3501  034c a102          	cp	a,#2
3502  034e 262e          	jrne	L3122
3503                     ; 184 					if(T6_Oper_Data[i] < 60){
3505  0350 5f            	clrw	x
3506  0351 97            	ld	xl,a
3507  0352 58            	sllw	x
3508  0353 9093          	ldw	y,x
3509  0355 90de0000      	ldw	y,(_T6_Oper_Data,y)
3510  0359 90a3003c      	cpw	y,#60
3511  035d 24d3          	jruge	L5712
3512                     ; 185 						Display_LCD_String("-");
3515                     ; 186 						Num_Display_LCD((60 - T6_Oper_Data[i]));
3517  035f               LC012:
3519  035f ae001b        	ldw	x,#L7712
3520  0362 8d000000      	callf	f_Display_LCD_String
3522  0366 ae003c        	ldw	x,#60
3523  0369 7b01          	ld	a,(OFST+0,sp)
3524  036b 905f          	clrw	y
3525  036d 9097          	ld	yl,a
3526  036f 9058          	sllw	y
3527  0371 90de0000      	ldw	y,(_T6_Oper_Data,y)
3528  0375 90bf00        	ldw	c_x,y
3529  0378 72b00000      	subw	x,c_x
3532  037c 200a          	jpf	LC008
3533                     ; 187 					}else{Num_Display_LCD((T6_Oper_Data[i] - 60));}
3535  037e               L3122:
3536                     ; 188 				}else if(i == 3){ Num_Display_LCD((T6_Oper_Data[i]*2));}
3538  037e a103          	cp	a,#3
3542  0380 27bf          	jreq	LC010
3543  0382               L3222:
3544                     ; 189 				else{ Num_Display_LCD(T6_Oper_Data[i]);}
3547  0382 5f            	clrw	x
3548  0383 97            	ld	xl,a
3549  0384 58            	sllw	x
3550  0385 de0000        	ldw	x,(_T6_Oper_Data,x)
3551  0388               LC008:
3552  0388 8d000000      	callf	f_Num_Display_LCD
3554  038c               L1122:
3555                     ; 161 		for(i=0; i<4; i++){
3557  038c 0c01          	inc	(OFST+0,sp)
3560  038e 7b01          	ld	a,(OFST+0,sp)
3561  0390 a104          	cp	a,#4
3562  0392 2404acc502c5  	jrult	L7412
3563                     ; 194 		Set_LCD_Address((unsigned char)(0xD0+14));
3565                     ; 195 		Display_LCD_String("TX");
3568  0398 ac340434      	jpf	LC019
3569  039c               L5412:
3570                     ; 197 	}else if(T6_Test_Pg == 1){
3572  039c c6000b        	ld	a,_T6_Test_Pg
3573  039f 4a            	dec	a
3574  03a0 2704ac410441  	jrne	L3322
3575                     ; 198 		for(i=0; i<1; i++){
3577  03a6 6b01          	ld	(OFST+0,sp),a
3578  03a8               L5322:
3579                     ; 199 			Set_LCD_Address(LCD_Line[i]);
3581  03a8 7b01          	ld	a,(OFST+0,sp)
3582  03aa 5f            	clrw	x
3583  03ab 97            	ld	xl,a
3584  03ac d60000        	ld	a,(_LCD_Line,x)
3585  03af 8d000000      	callf	f_Set_LCD_Address
3587                     ; 200 			if((T6_Data_Select_flag == ON) && (T6_Data_Setting_flag == OFF) && (i == (T6_Data_Step-4))){
3589  03b3 7201000125    	btjf	_T6_Test_Register,#0,L3422
3591  03b8 7202000120    	btjt	_T6_Test_Register,#1,L3422
3593  03bd c6000a        	ld	a,_T6_Data_Step
3594  03c0 5f            	clrw	x
3595  03c1 97            	ld	xl,a
3596  03c2 1d0004        	subw	x,#4
3597  03c5 7b01          	ld	a,(OFST+0,sp)
3598  03c7 905f          	clrw	y
3599  03c9 9097          	ld	yl,a
3600  03cb 90bf00        	ldw	c_y,y
3601  03ce b300          	cpw	x,c_y
3602  03d0 260b          	jrne	L3422
3603                     ; 201 				if(Blink_50){Display_LCD_String("     ");}
3605  03d2 725d0000      	tnz	_Blink_50
3606  03d6 2707          	jreq	LC013
3609  03d8 ae001f        	ldw	x,#L5312
3612  03db 2009          	jra	L1522
3613                     ; 202 				else{Display_LCD_String(LCD_Dis_Data[i]);}
3615  03dd               L3422:
3616                     ; 203 			}else{ Display_LCD_String(LCD_Dis_Data[i]);}
3618  03dd 7b01          	ld	a,(OFST+0,sp)
3619  03df               LC013:
3621  03df 97            	ld	xl,a
3622  03e0 a610          	ld	a,#16
3623  03e2 42            	mul	x,a
3624  03e3 1c0000        	addw	x,#_LCD_Dis_Data
3626  03e6               L1522:
3627  03e6 8d000000      	callf	f_Display_LCD_String
3628                     ; 205 			Set_LCD_Address((unsigned char)(LCD_Line[i] + 6));
3630  03ea 7b01          	ld	a,(OFST+0,sp)
3631  03ec 5f            	clrw	x
3632  03ed 97            	ld	xl,a
3633  03ee d60000        	ld	a,(_LCD_Line,x)
3634  03f1 ab06          	add	a,#6
3635  03f3 8d000000      	callf	f_Set_LCD_Address
3637                     ; 207 			if((T6_Data_Setting_flag == ON) && (i == (T6_Data_Step-4))){
3639  03f7 7203000124    	btjf	_T6_Test_Register,#1,L3522
3641  03fc c6000a        	ld	a,_T6_Data_Step
3642  03ff 5f            	clrw	x
3643  0400 97            	ld	xl,a
3644  0401 1d0004        	subw	x,#4
3645  0404 7b01          	ld	a,(OFST+0,sp)
3646  0406 905f          	clrw	y
3647  0408 9097          	ld	yl,a
3648  040a 90bf00        	ldw	c_y,y
3649  040d b300          	cpw	x,c_y
3650  040f 260f          	jrne	L3522
3651                     ; 208 				if(Blink_50){Display_LCD_String("     ");}
3653  0411 725d0000      	tnz	_Blink_50
3654  0415 270b          	jreq	LC014
3657  0417 ae001f        	ldw	x,#L5312
3658  041a 8d000000      	callf	f_Display_LCD_String
3661  041e 200c          	jra	L1622
3662                     ; 209 				else{Num_Display_LCD(T6_Oper_Data[i+4]);}
3664  0420               L3522:
3665                     ; 210 			}else{ Num_Display_LCD(T6_Oper_Data[i+4]);}
3667  0420 7b01          	ld	a,(OFST+0,sp)
3668  0422               LC014:
3670  0422 5f            	clrw	x
3671  0423 97            	ld	xl,a
3672  0424 58            	sllw	x
3673  0425 de0008        	ldw	x,(_T6_Oper_Data+8,x)
3674  0428 8d000000      	callf	f_Num_Display_LCD
3676  042c               L1622:
3677                     ; 198 		for(i=0; i<1; i++){
3679  042c 0c01          	inc	(OFST+0,sp)
3682  042e 2604aca803a8  	jreq	L5322
3683                     ; 213 		Set_LCD_Address((unsigned char)(0xD0+14));
3686                     ; 214 		Display_LCD_String("TX");
3688  0434               LC019:
3690  0434 a6de          	ld	a,#222
3691  0436 8d000000      	callf	f_Set_LCD_Address
3693  043a ae0018        	ldw	x,#L7222
3696  043d ac0a050a      	jpf	LC017
3697  0441               L3322:
3698                     ; 216 	}else if(T6_Test_Pg == 2){
3700  0441 c6000b        	ld	a,_T6_Test_Pg
3701  0444 a102          	cp	a,#2
3702  0446 265a          	jrne	L5622
3703                     ; 217 		for(i=0;i<4;i++){
3705  0448 4f            	clr	a
3706  0449 6b01          	ld	(OFST+0,sp),a
3707  044b               L7622:
3708                     ; 218 			Set_LCD_Address(LCD_Line[i]);
3710  044b 5f            	clrw	x
3711  044c 97            	ld	xl,a
3712  044d d60000        	ld	a,(_LCD_Line,x)
3713  0450 8d000000      	callf	f_Set_LCD_Address
3715                     ; 219 			Display_LCD_String(LCD_Dis_Data[i]);
3717  0454 7b01          	ld	a,(OFST+0,sp)
3718  0456 97            	ld	xl,a
3719  0457 a610          	ld	a,#16
3720  0459 42            	mul	x,a
3721  045a 1c0000        	addw	x,#_LCD_Dis_Data
3722  045d 8d000000      	callf	f_Display_LCD_String
3724                     ; 221 			Set_LCD_Address((unsigned char)(LCD_Line[i]+6));
3726  0461 7b01          	ld	a,(OFST+0,sp)
3727  0463 5f            	clrw	x
3728  0464 97            	ld	xl,a
3729  0465 d60000        	ld	a,(_LCD_Line,x)
3730  0468 ab06          	add	a,#6
3731  046a 8d000000      	callf	f_Set_LCD_Address
3733                     ; 223 			if(T6_Trans_flag == OFF){Display_LCD_String("NN");}
3735  046e 7204000102    	btjt	_T6_Test_Register,#2,L5722
3739  0473 201c          	jpf	L1132
3740  0475               L5722:
3741                     ; 224 			else if(T6_SHCM_VALUE[i] == 0){Display_LCD_String("OK");}
3743  0475 7b01          	ld	a,(OFST+0,sp)
3744  0477 5f            	clrw	x
3745  0478 97            	ld	xl,a
3746  0479 724d000e      	tnz	(_T6_SHCM_VALUE,x)
3747  047d 2605          	jrne	L3032
3750  047f ae0012        	ldw	x,#L5032
3753  0482 2010          	jra	L1032
3754  0484               L3032:
3755                     ; 225 			else if(T6_SHCM_VALUE[i] == 1){Display_LCD_String("Ft");}
3757  0484 5f            	clrw	x
3758  0485 97            	ld	xl,a
3759  0486 d6000e        	ld	a,(_T6_SHCM_VALUE,x)
3760  0489 4a            	dec	a
3761  048a 2605          	jrne	L1132
3764  048c ae000f        	ldw	x,#L3132
3767  048f 2003          	jra	L1032
3768  0491               L1132:
3769                     ; 226 			else{Display_LCD_String("NN");}
3772  0491 ae0015        	ldw	x,#L7722
3774  0494               L1032:
3775  0494 8d000000      	callf	f_Display_LCD_String
3776                     ; 217 		for(i=0;i<4;i++){
3778  0498 0c01          	inc	(OFST+0,sp)
3781  049a 7b01          	ld	a,(OFST+0,sp)
3782  049c a104          	cp	a,#4
3783  049e 25ab          	jrult	L7622
3784                     ; 229 		Set_LCD_Address((unsigned char)(0xD0+14));
3786                     ; 230 		Display_LCD_String("RX");
3789  04a0 205f          	jpf	LC018
3790  04a2               L5622:
3791                     ; 232 	}else if(T6_Test_Pg == 3){
3793  04a2 c6000b        	ld	a,_T6_Test_Pg
3794  04a5 a103          	cp	a,#3
3795  04a7 2665          	jrne	L1322
3796                     ; 233 		for(i=0;i<2;i++){
3798  04a9 4f            	clr	a
3799  04aa 6b01          	ld	(OFST+0,sp),a
3800  04ac               L5232:
3801                     ; 234 			Set_LCD_Address(LCD_Line[i]);
3803  04ac 5f            	clrw	x
3804  04ad 97            	ld	xl,a
3805  04ae d60000        	ld	a,(_LCD_Line,x)
3806  04b1 8d000000      	callf	f_Set_LCD_Address
3808                     ; 235 			Display_LCD_String(LCD_Dis_Data[i]);
3810  04b5 7b01          	ld	a,(OFST+0,sp)
3811  04b7 97            	ld	xl,a
3812  04b8 a610          	ld	a,#16
3813  04ba 42            	mul	x,a
3814  04bb 1c0000        	addw	x,#_LCD_Dis_Data
3815  04be 8d000000      	callf	f_Display_LCD_String
3817                     ; 237 			Set_LCD_Address((unsigned char)(LCD_Line[i]+6));
3819  04c2 7b01          	ld	a,(OFST+0,sp)
3820  04c4 5f            	clrw	x
3821  04c5 97            	ld	xl,a
3822  04c6 d60000        	ld	a,(_LCD_Line,x)
3823  04c9 ab06          	add	a,#6
3824  04cb 8d000000      	callf	f_Set_LCD_Address
3826                     ; 238 			if(T6_Trans_flag == OFF){Display_LCD_String("NN");}
3828  04cf 7204000102    	btjt	_T6_Test_Register,#2,L3332
3832  04d4 201c          	jpf	L3432
3833  04d6               L3332:
3834                     ; 239 			else if(T6_SHCM_VALUE[i+4] == 0){Display_LCD_String("OK");}
3836  04d6 7b01          	ld	a,(OFST+0,sp)
3837  04d8 5f            	clrw	x
3838  04d9 97            	ld	xl,a
3839  04da 724d0012      	tnz	(_T6_SHCM_VALUE+4,x)
3840  04de 2605          	jrne	L7332
3843  04e0 ae0012        	ldw	x,#L5032
3846  04e3 2010          	jra	L5332
3847  04e5               L7332:
3848                     ; 240 			else if(T6_SHCM_VALUE[i+4] == 1){Display_LCD_String("Ft");}
3850  04e5 5f            	clrw	x
3851  04e6 97            	ld	xl,a
3852  04e7 d60012        	ld	a,(_T6_SHCM_VALUE+4,x)
3853  04ea 4a            	dec	a
3854  04eb 2605          	jrne	L3432
3857  04ed ae000f        	ldw	x,#L3132
3860  04f0 2003          	jra	L5332
3861  04f2               L3432:
3862                     ; 241 			else{Display_LCD_String("NN");}
3865  04f2 ae0015        	ldw	x,#L7722
3867  04f5               L5332:
3868  04f5 8d000000      	callf	f_Display_LCD_String
3869                     ; 233 		for(i=0;i<2;i++){
3871  04f9 0c01          	inc	(OFST+0,sp)
3874  04fb 7b01          	ld	a,(OFST+0,sp)
3875  04fd a102          	cp	a,#2
3876  04ff 25ab          	jrult	L5232
3877                     ; 245 		Set_LCD_Address((unsigned char)(0xD0+14));
3880                     ; 246 		Display_LCD_String("RX");
3882  0501               LC018:
3884  0501 a6de          	ld	a,#222
3885  0503 8d000000      	callf	f_Set_LCD_Address
3887  0507 ae000c        	ldw	x,#L7132
3888  050a               LC017:
3889  050a 8d000000      	callf	f_Display_LCD_String
3891  050e               L1322:
3892                     ; 250 	if(T6_Trans_flag == ON){
3894  050e a60d          	ld	a,#13
3895  0510 7205000114    	btjf	_T6_Test_Register,#2,L7432
3896                     ; 251 		Set_LCD_Address((unsigned char)(0x00+13));
3898  0515 8d000000      	callf	f_Set_LCD_Address
3900                     ; 252 		if(Blink_30){Display_LCD_String("COM");}
3902  0519 725d0000      	tnz	_Blink_30
3903  051d 2705          	jreq	L1532
3906  051f ae0008        	ldw	x,#L3532
3909  0522 200c          	jra	L1632
3910  0524               L1532:
3911                     ; 253 		else{Display_LCD_String("   ");}
3913  0524 ae0004        	ldw	x,#L7532
3915  0527 2007          	jra	L1632
3916  0529               L7432:
3917                     ; 256 		Set_LCD_Address((unsigned char)(0x00+13));
3919  0529 8d000000      	callf	f_Set_LCD_Address
3921                     ; 257 		Display_LCD_String("NON");
3923  052d ae0000        	ldw	x,#L3632
3925  0530               L1632:
3926  0530 8d000000      	callf	f_Display_LCD_String
3927                     ; 260 	return;
3930  0534 84            	pop	a
3931  0535 87            	retf	
3963                     ; 264 void T6_Switch_Control(void)
3963                     ; 265 {
3964                     	switch	.text
3965  0536               f_T6_Switch_Control:
3969                     ; 266 	if(UP_SW_flag == ON){
3971  0536 7203000053    	btjf	_SW_Status,#1,L5732
3972                     ; 268 		if(T6_Option_flag == ON){
3974  053b 720700010c    	btjf	_T6_Test_Register,#3,L7732
3975                     ; 269 			if(T6_DUnit<100){ T6_DUnit++;}
3977  0540 c6000d        	ld	a,_T6_DUnit
3978  0543 a164          	cp	a,#100
3979  0545 2404          	jruge	L1042
3982  0547 725c000d      	inc	_T6_DUnit
3983  054b               L1042:
3984                     ; 270 			return;
3987  054b 87            	retf	
3988  054c               L7732:
3989                     ; 273 		if(T6_Data_Setting_flag == ON){	T6_Test_Value_Change(1);}
3991  054c 7203000108    	btjf	_T6_Test_Register,#1,L3042
3994  0551 a601          	ld	a,#1
3995  0553 8d4e004e      	callf	f_T6_Test_Value_Change
3998  0557 202f          	jra	L5042
3999  0559               L3042:
4000                     ; 274 		else if(T6_Data_Select_flag == ON){
4002  0559 720100010c    	btjf	_T6_Test_Register,#0,L7042
4003                     ; 275 			if(T6_Data_Step > 0){ 
4005  055e 725d000a      	tnz	_T6_Data_Step
4006  0562 2724          	jreq	L5042
4007                     ; 276 				T6_Data_Step--; 
4009  0564 725a000a      	dec	_T6_Data_Step
4010  0568 201e          	jra	L5042
4011  056a               L7042:
4012                     ; 279 			if(T6_Test_Pg >0){
4014  056a 725d000b      	tnz	_T6_Test_Pg
4015  056e 2718          	jreq	L5042
4016                     ; 280 				T6_Test_Pg--;
4018  0570 725a000b      	dec	_T6_Test_Pg
4019                     ; 282 				if(T6_Test_Pg == 0){T6_Data_Step = 0;}
4021  0574 725d000b      	tnz	_T6_Test_Pg
4022  0578 2604          	jrne	L7142
4025  057a 725f000a      	clr	_T6_Data_Step
4026  057e               L7142:
4027                     ; 283 				if(T6_Test_Pg == 1){T6_Data_Step = 4;}
4029  057e c6000b        	ld	a,_T6_Test_Pg
4030  0581 4a            	dec	a
4031  0582 2604          	jrne	L5042
4034  0584 3504000a      	mov	_T6_Data_Step,#4
4035  0588               L5042:
4036                     ; 287 		UP_SW_flag = OFF;
4038  0588 72130000      	bres	_SW_Status,#1
4040  058c 2062          	jra	L3242
4041  058e               L5732:
4042                     ; 289 	}else if(DN_SW_flag == ON){ 
4044  058e 720500005d    	btjf	_SW_Status,#2,L3242
4045                     ; 291 		if(T6_Option_flag == ON){
4047  0593 720700010c    	btjf	_T6_Test_Register,#3,L7242
4048                     ; 292 			if(T6_DUnit>1){ T6_DUnit--;}
4050  0598 c6000d        	ld	a,_T6_DUnit
4051  059b a102          	cp	a,#2
4052  059d 2504          	jrult	L1342
4055  059f 725a000d      	dec	_T6_DUnit
4056  05a3               L1342:
4057                     ; 293 			return;
4060  05a3 87            	retf	
4061  05a4               L7242:
4062                     ; 297 		if(T6_Data_Setting_flag == ON){	T6_Test_Value_Change(0);}
4064  05a4 7203000107    	btjf	_T6_Test_Register,#1,L3342
4067  05a9 4f            	clr	a
4068  05aa 8d4e004e      	callf	f_T6_Test_Value_Change
4071  05ae 203c          	jra	L5342
4072  05b0               L3342:
4073                     ; 299 		else if(T6_Data_Select_flag == ON){
4075  05b0 7201000118    	btjf	_T6_Test_Register,#0,L7342
4076                     ; 300 			if(T6_Data_Step < 4){ 
4078  05b5 c6000a        	ld	a,_T6_Data_Step
4079  05b8 a104          	cp	a,#4
4080  05ba 2430          	jruge	L5342
4081                     ; 301 				if(T6_Data_Step == 3){
4083  05bc c6000a        	ld	a,_T6_Data_Step
4084  05bf a103          	cp	a,#3
4085  05c1 2604          	jrne	L3442
4086                     ; 302 					T6_Test_Pg = 1;
4088  05c3 3501000b      	mov	_T6_Test_Pg,#1
4089  05c7               L3442:
4090                     ; 304 				T6_Data_Step++;
4092  05c7 725c000a      	inc	_T6_Data_Step
4093  05cb 201f          	jra	L5342
4094  05cd               L7342:
4095                     ; 307 			if(T6_Test_Pg < 3){
4097  05cd c6000b        	ld	a,_T6_Test_Pg
4098  05d0 a103          	cp	a,#3
4099  05d2 2418          	jruge	L5342
4100                     ; 308 				T6_Test_Pg++;
4102  05d4 725c000b      	inc	_T6_Test_Pg
4103                     ; 310 				if(T6_Test_Pg == 0){T6_Data_Step = 0;}
4105  05d8 725d000b      	tnz	_T6_Test_Pg
4106  05dc 2604          	jrne	L1542
4109  05de 725f000a      	clr	_T6_Data_Step
4110  05e2               L1542:
4111                     ; 311 				if(T6_Test_Pg == 1){T6_Data_Step = 4;}
4113  05e2 c6000b        	ld	a,_T6_Test_Pg
4114  05e5 4a            	dec	a
4115  05e6 2604          	jrne	L5342
4118  05e8 3504000a      	mov	_T6_Data_Step,#4
4119  05ec               L5342:
4120                     ; 314 		DN_SW_flag = OFF;
4122  05ec 72150000      	bres	_SW_Status,#2
4123  05f0               L3242:
4124                     ; 319 	if(SET_SW_flag == ON){
4126  05f0 7207000029    	btjf	_SW_Status,#3,L5542
4127                     ; 320 		if(T6_Test_Pg < 2){
4129  05f5 c6000b        	ld	a,_T6_Test_Pg
4130  05f8 a102          	cp	a,#2
4131  05fa 2422          	jruge	L5542
4132                     ; 322 			if(T6_Data_Select_flag == OFF){T6_Data_Select_flag= ON;}
4134  05fc 7200000106    	btjt	_T6_Test_Register,#0,L1642
4137  0601 72100001      	bset	_T6_Test_Register,#0
4139  0605 2013          	jra	L3642
4140  0607               L1642:
4141                     ; 324 				if(T6_Data_Setting_flag == OFF){
4143  0607 7202000106    	btjt	_T6_Test_Register,#1,L5642
4144                     ; 325 					T6_Data_Setting_flag = ON;
4146  060c 72120001      	bset	_T6_Test_Register,#1
4148  0610 2008          	jra	L3642
4149  0612               L5642:
4150                     ; 327 					T6_Data_Setting_flag = OFF;
4152  0612 72130001      	bres	_T6_Test_Register,#1
4153                     ; 328 					T6_Data_Select_flag = OFF;
4155  0616 72110001      	bres	_T6_Test_Register,#0
4156  061a               L3642:
4157                     ; 331 			SET_SW_flag = OFF;
4159  061a 72170000      	bres	_SW_Status,#3
4160  061e               L5542:
4161                     ; 335 	if(ON_OFF_SW_flag == ON){
4163  061e 7201000013    	btjf	_SW_Status,#0,L1742
4164                     ; 336 		if(T6_Trans_flag == OFF){T6_Trans_flag = ON;}
4166  0623 7204000106    	btjt	_T6_Test_Register,#2,L3742
4169  0628 72140001      	bset	_T6_Test_Register,#2
4171  062c 2004          	jra	L5742
4172  062e               L3742:
4173                     ; 337 		else{ T6_Trans_flag = OFF;  }
4175  062e 72150001      	bres	_T6_Test_Register,#2
4176  0632               L5742:
4177                     ; 339 		ON_OFF_SW_flag = OFF;
4179  0632 72110000      	bres	_SW_Status,#0
4180  0636               L1742:
4181                     ; 342 	if(OP_SW_flag == ON){
4183  0636 7209000013    	btjf	_SW_Status,#4,L7742
4184                     ; 343 		if(T6_Option_flag == OFF){T6_Option_flag = ON;}
4186  063b 7206000106    	btjt	_T6_Test_Register,#3,L1052
4189  0640 72160001      	bset	_T6_Test_Register,#3
4191  0644 2004          	jra	L3052
4192  0646               L1052:
4193                     ; 344 		else{T6_Option_flag = OFF;}
4195  0646 72170001      	bres	_T6_Test_Register,#3
4196  064a               L3052:
4197                     ; 346 		OP_SW_flag = OFF;
4199  064a 72190000      	bres	_SW_Status,#4
4200  064e               L7742:
4201                     ; 349 	if(EN_SW_flag == ON){
4203  064e 720b000018    	btjf	_SW_Status,#5,L5052
4204                     ; 350 		Device_Select_Mode = ON;
4206  0653 72100000      	bset	_Mode_Select_Status,#0
4207                     ; 351 		T6_PTC_flag = OFF;
4209  0657 72110000      	bres	_LIN13_Select_Device,#0
4210                     ; 352 		T6_Trans_flag = OFF;
4212  065b 72150001      	bres	_T6_Test_Register,#2
4213                     ; 354 		T6_Reset_Values();	
4215  065f 8d000000      	callf	f_T6_Reset_Values
4217                     ; 355 		LIN_EN = 0;
4219  0663 7215500f      	bres	_PD_ODR,#2
4220                     ; 356 		EN_SW_flag = OFF;
4222  0667 721b0000      	bres	_SW_Status,#5
4223  066b               L5052:
4224                     ; 358 	return;
4227  066b 87            	retf	
4264                     ; 361 void T6_Rx_Data_Handling(void)
4264                     ; 362 {
4265                     	switch	.text
4266  066c               f_T6_Rx_Data_Handling:
4268  066c 88            	push	a
4269       00000001      OFST:	set	1
4272                     ; 365 	if(T6_Response_Complete == ON){
4274  066d 720700006f    	btjf	_Lin_Com_Register,#3,L3252
4275                     ; 366 		buff = Lin_Measure_Classic_Checksum(T6_RxLin_Data);
4277  0672 ae001f        	ldw	x,#_T6_RxLin_Data
4278  0675 8d000000      	callf	f_Lin_Measure_Classic_Checksum
4280  0679 6b01          	ld	(OFST+0,sp),a
4281                     ; 368 		if(buff == T6_RxLin_Data[8]){
4283  067b c60027        	ld	a,_T6_RxLin_Data+8
4284  067e 1101          	cp	a,(OFST+0,sp)
4285  0680 2643          	jrne	L5252
4286                     ; 369 			T6_SHCM_VALUE[0] = (unsigned char)(T6_RxLin_Data[0] & 0x01);
4288  0682 c6001f        	ld	a,_T6_RxLin_Data
4289  0685 a401          	and	a,#1
4290  0687 c7000e        	ld	_T6_SHCM_VALUE,a
4291                     ; 370 			T6_SHCM_VALUE[1] = (unsigned char)((T6_RxLin_Data[0] & 0x02)>>1);
4293  068a c6001f        	ld	a,_T6_RxLin_Data
4294  068d a402          	and	a,#2
4295  068f 44            	srl	a
4296  0690 c7000f        	ld	_T6_SHCM_VALUE+1,a
4297                     ; 371 			T6_SHCM_VALUE[2] = (unsigned char)((T6_RxLin_Data[0] & 0x04)>>2);
4299  0693 c6001f        	ld	a,_T6_RxLin_Data
4300  0696 a404          	and	a,#4
4301  0698 44            	srl	a
4302  0699 44            	srl	a
4303  069a c70010        	ld	_T6_SHCM_VALUE+2,a
4304                     ; 372 			T6_SHCM_VALUE[3] = (unsigned char)((T6_RxLin_Data[0] & 0x08)>>3);
4306  069d c6001f        	ld	a,_T6_RxLin_Data
4307  06a0 a408          	and	a,#8
4308  06a2 44            	srl	a
4309  06a3 44            	srl	a
4310  06a4 44            	srl	a
4311  06a5 c70011        	ld	_T6_SHCM_VALUE+3,a
4312                     ; 373 			T6_SHCM_VALUE[4] = (unsigned char)((T6_RxLin_Data[0] & 0x10)>>4);
4314  06a8 c6001f        	ld	a,_T6_RxLin_Data
4315  06ab 4e            	swap	a
4316  06ac a401          	and	a,#1
4317  06ae c70012        	ld	_T6_SHCM_VALUE+4,a
4318                     ; 374 			T6_SHCM_VALUE[5] = (unsigned char)((T6_RxLin_Data[0] & 0x20)>>5);
4320  06b1 c6001f        	ld	a,_T6_RxLin_Data
4321  06b4 4e            	swap	a
4322  06b5 a402          	and	a,#2
4323  06b7 44            	srl	a
4324  06b8 c70013        	ld	_T6_SHCM_VALUE+5,a
4325                     ; 376 			Rx_Over_Time = OFF;
4327  06bb 721d0000      	bres	_Lin_Com_Register,#6
4328                     ; 377 			Recieve_Cnt = 0;
4330  06bf 725f0000      	clr	_Recieve_Cnt
4332  06c3 2018          	jra	L7252
4333  06c5               L5252:
4334                     ; 380 			T6_SHCM_VALUE[0] = 3;
4336  06c5 3503000e      	mov	_T6_SHCM_VALUE,#3
4337                     ; 381 			T6_SHCM_VALUE[1] = 3;
4339  06c9 3503000f      	mov	_T6_SHCM_VALUE+1,#3
4340                     ; 382 			T6_SHCM_VALUE[2] = 3;
4342  06cd 35030010      	mov	_T6_SHCM_VALUE+2,#3
4343                     ; 383 			T6_SHCM_VALUE[3] = 3;
4345  06d1 35030011      	mov	_T6_SHCM_VALUE+3,#3
4346                     ; 384 			T6_SHCM_VALUE[4] = 3;
4348  06d5 35030012      	mov	_T6_SHCM_VALUE+4,#3
4349                     ; 385 			T6_SHCM_VALUE[5] = 3;
4351  06d9 35030013      	mov	_T6_SHCM_VALUE+5,#3
4352  06dd               L7252:
4353                     ; 388 		T6_Response_Complete = OFF;
4355  06dd 72170000      	bres	_Lin_Com_Register,#3
4356  06e1               L3252:
4357                     ; 392 	if(Rx_Over_Time == ON){
4359  06e1 720d000018    	btjf	_Lin_Com_Register,#6,L1352
4360                     ; 393 		T6_SHCM_VALUE[0] = 3;
4362  06e6 3503000e      	mov	_T6_SHCM_VALUE,#3
4363                     ; 394 		T6_SHCM_VALUE[1] = 3;
4365  06ea 3503000f      	mov	_T6_SHCM_VALUE+1,#3
4366                     ; 395 		T6_SHCM_VALUE[2] = 3;
4368  06ee 35030010      	mov	_T6_SHCM_VALUE+2,#3
4369                     ; 396 		T6_SHCM_VALUE[3] = 3;
4371  06f2 35030011      	mov	_T6_SHCM_VALUE+3,#3
4372                     ; 397 		T6_SHCM_VALUE[4] = 3;
4374  06f6 35030012      	mov	_T6_SHCM_VALUE+4,#3
4375                     ; 398 		T6_SHCM_VALUE[5] = 3;
4377  06fa 35030013      	mov	_T6_SHCM_VALUE+5,#3
4378  06fe               L1352:
4379                     ; 400 	return;
4382  06fe 84            	pop	a
4383  06ff 87            	retf	
4409                     ; 405 void T6_Tx_Data_Handling(void)
4409                     ; 406 {
4410                     	switch	.text
4411  0700               f_T6_Tx_Data_Handling:
4415                     ; 407 	T6_TxLin_Data[0] = (unsigned char)(T6_Oper_Data[0]<<7);
4417  0700 c60001        	ld	a,_T6_Oper_Data+1
4418  0703 97            	ld	xl,a
4419  0704 a680          	ld	a,#128
4420  0706 42            	mul	x,a
4421  0707 9f            	ld	a,xl
4422  0708 c70016        	ld	_T6_TxLin_Data,a
4423                     ; 408 	T6_TxLin_Data[1] = (unsigned char)(T6_Oper_Data[1]);
4425  070b 5500030017    	mov	_T6_TxLin_Data+1,_T6_Oper_Data+3
4426                     ; 409 	T6_TxLin_Data[2] = (unsigned char)(T6_Oper_Data[2]);
4428  0710 5500050018    	mov	_T6_TxLin_Data+2,_T6_Oper_Data+5
4429                     ; 410 	T6_TxLin_Data[3] = (unsigned char)(T6_Oper_Data[3]);
4431  0715 5500070019    	mov	_T6_TxLin_Data+3,_T6_Oper_Data+7
4432                     ; 411 	T6_TxLin_Data[4] = (unsigned char)(T6_Oper_Data[3]>>8);
4434  071a 4f            	clr	a
4435  071b ce0006        	ldw	x,_T6_Oper_Data+6
4436  071e 01            	rrwa	x,a
4437  071f 9f            	ld	a,xl
4438  0720 c7001a        	ld	_T6_TxLin_Data+4,a
4439                     ; 412 	T6_TxLin_Data[5] = 0;
4441  0723 725f001b      	clr	_T6_TxLin_Data+5
4442                     ; 413 	T6_TxLin_Data[6] = (unsigned char)(T6_Oper_Data[4]<<2);;
4444  0727 c60009        	ld	a,_T6_Oper_Data+9
4445  072a 48            	sll	a
4446  072b 48            	sll	a
4447  072c c7001c        	ld	_T6_TxLin_Data+6,a
4448                     ; 414 	T6_TxLin_Data[7] = 0;
4451  072f 725f001d      	clr	_T6_TxLin_Data+7
4452                     ; 415 	T6_TxLin_Data[8] = Lin_Measure_Classic_Checksum(T6_TxLin_Data);
4454  0733 ae0016        	ldw	x,#_T6_TxLin_Data
4455  0736 8d000000      	callf	f_Lin_Measure_Classic_Checksum
4457  073a c7001e        	ld	_T6_TxLin_Data+8,a
4458                     ; 417 	return;
4461  073d 87            	retf	
4498                     ; 422 void T6_Transmit_Tx_DATA(void)
4498                     ; 423 {
4499                     	switch	.text
4500  073e               f_T6_Transmit_Tx_DATA:
4502  073e 88            	push	a
4503       00000001      OFST:	set	1
4506                     ; 426 	if(T6_BCM_Trans_Header == OFF){return;}
4508  073f 7200000002    	btjt	_Lin_Com_Register,#0,L7552
4512  0744 84            	pop	a
4513  0745 87            	retf	
4514  0746               L7552:
4515                     ; 429 		if(T6_Trans_ID == ON){
4517  0746 7203000020    	btjf	_Lin_Com_Register,#1,L3652
4518                     ; 430 			T6_SHCM_Rep_flag = OFF;
4520  074b 72150000      	bres	_Lin_Com_Register,#2
4521                     ; 431 			LIN_Header_Transmission(0x30);
4523  074f a630          	ld	a,#48
4524  0751 8d000000      	callf	f_LIN_Header_Transmission
4526                     ; 432 			for(Index = 0; Index<9; Index++){	LIN_Transmission_Data(T6_TxLin_Data[Index]);}	
4528  0755 4f            	clr	a
4529  0756 6b01          	ld	(OFST+0,sp),a
4530  0758               L5652:
4533  0758 5f            	clrw	x
4534  0759 97            	ld	xl,a
4535  075a d60016        	ld	a,(_T6_TxLin_Data,x)
4536  075d 8d000000      	callf	f_LIN_Transmission_Data
4540  0761 0c01          	inc	(OFST+0,sp)
4543  0763 7b01          	ld	a,(OFST+0,sp)
4544  0765 a109          	cp	a,#9
4545  0767 25ef          	jrult	L5652
4547  0769 200e          	jra	L3752
4548  076b               L3652:
4549                     ; 434 			LIN_Header_Transmission(0x32);
4551  076b a632          	ld	a,#50
4552  076d 8d000000      	callf	f_LIN_Header_Transmission
4554                     ; 435 			Lin_Rx_Cnt = 0;
4556  0771 725f0000      	clr	_Lin_Rx_Cnt
4557                     ; 436 			T6_SHCM_Rep_flag = ON;
4559  0775 72140000      	bset	_Lin_Com_Register,#2
4560  0779               L3752:
4561                     ; 438 		T6_BCM_Trans_Header = OFF;
4563  0779 72110000      	bres	_Lin_Com_Register,#0
4564                     ; 440 	return;
4567  077d 84            	pop	a
4568  077e 87            	retf	
4594                     ; 445 void T6_ComTest_Routine(void)
4594                     ; 446 {
4595                     	switch	.text
4596  077f               f_T6_ComTest_Routine:
4600                     ; 447 	if(T6_Trans_flag == OFF){return;}
4602  077f 7204000101    	btjt	_T6_Test_Register,#2,L5062
4606  0784 87            	retf	
4607  0785               L5062:
4608                     ; 449 		T6_Tx_Data_Handling();
4610  0785 8d000700      	callf	f_T6_Tx_Data_Handling
4612                     ; 450 		T6_Rx_Data_Handling();
4614  0789 8d6c066c      	callf	f_T6_Rx_Data_Handling
4616                     ; 451 		T6_Transmit_Tx_DATA();
4619                     ; 453 	return;
4622  078d 20af          	jpf	f_T6_Transmit_Tx_DATA
4648                     ; 459 void T6_Test_Routine(void)
4648                     ; 460 {
4649                     	switch	.text
4650  078f               f_T6_Test_Routine:
4654                     ; 463 	if(T6_PTC_flag == OFF){return;}
4656  078f 7200000001    	btjt	_LIN13_Select_Device,#0,L1262
4660  0794 87            	retf	
4661  0795               L1262:
4662                     ; 465 		T6_LCD_Display();
4664  0795 8d4f024f      	callf	f_T6_LCD_Display
4666                     ; 466 		T6_Switch_Control();
4668  0799 8d360536      	callf	f_T6_Switch_Control
4670                     ; 467 		T6_ComTest_Routine();
4673                     ; 469 	return ;
4676  079d 20e0          	jpf	f_T6_ComTest_Routine
4784                     	xdef	f_T6_ComTest_Routine
4785                     	xdef	f_T6_Transmit_Tx_DATA
4786                     	xdef	f_T6_Tx_Data_Handling
4787                     	xdef	f_T6_Rx_Data_Handling
4788                     	xdef	f_T6_Switch_Control
4789                     	xdef	f_T6_LCD_Display
4790                     	xdef	f_T6_Display_Handling
4791                     	xdef	f_T6_Test_Value_Change
4792                     	xdef	f_T6_Reset_Values
4793                     	xdef	_T6_TxLin_Data
4794                     	xdef	_T6_SHCM_VALUE
4795                     	xdef	_T6_DUnit
4796                     	xdef	_T6_Test_Pre_Pg
4797                     	xdef	_T6_Test_Pg
4798                     	xdef	_T6_Data_Step
4799                     	xdef	_T6_Oper_Data
4800                     	xref	f_strcpy
4801                     	switch	.bss
4802  0000               _Lin_Com_Register:
4803  0000 00            	ds.b	1
4804                     	xdef	_Lin_Com_Register
4805  0001               _T6_Test_Register:
4806  0001 00            	ds.b	1
4807                     	xdef	_T6_Test_Register
4808                     	xdef	_T6_RxLin_Data
4809                     	xdef	f_T6_Test_Routine
4810                     	xref	_Lin_Rx_Cnt
4811                     	xref	_Recieve_Cnt
4812                     	xref	f_LIN_Transmission_Data
4813                     	xref	f_LIN_Header_Transmission
4814                     	xref	f_Lin_Measure_Classic_Checksum
4815                     	xref	_LCD_Dis_Data
4816                     	xref	_LCD_Line
4817                     	xref	f_Num_Display_LCD
4818                     	xref	f_Display_LCD_String
4819                     	xref	f_Set_LCD_Address
4820                     	xref	_Blink_30
4821                     	xref	_Blink_50
4822                     	xref	_SW_Status
4823                     	xref	_LIN13_Select_Device
4824                     	xref	_Mode_Select_Status
4825                     .const:	section	.text
4826  0000               L3632:
4827  0000 4e4f4e00      	dc.b	"NON",0
4828  0004               L7532:
4829  0004 20202000      	dc.b	"   ",0
4830  0008               L3532:
4831  0008 434f4d00      	dc.b	"COM",0
4832  000c               L7132:
4833  000c 525800        	dc.b	"RX",0
4834  000f               L3132:
4835  000f 467400        	dc.b	"Ft",0
4836  0012               L5032:
4837  0012 4f4b00        	dc.b	"OK",0
4838  0015               L7722:
4839  0015 4e4e00        	dc.b	"NN",0
4840  0018               L7222:
4841  0018 545800        	dc.b	"TX",0
4842  001b               L7712:
4843  001b 2d00          	dc.b	"-",0
4844  001d               L1412:
4845  001d 2500          	dc.b	"%",0
4846  001f               L5312:
4847  001f 202020202000  	dc.b	"     ",0
4848  0025               L1312:
4849  0025 442d556e6974  	dc.b	"D-Unit:",0
4850  002d               L7212:
4851  002d 2a4f5054494f  	dc.b	"*OPTION*",0
4852  0036               L3212:
4853  0036 543600        	dc.b	"T6",0
4854  0039               L5012:
4855  0039 47656e463a00  	dc.b	"GenF:",0
4856  003f               L3012:
4857  003f 547053463a00  	dc.b	"TpSF:",0
4858  0045               L1012:
4859  0045 55567420203a  	dc.b	"UVt  :",0
4860  004c               L7702:
4861  004c 4f637572203a  	dc.b	"Ocur :",0
4862  0053               L5702:
4863  0053 4f567420203a  	dc.b	"OVt  :",0
4864  005a               L3702:
4865  005a 4f74656d703a  	dc.b	"Otemp:",0
4866  0061               L1702:
4867  0061 00            	dc.b	0
4868  0062               L7602:
4869  0062 505752203d00  	dc.b	"PWR =",0
4870  0068               L5602:
4871  0068 52504d203d00  	dc.b	"RPM =",0
4872  006e               L3602:
4873  006e 456e67543d00  	dc.b	"EngT=",0
4874  0074               L1602:
4875  0074 486561743d00  	dc.b	"Heat=",0
4876  007a               L7502:
4877  007a 416c74463d00  	dc.b	"AltF=",0
4878                     	xref.b	c_x
4879                     	xref.b	c_y
4899                     	end

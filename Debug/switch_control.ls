   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _SET_Key_Cnt:
2660  0000 0000          	dc.w	0
2661  0002               _ONF_Key_Cnt:
2662  0002 0000          	dc.w	0
2663  0004               _UP_Key_Cnt:
2664  0004 0000          	dc.w	0
2665  0006               _DN_Key_Cnt:
2666  0006 0000          	dc.w	0
2667  0008               _OP_Key_Cnt:
2668  0008 0000          	dc.w	0
2669  000a               _EN_Key_Cnt:
2670  000a 0000          	dc.w	0
2706                     ; 22 void Zig_Key_Control_Routine(void)
2706                     ; 23 {
2707                     	switch	.text
2708  0000               f_Zig_Key_Control_Routine:
2712                     ; 24 	Set_Key_Logic();
2714  0000 8d180018      	callf	f_Set_Key_Logic
2716                     ; 25 	ON_OFF_Key_Logic();
2718  0004 8d340034      	callf	f_ON_OFF_Key_Logic
2720                     ; 26 	UP_Key_Logic();
2722  0008 8d500050      	callf	f_UP_Key_Logic
2724                     ; 27 	Down_Key_Logic();
2726  000c 8d910091      	callf	f_Down_Key_Logic
2728                     ; 28 	Option_Key_Logic();
2730  0010 8dd200d2      	callf	f_Option_Key_Logic
2732                     ; 29 	Enter_Key_Logic();
2735                     ; 31 	return;
2738  0014 ac100110      	jpf	f_Enter_Key_Logic
2763                     ; 34 void Set_Key_Logic(void)
2763                     ; 35 {
2764                     	switch	.text
2765  0018               f_Set_Key_Logic:
2769                     ; 36 	if(io_SET_STATUS_INPUT == LOW){ SET_Key_Cnt++;}
2771  0018 720c500106    	btjt	_PA_IDR,#6,L1371
2774  001d ce0000        	ldw	x,_SET_Key_Cnt
2775  0020 5c            	incw	x
2777  0021 200d          	jra	L3371
2778  0023               L1371:
2779                     ; 38 		if(SET_Key_Cnt>KEY_FILTER){SET_SW_flag = ON;}
2781  0023 ce0000        	ldw	x,_SET_Key_Cnt
2782  0026 a30004        	cpw	x,#4
2783  0029 2504          	jrult	L5371
2786  002b 72160001      	bset	_SW_Status,#3
2787  002f               L5371:
2788                     ; 39 		SET_Key_Cnt = 0;
2790  002f 5f            	clrw	x
2791  0030               L3371:
2792  0030 cf0000        	ldw	_SET_Key_Cnt,x
2793                     ; 42 	return;
2796  0033 87            	retf	
2821                     ; 45 void ON_OFF_Key_Logic(void)
2821                     ; 46 {
2822                     	switch	.text
2823  0034               f_ON_OFF_Key_Logic:
2827                     ; 48 	if(io_ONOFF_STATUS_INPUT == LOW){ ONF_Key_Cnt++;}
2829  0034 7206500106    	btjt	_PA_IDR,#3,L7471
2832  0039 ce0002        	ldw	x,_ONF_Key_Cnt
2833  003c 5c            	incw	x
2835  003d 200d          	jra	L1571
2836  003f               L7471:
2837                     ; 50 		if(ONF_Key_Cnt>KEY_FILTER){ON_OFF_SW_flag = ON;}
2839  003f ce0002        	ldw	x,_ONF_Key_Cnt
2840  0042 a30004        	cpw	x,#4
2841  0045 2504          	jrult	L3571
2844  0047 72100001      	bset	_SW_Status,#0
2845  004b               L3571:
2846                     ; 51 		ONF_Key_Cnt = 0;
2848  004b 5f            	clrw	x
2849  004c               L1571:
2850  004c cf0002        	ldw	_ONF_Key_Cnt,x
2851                     ; 54 	return;
2854  004f 87            	retf	
2879                     ; 58 void UP_Key_Logic(void)
2879                     ; 59 {
2880                     	switch	.text
2881  0050               f_UP_Key_Logic:
2885                     ; 60 	if(io_UP_STATUS_INPUT == LOW){
2887  0050 7208500127    	btjt	_PA_IDR,#4,L5671
2888                     ; 61 		UP_Key_Cnt++;
2890  0055 ce0004        	ldw	x,_UP_Key_Cnt
2891  0058 5c            	incw	x
2892  0059 cf0004        	ldw	_UP_Key_Cnt,x
2893                     ; 63 		if(UP_Long_SW){ 
2895  005c 720d00010a    	btjf	_SW_Status,#6,L7671
2896                     ; 64 			if(UP_Key_Cnt>Conti_FILTER){
2898  0061 ce0004        	ldw	x,_UP_Key_Cnt
2899  0064 a30006        	cpw	x,#6
2900  0067 2527          	jrult	L7771
2901                     ; 65 				UP_SW_flag = ON;
2902                     ; 66 				UP_Key_Cnt = 0;
2903  0069 201d          	jpf	LC002
2904  006b               L7671:
2905                     ; 69 			if(UP_Key_Cnt>LONG_KEY_FILTER){
2907  006b ce0004        	ldw	x,_UP_Key_Cnt
2908  006e a30033        	cpw	x,#51
2909  0071 251d          	jrult	L7771
2910                     ; 70 				UP_Long_SW = ON;
2912  0073 721c0001      	bset	_SW_Status,#6
2913                     ; 71 				UP_SW_flag = ON;
2915  0077 72120001      	bset	_SW_Status,#1
2917  007b 87            	retf	
2918  007c               L5671:
2919                     ; 76 		UP_Long_SW = OFF;
2921  007c 721d0001      	bres	_SW_Status,#6
2922                     ; 77 		if(UP_Key_Cnt>KEY_FILTER){UP_SW_flag = ON;}
2924  0080 ce0004        	ldw	x,_UP_Key_Cnt
2925  0083 a30004        	cpw	x,#4
2926  0086 2504          	jrult	L1002
2929  0088               LC002:
2931  0088 72120001      	bset	_SW_Status,#1
2932  008c               L1002:
2933                     ; 78 		UP_Key_Cnt = 0;
2936  008c 5f            	clrw	x
2937  008d cf0004        	ldw	_UP_Key_Cnt,x
2938  0090               L7771:
2939                     ; 82 	return;
2942  0090 87            	retf	
2967                     ; 85 void Down_Key_Logic(void)
2967                     ; 86 {
2968                     	switch	.text
2969  0091               f_Down_Key_Logic:
2973                     ; 87 	if(io_DOWN_STATUS_INPUT == LOW){
2975  0091 720a500127    	btjt	_PA_IDR,#5,L3102
2976                     ; 88 		DN_Key_Cnt++;
2978  0096 ce0006        	ldw	x,_DN_Key_Cnt
2979  0099 5c            	incw	x
2980  009a cf0006        	ldw	_DN_Key_Cnt,x
2981                     ; 90 		if(DN_Long_SW == ON){ 
2983  009d 720f00010a    	btjf	_SW_Status,#7,L5102
2984                     ; 91 			if(DN_Key_Cnt>Conti_FILTER){
2986  00a2 ce0006        	ldw	x,_DN_Key_Cnt
2987  00a5 a30006        	cpw	x,#6
2988  00a8 2527          	jrult	L5202
2989                     ; 92 				DN_SW_flag = ON;
2990                     ; 93 				DN_Key_Cnt = 0;
2991  00aa 201d          	jpf	LC004
2992  00ac               L5102:
2993                     ; 97 			if(DN_Key_Cnt>LONG_KEY_FILTER){
2995  00ac ce0006        	ldw	x,_DN_Key_Cnt
2996  00af a30033        	cpw	x,#51
2997  00b2 251d          	jrult	L5202
2998                     ; 98 				DN_Long_SW = ON;
3000  00b4 721e0001      	bset	_SW_Status,#7
3001                     ; 99 				DN_SW_flag = ON;
3003  00b8 72140001      	bset	_SW_Status,#2
3005  00bc 87            	retf	
3006  00bd               L3102:
3007                     ; 103 		DN_Long_SW = OFF;
3009  00bd 721f0001      	bres	_SW_Status,#7
3010                     ; 104 		if(DN_Key_Cnt>KEY_FILTER){DN_SW_flag = ON;}
3012  00c1 ce0006        	ldw	x,_DN_Key_Cnt
3013  00c4 a30004        	cpw	x,#4
3014  00c7 2504          	jrult	L7202
3017  00c9               LC004:
3019  00c9 72140001      	bset	_SW_Status,#2
3020  00cd               L7202:
3021                     ; 105 		DN_Key_Cnt = 0;
3024  00cd 5f            	clrw	x
3025  00ce cf0006        	ldw	_DN_Key_Cnt,x
3026  00d1               L5202:
3027                     ; 108 	return;
3030  00d1 87            	retf	
3056                     ; 111 void Option_Key_Logic(void)
3056                     ; 112 {
3057                     	switch	.text
3058  00d2               f_Option_Key_Logic:
3062                     ; 113 	if(io_OPTION_STATUS_INPUT == LOW){
3064  00d2 720e501a24    	btjt	_PF_IDR,#7,L1402
3065                     ; 114 		OP_Key_Cnt++;
3067  00d7 ce0008        	ldw	x,_OP_Key_Cnt
3068  00da 5c            	incw	x
3069  00db cf0008        	ldw	_OP_Key_Cnt,x
3070                     ; 116 		if(OP_SW_flag == ON){ 
3072  00de 720900010a    	btjf	_SW_Status,#4,L3402
3073                     ; 117 			if(OP_Key_Cnt>Conti_FILTER){
3075  00e3 ce0008        	ldw	x,_OP_Key_Cnt
3076  00e6 a30006        	cpw	x,#6
3077  00e9 2524          	jrult	L3502
3078                     ; 118 				OP_SW_flag = ON;
3079                     ; 119 				OP_Key_Cnt = 0;
3080  00eb 201a          	jpf	LC006
3081  00ed               L3402:
3082                     ; 123 			if(OP_Key_Cnt>LONG_KEY_FILTER){
3084  00ed ce0008        	ldw	x,_OP_Key_Cnt
3085  00f0 a30033        	cpw	x,#51
3086  00f3 251a          	jrult	L3502
3087                     ; 124 				Op_Long_SW = ON;
3089  00f5 72100000      	bset	_SW_Status1,#0
3090                     ; 125 				OP_SW_flag = ON;
3091                     ; 126 				OP_Key_Cnt = 0;
3092  00f9 200c          	jpf	LC006
3093  00fb               L1402:
3094                     ; 130 		Op_Long_SW = OFF;
3096  00fb 72110000      	bres	_SW_Status1,#0
3097                     ; 131 		if(OP_Key_Cnt>KEY_FILTER){OP_SW_flag = ON;}
3099  00ff ce0008        	ldw	x,_OP_Key_Cnt
3100  0102 a30004        	cpw	x,#4
3101  0105 2504          	jrult	L5502
3104  0107               LC006:
3107  0107 72180001      	bset	_SW_Status,#4
3108  010b               L5502:
3109                     ; 132 		OP_Key_Cnt = 0;
3113  010b 5f            	clrw	x
3114  010c cf0008        	ldw	_OP_Key_Cnt,x
3115  010f               L3502:
3116                     ; 135 	return;
3119  010f 87            	retf	
3144                     ; 138 void Enter_Key_Logic(void)
3144                     ; 139 {
3145                     	switch	.text
3146  0110               f_Enter_Key_Logic:
3150                     ; 140 	if(io_ENTER_STATUS_INPUT == LOW){ EN_Key_Cnt++;}
3152  0110 720c501a06    	btjt	_PF_IDR,#6,L7602
3155  0115 ce000a        	ldw	x,_EN_Key_Cnt
3156  0118 5c            	incw	x
3158  0119 200d          	jra	L1702
3159  011b               L7602:
3160                     ; 142 		if(EN_Key_Cnt>KEY_FILTER){EN_SW_flag = ON;}
3162  011b ce000a        	ldw	x,_EN_Key_Cnt
3163  011e a30004        	cpw	x,#4
3164  0121 2504          	jrult	L3702
3167  0123 721a0001      	bset	_SW_Status,#5
3168  0127               L3702:
3169                     ; 143 		EN_Key_Cnt = 0;
3171  0127 5f            	clrw	x
3172  0128               L1702:
3173  0128 cf000a        	ldw	_EN_Key_Cnt,x
3174                     ; 146 	return;
3177  012b 87            	retf	
3263                     	xdef	_EN_Key_Cnt
3264                     	xdef	_OP_Key_Cnt
3265                     	xdef	_DN_Key_Cnt
3266                     	xdef	_UP_Key_Cnt
3267                     	xdef	_ONF_Key_Cnt
3268                     	xdef	_SET_Key_Cnt
3269                     	xdef	f_Zig_Key_Control_Routine
3270                     	xdef	f_Enter_Key_Logic
3271                     	xdef	f_Option_Key_Logic
3272                     	xdef	f_Down_Key_Logic
3273                     	xdef	f_UP_Key_Logic
3274                     	xdef	f_ON_OFF_Key_Logic
3275                     	xdef	f_Set_Key_Logic
3276                     	switch	.bss
3277  0000               _SW_Status1:
3278  0000 00            	ds.b	1
3279                     	xdef	_SW_Status1
3280  0001               _SW_Status:
3281  0001 00            	ds.b	1
3282                     	xdef	_SW_Status
3302                     	end

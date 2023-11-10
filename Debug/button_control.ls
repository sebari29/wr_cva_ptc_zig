   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2685                     ; 30 void ONOFF_Button_Detection(void)
2685                     ; 31 {
2687                     	switch	.text
2688  0000               _ONOFF_Button_Detection:
2692                     ; 32 	if(io_ONOFF_STATUS_INPUT == LOW){ uc_ONOFF_BT_Cnt++; }
2694  0000 c65001        	ld	a,_PA_IDR
2695  0003 a508          	bcp	a,#8
2696  0005 2606          	jrne	L1271
2699  0007 725c0004      	inc	_uc_ONOFF_BT_Cnt
2701  000b 200f          	jra	L3271
2702  000d               L1271:
2703                     ; 34 		if(uc_ONOFF_BT_Cnt > BUTTON_FLT){ b_ONOFF_Button_Flag = ON; }		// filtering_30ms
2705  000d c60004        	ld	a,_uc_ONOFF_BT_Cnt
2706  0010 a104          	cp	a,#4
2707  0012 2504          	jrult	L5271
2710  0014 72100007      	bset	_uc_Button_Status_Reg,#0
2711  0018               L5271:
2712                     ; 35 		uc_ONOFF_BT_Cnt = (U8)(0);
2714  0018 725f0004      	clr	_uc_ONOFF_BT_Cnt
2715  001c               L3271:
2716                     ; 38 	return;
2719  001c 81            	ret
2747                     ; 43 void Up_Button_Detection(void)
2747                     ; 44 {
2748                     	switch	.text
2749  001d               _Up_Button_Detection:
2753                     ; 45 	if(io_UP_STATUS_INPUT == LOW){ 
2755  001d c65001        	ld	a,_PA_IDR
2756  0020 a510          	bcp	a,#16
2757  0022 2631          	jrne	L7371
2758                     ; 46 		uc_Up_BT_Cnt++;
2760  0024 725c0003      	inc	_uc_Up_BT_Cnt
2761                     ; 48 		if(b_Up_Long_Button_Flag){
2763  0028 c60006        	ld	a,_uc_Button_Status_Reg2
2764  002b a501          	bcp	a,#1
2765  002d 2711          	jreq	L1471
2766                     ; 49 			if(uc_Up_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
2768  002f c60003        	ld	a,_uc_Up_BT_Cnt
2769  0032 a104          	cp	a,#4
2770  0034 2532          	jrult	L1571
2771                     ; 50 				b_UP_Button_Flag = ON; 
2773  0036 72120007      	bset	_uc_Button_Status_Reg,#1
2774                     ; 51 				uc_Up_BT_Cnt = (U8)(0);
2776  003a 725f0003      	clr	_uc_Up_BT_Cnt
2777  003e 2028          	jra	L1571
2778  0040               L1471:
2779                     ; 54 			if(uc_Up_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
2781  0040 c60003        	ld	a,_uc_Up_BT_Cnt
2782  0043 a133          	cp	a,#51
2783  0045 2521          	jrult	L1571
2784                     ; 55 				b_UP_Button_Flag = ON;
2786  0047 72120007      	bset	_uc_Button_Status_Reg,#1
2787                     ; 56 				b_Up_Long_Button_Flag = ON;
2789  004b 72100006      	bset	_uc_Button_Status_Reg2,#0
2790                     ; 57 				uc_Up_BT_Cnt = (U8)(0);
2792  004f 725f0003      	clr	_uc_Up_BT_Cnt
2793  0053 2013          	jra	L1571
2794  0055               L7371:
2795                     ; 62 		if(uc_Up_BT_Cnt > BUTTON_FLT){	// filtering_30ms
2797  0055 c60003        	ld	a,_uc_Up_BT_Cnt
2798  0058 a104          	cp	a,#4
2799  005a 2504          	jrult	L3571
2800                     ; 63 			b_UP_Button_Flag = ON;
2802  005c 72120007      	bset	_uc_Button_Status_Reg,#1
2803  0060               L3571:
2804                     ; 65 		b_Up_Long_Button_Flag = OFF;
2806  0060 72110006      	bres	_uc_Button_Status_Reg2,#0
2807                     ; 66 		uc_Up_BT_Cnt = (U8)(0);
2809  0064 725f0003      	clr	_uc_Up_BT_Cnt
2810  0068               L1571:
2811                     ; 69 	return;
2814  0068 81            	ret
2842                     ; 74 void Down_Button_Detection(void)
2842                     ; 75 {
2843                     	switch	.text
2844  0069               _Down_Button_Detection:
2848                     ; 76 	if(io_DOWN_STATUS_INPUT == LOW){ 
2850  0069 c65001        	ld	a,_PA_IDR
2851  006c a520          	bcp	a,#32
2852  006e 2631          	jrne	L5671
2853                     ; 77 		uc_DN_BT_Cnt++;
2855  0070 725c0002      	inc	_uc_DN_BT_Cnt
2856                     ; 79 		if(b_Down_Long_Button_Flag){
2858  0074 c60006        	ld	a,_uc_Button_Status_Reg2
2859  0077 a502          	bcp	a,#2
2860  0079 2711          	jreq	L7671
2861                     ; 80 			if(uc_DN_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
2863  007b c60002        	ld	a,_uc_DN_BT_Cnt
2864  007e a104          	cp	a,#4
2865  0080 2532          	jrult	L7771
2866                     ; 81 				b_DOWN_Button_Flag = ON; 
2868  0082 72140007      	bset	_uc_Button_Status_Reg,#2
2869                     ; 82 				uc_DN_BT_Cnt = (U8)(0);
2871  0086 725f0002      	clr	_uc_DN_BT_Cnt
2872  008a 2028          	jra	L7771
2873  008c               L7671:
2874                     ; 86 			if(uc_DN_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
2876  008c c60002        	ld	a,_uc_DN_BT_Cnt
2877  008f a133          	cp	a,#51
2878  0091 2521          	jrult	L7771
2879                     ; 87 				b_DOWN_Button_Flag = ON;
2881  0093 72140007      	bset	_uc_Button_Status_Reg,#2
2882                     ; 88 				b_Down_Long_Button_Flag = ON;
2884  0097 72120006      	bset	_uc_Button_Status_Reg2,#1
2885                     ; 89 				uc_DN_BT_Cnt = (U8)(0);
2887  009b 725f0002      	clr	_uc_DN_BT_Cnt
2888  009f 2013          	jra	L7771
2889  00a1               L5671:
2890                     ; 94 		if(uc_DN_BT_Cnt > BUTTON_FLT){	// filtering_30ms
2892  00a1 c60002        	ld	a,_uc_DN_BT_Cnt
2893  00a4 a104          	cp	a,#4
2894  00a6 2504          	jrult	L1002
2895                     ; 95 			b_DOWN_Button_Flag = ON;
2897  00a8 72140007      	bset	_uc_Button_Status_Reg,#2
2898  00ac               L1002:
2899                     ; 98 		b_Down_Long_Button_Flag = OFF;
2901  00ac 72130006      	bres	_uc_Button_Status_Reg2,#1
2902                     ; 99 		uc_DN_BT_Cnt = (U8)(0);
2904  00b0 725f0002      	clr	_uc_DN_BT_Cnt
2905  00b4               L7771:
2906                     ; 102 	return;
2909  00b4 81            	ret
2936                     ; 107 void Set_Button_Detection(void)
2936                     ; 108 {
2937                     	switch	.text
2938  00b5               _Set_Button_Detection:
2942                     ; 109 	if(io_SET_STATUS_INPUT == LOW){ uc_Set_BT_Cnt++; }
2944  00b5 c65001        	ld	a,_PA_IDR
2945  00b8 a540          	bcp	a,#64
2946  00ba 2606          	jrne	L3102
2949  00bc 725c0005      	inc	_uc_Set_BT_Cnt
2951  00c0 200f          	jra	L5102
2952  00c2               L3102:
2953                     ; 111 		if(uc_Set_BT_Cnt > BUTTON_FLT){ b_SET_Button_Flag = ON; }		// filtering_30ms
2955  00c2 c60005        	ld	a,_uc_Set_BT_Cnt
2956  00c5 a104          	cp	a,#4
2957  00c7 2504          	jrult	L7102
2960  00c9 72160007      	bset	_uc_Button_Status_Reg,#3
2961  00cd               L7102:
2962                     ; 112 		uc_Set_BT_Cnt = (U8)(0);
2964  00cd 725f0005      	clr	_uc_Set_BT_Cnt
2965  00d1               L5102:
2966                     ; 115 	return;
2969  00d1 81            	ret
2996                     ; 120 void Option_Button_Detection(void)
2996                     ; 121 {
2997                     	switch	.text
2998  00d2               _Option_Button_Detection:
3002                     ; 122 	if(io_OPTION_STATUS_INPUT == LOW){ uc_OP_BT_Cnt++; }
3004  00d2 c6501a        	ld	a,_PF_IDR
3005  00d5 a580          	bcp	a,#128
3006  00d7 2606          	jrne	L1302
3009  00d9 725c0001      	inc	_uc_OP_BT_Cnt
3011  00dd 200f          	jra	L3302
3012  00df               L1302:
3013                     ; 124 		if(uc_OP_BT_Cnt > BUTTON_FLT){ b_OPTION_Button_Flag = ON; }		// filtering_30ms
3015  00df c60001        	ld	a,_uc_OP_BT_Cnt
3016  00e2 a104          	cp	a,#4
3017  00e4 2504          	jrult	L5302
3020  00e6 72180007      	bset	_uc_Button_Status_Reg,#4
3021  00ea               L5302:
3022                     ; 125 		uc_OP_BT_Cnt = (U8)(0);
3024  00ea 725f0001      	clr	_uc_OP_BT_Cnt
3025  00ee               L3302:
3026                     ; 128 	return;
3029  00ee 81            	ret
3056                     ; 133 void Enter_Button_Detection(void)
3056                     ; 134 {
3057                     	switch	.text
3058  00ef               _Enter_Button_Detection:
3062                     ; 135 	if(io_ENTER_STATUS_INPUT == LOW){ uc_En_BT_Cnt++; }
3064  00ef c6501a        	ld	a,_PF_IDR
3065  00f2 a540          	bcp	a,#64
3066  00f4 2606          	jrne	L7402
3069  00f6 725c0000      	inc	_uc_En_BT_Cnt
3071  00fa 200f          	jra	L1502
3072  00fc               L7402:
3073                     ; 137 		if(uc_En_BT_Cnt > BUTTON_FLT){ b_ENTER_Button_Flag = ON; }		// filtering_30ms
3075  00fc c60000        	ld	a,_uc_En_BT_Cnt
3076  00ff a104          	cp	a,#4
3077  0101 2504          	jrult	L3502
3080  0103 721a0007      	bset	_uc_Button_Status_Reg,#5
3081  0107               L3502:
3082                     ; 138 		uc_En_BT_Cnt = (U8)(0);
3084  0107 725f0000      	clr	_uc_En_BT_Cnt
3085  010b               L1502:
3086                     ; 141 	return;
3089  010b 81            	ret
3114                     ; 145 void Controller_Button_Clear(void)
3114                     ; 146 {
3115                     	switch	.text
3116  010c               _Controller_Button_Clear:
3120                     ; 147 	uc_Button_Status_Reg = 0x00;
3122  010c 725f0007      	clr	_uc_Button_Status_Reg
3123                     ; 149 	return;
3126  0110 81            	ret
3156                     ; 154 void Controller_Button_Detection(void)
3156                     ; 155 {
3157                     	switch	.text
3158  0111               _Controller_Button_Detection:
3162                     ; 156 	ONOFF_Button_Detection();
3164  0111 cd0000        	call	_ONOFF_Button_Detection
3166                     ; 157 	Up_Button_Detection();
3168  0114 cd001d        	call	_Up_Button_Detection
3170                     ; 158 	Down_Button_Detection();
3172  0117 cd0069        	call	_Down_Button_Detection
3174                     ; 159 	Set_Button_Detection();
3176  011a ad99          	call	_Set_Button_Detection
3178                     ; 160 	Option_Button_Detection();
3180  011c adb4          	call	_Option_Button_Detection
3182                     ; 161 	Enter_Button_Detection();
3184  011e adcf          	call	_Enter_Button_Detection
3186                     ; 163 	return;
3189  0120 81            	ret
3262                     	xdef	_Enter_Button_Detection
3263                     	xdef	_Option_Button_Detection
3264                     	xdef	_Set_Button_Detection
3265                     	xdef	_Down_Button_Detection
3266                     	xdef	_Up_Button_Detection
3267                     	xdef	_ONOFF_Button_Detection
3268                     	switch	.bss
3269  0000               _uc_En_BT_Cnt:
3270  0000 00            	ds.b	1
3271                     	xdef	_uc_En_BT_Cnt
3272  0001               _uc_OP_BT_Cnt:
3273  0001 00            	ds.b	1
3274                     	xdef	_uc_OP_BT_Cnt
3275  0002               _uc_DN_BT_Cnt:
3276  0002 00            	ds.b	1
3277                     	xdef	_uc_DN_BT_Cnt
3278  0003               _uc_Up_BT_Cnt:
3279  0003 00            	ds.b	1
3280                     	xdef	_uc_Up_BT_Cnt
3281  0004               _uc_ONOFF_BT_Cnt:
3282  0004 00            	ds.b	1
3283                     	xdef	_uc_ONOFF_BT_Cnt
3284  0005               _uc_Set_BT_Cnt:
3285  0005 00            	ds.b	1
3286                     	xdef	_uc_Set_BT_Cnt
3287                     	xdef	_Controller_Button_Detection
3288                     	xdef	_Controller_Button_Clear
3289  0006               _uc_Button_Status_Reg2:
3290  0006 00            	ds.b	1
3291                     	xdef	_uc_Button_Status_Reg2
3292  0007               _uc_Button_Status_Reg:
3293  0007 00            	ds.b	1
3294                     	xdef	_uc_Button_Status_Reg
3314                     	end

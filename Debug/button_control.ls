   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2686                     ; 30 void ONOFF_Button_Detection(void)
2686                     ; 31 {
2688                     	switch	.text
2689  0000               _ONOFF_Button_Detection:
2693                     ; 32 	if(io_ONOFF_STATUS_INPUT == LOW){ uc_ONOFF_BT_Cnt++; }
2695  0000 c65001        	ld	a,_PA_IDR
2696  0003 a508          	bcp	a,#8
2697  0005 2606          	jrne	L1271
2700  0007 725c0004      	inc	_uc_ONOFF_BT_Cnt
2702  000b 200f          	jra	L3271
2703  000d               L1271:
2704                     ; 34 		if(uc_ONOFF_BT_Cnt > BUTTON_FLT){ b_ONOFF_Button_Flag = ON; }		// filtering_30ms
2706  000d c60004        	ld	a,_uc_ONOFF_BT_Cnt
2707  0010 a104          	cp	a,#4
2708  0012 2504          	jrult	L5271
2711  0014 72100007      	bset	_uc_Button_Status_Reg,#0
2712  0018               L5271:
2713                     ; 35 		uc_ONOFF_BT_Cnt = (U8)(0);
2715  0018 725f0004      	clr	_uc_ONOFF_BT_Cnt
2716  001c               L3271:
2717                     ; 38 	return;
2720  001c 81            	ret
2748                     ; 43 void Up_Button_Detection(void)
2748                     ; 44 {
2749                     	switch	.text
2750  001d               _Up_Button_Detection:
2754                     ; 45 	if(io_UP_STATUS_INPUT == LOW){ 
2756  001d c65001        	ld	a,_PA_IDR
2757  0020 a510          	bcp	a,#16
2758  0022 2631          	jrne	L7371
2759                     ; 46 		uc_Up_BT_Cnt++;
2761  0024 725c0003      	inc	_uc_Up_BT_Cnt
2762                     ; 48 		if(b_Up_Long_Button_Flag){
2764  0028 c60006        	ld	a,_uc_Button_Status_Reg2
2765  002b a501          	bcp	a,#1
2766  002d 2711          	jreq	L1471
2767                     ; 49 			if(uc_Up_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
2769  002f c60003        	ld	a,_uc_Up_BT_Cnt
2770  0032 a104          	cp	a,#4
2771  0034 2532          	jrult	L1571
2772                     ; 50 				b_UP_Button_Flag = ON; 
2774  0036 72120007      	bset	_uc_Button_Status_Reg,#1
2775                     ; 51 				uc_Up_BT_Cnt = (U8)(0);
2777  003a 725f0003      	clr	_uc_Up_BT_Cnt
2778  003e 2028          	jra	L1571
2779  0040               L1471:
2780                     ; 54 			if(uc_Up_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
2782  0040 c60003        	ld	a,_uc_Up_BT_Cnt
2783  0043 a133          	cp	a,#51
2784  0045 2521          	jrult	L1571
2785                     ; 55 				b_UP_Button_Flag = ON;
2787  0047 72120007      	bset	_uc_Button_Status_Reg,#1
2788                     ; 56 				b_Up_Long_Button_Flag = ON;
2790  004b 72100006      	bset	_uc_Button_Status_Reg2,#0
2791                     ; 57 				uc_Up_BT_Cnt = (U8)(0);
2793  004f 725f0003      	clr	_uc_Up_BT_Cnt
2794  0053 2013          	jra	L1571
2795  0055               L7371:
2796                     ; 62 		if(uc_Up_BT_Cnt > BUTTON_FLT){	// filtering_30ms
2798  0055 c60003        	ld	a,_uc_Up_BT_Cnt
2799  0058 a104          	cp	a,#4
2800  005a 2504          	jrult	L3571
2801                     ; 63 			b_UP_Button_Flag = ON;
2803  005c 72120007      	bset	_uc_Button_Status_Reg,#1
2804  0060               L3571:
2805                     ; 65 		b_Up_Long_Button_Flag = OFF;
2807  0060 72110006      	bres	_uc_Button_Status_Reg2,#0
2808                     ; 66 		uc_Up_BT_Cnt = (U8)(0);
2810  0064 725f0003      	clr	_uc_Up_BT_Cnt
2811  0068               L1571:
2812                     ; 69 	return;
2815  0068 81            	ret
2843                     ; 74 void Down_Button_Detection(void)
2843                     ; 75 {
2844                     	switch	.text
2845  0069               _Down_Button_Detection:
2849                     ; 76 	if(io_DOWN_STATUS_INPUT == LOW){ 
2851  0069 c65001        	ld	a,_PA_IDR
2852  006c a520          	bcp	a,#32
2853  006e 2631          	jrne	L5671
2854                     ; 77 		uc_DN_BT_Cnt++;
2856  0070 725c0002      	inc	_uc_DN_BT_Cnt
2857                     ; 79 		if(b_Down_Long_Button_Flag){
2859  0074 c60006        	ld	a,_uc_Button_Status_Reg2
2860  0077 a502          	bcp	a,#2
2861  0079 2711          	jreq	L7671
2862                     ; 80 			if(uc_DN_BT_Cnt > CONTI_BUTTON_FLT){ 	// filtering_50ms
2864  007b c60002        	ld	a,_uc_DN_BT_Cnt
2865  007e a104          	cp	a,#4
2866  0080 2532          	jrult	L7771
2867                     ; 81 				b_DOWN_Button_Flag = ON; 
2869  0082 72140007      	bset	_uc_Button_Status_Reg,#2
2870                     ; 82 				uc_DN_BT_Cnt = (U8)(0);
2872  0086 725f0002      	clr	_uc_DN_BT_Cnt
2873  008a 2028          	jra	L7771
2874  008c               L7671:
2875                     ; 86 			if(uc_DN_BT_Cnt > LONG_BUTTON_FLT){		// filtering_500ms
2877  008c c60002        	ld	a,_uc_DN_BT_Cnt
2878  008f a133          	cp	a,#51
2879  0091 2521          	jrult	L7771
2880                     ; 87 				b_DOWN_Button_Flag = ON;
2882  0093 72140007      	bset	_uc_Button_Status_Reg,#2
2883                     ; 88 				b_Down_Long_Button_Flag = ON;
2885  0097 72120006      	bset	_uc_Button_Status_Reg2,#1
2886                     ; 89 				uc_DN_BT_Cnt = (U8)(0);
2888  009b 725f0002      	clr	_uc_DN_BT_Cnt
2889  009f 2013          	jra	L7771
2890  00a1               L5671:
2891                     ; 94 		if(uc_DN_BT_Cnt > BUTTON_FLT){	// filtering_30ms
2893  00a1 c60002        	ld	a,_uc_DN_BT_Cnt
2894  00a4 a104          	cp	a,#4
2895  00a6 2504          	jrult	L1002
2896                     ; 95 			b_DOWN_Button_Flag = ON;
2898  00a8 72140007      	bset	_uc_Button_Status_Reg,#2
2899  00ac               L1002:
2900                     ; 98 		b_Down_Long_Button_Flag = OFF;
2902  00ac 72130006      	bres	_uc_Button_Status_Reg2,#1
2903                     ; 99 		uc_DN_BT_Cnt = (U8)(0);
2905  00b0 725f0002      	clr	_uc_DN_BT_Cnt
2906  00b4               L7771:
2907                     ; 102 	return;
2910  00b4 81            	ret
2937                     ; 107 void Set_Button_Detection(void)
2937                     ; 108 {
2938                     	switch	.text
2939  00b5               _Set_Button_Detection:
2943                     ; 109 	if(io_SET_STATUS_INPUT == LOW){ uc_Set_BT_Cnt++; }
2945  00b5 c65001        	ld	a,_PA_IDR
2946  00b8 a540          	bcp	a,#64
2947  00ba 2606          	jrne	L3102
2950  00bc 725c0005      	inc	_uc_Set_BT_Cnt
2952  00c0 200f          	jra	L5102
2953  00c2               L3102:
2954                     ; 111 		if(uc_Set_BT_Cnt > BUTTON_FLT){ b_SET_Button_Flag = ON; }		// filtering_30ms
2956  00c2 c60005        	ld	a,_uc_Set_BT_Cnt
2957  00c5 a104          	cp	a,#4
2958  00c7 2504          	jrult	L7102
2961  00c9 72160007      	bset	_uc_Button_Status_Reg,#3
2962  00cd               L7102:
2963                     ; 112 		uc_Set_BT_Cnt = (U8)(0);
2965  00cd 725f0005      	clr	_uc_Set_BT_Cnt
2966  00d1               L5102:
2967                     ; 115 	return;
2970  00d1 81            	ret
2997                     ; 120 void Option_Button_Detection(void)
2997                     ; 121 {
2998                     	switch	.text
2999  00d2               _Option_Button_Detection:
3003                     ; 122 	if(io_OPTION_STATUS_INPUT == LOW){ uc_OP_BT_Cnt++; }
3005  00d2 c6501a        	ld	a,_PF_IDR
3006  00d5 a580          	bcp	a,#128
3007  00d7 2606          	jrne	L1302
3010  00d9 725c0001      	inc	_uc_OP_BT_Cnt
3012  00dd 200f          	jra	L3302
3013  00df               L1302:
3014                     ; 124 		if(uc_OP_BT_Cnt > BUTTON_FLT){ b_OPTION_Button_Flag = ON; }		// filtering_30ms
3016  00df c60001        	ld	a,_uc_OP_BT_Cnt
3017  00e2 a104          	cp	a,#4
3018  00e4 2504          	jrult	L5302
3021  00e6 72180007      	bset	_uc_Button_Status_Reg,#4
3022  00ea               L5302:
3023                     ; 125 		uc_OP_BT_Cnt = (U8)(0);
3025  00ea 725f0001      	clr	_uc_OP_BT_Cnt
3026  00ee               L3302:
3027                     ; 128 	return;
3030  00ee 81            	ret
3057                     ; 133 void Enter_Button_Detection(void)
3057                     ; 134 {
3058                     	switch	.text
3059  00ef               _Enter_Button_Detection:
3063                     ; 135 	if(io_ENTER_STATUS_INPUT == LOW){ uc_En_BT_Cnt++; }
3065  00ef c6501a        	ld	a,_PF_IDR
3066  00f2 a540          	bcp	a,#64
3067  00f4 2606          	jrne	L7402
3070  00f6 725c0000      	inc	_uc_En_BT_Cnt
3072  00fa 200f          	jra	L1502
3073  00fc               L7402:
3074                     ; 137 		if(uc_En_BT_Cnt > BUTTON_FLT){ b_ENTER_Button_Flag = ON; }		// filtering_30ms
3076  00fc c60000        	ld	a,_uc_En_BT_Cnt
3077  00ff a104          	cp	a,#4
3078  0101 2504          	jrult	L3502
3081  0103 721a0007      	bset	_uc_Button_Status_Reg,#5
3082  0107               L3502:
3083                     ; 138 		uc_En_BT_Cnt = (U8)(0);
3085  0107 725f0000      	clr	_uc_En_BT_Cnt
3086  010b               L1502:
3087                     ; 141 	return;
3090  010b 81            	ret
3115                     ; 145 void Controller_Button_Clear(void)
3115                     ; 146 {
3116                     	switch	.text
3117  010c               _Controller_Button_Clear:
3121                     ; 147 	uc_Button_Status_Reg = 0x00;
3123  010c 725f0007      	clr	_uc_Button_Status_Reg
3124                     ; 149 	return;
3127  0110 81            	ret
3157                     ; 154 void Controller_Button_Detection(void)
3157                     ; 155 {
3158                     	switch	.text
3159  0111               _Controller_Button_Detection:
3163                     ; 156 	ONOFF_Button_Detection();
3165  0111 cd0000        	call	_ONOFF_Button_Detection
3167                     ; 157 	Up_Button_Detection();
3169  0114 cd001d        	call	_Up_Button_Detection
3171                     ; 158 	Down_Button_Detection();
3173  0117 cd0069        	call	_Down_Button_Detection
3175                     ; 159 	Set_Button_Detection();
3177  011a ad99          	call	_Set_Button_Detection
3179                     ; 160 	Option_Button_Detection();
3181  011c adb4          	call	_Option_Button_Detection
3183                     ; 161 	Enter_Button_Detection();
3185  011e adcf          	call	_Enter_Button_Detection
3187                     ; 163 	return;
3190  0120 81            	ret
3263                     	xdef	_Enter_Button_Detection
3264                     	xdef	_Option_Button_Detection
3265                     	xdef	_Set_Button_Detection
3266                     	xdef	_Down_Button_Detection
3267                     	xdef	_Up_Button_Detection
3268                     	xdef	_ONOFF_Button_Detection
3269                     	switch	.bss
3270  0000               _uc_En_BT_Cnt:
3271  0000 00            	ds.b	1
3272                     	xdef	_uc_En_BT_Cnt
3273  0001               _uc_OP_BT_Cnt:
3274  0001 00            	ds.b	1
3275                     	xdef	_uc_OP_BT_Cnt
3276  0002               _uc_DN_BT_Cnt:
3277  0002 00            	ds.b	1
3278                     	xdef	_uc_DN_BT_Cnt
3279  0003               _uc_Up_BT_Cnt:
3280  0003 00            	ds.b	1
3281                     	xdef	_uc_Up_BT_Cnt
3282  0004               _uc_ONOFF_BT_Cnt:
3283  0004 00            	ds.b	1
3284                     	xdef	_uc_ONOFF_BT_Cnt
3285  0005               _uc_Set_BT_Cnt:
3286  0005 00            	ds.b	1
3287                     	xdef	_uc_Set_BT_Cnt
3288                     	xdef	_Controller_Button_Detection
3289                     	xdef	_Controller_Button_Clear
3290  0006               _uc_Button_Status_Reg2:
3291  0006 00            	ds.b	1
3292                     	xdef	_uc_Button_Status_Reg2
3293  0007               _uc_Button_Status_Reg:
3294  0007 00            	ds.b	1
3295                     	xdef	_uc_Button_Status_Reg
3315                     	end

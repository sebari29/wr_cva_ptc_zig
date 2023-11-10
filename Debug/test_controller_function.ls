   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2654                     	switch	.data
2655  0000               _uc_Rx_Data:
2656  0000 00            	dc.b	0
2657  0001 000000000000  	ds.b	31
2693                     ; 37 void First_Switch_Control(void)
2693                     ; 38 {
2695                     	switch	.text
2696  0000               _First_Switch_Control:
2700                     ; 39 	if(b_ENTER_Button_Flag){
2702  0000 c60000        	ld	a,_uc_Button_Status_Reg
2703  0003 a520          	bcp	a,#32
2704  0005 2718          	jreq	L1271
2705                     ; 40 		b_First_Logic_On = ON;
2707  0007 72100000      	bset	_uc_System_Ctrl_Reg,#0
2708                     ; 41 		b_Model_Select_flag = OFF;		// Model_Selection_Skipped
2710  000b 7211000d      	bres	_uc_Test_Ctrl_Reg,#0
2711                     ; 42 		b_Data_Select_flag = OFF;
2713  000f 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
2714                     ; 44 		uc_Test_Page_Pre = (U8)(1);
2716  0013 35010003      	mov	_uc_Test_Page_Pre,#1
2717                     ; 45 		uc_Test_Data_Select_Num = (U8)(0);
2719  0017 725f0002      	clr	_uc_Test_Data_Select_Num
2720                     ; 47 		b_ENTER_Button_Flag = OFF;
2722  001b 721b0000      	bres	_uc_Button_Status_Reg,#5
2723  001f               L1271:
2724                     ; 50 	return;
2727  001f 81            	ret
2754                     ; 55 void Test_Controller_First_Routine(void)
2754                     ; 56 {
2755                     	switch	.text
2756  0020               _Test_Controller_First_Routine:
2760                     ; 57 	Start_Zig_Display();
2762  0020 cd0000        	call	_Start_Zig_Display
2764                     ; 58 	First_Switch_Control();
2766  0023 addb          	call	_First_Switch_Control
2768                     ; 59 	b_Com_On_flag = OFF;//YJS 20230314
2770  0025 7217000d      	bres	_uc_Test_Ctrl_Reg,#3
2771                     ; 60 	return;
2774  0029 81            	ret
2801                     ; 66 void Model_Select_Display_Handling(void)
2801                     ; 67 {
2802                     	switch	.text
2803  002a               _Model_Select_Display_Handling:
2807                     ; 68 	switch(uc_Test_Page_Now){
2809  002a 725d0004      	tnz	_uc_Test_Page_Now
2810  002e 262a          	jrne	L5371
2813  0030               L3371:
2814                     ; 71 		case 0:	strcpy(LCD_Dis_Data[0],"*HVCC Model*");	
2816  0030 ae0000        	ldw	x,#_LCD_Dis_Data
2817  0033 90ae017a      	ldw	y,#L3571
2818  0037 cd0000        	call	c_strcpx
2820                     ; 72 				strcpy(LCD_Dis_Data[1],"");	// 
2822  003a ae0010        	ldw	x,#_LCD_Dis_Data+16
2823  003d 90ae0179      	ldw	y,#L5571
2824  0041 cd0000        	call	c_strcpx
2826                     ; 73 				strcpy(LCD_Dis_Data[2],"");	// 
2828  0044 ae0020        	ldw	x,#_LCD_Dis_Data+32
2829  0047 90ae0179      	ldw	y,#L5571
2830  004b cd0000        	call	c_strcpx
2832                     ; 74 				strcpy(LCD_Dis_Data[3],"");		
2834  004e ae0030        	ldw	x,#_LCD_Dis_Data+48
2835  0051 90ae0179      	ldw	y,#L5571
2836  0055 cd0000        	call	c_strcpx
2838                     ; 76 				break;
2840  0058 2028          	jra	L1571
2841  005a               L5371:
2842                     ; 78 		default: 
2842                     ; 79 				strcpy(LCD_Dis_Data[0],"");	// Null
2844  005a ae0000        	ldw	x,#_LCD_Dis_Data
2845  005d 90ae0179      	ldw	y,#L5571
2846  0061 cd0000        	call	c_strcpx
2848                     ; 80 				strcpy(LCD_Dis_Data[1],"");	// Null
2850  0064 ae0010        	ldw	x,#_LCD_Dis_Data+16
2851  0067 90ae0179      	ldw	y,#L5571
2852  006b cd0000        	call	c_strcpx
2854                     ; 81 				strcpy(LCD_Dis_Data[2],"");	// Null
2856  006e ae0020        	ldw	x,#_LCD_Dis_Data+32
2857  0071 90ae0179      	ldw	y,#L5571
2858  0075 cd0000        	call	c_strcpx
2860                     ; 82 				strcpy(LCD_Dis_Data[3],"");	// Null
2862  0078 ae0030        	ldw	x,#_LCD_Dis_Data+48
2863  007b 90ae0179      	ldw	y,#L5571
2864  007f cd0000        	call	c_strcpx
2866                     ; 84 				break;
2867  0082               L1571:
2868                     ; 87 	return;
2871  0082 81            	ret
2896                     ; 93 void Model_Select_Switch_Control(void)
2896                     ; 94 {
2897                     	switch	.text
2898  0083               _Model_Select_Switch_Control:
2902                     ; 95 	if(b_UP_Button_Flag){
2904  0083 c60000        	ld	a,_uc_Button_Status_Reg
2905  0086 a502          	bcp	a,#2
2906  0088 2704          	jreq	L1771
2907                     ; 97 		b_UP_Button_Flag = OFF;
2909  008a 72130000      	bres	_uc_Button_Status_Reg,#1
2910  008e               L1771:
2911                     ; 100 	if(b_DOWN_Button_Flag){
2913  008e c60000        	ld	a,_uc_Button_Status_Reg
2914  0091 a504          	bcp	a,#4
2915  0093 2704          	jreq	L3771
2916                     ; 102 		b_DOWN_Button_Flag = OFF;
2918  0095 72150000      	bres	_uc_Button_Status_Reg,#2
2919  0099               L3771:
2920                     ; 105 	if(b_ENTER_Button_Flag){
2922  0099 c60000        	ld	a,_uc_Button_Status_Reg
2923  009c a520          	bcp	a,#32
2924  009e 2704          	jreq	L5771
2925                     ; 107 		b_ENTER_Button_Flag = OFF;
2927  00a0 721b0000      	bres	_uc_Button_Status_Reg,#5
2928  00a4               L5771:
2929                     ; 111 	return;
2932  00a4 81            	ret
2975                     ; 117 void Model_Select_LCD_Display_Control(void)
2975                     ; 118 {
2976                     	switch	.text
2977  00a5               _Model_Select_LCD_Display_Control:
2979  00a5 88            	push	a
2980       00000001      OFST:	set	1
2983                     ; 121 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
2985  00a6 c60004        	ld	a,_uc_Test_Page_Now
2986  00a9 c10003        	cp	a,_uc_Test_Page_Pre
2987  00ac 2703          	jreq	L3102
2990  00ae cd002a        	call	_Model_Select_Display_Handling
2992  00b1               L3102:
2993                     ; 122 	uc_Test_Page_Pre = uc_Test_Page_Now ;
2995  00b1 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
2996                     ; 125 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
2998  00b6 725d0004      	tnz	_uc_Test_Page_Now
2999  00ba 2643          	jrne	L5102
3000                     ; 126 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3002  00bc 0f01          	clr	(OFST+0,sp)
3004  00be               L7102:
3005                     ; 127 			Set_LCD_Address(LCD_Line[uc_line_index]);
3007  00be 7b01          	ld	a,(OFST+0,sp)
3008  00c0 5f            	clrw	x
3009  00c1 97            	ld	xl,a
3010  00c2 d60000        	ld	a,(_LCD_Line,x)
3011  00c5 cd0000        	call	_Set_LCD_Address
3013                     ; 129 			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3015  00c8 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3016  00cb a502          	bcp	a,#2
3017  00cd 271c          	jreq	L5202
3019  00cf 7b01          	ld	a,(OFST+0,sp)
3020  00d1 c10002        	cp	a,_uc_Test_Data_Select_Num
3021  00d4 2615          	jrne	L5202
3022                     ; 130 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3024  00d6 c60000        	ld	a,_uc_LCD_Blink_Reg
3025  00d9 a502          	bcp	a,#2
3026  00db 271a          	jreq	L1302
3029  00dd 7b01          	ld	a,(OFST+0,sp)
3030  00df 97            	ld	xl,a
3031  00e0 a610          	ld	a,#16
3032  00e2 42            	mul	x,a
3033  00e3 1c0000        	addw	x,#_LCD_Dis_Data
3034  00e6 cd0000        	call	_Display_LCD_String
3036  00e9 200c          	jra	L1302
3037  00eb               L5202:
3038                     ; 131 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3040  00eb 7b01          	ld	a,(OFST+0,sp)
3041  00ed 97            	ld	xl,a
3042  00ee a610          	ld	a,#16
3043  00f0 42            	mul	x,a
3044  00f1 1c0000        	addw	x,#_LCD_Dis_Data
3045  00f4 cd0000        	call	_Display_LCD_String
3047  00f7               L1302:
3048                     ; 126 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3050  00f7 0c01          	inc	(OFST+0,sp)
3054  00f9 7b01          	ld	a,(OFST+0,sp)
3055  00fb a104          	cp	a,#4
3056  00fd 25bf          	jrult	L7102
3057  00ff               L5102:
3058                     ; 135 	return;
3061  00ff 84            	pop	a
3062  0100 81            	ret
3088                     ; 140 void Model_Select_Routine(void)
3088                     ; 141 {
3089                     	switch	.text
3090  0101               _Model_Select_Routine:
3094                     ; 142 	Model_Select_LCD_Display_Control();
3096  0101 ada2          	call	_Model_Select_LCD_Display_Control
3098                     ; 143 	Model_Select_Switch_Control();	
3100  0103 cd0083        	call	_Model_Select_Switch_Control
3102                     ; 145 	return;
3105  0106 81            	ret
3151                     ; 151 void Test_Ctrl_Value_Change(U8 uc_st)
3151                     ; 152 {
3152                     	switch	.text
3153  0107               _Test_Ctrl_Value_Change:
3155  0107 88            	push	a
3156  0108 5204          	subw	sp,#4
3157       00000004      OFST:	set	4
3160                     ; 157 	if(uc_st == 1){	
3162  010a a101          	cp	a,#1
3163  010c 2703          	jreq	L22
3164  010e cc024b        	jp	L1602
3165  0111               L22:
3166                     ; 158   		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3168  0111 725d0002      	tnz	_uc_Test_Data_Select_Num
3169  0115 2608          	jrne	L3602
3172  0117 90100009      	bcpl	_uc_Heater_Enable_Flag,#0
3174  011b acf902f9      	jpf	L5512
3175  011f               L3602:
3176                     ; 159 		else if(uc_Test_Data_Select_Num == (U8)(1)){			
3178  011f c60002        	ld	a,_uc_Test_Data_Select_Num
3179  0122 a101          	cp	a,#1
3180  0124 2703          	jreq	L42
3181  0126 cc02f9        	jp	L5512
3182  0129               L42:
3183                     ; 160 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode		
3185  0129 c60000        	ld	a,_uc_Target_Display_Mode
3186  012c a101          	cp	a,#1
3187  012e 2703          	jreq	L62
3188  0130 cc01f3        	jp	L1702
3189  0133               L62:
3190                     ; 161 if (HEATER_zone_status == HTR_ZONE_1)
3192  0133 725d0000      	tnz	_HEATER_zone_status
3193  0137 265d          	jrne	L3702
3194                     ; 163 				if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(20); }
3196  0139 c6000a        	ld	a,_uc_Target_Duty_Perc
3197  013c a114          	cp	a,#20
3198  013e 2408          	jruge	L5702
3201  0140 3514000a      	mov	_uc_Target_Duty_Perc,#20
3203  0144 acf902f9      	jpf	L5512
3204  0148               L5702:
3205                     ; 165 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3207  0148 c60001        	ld	a,_uc_Perc_Unit
3208  014b 5f            	clrw	x
3209  014c 97            	ld	xl,a
3210  014d 1f01          	ldw	(OFST-3,sp),x
3212  014f c6000a        	ld	a,_uc_Target_Duty_Perc
3213  0152 5f            	clrw	x
3214  0153 97            	ld	xl,a
3215  0154 72fb01        	addw	x,(OFST-3,sp)
3216  0157 1f03          	ldw	(OFST-1,sp),x
3218                     ; 167 					if((uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3220  0159 c6000a        	ld	a,_uc_Target_Duty_Perc
3221  015c a1b4          	cp	a,#180
3222  015e 240f          	jruge	L1012
3224  0160 1e03          	ldw	x,(OFST-1,sp)
3225  0162 a300b4        	cpw	x,#180
3226  0165 2508          	jrult	L1012
3229  0167 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3231  016b acf902f9      	jpf	L5512
3232  016f               L1012:
3233                     ; 168 					else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3235  016f c6000a        	ld	a,_uc_Target_Duty_Perc
3236  0172 a1b4          	cp	a,#180
3237  0174 2608          	jrne	L5012
3240  0176 35be000a      	mov	_uc_Target_Duty_Perc,#190
3242  017a acf902f9      	jpf	L5512
3243  017e               L5012:
3244                     ; 169 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(190); }
3246  017e 1e03          	ldw	x,(OFST-1,sp)
3247  0180 a300bf        	cpw	x,#191
3248  0183 2508          	jrult	L1112
3251  0185 35be000a      	mov	_uc_Target_Duty_Perc,#190
3253  0189 acf902f9      	jpf	L5512
3254  018d               L1112:
3255                     ; 170 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3257  018d 7b04          	ld	a,(OFST+0,sp)
3258  018f c7000a        	ld	_uc_Target_Duty_Perc,a
3259  0192 acf902f9      	jpf	L5512
3260  0196               L3702:
3261                     ; 175 				if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(20); }
3263  0196 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3264  0199 a114          	cp	a,#20
3265  019b 2408          	jruge	L7112
3268  019d 3514000b      	mov	_uc_Target_Duty_Perc+1,#20
3270  01a1 acf902f9      	jpf	L5512
3271  01a5               L7112:
3272                     ; 177 					ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3274  01a5 c60001        	ld	a,_uc_Perc_Unit
3275  01a8 5f            	clrw	x
3276  01a9 97            	ld	xl,a
3277  01aa 1f01          	ldw	(OFST-3,sp),x
3279  01ac c6000b        	ld	a,_uc_Target_Duty_Perc+1
3280  01af 5f            	clrw	x
3281  01b0 97            	ld	xl,a
3282  01b1 72fb01        	addw	x,(OFST-3,sp)
3283  01b4 1f03          	ldw	(OFST-1,sp),x
3285                     ; 179 					if((uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(180)) && (ui_buffer >= (U16)(180))){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3287  01b6 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3288  01b9 a1b4          	cp	a,#180
3289  01bb 240f          	jruge	L3212
3291  01bd 1e03          	ldw	x,(OFST-1,sp)
3292  01bf a300b4        	cpw	x,#180
3293  01c2 2508          	jrult	L3212
3296  01c4 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3298  01c8 acf902f9      	jpf	L5512
3299  01cc               L3212:
3300                     ; 180 					else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3302  01cc c6000b        	ld	a,_uc_Target_Duty_Perc+1
3303  01cf a1b4          	cp	a,#180
3304  01d1 2608          	jrne	L7212
3307  01d3 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3309  01d7 acf902f9      	jpf	L5512
3310  01db               L7212:
3311                     ; 181 					else if(ui_buffer > (U16)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(190); }
3313  01db 1e03          	ldw	x,(OFST-1,sp)
3314  01dd a300bf        	cpw	x,#191
3315  01e0 2508          	jrult	L3312
3318  01e2 35be000b      	mov	_uc_Target_Duty_Perc+1,#190
3320  01e6 acf902f9      	jpf	L5512
3321  01ea               L3312:
3322                     ; 182 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3324  01ea 7b04          	ld	a,(OFST+0,sp)
3325  01ec c7000b        	ld	_uc_Target_Duty_Perc+1,a
3326  01ef acf902f9      	jpf	L5512
3327  01f3               L1702:
3328                     ; 187 if (HEATER_zone_status == HTR_ZONE_1)
3330  01f3 725d0000      	tnz	_HEATER_zone_status
3331  01f7 2629          	jrne	L1412
3332                     ; 189 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_1]) + (U16)(uc_Perc_Unit);
3334  01f9 c60001        	ld	a,_uc_Perc_Unit
3335  01fc 5f            	clrw	x
3336  01fd 97            	ld	xl,a
3337  01fe 1f01          	ldw	(OFST-3,sp),x
3339  0200 c6000a        	ld	a,_uc_Target_Duty_Perc
3340  0203 5f            	clrw	x
3341  0204 97            	ld	xl,a
3342  0205 72fb01        	addw	x,(OFST-3,sp)
3343  0208 1f03          	ldw	(OFST-1,sp),x
3345                     ; 190 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(200); }
3347  020a 1e03          	ldw	x,(OFST-1,sp)
3348  020c a300c8        	cpw	x,#200
3349  020f 2508          	jrult	L3412
3352  0211 35c8000a      	mov	_uc_Target_Duty_Perc,#200
3354  0215 acf902f9      	jpf	L5512
3355  0219               L3412:
3356                     ; 191 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(ui_buffer); }
3358  0219 7b04          	ld	a,(OFST+0,sp)
3359  021b c7000a        	ld	_uc_Target_Duty_Perc,a
3360  021e acf902f9      	jpf	L5512
3361  0222               L1412:
3362                     ; 195 				ui_buffer = (U16)(uc_Target_Duty_Perc[HTR_ZONE_2]) + (U16)(uc_Perc_Unit);
3364  0222 c60001        	ld	a,_uc_Perc_Unit
3365  0225 5f            	clrw	x
3366  0226 97            	ld	xl,a
3367  0227 1f01          	ldw	(OFST-3,sp),x
3369  0229 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3370  022c 5f            	clrw	x
3371  022d 97            	ld	xl,a
3372  022e 72fb01        	addw	x,(OFST-3,sp)
3373  0231 1f03          	ldw	(OFST-1,sp),x
3375                     ; 196 				if(ui_buffer >= (U16)(200)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(200); }
3377  0233 1e03          	ldw	x,(OFST-1,sp)
3378  0235 a300c8        	cpw	x,#200
3379  0238 2508          	jrult	L1512
3382  023a 35c8000b      	mov	_uc_Target_Duty_Perc+1,#200
3384  023e acf902f9      	jpf	L5512
3385  0242               L1512:
3386                     ; 197 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(ui_buffer); }
3388  0242 7b04          	ld	a,(OFST+0,sp)
3389  0244 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3390  0247 acf902f9      	jpf	L5512
3391  024b               L1602:
3392                     ; 204 	else if(uc_st == 0){	
3394  024b 0d05          	tnz	(OFST+1,sp)
3395  024d 2703          	jreq	L03
3396  024f cc02f9        	jp	L5512
3397  0252               L03:
3398                     ; 205 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; }
3400  0252 725d0002      	tnz	_uc_Test_Data_Select_Num
3401  0256 2608          	jrne	L1612
3404  0258 90100009      	bcpl	_uc_Heater_Enable_Flag,#0
3406  025c acf902f9      	jpf	L5512
3407  0260               L1612:
3408                     ; 206 		else if(uc_Test_Data_Select_Num == (U8)(1)){
3410  0260 c60002        	ld	a,_uc_Test_Data_Select_Num
3411  0263 a101          	cp	a,#1
3412  0265 2703          	jreq	L23
3413  0267 cc02f9        	jp	L5512
3414  026a               L23:
3415                     ; 207 			if(uc_Target_Display_Mode == (U8)(1)){	// Power_Display_Mode	
3417  026a c60000        	ld	a,_uc_Target_Display_Mode
3418  026d a101          	cp	a,#1
3419  026f 2652          	jrne	L7612
3420                     ; 208 if (HEATER_zone_status == HTR_ZONE_1)
3422  0271 725d0000      	tnz	_HEATER_zone_status
3423  0275 2626          	jrne	L1712
3424                     ; 210 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ 
3426  0277 c6000a        	ld	a,_uc_Target_Duty_Perc
3427  027a c10001        	cp	a,_uc_Perc_Unit
3428  027d 2518          	jrult	L3712
3429                     ; 212 					if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(180); }
3431  027f c6000a        	ld	a,_uc_Target_Duty_Perc
3432  0282 a1be          	cp	a,#190
3433  0284 2606          	jrne	L5712
3436  0286 35b4000a      	mov	_uc_Target_Duty_Perc,#180
3438  028a 206d          	jra	L5512
3439  028c               L5712:
3440                     ; 213 					else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3442  028c c6000a        	ld	a,_uc_Target_Duty_Perc
3443  028f c00001        	sub	a,_uc_Perc_Unit
3444  0292 c7000a        	ld	_uc_Target_Duty_Perc,a
3445  0295 2062          	jra	L5512
3446  0297               L3712:
3447                     ; 215 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3449  0297 725f000a      	clr	_uc_Target_Duty_Perc
3450  029b 205c          	jra	L5512
3451  029d               L1712:
3452                     ; 219 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ 
3454  029d c6000b        	ld	a,_uc_Target_Duty_Perc+1
3455  02a0 c10001        	cp	a,_uc_Perc_Unit
3456  02a3 2518          	jrult	L5022
3457                     ; 221 					if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(180); }
3459  02a5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3460  02a8 a1be          	cp	a,#190
3461  02aa 2606          	jrne	L7022
3464  02ac 35b4000b      	mov	_uc_Target_Duty_Perc+1,#180
3466  02b0 2047          	jra	L5512
3467  02b2               L7022:
3468                     ; 222 					else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3470  02b2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3471  02b5 c00001        	sub	a,_uc_Perc_Unit
3472  02b8 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3473  02bb 203c          	jra	L5512
3474  02bd               L5022:
3475                     ; 224 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3477  02bd 725f000b      	clr	_uc_Target_Duty_Perc+1
3478  02c1 2036          	jra	L5512
3479  02c3               L7612:
3480                     ; 228 if (HEATER_zone_status == HTR_ZONE_1)
3482  02c3 725d0000      	tnz	_HEATER_zone_status
3483  02c7 2619          	jrne	L7122
3484                     ; 230 				if(uc_Target_Duty_Perc[HTR_ZONE_1] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1] - uc_Perc_Unit); }
3486  02c9 c6000a        	ld	a,_uc_Target_Duty_Perc
3487  02cc c10001        	cp	a,_uc_Perc_Unit
3488  02cf 250b          	jrult	L1222
3491  02d1 c6000a        	ld	a,_uc_Target_Duty_Perc
3492  02d4 c00001        	sub	a,_uc_Perc_Unit
3493  02d7 c7000a        	ld	_uc_Target_Duty_Perc,a
3495  02da 201d          	jra	L5512
3496  02dc               L1222:
3497                     ; 231 				else{ uc_Target_Duty_Perc[HTR_ZONE_1] = (U8)(0); }
3499  02dc 725f000a      	clr	_uc_Target_Duty_Perc
3500  02e0 2017          	jra	L5512
3501  02e2               L7122:
3502                     ; 235 				if(uc_Target_Duty_Perc[HTR_ZONE_2] >= uc_Perc_Unit){ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2] - uc_Perc_Unit); }
3504  02e2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
3505  02e5 c10001        	cp	a,_uc_Perc_Unit
3506  02e8 250b          	jrult	L7222
3509  02ea c6000b        	ld	a,_uc_Target_Duty_Perc+1
3510  02ed c00001        	sub	a,_uc_Perc_Unit
3511  02f0 c7000b        	ld	_uc_Target_Duty_Perc+1,a
3513  02f3 2004          	jra	L5512
3514  02f5               L7222:
3515                     ; 236 				else{ uc_Target_Duty_Perc[HTR_ZONE_2] = (U8)(0); }
3517  02f5 725f000b      	clr	_uc_Target_Duty_Perc+1
3518  02f9               L5512:
3519                     ; 242 	return ;
3522  02f9 5b05          	addw	sp,#5
3523  02fb 81            	ret
3557                     ; 247 void Test_Ctrl_Swtich_Control(void)
3557                     ; 248 {
3558                     	switch	.text
3559  02fc               _Test_Ctrl_Swtich_Control:
3563                     ; 250 	if(b_UP_Button_Flag== ON){
3565  02fc c60000        	ld	a,_uc_Button_Status_Reg
3566  02ff a502          	bcp	a,#2
3567  0301 2762          	jreq	L3422
3568                     ; 252 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit < (U8)(130)){ uc_Perc_Unit++;}}
3570  0303 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3571  0306 a510          	bcp	a,#16
3572  0308 270d          	jreq	L5422
3575  030a c60001        	ld	a,_uc_Perc_Unit
3576  030d a182          	cp	a,#130
3577  030f 244e          	jruge	L1522
3580  0311 725c0001      	inc	_uc_Perc_Unit
3581  0315 2048          	jra	L1522
3582  0317               L5422:
3583                     ; 254 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
3585  0317 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3586  031a a504          	bcp	a,#4
3587  031c 2707          	jreq	L3522
3590  031e a601          	ld	a,#1
3591  0320 cd0107        	call	_Test_Ctrl_Value_Change
3594  0323 203a          	jra	L1522
3595  0325               L3522:
3596                     ; 255 			else if(b_Data_Select_flag == ON){
3598  0325 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3599  0328 a502          	bcp	a,#2
3600  032a 2712          	jreq	L7522
3601                     ; 256 				if(uc_Test_Page_Now == (U8)(0)){
3603  032c 725d0004      	tnz	_uc_Test_Page_Now
3604  0330 262d          	jrne	L1522
3605                     ; 257 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3607  0332 725d0002      	tnz	_uc_Test_Data_Select_Num
3608  0336 2727          	jreq	L1522
3611  0338 725a0002      	dec	_uc_Test_Data_Select_Num
3612  033c 2021          	jra	L1522
3613  033e               L7522:
3614                     ; 260 				if(uc_Test_Page_Now > 0){
3616  033e 725d0004      	tnz	_uc_Test_Page_Now
3617  0342 271b          	jreq	L1522
3618                     ; 261 					uc_Test_Page_Now--;
3620  0344 725a0004      	dec	_uc_Test_Page_Now
3621                     ; 262 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3623  0348 725d0004      	tnz	_uc_Test_Page_Now
3624  034c 2606          	jrne	L1722
3627  034e 725f0002      	clr	_uc_Test_Data_Select_Num
3629  0352 200b          	jra	L1522
3630  0354               L1722:
3631                     ; 263 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3633  0354 c60004        	ld	a,_uc_Test_Page_Now
3634  0357 a101          	cp	a,#1
3635  0359 2604          	jrne	L1522
3638  035b 35040002      	mov	_uc_Test_Data_Select_Num,#4
3639  035f               L1522:
3640                     ; 267 		b_UP_Button_Flag = OFF;
3642  035f 72130000      	bres	_uc_Button_Status_Reg,#1
3644  0363 2067          	jra	L7722
3645  0365               L3422:
3646                     ; 271 	else if(b_DOWN_Button_Flag== ON){ 
3648  0365 c60000        	ld	a,_uc_Button_Status_Reg
3649  0368 a504          	bcp	a,#4
3650  036a 2760          	jreq	L7722
3651                     ; 273 		if(b_Test_Option_flag == ON){ if(uc_Perc_Unit > (U8)(1)){ uc_Perc_Unit--;}}
3653  036c c6000d        	ld	a,_uc_Test_Ctrl_Reg
3654  036f a510          	bcp	a,#16
3655  0371 270d          	jreq	L3032
3658  0373 c60001        	ld	a,_uc_Perc_Unit
3659  0376 a102          	cp	a,#2
3660  0378 254e          	jrult	L7032
3663  037a 725a0001      	dec	_uc_Perc_Unit
3664  037e 2048          	jra	L7032
3665  0380               L3032:
3666                     ; 276 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
3668  0380 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3669  0383 a504          	bcp	a,#4
3670  0385 2706          	jreq	L1132
3673  0387 4f            	clr	a
3674  0388 cd0107        	call	_Test_Ctrl_Value_Change
3677  038b 203b          	jra	L7032
3678  038d               L1132:
3679                     ; 278 			else if(b_Data_Select_flag == ON){
3681  038d c6000d        	ld	a,_uc_Test_Ctrl_Reg
3682  0390 a502          	bcp	a,#2
3683  0392 2712          	jreq	L5132
3684                     ; 279 				if(uc_Test_Page_Now == (U8)(0)){
3686  0394 725d0004      	tnz	_uc_Test_Page_Now
3687  0398 262e          	jrne	L7032
3688                     ; 280 					if(uc_Test_Data_Select_Num < 1){ uc_Test_Data_Select_Num++; }
3690  039a 725d0002      	tnz	_uc_Test_Data_Select_Num
3691  039e 2628          	jrne	L7032
3694  03a0 725c0002      	inc	_uc_Test_Data_Select_Num
3695  03a4 2022          	jra	L7032
3696  03a6               L5132:
3697                     ; 283 				if(uc_Test_Page_Now < 4){
3699  03a6 c60004        	ld	a,_uc_Test_Page_Now
3700  03a9 a104          	cp	a,#4
3701  03ab 241b          	jruge	L7032
3702                     ; 284 					uc_Test_Page_Now++;
3704  03ad 725c0004      	inc	_uc_Test_Page_Now
3705                     ; 286 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3707  03b1 725d0004      	tnz	_uc_Test_Page_Now
3708  03b5 2606          	jrne	L7232
3711  03b7 725f0002      	clr	_uc_Test_Data_Select_Num
3713  03bb 200b          	jra	L7032
3714  03bd               L7232:
3715                     ; 287 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3717  03bd c60004        	ld	a,_uc_Test_Page_Now
3718  03c0 a101          	cp	a,#1
3719  03c2 2604          	jrne	L7032
3722  03c4 35040002      	mov	_uc_Test_Data_Select_Num,#4
3723  03c8               L7032:
3724                     ; 291 		b_DOWN_Button_Flag = OFF;
3726  03c8 72150000      	bres	_uc_Button_Status_Reg,#2
3727  03cc               L7722:
3728                     ; 295 	if(b_SET_Button_Flag== ON){
3730  03cc c60000        	ld	a,_uc_Button_Status_Reg
3731  03cf a508          	bcp	a,#8
3732  03d1 2742          	jreq	L5332
3733                     ; 296 		if(b_Test_Option_flag){ uc_Target_Display_Mode ^= ON; uc_Test_Page_Pre = (U8)(10);}
3735  03d3 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3736  03d6 a510          	bcp	a,#16
3737  03d8 270a          	jreq	L7332
3740  03da 90100000      	bcpl	_uc_Target_Display_Mode,#0
3743  03de 350a0003      	mov	_uc_Test_Page_Pre,#10
3745  03e2 202d          	jra	L1432
3746  03e4               L7332:
3747                     ; 297 		else if(uc_Test_Page_Now < 2){
3749  03e4 c60004        	ld	a,_uc_Test_Page_Now
3750  03e7 a102          	cp	a,#2
3751  03e9 2426          	jruge	L1432
3752                     ; 299 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
3754  03eb c6000d        	ld	a,_uc_Test_Ctrl_Reg
3755  03ee a502          	bcp	a,#2
3756  03f0 2606          	jrne	L5432
3759  03f2 7212000d      	bset	_uc_Test_Ctrl_Reg,#1
3761  03f6 2015          	jra	L7432
3762  03f8               L5432:
3763                     ; 301 				if(b_Data_Setting_flag == OFF){
3765  03f8 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3766  03fb a504          	bcp	a,#4
3767  03fd 2606          	jrne	L1532
3768                     ; 302 					b_Data_Setting_flag = ON;
3770  03ff 7214000d      	bset	_uc_Test_Ctrl_Reg,#2
3772  0403 2008          	jra	L7432
3773  0405               L1532:
3774                     ; 304 					b_Data_Setting_flag = OFF;
3776  0405 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
3777                     ; 305 					b_Data_Select_flag = OFF;
3779  0409 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
3780  040d               L7432:
3781                     ; 308 			b_SET_Button_Flag = OFF;
3783  040d 72170000      	bres	_uc_Button_Status_Reg,#3
3784  0411               L1432:
3785                     ; 311 		b_SET_Button_Flag = OFF;
3787  0411 72170000      	bres	_uc_Button_Status_Reg,#3
3788  0415               L5332:
3789                     ; 315 	if(b_ONOFF_Button_Flag== ON){
3791  0415 c60000        	ld	a,_uc_Button_Status_Reg
3792  0418 a501          	bcp	a,#1
3793  041a 2704          	jreq	L5532
3794                     ; 320 		b_ONOFF_Button_Flag = OFF;
3796  041c 72110000      	bres	_uc_Button_Status_Reg,#0
3797  0420               L5532:
3798                     ; 324 	if(b_OPTION_Button_Flag == ON){
3800  0420 c60000        	ld	a,_uc_Button_Status_Reg
3801  0423 a510          	bcp	a,#16
3802  0425 2715          	jreq	L7532
3803                     ; 326 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
3805  0427 c6000d        	ld	a,_uc_Test_Ctrl_Reg
3806  042a a510          	bcp	a,#16
3807  042c 2606          	jrne	L1632
3810  042e 7218000d      	bset	_uc_Test_Ctrl_Reg,#4
3812  0432 2004          	jra	L3632
3813  0434               L1632:
3814                     ; 327 		else{b_Test_Option_flag = OFF; }
3816  0434 7219000d      	bres	_uc_Test_Ctrl_Reg,#4
3817  0438               L3632:
3818                     ; 329 		b_OPTION_Button_Flag = OFF;
3820  0438 72190000      	bres	_uc_Button_Status_Reg,#4
3821  043c               L7532:
3822                     ; 334 	if(b_ENTER_Button_Flag == ON){
3824  043c c60000        	ld	a,_uc_Button_Status_Reg
3825  043f a520          	bcp	a,#32
3826  0441 2721          	jreq	L5632
3827                     ; 335 		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
3829  0443 c60000        	ld	a,_uc_System_Ctrl_Reg
3830  0446 a501          	bcp	a,#1
3831  0448 2606          	jrne	L7632
3834  044a 72100000      	bset	_uc_System_Ctrl_Reg,#0
3836  044e 2010          	jra	L1732
3837  0450               L7632:
3838                     ; 341 if (HEATER_zone_status != HTR_ZONE_1)
3840  0450 725d0000      	tnz	_HEATER_zone_status
3841  0454 2706          	jreq	L3732
3842                     ; 342 HEATER_zone_status = HTR_ZONE_1;
3844  0456 725f0000      	clr	_HEATER_zone_status
3846  045a 2004          	jra	L1732
3847  045c               L3732:
3848                     ; 343 else HEATER_zone_status=HTR_ZONE_2;
3850  045c 35010000      	mov	_HEATER_zone_status,#1
3851  0460               L1732:
3852                     ; 346 		b_ENTER_Button_Flag = OFF;
3854  0460 721b0000      	bres	_uc_Button_Status_Reg,#5
3855  0464               L5632:
3856                     ; 349 	return;
3859  0464 81            	ret
3887                     ; 354 void Test_Ctrl_Text_Display_Handling(void)
3887                     ; 355 {
3888                     	switch	.text
3889  0465               _Test_Ctrl_Text_Display_Handling:
3893                     ; 356 	switch(uc_Test_Page_Now){
3895  0465 c60004        	ld	a,_uc_Test_Page_Now
3897                     ; 379 				break;
3898  0468 4d            	tnz	a
3899  0469 272d          	jreq	L7732
3900  046b 4a            	dec	a
3901  046c 2766          	jreq	L1042
3902  046e               L3042:
3903                     ; 373 		default:
3903                     ; 374 				strcpy(LCD_Dis_Data[0],"");	// Null
3905  046e ae0000        	ldw	x,#_LCD_Dis_Data
3906  0471 90ae0179      	ldw	y,#L5571
3907  0475 cd0000        	call	c_strcpx
3909                     ; 375 				strcpy(LCD_Dis_Data[1],"");	// Null
3911  0478 ae0010        	ldw	x,#_LCD_Dis_Data+16
3912  047b 90ae0179      	ldw	y,#L5571
3913  047f cd0000        	call	c_strcpx
3915                     ; 376 				strcpy(LCD_Dis_Data[2],"");	// Null
3917  0482 ae0020        	ldw	x,#_LCD_Dis_Data+32
3918  0485 90ae0179      	ldw	y,#L5571
3919  0489 cd0000        	call	c_strcpx
3921                     ; 377 				strcpy(LCD_Dis_Data[3],"");	// Null
3923  048c ae0030        	ldw	x,#_LCD_Dis_Data+48
3924  048f 90ae0179      	ldw	y,#L5571
3925  0493 cd0000        	call	c_strcpx
3927                     ; 379 				break;
3929  0496 2064          	jra	L7142
3930  0498               L7732:
3931                     ; 359 		case 0:	strcpy(LCD_Dis_Data[0],"Al:     /");		// PTC_Allowance: / Status 
3933  0498 ae0000        	ldw	x,#_LCD_Dis_Data
3934  049b 90ae016f      	ldw	y,#L1242
3935  049f cd0000        	call	c_strcpx
3937                     ; 360 				if(!uc_Target_Display_Mode){ strcpy(LCD_Dis_Data[1],"Td:     Fd:"); }	// Target Duty:   / Feedback Duty:
3939  04a2 725d0000      	tnz	_uc_Target_Display_Mode
3940  04a6 260c          	jrne	L3242
3943  04a8 ae0010        	ldw	x,#_LCD_Dis_Data+16
3944  04ab 90ae0163      	ldw	y,#L5242
3945  04af cd0000        	call	c_strcpx
3948  04b2 200a          	jra	L7242
3949  04b4               L3242:
3950                     ; 361 				else{ strcpy(LCD_Dis_Data[1],"Tp:     Fd:"); }	// Target Duty:   / Feedback Duty:
3952  04b4 ae0010        	ldw	x,#_LCD_Dis_Data+16
3953  04b7 90ae0157      	ldw	y,#L1342
3954  04bb cd0000        	call	c_strcpx
3956  04be               L7242:
3957                     ; 362 				strcpy(LCD_Dis_Data[2],"R:  F:  HV:");	// Ready: / Fault: / HV:
3959  04be ae0020        	ldw	x,#_LCD_Dis_Data+32
3960  04c1 90ae014b      	ldw	y,#L3342
3961  04c5 cd0000        	call	c_strcpx
3963                     ; 363 				strcpy(LCD_Dis_Data[3],"Cr:     Pw:");	// Current:  / Power:
3965  04c8 ae0030        	ldw	x,#_LCD_Dis_Data+48
3966  04cb 90ae013f      	ldw	y,#L5342
3967  04cf cd0000        	call	c_strcpx
3969                     ; 364 				break;
3971  04d2 2028          	jra	L7142
3972  04d4               L1042:
3973                     ; 367 		case 1:	strcpy(LCD_Dis_Data[0],"Ct:");			// Core Temp:
3975  04d4 ae0000        	ldw	x,#_LCD_Dis_Data
3976  04d7 90ae013b      	ldw	y,#L7342
3977  04db cd0000        	call	c_strcpx
3979                     ; 368 				strcpy(LCD_Dis_Data[1],"Ver:");		// Software_Version:
3981  04de ae0010        	ldw	x,#_LCD_Dis_Data+16
3982  04e1 90ae0136      	ldw	y,#L1442
3983  04e5 cd0000        	call	c_strcpx
3985                     ; 369 				strcpy(LCD_Dis_Data[2],"");	// Core Temp:
3987  04e8 ae0020        	ldw	x,#_LCD_Dis_Data+32
3988  04eb 90ae0179      	ldw	y,#L5571
3989  04ef cd0000        	call	c_strcpx
3991                     ; 370 				strcpy(LCD_Dis_Data[3],"");	// Core Temp
3993  04f2 ae0030        	ldw	x,#_LCD_Dis_Data+48
3994  04f5 90ae0179      	ldw	y,#L5571
3995  04f9 cd0000        	call	c_strcpx
3997                     ; 371 				break;
3999  04fc               L7142:
4000                     ; 382 	return;
4003  04fc 81            	ret
4095                     .const:	section	.text
4096  0000               L25:
4097  0000 000003e8      	dc.l	1000
4098                     ; 387 static void MV_Ctrl_LCD_Display_Control(void)
4098                     ; 388 {
4099                     	switch	.text
4100  04fd               L3442_MV_Ctrl_LCD_Display_Control:
4102  04fd 5216          	subw	sp,#22
4103       00000016      OFST:	set	22
4106                     ; 395 if (HEATER_zone_status==HTR_ZONE_1)
4108  04ff 725d0000      	tnz	_HEATER_zone_status
4109  0503 263a          	jrne	L7742
4110                     ; 397 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4112  0505 0f15          	clr	(OFST-1,sp)
4114  0507               L1052:
4115                     ; 399 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS1][uc_buffer];
4117  0507 96            	ldw	x,sp
4118  0508 1c000d        	addw	x,#OFST-9
4119  050b 9f            	ld	a,xl
4120  050c 5e            	swapw	x
4121  050d 1b15          	add	a,(OFST-1,sp)
4122  050f 2401          	jrnc	L24
4123  0511 5c            	incw	x
4124  0512               L24:
4125  0512 02            	rlwa	x,a
4126  0513 7b15          	ld	a,(OFST-1,sp)
4127  0515 905f          	clrw	y
4128  0517 9097          	ld	yl,a
4129  0519 90d60000      	ld	a,(_uc_Rx_Data,y)
4130  051d f7            	ld	(x),a
4131                     ; 400 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
4133  051e 96            	ldw	x,sp
4134  051f 1c0003        	addw	x,#OFST-19
4135  0522 9f            	ld	a,xl
4136  0523 5e            	swapw	x
4137  0524 1b15          	add	a,(OFST-1,sp)
4138  0526 2401          	jrnc	L44
4139  0528 5c            	incw	x
4140  0529               L44:
4141  0529 02            	rlwa	x,a
4142  052a 7b15          	ld	a,(OFST-1,sp)
4143  052c 905f          	clrw	y
4144  052e 9097          	ld	yl,a
4145  0530 90d60008      	ld	a,(_uc_Rx_Data+8,y)
4146  0534 f7            	ld	(x),a
4147                     ; 397 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4149  0535 0c15          	inc	(OFST-1,sp)
4153  0537 7b15          	ld	a,(OFST-1,sp)
4154  0539 a108          	cp	a,#8
4155  053b 25ca          	jrult	L1052
4157  053d 2038          	jra	L7052
4158  053f               L7742:
4159                     ; 405 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4161  053f 0f15          	clr	(OFST-1,sp)
4163  0541               L1152:
4164                     ; 407 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
4166  0541 96            	ldw	x,sp
4167  0542 1c000d        	addw	x,#OFST-9
4168  0545 9f            	ld	a,xl
4169  0546 5e            	swapw	x
4170  0547 1b15          	add	a,(OFST-1,sp)
4171  0549 2401          	jrnc	L64
4172  054b 5c            	incw	x
4173  054c               L64:
4174  054c 02            	rlwa	x,a
4175  054d 7b15          	ld	a,(OFST-1,sp)
4176  054f 905f          	clrw	y
4177  0551 9097          	ld	yl,a
4178  0553 90d60010      	ld	a,(_uc_Rx_Data+16,y)
4179  0557 f7            	ld	(x),a
4180                     ; 408 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
4182  0558 96            	ldw	x,sp
4183  0559 1c0003        	addw	x,#OFST-19
4184  055c 9f            	ld	a,xl
4185  055d 5e            	swapw	x
4186  055e 1b15          	add	a,(OFST-1,sp)
4187  0560 2401          	jrnc	L05
4188  0562 5c            	incw	x
4189  0563               L05:
4190  0563 02            	rlwa	x,a
4191  0564 7b15          	ld	a,(OFST-1,sp)
4192  0566 905f          	clrw	y
4193  0568 9097          	ld	yl,a
4194  056a 90d60018      	ld	a,(_uc_Rx_Data+24,y)
4195  056e f7            	ld	(x),a
4196                     ; 405 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
4198  056f 0c15          	inc	(OFST-1,sp)
4202  0571 7b15          	ld	a,(OFST-1,sp)
4203  0573 a108          	cp	a,#8
4204  0575 25ca          	jrult	L1152
4205  0577               L7052:
4206                     ; 411 	if(b_Test_Option_flag == ON){
4208  0577 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4209  057a a510          	bcp	a,#16
4210  057c 2779          	jreq	L7152
4211                     ; 412 		Set_LCD_Address(LCD_Line[0]);
4213  057e c60000        	ld	a,_LCD_Line
4214  0581 cd0000        	call	_Set_LCD_Address
4216                     ; 413 		Display_LCD_String("*OPTION*");
4218  0584 ae012d        	ldw	x,#L1252
4219  0587 cd0000        	call	_Display_LCD_String
4221                     ; 415 		if(uc_Target_Display_Mode == (U8)(0)){
4223  058a 725d0000      	tnz	_uc_Target_Display_Mode
4224  058e 260e          	jrne	L3252
4225                     ; 416 			Set_LCD_Address(LCD_Line[1]);
4227  0590 c60001        	ld	a,_LCD_Line+1
4228  0593 cd0000        	call	_Set_LCD_Address
4230                     ; 417 			Display_LCD_String("*Target Perc");
4232  0596 ae0120        	ldw	x,#L5252
4233  0599 cd0000        	call	_Display_LCD_String
4236  059c 200c          	jra	L7252
4237  059e               L3252:
4238                     ; 420 			Set_LCD_Address(LCD_Line[1]);
4240  059e c60001        	ld	a,_LCD_Line+1
4241  05a1 cd0000        	call	_Set_LCD_Address
4243                     ; 421 			Display_LCD_String("*Target Watt(OS)");
4245  05a4 ae010f        	ldw	x,#L1352
4246  05a7 cd0000        	call	_Display_LCD_String
4248  05aa               L7252:
4249                     ; 424 		Set_LCD_Address(LCD_Line[2]);
4251  05aa c60002        	ld	a,_LCD_Line+2
4252  05ad cd0000        	call	_Set_LCD_Address
4254                     ; 425 		Display_LCD_String("D_Unit:");
4256  05b0 ae0107        	ldw	x,#L3352
4257  05b3 cd0000        	call	_Display_LCD_String
4259                     ; 427 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
4261  05b6 c60002        	ld	a,_LCD_Line+2
4262  05b9 ab07          	add	a,#7
4263  05bb cd0000        	call	_Set_LCD_Address
4265                     ; 428 		if(b_Blink_250_Flag){
4267  05be c60000        	ld	a,_uc_LCD_Blink_Reg
4268  05c1 a502          	bcp	a,#2
4269  05c3 272e          	jreq	L5352
4270                     ; 429 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
4272  05c5 c60001        	ld	a,_uc_Perc_Unit
4273  05c8 5f            	clrw	x
4274  05c9 97            	ld	xl,a
4275  05ca 57            	sraw	x
4276  05cb cd0000        	call	_Num_Display_LCD
4278                     ; 430 			Display_LCD_String(".");
4280  05ce ae0105        	ldw	x,#L7352
4281  05d1 cd0000        	call	_Display_LCD_String
4283                     ; 431 			uc_buffer = uc_Perc_Unit %(U8)(2);
4285  05d4 c60001        	ld	a,_uc_Perc_Unit
4286  05d7 a401          	and	a,#1
4287  05d9 6b15          	ld	(OFST-1,sp),a
4289                     ; 432 			if(uc_buffer){ Display_LCD_String("5"); }
4291  05db 0d15          	tnz	(OFST-1,sp)
4292  05dd 2708          	jreq	L1452
4295  05df ae0103        	ldw	x,#L3452
4296  05e2 cd0000        	call	_Display_LCD_String
4299  05e5 2006          	jra	L5452
4300  05e7               L1452:
4301                     ; 433 			else{ Display_LCD_String("0"); }
4303  05e7 ae0101        	ldw	x,#L7452
4304  05ea cd0000        	call	_Display_LCD_String
4306  05ed               L5452:
4307                     ; 434 			Display_LCD_String("%");
4309  05ed ae00ff        	ldw	x,#L1552
4310  05f0 cd0000        	call	_Display_LCD_String
4312  05f3               L5352:
4313                     ; 436 		return;
4315  05f3 ac6a106a      	jpf	L65
4316  05f7               L7152:
4317                     ; 439 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
4319  05f7 c60004        	ld	a,_uc_Test_Page_Now
4320  05fa c10003        	cp	a,_uc_Test_Page_Pre
4321  05fd 270f          	jreq	L3552
4322                     ; 440 		Test_Ctrl_Text_Display_Handling(); 
4324  05ff cd0465        	call	_Test_Ctrl_Text_Display_Handling
4326                     ; 441 		b_Data_Select_flag = OFF;
4328  0602 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
4329                     ; 442 		b_Data_Setting_flag = OFF;
4331  0606 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
4332                     ; 443 		uc_Test_Data_Select_Num = (U8)(0);
4334  060a 725f0002      	clr	_uc_Test_Data_Select_Num
4335  060e               L3552:
4336                     ; 445 	uc_Test_Page_Pre = uc_Test_Page_Now ;
4338  060e 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
4339                     ; 448 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
4341  0613 725d0004      	tnz	_uc_Test_Page_Now
4342  0617 2703          	jreq	L06
4343  0619 cc0b8c        	jp	L5552
4344  061c               L06:
4345                     ; 449 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4347  061c 0f16          	clr	(OFST+0,sp)
4349  061e               L7552:
4350                     ; 451 			Set_LCD_Address(LCD_Line[uc_line_index]);
4352  061e 7b16          	ld	a,(OFST+0,sp)
4353  0620 5f            	clrw	x
4354  0621 97            	ld	xl,a
4355  0622 d60000        	ld	a,(_LCD_Line,x)
4356  0625 cd0000        	call	_Set_LCD_Address
4358                     ; 453 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
4360  0628 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4361  062b a502          	bcp	a,#2
4362  062d 2763          	jreq	L5652
4364  062f c6000d        	ld	a,_uc_Test_Ctrl_Reg
4365  0632 a504          	bcp	a,#4
4366  0634 265c          	jrne	L5652
4367                     ; 454 				if(uc_line_index == uc_Test_Data_Select_Num){ 
4369  0636 7b16          	ld	a,(OFST+0,sp)
4370  0638 c10002        	cp	a,_uc_Test_Data_Select_Num
4371  063b 2647          	jrne	L7652
4372                     ; 455 					if(uc_Test_Data_Select_Num == (U8)(0)){
4374  063d 725d0002      	tnz	_uc_Test_Data_Select_Num
4375  0641 261d          	jrne	L1752
4376                     ; 456 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4378  0643 c60000        	ld	a,_uc_LCD_Blink_Reg
4379  0646 a502          	bcp	a,#2
4380  0648 270e          	jreq	L3752
4383  064a 7b16          	ld	a,(OFST+0,sp)
4384  064c 97            	ld	xl,a
4385  064d a610          	ld	a,#16
4386  064f 42            	mul	x,a
4387  0650 1c0000        	addw	x,#_LCD_Dis_Data
4388  0653 cd0000        	call	_Display_LCD_String
4391  0656 2046          	jra	L5162
4392  0658               L3752:
4393                     ; 457 						else{ Display_LCD_String("        /"); }
4395  0658 ae00f5        	ldw	x,#L7752
4396  065b cd0000        	call	_Display_LCD_String
4398  065e 203e          	jra	L5162
4399  0660               L1752:
4400                     ; 459 					else if(uc_Test_Data_Select_Num == (U8)(1)){
4402  0660 c60002        	ld	a,_uc_Test_Data_Select_Num
4403  0663 a101          	cp	a,#1
4404  0665 2637          	jrne	L5162
4405                     ; 460 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4407  0667 c60000        	ld	a,_uc_LCD_Blink_Reg
4408  066a a502          	bcp	a,#2
4409  066c 270e          	jreq	L5062
4412  066e 7b16          	ld	a,(OFST+0,sp)
4413  0670 97            	ld	xl,a
4414  0671 a610          	ld	a,#16
4415  0673 42            	mul	x,a
4416  0674 1c0000        	addw	x,#_LCD_Dis_Data
4417  0677 cd0000        	call	_Display_LCD_String
4420  067a 2022          	jra	L5162
4421  067c               L5062:
4422                     ; 461 						else{ Display_LCD_String("        Fd:"); }
4424  067c ae00e9        	ldw	x,#L1162
4425  067f cd0000        	call	_Display_LCD_String
4427  0682 201a          	jra	L5162
4428  0684               L7652:
4429                     ; 464 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
4431  0684 7b16          	ld	a,(OFST+0,sp)
4432  0686 97            	ld	xl,a
4433  0687 a610          	ld	a,#16
4434  0689 42            	mul	x,a
4435  068a 1c0000        	addw	x,#_LCD_Dis_Data
4436  068d cd0000        	call	_Display_LCD_String
4438  0690 200c          	jra	L5162
4439  0692               L5652:
4440                     ; 465 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
4442  0692 7b16          	ld	a,(OFST+0,sp)
4443  0694 97            	ld	xl,a
4444  0695 a610          	ld	a,#16
4445  0697 42            	mul	x,a
4446  0698 1c0000        	addw	x,#_LCD_Dis_Data
4447  069b cd0000        	call	_Display_LCD_String
4449  069e               L5162:
4450                     ; 468 			if(uc_line_index == (U8)(0)){		// LINE 1
4452  069e 0d16          	tnz	(OFST+0,sp)
4453  06a0 2703          	jreq	L26
4454  06a2 cc075d        	jp	L7162
4455  06a5               L26:
4456                     ; 471 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4458  06a5 7b16          	ld	a,(OFST+0,sp)
4459  06a7 5f            	clrw	x
4460  06a8 97            	ld	xl,a
4461  06a9 d60000        	ld	a,(_LCD_Line,x)
4462  06ac ab03          	add	a,#3
4463  06ae cd0000        	call	_Set_LCD_Address
4465                     ; 473 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4467  06b1 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4468  06b4 a504          	bcp	a,#4
4469  06b6 2718          	jreq	L1262
4471  06b8 7b16          	ld	a,(OFST+0,sp)
4472  06ba c10002        	cp	a,_uc_Test_Data_Select_Num
4473  06bd 2611          	jrne	L1262
4474                     ; 474 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
4476  06bf c60000        	ld	a,_uc_LCD_Blink_Reg
4477  06c2 a502          	bcp	a,#2
4478  06c4 2712          	jreq	L5262
4481  06c6 c60009        	ld	a,_uc_Heater_Enable_Flag
4482  06c9 5f            	clrw	x
4483  06ca 97            	ld	xl,a
4484  06cb cd0000        	call	_Num_Display_LCD
4486  06ce 2008          	jra	L5262
4487  06d0               L1262:
4488                     ; 475 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
4490  06d0 c60009        	ld	a,_uc_Heater_Enable_Flag
4491  06d3 5f            	clrw	x
4492  06d4 97            	ld	xl,a
4493  06d5 cd0000        	call	_Num_Display_LCD
4495  06d8               L5262:
4496                     ; 479 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
4498  06d8 7b16          	ld	a,(OFST+0,sp)
4499  06da 5f            	clrw	x
4500  06db 97            	ld	xl,a
4501  06dc d60000        	ld	a,(_LCD_Line,x)
4502  06df ab05          	add	a,#5
4503  06e1 cd0000        	call	_Set_LCD_Address
4505                     ; 480 				if (HEATER_zone_status == HTR_ZONE_1)
4507  06e4 725d0000      	tnz	_HEATER_zone_status
4508  06e8 2608          	jrne	L7262
4509                     ; 481 				Display_LCD_String("Z1");
4511  06ea ae00e6        	ldw	x,#L1362
4512  06ed cd0000        	call	_Display_LCD_String
4515  06f0 2006          	jra	L3362
4516  06f2               L7262:
4517                     ; 482 				else Display_LCD_String("Z2");
4519  06f2 ae00e3        	ldw	x,#L5362
4520  06f5 cd0000        	call	_Display_LCD_String
4522  06f8               L3362:
4523                     ; 484 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
4525  06f8 7b16          	ld	a,(OFST+0,sp)
4526  06fa 5f            	clrw	x
4527  06fb 97            	ld	xl,a
4528  06fc d60000        	ld	a,(_LCD_Line,x)
4529  06ff ab09          	add	a,#9
4530  0701 cd0000        	call	_Set_LCD_Address
4532                     ; 486 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
4534  0704 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
4535  0707 a501          	bcp	a,#1
4536  0709 270a          	jreq	L7362
4539  070b ae00e0        	ldw	x,#L1462
4540  070e cd0000        	call	_Display_LCD_String
4543  0711 ac7d0b7d      	jpf	L3762
4544  0715               L7362:
4545                     ; 489 					uc_buffer = (U8)((can_data[0] & 0x06) >> 1);//YJS
4547  0715 7b0d          	ld	a,(OFST-9,sp)
4548  0717 44            	srl	a
4549  0718 a403          	and	a,#3
4550  071a 6b15          	ld	(OFST-1,sp),a
4552                     ; 490 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
4554  071c 0d15          	tnz	(OFST-1,sp)
4555  071e 260a          	jrne	L5462
4558  0720 ae00db        	ldw	x,#L7462
4559  0723 cd0000        	call	_Display_LCD_String
4562  0726 ac7d0b7d      	jpf	L3762
4563  072a               L5462:
4564                     ; 491 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
4566  072a 7b15          	ld	a,(OFST-1,sp)
4567  072c a101          	cp	a,#1
4568  072e 260a          	jrne	L3562
4571  0730 ae00d6        	ldw	x,#L5562
4572  0733 cd0000        	call	_Display_LCD_String
4575  0736 ac7d0b7d      	jpf	L3762
4576  073a               L3562:
4577                     ; 492 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
4579  073a 7b15          	ld	a,(OFST-1,sp)
4580  073c a102          	cp	a,#2
4581  073e 260a          	jrne	L1662
4584  0740 ae00d2        	ldw	x,#L3662
4585  0743 cd0000        	call	_Display_LCD_String
4588  0746 ac7d0b7d      	jpf	L3762
4589  074a               L1662:
4590                     ; 493 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
4592  074a 7b15          	ld	a,(OFST-1,sp)
4593  074c a103          	cp	a,#3
4594  074e 2703          	jreq	L46
4595  0750 cc0b7d        	jp	L3762
4596  0753               L46:
4599  0753 ae00cd        	ldw	x,#L1762
4600  0756 cd0000        	call	_Display_LCD_String
4602  0759 ac7d0b7d      	jpf	L3762
4603  075d               L7162:
4604                     ; 502 			else if(uc_line_index == (U8)(1)){	// LINE 2
4606  075d 7b16          	ld	a,(OFST+0,sp)
4607  075f a101          	cp	a,#1
4608  0761 2703          	jreq	L66
4609  0763 cc0a72        	jp	L5762
4610  0766               L66:
4611                     ; 505 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
4613  0766 7b16          	ld	a,(OFST+0,sp)
4614  0768 5f            	clrw	x
4615  0769 97            	ld	xl,a
4616  076a d60000        	ld	a,(_LCD_Line,x)
4617  076d ab03          	add	a,#3
4618  076f cd0000        	call	_Set_LCD_Address
4620                     ; 506 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4622  0772 c6000d        	ld	a,_uc_Test_Ctrl_Reg
4623  0775 a504          	bcp	a,#4
4624  0777 2603          	jrne	L07
4625  0779 cc08e0        	jp	L7762
4626  077c               L07:
4628  077c 7b16          	ld	a,(OFST+0,sp)
4629  077e c10002        	cp	a,_uc_Test_Data_Select_Num
4630  0781 2703          	jreq	L27
4631  0783 cc08e0        	jp	L7762
4632  0786               L27:
4633                     ; 507 					if(b_Blink_250_Flag){
4635  0786 c60000        	ld	a,_uc_LCD_Blink_Reg
4636  0789 a502          	bcp	a,#2
4637  078b 2603          	jrne	L47
4638  078d cc0a20        	jp	L5772
4639  0790               L47:
4640                     ; 508 						if(!uc_Target_Display_Mode){	// Percentage_Display
4642  0790 725d0000      	tnz	_uc_Target_Display_Mode
4643  0794 2676          	jrne	L3072
4644                     ; 509 if (HEATER_zone_status == HTR_ZONE_1)
4646  0796 725d0000      	tnz	_HEATER_zone_status
4647  079a 2638          	jrne	L5072
4648                     ; 511 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
4650  079c c6000a        	ld	a,_uc_Target_Duty_Perc
4651  079f 5f            	clrw	x
4652  07a0 97            	ld	xl,a
4653  07a1 57            	sraw	x
4654  07a2 cd0000        	call	_Num_Display_LCD
4656                     ; 512 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
4658  07a5 c6000a        	ld	a,_uc_Target_Duty_Perc
4659  07a8 a1c8          	cp	a,#200
4660  07aa 2503          	jrult	L67
4661  07ac cc0a20        	jp	L5772
4662  07af               L67:
4663                     ; 513 								Display_LCD_String(".");
4665  07af ae0105        	ldw	x,#L7352
4666  07b2 cd0000        	call	_Display_LCD_String
4668                     ; 514 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
4670  07b5 c6000a        	ld	a,_uc_Target_Duty_Perc
4671  07b8 a401          	and	a,#1
4672  07ba 6b15          	ld	(OFST-1,sp),a
4674                     ; 515 								if(uc_buffer){ Display_LCD_String("5"); }
4676  07bc 0d15          	tnz	(OFST-1,sp)
4677  07be 270a          	jreq	L1172
4680  07c0 ae0103        	ldw	x,#L3452
4681  07c3 cd0000        	call	_Display_LCD_String
4684  07c6 ac200a20      	jpf	L5772
4685  07ca               L1172:
4686                     ; 516 								else{ Display_LCD_String("0"); }
4688  07ca ae0101        	ldw	x,#L7452
4689  07cd cd0000        	call	_Display_LCD_String
4691  07d0 ac200a20      	jpf	L5772
4692  07d4               L5072:
4693                     ; 521 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
4695  07d4 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4696  07d7 5f            	clrw	x
4697  07d8 97            	ld	xl,a
4698  07d9 57            	sraw	x
4699  07da cd0000        	call	_Num_Display_LCD
4701                     ; 522 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
4703  07dd c6000b        	ld	a,_uc_Target_Duty_Perc+1
4704  07e0 a1c8          	cp	a,#200
4705  07e2 2503          	jrult	L001
4706  07e4 cc0a20        	jp	L5772
4707  07e7               L001:
4708                     ; 523 								Display_LCD_String(".");
4710  07e7 ae0105        	ldw	x,#L7352
4711  07ea cd0000        	call	_Display_LCD_String
4713                     ; 524 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
4715  07ed c6000b        	ld	a,_uc_Target_Duty_Perc+1
4716  07f0 a401          	and	a,#1
4717  07f2 6b15          	ld	(OFST-1,sp),a
4719                     ; 525 								if(uc_buffer){ Display_LCD_String("5"); }
4721  07f4 0d15          	tnz	(OFST-1,sp)
4722  07f6 270a          	jreq	L1272
4725  07f8 ae0103        	ldw	x,#L3452
4726  07fb cd0000        	call	_Display_LCD_String
4729  07fe ac200a20      	jpf	L5772
4730  0802               L1272:
4731                     ; 526 								else{ Display_LCD_String("0"); }
4733  0802 ae0101        	ldw	x,#L7452
4734  0805 cd0000        	call	_Display_LCD_String
4736  0808 ac200a20      	jpf	L5772
4737  080c               L3072:
4738                     ; 531 if (HEATER_zone_status == HTR_ZONE_1)
4740  080c 725d0000      	tnz	_HEATER_zone_status
4741  0810 2667          	jrne	L7272
4742                     ; 533 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
4744  0812 c6000a        	ld	a,_uc_Target_Duty_Perc
4745  0815 a114          	cp	a,#20
4746  0817 2408          	jruge	L1372
4749  0819 5f            	clrw	x
4750  081a cd0000        	call	_Num_Display_LCD
4753  081d ac200a20      	jpf	L5772
4754  0821               L1372:
4755                     ; 534 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
4757  0821 c6000a        	ld	a,_uc_Target_Duty_Perc
4758  0824 a114          	cp	a,#20
4759  0826 260a          	jrne	L5372
4762  0828 ae0064        	ldw	x,#100
4763  082b cd0000        	call	_Num_Display_LCD
4766  082e ac200a20      	jpf	L5772
4767  0832               L5372:
4768                     ; 535 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
4770  0832 c6000a        	ld	a,_uc_Target_Duty_Perc
4771  0835 a1b4          	cp	a,#180
4772  0837 260a          	jrne	L1472
4775  0839 ae1838        	ldw	x,#6200
4776  083c cd0000        	call	_Num_Display_LCD
4779  083f ac200a20      	jpf	L5772
4780  0843               L1472:
4781                     ; 536 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
4783  0843 c6000a        	ld	a,_uc_Target_Duty_Perc
4784  0846 a1be          	cp	a,#190
4785  0848 260a          	jrne	L5472
4788  084a ae00c9        	ldw	x,#L7472
4789  084d cd0000        	call	_Display_LCD_String
4792  0850 ac200a20      	jpf	L5772
4793  0854               L5472:
4794                     ; 537 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
4796  0854 c6000a        	ld	a,_uc_Target_Duty_Perc
4797  0857 5f            	clrw	x
4798  0858 97            	ld	xl,a
4799  0859 1d0014        	subw	x,#20
4800  085c 90ae94ed      	ldw	y,#38125
4801  0860 cd0000        	call	c_umul
4803  0863 ae0000        	ldw	x,#L25
4804  0866 cd0000        	call	c_ludv
4806  0869 be02          	ldw	x,c_lreg+2
4807  086b 1c0064        	addw	x,#100
4808  086e 1f0b          	ldw	(OFST-11,sp),x
4812  0870 1e0b          	ldw	x,(OFST-11,sp)
4813  0872 cd0000        	call	_Num_Display_LCD
4815  0875 ac200a20      	jpf	L5772
4816  0879               L7272:
4817                     ; 541 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
4819  0879 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4820  087c a114          	cp	a,#20
4821  087e 2408          	jruge	L5572
4824  0880 5f            	clrw	x
4825  0881 cd0000        	call	_Num_Display_LCD
4828  0884 ac200a20      	jpf	L5772
4829  0888               L5572:
4830                     ; 542 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
4832  0888 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4833  088b a114          	cp	a,#20
4834  088d 260a          	jrne	L1672
4837  088f ae0064        	ldw	x,#100
4838  0892 cd0000        	call	_Num_Display_LCD
4841  0895 ac200a20      	jpf	L5772
4842  0899               L1672:
4843                     ; 543 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
4845  0899 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4846  089c a1b4          	cp	a,#180
4847  089e 260a          	jrne	L5672
4850  08a0 ae1838        	ldw	x,#6200
4851  08a3 cd0000        	call	_Num_Display_LCD
4854  08a6 ac200a20      	jpf	L5772
4855  08aa               L5672:
4856                     ; 544 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
4858  08aa c6000b        	ld	a,_uc_Target_Duty_Perc+1
4859  08ad a1be          	cp	a,#190
4860  08af 260a          	jrne	L1772
4863  08b1 ae00c9        	ldw	x,#L7472
4864  08b4 cd0000        	call	_Display_LCD_String
4867  08b7 ac200a20      	jpf	L5772
4868  08bb               L1772:
4869                     ; 545 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
4871  08bb c6000b        	ld	a,_uc_Target_Duty_Perc+1
4872  08be 5f            	clrw	x
4873  08bf 97            	ld	xl,a
4874  08c0 1d0014        	subw	x,#20
4875  08c3 90ae94ed      	ldw	y,#38125
4876  08c7 cd0000        	call	c_umul
4878  08ca ae0000        	ldw	x,#L25
4879  08cd cd0000        	call	c_ludv
4881  08d0 be02          	ldw	x,c_lreg+2
4882  08d2 1c0064        	addw	x,#100
4883  08d5 1f0b          	ldw	(OFST-11,sp),x
4887  08d7 1e0b          	ldw	x,(OFST-11,sp)
4888  08d9 cd0000        	call	_Num_Display_LCD
4890  08dc ac200a20      	jpf	L5772
4891  08e0               L7762:
4892                     ; 550 					if(!uc_Target_Display_Mode){
4894  08e0 725d0000      	tnz	_uc_Target_Display_Mode
4895  08e4 2676          	jrne	L7772
4896                     ; 551 if (HEATER_zone_status == HTR_ZONE_1)
4898  08e6 725d0000      	tnz	_HEATER_zone_status
4899  08ea 2638          	jrne	L1003
4900                     ; 553 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
4902  08ec c6000a        	ld	a,_uc_Target_Duty_Perc
4903  08ef 5f            	clrw	x
4904  08f0 97            	ld	xl,a
4905  08f1 57            	sraw	x
4906  08f2 cd0000        	call	_Num_Display_LCD
4908                     ; 554 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
4910  08f5 c6000a        	ld	a,_uc_Target_Duty_Perc
4911  08f8 a1c8          	cp	a,#200
4912  08fa 2503          	jrult	L201
4913  08fc cc0a20        	jp	L5772
4914  08ff               L201:
4915                     ; 555 							Display_LCD_String(".");
4917  08ff ae0105        	ldw	x,#L7352
4918  0902 cd0000        	call	_Display_LCD_String
4920                     ; 556 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
4922  0905 c6000a        	ld	a,_uc_Target_Duty_Perc
4923  0908 a401          	and	a,#1
4924  090a 6b15          	ld	(OFST-1,sp),a
4926                     ; 557 							if(uc_buffer){ Display_LCD_String("5"); }
4928  090c 0d15          	tnz	(OFST-1,sp)
4929  090e 270a          	jreq	L5003
4932  0910 ae0103        	ldw	x,#L3452
4933  0913 cd0000        	call	_Display_LCD_String
4936  0916 ac200a20      	jpf	L5772
4937  091a               L5003:
4938                     ; 558 							else{ Display_LCD_String("0"); }
4940  091a ae0101        	ldw	x,#L7452
4941  091d cd0000        	call	_Display_LCD_String
4943  0920 ac200a20      	jpf	L5772
4944  0924               L1003:
4945                     ; 563 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
4947  0924 c6000b        	ld	a,_uc_Target_Duty_Perc+1
4948  0927 5f            	clrw	x
4949  0928 97            	ld	xl,a
4950  0929 57            	sraw	x
4951  092a cd0000        	call	_Num_Display_LCD
4953                     ; 564 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
4955  092d c6000b        	ld	a,_uc_Target_Duty_Perc+1
4956  0930 a1c8          	cp	a,#200
4957  0932 2503          	jrult	L401
4958  0934 cc0a20        	jp	L5772
4959  0937               L401:
4960                     ; 565 							Display_LCD_String(".");
4962  0937 ae0105        	ldw	x,#L7352
4963  093a cd0000        	call	_Display_LCD_String
4965                     ; 566 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
4967  093d c6000b        	ld	a,_uc_Target_Duty_Perc+1
4968  0940 a401          	and	a,#1
4969  0942 6b15          	ld	(OFST-1,sp),a
4971                     ; 567 							if(uc_buffer){ Display_LCD_String("5"); }
4973  0944 0d15          	tnz	(OFST-1,sp)
4974  0946 270a          	jreq	L5103
4977  0948 ae0103        	ldw	x,#L3452
4978  094b cd0000        	call	_Display_LCD_String
4981  094e ac200a20      	jpf	L5772
4982  0952               L5103:
4983                     ; 568 							else{ Display_LCD_String("0"); }
4985  0952 ae0101        	ldw	x,#L7452
4986  0955 cd0000        	call	_Display_LCD_String
4988  0958 ac200a20      	jpf	L5772
4989  095c               L7772:
4990                     ; 573 if (HEATER_zone_status == HTR_ZONE_1)
4992  095c 725d0000      	tnz	_HEATER_zone_status
4993  0960 2663          	jrne	L3203
4994                     ; 575 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
4996  0962 c6000a        	ld	a,_uc_Target_Duty_Perc
4997  0965 a114          	cp	a,#20
4998  0967 2408          	jruge	L5203
5001  0969 5f            	clrw	x
5002  096a cd0000        	call	_Num_Display_LCD
5005  096d ac200a20      	jpf	L5772
5006  0971               L5203:
5007                     ; 576 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
5009  0971 c6000a        	ld	a,_uc_Target_Duty_Perc
5010  0974 a114          	cp	a,#20
5011  0976 260a          	jrne	L1303
5014  0978 ae0064        	ldw	x,#100
5015  097b cd0000        	call	_Num_Display_LCD
5018  097e ac200a20      	jpf	L5772
5019  0982               L1303:
5020                     ; 577 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
5022  0982 c6000a        	ld	a,_uc_Target_Duty_Perc
5023  0985 a1b4          	cp	a,#180
5024  0987 260a          	jrne	L5303
5027  0989 ae1838        	ldw	x,#6200
5028  098c cd0000        	call	_Num_Display_LCD
5031  098f ac200a20      	jpf	L5772
5032  0993               L5303:
5033                     ; 578 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
5035  0993 c6000a        	ld	a,_uc_Target_Duty_Perc
5036  0996 a1b5          	cp	a,#181
5037  0998 2508          	jrult	L1403
5040  099a ae00c9        	ldw	x,#L7472
5041  099d cd0000        	call	_Display_LCD_String
5044  09a0 207e          	jra	L5772
5045  09a2               L1403:
5046                     ; 579 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
5048  09a2 c6000a        	ld	a,_uc_Target_Duty_Perc
5049  09a5 5f            	clrw	x
5050  09a6 97            	ld	xl,a
5051  09a7 1d0014        	subw	x,#20
5052  09aa 90ae94ed      	ldw	y,#38125
5053  09ae cd0000        	call	c_umul
5055  09b1 ae0000        	ldw	x,#L25
5056  09b4 cd0000        	call	c_ludv
5058  09b7 be02          	ldw	x,c_lreg+2
5059  09b9 1c0064        	addw	x,#100
5060  09bc 1f0b          	ldw	(OFST-11,sp),x
5064  09be 1e0b          	ldw	x,(OFST-11,sp)
5065  09c0 cd0000        	call	_Num_Display_LCD
5067  09c3 205b          	jra	L5772
5068  09c5               L3203:
5069                     ; 583 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
5071  09c5 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5072  09c8 a114          	cp	a,#20
5073  09ca 2406          	jruge	L7403
5076  09cc 5f            	clrw	x
5077  09cd cd0000        	call	_Num_Display_LCD
5080  09d0 204e          	jra	L5772
5081  09d2               L7403:
5082                     ; 584 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
5084  09d2 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5085  09d5 a114          	cp	a,#20
5086  09d7 2608          	jrne	L3503
5089  09d9 ae0064        	ldw	x,#100
5090  09dc cd0000        	call	_Num_Display_LCD
5093  09df 203f          	jra	L5772
5094  09e1               L3503:
5095                     ; 585 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
5097  09e1 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5098  09e4 a1b4          	cp	a,#180
5099  09e6 2608          	jrne	L7503
5102  09e8 ae1838        	ldw	x,#6200
5103  09eb cd0000        	call	_Num_Display_LCD
5106  09ee 2030          	jra	L5772
5107  09f0               L7503:
5108                     ; 586 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
5110  09f0 c6000b        	ld	a,_uc_Target_Duty_Perc+1
5111  09f3 a1b5          	cp	a,#181
5112  09f5 2508          	jrult	L3603
5115  09f7 ae00c9        	ldw	x,#L7472
5116  09fa cd0000        	call	_Display_LCD_String
5119  09fd 2021          	jra	L5772
5120  09ff               L3603:
5121                     ; 587 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
5123  09ff c6000b        	ld	a,_uc_Target_Duty_Perc+1
5124  0a02 5f            	clrw	x
5125  0a03 97            	ld	xl,a
5126  0a04 1d0014        	subw	x,#20
5127  0a07 90ae94ed      	ldw	y,#38125
5128  0a0b cd0000        	call	c_umul
5130  0a0e ae0000        	ldw	x,#L25
5131  0a11 cd0000        	call	c_ludv
5133  0a14 be02          	ldw	x,c_lreg+2
5134  0a16 1c0064        	addw	x,#100
5135  0a19 1f0b          	ldw	(OFST-11,sp),x
5139  0a1b 1e0b          	ldw	x,(OFST-11,sp)
5140  0a1d cd0000        	call	_Num_Display_LCD
5142  0a20               L5772:
5143                     ; 593 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5145  0a20 7b16          	ld	a,(OFST+0,sp)
5146  0a22 5f            	clrw	x
5147  0a23 97            	ld	xl,a
5148  0a24 d60000        	ld	a,(_LCD_Line,x)
5149  0a27 ab0b          	add	a,#11
5150  0a29 cd0000        	call	_Set_LCD_Address
5152                     ; 594 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5154  0a2c c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5155  0a2f a501          	bcp	a,#1
5156  0a31 270a          	jreq	L7603
5159  0a33 ae00e0        	ldw	x,#L1462
5160  0a36 cd0000        	call	_Display_LCD_String
5163  0a39 ac7d0b7d      	jpf	L3762
5164  0a3d               L7603:
5165                     ; 596 					Num_Display_LCD(can_data[6] /(U8)(2));
5167  0a3d 7b13          	ld	a,(OFST-3,sp)
5168  0a3f 5f            	clrw	x
5169  0a40 97            	ld	xl,a
5170  0a41 57            	sraw	x
5171  0a42 cd0000        	call	_Num_Display_LCD
5173                     ; 597 					if(can_data[6] < (U8)(200)){
5175  0a45 7b13          	ld	a,(OFST-3,sp)
5176  0a47 a1c8          	cp	a,#200
5177  0a49 2503          	jrult	L601
5178  0a4b cc0b7d        	jp	L3762
5179  0a4e               L601:
5180                     ; 598 						Display_LCD_String(".");
5182  0a4e ae0105        	ldw	x,#L7352
5183  0a51 cd0000        	call	_Display_LCD_String
5185                     ; 599 						uc_buffer = can_data[6] % (U8)(2);
5187  0a54 7b13          	ld	a,(OFST-3,sp)
5188  0a56 a401          	and	a,#1
5189  0a58 6b15          	ld	(OFST-1,sp),a
5191                     ; 600 						if(uc_buffer){ Display_LCD_String("5"); }
5193  0a5a 0d15          	tnz	(OFST-1,sp)
5194  0a5c 270a          	jreq	L5703
5197  0a5e ae0103        	ldw	x,#L3452
5198  0a61 cd0000        	call	_Display_LCD_String
5201  0a64 ac7d0b7d      	jpf	L3762
5202  0a68               L5703:
5203                     ; 601 						else{ Display_LCD_String("0"); }
5205  0a68 ae0101        	ldw	x,#L7452
5206  0a6b cd0000        	call	_Display_LCD_String
5208  0a6e ac7d0b7d      	jpf	L3762
5209  0a72               L5762:
5210                     ; 607 			else if(uc_line_index == (U8)(2)){	// LINE 3
5212  0a72 7b16          	ld	a,(OFST+0,sp)
5213  0a74 a102          	cp	a,#2
5214  0a76 2703          	jreq	L011
5215  0a78 cc0b05        	jp	L3013
5216  0a7b               L011:
5217                     ; 610 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
5219  0a7b 7b16          	ld	a,(OFST+0,sp)
5220  0a7d 5f            	clrw	x
5221  0a7e 97            	ld	xl,a
5222  0a7f d60000        	ld	a,(_LCD_Line,x)
5223  0a82 ab02          	add	a,#2
5224  0a84 cd0000        	call	_Set_LCD_Address
5226                     ; 611 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
5228  0a87 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5229  0a8a a501          	bcp	a,#1
5230  0a8c 2708          	jreq	L5013
5233  0a8e ae00c7        	ldw	x,#L7013
5234  0a91 cd0000        	call	_Display_LCD_String
5237  0a94 2014          	jra	L1113
5238  0a96               L5013:
5239                     ; 613 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
5241  0a96 7b0d          	ld	a,(OFST-9,sp)
5242  0a98 a501          	bcp	a,#1
5243  0a9a 2708          	jreq	L3113
5246  0a9c ae00c5        	ldw	x,#L5113
5247  0a9f cd0000        	call	_Display_LCD_String
5250  0aa2 2006          	jra	L1113
5251  0aa4               L3113:
5252                     ; 614 					else{ Display_LCD_String("0"); }
5254  0aa4 ae0101        	ldw	x,#L7452
5255  0aa7 cd0000        	call	_Display_LCD_String
5257  0aaa               L1113:
5258                     ; 617 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
5260  0aaa 7b16          	ld	a,(OFST+0,sp)
5261  0aac 5f            	clrw	x
5262  0aad 97            	ld	xl,a
5263  0aae d60000        	ld	a,(_LCD_Line,x)
5264  0ab1 ab06          	add	a,#6
5265  0ab3 cd0000        	call	_Set_LCD_Address
5267                     ; 618 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
5269  0ab6 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5270  0ab9 a502          	bcp	a,#2
5271  0abb 2708          	jreq	L1213
5274  0abd ae00c7        	ldw	x,#L7013
5275  0ac0 cd0000        	call	_Display_LCD_String
5278  0ac3 2014          	jra	L3213
5279  0ac5               L1213:
5280                     ; 620 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
5282  0ac5 7b03          	ld	a,(OFST-19,sp)
5283  0ac7 a501          	bcp	a,#1
5284  0ac9 2708          	jreq	L5213
5287  0acb ae00c5        	ldw	x,#L5113
5288  0ace cd0000        	call	_Display_LCD_String
5291  0ad1 2006          	jra	L3213
5292  0ad3               L5213:
5293                     ; 621 					else{ Display_LCD_String("0"); }
5295  0ad3 ae0101        	ldw	x,#L7452
5296  0ad6 cd0000        	call	_Display_LCD_String
5298  0ad9               L3213:
5299                     ; 624 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5301  0ad9 7b16          	ld	a,(OFST+0,sp)
5302  0adb 5f            	clrw	x
5303  0adc 97            	ld	xl,a
5304  0add d60000        	ld	a,(_LCD_Line,x)
5305  0ae0 ab0b          	add	a,#11
5306  0ae2 cd0000        	call	_Set_LCD_Address
5308                     ; 625 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5310  0ae5 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5311  0ae8 a501          	bcp	a,#1
5312  0aea 270a          	jreq	L1313
5315  0aec ae00e0        	ldw	x,#L1462
5316  0aef cd0000        	call	_Display_LCD_String
5319  0af2 ac7d0b7d      	jpf	L3762
5320  0af6               L1313:
5321                     ; 627 					ui_buffer = (U16)(can_data[4]) * (U16)(4);//YJS 2->4
5323  0af6 7b11          	ld	a,(OFST-5,sp)
5324  0af8 97            	ld	xl,a
5325  0af9 a604          	ld	a,#4
5326  0afb 42            	mul	x,a
5327  0afc 1f0b          	ldw	(OFST-11,sp),x
5329                     ; 628 					Num_Display_LCD(ui_buffer);
5331  0afe 1e0b          	ldw	x,(OFST-11,sp)
5332  0b00 cd0000        	call	_Num_Display_LCD
5334  0b03 2078          	jra	L3762
5335  0b05               L3013:
5336                     ; 633 			else if(uc_line_index == (U8)(3)){	// LINE 4
5338  0b05 7b16          	ld	a,(OFST+0,sp)
5339  0b07 a103          	cp	a,#3
5340  0b09 2672          	jrne	L3762
5341                     ; 636 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5343  0b0b 7b16          	ld	a,(OFST+0,sp)
5344  0b0d 5f            	clrw	x
5345  0b0e 97            	ld	xl,a
5346  0b0f d60000        	ld	a,(_LCD_Line,x)
5347  0b12 ab03          	add	a,#3
5348  0b14 cd0000        	call	_Set_LCD_Address
5350                     ; 638 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5352  0b17 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5353  0b1a a501          	bcp	a,#1
5354  0b1c 2708          	jreq	L1413
5357  0b1e ae00e0        	ldw	x,#L1462
5358  0b21 cd0000        	call	_Display_LCD_String
5361  0b24 2026          	jra	L3413
5362  0b26               L1413:
5363                     ; 640 					Num_Display_LCD(can_data[5] / (U8)(5));
5365  0b26 7b12          	ld	a,(OFST-4,sp)
5366  0b28 5f            	clrw	x
5367  0b29 97            	ld	xl,a
5368  0b2a a605          	ld	a,#5
5369  0b2c cd0000        	call	c_sdivx
5371  0b2f cd0000        	call	_Num_Display_LCD
5373                     ; 641 					Display_LCD_String(".");
5375  0b32 ae0105        	ldw	x,#L7352
5376  0b35 cd0000        	call	_Display_LCD_String
5378                     ; 642 					uc_buffer = can_data[5] % (U8)(5);
5380  0b38 7b12          	ld	a,(OFST-4,sp)
5381  0b3a 5f            	clrw	x
5382  0b3b 97            	ld	xl,a
5383  0b3c a605          	ld	a,#5
5384  0b3e 62            	div	x,a
5385  0b3f 5f            	clrw	x
5386  0b40 97            	ld	xl,a
5387  0b41 9f            	ld	a,xl
5388  0b42 6b15          	ld	(OFST-1,sp),a
5390                     ; 643 					Num_Display_LCD(uc_buffer * (U8)(2));
5392  0b44 7b15          	ld	a,(OFST-1,sp)
5393  0b46 5f            	clrw	x
5394  0b47 97            	ld	xl,a
5395  0b48 58            	sllw	x
5396  0b49 cd0000        	call	_Num_Display_LCD
5398  0b4c               L3413:
5399                     ; 649 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
5401  0b4c 7b16          	ld	a,(OFST+0,sp)
5402  0b4e 5f            	clrw	x
5403  0b4f 97            	ld	xl,a
5404  0b50 d60000        	ld	a,(_LCD_Line,x)
5405  0b53 ab0b          	add	a,#11
5406  0b55 cd0000        	call	_Set_LCD_Address
5408                     ; 651 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5410  0b58 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5411  0b5b a501          	bcp	a,#1
5412  0b5d 2708          	jreq	L5413
5415  0b5f ae00e0        	ldw	x,#L1462
5416  0b62 cd0000        	call	_Display_LCD_String
5419  0b65 2016          	jra	L3762
5420  0b67               L5413:
5421                     ; 653 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
5423  0b67 7b0f          	ld	a,(OFST-7,sp)
5424  0b69 5f            	clrw	x
5425  0b6a 97            	ld	xl,a
5426  0b6b 1f01          	ldw	(OFST-21,sp),x
5428  0b6d 7b10          	ld	a,(OFST-6,sp)
5429  0b6f 5f            	clrw	x
5430  0b70 97            	ld	xl,a
5431  0b71 4f            	clr	a
5432  0b72 02            	rlwa	x,a
5433  0b73 72fb01        	addw	x,(OFST-21,sp)
5434  0b76 1f0b          	ldw	(OFST-11,sp),x
5436                     ; 654 					Num_Display_LCD(ui_buffer);
5438  0b78 1e0b          	ldw	x,(OFST-11,sp)
5439  0b7a cd0000        	call	_Num_Display_LCD
5441  0b7d               L3762:
5442                     ; 449 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5444  0b7d 0c16          	inc	(OFST+0,sp)
5448  0b7f 7b16          	ld	a,(OFST+0,sp)
5449  0b81 a104          	cp	a,#4
5450  0b83 2403          	jruge	L211
5451  0b85 cc061e        	jp	L7552
5452  0b88               L211:
5454  0b88 ac4b104b      	jpf	L1513
5455  0b8c               L5552:
5456                     ; 664 	else if(uc_Test_Page_Now == (U8)(1)){
5458  0b8c c60004        	ld	a,_uc_Test_Page_Now
5459  0b8f a101          	cp	a,#1
5460  0b91 2703          	jreq	L411
5461  0b93 cc0c44        	jp	L3513
5462  0b96               L411:
5463                     ; 665 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5465  0b96 0f16          	clr	(OFST+0,sp)
5467  0b98               L5513:
5468                     ; 667 			Set_LCD_Address(LCD_Line[uc_line_index]);
5470  0b98 7b16          	ld	a,(OFST+0,sp)
5471  0b9a 5f            	clrw	x
5472  0b9b 97            	ld	xl,a
5473  0b9c d60000        	ld	a,(_LCD_Line,x)
5474  0b9f cd0000        	call	_Set_LCD_Address
5476                     ; 668 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
5478  0ba2 7b16          	ld	a,(OFST+0,sp)
5479  0ba4 97            	ld	xl,a
5480  0ba5 a610          	ld	a,#16
5481  0ba7 42            	mul	x,a
5482  0ba8 1c0000        	addw	x,#_LCD_Dis_Data
5483  0bab cd0000        	call	_Display_LCD_String
5485                     ; 671 			if(uc_line_index == (U8)(0)){		// LINE 1
5487  0bae 0d16          	tnz	(OFST+0,sp)
5488  0bb0 2641          	jrne	L3613
5489                     ; 674 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
5491  0bb2 7b16          	ld	a,(OFST+0,sp)
5492  0bb4 5f            	clrw	x
5493  0bb5 97            	ld	xl,a
5494  0bb6 d60000        	ld	a,(_LCD_Line,x)
5495  0bb9 ab03          	add	a,#3
5496  0bbb cd0000        	call	_Set_LCD_Address
5498                     ; 675 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5500  0bbe c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5501  0bc1 a501          	bcp	a,#1
5502  0bc3 2708          	jreq	L5613
5505  0bc5 ae00e0        	ldw	x,#L1462
5506  0bc8 cd0000        	call	_Display_LCD_String
5509  0bcb 2026          	jra	L3613
5510  0bcd               L5613:
5511                     ; 677 					if(can_data[1] < (U8)(40)){
5513  0bcd 7b0e          	ld	a,(OFST-8,sp)
5514  0bcf a128          	cp	a,#40
5515  0bd1 2416          	jruge	L1713
5516                     ; 678 						Display_LCD_String("-");
5518  0bd3 ae00c3        	ldw	x,#L3713
5519  0bd6 cd0000        	call	_Display_LCD_String
5521                     ; 679 						Num_Display_LCD((U8)(40) - can_data[1]);
5523  0bd9 a600          	ld	a,#0
5524  0bdb 97            	ld	xl,a
5525  0bdc a628          	ld	a,#40
5526  0bde 100e          	sub	a,(OFST-8,sp)
5527  0be0 2401          	jrnc	L45
5528  0be2 5a            	decw	x
5529  0be3               L45:
5530  0be3 02            	rlwa	x,a
5531  0be4 cd0000        	call	_Num_Display_LCD
5534  0be7 200a          	jra	L3613
5535  0be9               L1713:
5536                     ; 682 						Num_Display_LCD(can_data[1] - (U8)(40));
5538  0be9 7b0e          	ld	a,(OFST-8,sp)
5539  0beb 5f            	clrw	x
5540  0bec 97            	ld	xl,a
5541  0bed 1d0028        	subw	x,#40
5542  0bf0 cd0000        	call	_Num_Display_LCD
5544  0bf3               L3613:
5545                     ; 688 			if(uc_line_index == (U8)(1)){		// LINE 2
5547  0bf3 7b16          	ld	a,(OFST+0,sp)
5548  0bf5 a101          	cp	a,#1
5549  0bf7 2634          	jrne	L7713
5550                     ; 691 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
5552  0bf9 7b16          	ld	a,(OFST+0,sp)
5553  0bfb 5f            	clrw	x
5554  0bfc 97            	ld	xl,a
5555  0bfd d60000        	ld	a,(_LCD_Line,x)
5556  0c00 ab04          	add	a,#4
5557  0c02 cd0000        	call	_Set_LCD_Address
5559                     ; 692 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
5561  0c05 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5562  0c08 a502          	bcp	a,#2
5563  0c0a 2708          	jreq	L1023
5566  0c0c ae00e0        	ldw	x,#L1462
5567  0c0f cd0000        	call	_Display_LCD_String
5570  0c12 2019          	jra	L7713
5571  0c14               L1023:
5572                     ; 699 					Num_Display_LCD(can_diag[6] >> 4);  				//SoftWare Version Display
5574  0c14 7b09          	ld	a,(OFST-13,sp)
5575  0c16 4e            	swap	a
5576  0c17 a40f          	and	a,#15
5577  0c19 5f            	clrw	x
5578  0c1a 97            	ld	xl,a
5579  0c1b cd0000        	call	_Num_Display_LCD
5581                     ; 700 					Display_LCD_String(".");
5583  0c1e ae0105        	ldw	x,#L7352
5584  0c21 cd0000        	call	_Display_LCD_String
5586                     ; 701 					Num_Display_LCD(can_diag[6] & 0x0F);  			//SoftWare Version Display
5588  0c24 7b09          	ld	a,(OFST-13,sp)
5589  0c26 a40f          	and	a,#15
5590  0c28 5f            	clrw	x
5591  0c29 97            	ld	xl,a
5592  0c2a cd0000        	call	_Num_Display_LCD
5594  0c2d               L7713:
5595                     ; 707 			if(uc_line_index == (U8)(2)){		// LINE 2
5597  0c2d 7b16          	ld	a,(OFST+0,sp)
5598  0c2f a102          	cp	a,#2
5599                     ; 712 			if(uc_line_index == (U8)(3)){		// LINE 3
5601  0c31 7b16          	ld	a,(OFST+0,sp)
5602  0c33 a103          	cp	a,#3
5603                     ; 665 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
5605  0c35 0c16          	inc	(OFST+0,sp)
5609  0c37 7b16          	ld	a,(OFST+0,sp)
5610  0c39 a104          	cp	a,#4
5611  0c3b 2403          	jruge	L611
5612  0c3d cc0b98        	jp	L5513
5613  0c40               L611:
5615  0c40 ac4b104b      	jpf	L1513
5616  0c44               L3513:
5617                     ; 719 		if(b_Rx2_Msg_TimeOut_Flag){
5619  0c44 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
5620  0c47 a502          	bcp	a,#2
5621  0c49 2710          	jreq	L3123
5622                     ; 720 			Set_LCD_Address(LCD_Line[0]);	
5624  0c4b c60000        	ld	a,_LCD_Line
5625  0c4e cd0000        	call	_Set_LCD_Address
5627                     ; 721 			Display_LCD_String("NC");
5629  0c51 ae00e0        	ldw	x,#L1462
5630  0c54 cd0000        	call	_Display_LCD_String
5633  0c57 ac4b104b      	jpf	L1513
5634  0c5b               L3123:
5635                     ; 724 			uc_fault_cnt = (U8)(0);
5637  0c5b 0f16          	clr	(OFST+0,sp)
5639                     ; 726 			if(can_diag[1] & (U8)(0x01)){
5641  0c5d 7b04          	ld	a,(OFST-18,sp)
5642  0c5f a501          	bcp	a,#1
5643  0c61 273c          	jreq	L7123
5644                     ; 727 				uc_fault_cnt++;
5646  0c63 0c16          	inc	(OFST+0,sp)
5648                     ; 728 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5648                     ; 729 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5648                     ; 730 				){
5650  0c65 0d16          	tnz	(OFST+0,sp)
5651  0c67 270d          	jreq	L5223
5653  0c69 7b16          	ld	a,(OFST+0,sp)
5654  0c6b a105          	cp	a,#5
5655  0c6d 2407          	jruge	L5223
5657  0c6f c60004        	ld	a,_uc_Test_Page_Now
5658  0c72 a102          	cp	a,#2
5659  0c74 2713          	jreq	L3223
5660  0c76               L5223:
5662  0c76 7b16          	ld	a,(OFST+0,sp)
5663  0c78 a105          	cp	a,#5
5664  0c7a 2523          	jrult	L7123
5666  0c7c 7b16          	ld	a,(OFST+0,sp)
5667  0c7e a109          	cp	a,#9
5668  0c80 241d          	jruge	L7123
5670  0c82 c60004        	ld	a,_uc_Test_Page_Now
5671  0c85 a103          	cp	a,#3
5672  0c87 2616          	jrne	L7123
5673  0c89               L3223:
5674                     ; 731 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5676  0c89 7b16          	ld	a,(OFST+0,sp)
5677  0c8b 5f            	clrw	x
5678  0c8c 97            	ld	xl,a
5679  0c8d 5a            	decw	x
5680  0c8e a604          	ld	a,#4
5681  0c90 cd0000        	call	c_smodx
5683  0c93 d60000        	ld	a,(_LCD_Line,x)
5684  0c96 cd0000        	call	_Set_LCD_Address
5686                     ; 732 					Display_LCD_String("Flt_LVLow");
5688  0c99 ae00b9        	ldw	x,#L1323
5689  0c9c cd0000        	call	_Display_LCD_String
5691  0c9f               L7123:
5692                     ; 736 			if(can_diag[1] & (U8)(0x02)){
5694  0c9f 7b04          	ld	a,(OFST-18,sp)
5695  0ca1 a502          	bcp	a,#2
5696  0ca3 273c          	jreq	L3323
5697                     ; 737 				uc_fault_cnt++;
5699  0ca5 0c16          	inc	(OFST+0,sp)
5701                     ; 738 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5701                     ; 739 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5701                     ; 740 				){
5703  0ca7 0d16          	tnz	(OFST+0,sp)
5704  0ca9 270d          	jreq	L1423
5706  0cab 7b16          	ld	a,(OFST+0,sp)
5707  0cad a105          	cp	a,#5
5708  0caf 2407          	jruge	L1423
5710  0cb1 c60004        	ld	a,_uc_Test_Page_Now
5711  0cb4 a102          	cp	a,#2
5712  0cb6 2713          	jreq	L7323
5713  0cb8               L1423:
5715  0cb8 7b16          	ld	a,(OFST+0,sp)
5716  0cba a105          	cp	a,#5
5717  0cbc 2523          	jrult	L3323
5719  0cbe 7b16          	ld	a,(OFST+0,sp)
5720  0cc0 a109          	cp	a,#9
5721  0cc2 241d          	jruge	L3323
5723  0cc4 c60004        	ld	a,_uc_Test_Page_Now
5724  0cc7 a103          	cp	a,#3
5725  0cc9 2616          	jrne	L3323
5726  0ccb               L7323:
5727                     ; 741 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5729  0ccb 7b16          	ld	a,(OFST+0,sp)
5730  0ccd 5f            	clrw	x
5731  0cce 97            	ld	xl,a
5732  0ccf 5a            	decw	x
5733  0cd0 a604          	ld	a,#4
5734  0cd2 cd0000        	call	c_smodx
5736  0cd5 d60000        	ld	a,(_LCD_Line,x)
5737  0cd8 cd0000        	call	_Set_LCD_Address
5739                     ; 742 					Display_LCD_String("Flt_LVHigh");
5741  0cdb ae00ae        	ldw	x,#L5423
5742  0cde cd0000        	call	_Display_LCD_String
5744  0ce1               L3323:
5745                     ; 746 			if(can_diag[1] & (U8)(0x04)){
5747  0ce1 7b04          	ld	a,(OFST-18,sp)
5748  0ce3 a504          	bcp	a,#4
5749  0ce5 273c          	jreq	L7423
5750                     ; 747 				uc_fault_cnt++;
5752  0ce7 0c16          	inc	(OFST+0,sp)
5754                     ; 748 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5754                     ; 749 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5754                     ; 750 				){
5756  0ce9 0d16          	tnz	(OFST+0,sp)
5757  0ceb 270d          	jreq	L5523
5759  0ced 7b16          	ld	a,(OFST+0,sp)
5760  0cef a105          	cp	a,#5
5761  0cf1 2407          	jruge	L5523
5763  0cf3 c60004        	ld	a,_uc_Test_Page_Now
5764  0cf6 a102          	cp	a,#2
5765  0cf8 2713          	jreq	L3523
5766  0cfa               L5523:
5768  0cfa 7b16          	ld	a,(OFST+0,sp)
5769  0cfc a105          	cp	a,#5
5770  0cfe 2523          	jrult	L7423
5772  0d00 7b16          	ld	a,(OFST+0,sp)
5773  0d02 a109          	cp	a,#9
5774  0d04 241d          	jruge	L7423
5776  0d06 c60004        	ld	a,_uc_Test_Page_Now
5777  0d09 a103          	cp	a,#3
5778  0d0b 2616          	jrne	L7423
5779  0d0d               L3523:
5780                     ; 751 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5782  0d0d 7b16          	ld	a,(OFST+0,sp)
5783  0d0f 5f            	clrw	x
5784  0d10 97            	ld	xl,a
5785  0d11 5a            	decw	x
5786  0d12 a604          	ld	a,#4
5787  0d14 cd0000        	call	c_smodx
5789  0d17 d60000        	ld	a,(_LCD_Line,x)
5790  0d1a cd0000        	call	_Set_LCD_Address
5792                     ; 752 					Display_LCD_String("Flt_HVLow");
5794  0d1d ae00a4        	ldw	x,#L1623
5795  0d20 cd0000        	call	_Display_LCD_String
5797  0d23               L7423:
5798                     ; 756 			if(can_diag[1] & (U8)(0x08)){
5800  0d23 7b04          	ld	a,(OFST-18,sp)
5801  0d25 a508          	bcp	a,#8
5802  0d27 273c          	jreq	L3623
5803                     ; 757 				uc_fault_cnt++;
5805  0d29 0c16          	inc	(OFST+0,sp)
5807                     ; 758 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5807                     ; 759 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5807                     ; 760 				){
5809  0d2b 0d16          	tnz	(OFST+0,sp)
5810  0d2d 270d          	jreq	L1723
5812  0d2f 7b16          	ld	a,(OFST+0,sp)
5813  0d31 a105          	cp	a,#5
5814  0d33 2407          	jruge	L1723
5816  0d35 c60004        	ld	a,_uc_Test_Page_Now
5817  0d38 a102          	cp	a,#2
5818  0d3a 2713          	jreq	L7623
5819  0d3c               L1723:
5821  0d3c 7b16          	ld	a,(OFST+0,sp)
5822  0d3e a105          	cp	a,#5
5823  0d40 2523          	jrult	L3623
5825  0d42 7b16          	ld	a,(OFST+0,sp)
5826  0d44 a109          	cp	a,#9
5827  0d46 241d          	jruge	L3623
5829  0d48 c60004        	ld	a,_uc_Test_Page_Now
5830  0d4b a103          	cp	a,#3
5831  0d4d 2616          	jrne	L3623
5832  0d4f               L7623:
5833                     ; 761 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
5835  0d4f 7b16          	ld	a,(OFST+0,sp)
5836  0d51 5f            	clrw	x
5837  0d52 97            	ld	xl,a
5838  0d53 5a            	decw	x
5839  0d54 a604          	ld	a,#4
5840  0d56 cd0000        	call	c_smodx
5842  0d59 d60000        	ld	a,(_LCD_Line,x)
5843  0d5c cd0000        	call	_Set_LCD_Address
5845                     ; 762 					Display_LCD_String("Flt_HVHigh");
5847  0d5f ae0099        	ldw	x,#L5723
5848  0d62 cd0000        	call	_Display_LCD_String
5850  0d65               L3623:
5851                     ; 766 			if(can_diag[1] & (U8)(0x10)){
5853  0d65 7b04          	ld	a,(OFST-18,sp)
5854  0d67 a510          	bcp	a,#16
5855  0d69 273c          	jreq	L7723
5856                     ; 767 				uc_fault_cnt++;
5858  0d6b 0c16          	inc	(OFST+0,sp)
5860                     ; 768 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5860                     ; 769 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5860                     ; 770 				){
5862  0d6d 0d16          	tnz	(OFST+0,sp)
5863  0d6f 270d          	jreq	L5033
5865  0d71 7b16          	ld	a,(OFST+0,sp)
5866  0d73 a105          	cp	a,#5
5867  0d75 2407          	jruge	L5033
5869  0d77 c60004        	ld	a,_uc_Test_Page_Now
5870  0d7a a102          	cp	a,#2
5871  0d7c 2713          	jreq	L3033
5872  0d7e               L5033:
5874  0d7e 7b16          	ld	a,(OFST+0,sp)
5875  0d80 a105          	cp	a,#5
5876  0d82 2523          	jrult	L7723
5878  0d84 7b16          	ld	a,(OFST+0,sp)
5879  0d86 a109          	cp	a,#9
5880  0d88 241d          	jruge	L7723
5882  0d8a c60004        	ld	a,_uc_Test_Page_Now
5883  0d8d a103          	cp	a,#3
5884  0d8f 2616          	jrne	L7723
5885  0d91               L3033:
5886                     ; 771 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5888  0d91 7b16          	ld	a,(OFST+0,sp)
5889  0d93 5f            	clrw	x
5890  0d94 97            	ld	xl,a
5891  0d95 5a            	decw	x
5892  0d96 a604          	ld	a,#4
5893  0d98 cd0000        	call	c_smodx
5895  0d9b d60000        	ld	a,(_LCD_Line,x)
5896  0d9e cd0000        	call	_Set_LCD_Address
5898                     ; 772 					Display_LCD_String("Flt_OverCur");
5900  0da1 ae008d        	ldw	x,#L1133
5901  0da4 cd0000        	call	_Display_LCD_String
5903  0da7               L7723:
5904                     ; 778 			if(can_diag[1] & (U8)(0x20)){
5906  0da7 7b04          	ld	a,(OFST-18,sp)
5907  0da9 a520          	bcp	a,#32
5908  0dab 273c          	jreq	L3133
5909                     ; 780 				uc_fault_cnt++;
5911  0dad 0c16          	inc	(OFST+0,sp)
5913                     ; 781 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5913                     ; 782 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5913                     ; 783 				){
5915  0daf 0d16          	tnz	(OFST+0,sp)
5916  0db1 270d          	jreq	L1233
5918  0db3 7b16          	ld	a,(OFST+0,sp)
5919  0db5 a105          	cp	a,#5
5920  0db7 2407          	jruge	L1233
5922  0db9 c60004        	ld	a,_uc_Test_Page_Now
5923  0dbc a102          	cp	a,#2
5924  0dbe 2713          	jreq	L7133
5925  0dc0               L1233:
5927  0dc0 7b16          	ld	a,(OFST+0,sp)
5928  0dc2 a105          	cp	a,#5
5929  0dc4 2523          	jrult	L3133
5931  0dc6 7b16          	ld	a,(OFST+0,sp)
5932  0dc8 a109          	cp	a,#9
5933  0dca 241d          	jruge	L3133
5935  0dcc c60004        	ld	a,_uc_Test_Page_Now
5936  0dcf a103          	cp	a,#3
5937  0dd1 2616          	jrne	L3133
5938  0dd3               L7133:
5939                     ; 784 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5941  0dd3 7b16          	ld	a,(OFST+0,sp)
5942  0dd5 5f            	clrw	x
5943  0dd6 97            	ld	xl,a
5944  0dd7 5a            	decw	x
5945  0dd8 a604          	ld	a,#4
5946  0dda cd0000        	call	c_smodx
5948  0ddd d60000        	ld	a,(_LCD_Line,x)
5949  0de0 cd0000        	call	_Set_LCD_Address
5951                     ; 785 					Display_LCD_String("Flt_ThmShut");
5953  0de3 ae0081        	ldw	x,#L5233
5954  0de6 cd0000        	call	_Display_LCD_String
5956  0de9               L3133:
5957                     ; 791 			if(can_diag[1] & (U8)(0x40)){
5959  0de9 7b04          	ld	a,(OFST-18,sp)
5960  0deb a540          	bcp	a,#64
5961  0ded 273c          	jreq	L7233
5962                     ; 793 				uc_fault_cnt++;
5964  0def 0c16          	inc	(OFST+0,sp)
5966                     ; 794 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5966                     ; 795 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5966                     ; 796 				){
5968  0df1 0d16          	tnz	(OFST+0,sp)
5969  0df3 270d          	jreq	L5333
5971  0df5 7b16          	ld	a,(OFST+0,sp)
5972  0df7 a105          	cp	a,#5
5973  0df9 2407          	jruge	L5333
5975  0dfb c60004        	ld	a,_uc_Test_Page_Now
5976  0dfe a102          	cp	a,#2
5977  0e00 2713          	jreq	L3333
5978  0e02               L5333:
5980  0e02 7b16          	ld	a,(OFST+0,sp)
5981  0e04 a105          	cp	a,#5
5982  0e06 2523          	jrult	L7233
5984  0e08 7b16          	ld	a,(OFST+0,sp)
5985  0e0a a109          	cp	a,#9
5986  0e0c 241d          	jruge	L7233
5988  0e0e c60004        	ld	a,_uc_Test_Page_Now
5989  0e11 a103          	cp	a,#3
5990  0e13 2616          	jrne	L7233
5991  0e15               L3333:
5992                     ; 797 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
5994  0e15 7b16          	ld	a,(OFST+0,sp)
5995  0e17 5f            	clrw	x
5996  0e18 97            	ld	xl,a
5997  0e19 5a            	decw	x
5998  0e1a a604          	ld	a,#4
5999  0e1c cd0000        	call	c_smodx
6001  0e1f d60000        	ld	a,(_LCD_Line,x)
6002  0e22 cd0000        	call	_Set_LCD_Address
6004                     ; 798 					Display_LCD_String("Flt_PCBThmShut");
6006  0e25 ae0072        	ldw	x,#L1433
6007  0e28 cd0000        	call	_Display_LCD_String
6009  0e2b               L7233:
6010                     ; 802 			if(can_diag[3] & (U8)(0x01)){
6012  0e2b 7b06          	ld	a,(OFST-16,sp)
6013  0e2d a501          	bcp	a,#1
6014  0e2f 273c          	jreq	L3433
6015                     ; 803 				uc_fault_cnt++;
6017  0e31 0c16          	inc	(OFST+0,sp)
6019                     ; 804 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6019                     ; 805 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6019                     ; 806 				){
6021  0e33 0d16          	tnz	(OFST+0,sp)
6022  0e35 270d          	jreq	L1533
6024  0e37 7b16          	ld	a,(OFST+0,sp)
6025  0e39 a105          	cp	a,#5
6026  0e3b 2407          	jruge	L1533
6028  0e3d c60004        	ld	a,_uc_Test_Page_Now
6029  0e40 a102          	cp	a,#2
6030  0e42 2713          	jreq	L7433
6031  0e44               L1533:
6033  0e44 7b16          	ld	a,(OFST+0,sp)
6034  0e46 a105          	cp	a,#5
6035  0e48 2523          	jrult	L3433
6037  0e4a 7b16          	ld	a,(OFST+0,sp)
6038  0e4c a109          	cp	a,#9
6039  0e4e 241d          	jruge	L3433
6041  0e50 c60004        	ld	a,_uc_Test_Page_Now
6042  0e53 a103          	cp	a,#3
6043  0e55 2616          	jrne	L3433
6044  0e57               L7433:
6045                     ; 807 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6047  0e57 7b16          	ld	a,(OFST+0,sp)
6048  0e59 5f            	clrw	x
6049  0e5a 97            	ld	xl,a
6050  0e5b 5a            	decw	x
6051  0e5c a604          	ld	a,#4
6052  0e5e cd0000        	call	c_smodx
6054  0e61 d60000        	ld	a,(_LCD_Line,x)
6055  0e64 cd0000        	call	_Set_LCD_Address
6057                     ; 808 					Display_LCD_String("Flt_MsgTimeOut");
6059  0e67 ae0063        	ldw	x,#L5533
6060  0e6a cd0000        	call	_Display_LCD_String
6062  0e6d               L3433:
6063                     ; 812 			if(can_diag[4] & (U8)(0x01)){
6065  0e6d 7b07          	ld	a,(OFST-15,sp)
6066  0e6f a501          	bcp	a,#1
6067  0e71 273c          	jreq	L7533
6068                     ; 813 				uc_fault_cnt++;
6070  0e73 0c16          	inc	(OFST+0,sp)
6072                     ; 814 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6072                     ; 815 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6072                     ; 816 				){
6074  0e75 0d16          	tnz	(OFST+0,sp)
6075  0e77 270d          	jreq	L5633
6077  0e79 7b16          	ld	a,(OFST+0,sp)
6078  0e7b a105          	cp	a,#5
6079  0e7d 2407          	jruge	L5633
6081  0e7f c60004        	ld	a,_uc_Test_Page_Now
6082  0e82 a102          	cp	a,#2
6083  0e84 2713          	jreq	L3633
6084  0e86               L5633:
6086  0e86 7b16          	ld	a,(OFST+0,sp)
6087  0e88 a105          	cp	a,#5
6088  0e8a 2523          	jrult	L7533
6090  0e8c 7b16          	ld	a,(OFST+0,sp)
6091  0e8e a109          	cp	a,#9
6092  0e90 241d          	jruge	L7533
6094  0e92 c60004        	ld	a,_uc_Test_Page_Now
6095  0e95 a103          	cp	a,#3
6096  0e97 2616          	jrne	L7533
6097  0e99               L3633:
6098                     ; 817 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6100  0e99 7b16          	ld	a,(OFST+0,sp)
6101  0e9b 5f            	clrw	x
6102  0e9c 97            	ld	xl,a
6103  0e9d 5a            	decw	x
6104  0e9e a604          	ld	a,#4
6105  0ea0 cd0000        	call	c_smodx
6107  0ea3 d60000        	ld	a,(_LCD_Line,x)
6108  0ea6 cd0000        	call	_Set_LCD_Address
6110                     ; 818 					Display_LCD_String("Fail_HVSen");
6112  0ea9 ae0058        	ldw	x,#L1733
6113  0eac cd0000        	call	_Display_LCD_String
6115  0eaf               L7533:
6116                     ; 822 			if(can_diag[4] & (U8)(0x02)){
6118  0eaf 7b07          	ld	a,(OFST-15,sp)
6119  0eb1 a502          	bcp	a,#2
6120  0eb3 273c          	jreq	L3733
6121                     ; 823 				uc_fault_cnt++;
6123  0eb5 0c16          	inc	(OFST+0,sp)
6125                     ; 824 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6125                     ; 825 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6125                     ; 826 				){
6127  0eb7 0d16          	tnz	(OFST+0,sp)
6128  0eb9 270d          	jreq	L1043
6130  0ebb 7b16          	ld	a,(OFST+0,sp)
6131  0ebd a105          	cp	a,#5
6132  0ebf 2407          	jruge	L1043
6134  0ec1 c60004        	ld	a,_uc_Test_Page_Now
6135  0ec4 a102          	cp	a,#2
6136  0ec6 2713          	jreq	L7733
6137  0ec8               L1043:
6139  0ec8 7b16          	ld	a,(OFST+0,sp)
6140  0eca a105          	cp	a,#5
6141  0ecc 2523          	jrult	L3733
6143  0ece 7b16          	ld	a,(OFST+0,sp)
6144  0ed0 a109          	cp	a,#9
6145  0ed2 241d          	jruge	L3733
6147  0ed4 c60004        	ld	a,_uc_Test_Page_Now
6148  0ed7 a103          	cp	a,#3
6149  0ed9 2616          	jrne	L3733
6150  0edb               L7733:
6151                     ; 827 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6153  0edb 7b16          	ld	a,(OFST+0,sp)
6154  0edd 5f            	clrw	x
6155  0ede 97            	ld	xl,a
6156  0edf 5a            	decw	x
6157  0ee0 a604          	ld	a,#4
6158  0ee2 cd0000        	call	c_smodx
6160  0ee5 d60000        	ld	a,(_LCD_Line,x)
6161  0ee8 cd0000        	call	_Set_LCD_Address
6163                     ; 828 					Display_LCD_String("Fail_LVSen");
6165  0eeb ae004d        	ldw	x,#L5043
6166  0eee cd0000        	call	_Display_LCD_String
6168  0ef1               L3733:
6169                     ; 832 			if(can_diag[4] & (U8)(0x04)){
6171  0ef1 7b07          	ld	a,(OFST-15,sp)
6172  0ef3 a504          	bcp	a,#4
6173  0ef5 273c          	jreq	L7043
6174                     ; 833 				uc_fault_cnt++;
6176  0ef7 0c16          	inc	(OFST+0,sp)
6178                     ; 834 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6178                     ; 835 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6178                     ; 836 				){
6180  0ef9 0d16          	tnz	(OFST+0,sp)
6181  0efb 270d          	jreq	L5143
6183  0efd 7b16          	ld	a,(OFST+0,sp)
6184  0eff a105          	cp	a,#5
6185  0f01 2407          	jruge	L5143
6187  0f03 c60004        	ld	a,_uc_Test_Page_Now
6188  0f06 a102          	cp	a,#2
6189  0f08 2713          	jreq	L3143
6190  0f0a               L5143:
6192  0f0a 7b16          	ld	a,(OFST+0,sp)
6193  0f0c a105          	cp	a,#5
6194  0f0e 2523          	jrult	L7043
6196  0f10 7b16          	ld	a,(OFST+0,sp)
6197  0f12 a109          	cp	a,#9
6198  0f14 241d          	jruge	L7043
6200  0f16 c60004        	ld	a,_uc_Test_Page_Now
6201  0f19 a103          	cp	a,#3
6202  0f1b 2616          	jrne	L7043
6203  0f1d               L3143:
6204                     ; 837 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6206  0f1d 7b16          	ld	a,(OFST+0,sp)
6207  0f1f 5f            	clrw	x
6208  0f20 97            	ld	xl,a
6209  0f21 5a            	decw	x
6210  0f22 a604          	ld	a,#4
6211  0f24 cd0000        	call	c_smodx
6213  0f27 d60000        	ld	a,(_LCD_Line,x)
6214  0f2a cd0000        	call	_Set_LCD_Address
6216                     ; 838 					Display_LCD_String("Fail_CurSen");
6218  0f2d ae0041        	ldw	x,#L1243
6219  0f30 cd0000        	call	_Display_LCD_String
6221  0f33               L7043:
6222                     ; 844 			if(can_diag[4] & (U8)(0x08)){
6224  0f33 7b07          	ld	a,(OFST-15,sp)
6225  0f35 a508          	bcp	a,#8
6226  0f37 273c          	jreq	L3243
6227                     ; 846 				uc_fault_cnt++;
6229  0f39 0c16          	inc	(OFST+0,sp)
6231                     ; 847 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6231                     ; 848 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6231                     ; 849 				){
6233  0f3b 0d16          	tnz	(OFST+0,sp)
6234  0f3d 270d          	jreq	L1343
6236  0f3f 7b16          	ld	a,(OFST+0,sp)
6237  0f41 a105          	cp	a,#5
6238  0f43 2407          	jruge	L1343
6240  0f45 c60004        	ld	a,_uc_Test_Page_Now
6241  0f48 a102          	cp	a,#2
6242  0f4a 2713          	jreq	L7243
6243  0f4c               L1343:
6245  0f4c 7b16          	ld	a,(OFST+0,sp)
6246  0f4e a105          	cp	a,#5
6247  0f50 2523          	jrult	L3243
6249  0f52 7b16          	ld	a,(OFST+0,sp)
6250  0f54 a109          	cp	a,#9
6251  0f56 241d          	jruge	L3243
6253  0f58 c60004        	ld	a,_uc_Test_Page_Now
6254  0f5b a103          	cp	a,#3
6255  0f5d 2616          	jrne	L3243
6256  0f5f               L7243:
6257                     ; 850 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
6259  0f5f 7b16          	ld	a,(OFST+0,sp)
6260  0f61 5f            	clrw	x
6261  0f62 97            	ld	xl,a
6262  0f63 5a            	decw	x
6263  0f64 a604          	ld	a,#4
6264  0f66 cd0000        	call	c_smodx
6266  0f69 d60000        	ld	a,(_LCD_Line,x)
6267  0f6c cd0000        	call	_Set_LCD_Address
6269                     ; 851 					Display_LCD_String("Fail_CoreTemp");
6271  0f6f ae0033        	ldw	x,#L5343
6272  0f72 cd0000        	call	_Display_LCD_String
6274  0f75               L3243:
6275                     ; 857 			if(can_diag[4] & (U8)(0x10)){
6277  0f75 7b07          	ld	a,(OFST-15,sp)
6278  0f77 a510          	bcp	a,#16
6279  0f79 273c          	jreq	L7343
6280                     ; 859 				uc_fault_cnt++;
6282  0f7b 0c16          	inc	(OFST+0,sp)
6284                     ; 860 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6284                     ; 861 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6284                     ; 862 				){
6286  0f7d 0d16          	tnz	(OFST+0,sp)
6287  0f7f 270d          	jreq	L5443
6289  0f81 7b16          	ld	a,(OFST+0,sp)
6290  0f83 a105          	cp	a,#5
6291  0f85 2407          	jruge	L5443
6293  0f87 c60004        	ld	a,_uc_Test_Page_Now
6294  0f8a a102          	cp	a,#2
6295  0f8c 2713          	jreq	L3443
6296  0f8e               L5443:
6298  0f8e 7b16          	ld	a,(OFST+0,sp)
6299  0f90 a105          	cp	a,#5
6300  0f92 2523          	jrult	L7343
6302  0f94 7b16          	ld	a,(OFST+0,sp)
6303  0f96 a109          	cp	a,#9
6304  0f98 241d          	jruge	L7343
6306  0f9a c60004        	ld	a,_uc_Test_Page_Now
6307  0f9d a103          	cp	a,#3
6308  0f9f 2616          	jrne	L7343
6309  0fa1               L3443:
6310                     ; 863 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6312  0fa1 7b16          	ld	a,(OFST+0,sp)
6313  0fa3 5f            	clrw	x
6314  0fa4 97            	ld	xl,a
6315  0fa5 5a            	decw	x
6316  0fa6 a604          	ld	a,#4
6317  0fa8 cd0000        	call	c_smodx
6319  0fab d60000        	ld	a,(_LCD_Line,x)
6320  0fae cd0000        	call	_Set_LCD_Address
6322                     ; 864 					Display_LCD_String("Fail_PCB1Temp");
6324  0fb1 ae0025        	ldw	x,#L1543
6325  0fb4 cd0000        	call	_Display_LCD_String
6327  0fb7               L7343:
6328                     ; 870 			if(can_diag[4] & (U8)(0x20)){
6330  0fb7 7b07          	ld	a,(OFST-15,sp)
6331  0fb9 a520          	bcp	a,#32
6332  0fbb 273c          	jreq	L3543
6333                     ; 872 				uc_fault_cnt++;
6335  0fbd 0c16          	inc	(OFST+0,sp)
6337                     ; 873 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6337                     ; 874 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6337                     ; 875 				){
6339  0fbf 0d16          	tnz	(OFST+0,sp)
6340  0fc1 270d          	jreq	L1643
6342  0fc3 7b16          	ld	a,(OFST+0,sp)
6343  0fc5 a105          	cp	a,#5
6344  0fc7 2407          	jruge	L1643
6346  0fc9 c60004        	ld	a,_uc_Test_Page_Now
6347  0fcc a102          	cp	a,#2
6348  0fce 2713          	jreq	L7543
6349  0fd0               L1643:
6351  0fd0 7b16          	ld	a,(OFST+0,sp)
6352  0fd2 a105          	cp	a,#5
6353  0fd4 2523          	jrult	L3543
6355  0fd6 7b16          	ld	a,(OFST+0,sp)
6356  0fd8 a109          	cp	a,#9
6357  0fda 241d          	jruge	L3543
6359  0fdc c60004        	ld	a,_uc_Test_Page_Now
6360  0fdf a103          	cp	a,#3
6361  0fe1 2616          	jrne	L3543
6362  0fe3               L7543:
6363                     ; 876 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6365  0fe3 7b16          	ld	a,(OFST+0,sp)
6366  0fe5 5f            	clrw	x
6367  0fe6 97            	ld	xl,a
6368  0fe7 5a            	decw	x
6369  0fe8 a604          	ld	a,#4
6370  0fea cd0000        	call	c_smodx
6372  0fed d60000        	ld	a,(_LCD_Line,x)
6373  0ff0 cd0000        	call	_Set_LCD_Address
6375                     ; 877 					Display_LCD_String("Fail_IGBT");
6377  0ff3 ae001b        	ldw	x,#L5643
6378  0ff6 cd0000        	call	_Display_LCD_String
6380  0ff9               L3543:
6381                     ; 881 			if(can_diag[4] & (U8)(0x40)){
6383  0ff9 7b07          	ld	a,(OFST-15,sp)
6384  0ffb a540          	bcp	a,#64
6385  0ffd 273c          	jreq	L7643
6386                     ; 882 				uc_fault_cnt++;
6388  0fff 0c16          	inc	(OFST+0,sp)
6390                     ; 883 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
6390                     ; 884 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
6390                     ; 885 				){
6392  1001 0d16          	tnz	(OFST+0,sp)
6393  1003 270d          	jreq	L5743
6395  1005 7b16          	ld	a,(OFST+0,sp)
6396  1007 a105          	cp	a,#5
6397  1009 2407          	jruge	L5743
6399  100b c60004        	ld	a,_uc_Test_Page_Now
6400  100e a102          	cp	a,#2
6401  1010 2713          	jreq	L3743
6402  1012               L5743:
6404  1012 7b16          	ld	a,(OFST+0,sp)
6405  1014 a105          	cp	a,#5
6406  1016 2523          	jrult	L7643
6408  1018 7b16          	ld	a,(OFST+0,sp)
6409  101a a109          	cp	a,#9
6410  101c 241d          	jruge	L7643
6412  101e c60004        	ld	a,_uc_Test_Page_Now
6413  1021 a103          	cp	a,#3
6414  1023 2616          	jrne	L7643
6415  1025               L3743:
6416                     ; 886 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
6418  1025 7b16          	ld	a,(OFST+0,sp)
6419  1027 5f            	clrw	x
6420  1028 97            	ld	xl,a
6421  1029 5a            	decw	x
6422  102a a604          	ld	a,#4
6423  102c cd0000        	call	c_smodx
6425  102f d60000        	ld	a,(_LCD_Line,x)
6426  1032 cd0000        	call	_Set_LCD_Address
6428                     ; 887 					Display_LCD_String("Fail_openLoad");
6430  1035 ae000d        	ldw	x,#L1053
6431  1038 cd0000        	call	_Display_LCD_String
6433  103b               L7643:
6434                     ; 891 			if(!uc_fault_cnt){
6436  103b 0d16          	tnz	(OFST+0,sp)
6437  103d 260c          	jrne	L1513
6438                     ; 892 				Set_LCD_Address(LCD_Line[0]);
6440  103f c60000        	ld	a,_LCD_Line
6441  1042 cd0000        	call	_Set_LCD_Address
6443                     ; 893 				Display_LCD_String("Normal");
6445  1045 ae0006        	ldw	x,#L5053
6446  1048 cd0000        	call	_Display_LCD_String
6448  104b               L1513:
6449                     ; 898 	if((b_Com_On_flag == ON)){
6451  104b c6000d        	ld	a,_uc_Test_Ctrl_Reg
6452  104e a508          	bcp	a,#8
6453  1050 270d          	jreq	L7053
6454                     ; 899 		Set_LCD_Address((unsigned char)(0x00+15));
6456  1052 a60f          	ld	a,#15
6457  1054 cd0000        	call	_Set_LCD_Address
6459                     ; 902 		Display_LCD_String("Y");	// YJS 20230314
6461  1057 ae0004        	ldw	x,#L1153
6462  105a cd0000        	call	_Display_LCD_String
6465  105d 200b          	jra	L3153
6466  105f               L7053:
6467                     ; 904 		Set_LCD_Address((unsigned char)(0x00+15));
6469  105f a60f          	ld	a,#15
6470  1061 cd0000        	call	_Set_LCD_Address
6472                     ; 905 		Display_LCD_String("N");
6474  1064 ae00c7        	ldw	x,#L7013
6475  1067 cd0000        	call	_Display_LCD_String
6477  106a               L3153:
6478                     ; 908 	return;
6479  106a               L65:
6482  106a 5b16          	addw	sp,#22
6483  106c 81            	ret
6575                     ; 910 static void SU2I_Ctrl_LCD_Display_Control(void)
6575                     ; 911 {
6576                     	switch	.text
6577  106d               L5153_SU2I_Ctrl_LCD_Display_Control:
6579  106d 5216          	subw	sp,#22
6580       00000016      OFST:	set	22
6583                     ; 918 if (HEATER_zone_status==HTR_ZONE_1)
6585  106f 725d0000      	tnz	_HEATER_zone_status
6586  1073 263a          	jrne	L1553
6587                     ; 920 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6589  1075 0f16          	clr	(OFST+0,sp)
6591  1077               L3553:
6592                     ; 922 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS2][uc_buffer];
6594  1077 96            	ldw	x,sp
6595  1078 1c000d        	addw	x,#OFST-9
6596  107b 9f            	ld	a,xl
6597  107c 5e            	swapw	x
6598  107d 1b16          	add	a,(OFST+0,sp)
6599  107f 2401          	jrnc	L221
6600  1081 5c            	incw	x
6601  1082               L221:
6602  1082 02            	rlwa	x,a
6603  1083 7b16          	ld	a,(OFST+0,sp)
6604  1085 905f          	clrw	y
6605  1087 9097          	ld	yl,a
6606  1089 90d60008      	ld	a,(_uc_Rx_Data+8,y)
6607  108d f7            	ld	(x),a
6608                     ; 923 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
6610  108e 96            	ldw	x,sp
6611  108f 1c0003        	addw	x,#OFST-19
6612  1092 9f            	ld	a,xl
6613  1093 5e            	swapw	x
6614  1094 1b16          	add	a,(OFST+0,sp)
6615  1096 2401          	jrnc	L421
6616  1098 5c            	incw	x
6617  1099               L421:
6618  1099 02            	rlwa	x,a
6619  109a 7b16          	ld	a,(OFST+0,sp)
6620  109c 905f          	clrw	y
6621  109e 9097          	ld	yl,a
6622  10a0 90d60018      	ld	a,(_uc_Rx_Data+24,y)
6623  10a4 f7            	ld	(x),a
6624                     ; 920 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6626  10a5 0c16          	inc	(OFST+0,sp)
6630  10a7 7b16          	ld	a,(OFST+0,sp)
6631  10a9 a108          	cp	a,#8
6632  10ab 25ca          	jrult	L3553
6634  10ad 2038          	jra	L1653
6635  10af               L1553:
6636                     ; 928 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6638  10af 0f16          	clr	(OFST+0,sp)
6640  10b1               L3653:
6641                     ; 930 		can_data[uc_buffer]=uc_Rx_Data[HTR_STATUS3][uc_buffer];
6643  10b1 96            	ldw	x,sp
6644  10b2 1c000d        	addw	x,#OFST-9
6645  10b5 9f            	ld	a,xl
6646  10b6 5e            	swapw	x
6647  10b7 1b16          	add	a,(OFST+0,sp)
6648  10b9 2401          	jrnc	L621
6649  10bb 5c            	incw	x
6650  10bc               L621:
6651  10bc 02            	rlwa	x,a
6652  10bd 7b16          	ld	a,(OFST+0,sp)
6653  10bf 905f          	clrw	y
6654  10c1 9097          	ld	yl,a
6655  10c3 90d60010      	ld	a,(_uc_Rx_Data+16,y)
6656  10c7 f7            	ld	(x),a
6657                     ; 931 		can_diag[uc_buffer]=uc_Rx_Data[HTR_STATUS4][uc_buffer];
6659  10c8 96            	ldw	x,sp
6660  10c9 1c0003        	addw	x,#OFST-19
6661  10cc 9f            	ld	a,xl
6662  10cd 5e            	swapw	x
6663  10ce 1b16          	add	a,(OFST+0,sp)
6664  10d0 2401          	jrnc	L031
6665  10d2 5c            	incw	x
6666  10d3               L031:
6667  10d3 02            	rlwa	x,a
6668  10d4 7b16          	ld	a,(OFST+0,sp)
6669  10d6 905f          	clrw	y
6670  10d8 9097          	ld	yl,a
6671  10da 90d60018      	ld	a,(_uc_Rx_Data+24,y)
6672  10de f7            	ld	(x),a
6673                     ; 928 	for (uc_buffer=0;uc_buffer<8;uc_buffer++)
6675  10df 0c16          	inc	(OFST+0,sp)
6679  10e1 7b16          	ld	a,(OFST+0,sp)
6680  10e3 a108          	cp	a,#8
6681  10e5 25ca          	jrult	L3653
6682  10e7               L1653:
6683                     ; 934 	if(b_Test_Option_flag == ON){
6685  10e7 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6686  10ea a510          	bcp	a,#16
6687  10ec 2779          	jreq	L1753
6688                     ; 935 		Set_LCD_Address(LCD_Line[0]);
6690  10ee c60000        	ld	a,_LCD_Line
6691  10f1 cd0000        	call	_Set_LCD_Address
6693                     ; 936 		Display_LCD_String("*OPTION*");
6695  10f4 ae012d        	ldw	x,#L1252
6696  10f7 cd0000        	call	_Display_LCD_String
6698                     ; 938 		if(uc_Target_Display_Mode == (U8)(0)){
6700  10fa 725d0000      	tnz	_uc_Target_Display_Mode
6701  10fe 260e          	jrne	L3753
6702                     ; 939 			Set_LCD_Address(LCD_Line[1]);
6704  1100 c60001        	ld	a,_LCD_Line+1
6705  1103 cd0000        	call	_Set_LCD_Address
6707                     ; 940 			Display_LCD_String("*Target Perc");
6709  1106 ae0120        	ldw	x,#L5252
6710  1109 cd0000        	call	_Display_LCD_String
6713  110c 200c          	jra	L5753
6714  110e               L3753:
6715                     ; 943 			Set_LCD_Address(LCD_Line[1]);
6717  110e c60001        	ld	a,_LCD_Line+1
6718  1111 cd0000        	call	_Set_LCD_Address
6720                     ; 944 			Display_LCD_String("*Target Watt(OS)");
6722  1114 ae010f        	ldw	x,#L1352
6723  1117 cd0000        	call	_Display_LCD_String
6725  111a               L5753:
6726                     ; 947 		Set_LCD_Address(LCD_Line[2]);
6728  111a c60002        	ld	a,_LCD_Line+2
6729  111d cd0000        	call	_Set_LCD_Address
6731                     ; 948 		Display_LCD_String("D_Unit:");
6733  1120 ae0107        	ldw	x,#L3352
6734  1123 cd0000        	call	_Display_LCD_String
6736                     ; 950 		Set_LCD_Address((unsigned char)(LCD_Line[2]+7));
6738  1126 c60002        	ld	a,_LCD_Line+2
6739  1129 ab07          	add	a,#7
6740  112b cd0000        	call	_Set_LCD_Address
6742                     ; 951 		if(b_Blink_250_Flag){
6744  112e c60000        	ld	a,_uc_LCD_Blink_Reg
6745  1131 a502          	bcp	a,#2
6746  1133 272e          	jreq	L7753
6747                     ; 952 			Num_Display_LCD(uc_Perc_Unit /(U8)(2));
6749  1135 c60001        	ld	a,_uc_Perc_Unit
6750  1138 5f            	clrw	x
6751  1139 97            	ld	xl,a
6752  113a 57            	sraw	x
6753  113b cd0000        	call	_Num_Display_LCD
6755                     ; 953 			Display_LCD_String(".");
6757  113e ae0105        	ldw	x,#L7352
6758  1141 cd0000        	call	_Display_LCD_String
6760                     ; 954 			uc_buffer = uc_Perc_Unit %(U8)(2);
6762  1144 c60001        	ld	a,_uc_Perc_Unit
6763  1147 a401          	and	a,#1
6764  1149 6b16          	ld	(OFST+0,sp),a
6766                     ; 955 			if(uc_buffer){ Display_LCD_String("5"); }
6768  114b 0d16          	tnz	(OFST+0,sp)
6769  114d 2708          	jreq	L1063
6772  114f ae0103        	ldw	x,#L3452
6773  1152 cd0000        	call	_Display_LCD_String
6776  1155 2006          	jra	L3063
6777  1157               L1063:
6778                     ; 956 			else{ Display_LCD_String("0"); }
6780  1157 ae0101        	ldw	x,#L7452
6781  115a cd0000        	call	_Display_LCD_String
6783  115d               L3063:
6784                     ; 957 			Display_LCD_String("%");
6786  115d ae00ff        	ldw	x,#L1552
6787  1160 cd0000        	call	_Display_LCD_String
6789  1163               L7753:
6790                     ; 959 		return;
6792  1163 ac891b89      	jpf	L431
6793  1167               L1753:
6794                     ; 962 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ 
6796  1167 c60004        	ld	a,_uc_Test_Page_Now
6797  116a c10003        	cp	a,_uc_Test_Page_Pre
6798  116d 270f          	jreq	L5063
6799                     ; 963 		Test_Ctrl_Text_Display_Handling(); 
6801  116f cd0465        	call	_Test_Ctrl_Text_Display_Handling
6803                     ; 964 		b_Data_Select_flag = OFF;
6805  1172 7213000d      	bres	_uc_Test_Ctrl_Reg,#1
6806                     ; 965 		b_Data_Setting_flag = OFF;
6808  1176 7215000d      	bres	_uc_Test_Ctrl_Reg,#2
6809                     ; 966 		uc_Test_Data_Select_Num = (U8)(0);
6811  117a 725f0002      	clr	_uc_Test_Data_Select_Num
6812  117e               L5063:
6813                     ; 968 	uc_Test_Page_Pre = uc_Test_Page_Now ;
6815  117e 5500040003    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
6816                     ; 971 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
6818  1183 725d0004      	tnz	_uc_Test_Page_Now
6819  1187 2703          	jreq	L631
6820  1189 cc16fe        	jp	L7063
6821  118c               L631:
6822                     ; 972 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
6824  118c 0f15          	clr	(OFST-1,sp)
6826  118e               L1163:
6827                     ; 974 			Set_LCD_Address(LCD_Line[uc_line_index]);
6829  118e 7b15          	ld	a,(OFST-1,sp)
6830  1190 5f            	clrw	x
6831  1191 97            	ld	xl,a
6832  1192 d60000        	ld	a,(_LCD_Line,x)
6833  1195 cd0000        	call	_Set_LCD_Address
6835                     ; 976 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF)){
6837  1198 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6838  119b a502          	bcp	a,#2
6839  119d 2763          	jreq	L7163
6841  119f c6000d        	ld	a,_uc_Test_Ctrl_Reg
6842  11a2 a504          	bcp	a,#4
6843  11a4 265c          	jrne	L7163
6844                     ; 977 				if(uc_line_index == uc_Test_Data_Select_Num){ 
6846  11a6 7b15          	ld	a,(OFST-1,sp)
6847  11a8 c10002        	cp	a,_uc_Test_Data_Select_Num
6848  11ab 2647          	jrne	L1263
6849                     ; 978 					if(uc_Test_Data_Select_Num == (U8)(0)){
6851  11ad 725d0002      	tnz	_uc_Test_Data_Select_Num
6852  11b1 261d          	jrne	L3263
6853                     ; 979 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
6855  11b3 c60000        	ld	a,_uc_LCD_Blink_Reg
6856  11b6 a502          	bcp	a,#2
6857  11b8 270e          	jreq	L5263
6860  11ba 7b15          	ld	a,(OFST-1,sp)
6861  11bc 97            	ld	xl,a
6862  11bd a610          	ld	a,#16
6863  11bf 42            	mul	x,a
6864  11c0 1c0000        	addw	x,#_LCD_Dis_Data
6865  11c3 cd0000        	call	_Display_LCD_String
6868  11c6 2046          	jra	L3463
6869  11c8               L5263:
6870                     ; 980 						else{ Display_LCD_String("        /"); }
6872  11c8 ae00f5        	ldw	x,#L7752
6873  11cb cd0000        	call	_Display_LCD_String
6875  11ce 203e          	jra	L3463
6876  11d0               L3263:
6877                     ; 982 					else if(uc_Test_Data_Select_Num == (U8)(1)){
6879  11d0 c60002        	ld	a,_uc_Test_Data_Select_Num
6880  11d3 a101          	cp	a,#1
6881  11d5 2637          	jrne	L3463
6882                     ; 983 						if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
6884  11d7 c60000        	ld	a,_uc_LCD_Blink_Reg
6885  11da a502          	bcp	a,#2
6886  11dc 270e          	jreq	L5363
6889  11de 7b15          	ld	a,(OFST-1,sp)
6890  11e0 97            	ld	xl,a
6891  11e1 a610          	ld	a,#16
6892  11e3 42            	mul	x,a
6893  11e4 1c0000        	addw	x,#_LCD_Dis_Data
6894  11e7 cd0000        	call	_Display_LCD_String
6897  11ea 2022          	jra	L3463
6898  11ec               L5363:
6899                     ; 984 						else{ Display_LCD_String("        Fd:"); }
6901  11ec ae00e9        	ldw	x,#L1162
6902  11ef cd0000        	call	_Display_LCD_String
6904  11f2 201a          	jra	L3463
6905  11f4               L1263:
6906                     ; 987 				else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
6908  11f4 7b15          	ld	a,(OFST-1,sp)
6909  11f6 97            	ld	xl,a
6910  11f7 a610          	ld	a,#16
6911  11f9 42            	mul	x,a
6912  11fa 1c0000        	addw	x,#_LCD_Dis_Data
6913  11fd cd0000        	call	_Display_LCD_String
6915  1200 200c          	jra	L3463
6916  1202               L7163:
6917                     ; 988 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]); }
6919  1202 7b15          	ld	a,(OFST-1,sp)
6920  1204 97            	ld	xl,a
6921  1205 a610          	ld	a,#16
6922  1207 42            	mul	x,a
6923  1208 1c0000        	addw	x,#_LCD_Dis_Data
6924  120b cd0000        	call	_Display_LCD_String
6926  120e               L3463:
6927                     ; 991 			if(uc_line_index == (U8)(0)){		// LINE 1
6929  120e 0d15          	tnz	(OFST-1,sp)
6930  1210 2703          	jreq	L041
6931  1212 cc12ce        	jp	L5463
6932  1215               L041:
6933                     ; 994 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
6935  1215 7b15          	ld	a,(OFST-1,sp)
6936  1217 5f            	clrw	x
6937  1218 97            	ld	xl,a
6938  1219 d60000        	ld	a,(_LCD_Line,x)
6939  121c ab03          	add	a,#3
6940  121e cd0000        	call	_Set_LCD_Address
6942                     ; 996 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
6944  1221 c6000d        	ld	a,_uc_Test_Ctrl_Reg
6945  1224 a504          	bcp	a,#4
6946  1226 2718          	jreq	L7463
6948  1228 7b15          	ld	a,(OFST-1,sp)
6949  122a c10002        	cp	a,_uc_Test_Data_Select_Num
6950  122d 2611          	jrne	L7463
6951                     ; 997 					if(b_Blink_250_Flag){ Num_Display_LCD(uc_Heater_Enable_Flag); 	}	
6953  122f c60000        	ld	a,_uc_LCD_Blink_Reg
6954  1232 a502          	bcp	a,#2
6955  1234 2712          	jreq	L3563
6958  1236 c60009        	ld	a,_uc_Heater_Enable_Flag
6959  1239 5f            	clrw	x
6960  123a 97            	ld	xl,a
6961  123b cd0000        	call	_Num_Display_LCD
6963  123e 2008          	jra	L3563
6964  1240               L7463:
6965                     ; 998 				}else{ Num_Display_LCD(uc_Heater_Enable_Flag); }
6967  1240 c60009        	ld	a,_uc_Heater_Enable_Flag
6968  1243 5f            	clrw	x
6969  1244 97            	ld	xl,a
6970  1245 cd0000        	call	_Num_Display_LCD
6972  1248               L3563:
6973                     ; 1002 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 5));
6975  1248 7b15          	ld	a,(OFST-1,sp)
6976  124a 5f            	clrw	x
6977  124b 97            	ld	xl,a
6978  124c d60000        	ld	a,(_LCD_Line,x)
6979  124f ab05          	add	a,#5
6980  1251 cd0000        	call	_Set_LCD_Address
6982                     ; 1003 				if (HEATER_zone_status == HTR_ZONE_1)
6984  1254 725d0000      	tnz	_HEATER_zone_status
6985  1258 2608          	jrne	L5563
6986                     ; 1004 				Display_LCD_String("Z1");
6988  125a ae00e6        	ldw	x,#L1362
6989  125d cd0000        	call	_Display_LCD_String
6992  1260 2006          	jra	L7563
6993  1262               L5563:
6994                     ; 1005 				else Display_LCD_String("Z2");
6996  1262 ae00e3        	ldw	x,#L5362
6997  1265 cd0000        	call	_Display_LCD_String
6999  1268               L7563:
7000                     ; 1007 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 9));
7002  1268 7b15          	ld	a,(OFST-1,sp)
7003  126a 5f            	clrw	x
7004  126b 97            	ld	xl,a
7005  126c d60000        	ld	a,(_LCD_Line,x)
7006  126f ab09          	add	a,#9
7007  1271 cd0000        	call	_Set_LCD_Address
7009                     ; 1009 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7011  1274 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7012  1277 a501          	bcp	a,#1
7013  1279 270a          	jreq	L1663
7016  127b ae00e0        	ldw	x,#L1462
7017  127e cd0000        	call	_Display_LCD_String
7020  1281 acef16ef      	jpf	L3073
7021  1285               L1663:
7022                     ; 1011 					uc_buffer = (U8)((can_data[0] & 0x0C) >> 2);
7024  1285 7b0d          	ld	a,(OFST-9,sp)
7025  1287 44            	srl	a
7026  1288 44            	srl	a
7027  1289 a403          	and	a,#3
7028  128b 6b16          	ld	(OFST+0,sp),a
7030                     ; 1012 					if(uc_buffer == (U8)(0)){ Display_LCD_String("Stop");   }
7032  128d 0d16          	tnz	(OFST+0,sp)
7033  128f 260a          	jrne	L5663
7036  1291 ae00db        	ldw	x,#L7462
7037  1294 cd0000        	call	_Display_LCD_String
7040  1297 acef16ef      	jpf	L3073
7041  129b               L5663:
7042                     ; 1013 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("Oper"); }
7044  129b 7b16          	ld	a,(OFST+0,sp)
7045  129d a101          	cp	a,#1
7046  129f 260a          	jrne	L1763
7049  12a1 ae00d6        	ldw	x,#L5562
7050  12a4 cd0000        	call	_Display_LCD_String
7053  12a7 acef16ef      	jpf	L3073
7054  12ab               L1763:
7055                     ; 1014 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("Flt"); }
7057  12ab 7b16          	ld	a,(OFST+0,sp)
7058  12ad a102          	cp	a,#2
7059  12af 260a          	jrne	L5763
7062  12b1 ae00d2        	ldw	x,#L3662
7063  12b4 cd0000        	call	_Display_LCD_String
7066  12b7 acef16ef      	jpf	L3073
7067  12bb               L5763:
7068                     ; 1015 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("Lmit"); }
7070  12bb 7b16          	ld	a,(OFST+0,sp)
7071  12bd a103          	cp	a,#3
7072  12bf 2703          	jreq	L241
7073  12c1 cc16ef        	jp	L3073
7074  12c4               L241:
7077  12c4 ae00cd        	ldw	x,#L1762
7078  12c7 cd0000        	call	_Display_LCD_String
7080  12ca acef16ef      	jpf	L3073
7081  12ce               L5463:
7082                     ; 1021 			else if(uc_line_index == (U8)(1)){	// LINE 2
7084  12ce 7b15          	ld	a,(OFST-1,sp)
7085  12d0 a101          	cp	a,#1
7086  12d2 2703          	jreq	L441
7087  12d4 cc15e3        	jp	L5073
7088  12d7               L441:
7089                     ; 1024 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7091  12d7 7b15          	ld	a,(OFST-1,sp)
7092  12d9 5f            	clrw	x
7093  12da 97            	ld	xl,a
7094  12db d60000        	ld	a,(_LCD_Line,x)
7095  12de ab03          	add	a,#3
7096  12e0 cd0000        	call	_Set_LCD_Address
7098                     ; 1025 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
7100  12e3 c6000d        	ld	a,_uc_Test_Ctrl_Reg
7101  12e6 a504          	bcp	a,#4
7102  12e8 2603          	jrne	L641
7103  12ea cc1451        	jp	L7073
7104  12ed               L641:
7106  12ed 7b15          	ld	a,(OFST-1,sp)
7107  12ef c10002        	cp	a,_uc_Test_Data_Select_Num
7108  12f2 2703          	jreq	L051
7109  12f4 cc1451        	jp	L7073
7110  12f7               L051:
7111                     ; 1026 					if(b_Blink_250_Flag){
7113  12f7 c60000        	ld	a,_uc_LCD_Blink_Reg
7114  12fa a502          	bcp	a,#2
7115  12fc 2603          	jrne	L251
7116  12fe cc1591        	jp	L3004
7117  1301               L251:
7118                     ; 1027 						if(!uc_Target_Display_Mode){	// Percentage_Display
7120  1301 725d0000      	tnz	_uc_Target_Display_Mode
7121  1305 2676          	jrne	L3173
7122                     ; 1028 if (HEATER_zone_status == HTR_ZONE_1)
7124  1307 725d0000      	tnz	_HEATER_zone_status
7125  130b 2638          	jrne	L5173
7126                     ; 1030 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
7128  130d c6000a        	ld	a,_uc_Target_Duty_Perc
7129  1310 5f            	clrw	x
7130  1311 97            	ld	xl,a
7131  1312 57            	sraw	x
7132  1313 cd0000        	call	_Num_Display_LCD
7134                     ; 1031 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
7136  1316 c6000a        	ld	a,_uc_Target_Duty_Perc
7137  1319 a1c8          	cp	a,#200
7138  131b 2503          	jrult	L451
7139  131d cc1591        	jp	L3004
7140  1320               L451:
7141                     ; 1032 								Display_LCD_String(".");
7143  1320 ae0105        	ldw	x,#L7352
7144  1323 cd0000        	call	_Display_LCD_String
7146                     ; 1033 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
7148  1326 c6000a        	ld	a,_uc_Target_Duty_Perc
7149  1329 a401          	and	a,#1
7150  132b 6b16          	ld	(OFST+0,sp),a
7152                     ; 1034 								if(uc_buffer){ Display_LCD_String("5"); }
7154  132d 0d16          	tnz	(OFST+0,sp)
7155  132f 270a          	jreq	L1273
7158  1331 ae0103        	ldw	x,#L3452
7159  1334 cd0000        	call	_Display_LCD_String
7162  1337 ac911591      	jpf	L3004
7163  133b               L1273:
7164                     ; 1035 								else{ Display_LCD_String("0"); }
7166  133b ae0101        	ldw	x,#L7452
7167  133e cd0000        	call	_Display_LCD_String
7169  1341 ac911591      	jpf	L3004
7170  1345               L5173:
7171                     ; 1040 							Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
7173  1345 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7174  1348 5f            	clrw	x
7175  1349 97            	ld	xl,a
7176  134a 57            	sraw	x
7177  134b cd0000        	call	_Num_Display_LCD
7179                     ; 1041 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
7181  134e c6000b        	ld	a,_uc_Target_Duty_Perc+1
7182  1351 a1c8          	cp	a,#200
7183  1353 2503          	jrult	L651
7184  1355 cc1591        	jp	L3004
7185  1358               L651:
7186                     ; 1042 								Display_LCD_String(".");
7188  1358 ae0105        	ldw	x,#L7352
7189  135b cd0000        	call	_Display_LCD_String
7191                     ; 1043 								uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
7193  135e c6000b        	ld	a,_uc_Target_Duty_Perc+1
7194  1361 a401          	and	a,#1
7195  1363 6b16          	ld	(OFST+0,sp),a
7197                     ; 1044 								if(uc_buffer){ Display_LCD_String("5"); }
7199  1365 0d16          	tnz	(OFST+0,sp)
7200  1367 270a          	jreq	L1373
7203  1369 ae0103        	ldw	x,#L3452
7204  136c cd0000        	call	_Display_LCD_String
7207  136f ac911591      	jpf	L3004
7208  1373               L1373:
7209                     ; 1045 								else{ Display_LCD_String("0"); }
7211  1373 ae0101        	ldw	x,#L7452
7212  1376 cd0000        	call	_Display_LCD_String
7214  1379 ac911591      	jpf	L3004
7215  137d               L3173:
7216                     ; 1050 if (HEATER_zone_status == HTR_ZONE_1)
7218  137d 725d0000      	tnz	_HEATER_zone_status
7219  1381 2667          	jrne	L7373
7220                     ; 1052 							if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
7222  1383 c6000a        	ld	a,_uc_Target_Duty_Perc
7223  1386 a114          	cp	a,#20
7224  1388 2408          	jruge	L1473
7227  138a 5f            	clrw	x
7228  138b cd0000        	call	_Num_Display_LCD
7231  138e ac911591      	jpf	L3004
7232  1392               L1473:
7233                     ; 1053 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
7235  1392 c6000a        	ld	a,_uc_Target_Duty_Perc
7236  1395 a114          	cp	a,#20
7237  1397 260a          	jrne	L5473
7240  1399 ae0064        	ldw	x,#100
7241  139c cd0000        	call	_Num_Display_LCD
7244  139f ac911591      	jpf	L3004
7245  13a3               L5473:
7246                     ; 1054 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
7248  13a3 c6000a        	ld	a,_uc_Target_Duty_Perc
7249  13a6 a1b4          	cp	a,#180
7250  13a8 260a          	jrne	L1573
7253  13aa ae1838        	ldw	x,#6200
7254  13ad cd0000        	call	_Num_Display_LCD
7257  13b0 ac911591      	jpf	L3004
7258  13b4               L1573:
7259                     ; 1055 							else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(190)){ Display_LCD_String("MAX"); }
7261  13b4 c6000a        	ld	a,_uc_Target_Duty_Perc
7262  13b7 a1be          	cp	a,#190
7263  13b9 260a          	jrne	L5573
7266  13bb ae00c9        	ldw	x,#L7472
7267  13be cd0000        	call	_Display_LCD_String
7270  13c1 ac911591      	jpf	L3004
7271  13c5               L5573:
7272                     ; 1056 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7274  13c5 c6000a        	ld	a,_uc_Target_Duty_Perc
7275  13c8 5f            	clrw	x
7276  13c9 97            	ld	xl,a
7277  13ca 1d0014        	subw	x,#20
7278  13cd 90ae94ed      	ldw	y,#38125
7279  13d1 cd0000        	call	c_umul
7281  13d4 ae0000        	ldw	x,#L25
7282  13d7 cd0000        	call	c_ludv
7284  13da be02          	ldw	x,c_lreg+2
7285  13dc 1c0064        	addw	x,#100
7286  13df 1f0b          	ldw	(OFST-11,sp),x
7290  13e1 1e0b          	ldw	x,(OFST-11,sp)
7291  13e3 cd0000        	call	_Num_Display_LCD
7293  13e6 ac911591      	jpf	L3004
7294  13ea               L7373:
7295                     ; 1060 							if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
7297  13ea c6000b        	ld	a,_uc_Target_Duty_Perc+1
7298  13ed a114          	cp	a,#20
7299  13ef 2408          	jruge	L3673
7302  13f1 5f            	clrw	x
7303  13f2 cd0000        	call	_Num_Display_LCD
7306  13f5 ac911591      	jpf	L3004
7307  13f9               L3673:
7308                     ; 1061 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
7310  13f9 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7311  13fc a114          	cp	a,#20
7312  13fe 260a          	jrne	L7673
7315  1400 ae0064        	ldw	x,#100
7316  1403 cd0000        	call	_Num_Display_LCD
7319  1406 ac911591      	jpf	L3004
7320  140a               L7673:
7321                     ; 1062 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
7323  140a c6000b        	ld	a,_uc_Target_Duty_Perc+1
7324  140d a1b4          	cp	a,#180
7325  140f 260a          	jrne	L3773
7328  1411 ae1838        	ldw	x,#6200
7329  1414 cd0000        	call	_Num_Display_LCD
7332  1417 ac911591      	jpf	L3004
7333  141b               L3773:
7334                     ; 1063 							else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(190)){ Display_LCD_String("MAX"); }
7336  141b c6000b        	ld	a,_uc_Target_Duty_Perc+1
7337  141e a1be          	cp	a,#190
7338  1420 260a          	jrne	L7773
7341  1422 ae00c9        	ldw	x,#L7472
7342  1425 cd0000        	call	_Display_LCD_String
7345  1428 ac911591      	jpf	L3004
7346  142c               L7773:
7347                     ; 1064 							else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7349  142c c6000b        	ld	a,_uc_Target_Duty_Perc+1
7350  142f 5f            	clrw	x
7351  1430 97            	ld	xl,a
7352  1431 1d0014        	subw	x,#20
7353  1434 90ae94ed      	ldw	y,#38125
7354  1438 cd0000        	call	c_umul
7356  143b ae0000        	ldw	x,#L25
7357  143e cd0000        	call	c_ludv
7359  1441 be02          	ldw	x,c_lreg+2
7360  1443 1c0064        	addw	x,#100
7361  1446 1f0b          	ldw	(OFST-11,sp),x
7365  1448 1e0b          	ldw	x,(OFST-11,sp)
7366  144a cd0000        	call	_Num_Display_LCD
7368  144d ac911591      	jpf	L3004
7369  1451               L7073:
7370                     ; 1069 					if(!uc_Target_Display_Mode){
7372  1451 725d0000      	tnz	_uc_Target_Display_Mode
7373  1455 2676          	jrne	L5004
7374                     ; 1070 if (HEATER_zone_status == HTR_ZONE_1)
7376  1457 725d0000      	tnz	_HEATER_zone_status
7377  145b 2638          	jrne	L7004
7378                     ; 1072 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_1] /(U8)(2));
7380  145d c6000a        	ld	a,_uc_Target_Duty_Perc
7381  1460 5f            	clrw	x
7382  1461 97            	ld	xl,a
7383  1462 57            	sraw	x
7384  1463 cd0000        	call	_Num_Display_LCD
7386                     ; 1073 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(200)){
7388  1466 c6000a        	ld	a,_uc_Target_Duty_Perc
7389  1469 a1c8          	cp	a,#200
7390  146b 2503          	jrult	L061
7391  146d cc1591        	jp	L3004
7392  1470               L061:
7393                     ; 1074 							Display_LCD_String(".");
7395  1470 ae0105        	ldw	x,#L7352
7396  1473 cd0000        	call	_Display_LCD_String
7398                     ; 1075 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_1] % (U8)(2);
7400  1476 c6000a        	ld	a,_uc_Target_Duty_Perc
7401  1479 a401          	and	a,#1
7402  147b 6b16          	ld	(OFST+0,sp),a
7404                     ; 1076 							if(uc_buffer){ Display_LCD_String("5"); }
7406  147d 0d16          	tnz	(OFST+0,sp)
7407  147f 270a          	jreq	L3104
7410  1481 ae0103        	ldw	x,#L3452
7411  1484 cd0000        	call	_Display_LCD_String
7414  1487 ac911591      	jpf	L3004
7415  148b               L3104:
7416                     ; 1077 							else{ Display_LCD_String("0"); }
7418  148b ae0101        	ldw	x,#L7452
7419  148e cd0000        	call	_Display_LCD_String
7421  1491 ac911591      	jpf	L3004
7422  1495               L7004:
7423                     ; 1082 						Num_Display_LCD(uc_Target_Duty_Perc[HTR_ZONE_2] /(U8)(2));
7425  1495 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7426  1498 5f            	clrw	x
7427  1499 97            	ld	xl,a
7428  149a 57            	sraw	x
7429  149b cd0000        	call	_Num_Display_LCD
7431                     ; 1083 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(200)){
7433  149e c6000b        	ld	a,_uc_Target_Duty_Perc+1
7434  14a1 a1c8          	cp	a,#200
7435  14a3 2503          	jrult	L261
7436  14a5 cc1591        	jp	L3004
7437  14a8               L261:
7438                     ; 1084 							Display_LCD_String(".");
7440  14a8 ae0105        	ldw	x,#L7352
7441  14ab cd0000        	call	_Display_LCD_String
7443                     ; 1085 							uc_buffer = uc_Target_Duty_Perc[HTR_ZONE_2] % (U8)(2);
7445  14ae c6000b        	ld	a,_uc_Target_Duty_Perc+1
7446  14b1 a401          	and	a,#1
7447  14b3 6b16          	ld	(OFST+0,sp),a
7449                     ; 1086 							if(uc_buffer){ Display_LCD_String("5"); }
7451  14b5 0d16          	tnz	(OFST+0,sp)
7452  14b7 270a          	jreq	L3204
7455  14b9 ae0103        	ldw	x,#L3452
7456  14bc cd0000        	call	_Display_LCD_String
7459  14bf ac911591      	jpf	L3004
7460  14c3               L3204:
7461                     ; 1087 							else{ Display_LCD_String("0"); }
7463  14c3 ae0101        	ldw	x,#L7452
7464  14c6 cd0000        	call	_Display_LCD_String
7466  14c9 ac911591      	jpf	L3004
7467  14cd               L5004:
7468                     ; 1092 if (HEATER_zone_status == HTR_ZONE_1)
7470  14cd 725d0000      	tnz	_HEATER_zone_status
7471  14d1 2663          	jrne	L1304
7472                     ; 1094 						if(uc_Target_Duty_Perc[HTR_ZONE_1] < (U8)(20)){ Num_Display_LCD(0u); }
7474  14d3 c6000a        	ld	a,_uc_Target_Duty_Perc
7475  14d6 a114          	cp	a,#20
7476  14d8 2408          	jruge	L3304
7479  14da 5f            	clrw	x
7480  14db cd0000        	call	_Num_Display_LCD
7483  14de ac911591      	jpf	L3004
7484  14e2               L3304:
7485                     ; 1095 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(20)){ Num_Display_LCD(100u); }
7487  14e2 c6000a        	ld	a,_uc_Target_Duty_Perc
7488  14e5 a114          	cp	a,#20
7489  14e7 260a          	jrne	L7304
7492  14e9 ae0064        	ldw	x,#100
7493  14ec cd0000        	call	_Num_Display_LCD
7496  14ef ac911591      	jpf	L3004
7497  14f3               L7304:
7498                     ; 1096 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] == (U8)(180)){ Num_Display_LCD(6200u); }
7500  14f3 c6000a        	ld	a,_uc_Target_Duty_Perc
7501  14f6 a1b4          	cp	a,#180
7502  14f8 260a          	jrne	L3404
7505  14fa ae1838        	ldw	x,#6200
7506  14fd cd0000        	call	_Num_Display_LCD
7509  1500 ac911591      	jpf	L3004
7510  1504               L3404:
7511                     ; 1097 						else if(uc_Target_Duty_Perc[HTR_ZONE_1] > (U8)(180)){ Display_LCD_String("MAX"); }
7513  1504 c6000a        	ld	a,_uc_Target_Duty_Perc
7514  1507 a1b5          	cp	a,#181
7515  1509 2508          	jrult	L7404
7518  150b ae00c9        	ldw	x,#L7472
7519  150e cd0000        	call	_Display_LCD_String
7522  1511 207e          	jra	L3004
7523  1513               L7404:
7524                     ; 1098 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_1]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7526  1513 c6000a        	ld	a,_uc_Target_Duty_Perc
7527  1516 5f            	clrw	x
7528  1517 97            	ld	xl,a
7529  1518 1d0014        	subw	x,#20
7530  151b 90ae94ed      	ldw	y,#38125
7531  151f cd0000        	call	c_umul
7533  1522 ae0000        	ldw	x,#L25
7534  1525 cd0000        	call	c_ludv
7536  1528 be02          	ldw	x,c_lreg+2
7537  152a 1c0064        	addw	x,#100
7538  152d 1f0b          	ldw	(OFST-11,sp),x
7542  152f 1e0b          	ldw	x,(OFST-11,sp)
7543  1531 cd0000        	call	_Num_Display_LCD
7545  1534 205b          	jra	L3004
7546  1536               L1304:
7547                     ; 1102 						if(uc_Target_Duty_Perc[HTR_ZONE_2] < (U8)(20)){ Num_Display_LCD(0u); }
7549  1536 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7550  1539 a114          	cp	a,#20
7551  153b 2406          	jruge	L5504
7554  153d 5f            	clrw	x
7555  153e cd0000        	call	_Num_Display_LCD
7558  1541 204e          	jra	L3004
7559  1543               L5504:
7560                     ; 1103 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(20)){ Num_Display_LCD(100u); }
7562  1543 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7563  1546 a114          	cp	a,#20
7564  1548 2608          	jrne	L1604
7567  154a ae0064        	ldw	x,#100
7568  154d cd0000        	call	_Num_Display_LCD
7571  1550 203f          	jra	L3004
7572  1552               L1604:
7573                     ; 1104 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] == (U8)(180)){ Num_Display_LCD(6200u); }
7575  1552 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7576  1555 a1b4          	cp	a,#180
7577  1557 2608          	jrne	L5604
7580  1559 ae1838        	ldw	x,#6200
7581  155c cd0000        	call	_Num_Display_LCD
7584  155f 2030          	jra	L3004
7585  1561               L5604:
7586                     ; 1105 						else if(uc_Target_Duty_Perc[HTR_ZONE_2] > (U8)(180)){ Display_LCD_String("MAX"); }
7588  1561 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7589  1564 a1b5          	cp	a,#181
7590  1566 2508          	jrult	L1704
7593  1568 ae00c9        	ldw	x,#L7472
7594  156b cd0000        	call	_Display_LCD_String
7597  156e 2021          	jra	L3004
7598  1570               L1704:
7599                     ; 1106 						else{ ui_buffer = (U16)((U32)(uc_Target_Duty_Perc[HTR_ZONE_2]-20u) * (U32)(38125) / (U32)(1000)) + (U16)(100); Num_Display_LCD(ui_buffer);}
7601  1570 c6000b        	ld	a,_uc_Target_Duty_Perc+1
7602  1573 5f            	clrw	x
7603  1574 97            	ld	xl,a
7604  1575 1d0014        	subw	x,#20
7605  1578 90ae94ed      	ldw	y,#38125
7606  157c cd0000        	call	c_umul
7608  157f ae0000        	ldw	x,#L25
7609  1582 cd0000        	call	c_ludv
7611  1585 be02          	ldw	x,c_lreg+2
7612  1587 1c0064        	addw	x,#100
7613  158a 1f0b          	ldw	(OFST-11,sp),x
7617  158c 1e0b          	ldw	x,(OFST-11,sp)
7618  158e cd0000        	call	_Num_Display_LCD
7620  1591               L3004:
7621                     ; 1112 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7623  1591 7b15          	ld	a,(OFST-1,sp)
7624  1593 5f            	clrw	x
7625  1594 97            	ld	xl,a
7626  1595 d60000        	ld	a,(_LCD_Line,x)
7627  1598 ab0b          	add	a,#11
7628  159a cd0000        	call	_Set_LCD_Address
7630                     ; 1113 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7632  159d c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7633  15a0 a501          	bcp	a,#1
7634  15a2 270a          	jreq	L5704
7637  15a4 ae00e0        	ldw	x,#L1462
7638  15a7 cd0000        	call	_Display_LCD_String
7641  15aa acef16ef      	jpf	L3073
7642  15ae               L5704:
7643                     ; 1115 					Num_Display_LCD(can_data[4] /(U8)(2));
7645  15ae 7b11          	ld	a,(OFST-5,sp)
7646  15b0 5f            	clrw	x
7647  15b1 97            	ld	xl,a
7648  15b2 57            	sraw	x
7649  15b3 cd0000        	call	_Num_Display_LCD
7651                     ; 1116 					if(can_data[6] < (U8)(200)){
7653  15b6 7b13          	ld	a,(OFST-3,sp)
7654  15b8 a1c8          	cp	a,#200
7655  15ba 2503          	jrult	L461
7656  15bc cc16ef        	jp	L3073
7657  15bf               L461:
7658                     ; 1117 						Display_LCD_String(".");
7660  15bf ae0105        	ldw	x,#L7352
7661  15c2 cd0000        	call	_Display_LCD_String
7663                     ; 1118 						uc_buffer = can_data[4] % (U8)(2);
7665  15c5 7b11          	ld	a,(OFST-5,sp)
7666  15c7 a401          	and	a,#1
7667  15c9 6b16          	ld	(OFST+0,sp),a
7669                     ; 1119 						if(uc_buffer){ Display_LCD_String("5"); }
7671  15cb 0d16          	tnz	(OFST+0,sp)
7672  15cd 270a          	jreq	L3014
7675  15cf ae0103        	ldw	x,#L3452
7676  15d2 cd0000        	call	_Display_LCD_String
7679  15d5 acef16ef      	jpf	L3073
7680  15d9               L3014:
7681                     ; 1120 						else{ Display_LCD_String("0"); }
7683  15d9 ae0101        	ldw	x,#L7452
7684  15dc cd0000        	call	_Display_LCD_String
7686  15df acef16ef      	jpf	L3073
7687  15e3               L5073:
7688                     ; 1126 			else if(uc_line_index == (U8)(2)){	// LINE 3
7690  15e3 7b15          	ld	a,(OFST-1,sp)
7691  15e5 a102          	cp	a,#2
7692  15e7 2703          	jreq	L661
7693  15e9 cc1677        	jp	L1114
7694  15ec               L661:
7695                     ; 1129 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 2));
7697  15ec 7b15          	ld	a,(OFST-1,sp)
7698  15ee 5f            	clrw	x
7699  15ef 97            	ld	xl,a
7700  15f0 d60000        	ld	a,(_LCD_Line,x)
7701  15f3 ab02          	add	a,#2
7702  15f5 cd0000        	call	_Set_LCD_Address
7704                     ; 1130 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
7706  15f8 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7707  15fb a501          	bcp	a,#1
7708  15fd 2708          	jreq	L3114
7711  15ff ae00c7        	ldw	x,#L7013
7712  1602 cd0000        	call	_Display_LCD_String
7715  1605 2014          	jra	L5114
7716  1607               L3114:
7717                     ; 1132 					if(can_data[0] & 0x01){ Display_LCD_String("1"); }
7719  1607 7b0d          	ld	a,(OFST-9,sp)
7720  1609 a501          	bcp	a,#1
7721  160b 2708          	jreq	L7114
7724  160d ae00c5        	ldw	x,#L5113
7725  1610 cd0000        	call	_Display_LCD_String
7728  1613 2006          	jra	L5114
7729  1615               L7114:
7730                     ; 1133 					else{ Display_LCD_String("0"); }
7732  1615 ae0101        	ldw	x,#L7452
7733  1618 cd0000        	call	_Display_LCD_String
7735  161b               L5114:
7736                     ; 1136 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 6));
7738  161b 7b15          	ld	a,(OFST-1,sp)
7739  161d 5f            	clrw	x
7740  161e 97            	ld	xl,a
7741  161f d60000        	ld	a,(_LCD_Line,x)
7742  1622 ab06          	add	a,#6
7743  1624 cd0000        	call	_Set_LCD_Address
7745                     ; 1137 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("N"); }		// No Communication
7747  1627 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7748  162a a502          	bcp	a,#2
7749  162c 2708          	jreq	L3214
7752  162e ae00c7        	ldw	x,#L7013
7753  1631 cd0000        	call	_Display_LCD_String
7756  1634 2014          	jra	L5214
7757  1636               L3214:
7758                     ; 1139 					if(can_diag[0] & 0x01){ Display_LCD_String("1"); }
7760  1636 7b03          	ld	a,(OFST-19,sp)
7761  1638 a501          	bcp	a,#1
7762  163a 2708          	jreq	L7214
7765  163c ae00c5        	ldw	x,#L5113
7766  163f cd0000        	call	_Display_LCD_String
7769  1642 2006          	jra	L5214
7770  1644               L7214:
7771                     ; 1140 					else{ Display_LCD_String("0"); }
7773  1644 ae0101        	ldw	x,#L7452
7774  1647 cd0000        	call	_Display_LCD_String
7776  164a               L5214:
7777                     ; 1143 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7779  164a 7b15          	ld	a,(OFST-1,sp)
7780  164c 5f            	clrw	x
7781  164d 97            	ld	xl,a
7782  164e d60000        	ld	a,(_LCD_Line,x)
7783  1651 ab0b          	add	a,#11
7784  1653 cd0000        	call	_Set_LCD_Address
7786                     ; 1144 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7788  1656 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7789  1659 a501          	bcp	a,#1
7790  165b 270a          	jreq	L3314
7793  165d ae00e0        	ldw	x,#L1462
7794  1660 cd0000        	call	_Display_LCD_String
7797  1663 acef16ef      	jpf	L3073
7798  1667               L3314:
7799                     ; 1147 					ui_buffer = (U16)(uc_Rx_Data[0][3]) * (U16)(4);//YJS 2->4
7801  1667 c60003        	ld	a,_uc_Rx_Data+3
7802  166a 97            	ld	xl,a
7803  166b a604          	ld	a,#4
7804  166d 42            	mul	x,a
7805  166e 1f0b          	ldw	(OFST-11,sp),x
7807                     ; 1148 					Num_Display_LCD(ui_buffer);
7809  1670 1e0b          	ldw	x,(OFST-11,sp)
7810  1672 cd0000        	call	_Num_Display_LCD
7812  1675 2078          	jra	L3073
7813  1677               L1114:
7814                     ; 1154 			else if(uc_line_index == (U8)(3)){	// LINE 4
7816  1677 7b15          	ld	a,(OFST-1,sp)
7817  1679 a103          	cp	a,#3
7818  167b 2672          	jrne	L3073
7819                     ; 1157 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7821  167d 7b15          	ld	a,(OFST-1,sp)
7822  167f 5f            	clrw	x
7823  1680 97            	ld	xl,a
7824  1681 d60000        	ld	a,(_LCD_Line,x)
7825  1684 ab03          	add	a,#3
7826  1686 cd0000        	call	_Set_LCD_Address
7828                     ; 1159 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7830  1689 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7831  168c a501          	bcp	a,#1
7832  168e 2708          	jreq	L3414
7835  1690 ae00e0        	ldw	x,#L1462
7836  1693 cd0000        	call	_Display_LCD_String
7839  1696 2026          	jra	L5414
7840  1698               L3414:
7841                     ; 1161 					Num_Display_LCD(can_data[6] / (U8)(5));
7843  1698 7b13          	ld	a,(OFST-3,sp)
7844  169a 5f            	clrw	x
7845  169b 97            	ld	xl,a
7846  169c a605          	ld	a,#5
7847  169e cd0000        	call	c_sdivx
7849  16a1 cd0000        	call	_Num_Display_LCD
7851                     ; 1162 					Display_LCD_String(".");
7853  16a4 ae0105        	ldw	x,#L7352
7854  16a7 cd0000        	call	_Display_LCD_String
7856                     ; 1163 					uc_buffer = can_data[6] % (U8)(5);
7858  16aa 7b13          	ld	a,(OFST-3,sp)
7859  16ac 5f            	clrw	x
7860  16ad 97            	ld	xl,a
7861  16ae a605          	ld	a,#5
7862  16b0 62            	div	x,a
7863  16b1 5f            	clrw	x
7864  16b2 97            	ld	xl,a
7865  16b3 9f            	ld	a,xl
7866  16b4 6b16          	ld	(OFST+0,sp),a
7868                     ; 1164 					Num_Display_LCD(uc_buffer * (U8)(2));
7870  16b6 7b16          	ld	a,(OFST+0,sp)
7871  16b8 5f            	clrw	x
7872  16b9 97            	ld	xl,a
7873  16ba 58            	sllw	x
7874  16bb cd0000        	call	_Num_Display_LCD
7876  16be               L5414:
7877                     ; 1170 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 11));
7879  16be 7b15          	ld	a,(OFST-1,sp)
7880  16c0 5f            	clrw	x
7881  16c1 97            	ld	xl,a
7882  16c2 d60000        	ld	a,(_LCD_Line,x)
7883  16c5 ab0b          	add	a,#11
7884  16c7 cd0000        	call	_Set_LCD_Address
7886                     ; 1172 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7888  16ca c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7889  16cd a501          	bcp	a,#1
7890  16cf 2708          	jreq	L7414
7893  16d1 ae00e0        	ldw	x,#L1462
7894  16d4 cd0000        	call	_Display_LCD_String
7897  16d7 2016          	jra	L3073
7898  16d9               L7414:
7899                     ; 1174 					ui_buffer = (U16)(can_data[3] << 8) + (U16)(can_data[2]);
7901  16d9 7b0f          	ld	a,(OFST-7,sp)
7902  16db 5f            	clrw	x
7903  16dc 97            	ld	xl,a
7904  16dd 1f01          	ldw	(OFST-21,sp),x
7906  16df 7b10          	ld	a,(OFST-6,sp)
7907  16e1 5f            	clrw	x
7908  16e2 97            	ld	xl,a
7909  16e3 4f            	clr	a
7910  16e4 02            	rlwa	x,a
7911  16e5 72fb01        	addw	x,(OFST-21,sp)
7912  16e8 1f0b          	ldw	(OFST-11,sp),x
7914                     ; 1175 					Num_Display_LCD(ui_buffer);
7916  16ea 1e0b          	ldw	x,(OFST-11,sp)
7917  16ec cd0000        	call	_Num_Display_LCD
7919  16ef               L3073:
7920                     ; 972 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
7922  16ef 0c15          	inc	(OFST-1,sp)
7926  16f1 7b15          	ld	a,(OFST-1,sp)
7927  16f3 a104          	cp	a,#4
7928  16f5 2403          	jruge	L071
7929  16f7 cc118e        	jp	L1163
7930  16fa               L071:
7932  16fa ac6a1b6a      	jpf	L3514
7933  16fe               L7063:
7934                     ; 1185 	else if(uc_Test_Page_Now == (U8)(1)){
7936  16fe c60004        	ld	a,_uc_Test_Page_Now
7937  1701 a101          	cp	a,#1
7938  1703 2703          	jreq	L271
7939  1705 cc17a5        	jp	L5514
7940  1708               L271:
7941                     ; 1186 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
7943  1708 0f15          	clr	(OFST-1,sp)
7945  170a               L7514:
7946                     ; 1188 			Set_LCD_Address(LCD_Line[uc_line_index]);
7948  170a 7b15          	ld	a,(OFST-1,sp)
7949  170c 5f            	clrw	x
7950  170d 97            	ld	xl,a
7951  170e d60000        	ld	a,(_LCD_Line,x)
7952  1711 cd0000        	call	_Set_LCD_Address
7954                     ; 1189 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
7956  1714 7b15          	ld	a,(OFST-1,sp)
7957  1716 97            	ld	xl,a
7958  1717 a610          	ld	a,#16
7959  1719 42            	mul	x,a
7960  171a 1c0000        	addw	x,#_LCD_Dis_Data
7961  171d cd0000        	call	_Display_LCD_String
7963                     ; 1192 			if(uc_line_index == (U8)(0)){		// LINE 1
7965  1720 0d15          	tnz	(OFST-1,sp)
7966  1722 2641          	jrne	L5614
7967                     ; 1195 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 3));
7969  1724 7b15          	ld	a,(OFST-1,sp)
7970  1726 5f            	clrw	x
7971  1727 97            	ld	xl,a
7972  1728 d60000        	ld	a,(_LCD_Line,x)
7973  172b ab03          	add	a,#3
7974  172d cd0000        	call	_Set_LCD_Address
7976                     ; 1196 				if(b_Rx1_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
7978  1730 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
7979  1733 a501          	bcp	a,#1
7980  1735 2708          	jreq	L7614
7983  1737 ae00e0        	ldw	x,#L1462
7984  173a cd0000        	call	_Display_LCD_String
7987  173d 2026          	jra	L5614
7988  173f               L7614:
7989                     ; 1198 					if(can_data[1] < (U8)(40)){
7991  173f 7b0e          	ld	a,(OFST-8,sp)
7992  1741 a128          	cp	a,#40
7993  1743 2416          	jruge	L3714
7994                     ; 1199 						Display_LCD_String("-");
7996  1745 ae00c3        	ldw	x,#L3713
7997  1748 cd0000        	call	_Display_LCD_String
7999                     ; 1200 						Num_Display_LCD((U8)(40) - can_data[1]);
8001  174b a600          	ld	a,#0
8002  174d 97            	ld	xl,a
8003  174e a628          	ld	a,#40
8004  1750 100e          	sub	a,(OFST-8,sp)
8005  1752 2401          	jrnc	L231
8006  1754 5a            	decw	x
8007  1755               L231:
8008  1755 02            	rlwa	x,a
8009  1756 cd0000        	call	_Num_Display_LCD
8012  1759 200a          	jra	L5614
8013  175b               L3714:
8014                     ; 1203 						Num_Display_LCD(can_data[1] - (U8)(40));
8016  175b 7b0e          	ld	a,(OFST-8,sp)
8017  175d 5f            	clrw	x
8018  175e 97            	ld	xl,a
8019  175f 1d0028        	subw	x,#40
8020  1762 cd0000        	call	_Num_Display_LCD
8022  1765               L5614:
8023                     ; 1209 			if(uc_line_index == (U8)(1)){		// LINE 2
8025  1765 7b15          	ld	a,(OFST-1,sp)
8026  1767 a101          	cp	a,#1
8027  1769 2623          	jrne	L7714
8028                     ; 1212 				Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 4));
8030  176b 7b15          	ld	a,(OFST-1,sp)
8031  176d 5f            	clrw	x
8032  176e 97            	ld	xl,a
8033  176f d60000        	ld	a,(_LCD_Line,x)
8034  1772 ab04          	add	a,#4
8035  1774 cd0000        	call	_Set_LCD_Address
8037                     ; 1213 				if(b_Rx2_Msg_TimeOut_Flag){ Display_LCD_String("NC"); }		// No Communication
8039  1777 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8040  177a a502          	bcp	a,#2
8041  177c 2708          	jreq	L1024
8044  177e ae00e0        	ldw	x,#L1462
8045  1781 cd0000        	call	_Display_LCD_String
8048  1784 2008          	jra	L7714
8049  1786               L1024:
8050                     ; 1216 					Num_Display_LCD(uc_Rx_Data[0][7]);  				//SoftWare Version Display
8052  1786 c60007        	ld	a,_uc_Rx_Data+7
8053  1789 5f            	clrw	x
8054  178a 97            	ld	xl,a
8055  178b cd0000        	call	_Num_Display_LCD
8057  178e               L7714:
8058                     ; 1228 			if(uc_line_index == (U8)(2)){		// LINE 2
8060  178e 7b15          	ld	a,(OFST-1,sp)
8061  1790 a102          	cp	a,#2
8062                     ; 1233 			if(uc_line_index == (U8)(3)){		// LINE 3
8064  1792 7b15          	ld	a,(OFST-1,sp)
8065  1794 a103          	cp	a,#3
8066                     ; 1186 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
8068  1796 0c15          	inc	(OFST-1,sp)
8072  1798 7b15          	ld	a,(OFST-1,sp)
8073  179a a104          	cp	a,#4
8074  179c 2403          	jruge	L471
8075  179e cc170a        	jp	L7514
8076  17a1               L471:
8078  17a1 ac6a1b6a      	jpf	L3514
8079  17a5               L5514:
8080                     ; 1240 		if(b_Rx2_Msg_TimeOut_Flag){
8082  17a5 c6000c        	ld	a,_uc_Rx_TimeOut_Reg
8083  17a8 a502          	bcp	a,#2
8084  17aa 2710          	jreq	L3124
8085                     ; 1241 			Set_LCD_Address(LCD_Line[0]);	
8087  17ac c60000        	ld	a,_LCD_Line
8088  17af cd0000        	call	_Set_LCD_Address
8090                     ; 1242 			Display_LCD_String("NC");
8092  17b2 ae00e0        	ldw	x,#L1462
8093  17b5 cd0000        	call	_Display_LCD_String
8096  17b8 ac6a1b6a      	jpf	L3514
8097  17bc               L3124:
8098                     ; 1245 			uc_fault_cnt = (U8)(0);
8100  17bc 0f16          	clr	(OFST+0,sp)
8102                     ; 1247 			if(can_diag[0] & (U8)(0x02)){
8104  17be 7b03          	ld	a,(OFST-19,sp)
8105  17c0 a502          	bcp	a,#2
8106  17c2 273c          	jreq	L7124
8107                     ; 1248 				uc_fault_cnt++;
8109  17c4 0c16          	inc	(OFST+0,sp)
8111                     ; 1249 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8111                     ; 1250 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8111                     ; 1251 				){
8113  17c6 0d16          	tnz	(OFST+0,sp)
8114  17c8 270d          	jreq	L5224
8116  17ca 7b16          	ld	a,(OFST+0,sp)
8117  17cc a105          	cp	a,#5
8118  17ce 2407          	jruge	L5224
8120  17d0 c60004        	ld	a,_uc_Test_Page_Now
8121  17d3 a102          	cp	a,#2
8122  17d5 2713          	jreq	L3224
8123  17d7               L5224:
8125  17d7 7b16          	ld	a,(OFST+0,sp)
8126  17d9 a105          	cp	a,#5
8127  17db 2523          	jrult	L7124
8129  17dd 7b16          	ld	a,(OFST+0,sp)
8130  17df a109          	cp	a,#9
8131  17e1 241d          	jruge	L7124
8133  17e3 c60004        	ld	a,_uc_Test_Page_Now
8134  17e6 a103          	cp	a,#3
8135  17e8 2616          	jrne	L7124
8136  17ea               L3224:
8137                     ; 1252 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8139  17ea 7b16          	ld	a,(OFST+0,sp)
8140  17ec 5f            	clrw	x
8141  17ed 97            	ld	xl,a
8142  17ee 5a            	decw	x
8143  17ef a604          	ld	a,#4
8144  17f1 cd0000        	call	c_smodx
8146  17f4 d60000        	ld	a,(_LCD_Line,x)
8147  17f7 cd0000        	call	_Set_LCD_Address
8149                     ; 1253 					Display_LCD_String("Flt_LVLow");
8151  17fa ae00b9        	ldw	x,#L1323
8152  17fd cd0000        	call	_Display_LCD_String
8154  1800               L7124:
8155                     ; 1257 			if(can_diag[0] & (U8)(0x04)){
8157  1800 7b03          	ld	a,(OFST-19,sp)
8158  1802 a504          	bcp	a,#4
8159  1804 273c          	jreq	L1324
8160                     ; 1258 				uc_fault_cnt++;
8162  1806 0c16          	inc	(OFST+0,sp)
8164                     ; 1259 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8164                     ; 1260 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8164                     ; 1261 				){
8166  1808 0d16          	tnz	(OFST+0,sp)
8167  180a 270d          	jreq	L7324
8169  180c 7b16          	ld	a,(OFST+0,sp)
8170  180e a105          	cp	a,#5
8171  1810 2407          	jruge	L7324
8173  1812 c60004        	ld	a,_uc_Test_Page_Now
8174  1815 a102          	cp	a,#2
8175  1817 2713          	jreq	L5324
8176  1819               L7324:
8178  1819 7b16          	ld	a,(OFST+0,sp)
8179  181b a105          	cp	a,#5
8180  181d 2523          	jrult	L1324
8182  181f 7b16          	ld	a,(OFST+0,sp)
8183  1821 a109          	cp	a,#9
8184  1823 241d          	jruge	L1324
8186  1825 c60004        	ld	a,_uc_Test_Page_Now
8187  1828 a103          	cp	a,#3
8188  182a 2616          	jrne	L1324
8189  182c               L5324:
8190                     ; 1262 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8192  182c 7b16          	ld	a,(OFST+0,sp)
8193  182e 5f            	clrw	x
8194  182f 97            	ld	xl,a
8195  1830 5a            	decw	x
8196  1831 a604          	ld	a,#4
8197  1833 cd0000        	call	c_smodx
8199  1836 d60000        	ld	a,(_LCD_Line,x)
8200  1839 cd0000        	call	_Set_LCD_Address
8202                     ; 1263 					Display_LCD_String("Flt_LVHigh");
8204  183c ae00ae        	ldw	x,#L5423
8205  183f cd0000        	call	_Display_LCD_String
8207  1842               L1324:
8208                     ; 1267 			if(can_diag[0] & (U8)(0x08)){
8210  1842 7b03          	ld	a,(OFST-19,sp)
8211  1844 a508          	bcp	a,#8
8212  1846 273c          	jreq	L3424
8213                     ; 1268 				uc_fault_cnt++;
8215  1848 0c16          	inc	(OFST+0,sp)
8217                     ; 1269 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8217                     ; 1270 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8217                     ; 1271 				){
8219  184a 0d16          	tnz	(OFST+0,sp)
8220  184c 270d          	jreq	L1524
8222  184e 7b16          	ld	a,(OFST+0,sp)
8223  1850 a105          	cp	a,#5
8224  1852 2407          	jruge	L1524
8226  1854 c60004        	ld	a,_uc_Test_Page_Now
8227  1857 a102          	cp	a,#2
8228  1859 2713          	jreq	L7424
8229  185b               L1524:
8231  185b 7b16          	ld	a,(OFST+0,sp)
8232  185d a105          	cp	a,#5
8233  185f 2523          	jrult	L3424
8235  1861 7b16          	ld	a,(OFST+0,sp)
8236  1863 a109          	cp	a,#9
8237  1865 241d          	jruge	L3424
8239  1867 c60004        	ld	a,_uc_Test_Page_Now
8240  186a a103          	cp	a,#3
8241  186c 2616          	jrne	L3424
8242  186e               L7424:
8243                     ; 1272 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8245  186e 7b16          	ld	a,(OFST+0,sp)
8246  1870 5f            	clrw	x
8247  1871 97            	ld	xl,a
8248  1872 5a            	decw	x
8249  1873 a604          	ld	a,#4
8250  1875 cd0000        	call	c_smodx
8252  1878 d60000        	ld	a,(_LCD_Line,x)
8253  187b cd0000        	call	_Set_LCD_Address
8255                     ; 1273 					Display_LCD_String("Flt_HVLow");
8257  187e ae00a4        	ldw	x,#L1623
8258  1881 cd0000        	call	_Display_LCD_String
8260  1884               L3424:
8261                     ; 1277 			if(can_diag[0] & (U8)(0x10)){
8263  1884 7b03          	ld	a,(OFST-19,sp)
8264  1886 a510          	bcp	a,#16
8265  1888 273c          	jreq	L5524
8266                     ; 1278 				uc_fault_cnt++;
8268  188a 0c16          	inc	(OFST+0,sp)
8270                     ; 1279 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8270                     ; 1280 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8270                     ; 1281 				){
8272  188c 0d16          	tnz	(OFST+0,sp)
8273  188e 270d          	jreq	L3624
8275  1890 7b16          	ld	a,(OFST+0,sp)
8276  1892 a105          	cp	a,#5
8277  1894 2407          	jruge	L3624
8279  1896 c60004        	ld	a,_uc_Test_Page_Now
8280  1899 a102          	cp	a,#2
8281  189b 2713          	jreq	L1624
8282  189d               L3624:
8284  189d 7b16          	ld	a,(OFST+0,sp)
8285  189f a105          	cp	a,#5
8286  18a1 2523          	jrult	L5524
8288  18a3 7b16          	ld	a,(OFST+0,sp)
8289  18a5 a109          	cp	a,#9
8290  18a7 241d          	jruge	L5524
8292  18a9 c60004        	ld	a,_uc_Test_Page_Now
8293  18ac a103          	cp	a,#3
8294  18ae 2616          	jrne	L5524
8295  18b0               L1624:
8296                     ; 1282 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
8298  18b0 7b16          	ld	a,(OFST+0,sp)
8299  18b2 5f            	clrw	x
8300  18b3 97            	ld	xl,a
8301  18b4 5a            	decw	x
8302  18b5 a604          	ld	a,#4
8303  18b7 cd0000        	call	c_smodx
8305  18ba d60000        	ld	a,(_LCD_Line,x)
8306  18bd cd0000        	call	_Set_LCD_Address
8308                     ; 1283 					Display_LCD_String("Flt_HVHigh");
8310  18c0 ae0099        	ldw	x,#L5723
8311  18c3 cd0000        	call	_Display_LCD_String
8313  18c6               L5524:
8314                     ; 1287 			if(can_data[7] & (U8)(0x2)){
8316  18c6 7b14          	ld	a,(OFST-2,sp)
8317  18c8 a502          	bcp	a,#2
8318  18ca 273c          	jreq	L7624
8319                     ; 1288 				uc_fault_cnt++;
8321  18cc 0c16          	inc	(OFST+0,sp)
8323                     ; 1289 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8323                     ; 1290 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8323                     ; 1291 				){
8325  18ce 0d16          	tnz	(OFST+0,sp)
8326  18d0 270d          	jreq	L5724
8328  18d2 7b16          	ld	a,(OFST+0,sp)
8329  18d4 a105          	cp	a,#5
8330  18d6 2407          	jruge	L5724
8332  18d8 c60004        	ld	a,_uc_Test_Page_Now
8333  18db a102          	cp	a,#2
8334  18dd 2713          	jreq	L3724
8335  18df               L5724:
8337  18df 7b16          	ld	a,(OFST+0,sp)
8338  18e1 a105          	cp	a,#5
8339  18e3 2523          	jrult	L7624
8341  18e5 7b16          	ld	a,(OFST+0,sp)
8342  18e7 a109          	cp	a,#9
8343  18e9 241d          	jruge	L7624
8345  18eb c60004        	ld	a,_uc_Test_Page_Now
8346  18ee a103          	cp	a,#3
8347  18f0 2616          	jrne	L7624
8348  18f2               L3724:
8349                     ; 1292 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8351  18f2 7b16          	ld	a,(OFST+0,sp)
8352  18f4 5f            	clrw	x
8353  18f5 97            	ld	xl,a
8354  18f6 5a            	decw	x
8355  18f7 a604          	ld	a,#4
8356  18f9 cd0000        	call	c_smodx
8358  18fc d60000        	ld	a,(_LCD_Line,x)
8359  18ff cd0000        	call	_Set_LCD_Address
8361                     ; 1293 					Display_LCD_String("Flt_OverCur");
8363  1902 ae008d        	ldw	x,#L1133
8364  1905 cd0000        	call	_Display_LCD_String
8366  1908               L7624:
8367                     ; 1296 			if(can_data[7] & (U8)(0x1)){
8369  1908 7b14          	ld	a,(OFST-2,sp)
8370  190a a501          	bcp	a,#1
8371  190c 273c          	jreq	L1034
8372                     ; 1297 				uc_fault_cnt++;
8374  190e 0c16          	inc	(OFST+0,sp)
8376                     ; 1298 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8376                     ; 1299 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8376                     ; 1300 				){
8378  1910 0d16          	tnz	(OFST+0,sp)
8379  1912 270d          	jreq	L7034
8381  1914 7b16          	ld	a,(OFST+0,sp)
8382  1916 a105          	cp	a,#5
8383  1918 2407          	jruge	L7034
8385  191a c60004        	ld	a,_uc_Test_Page_Now
8386  191d a102          	cp	a,#2
8387  191f 2713          	jreq	L5034
8388  1921               L7034:
8390  1921 7b16          	ld	a,(OFST+0,sp)
8391  1923 a105          	cp	a,#5
8392  1925 2523          	jrult	L1034
8394  1927 7b16          	ld	a,(OFST+0,sp)
8395  1929 a109          	cp	a,#9
8396  192b 241d          	jruge	L1034
8398  192d c60004        	ld	a,_uc_Test_Page_Now
8399  1930 a103          	cp	a,#3
8400  1932 2616          	jrne	L1034
8401  1934               L5034:
8402                     ; 1301 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8404  1934 7b16          	ld	a,(OFST+0,sp)
8405  1936 5f            	clrw	x
8406  1937 97            	ld	xl,a
8407  1938 5a            	decw	x
8408  1939 a604          	ld	a,#4
8409  193b cd0000        	call	c_smodx
8411  193e d60000        	ld	a,(_LCD_Line,x)
8412  1941 cd0000        	call	_Set_LCD_Address
8414                     ; 1302 					Display_LCD_String("Flt_ThmShut");
8416  1944 ae0081        	ldw	x,#L5233
8417  1947 cd0000        	call	_Display_LCD_String
8419  194a               L1034:
8420                     ; 1306 			if(can_diag[1] & (U8)(0x1)){
8422  194a 7b04          	ld	a,(OFST-18,sp)
8423  194c a501          	bcp	a,#1
8424  194e 273c          	jreq	L3134
8425                     ; 1307 				uc_fault_cnt++;
8427  1950 0c16          	inc	(OFST+0,sp)
8429                     ; 1308 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8429                     ; 1309 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8429                     ; 1310 				){
8431  1952 0d16          	tnz	(OFST+0,sp)
8432  1954 270d          	jreq	L1234
8434  1956 7b16          	ld	a,(OFST+0,sp)
8435  1958 a105          	cp	a,#5
8436  195a 2407          	jruge	L1234
8438  195c c60004        	ld	a,_uc_Test_Page_Now
8439  195f a102          	cp	a,#2
8440  1961 2713          	jreq	L7134
8441  1963               L1234:
8443  1963 7b16          	ld	a,(OFST+0,sp)
8444  1965 a105          	cp	a,#5
8445  1967 2523          	jrult	L3134
8447  1969 7b16          	ld	a,(OFST+0,sp)
8448  196b a109          	cp	a,#9
8449  196d 241d          	jruge	L3134
8451  196f c60004        	ld	a,_uc_Test_Page_Now
8452  1972 a103          	cp	a,#3
8453  1974 2616          	jrne	L3134
8454  1976               L7134:
8455                     ; 1311 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
8457  1976 7b16          	ld	a,(OFST+0,sp)
8458  1978 5f            	clrw	x
8459  1979 97            	ld	xl,a
8460  197a 5a            	decw	x
8461  197b a604          	ld	a,#4
8462  197d cd0000        	call	c_smodx
8464  1980 d60000        	ld	a,(_LCD_Line,x)
8465  1983 cd0000        	call	_Set_LCD_Address
8467                     ; 1312 					Display_LCD_String("Flt_PCBThmShut");
8469  1986 ae0072        	ldw	x,#L1433
8470  1989 cd0000        	call	_Display_LCD_String
8472  198c               L3134:
8473                     ; 1316 			if(can_diag[1] & (U8)(0x10)){
8475  198c 7b04          	ld	a,(OFST-18,sp)
8476  198e a510          	bcp	a,#16
8477  1990 273c          	jreq	L5234
8478                     ; 1317 				uc_fault_cnt++;
8480  1992 0c16          	inc	(OFST+0,sp)
8482                     ; 1318 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8482                     ; 1319 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8482                     ; 1320 				){
8484  1994 0d16          	tnz	(OFST+0,sp)
8485  1996 270d          	jreq	L3334
8487  1998 7b16          	ld	a,(OFST+0,sp)
8488  199a a105          	cp	a,#5
8489  199c 2407          	jruge	L3334
8491  199e c60004        	ld	a,_uc_Test_Page_Now
8492  19a1 a102          	cp	a,#2
8493  19a3 2713          	jreq	L1334
8494  19a5               L3334:
8496  19a5 7b16          	ld	a,(OFST+0,sp)
8497  19a7 a105          	cp	a,#5
8498  19a9 2523          	jrult	L5234
8500  19ab 7b16          	ld	a,(OFST+0,sp)
8501  19ad a109          	cp	a,#9
8502  19af 241d          	jruge	L5234
8504  19b1 c60004        	ld	a,_uc_Test_Page_Now
8505  19b4 a103          	cp	a,#3
8506  19b6 2616          	jrne	L5234
8507  19b8               L1334:
8508                     ; 1321 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8510  19b8 7b16          	ld	a,(OFST+0,sp)
8511  19ba 5f            	clrw	x
8512  19bb 97            	ld	xl,a
8513  19bc 5a            	decw	x
8514  19bd a604          	ld	a,#4
8515  19bf cd0000        	call	c_smodx
8517  19c2 d60000        	ld	a,(_LCD_Line,x)
8518  19c5 cd0000        	call	_Set_LCD_Address
8520                     ; 1322 					Display_LCD_String("Flt_MsgTimeOut");
8522  19c8 ae0063        	ldw	x,#L5533
8523  19cb cd0000        	call	_Display_LCD_String
8525  19ce               L5234:
8526                     ; 1326 			if(can_diag[1] & (U8)(0x04)){
8528  19ce 7b04          	ld	a,(OFST-18,sp)
8529  19d0 a504          	bcp	a,#4
8530  19d2 273c          	jreq	L7334
8531                     ; 1327 				uc_fault_cnt++;
8533  19d4 0c16          	inc	(OFST+0,sp)
8535                     ; 1328 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8535                     ; 1329 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8535                     ; 1330 				){
8537  19d6 0d16          	tnz	(OFST+0,sp)
8538  19d8 270d          	jreq	L5434
8540  19da 7b16          	ld	a,(OFST+0,sp)
8541  19dc a105          	cp	a,#5
8542  19de 2407          	jruge	L5434
8544  19e0 c60004        	ld	a,_uc_Test_Page_Now
8545  19e3 a102          	cp	a,#2
8546  19e5 2713          	jreq	L3434
8547  19e7               L5434:
8549  19e7 7b16          	ld	a,(OFST+0,sp)
8550  19e9 a105          	cp	a,#5
8551  19eb 2523          	jrult	L7334
8553  19ed 7b16          	ld	a,(OFST+0,sp)
8554  19ef a109          	cp	a,#9
8555  19f1 241d          	jruge	L7334
8557  19f3 c60004        	ld	a,_uc_Test_Page_Now
8558  19f6 a103          	cp	a,#3
8559  19f8 2616          	jrne	L7334
8560  19fa               L3434:
8561                     ; 1331 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8563  19fa 7b16          	ld	a,(OFST+0,sp)
8564  19fc 5f            	clrw	x
8565  19fd 97            	ld	xl,a
8566  19fe 5a            	decw	x
8567  19ff a604          	ld	a,#4
8568  1a01 cd0000        	call	c_smodx
8570  1a04 d60000        	ld	a,(_LCD_Line,x)
8571  1a07 cd0000        	call	_Set_LCD_Address
8573                     ; 1332 					Display_LCD_String("Fail_HVSen");
8575  1a0a ae0058        	ldw	x,#L1733
8576  1a0d cd0000        	call	_Display_LCD_String
8578  1a10               L7334:
8579                     ; 1336 			if(can_diag[1] & (U8)(0x02)){
8581  1a10 7b04          	ld	a,(OFST-18,sp)
8582  1a12 a502          	bcp	a,#2
8583  1a14 273c          	jreq	L1534
8584                     ; 1337 				uc_fault_cnt++;
8586  1a16 0c16          	inc	(OFST+0,sp)
8588                     ; 1338 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8588                     ; 1339 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8588                     ; 1340 				){
8590  1a18 0d16          	tnz	(OFST+0,sp)
8591  1a1a 270d          	jreq	L7534
8593  1a1c 7b16          	ld	a,(OFST+0,sp)
8594  1a1e a105          	cp	a,#5
8595  1a20 2407          	jruge	L7534
8597  1a22 c60004        	ld	a,_uc_Test_Page_Now
8598  1a25 a102          	cp	a,#2
8599  1a27 2713          	jreq	L5534
8600  1a29               L7534:
8602  1a29 7b16          	ld	a,(OFST+0,sp)
8603  1a2b a105          	cp	a,#5
8604  1a2d 2523          	jrult	L1534
8606  1a2f 7b16          	ld	a,(OFST+0,sp)
8607  1a31 a109          	cp	a,#9
8608  1a33 241d          	jruge	L1534
8610  1a35 c60004        	ld	a,_uc_Test_Page_Now
8611  1a38 a103          	cp	a,#3
8612  1a3a 2616          	jrne	L1534
8613  1a3c               L5534:
8614                     ; 1341 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8616  1a3c 7b16          	ld	a,(OFST+0,sp)
8617  1a3e 5f            	clrw	x
8618  1a3f 97            	ld	xl,a
8619  1a40 5a            	decw	x
8620  1a41 a604          	ld	a,#4
8621  1a43 cd0000        	call	c_smodx
8623  1a46 d60000        	ld	a,(_LCD_Line,x)
8624  1a49 cd0000        	call	_Set_LCD_Address
8626                     ; 1342 					Display_LCD_String("Fail_LVSen");
8628  1a4c ae004d        	ldw	x,#L5043
8629  1a4f cd0000        	call	_Display_LCD_String
8631  1a52               L1534:
8632                     ; 1346 			if(can_data[7] & (U8)(0x04)){
8634  1a52 7b14          	ld	a,(OFST-2,sp)
8635  1a54 a504          	bcp	a,#4
8636  1a56 273c          	jreq	L3634
8637                     ; 1347 				uc_fault_cnt++;
8639  1a58 0c16          	inc	(OFST+0,sp)
8641                     ; 1348 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8641                     ; 1349 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8641                     ; 1350 				){
8643  1a5a 0d16          	tnz	(OFST+0,sp)
8644  1a5c 270d          	jreq	L1734
8646  1a5e 7b16          	ld	a,(OFST+0,sp)
8647  1a60 a105          	cp	a,#5
8648  1a62 2407          	jruge	L1734
8650  1a64 c60004        	ld	a,_uc_Test_Page_Now
8651  1a67 a102          	cp	a,#2
8652  1a69 2713          	jreq	L7634
8653  1a6b               L1734:
8655  1a6b 7b16          	ld	a,(OFST+0,sp)
8656  1a6d a105          	cp	a,#5
8657  1a6f 2523          	jrult	L3634
8659  1a71 7b16          	ld	a,(OFST+0,sp)
8660  1a73 a109          	cp	a,#9
8661  1a75 241d          	jruge	L3634
8663  1a77 c60004        	ld	a,_uc_Test_Page_Now
8664  1a7a a103          	cp	a,#3
8665  1a7c 2616          	jrne	L3634
8666  1a7e               L7634:
8667                     ; 1351 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8669  1a7e 7b16          	ld	a,(OFST+0,sp)
8670  1a80 5f            	clrw	x
8671  1a81 97            	ld	xl,a
8672  1a82 5a            	decw	x
8673  1a83 a604          	ld	a,#4
8674  1a85 cd0000        	call	c_smodx
8676  1a88 d60000        	ld	a,(_LCD_Line,x)
8677  1a8b cd0000        	call	_Set_LCD_Address
8679                     ; 1352 					Display_LCD_String("Fail_CurSen");
8681  1a8e ae0041        	ldw	x,#L1243
8682  1a91 cd0000        	call	_Display_LCD_String
8684  1a94               L3634:
8685                     ; 1358 			if(can_data[7] & (U8)(0x08)){
8687  1a94 7b14          	ld	a,(OFST-2,sp)
8688  1a96 a508          	bcp	a,#8
8689  1a98 273c          	jreq	L5734
8690                     ; 1360 				uc_fault_cnt++;
8692  1a9a 0c16          	inc	(OFST+0,sp)
8694                     ; 1361 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8694                     ; 1362 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8694                     ; 1363 				){
8696  1a9c 0d16          	tnz	(OFST+0,sp)
8697  1a9e 270d          	jreq	L3044
8699  1aa0 7b16          	ld	a,(OFST+0,sp)
8700  1aa2 a105          	cp	a,#5
8701  1aa4 2407          	jruge	L3044
8703  1aa6 c60004        	ld	a,_uc_Test_Page_Now
8704  1aa9 a102          	cp	a,#2
8705  1aab 2713          	jreq	L1044
8706  1aad               L3044:
8708  1aad 7b16          	ld	a,(OFST+0,sp)
8709  1aaf a105          	cp	a,#5
8710  1ab1 2523          	jrult	L5734
8712  1ab3 7b16          	ld	a,(OFST+0,sp)
8713  1ab5 a109          	cp	a,#9
8714  1ab7 241d          	jruge	L5734
8716  1ab9 c60004        	ld	a,_uc_Test_Page_Now
8717  1abc a103          	cp	a,#3
8718  1abe 2616          	jrne	L5734
8719  1ac0               L1044:
8720                     ; 1364 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
8722  1ac0 7b16          	ld	a,(OFST+0,sp)
8723  1ac2 5f            	clrw	x
8724  1ac3 97            	ld	xl,a
8725  1ac4 5a            	decw	x
8726  1ac5 a604          	ld	a,#4
8727  1ac7 cd0000        	call	c_smodx
8729  1aca d60000        	ld	a,(_LCD_Line,x)
8730  1acd cd0000        	call	_Set_LCD_Address
8732                     ; 1365 					Display_LCD_String("Fail_CoreTemp");
8734  1ad0 ae0033        	ldw	x,#L5343
8735  1ad3 cd0000        	call	_Display_LCD_String
8737  1ad6               L5734:
8738                     ; 1371 			if(can_diag[1] & (U8)(0x8)){
8740  1ad6 7b04          	ld	a,(OFST-18,sp)
8741  1ad8 a508          	bcp	a,#8
8742  1ada 273c          	jreq	L7044
8743                     ; 1373 				uc_fault_cnt++;
8745  1adc 0c16          	inc	(OFST+0,sp)
8747                     ; 1374 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8747                     ; 1375 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8747                     ; 1376 				){
8749  1ade 0d16          	tnz	(OFST+0,sp)
8750  1ae0 270d          	jreq	L5144
8752  1ae2 7b16          	ld	a,(OFST+0,sp)
8753  1ae4 a105          	cp	a,#5
8754  1ae6 2407          	jruge	L5144
8756  1ae8 c60004        	ld	a,_uc_Test_Page_Now
8757  1aeb a102          	cp	a,#2
8758  1aed 2713          	jreq	L3144
8759  1aef               L5144:
8761  1aef 7b16          	ld	a,(OFST+0,sp)
8762  1af1 a105          	cp	a,#5
8763  1af3 2523          	jrult	L7044
8765  1af5 7b16          	ld	a,(OFST+0,sp)
8766  1af7 a109          	cp	a,#9
8767  1af9 241d          	jruge	L7044
8769  1afb c60004        	ld	a,_uc_Test_Page_Now
8770  1afe a103          	cp	a,#3
8771  1b00 2616          	jrne	L7044
8772  1b02               L3144:
8773                     ; 1377 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8775  1b02 7b16          	ld	a,(OFST+0,sp)
8776  1b04 5f            	clrw	x
8777  1b05 97            	ld	xl,a
8778  1b06 5a            	decw	x
8779  1b07 a604          	ld	a,#4
8780  1b09 cd0000        	call	c_smodx
8782  1b0c d60000        	ld	a,(_LCD_Line,x)
8783  1b0f cd0000        	call	_Set_LCD_Address
8785                     ; 1378 					Display_LCD_String("Fail_PCB1Temp");
8787  1b12 ae0025        	ldw	x,#L1543
8788  1b15 cd0000        	call	_Display_LCD_String
8790  1b18               L7044:
8791                     ; 1384 			if(can_data[5] == (U8)(0xff)){
8793  1b18 7b12          	ld	a,(OFST-4,sp)
8794  1b1a a1ff          	cp	a,#255
8795  1b1c 263c          	jrne	L1244
8796                     ; 1386 				uc_fault_cnt++;
8798  1b1e 0c16          	inc	(OFST+0,sp)
8800                     ; 1387 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
8800                     ; 1388 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
8800                     ; 1389 				){
8802  1b20 0d16          	tnz	(OFST+0,sp)
8803  1b22 270d          	jreq	L7244
8805  1b24 7b16          	ld	a,(OFST+0,sp)
8806  1b26 a105          	cp	a,#5
8807  1b28 2407          	jruge	L7244
8809  1b2a c60004        	ld	a,_uc_Test_Page_Now
8810  1b2d a102          	cp	a,#2
8811  1b2f 2713          	jreq	L5244
8812  1b31               L7244:
8814  1b31 7b16          	ld	a,(OFST+0,sp)
8815  1b33 a105          	cp	a,#5
8816  1b35 2523          	jrult	L1244
8818  1b37 7b16          	ld	a,(OFST+0,sp)
8819  1b39 a109          	cp	a,#9
8820  1b3b 241d          	jruge	L1244
8822  1b3d c60004        	ld	a,_uc_Test_Page_Now
8823  1b40 a103          	cp	a,#3
8824  1b42 2616          	jrne	L1244
8825  1b44               L5244:
8826                     ; 1390 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
8828  1b44 7b16          	ld	a,(OFST+0,sp)
8829  1b46 5f            	clrw	x
8830  1b47 97            	ld	xl,a
8831  1b48 5a            	decw	x
8832  1b49 a604          	ld	a,#4
8833  1b4b cd0000        	call	c_smodx
8835  1b4e d60000        	ld	a,(_LCD_Line,x)
8836  1b51 cd0000        	call	_Set_LCD_Address
8838                     ; 1391 					Display_LCD_String("Fail_IGBT");
8840  1b54 ae001b        	ldw	x,#L5643
8841  1b57 cd0000        	call	_Display_LCD_String
8843  1b5a               L1244:
8844                     ; 1405 			if(!uc_fault_cnt){
8846  1b5a 0d16          	tnz	(OFST+0,sp)
8847  1b5c 260c          	jrne	L3514
8848                     ; 1406 				Set_LCD_Address(LCD_Line[0]);
8850  1b5e c60000        	ld	a,_LCD_Line
8851  1b61 cd0000        	call	_Set_LCD_Address
8853                     ; 1407 				Display_LCD_String("Normal");
8855  1b64 ae0006        	ldw	x,#L5053
8856  1b67 cd0000        	call	_Display_LCD_String
8858  1b6a               L3514:
8859                     ; 1412 	if((b_Com_On_flag == ON)){
8861  1b6a c6000d        	ld	a,_uc_Test_Ctrl_Reg
8862  1b6d a508          	bcp	a,#8
8863  1b6f 270d          	jreq	L5344
8864                     ; 1413 		Set_LCD_Address((unsigned char)(0x00+15));
8866  1b71 a60f          	ld	a,#15
8867  1b73 cd0000        	call	_Set_LCD_Address
8869                     ; 1416 		Display_LCD_String("Y");	// YJS 20230314
8871  1b76 ae0004        	ldw	x,#L1153
8872  1b79 cd0000        	call	_Display_LCD_String
8875  1b7c 200b          	jra	L7344
8876  1b7e               L5344:
8877                     ; 1418 		Set_LCD_Address((unsigned char)(0x00+15));
8879  1b7e a60f          	ld	a,#15
8880  1b80 cd0000        	call	_Set_LCD_Address
8882                     ; 1419 		Display_LCD_String("N");
8884  1b83 ae00c7        	ldw	x,#L7013
8885  1b86 cd0000        	call	_Display_LCD_String
8887  1b89               L7344:
8888                     ; 1422 	return;
8889  1b89               L431:
8892  1b89 5b16          	addw	sp,#22
8893  1b8b 81            	ret
8919                     ; 1425 void Test_Controller_Routine(void)
8919                     ; 1426 {
8920                     	switch	.text
8921  1b8c               _Test_Controller_Routine:
8925                     ; 1430 	SU2I_Ctrl_LCD_Display_Control();
8927  1b8c cd106d        	call	L5153_SU2I_Ctrl_LCD_Display_Control
8929                     ; 1432 	Test_Ctrl_Swtich_Control();
8931  1b8f cd02fc        	call	_Test_Ctrl_Swtich_Control
8933                     ; 1434 	return;
8936  1b92 81            	ret
8972                     ; 1439 void Test_Ctrl_Reset_Values(void)
8972                     ; 1440 {
8973                     	switch	.text
8974  1b93               _Test_Ctrl_Reset_Values:
8978                     ; 1441 	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
8980  1b93 725f000d      	clr	_uc_Test_Ctrl_Reg
8981                     ; 1442 	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
8983  1b97 725f000e      	clr	_uc_Model_Select_Reg
8984                     ; 1443 	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register
8986  1b9b 725f000c      	clr	_uc_Rx_TimeOut_Reg
8987                     ; 1445 	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
8989  1b9f 725f0004      	clr	_uc_Test_Page_Now
8990                     ; 1446 	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
8992  1ba3 725f0003      	clr	_uc_Test_Page_Pre
8993                     ; 1447 	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number
8995  1ba7 725f0002      	clr	_uc_Test_Data_Select_Num
8996                     ; 1449 	uc_Perc_Unit = 1;		// Duty_Moving_Unit
8998  1bab 35010001      	mov	_uc_Perc_Unit,#1
8999                     ; 1451 	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
9001  1baf 5f            	clrw	x
9002  1bb0 cf0007        	ldw	_ui_Rx1_TimeOut_Cnt,x
9003                     ; 1452 	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter
9005  1bb3 5f            	clrw	x
9006  1bb4 cf0005        	ldw	_ui_Rx2_TimeOut_Cnt,x
9007                     ; 1454 	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
9009  1bb7 725f0009      	clr	_uc_Heater_Enable_Flag
9010                     ; 1455 	uc_Target_Duty_Perc[HTR_ZONE_1] = 0;		// Target_Duty_Percentage
9012  1bbb 725f000a      	clr	_uc_Target_Duty_Perc
9013                     ; 1456 	uc_Target_Duty_Perc[HTR_ZONE_2] = 0;		// Target_Duty_Percentage
9015  1bbf 725f000b      	clr	_uc_Target_Duty_Perc+1
9016                     ; 1457 	HEATER_zone_status=HTR_ZONE_1;
9018  1bc3 725f0000      	clr	_HEATER_zone_status
9019                     ; 1458 	return;
9022  1bc7 81            	ret
9162                     	xdef	_Test_Ctrl_Text_Display_Handling
9163                     	xdef	_Test_Ctrl_Swtich_Control
9164                     	xdef	_Test_Ctrl_Value_Change
9165                     	xdef	_Model_Select_LCD_Display_Control
9166                     	xdef	_Model_Select_Switch_Control
9167                     	xdef	_Model_Select_Display_Handling
9168                     	xdef	_First_Switch_Control
9169                     	switch	.bss
9170  0000               _uc_Target_Display_Mode:
9171  0000 00            	ds.b	1
9172                     	xdef	_uc_Target_Display_Mode
9173  0001               _uc_Perc_Unit:
9174  0001 00            	ds.b	1
9175                     	xdef	_uc_Perc_Unit
9176  0002               _uc_Test_Data_Select_Num:
9177  0002 00            	ds.b	1
9178                     	xdef	_uc_Test_Data_Select_Num
9179  0003               _uc_Test_Page_Pre:
9180  0003 00            	ds.b	1
9181                     	xdef	_uc_Test_Page_Pre
9182  0004               _uc_Test_Page_Now:
9183  0004 00            	ds.b	1
9184                     	xdef	_uc_Test_Page_Now
9185                     	xref	_Start_Zig_Display
9186                     	xref	_HEATER_zone_status
9187                     	xdef	_Test_Ctrl_Reset_Values
9188                     	xdef	_Test_Controller_Routine
9189                     	xdef	_Model_Select_Routine
9190                     	xdef	_Test_Controller_First_Routine
9191  0005               _ui_Rx2_TimeOut_Cnt:
9192  0005 0000          	ds.b	2
9193                     	xdef	_ui_Rx2_TimeOut_Cnt
9194  0007               _ui_Rx1_TimeOut_Cnt:
9195  0007 0000          	ds.b	2
9196                     	xdef	_ui_Rx1_TimeOut_Cnt
9197                     	xdef	_uc_Rx_Data
9198  0009               _uc_Heater_Enable_Flag:
9199  0009 00            	ds.b	1
9200                     	xdef	_uc_Heater_Enable_Flag
9201  000a               _uc_Target_Duty_Perc:
9202  000a 0000          	ds.b	2
9203                     	xdef	_uc_Target_Duty_Perc
9204  000c               _uc_Rx_TimeOut_Reg:
9205  000c 00            	ds.b	1
9206                     	xdef	_uc_Rx_TimeOut_Reg
9207  000d               _uc_Test_Ctrl_Reg:
9208  000d 00            	ds.b	1
9209                     	xdef	_uc_Test_Ctrl_Reg
9210  000e               _uc_Model_Select_Reg:
9211  000e 00            	ds.b	1
9212                     	xdef	_uc_Model_Select_Reg
9213                     	xref	_uc_Button_Status_Reg
9214                     	xref	_Num_Display_LCD
9215                     	xref	_Display_LCD_String
9216                     	xref	_Set_LCD_Address
9217                     	xref	_LCD_Dis_Data
9218                     	xref	_LCD_Line
9219                     	xref	_uc_LCD_Blink_Reg
9220                     	xref	_uc_System_Ctrl_Reg
9221                     	switch	.const
9222  0004               L1153:
9223  0004 5900          	dc.b	"Y",0
9224  0006               L5053:
9225  0006 4e6f726d616c  	dc.b	"Normal",0
9226  000d               L1053:
9227  000d 4661696c5f6f  	dc.b	"Fail_openLoad",0
9228  001b               L5643:
9229  001b 4661696c5f49  	dc.b	"Fail_IGBT",0
9230  0025               L1543:
9231  0025 4661696c5f50  	dc.b	"Fail_PCB1Temp",0
9232  0033               L5343:
9233  0033 4661696c5f43  	dc.b	"Fail_CoreTemp",0
9234  0041               L1243:
9235  0041 4661696c5f43  	dc.b	"Fail_CurSen",0
9236  004d               L5043:
9237  004d 4661696c5f4c  	dc.b	"Fail_LVSen",0
9238  0058               L1733:
9239  0058 4661696c5f48  	dc.b	"Fail_HVSen",0
9240  0063               L5533:
9241  0063 466c745f4d73  	dc.b	"Flt_MsgTimeOut",0
9242  0072               L1433:
9243  0072 466c745f5043  	dc.b	"Flt_PCBThmShut",0
9244  0081               L5233:
9245  0081 466c745f5468  	dc.b	"Flt_ThmShut",0
9246  008d               L1133:
9247  008d 466c745f4f76  	dc.b	"Flt_OverCur",0
9248  0099               L5723:
9249  0099 466c745f4856  	dc.b	"Flt_HVHigh",0
9250  00a4               L1623:
9251  00a4 466c745f4856  	dc.b	"Flt_HVLow",0
9252  00ae               L5423:
9253  00ae 466c745f4c56  	dc.b	"Flt_LVHigh",0
9254  00b9               L1323:
9255  00b9 466c745f4c56  	dc.b	"Flt_LVLow",0
9256  00c3               L3713:
9257  00c3 2d00          	dc.b	"-",0
9258  00c5               L5113:
9259  00c5 3100          	dc.b	"1",0
9260  00c7               L7013:
9261  00c7 4e00          	dc.b	"N",0
9262  00c9               L7472:
9263  00c9 4d415800      	dc.b	"MAX",0
9264  00cd               L1762:
9265  00cd 4c6d697400    	dc.b	"Lmit",0
9266  00d2               L3662:
9267  00d2 466c7400      	dc.b	"Flt",0
9268  00d6               L5562:
9269  00d6 4f70657200    	dc.b	"Oper",0
9270  00db               L7462:
9271  00db 53746f7000    	dc.b	"Stop",0
9272  00e0               L1462:
9273  00e0 4e4300        	dc.b	"NC",0
9274  00e3               L5362:
9275  00e3 5a3200        	dc.b	"Z2",0
9276  00e6               L1362:
9277  00e6 5a3100        	dc.b	"Z1",0
9278  00e9               L1162:
9279  00e9 202020202020  	dc.b	"        Fd:",0
9280  00f5               L7752:
9281  00f5 202020202020  	dc.b	"        /",0
9282  00ff               L1552:
9283  00ff 2500          	dc.b	"%",0
9284  0101               L7452:
9285  0101 3000          	dc.b	"0",0
9286  0103               L3452:
9287  0103 3500          	dc.b	"5",0
9288  0105               L7352:
9289  0105 2e00          	dc.b	".",0
9290  0107               L3352:
9291  0107 445f556e6974  	dc.b	"D_Unit:",0
9292  010f               L1352:
9293  010f 2a5461726765  	dc.b	"*Target Watt(OS)",0
9294  0120               L5252:
9295  0120 2a5461726765  	dc.b	"*Target Perc",0
9296  012d               L1252:
9297  012d 2a4f5054494f  	dc.b	"*OPTION*",0
9298  0136               L1442:
9299  0136 5665723a00    	dc.b	"Ver:",0
9300  013b               L7342:
9301  013b 43743a00      	dc.b	"Ct:",0
9302  013f               L5342:
9303  013f 43723a202020  	dc.b	"Cr:     Pw:",0
9304  014b               L3342:
9305  014b 523a2020463a  	dc.b	"R:  F:  HV:",0
9306  0157               L1342:
9307  0157 54703a202020  	dc.b	"Tp:     Fd:",0
9308  0163               L5242:
9309  0163 54643a202020  	dc.b	"Td:     Fd:",0
9310  016f               L1242:
9311  016f 416c3a202020  	dc.b	"Al:     /",0
9312  0179               L5571:
9313  0179 00            	dc.b	0
9314  017a               L3571:
9315  017a 2a4856434320  	dc.b	"*HVCC Model*",0
9316                     	xref.b	c_lreg
9317                     	xref.b	c_x
9318                     	xref.b	c_y
9338                     	xref	c_smodx
9339                     	xref	c_sdivx
9340                     	xref	c_ludv
9341                     	xref	c_umul
9342                     	xref	c_strcpx
9343                     	end

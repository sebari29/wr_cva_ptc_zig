   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _uc_Rx1_Lin_Data:
2660  0000 00            	dc.b	0
2661  0001 00000000      	ds.b	4
2662  0005               _uc_Rx2_Lin_Data:
2663  0005 00            	dc.b	0
2664  0006 000000000000  	ds.b	7
2700                     ; 37 void First_Switch_Control(void)
2700                     ; 38 {
2701                     	switch	.text
2702  0000               f_First_Switch_Control:
2706                     ; 39 	if(b_ENTER_Button_Flag){
2708  0000 720b000018    	btjf	_uc_Button_Status_Reg,#5,L1271
2709                     ; 40 		b_First_Logic_On = ON;
2711  0005 72100000      	bset	_uc_System_Ctrl_Reg,#0
2712                     ; 41 		b_Model_Select_flag = ON;
2714  0009 7210000b      	bset	_uc_Test_Ctrl_Reg,#0
2715                     ; 42 		b_Data_Select_flag = ON;
2717  000d 7212000b      	bset	_uc_Test_Ctrl_Reg,#1
2718                     ; 44 		uc_Test_Page_Pre = (U8)(1);
2720  0011 35010002      	mov	_uc_Test_Page_Pre,#1
2721                     ; 45 		uc_Test_Data_Select_Num = (U8)(1);
2723  0015 35010001      	mov	_uc_Test_Data_Select_Num,#1
2724                     ; 47 		b_ENTER_Button_Flag = OFF;
2726  0019 721b0000      	bres	_uc_Button_Status_Reg,#5
2727  001d               L1271:
2728                     ; 50 	return;
2731  001d 87            	retf	
2756                     ; 55 void Test_Controller_First_Routine(void)
2756                     ; 56 {
2757                     	switch	.text
2758  001e               f_Test_Controller_First_Routine:
2762                     ; 57 	Start_Zig_Display();
2764  001e 8d000000      	callf	f_Start_Zig_Display
2766                     ; 58 	First_Switch_Control();
2769                     ; 60 	return;
2772  0022 20dc          	jpf	f_First_Switch_Control
2798                     ; 66 void Model_Select_Display_Handling(void)
2798                     ; 67 {
2799                     	switch	.text
2800  0024               f_Model_Select_Display_Handling:
2804                     ; 68 	switch(uc_Test_Page_Now){
2806  0024 725d0003      	tnz	_uc_Test_Page_Now
2807  0028 261d          	jrne	L5371
2810                     ; 71 		case 0:	strcpy(LCD_Dis_Data[0],"*FCA520 Model*");	
2812  002a ae015b        	ldw	x,#L3571
2813  002d 89            	pushw	x
2814  002e ae0000        	ldw	x,#_LCD_Dis_Data
2815  0031 8d000000      	callf	f_strcpy
2817  0035 85            	popw	x
2818                     ; 72 				strcpy(LCD_Dis_Data[1],"LDF V02");	// LDF V02 Model
2820  0036 ae0153        	ldw	x,#L5571
2821  0039 89            	pushw	x
2822  003a ae0010        	ldw	x,#_LCD_Dis_Data+16
2823  003d 8d000000      	callf	f_strcpy
2825  0041 85            	popw	x
2826                     ; 73 				strcpy(LCD_Dis_Data[2],"LDF V03");	// LDF V03 Model
2828  0042 ae014b        	ldw	x,#L7571
2830                     ; 74 				strcpy(LCD_Dis_Data[3],"");		
2832                     ; 76 				break;
2834  0045 201b          	jra	L1571
2835  0047               L5371:
2836                     ; 78 		default: 
2836                     ; 79 				strcpy(LCD_Dis_Data[0],"");	// Null
2838  0047 ae014a        	ldw	x,#L1671
2839  004a 89            	pushw	x
2840  004b ae0000        	ldw	x,#_LCD_Dis_Data
2841  004e 8d000000      	callf	f_strcpy
2843  0052 85            	popw	x
2844                     ; 80 				strcpy(LCD_Dis_Data[1],"");	// Null
2846  0053 ae014a        	ldw	x,#L1671
2847  0056 89            	pushw	x
2848  0057 ae0010        	ldw	x,#_LCD_Dis_Data+16
2849  005a 8d000000      	callf	f_strcpy
2851  005e 85            	popw	x
2852                     ; 81 				strcpy(LCD_Dis_Data[2],"");	// Null
2854  005f ae014a        	ldw	x,#L1671
2856                     ; 82 				strcpy(LCD_Dis_Data[3],"");	// Null
2859                     ; 84 				break;
2860  0062               L1571:
2861  0062 89            	pushw	x
2862  0063 ae0020        	ldw	x,#_LCD_Dis_Data+32
2863  0066 8d000000      	callf	f_strcpy
2864  006a 85            	popw	x
2866  006b ae014a        	ldw	x,#L1671
2867  006e 89            	pushw	x
2868  006f ae0030        	ldw	x,#_LCD_Dis_Data+48
2869  0072 8d000000      	callf	f_strcpy
2870  0076 85            	popw	x
2871                     ; 87 	return;
2874  0077 87            	retf	
2902                     ; 93 void Model_Select_Switch_Control(void)
2902                     ; 94 {
2903                     	switch	.text
2904  0078               f_Model_Select_Switch_Control:
2908                     ; 95 	if(b_UP_Button_Flag){
2910  0078 720300001a    	btjf	_uc_Button_Status_Reg,#1,L5771
2911                     ; 97 		if(b_Data_Select_flag){
2913  007d 7203000b11    	btjf	_uc_Test_Ctrl_Reg,#1,L7771
2914                     ; 98 			if(uc_Test_Data_Select_Num > (U8)(1)){ uc_Test_Data_Select_Num--;}
2916  0082 c60001        	ld	a,_uc_Test_Data_Select_Num
2917  0085 a102          	cp	a,#2
2918  0087 2506          	jrult	L1002
2921  0089 725a0001      	dec	_uc_Test_Data_Select_Num
2923  008d 2004          	jra	L7771
2924  008f               L1002:
2925                     ; 99 			else{ uc_Test_Data_Select_Num = (U8)(2); }	// FOR_Rolling
2927  008f 35020001      	mov	_uc_Test_Data_Select_Num,#2
2928  0093               L7771:
2929                     ; 102 		b_UP_Button_Flag = OFF;
2931  0093 72130000      	bres	_uc_Button_Status_Reg,#1
2932  0097               L5771:
2933                     ; 105 	if(b_DOWN_Button_Flag){
2935  0097 720500001a    	btjf	_uc_Button_Status_Reg,#2,L5002
2936                     ; 107 		if(b_Data_Select_flag){
2938  009c 7203000b11    	btjf	_uc_Test_Ctrl_Reg,#1,L7002
2939                     ; 108 			if(uc_Test_Data_Select_Num < (U8)(2)){ uc_Test_Data_Select_Num++;}
2941  00a1 c60001        	ld	a,_uc_Test_Data_Select_Num
2942  00a4 a102          	cp	a,#2
2943  00a6 2406          	jruge	L1102
2946  00a8 725c0001      	inc	_uc_Test_Data_Select_Num
2948  00ac 2004          	jra	L7002
2949  00ae               L1102:
2950                     ; 109 			else{ uc_Test_Data_Select_Num = (U8)(1); }	// FOR_Rolling
2952  00ae 35010001      	mov	_uc_Test_Data_Select_Num,#1
2953  00b2               L7002:
2954                     ; 112 		b_DOWN_Button_Flag = OFF;
2956  00b2 72150000      	bres	_uc_Button_Status_Reg,#2
2957  00b6               L5002:
2958                     ; 115 	if(b_ENTER_Button_Flag){
2960  00b6 720b00002b    	btjf	_uc_Button_Status_Reg,#5,L5102
2961                     ; 117 		b_Model_Select_flag = OFF;
2963  00bb 7211000b      	bres	_uc_Test_Ctrl_Reg,#0
2964                     ; 118 		b_Data_Select_flag= OFF;
2966  00bf 7213000b      	bres	_uc_Test_Ctrl_Reg,#1
2967                     ; 119 		if(uc_Test_Data_Select_Num == (U8)(1)){ b_LDF_V02_Flag = ON; }
2969  00c3 c60001        	ld	a,_uc_Test_Data_Select_Num
2970  00c6 4a            	dec	a
2971  00c7 2606          	jrne	L7102
2974  00c9 7210000c      	bset	_uc_Model_Select_Reg,#0
2976  00cd 200b          	jra	L1202
2977  00cf               L7102:
2978                     ; 120 		else if(uc_Test_Data_Select_Num == (U8)(2)){ b_LDF_V03_Flag = ON; }
2980  00cf c60001        	ld	a,_uc_Test_Data_Select_Num
2981  00d2 a102          	cp	a,#2
2982  00d4 2604          	jrne	L1202
2985  00d6 7212000c      	bset	_uc_Model_Select_Reg,#1
2986  00da               L1202:
2987                     ; 122 		uc_Test_Page_Pre = (U8)(1);
2989  00da 35010002      	mov	_uc_Test_Page_Pre,#1
2990                     ; 123 		uc_Test_Data_Select_Num = (U8)(0);
2992  00de 725f0001      	clr	_uc_Test_Data_Select_Num
2993                     ; 125 		b_ENTER_Button_Flag = OFF;
2995  00e2 721b0000      	bres	_uc_Button_Status_Reg,#5
2996  00e6               L5102:
2997                     ; 129 	return;
3000  00e6 87            	retf	
3042                     ; 135 void Model_Select_LCD_Display_Control(void)
3042                     ; 136 {
3043                     	switch	.text
3044  00e7               f_Model_Select_LCD_Display_Control:
3046  00e7 88            	push	a
3047       00000001      OFST:	set	1
3050                     ; 139 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Model_Select_Display_Handling();}
3052  00e8 c60003        	ld	a,_uc_Test_Page_Now
3053  00eb c10002        	cp	a,_uc_Test_Page_Pre
3054  00ee 2704          	jreq	L1402
3057  00f0 8d240024      	callf	f_Model_Select_Display_Handling
3059  00f4               L1402:
3060                     ; 140 	uc_Test_Page_Pre = uc_Test_Page_Now ;
3062  00f4 5500030002    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
3063                     ; 143 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
3065  00f9 725d0003      	tnz	_uc_Test_Page_Now
3066  00fd 2634          	jrne	L3402
3067                     ; 144 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3069  00ff 4f            	clr	a
3070  0100 6b01          	ld	(OFST+0,sp),a
3071  0102               L5402:
3072                     ; 145 			Set_LCD_Address(LCD_Line[uc_line_index]);
3074  0102 5f            	clrw	x
3075  0103 97            	ld	xl,a
3076  0104 d60000        	ld	a,(_LCD_Line,x)
3077  0107 8d000000      	callf	f_Set_LCD_Address
3079                     ; 147 			if((b_Data_Select_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
3081  010b 7203000b0e    	btjf	_uc_Test_Ctrl_Reg,#1,L3502
3083  0110 7b01          	ld	a,(OFST+0,sp)
3084  0112 c10001        	cp	a,_uc_Test_Data_Select_Num
3085  0115 2607          	jrne	L3502
3086                     ; 148 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3088  0117 720300000f    	btjf	_uc_LCD_Blink_Reg,#1,L7502
3091  011c 2002          	jpf	LC001
3092  011e               L3502:
3093                     ; 149 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3095  011e 7b01          	ld	a,(OFST+0,sp)
3096  0120               LC001:
3098  0120 97            	ld	xl,a
3099  0121 a610          	ld	a,#16
3100  0123 42            	mul	x,a
3101  0124 1c0000        	addw	x,#_LCD_Dis_Data
3102  0127 8d000000      	callf	f_Display_LCD_String
3104  012b               L7502:
3105                     ; 144 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3107  012b 0c01          	inc	(OFST+0,sp)
3110  012d 7b01          	ld	a,(OFST+0,sp)
3111  012f a104          	cp	a,#4
3112  0131 25cf          	jrult	L5402
3113  0133               L3402:
3114                     ; 153 	return;
3117  0133 84            	pop	a
3118  0134 87            	retf	
3143                     ; 158 void Model_Select_Routine(void)
3143                     ; 159 {
3144                     	switch	.text
3145  0135               f_Model_Select_Routine:
3149                     ; 160 	Model_Select_LCD_Display_Control();
3151  0135 8de700e7      	callf	f_Model_Select_LCD_Display_Control
3153                     ; 161 	Model_Select_Switch_Control();	
3156                     ; 163 	return;
3159  0139 ac780078      	jpf	f_Model_Select_Switch_Control
3203                     ; 169 void Test_Ctrl_Value_Change(U8 uc_st)
3203                     ; 170 {
3204                     	switch	.text
3205  013d               f_Test_Ctrl_Value_Change:
3207  013d 88            	push	a
3208  013e 89            	pushw	x
3209       00000002      OFST:	set	2
3212                     ; 175 	if(uc_st == 1){	
3214  013f 4a            	dec	a
3215  0140 263a          	jrne	L7012
3216                     ; 176 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; 	}
3218  0142 725d0001      	tnz	_uc_Test_Data_Select_Num
3221  0146 273e          	jreq	LC004
3222                     ; 177 		else if(uc_Test_Data_Select_Num == (U8)(1)){
3224  0148 c60001        	ld	a,_uc_Test_Data_Select_Num
3225  014b 4a            	dec	a
3226  014c 265f          	jrne	L5312
3227                     ; 178 			ui_buffer = (U8)(uc_target_Power_Perc + uc_Duty_Unit);
3229  014e c60008        	ld	a,_uc_target_Power_Perc
3230  0151 cb0000        	add	a,_uc_Duty_Unit
3231  0154 5f            	clrw	x
3232  0155 97            	ld	xl,a
3233  0156 1f01          	ldw	(OFST-1,sp),x
3234                     ; 180 			if(b_LDF_V02_Flag){
3236  0158 7201000c0b    	btjf	_uc_Model_Select_Reg,#0,L7112
3237                     ; 181 				if(ui_buffer >= (U16)(254)){ uc_target_Power_Perc = (U16)(254); }
3239  015d a300fe        	cpw	x,#254
3240  0160 2516          	jrult	L1312
3243  0162 35fe0008      	mov	_uc_target_Power_Perc,#254
3245  0166 2045          	jra	L5312
3246                     ; 182 				else{ uc_target_Power_Perc = (U8)(ui_buffer); }
3247  0168               L7112:
3248                     ; 184 			else if(b_LDF_V03_Flag){
3250  0168 7203000c40    	btjf	_uc_Model_Select_Reg,#1,L5312
3251                     ; 185 				if(ui_buffer >= (U16)(150)){ uc_target_Power_Perc = (U16)(150); }
3253  016d a30096        	cpw	x,#150
3254  0170 2506          	jrult	L1312
3257  0172 35960008      	mov	_uc_target_Power_Perc,#150
3259  0176 2035          	jra	L5312
3260  0178               L1312:
3261                     ; 186 				else{ uc_target_Power_Perc = (U8)(ui_buffer); }
3264  0178 7b02          	ld	a,(OFST+0,sp)
3265  017a 2028          	jpf	LC002
3266  017c               L7012:
3267                     ; 192 	else if(uc_st == 0){	
3269  017c 7b03          	ld	a,(OFST+1,sp)
3270  017e 262d          	jrne	L5312
3271                     ; 193 		if(uc_Test_Data_Select_Num == (U8)(0)){ uc_Heater_Enable_Flag ^= ON; 	}
3273  0180 725d0001      	tnz	_uc_Test_Data_Select_Num
3274  0184 260a          	jrne	L1412
3277  0186               LC004:
3279  0186 c60009        	ld	a,_uc_Heater_Enable_Flag
3280  0189 a801          	xor	a,#1
3281  018b c70009        	ld	_uc_Heater_Enable_Flag,a
3283  018e 201d          	jra	L5312
3284  0190               L1412:
3285                     ; 194 		else if(uc_Test_Data_Select_Num == (U8)(1)){
3287  0190 c60001        	ld	a,_uc_Test_Data_Select_Num
3288  0193 4a            	dec	a
3289  0194 2617          	jrne	L5312
3290                     ; 196 			if(uc_target_Power_Perc >= uc_Duty_Unit){
3292  0196 c60008        	ld	a,_uc_target_Power_Perc
3293  0199 c10000        	cp	a,_uc_Duty_Unit
3294  019c 250b          	jrult	L7412
3295                     ; 197 				uc_target_Power_Perc = (U8)(uc_target_Power_Perc - uc_Duty_Unit);
3297  019e c60008        	ld	a,_uc_target_Power_Perc
3298  01a1 c00000        	sub	a,_uc_Duty_Unit
3299  01a4               LC002:
3300  01a4 c70008        	ld	_uc_target_Power_Perc,a
3302  01a7 2004          	jra	L5312
3303  01a9               L7412:
3304                     ; 199 			else{ uc_target_Power_Perc = 0; }
3306  01a9 725f0008      	clr	_uc_target_Power_Perc
3307  01ad               L5312:
3308                     ; 203 	return ;
3311  01ad 5b03          	addw	sp,#3
3312  01af 87            	retf	
3344                     ; 208 void Test_Ctrl_Swtich_Control(void)
3344                     ; 209 {
3345                     	switch	.text
3346  01b0               f_Test_Ctrl_Swtich_Control:
3350                     ; 211 	if(b_UP_Button_Flag== ON){
3352  01b0 7202000004ac  	btjf	_uc_Button_Status_Reg,#1,L3612
3353                     ; 213 		if(b_Test_Option_flag == ON){ 
3355  01b9 7209000b22    	btjf	_uc_Test_Ctrl_Reg,#4,L5612
3356                     ; 214 			if(b_LDF_V02_Flag){ if(uc_Duty_Unit < (U8)(200)){ uc_Duty_Unit++;}}
3358  01be 7201000c0b    	btjf	_uc_Model_Select_Reg,#0,L7612
3361  01c3 c60000        	ld	a,_uc_Duty_Unit
3362  01c6 a1c8          	cp	a,#200
3363  01c8 2404          	jruge	L7612
3366  01ca 725c0000      	inc	_uc_Duty_Unit
3367  01ce               L7612:
3368                     ; 215 			if(b_LDF_V03_Flag){ if(uc_Duty_Unit < (U8)(100)){ uc_Duty_Unit++;}}
3370  01ce 7203000c64    	btjf	_uc_Model_Select_Reg,#1,L7712
3373  01d3 c60000        	ld	a,_uc_Duty_Unit
3374  01d6 a164          	cp	a,#100
3375  01d8 245d          	jruge	L7712
3378  01da 725c0000      	inc	_uc_Duty_Unit
3379  01de 2057          	jra	L7712
3380  01e0               L5612:
3381                     ; 218 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(1);}
3383  01e0 7205000b08    	btjf	_uc_Test_Ctrl_Reg,#2,L1022
3386  01e5 a601          	ld	a,#1
3387  01e7 8d3d013d      	callf	f_Test_Ctrl_Value_Change
3390  01eb 204a          	jra	L7712
3391  01ed               L1022:
3392                     ; 219 			else if(b_Data_Select_flag == ON){
3394  01ed 7203000b25    	btjf	_uc_Test_Ctrl_Reg,#1,L5022
3395                     ; 220 				if(uc_Test_Page_Now == (U8)(0)){
3397  01f2 725d0003      	tnz	_uc_Test_Page_Now
3398  01f6 260c          	jrne	L7022
3399                     ; 221 					if(uc_Test_Data_Select_Num > 0){ uc_Test_Data_Select_Num--; }
3401  01f8 725d0001      	tnz	_uc_Test_Data_Select_Num
3402  01fc 2739          	jreq	L7712
3405  01fe 725a0001      	dec	_uc_Test_Data_Select_Num
3406  0202 2033          	jra	L7712
3407  0204               L7022:
3408                     ; 223 				else if(uc_Test_Page_Now == (U8)(1)){
3410  0204 c60003        	ld	a,_uc_Test_Page_Now
3411  0207 4a            	dec	a
3412  0208 262d          	jrne	L7712
3413                     ; 224 					if(uc_Test_Data_Select_Num > 4){ uc_Test_Data_Select_Num--; }
3415  020a c60001        	ld	a,_uc_Test_Data_Select_Num
3416  020d a105          	cp	a,#5
3417  020f 2526          	jrult	L7712
3420  0211 725a0001      	dec	_uc_Test_Data_Select_Num
3421  0215 2020          	jra	L7712
3422  0217               L5022:
3423                     ; 227 				if(uc_Test_Page_Now > 0){
3425  0217 725d0003      	tnz	_uc_Test_Page_Now
3426  021b 271a          	jreq	L7712
3427                     ; 228 					uc_Test_Page_Now--;
3429  021d 725a0003      	dec	_uc_Test_Page_Now
3430                     ; 229 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3432  0221 725d0003      	tnz	_uc_Test_Page_Now
3433  0225 2606          	jrne	L5222
3436  0227 725f0001      	clr	_uc_Test_Data_Select_Num
3438  022b 200a          	jra	L7712
3439  022d               L5222:
3440                     ; 230 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3442  022d c60003        	ld	a,_uc_Test_Page_Now
3443  0230 4a            	dec	a
3444  0231 2604          	jrne	L7712
3447  0233 35040001      	mov	_uc_Test_Data_Select_Num,#4
3448  0237               L7712:
3449                     ; 234 		b_UP_Button_Flag = OFF;
3451  0237 72130000      	bres	_uc_Button_Status_Reg,#1
3453  023b 2073          	jra	L3322
3454  023d               L3612:
3455                     ; 238 	else if(b_DOWN_Button_Flag== ON){ 
3457  023d 720500006e    	btjf	_uc_Button_Status_Reg,#2,L3322
3458                     ; 240 		if(b_Test_Option_flag == ON){ if(uc_Duty_Unit > (U8)(1)){ uc_Duty_Unit--;}}
3460  0242 7209000b0d    	btjf	_uc_Test_Ctrl_Reg,#4,L7322
3463  0247 c60000        	ld	a,_uc_Duty_Unit
3464  024a a102          	cp	a,#2
3465  024c 255e          	jrult	L3422
3468  024e 725a0000      	dec	_uc_Duty_Unit
3469  0252 2058          	jra	L3422
3470  0254               L7322:
3471                     ; 243 			if(b_Data_Setting_flag == ON){	Test_Ctrl_Value_Change(0);}
3473  0254 7205000b07    	btjf	_uc_Test_Ctrl_Reg,#2,L5422
3476  0259 4f            	clr	a
3477  025a 8d3d013d      	callf	f_Test_Ctrl_Value_Change
3480  025e 204c          	jra	L3422
3481  0260               L5422:
3482                     ; 245 			else if(b_Data_Select_flag == ON){
3484  0260 7203000b26    	btjf	_uc_Test_Ctrl_Reg,#1,L1522
3485                     ; 246 				if(uc_Test_Page_Now == (U8)(0)){
3487  0265 725d0003      	tnz	_uc_Test_Page_Now
3488  0269 260d          	jrne	L3522
3489                     ; 247 					if(uc_Test_Data_Select_Num < 2){ uc_Test_Data_Select_Num++; }
3491  026b c60001        	ld	a,_uc_Test_Data_Select_Num
3492  026e a102          	cp	a,#2
3493  0270 243a          	jruge	L3422
3496  0272 725c0001      	inc	_uc_Test_Data_Select_Num
3497  0276 2034          	jra	L3422
3498  0278               L3522:
3499                     ; 249 				else if(uc_Test_Page_Now == (U8)(1)){
3501  0278 c60003        	ld	a,_uc_Test_Page_Now
3502  027b 4a            	dec	a
3503  027c 262e          	jrne	L3422
3504                     ; 250 					if(uc_Test_Data_Select_Num < 6){ uc_Test_Data_Select_Num++; }
3506  027e c60001        	ld	a,_uc_Test_Data_Select_Num
3507  0281 a106          	cp	a,#6
3508  0283 2427          	jruge	L3422
3511  0285 725c0001      	inc	_uc_Test_Data_Select_Num
3512  0289 2021          	jra	L3422
3513  028b               L1522:
3514                     ; 253 				if(uc_Test_Page_Now < 4){
3516  028b c60003        	ld	a,_uc_Test_Page_Now
3517  028e a104          	cp	a,#4
3518  0290 241a          	jruge	L3422
3519                     ; 254 					uc_Test_Page_Now++;
3521  0292 725c0003      	inc	_uc_Test_Page_Now
3522                     ; 256 					if(uc_Test_Page_Now == (U8)(0)){ uc_Test_Data_Select_Num = 0; }
3524  0296 725d0003      	tnz	_uc_Test_Page_Now
3525  029a 2606          	jrne	L1722
3528  029c 725f0001      	clr	_uc_Test_Data_Select_Num
3530  02a0 200a          	jra	L3422
3531  02a2               L1722:
3532                     ; 257 					else if(uc_Test_Page_Now == (U8)(1)){ uc_Test_Data_Select_Num = 4; }
3534  02a2 c60003        	ld	a,_uc_Test_Page_Now
3535  02a5 4a            	dec	a
3536  02a6 2604          	jrne	L3422
3539  02a8 35040001      	mov	_uc_Test_Data_Select_Num,#4
3540  02ac               L3422:
3541                     ; 261 		b_DOWN_Button_Flag = OFF;
3543  02ac 72150000      	bres	_uc_Button_Status_Reg,#2
3544  02b0               L3322:
3545                     ; 265 	if(b_SET_Button_Flag== ON){
3547  02b0 720700002d    	btjf	_uc_Button_Status_Reg,#3,L7722
3548                     ; 266 		if(uc_Test_Page_Now < 2){
3550  02b5 c60003        	ld	a,_uc_Test_Page_Now
3551  02b8 a102          	cp	a,#2
3552  02ba 2422          	jruge	L1032
3553                     ; 268 			if(b_Data_Select_flag == OFF){b_Data_Select_flag= ON;}
3555  02bc 7202000b06    	btjt	_uc_Test_Ctrl_Reg,#1,L3032
3558  02c1 7212000b      	bset	_uc_Test_Ctrl_Reg,#1
3560  02c5 2013          	jra	L5032
3561  02c7               L3032:
3562                     ; 270 				if(b_Data_Setting_flag == OFF){
3564  02c7 7204000b06    	btjt	_uc_Test_Ctrl_Reg,#2,L7032
3565                     ; 271 					b_Data_Setting_flag = ON;
3567  02cc 7214000b      	bset	_uc_Test_Ctrl_Reg,#2
3569  02d0 2008          	jra	L5032
3570  02d2               L7032:
3571                     ; 273 					b_Data_Setting_flag = OFF;
3573  02d2 7215000b      	bres	_uc_Test_Ctrl_Reg,#2
3574                     ; 274 					b_Data_Select_flag = OFF;
3576  02d6 7213000b      	bres	_uc_Test_Ctrl_Reg,#1
3577  02da               L5032:
3578                     ; 277 			b_SET_Button_Flag = OFF;
3580  02da 72170000      	bres	_uc_Button_Status_Reg,#3
3581  02de               L1032:
3582                     ; 279 		b_SET_Button_Flag = OFF;
3584  02de 72170000      	bres	_uc_Button_Status_Reg,#3
3585  02e2               L7722:
3586                     ; 283 	if(b_ONOFF_Button_Flag== ON){
3588  02e2 7201000013    	btjf	_uc_Button_Status_Reg,#0,L3132
3589                     ; 285 		if(b_Lin_Com_On_flag == OFF){b_Lin_Com_On_flag = ON;}
3591  02e7 7206000b06    	btjt	_uc_Test_Ctrl_Reg,#3,L5132
3594  02ec 7216000b      	bset	_uc_Test_Ctrl_Reg,#3
3596  02f0 2004          	jra	L7132
3597  02f2               L5132:
3598                     ; 286 		else{ b_Lin_Com_On_flag = OFF;}
3600  02f2 7217000b      	bres	_uc_Test_Ctrl_Reg,#3
3601  02f6               L7132:
3602                     ; 288 		b_ONOFF_Button_Flag = OFF;
3604  02f6 72110000      	bres	_uc_Button_Status_Reg,#0
3605  02fa               L3132:
3606                     ; 292 	if(b_OPTION_Button_Flag == ON){
3608  02fa 7209000013    	btjf	_uc_Button_Status_Reg,#4,L1232
3609                     ; 294 		if(b_Test_Option_flag == OFF){b_Test_Option_flag = ON; }
3611  02ff 7208000b06    	btjt	_uc_Test_Ctrl_Reg,#4,L3232
3614  0304 7218000b      	bset	_uc_Test_Ctrl_Reg,#4
3616  0308 2004          	jra	L5232
3617  030a               L3232:
3618                     ; 295 		else{b_Test_Option_flag = OFF; }
3620  030a 7219000b      	bres	_uc_Test_Ctrl_Reg,#4
3621  030e               L5232:
3622                     ; 297 		b_OPTION_Button_Flag = OFF;
3624  030e 72190000      	bres	_uc_Button_Status_Reg,#4
3625  0312               L1232:
3626                     ; 302 	if(b_ENTER_Button_Flag == ON){
3628  0312 720b000017    	btjf	_uc_Button_Status_Reg,#5,L7232
3629                     ; 303 		if(!b_First_Logic_On){ b_First_Logic_On= ON; }
3631  0317 7200000006    	btjt	_uc_System_Ctrl_Reg,#0,L1332
3634  031c 72100000      	bset	_uc_System_Ctrl_Reg,#0
3636  0320 2008          	jra	L3332
3637  0322               L1332:
3638                     ; 305 			b_First_Logic_On = OFF;
3640  0322 72110000      	bres	_uc_System_Ctrl_Reg,#0
3641                     ; 306 			Test_Ctrl_Reset_Values();	
3643  0326 8d470b47      	callf	f_Test_Ctrl_Reset_Values
3645  032a               L3332:
3646                     ; 308 		b_ENTER_Button_Flag = OFF;
3648  032a 721b0000      	bres	_uc_Button_Status_Reg,#5
3649  032e               L7232:
3650                     ; 311 	return;
3653  032e 87            	retf	
3679                     ; 316 void Test_Ctrl_Text_Display_Handling(void)
3679                     ; 317 {
3680                     	switch	.text
3681  032f               f_Test_Ctrl_Text_Display_Handling:
3685                     ; 318 	switch(uc_Test_Page_Now){
3687  032f c60003        	ld	a,_uc_Test_Page_Now
3689                     ; 340 				break;
3690  0332 272c          	jreq	L5332
3691  0334 4a            	dec	a
3692  0335 2752          	jreq	L7332
3693                     ; 334 		default:
3693                     ; 335 				strcpy(LCD_Dis_Data[0],"");	// Null
3695  0337 ae014a        	ldw	x,#L1671
3696  033a 89            	pushw	x
3697  033b ae0000        	ldw	x,#_LCD_Dis_Data
3698  033e 8d000000      	callf	f_strcpy
3700  0342 85            	popw	x
3701                     ; 336 				strcpy(LCD_Dis_Data[1],"");	// Null
3703  0343 ae014a        	ldw	x,#L1671
3704  0346 89            	pushw	x
3705  0347 ae0010        	ldw	x,#_LCD_Dis_Data+16
3706  034a 8d000000      	callf	f_strcpy
3708  034e 85            	popw	x
3709                     ; 337 				strcpy(LCD_Dis_Data[2],"");	// Null
3711  034f ae014a        	ldw	x,#L1671
3712  0352 89            	pushw	x
3713  0353 ae0020        	ldw	x,#_LCD_Dis_Data+32
3714  0356 8d000000      	callf	f_strcpy
3716  035a 85            	popw	x
3717                     ; 338 				strcpy(LCD_Dis_Data[3],"");	// Null
3719  035b ae014a        	ldw	x,#L1671
3721                     ; 340 				break;
3723  035e 2050          	jra	L5532
3724  0360               L5332:
3725                     ; 321 		case 0:	strcpy(LCD_Dis_Data[0],"HTR_En :");	// FET1_Switching_Duty_Control
3727  0360 ae0141        	ldw	x,#L7532
3728  0363 89            	pushw	x
3729  0364 ae0000        	ldw	x,#_LCD_Dis_Data
3730  0367 8d000000      	callf	f_strcpy
3732  036b 85            	popw	x
3733                     ; 322 				strcpy(LCD_Dis_Data[1],"TAR_Pwr:");	// FET2_Switching_Duty_Control
3735  036c ae0138        	ldw	x,#L1632
3736  036f 89            	pushw	x
3737  0370 ae0010        	ldw	x,#_LCD_Dis_Data+16
3738  0373 8d000000      	callf	f_strcpy
3740  0377 85            	popw	x
3741                     ; 323 				strcpy(LCD_Dis_Data[2],"Pwr_Cns:");	// FET3_Switching_Duty_Control
3743  0378 ae012f        	ldw	x,#L3632
3744  037b 89            	pushw	x
3745  037c ae0020        	ldw	x,#_LCD_Dis_Data+32
3746  037f 8d000000      	callf	f_strcpy
3748  0383 85            	popw	x
3749                     ; 324 				strcpy(LCD_Dis_Data[3],"HTR_Sts:");		// Null
3751  0384 ae0126        	ldw	x,#L5632
3753                     ; 325 				break;
3755  0387 2027          	jra	L5532
3756  0389               L7332:
3757                     ; 328 		case 1:	strcpy(LCD_Dis_Data[0],"Cur_Cns:");	// Target_Power_Percentage_Control
3759  0389 ae011d        	ldw	x,#L7632
3760  038c 89            	pushw	x
3761  038d ae0000        	ldw	x,#_LCD_Dis_Data
3762  0390 8d000000      	callf	f_strcpy
3764  0394 85            	popw	x
3765                     ; 329 				strcpy(LCD_Dis_Data[1],"HV _Vlt:");		// Heater_Load_Active_Inactive_Control
3767  0395 ae0114        	ldw	x,#L1732
3768  0398 89            	pushw	x
3769  0399 ae0010        	ldw	x,#_LCD_Dis_Data+16
3770  039c 8d000000      	callf	f_strcpy
3772  03a0 85            	popw	x
3773                     ; 330 				strcpy(LCD_Dis_Data[2],"PCB_Tmp:");	// Voltage_Diagnositcs_Active_Inactive_Control
3775  03a1 ae010b        	ldw	x,#L3732
3776  03a4 89            	pushw	x
3777  03a5 ae0020        	ldw	x,#_LCD_Dis_Data+32
3778  03a8 8d000000      	callf	f_strcpy
3780  03ac 85            	popw	x
3781                     ; 331 				strcpy(LCD_Dis_Data[3],"Cor_Tmp:");		// Null
3783  03ad ae0102        	ldw	x,#L5732
3785                     ; 332 				break;
3787  03b0               L5532:
3788  03b0 89            	pushw	x
3789  03b1 ae0030        	ldw	x,#_LCD_Dis_Data+48
3790  03b4 8d000000      	callf	f_strcpy
3791  03b8 85            	popw	x
3792                     ; 343 	return;
3795  03b9 87            	retf	
3866                     ; 348 void Test_Ctrl_LCD_Display_Control(void)
3866                     ; 349 {
3867                     	switch	.text
3868  03ba               f_Test_Ctrl_LCD_Display_Control:
3870  03ba 5206          	subw	sp,#6
3871       00000006      OFST:	set	6
3874                     ; 355 	if(b_Test_Option_flag == ON){
3876  03bc 7209000b6d    	btjf	_uc_Test_Ctrl_Reg,#4,L1242
3877                     ; 356 		Set_LCD_Address(LCD_Line[0]);
3879  03c1 c60000        	ld	a,_LCD_Line
3880  03c4 8d000000      	callf	f_Set_LCD_Address
3882                     ; 357 		Display_LCD_String("*OPTION*");
3884  03c8 ae00f9        	ldw	x,#L3242
3885  03cb 8d000000      	callf	f_Display_LCD_String
3887                     ; 358 		Set_LCD_Address(LCD_Line[1]);
3889  03cf c60001        	ld	a,_LCD_Line+1
3890  03d2 8d000000      	callf	f_Set_LCD_Address
3892                     ; 359 		Display_LCD_String("D_Unit:");
3894  03d6 ae00f1        	ldw	x,#L5242
3895  03d9 8d000000      	callf	f_Display_LCD_String
3897                     ; 361 		Set_LCD_Address((unsigned char)(LCD_Line[1]+7));
3899  03dd c60001        	ld	a,_LCD_Line+1
3900  03e0 ab07          	add	a,#7
3901  03e2 8d000000      	callf	f_Set_LCD_Address
3903                     ; 362 		if(b_Blink_250_Flag){
3905  03e6 720300003f    	btjf	_uc_LCD_Blink_Reg,#1,L7242
3906                     ; 363 			if(b_LDF_V02_Flag){
3908  03eb 7201000c25    	btjf	_uc_Model_Select_Reg,#0,L1342
3909                     ; 364 				Num_Display_LCD(uc_Duty_Unit/(U8)(2));
3911  03f0 c60000        	ld	a,_uc_Duty_Unit
3912  03f3 44            	srl	a
3913  03f4 5f            	clrw	x
3914  03f5 97            	ld	xl,a
3915  03f6 8d000000      	callf	f_Num_Display_LCD
3917                     ; 365 				Display_LCD_String(".");
3919  03fa ae00ef        	ldw	x,#L3342
3920  03fd 8d000000      	callf	f_Display_LCD_String
3922                     ; 366 				Num_Display_LCD(uc_Duty_Unit%(U8)(2) * (U8)(5));
3924  0401 c60000        	ld	a,_uc_Duty_Unit
3925  0404 a401          	and	a,#1
3926  0406 97            	ld	xl,a
3927  0407 a605          	ld	a,#5
3928  0409 42            	mul	x,a
3929  040a 8d000000      	callf	f_Num_Display_LCD
3931                     ; 367 				Display_LCD_String("%");
3933  040e ae00ed        	ldw	x,#L5342
3936  0411 ac380b38      	jpf	LC023
3937  0415               L1342:
3938                     ; 369 			else if(b_LDF_V03_Flag){
3940  0415 7203000c10    	btjf	_uc_Model_Select_Reg,#1,L7242
3941                     ; 370 				Num_Display_LCD(uc_Duty_Unit);
3943  041a c60000        	ld	a,_uc_Duty_Unit
3944  041d 5f            	clrw	x
3945  041e 97            	ld	xl,a
3946  041f 8d000000      	callf	f_Num_Display_LCD
3948                     ; 371 				Display_LCD_String("%");
3950  0423 ae00ed        	ldw	x,#L5342
3951  0426 8d000000      	callf	f_Display_LCD_String
3953  042a               L7242:
3954                     ; 374 		return;
3956  042a ac3c0b3c      	jra	L7423
3957  042e               L1242:
3958                     ; 377 	if(uc_Test_Page_Now != uc_Test_Page_Pre){ Test_Ctrl_Text_Display_Handling(); }
3960  042e c60003        	ld	a,_uc_Test_Page_Now
3961  0431 c10002        	cp	a,_uc_Test_Page_Pre
3962  0434 2704          	jreq	L3442
3965  0436 8d2f032f      	callf	f_Test_Ctrl_Text_Display_Handling
3967  043a               L3442:
3968                     ; 378 	uc_Test_Page_Pre = uc_Test_Page_Now ;
3970  043a 5500030002    	mov	_uc_Test_Page_Pre,_uc_Test_Page_Now
3971                     ; 381 	if(uc_Test_Page_Now == (U8)(0)){			//page 1
3973  043f 725d0003      	tnz	_uc_Test_Page_Now
3974  0443 2704acb605b6  	jrne	L5442
3975                     ; 382 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
3977  0449 4f            	clr	a
3978  044a 6b06          	ld	(OFST+0,sp),a
3979  044c               L7442:
3980                     ; 383 			Set_LCD_Address(LCD_Line[uc_line_index]);
3982  044c 5f            	clrw	x
3983  044d 97            	ld	xl,a
3984  044e d60000        	ld	a,(_LCD_Line,x)
3985  0451 8d000000      	callf	f_Set_LCD_Address
3987                     ; 385 			if((b_Data_Select_flag == ON) && (b_Data_Setting_flag == OFF) && (uc_line_index == uc_Test_Data_Select_Num)){
3989  0455 7203000b13    	btjf	_uc_Test_Ctrl_Reg,#1,L5542
3991  045a 7204000b0e    	btjt	_uc_Test_Ctrl_Reg,#2,L5542
3993  045f 7b06          	ld	a,(OFST+0,sp)
3994  0461 c10001        	cp	a,_uc_Test_Data_Select_Num
3995  0464 2607          	jrne	L5542
3996                     ; 386 				if(b_Blink_250_Flag){Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
3998  0466 7203000011    	btjf	_uc_LCD_Blink_Reg,#1,L1642
4001  046b 2002          	jpf	LC005
4002  046d               L5542:
4003                     ; 387 			}else{ Display_LCD_String(LCD_Dis_Data[uc_line_index]);}
4005  046d 7b06          	ld	a,(OFST+0,sp)
4006  046f               LC005:
4008  046f 97            	ld	xl,a
4009  0470 a610          	ld	a,#16
4010  0472 42            	mul	x,a
4011  0473 1c0000        	addw	x,#_LCD_Dis_Data
4012  0476 8d000000      	callf	f_Display_LCD_String
4014  047a 7b06          	ld	a,(OFST+0,sp)
4015  047c               L1642:
4016                     ; 389 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 8));
4018  047c 5f            	clrw	x
4019  047d 97            	ld	xl,a
4020  047e d60000        	ld	a,(_LCD_Line,x)
4021  0481 ab08          	add	a,#8
4022  0483 8d000000      	callf	f_Set_LCD_Address
4024                     ; 392 			if(uc_line_index == (U8)(0)){		// LINE 1
4026  0487 7b06          	ld	a,(OFST+0,sp)
4027  0489 2635          	jrne	L3642
4028                     ; 393 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4030  048b 7205000b16    	btjf	_uc_Test_Ctrl_Reg,#2,L5642
4032  0490 c10001        	cp	a,_uc_Test_Data_Select_Num
4033  0493 2611          	jrne	L5642
4034                     ; 394 					if(b_Blink_250_Flag){
4036  0495 7202000004ac  	btjf	_uc_LCD_Blink_Reg,#1,L3152
4037                     ; 395 						if(!uc_Heater_Enable_Flag){ Display_LCD_String("Fals"); }
4039  049e 725d0009      	tnz	_uc_Heater_Enable_Flag
4040  04a2 260f          	jrne	L5052
4044  04a4 2006          	jpf	LC014
4045                     ; 396 						else if(uc_Heater_Enable_Flag){ Display_LCD_String("True"); }
4048  04a6               L5642:
4049                     ; 399 					if(!uc_Heater_Enable_Flag){ Display_LCD_String("Fals"); }
4051  04a6 725d0009      	tnz	_uc_Heater_Enable_Flag
4052  04aa 2607          	jrne	L5052
4055  04ac               LC014:
4057  04ac ae00e8        	ldw	x,#L3742
4060  04af ac960596      	jpf	LC006
4061  04b3               L5052:
4062                     ; 400 					else if(uc_Heater_Enable_Flag){ Display_LCD_String("True"); }					
4067  04b3 725d0009      	tnz	_uc_Heater_Enable_Flag
4068  04b7 27e1          	jreq	L3152
4070  04b9 ae00e3        	ldw	x,#L1052
4072  04bc ac960596      	jpf	LC006
4073  04c0               L3642:
4074                     ; 404 			else if(uc_line_index == (U8)(1)){	// LINE 2
4076  04c0 a101          	cp	a,#1
4077  04c2 264e          	jrne	L5152
4078                     ; 405 				if((b_Data_Setting_flag == ON) && (uc_line_index == uc_Test_Data_Select_Num)){
4080  04c4 7205000b40    	btjf	_uc_Test_Ctrl_Reg,#2,L7152
4082  04c9 c10001        	cp	a,_uc_Test_Data_Select_Num
4083  04cc 263b          	jrne	L7152
4084                     ; 406 					if(b_Blink_250_Flag){
4086  04ce 72030000c7    	btjf	_uc_LCD_Blink_Reg,#1,L3152
4087                     ; 407 						if(b_LDF_V02_Flag){
4089  04d3 7201000c25    	btjf	_uc_Model_Select_Reg,#0,L3252
4090                     ; 408 							Num_Display_LCD(uc_target_Power_Perc / (U8)(2));
4093                     ; 409 							Display_LCD_String(".");
4096                     ; 410 							Num_Display_LCD((uc_target_Power_Perc % (U8)(2) * (U8)(5)));
4098  04d8               LC009:
4100  04d8 c60008        	ld	a,_uc_target_Power_Perc
4101  04db 44            	srl	a
4102  04dc 5f            	clrw	x
4103  04dd 97            	ld	xl,a
4104  04de 8d000000      	callf	f_Num_Display_LCD
4106  04e2 ae00ef        	ldw	x,#L3342
4107  04e5 8d000000      	callf	f_Display_LCD_String
4109  04e9 c60008        	ld	a,_uc_target_Power_Perc
4110  04ec               LC008:
4111  04ec a401          	and	a,#1
4112  04ee 97            	ld	xl,a
4113  04ef a605          	ld	a,#5
4114  04f1 42            	mul	x,a
4116                     ; 411 							Display_LCD_String("%");
4118  04f2               LC007:
4119  04f2 8d000000      	callf	f_Num_Display_LCD
4125  04f6 ae00ed        	ldw	x,#L5342
4128  04f9 ac960596      	jpf	LC006
4129  04fd               L3252:
4130                     ; 413 						else if(b_LDF_V03_Flag){
4132                     ; 414 							Num_Display_LCD(uc_target_Power_Perc);
4135  04fd 7203000c98    	btjf	_uc_Model_Select_Reg,#1,L3152
4137  0502 c60008        	ld	a,_uc_target_Power_Perc
4138  0505               LC010:
4140  0505 5f            	clrw	x
4141  0506 97            	ld	xl,a
4143                     ; 415 							Display_LCD_String("%");
4145  0507 20e9          	jpf	LC007
4146  0509               L7152:
4147                     ; 419 					if(b_LDF_V02_Flag){
4149  0509 7201000c02    	btjf	_uc_Model_Select_Reg,#0,L3352
4150                     ; 420 						Num_Display_LCD(uc_target_Power_Perc / (U8)(2));
4152                     ; 421 						Display_LCD_String(".");
4154                     ; 422 						Num_Display_LCD((uc_target_Power_Perc % (U8)(2) * (U8)(5)));
4156                     ; 423 						Display_LCD_String("%");
4159  050e 20c8          	jpf	LC009
4160  0510               L3352:
4161                     ; 425 					else if(b_LDF_V03_Flag){
4162                     ; 426 						Num_Display_LCD(uc_target_Power_Perc);
4164                     ; 427 						Display_LCD_String("%");
4166  0510 20eb          	jpf	L3252
4167  0512               L5152:
4168                     ; 432 			else if(uc_line_index == (U8)(2)){	// LINE 3
4170  0512 a102          	cp	a,#2
4171  0514 2632          	jrne	L3452
4172                     ; 434 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4174  0516 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L7452
4176  051b 7206000b05    	btjt	_uc_Test_Ctrl_Reg,#3,L5452
4177  0520               L7452:
4181  0520 ae00e0        	ldw	x,#L1552
4184  0523 2071          	jpf	LC006
4185  0525               L5452:
4186                     ; 436 					uc_buffer = uc_Rx2_Lin_Data[4];
4188  0525 c60009        	ld	a,_uc_Rx2_Lin_Data+4
4189  0528 6b05          	ld	(OFST-1,sp),a
4190                     ; 437 					if(b_LDF_V02_Flag){
4192  052a 7201000c12    	btjf	_uc_Model_Select_Reg,#0,L5552
4193                     ; 438 						Num_Display_LCD(uc_buffer / (U8)(2));
4195  052f 44            	srl	a
4196  0530 5f            	clrw	x
4197  0531 97            	ld	xl,a
4198  0532 8d000000      	callf	f_Num_Display_LCD
4200                     ; 439 						Display_LCD_String(".");
4202  0536 ae00ef        	ldw	x,#L3342
4203  0539 8d000000      	callf	f_Display_LCD_String
4205                     ; 440 						Num_Display_LCD((uc_buffer % (U8)(2) * (U8)(5)));
4207  053d 7b05          	ld	a,(OFST-1,sp)
4209                     ; 441 						Display_LCD_String("%");
4212  053f 20ab          	jpf	LC008
4213  0541               L5552:
4214                     ; 443 					else if(b_LDF_V03_Flag){
4216  0541 7203000c54    	btjf	_uc_Model_Select_Reg,#1,L3152
4217                     ; 444 						Num_Display_LCD(uc_buffer);
4219                     ; 445 						Display_LCD_String("%");
4221  0546 20bd          	jpf	LC010
4222  0548               L3452:
4223                     ; 451 			else if(uc_line_index == (U8)(3)){	// LINE 4
4225  0548 a103          	cp	a,#3
4226  054a 264e          	jrne	L3152
4227                     ; 452 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4229  054c 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L1752
4231  0551 7206000b02    	btjt	_uc_Test_Ctrl_Reg,#3,L7652
4232  0556               L1752:
4236  0556 20c8          	jpf	L7452
4237  0558               L7652:
4238                     ; 454 					uc_buffer = (U8)(uc_Rx2_Lin_Data[0] & (U8)(0x07));
4240  0558 c60005        	ld	a,_uc_Rx2_Lin_Data
4241  055b a407          	and	a,#7
4242  055d 6b05          	ld	(OFST-1,sp),a
4243                     ; 455 					if(!uc_buffer){ Display_LCD_String("off"); }						// Heater Off
4245  055f 2605          	jrne	L5752
4248  0561 ae00dc        	ldw	x,#L7752
4251  0564 2030          	jpf	LC006
4252  0566               L5752:
4253                     ; 456 					else if(uc_buffer == (U8)(1)){ Display_LCD_String("LockNext"); }	// Locked_Next
4255  0566 a101          	cp	a,#1
4256  0568 2605          	jrne	L3062
4259  056a ae00d3        	ldw	x,#L5062
4262  056d 2027          	jpf	LC006
4263  056f               L3062:
4264                     ; 457 					else if(uc_buffer == (U8)(2)){ Display_LCD_String("LockServ"); }	// Locked_Service
4266  056f a102          	cp	a,#2
4267  0571 2605          	jrne	L1162
4270  0573 ae00ca        	ldw	x,#L3162
4273  0576 201e          	jpf	LC006
4274  0578               L1162:
4275                     ; 458 					else if(uc_buffer == (U8)(3)){ Display_LCD_String("LockPerm"); }	// Locked_Parmanent
4277  0578 a103          	cp	a,#3
4278  057a 2605          	jrne	L7162
4281  057c ae00c1        	ldw	x,#L1262
4284  057f 2015          	jpf	LC006
4285  0581               L7162:
4286                     ; 459 					else if(uc_buffer == (U8)(4)){ Display_LCD_String("Oper"); }		// Operation
4288  0581 a104          	cp	a,#4
4289  0583 2605          	jrne	L5262
4292  0585 ae00bc        	ldw	x,#L7262
4295  0588 200c          	jpf	LC006
4296  058a               L5262:
4297                     ; 460 					else if(uc_buffer == (U8)(5)){ Display_LCD_String("ProdMod"); }	// Production_Mode
4299  058a a105          	cp	a,#5
4300  058c 2605          	jrne	L3362
4303  058e ae00b4        	ldw	x,#L5362
4306  0591 2003          	jpf	LC006
4307  0593               L3362:
4308                     ; 461 					else{ Display_LCD_String("NA"); }
4310  0593 ae00b1        	ldw	x,#L1462
4311  0596               LC006:
4312  0596 8d000000      	callf	f_Display_LCD_String
4314  059a               L3152:
4315                     ; 382 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4317  059a 0c06          	inc	(OFST+0,sp)
4320  059c 7b06          	ld	a,(OFST+0,sp)
4321  059e a104          	cp	a,#4
4322  05a0 2404ac4c044c  	jrult	L7442
4323                     ; 465 		Set_LCD_Address((U8)(LCD_Line[3]+13));
4325  05a6 c60003        	ld	a,_LCD_Line+3
4326  05a9 ab0d          	add	a,#13
4327  05ab 8d000000      	callf	f_Set_LCD_Address
4329                     ; 466 		Display_LCD_String("T&R");
4331  05af ae00ad        	ldw	x,#L3462
4334  05b2 ac130b13      	jra	L5462
4335  05b6               L5442:
4336                     ; 470 	else if(uc_Test_Page_Now == (U8)(1)){
4338  05b6 c60003        	ld	a,_uc_Test_Page_Now
4339  05b9 4a            	dec	a
4340  05ba 2704ac060706  	jrne	L7462
4341                     ; 471 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4343  05c0 6b06          	ld	(OFST+0,sp),a
4344  05c2               L1562:
4345                     ; 473 			Set_LCD_Address(LCD_Line[uc_line_index]);
4347  05c2 5f            	clrw	x
4348  05c3 97            	ld	xl,a
4349  05c4 d60000        	ld	a,(_LCD_Line,x)
4350  05c7 8d000000      	callf	f_Set_LCD_Address
4352                     ; 474 			Display_LCD_String(LCD_Dis_Data[uc_line_index]);
4354  05cb 7b06          	ld	a,(OFST+0,sp)
4355  05cd 97            	ld	xl,a
4356  05ce a610          	ld	a,#16
4357  05d0 42            	mul	x,a
4358  05d1 1c0000        	addw	x,#_LCD_Dis_Data
4359  05d4 8d000000      	callf	f_Display_LCD_String
4361                     ; 476 			Set_LCD_Address((U8)(LCD_Line[uc_line_index] + 8));
4363  05d8 7b06          	ld	a,(OFST+0,sp)
4364  05da 5f            	clrw	x
4365  05db 97            	ld	xl,a
4366  05dc d60000        	ld	a,(_LCD_Line,x)
4367  05df ab08          	add	a,#8
4368  05e1 8d000000      	callf	f_Set_LCD_Address
4370                     ; 479 			if(uc_line_index == (U8)(0)){		// LINE 1
4372  05e5 7b06          	ld	a,(OFST+0,sp)
4373  05e7 263b          	jrne	L7562
4374                     ; 480 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4376  05e9 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L3662
4378  05ee 7206000b05    	btjt	_uc_Test_Ctrl_Reg,#3,L1662
4379  05f3               L3662:
4382  05f3 ae00e0        	ldw	x,#L1552
4385  05f6 2026          	jpf	LC015
4386  05f8               L1662:
4387                     ; 482 					uc_buffer = uc_Rx2_Lin_Data[1];
4389  05f8 c60006        	ld	a,_uc_Rx2_Lin_Data+1
4390  05fb 6b05          	ld	(OFST-1,sp),a
4391                     ; 484 					Num_Display_LCD(uc_buffer / (U8)(4));
4393  05fd 44            	srl	a
4394  05fe 44            	srl	a
4395  05ff 5f            	clrw	x
4396  0600 97            	ld	xl,a
4397  0601 8d000000      	callf	f_Num_Display_LCD
4399                     ; 485 					Display_LCD_String(".");
4401  0605 ae00ef        	ldw	x,#L3342
4402  0608 8d000000      	callf	f_Display_LCD_String
4404                     ; 486 					Num_Display_LCD((U8)(uc_buffer % (U8)(4) * (U8)(25)));
4406  060c 7b05          	ld	a,(OFST-1,sp)
4407  060e a403          	and	a,#3
4408  0610 97            	ld	xl,a
4409  0611 a619          	ld	a,#25
4410  0613 42            	mul	x,a
4411  0614 9f            	ld	a,xl
4412  0615 5f            	clrw	x
4413  0616 97            	ld	xl,a
4414  0617 8d000000      	callf	f_Num_Display_LCD
4416                     ; 487 					Display_LCD_String("A");
4418  061b ae00ab        	ldw	x,#L7662
4419  061e               LC015:
4420  061e 8d000000      	callf	f_Display_LCD_String
4422  0622 7b06          	ld	a,(OFST+0,sp)
4423  0624               L7562:
4424                     ; 491 			if(uc_line_index == (U8)(1)){		// LINE 2
4426  0624 a101          	cp	a,#1
4427  0626 2630          	jrne	L1762
4428                     ; 492 				if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4430  0628 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L5762
4432  062d 7206000b05    	btjt	_uc_Test_Ctrl_Reg,#3,L3762
4433  0632               L5762:
4436  0632 ae00e0        	ldw	x,#L1552
4439  0635 201b          	jpf	LC016
4440  0637               L3762:
4441                     ; 494 					ui_buffer = (U16)((U16)(uc_Rx2_Lin_Data[3] & 0x03) << 8) + (U16)(uc_Rx2_Lin_Data[2]);
4443  0637 c60007        	ld	a,_uc_Rx2_Lin_Data+2
4444  063a 5f            	clrw	x
4445  063b 97            	ld	xl,a
4446  063c 1f01          	ldw	(OFST-5,sp),x
4447  063e c60008        	ld	a,_uc_Rx2_Lin_Data+3
4448  0641 a403          	and	a,#3
4449  0643 97            	ld	xl,a
4450  0644 4f            	clr	a
4451  0645 02            	rlwa	x,a
4452  0646 72fb01        	addw	x,(OFST-5,sp)
4453  0649 1f03          	ldw	(OFST-3,sp),x
4454                     ; 495 					Num_Display_LCD(ui_buffer);
4456  064b 8d000000      	callf	f_Num_Display_LCD
4458                     ; 496 					Display_LCD_String("V");
4460  064f ae00a9        	ldw	x,#L1072
4461  0652               LC016:
4462  0652 8d000000      	callf	f_Display_LCD_String
4464  0656 7b06          	ld	a,(OFST+0,sp)
4465  0658               L1762:
4466                     ; 499 			if(uc_line_index == (U8)(2)){		// LINE 2
4468  0658 a102          	cp	a,#2
4469  065a 264c          	jrne	L3072
4470                     ; 500 				if(b_LDF_V02_Flag){ Display_LCD_String("NA"); }		// Not Applicable 
4472  065c 7201000c05    	btjf	_uc_Model_Select_Reg,#0,L5072
4475  0661 ae00b1        	ldw	x,#L1462
4478  0664 203c          	jpf	LC017
4479  0666               L5072:
4480                     ; 501 				else if(b_LDF_V03_Flag){
4482  0666 7203000c3d    	btjf	_uc_Model_Select_Reg,#1,L3072
4483                     ; 503 					if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4485  066b 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L5172
4487  0670 7206000b05    	btjt	_uc_Test_Ctrl_Reg,#3,L3172
4488  0675               L5172:
4491  0675 ae00e0        	ldw	x,#L1552
4494  0678 2028          	jpf	LC017
4495  067a               L3172:
4496                     ; 505 						uc_buffer = uc_Rx2_Lin_Data[5];
4498  067a c6000a        	ld	a,_uc_Rx2_Lin_Data+5
4499  067d 6b05          	ld	(OFST-1,sp),a
4500                     ; 507 						if(uc_buffer < (U8)(40)){
4502  067f a128          	cp	a,#40
4503  0681 2413          	jruge	L1272
4504                     ; 508 							Display_LCD_String("-");
4506  0683 ae00a7        	ldw	x,#L3272
4507  0686 8d000000      	callf	f_Display_LCD_String
4509                     ; 509 							Num_Display_LCD((U8)(40) - uc_buffer);
4511  068a 4f            	clr	a
4512  068b 97            	ld	xl,a
4513  068c a628          	ld	a,#40
4514  068e 1005          	sub	a,(OFST-1,sp)
4515  0690 2401          	jrnc	L623
4516  0692 5a            	decw	x
4517  0693               L623:
4518  0693 02            	rlwa	x,a
4520                     ; 510 							Display_LCD_String("C");
4523  0694 2005          	jpf	LC018
4524  0696               L1272:
4525                     ; 513 							Num_Display_LCD(uc_buffer - (U8)(40));
4527  0696 5f            	clrw	x
4528  0697 97            	ld	xl,a
4529  0698 1d0028        	subw	x,#40
4531                     ; 514 							Display_LCD_String("C");
4533  069b               LC018:
4534  069b 8d000000      	callf	f_Num_Display_LCD
4536  069f ae00a5        	ldw	x,#L5272
4537  06a2               LC017:
4538  06a2 8d000000      	callf	f_Display_LCD_String
4540  06a6 7b06          	ld	a,(OFST+0,sp)
4541  06a8               L3072:
4542                     ; 520 			if(uc_line_index == (U8)(3)){		// LINE 3
4544  06a8 a103          	cp	a,#3
4545  06aa 264a          	jrne	L1372
4546                     ; 521 				if(b_LDF_V02_Flag){ Display_LCD_String("NA"); }		// Not Applicable 
4548  06ac 7201000c05    	btjf	_uc_Model_Select_Reg,#0,L3372
4551  06b1 ae00b1        	ldw	x,#L1462
4554  06b4 203c          	jpf	LC019
4555  06b6               L3372:
4556                     ; 522 				else if(b_LDF_V03_Flag){
4558  06b6 7203000c3b    	btjf	_uc_Model_Select_Reg,#1,L1372
4559                     ; 524 					if((b_Rx2_Msg_TimeOut_Flag == ON) ||(b_Lin_Com_On_flag == OFF)){ Display_LCD_String("NC"); }	// No Communication
4561  06bb 7202000a05    	btjt	_uc_Rx_TimeOut_Reg,#1,L3472
4563  06c0 7206000b05    	btjt	_uc_Test_Ctrl_Reg,#3,L1472
4564  06c5               L3472:
4567  06c5 ae00e0        	ldw	x,#L1552
4570  06c8 2028          	jpf	LC019
4571  06ca               L1472:
4572                     ; 526 						uc_buffer = uc_Rx2_Lin_Data[6];
4574  06ca c6000b        	ld	a,_uc_Rx2_Lin_Data+6
4575  06cd 6b05          	ld	(OFST-1,sp),a
4576                     ; 528 						if(uc_buffer < (U8)(40)){
4578  06cf a128          	cp	a,#40
4579  06d1 2413          	jruge	L7472
4580                     ; 529 							Display_LCD_String("-");
4582  06d3 ae00a7        	ldw	x,#L3272
4583  06d6 8d000000      	callf	f_Display_LCD_String
4585                     ; 530 							Num_Display_LCD((U8)(40) - uc_buffer);
4587  06da 4f            	clr	a
4588  06db 97            	ld	xl,a
4589  06dc a628          	ld	a,#40
4590  06de 1005          	sub	a,(OFST-1,sp)
4591  06e0 2401          	jrnc	L643
4592  06e2 5a            	decw	x
4593  06e3               L643:
4594  06e3 02            	rlwa	x,a
4596                     ; 531 							Display_LCD_String("C");
4599  06e4 2005          	jpf	LC020
4600  06e6               L7472:
4601                     ; 534 							Num_Display_LCD(uc_buffer - (U8)(40));
4603  06e6 5f            	clrw	x
4604  06e7 97            	ld	xl,a
4605  06e8 1d0028        	subw	x,#40
4607                     ; 535 							Display_LCD_String("C");
4609  06eb               LC020:
4610  06eb 8d000000      	callf	f_Num_Display_LCD
4612  06ef ae00a5        	ldw	x,#L5272
4613  06f2               LC019:
4614  06f2 8d000000      	callf	f_Display_LCD_String
4616  06f6               L1372:
4617                     ; 471 		for(uc_line_index = (U8)(0); uc_line_index < (U8)(4); uc_line_index++){
4619  06f6 0c06          	inc	(OFST+0,sp)
4622  06f8 7b06          	ld	a,(OFST+0,sp)
4623  06fa a104          	cp	a,#4
4624  06fc 2404acc205c2  	jrult	L1562
4625                     ; 541 		Set_LCD_Address((U8)(LCD_Line[3]+14));
4627                     ; 542 		Display_LCD_String("RX");
4630  0702 ac070b07      	jpf	L1672
4631  0706               L7462:
4632                     ; 546 		if(b_Rx1_Msg_TimeOut_Flag){
4634  0706 7201000a0e    	btjf	_uc_Rx_TimeOut_Reg,#0,L7572
4635                     ; 547 			Set_LCD_Address(LCD_Line[0]);	
4637  070b c60000        	ld	a,_LCD_Line
4638  070e 8d000000      	callf	f_Set_LCD_Address
4640                     ; 548 			Display_LCD_String("NC");
4642  0712 ae00e0        	ldw	x,#L1552
4645  0715 ac030b03      	jpf	LC021
4646  0719               L7572:
4647                     ; 551 			uc_fault_cnt = (U8)(0);
4649  0719 0f06          	clr	(OFST+0,sp)
4650                     ; 553 			uc_buffer = (U8)(uc_Rx1_Lin_Data[0] & 0x01);
4652  071b c60000        	ld	a,_uc_Rx1_Lin_Data
4653  071e a401          	and	a,#1
4654  0720 6b05          	ld	(OFST-1,sp),a
4655                     ; 554 			if(uc_buffer == (U8)(1)){
4657  0722 4a            	dec	a
4658  0723 263b          	jrne	L3672
4659                     ; 555 				uc_fault_cnt++;
4661  0725 0c06          	inc	(OFST+0,sp)
4662                     ; 556 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4662                     ; 557 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4662                     ; 558 				){
4664  0727 270d          	jreq	L1772
4666  0729 7b06          	ld	a,(OFST+0,sp)
4667  072b a105          	cp	a,#5
4668  072d 2407          	jruge	L1772
4670  072f c60003        	ld	a,_uc_Test_Page_Now
4671  0732 a102          	cp	a,#2
4672  0734 2711          	jreq	L7672
4673  0736               L1772:
4675  0736 7b06          	ld	a,(OFST+0,sp)
4676  0738 a105          	cp	a,#5
4677  073a 2524          	jrult	L3672
4679  073c a109          	cp	a,#9
4680  073e 2420          	jruge	L3672
4682  0740 c60003        	ld	a,_uc_Test_Page_Now
4683  0743 a103          	cp	a,#3
4684  0745 2619          	jrne	L3672
4685  0747               L7672:
4686                     ; 559 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
4688  0747 7b06          	ld	a,(OFST+0,sp)
4689  0749 5f            	clrw	x
4690  074a 97            	ld	xl,a
4691  074b 5a            	decw	x
4692  074c a604          	ld	a,#4
4693  074e 8d000000      	callf	d_smodx
4695  0752 d60000        	ld	a,(_LCD_Line,x)
4696  0755 8d000000      	callf	f_Set_LCD_Address
4698                     ; 560 					Display_LCD_String("RsErr_EAH");
4700  0759 ae0098        	ldw	x,#L5772
4701  075c 8d000000      	callf	f_Display_LCD_String
4703  0760               L3672:
4704                     ; 564 			uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0x06)>>1);
4706  0760 c60000        	ld	a,_uc_Rx1_Lin_Data
4707  0763 a406          	and	a,#6
4708  0765 44            	srl	a
4709  0766 6b05          	ld	(OFST-1,sp),a
4710                     ; 565 			if(uc_buffer == (U8)(1)){
4712  0768 4a            	dec	a
4713  0769 263b          	jrne	L7772
4714                     ; 566 				uc_fault_cnt++;
4716  076b 0c06          	inc	(OFST+0,sp)
4717                     ; 567 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4717                     ; 568 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4717                     ; 569 				){
4719  076d 270d          	jreq	L5003
4721  076f 7b06          	ld	a,(OFST+0,sp)
4722  0771 a105          	cp	a,#5
4723  0773 2407          	jruge	L5003
4725  0775 c60003        	ld	a,_uc_Test_Page_Now
4726  0778 a102          	cp	a,#2
4727  077a 2711          	jreq	L3003
4728  077c               L5003:
4730  077c 7b06          	ld	a,(OFST+0,sp)
4731  077e a105          	cp	a,#5
4732  0780 2524          	jrult	L7772
4734  0782 a109          	cp	a,#9
4735  0784 2420          	jruge	L7772
4737  0786 c60003        	ld	a,_uc_Test_Page_Now
4738  0789 a103          	cp	a,#3
4739  078b 2619          	jrne	L7772
4740  078d               L3003:
4741                     ; 570 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
4743  078d 7b06          	ld	a,(OFST+0,sp)
4744  078f 5f            	clrw	x
4745  0790 97            	ld	xl,a
4746  0791 5a            	decw	x
4747  0792 a604          	ld	a,#4
4748  0794 8d000000      	callf	d_smodx
4750  0798 d60000        	ld	a,(_LCD_Line,x)
4751  079b 8d000000      	callf	f_Set_LCD_Address
4753                     ; 571 					Display_LCD_String("FltInCom");
4755  079f ae008f        	ldw	x,#L1103
4756  07a2 8d000000      	callf	f_Display_LCD_String
4758  07a6               L7772:
4759                     ; 575 			uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0x18)>>3);
4761  07a6 c60000        	ld	a,_uc_Rx1_Lin_Data
4762  07a9 a418          	and	a,#24
4763  07ab 44            	srl	a
4764  07ac 44            	srl	a
4765  07ad 44            	srl	a
4766  07ae 6b05          	ld	(OFST-1,sp),a
4767                     ; 576 			if(uc_buffer == (U8)(1)){
4769  07b0 4a            	dec	a
4770  07b1 263b          	jrne	L3103
4771                     ; 577 				uc_fault_cnt++;
4773  07b3 0c06          	inc	(OFST+0,sp)
4774                     ; 578 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4774                     ; 579 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4774                     ; 580 				){
4776  07b5 270d          	jreq	L1203
4778  07b7 7b06          	ld	a,(OFST+0,sp)
4779  07b9 a105          	cp	a,#5
4780  07bb 2407          	jruge	L1203
4782  07bd c60003        	ld	a,_uc_Test_Page_Now
4783  07c0 a102          	cp	a,#2
4784  07c2 2711          	jreq	L7103
4785  07c4               L1203:
4787  07c4 7b06          	ld	a,(OFST+0,sp)
4788  07c6 a105          	cp	a,#5
4789  07c8 2524          	jrult	L3103
4791  07ca a109          	cp	a,#9
4792  07cc 2420          	jruge	L3103
4794  07ce c60003        	ld	a,_uc_Test_Page_Now
4795  07d1 a103          	cp	a,#3
4796  07d3 2619          	jrne	L3103
4797  07d5               L7103:
4798                     ; 581 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
4800  07d5 7b06          	ld	a,(OFST+0,sp)
4801  07d7 5f            	clrw	x
4802  07d8 97            	ld	xl,a
4803  07d9 5a            	decw	x
4804  07da a604          	ld	a,#4
4805  07dc 8d000000      	callf	d_smodx
4807  07e0 d60000        	ld	a,(_LCD_Line,x)
4808  07e3 8d000000      	callf	f_Set_LCD_Address
4810                     ; 582 					Display_LCD_String("HVOutOfRng");
4812  07e7 ae0084        	ldw	x,#L5203
4813  07ea 8d000000      	callf	f_Display_LCD_String
4815  07ee               L3103:
4816                     ; 586 			uc_buffer = (U8)((uc_Rx1_Lin_Data[0] & 0x60)>>5);
4818  07ee c60000        	ld	a,_uc_Rx1_Lin_Data
4819  07f1 4e            	swap	a
4820  07f2 a406          	and	a,#6
4821  07f4 44            	srl	a
4822  07f5 6b05          	ld	(OFST-1,sp),a
4823                     ; 587 			if(uc_buffer == (U8)(1)){
4825  07f7 4a            	dec	a
4826  07f8 263b          	jrne	L7203
4827                     ; 588 				uc_fault_cnt++;
4829  07fa 0c06          	inc	(OFST+0,sp)
4830                     ; 589 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4830                     ; 590 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4830                     ; 591 				){
4832  07fc 270d          	jreq	L5303
4834  07fe 7b06          	ld	a,(OFST+0,sp)
4835  0800 a105          	cp	a,#5
4836  0802 2407          	jruge	L5303
4838  0804 c60003        	ld	a,_uc_Test_Page_Now
4839  0807 a102          	cp	a,#2
4840  0809 2711          	jreq	L3303
4841  080b               L5303:
4843  080b 7b06          	ld	a,(OFST+0,sp)
4844  080d a105          	cp	a,#5
4845  080f 2524          	jrult	L7203
4847  0811 a109          	cp	a,#9
4848  0813 2420          	jruge	L7203
4850  0815 c60003        	ld	a,_uc_Test_Page_Now
4851  0818 a103          	cp	a,#3
4852  081a 2619          	jrne	L7203
4853  081c               L3303:
4854                     ; 592 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
4856  081c 7b06          	ld	a,(OFST+0,sp)
4857  081e 5f            	clrw	x
4858  081f 97            	ld	xl,a
4859  0820 5a            	decw	x
4860  0821 a604          	ld	a,#4
4861  0823 8d000000      	callf	d_smodx
4863  0827 d60000        	ld	a,(_LCD_Line,x)
4864  082a 8d000000      	callf	f_Set_LCD_Address
4866                     ; 593 					Display_LCD_String("ULoOutOfRng");
4868  082e ae0078        	ldw	x,#L1403
4869  0831 8d000000      	callf	f_Display_LCD_String
4871  0835               L7203:
4872                     ; 597 			uc_buffer = (U8)(uc_Rx1_Lin_Data[1] & 0x03);
4874  0835 c60001        	ld	a,_uc_Rx1_Lin_Data+1
4875  0838 a403          	and	a,#3
4876  083a 6b05          	ld	(OFST-1,sp),a
4877                     ; 598 			if(uc_buffer == (U8)(1)){
4879  083c 4a            	dec	a
4880  083d 263b          	jrne	L3403
4881                     ; 599 				uc_fault_cnt++;
4883  083f 0c06          	inc	(OFST+0,sp)
4884                     ; 600 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4884                     ; 601 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4884                     ; 602 				){
4886  0841 270d          	jreq	L1503
4888  0843 7b06          	ld	a,(OFST+0,sp)
4889  0845 a105          	cp	a,#5
4890  0847 2407          	jruge	L1503
4892  0849 c60003        	ld	a,_uc_Test_Page_Now
4893  084c a102          	cp	a,#2
4894  084e 2711          	jreq	L7403
4895  0850               L1503:
4897  0850 7b06          	ld	a,(OFST+0,sp)
4898  0852 a105          	cp	a,#5
4899  0854 2524          	jrult	L3403
4901  0856 a109          	cp	a,#9
4902  0858 2420          	jruge	L3403
4904  085a c60003        	ld	a,_uc_Test_Page_Now
4905  085d a103          	cp	a,#3
4906  085f 2619          	jrne	L3403
4907  0861               L7403:
4908                     ; 603 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
4910  0861 7b06          	ld	a,(OFST+0,sp)
4911  0863 5f            	clrw	x
4912  0864 97            	ld	xl,a
4913  0865 5a            	decw	x
4914  0866 a604          	ld	a,#4
4915  0868 8d000000      	callf	d_smodx
4917  086c d60000        	ld	a,(_LCD_Line,x)
4918  086f 8d000000      	callf	f_Set_LCD_Address
4920                     ; 604 					Display_LCD_String("TmpOvrheatg");
4922  0873 ae006c        	ldw	x,#L5503
4923  0876 8d000000      	callf	f_Display_LCD_String
4925  087a               L3403:
4926                     ; 608 			uc_buffer = (U8)((uc_Rx1_Lin_Data[1] & 0x0C) >> 2);
4928  087a c60001        	ld	a,_uc_Rx1_Lin_Data+1
4929  087d a40c          	and	a,#12
4930  087f 44            	srl	a
4931  0880 44            	srl	a
4932  0881 6b05          	ld	(OFST-1,sp),a
4933                     ; 609 			if(uc_buffer == (U8)(1)){
4935  0883 4a            	dec	a
4936  0884 263b          	jrne	L7503
4937                     ; 610 				uc_fault_cnt++;
4939  0886 0c06          	inc	(OFST+0,sp)
4940                     ; 611 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4940                     ; 612 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4940                     ; 613 				){
4942  0888 270d          	jreq	L5603
4944  088a 7b06          	ld	a,(OFST+0,sp)
4945  088c a105          	cp	a,#5
4946  088e 2407          	jruge	L5603
4948  0890 c60003        	ld	a,_uc_Test_Page_Now
4949  0893 a102          	cp	a,#2
4950  0895 2711          	jreq	L3603
4951  0897               L5603:
4953  0897 7b06          	ld	a,(OFST+0,sp)
4954  0899 a105          	cp	a,#5
4955  089b 2524          	jrult	L7503
4957  089d a109          	cp	a,#9
4958  089f 2420          	jruge	L7503
4960  08a1 c60003        	ld	a,_uc_Test_Page_Now
4961  08a4 a103          	cp	a,#3
4962  08a6 2619          	jrne	L7503
4963  08a8               L3603:
4964                     ; 614 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
4966  08a8 7b06          	ld	a,(OFST+0,sp)
4967  08aa 5f            	clrw	x
4968  08ab 97            	ld	xl,a
4969  08ac 5a            	decw	x
4970  08ad a604          	ld	a,#4
4971  08af 8d000000      	callf	d_smodx
4973  08b3 d60000        	ld	a,(_LCD_Line,x)
4974  08b6 8d000000      	callf	f_Set_LCD_Address
4976                     ; 615 					Display_LCD_String("ICnsOutOfRng");
4978  08ba ae005f        	ldw	x,#L1703
4979  08bd 8d000000      	callf	f_Display_LCD_String
4981  08c1               L7503:
4982                     ; 619 			uc_buffer = (U8)((uc_Rx1_Lin_Data[1] & 0x30) >> 4);
4984  08c1 c60001        	ld	a,_uc_Rx1_Lin_Data+1
4985  08c4 4e            	swap	a
4986  08c5 a403          	and	a,#3
4987  08c7 6b05          	ld	(OFST-1,sp),a
4988                     ; 620 			if(uc_buffer == (U8)(1)){
4990  08c9 4a            	dec	a
4991  08ca 263b          	jrne	L3703
4992                     ; 621 				uc_fault_cnt++;
4994  08cc 0c06          	inc	(OFST+0,sp)
4995                     ; 622 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
4995                     ; 623 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
4995                     ; 624 				){
4997  08ce 270d          	jreq	L1013
4999  08d0 7b06          	ld	a,(OFST+0,sp)
5000  08d2 a105          	cp	a,#5
5001  08d4 2407          	jruge	L1013
5003  08d6 c60003        	ld	a,_uc_Test_Page_Now
5004  08d9 a102          	cp	a,#2
5005  08db 2711          	jreq	L7703
5006  08dd               L1013:
5008  08dd 7b06          	ld	a,(OFST+0,sp)
5009  08df a105          	cp	a,#5
5010  08e1 2524          	jrult	L3703
5012  08e3 a109          	cp	a,#9
5013  08e5 2420          	jruge	L3703
5015  08e7 c60003        	ld	a,_uc_Test_Page_Now
5016  08ea a103          	cp	a,#3
5017  08ec 2619          	jrne	L3703
5018  08ee               L7703:
5019                     ; 625 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);			
5021  08ee 7b06          	ld	a,(OFST+0,sp)
5022  08f0 5f            	clrw	x
5023  08f1 97            	ld	xl,a
5024  08f2 5a            	decw	x
5025  08f3 a604          	ld	a,#4
5026  08f5 8d000000      	callf	d_smodx
5028  08f9 d60000        	ld	a,(_LCD_Line,x)
5029  08fc 8d000000      	callf	f_Set_LCD_Address
5031                     ; 626 					Display_LCD_String("DmgInHwPro");
5033  0900 ae0054        	ldw	x,#L5013
5034  0903 8d000000      	callf	f_Display_LCD_String
5036  0907               L3703:
5037                     ; 630 			uc_buffer = (U8)((uc_Rx1_Lin_Data[1] & 0xC0) >> 6);
5039  0907 c60001        	ld	a,_uc_Rx1_Lin_Data+1
5040  090a 4e            	swap	a
5041  090b a40c          	and	a,#12
5042  090d 44            	srl	a
5043  090e 44            	srl	a
5044  090f 6b05          	ld	(OFST-1,sp),a
5045                     ; 631 			if(uc_buffer == (U8)(1)){
5047  0911 4a            	dec	a
5048  0912 263b          	jrne	L7013
5049                     ; 632 				uc_fault_cnt++;
5051  0914 0c06          	inc	(OFST+0,sp)
5052                     ; 633 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5052                     ; 634 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5052                     ; 635 				){
5054  0916 270d          	jreq	L5113
5056  0918 7b06          	ld	a,(OFST+0,sp)
5057  091a a105          	cp	a,#5
5058  091c 2407          	jruge	L5113
5060  091e c60003        	ld	a,_uc_Test_Page_Now
5061  0921 a102          	cp	a,#2
5062  0923 2711          	jreq	L3113
5063  0925               L5113:
5065  0925 7b06          	ld	a,(OFST+0,sp)
5066  0927 a105          	cp	a,#5
5067  0929 2524          	jrult	L7013
5069  092b a109          	cp	a,#9
5070  092d 2420          	jruge	L7013
5072  092f c60003        	ld	a,_uc_Test_Page_Now
5073  0932 a103          	cp	a,#3
5074  0934 2619          	jrne	L7013
5075  0936               L3113:
5076                     ; 636 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5078  0936 7b06          	ld	a,(OFST+0,sp)
5079  0938 5f            	clrw	x
5080  0939 97            	ld	xl,a
5081  093a 5a            	decw	x
5082  093b a604          	ld	a,#4
5083  093d 8d000000      	callf	d_smodx
5085  0941 d60000        	ld	a,(_LCD_Line,x)
5086  0944 8d000000      	callf	f_Set_LCD_Address
5088                     ; 637 					Display_LCD_String("DmgPCBTmp");
5090  0948 ae004a        	ldw	x,#L1213
5091  094b 8d000000      	callf	f_Display_LCD_String
5093  094f               L7013:
5094                     ; 641 			uc_buffer = (U8)(uc_Rx1_Lin_Data[2] & 0x03);
5096  094f c60002        	ld	a,_uc_Rx1_Lin_Data+2
5097  0952 a403          	and	a,#3
5098  0954 6b05          	ld	(OFST-1,sp),a
5099                     ; 642 			if(uc_buffer == (U8)(1)){
5101  0956 4a            	dec	a
5102  0957 263b          	jrne	L3213
5103                     ; 643 				uc_fault_cnt++;
5105  0959 0c06          	inc	(OFST+0,sp)
5106                     ; 644 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5106                     ; 645 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5106                     ; 646 				){
5108  095b 270d          	jreq	L1313
5110  095d 7b06          	ld	a,(OFST+0,sp)
5111  095f a105          	cp	a,#5
5112  0961 2407          	jruge	L1313
5114  0963 c60003        	ld	a,_uc_Test_Page_Now
5115  0966 a102          	cp	a,#2
5116  0968 2711          	jreq	L7213
5117  096a               L1313:
5119  096a 7b06          	ld	a,(OFST+0,sp)
5120  096c a105          	cp	a,#5
5121  096e 2524          	jrult	L3213
5123  0970 a109          	cp	a,#9
5124  0972 2420          	jruge	L3213
5126  0974 c60003        	ld	a,_uc_Test_Page_Now
5127  0977 a103          	cp	a,#3
5128  0979 2619          	jrne	L3213
5129  097b               L7213:
5130                     ; 647 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5132  097b 7b06          	ld	a,(OFST+0,sp)
5133  097d 5f            	clrw	x
5134  097e 97            	ld	xl,a
5135  097f 5a            	decw	x
5136  0980 a604          	ld	a,#4
5137  0982 8d000000      	callf	d_smodx
5139  0986 d60000        	ld	a,(_LCD_Line,x)
5140  0989 8d000000      	callf	f_Set_LCD_Address
5142                     ; 648 					Display_LCD_String("DmgShortOpen");
5144  098d ae003d        	ldw	x,#L5313
5145  0990 8d000000      	callf	f_Display_LCD_String
5147  0994               L3213:
5148                     ; 652 			uc_buffer = (U8)((uc_Rx1_Lin_Data[2] & 0x0C)>>2);
5150  0994 c60002        	ld	a,_uc_Rx1_Lin_Data+2
5151  0997 a40c          	and	a,#12
5152  0999 44            	srl	a
5153  099a 44            	srl	a
5154  099b 6b05          	ld	(OFST-1,sp),a
5155                     ; 653 			if(uc_buffer == (U8)(1)){
5157  099d 4a            	dec	a
5158  099e 263b          	jrne	L7313
5159                     ; 654 				uc_fault_cnt++;
5161  09a0 0c06          	inc	(OFST+0,sp)
5162                     ; 655 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5162                     ; 656 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5162                     ; 657 				){
5164  09a2 270d          	jreq	L5413
5166  09a4 7b06          	ld	a,(OFST+0,sp)
5167  09a6 a105          	cp	a,#5
5168  09a8 2407          	jruge	L5413
5170  09aa c60003        	ld	a,_uc_Test_Page_Now
5171  09ad a102          	cp	a,#2
5172  09af 2711          	jreq	L3413
5173  09b1               L5413:
5175  09b1 7b06          	ld	a,(OFST+0,sp)
5176  09b3 a105          	cp	a,#5
5177  09b5 2524          	jrult	L7313
5179  09b7 a109          	cp	a,#9
5180  09b9 2420          	jruge	L7313
5182  09bb c60003        	ld	a,_uc_Test_Page_Now
5183  09be a103          	cp	a,#3
5184  09c0 2619          	jrne	L7313
5185  09c2               L3413:
5186                     ; 658 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5188  09c2 7b06          	ld	a,(OFST+0,sp)
5189  09c4 5f            	clrw	x
5190  09c5 97            	ld	xl,a
5191  09c6 5a            	decw	x
5192  09c7 a604          	ld	a,#4
5193  09c9 8d000000      	callf	d_smodx
5195  09cd d60000        	ld	a,(_LCD_Line,x)
5196  09d0 8d000000      	callf	f_Set_LCD_Address
5198                     ; 659 					Display_LCD_String("DmgHVISns");
5200  09d4 ae0033        	ldw	x,#L1513
5201  09d7 8d000000      	callf	f_Display_LCD_String
5203  09db               L7313:
5204                     ; 663 			uc_buffer = (U8)((uc_Rx1_Lin_Data[2] & 0x30) >> 4);
5206  09db c60002        	ld	a,_uc_Rx1_Lin_Data+2
5207  09de 4e            	swap	a
5208  09df a403          	and	a,#3
5209  09e1 6b05          	ld	(OFST-1,sp),a
5210                     ; 664 			if(uc_buffer == (U8)(1)){
5212  09e3 4a            	dec	a
5213  09e4 263b          	jrne	L3513
5214                     ; 665 				uc_fault_cnt++;
5216  09e6 0c06          	inc	(OFST+0,sp)
5217                     ; 666 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5217                     ; 667 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5217                     ; 668 				){
5219  09e8 270d          	jreq	L1613
5221  09ea 7b06          	ld	a,(OFST+0,sp)
5222  09ec a105          	cp	a,#5
5223  09ee 2407          	jruge	L1613
5225  09f0 c60003        	ld	a,_uc_Test_Page_Now
5226  09f3 a102          	cp	a,#2
5227  09f5 2711          	jreq	L7513
5228  09f7               L1613:
5230  09f7 7b06          	ld	a,(OFST+0,sp)
5231  09f9 a105          	cp	a,#5
5232  09fb 2524          	jrult	L3513
5234  09fd a109          	cp	a,#9
5235  09ff 2420          	jruge	L3513
5237  0a01 c60003        	ld	a,_uc_Test_Page_Now
5238  0a04 a103          	cp	a,#3
5239  0a06 2619          	jrne	L3513
5240  0a08               L7513:
5241                     ; 669 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5243  0a08 7b06          	ld	a,(OFST+0,sp)
5244  0a0a 5f            	clrw	x
5245  0a0b 97            	ld	xl,a
5246  0a0c 5a            	decw	x
5247  0a0d a604          	ld	a,#4
5248  0a0f 8d000000      	callf	d_smodx
5250  0a13 d60000        	ld	a,(_LCD_Line,x)
5251  0a16 8d000000      	callf	f_Set_LCD_Address
5253                     ; 670 					Display_LCD_String("DmgMemErr");
5255  0a1a ae0029        	ldw	x,#L5613
5256  0a1d 8d000000      	callf	f_Display_LCD_String
5258  0a21               L3513:
5259                     ; 674 			uc_buffer = (U8)((uc_Rx1_Lin_Data[2] & 0xC0) >> 6);
5261  0a21 c60002        	ld	a,_uc_Rx1_Lin_Data+2
5262  0a24 4e            	swap	a
5263  0a25 a40c          	and	a,#12
5264  0a27 44            	srl	a
5265  0a28 44            	srl	a
5266  0a29 6b05          	ld	(OFST-1,sp),a
5267                     ; 675 			if(uc_buffer == (U8)(1)){
5269  0a2b 4a            	dec	a
5270  0a2c 263b          	jrne	L7613
5271                     ; 676 				uc_fault_cnt++;
5273  0a2e 0c06          	inc	(OFST+0,sp)
5274                     ; 677 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5274                     ; 678 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5274                     ; 679 				){
5276  0a30 270d          	jreq	L5713
5278  0a32 7b06          	ld	a,(OFST+0,sp)
5279  0a34 a105          	cp	a,#5
5280  0a36 2407          	jruge	L5713
5282  0a38 c60003        	ld	a,_uc_Test_Page_Now
5283  0a3b a102          	cp	a,#2
5284  0a3d 2711          	jreq	L3713
5285  0a3f               L5713:
5287  0a3f 7b06          	ld	a,(OFST+0,sp)
5288  0a41 a105          	cp	a,#5
5289  0a43 2524          	jrult	L7613
5291  0a45 a109          	cp	a,#9
5292  0a47 2420          	jruge	L7613
5294  0a49 c60003        	ld	a,_uc_Test_Page_Now
5295  0a4c a103          	cp	a,#3
5296  0a4e 2619          	jrne	L7613
5297  0a50               L3713:
5298                     ; 680 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);	
5300  0a50 7b06          	ld	a,(OFST+0,sp)
5301  0a52 5f            	clrw	x
5302  0a53 97            	ld	xl,a
5303  0a54 5a            	decw	x
5304  0a55 a604          	ld	a,#4
5305  0a57 8d000000      	callf	d_smodx
5307  0a5b d60000        	ld	a,(_LCD_Line,x)
5308  0a5e 8d000000      	callf	f_Set_LCD_Address
5310                     ; 681 					Display_LCD_String("DmgCoreTmp");
5312  0a62 ae001e        	ldw	x,#L1023
5313  0a65 8d000000      	callf	f_Display_LCD_String
5315  0a69               L7613:
5316                     ; 685 			uc_buffer = (U8)(uc_Rx1_Lin_Data[3] & 0x03);
5318  0a69 c60003        	ld	a,_uc_Rx1_Lin_Data+3
5319  0a6c a403          	and	a,#3
5320  0a6e 6b05          	ld	(OFST-1,sp),a
5321                     ; 686 			if(uc_buffer == (U8)(1)){
5323  0a70 4a            	dec	a
5324  0a71 263b          	jrne	L3023
5325                     ; 687 				uc_fault_cnt++;
5327  0a73 0c06          	inc	(OFST+0,sp)
5328                     ; 688 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5328                     ; 689 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5328                     ; 690 				){
5330  0a75 270d          	jreq	L1123
5332  0a77 7b06          	ld	a,(OFST+0,sp)
5333  0a79 a105          	cp	a,#5
5334  0a7b 2407          	jruge	L1123
5336  0a7d c60003        	ld	a,_uc_Test_Page_Now
5337  0a80 a102          	cp	a,#2
5338  0a82 2711          	jreq	L7023
5339  0a84               L1123:
5341  0a84 7b06          	ld	a,(OFST+0,sp)
5342  0a86 a105          	cp	a,#5
5343  0a88 2524          	jrult	L3023
5345  0a8a a109          	cp	a,#9
5346  0a8c 2420          	jruge	L3023
5348  0a8e c60003        	ld	a,_uc_Test_Page_Now
5349  0a91 a103          	cp	a,#3
5350  0a93 2619          	jrne	L3023
5351  0a95               L7023:
5352                     ; 691 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5354  0a95 7b06          	ld	a,(OFST+0,sp)
5355  0a97 5f            	clrw	x
5356  0a98 97            	ld	xl,a
5357  0a99 5a            	decw	x
5358  0a9a a604          	ld	a,#4
5359  0a9c 8d000000      	callf	d_smodx
5361  0aa0 d60000        	ld	a,(_LCD_Line,x)
5362  0aa3 8d000000      	callf	f_Set_LCD_Address
5364                     ; 692 					Display_LCD_String("PCBOvrTmp");
5366  0aa7 ae0014        	ldw	x,#L5123
5367  0aaa 8d000000      	callf	f_Display_LCD_String
5369  0aae               L3023:
5370                     ; 696 			uc_buffer = (U8)((uc_Rx1_Lin_Data[3] & 0x0C)>>2);
5372  0aae c60003        	ld	a,_uc_Rx1_Lin_Data+3
5373  0ab1 a40c          	and	a,#12
5374  0ab3 44            	srl	a
5375  0ab4 44            	srl	a
5376  0ab5 6b05          	ld	(OFST-1,sp),a
5377                     ; 697 			if(uc_buffer == (U8)(1)){
5379  0ab7 4a            	dec	a
5380  0ab8 263b          	jrne	L7123
5381                     ; 698 				uc_fault_cnt++;
5383  0aba 0c06          	inc	(OFST+0,sp)
5384                     ; 699 				if(((uc_fault_cnt > (U8)(0)) && (uc_fault_cnt <= (U8)(4)) && (uc_Test_Page_Now == (U8)(2)))
5384                     ; 700 					|| ((uc_fault_cnt > (U8)(4)) && (uc_fault_cnt <= (U8)(8)) && (uc_Test_Page_Now == (U8)(3)))		     
5384                     ; 701 				){
5386  0abc 270d          	jreq	L5223
5388  0abe 7b06          	ld	a,(OFST+0,sp)
5389  0ac0 a105          	cp	a,#5
5390  0ac2 2407          	jruge	L5223
5392  0ac4 c60003        	ld	a,_uc_Test_Page_Now
5393  0ac7 a102          	cp	a,#2
5394  0ac9 2711          	jreq	L3223
5395  0acb               L5223:
5397  0acb 7b06          	ld	a,(OFST+0,sp)
5398  0acd a105          	cp	a,#5
5399  0acf 2524          	jrult	L7123
5401  0ad1 a109          	cp	a,#9
5402  0ad3 2420          	jruge	L7123
5404  0ad5 c60003        	ld	a,_uc_Test_Page_Now
5405  0ad8 a103          	cp	a,#3
5406  0ada 2619          	jrne	L7123
5407  0adc               L3223:
5408                     ; 702 					Set_LCD_Address(LCD_Line[(uc_fault_cnt-1) % (U8)(4)]);		
5410  0adc 7b06          	ld	a,(OFST+0,sp)
5411  0ade 5f            	clrw	x
5412  0adf 97            	ld	xl,a
5413  0ae0 5a            	decw	x
5414  0ae1 a604          	ld	a,#4
5415  0ae3 8d000000      	callf	d_smodx
5417  0ae7 d60000        	ld	a,(_LCD_Line,x)
5418  0aea 8d000000      	callf	f_Set_LCD_Address
5420                     ; 703 					Display_LCD_String("CoreOvrTmp");
5422  0aee ae0009        	ldw	x,#L1323
5423  0af1 8d000000      	callf	f_Display_LCD_String
5425  0af5               L7123:
5426                     ; 707 			if(!uc_fault_cnt){
5428  0af5 7b06          	ld	a,(OFST+0,sp)
5429  0af7 260e          	jrne	L1672
5430                     ; 708 				Set_LCD_Address(LCD_Line[0]);
5432  0af9 c60000        	ld	a,_LCD_Line
5433  0afc 8d000000      	callf	f_Set_LCD_Address
5435                     ; 709 				Display_LCD_String("None");
5437  0b00 ae0004        	ldw	x,#L5323
5438  0b03               LC021:
5439  0b03 8d000000      	callf	f_Display_LCD_String
5441  0b07               L1672:
5442                     ; 713 		Set_LCD_Address((U8)(LCD_Line[3]+14));
5445                     ; 714 		Display_LCD_String("RX");
5448  0b07 c60003        	ld	a,_LCD_Line+3
5449  0b0a ab0e          	add	a,#14
5450  0b0c 8d000000      	callf	f_Set_LCD_Address
5452  0b10 ae00a2        	ldw	x,#L3572
5454  0b13               L5462:
5455  0b13 8d000000      	callf	f_Display_LCD_String
5456                     ; 717 	if((b_Lin_Com_On_flag == ON)){
5458  0b17 a60f          	ld	a,#15
5459  0b19 7207000b13    	btjf	_uc_Test_Ctrl_Reg,#3,L7323
5460                     ; 718 		Set_LCD_Address((unsigned char)(0x00+15));
5462  0b1e 8d000000      	callf	f_Set_LCD_Address
5464                     ; 719 		if(b_Blink_250_Flag){Display_LCD_String("C");}
5466  0b22 7203000005    	btjf	_uc_LCD_Blink_Reg,#1,L1423
5469  0b27 ae00a5        	ldw	x,#L5272
5472  0b2a 200c          	jpf	LC023
5473  0b2c               L1423:
5474                     ; 720 		else{Display_LCD_String(" ");}
5476  0b2c ae0002        	ldw	x,#L5423
5478  0b2f 2007          	jpf	LC023
5479  0b31               L7323:
5480                     ; 723 		Set_LCD_Address((unsigned char)(0x00+15));
5482  0b31 8d000000      	callf	f_Set_LCD_Address
5484                     ; 724 		Display_LCD_String("N");
5486  0b35 ae0000        	ldw	x,#L1523
5487  0b38               LC023:
5488  0b38 8d000000      	callf	f_Display_LCD_String
5490  0b3c               L7423:
5491                     ; 727 	return;
5494  0b3c 5b06          	addw	sp,#6
5495  0b3e 87            	retf	
5520                     ; 731 void Test_Controller_Routine(void)
5520                     ; 732 {
5521                     	switch	.text
5522  0b3f               f_Test_Controller_Routine:
5526                     ; 733 	Test_Ctrl_LCD_Display_Control(); 
5528  0b3f 8dba03ba      	callf	f_Test_Ctrl_LCD_Display_Control
5530                     ; 734 	Test_Ctrl_Swtich_Control();
5533                     ; 736 	return;
5536  0b43 acb001b0      	jpf	f_Test_Ctrl_Swtich_Control
5570                     ; 741 void Test_Ctrl_Reset_Values(void)
5570                     ; 742 {
5571                     	switch	.text
5572  0b47               f_Test_Ctrl_Reset_Values:
5576                     ; 743 	uc_Test_Ctrl_Reg = 0x00;			// Test_Controller_Control_Register
5578  0b47 725f000b      	clr	_uc_Test_Ctrl_Reg
5579                     ; 744 	uc_Model_Select_Reg = 0x00;		// PTC_Model_Select_Register
5581  0b4b 725f000c      	clr	_uc_Model_Select_Reg
5582                     ; 745 	uc_Rx_TimeOut_Reg = 0x00;		// Rx Data frame Timeout Register
5584  0b4f 725f000a      	clr	_uc_Rx_TimeOut_Reg
5585                     ; 747 	uc_Test_Page_Now = 0;			// Test_Controller_Page_Now
5587  0b53 725f0003      	clr	_uc_Test_Page_Now
5588                     ; 748 	uc_Test_Page_Pre = 0;			// Test_Controller_Page_Previous
5590  0b57 725f0002      	clr	_uc_Test_Page_Pre
5591                     ; 749 	uc_Test_Data_Select_Num = 0;	// Test_Controller_Data_Selection_Number
5593  0b5b 725f0001      	clr	_uc_Test_Data_Select_Num
5594                     ; 751 	uc_Duty_Unit = 1;		// Duty_Moving_Unit
5596  0b5f 35010000      	mov	_uc_Duty_Unit,#1
5597                     ; 753 	ui_Rx1_TimeOut_Cnt = 0;	// Rx1_Frame_TimeOut_Counter
5599  0b63 5f            	clrw	x
5600  0b64 cf0006        	ldw	_ui_Rx1_TimeOut_Cnt,x
5601                     ; 754 	ui_Rx2_TimeOut_Cnt = 0;	// Rx2_Frame_TimeOut_Counter
5603  0b67 cf0004        	ldw	_ui_Rx2_TimeOut_Cnt,x
5604                     ; 756 	uc_Heater_Enable_Flag = 0;	// Heater_Enable_Flag
5606  0b6a 725f0009      	clr	_uc_Heater_Enable_Flag
5607                     ; 757 	uc_target_Power_Perc = 0;		// Target_Power_Percentage
5609  0b6e 725f0008      	clr	_uc_target_Power_Perc
5610                     ; 759 	return;
5613  0b72 87            	retf	
5750                     	xdef	f_Test_Ctrl_LCD_Display_Control
5751                     	xdef	f_Test_Ctrl_Text_Display_Handling
5752                     	xdef	f_Test_Ctrl_Swtich_Control
5753                     	xdef	f_Test_Ctrl_Value_Change
5754                     	xdef	f_Model_Select_LCD_Display_Control
5755                     	xdef	f_Model_Select_Switch_Control
5756                     	xdef	f_Model_Select_Display_Handling
5757                     	xdef	f_First_Switch_Control
5758                     	switch	.bss
5759  0000               _uc_Duty_Unit:
5760  0000 00            	ds.b	1
5761                     	xdef	_uc_Duty_Unit
5762  0001               _uc_Test_Data_Select_Num:
5763  0001 00            	ds.b	1
5764                     	xdef	_uc_Test_Data_Select_Num
5765  0002               _uc_Test_Page_Pre:
5766  0002 00            	ds.b	1
5767                     	xdef	_uc_Test_Page_Pre
5768  0003               _uc_Test_Page_Now:
5769  0003 00            	ds.b	1
5770                     	xdef	_uc_Test_Page_Now
5771                     	xref	f_strcpy
5772                     	xref	f_Start_Zig_Display
5773                     	xdef	f_Test_Ctrl_Reset_Values
5774                     	xdef	f_Test_Controller_Routine
5775                     	xdef	f_Model_Select_Routine
5776                     	xdef	f_Test_Controller_First_Routine
5777  0004               _ui_Rx2_TimeOut_Cnt:
5778  0004 0000          	ds.b	2
5779                     	xdef	_ui_Rx2_TimeOut_Cnt
5780  0006               _ui_Rx1_TimeOut_Cnt:
5781  0006 0000          	ds.b	2
5782                     	xdef	_ui_Rx1_TimeOut_Cnt
5783                     	xdef	_uc_Rx2_Lin_Data
5784                     	xdef	_uc_Rx1_Lin_Data
5785  0008               _uc_target_Power_Perc:
5786  0008 00            	ds.b	1
5787                     	xdef	_uc_target_Power_Perc
5788  0009               _uc_Heater_Enable_Flag:
5789  0009 00            	ds.b	1
5790                     	xdef	_uc_Heater_Enable_Flag
5791  000a               _uc_Rx_TimeOut_Reg:
5792  000a 00            	ds.b	1
5793                     	xdef	_uc_Rx_TimeOut_Reg
5794  000b               _uc_Test_Ctrl_Reg:
5795  000b 00            	ds.b	1
5796                     	xdef	_uc_Test_Ctrl_Reg
5797  000c               _uc_Model_Select_Reg:
5798  000c 00            	ds.b	1
5799                     	xdef	_uc_Model_Select_Reg
5800                     	xref	_uc_Button_Status_Reg
5801                     	xref	f_Num_Display_LCD
5802                     	xref	f_Display_LCD_String
5803                     	xref	f_Set_LCD_Address
5804                     	xref	_LCD_Dis_Data
5805                     	xref	_LCD_Line
5806                     	xref	_uc_LCD_Blink_Reg
5807                     	xref	_uc_System_Ctrl_Reg
5808                     .const:	section	.text
5809  0000               L1523:
5810  0000 4e00          	dc.b	"N",0
5811  0002               L5423:
5812  0002 2000          	dc.b	" ",0
5813  0004               L5323:
5814  0004 4e6f6e6500    	dc.b	"None",0
5815  0009               L1323:
5816  0009 436f72654f76  	dc.b	"CoreOvrTmp",0
5817  0014               L5123:
5818  0014 5043424f7672  	dc.b	"PCBOvrTmp",0
5819  001e               L1023:
5820  001e 446d67436f72  	dc.b	"DmgCoreTmp",0
5821  0029               L5613:
5822  0029 446d674d656d  	dc.b	"DmgMemErr",0
5823  0033               L1513:
5824  0033 446d67485649  	dc.b	"DmgHVISns",0
5825  003d               L5313:
5826  003d 446d6753686f  	dc.b	"DmgShortOpen",0
5827  004a               L1213:
5828  004a 446d67504342  	dc.b	"DmgPCBTmp",0
5829  0054               L5013:
5830  0054 446d67496e48  	dc.b	"DmgInHwPro",0
5831  005f               L1703:
5832  005f 49436e734f75  	dc.b	"ICnsOutOfRng",0
5833  006c               L5503:
5834  006c 546d704f7672  	dc.b	"TmpOvrheatg",0
5835  0078               L1403:
5836  0078 554c6f4f7574  	dc.b	"ULoOutOfRng",0
5837  0084               L5203:
5838  0084 48564f75744f  	dc.b	"HVOutOfRng",0
5839  008f               L1103:
5840  008f 466c74496e43  	dc.b	"FltInCom",0
5841  0098               L5772:
5842  0098 52734572725f  	dc.b	"RsErr_EAH",0
5843  00a2               L3572:
5844  00a2 525800        	dc.b	"RX",0
5845  00a5               L5272:
5846  00a5 4300          	dc.b	"C",0
5847  00a7               L3272:
5848  00a7 2d00          	dc.b	"-",0
5849  00a9               L1072:
5850  00a9 5600          	dc.b	"V",0
5851  00ab               L7662:
5852  00ab 4100          	dc.b	"A",0
5853  00ad               L3462:
5854  00ad 54265200      	dc.b	"T&R",0
5855  00b1               L1462:
5856  00b1 4e4100        	dc.b	"NA",0
5857  00b4               L5362:
5858  00b4 50726f644d6f  	dc.b	"ProdMod",0
5859  00bc               L7262:
5860  00bc 4f70657200    	dc.b	"Oper",0
5861  00c1               L1262:
5862  00c1 4c6f636b5065  	dc.b	"LockPerm",0
5863  00ca               L3162:
5864  00ca 4c6f636b5365  	dc.b	"LockServ",0
5865  00d3               L5062:
5866  00d3 4c6f636b4e65  	dc.b	"LockNext",0
5867  00dc               L7752:
5868  00dc 6f666600      	dc.b	"off",0
5869  00e0               L1552:
5870  00e0 4e4300        	dc.b	"NC",0
5871  00e3               L1052:
5872  00e3 5472756500    	dc.b	"True",0
5873  00e8               L3742:
5874  00e8 46616c7300    	dc.b	"Fals",0
5875  00ed               L5342:
5876  00ed 2500          	dc.b	"%",0
5877  00ef               L3342:
5878  00ef 2e00          	dc.b	".",0
5879  00f1               L5242:
5880  00f1 445f556e6974  	dc.b	"D_Unit:",0
5881  00f9               L3242:
5882  00f9 2a4f5054494f  	dc.b	"*OPTION*",0
5883  0102               L5732:
5884  0102 436f725f546d  	dc.b	"Cor_Tmp:",0
5885  010b               L3732:
5886  010b 5043425f546d  	dc.b	"PCB_Tmp:",0
5887  0114               L1732:
5888  0114 4856205f566c  	dc.b	"HV _Vlt:",0
5889  011d               L7632:
5890  011d 4375725f436e  	dc.b	"Cur_Cns:",0
5891  0126               L5632:
5892  0126 4854525f5374  	dc.b	"HTR_Sts:",0
5893  012f               L3632:
5894  012f 5077725f436e  	dc.b	"Pwr_Cns:",0
5895  0138               L1632:
5896  0138 5441525f5077  	dc.b	"TAR_Pwr:",0
5897  0141               L7532:
5898  0141 4854525f456e  	dc.b	"HTR_En :",0
5899  014a               L1671:
5900  014a 00            	dc.b	0
5901  014b               L7571:
5902  014b 4c4446205630  	dc.b	"LDF V03",0
5903  0153               L5571:
5904  0153 4c4446205630  	dc.b	"LDF V02",0
5905  015b               L3571:
5906  015b 2a4643413532  	dc.b	"*FCA520 Model*",0
5907                     	xref.b	c_x
5927                     	xref	d_smodx
5928                     	end

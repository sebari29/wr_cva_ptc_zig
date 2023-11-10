   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2655                     	switch	.data
2656  0000               _LCD_Line:
2657  0000 00            	dc.b	0
2658  0001 c0            	dc.b	192
2659  0002 10            	dc.b	16
2660  0003 d0            	dc.b	208
2694                     ; 27 void LCD_Blink_Timer_Control(void)
2694                     ; 28 {
2696                     	switch	.text
2697  0000               _LCD_Blink_Timer_Control:
2701                     ; 29 	ui_blink_timer_cnt++;
2703  0000 725c0000      	inc	_ui_blink_timer_cnt
2704                     ; 31 	if((ui_blink_timer_cnt % (U16)(10)) == (U16)(0)){ b_Blink_100_Flag ^= ON; Clear_Display_LCD();}
2706  0004 c60000        	ld	a,_ui_blink_timer_cnt
2707  0007 5f            	clrw	x
2708  0008 97            	ld	xl,a
2709  0009 90ae000a      	ldw	y,#10
2710  000d 65            	divw	x,y
2711  000e 51            	exgw	x,y
2712  000f a30000        	cpw	x,#0
2713  0012 2607          	jrne	L1271
2716  0014 90100041      	bcpl	_uc_LCD_Blink_Reg,#0
2719  0018 cd00ff        	call	_Clear_Display_LCD
2721  001b               L1271:
2722                     ; 32 	if((ui_blink_timer_cnt % (U16)(25)) == (U16)(0)){ b_Blink_250_Flag ^= ON; }
2724  001b c60000        	ld	a,_ui_blink_timer_cnt
2725  001e 5f            	clrw	x
2726  001f 97            	ld	xl,a
2727  0020 90ae0019      	ldw	y,#25
2728  0024 65            	divw	x,y
2729  0025 51            	exgw	x,y
2730  0026 a30000        	cpw	x,#0
2731  0029 2604          	jrne	L3271
2734  002b 90120041      	bcpl	_uc_LCD_Blink_Reg,#1
2735  002f               L3271:
2736                     ; 33 	if((ui_blink_timer_cnt % (U16)(50)) == (U16)(0)){ b_Blink_500_Flag ^= ON; }
2738  002f c60000        	ld	a,_ui_blink_timer_cnt
2739  0032 5f            	clrw	x
2740  0033 97            	ld	xl,a
2741  0034 90ae0032      	ldw	y,#50
2742  0038 65            	divw	x,y
2743  0039 51            	exgw	x,y
2744  003a a30000        	cpw	x,#0
2745  003d 2604          	jrne	L5271
2748  003f 90140041      	bcpl	_uc_LCD_Blink_Reg,#2
2749  0043               L5271:
2750                     ; 34 	if((ui_blink_timer_cnt % (U16)(100)) == (U16)(0)){ b_Blink_1s_Flag ^= ON; }
2752  0043 c60000        	ld	a,_ui_blink_timer_cnt
2753  0046 5f            	clrw	x
2754  0047 97            	ld	xl,a
2755  0048 90ae0064      	ldw	y,#100
2756  004c 65            	divw	x,y
2757  004d 51            	exgw	x,y
2758  004e a30000        	cpw	x,#0
2759  0051 2604          	jrne	L7271
2762  0053 90160041      	bcpl	_uc_LCD_Blink_Reg,#3
2763  0057               L7271:
2764                     ; 35 	if((ui_blink_timer_cnt % (U16)(200)) == (U16)(0)){ 
2766  0057 c60000        	ld	a,_ui_blink_timer_cnt
2767  005a 5f            	clrw	x
2768  005b 97            	ld	xl,a
2769  005c a6c8          	ld	a,#200
2770  005e 62            	div	x,a
2771  005f 5f            	clrw	x
2772  0060 97            	ld	xl,a
2773  0061 a30000        	cpw	x,#0
2774  0064 2608          	jrne	L1371
2775                     ; 36 		b_Blink_2s_Flag ^= ON; 
2777  0066 90180041      	bcpl	_uc_LCD_Blink_Reg,#4
2778                     ; 37 		ui_blink_timer_cnt = 0;
2780  006a 725f0000      	clr	_ui_blink_timer_cnt
2781  006e               L1371:
2782                     ; 40 	return;
2785  006e 81            	ret
2832                     ; 45 void Delay_ms(U8 Delay)
2832                     ; 46 {
2833                     	switch	.text
2834  006f               _Delay_ms:
2836  006f 88            	push	a
2837  0070 89            	pushw	x
2838       00000002      OFST:	set	2
2841  0071               L3571:
2842                     ; 48 	do{	i = 8;
2844  0071 a608          	ld	a,#8
2845  0073 6b02          	ld	(OFST+0,sp),a
2846                     ; 49 	Windows_Watchdog_Clear();
2848  0075 cd0000        	call	_Windows_Watchdog_Clear
2850  0078               L1671:
2851                     ; 50 		do{ Delay_us(250);  }while(--i);
2853  0078 a6fb          	ld	a,#251
2854  007a 6b01          	ld	(OFST-1,sp),a
2856  007c               L3771:
2859  007c 0a01          	dec	(OFST-1,sp)
2860  007e 26fc          	jrne	L3771
2863  0080 0a02          	dec	(OFST+0,sp)
2864  0082 26f4          	jrne	L1671
2865                     ; 51 	}while(--Delay);
2867  0084 0a03          	dec	(OFST+1,sp)
2868  0086 26e9          	jrne	L3571
2869                     ; 52 	return;
2872  0088 5b03          	addw	sp,#3
2873  008a 81            	ret
2914                     ; 56 void Set_LCD_Command(U8 Cmd)
2914                     ; 57 {
2915                     	switch	.text
2916  008b               _Set_LCD_Command:
2918  008b 88            	push	a
2919       00000001      OFST:	set	1
2922                     ; 58 	LCD_Data	= Cmd;
2924  008c c75005        	ld	_PB_ODR,a
2925                     ; 59 	LCD_EN	= 1;
2927  008f 72165019      	bset	_PF_ODR,#3
2928                     ; 60 	Delay_us(150);//100
2930  0093 a697          	ld	a,#151
2931  0095 6b01          	ld	(OFST+0,sp),a
2933  0097               L1202:
2936  0097 0a01          	dec	(OFST+0,sp)
2937  0099 26fc          	jrne	L1202
2938                     ; 61 	LCD_EN	= 0;
2941  009b 72175019      	bres	_PF_ODR,#3
2942                     ; 62 	return;
2945  009f 84            	pop	a
2946  00a0 81            	ret
2987                     ; 66 void Set_LCD_Address(U8 Add)
2987                     ; 67 {
2988                     	switch	.text
2989  00a1               _Set_LCD_Address:
2991  00a1 88            	push	a
2992       00000001      OFST:	set	1
2995                     ; 68 	LCD_Data	= (unsigned char)(Add | 0x80);
2997  00a2 aa80          	or	a,#128
2998  00a4 c75005        	ld	_PB_ODR,a
2999                     ; 69 	LCD_EN	= 1;
3001  00a7 72165019      	bset	_PF_ODR,#3
3002                     ; 70 	Delay_us(150);//100
3004  00ab a697          	ld	a,#151
3005  00ad 6b01          	ld	(OFST+0,sp),a
3007  00af               L7402:
3010  00af 0a01          	dec	(OFST+0,sp)
3011  00b1 26fc          	jrne	L7402
3012                     ; 71 	LCD_EN	= 0;
3015  00b3 72175019      	bres	_PF_ODR,#3
3016                     ; 72 	return;
3019  00b7 84            	pop	a
3020  00b8 81            	ret
3061                     ; 76 void Display_LCD_Data(U8 Data)
3061                     ; 77 {
3062                     	switch	.text
3063  00b9               _Display_LCD_Data:
3065  00b9 88            	push	a
3066       00000001      OFST:	set	1
3069                     ; 78 	LCD_Data = Data;
3071  00ba c75005        	ld	_PB_ODR,a
3072                     ; 79 	LCD_RS = 1;
3074  00bd 721a5019      	bset	_PF_ODR,#5
3075                     ; 80 	LCD_EN = 1;
3077  00c1 72165019      	bset	_PF_ODR,#3
3078                     ; 81 	Delay_us(150);
3080  00c5 a697          	ld	a,#151
3081  00c7 6b01          	ld	(OFST+0,sp),a
3083  00c9               L5702:
3086  00c9 0a01          	dec	(OFST+0,sp)
3087  00cb 26fc          	jrne	L5702
3088                     ; 82 	LCD_EN = 0;
3091  00cd 72175019      	bres	_PF_ODR,#3
3092                     ; 83 	LCD_RS = 0;
3094  00d1 721b5019      	bres	_PF_ODR,#5
3095                     ; 84 	return;
3098  00d5 84            	pop	a
3099  00d6 81            	ret
3135                     ; 88 void Display_LCD_String(U8 *str)
3135                     ; 89 {
3136                     	switch	.text
3137  00d7               _Display_LCD_String:
3139  00d7 89            	pushw	x
3140       00000000      OFST:	set	0
3143  00d8 200d          	jra	L3212
3144  00da               L7112:
3145                     ; 90 	for(; *str;){ Display_LCD_Data(*str++);	}
3147  00da 1e01          	ldw	x,(OFST+1,sp)
3148  00dc 1c0001        	addw	x,#1
3149  00df 1f01          	ldw	(OFST+1,sp),x
3150  00e1 1d0001        	subw	x,#1
3151  00e4 f6            	ld	a,(x)
3152  00e5 add2          	call	_Display_LCD_Data
3154  00e7               L3212:
3157  00e7 1e01          	ldw	x,(OFST+1,sp)
3158  00e9 7d            	tnz	(x)
3159  00ea 26ee          	jrne	L7112
3160                     ; 91 	return;
3163  00ec 85            	popw	x
3164  00ed 81            	ret
3189                     ; 95 void Display_Clear(void)
3189                     ; 96 {
3190                     	switch	.text
3191  00ee               _Display_Clear:
3195                     ; 97 	LCD_RS = OFF;
3197  00ee 721b5019      	bres	_PF_ODR,#5
3198                     ; 98 	LCD_RW = OFF;
3200  00f2 72195019      	bres	_PF_ODR,#4
3201                     ; 99 	LCD_EN= OFF;
3203  00f6 72175019      	bres	_PF_ODR,#3
3204                     ; 100 	LCD_Data = 0x01;
3206  00fa 35015005      	mov	_PB_ODR,#1
3207                     ; 102 	return;
3210  00fe 81            	ret
3235                     ; 107 void Clear_Display_LCD(void)
3235                     ; 108 {
3236                     	switch	.text
3237  00ff               _Clear_Display_LCD:
3241                     ; 109 	Set_LCD_Address(0x00);	// 1 Line Test Zig
3243  00ff 4f            	clr	a
3244  0100 ad9f          	call	_Set_LCD_Address
3246                     ; 110 	Display_LCD_String("                ");
3248  0102 ae0000        	ldw	x,#L7412
3249  0105 add0          	call	_Display_LCD_String
3251                     ; 112 	Set_LCD_Address(0xC0);  // 2 Line Test Zig
3253  0107 a6c0          	ld	a,#192
3254  0109 ad96          	call	_Set_LCD_Address
3256                     ; 113 	Display_LCD_String("                ");
3258  010b ae0000        	ldw	x,#L7412
3259  010e adc7          	call	_Display_LCD_String
3261                     ; 115 	Set_LCD_Address(0x10);  // 3 Line Test Zig
3263  0110 a610          	ld	a,#16
3264  0112 ad8d          	call	_Set_LCD_Address
3266                     ; 116 	Display_LCD_String("                ");
3268  0114 ae0000        	ldw	x,#L7412
3269  0117 adbe          	call	_Display_LCD_String
3271                     ; 118 	Set_LCD_Address(0xD0);  // 4 Line Test Zig
3273  0119 a6d0          	ld	a,#208
3274  011b ad84          	call	_Set_LCD_Address
3276                     ; 119 	Display_LCD_String("                ");
3278  011d ae0000        	ldw	x,#L7412
3279  0120 adb5          	call	_Display_LCD_String
3281                     ; 121 	return;
3284  0122 81            	ret
3310                     ; 126 void LCD_Initialize(void)
3310                     ; 127 {
3311                     	switch	.text
3312  0123               _LCD_Initialize:
3316                     ; 133 	Set_LCD_Command(0x3C);	//Function set
3318  0123 a63c          	ld	a,#60
3319  0125 cd008b        	call	_Set_LCD_Command
3321                     ; 134 	Delay_ms(50);
3323  0128 a632          	ld	a,#50
3324  012a cd006f        	call	_Delay_ms
3326                     ; 136 	Set_LCD_Command(0x3C);	//Function set
3328  012d a63c          	ld	a,#60
3329  012f cd008b        	call	_Set_LCD_Command
3331                     ; 137 	Delay_ms(100);
3333  0132 a664          	ld	a,#100
3334  0134 cd006f        	call	_Delay_ms
3336                     ; 138 	Set_LCD_Command(0x3C);	//Function set
3338  0137 a63c          	ld	a,#60
3339  0139 cd008b        	call	_Set_LCD_Command
3341                     ; 140 	Set_LCD_Command(0x3C);	//Function set
3343  013c a63c          	ld	a,#60
3344  013e cd008b        	call	_Set_LCD_Command
3346                     ; 141 	Set_LCD_Command(0x08);	//Display off
3348  0141 a608          	ld	a,#8
3349  0143 cd008b        	call	_Set_LCD_Command
3351                     ; 142 	Set_LCD_Command(0x01);	//Display Clear and Return home
3353  0146 a601          	ld	a,#1
3354  0148 cd008b        	call	_Set_LCD_Command
3356                     ; 143 	Delay_ms(100);
3358  014b a664          	ld	a,#100
3359  014d cd006f        	call	_Delay_ms
3361                     ; 145 	Set_LCD_Command(0x06);	//Entry mode setting
3363  0150 a606          	ld	a,#6
3364  0152 cd008b        	call	_Set_LCD_Command
3366                     ; 146 	Set_LCD_Command(0x0C);	//Display on and cursor off
3368  0155 a60c          	ld	a,#12
3369  0157 cd008b        	call	_Set_LCD_Command
3371                     ; 147 	Set_LCD_Address(0x00);	//LCD Address Init
3373  015a 4f            	clr	a
3374  015b cd00a1        	call	_Set_LCD_Address
3376                     ; 155 	return;
3379  015e 81            	ret
3412                     ; 159 void LCD_Buffer_Add(U8 Add)
3412                     ; 160 {
3413                     	switch	.text
3414  015f               _LCD_Buffer_Add:
3416  015f 88            	push	a
3417       00000000      OFST:	set	0
3420                     ; 161 	if(Add >= 0xC0){ Buffer_Add = (U8)((Add & 0x0F) + 48);	}	//forth_LCD_Column
3422  0160 a1c0          	cp	a,#192
3423  0162 2508          	jrult	L5712
3426  0164 a40f          	and	a,#15
3427  0166 ab30          	add	a,#48
3428  0168 b720          	ld	_Buffer_Add,a
3430  016a 2006          	jra	L7712
3431  016c               L5712:
3432                     ; 162 	else{	Buffer_Add = (U8)(Add & 0x0F);		}			//First_LCD_Column
3434  016c 7b01          	ld	a,(OFST+1,sp)
3435  016e a40f          	and	a,#15
3436  0170 b720          	ld	_Buffer_Add,a
3437  0172               L7712:
3438                     ; 163 	return;
3441  0172 84            	pop	a
3442  0173 81            	ret
3476                     ; 167 void LCD_Buffer_Char(U8 Data)
3476                     ; 168 {
3477                     	switch	.text
3478  0174               _LCD_Buffer_Char:
3480  0174 88            	push	a
3481       00000000      OFST:	set	0
3484                     ; 169 	LCD_Buffer[Buffer_Add++] = Data;
3486  0175 b620          	ld	a,_Buffer_Add
3487  0177 97            	ld	xl,a
3488  0178 3c20          	inc	_Buffer_Add
3489  017a 9f            	ld	a,xl
3490  017b 5f            	clrw	x
3491  017c 97            	ld	xl,a
3492  017d 7b01          	ld	a,(OFST+1,sp)
3493  017f e700          	ld	(_LCD_Buffer,x),a
3494                     ; 170 	return;
3497  0181 84            	pop	a
3498  0182 81            	ret
3534                     ; 174 void LCD_Buffer_String(U8 *str)
3534                     ; 175 {
3535                     	switch	.text
3536  0183               _LCD_Buffer_String:
3538  0183 89            	pushw	x
3539       00000000      OFST:	set	0
3542  0184 200d          	jra	L7322
3543  0186               L3322:
3544                     ; 176 	for(; *str;){ LCD_Buffer_Char(*str++);	}
3546  0186 1e01          	ldw	x,(OFST+1,sp)
3547  0188 1c0001        	addw	x,#1
3548  018b 1f01          	ldw	(OFST+1,sp),x
3549  018d 1d0001        	subw	x,#1
3550  0190 f6            	ld	a,(x)
3551  0191 ade1          	call	_LCD_Buffer_Char
3553  0193               L7322:
3556  0193 1e01          	ldw	x,(OFST+1,sp)
3557  0195 7d            	tnz	(x)
3558  0196 26ee          	jrne	L3322
3559                     ; 177 	return;
3562  0198 85            	popw	x
3563  0199 81            	ret
3596                     ; 181 void LCD_Buffer_Clear(void)
3596                     ; 182 {
3597                     	switch	.text
3598  019a               _LCD_Buffer_Clear:
3600  019a 88            	push	a
3601       00000001      OFST:	set	1
3604                     ; 185 	for(i = 0; i < 32; i++){ LCD_Buffer[i] = ' ';	}
3606  019b 0f01          	clr	(OFST+0,sp)
3607  019d               L7522:
3610  019d 7b01          	ld	a,(OFST+0,sp)
3611  019f 5f            	clrw	x
3612  01a0 97            	ld	xl,a
3613  01a1 a620          	ld	a,#32
3614  01a3 e700          	ld	(_LCD_Buffer,x),a
3617  01a5 0c01          	inc	(OFST+0,sp)
3620  01a7 7b01          	ld	a,(OFST+0,sp)
3621  01a9 a120          	cp	a,#32
3622  01ab 25f0          	jrult	L7522
3623                     ; 186 	return;
3626  01ad 84            	pop	a
3627  01ae 81            	ret
3667                     ; 190 void Num_Display_LCD(U16 num)
3667                     ; 191 {
3668                     	switch	.text
3669  01af               _Num_Display_LCD:
3671  01af 89            	pushw	x
3672  01b0 88            	push	a
3673       00000001      OFST:	set	1
3676                     ; 195 	if(num >= 10000){
3678  01b1 a32710        	cpw	x,#10000
3679  01b4 2403cc0238    	jrult	L3032
3680                     ; 196 		buff = (U8)(num / 10000);
3682  01b9 90ae2710      	ldw	y,#10000
3683  01bd 65            	divw	x,y
3684  01be 9f            	ld	a,xl
3685  01bf 6b01          	ld	(OFST+0,sp),a
3686                     ; 197 		num %= 10000;
3688  01c1 1e02          	ldw	x,(OFST+1,sp)
3689  01c3 90ae2710      	ldw	y,#10000
3690  01c7 65            	divw	x,y
3691  01c8 51            	exgw	x,y
3692  01c9 1f02          	ldw	(OFST+1,sp),x
3693                     ; 198 		Display_LCD_Data((U8)(48+buff));
3695  01cb 7b01          	ld	a,(OFST+0,sp)
3696  01cd ab30          	add	a,#48
3697  01cf cd00b9        	call	_Display_LCD_Data
3699                     ; 200 		buff = (U8)(num / 1000);
3701  01d2 1e02          	ldw	x,(OFST+1,sp)
3702  01d4 90ae03e8      	ldw	y,#1000
3703  01d8 65            	divw	x,y
3704  01d9 9f            	ld	a,xl
3705  01da 6b01          	ld	(OFST+0,sp),a
3706                     ; 201 		num %= 1000;
3708  01dc 1e02          	ldw	x,(OFST+1,sp)
3709  01de 90ae03e8      	ldw	y,#1000
3710  01e2 65            	divw	x,y
3711  01e3 51            	exgw	x,y
3712  01e4 1f02          	ldw	(OFST+1,sp),x
3713                     ; 202 		Display_LCD_Data((U8)(48+buff));
3715  01e6 7b01          	ld	a,(OFST+0,sp)
3716  01e8 ab30          	add	a,#48
3717  01ea cd00b9        	call	_Display_LCD_Data
3719                     ; 204 		buff = (U8)(num / 100);
3721  01ed 1e02          	ldw	x,(OFST+1,sp)
3722  01ef 90ae0064      	ldw	y,#100
3723  01f3 65            	divw	x,y
3724  01f4 9f            	ld	a,xl
3725  01f5 6b01          	ld	(OFST+0,sp),a
3726                     ; 205 		num %= 100;
3728  01f7 1e02          	ldw	x,(OFST+1,sp)
3729  01f9 90ae0064      	ldw	y,#100
3730  01fd 65            	divw	x,y
3731  01fe 51            	exgw	x,y
3732  01ff 1f02          	ldw	(OFST+1,sp),x
3733                     ; 206 		Display_LCD_Data((U8)(48+buff));
3735  0201 7b01          	ld	a,(OFST+0,sp)
3736  0203 ab30          	add	a,#48
3737  0205 cd00b9        	call	_Display_LCD_Data
3739                     ; 208 		buff = (U8)(num / 10);
3741  0208 1e02          	ldw	x,(OFST+1,sp)
3742  020a 90ae000a      	ldw	y,#10
3743  020e 65            	divw	x,y
3744  020f 9f            	ld	a,xl
3745  0210 6b01          	ld	(OFST+0,sp),a
3746                     ; 209 		num %= 10;
3748  0212 1e02          	ldw	x,(OFST+1,sp)
3749  0214 90ae000a      	ldw	y,#10
3750  0218 65            	divw	x,y
3751  0219 51            	exgw	x,y
3752  021a 1f02          	ldw	(OFST+1,sp),x
3753                     ; 210 		Display_LCD_Data((U8)(48+buff));
3755  021c 7b01          	ld	a,(OFST+0,sp)
3756  021e ab30          	add	a,#48
3757  0220 cd00b9        	call	_Display_LCD_Data
3759                     ; 212 		num %= 10;
3761  0223 1e02          	ldw	x,(OFST+1,sp)
3762  0225 90ae000a      	ldw	y,#10
3763  0229 65            	divw	x,y
3764  022a 51            	exgw	x,y
3765  022b 1f02          	ldw	(OFST+1,sp),x
3766                     ; 213 		Display_LCD_Data((U8)(48+num));
3768  022d 7b03          	ld	a,(OFST+2,sp)
3769  022f ab30          	add	a,#48
3770  0231 cd00b9        	call	_Display_LCD_Data
3773  0234 ac300330      	jpf	L5032
3774  0238               L3032:
3775                     ; 215 	}else if(num >= 1000){
3777  0238 1e02          	ldw	x,(OFST+1,sp)
3778  023a a303e8        	cpw	x,#1000
3779  023d 2565          	jrult	L7032
3780                     ; 216 		buff = (U8)(num / 1000);
3782  023f 1e02          	ldw	x,(OFST+1,sp)
3783  0241 90ae03e8      	ldw	y,#1000
3784  0245 65            	divw	x,y
3785  0246 9f            	ld	a,xl
3786  0247 6b01          	ld	(OFST+0,sp),a
3787                     ; 217 		num %= 1000;
3789  0249 1e02          	ldw	x,(OFST+1,sp)
3790  024b 90ae03e8      	ldw	y,#1000
3791  024f 65            	divw	x,y
3792  0250 51            	exgw	x,y
3793  0251 1f02          	ldw	(OFST+1,sp),x
3794                     ; 218 		Display_LCD_Data((U8)(48+buff));
3796  0253 7b01          	ld	a,(OFST+0,sp)
3797  0255 ab30          	add	a,#48
3798  0257 cd00b9        	call	_Display_LCD_Data
3800                     ; 220 		buff = (U8)(num / 100);
3802  025a 1e02          	ldw	x,(OFST+1,sp)
3803  025c 90ae0064      	ldw	y,#100
3804  0260 65            	divw	x,y
3805  0261 9f            	ld	a,xl
3806  0262 6b01          	ld	(OFST+0,sp),a
3807                     ; 221 		num %= 100;
3809  0264 1e02          	ldw	x,(OFST+1,sp)
3810  0266 90ae0064      	ldw	y,#100
3811  026a 65            	divw	x,y
3812  026b 51            	exgw	x,y
3813  026c 1f02          	ldw	(OFST+1,sp),x
3814                     ; 222 		Display_LCD_Data((U8)(48+buff));
3816  026e 7b01          	ld	a,(OFST+0,sp)
3817  0270 ab30          	add	a,#48
3818  0272 cd00b9        	call	_Display_LCD_Data
3820                     ; 224 		buff = (U8)(num / 10);
3822  0275 1e02          	ldw	x,(OFST+1,sp)
3823  0277 90ae000a      	ldw	y,#10
3824  027b 65            	divw	x,y
3825  027c 9f            	ld	a,xl
3826  027d 6b01          	ld	(OFST+0,sp),a
3827                     ; 225 		num %= 10;
3829  027f 1e02          	ldw	x,(OFST+1,sp)
3830  0281 90ae000a      	ldw	y,#10
3831  0285 65            	divw	x,y
3832  0286 51            	exgw	x,y
3833  0287 1f02          	ldw	(OFST+1,sp),x
3834                     ; 226 		Display_LCD_Data((U8)(48+buff));
3836  0289 7b01          	ld	a,(OFST+0,sp)
3837  028b ab30          	add	a,#48
3838  028d cd00b9        	call	_Display_LCD_Data
3840                     ; 228 		num %= 10;
3842  0290 1e02          	ldw	x,(OFST+1,sp)
3843  0292 90ae000a      	ldw	y,#10
3844  0296 65            	divw	x,y
3845  0297 51            	exgw	x,y
3846  0298 1f02          	ldw	(OFST+1,sp),x
3847                     ; 229 		Display_LCD_Data((U8)(48+num));
3849  029a 7b03          	ld	a,(OFST+2,sp)
3850  029c ab30          	add	a,#48
3851  029e cd00b9        	call	_Display_LCD_Data
3854  02a1 cc0330        	jra	L5032
3855  02a4               L7032:
3856                     ; 230 	}else if(num >= 100){
3858  02a4 1e02          	ldw	x,(OFST+1,sp)
3859  02a6 a30064        	cpw	x,#100
3860  02a9 2549          	jrult	L3132
3861                     ; 231 		buff = (U8)(num / 100);
3863  02ab 1e02          	ldw	x,(OFST+1,sp)
3864  02ad 90ae0064      	ldw	y,#100
3865  02b1 65            	divw	x,y
3866  02b2 9f            	ld	a,xl
3867  02b3 6b01          	ld	(OFST+0,sp),a
3868                     ; 232 		num %= 100;
3870  02b5 1e02          	ldw	x,(OFST+1,sp)
3871  02b7 90ae0064      	ldw	y,#100
3872  02bb 65            	divw	x,y
3873  02bc 51            	exgw	x,y
3874  02bd 1f02          	ldw	(OFST+1,sp),x
3875                     ; 233 		Display_LCD_Data((U8)(48+buff));
3877  02bf 7b01          	ld	a,(OFST+0,sp)
3878  02c1 ab30          	add	a,#48
3879  02c3 cd00b9        	call	_Display_LCD_Data
3881                     ; 235 		buff = (U8)(num / 10);
3883  02c6 1e02          	ldw	x,(OFST+1,sp)
3884  02c8 90ae000a      	ldw	y,#10
3885  02cc 65            	divw	x,y
3886  02cd 9f            	ld	a,xl
3887  02ce 6b01          	ld	(OFST+0,sp),a
3888                     ; 236 		num %= 10;
3890  02d0 1e02          	ldw	x,(OFST+1,sp)
3891  02d2 90ae000a      	ldw	y,#10
3892  02d6 65            	divw	x,y
3893  02d7 51            	exgw	x,y
3894  02d8 1f02          	ldw	(OFST+1,sp),x
3895                     ; 237 		Display_LCD_Data((U8)(48+buff));
3897  02da 7b01          	ld	a,(OFST+0,sp)
3898  02dc ab30          	add	a,#48
3899  02de cd00b9        	call	_Display_LCD_Data
3901                     ; 239 		num %= 10;
3903  02e1 1e02          	ldw	x,(OFST+1,sp)
3904  02e3 90ae000a      	ldw	y,#10
3905  02e7 65            	divw	x,y
3906  02e8 51            	exgw	x,y
3907  02e9 1f02          	ldw	(OFST+1,sp),x
3908                     ; 240 		Display_LCD_Data((U8)(48+num));
3910  02eb 7b03          	ld	a,(OFST+2,sp)
3911  02ed ab30          	add	a,#48
3912  02ef cd00b9        	call	_Display_LCD_Data
3915  02f2 203c          	jra	L5032
3916  02f4               L3132:
3917                     ; 241 	}else if(num >= 10){
3919  02f4 1e02          	ldw	x,(OFST+1,sp)
3920  02f6 a3000a        	cpw	x,#10
3921  02f9 252e          	jrult	L7132
3922                     ; 242 		buff = (U8)(num / 10);
3924  02fb 1e02          	ldw	x,(OFST+1,sp)
3925  02fd 90ae000a      	ldw	y,#10
3926  0301 65            	divw	x,y
3927  0302 9f            	ld	a,xl
3928  0303 6b01          	ld	(OFST+0,sp),a
3929                     ; 243 		num %= 10;
3931  0305 1e02          	ldw	x,(OFST+1,sp)
3932  0307 90ae000a      	ldw	y,#10
3933  030b 65            	divw	x,y
3934  030c 51            	exgw	x,y
3935  030d 1f02          	ldw	(OFST+1,sp),x
3936                     ; 244 		Display_LCD_Data((U8)(48+buff));
3938  030f 7b01          	ld	a,(OFST+0,sp)
3939  0311 ab30          	add	a,#48
3940  0313 cd00b9        	call	_Display_LCD_Data
3942                     ; 246 		num %= 10;
3944  0316 1e02          	ldw	x,(OFST+1,sp)
3945  0318 90ae000a      	ldw	y,#10
3946  031c 65            	divw	x,y
3947  031d 51            	exgw	x,y
3948  031e 1f02          	ldw	(OFST+1,sp),x
3949                     ; 247 		Display_LCD_Data((U8)(48+num));
3951  0320 7b03          	ld	a,(OFST+2,sp)
3952  0322 ab30          	add	a,#48
3953  0324 cd00b9        	call	_Display_LCD_Data
3956  0327 2007          	jra	L5032
3957  0329               L7132:
3958                     ; 248 	}else{ Display_LCD_Data((U8)(48+num));}
3960  0329 7b03          	ld	a,(OFST+2,sp)
3961  032b ab30          	add	a,#48
3962  032d cd00b9        	call	_Display_LCD_Data
3964  0330               L5032:
3965                     ; 250 	return;
3968  0330 5b03          	addw	sp,#3
3969  0332 81            	ret
4042                     	switch	.bss
4043  0000               _ui_blink_timer_cnt:
4044  0000 00            	ds.b	1
4045                     	xdef	_ui_blink_timer_cnt
4046                     	switch	.ubsct
4047  0000               _LCD_Buffer:
4048  0000 000000000000  	ds.b	32
4049                     	xdef	_LCD_Buffer
4050  0020               _Buffer_Add:
4051  0020 00            	ds.b	1
4052                     	xdef	_Buffer_Add
4053                     	xdef	_Display_Clear
4054                     	xdef	_LCD_Blink_Timer_Control
4055                     	xdef	_Num_Display_LCD
4056                     	xdef	_LCD_Buffer_Clear
4057                     	xdef	_LCD_Buffer_String
4058                     	xdef	_LCD_Buffer_Char
4059                     	xdef	_LCD_Buffer_Add
4060                     	xdef	_LCD_Initialize
4061                     	xdef	_Clear_Display_LCD
4062                     	xdef	_Display_LCD_String
4063                     	xdef	_Display_LCD_Data
4064                     	xdef	_Set_LCD_Address
4065                     	xdef	_Set_LCD_Command
4066                     	xdef	_Delay_ms
4067                     	switch	.bss
4068  0001               _LCD_Dis_Data:
4069  0001 000000000000  	ds.b	64
4070                     	xdef	_LCD_Dis_Data
4071                     	xdef	_LCD_Line
4072  0041               _uc_LCD_Blink_Reg:
4073  0041 00            	ds.b	1
4074                     	xdef	_uc_LCD_Blink_Reg
4075                     	xref	_Windows_Watchdog_Clear
4076                     .const:	section	.text
4077  0000               L7412:
4078  0000 202020202020  	dc.b	"                ",0
4098                     	end

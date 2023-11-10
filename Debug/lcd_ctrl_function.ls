   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2654                     	switch	.data
2655  0000               _LCD_Line:
2656  0000 00            	dc.b	0
2657  0001 c0            	dc.b	192
2658  0002 10            	dc.b	16
2659  0003 d0            	dc.b	208
2693                     ; 27 void LCD_Blink_Timer_Control(void)
2693                     ; 28 {
2695                     	switch	.text
2696  0000               _LCD_Blink_Timer_Control:
2700                     ; 29 	ui_blink_timer_cnt++;
2702  0000 725c0000      	inc	_ui_blink_timer_cnt
2703                     ; 31 	if((ui_blink_timer_cnt % (U16)(10)) == (U16)(0)){ b_Blink_100_Flag ^= ON; Clear_Display_LCD();}
2705  0004 c60000        	ld	a,_ui_blink_timer_cnt
2706  0007 5f            	clrw	x
2707  0008 97            	ld	xl,a
2708  0009 a60a          	ld	a,#10
2709  000b 62            	div	x,a
2710  000c 5f            	clrw	x
2711  000d 97            	ld	xl,a
2712  000e a30000        	cpw	x,#0
2713  0011 2607          	jrne	L1271
2716  0013 90100041      	bcpl		_uc_LCD_Blink_Reg,#0
2719  0017 cd00fb        	call	_Clear_Display_LCD
2721  001a               L1271:
2722                     ; 32 	if((ui_blink_timer_cnt % (U16)(25)) == (U16)(0)){ b_Blink_250_Flag ^= ON; }
2724  001a c60000        	ld	a,_ui_blink_timer_cnt
2725  001d 5f            	clrw	x
2726  001e 97            	ld	xl,a
2727  001f a619          	ld	a,#25
2728  0021 62            	div	x,a
2729  0022 5f            	clrw	x
2730  0023 97            	ld	xl,a
2731  0024 a30000        	cpw	x,#0
2732  0027 2604          	jrne	L3271
2735  0029 90120041      	bcpl		_uc_LCD_Blink_Reg,#1
2736  002d               L3271:
2737                     ; 33 	if((ui_blink_timer_cnt % (U16)(50)) == (U16)(0)){ b_Blink_500_Flag ^= ON; }
2739  002d c60000        	ld	a,_ui_blink_timer_cnt
2740  0030 5f            	clrw	x
2741  0031 97            	ld	xl,a
2742  0032 a632          	ld	a,#50
2743  0034 62            	div	x,a
2744  0035 5f            	clrw	x
2745  0036 97            	ld	xl,a
2746  0037 a30000        	cpw	x,#0
2747  003a 2604          	jrne	L5271
2750  003c 90140041      	bcpl		_uc_LCD_Blink_Reg,#2
2751  0040               L5271:
2752                     ; 34 	if((ui_blink_timer_cnt % (U16)(100)) == (U16)(0)){ b_Blink_1s_Flag ^= ON; }
2754  0040 c60000        	ld	a,_ui_blink_timer_cnt
2755  0043 5f            	clrw	x
2756  0044 97            	ld	xl,a
2757  0045 a664          	ld	a,#100
2758  0047 62            	div	x,a
2759  0048 5f            	clrw	x
2760  0049 97            	ld	xl,a
2761  004a a30000        	cpw	x,#0
2762  004d 2604          	jrne	L7271
2765  004f 90160041      	bcpl		_uc_LCD_Blink_Reg,#3
2766  0053               L7271:
2767                     ; 35 	if((ui_blink_timer_cnt % (U16)(200)) == (U16)(0)){ 
2769  0053 c60000        	ld	a,_ui_blink_timer_cnt
2770  0056 5f            	clrw	x
2771  0057 97            	ld	xl,a
2772  0058 a6c8          	ld	a,#200
2773  005a 62            	div	x,a
2774  005b 5f            	clrw	x
2775  005c 97            	ld	xl,a
2776  005d a30000        	cpw	x,#0
2777  0060 2608          	jrne	L1371
2778                     ; 36 		b_Blink_2s_Flag ^= ON; 
2780  0062 90180041      	bcpl		_uc_LCD_Blink_Reg,#4
2781                     ; 37 		ui_blink_timer_cnt = 0;
2783  0066 725f0000      	clr	_ui_blink_timer_cnt
2784  006a               L1371:
2785                     ; 40 	return;
2788  006a 81            	ret
2835                     ; 45 void Delay_ms(U8 Delay)
2835                     ; 46 {
2836                     	switch	.text
2837  006b               _Delay_ms:
2839  006b 88            	push	a
2840  006c 89            	pushw	x
2841       00000002      OFST:	set	2
2844  006d               L3571:
2845                     ; 48 	do{	i = 8;
2847  006d a608          	ld	a,#8
2848  006f 6b02          	ld	(OFST+0,sp),a
2850                     ; 49 	Windows_Watchdog_Clear();
2852  0071 cd0000        	call	_Windows_Watchdog_Clear
2854  0074               L1671:
2855                     ; 50 		do{ Delay_us(250);  }while(--i);
2857  0074 a6fb          	ld	a,#251
2858  0076 6b01          	ld	(OFST-1,sp),a
2861  0078               L3771:
2864  0078 0a01          	dec	(OFST-1,sp)
2866  007a 26fc          	jrne	L3771
2869  007c 0a02          	dec	(OFST+0,sp)
2871  007e 26f4          	jrne	L1671
2872                     ; 51 	}while(--Delay);
2874  0080 0a03          	dec	(OFST+1,sp)
2875  0082 26e9          	jrne	L3571
2876                     ; 52 	return;
2879  0084 5b03          	addw	sp,#3
2880  0086 81            	ret
2921                     ; 56 void Set_LCD_Command(U8 Cmd)
2921                     ; 57 {
2922                     	switch	.text
2923  0087               _Set_LCD_Command:
2925  0087 88            	push	a
2926       00000001      OFST:	set	1
2929                     ; 58 	LCD_Data	= Cmd;
2931  0088 c75005        	ld	_PB_ODR,a
2932                     ; 59 	LCD_EN	= 1;
2934  008b 72165019      	bset	_PF_ODR,#3
2935                     ; 60 	Delay_us(150);//100
2937  008f a697          	ld	a,#151
2938  0091 6b01          	ld	(OFST+0,sp),a
2941  0093               L1202:
2944  0093 0a01          	dec	(OFST+0,sp)
2946  0095 26fc          	jrne	L1202
2947                     ; 61 	LCD_EN	= 0;
2950  0097 72175019      	bres	_PF_ODR,#3
2951                     ; 62 	return;
2954  009b 84            	pop	a
2955  009c 81            	ret
2996                     ; 66 void Set_LCD_Address(U8 Add)
2996                     ; 67 {
2997                     	switch	.text
2998  009d               _Set_LCD_Address:
3000  009d 88            	push	a
3001       00000001      OFST:	set	1
3004                     ; 68 	LCD_Data	= (unsigned char)(Add | 0x80);
3006  009e aa80          	or	a,#128
3007  00a0 c75005        	ld	_PB_ODR,a
3008                     ; 69 	LCD_EN	= 1;
3010  00a3 72165019      	bset	_PF_ODR,#3
3011                     ; 70 	Delay_us(150);//100
3013  00a7 a697          	ld	a,#151
3014  00a9 6b01          	ld	(OFST+0,sp),a
3017  00ab               L7402:
3020  00ab 0a01          	dec	(OFST+0,sp)
3022  00ad 26fc          	jrne	L7402
3023                     ; 71 	LCD_EN	= 0;
3026  00af 72175019      	bres	_PF_ODR,#3
3027                     ; 72 	return;
3030  00b3 84            	pop	a
3031  00b4 81            	ret
3072                     ; 76 void Display_LCD_Data(U8 Data)
3072                     ; 77 {
3073                     	switch	.text
3074  00b5               _Display_LCD_Data:
3076  00b5 88            	push	a
3077       00000001      OFST:	set	1
3080                     ; 78 	LCD_Data = Data;
3082  00b6 c75005        	ld	_PB_ODR,a
3083                     ; 79 	LCD_RS = 1;
3085  00b9 721a5019      	bset	_PF_ODR,#5
3086                     ; 80 	LCD_EN = 1;
3088  00bd 72165019      	bset	_PF_ODR,#3
3089                     ; 81 	Delay_us(150);
3091  00c1 a697          	ld	a,#151
3092  00c3 6b01          	ld	(OFST+0,sp),a
3095  00c5               L5702:
3098  00c5 0a01          	dec	(OFST+0,sp)
3100  00c7 26fc          	jrne	L5702
3101                     ; 82 	LCD_EN = 0;
3104  00c9 72175019      	bres	_PF_ODR,#3
3105                     ; 83 	LCD_RS = 0;
3107  00cd 721b5019      	bres	_PF_ODR,#5
3108                     ; 84 	return;
3111  00d1 84            	pop	a
3112  00d2 81            	ret
3148                     ; 88 void Display_LCD_String(U8 *str)
3148                     ; 89 {
3149                     	switch	.text
3150  00d3               _Display_LCD_String:
3152  00d3 89            	pushw	x
3153       00000000      OFST:	set	0
3156  00d4 200d          	jra	L3212
3157  00d6               L7112:
3158                     ; 90 	for(; *str;){ Display_LCD_Data(*str++);	}
3160  00d6 1e01          	ldw	x,(OFST+1,sp)
3161  00d8 1c0001        	addw	x,#1
3162  00db 1f01          	ldw	(OFST+1,sp),x
3163  00dd 1d0001        	subw	x,#1
3164  00e0 f6            	ld	a,(x)
3165  00e1 add2          	call	_Display_LCD_Data
3167  00e3               L3212:
3170  00e3 1e01          	ldw	x,(OFST+1,sp)
3171  00e5 7d            	tnz	(x)
3172  00e6 26ee          	jrne	L7112
3173                     ; 91 	return;
3176  00e8 85            	popw	x
3177  00e9 81            	ret
3202                     ; 95 void Display_Clear(void)
3202                     ; 96 {
3203                     	switch	.text
3204  00ea               _Display_Clear:
3208                     ; 97 	LCD_RS = OFF;
3210  00ea 721b5019      	bres	_PF_ODR,#5
3211                     ; 98 	LCD_RW = OFF;
3213  00ee 72195019      	bres	_PF_ODR,#4
3214                     ; 99 	LCD_EN= OFF;
3216  00f2 72175019      	bres	_PF_ODR,#3
3217                     ; 100 	LCD_Data = 0x01;
3219  00f6 35015005      	mov	_PB_ODR,#1
3220                     ; 102 	return;
3223  00fa 81            	ret
3248                     ; 107 void Clear_Display_LCD(void)
3248                     ; 108 {
3249                     	switch	.text
3250  00fb               _Clear_Display_LCD:
3254                     ; 109 	Set_LCD_Address(0x00);	// 1 Line Test Zig
3256  00fb 4f            	clr	a
3257  00fc ad9f          	call	_Set_LCD_Address
3259                     ; 110 	Display_LCD_String("                ");
3261  00fe ae0000        	ldw	x,#L7412
3262  0101 add0          	call	_Display_LCD_String
3264                     ; 112 	Set_LCD_Address(0xC0);  // 2 Line Test Zig
3266  0103 a6c0          	ld	a,#192
3267  0105 ad96          	call	_Set_LCD_Address
3269                     ; 113 	Display_LCD_String("                ");
3271  0107 ae0000        	ldw	x,#L7412
3272  010a adc7          	call	_Display_LCD_String
3274                     ; 115 	Set_LCD_Address(0x10);  // 3 Line Test Zig
3276  010c a610          	ld	a,#16
3277  010e ad8d          	call	_Set_LCD_Address
3279                     ; 116 	Display_LCD_String("                ");
3281  0110 ae0000        	ldw	x,#L7412
3282  0113 adbe          	call	_Display_LCD_String
3284                     ; 118 	Set_LCD_Address(0xD0);  // 4 Line Test Zig
3286  0115 a6d0          	ld	a,#208
3287  0117 ad84          	call	_Set_LCD_Address
3289                     ; 119 	Display_LCD_String("                ");
3291  0119 ae0000        	ldw	x,#L7412
3292  011c adb5          	call	_Display_LCD_String
3294                     ; 121 	return;
3297  011e 81            	ret
3323                     ; 126 void LCD_Initialize(void)
3323                     ; 127 {
3324                     	switch	.text
3325  011f               _LCD_Initialize:
3329                     ; 133 	Set_LCD_Command(0x3C);	//Function set
3331  011f a63c          	ld	a,#60
3332  0121 cd0087        	call	_Set_LCD_Command
3334                     ; 134 	Delay_ms(50);
3336  0124 a632          	ld	a,#50
3337  0126 cd006b        	call	_Delay_ms
3339                     ; 136 	Set_LCD_Command(0x3C);	//Function set
3341  0129 a63c          	ld	a,#60
3342  012b cd0087        	call	_Set_LCD_Command
3344                     ; 137 	Delay_ms(100);
3346  012e a664          	ld	a,#100
3347  0130 cd006b        	call	_Delay_ms
3349                     ; 138 	Set_LCD_Command(0x3C);	//Function set
3351  0133 a63c          	ld	a,#60
3352  0135 cd0087        	call	_Set_LCD_Command
3354                     ; 140 	Set_LCD_Command(0x3C);	//Function set
3356  0138 a63c          	ld	a,#60
3357  013a cd0087        	call	_Set_LCD_Command
3359                     ; 141 	Set_LCD_Command(0x08);	//Display off
3361  013d a608          	ld	a,#8
3362  013f cd0087        	call	_Set_LCD_Command
3364                     ; 142 	Set_LCD_Command(0x01);	//Display Clear and Return home
3366  0142 a601          	ld	a,#1
3367  0144 cd0087        	call	_Set_LCD_Command
3369                     ; 143 	Delay_ms(100);
3371  0147 a664          	ld	a,#100
3372  0149 cd006b        	call	_Delay_ms
3374                     ; 145 	Set_LCD_Command(0x06);	//Entry mode setting
3376  014c a606          	ld	a,#6
3377  014e cd0087        	call	_Set_LCD_Command
3379                     ; 146 	Set_LCD_Command(0x0C);	//Display on and cursor off
3381  0151 a60c          	ld	a,#12
3382  0153 cd0087        	call	_Set_LCD_Command
3384                     ; 147 	Set_LCD_Address(0x00);	//LCD Address Init
3386  0156 4f            	clr	a
3387  0157 cd009d        	call	_Set_LCD_Address
3389                     ; 155 	return;
3392  015a 81            	ret
3425                     ; 159 void LCD_Buffer_Add(U8 Add)
3425                     ; 160 {
3426                     	switch	.text
3427  015b               _LCD_Buffer_Add:
3429  015b 88            	push	a
3430       00000000      OFST:	set	0
3433                     ; 161 	if(Add >= 0xC0){ Buffer_Add = (U8)((Add & 0x0F) + 48);	}	//forth_LCD_Column
3435  015c a1c0          	cp	a,#192
3436  015e 2508          	jrult	L5712
3439  0160 a40f          	and	a,#15
3440  0162 ab30          	add	a,#48
3441  0164 b720          	ld	_Buffer_Add,a
3443  0166 2006          	jra	L7712
3444  0168               L5712:
3445                     ; 162 	else{	Buffer_Add = (U8)(Add & 0x0F);		}			//First_LCD_Column
3447  0168 7b01          	ld	a,(OFST+1,sp)
3448  016a a40f          	and	a,#15
3449  016c b720          	ld	_Buffer_Add,a
3450  016e               L7712:
3451                     ; 163 	return;
3454  016e 84            	pop	a
3455  016f 81            	ret
3489                     ; 167 void LCD_Buffer_Char(U8 Data)
3489                     ; 168 {
3490                     	switch	.text
3491  0170               _LCD_Buffer_Char:
3493  0170 88            	push	a
3494       00000000      OFST:	set	0
3497                     ; 169 	LCD_Buffer[Buffer_Add++] = Data;
3499  0171 b620          	ld	a,_Buffer_Add
3500  0173 97            	ld	xl,a
3501  0174 3c20          	inc	_Buffer_Add
3502  0176 9f            	ld	a,xl
3503  0177 5f            	clrw	x
3504  0178 97            	ld	xl,a
3505  0179 7b01          	ld	a,(OFST+1,sp)
3506  017b e700          	ld	(_LCD_Buffer,x),a
3507                     ; 170 	return;
3510  017d 84            	pop	a
3511  017e 81            	ret
3547                     ; 174 void LCD_Buffer_String(U8 *str)
3547                     ; 175 {
3548                     	switch	.text
3549  017f               _LCD_Buffer_String:
3551  017f 89            	pushw	x
3552       00000000      OFST:	set	0
3555  0180 200d          	jra	L7322
3556  0182               L3322:
3557                     ; 176 	for(; *str;){ LCD_Buffer_Char(*str++);	}
3559  0182 1e01          	ldw	x,(OFST+1,sp)
3560  0184 1c0001        	addw	x,#1
3561  0187 1f01          	ldw	(OFST+1,sp),x
3562  0189 1d0001        	subw	x,#1
3563  018c f6            	ld	a,(x)
3564  018d ade1          	call	_LCD_Buffer_Char
3566  018f               L7322:
3569  018f 1e01          	ldw	x,(OFST+1,sp)
3570  0191 7d            	tnz	(x)
3571  0192 26ee          	jrne	L3322
3572                     ; 177 	return;
3575  0194 85            	popw	x
3576  0195 81            	ret
3609                     ; 181 void LCD_Buffer_Clear(void)
3609                     ; 182 {
3610                     	switch	.text
3611  0196               _LCD_Buffer_Clear:
3613  0196 88            	push	a
3614       00000001      OFST:	set	1
3617                     ; 185 	for(i = 0; i < 32; i++){ LCD_Buffer[i] = ' ';	}
3619  0197 0f01          	clr	(OFST+0,sp)
3621  0199               L7522:
3624  0199 7b01          	ld	a,(OFST+0,sp)
3625  019b 5f            	clrw	x
3626  019c 97            	ld	xl,a
3627  019d a620          	ld	a,#32
3628  019f e700          	ld	(_LCD_Buffer,x),a
3631  01a1 0c01          	inc	(OFST+0,sp)
3635  01a3 7b01          	ld	a,(OFST+0,sp)
3636  01a5 a120          	cp	a,#32
3637  01a7 25f0          	jrult	L7522
3638                     ; 186 	return;
3641  01a9 84            	pop	a
3642  01aa 81            	ret
3682                     ; 190 void Num_Display_LCD(U16 num)
3682                     ; 191 {
3683                     	switch	.text
3684  01ab               _Num_Display_LCD:
3686  01ab 89            	pushw	x
3687  01ac 88            	push	a
3688       00000001      OFST:	set	1
3691                     ; 195 	if(num >= 10000){
3693  01ad a32710        	cpw	x,#10000
3694  01b0 2578          	jrult	L3032
3695                     ; 196 		buff = (U8)(num / 10000);
3697  01b2 90ae2710      	ldw	y,#10000
3698  01b6 65            	divw	x,y
3699  01b7 9f            	ld	a,xl
3700  01b8 6b01          	ld	(OFST+0,sp),a
3702                     ; 197 		num %= 10000;
3704  01ba 1e02          	ldw	x,(OFST+1,sp)
3705  01bc 90ae2710      	ldw	y,#10000
3706  01c0 65            	divw	x,y
3707  01c1 51            	exgw	x,y
3708  01c2 1f02          	ldw	(OFST+1,sp),x
3709                     ; 198 		Display_LCD_Data((U8)(48+buff));
3711  01c4 7b01          	ld	a,(OFST+0,sp)
3712  01c6 ab30          	add	a,#48
3713  01c8 cd00b5        	call	_Display_LCD_Data
3715                     ; 200 		buff = (U8)(num / 1000);
3717  01cb 1e02          	ldw	x,(OFST+1,sp)
3718  01cd 90ae03e8      	ldw	y,#1000
3719  01d1 65            	divw	x,y
3720  01d2 9f            	ld	a,xl
3721  01d3 6b01          	ld	(OFST+0,sp),a
3723                     ; 201 		num %= 1000;
3725  01d5 1e02          	ldw	x,(OFST+1,sp)
3726  01d7 90ae03e8      	ldw	y,#1000
3727  01db 65            	divw	x,y
3728  01dc 51            	exgw	x,y
3729  01dd 1f02          	ldw	(OFST+1,sp),x
3730                     ; 202 		Display_LCD_Data((U8)(48+buff));
3732  01df 7b01          	ld	a,(OFST+0,sp)
3733  01e1 ab30          	add	a,#48
3734  01e3 cd00b5        	call	_Display_LCD_Data
3736                     ; 204 		buff = (U8)(num / 100);
3738  01e6 1e02          	ldw	x,(OFST+1,sp)
3739  01e8 a664          	ld	a,#100
3740  01ea 62            	div	x,a
3741  01eb 9f            	ld	a,xl
3742  01ec 6b01          	ld	(OFST+0,sp),a
3744                     ; 205 		num %= 100;
3746  01ee 1e02          	ldw	x,(OFST+1,sp)
3747  01f0 a664          	ld	a,#100
3748  01f2 62            	div	x,a
3749  01f3 5f            	clrw	x
3750  01f4 97            	ld	xl,a
3751  01f5 1f02          	ldw	(OFST+1,sp),x
3752                     ; 206 		Display_LCD_Data((U8)(48+buff));
3754  01f7 7b01          	ld	a,(OFST+0,sp)
3755  01f9 ab30          	add	a,#48
3756  01fb cd00b5        	call	_Display_LCD_Data
3758                     ; 208 		buff = (U8)(num / 10);
3760  01fe 1e02          	ldw	x,(OFST+1,sp)
3761  0200 a60a          	ld	a,#10
3762  0202 62            	div	x,a
3763  0203 9f            	ld	a,xl
3764  0204 6b01          	ld	(OFST+0,sp),a
3766                     ; 209 		num %= 10;
3768  0206 1e02          	ldw	x,(OFST+1,sp)
3769  0208 a60a          	ld	a,#10
3770  020a 62            	div	x,a
3771  020b 5f            	clrw	x
3772  020c 97            	ld	xl,a
3773  020d 1f02          	ldw	(OFST+1,sp),x
3774                     ; 210 		Display_LCD_Data((U8)(48+buff));
3776  020f 7b01          	ld	a,(OFST+0,sp)
3777  0211 ab30          	add	a,#48
3778  0213 cd00b5        	call	_Display_LCD_Data
3780                     ; 212 		num %= 10;
3782  0216 1e02          	ldw	x,(OFST+1,sp)
3783  0218 a60a          	ld	a,#10
3784  021a 62            	div	x,a
3785  021b 5f            	clrw	x
3786  021c 97            	ld	xl,a
3787  021d 1f02          	ldw	(OFST+1,sp),x
3788                     ; 213 		Display_LCD_Data((U8)(48+num));
3790  021f 7b03          	ld	a,(OFST+2,sp)
3791  0221 ab30          	add	a,#48
3792  0223 cd00b5        	call	_Display_LCD_Data
3795  0226 ac110311      	jpf	L5032
3796  022a               L3032:
3797                     ; 215 	}else if(num >= 1000){
3799  022a 1e02          	ldw	x,(OFST+1,sp)
3800  022c a303e8        	cpw	x,#1000
3801  022f 255f          	jrult	L7032
3802                     ; 216 		buff = (U8)(num / 1000);
3804  0231 1e02          	ldw	x,(OFST+1,sp)
3805  0233 90ae03e8      	ldw	y,#1000
3806  0237 65            	divw	x,y
3807  0238 9f            	ld	a,xl
3808  0239 6b01          	ld	(OFST+0,sp),a
3810                     ; 217 		num %= 1000;
3812  023b 1e02          	ldw	x,(OFST+1,sp)
3813  023d 90ae03e8      	ldw	y,#1000
3814  0241 65            	divw	x,y
3815  0242 51            	exgw	x,y
3816  0243 1f02          	ldw	(OFST+1,sp),x
3817                     ; 218 		Display_LCD_Data((U8)(48+buff));
3819  0245 7b01          	ld	a,(OFST+0,sp)
3820  0247 ab30          	add	a,#48
3821  0249 cd00b5        	call	_Display_LCD_Data
3823                     ; 220 		buff = (U8)(num / 100);
3825  024c 1e02          	ldw	x,(OFST+1,sp)
3826  024e a664          	ld	a,#100
3827  0250 62            	div	x,a
3828  0251 9f            	ld	a,xl
3829  0252 6b01          	ld	(OFST+0,sp),a
3831                     ; 221 		num %= 100;
3833  0254 1e02          	ldw	x,(OFST+1,sp)
3834  0256 a664          	ld	a,#100
3835  0258 62            	div	x,a
3836  0259 5f            	clrw	x
3837  025a 97            	ld	xl,a
3838  025b 1f02          	ldw	(OFST+1,sp),x
3839                     ; 222 		Display_LCD_Data((U8)(48+buff));
3841  025d 7b01          	ld	a,(OFST+0,sp)
3842  025f ab30          	add	a,#48
3843  0261 cd00b5        	call	_Display_LCD_Data
3845                     ; 224 		buff = (U8)(num / 10);
3847  0264 1e02          	ldw	x,(OFST+1,sp)
3848  0266 a60a          	ld	a,#10
3849  0268 62            	div	x,a
3850  0269 9f            	ld	a,xl
3851  026a 6b01          	ld	(OFST+0,sp),a
3853                     ; 225 		num %= 10;
3855  026c 1e02          	ldw	x,(OFST+1,sp)
3856  026e a60a          	ld	a,#10
3857  0270 62            	div	x,a
3858  0271 5f            	clrw	x
3859  0272 97            	ld	xl,a
3860  0273 1f02          	ldw	(OFST+1,sp),x
3861                     ; 226 		Display_LCD_Data((U8)(48+buff));
3863  0275 7b01          	ld	a,(OFST+0,sp)
3864  0277 ab30          	add	a,#48
3865  0279 cd00b5        	call	_Display_LCD_Data
3867                     ; 228 		num %= 10;
3869  027c 1e02          	ldw	x,(OFST+1,sp)
3870  027e a60a          	ld	a,#10
3871  0280 62            	div	x,a
3872  0281 5f            	clrw	x
3873  0282 97            	ld	xl,a
3874  0283 1f02          	ldw	(OFST+1,sp),x
3875                     ; 229 		Display_LCD_Data((U8)(48+num));
3877  0285 7b03          	ld	a,(OFST+2,sp)
3878  0287 ab30          	add	a,#48
3879  0289 cd00b5        	call	_Display_LCD_Data
3882  028c ac110311      	jpf	L5032
3883  0290               L7032:
3884                     ; 230 	}else if(num >= 100){
3886  0290 1e02          	ldw	x,(OFST+1,sp)
3887  0292 a30064        	cpw	x,#100
3888  0295 2542          	jrult	L3132
3889                     ; 231 		buff = (U8)(num / 100);
3891  0297 1e02          	ldw	x,(OFST+1,sp)
3892  0299 a664          	ld	a,#100
3893  029b 62            	div	x,a
3894  029c 9f            	ld	a,xl
3895  029d 6b01          	ld	(OFST+0,sp),a
3897                     ; 232 		num %= 100;
3899  029f 1e02          	ldw	x,(OFST+1,sp)
3900  02a1 a664          	ld	a,#100
3901  02a3 62            	div	x,a
3902  02a4 5f            	clrw	x
3903  02a5 97            	ld	xl,a
3904  02a6 1f02          	ldw	(OFST+1,sp),x
3905                     ; 233 		Display_LCD_Data((U8)(48+buff));
3907  02a8 7b01          	ld	a,(OFST+0,sp)
3908  02aa ab30          	add	a,#48
3909  02ac cd00b5        	call	_Display_LCD_Data
3911                     ; 235 		buff = (U8)(num / 10);
3913  02af 1e02          	ldw	x,(OFST+1,sp)
3914  02b1 a60a          	ld	a,#10
3915  02b3 62            	div	x,a
3916  02b4 9f            	ld	a,xl
3917  02b5 6b01          	ld	(OFST+0,sp),a
3919                     ; 236 		num %= 10;
3921  02b7 1e02          	ldw	x,(OFST+1,sp)
3922  02b9 a60a          	ld	a,#10
3923  02bb 62            	div	x,a
3924  02bc 5f            	clrw	x
3925  02bd 97            	ld	xl,a
3926  02be 1f02          	ldw	(OFST+1,sp),x
3927                     ; 237 		Display_LCD_Data((U8)(48+buff));
3929  02c0 7b01          	ld	a,(OFST+0,sp)
3930  02c2 ab30          	add	a,#48
3931  02c4 cd00b5        	call	_Display_LCD_Data
3933                     ; 239 		num %= 10;
3935  02c7 1e02          	ldw	x,(OFST+1,sp)
3936  02c9 a60a          	ld	a,#10
3937  02cb 62            	div	x,a
3938  02cc 5f            	clrw	x
3939  02cd 97            	ld	xl,a
3940  02ce 1f02          	ldw	(OFST+1,sp),x
3941                     ; 240 		Display_LCD_Data((U8)(48+num));
3943  02d0 7b03          	ld	a,(OFST+2,sp)
3944  02d2 ab30          	add	a,#48
3945  02d4 cd00b5        	call	_Display_LCD_Data
3948  02d7 2038          	jra	L5032
3949  02d9               L3132:
3950                     ; 241 	}else if(num >= 10){
3952  02d9 1e02          	ldw	x,(OFST+1,sp)
3953  02db a3000a        	cpw	x,#10
3954  02de 252a          	jrult	L7132
3955                     ; 242 		buff = (U8)(num / 10);
3957  02e0 1e02          	ldw	x,(OFST+1,sp)
3958  02e2 a60a          	ld	a,#10
3959  02e4 62            	div	x,a
3960  02e5 9f            	ld	a,xl
3961  02e6 6b01          	ld	(OFST+0,sp),a
3963                     ; 243 		num %= 10;
3965  02e8 1e02          	ldw	x,(OFST+1,sp)
3966  02ea a60a          	ld	a,#10
3967  02ec 62            	div	x,a
3968  02ed 5f            	clrw	x
3969  02ee 97            	ld	xl,a
3970  02ef 1f02          	ldw	(OFST+1,sp),x
3971                     ; 244 		Display_LCD_Data((U8)(48+buff));
3973  02f1 7b01          	ld	a,(OFST+0,sp)
3974  02f3 ab30          	add	a,#48
3975  02f5 cd00b5        	call	_Display_LCD_Data
3977                     ; 246 		num %= 10;
3979  02f8 1e02          	ldw	x,(OFST+1,sp)
3980  02fa a60a          	ld	a,#10
3981  02fc 62            	div	x,a
3982  02fd 5f            	clrw	x
3983  02fe 97            	ld	xl,a
3984  02ff 1f02          	ldw	(OFST+1,sp),x
3985                     ; 247 		Display_LCD_Data((U8)(48+num));
3987  0301 7b03          	ld	a,(OFST+2,sp)
3988  0303 ab30          	add	a,#48
3989  0305 cd00b5        	call	_Display_LCD_Data
3992  0308 2007          	jra	L5032
3993  030a               L7132:
3994                     ; 248 	}else{ Display_LCD_Data((U8)(48+num));}
3996  030a 7b03          	ld	a,(OFST+2,sp)
3997  030c ab30          	add	a,#48
3998  030e cd00b5        	call	_Display_LCD_Data
4000  0311               L5032:
4001                     ; 250 	return;
4004  0311 5b03          	addw	sp,#3
4005  0313 81            	ret
4078                     	switch	.bss
4079  0000               _ui_blink_timer_cnt:
4080  0000 00            	ds.b	1
4081                     	xdef	_ui_blink_timer_cnt
4082                     	switch	.ubsct
4083  0000               _LCD_Buffer:
4084  0000 000000000000  	ds.b	32
4085                     	xdef	_LCD_Buffer
4086  0020               _Buffer_Add:
4087  0020 00            	ds.b	1
4088                     	xdef	_Buffer_Add
4089                     	xdef	_Display_Clear
4090                     	xdef	_LCD_Blink_Timer_Control
4091                     	xdef	_Num_Display_LCD
4092                     	xdef	_LCD_Buffer_Clear
4093                     	xdef	_LCD_Buffer_String
4094                     	xdef	_LCD_Buffer_Char
4095                     	xdef	_LCD_Buffer_Add
4096                     	xdef	_LCD_Initialize
4097                     	xdef	_Clear_Display_LCD
4098                     	xdef	_Display_LCD_String
4099                     	xdef	_Display_LCD_Data
4100                     	xdef	_Set_LCD_Address
4101                     	xdef	_Set_LCD_Command
4102                     	xdef	_Delay_ms
4103                     	switch	.bss
4104  0001               _LCD_Dis_Data:
4105  0001 000000000000  	ds.b	64
4106                     	xdef	_LCD_Dis_Data
4107                     	xdef	_LCD_Line
4108  0041               _uc_LCD_Blink_Reg:
4109  0041 00            	ds.b	1
4110                     	xdef	_uc_LCD_Blink_Reg
4111                     	xref	_Windows_Watchdog_Clear
4112                     .const:	section	.text
4113  0000               L7412:
4114  0000 202020202020  	dc.b	"                ",0
4134                     	end

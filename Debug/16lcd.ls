   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2709                     ; 33 void Delay_ms(unsigned char Delay)
2709                     ; 34 {
2710                     	switch	.text
2711  0000               f_Delay_ms:
2713  0000 88            	push	a
2714  0001 89            	pushw	x
2715       00000002      OFST:	set	2
2718  0002               L1371:
2719                     ; 36 	do{	i = 8;
2721  0002 a608          	ld	a,#8
2722  0004 6b02          	ld	(OFST+0,sp),a
2723                     ; 37 	Windows_Watchdog_Control();
2725  0006 8d000000      	callf	f_Windows_Watchdog_Control
2727  000a a6fb          	ld	a,#251
2728  000c               L7371:
2729                     ; 38 		do{ Delay_us(250);  }while(--i);
2731  000c 6b01          	ld	(OFST-1,sp),a
2733  000e               L1571:
2736  000e 0a01          	dec	(OFST-1,sp)
2737  0010 26fc          	jrne	L1571
2740  0012 0a02          	dec	(OFST+0,sp)
2741  0014 26f6          	jrne	L7371
2742                     ; 39 	}while(--Delay);
2744  0016 0a03          	dec	(OFST+1,sp)
2745  0018 26e8          	jrne	L1371
2746                     ; 40 	return;
2749  001a 5b03          	addw	sp,#3
2750  001c 87            	retf	
2790                     ; 44 void Set_LCD_Command(unsigned char Cmd)
2790                     ; 45 {
2791                     	switch	.text
2792  001d               f_Set_LCD_Command:
2794       00000001      OFST:	set	1
2797                     ; 46 	LCD_Data	= Cmd;
2799  001d c75005        	ld	_PB_ODR,a
2800  0020 88            	push	a
2801                     ; 47 	LCD_EN	= 1;
2803  0021 72165019      	bset	_PF_ODR,#3
2804                     ; 48 	Delay_us(150);//100
2806  0025 a697          	ld	a,#151
2807  0027 6b01          	ld	(OFST+0,sp),a
2809  0029               L7771:
2812  0029 0a01          	dec	(OFST+0,sp)
2813  002b 26fc          	jrne	L7771
2814                     ; 49 	LCD_EN	= 0;
2817  002d 72175019      	bres	_PF_ODR,#3
2818                     ; 50 	return;
2821  0031 84            	pop	a
2822  0032 87            	retf	
2862                     ; 54 void Set_LCD_Address(unsigned char Add)
2862                     ; 55 {
2863                     	switch	.text
2864  0033               f_Set_LCD_Address:
2866  0033 88            	push	a
2867       00000001      OFST:	set	1
2870                     ; 56 	LCD_Data	= (unsigned char)(Add | 0x80);
2872  0034 aa80          	or	a,#128
2873  0036 c75005        	ld	_PB_ODR,a
2874                     ; 57 	LCD_EN	= 1;
2876                     ; 58 	Delay_us(150);//100
2878  0039 a697          	ld	a,#151
2879  003b 72165019      	bset	_PF_ODR,#3
2880  003f 6b01          	ld	(OFST+0,sp),a
2882  0041               L5202:
2885  0041 0a01          	dec	(OFST+0,sp)
2886  0043 26fc          	jrne	L5202
2887                     ; 59 	LCD_EN	= 0;
2890  0045 72175019      	bres	_PF_ODR,#3
2891                     ; 60 	return;
2894  0049 84            	pop	a
2895  004a 87            	retf	
2935                     ; 64 void Display_LCD_Data(unsigned char Data)
2935                     ; 65 {
2936                     	switch	.text
2937  004b               f_Display_LCD_Data:
2939       00000001      OFST:	set	1
2942                     ; 66 	LCD_Data = Data;
2944  004b c75005        	ld	_PB_ODR,a
2945                     ; 67 	LCD_RS = 1;
2947  004e 721a5019      	bset	_PF_ODR,#5
2948  0052 88            	push	a
2949                     ; 68 	LCD_EN = 1;
2951  0053 72165019      	bset	_PF_ODR,#3
2952                     ; 69 	Delay_us(150);
2954  0057 a697          	ld	a,#151
2955  0059 6b01          	ld	(OFST+0,sp),a
2957  005b               L3502:
2960  005b 0a01          	dec	(OFST+0,sp)
2961  005d 26fc          	jrne	L3502
2962                     ; 70 	LCD_EN = 0;
2965  005f 72175019      	bres	_PF_ODR,#3
2966                     ; 71 	LCD_RS = 0;
2968                     ; 72 	return;
2971  0063 84            	pop	a
2972  0064 721b5019      	bres	_PF_ODR,#5
2973  0068 87            	retf	
3008                     ; 76 void Display_LCD_String(unsigned char const *str)
3008                     ; 77 {
3009                     	switch	.text
3010  0069               f_Display_LCD_String:
3012  0069 89            	pushw	x
3013       00000000      OFST:	set	0
3016  006a 2009          	jra	L1012
3017  006c               L5702:
3018                     ; 78 	for(; *str;){ Display_LCD_Data(*str++);	}
3020  006c 5c            	incw	x
3021  006d 1f01          	ldw	(OFST+1,sp),x
3022  006f 5a            	decw	x
3023  0070 f6            	ld	a,(x)
3024  0071 8d4b004b      	callf	f_Display_LCD_Data
3026  0075               L1012:
3029  0075 1e01          	ldw	x,(OFST+1,sp)
3030  0077 f6            	ld	a,(x)
3031  0078 26f2          	jrne	L5702
3032                     ; 79 	return;
3035  007a 85            	popw	x
3036  007b 87            	retf	
3060                     ; 84 void Clear_Display_LCD(void)
3060                     ; 85 {
3061                     	switch	.text
3062  007c               f_Clear_Display_LCD:
3066                     ; 86 	Set_LCD_Address(0x00);	// 1 Line Test Zig
3068  007c 4f            	clr	a
3069  007d 8d330033      	callf	f_Set_LCD_Address
3071                     ; 87 	Display_LCD_String("                ");
3073  0081 ae0000        	ldw	x,#L5112
3074  0084 8d690069      	callf	f_Display_LCD_String
3076                     ; 89 	Set_LCD_Address(0xC0);  // 2 Line Test Zig
3078  0088 a6c0          	ld	a,#192
3079  008a 8d330033      	callf	f_Set_LCD_Address
3081                     ; 90 	Display_LCD_String("                ");
3083  008e ae0000        	ldw	x,#L5112
3084  0091 8d690069      	callf	f_Display_LCD_String
3086                     ; 92 	Set_LCD_Address(0x10);  // 3 Line Test Zig
3088  0095 a610          	ld	a,#16
3089  0097 8d330033      	callf	f_Set_LCD_Address
3091                     ; 93 	Display_LCD_String("                ");
3093  009b ae0000        	ldw	x,#L5112
3094  009e 8d690069      	callf	f_Display_LCD_String
3096                     ; 95 	Set_LCD_Address(0xD0);  // 4 Line Test Zig
3098  00a2 a6d0          	ld	a,#208
3099  00a4 8d330033      	callf	f_Set_LCD_Address
3101                     ; 96 	Display_LCD_String("                ");
3103  00a8 ae0000        	ldw	x,#L5112
3105                     ; 98 	return;
3108  00ab 20bc          	jpf	f_Display_LCD_String
3133                     ; 103 void LCD_Initialize(void)
3133                     ; 104 {
3134                     	switch	.text
3135  00ad               f_LCD_Initialize:
3139                     ; 110 	Set_LCD_Command(0x3C);	//Function set
3141  00ad a63c          	ld	a,#60
3142  00af 8d1d001d      	callf	f_Set_LCD_Command
3144                     ; 111 	Delay_ms(50);
3146  00b3 a632          	ld	a,#50
3147  00b5 8d000000      	callf	f_Delay_ms
3149                     ; 113 	Set_LCD_Command(0x3C);	//Function set
3151  00b9 a63c          	ld	a,#60
3152  00bb 8d1d001d      	callf	f_Set_LCD_Command
3154                     ; 114 	Delay_ms(100);
3156  00bf a664          	ld	a,#100
3157  00c1 8d000000      	callf	f_Delay_ms
3159                     ; 115 	Set_LCD_Command(0x3C);	//Function set
3161  00c5 a63c          	ld	a,#60
3162  00c7 8d1d001d      	callf	f_Set_LCD_Command
3164                     ; 117 	Set_LCD_Command(0x3C);	//Function set
3166  00cb a63c          	ld	a,#60
3167  00cd 8d1d001d      	callf	f_Set_LCD_Command
3169                     ; 118 	Set_LCD_Command(0x08);	//Display off
3171  00d1 a608          	ld	a,#8
3172  00d3 8d1d001d      	callf	f_Set_LCD_Command
3174                     ; 119 	Set_LCD_Command(0x01);	//Display Clear and Return home
3176  00d7 a601          	ld	a,#1
3177  00d9 8d1d001d      	callf	f_Set_LCD_Command
3179                     ; 120 	Delay_ms(100);
3181  00dd a664          	ld	a,#100
3182  00df 8d000000      	callf	f_Delay_ms
3184                     ; 122 	Set_LCD_Command(0x06);	//Entry mode setting
3186  00e3 a606          	ld	a,#6
3187  00e5 8d1d001d      	callf	f_Set_LCD_Command
3189                     ; 123 	Set_LCD_Command(0x0C);	//Display on and cursor off
3191  00e9 a60c          	ld	a,#12
3192  00eb 8d1d001d      	callf	f_Set_LCD_Command
3194                     ; 124 	Set_LCD_Address(0x00);	//LCD Address Init
3196  00ef 4f            	clr	a
3198                     ; 132 	return;
3201  00f0 ac330033      	jpf	f_Set_LCD_Address
3233                     ; 136 void LCD_Buffer_Add(unsigned char Add)
3233                     ; 137 {
3234                     	switch	.text
3235  00f4               f_LCD_Buffer_Add:
3237  00f4 88            	push	a
3238       00000000      OFST:	set	0
3241                     ; 138 	if(Add >= 0xC0){ Buffer_Add = (unsigned char)((Add & 0x0F) + 48);	}	//forth_LCD_Column
3243  00f5 a1c0          	cp	a,#192
3244  00f7 2506          	jrult	L3412
3247  00f9 a40f          	and	a,#15
3248  00fb ab30          	add	a,#48
3250  00fd 2004          	jra	L5412
3251  00ff               L3412:
3252                     ; 139 	else{	Buffer_Add = (unsigned char)(Add & 0x0F);		}			//First_LCD_Column
3254  00ff 7b01          	ld	a,(OFST+1,sp)
3255  0101 a40f          	and	a,#15
3256  0103               L5412:
3257  0103 b720          	ld	_Buffer_Add,a
3258                     ; 140 	return;
3261  0105 84            	pop	a
3262  0106 87            	retf	
3295                     ; 144 void LCD_Buffer_Char(unsigned char Data)
3295                     ; 145 {
3296                     	switch	.text
3297  0107               f_LCD_Buffer_Char:
3299  0107 88            	push	a
3300       00000000      OFST:	set	0
3303                     ; 146 	LCD_Buffer[Buffer_Add++] = Data;
3305  0108 b620          	ld	a,_Buffer_Add
3306  010a 3c20          	inc	_Buffer_Add
3307  010c 5f            	clrw	x
3308  010d 97            	ld	xl,a
3309  010e 7b01          	ld	a,(OFST+1,sp)
3310  0110 e700          	ld	(_LCD_Buffer,x),a
3311                     ; 147 	return;
3314  0112 84            	pop	a
3315  0113 87            	retf	
3350                     ; 151 void LCD_Buffer_String(unsigned char const *str)
3350                     ; 152 {
3351                     	switch	.text
3352  0114               f_LCD_Buffer_String:
3354  0114 89            	pushw	x
3355       00000000      OFST:	set	0
3358  0115 2009          	jra	L5022
3359  0117               L1022:
3360                     ; 153 	for(; *str;){ LCD_Buffer_Char(*str++);	}
3362  0117 5c            	incw	x
3363  0118 1f01          	ldw	(OFST+1,sp),x
3364  011a 5a            	decw	x
3365  011b f6            	ld	a,(x)
3366  011c 8d070107      	callf	f_LCD_Buffer_Char
3368  0120               L5022:
3371  0120 1e01          	ldw	x,(OFST+1,sp)
3372  0122 f6            	ld	a,(x)
3373  0123 26f2          	jrne	L1022
3374                     ; 154 	return;
3377  0125 85            	popw	x
3378  0126 87            	retf	
3410                     ; 158 void LCD_Buffer_Clear(void)
3410                     ; 159 {
3411                     	switch	.text
3412  0127               f_LCD_Buffer_Clear:
3414  0127 88            	push	a
3415       00000001      OFST:	set	1
3418                     ; 162 	for(i = 0; i < 32; i++){ LCD_Buffer[i] = ' ';	}
3420  0128 4f            	clr	a
3421  0129 6b01          	ld	(OFST+0,sp),a
3422  012b               L5222:
3425  012b 5f            	clrw	x
3426  012c 97            	ld	xl,a
3427  012d a620          	ld	a,#32
3428  012f e700          	ld	(_LCD_Buffer,x),a
3431  0131 0c01          	inc	(OFST+0,sp)
3434  0133 7b01          	ld	a,(OFST+0,sp)
3435  0135 a120          	cp	a,#32
3436  0137 25f2          	jrult	L5222
3437                     ; 163 	return;
3440  0139 84            	pop	a
3441  013a 87            	retf	
3474                     	xdef	f_Set_LCD_Command
3475                     	switch	.ubsct
3476  0000               _LCD_Buffer:
3477  0000 000000000000  	ds.b	32
3478                     	xdef	_LCD_Buffer
3479  0020               _Buffer_Add:
3480  0020 00            	ds.b	1
3481                     	xdef	_Buffer_Add
3482                     	xdef	f_Clear_Display_LCD
3483                     	xdef	f_Delay_ms
3484                     	xdef	f_Display_LCD_Data
3485                     	xdef	f_Display_LCD_String
3486                     	xdef	f_Set_LCD_Address
3487                     	xdef	f_LCD_Buffer_String
3488                     	xdef	f_LCD_Buffer_Char
3489                     	xdef	f_LCD_Buffer_Add
3490                     	xdef	f_LCD_Buffer_Clear
3491                     	xdef	f_LCD_Initialize
3492                     	xref	f_Windows_Watchdog_Control
3493                     .const:	section	.text
3494  0000               L5112:
3495  0000 202020202020  	dc.b	"                ",0
3515                     	end

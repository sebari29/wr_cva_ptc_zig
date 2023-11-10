   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2655                     	switch	.data
2656  0000               _g_test_op_mode:
2657  0000 00            	dc.b	0
2689                     ; 19 void System_On_Initialize(void)
2689                     ; 20 {
2691                     	switch	.text
2692  0000               _System_On_Initialize:
2696                     ; 21 	Test_Ctrl_Reset_Values();
2698  0000 cd0000        	call	_Test_Ctrl_Reset_Values
2700                     ; 22 	TIMER_3_Enable();			// System_Timer_Enable
2702  0003 cd0000        	call	_TIMER_3_Enable
2704                     ; 28 	return;
2707  0006 81            	ret
2731                     ; 37 void Timer_10ms_Routine(void)
2731                     ; 38 {
2732                     	switch	.text
2733  0007               _Timer_10ms_Routine:
2737                     ; 39 	LCD_Blink_Timer_Control();
2739  0007 cd0000        	call	_LCD_Blink_Timer_Control
2741                     ; 41 	return;
2744  000a 81            	ret
2770                     ; 45 void Start_Zig_Display(void)
2770                     ; 46 {
2771                     	switch	.text
2772  000b               _Start_Zig_Display:
2776                     ; 47 	if(b_First_Logic_On == OFF){
2778  000b b600          	ld	a,_uc_System_Ctrl_Reg
2779  000d a501          	bcp	a,#1
2780  000f 262b          	jrne	L1471
2781                     ; 49 		Set_LCD_Address(0x00);	// 1 Line Test Zig
2783  0011 4f            	clr	a
2784  0012 cd0000        	call	_Set_LCD_Address
2786                     ; 50 		Display_LCD_String("WOORY Industrial");
2788  0015 ae002f        	ldw	x,#L3471
2789  0018 cd0000        	call	_Display_LCD_String
2791                     ; 52 		Set_LCD_Address(0xC0);  // 2 Line Test Zig
2793  001b a6c0          	ld	a,#192
2794  001d cd0000        	call	_Set_LCD_Address
2796                     ; 58 		Display_LCD_String("CV FRONT PTC");
2798  0020 ae0022        	ldw	x,#L5471
2799  0023 cd0000        	call	_Display_LCD_String
2801                     ; 62 		Set_LCD_Address(0x10);  // 3 Line Test Zig
2803  0026 a610          	ld	a,#16
2804  0028 cd0000        	call	_Set_LCD_Address
2806                     ; 63 		Display_LCD_String("Test Ctrl Ver0.3");
2808  002b ae0011        	ldw	x,#L7471
2809  002e cd0000        	call	_Display_LCD_String
2811                     ; 65 		Set_LCD_Address(0xD0);  // 4 Line Test Zig
2813  0031 a6d0          	ld	a,#208
2814  0033 cd0000        	call	_Set_LCD_Address
2816                     ; 66 		Display_LCD_String("23.11.06  By YJS");
2818  0036 ae0000        	ldw	x,#L1571
2819  0039 cd0000        	call	_Display_LCD_String
2821  003c               L1471:
2822                     ; 68 	return;
2825  003c 81            	ret
2885                     ; 74 void System_IO_Port_Initialize(void)
2885                     ; 75 {
2886                     	switch	.text
2887  003d               _System_IO_Port_Initialize:
2891                     ; 76 	EXTI_CR1 = 0B10101010;
2893  003d 35aa50a0      	mov	_EXTI_CR1,#170
2894                     ; 77 	EXTI_CR2 = 0B00000010;
2896  0041 350250a1      	mov	_EXTI_CR2,#2
2897                     ; 79 	PA_ODR	= 0B00000000;		//PORT_A all of ouput low
2899  0045 725f5000      	clr	_PA_ODR
2900                     ; 80 	PA_DDR	= 0B00000000;		//PORT_A Input / Output Selection
2902  0049 725f5002      	clr	_PA_DDR
2903                     ; 81 	PA_CR1	= 0B00000000;		//PORT_A Function Select_1
2905  004d 725f5003      	clr	_PA_CR1
2906                     ; 82 	PA_CR2	= 0B00000000;		//PORT_A Function Select_2 ;; IGN Input/Speed Signal Input
2908  0051 725f5004      	clr	_PA_CR2
2909                     ; 84 	PB_ODR	= 0B00000000;		//PORT_B all of ouput low
2911  0055 725f5005      	clr	_PB_ODR
2912                     ; 85 	PB_DDR	= 0B11111111;		//PORT_B Input / Output Selection
2914  0059 35ff5007      	mov	_PB_DDR,#255
2915                     ; 86 	PB_CR1	= 0B11111111;		//PORT_B Function Select_1
2917  005d 35ff5008      	mov	_PB_CR1,#255
2918                     ; 87 	PB_CR2	= 0B00000000;		//PORT_B Function Select_2
2920  0061 725f5009      	clr	_PB_CR2
2921                     ; 89 	PC_ODR	= 0B00000000;		//PORT_C all of ouput low
2923  0065 725f500a      	clr	_PC_ODR
2924                     ; 90 	PC_DDR	= 0B11100110;		//PORT_C Input / Output Selection
2926  0069 35e6500c      	mov	_PC_DDR,#230
2927                     ; 91 	PC_CR1	= 0B11100110;		//PORT_C Function Select_1
2929  006d 35e6500d      	mov	_PC_CR1,#230
2930                     ; 92 	PC_CR2	= 0B00000000;		//PORT_C Function Select_2
2932  0071 725f500e      	clr	_PC_CR2
2933                     ; 94 	PD_ODR	= 0B00000100;		//PORT_D all of ouput low
2935  0075 3504500f      	mov	_PD_ODR,#4
2936                     ; 95 	PD_DDR	= 0B10011111;		//PORT_D Input 0/ Output 1 Selection
2938  0079 359f5011      	mov	_PD_DDR,#159
2939                     ; 96 	PD_CR1	= 0B10011111;		//PORT_D Function Select_1
2941  007d 359f5012      	mov	_PD_CR1,#159
2942                     ; 97 	PD_CR2	= 0B00000000;		//PORT_D Function Select_2
2944  0081 725f5013      	clr	_PD_CR2
2945                     ; 99 	PE_ODR	= 0B00000000;		//PORT_E all of ouput low
2947  0085 725f5014      	clr	_PE_ODR
2948                     ; 100 	PE_DDR	= 0B01111110;		//PORT_E Input / Output Selection.
2950  0089 357e5016      	mov	_PE_DDR,#126
2951                     ; 101 	PE_CR1	= 0B01111110;		//PORT_E Function Select_1
2953  008d 357e5017      	mov	_PE_CR1,#126
2954                     ; 102 	PE_CR2	= 0B00000000;		//PORT_E Function Select_2
2956  0091 725f5018      	clr	_PE_CR2
2957                     ; 104 	PF_ODR	= 0B00000000;		//PORT_F all of ouput low
2959  0095 725f5019      	clr	_PF_ODR
2960                     ; 105 	PF_DDR	= 0B00111001;		//PORT_F Input / Output Selection.
2962  0099 3539501b      	mov	_PF_DDR,#57
2963                     ; 106 	PF_CR1	= 0B00111001;		//PORT_F Function Select_1
2965  009d 3539501c      	mov	_PF_CR1,#57
2966                     ; 107 	PF_CR2	= 0B00000000;		//PORT_F Function Select_2
2968  00a1 725f501d      	clr	_PF_CR2
2969                     ; 109 	PG_ODR	= 0B00000000;		//PORT_G all of ouput low
2971  00a5 725f501e      	clr	_PG_ODR
2972                     ; 110 	PG_DDR	= 0B11111000;		//PORT_G Input / Output Selection
2974  00a9 35f85020      	mov	_PG_DDR,#248
2975                     ; 111 	PG_CR1	= 0B11111000;		//PORT_G Function Select_1
2977  00ad 35f85021      	mov	_PG_CR1,#248
2978                     ; 112 	PG_CR2	= 0B00000000;		//PORT_G Function Select_2
2980  00b1 725f5022      	clr	_PG_CR2
2981                     ; 114 	PI_ODR	= 0B00000000;		//PORT_I all of ouput low
2983  00b5 725f5028      	clr	_PI_ODR
2984                     ; 115 	PI_DDR	= 0B00000001;		//PORT_I Input / Output Selection
2986  00b9 3501502a      	mov	_PI_DDR,#1
2987                     ; 116 	PI_CR1	= 0B00000001;		//PORT_I Function Select_1
2989  00bd 3501502b      	mov	_PI_CR1,#1
2990                     ; 117 	PI_CR2	= 0B00000000;		//PORT_I Function Select_2
2992  00c1 725f502c      	clr	_PI_CR2
2993                     ; 119 	ADC_TDRH = 0B00000000;
2995  00c5 725f5406      	clr	_ADC_TDRH
2996                     ; 120 	ADC_TDRL = 0B00000000;
2998  00c9 725f5407      	clr	_ADC_TDRL
2999                     ; 121 	return;
3002  00cd 81            	ret
3038                     ; 127 void main(void)
3038                     ; 128 {
3039                     	switch	.text
3040  00ce               _main:
3044                     ; 129 	DisableInterrupts();				// Disable_Global_Interrupt
3046  00ce cd0000        	call	_DisableInterrupts
3048                     ; 131 	Windows_Watchdog_Clear();		// Enable_Windows_Watchdog
3050  00d1 cd0000        	call	_Windows_Watchdog_Clear
3052                     ; 132 	CPU_Clock_Initialize();			// System_Clock_Initialize
3054  00d4 cd0000        	call	_CPU_Clock_Initialize
3056                     ; 133 	System_IO_Port_Initialize();		// IO_Port_Initialize
3058  00d7 cd003d        	call	_System_IO_Port_Initialize
3060                     ; 134 	System_On_Initialize();			// System_Function_Initialize
3062  00da cd0000        	call	_System_On_Initialize
3064                     ; 136 	EnableInterrupts();				// Enabled_Global_Interrupt
3066  00dd cd0000        	call	_EnableInterrupts
3068                     ; 137 	LCD_Initialize();
3070  00e0 cd0000        	call	_LCD_Initialize
3072                     ; 138 	Start_Zig_Display();
3074  00e3 cd000b        	call	_Start_Zig_Display
3076  00e6               L3771:
3077                     ; 141 		Windows_Watchdog_Clear();	// Enabled_Windows_Watchdog	
3079  00e6 cd0000        	call	_Windows_Watchdog_Clear
3081                     ; 143 		if(b_System_10ms_Task)
3083  00e9 b600          	ld	a,_uc_System_Ctrl_Reg
3084  00eb a502          	bcp	a,#2
3085  00ed 2712          	jreq	L7771
3086                     ; 145 IC_SWIM_OUTPUT=1;
3088  00ef 7212500f      	bset	_PD_ODR,#1
3089                     ; 147 			Timer_10ms_Routine();
3091  00f3 cd0007        	call	_Timer_10ms_Routine
3093                     ; 148 			Controller_Button_Detection();
3095  00f6 cd0000        	call	_Controller_Button_Detection
3097                     ; 156 IC_SWIM_OUTPUT=0;
3099  00f9 7213500f      	bres	_PD_ODR,#1
3100                     ; 157 			b_System_10ms_Task = OFF;	// 10ms_Task_Flag_Reset
3102  00fd 72130000      	bres	_uc_System_Ctrl_Reg,#1
3103  0101               L7771:
3104                     ; 160 		CAN_Management_Function();
3106  0101 cd0000        	call	_CAN_Management_Function
3109  0104 20e0          	jra	L3771
3134                     ; 167 @interrupt void TIMER_3_Interrupt(void)		//10ms_Timer_Interrupt_Routine
3134                     ; 168 {
3135                     	switch	.text
3136  0106               _TIMER_3_Interrupt:
3140                     ; 169 	TIM3_SR1 &= 0B11111110;	 		//Pending update flag clear
3142  0106 72115322      	bres	_TIM3_SR1,#0
3143                     ; 170 	b_System_10ms_Task = ON;
3145  010a 72120000      	bset	_uc_System_Ctrl_Reg,#1
3146                     ; 171 	b_Can_10ms_Periode = ON;
3148  010e 72140000      	bset	_uc_System_Ctrl_Reg,#2
3149                     ; 173 	return;
3152  0112 80            	iret
3193                     	xdef	_TIMER_3_Interrupt
3194                     	xdef	_main
3195                     	xdef	_System_IO_Port_Initialize
3196                     	xdef	_Timer_10ms_Routine
3197                     	xdef	_System_On_Initialize
3198                     	xdef	_g_test_op_mode
3199                     	switch	.bss
3200  0000               _ui_System_Timer_Cnt:
3201  0000 0000          	ds.b	2
3202                     	xdef	_ui_System_Timer_Cnt
3203                     	xdef	_Start_Zig_Display
3204                     	xref	_CAN_Management_Function
3205                     	xref	_Test_Ctrl_Reset_Values
3206                     	xref	_Controller_Button_Detection
3207                     	xref	_LCD_Blink_Timer_Control
3208                     	xref	_LCD_Initialize
3209                     	xref	_Display_LCD_String
3210                     	xref	_Set_LCD_Address
3211                     	xref	_TIMER_3_Enable
3212                     	xref	_Windows_Watchdog_Clear
3213                     	xref	_EnableInterrupts
3214                     	xref	_DisableInterrupts
3215                     	xref	_CPU_Clock_Initialize
3216                     	switch	.ubsct
3217  0000               _uc_System_Ctrl_Reg:
3218  0000 00            	ds.b	1
3219                     	xdef	_uc_System_Ctrl_Reg
3220                     .const:	section	.text
3221  0000               L1571:
3222  0000 32332e31312e  	dc.b	"23.11.06  By YJS",0
3223  0011               L7471:
3224  0011 546573742043  	dc.b	"Test Ctrl Ver0.3",0
3225  0022               L5471:
3226  0022 43562046524f  	dc.b	"CV FRONT PTC",0
3227  002f               L3471:
3228  002f 574f4f525920  	dc.b	"WOORY Industrial",0
3248                     	end

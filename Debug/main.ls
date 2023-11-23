   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2684                     ; 19 void System_On_Initialize(void)
2684                     ; 20 {
2686                     	switch	.text
2687  0000               _System_On_Initialize:
2691                     ; 21 	Test_Ctrl_Reset_Values();
2693  0000 cd0000        	call	_Test_Ctrl_Reset_Values
2695                     ; 22 	TIMER_3_Enable();			// System_Timer_Enable
2697  0003 cd0000        	call	_TIMER_3_Enable
2699                     ; 28 	return;
2702  0006 81            	ret
2726                     ; 37 void Timer_10ms_Routine(void)
2726                     ; 38 {
2727                     	switch	.text
2728  0007               _Timer_10ms_Routine:
2732                     ; 39 	LCD_Blink_Timer_Control();
2734  0007 cd0000        	call	_LCD_Blink_Timer_Control
2736                     ; 41 	return;
2739  000a 81            	ret
2765                     ; 45 void Start_Zig_Display(void)
2765                     ; 46 {
2766                     	switch	.text
2767  000b               _Start_Zig_Display:
2771                     ; 47 	if(b_First_Logic_On == OFF){
2773  000b b600          	ld	a,_uc_System_Ctrl_Reg
2774  000d a501          	bcp	a,#1
2775  000f 262b          	jrne	L1471
2776                     ; 49 		Set_LCD_Address(0x00);	// 1 Line Test Zig
2778  0011 4f            	clr	a
2779  0012 cd0000        	call	_Set_LCD_Address
2781                     ; 50 		Display_LCD_String("WOORY Industrial");
2783  0015 ae002f        	ldw	x,#L3471
2784  0018 cd0000        	call	_Display_LCD_String
2786                     ; 52 		Set_LCD_Address(0xC0);  // 2 Line Test Zig
2788  001b a6c0          	ld	a,#192
2789  001d cd0000        	call	_Set_LCD_Address
2791                     ; 62 		Display_LCD_String("TEST CVa PTC");
2793  0020 ae0022        	ldw	x,#L5471
2794  0023 cd0000        	call	_Display_LCD_String
2796                     ; 64 		Set_LCD_Address(0x10);  // 3 Line Test Zig
2798  0026 a610          	ld	a,#16
2799  0028 cd0000        	call	_Set_LCD_Address
2801                     ; 65 		Display_LCD_String("Test Ctrl Ver0.4");
2803  002b ae0011        	ldw	x,#L7471
2804  002e cd0000        	call	_Display_LCD_String
2806                     ; 67 		Set_LCD_Address(0xD0);  // 4 Line Test Zig
2808  0031 a6d0          	ld	a,#208
2809  0033 cd0000        	call	_Set_LCD_Address
2811                     ; 68 		Display_LCD_String("23.11.23  By OSY");
2813  0036 ae0000        	ldw	x,#L1571
2814  0039 cd0000        	call	_Display_LCD_String
2816  003c               L1471:
2817                     ; 70 	return;
2820  003c 81            	ret
2880                     ; 76 void System_IO_Port_Initialize(void)
2880                     ; 77 {
2881                     	switch	.text
2882  003d               _System_IO_Port_Initialize:
2886                     ; 78 	EXTI_CR1 = 0B10101010;
2888  003d 35aa50a0      	mov	_EXTI_CR1,#170
2889                     ; 79 	EXTI_CR2 = 0B00000010;
2891  0041 350250a1      	mov	_EXTI_CR2,#2
2892                     ; 81 	PA_ODR	= 0B00000000;		//PORT_A all of ouput low
2894  0045 725f5000      	clr	_PA_ODR
2895                     ; 82 	PA_DDR	= 0B00000000;		//PORT_A Input / Output Selection
2897  0049 725f5002      	clr	_PA_DDR
2898                     ; 83 	PA_CR1	= 0B00000000;		//PORT_A Function Select_1
2900  004d 725f5003      	clr	_PA_CR1
2901                     ; 84 	PA_CR2	= 0B00000000;		//PORT_A Function Select_2 ;; IGN Input/Speed Signal Input
2903  0051 725f5004      	clr	_PA_CR2
2904                     ; 86 	PB_ODR	= 0B00000000;		//PORT_B all of ouput low
2906  0055 725f5005      	clr	_PB_ODR
2907                     ; 87 	PB_DDR	= 0B11111111;		//PORT_B Input / Output Selection
2909  0059 35ff5007      	mov	_PB_DDR,#255
2910                     ; 88 	PB_CR1	= 0B11111111;		//PORT_B Function Select_1
2912  005d 35ff5008      	mov	_PB_CR1,#255
2913                     ; 89 	PB_CR2	= 0B00000000;		//PORT_B Function Select_2
2915  0061 725f5009      	clr	_PB_CR2
2916                     ; 91 	PC_ODR	= 0B00000000;		//PORT_C all of ouput low
2918  0065 725f500a      	clr	_PC_ODR
2919                     ; 92 	PC_DDR	= 0B11100110;		//PORT_C Input / Output Selection
2921  0069 35e6500c      	mov	_PC_DDR,#230
2922                     ; 93 	PC_CR1	= 0B11100110;		//PORT_C Function Select_1
2924  006d 35e6500d      	mov	_PC_CR1,#230
2925                     ; 94 	PC_CR2	= 0B00000000;		//PORT_C Function Select_2
2927  0071 725f500e      	clr	_PC_CR2
2928                     ; 96 	PD_ODR	= 0B00000100;		//PORT_D all of ouput low
2930  0075 3504500f      	mov	_PD_ODR,#4
2931                     ; 97 	PD_DDR	= 0B10011101;		//PORT_D Input 0/ Output 1 Selection
2933  0079 359d5011      	mov	_PD_DDR,#157
2934                     ; 98 	PD_CR1	= 0B10011101;		//PORT_D Function Select_1
2936  007d 359d5012      	mov	_PD_CR1,#157
2937                     ; 99 	PD_CR2	= 0B00000000;		//PORT_D Function Select_2
2939  0081 725f5013      	clr	_PD_CR2
2940                     ; 101 	PE_ODR	= 0B00000000;		//PORT_E all of ouput low
2942  0085 725f5014      	clr	_PE_ODR
2943                     ; 102 	PE_DDR	= 0B01111110;		//PORT_E Input / Output Selection.
2945  0089 357e5016      	mov	_PE_DDR,#126
2946                     ; 103 	PE_CR1	= 0B01111110;		//PORT_E Function Select_1
2948  008d 357e5017      	mov	_PE_CR1,#126
2949                     ; 104 	PE_CR2	= 0B00000000;		//PORT_E Function Select_2
2951  0091 725f5018      	clr	_PE_CR2
2952                     ; 106 	PF_ODR	= 0B00000000;		//PORT_F all of ouput low
2954  0095 725f5019      	clr	_PF_ODR
2955                     ; 107 	PF_DDR	= 0B00111001;		//PORT_F Input / Output Selection.
2957  0099 3539501b      	mov	_PF_DDR,#57
2958                     ; 108 	PF_CR1	= 0B00111001;		//PORT_F Function Select_1
2960  009d 3539501c      	mov	_PF_CR1,#57
2961                     ; 109 	PF_CR2	= 0B00000000;		//PORT_F Function Select_2
2963  00a1 725f501d      	clr	_PF_CR2
2964                     ; 111 	PG_ODR	= 0B00000000;		//PORT_G all of ouput low
2966  00a5 725f501e      	clr	_PG_ODR
2967                     ; 112 	PG_DDR	= 0B11111000;		//PORT_G Input / Output Selection
2969  00a9 35f85020      	mov	_PG_DDR,#248
2970                     ; 113 	PG_CR1	= 0B11111000;		//PORT_G Function Select_1
2972  00ad 35f85021      	mov	_PG_CR1,#248
2973                     ; 114 	PG_CR2	= 0B00000000;		//PORT_G Function Select_2
2975  00b1 725f5022      	clr	_PG_CR2
2976                     ; 116 	PI_ODR	= 0B00000000;		//PORT_I all of ouput low
2978  00b5 725f5028      	clr	_PI_ODR
2979                     ; 117 	PI_DDR	= 0B00000001;		//PORT_I Input / Output Selection
2981  00b9 3501502a      	mov	_PI_DDR,#1
2982                     ; 118 	PI_CR1	= 0B00000001;		//PORT_I Function Select_1
2984  00bd 3501502b      	mov	_PI_CR1,#1
2985                     ; 119 	PI_CR2	= 0B00000000;		//PORT_I Function Select_2
2987  00c1 725f502c      	clr	_PI_CR2
2988                     ; 121 	ADC_TDRH = 0B00000000;
2990  00c5 725f5406      	clr	_ADC_TDRH
2991                     ; 122 	ADC_TDRL = 0B00000000;
2993  00c9 725f5407      	clr	_ADC_TDRL
2994                     ; 123 	return;
2997  00cd 81            	ret
3036                     ; 129 void main(void)
3036                     ; 130 {
3037                     	switch	.text
3038  00ce               _main:
3042                     ; 131 	DisableInterrupts();				// Disable_Global_Interrupt
3044  00ce cd0000        	call	_DisableInterrupts
3046                     ; 133 	Windows_Watchdog_Clear();		// Enable_Windows_Watchdog
3048  00d1 cd0000        	call	_Windows_Watchdog_Clear
3050                     ; 134 	CPU_Clock_Initialize();			// System_Clock_Initialize
3052  00d4 cd0000        	call	_CPU_Clock_Initialize
3054                     ; 135 	System_IO_Port_Initialize();		// IO_Port_Initialize
3056  00d7 cd003d        	call	_System_IO_Port_Initialize
3058                     ; 136 	System_On_Initialize();			// System_Function_Initialize
3060  00da cd0000        	call	_System_On_Initialize
3062                     ; 138 	EnableInterrupts();				// Enabled_Global_Interrupt
3064  00dd cd0000        	call	_EnableInterrupts
3066                     ; 139 	LCD_Initialize();
3068  00e0 cd0000        	call	_LCD_Initialize
3070  00e3               L3771:
3071                     ; 143 		Windows_Watchdog_Clear();	// Enabled_Windows_Watchdog	
3073  00e3 cd0000        	call	_Windows_Watchdog_Clear
3075                     ; 145 		if(b_System_10ms_Task){		// System_10ms_task
3077  00e6 b600          	ld	a,_uc_System_Ctrl_Reg
3078  00e8 a502          	bcp	a,#2
3079  00ea 2727          	jreq	L7771
3080                     ; 147 			Timer_10ms_Routine();
3082  00ec cd0007        	call	_Timer_10ms_Routine
3084                     ; 148 			Controller_Button_Detection();
3086  00ef cd0000        	call	_Controller_Button_Detection
3088                     ; 150 			if(!b_First_Logic_On){ Test_Controller_First_Routine(); }	// Controller_First_Display
3090  00f2 b600          	ld	a,_uc_System_Ctrl_Reg
3091  00f4 a501          	bcp	a,#1
3092  00f6 2605          	jrne	L1002
3095  00f8 cd0000        	call	_Test_Controller_First_Routine
3098  00fb 200f          	jra	L3002
3099  00fd               L1002:
3100                     ; 151 			else if(b_Model_Select_flag){ Model_Select_Routine(); }	// Model_Selection_Routine
3102  00fd c60000        	ld	a,_uc_Test_Ctrl_Reg
3103  0100 a501          	bcp	a,#1
3104  0102 2705          	jreq	L5002
3107  0104 cd0000        	call	_Model_Select_Routine
3110  0107 2003          	jra	L3002
3111  0109               L5002:
3112                     ; 152 			else{ Test_Controller_Routine(); }				// Test_Controller_Routine
3114  0109 cd0000        	call	_Test_Controller_Routine
3116  010c               L3002:
3117                     ; 154 			Controller_Button_Clear();
3119  010c cd0000        	call	_Controller_Button_Clear
3121                     ; 155 			b_System_10ms_Task = OFF;	// 10ms_Task_Flag_Reset
3123  010f 72130000      	bres	_uc_System_Ctrl_Reg,#1
3124  0113               L7771:
3125                     ; 158 		CAN_Management_Function();
3127  0113 cd0000        	call	_CAN_Management_Function
3130  0116 20cb          	jra	L3771
3155                     ; 165 @interrupt void TIMER_3_Interrupt(void)		//10ms_Timer_Interrupt_Routine
3155                     ; 166 {
3156                     	switch	.text
3157  0118               _TIMER_3_Interrupt:
3161                     ; 167 	TIM3_SR1 &= 0B11111110;	 		//Pending update flag clear
3163  0118 72115322      	bres	_TIM3_SR1,#0
3164                     ; 168 	b_System_10ms_Task = ON;
3166  011c 72120000      	bset	_uc_System_Ctrl_Reg,#1
3167                     ; 169 	b_Can_10ms_Periode = ON;
3169  0120 72140000      	bset	_uc_System_Ctrl_Reg,#2
3170                     ; 171 	return;
3173  0124 80            	iret
3207                     	xdef	_TIMER_3_Interrupt
3208                     	xdef	_main
3209                     	xdef	_System_IO_Port_Initialize
3210                     	xdef	_Timer_10ms_Routine
3211                     	xdef	_System_On_Initialize
3212                     	switch	.bss
3213  0000               _ui_System_Timer_Cnt:
3214  0000 0000          	ds.b	2
3215                     	xdef	_ui_System_Timer_Cnt
3216                     	xdef	_Start_Zig_Display
3217                     	xref	_CAN_Management_Function
3218                     	xref	_Test_Ctrl_Reset_Values
3219                     	xref	_Test_Controller_Routine
3220                     	xref	_Model_Select_Routine
3221                     	xref	_Test_Controller_First_Routine
3222                     	xref	_uc_Test_Ctrl_Reg
3223                     	xref	_Controller_Button_Detection
3224                     	xref	_Controller_Button_Clear
3225                     	xref	_LCD_Blink_Timer_Control
3226                     	xref	_LCD_Initialize
3227                     	xref	_Display_LCD_String
3228                     	xref	_Set_LCD_Address
3229                     	xref	_TIMER_3_Enable
3230                     	xref	_Windows_Watchdog_Clear
3231                     	xref	_EnableInterrupts
3232                     	xref	_DisableInterrupts
3233                     	xref	_CPU_Clock_Initialize
3234                     	switch	.ubsct
3235  0000               _uc_System_Ctrl_Reg:
3236  0000 00            	ds.b	1
3237                     	xdef	_uc_System_Ctrl_Reg
3238                     .const:	section	.text
3239  0000               L1571:
3240  0000 32332e31312e  	dc.b	"23.11.23  By OSY",0
3241  0011               L7471:
3242  0011 546573742043  	dc.b	"Test Ctrl Ver0.4",0
3243  0022               L5471:
3244  0022 544553542043  	dc.b	"TEST CVa PTC",0
3245  002f               L3471:
3246  002f 574f4f525920  	dc.b	"WOORY Industrial",0
3266                     	end

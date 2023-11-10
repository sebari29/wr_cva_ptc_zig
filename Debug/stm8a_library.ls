   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2688                     ; 10 void CPU_Clock_Initialize(void)
2688                     ; 11 {
2690                     	switch	.text
2691  0000               _CPU_Clock_Initialize:
2695                     ; 13 	if(CLK_CMSR != 0xB4){
2697  0000 c650c3        	ld	a,_CLK_CMSR
2698  0003 a1b4          	cp	a,#180
2699  0005 2722          	jreq	L1271
2700                     ; 14 		CLK_SWCR = 0B00000000;	//Clock Switch Disable, Switch Interrupt Disable
2702  0007 725f50c5      	clr	_CLK_SWCR
2703                     ; 15 		CLK_SWR = 0xB4;		//High Speed External Clock, HSI(0xE1), LSI(0xD2)
2705  000b 35b450c4      	mov	_CLK_SWR,#180
2707  000f               L7271:
2708                     ; 16 		while(!(CLK_SWCR & 0x08));	//SWIF
2710  000f c650c5        	ld	a,_CLK_SWCR
2711  0012 a508          	bcp	a,#8
2712  0014 27f9          	jreq	L7271
2713                     ; 17 		CLK_SWCR &= 0B11110111;	//Clear Switch Event
2715  0016 721750c5      	bres	_CLK_SWCR,#3
2716                     ; 18 		CLK_SWCR |= 0x02;		//by KMSHIM, clear
2718  001a 721250c5      	bset	_CLK_SWCR,#1
2720  001e               L5371:
2721                     ; 19 		while(CLK_SWCR & 0x01);    	//poll SWBSY
2723  001e c650c5        	ld	a,_CLK_SWCR
2724  0021 a501          	bcp	a,#1
2725  0023 26f9          	jrne	L5371
2726                     ; 20 		CLK_CKDIVR = 0x00; 	//xxxIIEEE : Fmaster = HSE / 1 = 8Mhz / 1, Fcpu = 8Mhz
2728  0025 725f50c6      	clr	_CLK_CKDIVR
2729  0029               L1271:
2730                     ; 23 	CLK_PCKENR1 = 0B01000000;		//TIM1 OFF, TIM3 ON, TIM2 OFF, TIM4 OFF, LINUART ON, USART OFF, SPI OFF, I2C OFF
2732  0029 354050c7      	mov	_CLK_PCKENR1,#64
2733                     ; 24 	CLK_PCKENR2 = 0B10000000;		//CAN OFF, ADC OFF, AWU OFF
2735  002d 358050ca      	mov	_CLK_PCKENR2,#128
2736                     ; 26 	return;
2739  0031 81            	ret
2763                     ; 30 void DisableInterrupts(void)
2763                     ; 31 {
2764                     	switch	.text
2765  0032               _DisableInterrupts:
2769                     ; 32 	_asm("sim");			//Disable Global Interrupt
2772  0032 9b            sim
2774                     ; 33 	return;
2777  0033 81            	ret
2801                     ; 37 void EnableInterrupts(void)
2801                     ; 38 {
2802                     	switch	.text
2803  0034               _EnableInterrupts:
2807                     ; 39 	_asm("rim");			//Enable Global Interrupt
2810  0034 9a            rim
2812                     ; 40 	return;
2815  0035 81            	ret
2841                     ; 44 void Windows_Watchdog_Clear(void)
2841                     ; 45 {
2842                     	switch	.text
2843  0036               _Windows_Watchdog_Clear:
2847                     ; 46 	WWDG_WR = 0x7F;			//Limit Counter Value = (8Mhz / 12288) x 63 = 96.768ms
2849  0036 357f50d2      	mov	_WWDG_WR,#127
2850                     ; 47 	WWDG_CR = 0xFF;			//96.768ms, Between 0 and WATCHDOG_LIMIT, if 100ms*(8Mhz/12288) = 33
2852  003a 35ff50d1      	mov	_WWDG_CR,#255
2853                     ; 48 	return;
2856  003e 81            	ret
2883                     ; 52 void ADC_Enable(void)
2883                     ; 53 {
2884                     	switch	.text
2885  003f               _ADC_Enable:
2889                     ; 54 	ADC_CR1	= 0B01000000;		//Sampleing clock = 8Mhz(Fmaster) / 8 = 1MHz, Single Mode, ADC Disable
2891  003f 35405401      	mov	_ADC_CR1,#64
2892                     ; 55 	ADC_CR2	= 0B00000000;		//External Trigger Disable, Left Alignment, Scan Disable
2894  0043 725f5402      	clr	_ADC_CR2
2895                     ; 56 	ADC_CR3	= 0B00000000;		//Buffer Disable
2897  0047 725f5403      	clr	_ADC_CR3
2898                     ; 57 	ADC_CSR	= 0B00000000;		//EOC Clear, AWD Clera, AWD Interrut Disable, EOC Interrupt Disable, Channel 0;
2900  004b 725f5400      	clr	_ADC_CSR
2901                     ; 58 	ADC_CR1 |= 0x01;			//ADC Conversion Start
2903  004f 72105401      	bset	_ADC_CR1,#0
2904                     ; 59 	return;
2907  0053 81            	ret
2950                     ; 63 unsigned int ADC_10BIT_Read(unsigned char Channel)
2950                     ; 64 {
2951                     	switch	.text
2952  0054               _ADC_10BIT_Read:
2954  0054 89            	pushw	x
2955       00000002      OFST:	set	2
2958                     ; 67 	ADC_CSR = Channel; 		//Select ADC Channel
2960  0055 c75400        	ld	_ADC_CSR,a
2961                     ; 68 	ADC_CR1 |= 0x01;			//ADC Conversion Start
2963  0058 72105401      	bset	_ADC_CR1,#0
2965  005c               L1202:
2966                     ; 69 	while((ADC_CSR & 0x80) == 0);	//Conversion Completed?
2968  005c c65400        	ld	a,_ADC_CSR
2969  005f a580          	bcp	a,#128
2970  0061 27f9          	jreq	L1202
2971                     ; 70 	Buffer = ADC_DRH;			//ADC Data[9:2]
2973  0063 c65404        	ld	a,_ADC_DRH
2974  0066 5f            	clrw	x
2975  0067 97            	ld	xl,a
2976  0068 1f01          	ldw	(OFST-1,sp),x
2978                     ; 71 	Buffer = (Buffer << 2) | ADC_DRL;	//ADC Data[1:0]
2980  006a 1e01          	ldw	x,(OFST-1,sp)
2981  006c 58            	sllw	x
2982  006d 58            	sllw	x
2983  006e 01            	rrwa	x,a
2984  006f ca5405        	or	a,_ADC_DRL
2985  0072 02            	rlwa	x,a
2986  0073 1f01          	ldw	(OFST-1,sp),x
2987  0075 01            	rrwa	x,a
2989                     ; 72 	return(Buffer);			//10Bit ADC Return
2991  0076 1e01          	ldw	x,(OFST-1,sp)
2994  0078 5b02          	addw	sp,#2
2995  007a 81            	ret
3024                     ; 76 void TIMER_3_Enable(void)			//10ms Timer Interrupt
3024                     ; 77 {
3025                     	switch	.text
3026  007b               _TIMER_3_Enable:
3030                     ; 85 	TIM3_CR1 = 0B10000101;		//Auto Reload Enable, overflow interrut, counter enable
3032  007b 35855320      	mov	_TIM3_CR1,#133
3033                     ; 86 	TIM3_PSCR = 0x07;			//Prescaler = Fcpu / 2 ^ 3 = 8M/8 = 1M
3035  007f 3507532a      	mov	_TIM3_PSCR,#7
3036                     ; 87 	TIM3_ARRH = 0x02;			//ARR = 9999, 10000/1M = 0.01s = 10ms
3038  0083 3502532b      	mov	_TIM3_ARRH,#2
3039                     ; 88 	TIM3_ARRL = 0x70;
3041  0087 3570532c      	mov	_TIM3_ARRL,#112
3042                     ; 89 	TIM3_SR1 = 0x00;			//Pending Flag Clear
3044  008b 725f5322      	clr	_TIM3_SR1
3045                     ; 90 	TIM3_IER = 0B00000001; 		//Overflow interrupt Enable
3047  008f 35015321      	mov	_TIM3_IER,#1
3048                     ; 92 	return;
3051  0093 81            	ret
3087                     ; 96 void CAN_Interrupt_Disable(void)		//CAN_Interrupt_All_Disable
3087                     ; 97 {
3088                     	switch	.text
3089  0094               _CAN_Interrupt_Disable:
3091  0094 88            	push	a
3092       00000001      OFST:	set	1
3095                     ; 100 	Buffer = CAN_FPSR;			//Current_Page_Save
3097  0095 c65427        	ld	a,_CAN_FPSR
3098  0098 6b01          	ld	(OFST+0,sp),a
3100                     ; 101 	CAN_IER = 0x00;
3102  009a 725f5425      	clr	_CAN_IER
3103                     ; 102 	CAN_FPSR = 0x06;
3105  009e 35065427      	mov	_CAN_FPSR,#6
3106                     ; 103 	CAN_P1 = 0x00;
3108  00a2 725f5429      	clr	_CAN_P1
3109                     ; 104 	CAN_FPSR = Buffer;
3111  00a6 7b01          	ld	a,(OFST+0,sp)
3112  00a8 c75427        	ld	_CAN_FPSR,a
3113                     ; 105 	return;
3116  00ab 84            	pop	a
3117  00ac 81            	ret
3153                     ; 109 void CAN_Interrupt_Enable(void)		//CAN_Interrupt_All_Enable
3153                     ; 110 {
3154                     	switch	.text
3155  00ad               _CAN_Interrupt_Enable:
3157  00ad 88            	push	a
3158       00000001      OFST:	set	1
3161                     ; 113 	Buffer = CAN_FPSR;
3163  00ae c65427        	ld	a,_CAN_FPSR
3164  00b1 6b01          	ld	(OFST+0,sp),a
3166                     ; 114 	CAN_IER = 0x0F;			//Wakeup = OFF, Overrun, FIFO Full, Message_Pending, Tx_Mail Box Empty Interrupt Enable
3168  00b3 350f5425      	mov	_CAN_IER,#15
3169                     ; 115 	CAN_FPSR = 0x06;			//Configuration/Diagnostic_Page_Select
3171  00b7 35065427      	mov	_CAN_FPSR,#6
3172                     ; 116 	CAN_P1 = 0x84;			//Interrupt Enable = BUS OFF = ON, Last Error Code = OFF, Error Passive = OFF, Error Wareing = OFF
3174  00bb 35845429      	mov	_CAN_P1,#132
3175                     ; 117 	CAN_FPSR = Buffer;
3177  00bf 7b01          	ld	a,(OFST+0,sp)
3178  00c1 c75427        	ld	_CAN_FPSR,a
3179                     ; 118 	return;
3182  00c4 84            	pop	a
3183  00c5 81            	ret
3228                     ; 122 void CAN_Enable(void)			//CAN_Initialize
3228                     ; 123 {
3229                     	switch	.text
3230  00c6               _CAN_Enable:
3234                     ; 125 	CAN_MCR &= 0B11111101;		//leave Sleep Mode = CPU Reset Defualt : Sleep
3236  00c6 72135420      	bres	_CAN_MCR,#1
3238  00ca               L7702:
3239                     ; 126 	while(CAN_MSR & 0x02);		//beCAN is in Sleep Mode
3241  00ca c65421        	ld	a,_CAN_MSR
3242  00cd a502          	bcp	a,#2
3243  00cf 26f9          	jrne	L7702
3244                     ; 129 	CAN_FPSR = 0x00;			//PSR(Page Select Register) : Tx_Mailbox_0_Page_Select
3246  00d1 725f5427      	clr	_CAN_FPSR
3247                     ; 130 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3249  00d5 72125428      	bset	_CAN_P0,#1
3250                     ; 132 	CAN_FPSR = 0x01;			//PSR(Page Select Register) : Tx_Mailbox_1_Page_Select
3252  00d9 35015427      	mov	_CAN_FPSR,#1
3253                     ; 133 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3255  00dd 72125428      	bset	_CAN_P0,#1
3256                     ; 135 	CAN_FPSR = 0x05;  			//PSR(Page Select Register) : Tx_Mailbox_2_Page_Select
3258  00e1 35055427      	mov	_CAN_FPSR,#5
3259                     ; 136 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3261  00e5 72125428      	bset	_CAN_P0,#1
3262                     ; 138 	CAN_MCR |= 0x01;			//MCR(Master Control Register) : Request_Initialisation
3264  00e9 72105420      	bset	_CAN_MCR,#0
3266  00ed               L5012:
3267                     ; 139 	while((CAN_MSR & 0x01) == 0);	//MSR(Master Select Regitser) : Wait_until_Acknowledged
3269  00ed c65421        	ld	a,_CAN_MSR
3270  00f0 a501          	bcp	a,#1
3271  00f2 27f9          	jreq	L5012
3272                     ; 141 	CAN_TSR |= 0B00000111;		//Clear_Request_Completed_for_Mailbox_[0:1:2]
3274  00f4 c65422        	ld	a,_CAN_TSR
3275  00f7 aa07          	or	a,#7
3276  00f9 c75422        	ld	_CAN_TSR,a
3278  00fc 2004          	jra	L3112
3279  00fe               L1112:
3280                     ; 144 	while(CAN_RFR & 0x03){ CAN_RFR = 0x20; }
3282  00fe 35205424      	mov	_CAN_RFR,#32
3283  0102               L3112:
3286  0102 c65424        	ld	a,_CAN_RFR
3287  0105 a503          	bcp	a,#3
3288  0107 26f5          	jrne	L1112
3289                     ; 146 	CAN_RFR |= 0x10;			//Clear_the_FIFO_Overrun(FOVR)_Bit
3291  0109 72185424      	bset	_CAN_RFR,#4
3292                     ; 147 	CAN_MSR = 0x08;  			//Clear_Wake_up_Pending_Interrupt
3294  010d 35085421      	mov	_CAN_MSR,#8
3295                     ; 148 	CAN_MCR |= 0x44;  			//Automatic_Bus_Off_Management, Tx_Priority_Driven by Request_Order
3297  0111 c65420        	ld	a,_CAN_MCR
3298  0114 aa44          	or	a,#68
3299  0116 c75420        	ld	_CAN_MCR,a
3300                     ; 151 	CAN_FPSR = 0x06;  			//Configuration / Diagnostic_Page_Select
3302  0119 35065427      	mov	_CAN_FPSR,#6
3303                     ; 152 	CAN_PA = 0x00;			//FCR1(Filter Configuration Register 1), Disable Filter 0 and Filter 1
3305  011d 725f5432      	clr	_CAN_PA
3306                     ; 153 	CAN_PB = 0x00;			//FCR2(Filter Configuration Register 2), Disable Filter 2 and Filter 3
3308  0121 725f5433      	clr	_CAN_PB
3309                     ; 154 	CAN_PC = 0x00;			//FCR3(Filter Configuration Register 3), Disable Filter 4 and Filter 5
3311  0125 725f5434      	clr	_CAN_PC
3312                     ; 157 	CAN_P4 = 0B00000001;		//SJW[7:6] = 1, BRP[5:0] = 2
3314  0129 3501542c      	mov	_CAN_P4,#1
3315                     ; 158 	CAN_P5 = 0B00010100;		//CAN Clock Source = Fcpu(8Mhz), BS2[6:4] = 2, BS1[3:0] = 5
3317  012d 3514542d      	mov	_CAN_P5,#20
3318                     ; 161 	CAN_P8 = 0B11111111;		//FMR1(Filter Mode Register 1) = Bank_3~0 : List_Mode
3320  0131 35ff5430      	mov	_CAN_P8,#255
3321                     ; 162 	CAN_P9 = 0B00001111;		//FMR2(Filter Mode Register 2) = Bank_5~4 : List_Mode
3323  0135 350f5431      	mov	_CAN_P9,#15
3324                     ; 165 	CAN_FPSR = 0x02;
3326  0139 35025427      	mov	_CAN_FPSR,#2
3327                     ; 167 	CAN_P0 	= (U8)((CAN_HTR_STATUS1_ID & 0x7F8) >> 3);	//Rx_Filter_0
3329  013d 35405428      	mov	_CAN_P0,#64
3330                     ; 168 	CAN_P1 	= (U8)((CAN_HTR_STATUS1_ID & 0x007) << 5);
3332  0141 35205429      	mov	_CAN_P1,#32
3333                     ; 169 	CAN_P2 	= (U8)((CAN_HTR_STATUS2_ID & 0x7F8) >> 3);	//Rx_Filter_1
3335  0145 3540542a      	mov	_CAN_P2,#64
3336                     ; 170 	CAN_P3 	= (U8)((CAN_HTR_STATUS2_ID & 0x007) << 5);
3338  0149 3540542b      	mov	_CAN_P3,#64
3339                     ; 171 	CAN_P4 	= (U8)((CAN_HTR_STATUS3_ID & 0x7F8) >> 3);	//Rx_Filter_2
3341  014d 3540542c      	mov	_CAN_P4,#64
3342                     ; 172 	CAN_P5 	= (U8)((CAN_HTR_STATUS3_ID & 0x007) << 5);
3344  0151 3560542d      	mov	_CAN_P5,#96
3345                     ; 173 	CAN_P6 	= (U8)((CAN_HTR_STATUS4_ID & 0x7F8) >> 3);	//Rx_Filter_3
3347  0155 3540542e      	mov	_CAN_P6,#64
3348                     ; 174 	CAN_P7 	= (U8)((CAN_HTR_STATUS4_ID & 0x007) << 5);
3350  0159 3580542f      	mov	_CAN_P7,#128
3351                     ; 177 	CAN_P8 	= (U8)(0x00);	//Rx_Filter_5
3353  015d 725f5430      	clr	_CAN_P8
3354                     ; 178 	CAN_P9 	= (U8)(0x00);
3356  0161 725f5431      	clr	_CAN_P9
3357                     ; 179 	CAN_PA 	= (U8)(0x00);	//Rx_Filter_7
3359  0165 725f5432      	clr	_CAN_PA
3360                     ; 180 	CAN_PB 	= (U8)(0x00);
3362  0169 725f5433      	clr	_CAN_PB
3363                     ; 181 	CAN_PC 	= (U8)(0x00);	//Rx_Filter_8
3365  016d 725f5434      	clr	_CAN_PC
3366                     ; 182 	CAN_PD 	= (U8)(0x00);
3368  0171 725f5435      	clr	_CAN_PD
3369                     ; 183 	CAN_PE 	= (U8)(0x00);	//Rx_Filter_9
3371  0175 725f5436      	clr	_CAN_PE
3372                     ; 184 	CAN_PF 	= (U8)(0x00);
3374  0179 725f5437      	clr	_CAN_PF
3375                     ; 187 	CAN_FPSR = 0x03;
3377  017d 35035427      	mov	_CAN_FPSR,#3
3378                     ; 189 	CAN_P0 	= (U8)(0x00);
3380  0181 725f5428      	clr	_CAN_P0
3381                     ; 190 	CAN_P1 	= (U8)(0x00);
3383  0185 725f5429      	clr	_CAN_P1
3384                     ; 191 	CAN_P2 	= (U8)(0x00);
3386  0189 725f542a      	clr	_CAN_P2
3387                     ; 192 	CAN_P3 	= (U8)(0x00);
3389  018d 725f542b      	clr	_CAN_P3
3390                     ; 193 	CAN_P4 	= (U8)(0x00);
3392  0191 725f542c      	clr	_CAN_P4
3393                     ; 194 	CAN_P5 	= (U8)(0x00);
3395  0195 725f542d      	clr	_CAN_P5
3396                     ; 195 	CAN_P6 	= (U8)(0x00);
3398  0199 725f542e      	clr	_CAN_P6
3399                     ; 196 	CAN_P7 	= (U8)(0x00);
3401  019d 725f542f      	clr	_CAN_P7
3402                     ; 198 	CAN_P8 	= (U8)(0x00);
3404  01a1 725f5430      	clr	_CAN_P8
3405                     ; 199 	CAN_P9 	= (U8)(0x00);
3407  01a5 725f5431      	clr	_CAN_P9
3408                     ; 200 	CAN_PA 	= (U8)(0x00);
3410  01a9 725f5432      	clr	_CAN_PA
3411                     ; 201 	CAN_PB 	= (U8)(0x00);
3413  01ad 725f5433      	clr	_CAN_PB
3414                     ; 202 	CAN_PC	= (U8)(0x00);
3416  01b1 725f5434      	clr	_CAN_PC
3417                     ; 203 	CAN_PD 	= (U8)(0x00);
3419  01b5 725f5435      	clr	_CAN_PD
3420                     ; 204 	CAN_PE 	= (U8)(0x00);
3422  01b9 725f5436      	clr	_CAN_PE
3423                     ; 205 	CAN_PF 	= (U8)(0x00);
3425  01bd 725f5437      	clr	_CAN_PF
3426                     ; 207 	CAN_FPSR = 0x04; 			//Filter_Bank_4,5 Page_Select
3428  01c1 35045427      	mov	_CAN_FPSR,#4
3429                     ; 209 	CAN_P0 	= (U8)(0x00);
3431  01c5 725f5428      	clr	_CAN_P0
3432                     ; 210 	CAN_P1 	= (U8)(0x00);
3434  01c9 725f5429      	clr	_CAN_P1
3435                     ; 211 	CAN_P2 	= (U8)(0x00);
3437  01cd 725f542a      	clr	_CAN_P2
3438                     ; 212 	CAN_P3 	= (U8)(0x00);
3440  01d1 725f542b      	clr	_CAN_P3
3441                     ; 213 	CAN_P4 	= (U8)(0x00);
3443  01d5 725f542c      	clr	_CAN_P4
3444                     ; 214 	CAN_P5 	= (U8)(0x00);
3446  01d9 725f542d      	clr	_CAN_P5
3447                     ; 215 	CAN_P6 	= (U8)(0x00);
3449  01dd 725f542e      	clr	_CAN_P6
3450                     ; 216 	CAN_P7 	= (U8)(0x00);
3452  01e1 725f542f      	clr	_CAN_P7
3453                     ; 218 	CAN_P8 	= (U8)(0x00);
3455  01e5 725f5430      	clr	_CAN_P8
3456                     ; 219 	CAN_P9 	= (U8)(0x00);
3458  01e9 725f5431      	clr	_CAN_P9
3459                     ; 220 	CAN_PA 	= (U8)(0x00);
3461  01ed 725f5432      	clr	_CAN_PA
3462                     ; 221 	CAN_PB 	= (U8)(0x00);
3464  01f1 725f5433      	clr	_CAN_PB
3465                     ; 222 	CAN_PC 	= (U8)(0x00);
3467  01f5 725f5434      	clr	_CAN_PC
3468                     ; 223 	CAN_PD 	= (U8)(0x00);
3470  01f9 725f5435      	clr	_CAN_PD
3471                     ; 224 	CAN_PE 	= (U8)(0x00);
3473  01fd 725f5436      	clr	_CAN_PE
3474                     ; 225 	CAN_PF 	= (U8)(0x00);
3476  0201 725f5437      	clr	_CAN_PF
3477                     ; 228 	CAN_FPSR = 0x06;
3479  0205 35065427      	mov	_CAN_FPSR,#6
3480                     ; 238 	CAN_PA = 0x55;			//Bank_1_&_0_Filter_Enable
3482  0209 35555432      	mov	_CAN_PA,#85
3483                     ; 241 	CAN_PB = 0x55;			//Filter_Disable
3485  020d 35555433      	mov	_CAN_PB,#85
3486                     ; 244 	CAN_PC = 0x00;			//Filter_Disable
3488  0211 725f5434      	clr	_CAN_PC
3489                     ; 246 	CAN_DGR |= 0x10;			//3rd_Tx_Mailboxes_Enable
3491  0215 72185426      	bset	_CAN_DGR,#4
3492                     ; 248 	CAN_MCR &= 0xFE;			//Leave_the_Init_Mode, that_is_switch_into_Normal_Mode
3494  0219 72115420      	bres	_CAN_MCR,#0
3495                     ; 249 	return;
3498  021d 81            	ret
3522                     ; 253 void CAN_Disable(void)
3522                     ; 254 {
3523                     	switch	.text
3524  021e               _CAN_Disable:
3528                     ; 255 	CAN_MCR |= 0B00000010; 		//CAN_Sleep_Reqeust
3530  021e 72125420      	bset	_CAN_MCR,#1
3531                     ; 256 	return;
3534  0222 81            	ret
3569                     ; 260 void CAN_Transmit_Cancel(void)
3569                     ; 261 {
3570                     	switch	.text
3571  0223               _CAN_Transmit_Cancel:
3573  0223 88            	push	a
3574       00000001      OFST:	set	1
3577                     ; 264 	Buffer = CAN_FPSR;
3579  0224 c65427        	ld	a,_CAN_FPSR
3580  0227 6b01          	ld	(OFST+0,sp),a
3582                     ; 266 	CAN_FPSR = 0x00; 			//Tx_Mailbox_0_Select
3584  0229 725f5427      	clr	_CAN_FPSR
3585                     ; 267 	CAN_P0 |= 0x02;			//Make_Abort_Request
3587  022d 72125428      	bset	_CAN_P0,#1
3588                     ; 269 	CAN_FPSR = 0x01;			//Tx_Mailbox_1_Select
3590  0231 35015427      	mov	_CAN_FPSR,#1
3591                     ; 270 	CAN_P0 |= 0x02;			//Make_Abort_Request
3593  0235 72125428      	bset	_CAN_P0,#1
3594                     ; 272 	CAN_FPSR = 0x05;			//Tx_Mailbox_2_Select
3596  0239 35055427      	mov	_CAN_FPSR,#5
3597                     ; 273 	CAN_P0 |= 0x02;			//Make_Abort_Request
3599  023d 72125428      	bset	_CAN_P0,#1
3600                     ; 275 	CAN_FPSR = Buffer;
3602  0241 7b01          	ld	a,(OFST+0,sp)
3603  0243 c75427        	ld	_CAN_FPSR,a
3604                     ; 276 	return;
3607  0246 84            	pop	a
3608  0247 81            	ret
3642                     ; 280 void CAN_Wait_Tx_Message(void)
3642                     ; 281 {
3643                     	switch	.text
3644  0248               _CAN_Wait_Tx_Message:
3646  0248 89            	pushw	x
3647       00000002      OFST:	set	2
3650                     ; 282 	U16 Time = 0;
3652  0249 5f            	clrw	x
3653  024a 1f01          	ldw	(OFST-1,sp),x
3656  024c 200e          	jra	L3612
3657  024e               L7512:
3658                     ; 286 		if(++Time > 2000){ break; }	//2ms/8MHz_Clock_Timeout
3660  024e 1e01          	ldw	x,(OFST-1,sp)
3661  0250 1c0001        	addw	x,#1
3662  0253 1f01          	ldw	(OFST-1,sp),x
3664  0255 a307d1        	cpw	x,#2001
3665  0258 2502          	jrult	L3612
3667  025a               L5612:
3668                     ; 288 	return;
3671  025a 85            	popw	x
3672  025b 81            	ret
3673  025c               L3612:
3674                     ; 285 	while((CAN_TPR & 0x1C) != 0x1C){	//All_Mailbox_Empty?
3676  025c c65423        	ld	a,_CAN_TPR
3677  025f a41c          	and	a,#28
3678  0261 a11c          	cp	a,#28
3679  0263 26e9          	jrne	L7512
3680  0265 20f3          	jra	L5612
3693                     	xdef	_CAN_Wait_Tx_Message
3694                     	xdef	_CAN_Transmit_Cancel
3695                     	xdef	_CAN_Disable
3696                     	xdef	_CAN_Enable
3697                     	xdef	_CAN_Interrupt_Enable
3698                     	xdef	_CAN_Interrupt_Disable
3699                     	xdef	_TIMER_3_Enable
3700                     	xdef	_ADC_10BIT_Read
3701                     	xdef	_ADC_Enable
3702                     	xdef	_Windows_Watchdog_Clear
3703                     	xdef	_EnableInterrupts
3704                     	xdef	_DisableInterrupts
3705                     	xdef	_CPU_Clock_Initialize
3724                     	end

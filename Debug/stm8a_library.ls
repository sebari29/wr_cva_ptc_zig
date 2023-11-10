   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2689                     ; 10 void CPU_Clock_Initialize(void)
2689                     ; 11 {
2691                     	switch	.text
2692  0000               _CPU_Clock_Initialize:
2696                     ; 13 	if(CLK_CMSR != 0xB4){
2698  0000 c650c3        	ld	a,_CLK_CMSR
2699  0003 a1b4          	cp	a,#180
2700  0005 2722          	jreq	L1271
2701                     ; 14 		CLK_SWCR = 0B00000000;	//Clock Switch Disable, Switch Interrupt Disable
2703  0007 725f50c5      	clr	_CLK_SWCR
2704                     ; 15 		CLK_SWR = 0xB4;		//High Speed External Clock, HSI(0xE1), LSI(0xD2)
2706  000b 35b450c4      	mov	_CLK_SWR,#180
2708  000f               L7271:
2709                     ; 16 		while(!(CLK_SWCR & 0x08));	//SWIF
2711  000f c650c5        	ld	a,_CLK_SWCR
2712  0012 a508          	bcp	a,#8
2713  0014 27f9          	jreq	L7271
2714                     ; 17 		CLK_SWCR &= 0B11110111;	//Clear Switch Event
2716  0016 721750c5      	bres	_CLK_SWCR,#3
2717                     ; 18 		CLK_SWCR |= 0x02;		//by KMSHIM, clear
2719  001a 721250c5      	bset	_CLK_SWCR,#1
2721  001e               L5371:
2722                     ; 19 		while(CLK_SWCR & 0x01);    	//poll SWBSY
2724  001e c650c5        	ld	a,_CLK_SWCR
2725  0021 a501          	bcp	a,#1
2726  0023 26f9          	jrne	L5371
2727                     ; 20 		CLK_CKDIVR = 0x00; 	//xxxIIEEE : Fmaster = HSE / 1 = 8Mhz / 1, Fcpu = 8Mhz
2729  0025 725f50c6      	clr	_CLK_CKDIVR
2730  0029               L1271:
2731                     ; 23 	CLK_PCKENR1 = 0B01000000;		//TIM1 OFF, TIM3 ON, TIM2 OFF, TIM4 OFF, LINUART ON, USART OFF, SPI OFF, I2C OFF
2733  0029 354050c7      	mov	_CLK_PCKENR1,#64
2734                     ; 24 	CLK_PCKENR2 = 0B10000000;		//CAN OFF, ADC OFF, AWU OFF
2736  002d 358050ca      	mov	_CLK_PCKENR2,#128
2737                     ; 26 	return;
2740  0031 81            	ret
2764                     ; 30 void DisableInterrupts(void)
2764                     ; 31 {
2765                     	switch	.text
2766  0032               _DisableInterrupts:
2770                     ; 32 	_asm("sim");			//Disable Global Interrupt
2773  0032 9b            sim
2775                     ; 33 	return;
2778  0033 81            	ret
2802                     ; 37 void EnableInterrupts(void)
2802                     ; 38 {
2803                     	switch	.text
2804  0034               _EnableInterrupts:
2808                     ; 39 	_asm("rim");			//Enable Global Interrupt
2811  0034 9a            rim
2813                     ; 40 	return;
2816  0035 81            	ret
2842                     ; 44 void Windows_Watchdog_Clear(void)
2842                     ; 45 {
2843                     	switch	.text
2844  0036               _Windows_Watchdog_Clear:
2848                     ; 46 	WWDG_WR = 0x7F;			//Limit Counter Value = (8Mhz / 12288) x 63 = 96.768ms
2850  0036 357f50d2      	mov	_WWDG_WR,#127
2851                     ; 47 	WWDG_CR = 0xFF;			//96.768ms, Between 0 and WATCHDOG_LIMIT, if 100ms*(8Mhz/12288) = 33
2853  003a 35ff50d1      	mov	_WWDG_CR,#255
2854                     ; 48 	return;
2857  003e 81            	ret
2884                     ; 52 void ADC_Enable(void)
2884                     ; 53 {
2885                     	switch	.text
2886  003f               _ADC_Enable:
2890                     ; 54 	ADC_CR1	= 0B01000000;		//Sampleing clock = 8Mhz(Fmaster) / 8 = 1MHz, Single Mode, ADC Disable
2892  003f 35405401      	mov	_ADC_CR1,#64
2893                     ; 55 	ADC_CR2	= 0B00000000;		//External Trigger Disable, Left Alignment, Scan Disable
2895  0043 725f5402      	clr	_ADC_CR2
2896                     ; 56 	ADC_CR3	= 0B00000000;		//Buffer Disable
2898  0047 725f5403      	clr	_ADC_CR3
2899                     ; 57 	ADC_CSR	= 0B00000000;		//EOC Clear, AWD Clera, AWD Interrut Disable, EOC Interrupt Disable, Channel 0;
2901  004b 725f5400      	clr	_ADC_CSR
2902                     ; 58 	ADC_CR1 |= 0x01;			//ADC Conversion Start
2904  004f 72105401      	bset	_ADC_CR1,#0
2905                     ; 59 	return;
2908  0053 81            	ret
2951                     ; 63 unsigned int ADC_10BIT_Read(unsigned char Channel)
2951                     ; 64 {
2952                     	switch	.text
2953  0054               _ADC_10BIT_Read:
2955  0054 89            	pushw	x
2956       00000002      OFST:	set	2
2959                     ; 67 	ADC_CSR = Channel; 		//Select ADC Channel
2961  0055 c75400        	ld	_ADC_CSR,a
2962                     ; 68 	ADC_CR1 |= 0x01;			//ADC Conversion Start
2964  0058 72105401      	bset	_ADC_CR1,#0
2966  005c               L1202:
2967                     ; 69 	while((ADC_CSR & 0x80) == 0);	//Conversion Completed?
2969  005c c65400        	ld	a,_ADC_CSR
2970  005f a580          	bcp	a,#128
2971  0061 27f9          	jreq	L1202
2972                     ; 70 	Buffer = ADC_DRH;			//ADC Data[9:2]
2974  0063 c65404        	ld	a,_ADC_DRH
2975  0066 5f            	clrw	x
2976  0067 97            	ld	xl,a
2977  0068 1f01          	ldw	(OFST-1,sp),x
2978                     ; 71 	Buffer = (Buffer << 2) | ADC_DRL;	//ADC Data[1:0]
2980  006a 1e01          	ldw	x,(OFST-1,sp)
2981  006c 58            	sllw	x
2982  006d 58            	sllw	x
2983  006e 01            	rrwa	x,a
2984  006f ca5405        	or	a,_ADC_DRL
2985  0072 02            	rlwa	x,a
2986  0073 1f01          	ldw	(OFST-1,sp),x
2987  0075 01            	rrwa	x,a
2988                     ; 72 	return(Buffer);			//10Bit ADC Return
2990  0076 1e01          	ldw	x,(OFST-1,sp)
2993  0078 5b02          	addw	sp,#2
2994  007a 81            	ret
3023                     ; 76 void TIMER_3_Enable(void)			//10ms Timer Interrupt
3023                     ; 77 {
3024                     	switch	.text
3025  007b               _TIMER_3_Enable:
3029                     ; 85 	TIM3_CR1 = 0B10000101;		//Auto Reload Enable, overflow interrut, counter enable
3031  007b 35855320      	mov	_TIM3_CR1,#133
3032                     ; 86 	TIM3_PSCR = 0x07;			//Prescaler = Fcpu / 2 ^ 3 = 8M/8 = 1M
3034  007f 3507532a      	mov	_TIM3_PSCR,#7
3035                     ; 87 	TIM3_ARRH = 0x02;			//ARR = 9999, 10000/1M = 0.01s = 10ms
3037  0083 3502532b      	mov	_TIM3_ARRH,#2
3038                     ; 88 	TIM3_ARRL = 0x70;
3040  0087 3570532c      	mov	_TIM3_ARRL,#112
3041                     ; 89 	TIM3_SR1 = 0x00;			//Pending Flag Clear
3043  008b 725f5322      	clr	_TIM3_SR1
3044                     ; 90 	TIM3_IER = 0B00000001; 		//Overflow interrupt Enable
3046  008f 35015321      	mov	_TIM3_IER,#1
3047                     ; 92 	return;
3050  0093 81            	ret
3086                     ; 96 void CAN_Interrupt_Disable(void)		//CAN_Interrupt_All_Disable
3086                     ; 97 {
3087                     	switch	.text
3088  0094               _CAN_Interrupt_Disable:
3090  0094 88            	push	a
3091       00000001      OFST:	set	1
3094                     ; 100 	Buffer = CAN_FPSR;			//Current_Page_Save
3096  0095 c65427        	ld	a,_CAN_FPSR
3097  0098 6b01          	ld	(OFST+0,sp),a
3098                     ; 101 	CAN_IER = 0x00;
3100  009a 725f5425      	clr	_CAN_IER
3101                     ; 102 	CAN_FPSR = 0x06;
3103  009e 35065427      	mov	_CAN_FPSR,#6
3104                     ; 103 	CAN_P1 = 0x00;
3106  00a2 725f5429      	clr	_CAN_P1
3107                     ; 104 	CAN_FPSR = Buffer;
3109  00a6 7b01          	ld	a,(OFST+0,sp)
3110  00a8 c75427        	ld	_CAN_FPSR,a
3111                     ; 105 	return;
3114  00ab 84            	pop	a
3115  00ac 81            	ret
3151                     ; 109 void CAN_Interrupt_Enable(void)		//CAN_Interrupt_All_Enable
3151                     ; 110 {
3152                     	switch	.text
3153  00ad               _CAN_Interrupt_Enable:
3155  00ad 88            	push	a
3156       00000001      OFST:	set	1
3159                     ; 113 	Buffer = CAN_FPSR;
3161  00ae c65427        	ld	a,_CAN_FPSR
3162  00b1 6b01          	ld	(OFST+0,sp),a
3163                     ; 114 	CAN_IER = 0x0F;			//Wakeup = OFF, Overrun, FIFO Full, Message_Pending, Tx_Mail Box Empty Interrupt Enable
3165  00b3 350f5425      	mov	_CAN_IER,#15
3166                     ; 115 	CAN_FPSR = 0x06;			//Configuration/Diagnostic_Page_Select
3168  00b7 35065427      	mov	_CAN_FPSR,#6
3169                     ; 116 	CAN_P1 = 0x84;			//Interrupt Enable = BUS OFF = ON, Last Error Code = OFF, Error Passive = OFF, Error Wareing = OFF
3171  00bb 35845429      	mov	_CAN_P1,#132
3172                     ; 117 	CAN_FPSR = Buffer;
3174  00bf 7b01          	ld	a,(OFST+0,sp)
3175  00c1 c75427        	ld	_CAN_FPSR,a
3176                     ; 118 	return;
3179  00c4 84            	pop	a
3180  00c5 81            	ret
3225                     ; 122 void CAN_Enable(void)			//CAN_Initialize
3225                     ; 123 {
3226                     	switch	.text
3227  00c6               _CAN_Enable:
3231                     ; 125 	CAN_MCR &= 0B11111101;		//leave Sleep Mode = CPU Reset Defualt : Sleep
3233  00c6 72135420      	bres	_CAN_MCR,#1
3235  00ca               L7702:
3236                     ; 126 	while(CAN_MSR & 0x02);		//beCAN is in Sleep Mode
3238  00ca c65421        	ld	a,_CAN_MSR
3239  00cd a502          	bcp	a,#2
3240  00cf 26f9          	jrne	L7702
3241                     ; 129 	CAN_FPSR = 0x00;			//PSR(Page Select Register) : Tx_Mailbox_0_Page_Select
3243  00d1 725f5427      	clr	_CAN_FPSR
3244                     ; 130 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3246  00d5 72125428      	bset	_CAN_P0,#1
3247                     ; 132 	CAN_FPSR = 0x01;			//PSR(Page Select Register) : Tx_Mailbox_1_Page_Select
3249  00d9 35015427      	mov	_CAN_FPSR,#1
3250                     ; 133 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3252  00dd 72125428      	bset	_CAN_P0,#1
3253                     ; 135 	CAN_FPSR = 0x05;  			//PSR(Page Select Register) : Tx_Mailbox_2_Page_Select
3255  00e1 35055427      	mov	_CAN_FPSR,#5
3256                     ; 136 	CAN_P0 |= 0x02;			//MCSR_Register, Tx_Mailbox_0_Rrasmission_Request_Abort
3258  00e5 72125428      	bset	_CAN_P0,#1
3259                     ; 138 	CAN_MCR |= 0x01;			//MCR(Master Control Register) : Request_Initialisation
3261  00e9 72105420      	bset	_CAN_MCR,#0
3263  00ed               L5012:
3264                     ; 139 	while((CAN_MSR & 0x01) == 0);	//MSR(Master Select Regitser) : Wait_until_Acknowledged
3266  00ed c65421        	ld	a,_CAN_MSR
3267  00f0 a501          	bcp	a,#1
3268  00f2 27f9          	jreq	L5012
3269                     ; 141 	CAN_TSR |= 0B00000111;		//Clear_Request_Completed_for_Mailbox_[0:1:2]
3271  00f4 c65422        	ld	a,_CAN_TSR
3272  00f7 aa07          	or	a,#7
3273  00f9 c75422        	ld	_CAN_TSR,a
3275  00fc 2004          	jra	L3112
3276  00fe               L1112:
3277                     ; 144 	while(CAN_RFR & 0x03){ CAN_RFR = 0x20; }
3279  00fe 35205424      	mov	_CAN_RFR,#32
3280  0102               L3112:
3283  0102 c65424        	ld	a,_CAN_RFR
3284  0105 a503          	bcp	a,#3
3285  0107 26f5          	jrne	L1112
3286                     ; 146 	CAN_RFR |= 0x10;			//Clear_the_FIFO_Overrun(FOVR)_Bit
3288  0109 72185424      	bset	_CAN_RFR,#4
3289                     ; 147 	CAN_MSR = 0x08;  			//Clear_Wake_up_Pending_Interrupt
3291  010d 35085421      	mov	_CAN_MSR,#8
3292                     ; 148 	CAN_MCR |= 0x44;  			//Automatic_Bus_Off_Management, Tx_Priority_Driven by Request_Order
3294  0111 c65420        	ld	a,_CAN_MCR
3295  0114 aa44          	or	a,#68
3296  0116 c75420        	ld	_CAN_MCR,a
3297                     ; 151 	CAN_FPSR = 0x06;  			//Configuration / Diagnostic_Page_Select
3299  0119 35065427      	mov	_CAN_FPSR,#6
3300                     ; 152 	CAN_PA = 0x00;			//FCR1(Filter Configuration Register 1), Disable Filter 0 and Filter 1
3302  011d 725f5432      	clr	_CAN_PA
3303                     ; 153 	CAN_PB = 0x00;			//FCR2(Filter Configuration Register 2), Disable Filter 2 and Filter 3
3305  0121 725f5433      	clr	_CAN_PB
3306                     ; 154 	CAN_PC = 0x00;			//FCR3(Filter Configuration Register 3), Disable Filter 4 and Filter 5
3308  0125 725f5434      	clr	_CAN_PC
3309                     ; 157 	CAN_P4 = 0B00000001;		//SJW[7:6] = 1, BRP[5:0] = 2
3311  0129 3501542c      	mov	_CAN_P4,#1
3312                     ; 158 	CAN_P5 = 0B00010100;		//CAN Clock Source = Fcpu(8Mhz), BS2[6:4] = 2, BS1[3:0] = 5
3314  012d 3514542d      	mov	_CAN_P5,#20
3315                     ; 161 	CAN_P8 = 0B11111111;		//FMR1(Filter Mode Register 1) = Bank_3~0 : List_Mode
3317  0131 35ff5430      	mov	_CAN_P8,#255
3318                     ; 162 	CAN_P9 = 0B00001111;		//FMR2(Filter Mode Register 2) = Bank_5~4 : List_Mode
3320  0135 350f5431      	mov	_CAN_P9,#15
3321                     ; 165 	CAN_FPSR = 0x02;
3323  0139 35025427      	mov	_CAN_FPSR,#2
3324                     ; 167 	CAN_P0 	= (U8)((CAN_HTR_STATUS1_ID & 0x7F8) >> 3);	//Rx_Filter_0
3326  013d 35405428      	mov	_CAN_P0,#64
3327                     ; 168 	CAN_P1 	= (U8)((CAN_HTR_STATUS1_ID & 0x007) << 5);
3329  0141 35205429      	mov	_CAN_P1,#32
3330                     ; 169 	CAN_P2 	= (U8)((CAN_HTR_STATUS2_ID & 0x7F8) >> 3);	//Rx_Filter_1
3332  0145 3540542a      	mov	_CAN_P2,#64
3333                     ; 170 	CAN_P3 	= (U8)((CAN_HTR_STATUS2_ID & 0x007) << 5);
3335  0149 3540542b      	mov	_CAN_P3,#64
3336                     ; 171 	CAN_P4 	= (U8)((CAN_HTR_STATUS3_ID & 0x7F8) >> 3);	//Rx_Filter_2
3338  014d 3540542c      	mov	_CAN_P4,#64
3339                     ; 172 	CAN_P5 	= (U8)((CAN_HTR_STATUS3_ID & 0x007) << 5);
3341  0151 3560542d      	mov	_CAN_P5,#96
3342                     ; 173 	CAN_P6 	= (U8)((CAN_HTR_STATUS4_ID & 0x7F8) >> 3);	//Rx_Filter_3
3344  0155 3540542e      	mov	_CAN_P6,#64
3345                     ; 174 	CAN_P7 	= (U8)((CAN_HTR_STATUS4_ID & 0x007) << 5);
3347  0159 3580542f      	mov	_CAN_P7,#128
3348                     ; 177 	CAN_P8 	= (U8)(0x00);	//Rx_Filter_5
3350  015d 725f5430      	clr	_CAN_P8
3351                     ; 178 	CAN_P9 	= (U8)(0x00);
3353  0161 725f5431      	clr	_CAN_P9
3354                     ; 179 	CAN_PA 	= (U8)(0x00);	//Rx_Filter_7
3356  0165 725f5432      	clr	_CAN_PA
3357                     ; 180 	CAN_PB 	= (U8)(0x00);
3359  0169 725f5433      	clr	_CAN_PB
3360                     ; 181 	CAN_PC 	= (U8)(0x00);	//Rx_Filter_8
3362  016d 725f5434      	clr	_CAN_PC
3363                     ; 182 	CAN_PD 	= (U8)(0x00);
3365  0171 725f5435      	clr	_CAN_PD
3366                     ; 183 	CAN_PE 	= (U8)(0x00);	//Rx_Filter_9
3368  0175 725f5436      	clr	_CAN_PE
3369                     ; 184 	CAN_PF 	= (U8)(0x00);
3371  0179 725f5437      	clr	_CAN_PF
3372                     ; 187 	CAN_FPSR = 0x03;
3374  017d 35035427      	mov	_CAN_FPSR,#3
3375                     ; 189 	CAN_P0 	= (U8)(0x00);
3377  0181 725f5428      	clr	_CAN_P0
3378                     ; 190 	CAN_P1 	= (U8)(0x00);
3380  0185 725f5429      	clr	_CAN_P1
3381                     ; 191 	CAN_P2 	= (U8)(0x00);
3383  0189 725f542a      	clr	_CAN_P2
3384                     ; 192 	CAN_P3 	= (U8)(0x00);
3386  018d 725f542b      	clr	_CAN_P3
3387                     ; 193 	CAN_P4 	= (U8)(0x00);
3389  0191 725f542c      	clr	_CAN_P4
3390                     ; 194 	CAN_P5 	= (U8)(0x00);
3392  0195 725f542d      	clr	_CAN_P5
3393                     ; 195 	CAN_P6 	= (U8)(0x00);
3395  0199 725f542e      	clr	_CAN_P6
3396                     ; 196 	CAN_P7 	= (U8)(0x00);
3398  019d 725f542f      	clr	_CAN_P7
3399                     ; 198 	CAN_P8 	= (U8)(0x00);
3401  01a1 725f5430      	clr	_CAN_P8
3402                     ; 199 	CAN_P9 	= (U8)(0x00);
3404  01a5 725f5431      	clr	_CAN_P9
3405                     ; 200 	CAN_PA 	= (U8)(0x00);
3407  01a9 725f5432      	clr	_CAN_PA
3408                     ; 201 	CAN_PB 	= (U8)(0x00);
3410  01ad 725f5433      	clr	_CAN_PB
3411                     ; 202 	CAN_PC	= (U8)(0x00);
3413  01b1 725f5434      	clr	_CAN_PC
3414                     ; 203 	CAN_PD 	= (U8)(0x00);
3416  01b5 725f5435      	clr	_CAN_PD
3417                     ; 204 	CAN_PE 	= (U8)(0x00);
3419  01b9 725f5436      	clr	_CAN_PE
3420                     ; 205 	CAN_PF 	= (U8)(0x00);
3422  01bd 725f5437      	clr	_CAN_PF
3423                     ; 207 	CAN_FPSR = 0x04; 			//Filter_Bank_4,5 Page_Select
3425  01c1 35045427      	mov	_CAN_FPSR,#4
3426                     ; 209 	CAN_P0 	= (U8)(0x00);
3428  01c5 725f5428      	clr	_CAN_P0
3429                     ; 210 	CAN_P1 	= (U8)(0x00);
3431  01c9 725f5429      	clr	_CAN_P1
3432                     ; 211 	CAN_P2 	= (U8)(0x00);
3434  01cd 725f542a      	clr	_CAN_P2
3435                     ; 212 	CAN_P3 	= (U8)(0x00);
3437  01d1 725f542b      	clr	_CAN_P3
3438                     ; 213 	CAN_P4 	= (U8)(0x00);
3440  01d5 725f542c      	clr	_CAN_P4
3441                     ; 214 	CAN_P5 	= (U8)(0x00);
3443  01d9 725f542d      	clr	_CAN_P5
3444                     ; 215 	CAN_P6 	= (U8)(0x00);
3446  01dd 725f542e      	clr	_CAN_P6
3447                     ; 216 	CAN_P7 	= (U8)(0x00);
3449  01e1 725f542f      	clr	_CAN_P7
3450                     ; 218 	CAN_P8 	= (U8)(0x00);
3452  01e5 725f5430      	clr	_CAN_P8
3453                     ; 219 	CAN_P9 	= (U8)(0x00);
3455  01e9 725f5431      	clr	_CAN_P9
3456                     ; 220 	CAN_PA 	= (U8)(0x00);
3458  01ed 725f5432      	clr	_CAN_PA
3459                     ; 221 	CAN_PB 	= (U8)(0x00);
3461  01f1 725f5433      	clr	_CAN_PB
3462                     ; 222 	CAN_PC 	= (U8)(0x00);
3464  01f5 725f5434      	clr	_CAN_PC
3465                     ; 223 	CAN_PD 	= (U8)(0x00);
3467  01f9 725f5435      	clr	_CAN_PD
3468                     ; 224 	CAN_PE 	= (U8)(0x00);
3470  01fd 725f5436      	clr	_CAN_PE
3471                     ; 225 	CAN_PF 	= (U8)(0x00);
3473  0201 725f5437      	clr	_CAN_PF
3474                     ; 228 	CAN_FPSR = 0x06;
3476  0205 35065427      	mov	_CAN_FPSR,#6
3477                     ; 238 	CAN_PA = 0x55;			//Bank_1_&_0_Filter_Enable
3479  0209 35555432      	mov	_CAN_PA,#85
3480                     ; 241 	CAN_PB = 0x55;			//Filter_Disable
3482  020d 35555433      	mov	_CAN_PB,#85
3483                     ; 244 	CAN_PC = 0x00;			//Filter_Disable
3485  0211 725f5434      	clr	_CAN_PC
3486                     ; 246 	CAN_DGR |= 0x10;			//3rd_Tx_Mailboxes_Enable
3488  0215 72185426      	bset	_CAN_DGR,#4
3489                     ; 248 	CAN_MCR &= 0xFE;			//Leave_the_Init_Mode, that_is_switch_into_Normal_Mode
3491  0219 72115420      	bres	_CAN_MCR,#0
3492                     ; 249 	return;
3495  021d 81            	ret
3519                     ; 253 void CAN_Disable(void)
3519                     ; 254 {
3520                     	switch	.text
3521  021e               _CAN_Disable:
3525                     ; 255 	CAN_MCR |= 0B00000010; 		//CAN_Sleep_Reqeust
3527  021e 72125420      	bset	_CAN_MCR,#1
3528                     ; 256 	return;
3531  0222 81            	ret
3566                     ; 260 void CAN_Transmit_Cancel(void)
3566                     ; 261 {
3567                     	switch	.text
3568  0223               _CAN_Transmit_Cancel:
3570  0223 88            	push	a
3571       00000001      OFST:	set	1
3574                     ; 264 	Buffer = CAN_FPSR;
3576  0224 c65427        	ld	a,_CAN_FPSR
3577  0227 6b01          	ld	(OFST+0,sp),a
3578                     ; 266 	CAN_FPSR = 0x00; 			//Tx_Mailbox_0_Select
3580  0229 725f5427      	clr	_CAN_FPSR
3581                     ; 267 	CAN_P0 |= 0x02;			//Make_Abort_Request
3583  022d 72125428      	bset	_CAN_P0,#1
3584                     ; 269 	CAN_FPSR = 0x01;			//Tx_Mailbox_1_Select
3586  0231 35015427      	mov	_CAN_FPSR,#1
3587                     ; 270 	CAN_P0 |= 0x02;			//Make_Abort_Request
3589  0235 72125428      	bset	_CAN_P0,#1
3590                     ; 272 	CAN_FPSR = 0x05;			//Tx_Mailbox_2_Select
3592  0239 35055427      	mov	_CAN_FPSR,#5
3593                     ; 273 	CAN_P0 |= 0x02;			//Make_Abort_Request
3595  023d 72125428      	bset	_CAN_P0,#1
3596                     ; 275 	CAN_FPSR = Buffer;
3598  0241 7b01          	ld	a,(OFST+0,sp)
3599  0243 c75427        	ld	_CAN_FPSR,a
3600                     ; 276 	return;
3603  0246 84            	pop	a
3604  0247 81            	ret
3638                     ; 280 void CAN_Wait_Tx_Message(void)
3638                     ; 281 {
3639                     	switch	.text
3640  0248               _CAN_Wait_Tx_Message:
3642  0248 89            	pushw	x
3643       00000002      OFST:	set	2
3646                     ; 282 	U16 Time = 0;
3648  0249 5f            	clrw	x
3649  024a 1f01          	ldw	(OFST-1,sp),x
3651  024c 200e          	jra	L3612
3652  024e               L7512:
3653                     ; 286 		if(++Time > 2000){ break; }	//2ms/8MHz_Clock_Timeout
3655  024e 1e01          	ldw	x,(OFST-1,sp)
3656  0250 1c0001        	addw	x,#1
3657  0253 1f01          	ldw	(OFST-1,sp),x
3658  0255 a307d1        	cpw	x,#2001
3659  0258 2502          	jrult	L3612
3661  025a               L5612:
3662                     ; 288 	return;
3665  025a 85            	popw	x
3666  025b 81            	ret
3667  025c               L3612:
3668                     ; 285 	while((CAN_TPR & 0x1C) != 0x1C){	//All_Mailbox_Empty?
3670  025c c65423        	ld	a,_CAN_TPR
3671  025f a41c          	and	a,#28
3672  0261 a11c          	cp	a,#28
3673  0263 26e9          	jrne	L7512
3674  0265 20f3          	jra	L5612
3687                     	xdef	_CAN_Wait_Tx_Message
3688                     	xdef	_CAN_Transmit_Cancel
3689                     	xdef	_CAN_Disable
3690                     	xdef	_CAN_Enable
3691                     	xdef	_CAN_Interrupt_Enable
3692                     	xdef	_CAN_Interrupt_Disable
3693                     	xdef	_TIMER_3_Enable
3694                     	xdef	_ADC_10BIT_Read
3695                     	xdef	_ADC_Enable
3696                     	xdef	_Windows_Watchdog_Clear
3697                     	xdef	_EnableInterrupts
3698                     	xdef	_DisableInterrupts
3699                     	xdef	_CPU_Clock_Initialize
3718                     	end

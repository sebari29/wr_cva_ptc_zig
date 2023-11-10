   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _Lin_ID:
2660  0000 00            	dc.b	0
2661  0001               _Lin_RX_ID:
2662  0001 00            	dc.b	0
2663  0002               _Lin_TX_ID:
2664  0002 00            	dc.b	0
2665  0003               _Lin_Tx_Data:
2666  0003 00            	dc.b	0
2667  0004 00            	dc.b	0
2668  0005 00            	dc.b	0
2669  0006 00            	dc.b	0
2670  0007 00            	dc.b	0
2671  0008 00            	dc.b	0
2672  0009 00            	dc.b	0
2673  000a 00            	dc.b	0
2674  000b 00            	dc.b	0
2675  000c               _PTC_LINEVC_R_01:
2676  000c 00            	dc.b	0
2677  000d 00            	dc.b	0
2678  000e 00            	dc.b	0
2679  000f 00            	dc.b	0
2680  0010 00            	dc.b	0
2681  0011 00            	dc.b	0
2682  0012 00            	dc.b	0
2683  0013 00            	dc.b	0
2684  0014 00            	dc.b	0
2685  0015               _PTC_Tx_Data:
2686  0015 00            	dc.b	0
2687  0016 00            	dc.b	0
2688  0017 00            	dc.b	0
2689  0018 00            	dc.b	0
2690  0019 00            	dc.b	0
2691  001a 00            	dc.b	0
2692  001b 00            	dc.b	0
2693  001c 00            	dc.b	0
2694  001d 00            	dc.b	0
2695  001e               _Lin_Data_Cnt:
2696  001e 00            	dc.b	0
2697  001f               _Lin_Error_Cnt:
2698  001f 0000          	dc.w	0
2699  0021               _Lin_tx_offet:
2700  0021 00            	dc.b	0
2701  0022               _Recieve_Cnt:
2702  0022 00            	dc.b	0
2703  0023               _FIAT_Recieve_Cnt:
2704  0023 00            	dc.b	0
2705  0024               _Lin_Rx_Cnt:
2706  0024 00            	dc.b	0
2736                     ; 48 void LIN_Rx_Enalbe(void)
2736                     ; 49 {
2737                     	switch	.text
2738  0000               f_LIN_Rx_Enalbe:
2742                     ; 50 	LINUART_CR2 |= 0x20;	//Receiver Enalbe
2744  0000 721a5245      	bset	_LINUART_CR2,#5
2745                     ; 51 	return ;
2748  0004 87            	retf	
2771                     ; 54 void LIN_Rx_Disable(void)
2771                     ; 55 {
2772                     	switch	.text
2773  0005               f_LIN_Rx_Disable:
2777                     ; 56 	LINUART_CR2 &= 0xDF;	//Receiver Disable
2779  0005 721b5245      	bres	_LINUART_CR2,#5
2780                     ; 57 	return ;
2783  0009 87            	retf	
2807                     ; 61 void LIN_Generate_Break_Field(void)
2807                     ; 62 {
2808                     	switch	.text
2809  000a               f_LIN_Generate_Break_Field:
2813                     ; 63 	LINUART_CR2 |= 0B00000001;			//Request_Break_&_Delimiter
2815  000a 72105245      	bset	_LINUART_CR2,#0
2816                     ; 64 	return;
2819  000e 87            	retf	
2852                     ; 69 unsigned char LIN_Measure_PID_Parity(unsigned char PID)
2852                     ; 70 {
2853                     	switch	.text
2854  000f               f_LIN_Measure_PID_Parity:
2856       00000001      OFST:	set	1
2859                     ; 72 	PID_Parity_Register = PID;
2861  000f c70009        	ld	_PID_Parity_Register,a
2862  0012 88            	push	a
2863                     ; 75 	PARITY_0 = PID_BIT0;
2865                     	btst	_PID_Parity_Register,#0
2866  0018 901d0009      	bccm	_PID_Parity_Register,#6
2867                     ; 76 	PARITY_0 ^= PID_BIT1;
2869  001c c60009        	ld	a,_PID_Parity_Register
2870  001f a402          	and	a,#2
2871  0021 44            	srl	a
2872  0022 6b01          	ld	(OFST+0,sp),a
2873  0024 4f            	clr	a
2874                     	btst	_PID_Parity_Register,#6
2875  002a 49            	rlc	a
2876  002b 1801          	xor	a,(OFST+0,sp)
2877  002d 44            	srl	a
2878  002e 901d0009      	bccm	_PID_Parity_Register,#6
2879                     ; 77 	PARITY_0 ^= PID_BIT2;
2881  0032 4f            	clr	a
2882                     	btst	_PID_Parity_Register,#2
2883  0038 49            	rlc	a
2884  0039 6b01          	ld	(OFST+0,sp),a
2885  003b 4f            	clr	a
2886                     	btst	_PID_Parity_Register,#6
2887  0041 49            	rlc	a
2888  0042 1801          	xor	a,(OFST+0,sp)
2889  0044 44            	srl	a
2890  0045 901d0009      	bccm	_PID_Parity_Register,#6
2891                     ; 78 	PARITY_0 ^= PID_BIT4;
2893  0049 4f            	clr	a
2894                     	btst	_PID_Parity_Register,#4
2895  004f 49            	rlc	a
2896  0050 6b01          	ld	(OFST+0,sp),a
2897  0052 4f            	clr	a
2898                     	btst	_PID_Parity_Register,#6
2899  0058 49            	rlc	a
2900  0059 1801          	xor	a,(OFST+0,sp)
2901  005b 44            	srl	a
2902  005c 901d0009      	bccm	_PID_Parity_Register,#6
2903                     ; 81 	PARITY_1 = PID_BIT1;
2905                     	btst	_PID_Parity_Register,#1
2906  0065 901f0009      	bccm	_PID_Parity_Register,#7
2907                     ; 82 	PARITY_1 ^= PID_BIT3;
2909  0069 4f            	clr	a
2910                     	btst	_PID_Parity_Register,#3
2911  006f 49            	rlc	a
2912  0070 6b01          	ld	(OFST+0,sp),a
2913  0072 4f            	clr	a
2914                     	btst	_PID_Parity_Register,#7
2915  0078 49            	rlc	a
2916  0079 1801          	xor	a,(OFST+0,sp)
2917  007b 44            	srl	a
2918  007c 901f0009      	bccm	_PID_Parity_Register,#7
2919                     ; 83 	PARITY_1 ^= PID_BIT4;
2921  0080 4f            	clr	a
2922                     	btst	_PID_Parity_Register,#4
2923  0086 49            	rlc	a
2924  0087 6b01          	ld	(OFST+0,sp),a
2925  0089 4f            	clr	a
2926                     	btst	_PID_Parity_Register,#7
2927  008f 49            	rlc	a
2928  0090 1801          	xor	a,(OFST+0,sp)
2929  0092 44            	srl	a
2930  0093 901f0009      	bccm	_PID_Parity_Register,#7
2931                     ; 84 	PARITY_1 ^= PID_BIT5;
2933  0097 4f            	clr	a
2934                     	btst	_PID_Parity_Register,#5
2935  009d 49            	rlc	a
2936  009e 6b01          	ld	(OFST+0,sp),a
2937  00a0 4f            	clr	a
2938                     	btst	_PID_Parity_Register,#7
2939  00a6 49            	rlc	a
2940  00a7 1801          	xor	a,(OFST+0,sp)
2941  00a9 44            	srl	a
2942  00aa 901f0009      	bccm	_PID_Parity_Register,#7
2943                     ; 85 	PARITY_1 ^= 1;
2945  00ae 901e0009      	bcpl	_PID_Parity_Register,#7
2946                     ; 87 	return(PID_Parity_Register);
2950  00b2 5b01          	addw	sp,#1
2951  00b4 c60009        	ld	a,_PID_Parity_Register
2952  00b7 87            	retf	
2994                     ; 93 void LIN_Header_Transmission(unsigned char PID)
2994                     ; 94 {
2995                     	switch	.text
2996  00b8               f_LIN_Header_Transmission:
2998  00b8 88            	push	a
2999       00000001      OFST:	set	1
3002                     ; 97 	Identifier = LIN_Measure_PID_Parity(PID);
3004  00b9 8d0f000f      	callf	f_LIN_Measure_PID_Parity
3006  00bd 6b01          	ld	(OFST+0,sp),a
3007                     ; 99 	LIN_Generate_Break_Field();			//LIN_Generate_Break_Field
3009  00bf 8d0a000a      	callf	f_LIN_Generate_Break_Field
3011                     ; 100 	LIN_Transmission_Data(0x55);		//Request_Syncy_Field
3013  00c3 a655          	ld	a,#85
3014  00c5 8dd100d1      	callf	f_LIN_Transmission_Data
3016                     ; 101 	LIN_Transmission_Data(Identifier);		//Protected_Identifier
3018  00c9 7b01          	ld	a,(OFST+0,sp)
3019  00cb 8dd100d1      	callf	f_LIN_Transmission_Data
3021                     ; 103 	return;
3024  00cf 84            	pop	a
3025  00d0 87            	retf	
3059                     ; 109 void LIN_Transmission_Data(unsigned char Data)
3059                     ; 110 {
3060                     	switch	.text
3061  00d1               f_LIN_Transmission_Data:
3065                     ; 112 	LINUART_DR = Data;					//Request_Transmission_Data
3067  00d1 c75241        	ld	_LINUART_DR,a
3069  00d4               L3102:
3070                     ; 113 	while((LINUART_SR & 0x40) == 0);		//Transmission_Complete?
3072  00d4 720d5240fb    	btjf	_LINUART_SR,#6,L3102
3073                     ; 115 	return;
3076  00d9 87            	retf	
3109                     ; 120 void LIN_Transmission_Datas(unsigned char Data)
3109                     ; 121 {
3110                     	switch	.text
3111  00da               f_LIN_Transmission_Datas:
3115                     ; 122 	LINUART_DR = Data;			//Request_Transmission_Data
3117  00da c75241        	ld	_LINUART_DR,a
3118                     ; 123 	return;
3121  00dd 87            	retf	
3191                     ; 128 unsigned char Lin_Measure_Extend_Checksum(unsigned char id, unsigned char *Data)
3191                     ; 129 {
3192                     	switch	.text
3193  00de               f_Lin_Measure_Extend_Checksum:
3195  00de 88            	push	a
3196  00df 5206          	subw	sp,#6
3197       00000006      OFST:	set	6
3200                     ; 131 	unsigned int Check_buff= 0;
3202                     ; 132 	unsigned char Checksum = 0;
3204                     ; 133 	unsigned index = 0;
3206                     ; 135 	if((id&0x3F) == (U8)(0x1C)){ index = 4; }
3208  00e1 a43f          	and	a,#63
3209  00e3 a11c          	cp	a,#28
3210  00e5 2605          	jrne	L3602
3213  00e7 ae0004        	ldw	x,#4
3215  00ea 2003          	jra	L5602
3216  00ec               L3602:
3217                     ; 136 	else{ index = 8; }
3219  00ec ae0008        	ldw	x,#8
3220  00ef               L5602:
3221  00ef 1f01          	ldw	(OFST-5,sp),x
3222                     ; 138 	Checksum = id;
3224  00f1 7b07          	ld	a,(OFST+1,sp)
3225  00f3 6b04          	ld	(OFST-2,sp),a
3226                     ; 140 	for(Offset = 0; Offset < index; Offset++){
3228  00f5 0f03          	clr	(OFST-3,sp)
3230  00f7 2020          	jra	L3702
3231  00f9               L7602:
3232                     ; 142 		Check_buff = Checksum +*(Data + Offset);
3234  00f9 7b0b          	ld	a,(OFST+5,sp)
3235  00fb 97            	ld	xl,a
3236  00fc 7b0c          	ld	a,(OFST+6,sp)
3237  00fe 1b03          	add	a,(OFST-3,sp)
3238  0100 2401          	jrnc	L43
3239  0102 5c            	incw	x
3240  0103               L43:
3241  0103 02            	rlwa	x,a
3242  0104 f6            	ld	a,(x)
3243  0105 5f            	clrw	x
3244  0106 1b04          	add	a,(OFST-2,sp)
3245  0108 59            	rlcw	x
3246  0109 02            	rlwa	x,a
3247  010a 1f05          	ldw	(OFST-1,sp),x
3248                     ; 144 		if(Check_buff > 0xFF){  
3250  010c a30100        	cpw	x,#256
3251  010f 7b06          	ld	a,(OFST+0,sp)
3252  0111 2502          	jrult	L7702
3253                     ; 145 			Checksum = (unsigned char)(Check_buff);
3255                     ; 146 			Checksum += (unsigned char)(Check_buff>>8);
3257  0113 1b05          	add	a,(OFST-1,sp)
3259  0115               L7702:
3260                     ; 148 			Checksum = (unsigned char)(Check_buff);
3262  0115 6b04          	ld	(OFST-2,sp),a
3263                     ; 151 		Check_buff = 0;
3265                     ; 140 	for(Offset = 0; Offset < index; Offset++){
3267  0117 0c03          	inc	(OFST-3,sp)
3268  0119               L3702:
3271  0119 7b03          	ld	a,(OFST-3,sp)
3272  011b 5f            	clrw	x
3273  011c 97            	ld	xl,a
3274  011d 1301          	cpw	x,(OFST-5,sp)
3275  011f 25d8          	jrult	L7602
3276                     ; 155 	Checksum = (unsigned char)(0xFF - Checksum);
3278  0121 a6ff          	ld	a,#255
3279  0123 1004          	sub	a,(OFST-2,sp)
3280                     ; 157 	return ((unsigned char)Checksum);
3284  0125 5b07          	addw	sp,#7
3285  0127 87            	retf	
3334                     ; 162 unsigned char Lin_Measure_Classic_Checksum(unsigned char *Data)
3334                     ; 163 {
3335                     	switch	.text
3336  0128               f_Lin_Measure_Classic_Checksum:
3338  0128 89            	pushw	x
3339  0129 5203          	subw	sp,#3
3340       00000003      OFST:	set	3
3343                     ; 165 	unsigned int CheckSum = 0;
3345  012b 5f            	clrw	x
3346  012c 1f02          	ldw	(OFST-1,sp),x
3347                     ; 167 	for(Offset = 0; Offset <8; Offset++){
3349  012e 0f01          	clr	(OFST-2,sp)
3350  0130               L5212:
3351                     ; 168 		CheckSum += *(Data + Offset);
3353  0130 7b04          	ld	a,(OFST+1,sp)
3354  0132 97            	ld	xl,a
3355  0133 7b05          	ld	a,(OFST+2,sp)
3356  0135 1b01          	add	a,(OFST-2,sp)
3357  0137 2401          	jrnc	L24
3358  0139 5c            	incw	x
3359  013a               L24:
3360  013a 02            	rlwa	x,a
3361  013b f6            	ld	a,(x)
3362  013c 1b03          	add	a,(OFST+0,sp)
3363  013e 6b03          	ld	(OFST+0,sp),a
3364  0140 2402          	jrnc	L44
3365  0142 0c02          	inc	(OFST-1,sp)
3366  0144               L44:
3367                     ; 169 		if(CheckSum > 0xFF){	CheckSum -= 0xFF; }
3369  0144 1e02          	ldw	x,(OFST-1,sp)
3370  0146 a30100        	cpw	x,#256
3371  0149 2505          	jrult	L3312
3374  014b 1d00ff        	subw	x,#255
3375  014e 1f02          	ldw	(OFST-1,sp),x
3376  0150               L3312:
3377                     ; 167 	for(Offset = 0; Offset <8; Offset++){
3379  0150 0c01          	inc	(OFST-2,sp)
3382  0152 7b01          	ld	a,(OFST-2,sp)
3383  0154 a108          	cp	a,#8
3384  0156 25d8          	jrult	L5212
3385                     ; 172 	CheckSum = (0xFF - CheckSum);
3387  0158 ae00ff        	ldw	x,#255
3388  015b 72f002        	subw	x,(OFST-1,sp)
3389  015e 1f02          	ldw	(OFST-1,sp),x
3390                     ; 174 	return ((unsigned char)CheckSum);
3392  0160 7b03          	ld	a,(OFST+0,sp)
3395  0162 5b05          	addw	sp,#5
3396  0164 87            	retf	
3429                     ; 179 @far @interrupt void LINUART_Tx_Interrupt(void)
3429                     ; 180 {
3430                     	switch	.text
3431  0165               f_LINUART_Tx_Interrupt:
3433  0165 3b0002        	push	c_x+2
3434  0168 be00          	ldw	x,c_x
3435  016a 89            	pushw	x
3436  016b 3b0002        	push	c_y+2
3437  016e be00          	ldw	x,c_y
3438  0170 89            	pushw	x
3441                     ; 181 	LINUART_SR &= 0xBF;		//Clear Transmission Complete flag
3443  0171 721d5240      	bres	_LINUART_SR,#6
3444                     ; 183 	if((T6_Tx_flag == OFF) &&(T6_Rx_flag == OFF)){return;}
3446  0175 7208000005    	btjt	_Lin_Com_Register,#4,L5412
3448  017a 720b000032    	btjf	_Lin_Com_Register,#5,L06
3451  017f               L5412:
3452                     ; 185 	if(T6_Tx_flag == ON){
3454  017f 7209000028    	btjf	_Lin_Com_Register,#4,L7412
3455                     ; 186 		if(Lin_tx_offet == 0){
3457  0184 725d0021      	tnz	_Lin_tx_offet
3458  0188 260d          	jrne	L3512
3459                     ; 187 			LIN_Measure_PID_Parity(0x30);
3461  018a a630          	ld	a,#48
3462  018c 8d0f000f      	callf	f_LIN_Measure_PID_Parity
3464                     ; 188 			LIN_Transmission_Data(PID_Parity_Register);		//Protected_Identifier
3466  0190 c60009        	ld	a,_PID_Parity_Register
3467  0193 8dd100d1      	callf	f_LIN_Transmission_Data
3470  0197               L3512:
3471                     ; 193 		if(Lin_tx_offet>= 9){
3473  0197 c60021        	ld	a,_Lin_tx_offet
3474  019a a109          	cp	a,#9
3475  019c 250a          	jrult	L5512
3476                     ; 194 			T6_Tx_flag = OFF;
3478  019e 72190000      	bres	_Lin_Com_Register,#4
3479                     ; 195 			Lin_tx_offet = 0;
3481  01a2 725f0021      	clr	_Lin_tx_offet
3483  01a6 2004          	jra	L7412
3484  01a8               L5512:
3485                     ; 196 		}else{ Lin_tx_offet++; }
3487  01a8 725c0021      	inc	_Lin_tx_offet
3488  01ac               L7412:
3489                     ; 201 	if(Tx_Data_Req_flag == OFF){return ;}
3491  01ac 7202000a0d    	btjt	_LIN_Control_Status,#1,L1612
3493  01b1               L06:
3496  01b1 85            	popw	x
3497  01b2 bf00          	ldw	c_y,x
3498  01b4 320002        	pop	c_y+2
3499  01b7 85            	popw	x
3500  01b8 bf00          	ldw	c_x,x
3501  01ba 320002        	pop	c_x+2
3502  01bd 80            	iret	
3503  01be               L1612:
3504                     ; 203 		Lin_tx_offet++;
3506  01be 725c0021      	inc	_Lin_tx_offet
3507                     ; 205 		if(Lin_tx_offet>8){
3509  01c2 c60021        	ld	a,_Lin_tx_offet
3510  01c5 a109          	cp	a,#9
3511  01c7 250e          	jrult	L5612
3512                     ; 206 			Lin_tx_offet = 0;
3514  01c9 725f0021      	clr	_Lin_tx_offet
3515                     ; 207 			LIN_Rx_Enalbe();
3517  01cd 8d000000      	callf	f_LIN_Rx_Enalbe
3519                     ; 208 			Tx_Data_Req_flag = OFF;
3521  01d1 7213000a      	bres	_LIN_Control_Status,#1
3523  01d5 20da          	jra	L06
3524  01d7               L5612:
3525                     ; 209 		}else{LIN_Transmission_Datas(PTC_Tx_Data[Lin_tx_offet]);}
3527  01d7 c60021        	ld	a,_Lin_tx_offet
3528  01da 5f            	clrw	x
3529  01db 97            	ld	xl,a
3530  01dc d60015        	ld	a,(_PTC_Tx_Data,x)
3531  01df 8dda00da      	callf	f_LIN_Transmission_Datas
3533                     ; 211 	return;
3535  01e3 20cc          	jra	L06
3583                     ; 216 @far @interrupt void LINUART_Rx_Interrupt(void)
3583                     ; 217 {
3584                     	switch	.text
3585  01e5               f_LINUART_Rx_Interrupt:
3587       00000001      OFST:	set	1
3588  01e5 88            	push	a
3591                     ; 220 	Buff = LINUART_DR;
3593  01e6 c65241        	ld	a,_LINUART_DR
3594  01e9 6b01          	ld	(OFST+0,sp),a
3595                     ; 222 	if(LINUART_CR6 & 0x02){
3597  01eb 7203524918    	btjf	_LINUART_CR6,#1,L5022
3598                     ; 223 		LINUART_CR6 &= 0xFD;
3600  01f0 72135249      	bres	_LINUART_CR6,#1
3601                     ; 225 		if(Buff == 0x1A){
3603  01f4 a11a          	cp	a,#26
3604  01f6 2704ac300330  	jrne	L1122
3605                     ; 226 			FAIT_MT_Data_flag = ON;
3607  01fc 72180000      	bset	_FIAT_Test_Register,#4
3608                     ; 227 			Lin_Rx_Cnt = 0;
3610  0200 725f0024      	clr	_Lin_Rx_Cnt
3611  0204 ac300330      	jra	L1122
3612  0208               L5022:
3613                     ; 233 		if((T6_PTC_flag == ON)&&(T6_SHCM_Rep_flag == ON)){
3615  0208 720100002d    	btjf	_LIN13_Select_Device,#0,L3122
3617  020d 7205000028    	btjf	_Lin_Com_Register,#2,L3122
3618                     ; 234 			if(Lin_Rx_Cnt>0){	//echo
3620  0212 725d0024      	tnz	_Lin_Rx_Cnt
3621  0216 270b          	jreq	L5122
3622                     ; 235 				T6_RxLin_Data[Lin_Rx_Cnt-1] = Buff;
3624  0218 c60024        	ld	a,_Lin_Rx_Cnt
3625  021b 5f            	clrw	x
3626  021c 97            	ld	xl,a
3627  021d 5a            	decw	x
3628  021e 7b01          	ld	a,(OFST+0,sp)
3629  0220 d70000        	ld	(_T6_RxLin_Data,x),a
3630  0223               L5122:
3631                     ; 237 			Lin_Rx_Cnt++;	 	
3633  0223 725c0024      	inc	_Lin_Rx_Cnt
3634                     ; 239 			if(Lin_Rx_Cnt>9){
3636  0227 c60024        	ld	a,_Lin_Rx_Cnt
3637  022a a10a          	cp	a,#10
3638  022c 250c          	jrult	L3122
3639                     ; 240 				Lin_Rx_Cnt = 0;
3641  022e 725f0024      	clr	_Lin_Rx_Cnt
3642                     ; 241 				T6_SHCM_Rep_flag = OFF;
3644  0232 72150000      	bres	_Lin_Com_Register,#2
3645                     ; 242 				T6_Response_Complete = ON;
3647  0236 72160000      	bset	_Lin_Com_Register,#3
3648  023a               L3122:
3649                     ; 247 		if((FIAT500_PTC_flag == ON) && (FIAT_SHCM_Rep_flag == ON)){
3651  023a 720100002d    	btjf	_LIN20_Select_Device,#0,L1222
3653  023f 7209000028    	btjf	_FIAT_Lin_Com_Register,#4,L1222
3654                     ; 248 			if(Lin_Rx_Cnt>0){ FIAT_RxLin_Data[Lin_Rx_Cnt-1] = Buff;}
3656  0244 725d0024      	tnz	_Lin_Rx_Cnt
3657  0248 270b          	jreq	L3222
3660  024a c60024        	ld	a,_Lin_Rx_Cnt
3661  024d 5f            	clrw	x
3662  024e 97            	ld	xl,a
3663  024f 5a            	decw	x
3664  0250 7b01          	ld	a,(OFST+0,sp)
3665  0252 d70000        	ld	(_FIAT_RxLin_Data,x),a
3666  0255               L3222:
3667                     ; 249 			Lin_Rx_Cnt++;
3669  0255 725c0024      	inc	_Lin_Rx_Cnt
3670                     ; 251 			if(Lin_Rx_Cnt>9){
3672  0259 c60024        	ld	a,_Lin_Rx_Cnt
3673  025c a10a          	cp	a,#10
3674  025e 250c          	jrult	L1222
3675                     ; 252 				Lin_Rx_Cnt = 0;
3677  0260 725f0024      	clr	_Lin_Rx_Cnt
3678                     ; 253 				FIAT_SHCM_Rep_flag = OFF;
3680  0264 72190000      	bres	_FIAT_Lin_Com_Register,#4
3681                     ; 254 				FIAT_Response_Complete = ON;
3683  0268 721a0000      	bset	_FIAT_Lin_Com_Register,#5
3684  026c               L1222:
3685                     ; 259 		if((FIAT500_MT_flag == ON) && (FAIT_MT_Data_flag == ON)){
3687  026c 7203000026    	btjf	_LIN20_Select_Device,#1,L7222
3689  0271 7209000021    	btjf	_FIAT_Test_Register,#4,L7222
3690                     ; 260 			FIAT_RxLin_Data[Lin_Rx_Cnt] = Buff;
3692  0276 c60024        	ld	a,_Lin_Rx_Cnt
3693  0279 5f            	clrw	x
3694  027a 97            	ld	xl,a
3695  027b 7b01          	ld	a,(OFST+0,sp)
3696  027d d70000        	ld	(_FIAT_RxLin_Data,x),a
3697                     ; 261 			Lin_Rx_Cnt++;
3699  0280 725c0024      	inc	_Lin_Rx_Cnt
3700                     ; 263 			if(Lin_Rx_Cnt>8){
3702  0284 c60024        	ld	a,_Lin_Rx_Cnt
3703  0287 a109          	cp	a,#9
3704  0289 250c          	jrult	L7222
3705                     ; 264 				Lin_Rx_Cnt = 0;
3707  028b 725f0024      	clr	_Lin_Rx_Cnt
3708                     ; 265 				FAIT_MT_Data_flag = OFF;
3710  028f 72190000      	bres	_FIAT_Test_Register,#4
3711                     ; 266 				FIAT_MT_Complete = ON;
3713  0293 721a0000      	bset	_FIAT_Test_Register,#5
3714  0297               L7222:
3715                     ; 270 		if((LGE_CHCM_Flag) && (CHCM_SHCM_Rep_flag)){
3717  0297 720100002d    	btjf	_LIN_J2602_Select_Device,#0,L3322
3719  029c 7205000028    	btjf	_LGE_Lin_Com_Register,#2,L3322
3720                     ; 271 			if(Lin_Rx_Cnt>0){ CHCM_RxLin_Data[Lin_Rx_Cnt-1] = Buff;}
3722  02a1 725d0024      	tnz	_Lin_Rx_Cnt
3723  02a5 270b          	jreq	L5322
3726  02a7 c60024        	ld	a,_Lin_Rx_Cnt
3727  02aa 5f            	clrw	x
3728  02ab 97            	ld	xl,a
3729  02ac 5a            	decw	x
3730  02ad 7b01          	ld	a,(OFST+0,sp)
3731  02af d70000        	ld	(_CHCM_RxLin_Data,x),a
3732  02b2               L5322:
3733                     ; 272 			Lin_Rx_Cnt++;
3735  02b2 725c0024      	inc	_Lin_Rx_Cnt
3736                     ; 273 			if(Lin_Rx_Cnt > 5){
3738  02b6 c60024        	ld	a,_Lin_Rx_Cnt
3739  02b9 a106          	cp	a,#6
3740  02bb 250c          	jrult	L3322
3741                     ; 274 				Lin_Rx_Cnt = 0;
3743  02bd 725f0024      	clr	_Lin_Rx_Cnt
3744                     ; 275 				CHCM_SHCM_Rep_flag = OFF;
3746  02c1 72150000      	bres	_LGE_Lin_Com_Register,#2
3747                     ; 276 				CHCM_Response_Complete = ON;
3749  02c5 72160000      	bset	_LGE_Lin_Com_Register,#3
3750  02c9               L3322:
3751                     ; 281 		if(SAIC_PTC_flag){
3753  02c9 7205000062    	btjf	_LIN20_Select_Device,#2,L1122
3754                     ; 283 			if(SAIC_PTC_Rep1_flag){
3756  02ce 720300002c    	btjf	_SAIC_Lin_Com_Register,#1,L3422
3757                     ; 284 				SAIC_PTC_Rep2_flag = OFF;
3759  02d3 72150000      	bres	_SAIC_Lin_Com_Register,#2
3760                     ; 285 				if(Lin_Rx_Cnt>0){ SAIC_Rx1_Lin_Data[Lin_Rx_Cnt-1] = Buff;}
3762  02d7 725d0024      	tnz	_Lin_Rx_Cnt
3763  02db 270b          	jreq	L5422
3766  02dd c60024        	ld	a,_Lin_Rx_Cnt
3767  02e0 5f            	clrw	x
3768  02e1 97            	ld	xl,a
3769  02e2 5a            	decw	x
3770  02e3 7b01          	ld	a,(OFST+0,sp)
3771  02e5 d70000        	ld	(_SAIC_Rx1_Lin_Data,x),a
3772  02e8               L5422:
3773                     ; 286 				Lin_Rx_Cnt++;
3775  02e8 725c0024      	inc	_Lin_Rx_Cnt
3776                     ; 288 				if(Lin_Rx_Cnt>9){
3778  02ec c60024        	ld	a,_Lin_Rx_Cnt
3779  02ef a10a          	cp	a,#10
3780  02f1 250c          	jrult	L3422
3781                     ; 289 					Lin_Rx_Cnt = 0;
3783  02f3 725f0024      	clr	_Lin_Rx_Cnt
3784                     ; 290 					SAIC_PTC_Rep1_flag = OFF;
3786  02f7 72130000      	bres	_SAIC_Lin_Com_Register,#1
3787                     ; 291 					SAIC_Rep1_Complete = ON;
3789  02fb 72160000      	bset	_SAIC_Lin_Com_Register,#3
3790  02ff               L3422:
3791                     ; 295 			if(SAIC_PTC_Rep2_flag){
3793  02ff 720500002c    	btjf	_SAIC_Lin_Com_Register,#2,L1122
3794                     ; 296 				SAIC_PTC_Rep1_flag = OFF;
3796  0304 72130000      	bres	_SAIC_Lin_Com_Register,#1
3797                     ; 297 				if(Lin_Rx_Cnt>0){ SAIC_Rx2_Lin_Data[Lin_Rx_Cnt-1] = Buff;}
3799  0308 725d0024      	tnz	_Lin_Rx_Cnt
3800  030c 270b          	jreq	L3522
3803  030e c60024        	ld	a,_Lin_Rx_Cnt
3804  0311 5f            	clrw	x
3805  0312 97            	ld	xl,a
3806  0313 5a            	decw	x
3807  0314 7b01          	ld	a,(OFST+0,sp)
3808  0316 d70000        	ld	(_SAIC_Rx2_Lin_Data,x),a
3809  0319               L3522:
3810                     ; 298 				Lin_Rx_Cnt++;
3812  0319 725c0024      	inc	_Lin_Rx_Cnt
3813                     ; 300 				if(Lin_Rx_Cnt>9){
3815  031d c60024        	ld	a,_Lin_Rx_Cnt
3816  0320 a10a          	cp	a,#10
3817  0322 250c          	jrult	L1122
3818                     ; 301 					Lin_Rx_Cnt = 0;
3820  0324 725f0024      	clr	_Lin_Rx_Cnt
3821                     ; 302 					SAIC_PTC_Rep2_flag = OFF;
3823  0328 72150000      	bres	_SAIC_Lin_Com_Register,#2
3824                     ; 303 					SAIC_Rep2_Complete = ON;
3826  032c 72180000      	bset	_SAIC_Lin_Com_Register,#4
3827  0330               L1122:
3828                     ; 308 	return;
3831  0330 84            	pop	a
3832  0331 80            	iret	
3995                     	xdef	f_LINUART_Rx_Interrupt
3996                     	xdef	f_LINUART_Tx_Interrupt
3997                     	xdef	_Lin_tx_offet
3998                     	xdef	_Lin_Data_Cnt
3999                     	xdef	_PTC_Tx_Data
4000                     	xdef	_Lin_Tx_Data
4001                     	switch	.bss
4002  0000               _Lin_Rx_Data:
4003  0000 000000000000  	ds.b	9
4004                     	xdef	_Lin_Rx_Data
4005                     	xdef	_Lin_TX_ID
4006                     	xdef	_Lin_RX_ID
4007                     	xdef	_Lin_ID
4008                     	xref	_SAIC_Rx2_Lin_Data
4009                     	xref	_SAIC_Rx1_Lin_Data
4010                     	xref	_SAIC_Lin_Com_Register
4011                     	xref	_CHCM_RxLin_Data
4012                     	xref	_LGE_Lin_Com_Register
4013                     	xref	_FIAT_RxLin_Data
4014                     	xref	_FIAT_Lin_Com_Register
4015                     	xref	_FIAT_Test_Register
4016                     	xref	_Lin_Com_Register
4017                     	xref	_T6_RxLin_Data
4018                     	xdef	_Lin_Rx_Cnt
4019                     	xdef	_FIAT_Recieve_Cnt
4020                     	xdef	_Recieve_Cnt
4021                     	xdef	_Lin_Error_Cnt
4022                     	xdef	_PTC_LINEVC_R_01
4023  0009               _PID_Parity_Register:
4024  0009 00            	ds.b	1
4025                     	xdef	_PID_Parity_Register
4026  000a               _LIN_Control_Status:
4027  000a 00            	ds.b	1
4028                     	xdef	_LIN_Control_Status
4029  000b               _LIN_Device_Setup:
4030  000b 00            	ds.b	1
4031                     	xdef	_LIN_Device_Setup
4032                     	xdef	f_LIN_Transmission_Data
4033                     	xdef	f_LIN_Rx_Disable
4034                     	xdef	f_LIN_Rx_Enalbe
4035                     	xdef	f_LIN_Generate_Break_Field
4036                     	xdef	f_LIN_Header_Transmission
4037                     	xdef	f_Lin_Measure_Extend_Checksum
4038                     	xdef	f_Lin_Measure_Classic_Checksum
4039                     	xdef	f_LIN_Transmission_Datas
4040                     	xdef	f_LIN_Measure_PID_Parity
4041                     	xref	_LIN_J2602_Select_Device
4042                     	xref	_LIN20_Select_Device
4043                     	xref	_LIN13_Select_Device
4044                     	xref.b	c_x
4045                     	xref.b	c_y
4065                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
2654                     .const:	section	.text
2655  0000               _Can_Fail_Time:
2656  0000 32            	dc.b	50
2657  0001 32            	dc.b	50
2658  0002 32            	dc.b	50
2659  0003 32            	dc.b	50
2660  0004               _Can_Msg_Length:
2661  0004 08            	dc.b	8
2662  0005 08            	dc.b	8
2663  0006 08            	dc.b	8
2664  0007 08            	dc.b	8
2665                     	switch	.data
2666  0000               _CAN_RECV_ID:
2667  0000 0000          	dc.w	0
2668  0002               _CAN_test_data:
2669  0002 00            	dc.b	0
2670  0003 000000        	ds.b	3
2671  0006               _HEATER_zone_status:
2672  0006 00            	dc.b	0
2704                     ; 76 void CAN_Tx_Message_Now(void)
2704                     ; 77 {
2706                     	switch	.text
2707  0000               _CAN_Tx_Message_Now:
2711                     ; 78 	b_Can_Tx_Event = ON;
2713  0000 72180000      	bset	_uc_Can_Status_Reg,#4
2714                     ; 79 	uc_Can_Event_Counter = 0;
2716  0004 3f02          	clr	_uc_Can_Event_Counter
2717                     ; 80 	uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
2719  0006 35020003      	mov	_uc_Can_Event_Time,#2
2720                     ; 82 	return;
2723  000a 81            	ret
2760                     ; 87 void CAN_Normal_Message_Handling(void)
2760                     ; 88 {
2761                     	switch	.text
2762  000b               _CAN_Normal_Message_Handling:
2764  000b 88            	push	a
2765       00000001      OFST:	set	1
2768                     ; 91 	if(Can_Node[HTR_STATUS1].Fail){ b_Rx1_Msg_TimeOut_Flag = ON; }
2770  000c c6000a        	ld	a,_Can_Node
2771  000f a501          	bcp	a,#1
2772  0011 2706          	jreq	L5371
2775  0013 72100000      	bset	_uc_Rx_TimeOut_Reg,#0
2777  0017 2027          	jra	L7371
2778  0019               L5371:
2779                     ; 92 	else if(Can_Node[HTR_STATUS1].Update)
2781  0019 c6000a        	ld	a,_Can_Node
2782  001c a502          	bcp	a,#2
2783  001e 2720          	jreq	L7371
2784                     ; 94 CAN_test_data[0]++;
2786  0020 725c0002      	inc	_CAN_test_data
2787                     ; 95 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS1][uc_index] = Can_Node[HTR_STATUS1].Msg[uc_index];  }
2789  0024 0f01          	clr	(OFST+0,sp)
2791  0026               L3471:
2794  0026 7b01          	ld	a,(OFST+0,sp)
2795  0028 5f            	clrw	x
2796  0029 97            	ld	xl,a
2797  002a d6000c        	ld	a,(_Can_Node+2,x)
2798  002d d70000        	ld	(_uc_Rx_Data,x),a
2801  0030 0c01          	inc	(OFST+0,sp)
2805  0032 7b01          	ld	a,(OFST+0,sp)
2806  0034 a108          	cp	a,#8
2807  0036 25ee          	jrult	L3471
2808                     ; 96 		b_Rx1_Msg_TimeOut_Flag = OFF;	
2810  0038 72110000      	bres	_uc_Rx_TimeOut_Reg,#0
2811                     ; 97 		Can_Node[HTR_STATUS1].Update = OFF;			//Data_Read_Panding
2813  003c 7213000a      	bres	_Can_Node,#1
2814  0040               L7371:
2815                     ; 100 	if(Can_Node[HTR_STATUS2].Fail){ b_Rx2_Msg_TimeOut_Flag = ON; }
2817  0040 c60014        	ld	a,_Can_Node+10
2818  0043 a501          	bcp	a,#1
2819  0045 2706          	jreq	L1571
2822  0047 72120000      	bset	_uc_Rx_TimeOut_Reg,#1
2824  004b 2027          	jra	L3571
2825  004d               L1571:
2826                     ; 101 	else if(Can_Node[HTR_STATUS2].Update)
2828  004d c60014        	ld	a,_Can_Node+10
2829  0050 a502          	bcp	a,#2
2830  0052 2720          	jreq	L3571
2831                     ; 103 CAN_test_data[1]++;
2833  0054 725c0003      	inc	_CAN_test_data+1
2834                     ; 104 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS2][uc_index] = Can_Node[HTR_STATUS2].Msg[uc_index];  }
2836  0058 0f01          	clr	(OFST+0,sp)
2838  005a               L7571:
2841  005a 7b01          	ld	a,(OFST+0,sp)
2842  005c 5f            	clrw	x
2843  005d 97            	ld	xl,a
2844  005e d60016        	ld	a,(_Can_Node+12,x)
2845  0061 d70008        	ld	(_uc_Rx_Data+8,x),a
2848  0064 0c01          	inc	(OFST+0,sp)
2852  0066 7b01          	ld	a,(OFST+0,sp)
2853  0068 a108          	cp	a,#8
2854  006a 25ee          	jrult	L7571
2855                     ; 105 		b_Rx2_Msg_TimeOut_Flag = OFF;
2857  006c 72130000      	bres	_uc_Rx_TimeOut_Reg,#1
2858                     ; 106 		Can_Node[HTR_STATUS2].Update = OFF;			//Data_Read_Panding
2860  0070 72130014      	bres	_Can_Node+10,#1
2861  0074               L3571:
2862                     ; 109 	if(Can_Node[HTR_STATUS3].Fail){ b_Rx3_Msg_TimeOut_Flag = ON; }
2864  0074 c6001e        	ld	a,_Can_Node+20
2865  0077 a501          	bcp	a,#1
2866  0079 2706          	jreq	L5671
2869  007b 72140000      	bset	_uc_Rx_TimeOut_Reg,#2
2871  007f 2027          	jra	L7671
2872  0081               L5671:
2873                     ; 110 	else if(Can_Node[HTR_STATUS3].Update)
2875  0081 c6001e        	ld	a,_Can_Node+20
2876  0084 a502          	bcp	a,#2
2877  0086 2720          	jreq	L7671
2878                     ; 112 CAN_test_data[2]++;
2880  0088 725c0004      	inc	_CAN_test_data+2
2881                     ; 113 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS3][uc_index] = Can_Node[HTR_STATUS3].Msg[uc_index];  }
2883  008c 0f01          	clr	(OFST+0,sp)
2885  008e               L3771:
2888  008e 7b01          	ld	a,(OFST+0,sp)
2889  0090 5f            	clrw	x
2890  0091 97            	ld	xl,a
2891  0092 d60020        	ld	a,(_Can_Node+22,x)
2892  0095 d70010        	ld	(_uc_Rx_Data+16,x),a
2895  0098 0c01          	inc	(OFST+0,sp)
2899  009a 7b01          	ld	a,(OFST+0,sp)
2900  009c a108          	cp	a,#8
2901  009e 25ee          	jrult	L3771
2902                     ; 114 		b_Rx3_Msg_TimeOut_Flag = OFF;	
2904  00a0 72150000      	bres	_uc_Rx_TimeOut_Reg,#2
2905                     ; 115 		Can_Node[HTR_STATUS3].Update = OFF;			//Data_Read_Panding
2907  00a4 7213001e      	bres	_Can_Node+20,#1
2908  00a8               L7671:
2909                     ; 118 	if(Can_Node[HTR_STATUS4].Fail){ b_Rx4_Msg_TimeOut_Flag = ON; }
2911  00a8 c60028        	ld	a,_Can_Node+30
2912  00ab a501          	bcp	a,#1
2913  00ad 2706          	jreq	L1002
2916  00af 72160000      	bset	_uc_Rx_TimeOut_Reg,#3
2918  00b3 2027          	jra	L3002
2919  00b5               L1002:
2920                     ; 119 	else if(Can_Node[HTR_STATUS4].Update)
2922  00b5 c60028        	ld	a,_Can_Node+30
2923  00b8 a502          	bcp	a,#2
2924  00ba 2720          	jreq	L3002
2925                     ; 121 CAN_test_data[3]++;
2927  00bc 725c0005      	inc	_CAN_test_data+3
2928                     ; 122 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS4][uc_index] = Can_Node[HTR_STATUS4].Msg[uc_index];  }
2930  00c0 0f01          	clr	(OFST+0,sp)
2932  00c2               L7002:
2935  00c2 7b01          	ld	a,(OFST+0,sp)
2936  00c4 5f            	clrw	x
2937  00c5 97            	ld	xl,a
2938  00c6 d6002a        	ld	a,(_Can_Node+32,x)
2939  00c9 d70018        	ld	(_uc_Rx_Data+24,x),a
2942  00cc 0c01          	inc	(OFST+0,sp)
2946  00ce 7b01          	ld	a,(OFST+0,sp)
2947  00d0 a108          	cp	a,#8
2948  00d2 25ee          	jrult	L7002
2949                     ; 123 		b_Rx4_Msg_TimeOut_Flag = OFF;
2951  00d4 72170000      	bres	_uc_Rx_TimeOut_Reg,#3
2952                     ; 124 		Can_Node[HTR_STATUS4].Update = OFF;			//Data_Read_Panding
2954  00d8 72130028      	bres	_Can_Node+30,#1
2955  00dc               L3002:
2956                     ; 126 	return;
2959  00dc 84            	pop	a
2960  00dd 81            	ret
2994                     ; 130 void CAN_Fail_Handling(void)
2994                     ; 131 {
2995                     	switch	.text
2996  00de               _CAN_Fail_Handling:
2998  00de 88            	push	a
2999       00000001      OFST:	set	1
3002                     ; 135 	if(b_Can_Error_Pending == OFF)
3004  00df b600          	ld	a,_uc_Can_Status_Reg
3005  00e1 a520          	bcp	a,#32
3006  00e3 2634          	jrne	L1302
3007                     ; 138 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
3009  00e5 0f01          	clr	(OFST+0,sp)
3011  00e7               L3302:
3012                     ; 140 			Can_Node[Index].Fail = ON;		//Node_Fail
3014  00e7 7b01          	ld	a,(OFST+0,sp)
3015  00e9 97            	ld	xl,a
3016  00ea a60a          	ld	a,#10
3017  00ec 42            	mul	x,a
3018  00ed d6000a        	ld	a,(_Can_Node,x)
3019  00f0 aa01          	or	a,#1
3020  00f2 d7000a        	ld	(_Can_Node,x),a
3021                     ; 141 			Can_Node[Index].Update = OFF;	//Msg_Pending
3023  00f5 7b01          	ld	a,(OFST+0,sp)
3024  00f7 97            	ld	xl,a
3025  00f8 a60a          	ld	a,#10
3026  00fa 42            	mul	x,a
3027  00fb d6000a        	ld	a,(_Can_Node,x)
3028  00fe a4fd          	and	a,#253
3029  0100 d7000a        	ld	(_Can_Node,x),a
3030                     ; 142 			Can_Node[Index].Timeout = 0;	//Msg_Timer_Reset
3032  0103 7b01          	ld	a,(OFST+0,sp)
3033  0105 97            	ld	xl,a
3034  0106 a60a          	ld	a,#10
3035  0108 42            	mul	x,a
3036  0109 724f000b      	clr	(_Can_Node+1,x)
3037                     ; 138 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
3039  010d 0c01          	inc	(OFST+0,sp)
3043  010f 7b01          	ld	a,(OFST+0,sp)
3044  0111 a104          	cp	a,#4
3045  0113 25d2          	jrult	L3302
3046                     ; 145 		b_Can_Error_Pending = ON;
3048  0115 721a0000      	bset	_uc_Can_Status_Reg,#5
3049  0119               L1302:
3050                     ; 147 	return;
3053  0119 84            	pop	a
3054  011a 81            	ret
3057                     	switch	.data
3058  0007               L1402_testCnt:
3059  0007 00            	dc.b	0
3116                     ; 151 void CAN_Normal_Maessge_Transmit(void)
3116                     ; 152 {
3117                     	switch	.text
3118  011b               _CAN_Normal_Maessge_Transmit:
3120  011b 88            	push	a
3121       00000001      OFST:	set	1
3124                     ; 157 	if(b_Can_Tx_Event == OFF){ return;		}	//Wait_Normal_Message_Period
3126  011c b600          	ld	a,_uc_Can_Status_Reg
3127  011e a510          	bcp	a,#16
3128  0120 2602          	jrne	L3602
3132  0122 84            	pop	a
3133  0123 81            	ret
3134  0124               L3602:
3135                     ; 158 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
3137  0124 c65423        	ld	a,_CAN_TPR
3138  0127 a510          	bcp	a,#16
3139  0129 2706          	jreq	L7602
3142  012b 35055427      	mov	_CAN_FPSR,#5
3144  012f 2018          	jra	L5602
3145  0131               L7602:
3146                     ; 159 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
3148  0131 c65423        	ld	a,_CAN_TPR
3149  0134 a508          	bcp	a,#8
3150  0136 2706          	jreq	L3702
3153  0138 35015427      	mov	_CAN_FPSR,#1
3155  013c 200b          	jra	L5602
3156  013e               L3702:
3157                     ; 160 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
3159  013e c65423        	ld	a,_CAN_TPR
3160  0141 a504          	bcp	a,#4
3161  0143 2752          	jreq	L7702
3164  0145 725f5427      	clr	_CAN_FPSR
3166  0149               L5602:
3167                     ; 164 	CAN_P2 = (U8)((CAN_HTR_CTRL_ID >> 6) & 0x1F);	//Tx_HAVC_ID_MSB
3169  0149 3508542a      	mov	_CAN_P2,#8
3170                     ; 165 	_asm("nop");					//STM8A_CAN_Bug_Happy
3173  014d 9d            nop
3175                     ; 166 	CAN_P3 = (U8)((CAN_HTR_CTRL_ID << 2) & 0xFC);	//Tx_HAVC_ID_LSB
3177  014e 725f542b      	clr	_CAN_P3
3178                     ; 167 	_asm("nop");					//STM8A_CAN_Bug_Happy
3181  0152 9d            nop
3183                     ; 170 	for(uc_index = 0; uc_index < (U8)(8); uc_index++){ Can_Tx_Buffer[uc_index] = (U8)(0); }
3185  0153 0f01          	clr	(OFST+0,sp)
3187  0155               L3012:
3190  0155 7b01          	ld	a,(OFST+0,sp)
3191  0157 5f            	clrw	x
3192  0158 97            	ld	xl,a
3193  0159 724f0002      	clr	(_Can_Tx_Buffer,x)
3196  015d 0c01          	inc	(OFST+0,sp)
3200  015f 7b01          	ld	a,(OFST+0,sp)
3201  0161 a108          	cp	a,#8
3202  0163 25f0          	jrult	L3012
3203                     ; 179 	Can_Tx_Buffer[0] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1]);
3205  0165 5500000002    	mov	_Can_Tx_Buffer,_uc_Target_Duty_Perc
3206                     ; 180 	Can_Tx_Buffer[1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2]);
3208  016a 5500010003    	mov	_Can_Tx_Buffer+1,_uc_Target_Duty_Perc+1
3209                     ; 181 	Can_Tx_Buffer[2] = (U8)(uc_Heater_Enable_Flag);
3211  016f 5500000004    	mov	_Can_Tx_Buffer+2,_uc_Heater_Enable_Flag
3212                     ; 188 	for(Offset = 0; Offset < 8; Offset++)	// Tx_Message_Length : 7Bytes
3214  0174 0f01          	clr	(OFST+0,sp)
3216  0176               L1112:
3217                     ; 190 		(&CAN_P6)[Offset] = Can_Tx_Buffer[Offset];	//MDARx(Mailbox_Data_Register_x)
3219  0176 7b01          	ld	a,(OFST+0,sp)
3220  0178 5f            	clrw	x
3221  0179 97            	ld	xl,a
3222  017a d60002        	ld	a,(_Can_Tx_Buffer,x)
3223  017d d7542e        	ld	(_CAN_P6,x),a
3224                     ; 188 	for(Offset = 0; Offset < 8; Offset++)	// Tx_Message_Length : 7Bytes
3226  0180 0c01          	inc	(OFST+0,sp)
3230  0182 7b01          	ld	a,(OFST+0,sp)
3231  0184 a108          	cp	a,#8
3232  0186 25ee          	jrult	L1112
3233                     ; 193 	CAN_P1 = 0x08;				//Tx_Data_Length
3235  0188 35085429      	mov	_CAN_P1,#8
3236                     ; 194 	_asm("nop");					//STM8A_CAN_Bug_Happy
3239  018c 9d            nop
3241                     ; 195 	CAN_P0 |= 0x01;				//Transmit_Request
3243  018d 72105428      	bset	_CAN_P0,#0
3244                     ; 196 	b_Can_Tx_Event = OFF;		//Next_Message_Transmit_Periode
3246  0191 72190000      	bres	_uc_Can_Status_Reg,#4
3247                     ; 198 	return;
3250  0195 84            	pop	a
3251  0196 81            	ret
3252  0197               L7702:
3253                     ; 161 	else{	return;			      	}	//Mailbox_All_Busy
3256  0197 84            	pop	a
3257  0198 81            	ret
3288                     ; 203 void CAN_Bus_Off_Handling(void)
3288                     ; 204 {
3289                     	switch	.text
3290  0199               _CAN_Bus_Off_Handling:
3294                     ; 205 	if(uc_Can_Operation_Flow){
3296  0199 3d01          	tnz	_uc_Can_Operation_Flow
3297  019b 2727          	jreq	L7212
3298                     ; 206 		Windows_Watchdog_Clear();
3300  019d cd0000        	call	_Windows_Watchdog_Clear
3302                     ; 209 		if(uc_Can_Operation_Flow == 2)
3304  01a0 b601          	ld	a,_uc_Can_Operation_Flow
3305  01a2 a102          	cp	a,#2
3306  01a4 260b          	jrne	L1312
3307                     ; 211 			CAN_Interrupt_Disable();
3309  01a6 cd0000        	call	_CAN_Interrupt_Disable
3311                     ; 212 			CAN_Transmit_Cancel();
3313  01a9 cd0000        	call	_CAN_Transmit_Cancel
3315                     ; 213 			CAN_Disable();
3317  01ac cd0000        	call	_CAN_Disable
3320  01af 200f          	jra	L3312
3321  01b1               L1312:
3322                     ; 217 		else if(uc_Can_Operation_Flow == 3)
3324  01b1 b601          	ld	a,_uc_Can_Operation_Flow
3325  01b3 a103          	cp	a,#3
3326  01b5 2609          	jrne	L3312
3327                     ; 219 			CAN_Wait_Tx_Message();
3329  01b7 cd0000        	call	_CAN_Wait_Tx_Message
3331                     ; 220 			CAN_Disable();
3333  01ba cd0000        	call	_CAN_Disable
3335                     ; 221 			CAN_Interrupt_Disable();
3337  01bd cd0000        	call	_CAN_Interrupt_Disable
3339  01c0               L3312:
3340                     ; 224 		uc_Can_Status_Reg = 0;
3342  01c0 3f00          	clr	_uc_Can_Status_Reg
3343                     ; 225 		uc_Can_Operation_Flow = 0;
3345  01c2 3f01          	clr	_uc_Can_Operation_Flow
3346  01c4               L7212:
3347                     ; 227 	return;
3350  01c4 81            	ret
3390                     ; 231 void CAN_Timing_Control(void)
3390                     ; 232 {
3391                     	switch	.text
3392  01c5               _CAN_Timing_Control:
3394  01c5 89            	pushw	x
3395       00000002      OFST:	set	2
3398                     ; 236 	if(b_Can_10ms_Periode == OFF){	return;	}
3400  01c6 c60000        	ld	a,_uc_System_Ctrl_Reg
3401  01c9 a504          	bcp	a,#4
3402  01cb 2603cc0254    	jreq	L02
3405                     ; 239 	b_Can_10ms_Periode = OFF;
3407  01d0 72150000      	bres	_uc_System_Ctrl_Reg,#2
3408                     ; 243 	if(b_Can_TInitialize == OFF)
3410  01d4 b600          	ld	a,_uc_Can_Status_Reg
3411  01d6 a502          	bcp	a,#2
3412  01d8 260e          	jrne	L5512
3413                     ; 245 		if(++uc_Can_Init_Delay >= 13){		//Ignd_On_130ms_Delay
3415  01da 3c04          	inc	_uc_Can_Init_Delay
3416  01dc b604          	ld	a,_uc_Can_Init_Delay
3417  01de a10d          	cp	a,#13
3418  01e0 2572          	jrult	L1612
3419                     ; 246 			b_Can_TInitialize = ON;
3421  01e2 72120000      	bset	_uc_Can_Status_Reg,#1
3422  01e6 206c          	jra	L1612
3423  01e8               L5512:
3424                     ; 251 	else if(b_Can_TMsg_Start == OFF)
3426  01e8 b600          	ld	a,_uc_Can_Status_Reg
3427  01ea a504          	bcp	a,#4
3428  01ec 2613          	jrne	L3612
3429                     ; 253 		if(++uc_Can_Init_Delay >= 30){		//Ign1_On_300ms_Delay
3431  01ee 3c04          	inc	_uc_Can_Init_Delay
3432  01f0 b604          	ld	a,_uc_Can_Init_Delay
3433  01f2 a11e          	cp	a,#30
3434  01f4 255e          	jrult	L1612
3435                     ; 254 			uc_Can_Init_Delay = 0;
3437  01f6 3f04          	clr	_uc_Can_Init_Delay
3438                     ; 255 			b_Can_TMsg_Start = ON;
3440  01f8 72140000      	bset	_uc_Can_Status_Reg,#2
3441                     ; 258 			CAN_Tx_Message_Now();
3443  01fc cd0000        	call	_CAN_Tx_Message_Now
3445  01ff 2053          	jra	L1612
3446  0201               L3612:
3447                     ; 264 		if(b_Can_Tx_Event == OFF){
3449  0201 b600          	ld	a,_uc_Can_Status_Reg
3450  0203 a510          	bcp	a,#16
3451  0205 260e          	jrne	L1712
3452                     ; 265 			if(++uc_Can_Event_Counter >= uc_Can_Event_Time){
3454  0207 3c02          	inc	_uc_Can_Event_Counter
3455  0209 b602          	ld	a,_uc_Can_Event_Counter
3456  020b b103          	cp	a,_uc_Can_Event_Time
3457  020d 2506          	jrult	L1712
3458                     ; 266 				uc_Can_Event_Counter = 0;
3460  020f 3f02          	clr	_uc_Can_Event_Counter
3461                     ; 267 				b_Can_Tx_Event = ON;
3463  0211 72180000      	bset	_uc_Can_Status_Reg,#4
3464  0215               L1712:
3465                     ; 272 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
3467  0215 0f02          	clr	(OFST+0,sp)
3469  0217               L5712:
3470                     ; 273 			if(Can_Node[ID].Fail == OFF){
3472  0217 7b02          	ld	a,(OFST+0,sp)
3473  0219 97            	ld	xl,a
3474  021a a60a          	ld	a,#10
3475  021c 42            	mul	x,a
3476  021d d6000a        	ld	a,(_Can_Node,x)
3477  0220 a501          	bcp	a,#1
3478  0222 2628          	jrne	L3022
3479                     ; 274 				if(++Can_Node[ID].Timeout > Can_Fail_Time[ID]){
3481  0224 7b02          	ld	a,(OFST+0,sp)
3482  0226 5f            	clrw	x
3483  0227 97            	ld	xl,a
3484  0228 d60000        	ld	a,(_Can_Fail_Time,x)
3485  022b 6b01          	ld	(OFST-1,sp),a
3487  022d 7b02          	ld	a,(OFST+0,sp)
3488  022f 97            	ld	xl,a
3489  0230 a60a          	ld	a,#10
3490  0232 42            	mul	x,a
3491  0233 724c000b      	inc	(_Can_Node+1,x)
3492  0237 d6000b        	ld	a,(_Can_Node+1,x)
3493  023a 1101          	cp	a,(OFST-1,sp)
3494  023c 230e          	jrule	L3022
3495                     ; 275 					Can_Node[ID].Fail = ON;
3497  023e 7b02          	ld	a,(OFST+0,sp)
3498  0240 97            	ld	xl,a
3499  0241 a60a          	ld	a,#10
3500  0243 42            	mul	x,a
3501  0244 d6000a        	ld	a,(_Can_Node,x)
3502  0247 aa01          	or	a,#1
3503  0249 d7000a        	ld	(_Can_Node,x),a
3504  024c               L3022:
3505                     ; 272 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
3507  024c 0c02          	inc	(OFST+0,sp)
3511  024e 7b02          	ld	a,(OFST+0,sp)
3512  0250 a104          	cp	a,#4
3513  0252 25c3          	jrult	L5712
3514  0254               L1612:
3515                     ; 281 	return;
3516  0254               L02:
3519  0254 85            	popw	x
3520  0255 81            	ret
3560                     ; 285 void CAN_Management_Function(void)
3560                     ; 286 {
3561                     	switch	.text
3562  0256               _CAN_Management_Function:
3566                     ; 288 	CAN_Timing_Control();
3568  0256 cd01c5        	call	_CAN_Timing_Control
3570                     ; 291 	switch(uc_Can_Operation_Flow)
3572  0259 b601          	ld	a,_uc_Can_Operation_Flow
3574                     ; 353 			break;
3575  025b 4d            	tnz	a
3576  025c 270e          	jreq	L7022
3577  025e 4a            	dec	a
3578  025f 271b          	jreq	L1122
3579  0261 4a            	dec	a
3580  0262 2730          	jreq	L3122
3581  0264 4a            	dec	a
3582  0265 276a          	jreq	L5122
3583  0267               L7122:
3584                     ; 352 		default :	uc_Can_Operation_Flow = 0;
3586  0267 3f01          	clr	_uc_Can_Operation_Flow
3587                     ; 353 			break;
3589  0269 cc02eb        	jra	L3322
3590  026c               L7022:
3591                     ; 294 		case 0 :	uc_Can_Init_Delay = 0;
3593  026c 3f04          	clr	_uc_Can_Init_Delay
3594                     ; 295 			uc_Can_Status_Reg = 0;			//CAN_Control = Reset
3596  026e 3f00          	clr	_uc_Can_Status_Reg
3597                     ; 296 			uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
3599  0270 35020003      	mov	_uc_Can_Event_Time,#2
3600                     ; 297 			uc_Can_Event_Counter = 0;			//Tx_Counter_Clear
3602  0274 3f02          	clr	_uc_Can_Event_Counter
3603                     ; 298 			uc_Can_Operation_Flow = 1;
3605  0276 35010001      	mov	_uc_Can_Operation_Flow,#1
3606                     ; 299 			break;
3608  027a 206f          	jra	L3322
3609  027c               L1122:
3610                     ; 302 		case 1 :	if(b_Can_TInitialize == ON){			//130ms_Delay_After_Ign_On
3612  027c b600          	ld	a,_uc_Can_Status_Reg
3613  027e a502          	bcp	a,#2
3614  0280 2769          	jreq	L3322
3615                     ; 303 				Windows_Watchdog_Clear();
3617  0282 cd0000        	call	_Windows_Watchdog_Clear
3619                     ; 304 				CAN_Interrupt_Disable();
3621  0285 cd0000        	call	_CAN_Interrupt_Disable
3623                     ; 305 				CAN_Enable();
3625  0288 cd0000        	call	_CAN_Enable
3627                     ; 306 				CAN_Interrupt_Enable();
3629  028b cd0000        	call	_CAN_Interrupt_Enable
3631                     ; 307 				uc_Can_Operation_Flow = 3;		//CAN_Operation
3633  028e 35030001      	mov	_uc_Can_Operation_Flow,#3
3634  0292 2057          	jra	L3322
3635  0294               L3122:
3636                     ; 312 		case 2 :	if(b_Can_Tx_Error == ON){			//Recovery_Attempt_Completed
3638  0294 b600          	ld	a,_uc_Can_Status_Reg
3639  0296 a508          	bcp	a,#8
3640  0298 271d          	jreq	L7322
3641                     ; 313 				CAN_Interrupt_Disable();
3643  029a cd0000        	call	_CAN_Interrupt_Disable
3645                     ; 314 				CAN_Transmit_Cancel();
3647  029d cd0000        	call	_CAN_Transmit_Cancel
3649                     ; 315 				uc_Can_Event_Time = CAN_RECOVERY_TIME;
3651  02a0 35080003      	mov	_uc_Can_Event_Time,#8
3652                     ; 316 				uc_Can_Event_Counter = 0;		//Tx_Counter Clear
3654  02a4 3f02          	clr	_uc_Can_Event_Counter
3655                     ; 317 				b_Can_Bus_Off_Fail = ON;		//CAN_Bus = OFF
3657  02a6 72100000      	bset	_uc_Can_Status_Reg,#0
3658                     ; 318 				b_Can_Error_Pending = OFF;
3660  02aa 721b0000      	bres	_uc_Can_Status_Reg,#5
3661                     ; 319 				b_Can_Tx_Error = OFF;
3663  02ae 72170000      	bres	_uc_Can_Status_Reg,#3
3664                     ; 320 				CAN_Interrupt_Enable();
3666  02b2 cd0000        	call	_CAN_Interrupt_Enable
3669  02b5 2015          	jra	L1422
3670  02b7               L7322:
3671                     ; 324 			else if(b_Can_Tx_Event == ON){		//Set Flag from Timer_Interrupt
3673  02b7 b600          	ld	a,_uc_Can_Status_Reg
3674  02b9 a510          	bcp	a,#16
3675  02bb 270f          	jreq	L1422
3676                     ; 325 				Windows_Watchdog_Clear();
3678  02bd cd0000        	call	_Windows_Watchdog_Clear
3680                     ; 326 				CAN_Interrupt_Disable();
3682  02c0 cd0000        	call	_CAN_Interrupt_Disable
3684                     ; 327 				CAN_Enable();
3686  02c3 cd0000        	call	_CAN_Enable
3688                     ; 328 				CAN_Interrupt_Enable();
3690  02c6 cd0000        	call	_CAN_Interrupt_Enable
3692                     ; 329 				CAN_Normal_Maessge_Transmit();
3694  02c9 cd011b        	call	_CAN_Normal_Maessge_Transmit
3696  02cc               L1422:
3697                     ; 332 			CAN_Fail_Handling();
3699  02cc cd00de        	call	_CAN_Fail_Handling
3701                     ; 333 			break;
3703  02cf 201a          	jra	L3322
3704  02d1               L5122:
3705                     ; 336 		case 3 :	//CAN_Bus_Off¡æNormal
3705                     ; 337 			if(b_Can_Bus_Off_Fail == ON){
3707  02d1 b600          	ld	a,_uc_Can_Status_Reg
3708  02d3 a501          	bcp	a,#1
3709  02d5 2707          	jreq	L5422
3710                     ; 338 				b_Can_Bus_Off_Fail = OFF;
3712  02d7 72110000      	bres	_uc_Can_Status_Reg,#0
3713                     ; 339 				CAN_Tx_Message_Now();
3715  02db cd0000        	call	_CAN_Tx_Message_Now
3717  02de               L5422:
3718                     ; 343 			CAN_Normal_Message_Handling();	//CAN_Normal_Message_Rx_Data
3720  02de cd000b        	call	_CAN_Normal_Message_Handling
3722                     ; 345 			if(b_First_Logic_On) //YJS 20230314
3724  02e1 c60000        	ld	a,_uc_System_Ctrl_Reg
3725  02e4 a501          	bcp	a,#1
3726  02e6 2703          	jreq	L3322
3727                     ; 347 				CAN_Normal_Maessge_Transmit(); 
3729  02e8 cd011b        	call	_CAN_Normal_Maessge_Transmit
3731  02eb               L3322:
3732                     ; 355 	return;
3735  02eb 81            	ret
3763                     ; 360 void Reset_Can_Function(void)
3763                     ; 361 {
3764                     	switch	.text
3765  02ec               _Reset_Can_Function:
3769                     ; 362 	uc_Can_Init_Delay = (U8)(0);
3771  02ec 3f04          	clr	_uc_Can_Init_Delay
3772                     ; 363 	uc_Can_Event_Time = (U8)(0);
3774  02ee 3f03          	clr	_uc_Can_Event_Time
3775                     ; 364 	uc_Can_Event_Counter = (U8)(0);
3777  02f0 3f02          	clr	_uc_Can_Event_Counter
3778                     ; 365 	uc_Can_Operation_Flow = (U8)(0);
3780  02f2 3f01          	clr	_uc_Can_Operation_Flow
3781                     ; 367 	uc_Can_Status_Reg = (U8)(0);
3783  02f4 3f00          	clr	_uc_Can_Status_Reg
3784                     ; 369 	return;
3787  02f6 81            	ret
3790                     	switch	.bss
3791  0000               L1622_From_ID:
3792  0000 00            	ds.b	1
3793  0001               L3622_Current_Page:
3794  0001 00            	ds.b	1
3848                     ; 374 @interrupt void CAN_Rx_Interrupt(void)
3848                     ; 375 {
3849                     	switch	.text
3850  02f7               _CAN_Rx_Interrupt:
3852  02f7 8a            	push	cc
3853  02f8 84            	pop	a
3854  02f9 a4bf          	and	a,#191
3855  02fb 88            	push	a
3856  02fc 86            	pop	cc
3857       00000001      OFST:	set	1
3858  02fd 3b0002        	push	c_x+2
3859  0300 be00          	ldw	x,c_x
3860  0302 89            	pushw	x
3861  0303 3b0002        	push	c_y+2
3862  0306 be00          	ldw	x,c_y
3863  0308 89            	pushw	x
3864  0309 88            	push	a
3867                     ; 379 	CAN_Interrupt_Disable();
3869  030a cd0000        	call	_CAN_Interrupt_Disable
3871                     ; 381 	Current_Page = CAN_FPSR;					//Backup_PSR(Page_Selection_Register)
3873  030d 5554270001    	mov	L3622_Current_Page,_CAN_FPSR
3874                     ; 384 	if(CAN_RFR & 0x10){	 CAN_RFR |= 0x10;		}		//Clear_the_FIFO_FOVR_bit
3876  0312 c65424        	ld	a,_CAN_RFR
3877  0315 a510          	bcp	a,#16
3878  0317 2708          	jreq	L5032
3881  0319 72185424      	bset	_CAN_RFR,#4
3883  031d acfe03fe      	jpf	L5132
3884  0321               L5032:
3885                     ; 387 	else if(CAN_RFR & 0x08){ CAN_RFR |= 0x08;	}		//Clear_the_FIFO_FULL_bit
3887  0321 c65424        	ld	a,_CAN_RFR
3888  0324 a508          	bcp	a,#8
3889  0326 2603          	jrne	L23
3890  0328 cc03fe        	jp	L5132
3891  032b               L23:
3894  032b 72165424      	bset	_CAN_RFR,#3
3895  032f acfe03fe      	jpf	L5132
3896  0333               L3132:
3897                     ; 392 		CAN_FPSR = 0x07;					//CAN_Receive_FIFO_Page_Select
3899  0333 35075427      	mov	_CAN_FPSR,#7
3900                     ; 393 		From_ID = CAN_P0;					//Read_to_Tx_Massage_ID
3902  0337 5554280000    	mov	L1622_From_ID,_CAN_P0
3903                     ; 394 CAN_RECV_ID = (U16)((U16)(CAN_P2 & 0x1F) << 6);
3905  033c c6542a        	ld	a,_CAN_P2
3906  033f a41f          	and	a,#31
3907  0341 5f            	clrw	x
3908  0342 97            	ld	xl,a
3909  0343 58            	sllw	x
3910  0344 58            	sllw	x
3911  0345 58            	sllw	x
3912  0346 58            	sllw	x
3913  0347 58            	sllw	x
3914  0348 58            	sllw	x
3915  0349 cf0000        	ldw	_CAN_RECV_ID,x
3916                     ; 395 CAN_RECV_ID |= (U16)((U16)(CAN_P3 >> 2) & 0x3F);
3918  034c c6542b        	ld	a,_CAN_P3
3919  034f 44            	srl	a
3920  0350 44            	srl	a
3921  0351 5f            	clrw	x
3922  0352 a43f          	and	a,#63
3923  0354 5f            	clrw	x
3924  0355 ca0001        	or	a,_CAN_RECV_ID+1
3925  0358 c70001        	ld	_CAN_RECV_ID+1,a
3926  035b 9f            	ld	a,xl
3927  035c ca0000        	or	a,_CAN_RECV_ID
3928  035f c70000        	ld	_CAN_RECV_ID,a
3929                     ; 396 if (CAN_RECV_ID==CAN_HTR_STATUS1_ID)
3931  0362 ce0000        	ldw	x,_CAN_RECV_ID
3932  0365 a30201        	cpw	x,#513
3933  0368 2606          	jrne	L1232
3934                     ; 397 From_ID=0;
3936  036a 725f0000      	clr	L1622_From_ID
3938  036e 202e          	jra	L3232
3939  0370               L1232:
3940                     ; 398 else if (CAN_RECV_ID==CAN_HTR_STATUS2_ID)
3942  0370 ce0000        	ldw	x,_CAN_RECV_ID
3943  0373 a30202        	cpw	x,#514
3944  0376 2606          	jrne	L5232
3945                     ; 399 From_ID=1;
3947  0378 35010000      	mov	L1622_From_ID,#1
3949  037c 2020          	jra	L3232
3950  037e               L5232:
3951                     ; 400 else if (CAN_RECV_ID==CAN_HTR_STATUS3_ID)
3953  037e ce0000        	ldw	x,_CAN_RECV_ID
3954  0381 a30203        	cpw	x,#515
3955  0384 2606          	jrne	L1332
3956                     ; 401 From_ID=2;
3958  0386 35020000      	mov	L1622_From_ID,#2
3960  038a 2012          	jra	L3232
3961  038c               L1332:
3962                     ; 402 else if (CAN_RECV_ID==CAN_HTR_STATUS4_ID)
3964  038c ce0000        	ldw	x,_CAN_RECV_ID
3965  038f a30204        	cpw	x,#516
3966  0392 2606          	jrne	L5332
3967                     ; 403 From_ID=3;
3969  0394 35030000      	mov	L1622_From_ID,#3
3971  0398 2004          	jra	L3232
3972  039a               L5332:
3973                     ; 404 else From_ID=0xffu;
3975  039a 35ff0000      	mov	L1622_From_ID,#255
3976  039e               L3232:
3977                     ; 406 		if(From_ID < CAN_MSG_ID_MAX)
3979  039e c60000        	ld	a,L1622_From_ID
3980  03a1 a104          	cp	a,#4
3981  03a3 244e          	jruge	L1532
3982                     ; 408 			for(Index = 0; Index < 8u; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
3984  03a5 0f01          	clr	(OFST+0,sp)
3986  03a7               L3432:
3987                     ; 409 				Can_Node[From_ID].Msg[Index] = *((&CAN_P6) + Index);
3989  03a7 c60000        	ld	a,L1622_From_ID
3990  03aa 97            	ld	xl,a
3991  03ab a60a          	ld	a,#10
3992  03ad 42            	mul	x,a
3993  03ae 01            	rrwa	x,a
3994  03af 1b01          	add	a,(OFST+0,sp)
3995  03b1 2401          	jrnc	L03
3996  03b3 5c            	incw	x
3997  03b4               L03:
3998  03b4 02            	rlwa	x,a
3999  03b5 7b01          	ld	a,(OFST+0,sp)
4000  03b7 905f          	clrw	y
4001  03b9 9097          	ld	yl,a
4002  03bb 90d6542e      	ld	a,(_CAN_P6,y)
4003  03bf d7000c        	ld	(_Can_Node+2,x),a
4004                     ; 408 			for(Index = 0; Index < 8u; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
4006  03c2 0c01          	inc	(OFST+0,sp)
4010  03c4 7b01          	ld	a,(OFST+0,sp)
4011  03c6 a108          	cp	a,#8
4012  03c8 25dd          	jrult	L3432
4013                     ; 413 			Can_Node[From_ID].Fail = OFF;		//Fail_Status_Clear
4015  03ca c60000        	ld	a,L1622_From_ID
4016  03cd 97            	ld	xl,a
4017  03ce a60a          	ld	a,#10
4018  03d0 42            	mul	x,a
4019  03d1 d6000a        	ld	a,(_Can_Node,x)
4020  03d4 a4fe          	and	a,#254
4021  03d6 d7000a        	ld	(_Can_Node,x),a
4022                     ; 414 			Can_Node[From_ID].Timeout = 0;		//Rx_Error_Counter_Clear
4024  03d9 c60000        	ld	a,L1622_From_ID
4025  03dc 97            	ld	xl,a
4026  03dd a60a          	ld	a,#10
4027  03df 42            	mul	x,a
4028  03e0 724f000b      	clr	(_Can_Node+1,x)
4029                     ; 415 			Can_Node[From_ID].Update = ON;		//New_Rx_Data
4031  03e4 c60000        	ld	a,L1622_From_ID
4032  03e7 97            	ld	xl,a
4033  03e8 a60a          	ld	a,#10
4034  03ea 42            	mul	x,a
4035  03eb d6000a        	ld	a,(_Can_Node,x)
4036  03ee aa02          	or	a,#2
4037  03f0 d7000a        	ld	(_Can_Node,x),a
4039  03f3               L1532:
4040                     ; 434 		CAN_RFR |= 0x20;					//Release_FIFO
4042  03f3 721a5424      	bset	_CAN_RFR,#5
4044  03f7               L5532:
4045                     ; 435 		while(CAN_RFR & 0x20);				//Release_Completed?
4047  03f7 c65424        	ld	a,_CAN_RFR
4048  03fa a520          	bcp	a,#32
4049  03fc 26f9          	jrne	L5532
4050  03fe               L5132:
4051                     ; 390 	while(CAN_RFR & 0x03)					//CAN_Received?
4053  03fe c65424        	ld	a,_CAN_RFR
4054  0401 a503          	bcp	a,#3
4055  0403 2703          	jreq	L43
4056  0405 cc0333        	jp	L3132
4057  0408               L43:
4058                     ; 438 	CAN_FPSR = Current_Page;
4060  0408 5500015427    	mov	_CAN_FPSR,L3622_Current_Page
4061                     ; 440 	CAN_Interrupt_Enable();
4063  040d cd0000        	call	_CAN_Interrupt_Enable
4065                     ; 441 	return;
4068  0410 84            	pop	a
4069  0411 85            	popw	x
4070  0412 bf00          	ldw	c_y,x
4071  0414 320002        	pop	c_y+2
4072  0417 85            	popw	x
4073  0418 bf00          	ldw	c_x,x
4074  041a 320002        	pop	c_x+2
4075  041d 80            	iret
4102                     ; 445 @interrupt void CAN_Tx_Interrupt(void)
4102                     ; 446 {
4103                     	switch	.text
4104  041e               _CAN_Tx_Interrupt:
4108                     ; 448 	if(CAN_MSR & 0x08){ CAN_MSR |= 0x08;		}		//Clear_Wakeup_Flag
4110  041e c65421        	ld	a,_CAN_MSR
4111  0421 a508          	bcp	a,#8
4112  0423 2704          	jreq	L1732
4115  0425 72165421      	bset	_CAN_MSR,#3
4116  0429               L1732:
4117                     ; 451 	if(CAN_MSR & 0x04)
4119  0429 c65421        	ld	a,_CAN_MSR
4120  042c a504          	bcp	a,#4
4121  042e 270c          	jreq	L3732
4122                     ; 453 		CAN_MSR |= 0x04;					//Clear_Error_Flag
4124  0430 72145421      	bset	_CAN_MSR,#2
4125                     ; 454 		b_Can_Tx_Error = ON;				//CAN_Tx_Error_Flag = ON
4127  0434 72160000      	bset	_uc_Can_Status_Reg,#3
4128                     ; 455 		uc_Can_Operation_Flow = 2;				//Recover_Mode
4130  0438 35020001      	mov	_uc_Can_Operation_Flow,#2
4131  043c               L3732:
4132                     ; 459 	if(CAN_TSR & 0x01)
4134  043c c65422        	ld	a,_CAN_TSR
4135  043f a501          	bcp	a,#1
4136  0441 270f          	jreq	L5732
4137                     ; 462 		if(CAN_TSR & 0x10){
4139  0443 c65422        	ld	a,_CAN_TSR
4140  0446 a510          	bcp	a,#16
4141  0448 2704          	jreq	L7732
4142                     ; 463 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4144  044a 35030001      	mov	_uc_Can_Operation_Flow,#3
4145  044e               L7732:
4146                     ; 466 		CAN_TSR |= 0x01;					//Clear_Interrupt_Flag
4148  044e 72105422      	bset	_CAN_TSR,#0
4149  0452               L5732:
4150                     ; 470 	if(CAN_TSR & 0x02)
4152  0452 c65422        	ld	a,_CAN_TSR
4153  0455 a502          	bcp	a,#2
4154  0457 270f          	jreq	L1042
4155                     ; 473 		if(CAN_TSR & 0x20){
4157  0459 c65422        	ld	a,_CAN_TSR
4158  045c a520          	bcp	a,#32
4159  045e 2704          	jreq	L3042
4160                     ; 474 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4162  0460 35030001      	mov	_uc_Can_Operation_Flow,#3
4163  0464               L3042:
4164                     ; 477 		CAN_TSR |= 0x02;					//Clear_Interrupt_Flag
4166  0464 72125422      	bset	_CAN_TSR,#1
4167  0468               L1042:
4168                     ; 481 	if(CAN_TSR & 0x04)
4170  0468 c65422        	ld	a,_CAN_TSR
4171  046b a504          	bcp	a,#4
4172  046d 270f          	jreq	L5042
4173                     ; 484 		if(CAN_TSR & 0x40){
4175  046f c65422        	ld	a,_CAN_TSR
4176  0472 a540          	bcp	a,#64
4177  0474 2704          	jreq	L7042
4178                     ; 485 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4180  0476 35030001      	mov	_uc_Can_Operation_Flow,#3
4181  047a               L7042:
4182                     ; 488 		CAN_TSR |= 0x04;					//Clear_Interrupt_Flag
4184  047a 72145422      	bset	_CAN_TSR,#2
4185  047e               L5042:
4186                     ; 490 	return;
4189  047e 80            	iret
4361                     	xdef	_CAN_Tx_Interrupt
4362                     	xdef	_CAN_Rx_Interrupt
4363                     	xdef	_CAN_Normal_Message_Handling
4364                     	xdef	_CAN_Normal_Maessge_Transmit
4365                     	xdef	_CAN_Tx_Message_Now
4366                     	xdef	_CAN_Timing_Control
4367                     	xdef	_CAN_Fail_Handling
4368                     	switch	.ubsct
4369  0000               _uc_Can_Status_Reg:
4370  0000 00            	ds.b	1
4371                     	xdef	_uc_Can_Status_Reg
4372  0001               _uc_Can_Operation_Flow:
4373  0001 00            	ds.b	1
4374                     	xdef	_uc_Can_Operation_Flow
4375  0002               _uc_Can_Event_Counter:
4376  0002 00            	ds.b	1
4377                     	xdef	_uc_Can_Event_Counter
4378  0003               _uc_Can_Event_Time:
4379  0003 00            	ds.b	1
4380                     	xdef	_uc_Can_Event_Time
4381  0004               _uc_Can_Init_Delay:
4382  0004 00            	ds.b	1
4383                     	xdef	_uc_Can_Init_Delay
4384                     	switch	.bss
4385  0002               _Can_Tx_Buffer:
4386  0002 000000000000  	ds.b	8
4387                     	xdef	_Can_Tx_Buffer
4388                     	xdef	_Can_Msg_Length
4389                     	xdef	_Can_Fail_Time
4390  000a               _Can_Node:
4391  000a 000000000000  	ds.b	40
4392                     	xdef	_Can_Node
4393                     	xdef	_HEATER_zone_status
4394                     	xdef	_CAN_test_data
4395                     	xdef	_CAN_RECV_ID
4396                     	xdef	_Reset_Can_Function
4397                     	xdef	_CAN_Management_Function
4398                     	xdef	_CAN_Bus_Off_Handling
4399                     	xref	_uc_Rx_Data
4400                     	xref	_uc_Heater_Enable_Flag
4401                     	xref	_uc_Target_Duty_Perc
4402                     	xref	_uc_Rx_TimeOut_Reg
4403                     	xref	_CAN_Wait_Tx_Message
4404                     	xref	_CAN_Transmit_Cancel
4405                     	xref	_CAN_Disable
4406                     	xref	_CAN_Enable
4407                     	xref	_CAN_Interrupt_Enable
4408                     	xref	_CAN_Interrupt_Disable
4409                     	xref	_Windows_Watchdog_Clear
4410                     	xref	_uc_System_Ctrl_Reg
4411                     	xref.b	c_x
4412                     	xref.b	c_y
4432                     	end

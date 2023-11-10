   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
2655                     .const:	section	.text
2656  0000               _Can_Fail_Time:
2657  0000 32            	dc.b	50
2658  0001 32            	dc.b	50
2659  0002 32            	dc.b	50
2660  0003 32            	dc.b	50
2661  0004               _Can_Msg_Length:
2662  0004 08            	dc.b	8
2663  0005 08            	dc.b	8
2664  0006 08            	dc.b	8
2665  0007 08            	dc.b	8
2666                     	switch	.data
2667  0000               _CAN_RECV_ID:
2668  0000 0000          	dc.w	0
2669  0002               _CAN_test_data:
2670  0002 00            	dc.b	0
2671  0003 000000        	ds.b	3
2672  0006               _HEATER_zone_status:
2673  0006 00            	dc.b	0
2705                     ; 76 void CAN_Tx_Message_Now(void)
2705                     ; 77 {
2707                     	switch	.text
2708  0000               _CAN_Tx_Message_Now:
2712                     ; 78 	b_Can_Tx_Event = ON;
2714  0000 72180000      	bset	_uc_Can_Status_Reg,#4
2715                     ; 79 	uc_Can_Event_Counter = 0;
2717  0004 3f02          	clr	_uc_Can_Event_Counter
2718                     ; 80 	uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
2720  0006 35020003      	mov	_uc_Can_Event_Time,#2
2721                     ; 82 	return;
2724  000a 81            	ret
2761                     ; 87 void CAN_Normal_Message_Handling(void)
2761                     ; 88 {
2762                     	switch	.text
2763  000b               _CAN_Normal_Message_Handling:
2765  000b 88            	push	a
2766       00000001      OFST:	set	1
2769                     ; 91 	if(Can_Node[HTR_STATUS1].Fail){ b_Rx1_Msg_TimeOut_Flag = ON; }
2771  000c c6000a        	ld	a,_Can_Node
2772  000f a501          	bcp	a,#1
2773  0011 2706          	jreq	L5371
2776  0013 72100000      	bset	_uc_Rx_TimeOut_Reg,#0
2778  0017 2027          	jra	L7371
2779  0019               L5371:
2780                     ; 92 	else if(Can_Node[HTR_STATUS1].Update)
2782  0019 c6000a        	ld	a,_Can_Node
2783  001c a502          	bcp	a,#2
2784  001e 2720          	jreq	L7371
2785                     ; 94 CAN_test_data[0]++;
2787  0020 725c0002      	inc	_CAN_test_data
2788                     ; 95 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS1][uc_index] = Can_Node[HTR_STATUS1].Msg[uc_index];  }
2790  0024 0f01          	clr	(OFST+0,sp)
2791  0026               L3471:
2794  0026 7b01          	ld	a,(OFST+0,sp)
2795  0028 5f            	clrw	x
2796  0029 97            	ld	xl,a
2797  002a d6000c        	ld	a,(_Can_Node+2,x)
2798  002d d70000        	ld	(_uc_Rx_Data,x),a
2801  0030 0c01          	inc	(OFST+0,sp)
2804  0032 7b01          	ld	a,(OFST+0,sp)
2805  0034 a108          	cp	a,#8
2806  0036 25ee          	jrult	L3471
2807                     ; 96 		b_Rx1_Msg_TimeOut_Flag = OFF;	
2809  0038 72110000      	bres	_uc_Rx_TimeOut_Reg,#0
2810                     ; 97 		Can_Node[HTR_STATUS1].Update = OFF;			//Data_Read_Panding
2812  003c 7213000a      	bres	_Can_Node,#1
2813  0040               L7371:
2814                     ; 100 	if(Can_Node[HTR_STATUS2].Fail){ b_Rx2_Msg_TimeOut_Flag = ON; }
2816  0040 c60014        	ld	a,_Can_Node+10
2817  0043 a501          	bcp	a,#1
2818  0045 2706          	jreq	L1571
2821  0047 72120000      	bset	_uc_Rx_TimeOut_Reg,#1
2823  004b 2027          	jra	L3571
2824  004d               L1571:
2825                     ; 101 	else if(Can_Node[HTR_STATUS2].Update)
2827  004d c60014        	ld	a,_Can_Node+10
2828  0050 a502          	bcp	a,#2
2829  0052 2720          	jreq	L3571
2830                     ; 103 CAN_test_data[1]++;
2832  0054 725c0003      	inc	_CAN_test_data+1
2833                     ; 104 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS2][uc_index] = Can_Node[HTR_STATUS2].Msg[uc_index];  }
2835  0058 0f01          	clr	(OFST+0,sp)
2836  005a               L7571:
2839  005a 7b01          	ld	a,(OFST+0,sp)
2840  005c 5f            	clrw	x
2841  005d 97            	ld	xl,a
2842  005e d60016        	ld	a,(_Can_Node+12,x)
2843  0061 d70008        	ld	(_uc_Rx_Data+8,x),a
2846  0064 0c01          	inc	(OFST+0,sp)
2849  0066 7b01          	ld	a,(OFST+0,sp)
2850  0068 a108          	cp	a,#8
2851  006a 25ee          	jrult	L7571
2852                     ; 105 		b_Rx2_Msg_TimeOut_Flag = OFF;
2854  006c 72130000      	bres	_uc_Rx_TimeOut_Reg,#1
2855                     ; 106 		Can_Node[HTR_STATUS2].Update = OFF;			//Data_Read_Panding
2857  0070 72130014      	bres	_Can_Node+10,#1
2858  0074               L3571:
2859                     ; 109 	if(Can_Node[HTR_STATUS3].Fail){ b_Rx3_Msg_TimeOut_Flag = ON; }
2861  0074 c6001e        	ld	a,_Can_Node+20
2862  0077 a501          	bcp	a,#1
2863  0079 2706          	jreq	L5671
2866  007b 72140000      	bset	_uc_Rx_TimeOut_Reg,#2
2868  007f 2027          	jra	L7671
2869  0081               L5671:
2870                     ; 110 	else if(Can_Node[HTR_STATUS3].Update)
2872  0081 c6001e        	ld	a,_Can_Node+20
2873  0084 a502          	bcp	a,#2
2874  0086 2720          	jreq	L7671
2875                     ; 112 CAN_test_data[2]++;
2877  0088 725c0004      	inc	_CAN_test_data+2
2878                     ; 113 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS3][uc_index] = Can_Node[HTR_STATUS3].Msg[uc_index];  }
2880  008c 0f01          	clr	(OFST+0,sp)
2881  008e               L3771:
2884  008e 7b01          	ld	a,(OFST+0,sp)
2885  0090 5f            	clrw	x
2886  0091 97            	ld	xl,a
2887  0092 d60020        	ld	a,(_Can_Node+22,x)
2888  0095 d70010        	ld	(_uc_Rx_Data+16,x),a
2891  0098 0c01          	inc	(OFST+0,sp)
2894  009a 7b01          	ld	a,(OFST+0,sp)
2895  009c a108          	cp	a,#8
2896  009e 25ee          	jrult	L3771
2897                     ; 114 		b_Rx3_Msg_TimeOut_Flag = OFF;	
2899  00a0 72150000      	bres	_uc_Rx_TimeOut_Reg,#2
2900                     ; 115 		Can_Node[HTR_STATUS3].Update = OFF;			//Data_Read_Panding
2902  00a4 7213001e      	bres	_Can_Node+20,#1
2903  00a8               L7671:
2904                     ; 118 	if(Can_Node[HTR_STATUS4].Fail){ b_Rx4_Msg_TimeOut_Flag = ON; }
2906  00a8 c60028        	ld	a,_Can_Node+30
2907  00ab a501          	bcp	a,#1
2908  00ad 2706          	jreq	L1002
2911  00af 72160000      	bset	_uc_Rx_TimeOut_Reg,#3
2913  00b3 2027          	jra	L3002
2914  00b5               L1002:
2915                     ; 119 	else if(Can_Node[HTR_STATUS4].Update)
2917  00b5 c60028        	ld	a,_Can_Node+30
2918  00b8 a502          	bcp	a,#2
2919  00ba 2720          	jreq	L3002
2920                     ; 121 CAN_test_data[3]++;
2922  00bc 725c0005      	inc	_CAN_test_data+3
2923                     ; 122 		for(uc_index = (U8)(0); uc_index < (U8)(8); uc_index++){ uc_Rx_Data[HTR_STATUS4][uc_index] = Can_Node[HTR_STATUS4].Msg[uc_index];  }
2925  00c0 0f01          	clr	(OFST+0,sp)
2926  00c2               L7002:
2929  00c2 7b01          	ld	a,(OFST+0,sp)
2930  00c4 5f            	clrw	x
2931  00c5 97            	ld	xl,a
2932  00c6 d6002a        	ld	a,(_Can_Node+32,x)
2933  00c9 d70018        	ld	(_uc_Rx_Data+24,x),a
2936  00cc 0c01          	inc	(OFST+0,sp)
2939  00ce 7b01          	ld	a,(OFST+0,sp)
2940  00d0 a108          	cp	a,#8
2941  00d2 25ee          	jrult	L7002
2942                     ; 123 		b_Rx4_Msg_TimeOut_Flag = OFF;
2944  00d4 72170000      	bres	_uc_Rx_TimeOut_Reg,#3
2945                     ; 124 		Can_Node[HTR_STATUS4].Update = OFF;			//Data_Read_Panding
2947  00d8 72130028      	bres	_Can_Node+30,#1
2948  00dc               L3002:
2949                     ; 126 	return;
2952  00dc 84            	pop	a
2953  00dd 81            	ret
2987                     ; 130 void CAN_Fail_Handling(void)
2987                     ; 131 {
2988                     	switch	.text
2989  00de               _CAN_Fail_Handling:
2991  00de 88            	push	a
2992       00000001      OFST:	set	1
2995                     ; 135 	if(b_Can_Error_Pending == OFF)
2997  00df b600          	ld	a,_uc_Can_Status_Reg
2998  00e1 a520          	bcp	a,#32
2999  00e3 2634          	jrne	L1302
3000                     ; 138 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
3002  00e5 0f01          	clr	(OFST+0,sp)
3003  00e7               L3302:
3004                     ; 140 			Can_Node[Index].Fail = ON;		//Node_Fail
3006  00e7 7b01          	ld	a,(OFST+0,sp)
3007  00e9 97            	ld	xl,a
3008  00ea a60a          	ld	a,#10
3009  00ec 42            	mul	x,a
3010  00ed d6000a        	ld	a,(_Can_Node,x)
3011  00f0 aa01          	or	a,#1
3012  00f2 d7000a        	ld	(_Can_Node,x),a
3013                     ; 141 			Can_Node[Index].Update = OFF;	//Msg_Pending
3015  00f5 7b01          	ld	a,(OFST+0,sp)
3016  00f7 97            	ld	xl,a
3017  00f8 a60a          	ld	a,#10
3018  00fa 42            	mul	x,a
3019  00fb d6000a        	ld	a,(_Can_Node,x)
3020  00fe a4fd          	and	a,#253
3021  0100 d7000a        	ld	(_Can_Node,x),a
3022                     ; 142 			Can_Node[Index].Timeout = 0;	//Msg_Timer_Reset
3024  0103 7b01          	ld	a,(OFST+0,sp)
3025  0105 97            	ld	xl,a
3026  0106 a60a          	ld	a,#10
3027  0108 42            	mul	x,a
3028  0109 724f000b      	clr	(_Can_Node+1,x)
3029                     ; 138 		for(Index = 0; Index < CAN_MSG_ID_MAX; Index++)
3031  010d 0c01          	inc	(OFST+0,sp)
3034  010f 7b01          	ld	a,(OFST+0,sp)
3035  0111 a104          	cp	a,#4
3036  0113 25d2          	jrult	L3302
3037                     ; 145 		b_Can_Error_Pending = ON;
3039  0115 721a0000      	bset	_uc_Can_Status_Reg,#5
3040  0119               L1302:
3041                     ; 147 	return;
3044  0119 84            	pop	a
3045  011a 81            	ret
3048                     	switch	.data
3049  0007               L1402_testCnt:
3050  0007 00            	dc.b	0
3107                     ; 151 void CAN_Normal_Maessge_Transmit(void)
3107                     ; 152 {
3108                     	switch	.text
3109  011b               _CAN_Normal_Maessge_Transmit:
3111  011b 88            	push	a
3112       00000001      OFST:	set	1
3115                     ; 157 	if(b_Can_Tx_Event == OFF){ return;		}	//Wait_Normal_Message_Period
3117  011c b600          	ld	a,_uc_Can_Status_Reg
3118  011e a510          	bcp	a,#16
3119  0120 2602          	jrne	L3602
3123  0122 84            	pop	a
3124  0123 81            	ret
3125  0124               L3602:
3126                     ; 158 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
3128  0124 c65423        	ld	a,_CAN_TPR
3129  0127 a510          	bcp	a,#16
3130  0129 2706          	jreq	L7602
3133  012b 35055427      	mov	_CAN_FPSR,#5
3135  012f 2018          	jra	L5602
3136  0131               L7602:
3137                     ; 159 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
3139  0131 c65423        	ld	a,_CAN_TPR
3140  0134 a508          	bcp	a,#8
3141  0136 2706          	jreq	L3702
3144  0138 35015427      	mov	_CAN_FPSR,#1
3146  013c 200b          	jra	L5602
3147  013e               L3702:
3148                     ; 160 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
3150  013e c65423        	ld	a,_CAN_TPR
3151  0141 a504          	bcp	a,#4
3152  0143 2752          	jreq	L7702
3155  0145 725f5427      	clr	_CAN_FPSR
3157  0149               L5602:
3158                     ; 164 	CAN_P2 = (U8)((CAN_HTR_CTRL_ID >> 6) & 0x1F);	//Tx_HAVC_ID_MSB
3160  0149 3508542a      	mov	_CAN_P2,#8
3161                     ; 165 	_asm("nop");					//STM8A_CAN_Bug_Happy
3164  014d 9d            nop
3166                     ; 166 	CAN_P3 = (U8)((CAN_HTR_CTRL_ID << 2) & 0xFC);	//Tx_HAVC_ID_LSB
3168  014e 725f542b      	clr	_CAN_P3
3169                     ; 167 	_asm("nop");					//STM8A_CAN_Bug_Happy
3172  0152 9d            nop
3174                     ; 170 	for(uc_index = 0; uc_index < (U8)(8); uc_index++){ Can_Tx_Buffer[uc_index] = (U8)(0); }
3176  0153 0f01          	clr	(OFST+0,sp)
3177  0155               L3012:
3180  0155 7b01          	ld	a,(OFST+0,sp)
3181  0157 5f            	clrw	x
3182  0158 97            	ld	xl,a
3183  0159 724f0002      	clr	(_Can_Tx_Buffer,x)
3186  015d 0c01          	inc	(OFST+0,sp)
3189  015f 7b01          	ld	a,(OFST+0,sp)
3190  0161 a108          	cp	a,#8
3191  0163 25f0          	jrult	L3012
3192                     ; 179 	Can_Tx_Buffer[0] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_1]);
3194  0165 5500000002    	mov	_Can_Tx_Buffer,_uc_Target_Duty_Perc
3195                     ; 180 	Can_Tx_Buffer[1] = (U8)(uc_Target_Duty_Perc[HTR_ZONE_2]);
3197  016a 5500010003    	mov	_Can_Tx_Buffer+1,_uc_Target_Duty_Perc+1
3198                     ; 181 	Can_Tx_Buffer[2] = (U8)(uc_Heater_Enable_Flag);
3200  016f 5500000004    	mov	_Can_Tx_Buffer+2,_uc_Heater_Enable_Flag
3201                     ; 188 	for(Offset = 0; Offset < 8; Offset++)	// Tx_Message_Length : 7Bytes
3203  0174 0f01          	clr	(OFST+0,sp)
3204  0176               L1112:
3205                     ; 190 		(&CAN_P6)[Offset] = Can_Tx_Buffer[Offset];	//MDARx(Mailbox_Data_Register_x)
3207  0176 7b01          	ld	a,(OFST+0,sp)
3208  0178 5f            	clrw	x
3209  0179 97            	ld	xl,a
3210  017a d60002        	ld	a,(_Can_Tx_Buffer,x)
3211  017d d7542e        	ld	(_CAN_P6,x),a
3212                     ; 188 	for(Offset = 0; Offset < 8; Offset++)	// Tx_Message_Length : 7Bytes
3214  0180 0c01          	inc	(OFST+0,sp)
3217  0182 7b01          	ld	a,(OFST+0,sp)
3218  0184 a108          	cp	a,#8
3219  0186 25ee          	jrult	L1112
3220                     ; 193 	CAN_P1 = 0x08;				//Tx_Data_Length
3222  0188 35085429      	mov	_CAN_P1,#8
3223                     ; 194 	_asm("nop");					//STM8A_CAN_Bug_Happy
3226  018c 9d            nop
3228                     ; 195 	CAN_P0 |= 0x01;				//Transmit_Request
3230  018d 72105428      	bset	_CAN_P0,#0
3231                     ; 196 	b_Can_Tx_Event = OFF;		//Next_Message_Transmit_Periode
3233  0191 72190000      	bres	_uc_Can_Status_Reg,#4
3234                     ; 198 	return;
3237  0195 84            	pop	a
3238  0196 81            	ret
3239  0197               L7702:
3240                     ; 161 	else{	return;			      	}	//Mailbox_All_Busy
3243  0197 84            	pop	a
3244  0198 81            	ret
3275                     ; 203 void CAN_Bus_Off_Handling(void)
3275                     ; 204 {
3276                     	switch	.text
3277  0199               _CAN_Bus_Off_Handling:
3281                     ; 205 	if(uc_Can_Operation_Flow){
3283  0199 3d01          	tnz	_uc_Can_Operation_Flow
3284  019b 2727          	jreq	L7212
3285                     ; 206 		Windows_Watchdog_Clear();
3287  019d cd0000        	call	_Windows_Watchdog_Clear
3289                     ; 209 		if(uc_Can_Operation_Flow == 2)
3291  01a0 b601          	ld	a,_uc_Can_Operation_Flow
3292  01a2 a102          	cp	a,#2
3293  01a4 260b          	jrne	L1312
3294                     ; 211 			CAN_Interrupt_Disable();
3296  01a6 cd0000        	call	_CAN_Interrupt_Disable
3298                     ; 212 			CAN_Transmit_Cancel();
3300  01a9 cd0000        	call	_CAN_Transmit_Cancel
3302                     ; 213 			CAN_Disable();
3304  01ac cd0000        	call	_CAN_Disable
3307  01af 200f          	jra	L3312
3308  01b1               L1312:
3309                     ; 217 		else if(uc_Can_Operation_Flow == 3)
3311  01b1 b601          	ld	a,_uc_Can_Operation_Flow
3312  01b3 a103          	cp	a,#3
3313  01b5 2609          	jrne	L3312
3314                     ; 219 			CAN_Wait_Tx_Message();
3316  01b7 cd0000        	call	_CAN_Wait_Tx_Message
3318                     ; 220 			CAN_Disable();
3320  01ba cd0000        	call	_CAN_Disable
3322                     ; 221 			CAN_Interrupt_Disable();
3324  01bd cd0000        	call	_CAN_Interrupt_Disable
3326  01c0               L3312:
3327                     ; 224 		uc_Can_Status_Reg = 0;
3329  01c0 3f00          	clr	_uc_Can_Status_Reg
3330                     ; 225 		uc_Can_Operation_Flow = 0;
3332  01c2 3f01          	clr	_uc_Can_Operation_Flow
3333  01c4               L7212:
3334                     ; 227 	return;
3337  01c4 81            	ret
3377                     ; 231 void CAN_Timing_Control(void)
3377                     ; 232 {
3378                     	switch	.text
3379  01c5               _CAN_Timing_Control:
3381  01c5 89            	pushw	x
3382       00000002      OFST:	set	2
3385                     ; 236 	if(b_Can_10ms_Periode == OFF){	return;	}
3387  01c6 c60000        	ld	a,_uc_System_Ctrl_Reg
3388  01c9 a504          	bcp	a,#4
3389  01cb 2603cc0254    	jreq	L02
3392                     ; 239 	b_Can_10ms_Periode = OFF;
3394  01d0 72150000      	bres	_uc_System_Ctrl_Reg,#2
3395                     ; 243 	if(b_Can_TInitialize == OFF)
3397  01d4 b600          	ld	a,_uc_Can_Status_Reg
3398  01d6 a502          	bcp	a,#2
3399  01d8 260e          	jrne	L5512
3400                     ; 245 		if(++uc_Can_Init_Delay >= 13){		//Ignd_On_130ms_Delay
3402  01da 3c04          	inc	_uc_Can_Init_Delay
3403  01dc b604          	ld	a,_uc_Can_Init_Delay
3404  01de a10d          	cp	a,#13
3405  01e0 2572          	jrult	L1612
3406                     ; 246 			b_Can_TInitialize = ON;
3408  01e2 72120000      	bset	_uc_Can_Status_Reg,#1
3409  01e6 206c          	jra	L1612
3410  01e8               L5512:
3411                     ; 251 	else if(b_Can_TMsg_Start == OFF)
3413  01e8 b600          	ld	a,_uc_Can_Status_Reg
3414  01ea a504          	bcp	a,#4
3415  01ec 2613          	jrne	L3612
3416                     ; 253 		if(++uc_Can_Init_Delay >= 30){		//Ign1_On_300ms_Delay
3418  01ee 3c04          	inc	_uc_Can_Init_Delay
3419  01f0 b604          	ld	a,_uc_Can_Init_Delay
3420  01f2 a11e          	cp	a,#30
3421  01f4 255e          	jrult	L1612
3422                     ; 254 			uc_Can_Init_Delay = 0;
3424  01f6 3f04          	clr	_uc_Can_Init_Delay
3425                     ; 255 			b_Can_TMsg_Start = ON;
3427  01f8 72140000      	bset	_uc_Can_Status_Reg,#2
3428                     ; 258 			CAN_Tx_Message_Now();
3430  01fc cd0000        	call	_CAN_Tx_Message_Now
3432  01ff 2053          	jra	L1612
3433  0201               L3612:
3434                     ; 264 		if(b_Can_Tx_Event == OFF){
3436  0201 b600          	ld	a,_uc_Can_Status_Reg
3437  0203 a510          	bcp	a,#16
3438  0205 260e          	jrne	L1712
3439                     ; 265 			if(++uc_Can_Event_Counter >= uc_Can_Event_Time){
3441  0207 3c02          	inc	_uc_Can_Event_Counter
3442  0209 b602          	ld	a,_uc_Can_Event_Counter
3443  020b b103          	cp	a,_uc_Can_Event_Time
3444  020d 2506          	jrult	L1712
3445                     ; 266 				uc_Can_Event_Counter = 0;
3447  020f 3f02          	clr	_uc_Can_Event_Counter
3448                     ; 267 				b_Can_Tx_Event = ON;
3450  0211 72180000      	bset	_uc_Can_Status_Reg,#4
3451  0215               L1712:
3452                     ; 272 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
3454  0215 0f02          	clr	(OFST+0,sp)
3455  0217               L5712:
3456                     ; 273 			if(Can_Node[ID].Fail == OFF){
3458  0217 7b02          	ld	a,(OFST+0,sp)
3459  0219 97            	ld	xl,a
3460  021a a60a          	ld	a,#10
3461  021c 42            	mul	x,a
3462  021d d6000a        	ld	a,(_Can_Node,x)
3463  0220 a501          	bcp	a,#1
3464  0222 2628          	jrne	L3022
3465                     ; 274 				if(++Can_Node[ID].Timeout > Can_Fail_Time[ID]){
3467  0224 7b02          	ld	a,(OFST+0,sp)
3468  0226 5f            	clrw	x
3469  0227 97            	ld	xl,a
3470  0228 d60000        	ld	a,(_Can_Fail_Time,x)
3471  022b 6b01          	ld	(OFST-1,sp),a
3472  022d 7b02          	ld	a,(OFST+0,sp)
3473  022f 97            	ld	xl,a
3474  0230 a60a          	ld	a,#10
3475  0232 42            	mul	x,a
3476  0233 724c000b      	inc	(_Can_Node+1,x)
3477  0237 d6000b        	ld	a,(_Can_Node+1,x)
3478  023a 1101          	cp	a,(OFST-1,sp)
3479  023c 230e          	jrule	L3022
3480                     ; 275 					Can_Node[ID].Fail = ON;
3482  023e 7b02          	ld	a,(OFST+0,sp)
3483  0240 97            	ld	xl,a
3484  0241 a60a          	ld	a,#10
3485  0243 42            	mul	x,a
3486  0244 d6000a        	ld	a,(_Can_Node,x)
3487  0247 aa01          	or	a,#1
3488  0249 d7000a        	ld	(_Can_Node,x),a
3489  024c               L3022:
3490                     ; 272 		for(ID = 0; ID < CAN_MSG_ID_MAX; ID++)	{
3492  024c 0c02          	inc	(OFST+0,sp)
3495  024e 7b02          	ld	a,(OFST+0,sp)
3496  0250 a104          	cp	a,#4
3497  0252 25c3          	jrult	L5712
3498  0254               L1612:
3499                     ; 281 	return;
3500  0254               L02:
3503  0254 85            	popw	x
3504  0255 81            	ret
3544                     ; 285 void CAN_Management_Function(void)
3544                     ; 286 {
3545                     	switch	.text
3546  0256               _CAN_Management_Function:
3550                     ; 288 	CAN_Timing_Control();
3552  0256 cd01c5        	call	_CAN_Timing_Control
3554                     ; 291 	switch(uc_Can_Operation_Flow)
3556  0259 b601          	ld	a,_uc_Can_Operation_Flow
3558                     ; 353 			break;
3559  025b 4d            	tnz	a
3560  025c 270e          	jreq	L7022
3561  025e 4a            	dec	a
3562  025f 271b          	jreq	L1122
3563  0261 4a            	dec	a
3564  0262 2730          	jreq	L3122
3565  0264 4a            	dec	a
3566  0265 276a          	jreq	L5122
3567  0267               L7122:
3568                     ; 352 		default :	uc_Can_Operation_Flow = 0;
3570  0267 3f01          	clr	_uc_Can_Operation_Flow
3571                     ; 353 			break;
3573  0269 cc02eb        	jra	L3322
3574  026c               L7022:
3575                     ; 294 		case 0 :	uc_Can_Init_Delay = 0;
3577  026c 3f04          	clr	_uc_Can_Init_Delay
3578                     ; 295 			uc_Can_Status_Reg = 0;			//CAN_Control = Reset
3580  026e 3f00          	clr	_uc_Can_Status_Reg
3581                     ; 296 			uc_Can_Event_Time = HTR_CTRL_MSG_PERIODE;
3583  0270 35020003      	mov	_uc_Can_Event_Time,#2
3584                     ; 297 			uc_Can_Event_Counter = 0;			//Tx_Counter_Clear
3586  0274 3f02          	clr	_uc_Can_Event_Counter
3587                     ; 298 			uc_Can_Operation_Flow = 1;
3589  0276 35010001      	mov	_uc_Can_Operation_Flow,#1
3590                     ; 299 			break;
3592  027a 206f          	jra	L3322
3593  027c               L1122:
3594                     ; 302 		case 1 :	if(b_Can_TInitialize == ON){			//130ms_Delay_After_Ign_On
3596  027c b600          	ld	a,_uc_Can_Status_Reg
3597  027e a502          	bcp	a,#2
3598  0280 2769          	jreq	L3322
3599                     ; 303 				Windows_Watchdog_Clear();
3601  0282 cd0000        	call	_Windows_Watchdog_Clear
3603                     ; 304 				CAN_Interrupt_Disable();
3605  0285 cd0000        	call	_CAN_Interrupt_Disable
3607                     ; 305 				CAN_Enable();
3609  0288 cd0000        	call	_CAN_Enable
3611                     ; 306 				CAN_Interrupt_Enable();
3613  028b cd0000        	call	_CAN_Interrupt_Enable
3615                     ; 307 				uc_Can_Operation_Flow = 3;		//CAN_Operation
3617  028e 35030001      	mov	_uc_Can_Operation_Flow,#3
3618  0292 2057          	jra	L3322
3619  0294               L3122:
3620                     ; 312 		case 2 :	if(b_Can_Tx_Error == ON){			//Recovery_Attempt_Completed
3622  0294 b600          	ld	a,_uc_Can_Status_Reg
3623  0296 a508          	bcp	a,#8
3624  0298 271d          	jreq	L7322
3625                     ; 313 				CAN_Interrupt_Disable();
3627  029a cd0000        	call	_CAN_Interrupt_Disable
3629                     ; 314 				CAN_Transmit_Cancel();
3631  029d cd0000        	call	_CAN_Transmit_Cancel
3633                     ; 315 				uc_Can_Event_Time = CAN_RECOVERY_TIME;
3635  02a0 35080003      	mov	_uc_Can_Event_Time,#8
3636                     ; 316 				uc_Can_Event_Counter = 0;		//Tx_Counter Clear
3638  02a4 3f02          	clr	_uc_Can_Event_Counter
3639                     ; 317 				b_Can_Bus_Off_Fail = ON;		//CAN_Bus = OFF
3641  02a6 72100000      	bset	_uc_Can_Status_Reg,#0
3642                     ; 318 				b_Can_Error_Pending = OFF;
3644  02aa 721b0000      	bres	_uc_Can_Status_Reg,#5
3645                     ; 319 				b_Can_Tx_Error = OFF;
3647  02ae 72170000      	bres	_uc_Can_Status_Reg,#3
3648                     ; 320 				CAN_Interrupt_Enable();
3650  02b2 cd0000        	call	_CAN_Interrupt_Enable
3653  02b5 2015          	jra	L1422
3654  02b7               L7322:
3655                     ; 324 			else if(b_Can_Tx_Event == ON){		//Set Flag from Timer_Interrupt
3657  02b7 b600          	ld	a,_uc_Can_Status_Reg
3658  02b9 a510          	bcp	a,#16
3659  02bb 270f          	jreq	L1422
3660                     ; 325 				Windows_Watchdog_Clear();
3662  02bd cd0000        	call	_Windows_Watchdog_Clear
3664                     ; 326 				CAN_Interrupt_Disable();
3666  02c0 cd0000        	call	_CAN_Interrupt_Disable
3668                     ; 327 				CAN_Enable();
3670  02c3 cd0000        	call	_CAN_Enable
3672                     ; 328 				CAN_Interrupt_Enable();
3674  02c6 cd0000        	call	_CAN_Interrupt_Enable
3676                     ; 329 				CAN_Normal_Maessge_Transmit();
3678  02c9 cd011b        	call	_CAN_Normal_Maessge_Transmit
3680  02cc               L1422:
3681                     ; 332 			CAN_Fail_Handling();
3683  02cc cd00de        	call	_CAN_Fail_Handling
3685                     ; 333 			break;
3687  02cf 201a          	jra	L3322
3688  02d1               L5122:
3689                     ; 336 		case 3 :	//CAN_Bus_Off¡æNormal
3689                     ; 337 			if(b_Can_Bus_Off_Fail == ON){
3691  02d1 b600          	ld	a,_uc_Can_Status_Reg
3692  02d3 a501          	bcp	a,#1
3693  02d5 2707          	jreq	L5422
3694                     ; 338 				b_Can_Bus_Off_Fail = OFF;
3696  02d7 72110000      	bres	_uc_Can_Status_Reg,#0
3697                     ; 339 				CAN_Tx_Message_Now();
3699  02db cd0000        	call	_CAN_Tx_Message_Now
3701  02de               L5422:
3702                     ; 343 			CAN_Normal_Message_Handling();	//CAN_Normal_Message_Rx_Data
3704  02de cd000b        	call	_CAN_Normal_Message_Handling
3706                     ; 345 			if(b_First_Logic_On) //YJS 20230314
3708  02e1 c60000        	ld	a,_uc_System_Ctrl_Reg
3709  02e4 a501          	bcp	a,#1
3710  02e6 2703          	jreq	L3322
3711                     ; 347 				CAN_Normal_Maessge_Transmit(); 
3713  02e8 cd011b        	call	_CAN_Normal_Maessge_Transmit
3715  02eb               L3322:
3716                     ; 355 	return;
3719  02eb 81            	ret
3747                     ; 360 void Reset_Can_Function(void)
3747                     ; 361 {
3748                     	switch	.text
3749  02ec               _Reset_Can_Function:
3753                     ; 362 	uc_Can_Init_Delay = (U8)(0);
3755  02ec 3f04          	clr	_uc_Can_Init_Delay
3756                     ; 363 	uc_Can_Event_Time = (U8)(0);
3758  02ee 3f03          	clr	_uc_Can_Event_Time
3759                     ; 364 	uc_Can_Event_Counter = (U8)(0);
3761  02f0 3f02          	clr	_uc_Can_Event_Counter
3762                     ; 365 	uc_Can_Operation_Flow = (U8)(0);
3764  02f2 3f01          	clr	_uc_Can_Operation_Flow
3765                     ; 367 	uc_Can_Status_Reg = (U8)(0);
3767  02f4 3f00          	clr	_uc_Can_Status_Reg
3768                     ; 369 	return;
3771  02f6 81            	ret
3774                     	switch	.bss
3775  0000               L1622_From_ID:
3776  0000 00            	ds.b	1
3777  0001               L3622_Current_Page:
3778  0001 00            	ds.b	1
3832                     ; 374 @interrupt void CAN_Rx_Interrupt(void)
3832                     ; 375 {
3833                     	switch	.text
3834  02f7               _CAN_Rx_Interrupt:
3836       00000001      OFST:	set	1
3837  02f7 3b0002        	push	c_x+2
3838  02fa be00          	ldw	x,c_x
3839  02fc 89            	pushw	x
3840  02fd 3b0002        	push	c_y+2
3841  0300 be00          	ldw	x,c_y
3842  0302 89            	pushw	x
3843  0303 88            	push	a
3846                     ; 379 	CAN_Interrupt_Disable();
3848  0304 cd0000        	call	_CAN_Interrupt_Disable
3850                     ; 381 	Current_Page = CAN_FPSR;					//Backup_PSR(Page_Selection_Register)
3852  0307 5554270001    	mov	L3622_Current_Page,_CAN_FPSR
3853                     ; 384 	if(CAN_RFR & 0x10){	 CAN_RFR |= 0x10;		}		//Clear_the_FIFO_FOVR_bit
3855  030c c65424        	ld	a,_CAN_RFR
3856  030f a510          	bcp	a,#16
3857  0311 2708          	jreq	L5032
3860  0313 72185424      	bset	_CAN_RFR,#4
3862  0317 acf803f8      	jpf	L5132
3863  031b               L5032:
3864                     ; 387 	else if(CAN_RFR & 0x08){ CAN_RFR |= 0x08;	}		//Clear_the_FIFO_FULL_bit
3866  031b c65424        	ld	a,_CAN_RFR
3867  031e a508          	bcp	a,#8
3868  0320 2603          	jrne	L23
3869  0322 cc03f8        	jp	L5132
3870  0325               L23:
3873  0325 72165424      	bset	_CAN_RFR,#3
3874  0329 acf803f8      	jpf	L5132
3875  032d               L3132:
3876                     ; 392 		CAN_FPSR = 0x07;					//CAN_Receive_FIFO_Page_Select
3878  032d 35075427      	mov	_CAN_FPSR,#7
3879                     ; 393 		From_ID = CAN_P0;					//Read_to_Tx_Massage_ID
3881  0331 5554280000    	mov	L1622_From_ID,_CAN_P0
3882                     ; 394 CAN_RECV_ID = (U16)((U16)(CAN_P2 & 0x1F) << 6);
3884  0336 c6542a        	ld	a,_CAN_P2
3885  0339 a41f          	and	a,#31
3886  033b 5f            	clrw	x
3887  033c 97            	ld	xl,a
3888  033d 58            	sllw	x
3889  033e 58            	sllw	x
3890  033f 58            	sllw	x
3891  0340 58            	sllw	x
3892  0341 58            	sllw	x
3893  0342 58            	sllw	x
3894  0343 cf0000        	ldw	_CAN_RECV_ID,x
3895                     ; 395 CAN_RECV_ID |= (U16)((U16)(CAN_P3 >> 2) & 0x3F);
3897  0346 c6542b        	ld	a,_CAN_P3
3898  0349 44            	srl	a
3899  034a 44            	srl	a
3900  034b 5f            	clrw	x
3901  034c a43f          	and	a,#63
3902  034e 5f            	clrw	x
3903  034f ca0001        	or	a,_CAN_RECV_ID+1
3904  0352 c70001        	ld	_CAN_RECV_ID+1,a
3905  0355 9f            	ld	a,xl
3906  0356 ca0000        	or	a,_CAN_RECV_ID
3907  0359 c70000        	ld	_CAN_RECV_ID,a
3908                     ; 396 if (CAN_RECV_ID==CAN_HTR_STATUS1_ID)
3910  035c ce0000        	ldw	x,_CAN_RECV_ID
3911  035f a30201        	cpw	x,#513
3912  0362 2606          	jrne	L1232
3913                     ; 397 From_ID=0;
3915  0364 725f0000      	clr	L1622_From_ID
3917  0368 202e          	jra	L3232
3918  036a               L1232:
3919                     ; 398 else if (CAN_RECV_ID==CAN_HTR_STATUS2_ID)
3921  036a ce0000        	ldw	x,_CAN_RECV_ID
3922  036d a30202        	cpw	x,#514
3923  0370 2606          	jrne	L5232
3924                     ; 399 From_ID=1;
3926  0372 35010000      	mov	L1622_From_ID,#1
3928  0376 2020          	jra	L3232
3929  0378               L5232:
3930                     ; 400 else if (CAN_RECV_ID==CAN_HTR_STATUS3_ID)
3932  0378 ce0000        	ldw	x,_CAN_RECV_ID
3933  037b a30203        	cpw	x,#515
3934  037e 2606          	jrne	L1332
3935                     ; 401 From_ID=2;
3937  0380 35020000      	mov	L1622_From_ID,#2
3939  0384 2012          	jra	L3232
3940  0386               L1332:
3941                     ; 402 else if (CAN_RECV_ID==CAN_HTR_STATUS4_ID)
3943  0386 ce0000        	ldw	x,_CAN_RECV_ID
3944  0389 a30204        	cpw	x,#516
3945  038c 2606          	jrne	L5332
3946                     ; 403 From_ID=3;
3948  038e 35030000      	mov	L1622_From_ID,#3
3950  0392 2004          	jra	L3232
3951  0394               L5332:
3952                     ; 404 else From_ID=0xffu;
3954  0394 35ff0000      	mov	L1622_From_ID,#255
3955  0398               L3232:
3956                     ; 406 		if(From_ID < CAN_MSG_ID_MAX)
3958  0398 c60000        	ld	a,L1622_From_ID
3959  039b a104          	cp	a,#4
3960  039d 244e          	jruge	L1532
3961                     ; 408 			for(Index = 0; Index < 8u; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
3963  039f 0f01          	clr	(OFST+0,sp)
3964  03a1               L3432:
3965                     ; 409 				Can_Node[From_ID].Msg[Index] = *((&CAN_P6) + Index);
3967  03a1 c60000        	ld	a,L1622_From_ID
3968  03a4 97            	ld	xl,a
3969  03a5 a60a          	ld	a,#10
3970  03a7 42            	mul	x,a
3971  03a8 01            	rrwa	x,a
3972  03a9 1b01          	add	a,(OFST+0,sp)
3973  03ab 2401          	jrnc	L03
3974  03ad 5c            	incw	x
3975  03ae               L03:
3976  03ae 02            	rlwa	x,a
3977  03af 7b01          	ld	a,(OFST+0,sp)
3978  03b1 905f          	clrw	y
3979  03b3 9097          	ld	yl,a
3980  03b5 90d6542e      	ld	a,(_CAN_P6,y)
3981  03b9 d7000c        	ld	(_Can_Node+2,x),a
3982                     ; 408 			for(Index = 0; Index < 8u; Index++){		//Copy_Rx_Buffer_from_CAN_Mailbox_Register
3984  03bc 0c01          	inc	(OFST+0,sp)
3987  03be 7b01          	ld	a,(OFST+0,sp)
3988  03c0 a108          	cp	a,#8
3989  03c2 25dd          	jrult	L3432
3990                     ; 413 			Can_Node[From_ID].Fail = OFF;		//Fail_Status_Clear
3992  03c4 c60000        	ld	a,L1622_From_ID
3993  03c7 97            	ld	xl,a
3994  03c8 a60a          	ld	a,#10
3995  03ca 42            	mul	x,a
3996  03cb d6000a        	ld	a,(_Can_Node,x)
3997  03ce a4fe          	and	a,#254
3998  03d0 d7000a        	ld	(_Can_Node,x),a
3999                     ; 414 			Can_Node[From_ID].Timeout = 0;		//Rx_Error_Counter_Clear
4001  03d3 c60000        	ld	a,L1622_From_ID
4002  03d6 97            	ld	xl,a
4003  03d7 a60a          	ld	a,#10
4004  03d9 42            	mul	x,a
4005  03da 724f000b      	clr	(_Can_Node+1,x)
4006                     ; 415 			Can_Node[From_ID].Update = ON;		//New_Rx_Data
4008  03de c60000        	ld	a,L1622_From_ID
4009  03e1 97            	ld	xl,a
4010  03e2 a60a          	ld	a,#10
4011  03e4 42            	mul	x,a
4012  03e5 d6000a        	ld	a,(_Can_Node,x)
4013  03e8 aa02          	or	a,#2
4014  03ea d7000a        	ld	(_Can_Node,x),a
4016  03ed               L1532:
4017                     ; 434 		CAN_RFR |= 0x20;					//Release_FIFO
4019  03ed 721a5424      	bset	_CAN_RFR,#5
4021  03f1               L5532:
4022                     ; 435 		while(CAN_RFR & 0x20);				//Release_Completed?
4024  03f1 c65424        	ld	a,_CAN_RFR
4025  03f4 a520          	bcp	a,#32
4026  03f6 26f9          	jrne	L5532
4027  03f8               L5132:
4028                     ; 390 	while(CAN_RFR & 0x03)					//CAN_Received?
4030  03f8 c65424        	ld	a,_CAN_RFR
4031  03fb a503          	bcp	a,#3
4032  03fd 2703          	jreq	L43
4033  03ff cc032d        	jp	L3132
4034  0402               L43:
4035                     ; 438 	CAN_FPSR = Current_Page;
4037  0402 5500015427    	mov	_CAN_FPSR,L3622_Current_Page
4038                     ; 440 	CAN_Interrupt_Enable();
4040  0407 cd0000        	call	_CAN_Interrupt_Enable
4042                     ; 441 	return;
4045  040a 84            	pop	a
4046  040b 85            	popw	x
4047  040c bf00          	ldw	c_y,x
4048  040e 320002        	pop	c_y+2
4049  0411 85            	popw	x
4050  0412 bf00          	ldw	c_x,x
4051  0414 320002        	pop	c_x+2
4052  0417 80            	iret
4079                     ; 445 @interrupt void CAN_Tx_Interrupt(void)
4079                     ; 446 {
4080                     	switch	.text
4081  0418               _CAN_Tx_Interrupt:
4085                     ; 448 	if(CAN_MSR & 0x08){ CAN_MSR |= 0x08;		}		//Clear_Wakeup_Flag
4087  0418 c65421        	ld	a,_CAN_MSR
4088  041b a508          	bcp	a,#8
4089  041d 2704          	jreq	L1732
4092  041f 72165421      	bset	_CAN_MSR,#3
4093  0423               L1732:
4094                     ; 451 	if(CAN_MSR & 0x04)
4096  0423 c65421        	ld	a,_CAN_MSR
4097  0426 a504          	bcp	a,#4
4098  0428 270c          	jreq	L3732
4099                     ; 453 		CAN_MSR |= 0x04;					//Clear_Error_Flag
4101  042a 72145421      	bset	_CAN_MSR,#2
4102                     ; 454 		b_Can_Tx_Error = ON;				//CAN_Tx_Error_Flag = ON
4104  042e 72160000      	bset	_uc_Can_Status_Reg,#3
4105                     ; 455 		uc_Can_Operation_Flow = 2;				//Recover_Mode
4107  0432 35020001      	mov	_uc_Can_Operation_Flow,#2
4108  0436               L3732:
4109                     ; 459 	if(CAN_TSR & 0x01)
4111  0436 c65422        	ld	a,_CAN_TSR
4112  0439 a501          	bcp	a,#1
4113  043b 270f          	jreq	L5732
4114                     ; 462 		if(CAN_TSR & 0x10){
4116  043d c65422        	ld	a,_CAN_TSR
4117  0440 a510          	bcp	a,#16
4118  0442 2704          	jreq	L7732
4119                     ; 463 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4121  0444 35030001      	mov	_uc_Can_Operation_Flow,#3
4122  0448               L7732:
4123                     ; 466 		CAN_TSR |= 0x01;					//Clear_Interrupt_Flag
4125  0448 72105422      	bset	_CAN_TSR,#0
4126  044c               L5732:
4127                     ; 470 	if(CAN_TSR & 0x02)
4129  044c c65422        	ld	a,_CAN_TSR
4130  044f a502          	bcp	a,#2
4131  0451 270f          	jreq	L1042
4132                     ; 473 		if(CAN_TSR & 0x20){
4134  0453 c65422        	ld	a,_CAN_TSR
4135  0456 a520          	bcp	a,#32
4136  0458 2704          	jreq	L3042
4137                     ; 474 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4139  045a 35030001      	mov	_uc_Can_Operation_Flow,#3
4140  045e               L3042:
4141                     ; 477 		CAN_TSR |= 0x02;					//Clear_Interrupt_Flag
4143  045e 72125422      	bset	_CAN_TSR,#1
4144  0462               L1042:
4145                     ; 481 	if(CAN_TSR & 0x04)
4147  0462 c65422        	ld	a,_CAN_TSR
4148  0465 a504          	bcp	a,#4
4149  0467 270f          	jreq	L5042
4150                     ; 484 		if(CAN_TSR & 0x40){
4152  0469 c65422        	ld	a,_CAN_TSR
4153  046c a540          	bcp	a,#64
4154  046e 2704          	jreq	L7042
4155                     ; 485 			uc_Can_Operation_Flow = 3;			//CAN_Normal_Operation
4157  0470 35030001      	mov	_uc_Can_Operation_Flow,#3
4158  0474               L7042:
4159                     ; 488 		CAN_TSR |= 0x04;					//Clear_Interrupt_Flag
4161  0474 72145422      	bset	_CAN_TSR,#2
4162  0478               L5042:
4163                     ; 490 	return;
4166  0478 80            	iret
4338                     	xdef	_CAN_Tx_Interrupt
4339                     	xdef	_CAN_Rx_Interrupt
4340                     	xdef	_CAN_Normal_Message_Handling
4341                     	xdef	_CAN_Normal_Maessge_Transmit
4342                     	xdef	_CAN_Tx_Message_Now
4343                     	xdef	_CAN_Timing_Control
4344                     	xdef	_CAN_Fail_Handling
4345                     	switch	.ubsct
4346  0000               _uc_Can_Status_Reg:
4347  0000 00            	ds.b	1
4348                     	xdef	_uc_Can_Status_Reg
4349  0001               _uc_Can_Operation_Flow:
4350  0001 00            	ds.b	1
4351                     	xdef	_uc_Can_Operation_Flow
4352  0002               _uc_Can_Event_Counter:
4353  0002 00            	ds.b	1
4354                     	xdef	_uc_Can_Event_Counter
4355  0003               _uc_Can_Event_Time:
4356  0003 00            	ds.b	1
4357                     	xdef	_uc_Can_Event_Time
4358  0004               _uc_Can_Init_Delay:
4359  0004 00            	ds.b	1
4360                     	xdef	_uc_Can_Init_Delay
4361                     	switch	.bss
4362  0002               _Can_Tx_Buffer:
4363  0002 000000000000  	ds.b	8
4364                     	xdef	_Can_Tx_Buffer
4365                     	xdef	_Can_Msg_Length
4366                     	xdef	_Can_Fail_Time
4367  000a               _Can_Node:
4368  000a 000000000000  	ds.b	40
4369                     	xdef	_Can_Node
4370                     	xdef	_HEATER_zone_status
4371                     	xdef	_CAN_test_data
4372                     	xdef	_CAN_RECV_ID
4373                     	xdef	_Reset_Can_Function
4374                     	xdef	_CAN_Management_Function
4375                     	xdef	_CAN_Bus_Off_Handling
4376                     	xref	_uc_Rx_Data
4377                     	xref	_uc_Heater_Enable_Flag
4378                     	xref	_uc_Target_Duty_Perc
4379                     	xref	_uc_Rx_TimeOut_Reg
4380                     	xref	_CAN_Wait_Tx_Message
4381                     	xref	_CAN_Transmit_Cancel
4382                     	xref	_CAN_Disable
4383                     	xref	_CAN_Enable
4384                     	xref	_CAN_Interrupt_Enable
4385                     	xref	_CAN_Interrupt_Disable
4386                     	xref	_Windows_Watchdog_Clear
4387                     	xref	_uc_System_Ctrl_Reg
4388                     	xref.b	c_x
4389                     	xref.b	c_y
4409                     	end

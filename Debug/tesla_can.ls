   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     .const:	section	.text
2659  0000               _CAN_Time_Fail:
2660  0000 0032          	dc.w	50
2661  0002 000000000000  	ds.b	6
2662                     	switch	.data
2663  0000               _PTC_AllowOperation:
2664  0000 00            	dc.b	0
2665  0001               _PTC_Status_Flag:
2666  0001 00            	dc.b	0
2721                     ; 91 void CAN_Message_Time_Control(void)
2721                     ; 92 {
2722                     	switch	.text
2723  0000               f_CAN_Message_Time_Control:
2725  0000 88            	push	a
2726       00000001      OFST:	set	1
2729                     ; 96 	if(CAN_TInitialize == OFF){
2731  0001 7202001214    	btjt	_CAN_Control_Status,#1,L5271
2732                     ; 97 		if(++CAN_Initialize_Delay >= 13){		//IGN_ON_130ms_Delay
2734  0006 3c0a          	inc	_CAN_Initialize_Delay
2735  0008 b60a          	ld	a,_CAN_Initialize_Delay
2736  000a a10d          	cp	a,#13
2737  000c 2404ace800e8  	jrult	L1371
2738                     ; 98 			CAN_TInitialize = ON;
2740  0012 72120012      	bset	_CAN_Control_Status,#1
2741  0016 ace800e8      	jra	L1371
2742  001a               L5271:
2743                     ; 103 	else if(CAN_TMessage_Start == OFF){
2745  001a 7204001210    	btjt	_CAN_Control_Status,#2,L3371
2746                     ; 104 		if(++CAN_Initialize_Delay >= 30){			//IGN_ON_300ms_Delay
2748  001f 3c0a          	inc	_CAN_Initialize_Delay
2749  0021 b60a          	ld	a,_CAN_Initialize_Delay
2750  0023 a11e          	cp	a,#30
2751  0025 25ef          	jrult	L1371
2752                     ; 106 			CAN_TMessage_Start = ON;
2754  0027 72140012      	bset	_CAN_Control_Status,#2
2755  002b ace800e8      	jra	L1371
2756  002f               L3371:
2757                     ; 111 	else if(Disable_Normal_Msg == OFF){
2759  002f 720e0012f7    	btjt	_CAN_Control_Status,#7,L1371
2760                     ; 113 		if(ModelS_PTC_flag){
2762  0034 720300002d    	btjf	_Can_Select_Device,#1,L3471
2763                     ; 115 			if(MODELS_Tx_Event_Flag == OFF){
2765  0039 720000110e    	btjt	_CAN_Control_Status2,#0,L5471
2766                     ; 116 				if(++MODELS_TX_Event_Counter >= MODELS_TX_Event_Time){
2768  003e 3c08          	inc	_MODELS_TX_Event_Counter
2769  0040 b608          	ld	a,_MODELS_TX_Event_Counter
2770  0042 b109          	cp	a,_MODELS_TX_Event_Time
2771  0044 2506          	jrult	L5471
2772                     ; 117 					MODELS_TX_Event_Counter = 0;
2774  0046 3f08          	clr	_MODELS_TX_Event_Counter
2775                     ; 118 					MODELS_Tx_Event_Flag = ON;
2777  0048 72100011      	bset	_CAN_Control_Status2,#0
2778  004c               L5471:
2779                     ; 122 			if(ModelS_PTC_V58_flag){
2781  004c 7207000061    	btjf	_Can_Select_Device,#3,L7571
2782                     ; 124 				if(ModelS_TX_Vehicle_Status == OFF){
2784  0051 720600115c    	btjt	_CAN_Control_Status2,#3,L7571
2785                     ; 125 					if(++MODELS_TX_Vehicle_Counter >= MODELS_TX_Vehicle_Event_Time){
2787  0056 3c06          	inc	_MODELS_TX_Vehicle_Counter
2788  0058 b606          	ld	a,_MODELS_TX_Vehicle_Counter
2789  005a b107          	cp	a,_MODELS_TX_Vehicle_Event_Time
2790  005c 2554          	jrult	L7571
2791                     ; 126 						MODELS_TX_Vehicle_Counter = 0;
2793  005e 3f06          	clr	_MODELS_TX_Vehicle_Counter
2794                     ; 127 						ModelS_TX_Vehicle_Status = ON;
2796  0060 72160011      	bset	_CAN_Control_Status2,#3
2797  0064 204c          	jra	L7571
2798  0066               L3471:
2799                     ; 132 		else if(PS_PTC_flag){
2801  0066 720b000015    	btjf	_Can_Select_Device,#5,L1671
2802                     ; 133 			if(PS_Tx_Event_Flag == OFF){
2804  006b 7202001142    	btjt	_CAN_Control_Status2,#1,L7571
2805                     ; 134 				if(++PS_TX_Event_Counter >= PS_TX_Event_Time){
2807  0070 3c02          	inc	_PS_TX_Event_Counter
2808  0072 b602          	ld	a,_PS_TX_Event_Counter
2809  0074 b103          	cp	a,_PS_TX_Event_Time
2810  0076 253a          	jrult	L7571
2811                     ; 135 					PS_TX_Event_Counter = 0;
2813  0078 3f02          	clr	_PS_TX_Event_Counter
2814                     ; 136 					PS_Tx_Event_Flag = ON;
2816  007a 72120011      	bset	_CAN_Control_Status2,#1
2817  007e 2032          	jra	L7571
2818  0080               L1671:
2819                     ; 140 		else if(LMFC_PTC_flag){
2821  0080 7209000015    	btjf	_Can_Select_Device,#4,L1771
2822                     ; 141 			if(LMFC_Tx_Event_Flag == OFF){
2824  0085 7204001128    	btjt	_CAN_Control_Status2,#2,L7571
2825                     ; 142 				if(++LMFC_TX_Event_Counter >= LMFC_TX_Event_Time){
2827  008a 3c00          	inc	_LMFC_TX_Event_Counter
2828  008c b600          	ld	a,_LMFC_TX_Event_Counter
2829  008e b101          	cp	a,_LMFC_TX_Event_Time
2830  0090 2520          	jrult	L7571
2831                     ; 143 					LMFC_TX_Event_Counter = 0;
2833  0092 3f00          	clr	_LMFC_TX_Event_Counter
2834                     ; 144 					LMFC_Tx_Event_Flag = ON;
2836  0094 72140011      	bset	_CAN_Control_Status2,#2
2837  0098 2018          	jra	L7571
2838  009a               L1771:
2839                     ; 148 		else if(ModelX_PTC_flag){
2841  009a 720d000013    	btjf	_Can_Select_Device,#6,L7571
2842                     ; 149 			if(!ModelX_Tx_Event_Flag){
2844  009f 720800110e    	btjt	_CAN_Control_Status2,#4,L7571
2845                     ; 150 				if(++ModelX_TX_Event_Cnt >= ModelX_TX_Event_Time){
2847  00a4 3c04          	inc	_ModelX_TX_Event_Cnt
2848  00a6 b604          	ld	a,_ModelX_TX_Event_Cnt
2849  00a8 b105          	cp	a,_ModelX_TX_Event_Time
2850  00aa 2506          	jrult	L7571
2851                     ; 151 					ModelX_TX_Event_Cnt = 0;
2853  00ac 3f04          	clr	_ModelX_TX_Event_Cnt
2854                     ; 152 					ModelX_Tx_Event_Flag = ON;
2856  00ae 72180011      	bset	_CAN_Control_Status2,#4
2857  00b2               L7571:
2858                     ; 160 		for(ID = RCCM_206; ID < CAN_MSG_ID_MAX; ID++){
2860  00b2 4f            	clr	a
2861  00b3 6b01          	ld	(OFST+0,sp),a
2862  00b5               L7002:
2863                     ; 161 			if(CAN_Node_Status[ID].Fail == OFF){
2865  00b5 97            	ld	xl,a
2866  00b6 a603          	ld	a,#3
2867  00b8 42            	mul	x,a
2868  00b9 724d0031      	tnz	(_CAN_Node_Status,x)
2869  00bd 2621          	jrne	L5102
2870                     ; 162 				if(++CAN_Node_Status[ID].Period > CAN_Time_Fail[ID]){
2872  00bf 9093          	ldw	y,x
2873  00c1 de0032        	ldw	x,(_CAN_Node_Status+1,x)
2874  00c4 5c            	incw	x
2875  00c5 90df0032      	ldw	(_CAN_Node_Status+1,y),x
2876  00c9 905f          	clrw	y
2877  00cb 7b01          	ld	a,(OFST+0,sp)
2878  00cd 9097          	ld	yl,a
2879  00cf 9058          	sllw	y
2880  00d1 90d30000      	cpw	x,(_CAN_Time_Fail,y)
2881  00d5 2309          	jrule	L5102
2882                     ; 163 					CAN_Node_Status[ID].Fail = CAN_NODE_FAIL;
2884  00d7 97            	ld	xl,a
2885  00d8 a603          	ld	a,#3
2886  00da 42            	mul	x,a
2887  00db a601          	ld	a,#1
2888  00dd d70031        	ld	(_CAN_Node_Status,x),a
2889  00e0               L5102:
2890                     ; 160 		for(ID = RCCM_206; ID < CAN_MSG_ID_MAX; ID++){
2892  00e0 0c01          	inc	(OFST+0,sp)
2895  00e2 7b01          	ld	a,(OFST+0,sp)
2896  00e4 a104          	cp	a,#4
2897  00e6 25cd          	jrult	L7002
2899  00e8               L1371:
2900                     ; 172 	return;
2903  00e8 84            	pop	a
2904  00e9 87            	retf	
2930                     ; 177 void CAN_ModelS_Tx_Data_Handling(void)
2930                     ; 178 {
2931                     	switch	.text
2932  00ea               f_CAN_ModelS_Tx_Data_Handling:
2936                     ; 180 	CAN_Tx_Buffer[0] = PTC_AllowOperation;
2938  00ea 5500000029    	mov	_CAN_Tx_Buffer,_PTC_AllowOperation
2939                     ; 181 	CAN_Tx_Buffer[1] = PTC_Heat_Duty;
2941  00ef 550056002a    	mov	_CAN_Tx_Buffer+1,_PTC_Heat_Duty
2942                     ; 182 	CAN_Tx_Buffer[2] = 0x00;
2944  00f4 725f002b      	clr	_CAN_Tx_Buffer+2
2945                     ; 183 	CAN_Tx_Buffer[3] = 0x00;
2947  00f8 725f002c      	clr	_CAN_Tx_Buffer+3
2948                     ; 184 	CAN_Tx_Buffer[4] = 0x00;
2950  00fc 725f002d      	clr	_CAN_Tx_Buffer+4
2951                     ; 185 	CAN_Tx_Buffer[5] = 0x00;
2953  0100 725f002e      	clr	_CAN_Tx_Buffer+5
2954                     ; 186 	CAN_Tx_Buffer[6] = 0x00;
2956  0104 725f002f      	clr	_CAN_Tx_Buffer+6
2957                     ; 187 	CAN_Tx_Buffer[7] = 0x00;
2959  0108 725f0030      	clr	_CAN_Tx_Buffer+7
2960                     ; 188 	return;
2963  010c 87            	retf	
2988                     ; 191 void CAN_ModelS_Vehicle_Tx_Data_Handling(void)
2988                     ; 192 {
2989                     	switch	.text
2990  010d               f_CAN_ModelS_Vehicle_Tx_Data_Handling:
2994                     ; 194 	CAN_Tx_Buffer[0] = 0x00;
2996  010d 725f0029      	clr	_CAN_Tx_Buffer
2997                     ; 195 	CAN_Tx_Buffer[1] = MD_Vehicle_Logic;
2999  0111 550000002a    	mov	_CAN_Tx_Buffer+1,_MD_Vehicle_Logic
3000                     ; 196 	CAN_Tx_Buffer[2] = 0x00;
3002  0116 725f002b      	clr	_CAN_Tx_Buffer+2
3003                     ; 197 	CAN_Tx_Buffer[3] = 0x00;
3005  011a 725f002c      	clr	_CAN_Tx_Buffer+3
3006                     ; 198 	CAN_Tx_Buffer[4] = 0x00;
3008  011e 725f002d      	clr	_CAN_Tx_Buffer+4
3009                     ; 199 	CAN_Tx_Buffer[5] = 0x00;
3011  0122 725f002e      	clr	_CAN_Tx_Buffer+5
3012                     ; 200 	CAN_Tx_Buffer[6] = 0x00;
3014  0126 725f002f      	clr	_CAN_Tx_Buffer+6
3015                     ; 201 	CAN_Tx_Buffer[7] = 0x00;
3017  012a 725f0030      	clr	_CAN_Tx_Buffer+7
3018                     ; 202 	return;
3021  012e 87            	retf	
3047                     ; 205 void CAN_ModelX_Tx_Data_Handling(void)
3047                     ; 206 {
3048                     	switch	.text
3049  012f               f_CAN_ModelX_Tx_Data_Handling:
3053                     ; 207 	CAN_Tx_Buffer[0] = 0x00;
3055  012f 725f0029      	clr	_CAN_Tx_Buffer
3056                     ; 209 	if(PTC_AllowOperation){ CAN_Tx_Buffer[1] = 0x80;}
3058  0133 725d0000      	tnz	_PTC_AllowOperation
3059  0137 2706          	jreq	L3502
3062  0139 3580002a      	mov	_CAN_Tx_Buffer+1,#128
3064  013d 200a          	jra	L5502
3065  013f               L3502:
3066                     ; 210 	else if(!PTC_AllowOperation){CAN_Tx_Buffer[1] = 0x00;}
3068  013f 725d0000      	tnz	_PTC_AllowOperation
3069  0143 2604          	jrne	L5502
3072  0145 725f002a      	clr	_CAN_Tx_Buffer+1
3073  0149               L5502:
3074                     ; 212 	CAN_Tx_Buffer[2] = PTC_Heat_Duty;
3076  0149 550056002b    	mov	_CAN_Tx_Buffer+2,_PTC_Heat_Duty
3077                     ; 213 	CAN_Tx_Buffer[3] = 0x00;
3079  014e 725f002c      	clr	_CAN_Tx_Buffer+3
3080                     ; 214 	CAN_Tx_Buffer[4] = 0x00;
3082  0152 725f002d      	clr	_CAN_Tx_Buffer+4
3083                     ; 215 	CAN_Tx_Buffer[5] = 0x00;
3085  0156 725f002e      	clr	_CAN_Tx_Buffer+5
3086                     ; 216 	CAN_Tx_Buffer[6] = 0x00;
3088  015a 725f002f      	clr	_CAN_Tx_Buffer+6
3089                     ; 217 	CAN_Tx_Buffer[7] = 0x00;
3091  015e 725f0030      	clr	_CAN_Tx_Buffer+7
3092                     ; 219 	return;
3095  0162 87            	retf	
3121                     ; 223 void CAN_PS_Tx_Data_Handling(void)
3121                     ; 224 {
3122                     	switch	.text
3123  0163               f_CAN_PS_Tx_Data_Handling:
3127                     ; 226 	CAN_Tx_Buffer[0] = PTC_AllowOperation;
3129  0163 5500000029    	mov	_CAN_Tx_Buffer,_PTC_AllowOperation
3130                     ; 227 	CAN_Tx_Buffer[1] = PTC_Heat_Duty;
3132  0168 550056002a    	mov	_CAN_Tx_Buffer+1,_PTC_Heat_Duty
3133                     ; 228 	CAN_Tx_Buffer[2] = 0x00;
3135  016d 725f002b      	clr	_CAN_Tx_Buffer+2
3136                     ; 229 	CAN_Tx_Buffer[3] = 0x00;
3138  0171 725f002c      	clr	_CAN_Tx_Buffer+3
3139                     ; 230 	CAN_Tx_Buffer[4] = 0x00;
3141  0175 725f002d      	clr	_CAN_Tx_Buffer+4
3142                     ; 231 	CAN_Tx_Buffer[5] = 0x00;
3144  0179 725f002e      	clr	_CAN_Tx_Buffer+5
3145                     ; 232 	CAN_Tx_Buffer[6] = 0x00;
3147  017d 725f002f      	clr	_CAN_Tx_Buffer+6
3148                     ; 233 	CAN_Tx_Buffer[7] = 0x00;
3150  0181 725f0030      	clr	_CAN_Tx_Buffer+7
3151                     ; 234 	return;
3154  0185 87            	retf	
3180                     ; 237 void CAN_LMFC_Tx_Data_Handling(void)
3180                     ; 238 {
3181                     	switch	.text
3182  0186               f_CAN_LMFC_Tx_Data_Handling:
3186                     ; 239 	CAN_Tx_Buffer[0] = PTC_AllowOperation;
3188  0186 5500000029    	mov	_CAN_Tx_Buffer,_PTC_AllowOperation
3189                     ; 240 	CAN_Tx_Buffer[1] = PTC_Heat_Duty;
3191  018b 550056002a    	mov	_CAN_Tx_Buffer+1,_PTC_Heat_Duty
3192                     ; 241 	CAN_Tx_Buffer[2] = 0x00;
3194  0190 725f002b      	clr	_CAN_Tx_Buffer+2
3195                     ; 242 	CAN_Tx_Buffer[3] = 0x00;
3197  0194 725f002c      	clr	_CAN_Tx_Buffer+3
3198                     ; 243 	CAN_Tx_Buffer[4] = 0x00;
3200  0198 725f002d      	clr	_CAN_Tx_Buffer+4
3201                     ; 244 	CAN_Tx_Buffer[5] = 0x00;
3203  019c 725f002e      	clr	_CAN_Tx_Buffer+5
3204                     ; 245 	CAN_Tx_Buffer[6] = 0x00;
3206  01a0 725f002f      	clr	_CAN_Tx_Buffer+6
3207                     ; 246 	CAN_Tx_Buffer[7] = 0x00;
3209  01a4 725f0030      	clr	_CAN_Tx_Buffer+7
3210                     ; 248 	return;
3213  01a8 87            	retf	
3251                     ; 253 void CAN_ModelS_Message_Handling(void)
3251                     ; 254 {
3252                     	switch	.text
3253  01a9               f_CAN_ModelS_Message_Handling:
3255  01a9 88            	push	a
3256       00000001      OFST:	set	1
3259                     ; 255 	unsigned char index = 0;
3261                     ; 257 	if(CAN_Msg_Update[RCCM_206] == MSG_UPDATE){
3263  01aa c60005        	ld	a,_CAN_Msg_Update
3264  01ad 4a            	dec	a
3265  01ae 2616          	jrne	L5112
3266                     ; 259 		for(index = 0; index < 8; index++){
3268  01b0 6b01          	ld	(OFST+0,sp),a
3269  01b2               L7112:
3270                     ; 260 			MD_ID206_Data[index] = CAN_Rx_Buffer[RCCM_206][index];
3272  01b2 5f            	clrw	x
3273  01b3 97            	ld	xl,a
3274  01b4 d60009        	ld	a,(_CAN_Rx_Buffer,x)
3275  01b7 d70000        	ld	(_MD_ID206_Data,x),a
3276                     ; 259 		for(index = 0; index < 8; index++){
3278  01ba 0c01          	inc	(OFST+0,sp)
3281  01bc 7b01          	ld	a,(OFST+0,sp)
3282  01be a108          	cp	a,#8
3283  01c0 25f0          	jrult	L7112
3284                     ; 262 		CAN_Msg_Update[RCCM_206] = OFF;
3286  01c2 725f0005      	clr	_CAN_Msg_Update
3287  01c6               L5112:
3288                     ; 265 	if(CAN_Msg_Update[RCCM_306] == MSG_UPDATE){
3290  01c6 c60006        	ld	a,_CAN_Msg_Update+1
3291  01c9 4a            	dec	a
3292  01ca 2616          	jrne	L5212
3293                     ; 266 		for(index = 0; index < 8; index++){
3295  01cc 6b01          	ld	(OFST+0,sp),a
3296  01ce               L7212:
3297                     ; 267 			MD_ID306_Data[index] = CAN_Rx_Buffer[RCCM_306][index];
3299  01ce 5f            	clrw	x
3300  01cf 97            	ld	xl,a
3301  01d0 d60011        	ld	a,(_CAN_Rx_Buffer+8,x)
3302  01d3 d70000        	ld	(_MD_ID306_Data,x),a
3303                     ; 266 		for(index = 0; index < 8; index++){
3305  01d6 0c01          	inc	(OFST+0,sp)
3308  01d8 7b01          	ld	a,(OFST+0,sp)
3309  01da a108          	cp	a,#8
3310  01dc 25f0          	jrult	L7212
3311                     ; 269 		CAN_Msg_Update[RCCM_306] = OFF;
3313  01de 725f0006      	clr	_CAN_Msg_Update+1
3314  01e2               L5212:
3315                     ; 272 	if(CAN_Msg_Update[RCCM_506] == MSG_UPDATE){
3317  01e2 c60007        	ld	a,_CAN_Msg_Update+2
3318  01e5 4a            	dec	a
3319  01e6 2616          	jrne	L5312
3320                     ; 273 		for(index = 0; index < 8; index++){
3322  01e8 6b01          	ld	(OFST+0,sp),a
3323  01ea               L7312:
3324                     ; 274 			MD_ID506_Data[index] = CAN_Rx_Buffer[RCCM_506][index];
3326  01ea 5f            	clrw	x
3327  01eb 97            	ld	xl,a
3328  01ec d60019        	ld	a,(_CAN_Rx_Buffer+16,x)
3329  01ef d70000        	ld	(_MD_ID506_Data,x),a
3330                     ; 273 		for(index = 0; index < 8; index++){
3332  01f2 0c01          	inc	(OFST+0,sp)
3335  01f4 7b01          	ld	a,(OFST+0,sp)
3336  01f6 a108          	cp	a,#8
3337  01f8 25f0          	jrult	L7312
3338                     ; 276 		CAN_Msg_Update[RCCM_506] = OFF;
3340  01fa 725f0007      	clr	_CAN_Msg_Update+2
3341  01fe               L5312:
3342                     ; 279 	if(CAN_Msg_Update[RCCM_316] == MSG_UPDATE){
3344  01fe c60008        	ld	a,_CAN_Msg_Update+3
3345  0201 4a            	dec	a
3346  0202 2616          	jrne	L5412
3347                     ; 280 		for(index = 0; index < 8; index++){
3349  0204 6b01          	ld	(OFST+0,sp),a
3350  0206               L7412:
3351                     ; 281 			MD_ID316_Data[index] = CAN_Rx_Buffer[RCCM_316][index];
3353  0206 5f            	clrw	x
3354  0207 97            	ld	xl,a
3355  0208 d60021        	ld	a,(_CAN_Rx_Buffer+24,x)
3356  020b d70000        	ld	(_MD_ID316_Data,x),a
3357                     ; 280 		for(index = 0; index < 8; index++){
3359  020e 0c01          	inc	(OFST+0,sp)
3362  0210 7b01          	ld	a,(OFST+0,sp)
3363  0212 a108          	cp	a,#8
3364  0214 25f0          	jrult	L7412
3365                     ; 283 		CAN_Msg_Update[RCCM_316] = OFF;
3367  0216 725f0008      	clr	_CAN_Msg_Update+3
3368  021a               L5412:
3369                     ; 287 	return;
3372  021a 84            	pop	a
3373  021b 87            	retf	
3407                     ; 291 void CAN_PS_Message_Handling(void)
3407                     ; 292 {
3408                     	switch	.text
3409  021c               f_CAN_PS_Message_Handling:
3413                     ; 293 	if(CAN_Msg_Update[PS_140] == MSG_UPDATE){
3415  021c c60005        	ld	a,_CAN_Msg_Update
3416  021f 4a            	dec	a
3417  0220 2634          	jrne	L5612
3418                     ; 294 		PS_PTC_Status[0] = CAN_Rx_Buffer[PS_140][0];
3420  0222 5500090000    	mov	_PS_PTC_Status,_CAN_Rx_Buffer
3421                     ; 295 		PTC_RCore_Temp =  CAN_Rx_Buffer[PS_140][1];
3423  0227 55000a004e    	mov	_PTC_RCore_Temp,_CAN_Rx_Buffer+1
3424                     ; 296 		PTC_PWR_VALUE = (CAN_Rx_Buffer[PS_140][3]<<8) + CAN_Rx_Buffer[PS_140][2];
3426  022c 5f            	clrw	x
3427  022d c6000c        	ld	a,_CAN_Rx_Buffer+3
3428  0230 97            	ld	xl,a
3429  0231 4f            	clr	a
3430  0232 cb000b        	add	a,_CAN_Rx_Buffer+2
3431  0235 2401          	jrnc	L42
3432  0237 5c            	incw	x
3433  0238               L42:
3434  0238 c70052        	ld	_PTC_PWR_VALUE+1,a
3435  023b 9f            	ld	a,xl
3436  023c c70051        	ld	_PTC_PWR_VALUE,a
3437                     ; 297 		PTC_BATT_VALUE = (unsigned int)(CAN_Rx_Buffer[PS_140][4] * 2);
3439  023f 5f            	clrw	x
3440  0240 c6000d        	ld	a,_CAN_Rx_Buffer+4
3441  0243 97            	ld	xl,a
3442  0244 58            	sllw	x
3443  0245 cf0054        	ldw	_PTC_BATT_VALUE,x
3444                     ; 298 		PTC_Cur_VALUE = CAN_Rx_Buffer[PS_140][5];
3446  0248 55000e0053    	mov	_PTC_Cur_VALUE,_CAN_Rx_Buffer+5
3447                     ; 299 		PTC_Fdback_Duty = CAN_Rx_Buffer[PS_140][6];
3449  024d 55000f0050    	mov	_PTC_Fdback_Duty,_CAN_Rx_Buffer+6
3450                     ; 301 		CAN_Msg_Update[PS_140] = 0;		// Data_Read_Panding
3452  0252 725f0005      	clr	_CAN_Msg_Update
3453  0256               L5612:
3454                     ; 304 	if(CAN_Msg_Update[PS_141] == MSG_UPDATE){
3456  0256 c60006        	ld	a,_CAN_Msg_Update+1
3457  0259 4a            	dec	a
3458  025a 262b          	jrne	L7612
3459                     ; 306 		PS_PTC_Status[1] =  CAN_Rx_Buffer[PS_141][0]; 
3461  025c 5500110001    	mov	_PS_PTC_Status+1,_CAN_Rx_Buffer+8
3462                     ; 307 		PS_PTC_Status[2] =  CAN_Rx_Buffer[PS_141][1];
3464  0261 5500120002    	mov	_PS_PTC_Status+2,_CAN_Rx_Buffer+9
3465                     ; 308 		PS_PTC_Status[3] =  CAN_Rx_Buffer[PS_141][2];
3467  0266 5500130003    	mov	_PS_PTC_Status+3,_CAN_Rx_Buffer+10
3468                     ; 309 		PS_PTC_Status[4] =  CAN_Rx_Buffer[PS_141][3];
3470  026b 5500140004    	mov	_PS_PTC_Status+4,_CAN_Rx_Buffer+11
3471                     ; 310 		PS_PTC_Status[5] =  CAN_Rx_Buffer[PS_141][4];
3473  0270 5500150005    	mov	_PS_PTC_Status+5,_CAN_Rx_Buffer+12
3474                     ; 311 		PS_PTC_Status[6] =  CAN_Rx_Buffer[PS_141][5];
3476  0275 5500160006    	mov	_PS_PTC_Status+6,_CAN_Rx_Buffer+13
3477                     ; 313 		PTC_Limit_Cause =  CAN_Rx_Buffer[PS_141][6];
3479  027a 5500170049    	mov	_PTC_Limit_Cause,_CAN_Rx_Buffer+14
3480                     ; 314 		PTC_SW_Ver = CAN_Rx_Buffer[PS_141][7];
3482  027f 5500180048    	mov	_PTC_SW_Ver,_CAN_Rx_Buffer+15
3483                     ; 316 		CAN_Msg_Update[PS_141] = 0;		// Data_Read_Panding
3485  0284 c70006        	ld	_CAN_Msg_Update+1,a
3486  0287               L7612:
3487                     ; 319 	if(CAN_Msg_Update[PS_DE_351] == MSG_UPDATE){
3489  0287 c60007        	ld	a,_CAN_Msg_Update+2
3490  028a 4a            	dec	a
3491  028b 262b          	jrne	L1712
3492                     ; 321 		PS_PTC_Debug[0] = CAN_Rx_Buffer[LMFC_DE_351][0]; 
3494  028d 5500190000    	mov	_PS_PTC_Debug,_CAN_Rx_Buffer+16
3495                     ; 322 		PS_PTC_Debug[1] = CAN_Rx_Buffer[LMFC_DE_351][1]; 
3497  0292 55001a0001    	mov	_PS_PTC_Debug+1,_CAN_Rx_Buffer+17
3498                     ; 323 		PS_PTC_Debug[2] = CAN_Rx_Buffer[LMFC_DE_351][2]; 
3500  0297 55001b0002    	mov	_PS_PTC_Debug+2,_CAN_Rx_Buffer+18
3501                     ; 324 		PS_PTC_Debug[3] = CAN_Rx_Buffer[LMFC_DE_351][3]; 
3503  029c 55001c0003    	mov	_PS_PTC_Debug+3,_CAN_Rx_Buffer+19
3504                     ; 325 		PS_PTC_Debug[4] = CAN_Rx_Buffer[LMFC_DE_351][4]; 
3506  02a1 55001d0004    	mov	_PS_PTC_Debug+4,_CAN_Rx_Buffer+20
3507                     ; 326 		PS_PTC_Debug[5] = CAN_Rx_Buffer[LMFC_DE_351][5]; 
3509  02a6 55001e0005    	mov	_PS_PTC_Debug+5,_CAN_Rx_Buffer+21
3510                     ; 327 		PS_PTC_Debug[6] = CAN_Rx_Buffer[LMFC_DE_351][6]; 
3512  02ab 55001f0006    	mov	_PS_PTC_Debug+6,_CAN_Rx_Buffer+22
3513                     ; 328 		PS_PTC_Debug[7] = CAN_Rx_Buffer[LMFC_DE_351][7]; 
3515  02b0 5500200007    	mov	_PS_PTC_Debug+7,_CAN_Rx_Buffer+23
3516                     ; 330 		CAN_Msg_Update[PS_DE_351] = 0;
3518  02b5 c70007        	ld	_CAN_Msg_Update+2,a
3519  02b8               L1712:
3520                     ; 334 	return;
3523  02b8 87            	retf	
3558                     ; 337 void CAN_LMFC_Message_Handling(void)
3558                     ; 338 {
3559                     	switch	.text
3560  02b9               f_CAN_LMFC_Message_Handling:
3564                     ; 339 	if(CAN_Msg_Update[LMFC_140] == MSG_UPDATE){
3566  02b9 c60005        	ld	a,_CAN_Msg_Update
3567  02bc 4a            	dec	a
3568  02bd 262d          	jrne	L3022
3569                     ; 340 		LMFC_PTC_Status[0] = CAN_Rx_Buffer[LMFC_140][0];
3571  02bf 5500090000    	mov	_LMFC_PTC_Status,_CAN_Rx_Buffer
3572                     ; 342 		PTC_PWR_VALUE = (unsigned int)(CAN_Rx_Buffer[LMFC_140][1]);
3574  02c4 5f            	clrw	x
3575  02c5 c6000a        	ld	a,_CAN_Rx_Buffer+1
3576  02c8 97            	ld	xl,a
3577  02c9 cf0051        	ldw	_PTC_PWR_VALUE,x
3578                     ; 343 		PTC_BATT_VALUE = (unsigned int)(CAN_Rx_Buffer[LMFC_140][2]);
3580  02cc 5f            	clrw	x
3581  02cd c6000b        	ld	a,_CAN_Rx_Buffer+2
3582  02d0 97            	ld	xl,a
3583  02d1 cf0054        	ldw	_PTC_BATT_VALUE,x
3584                     ; 344 		PTC_Cur_VALUE = CAN_Rx_Buffer[LMFC_140][3];
3586  02d4 55000c0053    	mov	_PTC_Cur_VALUE,_CAN_Rx_Buffer+3
3587                     ; 345 		PTC_Fdback_Duty = CAN_Rx_Buffer[LMFC_140][4];
3589  02d9 55000d0050    	mov	_PTC_Fdback_Duty,_CAN_Rx_Buffer+4
3590                     ; 346 		PTC_LCore_Temp =  CAN_Rx_Buffer[LMFC_140][6];
3592  02de 55000f004f    	mov	_PTC_LCore_Temp,_CAN_Rx_Buffer+6
3593                     ; 347 		PTC_RCore_Temp =  CAN_Rx_Buffer[LMFC_140][7];
3595  02e3 550010004e    	mov	_PTC_RCore_Temp,_CAN_Rx_Buffer+7
3596                     ; 349 		CAN_Msg_Update[LMFC_140] = 0;		// Data_Read_Panding
3598  02e8 725f0005      	clr	_CAN_Msg_Update
3599  02ec               L3022:
3600                     ; 352 	if(CAN_Msg_Update[LMFC_141] == MSG_UPDATE){
3602  02ec c60006        	ld	a,_CAN_Msg_Update+1
3603  02ef 4a            	dec	a
3604  02f0 2626          	jrne	L5022
3605                     ; 354 		LMFC_PTC_Status[1] =  CAN_Rx_Buffer[LMFC_141][0]; 
3607  02f2 5500110001    	mov	_LMFC_PTC_Status+1,_CAN_Rx_Buffer+8
3608                     ; 355 		LMFC_PTC_Status[2] =  CAN_Rx_Buffer[LMFC_141][1];
3610  02f7 5500120002    	mov	_LMFC_PTC_Status+2,_CAN_Rx_Buffer+9
3611                     ; 356 		LMFC_PTC_Status[3] =  CAN_Rx_Buffer[LMFC_141][2];
3613  02fc 5500130003    	mov	_LMFC_PTC_Status+3,_CAN_Rx_Buffer+10
3614                     ; 357 		LMFC_PTC_Status[4] =  CAN_Rx_Buffer[LMFC_141][3];
3616  0301 5500140004    	mov	_LMFC_PTC_Status+4,_CAN_Rx_Buffer+11
3617                     ; 358 		LMFC_PTC_Status[5] =  CAN_Rx_Buffer[LMFC_141][4];
3619  0306 5500150005    	mov	_LMFC_PTC_Status+5,_CAN_Rx_Buffer+12
3620                     ; 360 		PTC_Limit_Cause =  CAN_Rx_Buffer[LMFC_141][5];
3622  030b 5500160049    	mov	_PTC_Limit_Cause,_CAN_Rx_Buffer+13
3623                     ; 361 		PTC_SW_Ver = CAN_Rx_Buffer[LMFC_141][7];
3625  0310 5500180048    	mov	_PTC_SW_Ver,_CAN_Rx_Buffer+15
3626                     ; 363 		CAN_Msg_Update[LMFC_141] = 0;		// Data_Read_Panding
3628  0315 c70006        	ld	_CAN_Msg_Update+1,a
3629  0318               L5022:
3630                     ; 366 	if(CAN_Msg_Update[LMFC_DE_351] == MSG_UPDATE){
3632  0318 c60007        	ld	a,_CAN_Msg_Update+2
3633  031b 4a            	dec	a
3634  031c 262b          	jrne	L7022
3635                     ; 368 		LMFC_PTC_Debug[0] = CAN_Rx_Buffer[LMFC_DE_351][0]; 
3637  031e 5500190000    	mov	_LMFC_PTC_Debug,_CAN_Rx_Buffer+16
3638                     ; 369 		LMFC_PTC_Debug[1] = CAN_Rx_Buffer[LMFC_DE_351][1]; 
3640  0323 55001a0001    	mov	_LMFC_PTC_Debug+1,_CAN_Rx_Buffer+17
3641                     ; 370 		LMFC_PTC_Debug[2] = CAN_Rx_Buffer[LMFC_DE_351][2]; 
3643  0328 55001b0002    	mov	_LMFC_PTC_Debug+2,_CAN_Rx_Buffer+18
3644                     ; 371 		LMFC_PTC_Debug[3] = CAN_Rx_Buffer[LMFC_DE_351][3]; 
3646  032d 55001c0003    	mov	_LMFC_PTC_Debug+3,_CAN_Rx_Buffer+19
3647                     ; 372 		LMFC_PTC_Debug[4] = CAN_Rx_Buffer[LMFC_DE_351][4]; 
3649  0332 55001d0004    	mov	_LMFC_PTC_Debug+4,_CAN_Rx_Buffer+20
3650                     ; 373 		LMFC_PTC_Debug[5] = CAN_Rx_Buffer[LMFC_DE_351][5]; 
3652  0337 55001e0005    	mov	_LMFC_PTC_Debug+5,_CAN_Rx_Buffer+21
3653                     ; 374 		LMFC_PTC_Debug[6] = CAN_Rx_Buffer[LMFC_DE_351][6]; 
3655  033c 55001f0006    	mov	_LMFC_PTC_Debug+6,_CAN_Rx_Buffer+22
3656                     ; 375 		LMFC_PTC_Debug[7] = CAN_Rx_Buffer[LMFC_DE_351][7]; 
3658  0341 5500200007    	mov	_LMFC_PTC_Debug+7,_CAN_Rx_Buffer+23
3659                     ; 377 		CAN_Msg_Update[LMFC_DE_351] = 0;
3661  0346 c70007        	ld	_CAN_Msg_Update+2,a
3662  0349               L7022:
3663                     ; 380 	return;
3666  0349 87            	retf	
3693                     ; 385 void CAN_ModelX_Message_Handling(void)
3693                     ; 386 {
3694                     	switch	.text
3695  034a               f_CAN_ModelX_Message_Handling:
3699                     ; 387 	if(CAN_Msg_Update[PTC_205] == MSG_UPDATE){
3701  034a c60005        	ld	a,_CAN_Msg_Update
3702  034d 4a            	dec	a
3703  034e 262b          	jrne	L1222
3704                     ; 389 		MD_ID205_Data[0] = 	CAN_Rx_Buffer[PTC_205][0]; 
3706  0350 5500090000    	mov	_MD_ID205_Data,_CAN_Rx_Buffer
3707                     ; 390 		MD_ID205_Data[1] = CAN_Rx_Buffer[PTC_205][1]; 
3709  0355 55000a0001    	mov	_MD_ID205_Data+1,_CAN_Rx_Buffer+1
3710                     ; 391 		MD_ID205_Data[2] = CAN_Rx_Buffer[PTC_205][2];  
3712  035a 55000b0002    	mov	_MD_ID205_Data+2,_CAN_Rx_Buffer+2
3713                     ; 392 		MD_ID205_Data[3] = CAN_Rx_Buffer[PTC_205][3]; 
3715  035f 55000c0003    	mov	_MD_ID205_Data+3,_CAN_Rx_Buffer+3
3716                     ; 393 		MD_ID205_Data[4] = CAN_Rx_Buffer[PTC_205][4]; 
3718  0364 55000d0004    	mov	_MD_ID205_Data+4,_CAN_Rx_Buffer+4
3719                     ; 394 		MD_ID205_Data[5] = CAN_Rx_Buffer[PTC_205][5]; 
3721  0369 55000e0005    	mov	_MD_ID205_Data+5,_CAN_Rx_Buffer+5
3722                     ; 395 		MD_ID205_Data[6] = CAN_Rx_Buffer[PTC_205][6]; 
3724  036e 55000f0006    	mov	_MD_ID205_Data+6,_CAN_Rx_Buffer+6
3725                     ; 396 		MD_ID205_Data[7] = CAN_Rx_Buffer[PTC_205][7]; 
3727  0373 5500100007    	mov	_MD_ID205_Data+7,_CAN_Rx_Buffer+7
3728                     ; 398 		CAN_Msg_Update[PTC_205] = 0;
3730  0378 c70005        	ld	_CAN_Msg_Update,a
3731  037b               L1222:
3732                     ; 401 	if(CAN_Msg_Update[PTC_355] == MSG_UPDATE){
3734  037b c60006        	ld	a,_CAN_Msg_Update+1
3735  037e 4a            	dec	a
3736  037f 262b          	jrne	L3222
3737                     ; 403 		MD_ID355_Data[0] =	CAN_Rx_Buffer[PTC_355][0]; 
3739  0381 5500110000    	mov	_MD_ID355_Data,_CAN_Rx_Buffer+8
3740                     ; 404 		MD_ID355_Data[1] =	CAN_Rx_Buffer[PTC_355][1]; 
3742  0386 5500120001    	mov	_MD_ID355_Data+1,_CAN_Rx_Buffer+9
3743                     ; 405 		MD_ID355_Data[2] =	CAN_Rx_Buffer[PTC_355][2];  
3745  038b 5500130002    	mov	_MD_ID355_Data+2,_CAN_Rx_Buffer+10
3746                     ; 406 		MD_ID355_Data[3] =	CAN_Rx_Buffer[PTC_355][3]; 
3748  0390 5500140003    	mov	_MD_ID355_Data+3,_CAN_Rx_Buffer+11
3749                     ; 407 		MD_ID355_Data[4] =	CAN_Rx_Buffer[PTC_355][4]; 
3751  0395 5500150004    	mov	_MD_ID355_Data+4,_CAN_Rx_Buffer+12
3752                     ; 408 		MD_ID355_Data[5] =	CAN_Rx_Buffer[PTC_355][5]; 
3754  039a 5500160005    	mov	_MD_ID355_Data+5,_CAN_Rx_Buffer+13
3755                     ; 409 		MD_ID355_Data[6] =	CAN_Rx_Buffer[PTC_355][6]; 
3757  039f 5500170006    	mov	_MD_ID355_Data+6,_CAN_Rx_Buffer+14
3758                     ; 410 		MD_ID355_Data[7] =	CAN_Rx_Buffer[PTC_355][7]; 
3760  03a4 5500180007    	mov	_MD_ID355_Data+7,_CAN_Rx_Buffer+15
3761                     ; 412 		CAN_Msg_Update[PTC_355] = OFF;
3763  03a9 c70006        	ld	_CAN_Msg_Update+1,a
3764  03ac               L3222:
3765                     ; 416 	return;
3768  03ac 87            	retf	
3803                     ; 421 void CAN_Fail_Handling(void)
3803                     ; 422 {
3804                     	switch	.text
3805  03ad               f_CAN_Fail_Handling:
3807  03ad 88            	push	a
3808       00000001      OFST:	set	1
3811                     ; 425 	if(CAN_Error_Handling == ON){ return;	}
3813  03ae 720b001202    	btjf	_CAN_Control_Status,#5,L1422
3817  03b3 84            	pop	a
3818  03b4 87            	retf	
3819  03b5               L1422:
3820                     ; 427 	for(ID = 0; ID < CAN_MSG_ID_MAX; ID++){
3822  03b5 4f            	clr	a
3823  03b6 6b01          	ld	(OFST+0,sp),a
3824  03b8               L3422:
3825                     ; 429 		CAN_Node_Status[ID].Fail = CAN_NODE_FAIL;
3827  03b8 97            	ld	xl,a
3828  03b9 a603          	ld	a,#3
3829  03bb 42            	mul	x,a
3830  03bc a601          	ld	a,#1
3831  03be d70031        	ld	(_CAN_Node_Status,x),a
3832                     ; 430 		CAN_Node_Status[ID].Period = 0;
3834  03c1 905f          	clrw	y
3835  03c3 df0032        	ldw	(_CAN_Node_Status+1,x),y
3836                     ; 432 		CAN_Rx_Buffer[ID][0] = 0;
3838  03c6 7b01          	ld	a,(OFST+0,sp)
3839  03c8 97            	ld	xl,a
3840  03c9 a608          	ld	a,#8
3841  03cb 42            	mul	x,a
3842                     ; 433 		CAN_Rx_Buffer[ID][1] = 0;
3844  03cc 724f000a      	clr	(_CAN_Rx_Buffer+1,x)
3845  03d0 724f0009      	clr	(_CAN_Rx_Buffer,x)
3846                     ; 434 		CAN_Rx_Buffer[ID][2] = 0;
3848  03d4 724f000b      	clr	(_CAN_Rx_Buffer+2,x)
3849                     ; 435 		CAN_Rx_Buffer[ID][3] = 0;
3851  03d8 724f000c      	clr	(_CAN_Rx_Buffer+3,x)
3852                     ; 436 		CAN_Rx_Buffer[ID][4] = 0;
3854  03dc 724f000d      	clr	(_CAN_Rx_Buffer+4,x)
3855                     ; 437 		CAN_Rx_Buffer[ID][5] = 0;
3857  03e0 724f000e      	clr	(_CAN_Rx_Buffer+5,x)
3858                     ; 438 		CAN_Rx_Buffer[ID][6] = 0;
3860  03e4 724f000f      	clr	(_CAN_Rx_Buffer+6,x)
3861                     ; 439 		CAN_Rx_Buffer[ID][7] = 0;
3863  03e8 724f0010      	clr	(_CAN_Rx_Buffer+7,x)
3864                     ; 441 		CAN_Msg_Update[ID] = 0;
3866  03ec 5f            	clrw	x
3867  03ed 7b01          	ld	a,(OFST+0,sp)
3868  03ef 97            	ld	xl,a
3869  03f0 724f0005      	clr	(_CAN_Msg_Update,x)
3870                     ; 427 	for(ID = 0; ID < CAN_MSG_ID_MAX; ID++){
3872  03f4 0c01          	inc	(OFST+0,sp)
3875  03f6 7b01          	ld	a,(OFST+0,sp)
3876  03f8 a104          	cp	a,#4
3877  03fa 25bc          	jrult	L3422
3878                     ; 444 	CAN_Error_Handling = ON;
3880  03fc 721a0012      	bset	_CAN_Control_Status,#5
3881                     ; 445 	return;
3884  0400 84            	pop	a
3885  0401 87            	retf	
3927                     ; 450 void CAN_ModelS_Maessge_Transmit(void)
3927                     ; 451 {
3928                     	switch	.text
3929  0402               f_CAN_ModelS_Maessge_Transmit:
3931  0402 88            	push	a
3932       00000001      OFST:	set	1
3935                     ; 455 	if(MODELS_Tx_Event_Flag == OFF){ return;		}	//Wait_Normal_Message_Period
3937  0403 7200001102    	btjt	_CAN_Control_Status2,#0,L5622
3941  0408 84            	pop	a
3942  0409 87            	retf	
3943  040a               L5622:
3944                     ; 456 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
3946  040a 7205542306    	btjf	_CAN_TPR,#2,L1722
3949  040f 725f5427      	clr	_CAN_FPSR
3951  0413 2014          	jra	L7622
3952  0415               L1722:
3953                     ; 457 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
3955  0415 7207542306    	btjf	_CAN_TPR,#3,L5722
3958  041a 35015427      	mov	_CAN_FPSR,#1
3960  041e 2009          	jra	L7622
3961  0420               L5722:
3962                     ; 458 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
3964  0420 7209542331    	btjf	_CAN_TPR,#4,L1032
3967  0425 35055427      	mov	_CAN_FPSR,#5
3969  0429               L7622:
3970                     ; 461 	CAN_ModelS_Tx_Data_Handling();
3972  0429 8dea00ea      	callf	f_CAN_ModelS_Tx_Data_Handling
3974                     ; 463 	CAN_P1 = 0x08;						//Tx_Data Length
3976  042d 35085429      	mov	_CAN_P1,#8
3977                     ; 464 	CAN_P2 = (ID_GTW >> 6) & 0x1F;		//Tx_HAVC_ID Register1
3979  0431 3508542a      	mov	_CAN_P2,#8
3980                     ; 465 	CAN_P3 = (ID_GTW << 2) & 0xFC;		//Tx_HAVC_ID Register2
3982  0435 3558542b      	mov	_CAN_P3,#88
3983                     ; 467 	for(Offset = 0; Offset < 8; Offset++){
3985  0439 4f            	clr	a
3986  043a 6b01          	ld	(OFST+0,sp),a
3987  043c               L5032:
3988                     ; 468 		(&CAN_P6)[Offset] = CAN_Tx_Buffer[Offset];		//MDARx(Mailbox Data Register x)
3990  043c 5f            	clrw	x
3991  043d 97            	ld	xl,a
3992  043e d60029        	ld	a,(_CAN_Tx_Buffer,x)
3993  0441 d7542e        	ld	(_CAN_P6,x),a
3994                     ; 467 	for(Offset = 0; Offset < 8; Offset++){
3996  0444 0c01          	inc	(OFST+0,sp)
3999  0446 7b01          	ld	a,(OFST+0,sp)
4000  0448 a108          	cp	a,#8
4001  044a 25f0          	jrult	L5032
4002                     ; 471 	MODELS_Tx_Event_Flag = OFF;
4004  044c 72110011      	bres	_CAN_Control_Status2,#0
4005                     ; 472 	CAN_P0 |= 0x01;						//Transmit Request
4007                     ; 474 	return;
4010  0450 84            	pop	a
4011  0451 72105428      	bset	_CAN_P0,#0
4012  0455 87            	retf	
4013  0456               L1032:
4014                     ; 459 	else{	return;			      	}	//Mailbox_All_Busy
4017  0456 84            	pop	a
4018  0457 87            	retf	
4060                     ; 477 void CAN_ModelS_Vehicle_Maessge_Transmit(void)
4060                     ; 478 {
4061                     	switch	.text
4062  0458               f_CAN_ModelS_Vehicle_Maessge_Transmit:
4064  0458 88            	push	a
4065       00000001      OFST:	set	1
4068                     ; 482 	if(ModelS_TX_Vehicle_Status == OFF){ return;		}	//Wait_Normal_Message_Period
4070  0459 7206001102    	btjt	_CAN_Control_Status2,#3,L7232
4074  045e 84            	pop	a
4075  045f 87            	retf	
4076  0460               L7232:
4077                     ; 483 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
4079  0460 7205542306    	btjf	_CAN_TPR,#2,L3332
4082  0465 725f5427      	clr	_CAN_FPSR
4084  0469 2014          	jra	L1332
4085  046b               L3332:
4086                     ; 484 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
4088  046b 7207542306    	btjf	_CAN_TPR,#3,L7332
4091  0470 35015427      	mov	_CAN_FPSR,#1
4093  0474 2009          	jra	L1332
4094  0476               L7332:
4095                     ; 485 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
4097  0476 7209542331    	btjf	_CAN_TPR,#4,L3432
4100  047b 35055427      	mov	_CAN_FPSR,#5
4102  047f               L1332:
4103                     ; 488 	CAN_ModelS_Vehicle_Tx_Data_Handling();
4105  047f 8d0d010d      	callf	f_CAN_ModelS_Vehicle_Tx_Data_Handling
4107                     ; 490 	CAN_P1 = 0x08;						//Tx_Data Length
4109  0483 35085429      	mov	_CAN_P1,#8
4110                     ; 491 	CAN_P2 = (Vehicle_Status >> 6) & 0x1F;		//Tx_HAVC_ID Register1
4112  0487 3509542a      	mov	_CAN_P2,#9
4113                     ; 492 	CAN_P3 = (Vehicle_Status << 2) & 0xFC;		//Tx_HAVC_ID Register2
4115  048b 351c542b      	mov	_CAN_P3,#28
4116                     ; 494 	for(Offset = 0; Offset < 8; Offset++){
4118  048f 4f            	clr	a
4119  0490 6b01          	ld	(OFST+0,sp),a
4120  0492               L7432:
4121                     ; 495 		(&CAN_P6)[Offset] = CAN_Tx_Buffer[Offset];		//MDARx(Mailbox Data Register x)
4123  0492 5f            	clrw	x
4124  0493 97            	ld	xl,a
4125  0494 d60029        	ld	a,(_CAN_Tx_Buffer,x)
4126  0497 d7542e        	ld	(_CAN_P6,x),a
4127                     ; 494 	for(Offset = 0; Offset < 8; Offset++){
4129  049a 0c01          	inc	(OFST+0,sp)
4132  049c 7b01          	ld	a,(OFST+0,sp)
4133  049e a108          	cp	a,#8
4134  04a0 25f0          	jrult	L7432
4135                     ; 498 	ModelS_TX_Vehicle_Status = OFF;
4137  04a2 72170011      	bres	_CAN_Control_Status2,#3
4138                     ; 499 	CAN_P0 |= 0x01;						//Transmit Request
4140                     ; 501 	return;
4143  04a6 84            	pop	a
4144  04a7 72105428      	bset	_CAN_P0,#0
4145  04ab 87            	retf	
4146  04ac               L3432:
4147                     ; 486 	else{	return;			      	}	//Mailbox_All_Busy
4150  04ac 84            	pop	a
4151  04ad 87            	retf	
4193                     ; 504 void CAN_ModelX_Maessge_Transmit(void)
4193                     ; 505 {
4194                     	switch	.text
4195  04ae               f_CAN_ModelX_Maessge_Transmit:
4197  04ae 88            	push	a
4198       00000001      OFST:	set	1
4201                     ; 509 	if(ModelX_Tx_Event_Flag == OFF){ return;		}	//Wait_Normal_Message_Period
4203  04af 7208001102    	btjt	_CAN_Control_Status2,#4,L1732
4207  04b4 84            	pop	a
4208  04b5 87            	retf	
4209  04b6               L1732:
4210                     ; 510 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
4212  04b6 7205542306    	btjf	_CAN_TPR,#2,L5732
4215  04bb 725f5427      	clr	_CAN_FPSR
4217  04bf 2014          	jra	L3732
4218  04c1               L5732:
4219                     ; 511 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
4221  04c1 7207542306    	btjf	_CAN_TPR,#3,L1042
4224  04c6 35015427      	mov	_CAN_FPSR,#1
4226  04ca 2009          	jra	L3732
4227  04cc               L1042:
4228                     ; 512 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
4230  04cc 7209542331    	btjf	_CAN_TPR,#4,L5042
4233  04d1 35055427      	mov	_CAN_FPSR,#5
4235  04d5               L3732:
4236                     ; 515 	CAN_ModelX_Tx_Data_Handling();
4238  04d5 8d2f012f      	callf	f_CAN_ModelX_Tx_Data_Handling
4240                     ; 517 	CAN_P1 = 0x08;						//Tx_Data Length
4242  04d9 35085429      	mov	_CAN_P1,#8
4243                     ; 518 	CAN_P2 = (MDX_HVAC_STATUS >> 6) & 0x1F;		//Tx_HAVC_ID Register1
4245  04dd 350a542a      	mov	_CAN_P2,#10
4246                     ; 519 	CAN_P3 = (MDX_HVAC_STATUS << 2) & 0xFC;		//Tx_HAVC_ID Register2
4248  04e1 35a8542b      	mov	_CAN_P3,#168
4249                     ; 521 	for(Offset = 0; Offset < 8; Offset++){
4251  04e5 4f            	clr	a
4252  04e6 6b01          	ld	(OFST+0,sp),a
4253  04e8               L1142:
4254                     ; 522 		(&CAN_P6)[Offset] = CAN_Tx_Buffer[Offset];		//MDARx(Mailbox Data Register x)
4256  04e8 5f            	clrw	x
4257  04e9 97            	ld	xl,a
4258  04ea d60029        	ld	a,(_CAN_Tx_Buffer,x)
4259  04ed d7542e        	ld	(_CAN_P6,x),a
4260                     ; 521 	for(Offset = 0; Offset < 8; Offset++){
4262  04f0 0c01          	inc	(OFST+0,sp)
4265  04f2 7b01          	ld	a,(OFST+0,sp)
4266  04f4 a108          	cp	a,#8
4267  04f6 25f0          	jrult	L1142
4268                     ; 525 	ModelX_Tx_Event_Flag = OFF;
4270  04f8 72190011      	bres	_CAN_Control_Status2,#4
4271                     ; 526 	CAN_P0 |= 0x01;						//Transmit Request
4273                     ; 528 	return;
4276  04fc 84            	pop	a
4277  04fd 72105428      	bset	_CAN_P0,#0
4278  0501 87            	retf	
4279  0502               L5042:
4280                     ; 513 	else{	return;			      	}	//Mailbox_All_Busy
4283  0502 84            	pop	a
4284  0503 87            	retf	
4326                     ; 534 void CAN_PS_Maessge_Transmit(void)
4326                     ; 535 {
4327                     	switch	.text
4328  0504               f_CAN_PS_Maessge_Transmit:
4330  0504 88            	push	a
4331       00000001      OFST:	set	1
4334                     ; 539 	if(PS_Tx_Event_Flag == OFF){ return;		}	//Wait_Normal_Message_Period
4336  0505 7202001102    	btjt	_CAN_Control_Status2,#1,L3342
4340  050a 84            	pop	a
4341  050b 87            	retf	
4342  050c               L3342:
4343                     ; 540 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
4345  050c 7205542306    	btjf	_CAN_TPR,#2,L7342
4348  0511 725f5427      	clr	_CAN_FPSR
4350  0515 2014          	jra	L5342
4351  0517               L7342:
4352                     ; 541 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
4354  0517 7207542306    	btjf	_CAN_TPR,#3,L3442
4357  051c 35015427      	mov	_CAN_FPSR,#1
4359  0520 2009          	jra	L5342
4360  0522               L3442:
4361                     ; 542 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
4363  0522 7209542331    	btjf	_CAN_TPR,#4,L7442
4366  0527 35055427      	mov	_CAN_FPSR,#5
4368  052b               L5342:
4369                     ; 545 	CAN_PS_Tx_Data_Handling();
4371  052b 8d630163      	callf	f_CAN_PS_Tx_Data_Handling
4373                     ; 547 	CAN_P1 = 0x08;						//Tx_Data Length
4375  052f 35085429      	mov	_CAN_P1,#8
4376                     ; 548 	CAN_P2 = (ID_ACU2 >> 6) & 0x1F;		//Tx_HAVC_ID Register1
4378  0533 3504542a      	mov	_CAN_P2,#4
4379                     ; 549 	CAN_P3 = (ID_ACU2 << 2) & 0xFC;		//Tx_HAVC_ID Register2
4381  0537 3544542b      	mov	_CAN_P3,#68
4382                     ; 551 	for(Offset = 0; Offset < 8; Offset++){
4384  053b 4f            	clr	a
4385  053c 6b01          	ld	(OFST+0,sp),a
4386  053e               L3542:
4387                     ; 552 		(&CAN_P6)[Offset] = CAN_Tx_Buffer[Offset];		//MDARx(Mailbox Data Register x)
4389  053e 5f            	clrw	x
4390  053f 97            	ld	xl,a
4391  0540 d60029        	ld	a,(_CAN_Tx_Buffer,x)
4392  0543 d7542e        	ld	(_CAN_P6,x),a
4393                     ; 551 	for(Offset = 0; Offset < 8; Offset++){
4395  0546 0c01          	inc	(OFST+0,sp)
4398  0548 7b01          	ld	a,(OFST+0,sp)
4399  054a a108          	cp	a,#8
4400  054c 25f0          	jrult	L3542
4401                     ; 555 	PS_Tx_Event_Flag = OFF;
4403  054e 72130011      	bres	_CAN_Control_Status2,#1
4404                     ; 556 	CAN_P0 |= 0x01;						//Transmit Request
4406                     ; 558 	return;
4409  0552 84            	pop	a
4410  0553 72105428      	bset	_CAN_P0,#0
4411  0557 87            	retf	
4412  0558               L7442:
4413                     ; 543 	else{	return;			      	}	//Mailbox_All_Busy
4416  0558 84            	pop	a
4417  0559 87            	retf	
4459                     ; 561 void CAN_LMFC_Maessge_Transmit(void)
4459                     ; 562 {
4460                     	switch	.text
4461  055a               f_CAN_LMFC_Maessge_Transmit:
4463  055a 88            	push	a
4464       00000001      OFST:	set	1
4467                     ; 566 	if(LMFC_Tx_Event_Flag == OFF){ return;		}	//Wait_Normal_Message_Period
4469  055b 7204001102    	btjt	_CAN_Control_Status2,#2,L5742
4473  0560 84            	pop	a
4474  0561 87            	retf	
4475  0562               L5742:
4476                     ; 567 	else if(CAN_TPR & 0x04){ CAN_FPSR = 0x00;	}	//Mailbox_0_Empty
4478  0562 7205542306    	btjf	_CAN_TPR,#2,L1052
4481  0567 725f5427      	clr	_CAN_FPSR
4483  056b 2014          	jra	L7742
4484  056d               L1052:
4485                     ; 568 	else if(CAN_TPR & 0x08){ CAN_FPSR = 0x01;	}	//Mailbox_1_Empty
4487  056d 7207542306    	btjf	_CAN_TPR,#3,L5052
4490  0572 35015427      	mov	_CAN_FPSR,#1
4492  0576 2009          	jra	L7742
4493  0578               L5052:
4494                     ; 569 	else if(CAN_TPR & 0x10){ CAN_FPSR = 0x05;	}	//Mailbox_2_Empty
4496  0578 7209542331    	btjf	_CAN_TPR,#4,L1152
4499  057d 35055427      	mov	_CAN_FPSR,#5
4501  0581               L7742:
4502                     ; 572 	CAN_LMFC_Tx_Data_Handling();
4504  0581 8d860186      	callf	f_CAN_LMFC_Tx_Data_Handling
4506                     ; 574 	CAN_P1 = 0x08;						//Tx_Data Length
4508  0585 35085429      	mov	_CAN_P1,#8
4509                     ; 575 	CAN_P2 = (FATC2 >> 6) & 0x1F;		//Tx_HAVC_ID Register1
4511  0589 3504542a      	mov	_CAN_P2,#4
4512                     ; 576 	CAN_P3 = (FATC2 << 2) & 0xFC;		//Tx_HAVC_ID Register2
4514  058d 3544542b      	mov	_CAN_P3,#68
4515                     ; 578 	for(Offset = 0; Offset < 8; Offset++){
4517  0591 4f            	clr	a
4518  0592 6b01          	ld	(OFST+0,sp),a
4519  0594               L5152:
4520                     ; 579 		(&CAN_P6)[Offset] = CAN_Tx_Buffer[Offset];		//MDARx(Mailbox Data Register x)
4522  0594 5f            	clrw	x
4523  0595 97            	ld	xl,a
4524  0596 d60029        	ld	a,(_CAN_Tx_Buffer,x)
4525  0599 d7542e        	ld	(_CAN_P6,x),a
4526                     ; 578 	for(Offset = 0; Offset < 8; Offset++){
4528  059c 0c01          	inc	(OFST+0,sp)
4531  059e 7b01          	ld	a,(OFST+0,sp)
4532  05a0 a108          	cp	a,#8
4533  05a2 25f0          	jrult	L5152
4534                     ; 582 	PS_Tx_Event_Flag = OFF;
4536  05a4 72130011      	bres	_CAN_Control_Status2,#1
4537                     ; 583 	CAN_P0 |= 0x01;						//Transmit Request
4539                     ; 585 	return;
4542  05a8 84            	pop	a
4543  05a9 72105428      	bset	_CAN_P0,#0
4544  05ad 87            	retf	
4545  05ae               L1152:
4546                     ; 570 	else{	return;			      	}	//Mailbox_All_Busy
4549  05ae 84            	pop	a
4550  05af 87            	retf	
4607                     ; 589 void CAN_Management_Routine(void)
4607                     ; 590 {
4608                     	switch	.text
4609  05b0               f_CAN_Management_Routine:
4613                     ; 593 	switch(CAN_Operation_App){
4615  05b0 b610          	ld	a,_CAN_Operation_App
4617                     ; 739 			break;
4618  05b2 2710          	jreq	L3252
4619  05b4 4a            	dec	a
4620  05b5 2749          	jreq	L5252
4621  05b7 4a            	dec	a
4622  05b8 2768          	jreq	L7252
4623  05ba 4a            	dec	a
4624  05bb 2604acef06ef  	jreq	L1352
4625                     ; 738 		default :	CAN_Operation_App = 0;
4627  05c1 3f10          	clr	_CAN_Operation_App
4628                     ; 739 			break;
4631  05c3 87            	retf	
4632  05c4               L3252:
4633                     ; 596 		case 0 :	
4633                     ; 597 			CAN_Control_Status = 0x00;			//CAN Control = Reset
4635  05c4 b712          	ld	_CAN_Control_Status,a
4636                     ; 598 			CAN_Initialize_Delay = 0;
4638  05c6 b70a          	ld	_CAN_Initialize_Delay,a
4639                     ; 600 			if(ModelS_PTC_flag){ 
4641  05c8 720300000e    	btjf	_Can_Select_Device,#1,L1552
4642                     ; 601 				MODELS_TX_Event_Time = MODELS_TX_PERIOD;		//Tx_Interval
4644  05cd 35050009      	mov	_MODELS_TX_Event_Time,#5
4645                     ; 602 				MODELS_TX_Event_Counter = 0;			//Tx_Counter Clear
4647  05d1 b708          	ld	_MODELS_TX_Event_Counter,a
4648                     ; 604 				MODELS_TX_Vehicle_Event_Time = MODELS_TX_PERIOD;
4650  05d3 35050007      	mov	_MODELS_TX_Vehicle_Event_Time,#5
4651                     ; 605 				MODELS_TX_Vehicle_Counter = 0;
4653  05d7 b706          	ld	_MODELS_TX_Vehicle_Counter,a
4655  05d9 2018          	jra	L3552
4656  05db               L1552:
4657                     ; 607 			else if(PS_PTC_flag){ 
4659  05db 720b000008    	btjf	_Can_Select_Device,#5,L5552
4660                     ; 608 				PS_TX_Event_Time =  PS_TX_PERIOD;
4662  05e0 35050003      	mov	_PS_TX_Event_Time,#5
4663                     ; 609 				PS_TX_Event_Counter = 0;
4665  05e4 3f02          	clr	_PS_TX_Event_Counter
4667  05e6 200b          	jra	L3552
4668  05e8               L5552:
4669                     ; 611 			else if(LMFC_PTC_flag){
4671  05e8 7209000006    	btjf	_Can_Select_Device,#4,L3552
4672                     ; 612 				LMFC_TX_Event_Time = LMFC_TX_PERIOD;
4674  05ed 35050001      	mov	_LMFC_TX_Event_Time,#5
4675                     ; 613 				LMFC_TX_Event_Counter = 0;
4677  05f1 3f00          	clr	_LMFC_TX_Event_Counter
4678  05f3               L3552:
4679                     ; 617 			CAN_Fail_Handling();
4681  05f3 8dad03ad      	callf	f_CAN_Fail_Handling
4683                     ; 618 			CAN_BUS_OFF_Flag = ON;			//Defult CAN_Bus_OFF = ON
4685  05f7 72100012      	bset	_CAN_Control_Status,#0
4686                     ; 619 			CAN_Operation_App = 1;
4688  05fb 35010010      	mov	_CAN_Operation_App,#1
4689                     ; 620 			break;
4692  05ff 87            	retf	
4693  0600               L5252:
4694                     ; 623 		case 1 :	//if(CAN_Initialize_Delay > 12){			//10ms x 13 = 130ms_Delay
4694                     ; 624 			if(CAN_TInitialize == ON){			//10ms x 13 = 130ms_Delay
4696  0600 7202001204ac  	btjf	_CAN_Control_Status,#1,L7452
4697                     ; 625 				Windows_Watchdog_Control();
4699  0609 8d000000      	callf	f_Windows_Watchdog_Control
4701                     ; 626 				CAN_Interrupt_Disable();
4703  060d 8d000000      	callf	f_CAN_Interrupt_Disable
4705                     ; 627 				CAN_Enable();
4707  0611 8d000000      	callf	f_CAN_Enable
4709                     ; 628 				CAN_Interrupt_Enable();
4711  0615 8d000000      	callf	f_CAN_Interrupt_Enable
4713                     ; 629 				TLE6250_Standby = LOW;
4715  0619 721f500a      	bres	_PC_ODR,#7
4716                     ; 630 				CAN_Operation_App = 3;		//Normal Operation
4718  061d 35030010      	mov	_CAN_Operation_App,#3
4720  0621 87            	retf	
4721  0622               L7252:
4722                     ; 637 		case 2 :	if(CAN_Tx_Error_Flag == ON){			//Recovery_Attempt_Completed
4724  0622 720700124e    	btjf	_CAN_Control_Status,#3,L5652
4725                     ; 638 				CAN_Interrupt_Disable();
4727  0627 8d000000      	callf	f_CAN_Interrupt_Disable
4729                     ; 639 				CAN_Transmit_Cancel();
4731  062b 8d000000      	callf	f_CAN_Transmit_Cancel
4733                     ; 641 				if(ModelS_PTC_flag){ 
4735  062f 720300000e    	btjf	_Can_Select_Device,#1,L7652
4736                     ; 642 					MODELS_TX_Event_Time = CAN_RECOVERY_TIME;
4738  0634 35c80009      	mov	_MODELS_TX_Event_Time,#200
4739                     ; 643 					MODELS_TX_Event_Counter = 0;		//Tx_Counter Clear
4741  0638 3f08          	clr	_MODELS_TX_Event_Counter
4742                     ; 646 					MODELS_TX_Vehicle_Event_Time = CAN_RECOVERY_TIME;
4744  063a 35c80007      	mov	_MODELS_TX_Vehicle_Event_Time,#200
4745                     ; 647 					MODELS_TX_Vehicle_Counter = 0;
4747  063e 3f06          	clr	_MODELS_TX_Vehicle_Counter
4749  0640 2025          	jra	L1752
4750  0642               L7652:
4751                     ; 649 				else if(PS_PTC_flag){ 
4753  0642 720b000008    	btjf	_Can_Select_Device,#5,L3752
4754                     ; 650 					PS_TX_Event_Time =  CAN_RECOVERY_TIME;
4756  0647 35c80003      	mov	_PS_TX_Event_Time,#200
4757                     ; 651 					PS_TX_Event_Counter = 0;
4759  064b 3f02          	clr	_PS_TX_Event_Counter
4761  064d 2018          	jra	L1752
4762  064f               L3752:
4763                     ; 653 				else if(LMFC_PTC_flag){
4765  064f 7209000008    	btjf	_Can_Select_Device,#4,L7752
4766                     ; 654 					LMFC_TX_Event_Time = CAN_RECOVERY_TIME;
4768  0654 35c80001      	mov	_LMFC_TX_Event_Time,#200
4769                     ; 655 					LMFC_TX_Event_Counter = 0;
4771  0658 3f00          	clr	_LMFC_TX_Event_Counter
4773  065a 200b          	jra	L1752
4774  065c               L7752:
4775                     ; 657 				else if(ModelX_PTC_flag){
4777  065c 720d000006    	btjf	_Can_Select_Device,#6,L1752
4778                     ; 658 					ModelX_TX_Event_Time = CAN_RECOVERY_TIME;
4780  0661 35c80005      	mov	_ModelX_TX_Event_Time,#200
4781                     ; 659 					ModelX_TX_Event_Cnt = 0;
4783  0665 3f04          	clr	_ModelX_TX_Event_Cnt
4784  0667               L1752:
4785                     ; 662 				CAN_BUS_OFF_Flag = ON;		//CAN_Bus = OFF
4787  0667 72100012      	bset	_CAN_Control_Status,#0
4788                     ; 663 				CAN_Tx_Error_Flag = OFF;
4790  066b 72170012      	bres	_CAN_Control_Status,#3
4791                     ; 664 				CAN_Interrupt_Enable();
4793  066f 8d000000      	callf	f_CAN_Interrupt_Enable
4796  0673 2076          	jra	L5062
4797  0675               L5652:
4798                     ; 668 			else if(MODELS_Tx_Event_Flag == ON){		//Set Flag from Timer_Interrupt
4800  0675 7201001116    	btjf	_CAN_Control_Status2,#0,L7062
4801                     ; 669 				Windows_Watchdog_Control();
4803  067a 8d000000      	callf	f_Windows_Watchdog_Control
4805                     ; 670 				CAN_Interrupt_Disable();
4807  067e 8d000000      	callf	f_CAN_Interrupt_Disable
4809                     ; 671 				CAN_Enable();
4811  0682 8d000000      	callf	f_CAN_Enable
4813                     ; 672 				CAN_Interrupt_Enable();
4815  0686 8d000000      	callf	f_CAN_Interrupt_Enable
4817                     ; 673 				CAN_ModelS_Maessge_Transmit();
4819  068a 8d020402      	callf	f_CAN_ModelS_Maessge_Transmit
4822  068e 205b          	jra	L5062
4823  0690               L7062:
4824                     ; 676 			else if(PS_Tx_Event_Flag){
4826  0690 720300111a    	btjf	_CAN_Control_Status2,#1,L3162
4827                     ; 677 				Windows_Watchdog_Control();
4829  0695 8d000000      	callf	f_Windows_Watchdog_Control
4831                     ; 678 				CAN_Interrupt_Disable();
4833  0699 8d000000      	callf	f_CAN_Interrupt_Disable
4835                     ; 679 				CAN_Enable();
4837  069d 8d000000      	callf	f_CAN_Enable
4839                     ; 680 				CAN_Interrupt_Enable();
4841  06a1 8d000000      	callf	f_CAN_Interrupt_Enable
4843                     ; 681 				TLE6250_Standby = LOW;
4845  06a5 721f500a      	bres	_PC_ODR,#7
4846                     ; 682 				CAN_PS_Maessge_Transmit();
4848  06a9 8d040504      	callf	f_CAN_PS_Maessge_Transmit
4851  06ad 203c          	jra	L5062
4852  06af               L3162:
4853                     ; 685 			else if(LMFC_Tx_Event_Flag){
4855  06af 720500111a    	btjf	_CAN_Control_Status2,#2,L7162
4856                     ; 686 				Windows_Watchdog_Control();
4858  06b4 8d000000      	callf	f_Windows_Watchdog_Control
4860                     ; 687 				CAN_Interrupt_Disable();
4862  06b8 8d000000      	callf	f_CAN_Interrupt_Disable
4864                     ; 688 				CAN_Enable();
4866  06bc 8d000000      	callf	f_CAN_Enable
4868                     ; 689 				CAN_Interrupt_Enable();
4870  06c0 8d000000      	callf	f_CAN_Interrupt_Enable
4872                     ; 690 				TLE6250_Standby = LOW;
4874  06c4 721f500a      	bres	_PC_ODR,#7
4875                     ; 691 				CAN_LMFC_Maessge_Transmit();
4877  06c8 8d5a055a      	callf	f_CAN_LMFC_Maessge_Transmit
4880  06cc 201d          	jra	L5062
4881  06ce               L7162:
4882                     ; 693 			else if(ModelX_Tx_Event_Flag){
4884  06ce 7209001118    	btjf	_CAN_Control_Status2,#4,L5062
4885                     ; 694 				Windows_Watchdog_Control();
4887  06d3 8d000000      	callf	f_Windows_Watchdog_Control
4889                     ; 695 				CAN_Interrupt_Disable();
4891  06d7 8d000000      	callf	f_CAN_Interrupt_Disable
4893                     ; 696 				CAN_Enable();
4895  06db 8d000000      	callf	f_CAN_Enable
4897                     ; 697 				CAN_Interrupt_Enable();
4899  06df 8d000000      	callf	f_CAN_Interrupt_Enable
4901                     ; 698 				TLE6250_Standby = LOW;
4903  06e3 721f500a      	bres	_PC_ODR,#7
4904                     ; 699 				CAN_ModelX_Maessge_Transmit();
4906  06e7 8dae04ae      	callf	f_CAN_ModelX_Maessge_Transmit
4908  06eb               L5062:
4909                     ; 703 			CAN_Fail_Handling();			//Only One Time Run the CAN BUS OFF Logic
4912                     ; 704 			break;
4915  06eb acad03ad      	jpf	f_CAN_Fail_Handling
4916  06ef               L1352:
4917                     ; 708 		case 3 :	
4917                     ; 709 			if(CAN_BUS_OFF_Flag == ON){		//CAN Bus Fail Return	
4919  06ef 720100122e    	btjf	_CAN_Control_Status,#0,L5262
4920                     ; 711 				if(ModelS_PTC_flag){ MODELS_TX_Event_Time = MODELS_TX_PERIOD;}
4922  06f4 7203000006    	btjf	_Can_Select_Device,#1,L7262
4925  06f9 35050009      	mov	_MODELS_TX_Event_Time,#5
4927  06fd 201f          	jra	L1362
4928  06ff               L7262:
4929                     ; 712 				else if(PS_PTC_flag){ PS_TX_Event_Time = PS_TX_PERIOD; }
4931  06ff 720b000006    	btjf	_Can_Select_Device,#5,L3362
4934  0704 35050003      	mov	_PS_TX_Event_Time,#5
4936  0708 2014          	jra	L1362
4937  070a               L3362:
4938                     ; 713 				else if(LMFC_PTC_flag){ LMFC_TX_Event_Time = LMFC_TX_PERIOD;}
4940  070a 7209000006    	btjf	_Can_Select_Device,#4,L7362
4943  070f 35050001      	mov	_LMFC_TX_Event_Time,#5
4945  0713 2009          	jra	L1362
4946  0715               L7362:
4947                     ; 714 				else if(ModelX_PTC_flag){ModelX_TX_Event_Time = MODELS_TX_PERIOD;}
4949  0715 720d000004    	btjf	_Can_Select_Device,#6,L1362
4952  071a 35050005      	mov	_ModelX_TX_Event_Time,#5
4953  071e               L1362:
4954                     ; 715 				CAN_BUS_OFF_Flag = OFF;		//CAN_Bus = OK
4956  071e 72110012      	bres	_CAN_Control_Status,#0
4957  0722               L5262:
4958                     ; 719 			if((ModelS_PTC_V56_flag) || (ModelS_PTC_V58_flag)){CAN_ModelS_Message_Handling();}
4960  0722 7204000005    	btjt	_Can_Select_Device,#2,L7462
4962  0727 720700000f    	btjf	_Can_Select_Device,#3,L5462
4963  072c               L7462:
4966  072c 8da901a9      	callf	f_CAN_ModelS_Message_Handling
4969  0730               L1562:
4970                     ; 725 			if(ModelS_PTC_V58_flag){
4972  0730 7207000027    	btjf	_Can_Select_Device,#3,L5662
4973                     ; 726 				CAN_ModelS_Vehicle_Maessge_Transmit();
4975  0735 8d580458      	callf	f_CAN_ModelS_Vehicle_Maessge_Transmit
4977  0739 2021          	jra	L5662
4978  073b               L5462:
4979                     ; 720 			else if(PS_PTC_flag){ CAN_PS_Message_Handling(); }
4981  073b 720b000006    	btjf	_Can_Select_Device,#5,L3562
4984  0740 8d1c021c      	callf	f_CAN_PS_Message_Handling
4987  0744 20ea          	jra	L1562
4988  0746               L3562:
4989                     ; 721 			else if(LMFC_PTC_flag){CAN_LMFC_Message_Handling(); }
4991  0746 7209000006    	btjf	_Can_Select_Device,#4,L7562
4994  074b 8db902b9      	callf	f_CAN_LMFC_Message_Handling
4997  074f 20df          	jra	L1562
4998  0751               L7562:
4999                     ; 722 			else if(ModelX_PTC_flag){CAN_ModelX_Message_Handling();}
5001  0751 720d0000da    	btjf	_Can_Select_Device,#6,L1562
5004  0756 8d4a034a      	callf	f_CAN_ModelX_Message_Handling
5006  075a 20d4          	jra	L1562
5007  075c               L5662:
5008                     ; 729 			if(MD_Trans_flag){ 
5010  075c 7205000008    	btjf	_MD_Test_Register,#2,L7662
5011                     ; 730 				CAN_ModelS_Maessge_Transmit(); 
5013  0761 8d020402      	callf	f_CAN_ModelS_Maessge_Transmit
5015                     ; 731 				CAN_ModelX_Maessge_Transmit();
5020  0765 acae04ae      	jpf	f_CAN_ModelX_Maessge_Transmit
5021  0769               L7662:
5022                     ; 733 			else if(PS_Trans_flag){ CAN_PS_Maessge_Transmit(); }
5024  0769 7205000004    	btjf	_PS_Test_Register,#2,L3762
5030  076e ac040504      	jpf	f_CAN_PS_Maessge_Transmit
5031  0772               L3762:
5032                     ; 734 			else if(LMFC_Trans_flag){ CAN_LMFC_Maessge_Transmit();}
5034  0772 7205000004    	btjf	_LMFC_Test_Register,#2,L7452
5037  0777 8d5a055a      	callf	f_CAN_LMFC_Maessge_Transmit
5039  077b               L7452:
5040                     ; 741 	return;
5043  077b 87            	retf	
5069                     ; 745 @far @interrupt void CAN_Tx_Interrupt(void)
5069                     ; 746 {
5070                     	switch	.text
5071  077c               f_CAN_Tx_Interrupt:
5075                     ; 748 	if(CAN_MSR & 0x08){ CAN_MSR |= 0x08;	}			//Clear Wakeup Flag
5077  077c 7207542104    	btjf	_CAN_MSR,#3,L1172
5080  0781 72165421      	bset	_CAN_MSR,#3
5081  0785               L1172:
5082                     ; 751 	if(CAN_MSR & 0x04){
5084  0785 720554210c    	btjf	_CAN_MSR,#2,L3172
5085                     ; 752 		CAN_MSR |= 0x04;					//Clear Error Flag
5087  078a 72145421      	bset	_CAN_MSR,#2
5088                     ; 753 		CAN_Tx_Error_Flag = ON;				//CAN_Tx_Error_Flag = ON
5090  078e 72160012      	bset	_CAN_Control_Status,#3
5091                     ; 754 		CAN_Operation_App = 2;				//Recover Mode
5093  0792 35020010      	mov	_CAN_Operation_App,#2
5094  0796               L3172:
5095                     ; 758 	if(CAN_TSR & 0x01){
5097  0796 720154220d    	btjf	_CAN_TSR,#0,L5172
5098                     ; 760 		if(CAN_TSR & 0x10){
5100  079b 7209542204    	btjf	_CAN_TSR,#4,L7172
5101                     ; 761 			CAN_Operation_App = 3;			//CAN_Normal_Operation
5103  07a0 35030010      	mov	_CAN_Operation_App,#3
5104  07a4               L7172:
5105                     ; 765 		CAN_TSR |= 0x01;				//Clear_Interrupt_Flag
5107  07a4 72105422      	bset	_CAN_TSR,#0
5108  07a8               L5172:
5109                     ; 769 	if(CAN_TSR & 0x02){
5111  07a8 720354220d    	btjf	_CAN_TSR,#1,L1272
5112                     ; 771 		if(CAN_TSR & 0x20){
5114  07ad 720b542204    	btjf	_CAN_TSR,#5,L3272
5115                     ; 772 			CAN_Operation_App = 3;			//CAN_Normal_Operation
5117  07b2 35030010      	mov	_CAN_Operation_App,#3
5118  07b6               L3272:
5119                     ; 776 		CAN_TSR |= 0x02;				//Clear_Interrupt_Flag
5121  07b6 72125422      	bset	_CAN_TSR,#1
5122  07ba               L1272:
5123                     ; 780 	if(CAN_TSR & 0x04){
5125  07ba 720554220d    	btjf	_CAN_TSR,#2,L5272
5126                     ; 782 		if(CAN_TSR & 0x40){
5128  07bf 720d542204    	btjf	_CAN_TSR,#6,L7272
5129                     ; 783 			CAN_Operation_App = 3;			//CAN_Normal_Operation
5131  07c4 35030010      	mov	_CAN_Operation_App,#3
5132  07c8               L7272:
5133                     ; 787 		CAN_TSR |= 0x04;				//Clear_Interrupt_Flag
5135  07c8 72145422      	bset	_CAN_TSR,#2
5136  07cc               L5272:
5137                     ; 790 	return;
5140  07cc 80            	iret	
5142                     	switch	.bss
5143  0000               L1372_From_ID:
5144  0000 00            	ds.b	1
5145  0001               L5372_Current_Page:
5146  0001 00            	ds.b	1
5201                     ; 793 @far @interrupt void CAN_Rx_Interrupt(void)
5201                     ; 794 {
5202                     	switch	.text
5203  07cd               f_CAN_Rx_Interrupt:
5205       00000001      OFST:	set	1
5206  07cd 3b0002        	push	c_x+2
5207  07d0 be00          	ldw	x,c_x
5208  07d2 89            	pushw	x
5209  07d3 3b0002        	push	c_y+2
5210  07d6 be00          	ldw	x,c_y
5211  07d8 89            	pushw	x
5212  07d9 88            	push	a
5215                     ; 798 	CAN_Interrupt_Disable();
5217  07da 8d000000      	callf	f_CAN_Interrupt_Disable
5219                     ; 800 	Current_Page = CAN_FPSR;							//Backup PSR(Page selection Register)
5221  07de 5554270001    	mov	L5372_Current_Page,_CAN_FPSR
5222                     ; 803 	if(CAN_RFR & 0x10){	 CAN_RFR |= 0x10;		}				//Clear the FIFO FOVR bit
5224  07e3 7209542406    	btjf	_CAN_RFR,#4,L7572
5227  07e8 72185424      	bset	_CAN_RFR,#4
5229  07ec 206f          	jra	L7672
5230  07ee               L7572:
5231                     ; 806 	else if(CAN_RFR & 0x08){ CAN_RFR |= 0x08;	}				//Clear the FIFO FULL bit
5233  07ee 720754246a    	btjf	_CAN_RFR,#3,L7672
5236  07f3 72165424      	bset	_CAN_RFR,#3
5237  07f7 2064          	jra	L7672
5238  07f9               L5672:
5239                     ; 810 		CAN_FPSR = 0x07;								//CAN Receive FIFO Page Select
5241  07f9 35075427      	mov	_CAN_FPSR,#7
5242                     ; 811 		From_ID = CAN_P0;							//수신된 데이타를 누가 보냈는지 CAN_P0를 통해 알 수 있음.
5244  07fd 5554280000    	mov	L1372_From_ID,_CAN_P0
5245                     ; 813 		if((CAN_P1 & 0x0F) != 8){	_asm("nop");	}			//All_Message_Data_Legnth = 8Byte
5247  0802 c65429        	ld	a,_CAN_P1
5248  0805 a40f          	and	a,#15
5249  0807 a108          	cp	a,#8
5250  0809 2703          	jreq	L3772
5254  080b 9d            	nop	
5257  080c 2046          	jra	L5772
5258  080e               L3772:
5259                     ; 815 		else if(From_ID < CAN_MSG_ID_MAX){						//Rx_Mask_ID Filter Match?
5261  080e c60000        	ld	a,L1372_From_ID
5262  0811 a104          	cp	a,#4
5263  0813 243f          	jruge	L5772
5264                     ; 816 			for(Index = 0; Index < 8; Index++){				//Copy Rx_Buffer from CAN Mailbox Register
5266  0815 0f01          	clr	(OFST+0,sp)
5267  0817               L1003:
5268                     ; 817 				CAN_Rx_Buffer[From_ID][Index] = *((&CAN_P6) + Index);
5270  0817 c60000        	ld	a,L1372_From_ID
5271  081a 97            	ld	xl,a
5272  081b a608          	ld	a,#8
5273  081d 42            	mul	x,a
5274  081e 01            	rrwa	x,a
5275  081f 1b01          	add	a,(OFST+0,sp)
5276  0821 2401          	jrnc	L402
5277  0823 5c            	incw	x
5278  0824               L402:
5279  0824 02            	rlwa	x,a
5280  0825 7b01          	ld	a,(OFST+0,sp)
5281  0827 905f          	clrw	y
5282  0829 9097          	ld	yl,a
5283  082b 90d6542e      	ld	a,(_CAN_P6,y)
5284  082f d70009        	ld	(_CAN_Rx_Buffer,x),a
5285                     ; 816 			for(Index = 0; Index < 8; Index++){				//Copy Rx_Buffer from CAN Mailbox Register
5287  0832 0c01          	inc	(OFST+0,sp)
5290  0834 7b01          	ld	a,(OFST+0,sp)
5291  0836 a108          	cp	a,#8
5292  0838 25dd          	jrult	L1003
5293                     ; 821 			CAN_Node_Status[From_ID].Fail = OFF;				//Fail_Status_Clear
5295  083a c60000        	ld	a,L1372_From_ID
5296  083d 97            	ld	xl,a
5297  083e a603          	ld	a,#3
5298  0840 42            	mul	x,a
5299                     ; 822 			CAN_Node_Status[From_ID].Period = 0;				//Rx_Error_Counter_Clear
5301  0841 905f          	clrw	y
5302  0843 724f0031      	clr	(_CAN_Node_Status,x)
5303  0847 df0032        	ldw	(_CAN_Node_Status+1,x),y
5304                     ; 823 			CAN_Msg_Update[From_ID] = MSG_UPDATE;			//New_Rx_Data
5306  084a 5f            	clrw	x
5307  084b c60000        	ld	a,L1372_From_ID
5308  084e 97            	ld	xl,a
5309  084f a601          	ld	a,#1
5310  0851 d70005        	ld	(_CAN_Msg_Update,x),a
5311  0854               L5772:
5312                     ; 826 		CAN_RFR |= 0x20;						//Release FIFO  --> 메일박스 인덱스를 하나 감소한다.(STM8 메일박스는 = 3개임)
5314  0854 721a5424      	bset	_CAN_RFR,#5
5316  0858               L1103:
5317                     ; 827 		while(CAN_RFR & 0x20);					//Release Completed?
5319  0858 720a5424fb    	btjt	_CAN_RFR,#5,L1103
5320  085d               L7672:
5321                     ; 809 	while(CAN_RFR & 0x03){							//CAN Received? = 메일박스 버퍼는 2개이며, 전 데이타를 못읽었으면 두번째 버퍼에 자동으로 저장됨.
5323  085d c65424        	ld	a,_CAN_RFR
5324  0860 a503          	bcp	a,#3
5325  0862 2695          	jrne	L5672
5326                     ; 830 	CAN_FPSR = Current_Page;
5328  0864 5500015427    	mov	_CAN_FPSR,L5372_Current_Page
5329                     ; 831 	CAN_Interrupt_Enable();
5331  0869 8d000000      	callf	f_CAN_Interrupt_Enable
5333                     ; 832 	return;
5336  086d 84            	pop	a
5337  086e 85            	popw	x
5338  086f bf00          	ldw	c_y,x
5339  0871 320002        	pop	c_y+2
5340  0874 85            	popw	x
5341  0875 bf00          	ldw	c_x,x
5342  0877 320002        	pop	c_x+2
5343  087a 80            	iret	
5801                     	xdef	f_CAN_Rx_Interrupt
5802                     	xdef	f_CAN_Tx_Interrupt
5803                     	xdef	f_CAN_LMFC_Maessge_Transmit
5804                     	xdef	f_CAN_PS_Maessge_Transmit
5805                     	xdef	f_CAN_ModelX_Maessge_Transmit
5806                     	xdef	f_CAN_ModelS_Vehicle_Maessge_Transmit
5807                     	xdef	f_CAN_Fail_Handling
5808                     	xdef	f_CAN_ModelX_Message_Handling
5809                     	xdef	f_CAN_LMFC_Message_Handling
5810                     	xdef	f_CAN_PS_Message_Handling
5811                     	xdef	f_CAN_LMFC_Tx_Data_Handling
5812                     	xdef	f_CAN_PS_Tx_Data_Handling
5813                     	xdef	f_CAN_ModelX_Tx_Data_Handling
5814                     	xdef	f_CAN_ModelS_Vehicle_Tx_Data_Handling
5815                     	xdef	_CAN_Time_Fail
5816                     	switch	.ubsct
5817  0000               _LMFC_TX_Event_Counter:
5818  0000 00            	ds.b	1
5819                     	xdef	_LMFC_TX_Event_Counter
5820  0001               _LMFC_TX_Event_Time:
5821  0001 00            	ds.b	1
5822                     	xdef	_LMFC_TX_Event_Time
5823  0002               _PS_TX_Event_Counter:
5824  0002 00            	ds.b	1
5825                     	xdef	_PS_TX_Event_Counter
5826  0003               _PS_TX_Event_Time:
5827  0003 00            	ds.b	1
5828                     	xdef	_PS_TX_Event_Time
5829  0004               _ModelX_TX_Event_Cnt:
5830  0004 00            	ds.b	1
5831                     	xdef	_ModelX_TX_Event_Cnt
5832  0005               _ModelX_TX_Event_Time:
5833  0005 00            	ds.b	1
5834                     	xdef	_ModelX_TX_Event_Time
5835  0006               _MODELS_TX_Vehicle_Counter:
5836  0006 00            	ds.b	1
5837                     	xdef	_MODELS_TX_Vehicle_Counter
5838  0007               _MODELS_TX_Vehicle_Event_Time:
5839  0007 00            	ds.b	1
5840                     	xdef	_MODELS_TX_Vehicle_Event_Time
5841  0008               _MODELS_TX_Event_Counter:
5842  0008 00            	ds.b	1
5843                     	xdef	_MODELS_TX_Event_Counter
5844  0009               _MODELS_TX_Event_Time:
5845  0009 00            	ds.b	1
5846                     	xdef	_MODELS_TX_Event_Time
5847  000a               _CAN_Initialize_Delay:
5848  000a 00            	ds.b	1
5849                     	xdef	_CAN_Initialize_Delay
5850                     	switch	.bss
5851  0002               _u1_PTC_PWM_Out3:
5852  0002 00            	ds.b	1
5853                     	xdef	_u1_PTC_PWM_Out3
5854  0003               _u1_PTC_PWM_Out2:
5855  0003 00            	ds.b	1
5856                     	xdef	_u1_PTC_PWM_Out2
5857  0004               _u1_PTC_PWM_Out1:
5858  0004 00            	ds.b	1
5859                     	xdef	_u1_PTC_PWM_Out1
5860                     	switch	.ubsct
5861  000b               _GTW_OutletTempRaw:
5862  000b 00            	ds.b	1
5863                     	xdef	_GTW_OutletTempRaw
5864  000c               _GTW_AmbientFilter:
5865  000c 00            	ds.b	1
5866                     	xdef	_GTW_AmbientFilter
5867  000d               _GTW_AmbientRaw:
5868  000d 00            	ds.b	1
5869                     	xdef	_GTW_AmbientRaw
5870  000e               _GTW_PtcTargetDuty_Perc:
5871  000e 0000          	ds.b	2
5872                     	xdef	_GTW_PtcTargetDuty_Perc
5873                     	switch	.bss
5874  0005               _CAN_Msg_Update:
5875  0005 00000000      	ds.b	4
5876                     	xdef	_CAN_Msg_Update
5877  0009               _CAN_Rx_Buffer:
5878  0009 000000000000  	ds.b	32
5879                     	xdef	_CAN_Rx_Buffer
5880  0029               _CAN_Tx_Buffer:
5881  0029 000000000000  	ds.b	8
5882                     	xdef	_CAN_Tx_Buffer
5883  0031               _CAN_Node_Status:
5884  0031 000000000000  	ds.b	12
5885                     	xdef	_CAN_Node_Status
5886                     	xdef	f_CAN_ModelS_Maessge_Transmit
5887                     	xdef	f_CAN_ModelS_Message_Handling
5888                     	xdef	f_CAN_ModelS_Tx_Data_Handling
5889                     	xref	_LMFC_PTC_Debug
5890                     	xref	_LMFC_PTC_Status
5891                     	xref	_LMFC_Test_Register
5892                     	xref	_PS_PTC_Debug
5893                     	xref	_PS_PTC_Status
5894                     	xref	_PS_Test_Register
5895                     	xref	_MD_ID355_Data
5896                     	xref	_MD_ID205_Data
5897                     	xref	_MD_ID316_Data
5898                     	xref	_MD_ID506_Data
5899                     	xref	_MD_ID306_Data
5900                     	xref	_MD_ID206_Data
5901                     	xref	_MD_Vehicle_Logic
5902                     	xref	_MD_Test_Register
5903                     	xdef	f_CAN_Management_Routine
5904                     	xdef	f_CAN_Message_Time_Control
5905  003d               _PTC_PartNumber:
5906  003d 000000000000  	ds.b	8
5907                     	xdef	_PTC_PartNumber
5908  0045               _PTC_Status3:
5909  0045 00            	ds.b	1
5910                     	xdef	_PTC_Status3
5911  0046               _PTC_Status2:
5912  0046 00            	ds.b	1
5913                     	xdef	_PTC_Status2
5914  0047               _PTC_Status1:
5915  0047 00            	ds.b	1
5916                     	xdef	_PTC_Status1
5917  0048               _PTC_SW_Ver:
5918  0048 00            	ds.b	1
5919                     	xdef	_PTC_SW_Ver
5920  0049               _PTC_Limit_Cause:
5921  0049 00            	ds.b	1
5922                     	xdef	_PTC_Limit_Cause
5923  004a               _PTC_PCB2_Temp:
5924  004a 00            	ds.b	1
5925                     	xdef	_PTC_PCB2_Temp
5926  004b               _PTC_PCB1_Temp:
5927  004b 00            	ds.b	1
5928                     	xdef	_PTC_PCB1_Temp
5929  004c               _PTC_IGBT2_Temp:
5930  004c 00            	ds.b	1
5931                     	xdef	_PTC_IGBT2_Temp
5932  004d               _PTC_IGBT1_Temp:
5933  004d 00            	ds.b	1
5934                     	xdef	_PTC_IGBT1_Temp
5935  004e               _PTC_RCore_Temp:
5936  004e 00            	ds.b	1
5937                     	xdef	_PTC_RCore_Temp
5938  004f               _PTC_LCore_Temp:
5939  004f 00            	ds.b	1
5940                     	xdef	_PTC_LCore_Temp
5941  0050               _PTC_Fdback_Duty:
5942  0050 00            	ds.b	1
5943                     	xdef	_PTC_Fdback_Duty
5944  0051               _PTC_PWR_VALUE:
5945  0051 0000          	ds.b	2
5946                     	xdef	_PTC_PWR_VALUE
5947  0053               _PTC_Cur_VALUE:
5948  0053 00            	ds.b	1
5949                     	xdef	_PTC_Cur_VALUE
5950  0054               _PTC_BATT_VALUE:
5951  0054 0000          	ds.b	2
5952                     	xdef	_PTC_BATT_VALUE
5953                     	xdef	_PTC_Status_Flag
5954  0056               _PTC_Heat_Duty:
5955  0056 00            	ds.b	1
5956                     	xdef	_PTC_Heat_Duty
5957                     	xdef	_PTC_AllowOperation
5958                     	switch	.ubsct
5959  0010               _CAN_Operation_App:
5960  0010 00            	ds.b	1
5961                     	xdef	_CAN_Operation_App
5962  0011               _CAN_Control_Status2:
5963  0011 00            	ds.b	1
5964                     	xdef	_CAN_Control_Status2
5965  0012               _CAN_Control_Status:
5966  0012 00            	ds.b	1
5967                     	xdef	_CAN_Control_Status
5968                     	xref	f_CAN_Transmit_Cancel
5969                     	xref	f_CAN_Enable
5970                     	xref	f_CAN_Interrupt_Enable
5971                     	xref	f_CAN_Interrupt_Disable
5972                     	xref	f_Windows_Watchdog_Control
5973                     	xref	_Can_Select_Device
5974                     	xref.b	c_x
5975                     	xref.b	c_y
5995                     	end

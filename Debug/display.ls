   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
   4                     ; Optimizer V4.3.3 - 10 Feb 2010
2658                     	switch	.data
2659  0000               _LCD_Line:
2660  0000 00            	dc.b	0
2661  0001 c0            	dc.b	192
2662  0002 10            	dc.b	16
2663  0003 d0            	dc.b	208
2694                     ; 23 void LCD_Display_Control(void)
2694                     ; 24 {
2695                     	switch	.text
2696  0000               f_LCD_Display_Control:
2700                     ; 26 	Alarm_Setting_Mode_Display();
2703                     ; 28 	return;
2706  0000 ac030103      	jpf	f_Alarm_Setting_Mode_Display
2731                     ; 32 void Start_Zig_Display(void)
2731                     ; 33 {
2732                     	switch	.text
2733  0004               f_Start_Zig_Display:
2737                     ; 34 	if(First_Message_ch == OFF){
2739  0004 4f            	clr	a
2740  0005 7202000030    	btjt	_Control_Status_0,#1,L1371
2741                     ; 35 		Set_LCD_Address(0x00);	// 1 Line Test Zig
2743  000a 8d000000      	callf	f_Set_LCD_Address
2745                     ; 36 		Display_LCD_String(" ##   ## #####");
2747  000e ae006c        	ldw	x,#L3371
2748  0011 8d000000      	callf	f_Display_LCD_String
2750                     ; 38 		Set_LCD_Address(0xC0);  // 2 Line Test Zig
2752  0015 a6c0          	ld	a,#192
2753  0017 8d000000      	callf	f_Set_LCD_Address
2755                     ; 39 		Display_LCD_String(" ##   ## ##  ##");
2757  001b ae005c        	ldw	x,#L5371
2758  001e 8d000000      	callf	f_Display_LCD_String
2760                     ; 41 		Set_LCD_Address(0x10);  // 3 Line Test Zig
2762  0022 a610          	ld	a,#16
2763  0024 8d000000      	callf	f_Set_LCD_Address
2765                     ; 42 		Display_LCD_String("  # # #  ####");
2767  0028 ae004e        	ldw	x,#L7371
2768  002b 8d000000      	callf	f_Display_LCD_String
2770                     ; 44 		Set_LCD_Address(0xD0);  // 4 Line Test Zig
2772  002f a6d0          	ld	a,#208
2773  0031 8d000000      	callf	f_Set_LCD_Address
2775                     ; 45 		Display_LCD_String("   # #   ##  ##");
2777  0035 ae003e        	ldw	x,#L1471
2780  0038 202e          	jra	L3471
2781  003a               L1371:
2782                     ; 48 		Set_LCD_Address(0x00);	// 1 Line Test Zig
2784  003a 8d000000      	callf	f_Set_LCD_Address
2786                     ; 49 		Display_LCD_String("Woory Company");
2788  003e ae0030        	ldw	x,#L5471
2789  0041 8d000000      	callf	f_Display_LCD_String
2791                     ; 51 		Set_LCD_Address(0xC0);  // 2 Line Test Zig
2793  0045 a6c0          	ld	a,#192
2794  0047 8d000000      	callf	f_Set_LCD_Address
2796                     ; 52 		Display_LCD_String("Communication");
2798  004b ae0022        	ldw	x,#L7471
2799  004e 8d000000      	callf	f_Display_LCD_String
2801                     ; 56 		Set_LCD_Address(0x10);  // 3 Line Test Zig
2803  0052 a610          	ld	a,#16
2804  0054 8d000000      	callf	f_Set_LCD_Address
2806                     ; 57 		Display_LCD_String("Test Zig  Ver1.3");
2808  0058 ae0011        	ldw	x,#L1571
2809  005b 8d000000      	callf	f_Display_LCD_String
2811                     ; 59 		Set_LCD_Address(0xD0);  // 4 Line Test Zig
2813  005f a6d0          	ld	a,#208
2814  0061 8d000000      	callf	f_Set_LCD_Address
2816                     ; 60 		Display_LCD_String("16.01.12  By CJW");
2818  0065 ae0000        	ldw	x,#L3571
2820  0068               L3471:
2821                     ; 62 	return;
2824  0068 ac000000      	jpf	f_Display_LCD_String
2863                     ; 66 void Num_Display_LCD(unsigned int num)
2863                     ; 67 {
2864                     	switch	.text
2865  006c               f_Num_Display_LCD:
2867  006c 89            	pushw	x
2868  006d 88            	push	a
2869       00000001      OFST:	set	1
2872                     ; 71 	if(num >= 10000){
2874  006e a32710        	cpw	x,#10000
2875  0071 251c          	jrult	L3771
2876                     ; 72 		buff = (unsigned char)(num / 10000);
2878  0073 90ae2710      	ldw	y,#10000
2879  0077 65            	divw	x,y
2880  0078 9f            	ld	a,xl
2881  0079 6b01          	ld	(OFST+0,sp),a
2882                     ; 73 		num %= 10000;
2884  007b 90ae2710      	ldw	y,#10000
2885  007f 1e02          	ldw	x,(OFST+1,sp)
2886  0081 65            	divw	x,y
2887  0082 93            	ldw	x,y
2888  0083 1f02          	ldw	(OFST+1,sp),x
2889                     ; 74 		Display_LCD_Data((unsigned char)(48+buff));
2891  0085 ab30          	add	a,#48
2892  0087 8d000000      	callf	f_Display_LCD_Data
2894                     ; 76 		buff = (unsigned char)(num / 1000);
2896  008b 1e02          	ldw	x,(OFST+1,sp)
2897                     ; 77 		num %= 1000;
2898                     ; 78 		Display_LCD_Data((unsigned char)(48+buff));
2900                     ; 80 		buff = (unsigned char)(num / 100);
2901                     ; 81 		num %= 100;
2902                     ; 82 		Display_LCD_Data((unsigned char)(48+buff));
2904                     ; 84 		buff = (unsigned char)(num / 10);
2905                     ; 85 		num %= 10;
2906                     ; 86 		Display_LCD_Data((unsigned char)(48+buff));
2908                     ; 88 		num %= 10;
2909                     ; 89 		Display_LCD_Data((unsigned char)(48+num));
2912  008d 2007          	jpf	LC003
2913  008f               L3771:
2914                     ; 91 	}else if(num >= 1000){
2916  008f 1e02          	ldw	x,(OFST+1,sp)
2917  0091 a303e8        	cpw	x,#1000
2918  0094 2536          	jrult	L7771
2919                     ; 92 		buff = (unsigned char)(num / 1000);
2921                     ; 93 		num %= 1000;
2923                     ; 94 		Display_LCD_Data((unsigned char)(48+buff));
2926                     ; 96 		buff = (unsigned char)(num / 100);
2928  0096               LC003:
2929  0096 90ae03e8      	ldw	y,#1000
2930  009a 65            	divw	x,y
2931  009b 9f            	ld	a,xl
2932  009c 6b01          	ld	(OFST+0,sp),a
2934  009e 90ae03e8      	ldw	y,#1000
2935  00a2 1e02          	ldw	x,(OFST+1,sp)
2936  00a4 65            	divw	x,y
2937  00a5 93            	ldw	x,y
2938  00a6 1f02          	ldw	(OFST+1,sp),x
2940  00a8 ab30          	add	a,#48
2941  00aa 8d000000      	callf	f_Display_LCD_Data
2943  00ae 1e02          	ldw	x,(OFST+1,sp)
2944                     ; 97 		num %= 100;
2946                     ; 98 		Display_LCD_Data((unsigned char)(48+buff));
2949                     ; 100 		buff = (unsigned char)(num / 10);
2951  00b0               LC002:
2953  00b0 90ae0064      	ldw	y,#100
2954  00b4 65            	divw	x,y
2955  00b5 9f            	ld	a,xl
2956  00b6 6b01          	ld	(OFST+0,sp),a
2959  00b8 90ae0064      	ldw	y,#100
2960  00bc 1e02          	ldw	x,(OFST+1,sp)
2961  00be 65            	divw	x,y
2962  00bf 93            	ldw	x,y
2963  00c0 1f02          	ldw	(OFST+1,sp),x
2966  00c2 ab30          	add	a,#48
2967  00c4 8d000000      	callf	f_Display_LCD_Data
2970  00c8 1e02          	ldw	x,(OFST+1,sp)
2971                     ; 101 		num %= 10;
2972                     ; 102 		Display_LCD_Data((unsigned char)(48+buff));
2974                     ; 104 		num %= 10;
2975                     ; 105 		Display_LCD_Data((unsigned char)(48+num));
2978  00ca 200a          	jpf	LC001
2979  00cc               L7771:
2980                     ; 106 	}else if(num >= 100){
2982  00cc a30064        	cpw	x,#100
2983                     ; 107 		buff = (unsigned char)(num / 100);
2984                     ; 108 		num %= 100;
2985                     ; 109 		Display_LCD_Data((unsigned char)(48+buff));
2987                     ; 111 		buff = (unsigned char)(num / 10);
2988                     ; 112 		num %= 10;
2989                     ; 113 		Display_LCD_Data((unsigned char)(48+buff));
2991                     ; 115 		num %= 10;
2992                     ; 116 		Display_LCD_Data((unsigned char)(48+num));
2995  00cf 24df          	jruge	LC002
2996                     ; 117 	}else if(num >= 10){
2998  00d1 a3000a        	cpw	x,#10
2999  00d4 2522          	jrult	L7002
3000                     ; 118 		buff = (unsigned char)(num / 10);
3002                     ; 119 		num %= 10;
3004                     ; 120 		Display_LCD_Data((unsigned char)(48+buff));
3007                     ; 122 		num %= 10;
3009  00d6               LC001:
3010  00d6 90ae000a      	ldw	y,#10
3011  00da 65            	divw	x,y
3012  00db 9f            	ld	a,xl
3013  00dc 6b01          	ld	(OFST+0,sp),a
3017  00de 90ae000a      	ldw	y,#10
3018  00e2 1e02          	ldw	x,(OFST+1,sp)
3019  00e4 65            	divw	x,y
3020  00e5 93            	ldw	x,y
3021  00e6 1f02          	ldw	(OFST+1,sp),x
3025  00e8 ab30          	add	a,#48
3026  00ea 8d000000      	callf	f_Display_LCD_Data
3030  00ee 1e02          	ldw	x,(OFST+1,sp)
3031  00f0 90ae000a      	ldw	y,#10
3032  00f4 65            	divw	x,y
3033  00f5 93            	ldw	x,y
3034  00f6 1f02          	ldw	(OFST+1,sp),x
3035                     ; 123 		Display_LCD_Data((unsigned char)(48+num));
3038  00f8               L7002:
3039                     ; 124 	}else{ Display_LCD_Data((unsigned char)(48+num));}
3046  00f8 7b03          	ld	a,(OFST+2,sp)
3047  00fa ab30          	add	a,#48
3048  00fc 8d000000      	callf	f_Display_LCD_Data
3049                     ; 126 	return;
3052  0100 5b03          	addw	sp,#3
3053  0102 87            	retf	
3076                     ; 130 void Alarm_Setting_Mode_Display(void)
3076                     ; 131 {
3077                     	switch	.text
3078  0103               f_Alarm_Setting_Mode_Display:
3082                     ; 175 }//End of Alarm_Setting_Mode_Display
3085  0103 87            	retf	
3120                     	xdef	f_Alarm_Setting_Mode_Display
3121                     	switch	.bss
3122  0000               _LCD_Dis_Data:
3123  0000 000000000000  	ds.b	64
3124                     	xdef	_LCD_Dis_Data
3125                     	xdef	_LCD_Line
3126                     	xdef	f_Num_Display_LCD
3127                     	xdef	f_Start_Zig_Display
3128                     	xdef	f_LCD_Display_Control
3129                     	xref	f_Display_LCD_Data
3130                     	xref	f_Display_LCD_String
3131                     	xref	f_Set_LCD_Address
3132                     	xref	_Control_Status_0
3133                     .const:	section	.text
3134  0000               L3571:
3135  0000 31362e30312e  	dc.b	"16.01.12  By CJW",0
3136  0011               L1571:
3137  0011 54657374205a  	dc.b	"Test Zig  Ver1.3",0
3138  0022               L7471:
3139  0022 436f6d6d756e  	dc.b	"Communication",0
3140  0030               L5471:
3141  0030 576f6f727920  	dc.b	"Woory Company",0
3142  003e               L1471:
3143  003e 202020232023  	dc.b	"   # #   ##  ##",0
3144  004e               L7371:
3145  004e 202023202320  	dc.b	"  # # #  ####",0
3146  005c               L5371:
3147  005c 202323202020  	dc.b	" ##   ## ##  ##",0
3148  006c               L3371:
3149  006c 202323202020  	dc.b	" ##   ## #####",0
3169                     	end

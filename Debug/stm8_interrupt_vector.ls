   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
  43                     ; 18 @far @interrupt void Not_Used_Interrupt(void)
  43                     ; 19 {
  44                     	switch	.text
  45  0000               f_Not_Used_Interrupt:
  49                     ; 20 	return;
  52  0000 80            	iret
  54                     .const:	section	.text
  55  0000               __vectab:
  56  0000 82            	dc.b	130
  58  0001 00            	dc.b	page(__stext)
  59  0002 0000          	dc.w	__stext
  60  0004 82            	dc.b	130
  62  0005 00            	dc.b	page(f_Not_Used_Interrupt)
  63  0006 0000          	dc.w	f_Not_Used_Interrupt
  64  0008 82            	dc.b	130
  66  0009 00            	dc.b	page(f_Not_Used_Interrupt)
  67  000a 0000          	dc.w	f_Not_Used_Interrupt
  68  000c 82            	dc.b	130
  70  000d 00            	dc.b	page(f_Not_Used_Interrupt)
  71  000e 0000          	dc.w	f_Not_Used_Interrupt
  72  0010 82            	dc.b	130
  74  0011 00            	dc.b	page(f_Not_Used_Interrupt)
  75  0012 0000          	dc.w	f_Not_Used_Interrupt
  76  0014 82            	dc.b	130
  78  0015 00            	dc.b	page(f_Not_Used_Interrupt)
  79  0016 0000          	dc.w	f_Not_Used_Interrupt
  80  0018 82            	dc.b	130
  82  0019 00            	dc.b	page(f_Not_Used_Interrupt)
  83  001a 0000          	dc.w	f_Not_Used_Interrupt
  84  001c 82            	dc.b	130
  86  001d 00            	dc.b	page(f_Not_Used_Interrupt)
  87  001e 0000          	dc.w	f_Not_Used_Interrupt
  88  0020 82            	dc.b	130
  90  0021 00            	dc.b	page(f_Not_Used_Interrupt)
  91  0022 0000          	dc.w	f_Not_Used_Interrupt
  92  0024 82            	dc.b	130
  94  0025 00            	dc.b	page(f_Not_Used_Interrupt)
  95  0026 0000          	dc.w	f_Not_Used_Interrupt
  96  0028 82            	dc.b	130
  98  0029 00            	dc.b	page(_CAN_Rx_Interrupt)
  99  002a 0000          	dc.w	_CAN_Rx_Interrupt
 100  002c 82            	dc.b	130
 102  002d 00            	dc.b	page(_CAN_Tx_Interrupt)
 103  002e 0000          	dc.w	_CAN_Tx_Interrupt
 104  0030 82            	dc.b	130
 106  0031 00            	dc.b	page(f_Not_Used_Interrupt)
 107  0032 0000          	dc.w	f_Not_Used_Interrupt
 108  0034 82            	dc.b	130
 110  0035 00            	dc.b	page(f_Not_Used_Interrupt)
 111  0036 0000          	dc.w	f_Not_Used_Interrupt
 112  0038 82            	dc.b	130
 114  0039 00            	dc.b	page(f_Not_Used_Interrupt)
 115  003a 0000          	dc.w	f_Not_Used_Interrupt
 116  003c 82            	dc.b	130
 118  003d 00            	dc.b	page(f_Not_Used_Interrupt)
 119  003e 0000          	dc.w	f_Not_Used_Interrupt
 120  0040 82            	dc.b	130
 122  0041 00            	dc.b	page(f_Not_Used_Interrupt)
 123  0042 0000          	dc.w	f_Not_Used_Interrupt
 124  0044 82            	dc.b	130
 126  0045 00            	dc.b	page(_TIMER_3_Interrupt)
 127  0046 0000          	dc.w	_TIMER_3_Interrupt
 128  0048 82            	dc.b	130
 130  0049 00            	dc.b	page(f_Not_Used_Interrupt)
 131  004a 0000          	dc.w	f_Not_Used_Interrupt
 132  004c 82            	dc.b	130
 134  004d 00            	dc.b	page(f_Not_Used_Interrupt)
 135  004e 0000          	dc.w	f_Not_Used_Interrupt
 136  0050 82            	dc.b	130
 138  0051 00            	dc.b	page(f_Not_Used_Interrupt)
 139  0052 0000          	dc.w	f_Not_Used_Interrupt
 140  0054 82            	dc.b	130
 142  0055 00            	dc.b	page(f_Not_Used_Interrupt)
 143  0056 0000          	dc.w	f_Not_Used_Interrupt
 144  0058 82            	dc.b	130
 146  0059 00            	dc.b	page(f_Not_Used_Interrupt)
 147  005a 0000          	dc.w	f_Not_Used_Interrupt
 148  005c 82            	dc.b	130
 150  005d 00            	dc.b	page(f_Not_Used_Interrupt)
 151  005e 0000          	dc.w	f_Not_Used_Interrupt
 152  0060 82            	dc.b	130
 154  0061 00            	dc.b	page(f_Not_Used_Interrupt)
 155  0062 0000          	dc.w	f_Not_Used_Interrupt
 156  0064 82            	dc.b	130
 158  0065 00            	dc.b	page(f_Not_Used_Interrupt)
 159  0066 0000          	dc.w	f_Not_Used_Interrupt
 160  0068 82            	dc.b	130
 162  0069 00            	dc.b	page(f_Not_Used_Interrupt)
 163  006a 0000          	dc.w	f_Not_Used_Interrupt
 164  006c 82            	dc.b	130
 166  006d 00            	dc.b	page(f_Not_Used_Interrupt)
 167  006e 0000          	dc.w	f_Not_Used_Interrupt
 168  0070 82            	dc.b	130
 170  0071 00            	dc.b	page(f_Not_Used_Interrupt)
 171  0072 0000          	dc.w	f_Not_Used_Interrupt
 172  0074 82            	dc.b	130
 174  0075 00            	dc.b	page(f_Not_Used_Interrupt)
 175  0076 0000          	dc.w	f_Not_Used_Interrupt
 176  0078 82            	dc.b	130
 178  0079 00            	dc.b	page(f_Not_Used_Interrupt)
 179  007a 0000          	dc.w	f_Not_Used_Interrupt
 180  007c 82            	dc.b	130
 182  007d 00            	dc.b	page(f_Not_Used_Interrupt)
 183  007e 0000          	dc.w	f_Not_Used_Interrupt
 234                     	xdef	__vectab
 235                     	xref	_CAN_Tx_Interrupt
 236                     	xref	_CAN_Rx_Interrupt
 237                     	xref	_TIMER_3_Interrupt
 238                     	xref	__stext
 239                     	xdef	f_Not_Used_Interrupt
 258                     	end

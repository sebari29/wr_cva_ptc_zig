   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 18 @far @interrupt void Not_Used_Interrupt(void)
  44                     ; 19 {
  45                     	switch	.text
  46  0000               f_Not_Used_Interrupt:
  50                     ; 20 	return;
  53  0000 80            	iret
  55                     .const:	section	.text
  56  0000               __vectab:
  57  0000 82            	dc.b	130
  59  0001 00            	dc.b	page(__stext)
  60  0002 0000          	dc.w	__stext
  61  0004 82            	dc.b	130
  63  0005 00            	dc.b	page(f_Not_Used_Interrupt)
  64  0006 0000          	dc.w	f_Not_Used_Interrupt
  65  0008 82            	dc.b	130
  67  0009 00            	dc.b	page(f_Not_Used_Interrupt)
  68  000a 0000          	dc.w	f_Not_Used_Interrupt
  69  000c 82            	dc.b	130
  71  000d 00            	dc.b	page(f_Not_Used_Interrupt)
  72  000e 0000          	dc.w	f_Not_Used_Interrupt
  73  0010 82            	dc.b	130
  75  0011 00            	dc.b	page(f_Not_Used_Interrupt)
  76  0012 0000          	dc.w	f_Not_Used_Interrupt
  77  0014 82            	dc.b	130
  79  0015 00            	dc.b	page(f_Not_Used_Interrupt)
  80  0016 0000          	dc.w	f_Not_Used_Interrupt
  81  0018 82            	dc.b	130
  83  0019 00            	dc.b	page(f_Not_Used_Interrupt)
  84  001a 0000          	dc.w	f_Not_Used_Interrupt
  85  001c 82            	dc.b	130
  87  001d 00            	dc.b	page(f_Not_Used_Interrupt)
  88  001e 0000          	dc.w	f_Not_Used_Interrupt
  89  0020 82            	dc.b	130
  91  0021 00            	dc.b	page(f_Not_Used_Interrupt)
  92  0022 0000          	dc.w	f_Not_Used_Interrupt
  93  0024 82            	dc.b	130
  95  0025 00            	dc.b	page(f_Not_Used_Interrupt)
  96  0026 0000          	dc.w	f_Not_Used_Interrupt
  97  0028 82            	dc.b	130
  99  0029 00            	dc.b	page(_CAN_Rx_Interrupt)
 100  002a 0000          	dc.w	_CAN_Rx_Interrupt
 101  002c 82            	dc.b	130
 103  002d 00            	dc.b	page(_CAN_Tx_Interrupt)
 104  002e 0000          	dc.w	_CAN_Tx_Interrupt
 105  0030 82            	dc.b	130
 107  0031 00            	dc.b	page(f_Not_Used_Interrupt)
 108  0032 0000          	dc.w	f_Not_Used_Interrupt
 109  0034 82            	dc.b	130
 111  0035 00            	dc.b	page(f_Not_Used_Interrupt)
 112  0036 0000          	dc.w	f_Not_Used_Interrupt
 113  0038 82            	dc.b	130
 115  0039 00            	dc.b	page(f_Not_Used_Interrupt)
 116  003a 0000          	dc.w	f_Not_Used_Interrupt
 117  003c 82            	dc.b	130
 119  003d 00            	dc.b	page(f_Not_Used_Interrupt)
 120  003e 0000          	dc.w	f_Not_Used_Interrupt
 121  0040 82            	dc.b	130
 123  0041 00            	dc.b	page(f_Not_Used_Interrupt)
 124  0042 0000          	dc.w	f_Not_Used_Interrupt
 125  0044 82            	dc.b	130
 127  0045 00            	dc.b	page(_TIMER_3_Interrupt)
 128  0046 0000          	dc.w	_TIMER_3_Interrupt
 129  0048 82            	dc.b	130
 131  0049 00            	dc.b	page(f_Not_Used_Interrupt)
 132  004a 0000          	dc.w	f_Not_Used_Interrupt
 133  004c 82            	dc.b	130
 135  004d 00            	dc.b	page(f_Not_Used_Interrupt)
 136  004e 0000          	dc.w	f_Not_Used_Interrupt
 137  0050 82            	dc.b	130
 139  0051 00            	dc.b	page(f_Not_Used_Interrupt)
 140  0052 0000          	dc.w	f_Not_Used_Interrupt
 141  0054 82            	dc.b	130
 143  0055 00            	dc.b	page(f_Not_Used_Interrupt)
 144  0056 0000          	dc.w	f_Not_Used_Interrupt
 145  0058 82            	dc.b	130
 147  0059 00            	dc.b	page(f_Not_Used_Interrupt)
 148  005a 0000          	dc.w	f_Not_Used_Interrupt
 149  005c 82            	dc.b	130
 151  005d 00            	dc.b	page(f_Not_Used_Interrupt)
 152  005e 0000          	dc.w	f_Not_Used_Interrupt
 153  0060 82            	dc.b	130
 155  0061 00            	dc.b	page(f_Not_Used_Interrupt)
 156  0062 0000          	dc.w	f_Not_Used_Interrupt
 157  0064 82            	dc.b	130
 159  0065 00            	dc.b	page(f_Not_Used_Interrupt)
 160  0066 0000          	dc.w	f_Not_Used_Interrupt
 161  0068 82            	dc.b	130
 163  0069 00            	dc.b	page(f_Not_Used_Interrupt)
 164  006a 0000          	dc.w	f_Not_Used_Interrupt
 165  006c 82            	dc.b	130
 167  006d 00            	dc.b	page(f_Not_Used_Interrupt)
 168  006e 0000          	dc.w	f_Not_Used_Interrupt
 169  0070 82            	dc.b	130
 171  0071 00            	dc.b	page(f_Not_Used_Interrupt)
 172  0072 0000          	dc.w	f_Not_Used_Interrupt
 173  0074 82            	dc.b	130
 175  0075 00            	dc.b	page(f_Not_Used_Interrupt)
 176  0076 0000          	dc.w	f_Not_Used_Interrupt
 177  0078 82            	dc.b	130
 179  0079 00            	dc.b	page(f_Not_Used_Interrupt)
 180  007a 0000          	dc.w	f_Not_Used_Interrupt
 181  007c 82            	dc.b	130
 183  007d 00            	dc.b	page(f_Not_Used_Interrupt)
 184  007e 0000          	dc.w	f_Not_Used_Interrupt
 235                     	xdef	__vectab
 236                     	xref	_CAN_Tx_Interrupt
 237                     	xref	_CAN_Rx_Interrupt
 238                     	xref	_TIMER_3_Interrupt
 239                     	xref	__stext
 240                     	xdef	f_Not_Used_Interrupt
 259                     	end

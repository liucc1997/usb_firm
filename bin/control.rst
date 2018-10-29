                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module control
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HandleVendorRequest
                                     12 	.globl _HandleClassRequest
                                     13 	.globl _HandleStandardRequest
                                     14 	.globl _EP0ACK
                                     15 	.globl _SendControlResponse
                                     16 	.globl _RI
                                     17 	.globl _TI
                                     18 	.globl _RB8
                                     19 	.globl _TB8
                                     20 	.globl _REN
                                     21 	.globl _SM2
                                     22 	.globl _SM1
                                     23 	.globl _SM0
                                     24 	.globl _RXD
                                     25 	.globl _TXD
                                     26 	.globl _INT0
                                     27 	.globl _INT1
                                     28 	.globl _T0
                                     29 	.globl _T1
                                     30 	.globl _WR
                                     31 	.globl _RD
                                     32 	.globl _PX0
                                     33 	.globl _PT0
                                     34 	.globl _PX1
                                     35 	.globl _PT1
                                     36 	.globl _PS
                                     37 	.globl _EX0
                                     38 	.globl _ET0
                                     39 	.globl _EX1
                                     40 	.globl _ET1
                                     41 	.globl _ES
                                     42 	.globl _EA
                                     43 	.globl _IT0
                                     44 	.globl _IE0
                                     45 	.globl _IT1
                                     46 	.globl _IE1
                                     47 	.globl _TR0
                                     48 	.globl _TF0
                                     49 	.globl _TR1
                                     50 	.globl _TF1
                                     51 	.globl _P
                                     52 	.globl _OV
                                     53 	.globl _RS0
                                     54 	.globl _RS1
                                     55 	.globl _F0
                                     56 	.globl _AC
                                     57 	.globl _CY
                                     58 	.globl _SBUF
                                     59 	.globl _SCON
                                     60 	.globl _IP
                                     61 	.globl _IE
                                     62 	.globl _TH1
                                     63 	.globl _TH0
                                     64 	.globl _TL1
                                     65 	.globl _TL0
                                     66 	.globl _TMOD
                                     67 	.globl _TCON
                                     68 	.globl _PCON
                                     69 	.globl _DPH
                                     70 	.globl _DPL
                                     71 	.globl _SP
                                     72 	.globl _B
                                     73 	.globl _ACC
                                     74 	.globl _PSW
                                     75 	.globl _P3
                                     76 	.globl _P2
                                     77 	.globl _P1
                                     78 	.globl _P0
                                     79 	.globl _PRAMCTL
                                     80 	.globl _BANK2PAH
                                     81 	.globl _BANK2PAL
                                     82 	.globl _BANK2VA
                                     83 	.globl _BANK1PAH
                                     84 	.globl _BANK1PAL
                                     85 	.globl _BANK1VA
                                     86 	.globl _BANK0PAH
                                     87 	.globl _BANK0PAL
                                     88 	.globl _WARMSTATUS
                                     89 	.globl _GPIO0OUT
                                     90 	.globl _GPIO0DIR
                                     91 	.globl _DMACMD
                                     92 	.globl _DMAFILL3
                                     93 	.globl _DMAFILL2
                                     94 	.globl _DMAFILL1
                                     95 	.globl _DMAFILL0
                                     96 	.globl _DMASIZEH
                                     97 	.globl _DMASIZEM
                                     98 	.globl _DMASIZEL
                                     99 	.globl _DMADSTH
                                    100 	.globl _DMADSTM
                                    101 	.globl _DMADSTL
                                    102 	.globl _DMASRCH
                                    103 	.globl _DMASRCM
                                    104 	.globl _DMASRCL
                                    105 	.globl _NANDCSDIR
                                    106 	.globl _NANDCSOUT
                                    107 	.globl _EP4
                                    108 	.globl _EP3
                                    109 	.globl _EP2
                                    110 	.globl _EP1
                                    111 	.globl _EP0
                                    112 	.globl _SETUPDAT
                                    113 	.globl _EP0CS
                                    114 	.globl _EPIE
                                    115 	.globl _EPIRQ
                                    116 	.globl _USBIRQ
                                    117 	.globl _USBSTAT
                                    118 	.globl _USBCTL
                                    119 	.globl _REGBANK
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000090   126 _P1	=	0x0090
                           0000A0   127 _P2	=	0x00a0
                           0000B0   128 _P3	=	0x00b0
                           0000D0   129 _PSW	=	0x00d0
                           0000E0   130 _ACC	=	0x00e0
                           0000F0   131 _B	=	0x00f0
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           0000A8   142 _IE	=	0x00a8
                           0000B8   143 _IP	=	0x00b8
                           000098   144 _SCON	=	0x0098
                           000099   145 _SBUF	=	0x0099
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           0000D7   151 _CY	=	0x00d7
                           0000D6   152 _AC	=	0x00d6
                           0000D5   153 _F0	=	0x00d5
                           0000D4   154 _RS1	=	0x00d4
                           0000D3   155 _RS0	=	0x00d3
                           0000D2   156 _OV	=	0x00d2
                           0000D0   157 _P	=	0x00d0
                           00008F   158 _TF1	=	0x008f
                           00008E   159 _TR1	=	0x008e
                           00008D   160 _TF0	=	0x008d
                           00008C   161 _TR0	=	0x008c
                           00008B   162 _IE1	=	0x008b
                           00008A   163 _IT1	=	0x008a
                           000089   164 _IE0	=	0x0089
                           000088   165 _IT0	=	0x0088
                           0000AF   166 _EA	=	0x00af
                           0000AC   167 _ES	=	0x00ac
                           0000AB   168 _ET1	=	0x00ab
                           0000AA   169 _EX1	=	0x00aa
                           0000A9   170 _ET0	=	0x00a9
                           0000A8   171 _EX0	=	0x00a8
                           0000BC   172 _PS	=	0x00bc
                           0000BB   173 _PT1	=	0x00bb
                           0000BA   174 _PX1	=	0x00ba
                           0000B9   175 _PT0	=	0x00b9
                           0000B8   176 _PX0	=	0x00b8
                           0000B7   177 _RD	=	0x00b7
                           0000B6   178 _WR	=	0x00b6
                           0000B5   179 _T1	=	0x00b5
                           0000B4   180 _T0	=	0x00b4
                           0000B3   181 _INT1	=	0x00b3
                           0000B2   182 _INT0	=	0x00b2
                           0000B1   183 _TXD	=	0x00b1
                           0000B0   184 _RXD	=	0x00b0
                           00009F   185 _SM0	=	0x009f
                           00009E   186 _SM1	=	0x009e
                           00009D   187 _SM2	=	0x009d
                           00009C   188 _REN	=	0x009c
                           00009B   189 _TB8	=	0x009b
                           00009A   190 _RB8	=	0x009a
                           000099   191 _TI	=	0x0099
                           000098   192 _RI	=	0x0098
                                    193 ;--------------------------------------------------------
                                    194 ; overlayable register banks
                                    195 ;--------------------------------------------------------
                                    196 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        197 	.ds 8
                                    198 ;--------------------------------------------------------
                                    199 ; internal ram data
                                    200 ;--------------------------------------------------------
                                    201 	.area DSEG    (DATA)
                                    202 ;--------------------------------------------------------
                                    203 ; overlayable items in internal ram 
                                    204 ;--------------------------------------------------------
                                    205 ;--------------------------------------------------------
                                    206 ; indirectly addressable internal ram data
                                    207 ;--------------------------------------------------------
                                    208 	.area ISEG    (DATA)
                                    209 ;--------------------------------------------------------
                                    210 ; absolute internal ram data
                                    211 ;--------------------------------------------------------
                                    212 	.area IABS    (ABS,DATA)
                                    213 	.area IABS    (ABS,DATA)
                                    214 ;--------------------------------------------------------
                                    215 ; bit data
                                    216 ;--------------------------------------------------------
                                    217 	.area BSEG    (BIT)
                                    218 ;--------------------------------------------------------
                                    219 ; paged external ram data
                                    220 ;--------------------------------------------------------
                                    221 	.area PSEG    (PAG,XDATA)
                                    222 ;--------------------------------------------------------
                                    223 ; external ram data
                                    224 ;--------------------------------------------------------
                                    225 	.area XSEG    (XDATA)
                           00F000   226 _REGBANK	=	0xf000
                           00F008   227 _USBCTL	=	0xf008
                           00F009   228 _USBSTAT	=	0xf009
                           00F027   229 _USBIRQ	=	0xf027
                           00F020   230 _EPIRQ	=	0xf020
                           00F030   231 _EPIE	=	0xf030
                           00F048   232 _EP0CS	=	0xf048
                           00F0B8   233 _SETUPDAT	=	0xf0b8
                           00F1C0   234 _EP0	=	0xf1c0
                           00F200   235 _EP1	=	0xf200
                           00F240   236 _EP2	=	0xf240
                           00F280   237 _EP3	=	0xf280
                           00F2C0   238 _EP4	=	0xf2c0
                           00F608   239 _NANDCSOUT	=	0xf608
                           00F618   240 _NANDCSDIR	=	0xf618
                           00F900   241 _DMASRCL	=	0xf900
                           00F901   242 _DMASRCM	=	0xf901
                           00F902   243 _DMASRCH	=	0xf902
                           00F904   244 _DMADSTL	=	0xf904
                           00F905   245 _DMADSTM	=	0xf905
                           00F906   246 _DMADSTH	=	0xf906
                           00F908   247 _DMASIZEL	=	0xf908
                           00F909   248 _DMASIZEM	=	0xf909
                           00F90A   249 _DMASIZEH	=	0xf90a
                           00F90C   250 _DMAFILL0	=	0xf90c
                           00F90D   251 _DMAFILL1	=	0xf90d
                           00F90E   252 _DMAFILL2	=	0xf90e
                           00F90F   253 _DMAFILL3	=	0xf90f
                           00F930   254 _DMACMD	=	0xf930
                           00FA14   255 _GPIO0DIR	=	0xfa14
                           00FA15   256 _GPIO0OUT	=	0xfa15
                           00FA38   257 _WARMSTATUS	=	0xfa38
                           00FA40   258 _BANK0PAL	=	0xfa40
                           00FA41   259 _BANK0PAH	=	0xfa41
                           00FA42   260 _BANK1VA	=	0xfa42
                           00FA43   261 _BANK1PAL	=	0xfa43
                           00FA44   262 _BANK1PAH	=	0xfa44
                           00FA45   263 _BANK2VA	=	0xfa45
                           00FA46   264 _BANK2PAL	=	0xfa46
                           00FA47   265 _BANK2PAH	=	0xfa47
                           00FA48   266 _PRAMCTL	=	0xfa48
                                    267 ;--------------------------------------------------------
                                    268 ; absolute external ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XABS    (ABS,XDATA)
                                    271 ;--------------------------------------------------------
                                    272 ; external initialized ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area XISEG   (XDATA)
                                    275 	.area HOME    (CODE)
                                    276 	.area GSINIT0 (CODE)
                                    277 	.area GSINIT1 (CODE)
                                    278 	.area GSINIT2 (CODE)
                                    279 	.area GSINIT3 (CODE)
                                    280 	.area GSINIT4 (CODE)
                                    281 	.area GSINIT5 (CODE)
                                    282 	.area GSINIT  (CODE)
                                    283 	.area GSFINAL (CODE)
                                    284 	.area CSEG    (CODE)
                                    285 ;--------------------------------------------------------
                                    286 ; global & static initialisations
                                    287 ;--------------------------------------------------------
                                    288 	.area HOME    (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 	.area GSFINAL (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; Home
                                    294 ;--------------------------------------------------------
                                    295 	.area HOME    (CODE)
                                    296 	.area HOME    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; code
                                    299 ;--------------------------------------------------------
                                    300 	.area CSEG    (CODE)
                                    301 ;------------------------------------------------------------
                                    302 ;Allocation info for local variables in function 'EP0ACK'
                                    303 ;------------------------------------------------------------
                                    304 ;	control.c:83: void EP0ACK()
                                    305 ;	-----------------------------------------
                                    306 ;	 function EP0ACK
                                    307 ;	-----------------------------------------
      000B6E                        308 _EP0ACK:
                           000007   309 	ar7 = 0x07
                           000006   310 	ar6 = 0x06
                           000005   311 	ar5 = 0x05
                           000004   312 	ar4 = 0x04
                           000003   313 	ar3 = 0x03
                           000002   314 	ar2 = 0x02
                           000001   315 	ar1 = 0x01
                           000000   316 	ar0 = 0x00
                                    317 ;	control.c:85: EP0CS = bmEP0ACK;
      000B6E 90 F0 48         [24]  318 	mov	dptr,#_EP0CS
      000B71 74 01            [12]  319 	mov	a,#0x01
      000B73 F0               [24]  320 	movx	@dptr,a
                                    321 ;	control.c:86: }
      000B74 22               [24]  322 	ret
                                    323 ;------------------------------------------------------------
                                    324 ;Allocation info for local variables in function 'SetAddress'
                                    325 ;------------------------------------------------------------
                                    326 ;ret                       Allocated to registers r7 
                                    327 ;------------------------------------------------------------
                                    328 ;	control.c:88: static BYTE SetAddress()
                                    329 ;	-----------------------------------------
                                    330 ;	 function SetAddress
                                    331 ;	-----------------------------------------
      000B75                        332 _SetAddress:
                                    333 ;	control.c:90: BYTE ret = FALSE;
      000B75 7F 00            [12]  334 	mov	r7,#0x00
                                    335 ;	control.c:92: if (wValue < 0x7F)
      000B77 C3               [12]  336 	clr	c
      000B78 E5 1C            [12]  337 	mov	a,_wValue
      000B7A 94 7F            [12]  338 	subb	a,#0x7f
      000B7C E5 1D            [12]  339 	mov	a,(_wValue + 1)
      000B7E 94 00            [12]  340 	subb	a,#0x00
      000B80 50 05            [24]  341 	jnc	00102$
                                    342 ;	control.c:94: EP0ACK();
      000B82 12 0B 6E         [24]  343 	lcall	_EP0ACK
                                    344 ;	control.c:95: ret = TRUE;
      000B85 7F 01            [12]  345 	mov	r7,#0x01
      000B87                        346 00102$:
                                    347 ;	control.c:98: return ret;
      000B87 8F 82            [24]  348 	mov	dpl,r7
                                    349 ;	control.c:99: }
      000B89 22               [24]  350 	ret
                                    351 ;------------------------------------------------------------
                                    352 ;Allocation info for local variables in function 'GetDescriptor'
                                    353 ;------------------------------------------------------------
                                    354 ;type                      Allocated to registers r7 
                                    355 ;typeIndex                 Allocated to registers r6 
                                    356 ;i                         Allocated to registers r7 
                                    357 ;total                     Allocated to registers r6 
                                    358 ;ret                       Allocated to registers r5 
                                    359 ;------------------------------------------------------------
                                    360 ;	control.c:101: static BYTE GetDescriptor()
                                    361 ;	-----------------------------------------
                                    362 ;	 function GetDescriptor
                                    363 ;	-----------------------------------------
      000B8A                        364 _GetDescriptor:
                                    365 ;	control.c:103: BYTE type = (wValue >> 8) & 0xFF;
      000B8A AF 1D            [24]  366 	mov	r7,(_wValue + 1)
                                    367 ;	control.c:104: BYTE typeIndex = (wValue & 0xFF) ;
      000B8C AE 1C            [24]  368 	mov	r6,_wValue
                                    369 ;	control.c:106: BYTE ret = FALSE;
      000B8E 7D 00            [12]  370 	mov	r5,#0x00
                                    371 ;	control.c:108: switch (type)
      000B90 BF 01 02         [24]  372 	cjne	r7,#0x01,00272$
      000B93 80 1A            [24]  373 	sjmp	00151$
      000B95                        374 00272$:
      000B95 BF 02 02         [24]  375 	cjne	r7,#0x02,00273$
      000B98 80 46            [24]  376 	sjmp	00103$
      000B9A                        377 00273$:
      000B9A BF 03 03         [24]  378 	cjne	r7,#0x03,00274$
      000B9D 02 0C 17         [24]  379 	ljmp	00105$
      000BA0                        380 00274$:
      000BA0 BF 06 03         [24]  381 	cjne	r7,#0x06,00275$
      000BA3 02 0C 87         [24]  382 	ljmp	00164$
      000BA6                        383 00275$:
      000BA6 BF 22 03         [24]  384 	cjne	r7,#0x22,00276$
      000BA9 02 0C B7         [24]  385 	ljmp	00167$
      000BAC                        386 00276$:
      000BAC 02 0C E5         [24]  387 	ljmp	00116$
                                    388 ;	control.c:112: for (i = 0; i < 0x12; i++)
      000BAF                        389 00151$:
      000BAF 7F 00            [12]  390 	mov	r7,#0x00
      000BB1                        391 00117$:
                                    392 ;	control.c:114: EP0.fifo = deviceDescriptor[i];
      000BB1 EF               [12]  393 	mov	a,r7
      000BB2 90 30 C8         [24]  394 	mov	dptr,#_deviceDescriptor
      000BB5 93               [24]  395 	movc	a,@a+dptr
      000BB6 90 F1 DC         [24]  396 	mov	dptr,#(_EP0 + 0x001c)
      000BB9 F0               [24]  397 	movx	@dptr,a
                                    398 ;	control.c:112: for (i = 0; i < 0x12; i++)
      000BBA 0F               [12]  399 	inc	r7
      000BBB BF 12 00         [24]  400 	cjne	r7,#0x12,00277$
      000BBE                        401 00277$:
                                    402 ;	control.c:117: SendControlResponse(wLength < 0x12 ? wLength : 0x12);
      000BBE 40 F1            [24]  403 	jc	00117$
      000BC0 E5 20            [12]  404 	mov	a,_wLength
      000BC2 94 12            [12]  405 	subb	a,#0x12
      000BC4 E5 21            [12]  406 	mov	a,(_wLength + 1)
      000BC6 94 00            [12]  407 	subb	a,#0x00
      000BC8 50 06            [24]  408 	jnc	00134$
      000BCA AC 20            [24]  409 	mov	r4,_wLength
      000BCC AF 21            [24]  410 	mov	r7,(_wLength + 1)
      000BCE 80 04            [24]  411 	sjmp	00135$
      000BD0                        412 00134$:
      000BD0 7C 12            [12]  413 	mov	r4,#0x12
      000BD2 7F 00            [12]  414 	mov	r7,#0x00
      000BD4                        415 00135$:
      000BD4 8C 82            [24]  416 	mov	dpl,r4
      000BD6 8F 83            [24]  417 	mov	dph,r7
      000BD8 12 04 48         [24]  418 	lcall	_SendControlResponse
                                    419 ;	control.c:118: ret = TRUE;
      000BDB 7D 01            [12]  420 	mov	r5,#0x01
                                    421 ;	control.c:120: break;
      000BDD 02 0C E5         [24]  422 	ljmp	00116$
                                    423 ;	control.c:122: case 0x02:
      000BE0                        424 00103$:
                                    425 ;	control.c:124: total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
      000BE0 C3               [12]  426 	clr	c
      000BE1 E5 20            [12]  427 	mov	a,_wLength
      000BE3 94 37            [12]  428 	subb	a,#0x37
      000BE5 E5 21            [12]  429 	mov	a,(_wLength + 1)
      000BE7 94 00            [12]  430 	subb	a,#0x00
      000BE9 50 06            [24]  431 	jnc	00136$
      000BEB AC 20            [24]  432 	mov	r4,_wLength
      000BED AF 21            [24]  433 	mov	r7,(_wLength + 1)
      000BEF 80 04            [24]  434 	sjmp	00137$
      000BF1                        435 00136$:
      000BF1 7C 37            [12]  436 	mov	r4,#0x37
      000BF3 7F 00            [12]  437 	mov	r7,#0x00
      000BF5                        438 00137$:
                                    439 ;	control.c:125: for (i = 0; i < total; i++)
      000BF5 7F 00            [12]  440 	mov	r7,#0x00
      000BF7                        441 00120$:
      000BF7 C3               [12]  442 	clr	c
      000BF8 EF               [12]  443 	mov	a,r7
      000BF9 9C               [12]  444 	subb	a,r4
      000BFA 50 0D            [24]  445 	jnc	00104$
                                    446 ;	control.c:127: EP0.fifo = configDescriptor[i];
      000BFC EF               [12]  447 	mov	a,r7
      000BFD 90 30 DA         [24]  448 	mov	dptr,#_configDescriptor
      000C00 93               [24]  449 	movc	a,@a+dptr
      000C01 FB               [12]  450 	mov	r3,a
      000C02 90 F1 DC         [24]  451 	mov	dptr,#(_EP0 + 0x001c)
      000C05 F0               [24]  452 	movx	@dptr,a
                                    453 ;	control.c:125: for (i = 0; i < total; i++)
      000C06 0F               [12]  454 	inc	r7
      000C07 80 EE            [24]  455 	sjmp	00120$
      000C09                        456 00104$:
                                    457 ;	control.c:130: SendControlResponse(total);
      000C09 7F 00            [12]  458 	mov	r7,#0x00
      000C0B 8C 82            [24]  459 	mov	dpl,r4
      000C0D 8F 83            [24]  460 	mov	dph,r7
      000C0F 12 04 48         [24]  461 	lcall	_SendControlResponse
                                    462 ;	control.c:131: ret = TRUE;
      000C12 7D 01            [12]  463 	mov	r5,#0x01
                                    464 ;	control.c:133: break;
      000C14 02 0C E5         [24]  465 	ljmp	00116$
                                    466 ;	control.c:135: case 0x03://string descriptor
      000C17                        467 00105$:
                                    468 ;	control.c:137: switch (typeIndex){
      000C17 BE 00 37         [24]  469 	cjne	r6,#0x00,00108$
                                    470 ;	control.c:139: total = wLength < sizeof(stringLanDescriptor) ? wLength : sizeof(stringLanDescriptor);
      000C1A C3               [12]  471 	clr	c
      000C1B E5 20            [12]  472 	mov	a,_wLength
      000C1D 94 04            [12]  473 	subb	a,#0x04
      000C1F E5 21            [12]  474 	mov	a,(_wLength + 1)
      000C21 94 00            [12]  475 	subb	a,#0x00
      000C23 50 06            [24]  476 	jnc	00138$
      000C25 AE 20            [24]  477 	mov	r6,_wLength
      000C27 AF 21            [24]  478 	mov	r7,(_wLength + 1)
      000C29 80 04            [24]  479 	sjmp	00139$
      000C2B                        480 00138$:
      000C2B 7E 04            [12]  481 	mov	r6,#0x04
      000C2D 7F 00            [12]  482 	mov	r7,#0x00
      000C2F                        483 00139$:
                                    484 ;	control.c:140: for (i = 0; i < total; i++)
      000C2F 7F 00            [12]  485 	mov	r7,#0x00
      000C31                        486 00123$:
      000C31 C3               [12]  487 	clr	c
      000C32 EF               [12]  488 	mov	a,r7
      000C33 9E               [12]  489 	subb	a,r6
      000C34 50 0D            [24]  490 	jnc	00107$
                                    491 ;	control.c:142: EP0.fifo = stringLanDescriptor[i];
      000C36 EF               [12]  492 	mov	a,r7
      000C37 90 31 50         [24]  493 	mov	dptr,#_stringLanDescriptor
      000C3A 93               [24]  494 	movc	a,@a+dptr
      000C3B FC               [12]  495 	mov	r4,a
      000C3C 90 F1 DC         [24]  496 	mov	dptr,#(_EP0 + 0x001c)
      000C3F F0               [24]  497 	movx	@dptr,a
                                    498 ;	control.c:140: for (i = 0; i < total; i++)
      000C40 0F               [12]  499 	inc	r7
      000C41 80 EE            [24]  500 	sjmp	00123$
      000C43                        501 00107$:
                                    502 ;	control.c:144: SendControlResponse(total);
      000C43 7F 00            [12]  503 	mov	r7,#0x00
      000C45 8E 82            [24]  504 	mov	dpl,r6
      000C47 8F 83            [24]  505 	mov	dph,r7
      000C49 12 04 48         [24]  506 	lcall	_SendControlResponse
                                    507 ;	control.c:145: ret = TRUE;					
      000C4C 7D 01            [12]  508 	mov	r5,#0x01
                                    509 ;	control.c:146: break;
      000C4E 02 0C E5         [24]  510 	ljmp	00116$
                                    511 ;	control.c:148: default:{
      000C51                        512 00108$:
                                    513 ;	control.c:149: total = wLength < sizeof(stringDescriptor) ? wLength : sizeof(stringDescriptor);
      000C51 C3               [12]  514 	clr	c
      000C52 E5 20            [12]  515 	mov	a,_wLength
      000C54 94 16            [12]  516 	subb	a,#0x16
      000C56 E5 21            [12]  517 	mov	a,(_wLength + 1)
      000C58 94 00            [12]  518 	subb	a,#0x00
      000C5A 50 06            [24]  519 	jnc	00140$
      000C5C AE 20            [24]  520 	mov	r6,_wLength
      000C5E AF 21            [24]  521 	mov	r7,(_wLength + 1)
      000C60 80 04            [24]  522 	sjmp	00141$
      000C62                        523 00140$:
      000C62 7E 16            [12]  524 	mov	r6,#0x16
      000C64 7F 00            [12]  525 	mov	r7,#0x00
      000C66                        526 00141$:
                                    527 ;	control.c:150: for (i = 0; i < total; i++)
      000C66 7F 00            [12]  528 	mov	r7,#0x00
      000C68                        529 00126$:
      000C68 C3               [12]  530 	clr	c
      000C69 EF               [12]  531 	mov	a,r7
      000C6A 9E               [12]  532 	subb	a,r6
      000C6B 50 0D            [24]  533 	jnc	00109$
                                    534 ;	control.c:152: EP0.fifo = stringDescriptor[i];
      000C6D EF               [12]  535 	mov	a,r7
      000C6E 90 31 54         [24]  536 	mov	dptr,#_stringDescriptor
      000C71 93               [24]  537 	movc	a,@a+dptr
      000C72 FC               [12]  538 	mov	r4,a
      000C73 90 F1 DC         [24]  539 	mov	dptr,#(_EP0 + 0x001c)
      000C76 F0               [24]  540 	movx	@dptr,a
                                    541 ;	control.c:150: for (i = 0; i < total; i++)
      000C77 0F               [12]  542 	inc	r7
      000C78 80 EE            [24]  543 	sjmp	00126$
      000C7A                        544 00109$:
                                    545 ;	control.c:154: SendControlResponse(total);
      000C7A 7F 00            [12]  546 	mov	r7,#0x00
      000C7C 8E 82            [24]  547 	mov	dpl,r6
      000C7E 8F 83            [24]  548 	mov	dph,r7
      000C80 12 04 48         [24]  549 	lcall	_SendControlResponse
                                    550 ;	control.c:155: ret = TRUE;					
      000C83 7D 01            [12]  551 	mov	r5,#0x01
                                    552 ;	control.c:160: break;
                                    553 ;	control.c:164: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000C85 80 5E            [24]  554 	sjmp	00116$
      000C87                        555 00164$:
      000C87 7F 00            [12]  556 	mov	r7,#0x00
      000C89                        557 00128$:
                                    558 ;	control.c:166: EP0.fifo = deviceQualifierDescriptor[i];
      000C89 EF               [12]  559 	mov	a,r7
      000C8A 90 31 9E         [24]  560 	mov	dptr,#_deviceQualifierDescriptor
      000C8D 93               [24]  561 	movc	a,@a+dptr
      000C8E 90 F1 DC         [24]  562 	mov	dptr,#(_EP0 + 0x001c)
      000C91 F0               [24]  563 	movx	@dptr,a
                                    564 ;	control.c:164: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000C92 0F               [12]  565 	inc	r7
      000C93 BF 0A 00         [24]  566 	cjne	r7,#0x0a,00288$
      000C96                        567 00288$:
                                    568 ;	control.c:169: SendControlResponse(wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor));
      000C96 40 F1            [24]  569 	jc	00128$
      000C98 E5 20            [12]  570 	mov	a,_wLength
      000C9A 94 0A            [12]  571 	subb	a,#0x0a
      000C9C E5 21            [12]  572 	mov	a,(_wLength + 1)
      000C9E 94 00            [12]  573 	subb	a,#0x00
      000CA0 50 06            [24]  574 	jnc	00142$
      000CA2 AE 20            [24]  575 	mov	r6,_wLength
      000CA4 AF 21            [24]  576 	mov	r7,(_wLength + 1)
      000CA6 80 04            [24]  577 	sjmp	00143$
      000CA8                        578 00142$:
      000CA8 7E 0A            [12]  579 	mov	r6,#0x0a
      000CAA 7F 00            [12]  580 	mov	r7,#0x00
      000CAC                        581 00143$:
      000CAC 8E 82            [24]  582 	mov	dpl,r6
      000CAE 8F 83            [24]  583 	mov	dph,r7
      000CB0 12 04 48         [24]  584 	lcall	_SendControlResponse
                                    585 ;	control.c:170: ret = TRUE;
      000CB3 7D 01            [12]  586 	mov	r5,#0x01
                                    587 ;	control.c:172: break;
                                    588 ;	control.c:176: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000CB5 80 2E            [24]  589 	sjmp	00116$
      000CB7                        590 00167$:
      000CB7 7F 00            [12]  591 	mov	r7,#0x00
      000CB9                        592 00130$:
                                    593 ;	control.c:178: EP0.fifo = HIDreportDescriptor[i];
      000CB9 EF               [12]  594 	mov	a,r7
      000CBA 90 31 11         [24]  595 	mov	dptr,#_HIDreportDescriptor
      000CBD 93               [24]  596 	movc	a,@a+dptr
      000CBE 90 F1 DC         [24]  597 	mov	dptr,#(_EP0 + 0x001c)
      000CC1 F0               [24]  598 	movx	@dptr,a
                                    599 ;	control.c:176: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000CC2 0F               [12]  600 	inc	r7
      000CC3 BF 3F 00         [24]  601 	cjne	r7,#0x3f,00291$
      000CC6                        602 00291$:
                                    603 ;	control.c:181: SendControlResponse(wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor));
      000CC6 40 F1            [24]  604 	jc	00130$
      000CC8 E5 20            [12]  605 	mov	a,_wLength
      000CCA 94 3F            [12]  606 	subb	a,#0x3f
      000CCC E5 21            [12]  607 	mov	a,(_wLength + 1)
      000CCE 94 00            [12]  608 	subb	a,#0x00
      000CD0 50 06            [24]  609 	jnc	00144$
      000CD2 AE 20            [24]  610 	mov	r6,_wLength
      000CD4 AF 21            [24]  611 	mov	r7,(_wLength + 1)
      000CD6 80 04            [24]  612 	sjmp	00145$
      000CD8                        613 00144$:
      000CD8 7E 3F            [12]  614 	mov	r6,#0x3f
      000CDA 7F 00            [12]  615 	mov	r7,#0x00
      000CDC                        616 00145$:
      000CDC 8E 82            [24]  617 	mov	dpl,r6
      000CDE 8F 83            [24]  618 	mov	dph,r7
      000CE0 12 04 48         [24]  619 	lcall	_SendControlResponse
                                    620 ;	control.c:182: ret = TRUE;
      000CE3 7D 01            [12]  621 	mov	r5,#0x01
                                    622 ;	control.c:190: }
      000CE5                        623 00116$:
                                    624 ;	control.c:192: return ret;
      000CE5 8D 82            [24]  625 	mov	dpl,r5
                                    626 ;	control.c:193: }
      000CE7 22               [24]  627 	ret
                                    628 ;------------------------------------------------------------
                                    629 ;Allocation info for local variables in function 'SetConfiguration'
                                    630 ;------------------------------------------------------------
                                    631 ;ret                       Allocated to registers r7 
                                    632 ;------------------------------------------------------------
                                    633 ;	control.c:195: static BYTE SetConfiguration()
                                    634 ;	-----------------------------------------
                                    635 ;	 function SetConfiguration
                                    636 ;	-----------------------------------------
      000CE8                        637 _SetConfiguration:
                                    638 ;	control.c:197: BYTE ret = FALSE;
      000CE8 7F 00            [12]  639 	mov	r7,#0x00
                                    640 ;	control.c:199: if (wValue <= 1)
      000CEA C3               [12]  641 	clr	c
      000CEB 74 01            [12]  642 	mov	a,#0x01
      000CED 95 1C            [12]  643 	subb	a,_wValue
      000CEF E4               [12]  644 	clr	a
      000CF0 95 1D            [12]  645 	subb	a,(_wValue + 1)
      000CF2 40 05            [24]  646 	jc	00102$
                                    647 ;	control.c:201: EP0ACK();
      000CF4 12 0B 6E         [24]  648 	lcall	_EP0ACK
                                    649 ;	control.c:202: ret = TRUE;
      000CF7 7F 01            [12]  650 	mov	r7,#0x01
      000CF9                        651 00102$:
                                    652 ;	control.c:205: return ret;
      000CF9 8F 82            [24]  653 	mov	dpl,r7
                                    654 ;	control.c:206: }
      000CFB 22               [24]  655 	ret
                                    656 ;------------------------------------------------------------
                                    657 ;Allocation info for local variables in function 'HandleStandardRequest'
                                    658 ;------------------------------------------------------------
                                    659 ;	control.c:208: BYTE HandleStandardRequest()
                                    660 ;	-----------------------------------------
                                    661 ;	 function HandleStandardRequest
                                    662 ;	-----------------------------------------
      000CFC                        663 _HandleStandardRequest:
                                    664 ;	control.c:210: switch(bRequest)
      000CFC 74 05            [12]  665 	mov	a,#0x05
      000CFE B5 1B 02         [24]  666 	cjne	a,_bRequest,00120$
      000D01 80 0E            [24]  667 	sjmp	00101$
      000D03                        668 00120$:
      000D03 74 06            [12]  669 	mov	a,#0x06
      000D05 B5 1B 02         [24]  670 	cjne	a,_bRequest,00121$
      000D08 80 0A            [24]  671 	sjmp	00102$
      000D0A                        672 00121$:
      000D0A 74 09            [12]  673 	mov	a,#0x09
                                    674 ;	control.c:212: case 0x05:
      000D0C B5 1B 0B         [24]  675 	cjne	a,_bRequest,00104$
      000D0F 80 06            [24]  676 	sjmp	00103$
      000D11                        677 00101$:
                                    678 ;	control.c:214: return SetAddress();
                                    679 ;	control.c:216: case 0x06:
      000D11 02 0B 75         [24]  680 	ljmp	_SetAddress
      000D14                        681 00102$:
                                    682 ;	control.c:218: return GetDescriptor();
                                    683 ;	control.c:220: case 0x09:
      000D14 02 0B 8A         [24]  684 	ljmp	_GetDescriptor
      000D17                        685 00103$:
                                    686 ;	control.c:222: return SetConfiguration();
                                    687 ;	control.c:224: default:
      000D17 02 0C E8         [24]  688 	ljmp	_SetConfiguration
      000D1A                        689 00104$:
                                    690 ;	control.c:226: return FALSE;
      000D1A 75 82 00         [24]  691 	mov	dpl,#0x00
                                    692 ;	control.c:228: }
                                    693 ;	control.c:229: }
      000D1D 22               [24]  694 	ret
                                    695 ;------------------------------------------------------------
                                    696 ;Allocation info for local variables in function 'GetMaxLUN'
                                    697 ;------------------------------------------------------------
                                    698 ;	control.c:231: static BYTE GetMaxLUN()
                                    699 ;	-----------------------------------------
                                    700 ;	 function GetMaxLUN
                                    701 ;	-----------------------------------------
      000D1E                        702 _GetMaxLUN:
                                    703 ;	control.c:233: EP0.fifo = 0x00;
      000D1E 90 F1 DC         [24]  704 	mov	dptr,#(_EP0 + 0x001c)
      000D21 E4               [12]  705 	clr	a
      000D22 F0               [24]  706 	movx	@dptr,a
                                    707 ;	control.c:234: SendControlResponse(wLength < 0x01 ? wLength : 0x01);
      000D23 C3               [12]  708 	clr	c
      000D24 E5 20            [12]  709 	mov	a,_wLength
      000D26 94 01            [12]  710 	subb	a,#0x01
      000D28 E5 21            [12]  711 	mov	a,(_wLength + 1)
      000D2A 94 00            [12]  712 	subb	a,#0x00
      000D2C 50 06            [24]  713 	jnc	00103$
      000D2E AE 20            [24]  714 	mov	r6,_wLength
      000D30 AF 21            [24]  715 	mov	r7,(_wLength + 1)
      000D32 80 04            [24]  716 	sjmp	00104$
      000D34                        717 00103$:
      000D34 7E 01            [12]  718 	mov	r6,#0x01
      000D36 7F 00            [12]  719 	mov	r7,#0x00
      000D38                        720 00104$:
      000D38 8E 82            [24]  721 	mov	dpl,r6
      000D3A 8F 83            [24]  722 	mov	dph,r7
      000D3C 12 04 48         [24]  723 	lcall	_SendControlResponse
                                    724 ;	control.c:236: return TRUE;
      000D3F 75 82 01         [24]  725 	mov	dpl,#0x01
                                    726 ;	control.c:237: }
      000D42 22               [24]  727 	ret
                                    728 ;------------------------------------------------------------
                                    729 ;Allocation info for local variables in function 'HandleClassRequest'
                                    730 ;------------------------------------------------------------
                                    731 ;	control.c:239: BYTE HandleClassRequest()
                                    732 ;	-----------------------------------------
                                    733 ;	 function HandleClassRequest
                                    734 ;	-----------------------------------------
      000D43                        735 _HandleClassRequest:
                                    736 ;	control.c:241: switch(bRequest)
      000D43 74 09            [12]  737 	mov	a,#0x09
      000D45 B5 1B 02         [24]  738 	cjne	a,_bRequest,00120$
      000D48 80 0E            [24]  739 	sjmp	00101$
      000D4A                        740 00120$:
      000D4A 74 0A            [12]  741 	mov	a,#0x0a
      000D4C B5 1B 02         [24]  742 	cjne	a,_bRequest,00121$
      000D4F 80 11            [24]  743 	sjmp	00102$
      000D51                        744 00121$:
      000D51 74 FE            [12]  745 	mov	a,#0xfe
                                    746 ;	control.c:243: case 0x09:
      000D53 B5 1B 16         [24]  747 	cjne	a,_bRequest,00104$
      000D56 80 11            [24]  748 	sjmp	00103$
      000D58                        749 00101$:
                                    750 ;	control.c:245: EP0CS = 0x05;
      000D58 90 F0 48         [24]  751 	mov	dptr,#_EP0CS
      000D5B 74 05            [12]  752 	mov	a,#0x05
      000D5D F0               [24]  753 	movx	@dptr,a
                                    754 ;	control.c:246: return TRUE;
      000D5E 75 82 01         [24]  755 	mov	dpl,#0x01
                                    756 ;	control.c:248: case 0x0A:
      000D61 22               [24]  757 	ret
      000D62                        758 00102$:
                                    759 ;	control.c:250: EP0ACK();
      000D62 12 0B 6E         [24]  760 	lcall	_EP0ACK
                                    761 ;	control.c:251: return TRUE;
      000D65 75 82 01         [24]  762 	mov	dpl,#0x01
                                    763 ;	control.c:253: case 0xFE:
      000D68 22               [24]  764 	ret
      000D69                        765 00103$:
                                    766 ;	control.c:255: return GetMaxLUN();
                                    767 ;	control.c:257: default:
      000D69 02 0D 1E         [24]  768 	ljmp	_GetMaxLUN
      000D6C                        769 00104$:
                                    770 ;	control.c:259: return FALSE;
      000D6C 75 82 00         [24]  771 	mov	dpl,#0x00
                                    772 ;	control.c:261: }
                                    773 ;	control.c:262: }
      000D6F 22               [24]  774 	ret
                                    775 ;------------------------------------------------------------
                                    776 ;Allocation info for local variables in function 'HandleVendorRequest'
                                    777 ;------------------------------------------------------------
                                    778 ;	control.c:264: BYTE HandleVendorRequest()
                                    779 ;	-----------------------------------------
                                    780 ;	 function HandleVendorRequest
                                    781 ;	-----------------------------------------
      000D70                        782 _HandleVendorRequest:
                                    783 ;	control.c:266: return FALSE;
      000D70 75 82 00         [24]  784 	mov	dpl,#0x00
                                    785 ;	control.c:267: }
      000D73 22               [24]  786 	ret
                                    787 	.area CSEG    (CODE)
                                    788 	.area CONST   (CODE)
      0030C8                        789 _deviceDescriptor:
      0030C8 12                     790 	.db #0x12	; 18
      0030C9 01                     791 	.db #0x01	; 1
      0030CA 00                     792 	.db #0x00	; 0
      0030CB 02                     793 	.db #0x02	; 2
      0030CC 03                     794 	.db #0x03	; 3
      0030CD 01                     795 	.db #0x01	; 1
      0030CE 00                     796 	.db #0x00	; 0
      0030CF 40                     797 	.db #0x40	; 64
      0030D0 B4                     798 	.db #0xb4	; 180
      0030D1 04                     799 	.db #0x04	; 4
      0030D2 05                     800 	.db #0x05	; 5
      0030D3 69                     801 	.db #0x69	; 105	'i'
      0030D4 00                     802 	.db #0x00	; 0
      0030D5 00                     803 	.db #0x00	; 0
      0030D6 01                     804 	.db #0x01	; 1
      0030D7 02                     805 	.db #0x02	; 2
      0030D8 03                     806 	.db #0x03	; 3
      0030D9 01                     807 	.db #0x01	; 1
      0030DA                        808 _configDescriptor:
      0030DA 09                     809 	.db #0x09	; 9
      0030DB 02                     810 	.db #0x02	; 2
      0030DC 37                     811 	.db #0x37	; 55	'7'
      0030DD 00                     812 	.db #0x00	; 0
      0030DE 01                     813 	.db #0x01	; 1
      0030DF 01                     814 	.db #0x01	; 1
      0030E0 00                     815 	.db #0x00	; 0
      0030E1 80                     816 	.db #0x80	; 128
      0030E2 4B                     817 	.db #0x4b	; 75	'K'
      0030E3 09                     818 	.db #0x09	; 9
      0030E4 04                     819 	.db #0x04	; 4
      0030E5 00                     820 	.db #0x00	; 0
      0030E6 00                     821 	.db #0x00	; 0
      0030E7 04                     822 	.db #0x04	; 4
      0030E8 03                     823 	.db #0x03	; 3
      0030E9 01                     824 	.db #0x01	; 1
      0030EA 01                     825 	.db #0x01	; 1
      0030EB 00                     826 	.db #0x00	; 0
      0030EC 09                     827 	.db #0x09	; 9
      0030ED 21                     828 	.db #0x21	; 33
      0030EE 01                     829 	.db #0x01	; 1
      0030EF 01                     830 	.db #0x01	; 1
      0030F0 00                     831 	.db #0x00	; 0
      0030F1 01                     832 	.db #0x01	; 1
      0030F2 22                     833 	.db #0x22	; 34
      0030F3 3F                     834 	.db #0x3f	; 63
      0030F4 00                     835 	.db #0x00	; 0
      0030F5 07                     836 	.db #0x07	; 7
      0030F6 05                     837 	.db #0x05	; 5
      0030F7 81                     838 	.db #0x81	; 129
      0030F8 00                     839 	.db #0x00	; 0
      0030F9 08                     840 	.db #0x08	; 8
      0030FA 00                     841 	.db #0x00	; 0
      0030FB 00                     842 	.db #0x00	; 0
      0030FC 07                     843 	.db #0x07	; 7
      0030FD 05                     844 	.db #0x05	; 5
      0030FE 02                     845 	.db #0x02	; 2
      0030FF 00                     846 	.db #0x00	; 0
      003100 08                     847 	.db #0x08	; 8
      003101 00                     848 	.db #0x00	; 0
      003102 00                     849 	.db #0x00	; 0
      003103 07                     850 	.db #0x07	; 7
      003104 05                     851 	.db #0x05	; 5
      003105 83                     852 	.db #0x83	; 131
      003106 03                     853 	.db #0x03	; 3
      003107 08                     854 	.db #0x08	; 8
      003108 00                     855 	.db #0x00	; 0
      003109 00                     856 	.db #0x00	; 0
      00310A 07                     857 	.db #0x07	; 7
      00310B 05                     858 	.db #0x05	; 5
      00310C 04                     859 	.db #0x04	; 4
      00310D 03                     860 	.db #0x03	; 3
      00310E 08                     861 	.db #0x08	; 8
      00310F 00                     862 	.db #0x00	; 0
      003110 01                     863 	.db #0x01	; 1
      003111                        864 _HIDreportDescriptor:
      003111 05                     865 	.db #0x05	; 5
      003112 01                     866 	.db #0x01	; 1
      003113 09                     867 	.db #0x09	; 9
      003114 06                     868 	.db #0x06	; 6
      003115 A1                     869 	.db #0xa1	; 161
      003116 01                     870 	.db #0x01	; 1
      003117 05                     871 	.db #0x05	; 5
      003118 07                     872 	.db #0x07	; 7
      003119 19                     873 	.db #0x19	; 25
      00311A E0                     874 	.db #0xe0	; 224
      00311B 29                     875 	.db #0x29	; 41
      00311C E7                     876 	.db #0xe7	; 231
      00311D 15                     877 	.db #0x15	; 21
      00311E 00                     878 	.db #0x00	; 0
      00311F 25                     879 	.db #0x25	; 37
      003120 01                     880 	.db #0x01	; 1
      003121 75                     881 	.db #0x75	; 117	'u'
      003122 01                     882 	.db #0x01	; 1
      003123 95                     883 	.db #0x95	; 149
      003124 08                     884 	.db #0x08	; 8
      003125 81                     885 	.db #0x81	; 129
      003126 02                     886 	.db #0x02	; 2
      003127 95                     887 	.db #0x95	; 149
      003128 01                     888 	.db #0x01	; 1
      003129 75                     889 	.db #0x75	; 117	'u'
      00312A 08                     890 	.db #0x08	; 8
      00312B 81                     891 	.db #0x81	; 129
      00312C 01                     892 	.db #0x01	; 1
      00312D 95                     893 	.db #0x95	; 149
      00312E 05                     894 	.db #0x05	; 5
      00312F 75                     895 	.db #0x75	; 117	'u'
      003130 01                     896 	.db #0x01	; 1
      003131 05                     897 	.db #0x05	; 5
      003132 08                     898 	.db #0x08	; 8
      003133 19                     899 	.db #0x19	; 25
      003134 01                     900 	.db #0x01	; 1
      003135 29                     901 	.db #0x29	; 41
      003136 05                     902 	.db #0x05	; 5
      003137 91                     903 	.db #0x91	; 145
      003138 02                     904 	.db #0x02	; 2
      003139 95                     905 	.db #0x95	; 149
      00313A 01                     906 	.db #0x01	; 1
      00313B 75                     907 	.db #0x75	; 117	'u'
      00313C 03                     908 	.db #0x03	; 3
      00313D 91                     909 	.db #0x91	; 145
      00313E 01                     910 	.db #0x01	; 1
      00313F 95                     911 	.db #0x95	; 149
      003140 06                     912 	.db #0x06	; 6
      003141 75                     913 	.db #0x75	; 117	'u'
      003142 08                     914 	.db #0x08	; 8
      003143 15                     915 	.db #0x15	; 21
      003144 00                     916 	.db #0x00	; 0
      003145 25                     917 	.db #0x25	; 37
      003146 65                     918 	.db #0x65	; 101	'e'
      003147 05                     919 	.db #0x05	; 5
      003148 07                     920 	.db #0x07	; 7
      003149 19                     921 	.db #0x19	; 25
      00314A 00                     922 	.db #0x00	; 0
      00314B 29                     923 	.db #0x29	; 41
      00314C 65                     924 	.db #0x65	; 101	'e'
      00314D 81                     925 	.db #0x81	; 129
      00314E 00                     926 	.db #0x00	; 0
      00314F C0                     927 	.db #0xc0	; 192
      003150                        928 _stringLanDescriptor:
      003150 04                     929 	.db #0x04	; 4
      003151 03                     930 	.db #0x03	; 3
      003152 09                     931 	.db #0x09	; 9
      003153 04                     932 	.db #0x04	; 4
      003154                        933 _stringDescriptor:
      003154 16                     934 	.db #0x16	; 22
      003155 03                     935 	.db #0x03	; 3
      003156 56                     936 	.db #0x56	; 86	'V'
      003157 00                     937 	.db #0x00	; 0
      003158 69                     938 	.db #0x69	; 105	'i'
      003159 00                     939 	.db #0x00	; 0
      00315A 72                     940 	.db #0x72	; 114	'r'
      00315B 00                     941 	.db #0x00	; 0
      00315C 74                     942 	.db #0x74	; 116	't'
      00315D 00                     943 	.db #0x00	; 0
      00315E 75                     944 	.db #0x75	; 117	'u'
      00315F 00                     945 	.db #0x00	; 0
      003160 61                     946 	.db #0x61	; 97	'a'
      003161 00                     947 	.db #0x00	; 0
      003162 6C                     948 	.db #0x6c	; 108	'l'
      003163 00                     949 	.db #0x00	; 0
      003164 42                     950 	.db #0x42	; 66	'B'
      003165 00                     951 	.db #0x00	; 0
      003166 6F                     952 	.db #0x6f	; 111	'o'
      003167 00                     953 	.db #0x00	; 0
      003168 78                     954 	.db #0x78	; 120	'x'
      003169 00                     955 	.db #0x00	; 0
      00316A                        956 _HIDreportDescriptorMouse:
      00316A 05                     957 	.db #0x05	; 5
      00316B 01                     958 	.db #0x01	; 1
      00316C 09                     959 	.db #0x09	; 9
      00316D 02                     960 	.db #0x02	; 2
      00316E A1                     961 	.db #0xa1	; 161
      00316F 01                     962 	.db #0x01	; 1
      003170 09                     963 	.db #0x09	; 9
      003171 01                     964 	.db #0x01	; 1
      003172 A1                     965 	.db #0xa1	; 161
      003173 00                     966 	.db #0x00	; 0
      003174 05                     967 	.db #0x05	; 5
      003175 09                     968 	.db #0x09	; 9
      003176 19                     969 	.db #0x19	; 25
      003177 01                     970 	.db #0x01	; 1
      003178 29                     971 	.db #0x29	; 41
      003179 03                     972 	.db #0x03	; 3
      00317A 15                     973 	.db #0x15	; 21
      00317B 00                     974 	.db #0x00	; 0
      00317C 25                     975 	.db #0x25	; 37
      00317D 01                     976 	.db #0x01	; 1
      00317E 95                     977 	.db #0x95	; 149
      00317F 03                     978 	.db #0x03	; 3
      003180 75                     979 	.db #0x75	; 117	'u'
      003181 01                     980 	.db #0x01	; 1
      003182 81                     981 	.db #0x81	; 129
      003183 02                     982 	.db #0x02	; 2
      003184 95                     983 	.db #0x95	; 149
      003185 01                     984 	.db #0x01	; 1
      003186 75                     985 	.db #0x75	; 117	'u'
      003187 05                     986 	.db #0x05	; 5
      003188 81                     987 	.db #0x81	; 129
      003189 03                     988 	.db #0x03	; 3
      00318A 05                     989 	.db #0x05	; 5
      00318B 01                     990 	.db #0x01	; 1
      00318C 09                     991 	.db #0x09	; 9
      00318D 30                     992 	.db #0x30	; 48	'0'
      00318E 09                     993 	.db #0x09	; 9
      00318F 31                     994 	.db #0x31	; 49	'1'
      003190 09                     995 	.db #0x09	; 9
      003191 38                     996 	.db #0x38	; 56	'8'
      003192 15                     997 	.db #0x15	; 21
      003193 81                     998 	.db #0x81	; 129
      003194 25                     999 	.db #0x25	; 37
      003195 7F                    1000 	.db #0x7f	; 127
      003196 75                    1001 	.db #0x75	; 117	'u'
      003197 08                    1002 	.db #0x08	; 8
      003198 95                    1003 	.db #0x95	; 149
      003199 03                    1004 	.db #0x03	; 3
      00319A 81                    1005 	.db #0x81	; 129
      00319B 06                    1006 	.db #0x06	; 6
      00319C C0                    1007 	.db #0xc0	; 192
      00319D C0                    1008 	.db #0xc0	; 192
      00319E                       1009 _deviceQualifierDescriptor:
      00319E 0A                    1010 	.db #0x0a	; 10
      00319F 06                    1011 	.db #0x06	; 6
      0031A0 00                    1012 	.db #0x00	; 0
      0031A1 02                    1013 	.db #0x02	; 2
      0031A2 00                    1014 	.db #0x00	; 0
      0031A3 00                    1015 	.db #0x00	; 0
      0031A4 00                    1016 	.db #0x00	; 0
      0031A5 40                    1017 	.db #0x40	; 64
      0031A6 01                    1018 	.db #0x01	; 1
      0031A7 00                    1019 	.db #0x00	; 0
                                   1020 	.area XINIT   (CODE)
                                   1021 	.area CABS    (ABS,CODE)

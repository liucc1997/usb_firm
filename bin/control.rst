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
                                    304 ;	control.c:28: void EP0ACK()
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
                                    317 ;	control.c:30: EP0CS = bmEP0ACK;
      000B6E 90 F0 48         [24]  318 	mov	dptr,#_EP0CS
      000B71 74 01            [12]  319 	mov	a,#0x01
      000B73 F0               [24]  320 	movx	@dptr,a
                                    321 ;	control.c:31: }
      000B74 22               [24]  322 	ret
                                    323 ;------------------------------------------------------------
                                    324 ;Allocation info for local variables in function 'SetAddress'
                                    325 ;------------------------------------------------------------
                                    326 ;ret                       Allocated to registers r7 
                                    327 ;------------------------------------------------------------
                                    328 ;	control.c:33: static BYTE SetAddress()
                                    329 ;	-----------------------------------------
                                    330 ;	 function SetAddress
                                    331 ;	-----------------------------------------
      000B75                        332 _SetAddress:
                                    333 ;	control.c:35: BYTE ret = FALSE;
      000B75 7F 00            [12]  334 	mov	r7,#0x00
                                    335 ;	control.c:37: if (wValue < 0x7F)
      000B77 C3               [12]  336 	clr	c
      000B78 E5 1C            [12]  337 	mov	a,_wValue
      000B7A 94 7F            [12]  338 	subb	a,#0x7f
      000B7C E5 1D            [12]  339 	mov	a,(_wValue + 1)
      000B7E 94 00            [12]  340 	subb	a,#0x00
      000B80 50 05            [24]  341 	jnc	00102$
                                    342 ;	control.c:39: EP0ACK();
      000B82 12 0B 6E         [24]  343 	lcall	_EP0ACK
                                    344 ;	control.c:40: ret = TRUE;
      000B85 7F 01            [12]  345 	mov	r7,#0x01
      000B87                        346 00102$:
                                    347 ;	control.c:43: return ret;
      000B87 8F 82            [24]  348 	mov	dpl,r7
                                    349 ;	control.c:44: }
      000B89 22               [24]  350 	ret
                                    351 ;------------------------------------------------------------
                                    352 ;Allocation info for local variables in function 'GetDescriptor'
                                    353 ;------------------------------------------------------------
                                    354 ;type                      Allocated to registers r7 
                                    355 ;i                         Allocated to registers r7 
                                    356 ;total                     Allocated to registers r5 
                                    357 ;ret                       Allocated to registers r6 
                                    358 ;------------------------------------------------------------
                                    359 ;	control.c:46: static BYTE GetDescriptor()
                                    360 ;	-----------------------------------------
                                    361 ;	 function GetDescriptor
                                    362 ;	-----------------------------------------
      000B8A                        363 _GetDescriptor:
                                    364 ;	control.c:48: BYTE type = (wValue >> 8) & 0xFF;
      000B8A AF 1D            [24]  365 	mov	r7,(_wValue + 1)
                                    366 ;	control.c:50: BYTE ret = FALSE;
      000B8C 7E 00            [12]  367 	mov	r6,#0x00
                                    368 ;	control.c:52: switch (type)
      000B8E BF 01 02         [24]  369 	cjne	r7,#0x01,00198$
      000B91 80 14            [24]  370 	sjmp	00134$
      000B93                        371 00198$:
      000B93 BF 02 02         [24]  372 	cjne	r7,#0x02,00199$
      000B96 80 40            [24]  373 	sjmp	00103$
      000B98                        374 00199$:
      000B98 BF 06 03         [24]  375 	cjne	r7,#0x06,00200$
      000B9B 02 0C 0E         [24]  376 	ljmp	00140$
      000B9E                        377 00200$:
      000B9E BF 22 03         [24]  378 	cjne	r7,#0x22,00201$
      000BA1 02 0C 3E         [24]  379 	ljmp	00143$
      000BA4                        380 00201$:
      000BA4 02 0C 6C         [24]  381 	ljmp	00110$
                                    382 ;	control.c:56: for (i = 0; i < 0x12; i++)
      000BA7                        383 00134$:
      000BA7 7F 00            [12]  384 	mov	r7,#0x00
      000BA9                        385 00111$:
                                    386 ;	control.c:58: EP0.fifo = deviceDescriptor[i];
      000BA9 EF               [12]  387 	mov	a,r7
      000BAA 90 30 4F         [24]  388 	mov	dptr,#_deviceDescriptor
      000BAD 93               [24]  389 	movc	a,@a+dptr
      000BAE 90 F1 DC         [24]  390 	mov	dptr,#(_EP0 + 0x001c)
      000BB1 F0               [24]  391 	movx	@dptr,a
                                    392 ;	control.c:56: for (i = 0; i < 0x12; i++)
      000BB2 0F               [12]  393 	inc	r7
      000BB3 BF 12 00         [24]  394 	cjne	r7,#0x12,00202$
      000BB6                        395 00202$:
                                    396 ;	control.c:61: SendControlResponse(wLength < 0x12 ? wLength : 0x12);
      000BB6 40 F1            [24]  397 	jc	00111$
      000BB8 E5 20            [12]  398 	mov	a,_wLength
      000BBA 94 12            [12]  399 	subb	a,#0x12
      000BBC E5 21            [12]  400 	mov	a,(_wLength + 1)
      000BBE 94 00            [12]  401 	subb	a,#0x00
      000BC0 50 06            [24]  402 	jnc	00122$
      000BC2 AD 20            [24]  403 	mov	r5,_wLength
      000BC4 AF 21            [24]  404 	mov	r7,(_wLength + 1)
      000BC6 80 04            [24]  405 	sjmp	00123$
      000BC8                        406 00122$:
      000BC8 7D 12            [12]  407 	mov	r5,#0x12
      000BCA 7F 00            [12]  408 	mov	r7,#0x00
      000BCC                        409 00123$:
      000BCC 8D 82            [24]  410 	mov	dpl,r5
      000BCE 8F 83            [24]  411 	mov	dph,r7
      000BD0 12 04 48         [24]  412 	lcall	_SendControlResponse
                                    413 ;	control.c:62: ret = TRUE;
      000BD3 7E 01            [12]  414 	mov	r6,#0x01
                                    415 ;	control.c:64: break;
      000BD5 02 0C 6C         [24]  416 	ljmp	00110$
                                    417 ;	control.c:66: case 0x02:
      000BD8                        418 00103$:
                                    419 ;	control.c:68: total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
      000BD8 C3               [12]  420 	clr	c
      000BD9 E5 20            [12]  421 	mov	a,_wLength
      000BDB 94 47            [12]  422 	subb	a,#0x47
      000BDD E5 21            [12]  423 	mov	a,(_wLength + 1)
      000BDF 94 00            [12]  424 	subb	a,#0x00
      000BE1 50 06            [24]  425 	jnc	00124$
      000BE3 AD 20            [24]  426 	mov	r5,_wLength
      000BE5 AF 21            [24]  427 	mov	r7,(_wLength + 1)
      000BE7 80 04            [24]  428 	sjmp	00125$
      000BE9                        429 00124$:
      000BE9 7D 47            [12]  430 	mov	r5,#0x47
      000BEB 7F 00            [12]  431 	mov	r7,#0x00
      000BED                        432 00125$:
                                    433 ;	control.c:69: for (i = 0; i < total; i++)
      000BED 7F 00            [12]  434 	mov	r7,#0x00
      000BEF                        435 00114$:
      000BEF C3               [12]  436 	clr	c
      000BF0 EF               [12]  437 	mov	a,r7
      000BF1 9D               [12]  438 	subb	a,r5
      000BF2 50 0D            [24]  439 	jnc	00104$
                                    440 ;	control.c:71: EP0.fifo = configDescriptor[i];
      000BF4 EF               [12]  441 	mov	a,r7
      000BF5 90 30 61         [24]  442 	mov	dptr,#_configDescriptor
      000BF8 93               [24]  443 	movc	a,@a+dptr
      000BF9 FC               [12]  444 	mov	r4,a
      000BFA 90 F1 DC         [24]  445 	mov	dptr,#(_EP0 + 0x001c)
      000BFD F0               [24]  446 	movx	@dptr,a
                                    447 ;	control.c:69: for (i = 0; i < total; i++)
      000BFE 0F               [12]  448 	inc	r7
      000BFF 80 EE            [24]  449 	sjmp	00114$
      000C01                        450 00104$:
                                    451 ;	control.c:74: SendControlResponse(total);
      000C01 7F 00            [12]  452 	mov	r7,#0x00
      000C03 8D 82            [24]  453 	mov	dpl,r5
      000C05 8F 83            [24]  454 	mov	dph,r7
      000C07 12 04 48         [24]  455 	lcall	_SendControlResponse
                                    456 ;	control.c:75: ret = TRUE;
      000C0A 7E 01            [12]  457 	mov	r6,#0x01
                                    458 ;	control.c:77: break;
                                    459 ;	control.c:81: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000C0C 80 5E            [24]  460 	sjmp	00110$
      000C0E                        461 00140$:
      000C0E 7F 00            [12]  462 	mov	r7,#0x00
      000C10                        463 00116$:
                                    464 ;	control.c:83: EP0.fifo = deviceQualifierDescriptor[i];
      000C10 EF               [12]  465 	mov	a,r7
      000C11 90 30 E7         [24]  466 	mov	dptr,#_deviceQualifierDescriptor
      000C14 93               [24]  467 	movc	a,@a+dptr
      000C15 90 F1 DC         [24]  468 	mov	dptr,#(_EP0 + 0x001c)
      000C18 F0               [24]  469 	movx	@dptr,a
                                    470 ;	control.c:81: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
      000C19 0F               [12]  471 	inc	r7
      000C1A BF 0A 00         [24]  472 	cjne	r7,#0x0a,00207$
      000C1D                        473 00207$:
                                    474 ;	control.c:86: SendControlResponse(wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor));
      000C1D 40 F1            [24]  475 	jc	00116$
      000C1F E5 20            [12]  476 	mov	a,_wLength
      000C21 94 0A            [12]  477 	subb	a,#0x0a
      000C23 E5 21            [12]  478 	mov	a,(_wLength + 1)
      000C25 94 00            [12]  479 	subb	a,#0x00
      000C27 50 06            [24]  480 	jnc	00126$
      000C29 AD 20            [24]  481 	mov	r5,_wLength
      000C2B AF 21            [24]  482 	mov	r7,(_wLength + 1)
      000C2D 80 04            [24]  483 	sjmp	00127$
      000C2F                        484 00126$:
      000C2F 7D 0A            [12]  485 	mov	r5,#0x0a
      000C31 7F 00            [12]  486 	mov	r7,#0x00
      000C33                        487 00127$:
      000C33 8D 82            [24]  488 	mov	dpl,r5
      000C35 8F 83            [24]  489 	mov	dph,r7
      000C37 12 04 48         [24]  490 	lcall	_SendControlResponse
                                    491 ;	control.c:87: ret = TRUE;
      000C3A 7E 01            [12]  492 	mov	r6,#0x01
                                    493 ;	control.c:89: break;
                                    494 ;	control.c:93: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000C3C 80 2E            [24]  495 	sjmp	00110$
      000C3E                        496 00143$:
      000C3E 7F 00            [12]  497 	mov	r7,#0x00
      000C40                        498 00118$:
                                    499 ;	control.c:95: EP0.fifo = HIDreportDescriptor[i];
      000C40 EF               [12]  500 	mov	a,r7
      000C41 90 30 A8         [24]  501 	mov	dptr,#_HIDreportDescriptor
      000C44 93               [24]  502 	movc	a,@a+dptr
      000C45 90 F1 DC         [24]  503 	mov	dptr,#(_EP0 + 0x001c)
      000C48 F0               [24]  504 	movx	@dptr,a
                                    505 ;	control.c:93: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
      000C49 0F               [12]  506 	inc	r7
      000C4A BF 3F 00         [24]  507 	cjne	r7,#0x3f,00210$
      000C4D                        508 00210$:
                                    509 ;	control.c:98: SendControlResponse(wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor));
      000C4D 40 F1            [24]  510 	jc	00118$
      000C4F E5 20            [12]  511 	mov	a,_wLength
      000C51 94 3F            [12]  512 	subb	a,#0x3f
      000C53 E5 21            [12]  513 	mov	a,(_wLength + 1)
      000C55 94 00            [12]  514 	subb	a,#0x00
      000C57 50 06            [24]  515 	jnc	00128$
      000C59 AD 20            [24]  516 	mov	r5,_wLength
      000C5B AF 21            [24]  517 	mov	r7,(_wLength + 1)
      000C5D 80 04            [24]  518 	sjmp	00129$
      000C5F                        519 00128$:
      000C5F 7D 3F            [12]  520 	mov	r5,#0x3f
      000C61 7F 00            [12]  521 	mov	r7,#0x00
      000C63                        522 00129$:
      000C63 8D 82            [24]  523 	mov	dpl,r5
      000C65 8F 83            [24]  524 	mov	dph,r7
      000C67 12 04 48         [24]  525 	lcall	_SendControlResponse
                                    526 ;	control.c:99: ret = TRUE;
      000C6A 7E 01            [12]  527 	mov	r6,#0x01
                                    528 ;	control.c:107: }
      000C6C                        529 00110$:
                                    530 ;	control.c:109: return ret;
      000C6C 8E 82            [24]  531 	mov	dpl,r6
                                    532 ;	control.c:110: }
      000C6E 22               [24]  533 	ret
                                    534 ;------------------------------------------------------------
                                    535 ;Allocation info for local variables in function 'SetConfiguration'
                                    536 ;------------------------------------------------------------
                                    537 ;ret                       Allocated to registers r7 
                                    538 ;------------------------------------------------------------
                                    539 ;	control.c:112: static BYTE SetConfiguration()
                                    540 ;	-----------------------------------------
                                    541 ;	 function SetConfiguration
                                    542 ;	-----------------------------------------
      000C6F                        543 _SetConfiguration:
                                    544 ;	control.c:114: BYTE ret = FALSE;
      000C6F 7F 00            [12]  545 	mov	r7,#0x00
                                    546 ;	control.c:116: if (wValue <= 1)
      000C71 C3               [12]  547 	clr	c
      000C72 74 01            [12]  548 	mov	a,#0x01
      000C74 95 1C            [12]  549 	subb	a,_wValue
      000C76 E4               [12]  550 	clr	a
      000C77 95 1D            [12]  551 	subb	a,(_wValue + 1)
      000C79 40 05            [24]  552 	jc	00102$
                                    553 ;	control.c:118: EP0ACK();
      000C7B 12 0B 6E         [24]  554 	lcall	_EP0ACK
                                    555 ;	control.c:119: ret = TRUE;
      000C7E 7F 01            [12]  556 	mov	r7,#0x01
      000C80                        557 00102$:
                                    558 ;	control.c:122: return ret;
      000C80 8F 82            [24]  559 	mov	dpl,r7
                                    560 ;	control.c:123: }
      000C82 22               [24]  561 	ret
                                    562 ;------------------------------------------------------------
                                    563 ;Allocation info for local variables in function 'HandleStandardRequest'
                                    564 ;------------------------------------------------------------
                                    565 ;	control.c:125: BYTE HandleStandardRequest()
                                    566 ;	-----------------------------------------
                                    567 ;	 function HandleStandardRequest
                                    568 ;	-----------------------------------------
      000C83                        569 _HandleStandardRequest:
                                    570 ;	control.c:127: switch(bRequest)
      000C83 74 05            [12]  571 	mov	a,#0x05
      000C85 B5 1B 02         [24]  572 	cjne	a,_bRequest,00120$
      000C88 80 0E            [24]  573 	sjmp	00101$
      000C8A                        574 00120$:
      000C8A 74 06            [12]  575 	mov	a,#0x06
      000C8C B5 1B 02         [24]  576 	cjne	a,_bRequest,00121$
      000C8F 80 0A            [24]  577 	sjmp	00102$
      000C91                        578 00121$:
      000C91 74 09            [12]  579 	mov	a,#0x09
                                    580 ;	control.c:129: case 0x05:
      000C93 B5 1B 0B         [24]  581 	cjne	a,_bRequest,00104$
      000C96 80 06            [24]  582 	sjmp	00103$
      000C98                        583 00101$:
                                    584 ;	control.c:131: return SetAddress();
                                    585 ;	control.c:133: case 0x06:
      000C98 02 0B 75         [24]  586 	ljmp	_SetAddress
      000C9B                        587 00102$:
                                    588 ;	control.c:135: return GetDescriptor();
                                    589 ;	control.c:137: case 0x09:
      000C9B 02 0B 8A         [24]  590 	ljmp	_GetDescriptor
      000C9E                        591 00103$:
                                    592 ;	control.c:139: return SetConfiguration();
                                    593 ;	control.c:141: default:
      000C9E 02 0C 6F         [24]  594 	ljmp	_SetConfiguration
      000CA1                        595 00104$:
                                    596 ;	control.c:143: return FALSE;
      000CA1 75 82 00         [24]  597 	mov	dpl,#0x00
                                    598 ;	control.c:145: }
                                    599 ;	control.c:146: }
      000CA4 22               [24]  600 	ret
                                    601 ;------------------------------------------------------------
                                    602 ;Allocation info for local variables in function 'GetMaxLUN'
                                    603 ;------------------------------------------------------------
                                    604 ;	control.c:148: static BYTE GetMaxLUN()
                                    605 ;	-----------------------------------------
                                    606 ;	 function GetMaxLUN
                                    607 ;	-----------------------------------------
      000CA5                        608 _GetMaxLUN:
                                    609 ;	control.c:150: EP0.fifo = 0x00;
      000CA5 90 F1 DC         [24]  610 	mov	dptr,#(_EP0 + 0x001c)
      000CA8 E4               [12]  611 	clr	a
      000CA9 F0               [24]  612 	movx	@dptr,a
                                    613 ;	control.c:151: SendControlResponse(wLength < 0x01 ? wLength : 0x01);
      000CAA C3               [12]  614 	clr	c
      000CAB E5 20            [12]  615 	mov	a,_wLength
      000CAD 94 01            [12]  616 	subb	a,#0x01
      000CAF E5 21            [12]  617 	mov	a,(_wLength + 1)
      000CB1 94 00            [12]  618 	subb	a,#0x00
      000CB3 50 06            [24]  619 	jnc	00103$
      000CB5 AE 20            [24]  620 	mov	r6,_wLength
      000CB7 AF 21            [24]  621 	mov	r7,(_wLength + 1)
      000CB9 80 04            [24]  622 	sjmp	00104$
      000CBB                        623 00103$:
      000CBB 7E 01            [12]  624 	mov	r6,#0x01
      000CBD 7F 00            [12]  625 	mov	r7,#0x00
      000CBF                        626 00104$:
      000CBF 8E 82            [24]  627 	mov	dpl,r6
      000CC1 8F 83            [24]  628 	mov	dph,r7
      000CC3 12 04 48         [24]  629 	lcall	_SendControlResponse
                                    630 ;	control.c:153: return TRUE;
      000CC6 75 82 01         [24]  631 	mov	dpl,#0x01
                                    632 ;	control.c:154: }
      000CC9 22               [24]  633 	ret
                                    634 ;------------------------------------------------------------
                                    635 ;Allocation info for local variables in function 'HandleClassRequest'
                                    636 ;------------------------------------------------------------
                                    637 ;	control.c:156: BYTE HandleClassRequest()
                                    638 ;	-----------------------------------------
                                    639 ;	 function HandleClassRequest
                                    640 ;	-----------------------------------------
      000CCA                        641 _HandleClassRequest:
                                    642 ;	control.c:158: switch(bRequest)
      000CCA 74 09            [12]  643 	mov	a,#0x09
      000CCC B5 1B 02         [24]  644 	cjne	a,_bRequest,00120$
      000CCF 80 0E            [24]  645 	sjmp	00101$
      000CD1                        646 00120$:
      000CD1 74 0A            [12]  647 	mov	a,#0x0a
      000CD3 B5 1B 02         [24]  648 	cjne	a,_bRequest,00121$
      000CD6 80 11            [24]  649 	sjmp	00102$
      000CD8                        650 00121$:
      000CD8 74 FE            [12]  651 	mov	a,#0xfe
                                    652 ;	control.c:160: case 0x09:
      000CDA B5 1B 16         [24]  653 	cjne	a,_bRequest,00104$
      000CDD 80 11            [24]  654 	sjmp	00103$
      000CDF                        655 00101$:
                                    656 ;	control.c:162: EP0CS = 0x05;
      000CDF 90 F0 48         [24]  657 	mov	dptr,#_EP0CS
      000CE2 74 05            [12]  658 	mov	a,#0x05
      000CE4 F0               [24]  659 	movx	@dptr,a
                                    660 ;	control.c:163: return TRUE;
      000CE5 75 82 01         [24]  661 	mov	dpl,#0x01
                                    662 ;	control.c:165: case 0x0A:
      000CE8 22               [24]  663 	ret
      000CE9                        664 00102$:
                                    665 ;	control.c:167: EP0ACK();
      000CE9 12 0B 6E         [24]  666 	lcall	_EP0ACK
                                    667 ;	control.c:168: return TRUE;
      000CEC 75 82 01         [24]  668 	mov	dpl,#0x01
                                    669 ;	control.c:170: case 0xFE:
      000CEF 22               [24]  670 	ret
      000CF0                        671 00103$:
                                    672 ;	control.c:172: return GetMaxLUN();
                                    673 ;	control.c:174: default:
      000CF0 02 0C A5         [24]  674 	ljmp	_GetMaxLUN
      000CF3                        675 00104$:
                                    676 ;	control.c:176: return FALSE;
      000CF3 75 82 00         [24]  677 	mov	dpl,#0x00
                                    678 ;	control.c:178: }
                                    679 ;	control.c:179: }
      000CF6 22               [24]  680 	ret
                                    681 ;------------------------------------------------------------
                                    682 ;Allocation info for local variables in function 'HandleVendorRequest'
                                    683 ;------------------------------------------------------------
                                    684 ;	control.c:181: BYTE HandleVendorRequest()
                                    685 ;	-----------------------------------------
                                    686 ;	 function HandleVendorRequest
                                    687 ;	-----------------------------------------
      000CF7                        688 _HandleVendorRequest:
                                    689 ;	control.c:183: return FALSE;
      000CF7 75 82 00         [24]  690 	mov	dpl,#0x00
                                    691 ;	control.c:184: }
      000CFA 22               [24]  692 	ret
                                    693 	.area CSEG    (CODE)
                                    694 	.area CONST   (CODE)
      00304F                        695 _deviceDescriptor:
      00304F 12                     696 	.db #0x12	; 18
      003050 01                     697 	.db #0x01	; 1
      003051 00                     698 	.db #0x00	; 0
      003052 02                     699 	.db #0x02	; 2
      003053 00                     700 	.db #0x00	; 0
      003054 00                     701 	.db #0x00	; 0
      003055 00                     702 	.db #0x00	; 0
      003056 40                     703 	.db #0x40	; 64
      003057 B4                     704 	.db #0xb4	; 180
      003058 04                     705 	.db #0x04	; 4
      003059 05                     706 	.db #0x05	; 5
      00305A 10                     707 	.db #0x10	; 16
      00305B 00                     708 	.db #0x00	; 0
      00305C 00                     709 	.db #0x00	; 0
      00305D 00                     710 	.db #0x00	; 0
      00305E 00                     711 	.db #0x00	; 0
      00305F 00                     712 	.db #0x00	; 0
      003060 01                     713 	.db #0x01	; 1
      003061                        714 _configDescriptor:
      003061 09                     715 	.db #0x09	; 9
      003062 02                     716 	.db #0x02	; 2
      003063 47                     717 	.db #0x47	; 71	'G'
      003064 00                     718 	.db #0x00	; 0
      003065 02                     719 	.db #0x02	; 2
      003066 01                     720 	.db #0x01	; 1
      003067 00                     721 	.db #0x00	; 0
      003068 80                     722 	.db #0x80	; 128
      003069 4B                     723 	.db #0x4b	; 75	'K'
      00306A 09                     724 	.db #0x09	; 9
      00306B 04                     725 	.db #0x04	; 4
      00306C 00                     726 	.db #0x00	; 0
      00306D 00                     727 	.db #0x00	; 0
      00306E 03                     728 	.db #0x03	; 3
      00306F 08                     729 	.db #0x08	; 8
      003070 06                     730 	.db #0x06	; 6
      003071 50                     731 	.db #0x50	; 80	'P'
      003072 00                     732 	.db #0x00	; 0
      003073 07                     733 	.db #0x07	; 7
      003074 05                     734 	.db #0x05	; 5
      003075 81                     735 	.db #0x81	; 129
      003076 02                     736 	.db #0x02	; 2
      003077 40                     737 	.db #0x40	; 64
      003078 00                     738 	.db #0x00	; 0
      003079 00                     739 	.db #0x00	; 0
      00307A 07                     740 	.db #0x07	; 7
      00307B 05                     741 	.db #0x05	; 5
      00307C 02                     742 	.db #0x02	; 2
      00307D 02                     743 	.db #0x02	; 2
      00307E 40                     744 	.db #0x40	; 64
      00307F 00                     745 	.db #0x00	; 0
      003080 00                     746 	.db #0x00	; 0
      003081 07                     747 	.db #0x07	; 7
      003082 05                     748 	.db #0x05	; 5
      003083 83                     749 	.db #0x83	; 131
      003084 03                     750 	.db #0x03	; 3
      003085 08                     751 	.db #0x08	; 8
      003086 00                     752 	.db #0x00	; 0
      003087 00                     753 	.db #0x00	; 0
      003088 09                     754 	.db #0x09	; 9
      003089 04                     755 	.db #0x04	; 4
      00308A 01                     756 	.db #0x01	; 1
      00308B 00                     757 	.db #0x00	; 0
      00308C 02                     758 	.db #0x02	; 2
      00308D 03                     759 	.db #0x03	; 3
      00308E 01                     760 	.db #0x01	; 1
      00308F 01                     761 	.db #0x01	; 1
      003090 00                     762 	.db #0x00	; 0
      003091 09                     763 	.db #0x09	; 9
      003092 21                     764 	.db #0x21	; 33
      003093 01                     765 	.db #0x01	; 1
      003094 01                     766 	.db #0x01	; 1
      003095 00                     767 	.db #0x00	; 0
      003096 01                     768 	.db #0x01	; 1
      003097 22                     769 	.db #0x22	; 34
      003098 3F                     770 	.db #0x3f	; 63
      003099 00                     771 	.db #0x00	; 0
      00309A 07                     772 	.db #0x07	; 7
      00309B 05                     773 	.db #0x05	; 5
      00309C 83                     774 	.db #0x83	; 131
      00309D 03                     775 	.db #0x03	; 3
      00309E 08                     776 	.db #0x08	; 8
      00309F 00                     777 	.db #0x00	; 0
      0030A0 01                     778 	.db #0x01	; 1
      0030A1 07                     779 	.db #0x07	; 7
      0030A2 05                     780 	.db #0x05	; 5
      0030A3 04                     781 	.db #0x04	; 4
      0030A4 03                     782 	.db #0x03	; 3
      0030A5 08                     783 	.db #0x08	; 8
      0030A6 00                     784 	.db #0x00	; 0
      0030A7 01                     785 	.db #0x01	; 1
      0030A8                        786 _HIDreportDescriptor:
      0030A8 05                     787 	.db #0x05	; 5
      0030A9 01                     788 	.db #0x01	; 1
      0030AA 09                     789 	.db #0x09	; 9
      0030AB 06                     790 	.db #0x06	; 6
      0030AC A1                     791 	.db #0xa1	; 161
      0030AD 01                     792 	.db #0x01	; 1
      0030AE 05                     793 	.db #0x05	; 5
      0030AF 07                     794 	.db #0x07	; 7
      0030B0 19                     795 	.db #0x19	; 25
      0030B1 E0                     796 	.db #0xe0	; 224
      0030B2 29                     797 	.db #0x29	; 41
      0030B3 E7                     798 	.db #0xe7	; 231
      0030B4 15                     799 	.db #0x15	; 21
      0030B5 00                     800 	.db #0x00	; 0
      0030B6 25                     801 	.db #0x25	; 37
      0030B7 01                     802 	.db #0x01	; 1
      0030B8 75                     803 	.db #0x75	; 117	'u'
      0030B9 01                     804 	.db #0x01	; 1
      0030BA 95                     805 	.db #0x95	; 149
      0030BB 08                     806 	.db #0x08	; 8
      0030BC 81                     807 	.db #0x81	; 129
      0030BD 02                     808 	.db #0x02	; 2
      0030BE 95                     809 	.db #0x95	; 149
      0030BF 01                     810 	.db #0x01	; 1
      0030C0 75                     811 	.db #0x75	; 117	'u'
      0030C1 08                     812 	.db #0x08	; 8
      0030C2 81                     813 	.db #0x81	; 129
      0030C3 01                     814 	.db #0x01	; 1
      0030C4 95                     815 	.db #0x95	; 149
      0030C5 05                     816 	.db #0x05	; 5
      0030C6 75                     817 	.db #0x75	; 117	'u'
      0030C7 01                     818 	.db #0x01	; 1
      0030C8 05                     819 	.db #0x05	; 5
      0030C9 08                     820 	.db #0x08	; 8
      0030CA 19                     821 	.db #0x19	; 25
      0030CB 01                     822 	.db #0x01	; 1
      0030CC 29                     823 	.db #0x29	; 41
      0030CD 05                     824 	.db #0x05	; 5
      0030CE 91                     825 	.db #0x91	; 145
      0030CF 02                     826 	.db #0x02	; 2
      0030D0 95                     827 	.db #0x95	; 149
      0030D1 01                     828 	.db #0x01	; 1
      0030D2 75                     829 	.db #0x75	; 117	'u'
      0030D3 03                     830 	.db #0x03	; 3
      0030D4 91                     831 	.db #0x91	; 145
      0030D5 01                     832 	.db #0x01	; 1
      0030D6 95                     833 	.db #0x95	; 149
      0030D7 06                     834 	.db #0x06	; 6
      0030D8 75                     835 	.db #0x75	; 117	'u'
      0030D9 08                     836 	.db #0x08	; 8
      0030DA 15                     837 	.db #0x15	; 21
      0030DB 00                     838 	.db #0x00	; 0
      0030DC 25                     839 	.db #0x25	; 37
      0030DD 65                     840 	.db #0x65	; 101	'e'
      0030DE 05                     841 	.db #0x05	; 5
      0030DF 07                     842 	.db #0x07	; 7
      0030E0 19                     843 	.db #0x19	; 25
      0030E1 00                     844 	.db #0x00	; 0
      0030E2 29                     845 	.db #0x29	; 41
      0030E3 65                     846 	.db #0x65	; 101	'e'
      0030E4 81                     847 	.db #0x81	; 129
      0030E5 00                     848 	.db #0x00	; 0
      0030E6 C0                     849 	.db #0xc0	; 192
      0030E7                        850 _deviceQualifierDescriptor:
      0030E7 0A                     851 	.db #0x0a	; 10
      0030E8 06                     852 	.db #0x06	; 6
      0030E9 00                     853 	.db #0x00	; 0
      0030EA 02                     854 	.db #0x02	; 2
      0030EB 00                     855 	.db #0x00	; 0
      0030EC 00                     856 	.db #0x00	; 0
      0030ED 00                     857 	.db #0x00	; 0
      0030EE 40                     858 	.db #0x40	; 64
      0030EF 01                     859 	.db #0x01	; 1
      0030F0 00                     860 	.db #0x00	; 0
                                    861 	.area XINIT   (CODE)
                                    862 	.area CABS    (ABS,CODE)

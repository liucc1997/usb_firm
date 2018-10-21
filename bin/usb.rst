                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.8.0 #10562 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module usb
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _SetDMA_PARM_3
                                     12 	.globl _SetDMA_PARM_2
                                     13 	.globl _HandleUSBEvents
                                     14 	.globl _ep_isr
                                     15 	.globl _usb_isr
                                     16 	.globl _InitUSB
                                     17 	.globl _SendData1
                                     18 	.globl _SendData0
                                     19 	.globl _SendControlResponse
                                     20 	.globl _SetDMA
                                     21 	.globl _HandleVendorRequest
                                     22 	.globl _HandleClassRequest
                                     23 	.globl _HandleStandardRequest
                                     24 	.globl _HandleCDB
                                     25 	.globl _RI
                                     26 	.globl _TI
                                     27 	.globl _RB8
                                     28 	.globl _TB8
                                     29 	.globl _REN
                                     30 	.globl _SM2
                                     31 	.globl _SM1
                                     32 	.globl _SM0
                                     33 	.globl _RXD
                                     34 	.globl _TXD
                                     35 	.globl _INT0
                                     36 	.globl _INT1
                                     37 	.globl _T0
                                     38 	.globl _T1
                                     39 	.globl _WR
                                     40 	.globl _RD
                                     41 	.globl _PX0
                                     42 	.globl _PT0
                                     43 	.globl _PX1
                                     44 	.globl _PT1
                                     45 	.globl _PS
                                     46 	.globl _EX0
                                     47 	.globl _ET0
                                     48 	.globl _EX1
                                     49 	.globl _ET1
                                     50 	.globl _ES
                                     51 	.globl _EA
                                     52 	.globl _IT0
                                     53 	.globl _IE0
                                     54 	.globl _IT1
                                     55 	.globl _IE1
                                     56 	.globl _TR0
                                     57 	.globl _TF0
                                     58 	.globl _TR1
                                     59 	.globl _TF1
                                     60 	.globl _P
                                     61 	.globl _OV
                                     62 	.globl _RS0
                                     63 	.globl _RS1
                                     64 	.globl _F0
                                     65 	.globl _AC
                                     66 	.globl _CY
                                     67 	.globl _SBUF
                                     68 	.globl _SCON
                                     69 	.globl _IP
                                     70 	.globl _IE
                                     71 	.globl _TH1
                                     72 	.globl _TH0
                                     73 	.globl _TL1
                                     74 	.globl _TL0
                                     75 	.globl _TMOD
                                     76 	.globl _TCON
                                     77 	.globl _PCON
                                     78 	.globl _DPH
                                     79 	.globl _DPL
                                     80 	.globl _SP
                                     81 	.globl _B
                                     82 	.globl _ACC
                                     83 	.globl _PSW
                                     84 	.globl _P3
                                     85 	.globl _P2
                                     86 	.globl _P1
                                     87 	.globl _P0
                                     88 	.globl _usb_have_csw_ready
                                     89 	.globl _usb_received_data_ready
                                     90 	.globl _usb_buffer
                                     91 	.globl _PRAMCTL
                                     92 	.globl _BANK2PAH
                                     93 	.globl _BANK2PAL
                                     94 	.globl _BANK2VA
                                     95 	.globl _BANK1PAH
                                     96 	.globl _BANK1PAL
                                     97 	.globl _BANK1VA
                                     98 	.globl _BANK0PAH
                                     99 	.globl _BANK0PAL
                                    100 	.globl _WARMSTATUS
                                    101 	.globl _GPIO0OUT
                                    102 	.globl _GPIO0DIR
                                    103 	.globl _DMACMD
                                    104 	.globl _DMAFILL3
                                    105 	.globl _DMAFILL2
                                    106 	.globl _DMAFILL1
                                    107 	.globl _DMAFILL0
                                    108 	.globl _DMASIZEH
                                    109 	.globl _DMASIZEM
                                    110 	.globl _DMASIZEL
                                    111 	.globl _DMADSTH
                                    112 	.globl _DMADSTM
                                    113 	.globl _DMADSTL
                                    114 	.globl _DMASRCH
                                    115 	.globl _DMASRCM
                                    116 	.globl _DMASRCL
                                    117 	.globl _NANDCSDIR
                                    118 	.globl _NANDCSOUT
                                    119 	.globl _EP4
                                    120 	.globl _EP3
                                    121 	.globl _EP2
                                    122 	.globl _EP1
                                    123 	.globl _EP0
                                    124 	.globl _SETUPDAT
                                    125 	.globl _EP0CS
                                    126 	.globl _EPIE
                                    127 	.globl _EPIRQ
                                    128 	.globl _USBIRQ
                                    129 	.globl _USBSTAT
                                    130 	.globl _USBCTL
                                    131 	.globl _REGBANK
                                    132 	.globl _SendData1_PARM_2
                                    133 	.globl _SendData0_PARM_2
                                    134 	.globl _usb_speed
                                    135 	.globl _wLength
                                    136 	.globl _wIndex
                                    137 	.globl _wValue
                                    138 	.globl _bRequest
                                    139 	.globl _bmRequestType
                                    140 ;--------------------------------------------------------
                                    141 ; special function registers
                                    142 ;--------------------------------------------------------
                                    143 	.area RSEG    (ABS,DATA)
      000000                        144 	.org 0x0000
                           000080   145 _P0	=	0x0080
                           000090   146 _P1	=	0x0090
                           0000A0   147 _P2	=	0x00a0
                           0000B0   148 _P3	=	0x00b0
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                           000081   152 _SP	=	0x0081
                           000082   153 _DPL	=	0x0082
                           000083   154 _DPH	=	0x0083
                           000087   155 _PCON	=	0x0087
                           000088   156 _TCON	=	0x0088
                           000089   157 _TMOD	=	0x0089
                           00008A   158 _TL0	=	0x008a
                           00008B   159 _TL1	=	0x008b
                           00008C   160 _TH0	=	0x008c
                           00008D   161 _TH1	=	0x008d
                           0000A8   162 _IE	=	0x00a8
                           0000B8   163 _IP	=	0x00b8
                           000098   164 _SCON	=	0x0098
                           000099   165 _SBUF	=	0x0099
                                    166 ;--------------------------------------------------------
                                    167 ; special function bits
                                    168 ;--------------------------------------------------------
                                    169 	.area RSEG    (ABS,DATA)
      000000                        170 	.org 0x0000
                           0000D7   171 _CY	=	0x00d7
                           0000D6   172 _AC	=	0x00d6
                           0000D5   173 _F0	=	0x00d5
                           0000D4   174 _RS1	=	0x00d4
                           0000D3   175 _RS0	=	0x00d3
                           0000D2   176 _OV	=	0x00d2
                           0000D0   177 _P	=	0x00d0
                           00008F   178 _TF1	=	0x008f
                           00008E   179 _TR1	=	0x008e
                           00008D   180 _TF0	=	0x008d
                           00008C   181 _TR0	=	0x008c
                           00008B   182 _IE1	=	0x008b
                           00008A   183 _IT1	=	0x008a
                           000089   184 _IE0	=	0x0089
                           000088   185 _IT0	=	0x0088
                           0000AF   186 _EA	=	0x00af
                           0000AC   187 _ES	=	0x00ac
                           0000AB   188 _ET1	=	0x00ab
                           0000AA   189 _EX1	=	0x00aa
                           0000A9   190 _ET0	=	0x00a9
                           0000A8   191 _EX0	=	0x00a8
                           0000BC   192 _PS	=	0x00bc
                           0000BB   193 _PT1	=	0x00bb
                           0000BA   194 _PX1	=	0x00ba
                           0000B9   195 _PT0	=	0x00b9
                           0000B8   196 _PX0	=	0x00b8
                           0000B7   197 _RD	=	0x00b7
                           0000B6   198 _WR	=	0x00b6
                           0000B5   199 _T1	=	0x00b5
                           0000B4   200 _T0	=	0x00b4
                           0000B3   201 _INT1	=	0x00b3
                           0000B2   202 _INT0	=	0x00b2
                           0000B1   203 _TXD	=	0x00b1
                           0000B0   204 _RXD	=	0x00b0
                           00009F   205 _SM0	=	0x009f
                           00009E   206 _SM1	=	0x009e
                           00009D   207 _SM2	=	0x009d
                           00009C   208 _REN	=	0x009c
                           00009B   209 _TB8	=	0x009b
                           00009A   210 _RB8	=	0x009a
                           000099   211 _TI	=	0x0099
                           000098   212 _RI	=	0x0098
                                    213 ;--------------------------------------------------------
                                    214 ; overlayable register banks
                                    215 ;--------------------------------------------------------
                                    216 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        217 	.ds 8
                                    218 ;--------------------------------------------------------
                                    219 ; internal ram data
                                    220 ;--------------------------------------------------------
                                    221 	.area DSEG    (DATA)
      00001A                        222 _bmRequestType::
      00001A                        223 	.ds 1
      00001B                        224 _bRequest::
      00001B                        225 	.ds 1
      00001C                        226 _wValue::
      00001C                        227 	.ds 2
      00001E                        228 _wIndex::
      00001E                        229 	.ds 2
      000020                        230 _wLength::
      000020                        231 	.ds 2
      000022                        232 _usb_speed::
      000022                        233 	.ds 1
      000023                        234 _SendData0_PARM_2:
      000023                        235 	.ds 1
      000024                        236 _SendData1_PARM_2:
      000024                        237 	.ds 1
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram 
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
      000045                        242 _SetDMA_PARM_2:
      000045                        243 	.ds 1
      000046                        244 _SetDMA_PARM_3:
      000046                        245 	.ds 1
                                    246 	.area	OSEG    (OVR,DATA)
                                    247 ;--------------------------------------------------------
                                    248 ; indirectly addressable internal ram data
                                    249 ;--------------------------------------------------------
                                    250 	.area ISEG    (DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; absolute internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area IABS    (ABS,DATA)
                                    255 	.area IABS    (ABS,DATA)
                                    256 ;--------------------------------------------------------
                                    257 ; bit data
                                    258 ;--------------------------------------------------------
                                    259 	.area BSEG    (BIT)
                                    260 ;--------------------------------------------------------
                                    261 ; paged external ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area PSEG    (PAG,XDATA)
                                    264 ;--------------------------------------------------------
                                    265 ; external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area XSEG    (XDATA)
                           00F000   268 _REGBANK	=	0xf000
                           00F008   269 _USBCTL	=	0xf008
                           00F009   270 _USBSTAT	=	0xf009
                           00F027   271 _USBIRQ	=	0xf027
                           00F020   272 _EPIRQ	=	0xf020
                           00F030   273 _EPIE	=	0xf030
                           00F048   274 _EP0CS	=	0xf048
                           00F0B8   275 _SETUPDAT	=	0xf0b8
                           00F1C0   276 _EP0	=	0xf1c0
                           00F200   277 _EP1	=	0xf200
                           00F240   278 _EP2	=	0xf240
                           00F280   279 _EP3	=	0xf280
                           00F2C0   280 _EP4	=	0xf2c0
                           00F608   281 _NANDCSOUT	=	0xf608
                           00F618   282 _NANDCSDIR	=	0xf618
                           00F900   283 _DMASRCL	=	0xf900
                           00F901   284 _DMASRCM	=	0xf901
                           00F902   285 _DMASRCH	=	0xf902
                           00F904   286 _DMADSTL	=	0xf904
                           00F905   287 _DMADSTM	=	0xf905
                           00F906   288 _DMADSTH	=	0xf906
                           00F908   289 _DMASIZEL	=	0xf908
                           00F909   290 _DMASIZEM	=	0xf909
                           00F90A   291 _DMASIZEH	=	0xf90a
                           00F90C   292 _DMAFILL0	=	0xf90c
                           00F90D   293 _DMAFILL1	=	0xf90d
                           00F90E   294 _DMAFILL2	=	0xf90e
                           00F90F   295 _DMAFILL3	=	0xf90f
                           00F930   296 _DMACMD	=	0xf930
                           00FA14   297 _GPIO0DIR	=	0xfa14
                           00FA15   298 _GPIO0OUT	=	0xfa15
                           00FA38   299 _WARMSTATUS	=	0xfa38
                           00FA40   300 _BANK0PAL	=	0xfa40
                           00FA41   301 _BANK0PAH	=	0xfa41
                           00FA42   302 _BANK1VA	=	0xfa42
                           00FA43   303 _BANK1PAL	=	0xfa43
                           00FA44   304 _BANK1PAH	=	0xfa44
                           00FA45   305 _BANK2VA	=	0xfa45
                           00FA46   306 _BANK2PAL	=	0xfa46
                           00FA47   307 _BANK2PAH	=	0xfa47
                           00FA48   308 _PRAMCTL	=	0xfa48
                           000000   309 _usb_buffer	=	0x0000
      006000                        310 _usb_irq:
      006000                        311 	.ds 1
      006001                        312 _UsbIntStsF080:
      006001                        313 	.ds 1
      006002                        314 _UsbIntStsF082:
      006002                        315 	.ds 1
      006003                        316 _UsbIntStsF086:
      006003                        317 	.ds 1
      006004                        318 _UsbIntStsF087:
      006004                        319 	.ds 1
      006005                        320 _usb_received_data_ready::
      006005                        321 	.ds 1
      006006                        322 _usb_have_csw_ready::
      006006                        323 	.ds 1
                                    324 ;--------------------------------------------------------
                                    325 ; absolute external ram data
                                    326 ;--------------------------------------------------------
                                    327 	.area XABS    (ABS,XDATA)
                                    328 ;--------------------------------------------------------
                                    329 ; external initialized ram data
                                    330 ;--------------------------------------------------------
                                    331 	.area XISEG   (XDATA)
                                    332 	.area HOME    (CODE)
                                    333 	.area GSINIT0 (CODE)
                                    334 	.area GSINIT1 (CODE)
                                    335 	.area GSINIT2 (CODE)
                                    336 	.area GSINIT3 (CODE)
                                    337 	.area GSINIT4 (CODE)
                                    338 	.area GSINIT5 (CODE)
                                    339 	.area GSINIT  (CODE)
                                    340 	.area GSFINAL (CODE)
                                    341 	.area CSEG    (CODE)
                                    342 ;--------------------------------------------------------
                                    343 ; global & static initialisations
                                    344 ;--------------------------------------------------------
                                    345 	.area HOME    (CODE)
                                    346 	.area GSINIT  (CODE)
                                    347 	.area GSFINAL (CODE)
                                    348 	.area GSINIT  (CODE)
                                    349 ;--------------------------------------------------------
                                    350 ; Home
                                    351 ;--------------------------------------------------------
                                    352 	.area HOME    (CODE)
                                    353 	.area HOME    (CODE)
                                    354 ;--------------------------------------------------------
                                    355 ; code
                                    356 ;--------------------------------------------------------
                                    357 	.area CSEG    (CODE)
                                    358 ;------------------------------------------------------------
                                    359 ;Allocation info for local variables in function 'SetDMA'
                                    360 ;------------------------------------------------------------
                                    361 ;p3                        Allocated with name '_SetDMA_PARM_2'
                                    362 ;px                        Allocated with name '_SetDMA_PARM_3'
                                    363 ;p5                        Allocated to registers r7 
                                    364 ;------------------------------------------------------------
                                    365 ;	usb.c:34: void SetDMA(BYTE p5, BYTE p3, BYTE px)
                                    366 ;	-----------------------------------------
                                    367 ;	 function SetDMA
                                    368 ;	-----------------------------------------
      00040C                        369 _SetDMA:
                           000007   370 	ar7 = 0x07
                           000006   371 	ar6 = 0x06
                           000005   372 	ar5 = 0x05
                           000004   373 	ar4 = 0x04
                           000003   374 	ar3 = 0x03
                           000002   375 	ar2 = 0x02
                           000001   376 	ar1 = 0x01
                           000000   377 	ar0 = 0x00
      00040C AF 82            [24]  378 	mov	r7,dpl
                                    379 ;	usb.c:36: XVAL(0xF80B) = 0;
      00040E 90 F8 0B         [24]  380 	mov	dptr,#0xf80b
      000411 E4               [12]  381 	clr	a
      000412 F0               [24]  382 	movx	@dptr,a
                                    383 ;	usb.c:37: XVAL(0xF80C) = p5-1;
      000413 1F               [12]  384 	dec	r7
      000414 90 F8 0C         [24]  385 	mov	dptr,#0xf80c
      000417 EF               [12]  386 	mov	a,r7
      000418 F0               [24]  387 	movx	@dptr,a
                                    388 ;	usb.c:39: switch(px)
      000419 E4               [12]  389 	clr	a
      00041A B5 46 02         [24]  390 	cjne	a,_SetDMA_PARM_3,00120$
      00041D 80 0E            [24]  391 	sjmp	00101$
      00041F                        392 00120$:
      00041F 74 01            [12]  393 	mov	a,#0x01
      000421 B5 46 02         [24]  394 	cjne	a,_SetDMA_PARM_3,00121$
      000424 80 14            [24]  395 	sjmp	00102$
      000426                        396 00121$:
      000426 74 02            [12]  397 	mov	a,#0x02
                                    398 ;	usb.c:41: case 0:
      000428 B5 46 1C         [24]  399 	cjne	a,_SetDMA_PARM_3,00106$
      00042B 80 14            [24]  400 	sjmp	00103$
      00042D                        401 00101$:
                                    402 ;	usb.c:43: XVAL(0xF80D) = p3;
      00042D 90 F8 0D         [24]  403 	mov	dptr,#0xf80d
      000430 E5 45            [12]  404 	mov	a,_SetDMA_PARM_2
      000432 F0               [24]  405 	movx	@dptr,a
                                    406 ;	usb.c:44: XVAL(0xF80E) = p3;
      000433 90 F8 0E         [24]  407 	mov	dptr,#0xf80e
      000436 E5 45            [12]  408 	mov	a,_SetDMA_PARM_2
      000438 F0               [24]  409 	movx	@dptr,a
                                    410 ;	usb.c:45: break;
                                    411 ;	usb.c:47: case 1:
      000439 22               [24]  412 	ret
      00043A                        413 00102$:
                                    414 ;	usb.c:49: XVAL(0xF80D) = p3;
      00043A 90 F8 0D         [24]  415 	mov	dptr,#0xf80d
      00043D E5 45            [12]  416 	mov	a,_SetDMA_PARM_2
      00043F F0               [24]  417 	movx	@dptr,a
                                    418 ;	usb.c:50: break;
                                    419 ;	usb.c:52: case 2:
      000440 22               [24]  420 	ret
      000441                        421 00103$:
                                    422 ;	usb.c:54: XVAL(0xF80E) = p3;
      000441 90 F8 0E         [24]  423 	mov	dptr,#0xf80e
      000444 E5 45            [12]  424 	mov	a,_SetDMA_PARM_2
      000446 F0               [24]  425 	movx	@dptr,a
                                    426 ;	usb.c:61: }
      000447                        427 00106$:
                                    428 ;	usb.c:62: }
      000447 22               [24]  429 	ret
                                    430 ;------------------------------------------------------------
                                    431 ;Allocation info for local variables in function 'SendControlResponse'
                                    432 ;------------------------------------------------------------
                                    433 ;size                      Allocated to registers r6 r7 
                                    434 ;------------------------------------------------------------
                                    435 ;	usb.c:64: void SendControlResponse(int size)
                                    436 ;	-----------------------------------------
                                    437 ;	 function SendControlResponse
                                    438 ;	-----------------------------------------
      000448                        439 _SendControlResponse:
      000448 AE 82            [24]  440 	mov	r6,dpl
      00044A AF 83            [24]  441 	mov	r7,dph
                                    442 ;	usb.c:66: EP0.len_l = LSB(size);
      00044C 8E 05            [24]  443 	mov	ar5,r6
      00044E 90 F1 CC         [24]  444 	mov	dptr,#(_EP0 + 0x000c)
      000451 ED               [12]  445 	mov	a,r5
      000452 F0               [24]  446 	movx	@dptr,a
                                    447 ;	usb.c:67: EP0.len_m = MSB(size);
      000453 8F 06            [24]  448 	mov	ar6,r7
      000455 90 F1 CD         [24]  449 	mov	dptr,#(_EP0 + 0x000d)
      000458 EE               [12]  450 	mov	a,r6
      000459 F0               [24]  451 	movx	@dptr,a
                                    452 ;	usb.c:68: EP0.len_h = 0;
      00045A 90 F1 CE         [24]  453 	mov	dptr,#(_EP0 + 0x000e)
      00045D E4               [12]  454 	clr	a
      00045E F0               [24]  455 	movx	@dptr,a
                                    456 ;	usb.c:69: EP0.cs = 0x40;
      00045F 90 F1 D3         [24]  457 	mov	dptr,#(_EP0 + 0x0013)
      000462 74 40            [12]  458 	mov	a,#0x40
      000464 F0               [24]  459 	movx	@dptr,a
                                    460 ;	usb.c:70: while (EP0.cs & 0x40);
      000465                        461 00101$:
      000465 90 F1 D3         [24]  462 	mov	dptr,#(_EP0 + 0x0013)
      000468 E0               [24]  463 	movx	a,@dptr
      000469 20 E6 F9         [24]  464 	jb	acc.6,00101$
                                    465 ;	usb.c:71: EP0CS = 0x05;
      00046C 90 F0 48         [24]  466 	mov	dptr,#_EP0CS
      00046F 74 05            [12]  467 	mov	a,#0x05
      000471 F0               [24]  468 	movx	@dptr,a
                                    469 ;	usb.c:72: }
      000472 22               [24]  470 	ret
                                    471 ;------------------------------------------------------------
                                    472 ;Allocation info for local variables in function 'SendData0'
                                    473 ;------------------------------------------------------------
                                    474 ;offset                    Allocated with name '_SendData0_PARM_2'
                                    475 ;size                      Allocated to registers r6 r7 
                                    476 ;------------------------------------------------------------
                                    477 ;	usb.c:74: void SendData0(WORD size, BYTE offset)
                                    478 ;	-----------------------------------------
                                    479 ;	 function SendData0
                                    480 ;	-----------------------------------------
      000473                        481 _SendData0:
      000473 AE 82            [24]  482 	mov	r6,dpl
      000475 AF 83            [24]  483 	mov	r7,dph
                                    484 ;	usb.c:76: if (size > 0)
      000477 EE               [12]  485 	mov	a,r6
      000478 4F               [12]  486 	orl	a,r7
      000479 60 56            [24]  487 	jz	00106$
                                    488 ;	usb.c:78: SetDMA(0x20, 0, 0);
      00047B 75 45 00         [24]  489 	mov	_SetDMA_PARM_2,#0x00
      00047E 75 46 00         [24]  490 	mov	_SetDMA_PARM_3,#0x00
      000481 75 82 20         [24]  491 	mov	dpl,#0x20
      000484 C0 07            [24]  492 	push	ar7
      000486 C0 06            [24]  493 	push	ar6
      000488 12 04 0C         [24]  494 	lcall	_SetDMA
                                    495 ;	usb.c:79: SetDMA(0x20, 0x80, 1);
      00048B 75 45 80         [24]  496 	mov	_SetDMA_PARM_2,#0x80
      00048E 75 46 01         [24]  497 	mov	_SetDMA_PARM_3,#0x01
      000491 75 82 20         [24]  498 	mov	dpl,#0x20
      000494 12 04 0C         [24]  499 	lcall	_SetDMA
      000497 D0 06            [24]  500 	pop	ar6
      000499 D0 07            [24]  501 	pop	ar7
                                    502 ;	usb.c:80: EP0.ptr_l = usb_buffer_PA>>8;
      00049B 90 F1 C5         [24]  503 	mov	dptr,#(_EP0 + 0x0005)
      00049E 74 80            [12]  504 	mov	a,#0x80
      0004A0 F0               [24]  505 	movx	@dptr,a
                                    506 ;	usb.c:81: EP0.ptr_m = usb_buffer_PA>>16;
      0004A1 90 F1 C6         [24]  507 	mov	dptr,#(_EP0 + 0x0006)
      0004A4 E4               [12]  508 	clr	a
      0004A5 F0               [24]  509 	movx	@dptr,a
                                    510 ;	usb.c:82: EP0.ptr_h = usb_buffer_PA>>24;
      0004A6 90 F1 C7         [24]  511 	mov	dptr,#(_EP0 + 0x0007)
      0004A9 F0               [24]  512 	movx	@dptr,a
                                    513 ;	usb.c:83: EP0.offset = offset;
      0004AA 90 F1 CA         [24]  514 	mov	dptr,#(_EP0 + 0x000a)
      0004AD E5 23            [12]  515 	mov	a,_SendData0_PARM_2
      0004AF F0               [24]  516 	movx	@dptr,a
                                    517 ;	usb.c:84: EP0.len_l = LSB(size);
      0004B0 8E 05            [24]  518 	mov	ar5,r6
      0004B2 90 F1 CC         [24]  519 	mov	dptr,#(_EP0 + 0x000c)
      0004B5 ED               [12]  520 	mov	a,r5
      0004B6 F0               [24]  521 	movx	@dptr,a
                                    522 ;	usb.c:85: EP0.len_m = MSB(size);
      0004B7 8F 06            [24]  523 	mov	ar6,r7
      0004B9 90 F1 CD         [24]  524 	mov	dptr,#(_EP0 + 0x000d)
      0004BC EE               [12]  525 	mov	a,r6
      0004BD F0               [24]  526 	movx	@dptr,a
                                    527 ;	usb.c:86: EP0.len_h = 0;
      0004BE 90 F1 CE         [24]  528 	mov	dptr,#(_EP0 + 0x000e)
      0004C1 E4               [12]  529 	clr	a
      0004C2 F0               [24]  530 	movx	@dptr,a
                                    531 ;	usb.c:87: EP0.cs = 0x88;		
      0004C3 90 F1 D3         [24]  532 	mov	dptr,#(_EP0 + 0x0013)
      0004C6 74 88            [12]  533 	mov	a,#0x88
      0004C8 F0               [24]  534 	movx	@dptr,a
                                    535 ;	usb.c:89: while(EP0.cs & 0x80);	
      0004C9                        536 00101$:
      0004C9 90 F1 D3         [24]  537 	mov	dptr,#(_EP0 + 0x0013)
      0004CC E0               [24]  538 	movx	a,@dptr
      0004CD FF               [12]  539 	mov	r7,a
      0004CE 20 E7 F8         [24]  540 	jb	acc.7,00101$
      0004D1                        541 00106$:
                                    542 ;	usb.c:91: }
      0004D1 22               [24]  543 	ret
                                    544 ;------------------------------------------------------------
                                    545 ;Allocation info for local variables in function 'SendData1'
                                    546 ;------------------------------------------------------------
                                    547 ;offset                    Allocated with name '_SendData1_PARM_2'
                                    548 ;size                      Allocated to registers r6 r7 
                                    549 ;------------------------------------------------------------
                                    550 ;	usb.c:93: void SendData1(WORD size, BYTE offset)
                                    551 ;	-----------------------------------------
                                    552 ;	 function SendData1
                                    553 ;	-----------------------------------------
      0004D2                        554 _SendData1:
      0004D2 AE 82            [24]  555 	mov	r6,dpl
      0004D4 AF 83            [24]  556 	mov	r7,dph
                                    557 ;	usb.c:95: if (size > 0)
      0004D6 EE               [12]  558 	mov	a,r6
      0004D7 4F               [12]  559 	orl	a,r7
      0004D8 60 56            [24]  560 	jz	00106$
                                    561 ;	usb.c:97: SetDMA(0x20, 0, 0);
      0004DA 75 45 00         [24]  562 	mov	_SetDMA_PARM_2,#0x00
      0004DD 75 46 00         [24]  563 	mov	_SetDMA_PARM_3,#0x00
      0004E0 75 82 20         [24]  564 	mov	dpl,#0x20
      0004E3 C0 07            [24]  565 	push	ar7
      0004E5 C0 06            [24]  566 	push	ar6
      0004E7 12 04 0C         [24]  567 	lcall	_SetDMA
                                    568 ;	usb.c:98: SetDMA(0x20, 0x80, 1);
      0004EA 75 45 80         [24]  569 	mov	_SetDMA_PARM_2,#0x80
      0004ED 75 46 01         [24]  570 	mov	_SetDMA_PARM_3,#0x01
      0004F0 75 82 20         [24]  571 	mov	dpl,#0x20
      0004F3 12 04 0C         [24]  572 	lcall	_SetDMA
      0004F6 D0 06            [24]  573 	pop	ar6
      0004F8 D0 07            [24]  574 	pop	ar7
                                    575 ;	usb.c:99: EP1.ptr_l = usb_buffer_PA>>8;
      0004FA 90 F2 05         [24]  576 	mov	dptr,#(_EP1 + 0x0005)
      0004FD 74 80            [12]  577 	mov	a,#0x80
      0004FF F0               [24]  578 	movx	@dptr,a
                                    579 ;	usb.c:100: EP1.ptr_m = usb_buffer_PA>>16;
      000500 90 F2 06         [24]  580 	mov	dptr,#(_EP1 + 0x0006)
      000503 E4               [12]  581 	clr	a
      000504 F0               [24]  582 	movx	@dptr,a
                                    583 ;	usb.c:101: EP1.ptr_h = usb_buffer_PA>>24;
      000505 90 F2 07         [24]  584 	mov	dptr,#(_EP1 + 0x0007)
      000508 F0               [24]  585 	movx	@dptr,a
                                    586 ;	usb.c:102: EP1.offset = offset;
      000509 90 F2 0A         [24]  587 	mov	dptr,#(_EP1 + 0x000a)
      00050C E5 24            [12]  588 	mov	a,_SendData1_PARM_2
      00050E F0               [24]  589 	movx	@dptr,a
                                    590 ;	usb.c:103: EP1.len_l = LSB(size);
      00050F 8E 05            [24]  591 	mov	ar5,r6
      000511 90 F2 0C         [24]  592 	mov	dptr,#(_EP1 + 0x000c)
      000514 ED               [12]  593 	mov	a,r5
      000515 F0               [24]  594 	movx	@dptr,a
                                    595 ;	usb.c:104: EP1.len_m = MSB(size);
      000516 8F 06            [24]  596 	mov	ar6,r7
      000518 90 F2 0D         [24]  597 	mov	dptr,#(_EP1 + 0x000d)
      00051B EE               [12]  598 	mov	a,r6
      00051C F0               [24]  599 	movx	@dptr,a
                                    600 ;	usb.c:105: EP1.len_h = 0;
      00051D 90 F2 0E         [24]  601 	mov	dptr,#(_EP1 + 0x000e)
      000520 E4               [12]  602 	clr	a
      000521 F0               [24]  603 	movx	@dptr,a
                                    604 ;	usb.c:106: EP1.cs = 0x88;		
      000522 90 F2 13         [24]  605 	mov	dptr,#(_EP1 + 0x0013)
      000525 74 88            [12]  606 	mov	a,#0x88
      000527 F0               [24]  607 	movx	@dptr,a
                                    608 ;	usb.c:108: while(EP1.cs & 0x80);	
      000528                        609 00101$:
      000528 90 F2 13         [24]  610 	mov	dptr,#(_EP1 + 0x0013)
      00052B E0               [24]  611 	movx	a,@dptr
      00052C FF               [12]  612 	mov	r7,a
      00052D 20 E7 F8         [24]  613 	jb	acc.7,00101$
      000530                        614 00106$:
                                    615 ;	usb.c:110: }
      000530 22               [24]  616 	ret
                                    617 ;------------------------------------------------------------
                                    618 ;Allocation info for local variables in function 'SendCSW'
                                    619 ;------------------------------------------------------------
                                    620 ;	usb.c:112: static void SendCSW()
                                    621 ;	-----------------------------------------
                                    622 ;	 function SendCSW
                                    623 ;	-----------------------------------------
      000531                        624 _SendCSW:
                                    625 ;	usb.c:114: usb_buffer[0] = 'U';
      000531 90 00 00         [24]  626 	mov	dptr,#_usb_buffer
      000534 74 55            [12]  627 	mov	a,#0x55
      000536 F0               [24]  628 	movx	@dptr,a
                                    629 ;	usb.c:115: usb_buffer[1] = 'S';
      000537 90 00 01         [24]  630 	mov	dptr,#(_usb_buffer + 0x0001)
      00053A 74 53            [12]  631 	mov	a,#0x53
      00053C F0               [24]  632 	movx	@dptr,a
                                    633 ;	usb.c:116: usb_buffer[2] = 'B';
      00053D 90 00 02         [24]  634 	mov	dptr,#(_usb_buffer + 0x0002)
      000540 74 42            [12]  635 	mov	a,#0x42
      000542 F0               [24]  636 	movx	@dptr,a
                                    637 ;	usb.c:117: usb_buffer[3] = 'S';
      000543 90 00 03         [24]  638 	mov	dptr,#(_usb_buffer + 0x0003)
      000546 74 53            [12]  639 	mov	a,#0x53
      000548 F0               [24]  640 	movx	@dptr,a
                                    641 ;	usb.c:118: usb_buffer[4] = scsi_tag[0];
      000549 90 00 04         [24]  642 	mov	dptr,#(_usb_buffer + 0x0004)
      00054C E5 2E            [12]  643 	mov	a,_scsi_tag
      00054E F0               [24]  644 	movx	@dptr,a
                                    645 ;	usb.c:119: usb_buffer[5] = scsi_tag[1];
      00054F 90 00 05         [24]  646 	mov	dptr,#(_usb_buffer + 0x0005)
      000552 E5 2F            [12]  647 	mov	a,(_scsi_tag + 0x0001)
      000554 F0               [24]  648 	movx	@dptr,a
                                    649 ;	usb.c:120: usb_buffer[6] = scsi_tag[2];
      000555 90 00 06         [24]  650 	mov	dptr,#(_usb_buffer + 0x0006)
      000558 E5 30            [12]  651 	mov	a,(_scsi_tag + 0x0002)
      00055A F0               [24]  652 	movx	@dptr,a
                                    653 ;	usb.c:121: usb_buffer[7] = scsi_tag[3];
      00055B 90 00 07         [24]  654 	mov	dptr,#(_usb_buffer + 0x0007)
      00055E E5 31            [12]  655 	mov	a,(_scsi_tag + 0x0003)
      000560 F0               [24]  656 	movx	@dptr,a
                                    657 ;	usb.c:122: usb_buffer[8] = scsi_data_residue;
      000561 AF 26            [24]  658 	mov	r7,_scsi_data_residue
      000563 90 00 08         [24]  659 	mov	dptr,#(_usb_buffer + 0x0008)
      000566 EF               [12]  660 	mov	a,r7
      000567 F0               [24]  661 	movx	@dptr,a
                                    662 ;	usb.c:123: usb_buffer[9] = scsi_data_residue>>8;
      000568 AF 27            [24]  663 	mov	r7,(_scsi_data_residue + 1)
      00056A 90 00 09         [24]  664 	mov	dptr,#(_usb_buffer + 0x0009)
      00056D EF               [12]  665 	mov	a,r7
      00056E F0               [24]  666 	movx	@dptr,a
                                    667 ;	usb.c:124: usb_buffer[10] = scsi_data_residue>>16;
      00056F AF 28            [24]  668 	mov	r7,(_scsi_data_residue + 2)
      000571 90 00 0A         [24]  669 	mov	dptr,#(_usb_buffer + 0x000a)
      000574 EF               [12]  670 	mov	a,r7
      000575 F0               [24]  671 	movx	@dptr,a
                                    672 ;	usb.c:125: usb_buffer[11] = scsi_data_residue>>24;
      000576 AF 29            [24]  673 	mov	r7,(_scsi_data_residue + 3)
      000578 90 00 0B         [24]  674 	mov	dptr,#(_usb_buffer + 0x000b)
      00057B EF               [12]  675 	mov	a,r7
      00057C F0               [24]  676 	movx	@dptr,a
                                    677 ;	usb.c:126: usb_buffer[12] = scsi_status;
      00057D 90 00 0C         [24]  678 	mov	dptr,#(_usb_buffer + 0x000c)
      000580 E5 25            [12]  679 	mov	a,_scsi_status
      000582 F0               [24]  680 	movx	@dptr,a
                                    681 ;	usb.c:128: SendData1(13, 0);
      000583 75 24 00         [24]  682 	mov	_SendData1_PARM_2,#0x00
      000586 90 00 0D         [24]  683 	mov	dptr,#0x000d
      000589 12 04 D2         [24]  684 	lcall	_SendData1
                                    685 ;	usb.c:129: usb_have_csw_ready = 0;
      00058C 90 60 06         [24]  686 	mov	dptr,#_usb_have_csw_ready
      00058F E4               [12]  687 	clr	a
      000590 F0               [24]  688 	movx	@dptr,a
                                    689 ;	usb.c:130: scsi_data_residue = 0;
      000591 F5 26            [12]  690 	mov	_scsi_data_residue,a
      000593 F5 27            [12]  691 	mov	(_scsi_data_residue + 1),a
      000595 F5 28            [12]  692 	mov	(_scsi_data_residue + 2),a
      000597 F5 29            [12]  693 	mov	(_scsi_data_residue + 3),a
                                    694 ;	usb.c:131: }
      000599 22               [24]  695 	ret
                                    696 ;------------------------------------------------------------
                                    697 ;Allocation info for local variables in function 'SendCSW2'
                                    698 ;------------------------------------------------------------
                                    699 ;	usb.c:133: static void SendCSW2()
                                    700 ;	-----------------------------------------
                                    701 ;	 function SendCSW2
                                    702 ;	-----------------------------------------
      00059A                        703 _SendCSW2:
                                    704 ;	usb.c:135: while(EP1.cs & bmSTALL);
      00059A                        705 00101$:
      00059A 90 F2 13         [24]  706 	mov	dptr,#(_EP1 + 0x0013)
      00059D E0               [24]  707 	movx	a,@dptr
      00059E FF               [12]  708 	mov	r7,a
      00059F 20 E1 F8         [24]  709 	jb	acc.1,00101$
                                    710 ;	usb.c:136: while((EP1.r17 & 0x80)==0)
      0005A2                        711 00106$:
      0005A2 90 F2 17         [24]  712 	mov	dptr,#(_EP1 + 0x0017)
      0005A5 E0               [24]  713 	movx	a,@dptr
      0005A6 FF               [12]  714 	mov	r7,a
      0005A7 20 E7 0D         [24]  715 	jb	acc.7,00109$
                                    716 ;	usb.c:138: if ((XVAL(0xF010) & 0x20)==0)
      0005AA 90 F0 10         [24]  717 	mov	dptr,#0xf010
      0005AD E0               [24]  718 	movx	a,@dptr
      0005AE 20 E5 F1         [24]  719 	jb	acc.5,00106$
                                    720 ;	usb.c:140: usb_have_csw_ready = 0;
      0005B1 90 60 06         [24]  721 	mov	dptr,#_usb_have_csw_ready
      0005B4 E4               [12]  722 	clr	a
      0005B5 F0               [24]  723 	movx	@dptr,a
                                    724 ;	usb.c:141: return;
      0005B6 22               [24]  725 	ret
                                    726 ;	usb.c:145: while(EP1.cs & 0x40);
      0005B7                        727 00109$:
      0005B7 90 F2 13         [24]  728 	mov	dptr,#(_EP1 + 0x0013)
      0005BA E0               [24]  729 	movx	a,@dptr
      0005BB FF               [12]  730 	mov	r7,a
      0005BC 20 E6 F8         [24]  731 	jb	acc.6,00109$
                                    732 ;	usb.c:146: while(EP2.cs & 0x40);
      0005BF                        733 00112$:
      0005BF 90 F2 53         [24]  734 	mov	dptr,#(_EP2 + 0x0013)
      0005C2 E0               [24]  735 	movx	a,@dptr
      0005C3 FF               [12]  736 	mov	r7,a
      0005C4 20 E6 F8         [24]  737 	jb	acc.6,00112$
                                    738 ;	usb.c:147: while(EP3.cs & 0x40);
      0005C7                        739 00115$:
      0005C7 90 F2 93         [24]  740 	mov	dptr,#(_EP3 + 0x0013)
      0005CA E0               [24]  741 	movx	a,@dptr
      0005CB FF               [12]  742 	mov	r7,a
      0005CC 20 E6 F8         [24]  743 	jb	acc.6,00115$
                                    744 ;	usb.c:148: while(EP4.cs & 0x40);
      0005CF                        745 00118$:
      0005CF 90 F2 D3         [24]  746 	mov	dptr,#(_EP4 + 0x0013)
      0005D2 E0               [24]  747 	movx	a,@dptr
      0005D3 20 E6 F9         [24]  748 	jb	acc.6,00118$
                                    749 ;	usb.c:150: EP1.fifo = 'U';
                                    750 ;	usb.c:151: EP1.fifo = 'S';
                                    751 ;	usb.c:152: EP1.fifo = 'B';
                                    752 ;	usb.c:153: EP1.fifo = 'S';
      0005D6 90 F2 1C         [24]  753 	mov	dptr,#(_EP1 + 0x001c)
      0005D9 74 55            [12]  754 	mov	a,#0x55
      0005DB F0               [24]  755 	movx	@dptr,a
      0005DC 74 53            [12]  756 	mov	a,#0x53
      0005DE F0               [24]  757 	movx	@dptr,a
      0005DF 74 42            [12]  758 	mov	a,#0x42
      0005E1 F0               [24]  759 	movx	@dptr,a
      0005E2 74 53            [12]  760 	mov	a,#0x53
      0005E4 F0               [24]  761 	movx	@dptr,a
                                    762 ;	usb.c:154: EP1.fifo = scsi_tag[0];
                                    763 ;	usb.c:155: EP1.fifo = scsi_tag[1];
                                    764 ;	usb.c:156: EP1.fifo = scsi_tag[2];
                                    765 ;	usb.c:157: EP1.fifo = scsi_tag[3];
      0005E5 90 F2 1C         [24]  766 	mov	dptr,#(_EP1 + 0x001c)
      0005E8 E5 2E            [12]  767 	mov	a,_scsi_tag
      0005EA F0               [24]  768 	movx	@dptr,a
      0005EB E5 2F            [12]  769 	mov	a,(_scsi_tag + 0x0001)
      0005ED F0               [24]  770 	movx	@dptr,a
      0005EE E5 30            [12]  771 	mov	a,(_scsi_tag + 0x0002)
      0005F0 F0               [24]  772 	movx	@dptr,a
      0005F1 E5 31            [12]  773 	mov	a,(_scsi_tag + 0x0003)
      0005F3 F0               [24]  774 	movx	@dptr,a
                                    775 ;	usb.c:158: EP1.fifo = scsi_data_residue;
      0005F4 AF 26            [24]  776 	mov	r7,_scsi_data_residue
      0005F6 90 F2 1C         [24]  777 	mov	dptr,#(_EP1 + 0x001c)
      0005F9 EF               [12]  778 	mov	a,r7
      0005FA F0               [24]  779 	movx	@dptr,a
                                    780 ;	usb.c:159: EP1.fifo = scsi_data_residue>>8;
      0005FB AF 27            [24]  781 	mov	r7,(_scsi_data_residue + 1)
      0005FD 90 F2 1C         [24]  782 	mov	dptr,#(_EP1 + 0x001c)
      000600 EF               [12]  783 	mov	a,r7
      000601 F0               [24]  784 	movx	@dptr,a
                                    785 ;	usb.c:160: EP1.fifo = scsi_data_residue>>16;
      000602 AF 28            [24]  786 	mov	r7,(_scsi_data_residue + 2)
      000604 90 F2 1C         [24]  787 	mov	dptr,#(_EP1 + 0x001c)
      000607 EF               [12]  788 	mov	a,r7
      000608 F0               [24]  789 	movx	@dptr,a
                                    790 ;	usb.c:161: EP1.fifo = scsi_data_residue>>24;
      000609 AF 29            [24]  791 	mov	r7,(_scsi_data_residue + 3)
                                    792 ;	usb.c:162: EP1.fifo = scsi_status;
      00060B 90 F2 1C         [24]  793 	mov	dptr,#(_EP1 + 0x001c)
      00060E EF               [12]  794 	mov	a,r7
      00060F F0               [24]  795 	movx	@dptr,a
      000610 E5 25            [12]  796 	mov	a,_scsi_status
      000612 F0               [24]  797 	movx	@dptr,a
                                    798 ;	usb.c:163: EP1.len_l = 13;
      000613 90 F2 0C         [24]  799 	mov	dptr,#(_EP1 + 0x000c)
      000616 74 0D            [12]  800 	mov	a,#0x0d
      000618 F0               [24]  801 	movx	@dptr,a
                                    802 ;	usb.c:164: EP1.len_m = 0;
      000619 90 F2 0D         [24]  803 	mov	dptr,#(_EP1 + 0x000d)
      00061C E4               [12]  804 	clr	a
      00061D F0               [24]  805 	movx	@dptr,a
                                    806 ;	usb.c:165: EP1.len_h = 0;
      00061E 90 F2 0E         [24]  807 	mov	dptr,#(_EP1 + 0x000e)
      000621 F0               [24]  808 	movx	@dptr,a
                                    809 ;	usb.c:166: EP1.cs = 0x40;		
      000622 90 F2 13         [24]  810 	mov	dptr,#(_EP1 + 0x0013)
      000625 74 40            [12]  811 	mov	a,#0x40
      000627 F0               [24]  812 	movx	@dptr,a
                                    813 ;	usb.c:167: usb_have_csw_ready = 0;
      000628 90 60 06         [24]  814 	mov	dptr,#_usb_have_csw_ready
      00062B E4               [12]  815 	clr	a
      00062C F0               [24]  816 	movx	@dptr,a
                                    817 ;	usb.c:168: scsi_data_residue = 0;
      00062D F5 26            [12]  818 	mov	_scsi_data_residue,a
      00062F F5 27            [12]  819 	mov	(_scsi_data_residue + 1),a
      000631 F5 28            [12]  820 	mov	(_scsi_data_residue + 2),a
      000633 F5 29            [12]  821 	mov	(_scsi_data_residue + 3),a
                                    822 ;	usb.c:169: }
      000635 22               [24]  823 	ret
                                    824 ;------------------------------------------------------------
                                    825 ;Allocation info for local variables in function 'InitUSB'
                                    826 ;------------------------------------------------------------
                                    827 ;b                         Allocated to registers r7 
                                    828 ;------------------------------------------------------------
                                    829 ;	usb.c:171: void InitUSB(void)
                                    830 ;	-----------------------------------------
                                    831 ;	 function InitUSB
                                    832 ;	-----------------------------------------
      000636                        833 _InitUSB:
                                    834 ;	usb.c:175: usb_irq = 0;
      000636 90 60 00         [24]  835 	mov	dptr,#_usb_irq
      000639 E4               [12]  836 	clr	a
      00063A F0               [24]  837 	movx	@dptr,a
                                    838 ;	usb.c:176: usb_received_data_ready = 0;
      00063B 90 60 05         [24]  839 	mov	dptr,#_usb_received_data_ready
      00063E F0               [24]  840 	movx	@dptr,a
                                    841 ;	usb.c:177: usb_have_csw_ready = 0;
      00063F 90 60 06         [24]  842 	mov	dptr,#_usb_have_csw_ready
      000642 F0               [24]  843 	movx	@dptr,a
                                    844 ;	usb.c:178: usb_speed = 0;
                                    845 ;	1-genFromRTrack replaced	mov	_usb_speed,#0x00
      000643 F5 22            [12]  846 	mov	_usb_speed,a
                                    847 ;	usb.c:179: EP1.ptr_l = usb_buffer_PA>>8;
      000645 90 F2 05         [24]  848 	mov	dptr,#(_EP1 + 0x0005)
      000648 74 80            [12]  849 	mov	a,#0x80
      00064A F0               [24]  850 	movx	@dptr,a
                                    851 ;	usb.c:180: EP1.ptr_m = usb_buffer_PA>>16;
      00064B 90 F2 06         [24]  852 	mov	dptr,#(_EP1 + 0x0006)
      00064E E4               [12]  853 	clr	a
      00064F F0               [24]  854 	movx	@dptr,a
                                    855 ;	usb.c:181: EP1.ptr_h = usb_buffer_PA>>24;
      000650 90 F2 07         [24]  856 	mov	dptr,#(_EP1 + 0x0007)
      000653 F0               [24]  857 	movx	@dptr,a
                                    858 ;	usb.c:182: EP1.r8 = 0x10;
      000654 90 F2 08         [24]  859 	mov	dptr,#(_EP1 + 0x0008)
      000657 74 10            [12]  860 	mov	a,#0x10
      000659 F0               [24]  861 	movx	@dptr,a
                                    862 ;	usb.c:183: EP1.offset = 0;
      00065A 90 F2 0A         [24]  863 	mov	dptr,#(_EP1 + 0x000a)
      00065D E4               [12]  864 	clr	a
      00065E F0               [24]  865 	movx	@dptr,a
                                    866 ;	usb.c:184: EP2.ptr_l = usb_buffer_PA>>8;
      00065F 90 F2 45         [24]  867 	mov	dptr,#(_EP2 + 0x0005)
      000662 74 80            [12]  868 	mov	a,#0x80
      000664 F0               [24]  869 	movx	@dptr,a
                                    870 ;	usb.c:185: EP2.ptr_m = usb_buffer_PA>>16;
      000665 90 F2 46         [24]  871 	mov	dptr,#(_EP2 + 0x0006)
      000668 E4               [12]  872 	clr	a
      000669 F0               [24]  873 	movx	@dptr,a
                                    874 ;	usb.c:186: EP2.ptr_h = usb_buffer_PA>>24;
      00066A 90 F2 47         [24]  875 	mov	dptr,#(_EP2 + 0x0007)
      00066D F0               [24]  876 	movx	@dptr,a
                                    877 ;	usb.c:187: EP2.r8 = 0x10;
      00066E 90 F2 48         [24]  878 	mov	dptr,#(_EP2 + 0x0008)
      000671 74 10            [12]  879 	mov	a,#0x10
      000673 F0               [24]  880 	movx	@dptr,a
                                    881 ;	usb.c:188: EP2.offset = 0;
      000674 90 F2 4A         [24]  882 	mov	dptr,#(_EP2 + 0x000a)
      000677 E4               [12]  883 	clr	a
      000678 F0               [24]  884 	movx	@dptr,a
                                    885 ;	usb.c:190: if (WARMSTATUS & 2) //USB warm start
      000679 90 FA 38         [24]  886 	mov	dptr,#_WARMSTATUS
      00067C E0               [24]  887 	movx	a,@dptr
      00067D 30 E1 54         [24]  888 	jnb	acc.1,00112$
                                    889 ;	usb.c:192: if ((USBSTAT & bmSpeed) == bmSuperSpeed)
      000680 90 F0 09         [24]  890 	mov	dptr,#_USBSTAT
      000683 E0               [24]  891 	movx	a,@dptr
      000684 FF               [12]  892 	mov	r7,a
      000685 53 07 07         [24]  893 	anl	ar7,#0x07
      000688 7E 00            [12]  894 	mov	r6,#0x00
      00068A BF 04 08         [24]  895 	cjne	r7,#0x04,00108$
      00068D BE 00 05         [24]  896 	cjne	r6,#0x00,00108$
                                    897 ;	usb.c:194: usb_speed = bmSuperSpeed;
      000690 75 22 04         [24]  898 	mov	_usb_speed,#0x04
      000693 80 27            [24]  899 	sjmp	00109$
      000695                        900 00108$:
                                    901 ;	usb.c:196: else if ((USBSTAT & bmSpeed) == bmHighSpeed)
      000695 90 F0 09         [24]  902 	mov	dptr,#_USBSTAT
      000698 E0               [24]  903 	movx	a,@dptr
      000699 54 07            [12]  904 	anl	a,#0x07
      00069B 60 02            [24]  905 	jz	00144$
      00069D 80 05            [24]  906 	sjmp	00105$
      00069F                        907 00144$:
                                    908 ;	usb.c:198: usb_speed = bmHighSpeed;
      00069F 75 22 00         [24]  909 	mov	_usb_speed,#0x00
      0006A2 80 18            [24]  910 	sjmp	00109$
      0006A4                        911 00105$:
                                    912 ;	usb.c:200: else if ((USBSTAT & bmSpeed) == bmFullSpeed)
      0006A4 90 F0 09         [24]  913 	mov	dptr,#_USBSTAT
      0006A7 E0               [24]  914 	movx	a,@dptr
      0006A8 FF               [12]  915 	mov	r7,a
      0006A9 53 07 07         [24]  916 	anl	ar7,#0x07
      0006AC 7E 00            [12]  917 	mov	r6,#0x00
      0006AE BF 01 08         [24]  918 	cjne	r7,#0x01,00102$
      0006B1 BE 00 05         [24]  919 	cjne	r6,#0x00,00102$
                                    920 ;	usb.c:202: usb_speed = bmFullSpeed;
      0006B4 75 22 01         [24]  921 	mov	_usb_speed,#0x01
      0006B7 80 03            [24]  922 	sjmp	00109$
      0006B9                        923 00102$:
                                    924 ;	usb.c:206: usb_speed = 0;
      0006B9 75 22 00         [24]  925 	mov	_usb_speed,#0x00
      0006BC                        926 00109$:
                                    927 ;	usb.c:209: EX1 = 1;
                                    928 ;	assignBit
      0006BC D2 AA            [12]  929 	setb	_EX1
                                    930 ;	usb.c:210: EX0 = 1;
                                    931 ;	assignBit
      0006BE D2 A8            [12]  932 	setb	_EX0
                                    933 ;	usb.c:211: EPIE = bmEP2IRQ | bmEP4IRQ;
      0006C0 90 F0 30         [24]  934 	mov	dptr,#_EPIE
      0006C3 74 0A            [12]  935 	mov	a,#0x0a
      0006C5 F0               [24]  936 	movx	@dptr,a
                                    937 ;	usb.c:212: scsi_data_residue = 0;
      0006C6 E4               [12]  938 	clr	a
      0006C7 F5 26            [12]  939 	mov	_scsi_data_residue,a
      0006C9 F5 27            [12]  940 	mov	(_scsi_data_residue + 1),a
      0006CB F5 28            [12]  941 	mov	(_scsi_data_residue + 2),a
      0006CD F5 29            [12]  942 	mov	(_scsi_data_residue + 3),a
                                    943 ;	usb.c:213: scsi_status = 0;
                                    944 ;	1-genFromRTrack replaced	mov	_scsi_status,#0x00
      0006CF F5 25            [12]  945 	mov	_scsi_status,a
                                    946 ;	usb.c:214: SendCSW();
      0006D1 02 05 31         [24]  947 	ljmp	_SendCSW
      0006D4                        948 00112$:
                                    949 ;	usb.c:219: REGBANK = 6;
      0006D4 90 F0 00         [24]  950 	mov	dptr,#_REGBANK
      0006D7 74 06            [12]  951 	mov	a,#0x06
      0006D9 F0               [24]  952 	movx	@dptr,a
                                    953 ;	usb.c:220: XVAL(0xF240) = 2;
      0006DA 90 F2 40         [24]  954 	mov	dptr,#0xf240
      0006DD 74 02            [12]  955 	mov	a,#0x02
      0006DF F0               [24]  956 	movx	@dptr,a
                                    957 ;	usb.c:221: XVAL(0xF28C) = 0x36;
      0006E0 90 F2 8C         [24]  958 	mov	dptr,#0xf28c
      0006E3 74 36            [12]  959 	mov	a,#0x36
      0006E5 F0               [24]  960 	movx	@dptr,a
                                    961 ;	usb.c:222: XVAL(0xF28D) = 0xD0;
      0006E6 90 F2 8D         [24]  962 	mov	dptr,#0xf28d
      0006E9 74 D0            [12]  963 	mov	a,#0xd0
      0006EB F0               [24]  964 	movx	@dptr,a
                                    965 ;	usb.c:223: XVAL(0xF28E) = 0x98;
      0006EC 90 F2 8E         [24]  966 	mov	dptr,#0xf28e
      0006EF 74 98            [12]  967 	mov	a,#0x98
      0006F1 F0               [24]  968 	movx	@dptr,a
                                    969 ;	usb.c:224: REGBANK = 0;
      0006F2 90 F0 00         [24]  970 	mov	dptr,#_REGBANK
      0006F5 E4               [12]  971 	clr	a
      0006F6 F0               [24]  972 	movx	@dptr,a
                                    973 ;	usb.c:225: EPIE = bmEP2IRQ | bmEP4IRQ;
      0006F7 90 F0 30         [24]  974 	mov	dptr,#_EPIE
      0006FA 74 0A            [12]  975 	mov	a,#0x0a
      0006FC F0               [24]  976 	movx	@dptr,a
                                    977 ;	usb.c:226: USBCTL = bmAttach | bmSuperSpeed;
      0006FD 90 F0 08         [24]  978 	mov	dptr,#_USBCTL
      000700 74 84            [12]  979 	mov	a,#0x84
      000702 F0               [24]  980 	movx	@dptr,a
                                    981 ;	usb.c:228: XVAL(0xFA38) |= 2;
      000703 90 FA 38         [24]  982 	mov	dptr,#0xfa38
      000706 E0               [24]  983 	movx	a,@dptr
      000707 FF               [12]  984 	mov	r7,a
      000708 7E 00            [12]  985 	mov	r6,#0x00
      00070A 43 07 02         [24]  986 	orl	ar7,#0x02
      00070D 90 FA 38         [24]  987 	mov	dptr,#0xfa38
      000710 EF               [12]  988 	mov	a,r7
      000711 F0               [24]  989 	movx	@dptr,a
                                    990 ;	usb.c:230: EX1 = 1;
                                    991 ;	assignBit
      000712 D2 AA            [12]  992 	setb	_EX1
                                    993 ;	usb.c:231: EX0 = 1;
                                    994 ;	assignBit
      000714 D2 A8            [12]  995 	setb	_EX0
                                    996 ;	usb.c:232: for (b = 0; b < 250; b++);			
      000716 7F FA            [12]  997 	mov	r7,#0xfa
      000718                        998 00116$:
      000718 EF               [12]  999 	mov	a,r7
      000719 14               [12] 1000 	dec	a
      00071A FF               [12] 1001 	mov	r7,a
      00071B 70 FB            [24] 1002 	jnz	00116$
                                   1003 ;	usb.c:234: }
      00071D 22               [24] 1004 	ret
                                   1005 ;------------------------------------------------------------
                                   1006 ;Allocation info for local variables in function 'usb_isr'
                                   1007 ;------------------------------------------------------------
                                   1008 ;	usb.c:236: void usb_isr(void) __interrupt USB_VECT
                                   1009 ;	-----------------------------------------
                                   1010 ;	 function usb_isr
                                   1011 ;	-----------------------------------------
      00071E                       1012 _usb_isr:
      00071E C0 E0            [24] 1013 	push	acc
      000720 C0 82            [24] 1014 	push	dpl
      000722 C0 83            [24] 1015 	push	dph
      000724 C0 07            [24] 1016 	push	ar7
      000726 C0 06            [24] 1017 	push	ar6
      000728 C0 05            [24] 1018 	push	ar5
      00072A C0 04            [24] 1019 	push	ar4
      00072C C0 D0            [24] 1020 	push	psw
      00072E 75 D0 00         [24] 1021 	mov	psw,#0x00
                                   1022 ;	usb.c:238: usb_irq = USBIRQ;
      000731 90 F0 27         [24] 1023 	mov	dptr,#_USBIRQ
      000734 E0               [24] 1024 	movx	a,@dptr
      000735 FF               [12] 1025 	mov	r7,a
      000736 90 60 00         [24] 1026 	mov	dptr,#_usb_irq
      000739 F0               [24] 1027 	movx	@dptr,a
                                   1028 ;	usb.c:240: if (usb_irq & 0x20)
      00073A EF               [12] 1029 	mov	a,r7
      00073B 30 E5 06         [24] 1030 	jnb	acc.5,00102$
                                   1031 ;	usb.c:242: USBIRQ = 0x20;
      00073E 90 F0 27         [24] 1032 	mov	dptr,#_USBIRQ
      000741 74 20            [12] 1033 	mov	a,#0x20
      000743 F0               [24] 1034 	movx	@dptr,a
      000744                       1035 00102$:
                                   1036 ;	usb.c:245: if (usb_irq & 0x10)
      000744 EF               [12] 1037 	mov	a,r7
      000745 30 E4 06         [24] 1038 	jnb	acc.4,00104$
                                   1039 ;	usb.c:247: USBIRQ = 0x10;
      000748 90 F0 27         [24] 1040 	mov	dptr,#_USBIRQ
      00074B 74 10            [12] 1041 	mov	a,#0x10
      00074D F0               [24] 1042 	movx	@dptr,a
      00074E                       1043 00104$:
                                   1044 ;	usb.c:250: if (usb_irq & bmSpeedChange)
      00074E EF               [12] 1045 	mov	a,r7
      00074F 30 E7 3F         [24] 1046 	jnb	acc.7,00115$
                                   1047 ;	usb.c:252: USBIRQ = bmSpeedChange;
      000752 90 F0 27         [24] 1048 	mov	dptr,#_USBIRQ
      000755 74 80            [12] 1049 	mov	a,#0x80
      000757 F0               [24] 1050 	movx	@dptr,a
                                   1051 ;	usb.c:253: if ((USBSTAT & bmSpeed) == bmSuperSpeed)
      000758 90 F0 09         [24] 1052 	mov	dptr,#_USBSTAT
      00075B E0               [24] 1053 	movx	a,@dptr
      00075C FE               [12] 1054 	mov	r6,a
      00075D 53 06 07         [24] 1055 	anl	ar6,#0x07
      000760 7D 00            [12] 1056 	mov	r5,#0x00
      000762 BE 04 08         [24] 1057 	cjne	r6,#0x04,00112$
      000765 BD 00 05         [24] 1058 	cjne	r5,#0x00,00112$
                                   1059 ;	usb.c:255: usb_speed = bmSuperSpeed;
      000768 75 22 04         [24] 1060 	mov	_usb_speed,#0x04
      00076B 80 24            [24] 1061 	sjmp	00115$
      00076D                       1062 00112$:
                                   1063 ;	usb.c:257: else if ((USBSTAT & bmSpeed) == bmHighSpeed)
      00076D 90 F0 09         [24] 1064 	mov	dptr,#_USBSTAT
      000770 E0               [24] 1065 	movx	a,@dptr
      000771 54 07            [12] 1066 	anl	a,#0x07
                                   1067 ;	usb.c:259: usb_speed = bmHighSpeed;
      000773 70 04            [24] 1068 	jnz	00109$
      000775 F5 22            [12] 1069 	mov	_usb_speed,a
      000777 80 18            [24] 1070 	sjmp	00115$
      000779                       1071 00109$:
                                   1072 ;	usb.c:261: else if ((USBSTAT & bmSpeed) == bmFullSpeed)
      000779 90 F0 09         [24] 1073 	mov	dptr,#_USBSTAT
      00077C E0               [24] 1074 	movx	a,@dptr
      00077D FE               [12] 1075 	mov	r6,a
      00077E 53 06 07         [24] 1076 	anl	ar6,#0x07
      000781 7D 00            [12] 1077 	mov	r5,#0x00
      000783 BE 01 08         [24] 1078 	cjne	r6,#0x01,00106$
      000786 BD 00 05         [24] 1079 	cjne	r5,#0x00,00106$
                                   1080 ;	usb.c:263: usb_speed = bmFullSpeed;
      000789 75 22 01         [24] 1081 	mov	_usb_speed,#0x01
      00078C 80 03            [24] 1082 	sjmp	00115$
      00078E                       1083 00106$:
                                   1084 ;	usb.c:267: usb_speed = 0;
      00078E 75 22 00         [24] 1085 	mov	_usb_speed,#0x00
      000791                       1086 00115$:
                                   1087 ;	usb.c:271: if (usb_irq & 0x40)
      000791 EF               [12] 1088 	mov	a,r7
      000792 30 E6 06         [24] 1089 	jnb	acc.6,00117$
                                   1090 ;	usb.c:273: USBIRQ = 0x40;
      000795 90 F0 27         [24] 1091 	mov	dptr,#_USBIRQ
      000798 74 40            [12] 1092 	mov	a,#0x40
      00079A F0               [24] 1093 	movx	@dptr,a
      00079B                       1094 00117$:
                                   1095 ;	usb.c:276: UsbIntStsF087 = XVAL(0xF087);
      00079B 90 F0 87         [24] 1096 	mov	dptr,#0xf087
      00079E E0               [24] 1097 	movx	a,@dptr
      00079F 90 60 04         [24] 1098 	mov	dptr,#_UsbIntStsF087
      0007A2 F0               [24] 1099 	movx	@dptr,a
                                   1100 ;	usb.c:277: UsbIntStsF086 = XVAL(0xF086);
      0007A3 90 F0 86         [24] 1101 	mov	dptr,#0xf086
      0007A6 E0               [24] 1102 	movx	a,@dptr
      0007A7 90 60 03         [24] 1103 	mov	dptr,#_UsbIntStsF086
      0007AA F0               [24] 1104 	movx	@dptr,a
                                   1105 ;	usb.c:278: UsbIntStsF082 = XVAL(0xF082);
      0007AB 90 F0 82         [24] 1106 	mov	dptr,#0xf082
      0007AE E0               [24] 1107 	movx	a,@dptr
      0007AF FF               [12] 1108 	mov	r7,a
      0007B0 90 60 02         [24] 1109 	mov	dptr,#_UsbIntStsF082
      0007B3 F0               [24] 1110 	movx	@dptr,a
                                   1111 ;	usb.c:279: UsbIntStsF080 = XVAL(0xF080);
      0007B4 90 F0 80         [24] 1112 	mov	dptr,#0xf080
      0007B7 E0               [24] 1113 	movx	a,@dptr
      0007B8 90 60 01         [24] 1114 	mov	dptr,#_UsbIntStsF080
      0007BB F0               [24] 1115 	movx	@dptr,a
                                   1116 ;	usb.c:281: if (UsbIntStsF082 & 0x80)
      0007BC EF               [12] 1117 	mov	a,r7
      0007BD 30 E7 06         [24] 1118 	jnb	acc.7,00119$
                                   1119 ;	usb.c:283: XVAL(0xF082) = 0x80;
      0007C0 90 F0 82         [24] 1120 	mov	dptr,#0xf082
      0007C3 74 80            [12] 1121 	mov	a,#0x80
      0007C5 F0               [24] 1122 	movx	@dptr,a
      0007C6                       1123 00119$:
                                   1124 ;	usb.c:286: if (UsbIntStsF082 & 0x40)
      0007C6 90 60 02         [24] 1125 	mov	dptr,#_UsbIntStsF082
      0007C9 E0               [24] 1126 	movx	a,@dptr
      0007CA 30 E6 06         [24] 1127 	jnb	acc.6,00121$
                                   1128 ;	usb.c:288: XVAL(0xF082) = 0x40;
      0007CD 90 F0 82         [24] 1129 	mov	dptr,#0xf082
      0007D0 74 40            [12] 1130 	mov	a,#0x40
      0007D2 F0               [24] 1131 	movx	@dptr,a
      0007D3                       1132 00121$:
                                   1133 ;	usb.c:291: if (UsbIntStsF080 & 1)
      0007D3 90 60 01         [24] 1134 	mov	dptr,#_UsbIntStsF080
      0007D6 E0               [24] 1135 	movx	a,@dptr
      0007D7 30 E0 53         [24] 1136 	jnb	acc.0,00125$
                                   1137 ;	usb.c:293: XVAL(0xF080) = 1;
      0007DA 90 F0 80         [24] 1138 	mov	dptr,#0xf080
      0007DD 74 01            [12] 1139 	mov	a,#0x01
      0007DF F0               [24] 1140 	movx	@dptr,a
                                   1141 ;	usb.c:294: if (EP0CS & bmSUDAV)
      0007E0 90 F0 48         [24] 1142 	mov	dptr,#_EP0CS
      0007E3 E0               [24] 1143 	movx	a,@dptr
      0007E4 30 E7 46         [24] 1144 	jnb	acc.7,00125$
                                   1145 ;	usb.c:296: bmRequestType = SETUPDAT[0];
      0007E7 90 F0 B8         [24] 1146 	mov	dptr,#_SETUPDAT
      0007EA E0               [24] 1147 	movx	a,@dptr
      0007EB F5 1A            [12] 1148 	mov	_bmRequestType,a
                                   1149 ;	usb.c:297: bRequest = SETUPDAT[1];
      0007ED 90 F0 B9         [24] 1150 	mov	dptr,#(_SETUPDAT + 0x0001)
      0007F0 E0               [24] 1151 	movx	a,@dptr
      0007F1 F5 1B            [12] 1152 	mov	_bRequest,a
                                   1153 ;	usb.c:298: wValue = SETUPDAT[2] | (SETUPDAT[3] << 8);
      0007F3 90 F0 BA         [24] 1154 	mov	dptr,#(_SETUPDAT + 0x0002)
      0007F6 E0               [24] 1155 	movx	a,@dptr
      0007F7 FF               [12] 1156 	mov	r7,a
      0007F8 90 F0 BB         [24] 1157 	mov	dptr,#(_SETUPDAT + 0x0003)
      0007FB E0               [24] 1158 	movx	a,@dptr
      0007FC FD               [12] 1159 	mov	r5,a
      0007FD E4               [12] 1160 	clr	a
      0007FE FC               [12] 1161 	mov	r4,a
      0007FF 4F               [12] 1162 	orl	a,r7
      000800 F5 1C            [12] 1163 	mov	_wValue,a
      000802 ED               [12] 1164 	mov	a,r5
      000803 4C               [12] 1165 	orl	a,r4
      000804 F5 1D            [12] 1166 	mov	(_wValue + 1),a
                                   1167 ;	usb.c:299: wIndex = SETUPDAT[4] | (SETUPDAT[5] << 8);
      000806 90 F0 BC         [24] 1168 	mov	dptr,#(_SETUPDAT + 0x0004)
      000809 E0               [24] 1169 	movx	a,@dptr
      00080A FF               [12] 1170 	mov	r7,a
      00080B 90 F0 BD         [24] 1171 	mov	dptr,#(_SETUPDAT + 0x0005)
      00080E E0               [24] 1172 	movx	a,@dptr
      00080F FD               [12] 1173 	mov	r5,a
      000810 E4               [12] 1174 	clr	a
      000811 FC               [12] 1175 	mov	r4,a
      000812 4F               [12] 1176 	orl	a,r7
      000813 F5 1E            [12] 1177 	mov	_wIndex,a
      000815 ED               [12] 1178 	mov	a,r5
      000816 4C               [12] 1179 	orl	a,r4
      000817 F5 1F            [12] 1180 	mov	(_wIndex + 1),a
                                   1181 ;	usb.c:300: wLength = SETUPDAT[6] | (SETUPDAT[7] << 8);
      000819 90 F0 BE         [24] 1182 	mov	dptr,#(_SETUPDAT + 0x0006)
      00081C E0               [24] 1183 	movx	a,@dptr
      00081D FF               [12] 1184 	mov	r7,a
      00081E 90 F0 BF         [24] 1185 	mov	dptr,#(_SETUPDAT + 0x0007)
      000821 E0               [24] 1186 	movx	a,@dptr
      000822 FD               [12] 1187 	mov	r5,a
      000823 E4               [12] 1188 	clr	a
      000824 FE               [12] 1189 	mov	r6,a
      000825 FC               [12] 1190 	mov	r4,a
      000826 4F               [12] 1191 	orl	a,r7
      000827 F5 20            [12] 1192 	mov	_wLength,a
      000829 ED               [12] 1193 	mov	a,r5
      00082A 4C               [12] 1194 	orl	a,r4
      00082B F5 21            [12] 1195 	mov	(_wLength + 1),a
      00082D                       1196 00125$:
                                   1197 ;	usb.c:304: if (XVAL(0xF082) & 0x20)
      00082D 90 F0 82         [24] 1198 	mov	dptr,#0xf082
      000830 E0               [24] 1199 	movx	a,@dptr
      000831 30 E5 06         [24] 1200 	jnb	acc.5,00127$
                                   1201 ;	usb.c:306: XVAL(0xF082) = 0x20;
      000834 90 F0 82         [24] 1202 	mov	dptr,#0xf082
      000837 74 20            [12] 1203 	mov	a,#0x20
      000839 F0               [24] 1204 	movx	@dptr,a
      00083A                       1205 00127$:
                                   1206 ;	usb.c:309: if (XVAL(0xF081) & 0x10)
      00083A 90 F0 81         [24] 1207 	mov	dptr,#0xf081
      00083D E0               [24] 1208 	movx	a,@dptr
      00083E 30 E4 06         [24] 1209 	jnb	acc.4,00129$
                                   1210 ;	usb.c:311: XVAL(0xF081) = 0x10;
      000841 90 F0 81         [24] 1211 	mov	dptr,#0xf081
      000844 74 10            [12] 1212 	mov	a,#0x10
      000846 F0               [24] 1213 	movx	@dptr,a
      000847                       1214 00129$:
                                   1215 ;	usb.c:314: if (XVAL(0xF081) & 0x20)
      000847 90 F0 81         [24] 1216 	mov	dptr,#0xf081
      00084A E0               [24] 1217 	movx	a,@dptr
      00084B 30 E5 06         [24] 1218 	jnb	acc.5,00131$
                                   1219 ;	usb.c:316: XVAL(0xF081) = 0x20;
      00084E 90 F0 81         [24] 1220 	mov	dptr,#0xf081
      000851 74 20            [12] 1221 	mov	a,#0x20
      000853 F0               [24] 1222 	movx	@dptr,a
      000854                       1223 00131$:
                                   1224 ;	usb.c:319: if (UsbIntStsF080 | UsbIntStsF082 | UsbIntStsF086 | UsbIntStsF087 | usb_irq)
      000854 90 60 02         [24] 1225 	mov	dptr,#_UsbIntStsF082
      000857 E0               [24] 1226 	movx	a,@dptr
      000858 FF               [12] 1227 	mov	r7,a
      000859 90 60 01         [24] 1228 	mov	dptr,#_UsbIntStsF080
      00085C E0               [24] 1229 	movx	a,@dptr
      00085D 42 07            [12] 1230 	orl	ar7,a
      00085F 90 60 03         [24] 1231 	mov	dptr,#_UsbIntStsF086
      000862 E0               [24] 1232 	movx	a,@dptr
      000863 42 07            [12] 1233 	orl	ar7,a
      000865 90 60 04         [24] 1234 	mov	dptr,#_UsbIntStsF087
      000868 E0               [24] 1235 	movx	a,@dptr
      000869 42 07            [12] 1236 	orl	ar7,a
      00086B 90 60 00         [24] 1237 	mov	dptr,#_usb_irq
      00086E E0               [24] 1238 	movx	a,@dptr
      00086F 4F               [12] 1239 	orl	a,r7
      000870 60 02            [24] 1240 	jz	00134$
                                   1241 ;	usb.c:321: EX0 = 0;
                                   1242 ;	assignBit
      000872 C2 A8            [12] 1243 	clr	_EX0
      000874                       1244 00134$:
                                   1245 ;	usb.c:323: }
      000874 D0 D0            [24] 1246 	pop	psw
      000876 D0 04            [24] 1247 	pop	ar4
      000878 D0 05            [24] 1248 	pop	ar5
      00087A D0 06            [24] 1249 	pop	ar6
      00087C D0 07            [24] 1250 	pop	ar7
      00087E D0 83            [24] 1251 	pop	dph
      000880 D0 82            [24] 1252 	pop	dpl
      000882 D0 E0            [24] 1253 	pop	acc
      000884 32               [24] 1254 	reti
                                   1255 ;	eliminated unneeded push/pop b
                                   1256 ;------------------------------------------------------------
                                   1257 ;Allocation info for local variables in function 'ep_isr'
                                   1258 ;------------------------------------------------------------
                                   1259 ;interrupts                Allocated to registers r7 
                                   1260 ;------------------------------------------------------------
                                   1261 ;	usb.c:325: void ep_isr(void) __interrupt EP_VECT
                                   1262 ;	-----------------------------------------
                                   1263 ;	 function ep_isr
                                   1264 ;	-----------------------------------------
      000885                       1265 _ep_isr:
      000885 C0 E0            [24] 1266 	push	acc
      000887 C0 82            [24] 1267 	push	dpl
      000889 C0 83            [24] 1268 	push	dph
      00088B C0 07            [24] 1269 	push	ar7
      00088D C0 06            [24] 1270 	push	ar6
      00088F C0 05            [24] 1271 	push	ar5
      000891 C0 D0            [24] 1272 	push	psw
      000893 75 D0 00         [24] 1273 	mov	psw,#0x00
                                   1274 ;	usb.c:327: BYTE interrupts = (EPIRQ & (bmEP2IRQ | bmEP4IRQ));
      000896 90 F0 20         [24] 1275 	mov	dptr,#_EPIRQ
      000899 E0               [24] 1276 	movx	a,@dptr
      00089A 54 0A            [12] 1277 	anl	a,#0x0a
                                   1278 ;	usb.c:328: if (interrupts & bmEP2IRQ)
      00089C FF               [12] 1279 	mov	r7,a
      00089D 30 E1 1D         [24] 1280 	jnb	acc.1,00102$
                                   1281 ;	usb.c:330: EPIE &= ~bmEP2IRQ; //disable this 
      0008A0 90 F0 30         [24] 1282 	mov	dptr,#_EPIE
      0008A3 E0               [24] 1283 	movx	a,@dptr
      0008A4 53 E0 FD         [24] 1284 	anl	acc,#0xfd
      0008A7 F0               [24] 1285 	movx	@dptr,a
                                   1286 ;	usb.c:331: EPIRQ = bmEP2IRQ; //acknowledge it
      0008A8 90 F0 20         [24] 1287 	mov	dptr,#_EPIRQ
      0008AB 74 02            [12] 1288 	mov	a,#0x02
      0008AD F0               [24] 1289 	movx	@dptr,a
                                   1290 ;	usb.c:332: usb_received_data_ready |= bmEP2IRQ;
      0008AE 90 60 05         [24] 1291 	mov	dptr,#_usb_received_data_ready
      0008B1 E0               [24] 1292 	movx	a,@dptr
      0008B2 FE               [12] 1293 	mov	r6,a
      0008B3 7D 00            [12] 1294 	mov	r5,#0x00
      0008B5 43 06 02         [24] 1295 	orl	ar6,#0x02
      0008B8 90 60 05         [24] 1296 	mov	dptr,#_usb_received_data_ready
      0008BB EE               [12] 1297 	mov	a,r6
      0008BC F0               [24] 1298 	movx	@dptr,a
      0008BD                       1299 00102$:
                                   1300 ;	usb.c:335: if (interrupts & bmEP4IRQ)
      0008BD EF               [12] 1301 	mov	a,r7
      0008BE 30 E3 1D         [24] 1302 	jnb	acc.3,00105$
                                   1303 ;	usb.c:337: EPIE &= ~bmEP4IRQ; //disable this 
      0008C1 90 F0 30         [24] 1304 	mov	dptr,#_EPIE
      0008C4 E0               [24] 1305 	movx	a,@dptr
      0008C5 53 E0 F7         [24] 1306 	anl	acc,#0xf7
      0008C8 F0               [24] 1307 	movx	@dptr,a
                                   1308 ;	usb.c:338: EPIRQ = bmEP4IRQ; //acknowledge it
      0008C9 90 F0 20         [24] 1309 	mov	dptr,#_EPIRQ
      0008CC 74 08            [12] 1310 	mov	a,#0x08
      0008CE F0               [24] 1311 	movx	@dptr,a
                                   1312 ;	usb.c:339: usb_received_data_ready |= bmEP4IRQ;
      0008CF 90 60 05         [24] 1313 	mov	dptr,#_usb_received_data_ready
      0008D2 E0               [24] 1314 	movx	a,@dptr
      0008D3 FF               [12] 1315 	mov	r7,a
      0008D4 7E 00            [12] 1316 	mov	r6,#0x00
      0008D6 43 07 08         [24] 1317 	orl	ar7,#0x08
      0008D9 90 60 05         [24] 1318 	mov	dptr,#_usb_received_data_ready
      0008DC EF               [12] 1319 	mov	a,r7
      0008DD F0               [24] 1320 	movx	@dptr,a
      0008DE                       1321 00105$:
                                   1322 ;	usb.c:341: }
      0008DE D0 D0            [24] 1323 	pop	psw
      0008E0 D0 05            [24] 1324 	pop	ar5
      0008E2 D0 06            [24] 1325 	pop	ar6
      0008E4 D0 07            [24] 1326 	pop	ar7
      0008E6 D0 83            [24] 1327 	pop	dph
      0008E8 D0 82            [24] 1328 	pop	dpl
      0008EA D0 E0            [24] 1329 	pop	acc
      0008EC 32               [24] 1330 	reti
                                   1331 ;	eliminated unneeded push/pop b
                                   1332 ;------------------------------------------------------------
                                   1333 ;Allocation info for local variables in function 'ResetEPs'
                                   1334 ;------------------------------------------------------------
                                   1335 ;	usb.c:343: static void ResetEPs()
                                   1336 ;	-----------------------------------------
                                   1337 ;	 function ResetEPs
                                   1338 ;	-----------------------------------------
      0008ED                       1339 _ResetEPs:
                                   1340 ;	usb.c:345: EPIE = bmEP2IRQ | bmEP4IRQ;
      0008ED 90 F0 30         [24] 1341 	mov	dptr,#_EPIE
      0008F0 74 0A            [12] 1342 	mov	a,#0x0a
      0008F2 F0               [24] 1343 	movx	@dptr,a
                                   1344 ;	usb.c:346: EP1.cs = 0;
      0008F3 90 F2 13         [24] 1345 	mov	dptr,#(_EP1 + 0x0013)
      0008F6 E4               [12] 1346 	clr	a
      0008F7 F0               [24] 1347 	movx	@dptr,a
                                   1348 ;	usb.c:347: EP2.cs = 0;
      0008F8 90 F2 53         [24] 1349 	mov	dptr,#(_EP2 + 0x0013)
      0008FB F0               [24] 1350 	movx	@dptr,a
                                   1351 ;	usb.c:348: EP3.cs = 0;
      0008FC 90 F2 93         [24] 1352 	mov	dptr,#(_EP3 + 0x0013)
      0008FF F0               [24] 1353 	movx	@dptr,a
                                   1354 ;	usb.c:349: EP4.cs = 0;
      000900 90 F2 D3         [24] 1355 	mov	dptr,#(_EP4 + 0x0013)
      000903 F0               [24] 1356 	movx	@dptr,a
                                   1357 ;	usb.c:350: }
      000904 22               [24] 1358 	ret
                                   1359 ;------------------------------------------------------------
                                   1360 ;Allocation info for local variables in function 'HandleControlRequest'
                                   1361 ;------------------------------------------------------------
                                   1362 ;res                       Allocated to registers r7 
                                   1363 ;------------------------------------------------------------
                                   1364 ;	usb.c:352: static void HandleControlRequest(void)
                                   1365 ;	-----------------------------------------
                                   1366 ;	 function HandleControlRequest
                                   1367 ;	-----------------------------------------
      000905                       1368 _HandleControlRequest:
                                   1369 ;	usb.c:355: switch(bmRequestType & 0x60)
      000905 AE 1A            [24] 1370 	mov	r6,_bmRequestType
      000907 53 06 60         [24] 1371 	anl	ar6,#0x60
      00090A 7F 00            [12] 1372 	mov	r7,#0x00
      00090C BE 00 05         [24] 1373 	cjne	r6,#0x00,00132$
      00090F BF 00 02         [24] 1374 	cjne	r7,#0x00,00132$
      000912 80 10            [24] 1375 	sjmp	00101$
      000914                       1376 00132$:
      000914 BE 20 05         [24] 1377 	cjne	r6,#0x20,00133$
      000917 BF 00 02         [24] 1378 	cjne	r7,#0x00,00133$
      00091A 80 0F            [24] 1379 	sjmp	00102$
      00091C                       1380 00133$:
                                   1381 ;	usb.c:357: case 0:
      00091C BE 40 1A         [24] 1382 	cjne	r6,#0x40,00104$
      00091F BF 00 17         [24] 1383 	cjne	r7,#0x00,00104$
      000922 80 0E            [24] 1384 	sjmp	00103$
      000924                       1385 00101$:
                                   1386 ;	usb.c:358: res = HandleStandardRequest();
      000924 12 0C 83         [24] 1387 	lcall	_HandleStandardRequest
      000927 AF 82            [24] 1388 	mov	r7,dpl
                                   1389 ;	usb.c:359: break;
                                   1390 ;	usb.c:360: case 0x20:
      000929 80 10            [24] 1391 	sjmp	00105$
      00092B                       1392 00102$:
                                   1393 ;	usb.c:361: res = HandleClassRequest();
      00092B 12 0C CA         [24] 1394 	lcall	_HandleClassRequest
      00092E AF 82            [24] 1395 	mov	r7,dpl
                                   1396 ;	usb.c:362: break;
                                   1397 ;	usb.c:363: case 0x40:
      000930 80 09            [24] 1398 	sjmp	00105$
      000932                       1399 00103$:
                                   1400 ;	usb.c:364: res = HandleVendorRequest();
      000932 12 0C F7         [24] 1401 	lcall	_HandleVendorRequest
      000935 AF 82            [24] 1402 	mov	r7,dpl
                                   1403 ;	usb.c:365: break;
                                   1404 ;	usb.c:366: default:
      000937 80 02            [24] 1405 	sjmp	00105$
      000939                       1406 00104$:
                                   1407 ;	usb.c:367: res = FALSE;
      000939 7F 00            [12] 1408 	mov	r7,#0x00
                                   1409 ;	usb.c:368: }
      00093B                       1410 00105$:
                                   1411 ;	usb.c:370: if (!res)
      00093B EF               [12] 1412 	mov	a,r7
      00093C 70 15            [24] 1413 	jnz	00108$
                                   1414 ;	usb.c:372: EP0CS = wLength ? bmEP0STALL : bmEP0NAK;
      00093E E5 20            [12] 1415 	mov	a,_wLength
      000940 45 21            [12] 1416 	orl	a,(_wLength + 1)
      000942 60 06            [24] 1417 	jz	00110$
      000944 7E 08            [12] 1418 	mov	r6,#0x08
      000946 7F 00            [12] 1419 	mov	r7,#0x00
      000948 80 04            [24] 1420 	sjmp	00111$
      00094A                       1421 00110$:
      00094A 7E 02            [12] 1422 	mov	r6,#0x02
      00094C 7F 00            [12] 1423 	mov	r7,#0x00
      00094E                       1424 00111$:
      00094E 90 F0 48         [24] 1425 	mov	dptr,#_EP0CS
      000951 EE               [12] 1426 	mov	a,r6
      000952 F0               [24] 1427 	movx	@dptr,a
      000953                       1428 00108$:
                                   1429 ;	usb.c:374: }
      000953 22               [24] 1430 	ret
                                   1431 ;------------------------------------------------------------
                                   1432 ;Allocation info for local variables in function 'HandleUSBEvents'
                                   1433 ;------------------------------------------------------------
                                   1434 ;a                         Allocated to registers r7 
                                   1435 ;b                         Allocated to registers r6 
                                   1436 ;c                         Allocated to registers r5 
                                   1437 ;d                         Allocated to registers r4 
                                   1438 ;------------------------------------------------------------
                                   1439 ;	usb.c:376: void HandleUSBEvents(void)
                                   1440 ;	-----------------------------------------
                                   1441 ;	 function HandleUSBEvents
                                   1442 ;	-----------------------------------------
      000954                       1443 _HandleUSBEvents:
                                   1444 ;	usb.c:378: if (UsbIntStsF080 | UsbIntStsF082 | UsbIntStsF086 | UsbIntStsF087 | usb_irq)
      000954 90 60 02         [24] 1445 	mov	dptr,#_UsbIntStsF082
      000957 E0               [24] 1446 	movx	a,@dptr
      000958 FF               [12] 1447 	mov	r7,a
      000959 90 60 01         [24] 1448 	mov	dptr,#_UsbIntStsF080
      00095C E0               [24] 1449 	movx	a,@dptr
      00095D FE               [12] 1450 	mov	r6,a
      00095E 4F               [12] 1451 	orl	a,r7
      00095F FD               [12] 1452 	mov	r5,a
      000960 90 60 03         [24] 1453 	mov	dptr,#_UsbIntStsF086
      000963 E0               [24] 1454 	movx	a,@dptr
      000964 42 05            [12] 1455 	orl	ar5,a
      000966 90 60 04         [24] 1456 	mov	dptr,#_UsbIntStsF087
      000969 E0               [24] 1457 	movx	a,@dptr
      00096A 42 05            [12] 1458 	orl	ar5,a
      00096C 90 60 00         [24] 1459 	mov	dptr,#_usb_irq
      00096F E0               [24] 1460 	movx	a,@dptr
      000970 FC               [12] 1461 	mov	r4,a
      000971 4D               [12] 1462 	orl	a,r5
      000972 60 76            [24] 1463 	jz	00144$
                                   1464 ;	usb.c:380: if (usb_irq)
      000974 EC               [12] 1465 	mov	a,r4
      000975 60 39            [24] 1466 	jz	00116$
                                   1467 ;	usb.c:382: if (usb_irq & 0x40)
      000977 EC               [12] 1468 	mov	a,r4
      000978 30 E6 24         [24] 1469 	jnb	acc.6,00105$
                                   1470 ;	usb.c:384: USBCTL &= ~bmAttach;
      00097B 90 F0 08         [24] 1471 	mov	dptr,#_USBCTL
      00097E E0               [24] 1472 	movx	a,@dptr
      00097F 53 E0 7F         [24] 1473 	anl	acc,#0x7f
      000982 F0               [24] 1474 	movx	@dptr,a
                                   1475 ;	usb.c:385: ResetEPs();
      000983 12 08 ED         [24] 1476 	lcall	_ResetEPs
                                   1477 ;	usb.c:386: XVAL(0xFE88) = 0;
      000986 90 FE 88         [24] 1478 	mov	dptr,#0xfe88
      000989 E4               [12] 1479 	clr	a
      00098A F0               [24] 1480 	movx	@dptr,a
                                   1481 ;	usb.c:387: XVAL(0xFE82) = 0x10;
      00098B 90 FE 82         [24] 1482 	mov	dptr,#0xfe82
      00098E 74 10            [12] 1483 	mov	a,#0x10
      000990 F0               [24] 1484 	movx	@dptr,a
                                   1485 ;	usb.c:388: while(XVAL(0xFE88)!=2);
      000991                       1486 00101$:
      000991 90 FE 88         [24] 1487 	mov	dptr,#0xfe88
      000994 E0               [24] 1488 	movx	a,@dptr
      000995 FD               [12] 1489 	mov	r5,a
      000996 BD 02 F8         [24] 1490 	cjne	r5,#0x02,00101$
                                   1491 ;	usb.c:389: USBCTL = bmAttach;
      000999 90 F0 08         [24] 1492 	mov	dptr,#_USBCTL
      00099C 74 80            [12] 1493 	mov	a,#0x80
      00099E F0               [24] 1494 	movx	@dptr,a
      00099F                       1495 00105$:
                                   1496 ;	usb.c:392: if (usb_irq & bmSpeedChange)
      00099F 90 60 00         [24] 1497 	mov	dptr,#_usb_irq
      0009A2 E0               [24] 1498 	movx	a,@dptr
      0009A3 30 E7 03         [24] 1499 	jnb	acc.7,00107$
                                   1500 ;	usb.c:394: ResetEPs();
      0009A6 12 08 ED         [24] 1501 	lcall	_ResetEPs
      0009A9                       1502 00107$:
                                   1503 ;	usb.c:397: usb_irq = 0;
      0009A9 90 60 00         [24] 1504 	mov	dptr,#_usb_irq
      0009AC E4               [12] 1505 	clr	a
      0009AD F0               [24] 1506 	movx	@dptr,a
      0009AE 80 38            [24] 1507 	sjmp	00117$
      0009B0                       1508 00116$:
                                   1509 ;	usb.c:401: if (UsbIntStsF082 & 0xC0)
      0009B0 EF               [12] 1510 	mov	a,r7
      0009B1 54 C0            [12] 1511 	anl	a,#0xc0
      0009B3 60 1B            [24] 1512 	jz	00113$
                                   1513 ;	usb.c:403: ResetEPs();
      0009B5 12 08 ED         [24] 1514 	lcall	_ResetEPs
                                   1515 ;	usb.c:404: XVAL(0xF092) = 0;
      0009B8 90 F0 92         [24] 1516 	mov	dptr,#0xf092
      0009BB E4               [12] 1517 	clr	a
      0009BC F0               [24] 1518 	movx	@dptr,a
                                   1519 ;	usb.c:405: XVAL(0xF096) = 0;
      0009BD 90 F0 96         [24] 1520 	mov	dptr,#0xf096
      0009C0 F0               [24] 1521 	movx	@dptr,a
                                   1522 ;	usb.c:406: if (UsbIntStsF082 & 0x40)
      0009C1 90 60 02         [24] 1523 	mov	dptr,#_UsbIntStsF082
      0009C4 E0               [24] 1524 	movx	a,@dptr
      0009C5 30 E6 0F         [24] 1525 	jnb	acc.6,00114$
                                   1526 ;	usb.c:408: XVAL(0xF07A) = 1;
      0009C8 90 F0 7A         [24] 1527 	mov	dptr,#0xf07a
      0009CB 74 01            [12] 1528 	mov	a,#0x01
      0009CD F0               [24] 1529 	movx	@dptr,a
      0009CE 80 07            [24] 1530 	sjmp	00114$
      0009D0                       1531 00113$:
                                   1532 ;	usb.c:413: if (UsbIntStsF080 & 1)
      0009D0 EE               [12] 1533 	mov	a,r6
      0009D1 30 E0 03         [24] 1534 	jnb	acc.0,00114$
                                   1535 ;	usb.c:415: HandleControlRequest();
      0009D4 12 09 05         [24] 1536 	lcall	_HandleControlRequest
      0009D7                       1537 00114$:
                                   1538 ;	usb.c:419: UsbIntStsF080 = 0;
      0009D7 90 60 01         [24] 1539 	mov	dptr,#_UsbIntStsF080
      0009DA E4               [12] 1540 	clr	a
      0009DB F0               [24] 1541 	movx	@dptr,a
                                   1542 ;	usb.c:420: UsbIntStsF082 = 0; 
      0009DC 90 60 02         [24] 1543 	mov	dptr,#_UsbIntStsF082
      0009DF F0               [24] 1544 	movx	@dptr,a
                                   1545 ;	usb.c:421: UsbIntStsF086 = 0; 
      0009E0 90 60 03         [24] 1546 	mov	dptr,#_UsbIntStsF086
      0009E3 F0               [24] 1547 	movx	@dptr,a
                                   1548 ;	usb.c:422: UsbIntStsF087 = 0;
      0009E4 90 60 04         [24] 1549 	mov	dptr,#_UsbIntStsF087
      0009E7 F0               [24] 1550 	movx	@dptr,a
      0009E8                       1551 00117$:
                                   1552 ;	usb.c:425: EX0 = 1;	
                                   1553 ;	assignBit
      0009E8 D2 A8            [12] 1554 	setb	_EX0
                                   1555 ;	usb.c:429: if (1)//usb_received_data_ready)
      0009EA                       1556 00144$:
                                   1557 ;	usb.c:433: if (EP4.fifo_count > 0)
      0009EA 90 F2 DA         [24] 1558 	mov	dptr,#(_EP4 + 0x001a)
      0009ED E0               [24] 1559 	movx	a,@dptr
      0009EE 60 20            [24] 1560 	jz	00123$
                                   1561 ;	usb.c:435: EP4.cs = 0x40;
      0009F0 90 F2 D3         [24] 1562 	mov	dptr,#(_EP4 + 0x0013)
      0009F3 74 40            [12] 1563 	mov	a,#0x40
      0009F5 F0               [24] 1564 	movx	@dptr,a
                                   1565 ;	usb.c:437: send_keys_enabled = 1;
      0009F6 75 0A 01         [24] 1566 	mov	_send_keys_enabled,#0x01
                                   1567 ;	usb.c:438: usb_received_data_ready &= ~bmEP4IRQ;
      0009F9 90 60 05         [24] 1568 	mov	dptr,#_usb_received_data_ready
      0009FC E0               [24] 1569 	movx	a,@dptr
      0009FD 53 E0 F7         [24] 1570 	anl	acc,#0xf7
      000A00 F0               [24] 1571 	movx	@dptr,a
                                   1572 ;	usb.c:439: EPIE |= bmEP4IRQ;
      000A01 90 F0 30         [24] 1573 	mov	dptr,#_EPIE
      000A04 E0               [24] 1574 	movx	a,@dptr
      000A05 FF               [12] 1575 	mov	r7,a
      000A06 7E 00            [12] 1576 	mov	r6,#0x00
      000A08 43 07 08         [24] 1577 	orl	ar7,#0x08
      000A0B 90 F0 30         [24] 1578 	mov	dptr,#_EPIE
      000A0E EF               [12] 1579 	mov	a,r7
      000A0F F0               [24] 1580 	movx	@dptr,a
      000A10                       1581 00123$:
                                   1582 ;	usb.c:443: if (usb_received_data_ready & bmEP2IRQ)
      000A10 90 60 05         [24] 1583 	mov	dptr,#_usb_received_data_ready
      000A13 E0               [24] 1584 	movx	a,@dptr
      000A14 20 E1 03         [24] 1585 	jb	acc.1,00251$
      000A17 02 0B 64         [24] 1586 	ljmp	00145$
      000A1A                       1587 00251$:
                                   1588 ;	usb.c:445: if (EP2.fifo_count == 31) //CBW size
      000A1A 90 F2 5A         [24] 1589 	mov	dptr,#(_EP2 + 0x001a)
      000A1D E0               [24] 1590 	movx	a,@dptr
      000A1E FF               [12] 1591 	mov	r7,a
      000A1F BF 1F 02         [24] 1592 	cjne	r7,#0x1f,00252$
      000A22 80 03            [24] 1593 	sjmp	00253$
      000A24                       1594 00252$:
      000A24 02 0B 45         [24] 1595 	ljmp	00140$
      000A27                       1596 00253$:
                                   1597 ;	usb.c:449: scsi_data_residue = 0;
      000A27 E4               [12] 1598 	clr	a
      000A28 F5 26            [12] 1599 	mov	_scsi_data_residue,a
      000A2A F5 27            [12] 1600 	mov	(_scsi_data_residue + 1),a
      000A2C F5 28            [12] 1601 	mov	(_scsi_data_residue + 2),a
      000A2E F5 29            [12] 1602 	mov	(_scsi_data_residue + 3),a
                                   1603 ;	usb.c:455: a = EP2.fifo;
      000A30 90 F2 5C         [24] 1604 	mov	dptr,#(_EP2 + 0x001c)
      000A33 E0               [24] 1605 	movx	a,@dptr
      000A34 FF               [12] 1606 	mov	r7,a
                                   1607 ;	usb.c:456: b = EP2.fifo;
      000A35 90 F2 5C         [24] 1608 	mov	dptr,#(_EP2 + 0x001c)
      000A38 E0               [24] 1609 	movx	a,@dptr
      000A39 FE               [12] 1610 	mov	r6,a
                                   1611 ;	usb.c:457: c = EP2.fifo;
      000A3A 90 F2 5C         [24] 1612 	mov	dptr,#(_EP2 + 0x001c)
      000A3D E0               [24] 1613 	movx	a,@dptr
      000A3E FD               [12] 1614 	mov	r5,a
                                   1615 ;	usb.c:458: d = EP2.fifo;
      000A3F 90 F2 5C         [24] 1616 	mov	dptr,#(_EP2 + 0x001c)
      000A42 E0               [24] 1617 	movx	a,@dptr
      000A43 FC               [12] 1618 	mov	r4,a
                                   1619 ;	usb.c:459: if ((a=='U') && (b=='S') && (c=='B') && (d=='C'))
      000A44 BF 55 02         [24] 1620 	cjne	r7,#0x55,00254$
      000A47 80 03            [24] 1621 	sjmp	00255$
      000A49                       1622 00254$:
      000A49 02 0B 3B         [24] 1623 	ljmp	00134$
      000A4C                       1624 00255$:
      000A4C BE 53 02         [24] 1625 	cjne	r6,#0x53,00256$
      000A4F 80 03            [24] 1626 	sjmp	00257$
      000A51                       1627 00256$:
      000A51 02 0B 3B         [24] 1628 	ljmp	00134$
      000A54                       1629 00257$:
      000A54 BD 42 02         [24] 1630 	cjne	r5,#0x42,00258$
      000A57 80 03            [24] 1631 	sjmp	00259$
      000A59                       1632 00258$:
      000A59 02 0B 3B         [24] 1633 	ljmp	00134$
      000A5C                       1634 00259$:
      000A5C BC 43 02         [24] 1635 	cjne	r4,#0x43,00260$
      000A5F 80 03            [24] 1636 	sjmp	00261$
      000A61                       1637 00260$:
      000A61 02 0B 3B         [24] 1638 	ljmp	00134$
      000A64                       1639 00261$:
                                   1640 ;	usb.c:461: scsi_tag[0] = EP2.fifo;
      000A64 90 F2 5C         [24] 1641 	mov	dptr,#(_EP2 + 0x001c)
      000A67 E0               [24] 1642 	movx	a,@dptr
      000A68 FF               [12] 1643 	mov	r7,a
      000A69 8F 2E            [24] 1644 	mov	_scsi_tag,r7
                                   1645 ;	usb.c:462: scsi_tag[1] = EP2.fifo;
      000A6B 90 F2 5C         [24] 1646 	mov	dptr,#(_EP2 + 0x001c)
      000A6E E0               [24] 1647 	movx	a,@dptr
      000A6F FF               [12] 1648 	mov	r7,a
      000A70 8F 2F            [24] 1649 	mov	(_scsi_tag + 0x0001),r7
                                   1650 ;	usb.c:463: scsi_tag[2] = EP2.fifo;
      000A72 90 F2 5C         [24] 1651 	mov	dptr,#(_EP2 + 0x001c)
      000A75 E0               [24] 1652 	movx	a,@dptr
      000A76 FF               [12] 1653 	mov	r7,a
      000A77 8F 30            [24] 1654 	mov	(_scsi_tag + 0x0002),r7
                                   1655 ;	usb.c:464: scsi_tag[3] = EP2.fifo;
      000A79 90 F2 5C         [24] 1656 	mov	dptr,#(_EP2 + 0x001c)
      000A7C E0               [24] 1657 	movx	a,@dptr
      000A7D FF               [12] 1658 	mov	r7,a
      000A7E 8F 31            [24] 1659 	mov	(_scsi_tag + 0x0003),r7
                                   1660 ;	usb.c:465: scsi_transfer_size = EP2.fifo;
      000A80 90 F2 5C         [24] 1661 	mov	dptr,#(_EP2 + 0x001c)
      000A83 E0               [24] 1662 	movx	a,@dptr
      000A84 FF               [12] 1663 	mov	r7,a
      000A85 8F 2A            [24] 1664 	mov	_scsi_transfer_size,r7
      000A87 75 2B 00         [24] 1665 	mov	(_scsi_transfer_size + 1),#0x00
      000A8A 75 2C 00         [24] 1666 	mov	(_scsi_transfer_size + 2),#0x00
      000A8D 75 2D 00         [24] 1667 	mov	(_scsi_transfer_size + 3),#0x00
                                   1668 ;	usb.c:466: scsi_transfer_size |= ((DWORD)EP2.fifo)<<8;
      000A90 90 F2 5C         [24] 1669 	mov	dptr,#(_EP2 + 0x001c)
      000A93 E0               [24] 1670 	movx	a,@dptr
      000A94 FF               [12] 1671 	mov	r7,a
      000A95 7E 00            [12] 1672 	mov	r6,#0x00
      000A97 7D 00            [12] 1673 	mov	r5,#0x00
      000A99 8D 04            [24] 1674 	mov	ar4,r5
      000A9B 8E 05            [24] 1675 	mov	ar5,r6
      000A9D 8F 06            [24] 1676 	mov	ar6,r7
      000A9F E4               [12] 1677 	clr	a
      000AA0 42 2A            [12] 1678 	orl	_scsi_transfer_size,a
      000AA2 EE               [12] 1679 	mov	a,r6
      000AA3 42 2B            [12] 1680 	orl	(_scsi_transfer_size + 1),a
      000AA5 ED               [12] 1681 	mov	a,r5
      000AA6 42 2C            [12] 1682 	orl	(_scsi_transfer_size + 2),a
      000AA8 EC               [12] 1683 	mov	a,r4
      000AA9 42 2D            [12] 1684 	orl	(_scsi_transfer_size + 3),a
                                   1685 ;	usb.c:467: scsi_transfer_size |= ((DWORD)EP2.fifo)<<16;
      000AAB 90 F2 5C         [24] 1686 	mov	dptr,#(_EP2 + 0x001c)
      000AAE E0               [24] 1687 	movx	a,@dptr
      000AAF FF               [12] 1688 	mov	r7,a
      000AB0 7E 00            [12] 1689 	mov	r6,#0x00
      000AB2 8E 04            [24] 1690 	mov	ar4,r6
      000AB4 8F 05            [24] 1691 	mov	ar5,r7
      000AB6 E4               [12] 1692 	clr	a
      000AB7 FE               [12] 1693 	mov	r6,a
      000AB8 42 2A            [12] 1694 	orl	_scsi_transfer_size,a
      000ABA EE               [12] 1695 	mov	a,r6
      000ABB 42 2B            [12] 1696 	orl	(_scsi_transfer_size + 1),a
      000ABD ED               [12] 1697 	mov	a,r5
      000ABE 42 2C            [12] 1698 	orl	(_scsi_transfer_size + 2),a
      000AC0 EC               [12] 1699 	mov	a,r4
      000AC1 42 2D            [12] 1700 	orl	(_scsi_transfer_size + 3),a
                                   1701 ;	usb.c:468: scsi_transfer_size |= ((DWORD)EP2.fifo)<<24;
      000AC3 90 F2 5C         [24] 1702 	mov	dptr,#(_EP2 + 0x001c)
      000AC6 E0               [24] 1703 	movx	a,@dptr
      000AC7 FC               [12] 1704 	mov	r4,a
      000AC8 E4               [12] 1705 	clr	a
      000AC9 FF               [12] 1706 	mov	r7,a
      000ACA FE               [12] 1707 	mov	r6,a
      000ACB FD               [12] 1708 	mov	r5,a
      000ACC EF               [12] 1709 	mov	a,r7
      000ACD 42 2A            [12] 1710 	orl	_scsi_transfer_size,a
      000ACF EE               [12] 1711 	mov	a,r6
      000AD0 42 2B            [12] 1712 	orl	(_scsi_transfer_size + 1),a
      000AD2 ED               [12] 1713 	mov	a,r5
      000AD3 42 2C            [12] 1714 	orl	(_scsi_transfer_size + 2),a
      000AD5 EC               [12] 1715 	mov	a,r4
      000AD6 42 2D            [12] 1716 	orl	(_scsi_transfer_size + 3),a
                                   1717 ;	usb.c:469: scsi_dir_in = EP2.fifo & 0x80;
      000AD8 90 F2 5C         [24] 1718 	mov	dptr,#(_EP2 + 0x001c)
      000ADB E0               [24] 1719 	movx	a,@dptr
      000ADC FF               [12] 1720 	mov	r7,a
      000ADD 74 80            [12] 1721 	mov	a,#0x80
      000ADF 5F               [12] 1722 	anl	a,r7
      000AE0 F5 32            [12] 1723 	mov	_scsi_dir_in,a
                                   1724 ;	usb.c:470: scsi_lun = EP2.fifo;
      000AE2 90 F2 5C         [24] 1725 	mov	dptr,#(_EP2 + 0x001c)
      000AE5 E0               [24] 1726 	movx	a,@dptr
      000AE6 F5 33            [12] 1727 	mov	_scsi_lun,a
                                   1728 ;	usb.c:471: scsi_cdb_size = EP2.fifo;
      000AE8 90 F2 5C         [24] 1729 	mov	dptr,#(_EP2 + 0x001c)
      000AEB E0               [24] 1730 	movx	a,@dptr
      000AEC F5 44            [12] 1731 	mov	_scsi_cdb_size,a
                                   1732 ;	usb.c:472: for(a = 0; a < 16; a++)
      000AEE 7F 00            [12] 1733 	mov	r7,#0x00
      000AF0                       1734 00148$:
                                   1735 ;	usb.c:474: scsi_cdb[a] = EP2.fifo;
      000AF0 EF               [12] 1736 	mov	a,r7
      000AF1 24 34            [12] 1737 	add	a,#_scsi_cdb
      000AF3 F9               [12] 1738 	mov	r1,a
      000AF4 90 F2 5C         [24] 1739 	mov	dptr,#(_EP2 + 0x001c)
      000AF7 E0               [24] 1740 	movx	a,@dptr
      000AF8 F7               [12] 1741 	mov	@r1,a
                                   1742 ;	usb.c:472: for(a = 0; a < 16; a++)
      000AF9 0F               [12] 1743 	inc	r7
      000AFA BF 10 00         [24] 1744 	cjne	r7,#0x10,00262$
      000AFD                       1745 00262$:
      000AFD 40 F1            [24] 1746 	jc	00148$
                                   1747 ;	usb.c:477: EP2.cs = 0x40;
      000AFF 90 F2 53         [24] 1748 	mov	dptr,#(_EP2 + 0x0013)
      000B02 74 40            [12] 1749 	mov	a,#0x40
      000B04 F0               [24] 1750 	movx	@dptr,a
                                   1751 ;	usb.c:478: if (!HandleCDB())
      000B05 12 0C FB         [24] 1752 	lcall	_HandleCDB
      000B08 E5 82            [12] 1753 	mov	a,dpl
      000B0A 70 27            [24] 1754 	jnz	00132$
                                   1755 ;	usb.c:480: scsi_status = 1;
      000B0C 75 25 01         [24] 1756 	mov	_scsi_status,#0x01
                                   1757 ;	usb.c:481: if (scsi_transfer_size == 0)
      000B0F E5 2A            [12] 1758 	mov	a,_scsi_transfer_size
      000B11 45 2B            [12] 1759 	orl	a,(_scsi_transfer_size + 1)
      000B13 45 2C            [12] 1760 	orl	a,(_scsi_transfer_size + 2)
      000B15 45 2D            [12] 1761 	orl	a,(_scsi_transfer_size + 3)
      000B17 70 08            [24] 1762 	jnz	00129$
                                   1763 ;	usb.c:483: EP1.cs = bmSTALL; 
      000B19 90 F2 13         [24] 1764 	mov	dptr,#(_EP1 + 0x0013)
      000B1C 74 02            [12] 1765 	mov	a,#0x02
      000B1E F0               [24] 1766 	movx	@dptr,a
      000B1F 80 12            [24] 1767 	sjmp	00132$
      000B21                       1768 00129$:
                                   1769 ;	usb.c:485: else if (scsi_dir_in)
      000B21 E5 32            [12] 1770 	mov	a,_scsi_dir_in
      000B23 60 08            [24] 1771 	jz	00126$
                                   1772 ;	usb.c:487: EP1.cs = bmSTALL;
      000B25 90 F2 13         [24] 1773 	mov	dptr,#(_EP1 + 0x0013)
      000B28 74 02            [12] 1774 	mov	a,#0x02
      000B2A F0               [24] 1775 	movx	@dptr,a
      000B2B 80 06            [24] 1776 	sjmp	00132$
      000B2D                       1777 00126$:
                                   1778 ;	usb.c:491: EP2.cs = bmSTALL;
      000B2D 90 F2 53         [24] 1779 	mov	dptr,#(_EP2 + 0x0013)
      000B30 74 02            [12] 1780 	mov	a,#0x02
      000B32 F0               [24] 1781 	movx	@dptr,a
      000B33                       1782 00132$:
                                   1783 ;	usb.c:495: usb_have_csw_ready = 1;
      000B33 90 60 06         [24] 1784 	mov	dptr,#_usb_have_csw_ready
      000B36 74 01            [12] 1785 	mov	a,#0x01
      000B38 F0               [24] 1786 	movx	@dptr,a
      000B39 80 12            [24] 1787 	sjmp	00141$
      000B3B                       1788 00134$:
                                   1789 ;	usb.c:499: EP2.cs = 0x40;
                                   1790 ;	usb.c:500: EP2.cs = 4;
      000B3B 90 F2 53         [24] 1791 	mov	dptr,#(_EP2 + 0x0013)
      000B3E 74 40            [12] 1792 	mov	a,#0x40
      000B40 F0               [24] 1793 	movx	@dptr,a
      000B41 C4               [12] 1794 	swap	a
      000B42 F0               [24] 1795 	movx	@dptr,a
      000B43 80 08            [24] 1796 	sjmp	00141$
      000B45                       1797 00140$:
                                   1798 ;	usb.c:505: EP2.cs = 0x40;
                                   1799 ;	usb.c:506: EP2.cs = 4;
      000B45 90 F2 53         [24] 1800 	mov	dptr,#(_EP2 + 0x0013)
      000B48 74 40            [12] 1801 	mov	a,#0x40
      000B4A F0               [24] 1802 	movx	@dptr,a
      000B4B C4               [12] 1803 	swap	a
      000B4C F0               [24] 1804 	movx	@dptr,a
      000B4D                       1805 00141$:
                                   1806 ;	usb.c:509: usb_received_data_ready &= ~bmEP2IRQ;
      000B4D 90 60 05         [24] 1807 	mov	dptr,#_usb_received_data_ready
      000B50 E0               [24] 1808 	movx	a,@dptr
      000B51 53 E0 FD         [24] 1809 	anl	acc,#0xfd
      000B54 F0               [24] 1810 	movx	@dptr,a
                                   1811 ;	usb.c:510: EPIE |= bmEP2IRQ;
      000B55 90 F0 30         [24] 1812 	mov	dptr,#_EPIE
      000B58 E0               [24] 1813 	movx	a,@dptr
      000B59 FF               [12] 1814 	mov	r7,a
      000B5A 7E 00            [12] 1815 	mov	r6,#0x00
      000B5C 43 07 02         [24] 1816 	orl	ar7,#0x02
      000B5F 90 F0 30         [24] 1817 	mov	dptr,#_EPIE
      000B62 EF               [12] 1818 	mov	a,r7
      000B63 F0               [24] 1819 	movx	@dptr,a
      000B64                       1820 00145$:
                                   1821 ;	usb.c:514: if (usb_have_csw_ready)
      000B64 90 60 06         [24] 1822 	mov	dptr,#_usb_have_csw_ready
      000B67 E0               [24] 1823 	movx	a,@dptr
      000B68 60 03            [24] 1824 	jz	00150$
                                   1825 ;	usb.c:516: SendCSW2();
                                   1826 ;	usb.c:518: }
      000B6A 02 05 9A         [24] 1827 	ljmp	_SendCSW2
      000B6D                       1828 00150$:
      000B6D 22               [24] 1829 	ret
                                   1830 	.area CSEG    (CODE)
                                   1831 	.area CONST   (CODE)
                                   1832 	.area XINIT   (CODE)
                                   1833 	.area CABS    (ABS,CODE)

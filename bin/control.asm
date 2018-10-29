;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.8.0 #10562 (MINGW64)
;--------------------------------------------------------
	.module control
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HandleVendorRequest
	.globl _HandleClassRequest
	.globl _HandleStandardRequest
	.globl _EP0ACK
	.globl _SendControlResponse
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _RXD
	.globl _TXD
	.globl _INT0
	.globl _INT1
	.globl _T0
	.globl _T1
	.globl _WR
	.globl _RD
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _EA
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _SBUF
	.globl _SCON
	.globl _IP
	.globl _IE
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
	.globl _PRAMCTL
	.globl _BANK2PAH
	.globl _BANK2PAL
	.globl _BANK2VA
	.globl _BANK1PAH
	.globl _BANK1PAL
	.globl _BANK1VA
	.globl _BANK0PAH
	.globl _BANK0PAL
	.globl _WARMSTATUS
	.globl _GPIO0OUT
	.globl _GPIO0DIR
	.globl _DMACMD
	.globl _DMAFILL3
	.globl _DMAFILL2
	.globl _DMAFILL1
	.globl _DMAFILL0
	.globl _DMASIZEH
	.globl _DMASIZEM
	.globl _DMASIZEL
	.globl _DMADSTH
	.globl _DMADSTM
	.globl _DMADSTL
	.globl _DMASRCH
	.globl _DMASRCM
	.globl _DMASRCL
	.globl _NANDCSDIR
	.globl _NANDCSOUT
	.globl _EP4
	.globl _EP3
	.globl _EP2
	.globl _EP1
	.globl _EP0
	.globl _SETUPDAT
	.globl _EP0CS
	.globl _EPIE
	.globl _EPIRQ
	.globl _USBIRQ
	.globl _USBSTAT
	.globl _USBCTL
	.globl _REGBANK
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_P1	=	0x0090
_P2	=	0x00a0
_P3	=	0x00b0
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_IE	=	0x00a8
_IP	=	0x00b8
_SCON	=	0x0098
_SBUF	=	0x0099
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_P	=	0x00d0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_EA	=	0x00af
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_RD	=	0x00b7
_WR	=	0x00b6
_T1	=	0x00b5
_T0	=	0x00b4
_INT1	=	0x00b3
_INT0	=	0x00b2
_TXD	=	0x00b1
_RXD	=	0x00b0
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_REGBANK	=	0xf000
_USBCTL	=	0xf008
_USBSTAT	=	0xf009
_USBIRQ	=	0xf027
_EPIRQ	=	0xf020
_EPIE	=	0xf030
_EP0CS	=	0xf048
_SETUPDAT	=	0xf0b8
_EP0	=	0xf1c0
_EP1	=	0xf200
_EP2	=	0xf240
_EP3	=	0xf280
_EP4	=	0xf2c0
_NANDCSOUT	=	0xf608
_NANDCSDIR	=	0xf618
_DMASRCL	=	0xf900
_DMASRCM	=	0xf901
_DMASRCH	=	0xf902
_DMADSTL	=	0xf904
_DMADSTM	=	0xf905
_DMADSTH	=	0xf906
_DMASIZEL	=	0xf908
_DMASIZEM	=	0xf909
_DMASIZEH	=	0xf90a
_DMAFILL0	=	0xf90c
_DMAFILL1	=	0xf90d
_DMAFILL2	=	0xf90e
_DMAFILL3	=	0xf90f
_DMACMD	=	0xf930
_GPIO0DIR	=	0xfa14
_GPIO0OUT	=	0xfa15
_WARMSTATUS	=	0xfa38
_BANK0PAL	=	0xfa40
_BANK0PAH	=	0xfa41
_BANK1VA	=	0xfa42
_BANK1PAL	=	0xfa43
_BANK1PAH	=	0xfa44
_BANK2VA	=	0xfa45
_BANK2PAL	=	0xfa46
_BANK2PAH	=	0xfa47
_PRAMCTL	=	0xfa48
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0ACK'
;------------------------------------------------------------
;	control.c:83: void EP0ACK()
;	-----------------------------------------
;	 function EP0ACK
;	-----------------------------------------
_EP0ACK:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	control.c:85: EP0CS = bmEP0ACK;
	mov	dptr,#_EP0CS
	mov	a,#0x01
	movx	@dptr,a
;	control.c:86: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SetAddress'
;------------------------------------------------------------
;ret                       Allocated to registers r7 
;------------------------------------------------------------
;	control.c:88: static BYTE SetAddress()
;	-----------------------------------------
;	 function SetAddress
;	-----------------------------------------
_SetAddress:
;	control.c:90: BYTE ret = FALSE;
	mov	r7,#0x00
;	control.c:92: if (wValue < 0x7F)
	clr	c
	mov	a,_wValue
	subb	a,#0x7f
	mov	a,(_wValue + 1)
	subb	a,#0x00
	jnc	00102$
;	control.c:94: EP0ACK();
	lcall	_EP0ACK
;	control.c:95: ret = TRUE;
	mov	r7,#0x01
00102$:
;	control.c:98: return ret;
	mov	dpl,r7
;	control.c:99: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetDescriptor'
;------------------------------------------------------------
;type                      Allocated to registers r7 
;typeIndex                 Allocated to registers r6 
;i                         Allocated to registers r7 
;total                     Allocated to registers r6 
;ret                       Allocated to registers r5 
;------------------------------------------------------------
;	control.c:101: static BYTE GetDescriptor()
;	-----------------------------------------
;	 function GetDescriptor
;	-----------------------------------------
_GetDescriptor:
;	control.c:103: BYTE type = (wValue >> 8) & 0xFF;
	mov	r7,(_wValue + 1)
;	control.c:104: BYTE typeIndex = (wValue & 0xFF) ;
	mov	r6,_wValue
;	control.c:106: BYTE ret = FALSE;
	mov	r5,#0x00
;	control.c:108: switch (type)
	cjne	r7,#0x01,00272$
	sjmp	00151$
00272$:
	cjne	r7,#0x02,00273$
	sjmp	00103$
00273$:
	cjne	r7,#0x03,00274$
	ljmp	00105$
00274$:
	cjne	r7,#0x06,00275$
	ljmp	00164$
00275$:
	cjne	r7,#0x22,00276$
	ljmp	00167$
00276$:
	ljmp	00116$
;	control.c:112: for (i = 0; i < 0x12; i++)
00151$:
	mov	r7,#0x00
00117$:
;	control.c:114: EP0.fifo = deviceDescriptor[i];
	mov	a,r7
	mov	dptr,#_deviceDescriptor
	movc	a,@a+dptr
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:112: for (i = 0; i < 0x12; i++)
	inc	r7
	cjne	r7,#0x12,00277$
00277$:
;	control.c:117: SendControlResponse(wLength < 0x12 ? wLength : 0x12);
	jc	00117$
	mov	a,_wLength
	subb	a,#0x12
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00134$
	mov	r4,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00135$
00134$:
	mov	r4,#0x12
	mov	r7,#0x00
00135$:
	mov	dpl,r4
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:118: ret = TRUE;
	mov	r5,#0x01
;	control.c:120: break;
	ljmp	00116$
;	control.c:122: case 0x02:
00103$:
;	control.c:124: total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
	clr	c
	mov	a,_wLength
	subb	a,#0x37
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00136$
	mov	r4,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00137$
00136$:
	mov	r4,#0x37
	mov	r7,#0x00
00137$:
;	control.c:125: for (i = 0; i < total; i++)
	mov	r7,#0x00
00120$:
	clr	c
	mov	a,r7
	subb	a,r4
	jnc	00104$
;	control.c:127: EP0.fifo = configDescriptor[i];
	mov	a,r7
	mov	dptr,#_configDescriptor
	movc	a,@a+dptr
	mov	r3,a
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:125: for (i = 0; i < total; i++)
	inc	r7
	sjmp	00120$
00104$:
;	control.c:130: SendControlResponse(total);
	mov	r7,#0x00
	mov	dpl,r4
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:131: ret = TRUE;
	mov	r5,#0x01
;	control.c:133: break;
	ljmp	00116$
;	control.c:135: case 0x03://string descriptor
00105$:
;	control.c:137: switch (typeIndex){
	cjne	r6,#0x00,00108$
;	control.c:139: total = wLength < sizeof(stringLanDescriptor) ? wLength : sizeof(stringLanDescriptor);
	clr	c
	mov	a,_wLength
	subb	a,#0x04
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00138$
	mov	r6,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00139$
00138$:
	mov	r6,#0x04
	mov	r7,#0x00
00139$:
;	control.c:140: for (i = 0; i < total; i++)
	mov	r7,#0x00
00123$:
	clr	c
	mov	a,r7
	subb	a,r6
	jnc	00107$
;	control.c:142: EP0.fifo = stringLanDescriptor[i];
	mov	a,r7
	mov	dptr,#_stringLanDescriptor
	movc	a,@a+dptr
	mov	r4,a
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:140: for (i = 0; i < total; i++)
	inc	r7
	sjmp	00123$
00107$:
;	control.c:144: SendControlResponse(total);
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:145: ret = TRUE;					
	mov	r5,#0x01
;	control.c:146: break;
	ljmp	00116$
;	control.c:148: default:{
00108$:
;	control.c:149: total = wLength < sizeof(stringDescriptor) ? wLength : sizeof(stringDescriptor);
	clr	c
	mov	a,_wLength
	subb	a,#0x16
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00140$
	mov	r6,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00141$
00140$:
	mov	r6,#0x16
	mov	r7,#0x00
00141$:
;	control.c:150: for (i = 0; i < total; i++)
	mov	r7,#0x00
00126$:
	clr	c
	mov	a,r7
	subb	a,r6
	jnc	00109$
;	control.c:152: EP0.fifo = stringDescriptor[i];
	mov	a,r7
	mov	dptr,#_stringDescriptor
	movc	a,@a+dptr
	mov	r4,a
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:150: for (i = 0; i < total; i++)
	inc	r7
	sjmp	00126$
00109$:
;	control.c:154: SendControlResponse(total);
	mov	r7,#0x00
	mov	dpl,r6
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:155: ret = TRUE;					
	mov	r5,#0x01
;	control.c:160: break;
;	control.c:164: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
	sjmp	00116$
00164$:
	mov	r7,#0x00
00128$:
;	control.c:166: EP0.fifo = deviceQualifierDescriptor[i];
	mov	a,r7
	mov	dptr,#_deviceQualifierDescriptor
	movc	a,@a+dptr
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:164: for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
	inc	r7
	cjne	r7,#0x0a,00288$
00288$:
;	control.c:169: SendControlResponse(wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor));
	jc	00128$
	mov	a,_wLength
	subb	a,#0x0a
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00142$
	mov	r6,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00143$
00142$:
	mov	r6,#0x0a
	mov	r7,#0x00
00143$:
	mov	dpl,r6
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:170: ret = TRUE;
	mov	r5,#0x01
;	control.c:172: break;
;	control.c:176: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
	sjmp	00116$
00167$:
	mov	r7,#0x00
00130$:
;	control.c:178: EP0.fifo = HIDreportDescriptor[i];
	mov	a,r7
	mov	dptr,#_HIDreportDescriptor
	movc	a,@a+dptr
	mov	dptr,#(_EP0 + 0x001c)
	movx	@dptr,a
;	control.c:176: for (i = 0; i < sizeof(HIDreportDescriptor); i++)
	inc	r7
	cjne	r7,#0x3f,00291$
00291$:
;	control.c:181: SendControlResponse(wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor));
	jc	00130$
	mov	a,_wLength
	subb	a,#0x3f
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00144$
	mov	r6,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00145$
00144$:
	mov	r6,#0x3f
	mov	r7,#0x00
00145$:
	mov	dpl,r6
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:182: ret = TRUE;
	mov	r5,#0x01
;	control.c:190: }
00116$:
;	control.c:192: return ret;
	mov	dpl,r5
;	control.c:193: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SetConfiguration'
;------------------------------------------------------------
;ret                       Allocated to registers r7 
;------------------------------------------------------------
;	control.c:195: static BYTE SetConfiguration()
;	-----------------------------------------
;	 function SetConfiguration
;	-----------------------------------------
_SetConfiguration:
;	control.c:197: BYTE ret = FALSE;
	mov	r7,#0x00
;	control.c:199: if (wValue <= 1)
	clr	c
	mov	a,#0x01
	subb	a,_wValue
	clr	a
	subb	a,(_wValue + 1)
	jc	00102$
;	control.c:201: EP0ACK();
	lcall	_EP0ACK
;	control.c:202: ret = TRUE;
	mov	r7,#0x01
00102$:
;	control.c:205: return ret;
	mov	dpl,r7
;	control.c:206: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'HandleStandardRequest'
;------------------------------------------------------------
;	control.c:208: BYTE HandleStandardRequest()
;	-----------------------------------------
;	 function HandleStandardRequest
;	-----------------------------------------
_HandleStandardRequest:
;	control.c:210: switch(bRequest)
	mov	a,#0x05
	cjne	a,_bRequest,00120$
	sjmp	00101$
00120$:
	mov	a,#0x06
	cjne	a,_bRequest,00121$
	sjmp	00102$
00121$:
	mov	a,#0x09
;	control.c:212: case 0x05:
	cjne	a,_bRequest,00104$
	sjmp	00103$
00101$:
;	control.c:214: return SetAddress();
;	control.c:216: case 0x06:
	ljmp	_SetAddress
00102$:
;	control.c:218: return GetDescriptor();
;	control.c:220: case 0x09:
	ljmp	_GetDescriptor
00103$:
;	control.c:222: return SetConfiguration();
;	control.c:224: default:
	ljmp	_SetConfiguration
00104$:
;	control.c:226: return FALSE;
	mov	dpl,#0x00
;	control.c:228: }
;	control.c:229: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetMaxLUN'
;------------------------------------------------------------
;	control.c:231: static BYTE GetMaxLUN()
;	-----------------------------------------
;	 function GetMaxLUN
;	-----------------------------------------
_GetMaxLUN:
;	control.c:233: EP0.fifo = 0x00;
	mov	dptr,#(_EP0 + 0x001c)
	clr	a
	movx	@dptr,a
;	control.c:234: SendControlResponse(wLength < 0x01 ? wLength : 0x01);
	clr	c
	mov	a,_wLength
	subb	a,#0x01
	mov	a,(_wLength + 1)
	subb	a,#0x00
	jnc	00103$
	mov	r6,_wLength
	mov	r7,(_wLength + 1)
	sjmp	00104$
00103$:
	mov	r6,#0x01
	mov	r7,#0x00
00104$:
	mov	dpl,r6
	mov	dph,r7
	lcall	_SendControlResponse
;	control.c:236: return TRUE;
	mov	dpl,#0x01
;	control.c:237: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'HandleClassRequest'
;------------------------------------------------------------
;	control.c:239: BYTE HandleClassRequest()
;	-----------------------------------------
;	 function HandleClassRequest
;	-----------------------------------------
_HandleClassRequest:
;	control.c:241: switch(bRequest)
	mov	a,#0x09
	cjne	a,_bRequest,00120$
	sjmp	00101$
00120$:
	mov	a,#0x0a
	cjne	a,_bRequest,00121$
	sjmp	00102$
00121$:
	mov	a,#0xfe
;	control.c:243: case 0x09:
	cjne	a,_bRequest,00104$
	sjmp	00103$
00101$:
;	control.c:245: EP0CS = 0x05;
	mov	dptr,#_EP0CS
	mov	a,#0x05
	movx	@dptr,a
;	control.c:246: return TRUE;
	mov	dpl,#0x01
;	control.c:248: case 0x0A:
	ret
00102$:
;	control.c:250: EP0ACK();
	lcall	_EP0ACK
;	control.c:251: return TRUE;
	mov	dpl,#0x01
;	control.c:253: case 0xFE:
	ret
00103$:
;	control.c:255: return GetMaxLUN();
;	control.c:257: default:
	ljmp	_GetMaxLUN
00104$:
;	control.c:259: return FALSE;
	mov	dpl,#0x00
;	control.c:261: }
;	control.c:262: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'HandleVendorRequest'
;------------------------------------------------------------
;	control.c:264: BYTE HandleVendorRequest()
;	-----------------------------------------
;	 function HandleVendorRequest
;	-----------------------------------------
_HandleVendorRequest:
;	control.c:266: return FALSE;
	mov	dpl,#0x00
;	control.c:267: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
_deviceDescriptor:
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xb4	; 180
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
_configDescriptor:
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0x37	; 55	'7'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x4b	; 75	'K'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x21	; 33
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x22	; 34
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x01	; 1
_HIDreportDescriptor:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0xe0	; 224
	.db #0x29	; 41
	.db #0xe7	; 231
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x05	; 5
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x08	; 8
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x05	; 5
	.db #0x91	; 145
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x91	; 145
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x06	; 6
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x65	; 101	'e'
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0x65	; 101	'e'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
_stringLanDescriptor:
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x04	; 4
_stringDescriptor:
	.db #0x16	; 22
	.db #0x03	; 3
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x69	; 105	'i'
	.db #0x00	; 0
	.db #0x72	; 114	'r'
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x61	; 97	'a'
	.db #0x00	; 0
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x6f	; 111	'o'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x00	; 0
_HIDreportDescriptorMouse:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x15	; 21
	.db #0x81	; 129
	.db #0x25	; 37
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xc0	; 192
_deviceQualifierDescriptor:
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x01	; 1
	.db #0x00	; 0
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)

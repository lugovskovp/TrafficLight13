
./Release/TrafficLight13.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	39 c0       	rjmp	.+114    	; 0x74 <__ctors_end>
   2:	67 c0       	rjmp	.+206    	; 0xd2 <__vector_1>
   4:	45 c0       	rjmp	.+138    	; 0x90 <__bad_interrupt>
   6:	45 c0       	rjmp	.+138    	; 0x92 <__vector_3>
   8:	43 c0       	rjmp	.+134    	; 0x90 <__bad_interrupt>
   a:	42 c0       	rjmp	.+132    	; 0x90 <__bad_interrupt>
   c:	41 c0       	rjmp	.+130    	; 0x90 <__bad_interrupt>
   e:	40 c0       	rjmp	.+128    	; 0x90 <__bad_interrupt>
  10:	3f c0       	rjmp	.+126    	; 0x90 <__bad_interrupt>
  12:	3e c0       	rjmp	.+124    	; 0x90 <__bad_interrupt>

00000014 <__trampolines_end>:
  14:	18 08       	sbc	r1, r8
  16:	00 00       	nop
  18:	00 00       	nop
  1a:	b9 00       	.word	0x00b9	; ????
  1c:	08 08       	sbc	r0, r8
  1e:	18 08       	sbc	r1, r8
  20:	09 00       	.word	0x0009	; ????
  22:	6f 00       	.word	0x006f	; ????
  24:	09 09       	sbc	r16, r9
  26:	00 00       	nop
  28:	00 00       	nop
  2a:	25 00       	.word	0x0025	; ????
  2c:	0d 0d       	add	r16, r13
  2e:	00 00       	nop
  30:	00 00       	nop
  32:	4a 00       	.word	0x004a	; ????
  34:	18 10       	cpse	r1, r8
  36:	00 00       	nop
  38:	00 00       	nop
  3a:	03 01       	movw	r0, r6
  3c:	18 10       	cpse	r1, r8
  3e:	08 00       	.word	0x0008	; ????
  40:	09 00       	.word	0x0009	; ????
  42:	6f 00       	.word	0x006f	; ????
  44:	0c 04       	cpc	r0, r12
  46:	00 00       	nop
  48:	00 00       	nop
  4a:	25 00       	.word	0x0025	; ????
  4c:	0d 05       	cpc	r16, r13
  4e:	00 00       	nop
  50:	00 00       	nop
  52:	4a 00       	.word	0x004a	; ????
  54:	05 05       	cpc	r16, r5
  56:	05 00       	.word	0x0005	; ????
  58:	25 00       	.word	0x0025	; ????
	...
  62:	00 00       	nop
  64:	1c 0c       	add	r1, r12
  66:	19 11       	cpse	r17, r9
  68:	01 00       	.word	0x0001	; ????
  6a:	25 00       	.word	0x0025	; ????
  6c:	14 04       	cpc	r1, r4
  6e:	11 11       	cpse	r17, r1
  70:	01 00       	.word	0x0001	; ????
	...

00000074 <__ctors_end>:
  74:	11 24       	eor	r1, r1
  76:	1f be       	out	0x3f, r1	; 63
  78:	cf e9       	ldi	r28, 0x9F	; 159
  7a:	cd bf       	out	0x3d, r28	; 61

0000007c <__do_clear_bss>:
  7c:	20 e0       	ldi	r18, 0x00	; 0
  7e:	a0 e6       	ldi	r26, 0x60	; 96
  80:	b0 e0       	ldi	r27, 0x00	; 0
  82:	01 c0       	rjmp	.+2      	; 0x86 <.do_clear_bss_start>

00000084 <.do_clear_bss_loop>:
  84:	1d 92       	st	X+, r1

00000086 <.do_clear_bss_start>:
  86:	a8 36       	cpi	r26, 0x68	; 104
  88:	b2 07       	cpc	r27, r18
  8a:	e1 f7       	brne	.-8      	; 0x84 <.do_clear_bss_loop>
  8c:	6d d0       	rcall	.+218    	; 0x168 <main>
  8e:	b1 c3       	rjmp	.+1890   	; 0x7f2 <_exit>

00000090 <__bad_interrupt>:
  90:	b7 cf       	rjmp	.-146    	; 0x0 <__vectors>

00000092 <__vector_3>:
  92:	1f 92       	push	r1
  94:	0f 92       	push	r0
  96:	00 90 5f 00 	lds	r0, 0x005F	; 0x80005f <__EEPROM_REGION_LENGTH__+0x7f005f>
  9a:	0f 92       	push	r0
  9c:	11 24       	eor	r1, r1
  9e:	8f 93       	push	r24
  a0:	9f 93       	push	r25
  a2:	cf 93       	push	r28
  a4:	df 93       	push	r29
  a6:	cd b7       	in	r28, 0x3d	; 61
  a8:	dd 27       	eor	r29, r29
  aa:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
  ae:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
  b2:	01 96       	adiw	r24, 0x01	; 1
  b4:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
  b8:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
  bc:	00 00       	nop
  be:	df 91       	pop	r29
  c0:	cf 91       	pop	r28
  c2:	9f 91       	pop	r25
  c4:	8f 91       	pop	r24
  c6:	0f 90       	pop	r0
  c8:	00 92 5f 00 	sts	0x005F, r0	; 0x80005f <__EEPROM_REGION_LENGTH__+0x7f005f>
  cc:	0f 90       	pop	r0
  ce:	1f 90       	pop	r1
  d0:	18 95       	reti

000000d2 <__vector_1>:
  d2:	1f 92       	push	r1
  d4:	0f 92       	push	r0
  d6:	00 90 5f 00 	lds	r0, 0x005F	; 0x80005f <__EEPROM_REGION_LENGTH__+0x7f005f>
  da:	0f 92       	push	r0
  dc:	11 24       	eor	r1, r1
  de:	2f 93       	push	r18
  e0:	3f 93       	push	r19
  e2:	8f 93       	push	r24
  e4:	9f 93       	push	r25
  e6:	ef 93       	push	r30
  e8:	ff 93       	push	r31
  ea:	cf 93       	push	r28
  ec:	df 93       	push	r29
  ee:	cd b7       	in	r28, 0x3d	; 61
  f0:	dd 27       	eor	r29, r29
  f2:	8b e5       	ldi	r24, 0x5B	; 91
  f4:	90 e0       	ldi	r25, 0x00	; 0
  f6:	2b e5       	ldi	r18, 0x5B	; 91
  f8:	30 e0       	ldi	r19, 0x00	; 0
  fa:	f9 01       	movw	r30, r18
  fc:	20 81       	ld	r18, Z
  fe:	2f 7b       	andi	r18, 0xBF	; 191
 100:	fc 01       	movw	r30, r24
 102:	20 83       	st	Z, r18
 104:	8a e5       	ldi	r24, 0x5A	; 90
 106:	90 e0       	ldi	r25, 0x00	; 0
 108:	2a e5       	ldi	r18, 0x5A	; 90
 10a:	30 e0       	ldi	r19, 0x00	; 0
 10c:	f9 01       	movw	r30, r18
 10e:	20 81       	ld	r18, Z
 110:	2f 7b       	andi	r18, 0xBF	; 191
 112:	fc 01       	movw	r30, r24
 114:	20 83       	st	Z, r18
 116:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 11a:	82 60       	ori	r24, 0x02	; 2
 11c:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 120:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 124:	81 60       	ori	r24, 0x01	; 1
 126:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 12a:	10 92 61 00 	sts	0x0061, r1	; 0x800061 <_edata+0x1>
 12e:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <_edata>
 132:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 136:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 13a:	8f 7b       	andi	r24, 0xBF	; 191
 13c:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 140:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 144:	8f 77       	andi	r24, 0x7F	; 127
 146:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 14a:	00 00       	nop
 14c:	df 91       	pop	r29
 14e:	cf 91       	pop	r28
 150:	ff 91       	pop	r31
 152:	ef 91       	pop	r30
 154:	9f 91       	pop	r25
 156:	8f 91       	pop	r24
 158:	3f 91       	pop	r19
 15a:	2f 91       	pop	r18
 15c:	0f 90       	pop	r0
 15e:	00 92 5f 00 	sts	0x005F, r0	; 0x80005f <__EEPROM_REGION_LENGTH__+0x7f005f>
 162:	0f 90       	pop	r0
 164:	1f 90       	pop	r1
 166:	18 95       	reti

00000168 <main>:
 168:	cf 93       	push	r28
 16a:	df 93       	push	r29
 16c:	1f 92       	push	r1
 16e:	cd b7       	in	r28, 0x3d	; 61
 170:	dd 27       	eor	r29, r29
 172:	85 e5       	ldi	r24, 0x55	; 85
 174:	90 e0       	ldi	r25, 0x00	; 0
 176:	25 e5       	ldi	r18, 0x55	; 85
 178:	30 e0       	ldi	r19, 0x00	; 0
 17a:	f9 01       	movw	r30, r18
 17c:	20 81       	ld	r18, Z
 17e:	27 7e       	andi	r18, 0xE7	; 231
 180:	fc 01       	movw	r30, r24
 182:	20 83       	st	Z, r18
 184:	85 e5       	ldi	r24, 0x55	; 85
 186:	90 e0       	ldi	r25, 0x00	; 0
 188:	25 e5       	ldi	r18, 0x55	; 85
 18a:	30 e0       	ldi	r19, 0x00	; 0
 18c:	f9 01       	movw	r30, r18
 18e:	20 81       	ld	r18, Z
 190:	20 62       	ori	r18, 0x20	; 32
 192:	fc 01       	movw	r30, r24
 194:	20 83       	st	Z, r18
 196:	17 d3       	rcall	.+1582   	; 0x7c6 <_Z16init_timer_clockv>
 198:	10 92 61 00 	sts	0x0061, r1	; 0x800061 <_edata+0x1>
 19c:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <_edata>
 1a0:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 1a4:	8d 7f       	andi	r24, 0xFD	; 253
 1a6:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 1aa:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 1ae:	8e 7f       	andi	r24, 0xFE	; 254
 1b0:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 1b4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 1b8:	80 62       	ori	r24, 0x20	; 32
 1ba:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 1be:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 1c2:	8a e0       	ldi	r24, 0x0A	; 10
 1c4:	89 83       	std	Y+1, r24	; 0x01
 1c6:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 1ca:	84 60       	ori	r24, 0x04	; 4
 1cc:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 1d0:	78 94       	sei
 1d2:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 1d6:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 1da:	89 2f       	mov	r24, r25
 1dc:	88 1f       	adc	r24, r24
 1de:	88 27       	eor	r24, r24
 1e0:	88 1f       	adc	r24, r24
 1e2:	88 23       	and	r24, r24
 1e4:	51 f1       	breq	.+84     	; 0x23a <main+0xd2>
 1e6:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 1ea:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 1ee:	8f 5f       	subi	r24, 0xFF	; 255
 1f0:	9f 47       	sbci	r25, 0x7F	; 127
 1f2:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
 1f6:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 1fa:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 1fe:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 202:	89 2b       	or	r24, r25
 204:	51 f0       	breq	.+20     	; 0x21a <main+0xb2>
 206:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 20a:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 20e:	8f 5f       	subi	r24, 0xFF	; 255
 210:	9f 47       	sbci	r25, 0x7F	; 127
 212:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 216:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 21a:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 21e:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 222:	89 2b       	or	r24, r25
 224:	51 f0       	breq	.+20     	; 0x23a <main+0xd2>
 226:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 22a:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 22e:	8f 5f       	subi	r24, 0xFF	; 255
 230:	9f 47       	sbci	r25, 0x7F	; 127
 232:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 236:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 23a:	86 e3       	ldi	r24, 0x36	; 54
 23c:	90 e0       	ldi	r25, 0x00	; 0
 23e:	fc 01       	movw	r30, r24
 240:	80 81       	ld	r24, Z
 242:	88 2f       	mov	r24, r24
 244:	90 e0       	ldi	r25, 0x00	; 0
 246:	82 70       	andi	r24, 0x02	; 2
 248:	99 27       	eor	r25, r25
 24a:	21 e0       	ldi	r18, 0x01	; 1
 24c:	89 2b       	or	r24, r25
 24e:	09 f0       	breq	.+2      	; 0x252 <main+0xea>
 250:	20 e0       	ldi	r18, 0x00	; 0
 252:	22 23       	and	r18, r18
 254:	b9 f0       	breq	.+46     	; 0x284 <main+0x11c>
 256:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 25a:	8f 5f       	subi	r24, 0xFF	; 255
 25c:	80 93 62 00 	sts	0x0062, r24	; 0x800062 <scan_button_cnt>
 260:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 264:	85 30       	cpi	r24, 0x05	; 5
 266:	28 f0       	brcs	.+10     	; 0x272 <main+0x10a>
 268:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 26c:	80 64       	ori	r24, 0x40	; 64
 26e:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 272:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 276:	85 32       	cpi	r24, 0x25	; 37
 278:	28 f0       	brcs	.+10     	; 0x284 <main+0x11c>
 27a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 27e:	80 68       	ori	r24, 0x80	; 128
 280:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 284:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 288:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 28c:	89 2b       	or	r24, r25
 28e:	29 f1       	breq	.+74     	; 0x2da <main+0x172>
 290:	20 91 60 00 	lds	r18, 0x0060	; 0x800060 <_edata>
 294:	30 91 61 00 	lds	r19, 0x0061	; 0x800061 <_edata+0x1>
 298:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 29c:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 2a0:	41 e0       	ldi	r20, 0x01	; 1
 2a2:	82 17       	cp	r24, r18
 2a4:	93 07       	cpc	r25, r19
 2a6:	08 f0       	brcs	.+2      	; 0x2aa <main+0x142>
 2a8:	40 e0       	ldi	r20, 0x00	; 0
 2aa:	44 23       	and	r20, r20
 2ac:	b1 f0       	breq	.+44     	; 0x2da <main+0x172>
 2ae:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <f_button_state_flags>
 2b2:	80 e2       	ldi	r24, 0x20	; 32
 2b4:	89 27       	eor	r24, r25
 2b6:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 2ba:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 2be:	88 2f       	mov	r24, r24
 2c0:	90 e0       	ldi	r25, 0x00	; 0
 2c2:	80 72       	andi	r24, 0x20	; 32
 2c4:	99 27       	eor	r25, r25
 2c6:	21 e0       	ldi	r18, 0x01	; 1
 2c8:	89 2b       	or	r24, r25
 2ca:	09 f4       	brne	.+2      	; 0x2ce <main+0x166>
 2cc:	20 e0       	ldi	r18, 0x00	; 0
 2ce:	62 2f       	mov	r22, r18
 2d0:	89 81       	ldd	r24, Y+1	; 0x01
 2d2:	8c d1       	rcall	.+792    	; 0x5ec <_Z8setPortshb>
 2d4:	60 e0       	ldi	r22, 0x00	; 0
 2d6:	89 81       	ldd	r24, Y+1	; 0x01
 2d8:	fb d1       	rcall	.+1014   	; 0x6d0 <_Z10setPeriodshb>
 2da:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 2de:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 2e2:	89 2b       	or	r24, r25
 2e4:	19 f1       	breq	.+70     	; 0x32c <main+0x1c4>
 2e6:	20 91 60 00 	lds	r18, 0x0060	; 0x800060 <_edata>
 2ea:	30 91 61 00 	lds	r19, 0x0061	; 0x800061 <_edata+0x1>
 2ee:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 2f2:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 2f6:	82 17       	cp	r24, r18
 2f8:	93 07       	cpc	r25, r19
 2fa:	50 f4       	brcc	.+20     	; 0x310 <main+0x1a8>
 2fc:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 300:	88 2f       	mov	r24, r24
 302:	90 e0       	ldi	r25, 0x00	; 0
 304:	80 72       	andi	r24, 0x20	; 32
 306:	99 27       	eor	r25, r25
 308:	89 2b       	or	r24, r25
 30a:	11 f0       	breq	.+4      	; 0x310 <main+0x1a8>
 30c:	81 e0       	ldi	r24, 0x01	; 1
 30e:	01 c0       	rjmp	.+2      	; 0x312 <main+0x1aa>
 310:	80 e0       	ldi	r24, 0x00	; 0
 312:	88 23       	and	r24, r24
 314:	59 f0       	breq	.+22     	; 0x32c <main+0x1c4>
 316:	89 81       	ldd	r24, Y+1	; 0x01
 318:	8f 5f       	subi	r24, 0xFF	; 255
 31a:	89 83       	std	Y+1, r24	; 0x01
 31c:	89 81       	ldd	r24, Y+1	; 0x01
 31e:	87 70       	andi	r24, 0x07	; 7
 320:	89 83       	std	Y+1, r24	; 0x01
 322:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 326:	84 60       	ori	r24, 0x04	; 4
 328:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 32c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 330:	88 2f       	mov	r24, r24
 332:	90 e0       	ldi	r25, 0x00	; 0
 334:	83 70       	andi	r24, 0x03	; 3
 336:	99 27       	eor	r25, r25
 338:	81 30       	cpi	r24, 0x01	; 1
 33a:	91 05       	cpc	r25, r1
 33c:	09 f4       	brne	.+2      	; 0x340 <main+0x1d8>
 33e:	b9 c0       	rjmp	.+370    	; 0x4b2 <__LOCK_REGION_LENGTH__+0xb2>
 340:	82 30       	cpi	r24, 0x02	; 2
 342:	91 05       	cpc	r25, r1
 344:	24 f4       	brge	.+8      	; 0x34e <main+0x1e6>
 346:	89 2b       	or	r24, r25
 348:	09 f4       	brne	.+2      	; 0x34c <main+0x1e4>
 34a:	5e c0       	rjmp	.+188    	; 0x408 <__LOCK_REGION_LENGTH__+0x8>
 34c:	1e c1       	rjmp	.+572    	; 0x58a <__LOCK_REGION_LENGTH__+0x18a>
 34e:	82 30       	cpi	r24, 0x02	; 2
 350:	91 05       	cpc	r25, r1
 352:	09 f4       	brne	.+2      	; 0x356 <main+0x1ee>
 354:	c8 c0       	rjmp	.+400    	; 0x4e6 <__LOCK_REGION_LENGTH__+0xe6>
 356:	03 97       	sbiw	r24, 0x03	; 3
 358:	09 f0       	breq	.+2      	; 0x35c <main+0x1f4>
 35a:	17 c1       	rjmp	.+558    	; 0x58a <__LOCK_REGION_LENGTH__+0x18a>
 35c:	85 e5       	ldi	r24, 0x55	; 85
 35e:	90 e0       	ldi	r25, 0x00	; 0
 360:	25 e5       	ldi	r18, 0x55	; 85
 362:	30 e0       	ldi	r19, 0x00	; 0
 364:	f9 01       	movw	r30, r18
 366:	20 81       	ld	r18, Z
 368:	27 7e       	andi	r18, 0xE7	; 231
 36a:	fc 01       	movw	r30, r24
 36c:	20 83       	st	Z, r18
 36e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 372:	88 23       	and	r24, r24
 374:	a4 f4       	brge	.+40     	; 0x39e <main+0x236>
 376:	89 81       	ldd	r24, Y+1	; 0x01
 378:	89 30       	cpi	r24, 0x09	; 9
 37a:	89 f4       	brne	.+34     	; 0x39e <main+0x236>
 37c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 380:	88 2f       	mov	r24, r24
 382:	90 e0       	ldi	r25, 0x00	; 0
 384:	80 71       	andi	r24, 0x10	; 16
 386:	99 27       	eor	r25, r25
 388:	89 2b       	or	r24, r25
 38a:	11 f0       	breq	.+4      	; 0x390 <main+0x228>
 38c:	88 e0       	ldi	r24, 0x08	; 8
 38e:	01 c0       	rjmp	.+2      	; 0x392 <main+0x22a>
 390:	80 e0       	ldi	r24, 0x00	; 0
 392:	89 83       	std	Y+1, r24	; 0x01
 394:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 398:	84 60       	ori	r24, 0x04	; 4
 39a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 39e:	86 e3       	ldi	r24, 0x36	; 54
 3a0:	90 e0       	ldi	r25, 0x00	; 0
 3a2:	fc 01       	movw	r30, r24
 3a4:	80 81       	ld	r24, Z
 3a6:	88 2f       	mov	r24, r24
 3a8:	90 e0       	ldi	r25, 0x00	; 0
 3aa:	82 70       	andi	r24, 0x02	; 2
 3ac:	99 27       	eor	r25, r25
 3ae:	21 e0       	ldi	r18, 0x01	; 1
 3b0:	89 2b       	or	r24, r25
 3b2:	09 f4       	brne	.+2      	; 0x3b6 <main+0x24e>
 3b4:	20 e0       	ldi	r18, 0x00	; 0
 3b6:	22 23       	and	r18, r18
 3b8:	09 f4       	brne	.+2      	; 0x3bc <main+0x254>
 3ba:	ef c0       	rjmp	.+478    	; 0x59a <__LOCK_REGION_LENGTH__+0x19a>
 3bc:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3c0:	88 23       	and	r24, r24
 3c2:	5c f4       	brge	.+22     	; 0x3da <main+0x272>
 3c4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3c8:	8d 7f       	andi	r24, 0xFD	; 253
 3ca:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3ce:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3d2:	8e 7f       	andi	r24, 0xFE	; 254
 3d4:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3d8:	0a c0       	rjmp	.+20     	; 0x3ee <main+0x286>
 3da:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3de:	82 60       	ori	r24, 0x02	; 2
 3e0:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3e4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3e8:	8e 7f       	andi	r24, 0xFE	; 254
 3ea:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3ee:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 3f2:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3f6:	8f 7b       	andi	r24, 0xBF	; 191
 3f8:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3fc:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 400:	8f 77       	andi	r24, 0x7F	; 127
 402:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 406:	c9 c0       	rjmp	.+402    	; 0x59a <__LOCK_REGION_LENGTH__+0x19a>
 408:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 40c:	88 23       	and	r24, r24
 40e:	09 f4       	brne	.+2      	; 0x412 <__LOCK_REGION_LENGTH__+0x12>
 410:	c6 c0       	rjmp	.+396    	; 0x59e <__LOCK_REGION_LENGTH__+0x19e>
 412:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 416:	88 23       	and	r24, r24
 418:	8c f4       	brge	.+34     	; 0x43c <__LOCK_REGION_LENGTH__+0x3c>
 41a:	89 e0       	ldi	r24, 0x09	; 9
 41c:	89 83       	std	Y+1, r24	; 0x01
 41e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 422:	84 60       	ori	r24, 0x04	; 4
 424:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 428:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 42c:	8d 7f       	andi	r24, 0xFD	; 253
 42e:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 432:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 436:	81 60       	ori	r24, 0x01	; 1
 438:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 43c:	86 e3       	ldi	r24, 0x36	; 54
 43e:	90 e0       	ldi	r25, 0x00	; 0
 440:	fc 01       	movw	r30, r24
 442:	80 81       	ld	r24, Z
 444:	88 2f       	mov	r24, r24
 446:	90 e0       	ldi	r25, 0x00	; 0
 448:	82 70       	andi	r24, 0x02	; 2
 44a:	99 27       	eor	r25, r25
 44c:	21 e0       	ldi	r18, 0x01	; 1
 44e:	89 2b       	or	r24, r25
 450:	09 f4       	brne	.+2      	; 0x454 <__LOCK_REGION_LENGTH__+0x54>
 452:	20 e0       	ldi	r18, 0x00	; 0
 454:	22 23       	and	r18, r18
 456:	09 f4       	brne	.+2      	; 0x45a <__LOCK_REGION_LENGTH__+0x5a>
 458:	a2 c0       	rjmp	.+324    	; 0x59e <__LOCK_REGION_LENGTH__+0x19e>
 45a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 45e:	88 2f       	mov	r24, r24
 460:	90 e0       	ldi	r25, 0x00	; 0
 462:	80 74       	andi	r24, 0x40	; 64
 464:	99 27       	eor	r25, r25
 466:	89 2b       	or	r24, r25
 468:	b9 f0       	breq	.+46     	; 0x498 <__LOCK_REGION_LENGTH__+0x98>
 46a:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <f_button_state_flags>
 46e:	80 e1       	ldi	r24, 0x10	; 16
 470:	89 27       	eor	r24, r25
 472:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 476:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 47a:	88 2f       	mov	r24, r24
 47c:	90 e0       	ldi	r25, 0x00	; 0
 47e:	80 71       	andi	r24, 0x10	; 16
 480:	99 27       	eor	r25, r25
 482:	89 2b       	or	r24, r25
 484:	11 f0       	breq	.+4      	; 0x48a <__LOCK_REGION_LENGTH__+0x8a>
 486:	88 e0       	ldi	r24, 0x08	; 8
 488:	01 c0       	rjmp	.+2      	; 0x48c <__LOCK_REGION_LENGTH__+0x8c>
 48a:	80 e0       	ldi	r24, 0x00	; 0
 48c:	89 83       	std	Y+1, r24	; 0x01
 48e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 492:	84 60       	ori	r24, 0x04	; 4
 494:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 498:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 49c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4a0:	8f 7b       	andi	r24, 0xBF	; 191
 4a2:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4a6:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4aa:	8f 77       	andi	r24, 0x7F	; 127
 4ac:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4b0:	76 c0       	rjmp	.+236    	; 0x59e <__LOCK_REGION_LENGTH__+0x19e>
 4b2:	86 e3       	ldi	r24, 0x36	; 54
 4b4:	90 e0       	ldi	r25, 0x00	; 0
 4b6:	fc 01       	movw	r30, r24
 4b8:	80 81       	ld	r24, Z
 4ba:	88 2f       	mov	r24, r24
 4bc:	90 e0       	ldi	r25, 0x00	; 0
 4be:	82 70       	andi	r24, 0x02	; 2
 4c0:	99 27       	eor	r25, r25
 4c2:	21 e0       	ldi	r18, 0x01	; 1
 4c4:	89 2b       	or	r24, r25
 4c6:	09 f4       	brne	.+2      	; 0x4ca <__LOCK_REGION_LENGTH__+0xca>
 4c8:	20 e0       	ldi	r18, 0x00	; 0
 4ca:	22 23       	and	r18, r18
 4cc:	09 f4       	brne	.+2      	; 0x4d0 <__LOCK_REGION_LENGTH__+0xd0>
 4ce:	69 c0       	rjmp	.+210    	; 0x5a2 <__LOCK_REGION_LENGTH__+0x1a2>
 4d0:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4d4:	82 60       	ori	r24, 0x02	; 2
 4d6:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4da:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4de:	8e 7f       	andi	r24, 0xFE	; 254
 4e0:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4e4:	5e c0       	rjmp	.+188    	; 0x5a2 <__LOCK_REGION_LENGTH__+0x1a2>
 4e6:	86 e3       	ldi	r24, 0x36	; 54
 4e8:	90 e0       	ldi	r25, 0x00	; 0
 4ea:	fc 01       	movw	r30, r24
 4ec:	80 81       	ld	r24, Z
 4ee:	88 2f       	mov	r24, r24
 4f0:	90 e0       	ldi	r25, 0x00	; 0
 4f2:	82 70       	andi	r24, 0x02	; 2
 4f4:	99 27       	eor	r25, r25
 4f6:	21 e0       	ldi	r18, 0x01	; 1
 4f8:	89 2b       	or	r24, r25
 4fa:	09 f0       	breq	.+2      	; 0x4fe <__LOCK_REGION_LENGTH__+0xfe>
 4fc:	20 e0       	ldi	r18, 0x00	; 0
 4fe:	22 23       	and	r18, r18
 500:	a1 f0       	breq	.+40     	; 0x52a <__LOCK_REGION_LENGTH__+0x12a>
 502:	85 e5       	ldi	r24, 0x55	; 85
 504:	90 e0       	ldi	r25, 0x00	; 0
 506:	25 e5       	ldi	r18, 0x55	; 85
 508:	30 e0       	ldi	r19, 0x00	; 0
 50a:	f9 01       	movw	r30, r18
 50c:	20 81       	ld	r18, Z
 50e:	27 7e       	andi	r18, 0xE7	; 231
 510:	fc 01       	movw	r30, r24
 512:	20 83       	st	Z, r18
 514:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 518:	82 60       	ori	r24, 0x02	; 2
 51a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 51e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 522:	81 60       	ori	r24, 0x01	; 1
 524:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 528:	3d c0       	rjmp	.+122    	; 0x5a4 <__LOCK_REGION_LENGTH__+0x1a4>
 52a:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 52e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 532:	8f 77       	andi	r24, 0x7F	; 127
 534:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 538:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 53c:	8f 7b       	andi	r24, 0xBF	; 191
 53e:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 542:	89 e0       	ldi	r24, 0x09	; 9
 544:	89 83       	std	Y+1, r24	; 0x01
 546:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 54a:	84 60       	ori	r24, 0x04	; 4
 54c:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 550:	85 e5       	ldi	r24, 0x55	; 85
 552:	90 e0       	ldi	r25, 0x00	; 0
 554:	25 e5       	ldi	r18, 0x55	; 85
 556:	30 e0       	ldi	r19, 0x00	; 0
 558:	f9 01       	movw	r30, r18
 55a:	20 81       	ld	r18, Z
 55c:	27 7e       	andi	r18, 0xE7	; 231
 55e:	20 61       	ori	r18, 0x10	; 16
 560:	fc 01       	movw	r30, r24
 562:	20 83       	st	Z, r18
 564:	8b e5       	ldi	r24, 0x5B	; 91
 566:	90 e0       	ldi	r25, 0x00	; 0
 568:	2b e5       	ldi	r18, 0x5B	; 91
 56a:	30 e0       	ldi	r19, 0x00	; 0
 56c:	f9 01       	movw	r30, r18
 56e:	20 81       	ld	r18, Z
 570:	20 64       	ori	r18, 0x40	; 64
 572:	fc 01       	movw	r30, r24
 574:	20 83       	st	Z, r18
 576:	8a e5       	ldi	r24, 0x5A	; 90
 578:	90 e0       	ldi	r25, 0x00	; 0
 57a:	2a e5       	ldi	r18, 0x5A	; 90
 57c:	30 e0       	ldi	r19, 0x00	; 0
 57e:	f9 01       	movw	r30, r18
 580:	20 81       	ld	r18, Z
 582:	2f 7b       	andi	r18, 0xBF	; 191
 584:	fc 01       	movw	r30, r24
 586:	20 83       	st	Z, r18
 588:	0d c0       	rjmp	.+26     	; 0x5a4 <__LOCK_REGION_LENGTH__+0x1a4>
 58a:	8b e0       	ldi	r24, 0x0B	; 11
 58c:	89 83       	std	Y+1, r24	; 0x01
 58e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 592:	84 60       	ori	r24, 0x04	; 4
 594:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 598:	05 c0       	rjmp	.+10     	; 0x5a4 <__LOCK_REGION_LENGTH__+0x1a4>
 59a:	00 00       	nop
 59c:	03 c0       	rjmp	.+6      	; 0x5a4 <__LOCK_REGION_LENGTH__+0x1a4>
 59e:	00 00       	nop
 5a0:	01 c0       	rjmp	.+2      	; 0x5a4 <__LOCK_REGION_LENGTH__+0x1a4>
 5a2:	00 00       	nop
 5a4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5a8:	88 2f       	mov	r24, r24
 5aa:	90 e0       	ldi	r25, 0x00	; 0
 5ac:	84 70       	andi	r24, 0x04	; 4
 5ae:	99 27       	eor	r25, r25
 5b0:	89 2b       	or	r24, r25
 5b2:	d1 f0       	breq	.+52     	; 0x5e8 <__LOCK_REGION_LENGTH__+0x1e8>
 5b4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5b8:	8b 7f       	andi	r24, 0xFB	; 251
 5ba:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 5be:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5c2:	80 62       	ori	r24, 0x20	; 32
 5c4:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 5c8:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5cc:	88 2f       	mov	r24, r24
 5ce:	90 e0       	ldi	r25, 0x00	; 0
 5d0:	80 72       	andi	r24, 0x20	; 32
 5d2:	99 27       	eor	r25, r25
 5d4:	21 e0       	ldi	r18, 0x01	; 1
 5d6:	89 2b       	or	r24, r25
 5d8:	09 f4       	brne	.+2      	; 0x5dc <__LOCK_REGION_LENGTH__+0x1dc>
 5da:	20 e0       	ldi	r18, 0x00	; 0
 5dc:	62 2f       	mov	r22, r18
 5de:	89 81       	ldd	r24, Y+1	; 0x01
 5e0:	05 d0       	rcall	.+10     	; 0x5ec <_Z8setPortshb>
 5e2:	61 e0       	ldi	r22, 0x01	; 1
 5e4:	89 81       	ldd	r24, Y+1	; 0x01
 5e6:	74 d0       	rcall	.+232    	; 0x6d0 <_Z10setPeriodshb>
 5e8:	88 95       	sleep
 5ea:	f3 cd       	rjmp	.-1050   	; 0x1d2 <main+0x6a>

000005ec <_Z8setPortshb>:
 5ec:	cf 93       	push	r28
 5ee:	df 93       	push	r29
 5f0:	cd b7       	in	r28, 0x3d	; 61
 5f2:	dd 27       	eor	r29, r29
 5f4:	cc 50       	subi	r28, 0x0C	; 12
 5f6:	cd bf       	out	0x3d, r28	; 61
 5f8:	8b 87       	std	Y+11, r24	; 0x0b
 5fa:	6c 87       	std	Y+12, r22	; 0x0c
 5fc:	87 e3       	ldi	r24, 0x37	; 55
 5fe:	90 e0       	ldi	r25, 0x00	; 0
 600:	fc 01       	movw	r30, r24
 602:	10 82       	st	Z, r1
 604:	88 e3       	ldi	r24, 0x38	; 56
 606:	90 e0       	ldi	r25, 0x00	; 0
 608:	fc 01       	movw	r30, r24
 60a:	10 82       	st	Z, r1
 60c:	8b 85       	ldd	r24, Y+11	; 0x0b
 60e:	88 2f       	mov	r24, r24
 610:	90 e0       	ldi	r25, 0x00	; 0
 612:	88 0f       	add	r24, r24
 614:	99 1f       	adc	r25, r25
 616:	88 0f       	add	r24, r24
 618:	99 1f       	adc	r25, r25
 61a:	88 0f       	add	r24, r24
 61c:	99 1f       	adc	r25, r25
 61e:	9c 01       	movw	r18, r24
 620:	2c 5e       	subi	r18, 0xEC	; 236
 622:	3f 4f       	sbci	r19, 0xFF	; 255
 624:	8c 85       	ldd	r24, Y+12	; 0x0c
 626:	88 23       	and	r24, r24
 628:	19 f0       	breq	.+6      	; 0x630 <_Z8setPortshb+0x44>
 62a:	80 e0       	ldi	r24, 0x00	; 0
 62c:	90 e0       	ldi	r25, 0x00	; 0
 62e:	02 c0       	rjmp	.+4      	; 0x634 <_Z8setPortshb+0x48>
 630:	82 e0       	ldi	r24, 0x02	; 2
 632:	90 e0       	ldi	r25, 0x00	; 0
 634:	82 0f       	add	r24, r18
 636:	93 1f       	adc	r25, r19
 638:	9a 83       	std	Y+2, r25	; 0x02
 63a:	89 83       	std	Y+1, r24	; 0x01
 63c:	89 81       	ldd	r24, Y+1	; 0x01
 63e:	9a 81       	ldd	r25, Y+2	; 0x02
 640:	fc 01       	movw	r30, r24
 642:	84 91       	lpm	r24, Z
 644:	8b 83       	std	Y+3, r24	; 0x03
 646:	8b 81       	ldd	r24, Y+3	; 0x03
 648:	8c 83       	std	Y+4, r24	; 0x04
 64a:	8c 81       	ldd	r24, Y+4	; 0x04
 64c:	8d 7f       	andi	r24, 0xFD	; 253
 64e:	8c 83       	std	Y+4, r24	; 0x04
 650:	87 e3       	ldi	r24, 0x37	; 55
 652:	90 e0       	ldi	r25, 0x00	; 0
 654:	2c 81       	ldd	r18, Y+4	; 0x04
 656:	fc 01       	movw	r30, r24
 658:	20 83       	st	Z, r18
 65a:	8c 85       	ldd	r24, Y+12	; 0x0c
 65c:	88 23       	and	r24, r24
 65e:	a9 f0       	breq	.+42     	; 0x68a <_Z8setPortshb+0x9e>
 660:	8b 85       	ldd	r24, Y+11	; 0x0b
 662:	88 2f       	mov	r24, r24
 664:	90 e0       	ldi	r25, 0x00	; 0
 666:	88 0f       	add	r24, r24
 668:	99 1f       	adc	r25, r25
 66a:	88 0f       	add	r24, r24
 66c:	99 1f       	adc	r25, r25
 66e:	88 0f       	add	r24, r24
 670:	99 1f       	adc	r25, r25
 672:	01 96       	adiw	r24, 0x01	; 1
 674:	8c 5e       	subi	r24, 0xEC	; 236
 676:	9f 4f       	sbci	r25, 0xFF	; 255
 678:	9e 83       	std	Y+6, r25	; 0x06
 67a:	8d 83       	std	Y+5, r24	; 0x05
 67c:	8d 81       	ldd	r24, Y+5	; 0x05
 67e:	9e 81       	ldd	r25, Y+6	; 0x06
 680:	fc 01       	movw	r30, r24
 682:	84 91       	lpm	r24, Z
 684:	8f 83       	std	Y+7, r24	; 0x07
 686:	8f 81       	ldd	r24, Y+7	; 0x07
 688:	14 c0       	rjmp	.+40     	; 0x6b2 <_Z8setPortshb+0xc6>
 68a:	8b 85       	ldd	r24, Y+11	; 0x0b
 68c:	88 2f       	mov	r24, r24
 68e:	90 e0       	ldi	r25, 0x00	; 0
 690:	88 0f       	add	r24, r24
 692:	99 1f       	adc	r25, r25
 694:	88 0f       	add	r24, r24
 696:	99 1f       	adc	r25, r25
 698:	88 0f       	add	r24, r24
 69a:	99 1f       	adc	r25, r25
 69c:	03 96       	adiw	r24, 0x03	; 3
 69e:	8c 5e       	subi	r24, 0xEC	; 236
 6a0:	9f 4f       	sbci	r25, 0xFF	; 255
 6a2:	99 87       	std	Y+9, r25	; 0x09
 6a4:	88 87       	std	Y+8, r24	; 0x08
 6a6:	88 85       	ldd	r24, Y+8	; 0x08
 6a8:	99 85       	ldd	r25, Y+9	; 0x09
 6aa:	fc 01       	movw	r30, r24
 6ac:	84 91       	lpm	r24, Z
 6ae:	8a 87       	std	Y+10, r24	; 0x0a
 6b0:	8a 85       	ldd	r24, Y+10	; 0x0a
 6b2:	8c 83       	std	Y+4, r24	; 0x04
 6b4:	8c 81       	ldd	r24, Y+4	; 0x04
 6b6:	82 60       	ori	r24, 0x02	; 2
 6b8:	8c 83       	std	Y+4, r24	; 0x04
 6ba:	88 e3       	ldi	r24, 0x38	; 56
 6bc:	90 e0       	ldi	r25, 0x00	; 0
 6be:	2c 81       	ldd	r18, Y+4	; 0x04
 6c0:	fc 01       	movw	r30, r24
 6c2:	20 83       	st	Z, r18
 6c4:	00 00       	nop
 6c6:	c4 5f       	subi	r28, 0xF4	; 244
 6c8:	cd bf       	out	0x3d, r28	; 61
 6ca:	df 91       	pop	r29
 6cc:	cf 91       	pop	r28
 6ce:	08 95       	ret

000006d0 <_Z10setPeriodshb>:
 6d0:	cf 93       	push	r28
 6d2:	df 93       	push	r29
 6d4:	cd b7       	in	r28, 0x3d	; 61
 6d6:	dd 27       	eor	r29, r29
 6d8:	ca 50       	subi	r28, 0x0A	; 10
 6da:	cd bf       	out	0x3d, r28	; 61
 6dc:	89 87       	std	Y+9, r24	; 0x09
 6de:	6a 87       	std	Y+10, r22	; 0x0a
 6e0:	89 85       	ldd	r24, Y+9	; 0x09
 6e2:	88 2f       	mov	r24, r24
 6e4:	90 e0       	ldi	r25, 0x00	; 0
 6e6:	88 0f       	add	r24, r24
 6e8:	99 1f       	adc	r25, r25
 6ea:	88 0f       	add	r24, r24
 6ec:	99 1f       	adc	r25, r25
 6ee:	88 0f       	add	r24, r24
 6f0:	99 1f       	adc	r25, r25
 6f2:	04 96       	adiw	r24, 0x04	; 4
 6f4:	8c 5e       	subi	r24, 0xEC	; 236
 6f6:	9f 4f       	sbci	r25, 0xFF	; 255
 6f8:	9a 83       	std	Y+2, r25	; 0x02
 6fa:	89 83       	std	Y+1, r24	; 0x01
 6fc:	89 81       	ldd	r24, Y+1	; 0x01
 6fe:	9a 81       	ldd	r25, Y+2	; 0x02
 700:	fc 01       	movw	r30, r24
 702:	25 91       	lpm	r18, Z+
 704:	34 91       	lpm	r19, Z
 706:	cf 01       	movw	r24, r30
 708:	3c 83       	std	Y+4, r19	; 0x04
 70a:	2b 83       	std	Y+3, r18	; 0x03
 70c:	9a 83       	std	Y+2, r25	; 0x02
 70e:	89 83       	std	Y+1, r24	; 0x01
 710:	8b 81       	ldd	r24, Y+3	; 0x03
 712:	9c 81       	ldd	r25, Y+4	; 0x04
 714:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 718:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 71c:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 720:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 724:	89 2b       	or	r24, r25
 726:	59 f0       	breq	.+22     	; 0x73e <_Z10setPeriodshb+0x6e>
 728:	20 91 63 00 	lds	r18, 0x0063	; 0x800063 <tl_flash_end>
 72c:	30 91 64 00 	lds	r19, 0x0064	; 0x800064 <tl_flash_end+0x1>
 730:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 734:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 738:	82 0f       	add	r24, r18
 73a:	93 1f       	adc	r25, r19
 73c:	02 c0       	rjmp	.+4      	; 0x742 <_Z10setPeriodshb+0x72>
 73e:	80 e0       	ldi	r24, 0x00	; 0
 740:	90 e0       	ldi	r25, 0x00	; 0
 742:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 746:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 74a:	8a 85       	ldd	r24, Y+10	; 0x0a
 74c:	88 23       	and	r24, r24
 74e:	a9 f1       	breq	.+106    	; 0x7ba <_Z10setPeriodshb+0xea>
 750:	89 85       	ldd	r24, Y+9	; 0x09
 752:	88 2f       	mov	r24, r24
 754:	90 e0       	ldi	r25, 0x00	; 0
 756:	88 0f       	add	r24, r24
 758:	99 1f       	adc	r25, r25
 75a:	88 0f       	add	r24, r24
 75c:	99 1f       	adc	r25, r25
 75e:	88 0f       	add	r24, r24
 760:	99 1f       	adc	r25, r25
 762:	06 96       	adiw	r24, 0x06	; 6
 764:	8c 5e       	subi	r24, 0xEC	; 236
 766:	9f 4f       	sbci	r25, 0xFF	; 255
 768:	9e 83       	std	Y+6, r25	; 0x06
 76a:	8d 83       	std	Y+5, r24	; 0x05
 76c:	8d 81       	ldd	r24, Y+5	; 0x05
 76e:	9e 81       	ldd	r25, Y+6	; 0x06
 770:	fc 01       	movw	r30, r24
 772:	25 91       	lpm	r18, Z+
 774:	34 91       	lpm	r19, Z
 776:	cf 01       	movw	r24, r30
 778:	38 87       	std	Y+8, r19	; 0x08
 77a:	2f 83       	std	Y+7, r18	; 0x07
 77c:	9e 83       	std	Y+6, r25	; 0x06
 77e:	8d 83       	std	Y+5, r24	; 0x05
 780:	8f 81       	ldd	r24, Y+7	; 0x07
 782:	98 85       	ldd	r25, Y+8	; 0x08
 784:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 788:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 78c:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 790:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 794:	89 2b       	or	r24, r25
 796:	59 f0       	breq	.+22     	; 0x7ae <_Z10setPeriodshb+0xde>
 798:	20 91 65 00 	lds	r18, 0x0065	; 0x800065 <tl_signal_end>
 79c:	30 91 66 00 	lds	r19, 0x0066	; 0x800066 <tl_signal_end+0x1>
 7a0:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 7a4:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 7a8:	82 0f       	add	r24, r18
 7aa:	93 1f       	adc	r25, r19
 7ac:	02 c0       	rjmp	.+4      	; 0x7b2 <_Z10setPeriodshb+0xe2>
 7ae:	80 e0       	ldi	r24, 0x00	; 0
 7b0:	90 e0       	ldi	r25, 0x00	; 0
 7b2:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 7b6:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 7ba:	00 00       	nop
 7bc:	c6 5f       	subi	r28, 0xF6	; 246
 7be:	cd bf       	out	0x3d, r28	; 61
 7c0:	df 91       	pop	r29
 7c2:	cf 91       	pop	r28
 7c4:	08 95       	ret

000007c6 <_Z16init_timer_clockv>:
 7c6:	cf 93       	push	r28
 7c8:	df 93       	push	r29
 7ca:	cd b7       	in	r28, 0x3d	; 61
 7cc:	dd 27       	eor	r29, r29
 7ce:	83 e5       	ldi	r24, 0x53	; 83
 7d0:	90 e0       	ldi	r25, 0x00	; 0
 7d2:	25 e0       	ldi	r18, 0x05	; 5
 7d4:	fc 01       	movw	r30, r24
 7d6:	20 83       	st	Z, r18
 7d8:	89 e5       	ldi	r24, 0x59	; 89
 7da:	90 e0       	ldi	r25, 0x00	; 0
 7dc:	29 e5       	ldi	r18, 0x59	; 89
 7de:	30 e0       	ldi	r19, 0x00	; 0
 7e0:	f9 01       	movw	r30, r18
 7e2:	20 81       	ld	r18, Z
 7e4:	22 60       	ori	r18, 0x02	; 2
 7e6:	fc 01       	movw	r30, r24
 7e8:	20 83       	st	Z, r18
 7ea:	00 00       	nop
 7ec:	df 91       	pop	r29
 7ee:	cf 91       	pop	r28
 7f0:	08 95       	ret

000007f2 <_exit>:
 7f2:	f8 94       	cli

000007f4 <__stop_program>:
 7f4:	ff cf       	rjmp	.-2      	; 0x7f4 <__stop_program>

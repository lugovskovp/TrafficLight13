
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
  8e:	fe c3       	rjmp	.+2044   	; 0x88c <_exit>

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
 196:	64 d3       	rcall	.+1736   	; 0x860 <_Z16init_timer_clockv>
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
 1c2:	85 e0       	ldi	r24, 0x05	; 5
 1c4:	90 e0       	ldi	r25, 0x00	; 0
 1c6:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 1ca:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 1ce:	8a e0       	ldi	r24, 0x0A	; 10
 1d0:	89 83       	std	Y+1, r24	; 0x01
 1d2:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 1d6:	84 60       	ori	r24, 0x04	; 4
 1d8:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 1dc:	78 94       	sei
 1de:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 1e2:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 1e6:	89 2f       	mov	r24, r25
 1e8:	88 1f       	adc	r24, r24
 1ea:	88 27       	eor	r24, r24
 1ec:	88 1f       	adc	r24, r24
 1ee:	88 23       	and	r24, r24
 1f0:	e1 f1       	breq	.+120    	; 0x26a <main+0x102>
 1f2:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 1f6:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 1fa:	8f 5f       	subi	r24, 0xFF	; 255
 1fc:	9f 47       	sbci	r25, 0x7F	; 127
 1fe:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
 202:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 206:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 20a:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 20e:	89 2b       	or	r24, r25
 210:	99 f0       	breq	.+38     	; 0x238 <main+0xd0>
 212:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 216:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 21a:	8f 5f       	subi	r24, 0xFF	; 255
 21c:	9f 47       	sbci	r25, 0x7F	; 127
 21e:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 222:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 226:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 22a:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 22e:	01 97       	sbiw	r24, 0x01	; 1
 230:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 234:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 238:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 23c:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 240:	89 2b       	or	r24, r25
 242:	99 f0       	breq	.+38     	; 0x26a <main+0x102>
 244:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 248:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 24c:	8f 5f       	subi	r24, 0xFF	; 255
 24e:	9f 47       	sbci	r25, 0x7F	; 127
 250:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 254:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 258:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 25c:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 260:	01 96       	adiw	r24, 0x01	; 1
 262:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 266:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 26a:	86 e3       	ldi	r24, 0x36	; 54
 26c:	90 e0       	ldi	r25, 0x00	; 0
 26e:	fc 01       	movw	r30, r24
 270:	80 81       	ld	r24, Z
 272:	88 2f       	mov	r24, r24
 274:	90 e0       	ldi	r25, 0x00	; 0
 276:	82 70       	andi	r24, 0x02	; 2
 278:	99 27       	eor	r25, r25
 27a:	21 e0       	ldi	r18, 0x01	; 1
 27c:	89 2b       	or	r24, r25
 27e:	09 f0       	breq	.+2      	; 0x282 <main+0x11a>
 280:	20 e0       	ldi	r18, 0x00	; 0
 282:	22 23       	and	r18, r18
 284:	39 f1       	breq	.+78     	; 0x2d4 <main+0x16c>
 286:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 28a:	8f 5f       	subi	r24, 0xFF	; 255
 28c:	80 93 62 00 	sts	0x0062, r24	; 0x800062 <scan_button_cnt>
 290:	20 91 68 00 	lds	r18, 0x0068	; 0x800068 <__bss_end>
 294:	30 91 69 00 	lds	r19, 0x0069	; 0x800069 <__bss_end+0x1>
 298:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 29c:	88 2f       	mov	r24, r24
 29e:	90 e0       	ldi	r25, 0x00	; 0
 2a0:	a9 01       	movw	r20, r18
 2a2:	48 1b       	sub	r20, r24
 2a4:	59 0b       	sbc	r21, r25
 2a6:	ca 01       	movw	r24, r20
 2a8:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 2ac:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 2b0:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 2b4:	85 30       	cpi	r24, 0x05	; 5
 2b6:	28 f0       	brcs	.+10     	; 0x2c2 <main+0x15a>
 2b8:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 2bc:	80 64       	ori	r24, 0x40	; 64
 2be:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 2c2:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 2c6:	85 32       	cpi	r24, 0x25	; 37
 2c8:	28 f0       	brcs	.+10     	; 0x2d4 <main+0x16c>
 2ca:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 2ce:	80 68       	ori	r24, 0x80	; 128
 2d0:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 2d4:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 2d8:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 2dc:	89 2b       	or	r24, r25
 2de:	29 f1       	breq	.+74     	; 0x32a <main+0x1c2>
 2e0:	20 91 60 00 	lds	r18, 0x0060	; 0x800060 <_edata>
 2e4:	30 91 61 00 	lds	r19, 0x0061	; 0x800061 <_edata+0x1>
 2e8:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 2ec:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 2f0:	41 e0       	ldi	r20, 0x01	; 1
 2f2:	82 17       	cp	r24, r18
 2f4:	93 07       	cpc	r25, r19
 2f6:	08 f0       	brcs	.+2      	; 0x2fa <main+0x192>
 2f8:	40 e0       	ldi	r20, 0x00	; 0
 2fa:	44 23       	and	r20, r20
 2fc:	b1 f0       	breq	.+44     	; 0x32a <main+0x1c2>
 2fe:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <f_button_state_flags>
 302:	80 e2       	ldi	r24, 0x20	; 32
 304:	89 27       	eor	r24, r25
 306:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 30a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 30e:	88 2f       	mov	r24, r24
 310:	90 e0       	ldi	r25, 0x00	; 0
 312:	80 72       	andi	r24, 0x20	; 32
 314:	99 27       	eor	r25, r25
 316:	21 e0       	ldi	r18, 0x01	; 1
 318:	89 2b       	or	r24, r25
 31a:	09 f4       	brne	.+2      	; 0x31e <main+0x1b6>
 31c:	20 e0       	ldi	r18, 0x00	; 0
 31e:	62 2f       	mov	r22, r18
 320:	89 81       	ldd	r24, Y+1	; 0x01
 322:	b1 d1       	rcall	.+866    	; 0x686 <_Z8setPortshb>
 324:	60 e0       	ldi	r22, 0x00	; 0
 326:	89 81       	ldd	r24, Y+1	; 0x01
 328:	20 d2       	rcall	.+1088   	; 0x76a <_Z10setPeriodshb>
 32a:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 32e:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 332:	89 2b       	or	r24, r25
 334:	19 f1       	breq	.+70     	; 0x37c <main+0x214>
 336:	20 91 60 00 	lds	r18, 0x0060	; 0x800060 <_edata>
 33a:	30 91 61 00 	lds	r19, 0x0061	; 0x800061 <_edata+0x1>
 33e:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 342:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 346:	82 17       	cp	r24, r18
 348:	93 07       	cpc	r25, r19
 34a:	50 f4       	brcc	.+20     	; 0x360 <main+0x1f8>
 34c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 350:	88 2f       	mov	r24, r24
 352:	90 e0       	ldi	r25, 0x00	; 0
 354:	80 72       	andi	r24, 0x20	; 32
 356:	99 27       	eor	r25, r25
 358:	89 2b       	or	r24, r25
 35a:	11 f0       	breq	.+4      	; 0x360 <main+0x1f8>
 35c:	81 e0       	ldi	r24, 0x01	; 1
 35e:	01 c0       	rjmp	.+2      	; 0x362 <main+0x1fa>
 360:	80 e0       	ldi	r24, 0x00	; 0
 362:	88 23       	and	r24, r24
 364:	59 f0       	breq	.+22     	; 0x37c <main+0x214>
 366:	89 81       	ldd	r24, Y+1	; 0x01
 368:	8f 5f       	subi	r24, 0xFF	; 255
 36a:	89 83       	std	Y+1, r24	; 0x01
 36c:	89 81       	ldd	r24, Y+1	; 0x01
 36e:	87 70       	andi	r24, 0x07	; 7
 370:	89 83       	std	Y+1, r24	; 0x01
 372:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 376:	84 60       	ori	r24, 0x04	; 4
 378:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 37c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 380:	88 2f       	mov	r24, r24
 382:	90 e0       	ldi	r25, 0x00	; 0
 384:	83 70       	andi	r24, 0x03	; 3
 386:	99 27       	eor	r25, r25
 388:	81 30       	cpi	r24, 0x01	; 1
 38a:	91 05       	cpc	r25, r1
 38c:	09 f4       	brne	.+2      	; 0x390 <main+0x228>
 38e:	c6 c0       	rjmp	.+396    	; 0x51c <__LOCK_REGION_LENGTH__+0x11c>
 390:	82 30       	cpi	r24, 0x02	; 2
 392:	91 05       	cpc	r25, r1
 394:	24 f4       	brge	.+8      	; 0x39e <main+0x236>
 396:	89 2b       	or	r24, r25
 398:	09 f4       	brne	.+2      	; 0x39c <main+0x234>
 39a:	6b c0       	rjmp	.+214    	; 0x472 <__LOCK_REGION_LENGTH__+0x72>
 39c:	31 c1       	rjmp	.+610    	; 0x600 <__LOCK_REGION_LENGTH__+0x200>
 39e:	82 30       	cpi	r24, 0x02	; 2
 3a0:	91 05       	cpc	r25, r1
 3a2:	09 f4       	brne	.+2      	; 0x3a6 <main+0x23e>
 3a4:	d5 c0       	rjmp	.+426    	; 0x550 <__LOCK_REGION_LENGTH__+0x150>
 3a6:	03 97       	sbiw	r24, 0x03	; 3
 3a8:	09 f0       	breq	.+2      	; 0x3ac <main+0x244>
 3aa:	2a c1       	rjmp	.+596    	; 0x600 <__LOCK_REGION_LENGTH__+0x200>
 3ac:	85 e5       	ldi	r24, 0x55	; 85
 3ae:	90 e0       	ldi	r25, 0x00	; 0
 3b0:	25 e5       	ldi	r18, 0x55	; 85
 3b2:	30 e0       	ldi	r19, 0x00	; 0
 3b4:	f9 01       	movw	r30, r18
 3b6:	20 81       	ld	r18, Z
 3b8:	27 7e       	andi	r18, 0xE7	; 231
 3ba:	fc 01       	movw	r30, r24
 3bc:	20 83       	st	Z, r18
 3be:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3c2:	88 23       	and	r24, r24
 3c4:	0c f5       	brge	.+66     	; 0x408 <__LOCK_REGION_LENGTH__+0x8>
 3c6:	89 81       	ldd	r24, Y+1	; 0x01
 3c8:	89 30       	cpi	r24, 0x09	; 9
 3ca:	f1 f4       	brne	.+60     	; 0x408 <__LOCK_REGION_LENGTH__+0x8>
 3cc:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3d0:	88 2f       	mov	r24, r24
 3d2:	90 e0       	ldi	r25, 0x00	; 0
 3d4:	80 71       	andi	r24, 0x10	; 16
 3d6:	99 27       	eor	r25, r25
 3d8:	89 2b       	or	r24, r25
 3da:	11 f0       	breq	.+4      	; 0x3e0 <main+0x278>
 3dc:	88 e0       	ldi	r24, 0x08	; 8
 3de:	01 c0       	rjmp	.+2      	; 0x3e2 <main+0x27a>
 3e0:	80 e0       	ldi	r24, 0x00	; 0
 3e2:	89 83       	std	Y+1, r24	; 0x01
 3e4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 3e8:	84 60       	ori	r24, 0x04	; 4
 3ea:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 3ee:	89 81       	ldd	r24, Y+1	; 0x01
 3f0:	28 2f       	mov	r18, r24
 3f2:	30 e0       	ldi	r19, 0x00	; 0
 3f4:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 3f8:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 3fc:	82 2b       	or	r24, r18
 3fe:	93 2b       	or	r25, r19
 400:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 404:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 408:	86 e3       	ldi	r24, 0x36	; 54
 40a:	90 e0       	ldi	r25, 0x00	; 0
 40c:	fc 01       	movw	r30, r24
 40e:	80 81       	ld	r24, Z
 410:	88 2f       	mov	r24, r24
 412:	90 e0       	ldi	r25, 0x00	; 0
 414:	82 70       	andi	r24, 0x02	; 2
 416:	99 27       	eor	r25, r25
 418:	21 e0       	ldi	r18, 0x01	; 1
 41a:	89 2b       	or	r24, r25
 41c:	09 f4       	brne	.+2      	; 0x420 <__LOCK_REGION_LENGTH__+0x20>
 41e:	20 e0       	ldi	r18, 0x00	; 0
 420:	22 23       	and	r18, r18
 422:	09 f4       	brne	.+2      	; 0x426 <__LOCK_REGION_LENGTH__+0x26>
 424:	fd c0       	rjmp	.+506    	; 0x620 <__LOCK_REGION_LENGTH__+0x220>
 426:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 42a:	88 23       	and	r24, r24
 42c:	5c f4       	brge	.+22     	; 0x444 <__LOCK_REGION_LENGTH__+0x44>
 42e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 432:	8d 7f       	andi	r24, 0xFD	; 253
 434:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 438:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 43c:	8e 7f       	andi	r24, 0xFE	; 254
 43e:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 442:	0a c0       	rjmp	.+20     	; 0x458 <__LOCK_REGION_LENGTH__+0x58>
 444:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 448:	82 60       	ori	r24, 0x02	; 2
 44a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 44e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 452:	8e 7f       	andi	r24, 0xFE	; 254
 454:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 458:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 45c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 460:	8f 7b       	andi	r24, 0xBF	; 191
 462:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 466:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 46a:	8f 77       	andi	r24, 0x7F	; 127
 46c:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 470:	d7 c0       	rjmp	.+430    	; 0x620 <__LOCK_REGION_LENGTH__+0x220>
 472:	80 91 62 00 	lds	r24, 0x0062	; 0x800062 <scan_button_cnt>
 476:	88 23       	and	r24, r24
 478:	09 f4       	brne	.+2      	; 0x47c <__LOCK_REGION_LENGTH__+0x7c>
 47a:	d4 c0       	rjmp	.+424    	; 0x624 <__LOCK_REGION_LENGTH__+0x224>
 47c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 480:	88 23       	and	r24, r24
 482:	8c f4       	brge	.+34     	; 0x4a6 <__LOCK_REGION_LENGTH__+0xa6>
 484:	89 e0       	ldi	r24, 0x09	; 9
 486:	89 83       	std	Y+1, r24	; 0x01
 488:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 48c:	84 60       	ori	r24, 0x04	; 4
 48e:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 492:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 496:	8d 7f       	andi	r24, 0xFD	; 253
 498:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 49c:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4a0:	81 60       	ori	r24, 0x01	; 1
 4a2:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4a6:	86 e3       	ldi	r24, 0x36	; 54
 4a8:	90 e0       	ldi	r25, 0x00	; 0
 4aa:	fc 01       	movw	r30, r24
 4ac:	80 81       	ld	r24, Z
 4ae:	88 2f       	mov	r24, r24
 4b0:	90 e0       	ldi	r25, 0x00	; 0
 4b2:	82 70       	andi	r24, 0x02	; 2
 4b4:	99 27       	eor	r25, r25
 4b6:	21 e0       	ldi	r18, 0x01	; 1
 4b8:	89 2b       	or	r24, r25
 4ba:	09 f4       	brne	.+2      	; 0x4be <__LOCK_REGION_LENGTH__+0xbe>
 4bc:	20 e0       	ldi	r18, 0x00	; 0
 4be:	22 23       	and	r18, r18
 4c0:	09 f4       	brne	.+2      	; 0x4c4 <__LOCK_REGION_LENGTH__+0xc4>
 4c2:	b0 c0       	rjmp	.+352    	; 0x624 <__LOCK_REGION_LENGTH__+0x224>
 4c4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4c8:	88 2f       	mov	r24, r24
 4ca:	90 e0       	ldi	r25, 0x00	; 0
 4cc:	80 74       	andi	r24, 0x40	; 64
 4ce:	99 27       	eor	r25, r25
 4d0:	89 2b       	or	r24, r25
 4d2:	b9 f0       	breq	.+46     	; 0x502 <__LOCK_REGION_LENGTH__+0x102>
 4d4:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <f_button_state_flags>
 4d8:	80 e1       	ldi	r24, 0x10	; 16
 4da:	89 27       	eor	r24, r25
 4dc:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 4e0:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4e4:	88 2f       	mov	r24, r24
 4e6:	90 e0       	ldi	r25, 0x00	; 0
 4e8:	80 71       	andi	r24, 0x10	; 16
 4ea:	99 27       	eor	r25, r25
 4ec:	89 2b       	or	r24, r25
 4ee:	11 f0       	breq	.+4      	; 0x4f4 <__LOCK_REGION_LENGTH__+0xf4>
 4f0:	88 e0       	ldi	r24, 0x08	; 8
 4f2:	01 c0       	rjmp	.+2      	; 0x4f6 <__LOCK_REGION_LENGTH__+0xf6>
 4f4:	80 e0       	ldi	r24, 0x00	; 0
 4f6:	89 83       	std	Y+1, r24	; 0x01
 4f8:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 4fc:	84 60       	ori	r24, 0x04	; 4
 4fe:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 502:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 506:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 50a:	8f 7b       	andi	r24, 0xBF	; 191
 50c:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 510:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 514:	8f 77       	andi	r24, 0x7F	; 127
 516:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 51a:	84 c0       	rjmp	.+264    	; 0x624 <__LOCK_REGION_LENGTH__+0x224>
 51c:	86 e3       	ldi	r24, 0x36	; 54
 51e:	90 e0       	ldi	r25, 0x00	; 0
 520:	fc 01       	movw	r30, r24
 522:	80 81       	ld	r24, Z
 524:	88 2f       	mov	r24, r24
 526:	90 e0       	ldi	r25, 0x00	; 0
 528:	82 70       	andi	r24, 0x02	; 2
 52a:	99 27       	eor	r25, r25
 52c:	21 e0       	ldi	r18, 0x01	; 1
 52e:	89 2b       	or	r24, r25
 530:	09 f4       	brne	.+2      	; 0x534 <__LOCK_REGION_LENGTH__+0x134>
 532:	20 e0       	ldi	r18, 0x00	; 0
 534:	22 23       	and	r18, r18
 536:	09 f4       	brne	.+2      	; 0x53a <__LOCK_REGION_LENGTH__+0x13a>
 538:	77 c0       	rjmp	.+238    	; 0x628 <__LOCK_REGION_LENGTH__+0x228>
 53a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 53e:	82 60       	ori	r24, 0x02	; 2
 540:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 544:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 548:	8e 7f       	andi	r24, 0xFE	; 254
 54a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 54e:	6c c0       	rjmp	.+216    	; 0x628 <__LOCK_REGION_LENGTH__+0x228>
 550:	86 e3       	ldi	r24, 0x36	; 54
 552:	90 e0       	ldi	r25, 0x00	; 0
 554:	fc 01       	movw	r30, r24
 556:	80 81       	ld	r24, Z
 558:	88 2f       	mov	r24, r24
 55a:	90 e0       	ldi	r25, 0x00	; 0
 55c:	82 70       	andi	r24, 0x02	; 2
 55e:	99 27       	eor	r25, r25
 560:	21 e0       	ldi	r18, 0x01	; 1
 562:	89 2b       	or	r24, r25
 564:	09 f0       	breq	.+2      	; 0x568 <__LOCK_REGION_LENGTH__+0x168>
 566:	20 e0       	ldi	r18, 0x00	; 0
 568:	22 23       	and	r18, r18
 56a:	d1 f0       	breq	.+52     	; 0x5a0 <__LOCK_REGION_LENGTH__+0x1a0>
 56c:	85 e5       	ldi	r24, 0x55	; 85
 56e:	90 e0       	ldi	r25, 0x00	; 0
 570:	25 e5       	ldi	r18, 0x55	; 85
 572:	30 e0       	ldi	r19, 0x00	; 0
 574:	f9 01       	movw	r30, r18
 576:	20 81       	ld	r18, Z
 578:	27 7e       	andi	r18, 0xE7	; 231
 57a:	fc 01       	movw	r30, r24
 57c:	20 83       	st	Z, r18
 57e:	8d e4       	ldi	r24, 0x4D	; 77
 580:	90 e0       	ldi	r25, 0x00	; 0
 582:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 586:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 58a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 58e:	82 60       	ori	r24, 0x02	; 2
 590:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 594:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 598:	81 60       	ori	r24, 0x01	; 1
 59a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 59e:	45 c0       	rjmp	.+138    	; 0x62a <__LOCK_REGION_LENGTH__+0x22a>
 5a0:	10 92 62 00 	sts	0x0062, r1	; 0x800062 <scan_button_cnt>
 5a4:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5a8:	8f 77       	andi	r24, 0x7F	; 127
 5aa:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 5ae:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5b2:	8f 7b       	andi	r24, 0xBF	; 191
 5b4:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 5b8:	89 e0       	ldi	r24, 0x09	; 9
 5ba:	89 83       	std	Y+1, r24	; 0x01
 5bc:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 5c0:	84 60       	ori	r24, 0x04	; 4
 5c2:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 5c6:	85 e5       	ldi	r24, 0x55	; 85
 5c8:	90 e0       	ldi	r25, 0x00	; 0
 5ca:	25 e5       	ldi	r18, 0x55	; 85
 5cc:	30 e0       	ldi	r19, 0x00	; 0
 5ce:	f9 01       	movw	r30, r18
 5d0:	20 81       	ld	r18, Z
 5d2:	27 7e       	andi	r18, 0xE7	; 231
 5d4:	20 61       	ori	r18, 0x10	; 16
 5d6:	fc 01       	movw	r30, r24
 5d8:	20 83       	st	Z, r18
 5da:	8b e5       	ldi	r24, 0x5B	; 91
 5dc:	90 e0       	ldi	r25, 0x00	; 0
 5de:	2b e5       	ldi	r18, 0x5B	; 91
 5e0:	30 e0       	ldi	r19, 0x00	; 0
 5e2:	f9 01       	movw	r30, r18
 5e4:	20 81       	ld	r18, Z
 5e6:	20 64       	ori	r18, 0x40	; 64
 5e8:	fc 01       	movw	r30, r24
 5ea:	20 83       	st	Z, r18
 5ec:	8a e5       	ldi	r24, 0x5A	; 90
 5ee:	90 e0       	ldi	r25, 0x00	; 0
 5f0:	2a e5       	ldi	r18, 0x5A	; 90
 5f2:	30 e0       	ldi	r19, 0x00	; 0
 5f4:	f9 01       	movw	r30, r18
 5f6:	20 81       	ld	r18, Z
 5f8:	2f 7b       	andi	r18, 0xBF	; 191
 5fa:	fc 01       	movw	r30, r24
 5fc:	20 83       	st	Z, r18
 5fe:	15 c0       	rjmp	.+42     	; 0x62a <__LOCK_REGION_LENGTH__+0x22a>
 600:	8b e0       	ldi	r24, 0x0B	; 11
 602:	89 83       	std	Y+1, r24	; 0x01
 604:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 608:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 60c:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
 610:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 614:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 618:	84 60       	ori	r24, 0x04	; 4
 61a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 61e:	05 c0       	rjmp	.+10     	; 0x62a <__LOCK_REGION_LENGTH__+0x22a>
 620:	00 00       	nop
 622:	03 c0       	rjmp	.+6      	; 0x62a <__LOCK_REGION_LENGTH__+0x22a>
 624:	00 00       	nop
 626:	01 c0       	rjmp	.+2      	; 0x62a <__LOCK_REGION_LENGTH__+0x22a>
 628:	00 00       	nop
 62a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 62e:	88 2f       	mov	r24, r24
 630:	90 e0       	ldi	r25, 0x00	; 0
 632:	84 70       	andi	r24, 0x04	; 4
 634:	99 27       	eor	r25, r25
 636:	89 2b       	or	r24, r25
 638:	d1 f0       	breq	.+52     	; 0x66e <__LOCK_REGION_LENGTH__+0x26e>
 63a:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 63e:	8b 7f       	andi	r24, 0xFB	; 251
 640:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 644:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 648:	80 62       	ori	r24, 0x20	; 32
 64a:	80 93 67 00 	sts	0x0067, r24	; 0x800067 <f_button_state_flags>
 64e:	80 91 67 00 	lds	r24, 0x0067	; 0x800067 <f_button_state_flags>
 652:	88 2f       	mov	r24, r24
 654:	90 e0       	ldi	r25, 0x00	; 0
 656:	80 72       	andi	r24, 0x20	; 32
 658:	99 27       	eor	r25, r25
 65a:	21 e0       	ldi	r18, 0x01	; 1
 65c:	89 2b       	or	r24, r25
 65e:	09 f4       	brne	.+2      	; 0x662 <__LOCK_REGION_LENGTH__+0x262>
 660:	20 e0       	ldi	r18, 0x00	; 0
 662:	62 2f       	mov	r22, r18
 664:	89 81       	ldd	r24, Y+1	; 0x01
 666:	0f d0       	rcall	.+30     	; 0x686 <_Z8setPortshb>
 668:	61 e0       	ldi	r22, 0x01	; 1
 66a:	89 81       	ldd	r24, Y+1	; 0x01
 66c:	7e d0       	rcall	.+252    	; 0x76a <_Z10setPeriodshb>
 66e:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 672:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 676:	8b 57       	subi	r24, 0x7B	; 123
 678:	91 09       	sbc	r25, r1
 67a:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
 67e:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 682:	88 95       	sleep
 684:	ac cd       	rjmp	.-1192   	; 0x1de <main+0x76>

00000686 <_Z8setPortshb>:
 686:	cf 93       	push	r28
 688:	df 93       	push	r29
 68a:	cd b7       	in	r28, 0x3d	; 61
 68c:	dd 27       	eor	r29, r29
 68e:	cc 50       	subi	r28, 0x0C	; 12
 690:	cd bf       	out	0x3d, r28	; 61
 692:	8b 87       	std	Y+11, r24	; 0x0b
 694:	6c 87       	std	Y+12, r22	; 0x0c
 696:	87 e3       	ldi	r24, 0x37	; 55
 698:	90 e0       	ldi	r25, 0x00	; 0
 69a:	fc 01       	movw	r30, r24
 69c:	10 82       	st	Z, r1
 69e:	88 e3       	ldi	r24, 0x38	; 56
 6a0:	90 e0       	ldi	r25, 0x00	; 0
 6a2:	fc 01       	movw	r30, r24
 6a4:	10 82       	st	Z, r1
 6a6:	8b 85       	ldd	r24, Y+11	; 0x0b
 6a8:	88 2f       	mov	r24, r24
 6aa:	90 e0       	ldi	r25, 0x00	; 0
 6ac:	88 0f       	add	r24, r24
 6ae:	99 1f       	adc	r25, r25
 6b0:	88 0f       	add	r24, r24
 6b2:	99 1f       	adc	r25, r25
 6b4:	88 0f       	add	r24, r24
 6b6:	99 1f       	adc	r25, r25
 6b8:	9c 01       	movw	r18, r24
 6ba:	2c 5e       	subi	r18, 0xEC	; 236
 6bc:	3f 4f       	sbci	r19, 0xFF	; 255
 6be:	8c 85       	ldd	r24, Y+12	; 0x0c
 6c0:	88 23       	and	r24, r24
 6c2:	19 f0       	breq	.+6      	; 0x6ca <_Z8setPortshb+0x44>
 6c4:	80 e0       	ldi	r24, 0x00	; 0
 6c6:	90 e0       	ldi	r25, 0x00	; 0
 6c8:	02 c0       	rjmp	.+4      	; 0x6ce <_Z8setPortshb+0x48>
 6ca:	82 e0       	ldi	r24, 0x02	; 2
 6cc:	90 e0       	ldi	r25, 0x00	; 0
 6ce:	82 0f       	add	r24, r18
 6d0:	93 1f       	adc	r25, r19
 6d2:	9a 83       	std	Y+2, r25	; 0x02
 6d4:	89 83       	std	Y+1, r24	; 0x01
 6d6:	89 81       	ldd	r24, Y+1	; 0x01
 6d8:	9a 81       	ldd	r25, Y+2	; 0x02
 6da:	fc 01       	movw	r30, r24
 6dc:	84 91       	lpm	r24, Z
 6de:	8b 83       	std	Y+3, r24	; 0x03
 6e0:	8b 81       	ldd	r24, Y+3	; 0x03
 6e2:	8c 83       	std	Y+4, r24	; 0x04
 6e4:	8c 81       	ldd	r24, Y+4	; 0x04
 6e6:	8d 7f       	andi	r24, 0xFD	; 253
 6e8:	8c 83       	std	Y+4, r24	; 0x04
 6ea:	87 e3       	ldi	r24, 0x37	; 55
 6ec:	90 e0       	ldi	r25, 0x00	; 0
 6ee:	2c 81       	ldd	r18, Y+4	; 0x04
 6f0:	fc 01       	movw	r30, r24
 6f2:	20 83       	st	Z, r18
 6f4:	8c 85       	ldd	r24, Y+12	; 0x0c
 6f6:	88 23       	and	r24, r24
 6f8:	a9 f0       	breq	.+42     	; 0x724 <_Z8setPortshb+0x9e>
 6fa:	8b 85       	ldd	r24, Y+11	; 0x0b
 6fc:	88 2f       	mov	r24, r24
 6fe:	90 e0       	ldi	r25, 0x00	; 0
 700:	88 0f       	add	r24, r24
 702:	99 1f       	adc	r25, r25
 704:	88 0f       	add	r24, r24
 706:	99 1f       	adc	r25, r25
 708:	88 0f       	add	r24, r24
 70a:	99 1f       	adc	r25, r25
 70c:	01 96       	adiw	r24, 0x01	; 1
 70e:	8c 5e       	subi	r24, 0xEC	; 236
 710:	9f 4f       	sbci	r25, 0xFF	; 255
 712:	9e 83       	std	Y+6, r25	; 0x06
 714:	8d 83       	std	Y+5, r24	; 0x05
 716:	8d 81       	ldd	r24, Y+5	; 0x05
 718:	9e 81       	ldd	r25, Y+6	; 0x06
 71a:	fc 01       	movw	r30, r24
 71c:	84 91       	lpm	r24, Z
 71e:	8f 83       	std	Y+7, r24	; 0x07
 720:	8f 81       	ldd	r24, Y+7	; 0x07
 722:	14 c0       	rjmp	.+40     	; 0x74c <_Z8setPortshb+0xc6>
 724:	8b 85       	ldd	r24, Y+11	; 0x0b
 726:	88 2f       	mov	r24, r24
 728:	90 e0       	ldi	r25, 0x00	; 0
 72a:	88 0f       	add	r24, r24
 72c:	99 1f       	adc	r25, r25
 72e:	88 0f       	add	r24, r24
 730:	99 1f       	adc	r25, r25
 732:	88 0f       	add	r24, r24
 734:	99 1f       	adc	r25, r25
 736:	03 96       	adiw	r24, 0x03	; 3
 738:	8c 5e       	subi	r24, 0xEC	; 236
 73a:	9f 4f       	sbci	r25, 0xFF	; 255
 73c:	99 87       	std	Y+9, r25	; 0x09
 73e:	88 87       	std	Y+8, r24	; 0x08
 740:	88 85       	ldd	r24, Y+8	; 0x08
 742:	99 85       	ldd	r25, Y+9	; 0x09
 744:	fc 01       	movw	r30, r24
 746:	84 91       	lpm	r24, Z
 748:	8a 87       	std	Y+10, r24	; 0x0a
 74a:	8a 85       	ldd	r24, Y+10	; 0x0a
 74c:	8c 83       	std	Y+4, r24	; 0x04
 74e:	8c 81       	ldd	r24, Y+4	; 0x04
 750:	82 60       	ori	r24, 0x02	; 2
 752:	8c 83       	std	Y+4, r24	; 0x04
 754:	88 e3       	ldi	r24, 0x38	; 56
 756:	90 e0       	ldi	r25, 0x00	; 0
 758:	2c 81       	ldd	r18, Y+4	; 0x04
 75a:	fc 01       	movw	r30, r24
 75c:	20 83       	st	Z, r18
 75e:	00 00       	nop
 760:	c4 5f       	subi	r28, 0xF4	; 244
 762:	cd bf       	out	0x3d, r28	; 61
 764:	df 91       	pop	r29
 766:	cf 91       	pop	r28
 768:	08 95       	ret

0000076a <_Z10setPeriodshb>:
 76a:	cf 93       	push	r28
 76c:	df 93       	push	r29
 76e:	cd b7       	in	r28, 0x3d	; 61
 770:	dd 27       	eor	r29, r29
 772:	ca 50       	subi	r28, 0x0A	; 10
 774:	cd bf       	out	0x3d, r28	; 61
 776:	89 87       	std	Y+9, r24	; 0x09
 778:	6a 87       	std	Y+10, r22	; 0x0a
 77a:	89 85       	ldd	r24, Y+9	; 0x09
 77c:	88 2f       	mov	r24, r24
 77e:	90 e0       	ldi	r25, 0x00	; 0
 780:	88 0f       	add	r24, r24
 782:	99 1f       	adc	r25, r25
 784:	88 0f       	add	r24, r24
 786:	99 1f       	adc	r25, r25
 788:	88 0f       	add	r24, r24
 78a:	99 1f       	adc	r25, r25
 78c:	04 96       	adiw	r24, 0x04	; 4
 78e:	8c 5e       	subi	r24, 0xEC	; 236
 790:	9f 4f       	sbci	r25, 0xFF	; 255
 792:	9a 83       	std	Y+2, r25	; 0x02
 794:	89 83       	std	Y+1, r24	; 0x01
 796:	89 81       	ldd	r24, Y+1	; 0x01
 798:	9a 81       	ldd	r25, Y+2	; 0x02
 79a:	fc 01       	movw	r30, r24
 79c:	25 91       	lpm	r18, Z+
 79e:	34 91       	lpm	r19, Z
 7a0:	cf 01       	movw	r24, r30
 7a2:	3c 83       	std	Y+4, r19	; 0x04
 7a4:	2b 83       	std	Y+3, r18	; 0x03
 7a6:	9a 83       	std	Y+2, r25	; 0x02
 7a8:	89 83       	std	Y+1, r24	; 0x01
 7aa:	8b 81       	ldd	r24, Y+3	; 0x03
 7ac:	9c 81       	ldd	r25, Y+4	; 0x04
 7ae:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 7b2:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 7b6:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 7ba:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 7be:	89 2b       	or	r24, r25
 7c0:	59 f0       	breq	.+22     	; 0x7d8 <_Z10setPeriodshb+0x6e>
 7c2:	20 91 63 00 	lds	r18, 0x0063	; 0x800063 <tl_flash_end>
 7c6:	30 91 64 00 	lds	r19, 0x0064	; 0x800064 <tl_flash_end+0x1>
 7ca:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 7ce:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 7d2:	82 0f       	add	r24, r18
 7d4:	93 1f       	adc	r25, r19
 7d6:	02 c0       	rjmp	.+4      	; 0x7dc <_Z10setPeriodshb+0x72>
 7d8:	80 e0       	ldi	r24, 0x00	; 0
 7da:	90 e0       	ldi	r25, 0x00	; 0
 7dc:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 7e0:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 7e4:	8a 85       	ldd	r24, Y+10	; 0x0a
 7e6:	88 23       	and	r24, r24
 7e8:	a9 f1       	breq	.+106    	; 0x854 <_Z10setPeriodshb+0xea>
 7ea:	89 85       	ldd	r24, Y+9	; 0x09
 7ec:	88 2f       	mov	r24, r24
 7ee:	90 e0       	ldi	r25, 0x00	; 0
 7f0:	88 0f       	add	r24, r24
 7f2:	99 1f       	adc	r25, r25
 7f4:	88 0f       	add	r24, r24
 7f6:	99 1f       	adc	r25, r25
 7f8:	88 0f       	add	r24, r24
 7fa:	99 1f       	adc	r25, r25
 7fc:	06 96       	adiw	r24, 0x06	; 6
 7fe:	8c 5e       	subi	r24, 0xEC	; 236
 800:	9f 4f       	sbci	r25, 0xFF	; 255
 802:	9e 83       	std	Y+6, r25	; 0x06
 804:	8d 83       	std	Y+5, r24	; 0x05
 806:	8d 81       	ldd	r24, Y+5	; 0x05
 808:	9e 81       	ldd	r25, Y+6	; 0x06
 80a:	fc 01       	movw	r30, r24
 80c:	25 91       	lpm	r18, Z+
 80e:	34 91       	lpm	r19, Z
 810:	cf 01       	movw	r24, r30
 812:	38 87       	std	Y+8, r19	; 0x08
 814:	2f 83       	std	Y+7, r18	; 0x07
 816:	9e 83       	std	Y+6, r25	; 0x06
 818:	8d 83       	std	Y+5, r24	; 0x05
 81a:	8f 81       	ldd	r24, Y+7	; 0x07
 81c:	98 85       	ldd	r25, Y+8	; 0x08
 81e:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 822:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 826:	80 91 65 00 	lds	r24, 0x0065	; 0x800065 <tl_signal_end>
 82a:	90 91 66 00 	lds	r25, 0x0066	; 0x800066 <tl_signal_end+0x1>
 82e:	89 2b       	or	r24, r25
 830:	59 f0       	breq	.+22     	; 0x848 <_Z10setPeriodshb+0xde>
 832:	20 91 65 00 	lds	r18, 0x0065	; 0x800065 <tl_signal_end>
 836:	30 91 66 00 	lds	r19, 0x0066	; 0x800066 <tl_signal_end+0x1>
 83a:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 83e:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
 842:	82 0f       	add	r24, r18
 844:	93 1f       	adc	r25, r19
 846:	02 c0       	rjmp	.+4      	; 0x84c <_Z10setPeriodshb+0xe2>
 848:	80 e0       	ldi	r24, 0x00	; 0
 84a:	90 e0       	ldi	r25, 0x00	; 0
 84c:	90 93 66 00 	sts	0x0066, r25	; 0x800066 <tl_signal_end+0x1>
 850:	80 93 65 00 	sts	0x0065, r24	; 0x800065 <tl_signal_end>
 854:	00 00       	nop
 856:	c6 5f       	subi	r28, 0xF6	; 246
 858:	cd bf       	out	0x3d, r28	; 61
 85a:	df 91       	pop	r29
 85c:	cf 91       	pop	r28
 85e:	08 95       	ret

00000860 <_Z16init_timer_clockv>:
 860:	cf 93       	push	r28
 862:	df 93       	push	r29
 864:	cd b7       	in	r28, 0x3d	; 61
 866:	dd 27       	eor	r29, r29
 868:	83 e5       	ldi	r24, 0x53	; 83
 86a:	90 e0       	ldi	r25, 0x00	; 0
 86c:	25 e0       	ldi	r18, 0x05	; 5
 86e:	fc 01       	movw	r30, r24
 870:	20 83       	st	Z, r18
 872:	89 e5       	ldi	r24, 0x59	; 89
 874:	90 e0       	ldi	r25, 0x00	; 0
 876:	29 e5       	ldi	r18, 0x59	; 89
 878:	30 e0       	ldi	r19, 0x00	; 0
 87a:	f9 01       	movw	r30, r18
 87c:	20 81       	ld	r18, Z
 87e:	22 60       	ori	r18, 0x02	; 2
 880:	fc 01       	movw	r30, r24
 882:	20 83       	st	Z, r18
 884:	00 00       	nop
 886:	df 91       	pop	r29
 888:	cf 91       	pop	r28
 88a:	08 95       	ret

0000088c <_exit>:
 88c:	f8 94       	cli

0000088e <__stop_program>:
 88e:	ff cf       	rjmp	.-2      	; 0x88e <__stop_program>

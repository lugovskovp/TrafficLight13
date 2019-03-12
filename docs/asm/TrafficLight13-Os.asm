
./Release/TrafficLight13.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	39 c0       	rjmp	.+114    	; 0x74 <__ctors_end>
   2:	5e c0       	rjmp	.+188    	; 0xc0 <__vector_1>
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
  8c:	8d d0       	rcall	.+282    	; 0x1a8 <main>
  8e:	8b c1       	rjmp	.+790    	; 0x3a6 <_exit>

00000090 <__bad_interrupt>:
  90:	b7 cf       	rjmp	.-146    	; 0x0 <__vectors>

00000092 <__vector_3>:
  92:	1f 92       	push	r1
  94:	0f 92       	push	r0
  96:	0f b6       	in	r0, 0x3f	; 63
  98:	0f 92       	push	r0
  9a:	11 24       	eor	r1, r1
  9c:	8f 93       	push	r24
  9e:	9f 93       	push	r25
  a0:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
  a4:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
  a8:	01 96       	adiw	r24, 0x01	; 1
  aa:	90 93 67 00 	sts	0x0067, r25	; 0x800067 <globalTimer+0x1>
  ae:	80 93 66 00 	sts	0x0066, r24	; 0x800066 <globalTimer>
  b2:	9f 91       	pop	r25
  b4:	8f 91       	pop	r24
  b6:	0f 90       	pop	r0
  b8:	0f be       	out	0x3f, r0	; 63
  ba:	0f 90       	pop	r0
  bc:	1f 90       	pop	r1
  be:	18 95       	reti

000000c0 <__vector_1>:
  c0:	1f 92       	push	r1
  c2:	0f 92       	push	r0
  c4:	0f b6       	in	r0, 0x3f	; 63
  c6:	0f 92       	push	r0
  c8:	11 24       	eor	r1, r1
  ca:	8f 93       	push	r24
  cc:	8b b7       	in	r24, 0x3b	; 59
  ce:	8f 7b       	andi	r24, 0xBF	; 191
  d0:	8b bf       	out	0x3b, r24	; 59
  d2:	8a b7       	in	r24, 0x3a	; 58
  d4:	8f 7b       	andi	r24, 0xBF	; 191
  d6:	8a bf       	out	0x3a, r24	; 58
  d8:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
  dc:	10 92 67 00 	sts	0x0067, r1	; 0x800067 <globalTimer+0x1>
  e0:	10 92 66 00 	sts	0x0066, r1	; 0x800066 <globalTimer>
  e4:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
  e8:	8f 73       	andi	r24, 0x3F	; 63
  ea:	83 60       	ori	r24, 0x03	; 3
  ec:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
  f0:	8f 91       	pop	r24
  f2:	0f 90       	pop	r0
  f4:	0f be       	out	0x3f, r0	; 63
  f6:	0f 90       	pop	r0
  f8:	1f 90       	pop	r1
  fa:	18 95       	reti

000000fc <_Z8setPortshb>:
  fc:	17 ba       	out	0x17, r1	; 23
  fe:	18 ba       	out	0x18, r1	; 24
 100:	90 e0       	ldi	r25, 0x00	; 0
 102:	23 e0       	ldi	r18, 0x03	; 3
 104:	88 0f       	add	r24, r24
 106:	99 1f       	adc	r25, r25
 108:	2a 95       	dec	r18
 10a:	e1 f7       	brne	.-8      	; 0x104 <_Z8setPortshb+0x8>
 10c:	9c 01       	movw	r18, r24
 10e:	2c 5e       	subi	r18, 0xEC	; 236
 110:	3f 4f       	sbci	r19, 0xFF	; 255
 112:	61 11       	cpse	r22, r1
 114:	03 c0       	rjmp	.+6      	; 0x11c <_Z8setPortshb+0x20>
 116:	e2 e0       	ldi	r30, 0x02	; 2
 118:	f0 e0       	ldi	r31, 0x00	; 0
 11a:	02 c0       	rjmp	.+4      	; 0x120 <_Z8setPortshb+0x24>
 11c:	e0 e0       	ldi	r30, 0x00	; 0
 11e:	f0 e0       	ldi	r31, 0x00	; 0
 120:	e2 0f       	add	r30, r18
 122:	f3 1f       	adc	r31, r19
 124:	e4 91       	lpm	r30, Z
 126:	ed 7f       	andi	r30, 0xFD	; 253
 128:	e7 bb       	out	0x17, r30	; 23
 12a:	fc 01       	movw	r30, r24
 12c:	66 23       	and	r22, r22
 12e:	19 f0       	breq	.+6      	; 0x136 <_Z8setPortshb+0x3a>
 130:	eb 5e       	subi	r30, 0xEB	; 235
 132:	ff 4f       	sbci	r31, 0xFF	; 255
 134:	02 c0       	rjmp	.+4      	; 0x13a <_Z8setPortshb+0x3e>
 136:	e9 5e       	subi	r30, 0xE9	; 233
 138:	ff 4f       	sbci	r31, 0xFF	; 255
 13a:	e4 91       	lpm	r30, Z
 13c:	e2 60       	ori	r30, 0x02	; 2
 13e:	e8 bb       	out	0x18, r30	; 24
 140:	08 95       	ret

00000142 <_Z10setPeriodshb>:
 142:	90 e0       	ldi	r25, 0x00	; 0
 144:	23 e0       	ldi	r18, 0x03	; 3
 146:	88 0f       	add	r24, r24
 148:	99 1f       	adc	r25, r25
 14a:	2a 95       	dec	r18
 14c:	e1 f7       	brne	.-8      	; 0x146 <_Z10setPeriodshb+0x4>
 14e:	fc 01       	movw	r30, r24
 150:	e8 5e       	subi	r30, 0xE8	; 232
 152:	ff 4f       	sbci	r31, 0xFF	; 255
 154:	45 91       	lpm	r20, Z+
 156:	54 91       	lpm	r21, Z
 158:	41 15       	cp	r20, r1
 15a:	51 05       	cpc	r21, r1
 15c:	39 f0       	breq	.+14     	; 0x16c <_Z10setPeriodshb+0x2a>
 15e:	20 91 66 00 	lds	r18, 0x0066	; 0x800066 <globalTimer>
 162:	30 91 67 00 	lds	r19, 0x0067	; 0x800067 <globalTimer+0x1>
 166:	24 0f       	add	r18, r20
 168:	35 1f       	adc	r19, r21
 16a:	02 c0       	rjmp	.+4      	; 0x170 <_Z10setPeriodshb+0x2e>
 16c:	20 e0       	ldi	r18, 0x00	; 0
 16e:	30 e0       	ldi	r19, 0x00	; 0
 170:	30 93 64 00 	sts	0x0064, r19	; 0x800064 <tl_flash_end+0x1>
 174:	20 93 63 00 	sts	0x0063, r18	; 0x800063 <tl_flash_end>
 178:	66 23       	and	r22, r22
 17a:	a9 f0       	breq	.+42     	; 0x1a6 <_Z10setPeriodshb+0x64>
 17c:	fc 01       	movw	r30, r24
 17e:	e6 5e       	subi	r30, 0xE6	; 230
 180:	ff 4f       	sbci	r31, 0xFF	; 255
 182:	25 91       	lpm	r18, Z+
 184:	34 91       	lpm	r19, Z
 186:	21 15       	cp	r18, r1
 188:	31 05       	cpc	r19, r1
 18a:	39 f0       	breq	.+14     	; 0x19a <_Z10setPeriodshb+0x58>
 18c:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
 190:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
 194:	82 0f       	add	r24, r18
 196:	93 1f       	adc	r25, r19
 198:	02 c0       	rjmp	.+4      	; 0x19e <_Z10setPeriodshb+0x5c>
 19a:	80 e0       	ldi	r24, 0x00	; 0
 19c:	90 e0       	ldi	r25, 0x00	; 0
 19e:	90 93 62 00 	sts	0x0062, r25	; 0x800062 <tl_signal_end+0x1>
 1a2:	80 93 61 00 	sts	0x0061, r24	; 0x800061 <tl_signal_end>
 1a6:	08 95       	ret

000001a8 <main>:
 1a8:	85 b7       	in	r24, 0x35	; 53
 1aa:	87 7e       	andi	r24, 0xE7	; 231
 1ac:	85 bf       	out	0x35, r24	; 53
 1ae:	85 b7       	in	r24, 0x35	; 53
 1b0:	80 62       	ori	r24, 0x20	; 32
 1b2:	85 bf       	out	0x35, r24	; 53
 1b4:	85 e0       	ldi	r24, 0x05	; 5
 1b6:	83 bf       	out	0x33, r24	; 51
 1b8:	89 b7       	in	r24, 0x39	; 57
 1ba:	82 60       	ori	r24, 0x02	; 2
 1bc:	89 bf       	out	0x39, r24	; 57
 1be:	10 92 67 00 	sts	0x0067, r1	; 0x800067 <globalTimer+0x1>
 1c2:	10 92 66 00 	sts	0x0066, r1	; 0x800066 <globalTimer>
 1c6:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 1ca:	8c 7f       	andi	r24, 0xFC	; 252
 1cc:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
 1d0:	84 62       	ori	r24, 0x24	; 36
 1d2:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 1d6:	78 94       	sei
 1d8:	ca e0       	ldi	r28, 0x0A	; 10
 1da:	d0 e2       	ldi	r29, 0x20	; 32
 1dc:	10 e1       	ldi	r17, 0x10	; 16
 1de:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
 1e2:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
 1e6:	97 ff       	sbrs	r25, 7
 1e8:	22 c0       	rjmp	.+68     	; 0x22e <main+0x86>
 1ea:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
 1ee:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
 1f2:	8f 5f       	subi	r24, 0xFF	; 255
 1f4:	9f 47       	sbci	r25, 0x7F	; 127
 1f6:	90 93 67 00 	sts	0x0067, r25	; 0x800067 <globalTimer+0x1>
 1fa:	80 93 66 00 	sts	0x0066, r24	; 0x800066 <globalTimer>
 1fe:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 202:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 206:	00 97       	sbiw	r24, 0x00	; 0
 208:	31 f0       	breq	.+12     	; 0x216 <main+0x6e>
 20a:	8f 5f       	subi	r24, 0xFF	; 255
 20c:	9f 47       	sbci	r25, 0x7F	; 127
 20e:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 212:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 216:	80 91 61 00 	lds	r24, 0x0061	; 0x800061 <tl_signal_end>
 21a:	90 91 62 00 	lds	r25, 0x0062	; 0x800062 <tl_signal_end+0x1>
 21e:	00 97       	sbiw	r24, 0x00	; 0
 220:	31 f0       	breq	.+12     	; 0x22e <main+0x86>
 222:	8f 5f       	subi	r24, 0xFF	; 255
 224:	9f 47       	sbci	r25, 0x7F	; 127
 226:	90 93 62 00 	sts	0x0062, r25	; 0x800062 <tl_signal_end+0x1>
 22a:	80 93 61 00 	sts	0x0061, r24	; 0x800061 <tl_signal_end>
 22e:	b1 99       	sbic	0x16, 1	; 22
 230:	10 c0       	rjmp	.+32     	; 0x252 <main+0xaa>
 232:	90 91 65 00 	lds	r25, 0x0065	; 0x800065 <scan_button_cnt>
 236:	9f 5f       	subi	r25, 0xFF	; 255
 238:	90 93 65 00 	sts	0x0065, r25	; 0x800065 <scan_button_cnt>
 23c:	95 30       	cpi	r25, 0x05	; 5
 23e:	48 f0       	brcs	.+18     	; 0x252 <main+0xaa>
 240:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 244:	95 32       	cpi	r25, 0x25	; 37
 246:	10 f4       	brcc	.+4      	; 0x24c <main+0xa4>
 248:	80 64       	ori	r24, 0x40	; 64
 24a:	01 c0       	rjmp	.+2      	; 0x24e <main+0xa6>
 24c:	80 6c       	ori	r24, 0xC0	; 192
 24e:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 252:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 256:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 25a:	00 97       	sbiw	r24, 0x00	; 0
 25c:	a1 f0       	breq	.+40     	; 0x286 <main+0xde>
 25e:	20 91 66 00 	lds	r18, 0x0066	; 0x800066 <globalTimer>
 262:	30 91 67 00 	lds	r19, 0x0067	; 0x800067 <globalTimer+0x1>
 266:	82 17       	cp	r24, r18
 268:	93 07       	cpc	r25, r19
 26a:	68 f4       	brcc	.+26     	; 0x286 <main+0xde>
 26c:	60 91 60 00 	lds	r22, 0x0060	; 0x800060 <_edata>
 270:	6d 27       	eor	r22, r29
 272:	60 93 60 00 	sts	0x0060, r22	; 0x800060 <_edata>
 276:	65 fb       	bst	r22, 5
 278:	66 27       	eor	r22, r22
 27a:	60 f9       	bld	r22, 0
 27c:	8c 2f       	mov	r24, r28
 27e:	3e df       	rcall	.-388    	; 0xfc <_Z8setPortshb>
 280:	60 e0       	ldi	r22, 0x00	; 0
 282:	8c 2f       	mov	r24, r28
 284:	5e df       	rcall	.-324    	; 0x142 <_Z10setPeriodshb>
 286:	80 91 61 00 	lds	r24, 0x0061	; 0x800061 <tl_signal_end>
 28a:	90 91 62 00 	lds	r25, 0x0062	; 0x800062 <tl_signal_end+0x1>
 28e:	00 97       	sbiw	r24, 0x00	; 0
 290:	59 f0       	breq	.+22     	; 0x2a8 <main+0x100>
 292:	20 91 66 00 	lds	r18, 0x0066	; 0x800066 <globalTimer>
 296:	30 91 67 00 	lds	r19, 0x0067	; 0x800067 <globalTimer+0x1>
 29a:	82 17       	cp	r24, r18
 29c:	93 07       	cpc	r25, r19
 29e:	20 f4       	brcc	.+8      	; 0x2a8 <main+0x100>
 2a0:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2a4:	85 fd       	sbrc	r24, 5
 2a6:	79 c0       	rjmp	.+242    	; 0x39a <main+0x1f2>
 2a8:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2ac:	98 2f       	mov	r25, r24
 2ae:	93 70       	andi	r25, 0x03	; 3
 2b0:	92 30       	cpi	r25, 0x02	; 2
 2b2:	09 f4       	brne	.+2      	; 0x2b6 <main+0x10e>
 2b4:	46 c0       	rjmp	.+140    	; 0x342 <main+0x19a>
 2b6:	93 30       	cpi	r25, 0x03	; 3
 2b8:	19 f0       	breq	.+6      	; 0x2c0 <main+0x118>
 2ba:	91 30       	cpi	r25, 0x01	; 1
 2bc:	e9 f4       	brne	.+58     	; 0x2f8 <main+0x150>
 2be:	3c c0       	rjmp	.+120    	; 0x338 <main+0x190>
 2c0:	85 b7       	in	r24, 0x35	; 53
 2c2:	87 7e       	andi	r24, 0xE7	; 231
 2c4:	85 bf       	out	0x35, r24	; 53
 2c6:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2ca:	87 ff       	sbrs	r24, 7
 2cc:	0a c0       	rjmp	.+20     	; 0x2e2 <main+0x13a>
 2ce:	c9 30       	cpi	r28, 0x09	; 9
 2d0:	41 f4       	brne	.+16     	; 0x2e2 <main+0x13a>
 2d2:	84 fd       	sbrc	r24, 4
 2d4:	02 c0       	rjmp	.+4      	; 0x2da <main+0x132>
 2d6:	c0 e0       	ldi	r28, 0x00	; 0
 2d8:	01 c0       	rjmp	.+2      	; 0x2dc <main+0x134>
 2da:	c8 e0       	ldi	r28, 0x08	; 8
 2dc:	84 60       	ori	r24, 0x04	; 4
 2de:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 2e2:	b1 9b       	sbis	0x16, 1	; 22
 2e4:	4a c0       	rjmp	.+148    	; 0x37a <main+0x1d2>
 2e6:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2ea:	87 ff       	sbrs	r24, 7
 2ec:	02 c0       	rjmp	.+4      	; 0x2f2 <main+0x14a>
 2ee:	8c 7f       	andi	r24, 0xFC	; 252
 2f0:	1b c0       	rjmp	.+54     	; 0x328 <main+0x180>
 2f2:	8e 7f       	andi	r24, 0xFE	; 254
 2f4:	82 60       	ori	r24, 0x02	; 2
 2f6:	18 c0       	rjmp	.+48     	; 0x328 <main+0x180>
 2f8:	90 91 65 00 	lds	r25, 0x0065	; 0x800065 <scan_button_cnt>
 2fc:	99 23       	and	r25, r25
 2fe:	e9 f1       	breq	.+122    	; 0x37a <main+0x1d2>
 300:	87 ff       	sbrs	r24, 7
 302:	05 c0       	rjmp	.+10     	; 0x30e <main+0x166>
 304:	8d 7f       	andi	r24, 0xFD	; 253
 306:	85 60       	ori	r24, 0x05	; 5
 308:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 30c:	c9 e0       	ldi	r28, 0x09	; 9
 30e:	b1 9b       	sbis	0x16, 1	; 22
 310:	34 c0       	rjmp	.+104    	; 0x37a <main+0x1d2>
 312:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 316:	86 ff       	sbrs	r24, 6
 318:	09 c0       	rjmp	.+18     	; 0x32c <main+0x184>
 31a:	81 27       	eor	r24, r17
 31c:	84 fd       	sbrc	r24, 4
 31e:	02 c0       	rjmp	.+4      	; 0x324 <main+0x17c>
 320:	c0 e0       	ldi	r28, 0x00	; 0
 322:	01 c0       	rjmp	.+2      	; 0x326 <main+0x17e>
 324:	c8 e0       	ldi	r28, 0x08	; 8
 326:	84 60       	ori	r24, 0x04	; 4
 328:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 32c:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
 330:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 334:	8f 73       	andi	r24, 0x3F	; 63
 336:	0d c0       	rjmp	.+26     	; 0x352 <main+0x1aa>
 338:	b1 9b       	sbis	0x16, 1	; 22
 33a:	1f c0       	rjmp	.+62     	; 0x37a <main+0x1d2>
 33c:	8e 7f       	andi	r24, 0xFE	; 254
 33e:	82 60       	ori	r24, 0x02	; 2
 340:	08 c0       	rjmp	.+16     	; 0x352 <main+0x1aa>
 342:	b1 99       	sbic	0x16, 1	; 22
 344:	09 c0       	rjmp	.+18     	; 0x358 <main+0x1b0>
 346:	85 b7       	in	r24, 0x35	; 53
 348:	87 7e       	andi	r24, 0xE7	; 231
 34a:	85 bf       	out	0x35, r24	; 53
 34c:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 350:	83 60       	ori	r24, 0x03	; 3
 352:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 356:	11 c0       	rjmp	.+34     	; 0x37a <main+0x1d2>
 358:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
 35c:	8f 73       	andi	r24, 0x3F	; 63
 35e:	84 60       	ori	r24, 0x04	; 4
 360:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 364:	85 b7       	in	r24, 0x35	; 53
 366:	87 7e       	andi	r24, 0xE7	; 231
 368:	80 61       	ori	r24, 0x10	; 16
 36a:	85 bf       	out	0x35, r24	; 53
 36c:	8b b7       	in	r24, 0x3b	; 59
 36e:	80 64       	ori	r24, 0x40	; 64
 370:	8b bf       	out	0x3b, r24	; 59
 372:	8a b7       	in	r24, 0x3a	; 58
 374:	8f 7b       	andi	r24, 0xBF	; 191
 376:	8a bf       	out	0x3a, r24	; 58
 378:	c9 e0       	ldi	r28, 0x09	; 9
 37a:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 37e:	82 ff       	sbrs	r24, 2
 380:	0a c0       	rjmp	.+20     	; 0x396 <main+0x1ee>
 382:	8b 7f       	andi	r24, 0xFB	; 251
 384:	80 62       	ori	r24, 0x20	; 32
 386:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 38a:	61 e0       	ldi	r22, 0x01	; 1
 38c:	8c 2f       	mov	r24, r28
 38e:	b6 de       	rcall	.-660    	; 0xfc <_Z8setPortshb>
 390:	61 e0       	ldi	r22, 0x01	; 1
 392:	8c 2f       	mov	r24, r28
 394:	d6 de       	rcall	.-596    	; 0x142 <_Z10setPeriodshb>
 396:	88 95       	sleep
 398:	22 cf       	rjmp	.-444    	; 0x1de <main+0x36>
 39a:	cf 5f       	subi	r28, 0xFF	; 255
 39c:	c7 70       	andi	r28, 0x07	; 7
 39e:	84 60       	ori	r24, 0x04	; 4
 3a0:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 3a4:	81 cf       	rjmp	.-254    	; 0x2a8 <main+0x100>

000003a6 <_exit>:
 3a6:	f8 94       	cli

000003a8 <__stop_program>:
 3a8:	ff cf       	rjmp	.-2      	; 0x3a8 <__stop_program>

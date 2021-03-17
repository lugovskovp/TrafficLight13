
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
  8e:	c8 c1       	rjmp	.+912    	; 0x420 <_exit>

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
 1d0:	25 e0       	ldi	r18, 0x05	; 5
 1d2:	30 e0       	ldi	r19, 0x00	; 0
 1d4:	30 93 69 00 	sts	0x0069, r19	; 0x800069 <__bss_end+0x1>
 1d8:	20 93 68 00 	sts	0x0068, r18	; 0x800068 <__bss_end>
 1dc:	84 62       	ori	r24, 0x24	; 36
 1de:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 1e2:	78 94       	sei
 1e4:	1a e0       	ldi	r17, 0x0A	; 10
 1e6:	00 e2       	ldi	r16, 0x20	; 32
 1e8:	cd e4       	ldi	r28, 0x4D	; 77
 1ea:	d0 e0       	ldi	r29, 0x00	; 0
 1ec:	80 e1       	ldi	r24, 0x10	; 16
 1ee:	f8 2e       	mov	r15, r24
 1f0:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
 1f4:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
 1f8:	97 ff       	sbrs	r25, 7
 1fa:	34 c0       	rjmp	.+104    	; 0x264 <main+0xbc>
 1fc:	80 91 66 00 	lds	r24, 0x0066	; 0x800066 <globalTimer>
 200:	90 91 67 00 	lds	r25, 0x0067	; 0x800067 <globalTimer+0x1>
 204:	8f 5f       	subi	r24, 0xFF	; 255
 206:	9f 47       	sbci	r25, 0x7F	; 127
 208:	90 93 67 00 	sts	0x0067, r25	; 0x800067 <globalTimer+0x1>
 20c:	80 93 66 00 	sts	0x0066, r24	; 0x800066 <globalTimer>
 210:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 214:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 218:	00 97       	sbiw	r24, 0x00	; 0
 21a:	79 f0       	breq	.+30     	; 0x23a <main+0x92>
 21c:	8f 5f       	subi	r24, 0xFF	; 255
 21e:	9f 47       	sbci	r25, 0x7F	; 127
 220:	90 93 64 00 	sts	0x0064, r25	; 0x800064 <tl_flash_end+0x1>
 224:	80 93 63 00 	sts	0x0063, r24	; 0x800063 <tl_flash_end>
 228:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 22c:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 230:	01 97       	sbiw	r24, 0x01	; 1
 232:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 236:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 23a:	80 91 61 00 	lds	r24, 0x0061	; 0x800061 <tl_signal_end>
 23e:	90 91 62 00 	lds	r25, 0x0062	; 0x800062 <tl_signal_end+0x1>
 242:	00 97       	sbiw	r24, 0x00	; 0
 244:	79 f0       	breq	.+30     	; 0x264 <main+0xbc>
 246:	8f 5f       	subi	r24, 0xFF	; 255
 248:	9f 47       	sbci	r25, 0x7F	; 127
 24a:	90 93 62 00 	sts	0x0062, r25	; 0x800062 <tl_signal_end+0x1>
 24e:	80 93 61 00 	sts	0x0061, r24	; 0x800061 <tl_signal_end>
 252:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 256:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 25a:	01 96       	adiw	r24, 0x01	; 1
 25c:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 260:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 264:	b1 99       	sbic	0x16, 1	; 22
 266:	1a c0       	rjmp	.+52     	; 0x29c <main+0xf4>
 268:	90 91 65 00 	lds	r25, 0x0065	; 0x800065 <scan_button_cnt>
 26c:	9f 5f       	subi	r25, 0xFF	; 255
 26e:	90 93 65 00 	sts	0x0065, r25	; 0x800065 <scan_button_cnt>
 272:	20 91 68 00 	lds	r18, 0x0068	; 0x800068 <__bss_end>
 276:	30 91 69 00 	lds	r19, 0x0069	; 0x800069 <__bss_end+0x1>
 27a:	29 1b       	sub	r18, r25
 27c:	31 09       	sbc	r19, r1
 27e:	30 93 69 00 	sts	0x0069, r19	; 0x800069 <__bss_end+0x1>
 282:	20 93 68 00 	sts	0x0068, r18	; 0x800068 <__bss_end>
 286:	95 30       	cpi	r25, 0x05	; 5
 288:	48 f0       	brcs	.+18     	; 0x29c <main+0xf4>
 28a:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 28e:	95 32       	cpi	r25, 0x25	; 37
 290:	10 f4       	brcc	.+4      	; 0x296 <main+0xee>
 292:	80 64       	ori	r24, 0x40	; 64
 294:	01 c0       	rjmp	.+2      	; 0x298 <main+0xf0>
 296:	80 6c       	ori	r24, 0xC0	; 192
 298:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 29c:	80 91 63 00 	lds	r24, 0x0063	; 0x800063 <tl_flash_end>
 2a0:	90 91 64 00 	lds	r25, 0x0064	; 0x800064 <tl_flash_end+0x1>
 2a4:	00 97       	sbiw	r24, 0x00	; 0
 2a6:	a1 f0       	breq	.+40     	; 0x2d0 <main+0x128>
 2a8:	20 91 66 00 	lds	r18, 0x0066	; 0x800066 <globalTimer>
 2ac:	30 91 67 00 	lds	r19, 0x0067	; 0x800067 <globalTimer+0x1>
 2b0:	82 17       	cp	r24, r18
 2b2:	93 07       	cpc	r25, r19
 2b4:	68 f4       	brcc	.+26     	; 0x2d0 <main+0x128>
 2b6:	60 91 60 00 	lds	r22, 0x0060	; 0x800060 <_edata>
 2ba:	60 27       	eor	r22, r16
 2bc:	60 93 60 00 	sts	0x0060, r22	; 0x800060 <_edata>
 2c0:	65 fb       	bst	r22, 5
 2c2:	66 27       	eor	r22, r22
 2c4:	60 f9       	bld	r22, 0
 2c6:	81 2f       	mov	r24, r17
 2c8:	19 df       	rcall	.-462    	; 0xfc <_Z8setPortshb>
 2ca:	60 e0       	ldi	r22, 0x00	; 0
 2cc:	81 2f       	mov	r24, r17
 2ce:	39 df       	rcall	.-398    	; 0x142 <_Z10setPeriodshb>
 2d0:	80 91 61 00 	lds	r24, 0x0061	; 0x800061 <tl_signal_end>
 2d4:	90 91 62 00 	lds	r25, 0x0062	; 0x800062 <tl_signal_end+0x1>
 2d8:	00 97       	sbiw	r24, 0x00	; 0
 2da:	59 f0       	breq	.+22     	; 0x2f2 <main+0x14a>
 2dc:	20 91 66 00 	lds	r18, 0x0066	; 0x800066 <globalTimer>
 2e0:	30 91 67 00 	lds	r19, 0x0067	; 0x800067 <globalTimer+0x1>
 2e4:	82 17       	cp	r24, r18
 2e6:	93 07       	cpc	r25, r19
 2e8:	20 f4       	brcc	.+8      	; 0x2f2 <main+0x14a>
 2ea:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2ee:	85 fd       	sbrc	r24, 5
 2f0:	91 c0       	rjmp	.+290    	; 0x414 <__LOCK_REGION_LENGTH__+0x14>
 2f2:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 2f6:	98 2f       	mov	r25, r24
 2f8:	93 70       	andi	r25, 0x03	; 3
 2fa:	92 30       	cpi	r25, 0x02	; 2
 2fc:	09 f4       	brne	.+2      	; 0x300 <main+0x158>
 2fe:	50 c0       	rjmp	.+160    	; 0x3a0 <main+0x1f8>
 300:	93 30       	cpi	r25, 0x03	; 3
 302:	19 f0       	breq	.+6      	; 0x30a <main+0x162>
 304:	91 30       	cpi	r25, 0x01	; 1
 306:	31 f5       	brne	.+76     	; 0x354 <main+0x1ac>
 308:	46 c0       	rjmp	.+140    	; 0x396 <main+0x1ee>
 30a:	85 b7       	in	r24, 0x35	; 53
 30c:	87 7e       	andi	r24, 0xE7	; 231
 30e:	85 bf       	out	0x35, r24	; 53
 310:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 314:	87 ff       	sbrs	r24, 7
 316:	13 c0       	rjmp	.+38     	; 0x33e <main+0x196>
 318:	19 30       	cpi	r17, 0x09	; 9
 31a:	89 f4       	brne	.+34     	; 0x33e <main+0x196>
 31c:	84 fd       	sbrc	r24, 4
 31e:	02 c0       	rjmp	.+4      	; 0x324 <main+0x17c>
 320:	10 e0       	ldi	r17, 0x00	; 0
 322:	01 c0       	rjmp	.+2      	; 0x326 <main+0x17e>
 324:	18 e0       	ldi	r17, 0x08	; 8
 326:	84 60       	ori	r24, 0x04	; 4
 328:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 32c:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 330:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 334:	81 2b       	or	r24, r17
 336:	90 93 69 00 	sts	0x0069, r25	; 0x800069 <__bss_end+0x1>
 33a:	80 93 68 00 	sts	0x0068, r24	; 0x800068 <__bss_end>
 33e:	b1 9b       	sbis	0x16, 1	; 22
 340:	4f c0       	rjmp	.+158    	; 0x3e0 <main+0x238>
 342:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 346:	87 ff       	sbrs	r24, 7
 348:	02 c0       	rjmp	.+4      	; 0x34e <main+0x1a6>
 34a:	8c 7f       	andi	r24, 0xFC	; 252
 34c:	1c c0       	rjmp	.+56     	; 0x386 <main+0x1de>
 34e:	8e 7f       	andi	r24, 0xFE	; 254
 350:	82 60       	ori	r24, 0x02	; 2
 352:	19 c0       	rjmp	.+50     	; 0x386 <main+0x1de>
 354:	90 91 65 00 	lds	r25, 0x0065	; 0x800065 <scan_button_cnt>
 358:	99 23       	and	r25, r25
 35a:	09 f4       	brne	.+2      	; 0x35e <main+0x1b6>
 35c:	41 c0       	rjmp	.+130    	; 0x3e0 <main+0x238>
 35e:	87 ff       	sbrs	r24, 7
 360:	05 c0       	rjmp	.+10     	; 0x36c <main+0x1c4>
 362:	8d 7f       	andi	r24, 0xFD	; 253
 364:	85 60       	ori	r24, 0x05	; 5
 366:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 36a:	19 e0       	ldi	r17, 0x09	; 9
 36c:	b1 9b       	sbis	0x16, 1	; 22
 36e:	38 c0       	rjmp	.+112    	; 0x3e0 <main+0x238>
 370:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 374:	86 ff       	sbrs	r24, 6
 376:	09 c0       	rjmp	.+18     	; 0x38a <main+0x1e2>
 378:	8f 25       	eor	r24, r15
 37a:	84 fd       	sbrc	r24, 4
 37c:	02 c0       	rjmp	.+4      	; 0x382 <main+0x1da>
 37e:	10 e0       	ldi	r17, 0x00	; 0
 380:	01 c0       	rjmp	.+2      	; 0x384 <main+0x1dc>
 382:	18 e0       	ldi	r17, 0x08	; 8
 384:	84 60       	ori	r24, 0x04	; 4
 386:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 38a:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
 38e:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 392:	8f 73       	andi	r24, 0x3F	; 63
 394:	11 c0       	rjmp	.+34     	; 0x3b8 <main+0x210>
 396:	b1 9b       	sbis	0x16, 1	; 22
 398:	23 c0       	rjmp	.+70     	; 0x3e0 <main+0x238>
 39a:	8e 7f       	andi	r24, 0xFE	; 254
 39c:	82 60       	ori	r24, 0x02	; 2
 39e:	0c c0       	rjmp	.+24     	; 0x3b8 <main+0x210>
 3a0:	b1 99       	sbic	0x16, 1	; 22
 3a2:	0d c0       	rjmp	.+26     	; 0x3be <main+0x216>
 3a4:	85 b7       	in	r24, 0x35	; 53
 3a6:	87 7e       	andi	r24, 0xE7	; 231
 3a8:	85 bf       	out	0x35, r24	; 53
 3aa:	d0 93 69 00 	sts	0x0069, r29	; 0x800069 <__bss_end+0x1>
 3ae:	c0 93 68 00 	sts	0x0068, r28	; 0x800068 <__bss_end>
 3b2:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 3b6:	83 60       	ori	r24, 0x03	; 3
 3b8:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 3bc:	11 c0       	rjmp	.+34     	; 0x3e0 <main+0x238>
 3be:	10 92 65 00 	sts	0x0065, r1	; 0x800065 <scan_button_cnt>
 3c2:	8f 73       	andi	r24, 0x3F	; 63
 3c4:	84 60       	ori	r24, 0x04	; 4
 3c6:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 3ca:	85 b7       	in	r24, 0x35	; 53
 3cc:	87 7e       	andi	r24, 0xE7	; 231
 3ce:	80 61       	ori	r24, 0x10	; 16
 3d0:	85 bf       	out	0x35, r24	; 53
 3d2:	8b b7       	in	r24, 0x3b	; 59
 3d4:	80 64       	ori	r24, 0x40	; 64
 3d6:	8b bf       	out	0x3b, r24	; 59
 3d8:	8a b7       	in	r24, 0x3a	; 58
 3da:	8f 7b       	andi	r24, 0xBF	; 191
 3dc:	8a bf       	out	0x3a, r24	; 58
 3de:	19 e0       	ldi	r17, 0x09	; 9
 3e0:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
 3e4:	82 ff       	sbrs	r24, 2
 3e6:	0a c0       	rjmp	.+20     	; 0x3fc <main+0x254>
 3e8:	8b 7f       	andi	r24, 0xFB	; 251
 3ea:	80 62       	ori	r24, 0x20	; 32
 3ec:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 3f0:	61 e0       	ldi	r22, 0x01	; 1
 3f2:	81 2f       	mov	r24, r17
 3f4:	83 de       	rcall	.-762    	; 0xfc <_Z8setPortshb>
 3f6:	61 e0       	ldi	r22, 0x01	; 1
 3f8:	81 2f       	mov	r24, r17
 3fa:	a3 de       	rcall	.-698    	; 0x142 <_Z10setPeriodshb>
 3fc:	80 91 68 00 	lds	r24, 0x0068	; 0x800068 <__bss_end>
 400:	90 91 69 00 	lds	r25, 0x0069	; 0x800069 <__bss_end+0x1>
 404:	8b 57       	subi	r24, 0x7B	; 123
 406:	91 09       	sbc	r25, r1
 408:	90 93 67 00 	sts	0x0067, r25	; 0x800067 <globalTimer+0x1>
 40c:	80 93 66 00 	sts	0x0066, r24	; 0x800066 <globalTimer>
 410:	88 95       	sleep
 412:	ee ce       	rjmp	.-548    	; 0x1f0 <main+0x48>
 414:	1f 5f       	subi	r17, 0xFF	; 255
 416:	17 70       	andi	r17, 0x07	; 7
 418:	84 60       	ori	r24, 0x04	; 4
 41a:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
 41e:	69 cf       	rjmp	.-302    	; 0x2f2 <main+0x14a>

00000420 <_exit>:
 420:	f8 94       	cli

00000422 <__stop_program>:
 422:	ff cf       	rjmp	.-2      	; 0x422 <__stop_program>

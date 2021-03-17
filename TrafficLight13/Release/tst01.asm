
./Release/tst01.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	09 c0       	rjmp	.+18     	; 0x14 <__ctors_end>
   2:	16 c0       	rjmp	.+44     	; 0x30 <__bad_interrupt>
   4:	15 c0       	rjmp	.+42     	; 0x30 <__bad_interrupt>
   6:	14 c0       	rjmp	.+40     	; 0x30 <__bad_interrupt>
   8:	13 c0       	rjmp	.+38     	; 0x30 <__bad_interrupt>
   a:	12 c0       	rjmp	.+36     	; 0x30 <__bad_interrupt>
   c:	11 c0       	rjmp	.+34     	; 0x30 <__bad_interrupt>
   e:	10 c0       	rjmp	.+32     	; 0x30 <__bad_interrupt>
  10:	0f c0       	rjmp	.+30     	; 0x30 <__bad_interrupt>
  12:	0e c0       	rjmp	.+28     	; 0x30 <__bad_interrupt>

00000014 <__ctors_end>:
  14:	11 24       	eor	r1, r1
  16:	1f be       	out	0x3f, r1	; 63
  18:	cf e9       	ldi	r28, 0x9F	; 159
  1a:	cd bf       	out	0x3d, r28	; 61

0000001c <__do_clear_bss>:
  1c:	20 e0       	ldi	r18, 0x00	; 0
  1e:	a0 e6       	ldi	r26, 0x60	; 96
  20:	b0 e0       	ldi	r27, 0x00	; 0
  22:	01 c0       	rjmp	.+2      	; 0x26 <.do_clear_bss_start>

00000024 <.do_clear_bss_loop>:
  24:	1d 92       	st	X+, r1

00000026 <.do_clear_bss_start>:
  26:	aa 36       	cpi	r26, 0x6A	; 106
  28:	b2 07       	cpc	r27, r18
  2a:	e1 f7       	brne	.-8      	; 0x24 <.do_clear_bss_loop>
  2c:	02 d0       	rcall	.+4      	; 0x32 <main>
  2e:	6e c0       	rjmp	.+220    	; 0x10c <_exit>

00000030 <__bad_interrupt>:
  30:	e7 cf       	rjmp	.-50     	; 0x0 <__vectors>

00000032 <main>:
  32:	cf 93       	push	r28
  34:	df 93       	push	r29
  36:	00 d0       	rcall	.+0      	; 0x38 <main+0x6>
  38:	cd b7       	in	r28, 0x3d	; 61
  3a:	dd 27       	eor	r29, r29
  3c:	1a 82       	std	Y+2, r1	; 0x02
  3e:	19 82       	std	Y+1, r1	; 0x01
  40:	89 81       	ldd	r24, Y+1	; 0x01
  42:	9a 81       	ldd	r25, Y+2	; 0x02
  44:	04 97       	sbiw	r24, 0x04	; 4
  46:	78 f4       	brcc	.+30     	; 0x66 <__SREG__+0x27>
  48:	89 81       	ldd	r24, Y+1	; 0x01
  4a:	80 5d       	subi	r24, 0xD0	; 208
  4c:	28 2f       	mov	r18, r24
  4e:	89 81       	ldd	r24, Y+1	; 0x01
  50:	9a 81       	ldd	r25, Y+2	; 0x02
  52:	80 5a       	subi	r24, 0xA0	; 160
  54:	9f 4f       	sbci	r25, 0xFF	; 255
  56:	fc 01       	movw	r30, r24
  58:	20 83       	st	Z, r18
  5a:	89 81       	ldd	r24, Y+1	; 0x01
  5c:	9a 81       	ldd	r25, Y+2	; 0x02
  5e:	01 96       	adiw	r24, 0x01	; 1
  60:	9a 83       	std	Y+2, r25	; 0x02
  62:	89 83       	std	Y+1, r24	; 0x01
  64:	ed cf       	rjmp	.-38     	; 0x40 <__SREG__+0x1>
  66:	83 e0       	ldi	r24, 0x03	; 3
  68:	90 e0       	ldi	r25, 0x00	; 0
  6a:	80 5a       	subi	r24, 0xA0	; 160
  6c:	9f 4f       	sbci	r25, 0xFF	; 255
  6e:	fc 01       	movw	r30, r24
  70:	80 81       	ld	r24, Z
  72:	08 2e       	mov	r0, r24
  74:	00 0c       	add	r0, r0
  76:	99 0b       	sbc	r25, r25
  78:	07 d0       	rcall	.+14     	; 0x88 <putchar>
  7a:	80 e0       	ldi	r24, 0x00	; 0
  7c:	90 e0       	ldi	r25, 0x00	; 0
  7e:	ce 5f       	subi	r28, 0xFE	; 254
  80:	cd bf       	out	0x3d, r28	; 61
  82:	df 91       	pop	r29
  84:	cf 91       	pop	r28
  86:	08 95       	ret

00000088 <putchar>:
  88:	60 91 66 00 	lds	r22, 0x0066	; 0x800066 <__iob+0x2>
  8c:	70 91 67 00 	lds	r23, 0x0067	; 0x800067 <__iob+0x3>
  90:	01 d0       	rcall	.+2      	; 0x94 <fputc>
  92:	08 95       	ret

00000094 <fputc>:
  94:	0f 93       	push	r16
  96:	1f 93       	push	r17
  98:	cf 93       	push	r28
  9a:	df 93       	push	r29
  9c:	fb 01       	movw	r30, r22
  9e:	23 81       	ldd	r18, Z+3	; 0x03
  a0:	21 fd       	sbrc	r18, 1
  a2:	03 c0       	rjmp	.+6      	; 0xaa <__stack+0xb>
  a4:	8f ef       	ldi	r24, 0xFF	; 255
  a6:	9f ef       	ldi	r25, 0xFF	; 255
  a8:	2c c0       	rjmp	.+88     	; 0x102 <__stack+0x63>
  aa:	22 ff       	sbrs	r18, 2
  ac:	16 c0       	rjmp	.+44     	; 0xda <__stack+0x3b>
  ae:	46 81       	ldd	r20, Z+6	; 0x06
  b0:	57 81       	ldd	r21, Z+7	; 0x07
  b2:	24 81       	ldd	r18, Z+4	; 0x04
  b4:	35 81       	ldd	r19, Z+5	; 0x05
  b6:	42 17       	cp	r20, r18
  b8:	53 07       	cpc	r21, r19
  ba:	44 f4       	brge	.+16     	; 0xcc <__stack+0x2d>
  bc:	a0 81       	ld	r26, Z
  be:	b1 81       	ldd	r27, Z+1	; 0x01
  c0:	9d 01       	movw	r18, r26
  c2:	2f 5f       	subi	r18, 0xFF	; 255
  c4:	3f 4f       	sbci	r19, 0xFF	; 255
  c6:	31 83       	std	Z+1, r19	; 0x01
  c8:	20 83       	st	Z, r18
  ca:	8c 93       	st	X, r24
  cc:	26 81       	ldd	r18, Z+6	; 0x06
  ce:	37 81       	ldd	r19, Z+7	; 0x07
  d0:	2f 5f       	subi	r18, 0xFF	; 255
  d2:	3f 4f       	sbci	r19, 0xFF	; 255
  d4:	37 83       	std	Z+7, r19	; 0x07
  d6:	26 83       	std	Z+6, r18	; 0x06
  d8:	14 c0       	rjmp	.+40     	; 0x102 <__stack+0x63>
  da:	8b 01       	movw	r16, r22
  dc:	ec 01       	movw	r28, r24
  de:	fb 01       	movw	r30, r22
  e0:	00 84       	ldd	r0, Z+8	; 0x08
  e2:	f1 85       	ldd	r31, Z+9	; 0x09
  e4:	e0 2d       	mov	r30, r0
  e6:	09 95       	icall
  e8:	89 2b       	or	r24, r25
  ea:	e1 f6       	brne	.-72     	; 0xa4 <__stack+0x5>
  ec:	d8 01       	movw	r26, r16
  ee:	16 96       	adiw	r26, 0x06	; 6
  f0:	8d 91       	ld	r24, X+
  f2:	9c 91       	ld	r25, X
  f4:	17 97       	sbiw	r26, 0x07	; 7
  f6:	01 96       	adiw	r24, 0x01	; 1
  f8:	17 96       	adiw	r26, 0x07	; 7
  fa:	9c 93       	st	X, r25
  fc:	8e 93       	st	-X, r24
  fe:	16 97       	sbiw	r26, 0x06	; 6
 100:	ce 01       	movw	r24, r28
 102:	df 91       	pop	r29
 104:	cf 91       	pop	r28
 106:	1f 91       	pop	r17
 108:	0f 91       	pop	r16
 10a:	08 95       	ret

0000010c <_exit>:
 10c:	f8 94       	cli

0000010e <__stop_program>:
 10e:	ff cf       	rjmp	.-2      	; 0x10e <__stop_program>


./Release/tst02.elf:     file format elf32-avr


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
  26:	a6 36       	cpi	r26, 0x66	; 102
  28:	b2 07       	cpc	r27, r18
  2a:	e1 f7       	brne	.-8      	; 0x24 <.do_clear_bss_loop>
  2c:	02 d0       	rcall	.+4      	; 0x32 <main>
  2e:	75 c0       	rjmp	.+234    	; 0x11a <_exit>

00000030 <__bad_interrupt>:
  30:	e7 cf       	rjmp	.-50     	; 0x0 <__vectors>

00000032 <main>:
  32:	cf 93       	push	r28
  34:	df 93       	push	r29
  36:	cd b7       	in	r28, 0x3d	; 61
  38:	dd 27       	eor	r29, r29
  3a:	c6 50       	subi	r28, 0x06	; 6
  3c:	cd bf       	out	0x3d, r28	; 61
  3e:	1a 82       	std	Y+2, r1	; 0x02
  40:	19 82       	std	Y+1, r1	; 0x01
  42:	89 81       	ldd	r24, Y+1	; 0x01
  44:	9a 81       	ldd	r25, Y+2	; 0x02
  46:	04 97       	sbiw	r24, 0x04	; 4
  48:	90 f4       	brcc	.+36     	; 0x6e <__SREG__+0x2f>
  4a:	89 81       	ldd	r24, Y+1	; 0x01
  4c:	80 5d       	subi	r24, 0xD0	; 208
  4e:	48 2f       	mov	r20, r24
  50:	9e 01       	movw	r18, r28
  52:	2d 5f       	subi	r18, 0xFD	; 253
  54:	3f 4f       	sbci	r19, 0xFF	; 255
  56:	89 81       	ldd	r24, Y+1	; 0x01
  58:	9a 81       	ldd	r25, Y+2	; 0x02
  5a:	82 0f       	add	r24, r18
  5c:	93 1f       	adc	r25, r19
  5e:	fc 01       	movw	r30, r24
  60:	40 83       	st	Z, r20
  62:	89 81       	ldd	r24, Y+1	; 0x01
  64:	9a 81       	ldd	r25, Y+2	; 0x02
  66:	01 96       	adiw	r24, 0x01	; 1
  68:	9a 83       	std	Y+2, r25	; 0x02
  6a:	89 83       	std	Y+1, r24	; 0x01
  6c:	ea cf       	rjmp	.-44     	; 0x42 <__SREG__+0x3>
  6e:	83 e0       	ldi	r24, 0x03	; 3
  70:	90 e0       	ldi	r25, 0x00	; 0
  72:	9e 01       	movw	r18, r28
  74:	2d 5f       	subi	r18, 0xFD	; 253
  76:	3f 4f       	sbci	r19, 0xFF	; 255
  78:	82 0f       	add	r24, r18
  7a:	93 1f       	adc	r25, r19
  7c:	fc 01       	movw	r30, r24
  7e:	80 81       	ld	r24, Z
  80:	08 2e       	mov	r0, r24
  82:	00 0c       	add	r0, r0
  84:	99 0b       	sbc	r25, r25
  86:	07 d0       	rcall	.+14     	; 0x96 <putchar>
  88:	80 e0       	ldi	r24, 0x00	; 0
  8a:	90 e0       	ldi	r25, 0x00	; 0
  8c:	ca 5f       	subi	r28, 0xFA	; 250
  8e:	cd bf       	out	0x3d, r28	; 61
  90:	df 91       	pop	r29
  92:	cf 91       	pop	r28
  94:	08 95       	ret

00000096 <putchar>:
  96:	60 91 62 00 	lds	r22, 0x0062	; 0x800062 <_edata+0x2>
  9a:	70 91 63 00 	lds	r23, 0x0063	; 0x800063 <_edata+0x3>
  9e:	01 d0       	rcall	.+2      	; 0xa2 <fputc>
  a0:	08 95       	ret

000000a2 <fputc>:
  a2:	0f 93       	push	r16
  a4:	1f 93       	push	r17
  a6:	cf 93       	push	r28
  a8:	df 93       	push	r29
  aa:	fb 01       	movw	r30, r22
  ac:	23 81       	ldd	r18, Z+3	; 0x03
  ae:	21 fd       	sbrc	r18, 1
  b0:	03 c0       	rjmp	.+6      	; 0xb8 <fputc+0x16>
  b2:	8f ef       	ldi	r24, 0xFF	; 255
  b4:	9f ef       	ldi	r25, 0xFF	; 255
  b6:	2c c0       	rjmp	.+88     	; 0x110 <fputc+0x6e>
  b8:	22 ff       	sbrs	r18, 2
  ba:	16 c0       	rjmp	.+44     	; 0xe8 <fputc+0x46>
  bc:	46 81       	ldd	r20, Z+6	; 0x06
  be:	57 81       	ldd	r21, Z+7	; 0x07
  c0:	24 81       	ldd	r18, Z+4	; 0x04
  c2:	35 81       	ldd	r19, Z+5	; 0x05
  c4:	42 17       	cp	r20, r18
  c6:	53 07       	cpc	r21, r19
  c8:	44 f4       	brge	.+16     	; 0xda <fputc+0x38>
  ca:	a0 81       	ld	r26, Z
  cc:	b1 81       	ldd	r27, Z+1	; 0x01
  ce:	9d 01       	movw	r18, r26
  d0:	2f 5f       	subi	r18, 0xFF	; 255
  d2:	3f 4f       	sbci	r19, 0xFF	; 255
  d4:	31 83       	std	Z+1, r19	; 0x01
  d6:	20 83       	st	Z, r18
  d8:	8c 93       	st	X, r24
  da:	26 81       	ldd	r18, Z+6	; 0x06
  dc:	37 81       	ldd	r19, Z+7	; 0x07
  de:	2f 5f       	subi	r18, 0xFF	; 255
  e0:	3f 4f       	sbci	r19, 0xFF	; 255
  e2:	37 83       	std	Z+7, r19	; 0x07
  e4:	26 83       	std	Z+6, r18	; 0x06
  e6:	14 c0       	rjmp	.+40     	; 0x110 <fputc+0x6e>
  e8:	8b 01       	movw	r16, r22
  ea:	ec 01       	movw	r28, r24
  ec:	fb 01       	movw	r30, r22
  ee:	00 84       	ldd	r0, Z+8	; 0x08
  f0:	f1 85       	ldd	r31, Z+9	; 0x09
  f2:	e0 2d       	mov	r30, r0
  f4:	09 95       	icall
  f6:	89 2b       	or	r24, r25
  f8:	e1 f6       	brne	.-72     	; 0xb2 <fputc+0x10>
  fa:	d8 01       	movw	r26, r16
  fc:	16 96       	adiw	r26, 0x06	; 6
  fe:	8d 91       	ld	r24, X+
 100:	9c 91       	ld	r25, X
 102:	17 97       	sbiw	r26, 0x07	; 7
 104:	01 96       	adiw	r24, 0x01	; 1
 106:	17 96       	adiw	r26, 0x07	; 7
 108:	9c 93       	st	X, r25
 10a:	8e 93       	st	-X, r24
 10c:	16 97       	sbiw	r26, 0x06	; 6
 10e:	ce 01       	movw	r24, r28
 110:	df 91       	pop	r29
 112:	cf 91       	pop	r28
 114:	1f 91       	pop	r17
 116:	0f 91       	pop	r16
 118:	08 95       	ret

0000011a <_exit>:
 11a:	f8 94       	cli

0000011c <__stop_program>:
 11c:	ff cf       	rjmp	.-2      	; 0x11c <__stop_program>

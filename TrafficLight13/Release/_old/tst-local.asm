
./Release/tst-local.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	09 c0       	rjmp	.+18     	; 0x14 <__ctors_end>
   2:	0e c0       	rjmp	.+28     	; 0x20 <__bad_interrupt>
   4:	0d c0       	rjmp	.+26     	; 0x20 <__bad_interrupt>
   6:	0c c0       	rjmp	.+24     	; 0x20 <__bad_interrupt>
   8:	0b c0       	rjmp	.+22     	; 0x20 <__bad_interrupt>
   a:	0a c0       	rjmp	.+20     	; 0x20 <__bad_interrupt>
   c:	09 c0       	rjmp	.+18     	; 0x20 <__bad_interrupt>
   e:	08 c0       	rjmp	.+16     	; 0x20 <__bad_interrupt>
  10:	07 c0       	rjmp	.+14     	; 0x20 <__bad_interrupt>
  12:	06 c0       	rjmp	.+12     	; 0x20 <__bad_interrupt>

00000014 <__ctors_end>:
  14:	11 24       	eor	r1, r1
  16:	1f be       	out	0x3f, r1	; 63
  18:	cf e9       	ldi	r28, 0x9F	; 159
  1a:	cd bf       	out	0x3d, r28	; 61
  1c:	02 d0       	rcall	.+4      	; 0x22 <main>
  1e:	0b c0       	rjmp	.+22     	; 0x36 <_exit>

00000020 <__bad_interrupt>:
  20:	ef cf       	rjmp	.-34     	; 0x0 <__vectors>

00000022 <main>:
  22:	cf 93       	push	r28
  24:	df 93       	push	r29
  26:	1f 92       	push	r1
  28:	cd b7       	in	r28, 0x3d	; 61
  2a:	dd 27       	eor	r29, r29
  2c:	19 82       	std	Y+1, r1	; 0x01
  2e:	89 81       	ldd	r24, Y+1	; 0x01
  30:	8f 5f       	subi	r24, 0xFF	; 255
  32:	89 83       	std	Y+1, r24	; 0x01
  34:	fc cf       	rjmp	.-8      	; 0x2e <main+0xc>

00000036 <_exit>:
  36:	f8 94       	cli

00000038 <__stop_program>:
  38:	ff cf       	rjmp	.-2      	; 0x38 <__stop_program>

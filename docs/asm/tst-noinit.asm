
./Release/tst-noinit.elf:     file format elf32-avr


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
  1e:	0d c0       	rjmp	.+26     	; 0x3a <_exit>

00000020 <__bad_interrupt>:
  20:	ef cf       	rjmp	.-34     	; 0x0 <__vectors>

00000022 <main>:
  22:	cf 93       	push	r28
  24:	df 93       	push	r29
  26:	cd b7       	in	r28, 0x3d	; 61
  28:	dd 27       	eor	r29, r29
  2a:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <_edata>
  2e:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
  32:	8f 5f       	subi	r24, 0xFF	; 255
  34:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
  38:	fa cf       	rjmp	.-12     	; 0x2e <main+0xc>

0000003a <_exit>:
  3a:	f8 94       	cli

0000003c <__stop_program>:
  3c:	ff cf       	rjmp	.-2      	; 0x3c <__stop_program>

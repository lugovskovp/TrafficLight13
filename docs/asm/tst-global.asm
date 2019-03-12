
./Release/tst-global.elf:     file format elf32-avr


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
  26:	a1 36       	cpi	r26, 0x61	; 97
  28:	b2 07       	cpc	r27, r18
  2a:	e1 f7       	brne	.-8      	; 0x24 <.do_clear_bss_loop>
  2c:	02 d0       	rcall	.+4      	; 0x32 <main>
  2e:	0d c0       	rjmp	.+26     	; 0x4a <_exit>

00000030 <__bad_interrupt>:
  30:	e7 cf       	rjmp	.-50     	; 0x0 <__vectors>

00000032 <main>:
  32:	cf 93       	push	r28
  34:	df 93       	push	r29
  36:	cd b7       	in	r28, 0x3d	; 61
  38:	dd 27       	eor	r29, r29
  3a:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <_edata>
  3e:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
  42:	8f 5f       	subi	r24, 0xFF	; 255
  44:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
  48:	fa cf       	rjmp	.-12     	; 0x3e <__SP_L__+0x1>

0000004a <_exit>:
  4a:	f8 94       	cli

0000004c <__stop_program>:
  4c:	ff cf       	rjmp	.-2      	; 0x4c <__stop_program>

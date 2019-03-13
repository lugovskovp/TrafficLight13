
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
  1e:	13 c0       	rjmp	.+38     	; 0x46 <_exit>

00000020 <__bad_interrupt>:
  20:	ef cf       	rjmp	.-34     	; 0x0 <__vectors>

00000022 <main>:
  22:	cf 93       	push	r28
  24:	df 93       	push	r29
  26:	cd b7       	in	r28, 0x3d	; 61
  28:	dd 27       	eor	r29, r29
  2a:	10 92 61 00 	sts	0x0061, r1	; 0x800061 <_edata+0x1>
  2e:	10 92 60 00 	sts	0x0060, r1	; 0x800060 <_edata>
  32:	80 91 60 00 	lds	r24, 0x0060	; 0x800060 <_edata>
  36:	90 91 61 00 	lds	r25, 0x0061	; 0x800061 <_edata+0x1>
  3a:	01 96       	adiw	r24, 0x01	; 1
  3c:	90 93 61 00 	sts	0x0061, r25	; 0x800061 <_edata+0x1>
  40:	80 93 60 00 	sts	0x0060, r24	; 0x800060 <_edata>
  44:	f6 cf       	rjmp	.-20     	; 0x32 <main+0x10>

00000046 <_exit>:
  46:	f8 94       	cli

00000048 <__stop_program>:
  48:	ff cf       	rjmp	.-2      	; 0x48 <__stop_program>

./Release/tst.elf:     file format elf32-avr


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
  1e:	0e c0       	rjmp	.+28     	; 0x3c <_exit>

00000020 <__bad_interrupt>:
  20:	ef cf       	rjmp	.-34     	; 0x0 <__vectors>

00000022 <main>:
  22:	cf 93       	push	r28
  24:	df 93       	push	r29
  26:	00 d0       	rcall	.+0      	; 0x28 <main+0x6>
  28:	cd b7       	in	r28, 0x3d	; 61
  2a:	dd 27       	eor	r29, r29
  2c:	1a 82       	std	Y+2, r1	; 0x02
  2e:	19 82       	std	Y+1, r1	; 0x01
  30:	89 81       	ldd	r24, Y+1	; 0x01
  32:	9a 81       	ldd	r25, Y+2	; 0x02
  34:	01 96       	adiw	r24, 0x01	; 1
  36:	9a 83       	std	Y+2, r25	; 0x02
  38:	89 83       	std	Y+1, r24	; 0x01
  3a:	fa cf       	rjmp	.-12     	; 0x30 <main+0xe>

0000003c <_exit>:
  3c:	f8 94       	cli

0000003e <__stop_program>:
  3e:	ff cf       	rjmp	.-2      	; 0x3e <__stop_program>

./Release/tst.elf:     file format elf32-avr


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
  1e:	0e c0       	rjmp	.+28     	; 0x3c <_exit>

00000020 <__bad_interrupt>:
  20:	ef cf       	rjmp	.-34     	; 0x0 <__vectors>

00000022 <main>:
  22:	cf 93       	push	r28
  24:	df 93       	push	r29
  26:	00 d0       	rcall	.+0      	; 0x28 <main+0x6>
  28:	cd b7       	in	r28, 0x3d	; 61
  2a:	dd 27       	eor	r29, r29
  2c:	1a 82       	std	Y+2, r1	; 0x02
  2e:	19 82       	std	Y+1, r1	; 0x01
  30:	89 81       	ldd	r24, Y+1	; 0x01
  32:	9a 81       	ldd	r25, Y+2	; 0x02
  34:	01 96       	adiw	r24, 0x01	; 1
  36:	9a 83       	std	Y+2, r25	; 0x02
  38:	89 83       	std	Y+1, r24	; 0x01
  3a:	fa cf       	rjmp	.-12     	; 0x30 <main+0xe>

0000003c <_exit>:
  3c:	f8 94       	cli

0000003e <__stop_program>:
  3e:	ff cf       	rjmp	.-2      	; 0x3e <__stop_program>

./Release/tst.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   8:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  10:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  14:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  18:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  1c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  20:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  24:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  28:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  2c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  30:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  34:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  38:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  3c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  40:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  44:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  48:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  4c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  50:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  54:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  58:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  5c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  60:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  64:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61
  74:	0e 94 40 00 	call	0x80	; 0x80 <main>
  78:	0c 94 4c 00 	jmp	0x98	; 0x98 <_exit>

0000007c <__bad_interrupt>:
  7c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000080 <main>:
  80:	cf 93       	push	r28
  82:	df 93       	push	r29
  84:	cd b7       	in	r28, 0x3d	; 61
  86:	de b7       	in	r29, 0x3e	; 62
  88:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <_edata>
  8c:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
  90:	8f 5f       	subi	r24, 0xFF	; 255
  92:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <_edata>
  96:	fa cf       	rjmp	.-12     	; 0x8c <main+0xc>

00000098 <_exit>:
  98:	f8 94       	cli

0000009a <__stop_program>:
  9a:	ff cf       	rjmp	.-2      	; 0x9a <__stop_program>

./Release/tst.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
   8:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
   c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  10:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  14:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  18:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  1c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  20:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  24:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  28:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  2c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  30:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  34:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  38:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  3c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  40:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  44:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  48:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  4c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  50:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  54:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  58:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  5c:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  60:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>
  64:	0c 94 46 00 	jmp	0x8c	; 0x8c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61

00000074 <__do_clear_bss>:
  74:	21 e0       	ldi	r18, 0x01	; 1
  76:	a0 e0       	ldi	r26, 0x00	; 0
  78:	b1 e0       	ldi	r27, 0x01	; 1
  7a:	01 c0       	rjmp	.+2      	; 0x7e <.do_clear_bss_start>

0000007c <.do_clear_bss_loop>:
  7c:	1d 92       	st	X+, r1

0000007e <.do_clear_bss_start>:
  7e:	a1 30       	cpi	r26, 0x01	; 1
  80:	b2 07       	cpc	r27, r18
  82:	e1 f7       	brne	.-8      	; 0x7c <.do_clear_bss_loop>
  84:	0e 94 48 00 	call	0x90	; 0x90 <main>
  88:	0c 94 54 00 	jmp	0xa8	; 0xa8 <_exit>

0000008c <__bad_interrupt>:
  8c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000090 <main>:
  90:	cf 93       	push	r28
  92:	df 93       	push	r29
  94:	cd b7       	in	r28, 0x3d	; 61
  96:	de b7       	in	r29, 0x3e	; 62
  98:	10 92 00 01 	sts	0x0100, r1	; 0x800100 <_edata>
  9c:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <_edata>
  a0:	8f 5f       	subi	r24, 0xFF	; 255
  a2:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <_edata>
  a6:	fa cf       	rjmp	.-12     	; 0x9c <main+0xc>

000000a8 <_exit>:
  a8:	f8 94       	cli

000000aa <__stop_program>:
  aa:	ff cf       	rjmp	.-2      	; 0xaa <__stop_program>

./Release/tst.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   8:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
   c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  10:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  14:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  18:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  1c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  20:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  24:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  28:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  2c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  30:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  34:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  38:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  3c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  40:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  44:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  48:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  4c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  50:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  54:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  58:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  5c:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  60:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>
  64:	0c 94 3e 00 	jmp	0x7c	; 0x7c <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61
  74:	0e 94 40 00 	call	0x80	; 0x80 <main>
  78:	0c 94 4a 00 	jmp	0x94	; 0x94 <_exit>

0000007c <__bad_interrupt>:
  7c:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

00000080 <main>:
  80:	cf 93       	push	r28
  82:	df 93       	push	r29
  84:	1f 92       	push	r1
  86:	cd b7       	in	r28, 0x3d	; 61
  88:	de b7       	in	r29, 0x3e	; 62
  8a:	19 82       	std	Y+1, r1	; 0x01
  8c:	89 81       	ldd	r24, Y+1	; 0x01
  8e:	8f 5f       	subi	r24, 0xFF	; 255
  90:	89 83       	std	Y+1, r24	; 0x01
  92:	fc cf       	rjmp	.-8      	; 0x8c <main+0xc>

00000094 <_exit>:
  94:	f8 94       	cli

00000096 <__stop_program>:
  96:	ff cf       	rjmp	.-2      	; 0x96 <__stop_program>

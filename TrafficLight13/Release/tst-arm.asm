
./Release/tst-arm.elf:     file format elf32-littlearm


Disassembly of section .init:

00008000 <_init>:
    8000:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8002:	bf00      	nop
    8004:	bcf8      	pop	{r3, r4, r5, r6, r7}
    8006:	bc08      	pop	{r3}
    8008:	469e      	mov	lr, r3
    800a:	4770      	bx	lr

Disassembly of section .text:

0000800c <exit>:
    800c:	b508      	push	{r3, lr}
    800e:	2100      	movs	r1, #0
    8010:	4604      	mov	r4, r0
    8012:	f000 f925 	bl	8260 <__call_exitprocs>
    8016:	f248 43a0 	movw	r3, #33952	; 0x84a0
    801a:	f2c0 0300 	movt	r3, #0
    801e:	6818      	ldr	r0, [r3, #0]
    8020:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
    8022:	b103      	cbz	r3, 8026 <exit+0x1a>
    8024:	4798      	blx	r3
    8026:	4620      	mov	r0, r4
    8028:	f000 fa32 	bl	8490 <_exit>

0000802c <register_fini>:
    802c:	f240 0300 	movw	r3, #0
    8030:	f2c0 0300 	movt	r3, #0
    8034:	b12b      	cbz	r3, 8042 <register_fini+0x16>
    8036:	f248 3065 	movw	r0, #33637	; 0x8365
    803a:	f2c0 0000 	movt	r0, #0
    803e:	f000 b98b 	b.w	8358 <atexit>
    8042:	4770      	bx	lr

00008044 <__do_global_dtors_aux>:
    8044:	b510      	push	{r4, lr}
    8046:	f648 04f4 	movw	r4, #35060	; 0x88f4
    804a:	f2c0 0401 	movt	r4, #1
    804e:	7823      	ldrb	r3, [r4, #0]
    8050:	b963      	cbnz	r3, 806c <__do_global_dtors_aux+0x28>
    8052:	f240 0300 	movw	r3, #0
    8056:	f2c0 0300 	movt	r3, #0
    805a:	b12b      	cbz	r3, 8068 <__do_global_dtors_aux+0x24>
    805c:	f248 40ac 	movw	r0, #33964	; 0x84ac
    8060:	f2c0 0000 	movt	r0, #0
    8064:	f3af 8000 	nop.w
    8068:	2301      	movs	r3, #1
    806a:	7023      	strb	r3, [r4, #0]
    806c:	bd10      	pop	{r4, pc}
    806e:	bf00      	nop

00008070 <frame_dummy>:
    8070:	f240 0300 	movw	r3, #0
    8074:	f2c0 0300 	movt	r3, #0
    8078:	b18b      	cbz	r3, 809e <frame_dummy+0x2e>
    807a:	b510      	push	{r4, lr}
    807c:	f648 01f8 	movw	r1, #35064	; 0x88f8
    8080:	f248 40ac 	movw	r0, #33964	; 0x84ac
    8084:	f2c0 0101 	movt	r1, #1
    8088:	f2c0 0000 	movt	r0, #0
    808c:	f3af 8000 	nop.w
    8090:	f248 40bc 	movw	r0, #33980	; 0x84bc
    8094:	f2c0 0001 	movt	r0, #1
    8098:	6803      	ldr	r3, [r0, #0]
    809a:	b93b      	cbnz	r3, 80ac <frame_dummy+0x3c>
    809c:	bd10      	pop	{r4, pc}
    809e:	f248 40bc 	movw	r0, #33980	; 0x84bc
    80a2:	f2c0 0001 	movt	r0, #1
    80a6:	6803      	ldr	r3, [r0, #0]
    80a8:	b94b      	cbnz	r3, 80be <frame_dummy+0x4e>
    80aa:	4770      	bx	lr
    80ac:	f240 0300 	movw	r3, #0
    80b0:	f2c0 0300 	movt	r3, #0
    80b4:	2b00      	cmp	r3, #0
    80b6:	d0f1      	beq.n	809c <frame_dummy+0x2c>
    80b8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    80bc:	4718      	bx	r3
    80be:	f240 0300 	movw	r3, #0
    80c2:	f2c0 0300 	movt	r3, #0
    80c6:	2b00      	cmp	r3, #0
    80c8:	d0ef      	beq.n	80aa <frame_dummy+0x3a>
    80ca:	4718      	bx	r3

000080cc <_mainCRTStartup>:
    80cc:	4b15      	ldr	r3, [pc, #84]	; (8124 <_mainCRTStartup+0x58>)
    80ce:	2b00      	cmp	r3, #0
    80d0:	bf08      	it	eq
    80d2:	4b13      	ldreq	r3, [pc, #76]	; (8120 <_mainCRTStartup+0x54>)
    80d4:	469d      	mov	sp, r3
    80d6:	f5a3 3a80 	sub.w	sl, r3, #65536	; 0x10000
    80da:	2100      	movs	r1, #0
    80dc:	468b      	mov	fp, r1
    80de:	460f      	mov	r7, r1
    80e0:	4813      	ldr	r0, [pc, #76]	; (8130 <_mainCRTStartup+0x64>)
    80e2:	4a14      	ldr	r2, [pc, #80]	; (8134 <_mainCRTStartup+0x68>)
    80e4:	1a12      	subs	r2, r2, r0
    80e6:	f000 f869 	bl	81bc <memset>
    80ea:	4b0f      	ldr	r3, [pc, #60]	; (8128 <_mainCRTStartup+0x5c>)
    80ec:	2b00      	cmp	r3, #0
    80ee:	d000      	beq.n	80f2 <_mainCRTStartup+0x26>
    80f0:	4798      	blx	r3
    80f2:	4b0e      	ldr	r3, [pc, #56]	; (812c <_mainCRTStartup+0x60>)
    80f4:	2b00      	cmp	r3, #0
    80f6:	d000      	beq.n	80fa <_mainCRTStartup+0x2e>
    80f8:	4798      	blx	r3
    80fa:	2000      	movs	r0, #0
    80fc:	2100      	movs	r1, #0
    80fe:	0004      	movs	r4, r0
    8100:	000d      	movs	r5, r1
    8102:	480d      	ldr	r0, [pc, #52]	; (8138 <_mainCRTStartup+0x6c>)
    8104:	2800      	cmp	r0, #0
    8106:	d002      	beq.n	810e <_mainCRTStartup+0x42>
    8108:	480c      	ldr	r0, [pc, #48]	; (813c <_mainCRTStartup+0x70>)
    810a:	f000 f925 	bl	8358 <atexit>
    810e:	f000 f829 	bl	8164 <__libc_init_array>
    8112:	0020      	movs	r0, r4
    8114:	0029      	movs	r1, r5
    8116:	f000 e814 	blx	8140 <main>
    811a:	f7ff ff77 	bl	800c <exit>
    811e:	bf00      	nop
    8120:	00080000 	.word	0x00080000
	...
    8130:	000188f4 	.word	0x000188f4
    8134:	00018934 	.word	0x00018934
    8138:	00008359 	.word	0x00008359
    813c:	00008365 	.word	0x00008365

00008140 <main>:
    8140:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    8144:	e28db000 	add	fp, sp, #0
    8148:	e24dd00c 	sub	sp, sp, #12
    814c:	e3a03000 	mov	r3, #0
    8150:	e54b3005 	strb	r3, [fp, #-5]
    8154:	e55b3005 	ldrb	r3, [fp, #-5]
    8158:	e2833001 	add	r3, r3, #1
    815c:	e54b3005 	strb	r3, [fp, #-5]
    8160:	eafffffb 	b	8154 <main+0x14>

00008164 <__libc_init_array>:
    8164:	b570      	push	{r4, r5, r6, lr}
    8166:	f248 46b0 	movw	r6, #33968	; 0x84b0
    816a:	f248 45b0 	movw	r5, #33968	; 0x84b0
    816e:	f2c0 0601 	movt	r6, #1
    8172:	f2c0 0501 	movt	r5, #1
    8176:	1b76      	subs	r6, r6, r5
    8178:	10b6      	asrs	r6, r6, #2
    817a:	bf18      	it	ne
    817c:	2400      	movne	r4, #0
    817e:	d005      	beq.n	818c <__libc_init_array+0x28>
    8180:	3401      	adds	r4, #1
    8182:	f855 3b04 	ldr.w	r3, [r5], #4
    8186:	4798      	blx	r3
    8188:	42a6      	cmp	r6, r4
    818a:	d1f9      	bne.n	8180 <__libc_init_array+0x1c>
    818c:	f248 46b8 	movw	r6, #33976	; 0x84b8
    8190:	f248 45b0 	movw	r5, #33968	; 0x84b0
    8194:	f2c0 0601 	movt	r6, #1
    8198:	f2c0 0501 	movt	r5, #1
    819c:	1b76      	subs	r6, r6, r5
    819e:	f7ff ff2f 	bl	8000 <_init>
    81a2:	10b6      	asrs	r6, r6, #2
    81a4:	bf18      	it	ne
    81a6:	2400      	movne	r4, #0
    81a8:	d006      	beq.n	81b8 <__libc_init_array+0x54>
    81aa:	3401      	adds	r4, #1
    81ac:	f855 3b04 	ldr.w	r3, [r5], #4
    81b0:	4798      	blx	r3
    81b2:	42a6      	cmp	r6, r4
    81b4:	d1f9      	bne.n	81aa <__libc_init_array+0x46>
    81b6:	bd70      	pop	{r4, r5, r6, pc}
    81b8:	bd70      	pop	{r4, r5, r6, pc}
    81ba:	bf00      	nop

000081bc <memset>:
    81bc:	b4f0      	push	{r4, r5, r6, r7}
    81be:	0786      	lsls	r6, r0, #30
    81c0:	d04a      	beq.n	8258 <memset+0x9c>
    81c2:	1e54      	subs	r4, r2, #1
    81c4:	2a00      	cmp	r2, #0
    81c6:	d045      	beq.n	8254 <memset+0x98>
    81c8:	b2ca      	uxtb	r2, r1
    81ca:	4603      	mov	r3, r0
    81cc:	e002      	b.n	81d4 <memset+0x18>
    81ce:	f114 34ff 	adds.w	r4, r4, #4294967295
    81d2:	d33f      	bcc.n	8254 <memset+0x98>
    81d4:	f803 2b01 	strb.w	r2, [r3], #1
    81d8:	079d      	lsls	r5, r3, #30
    81da:	d1f8      	bne.n	81ce <memset+0x12>
    81dc:	2c03      	cmp	r4, #3
    81de:	d932      	bls.n	8246 <memset+0x8a>
    81e0:	b2cd      	uxtb	r5, r1
    81e2:	2c0f      	cmp	r4, #15
    81e4:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
    81e8:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
    81ec:	d91b      	bls.n	8226 <memset+0x6a>
    81ee:	f1a4 0710 	sub.w	r7, r4, #16
    81f2:	f103 0210 	add.w	r2, r3, #16
    81f6:	f027 060f 	bic.w	r6, r7, #15
    81fa:	3620      	adds	r6, #32
    81fc:	441e      	add	r6, r3
    81fe:	f842 5c10 	str.w	r5, [r2, #-16]
    8202:	3210      	adds	r2, #16
    8204:	f842 5c1c 	str.w	r5, [r2, #-28]
    8208:	f842 5c18 	str.w	r5, [r2, #-24]
    820c:	f842 5c14 	str.w	r5, [r2, #-20]
    8210:	42b2      	cmp	r2, r6
    8212:	d1f4      	bne.n	81fe <memset+0x42>
    8214:	f004 040f 	and.w	r4, r4, #15
    8218:	f027 070f 	bic.w	r7, r7, #15
    821c:	2c03      	cmp	r4, #3
    821e:	f107 0710 	add.w	r7, r7, #16
    8222:	443b      	add	r3, r7
    8224:	d90f      	bls.n	8246 <memset+0x8a>
    8226:	1f27      	subs	r7, r4, #4
    8228:	461a      	mov	r2, r3
    822a:	f027 0603 	bic.w	r6, r7, #3
    822e:	3604      	adds	r6, #4
    8230:	441e      	add	r6, r3
    8232:	f842 5b04 	str.w	r5, [r2], #4
    8236:	4296      	cmp	r6, r2
    8238:	d1fb      	bne.n	8232 <memset+0x76>
    823a:	f027 0703 	bic.w	r7, r7, #3
    823e:	f004 0403 	and.w	r4, r4, #3
    8242:	3704      	adds	r7, #4
    8244:	443b      	add	r3, r7
    8246:	b12c      	cbz	r4, 8254 <memset+0x98>
    8248:	b2c9      	uxtb	r1, r1
    824a:	441c      	add	r4, r3
    824c:	f803 1b01 	strb.w	r1, [r3], #1
    8250:	429c      	cmp	r4, r3
    8252:	d1fb      	bne.n	824c <memset+0x90>
    8254:	bcf0      	pop	{r4, r5, r6, r7}
    8256:	4770      	bx	lr
    8258:	4614      	mov	r4, r2
    825a:	4603      	mov	r3, r0
    825c:	e7be      	b.n	81dc <memset+0x20>
    825e:	bf00      	nop

00008260 <__call_exitprocs>:
    8260:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8264:	f648 03f0 	movw	r3, #35056	; 0x88f0
    8268:	b087      	sub	sp, #28
    826a:	f2c0 0301 	movt	r3, #1
    826e:	460e      	mov	r6, r1
    8270:	9305      	str	r3, [sp, #20]
    8272:	9001      	str	r0, [sp, #4]
    8274:	6818      	ldr	r0, [r3, #0]
    8276:	f240 0300 	movw	r3, #0
    827a:	461c      	mov	r4, r3
    827c:	f000 f896 	bl	83ac <__retarget_lock_acquire_recursive>
    8280:	f248 43a0 	movw	r3, #33952	; 0x84a0
    8284:	f2c0 0300 	movt	r3, #0
    8288:	4622      	mov	r2, r4
    828a:	f2c0 0200 	movt	r2, #0
    828e:	681b      	ldr	r3, [r3, #0]
    8290:	9202      	str	r2, [sp, #8]
    8292:	9303      	str	r3, [sp, #12]
    8294:	f503 73a4 	add.w	r3, r3, #328	; 0x148
    8298:	9304      	str	r3, [sp, #16]
    829a:	9b03      	ldr	r3, [sp, #12]
    829c:	f8d3 7148 	ldr.w	r7, [r3, #328]	; 0x148
    82a0:	b32f      	cbz	r7, 82ee <__call_exitprocs+0x8e>
    82a2:	f8dd b010 	ldr.w	fp, [sp, #16]
    82a6:	f04f 0a01 	mov.w	sl, #1
    82aa:	687c      	ldr	r4, [r7, #4]
    82ac:	1e65      	subs	r5, r4, #1
    82ae:	bf5e      	ittt	pl
    82b0:	3401      	addpl	r4, #1
    82b2:	f04f 0900 	movpl.w	r9, #0
    82b6:	eb07 0484 	addpl.w	r4, r7, r4, lsl #2
    82ba:	d408      	bmi.n	82ce <__call_exitprocs+0x6e>
    82bc:	b1f6      	cbz	r6, 82fc <__call_exitprocs+0x9c>
    82be:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
    82c2:	429e      	cmp	r6, r3
    82c4:	d01a      	beq.n	82fc <__call_exitprocs+0x9c>
    82c6:	3d01      	subs	r5, #1
    82c8:	3c04      	subs	r4, #4
    82ca:	1c6b      	adds	r3, r5, #1
    82cc:	d1f6      	bne.n	82bc <__call_exitprocs+0x5c>
    82ce:	9b02      	ldr	r3, [sp, #8]
    82d0:	b16b      	cbz	r3, 82ee <__call_exitprocs+0x8e>
    82d2:	687b      	ldr	r3, [r7, #4]
    82d4:	2b00      	cmp	r3, #0
    82d6:	d139      	bne.n	834c <__call_exitprocs+0xec>
    82d8:	683b      	ldr	r3, [r7, #0]
    82da:	b143      	cbz	r3, 82ee <__call_exitprocs+0x8e>
    82dc:	4638      	mov	r0, r7
    82de:	f8cb 3000 	str.w	r3, [fp]
    82e2:	f3af 8000 	nop.w
    82e6:	f8db 7000 	ldr.w	r7, [fp]
    82ea:	2f00      	cmp	r7, #0
    82ec:	d1dd      	bne.n	82aa <__call_exitprocs+0x4a>
    82ee:	9b05      	ldr	r3, [sp, #20]
    82f0:	6818      	ldr	r0, [r3, #0]
    82f2:	b007      	add	sp, #28
    82f4:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    82f8:	f000 b860 	b.w	83bc <__retarget_lock_release_recursive>
    82fc:	687b      	ldr	r3, [r7, #4]
    82fe:	6822      	ldr	r2, [r4, #0]
    8300:	3b01      	subs	r3, #1
    8302:	42ab      	cmp	r3, r5
    8304:	bf0c      	ite	eq
    8306:	607d      	streq	r5, [r7, #4]
    8308:	f8c4 9000 	strne.w	r9, [r4]
    830c:	2a00      	cmp	r2, #0
    830e:	d0da      	beq.n	82c6 <__call_exitprocs+0x66>
    8310:	f8d7 1188 	ldr.w	r1, [r7, #392]	; 0x188
    8314:	fa0a f305 	lsl.w	r3, sl, r5
    8318:	f8d7 8004 	ldr.w	r8, [r7, #4]
    831c:	420b      	tst	r3, r1
    831e:	d00f      	beq.n	8340 <__call_exitprocs+0xe0>
    8320:	f8d7 118c 	ldr.w	r1, [r7, #396]	; 0x18c
    8324:	420b      	tst	r3, r1
    8326:	d10d      	bne.n	8344 <__call_exitprocs+0xe4>
    8328:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
    832c:	9801      	ldr	r0, [sp, #4]
    832e:	4790      	blx	r2
    8330:	687b      	ldr	r3, [r7, #4]
    8332:	4543      	cmp	r3, r8
    8334:	d1b1      	bne.n	829a <__call_exitprocs+0x3a>
    8336:	f8db 3000 	ldr.w	r3, [fp]
    833a:	42bb      	cmp	r3, r7
    833c:	d0c3      	beq.n	82c6 <__call_exitprocs+0x66>
    833e:	e7ac      	b.n	829a <__call_exitprocs+0x3a>
    8340:	4790      	blx	r2
    8342:	e7f5      	b.n	8330 <__call_exitprocs+0xd0>
    8344:	f8d4 0080 	ldr.w	r0, [r4, #128]	; 0x80
    8348:	4790      	blx	r2
    834a:	e7f1      	b.n	8330 <__call_exitprocs+0xd0>
    834c:	46bb      	mov	fp, r7
    834e:	683f      	ldr	r7, [r7, #0]
    8350:	2f00      	cmp	r7, #0
    8352:	d1aa      	bne.n	82aa <__call_exitprocs+0x4a>
    8354:	e7cb      	b.n	82ee <__call_exitprocs+0x8e>
    8356:	bf00      	nop

00008358 <atexit>:
    8358:	2300      	movs	r3, #0
    835a:	4601      	mov	r1, r0
    835c:	461a      	mov	r2, r3
    835e:	4618      	mov	r0, r3
    8360:	f000 b82e 	b.w	83c0 <__register_exitproc>

00008364 <__libc_fini_array>:
    8364:	b538      	push	{r3, r4, r5, lr}
    8366:	f248 44bc 	movw	r4, #33980	; 0x84bc
    836a:	f248 45b8 	movw	r5, #33976	; 0x84b8
    836e:	f2c0 0401 	movt	r4, #1
    8372:	f2c0 0501 	movt	r5, #1
    8376:	1b64      	subs	r4, r4, r5
    8378:	10a4      	asrs	r4, r4, #2
    837a:	bf18      	it	ne
    837c:	eb05 0584 	addne.w	r5, r5, r4, lsl #2
    8380:	d005      	beq.n	838e <__libc_fini_array+0x2a>
    8382:	3c01      	subs	r4, #1
    8384:	f855 3d04 	ldr.w	r3, [r5, #-4]!
    8388:	4798      	blx	r3
    838a:	2c00      	cmp	r4, #0
    838c:	d1f9      	bne.n	8382 <__libc_fini_array+0x1e>
    838e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    8392:	f000 b87f 	b.w	8494 <_fini>
    8396:	bf00      	nop

00008398 <__retarget_lock_init>:
    8398:	4770      	bx	lr
    839a:	bf00      	nop

0000839c <__retarget_lock_init_recursive>:
    839c:	4770      	bx	lr
    839e:	bf00      	nop

000083a0 <__retarget_lock_close>:
    83a0:	4770      	bx	lr
    83a2:	bf00      	nop

000083a4 <__retarget_lock_close_recursive>:
    83a4:	4770      	bx	lr
    83a6:	bf00      	nop

000083a8 <__retarget_lock_acquire>:
    83a8:	4770      	bx	lr
    83aa:	bf00      	nop

000083ac <__retarget_lock_acquire_recursive>:
    83ac:	4770      	bx	lr
    83ae:	bf00      	nop

000083b0 <__retarget_lock_try_acquire>:
    83b0:	2001      	movs	r0, #1
    83b2:	4770      	bx	lr

000083b4 <__retarget_lock_try_acquire_recursive>:
    83b4:	2001      	movs	r0, #1
    83b6:	4770      	bx	lr

000083b8 <__retarget_lock_release>:
    83b8:	4770      	bx	lr
    83ba:	bf00      	nop

000083bc <__retarget_lock_release_recursive>:
    83bc:	4770      	bx	lr
    83be:	bf00      	nop

000083c0 <__register_exitproc>:
    83c0:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    83c4:	f648 04f0 	movw	r4, #35056	; 0x88f0
    83c8:	f2c0 0401 	movt	r4, #1
    83cc:	4605      	mov	r5, r0
    83ce:	461f      	mov	r7, r3
    83d0:	460e      	mov	r6, r1
    83d2:	6820      	ldr	r0, [r4, #0]
    83d4:	4690      	mov	r8, r2
    83d6:	f7ff ffe9 	bl	83ac <__retarget_lock_acquire_recursive>
    83da:	f248 43a0 	movw	r3, #33952	; 0x84a0
    83de:	f2c0 0300 	movt	r3, #0
    83e2:	f8d3 9000 	ldr.w	r9, [r3]
    83e6:	f8d9 3148 	ldr.w	r3, [r9, #328]	; 0x148
    83ea:	2b00      	cmp	r3, #0
    83ec:	d043      	beq.n	8476 <__register_exitproc+0xb6>
    83ee:	685a      	ldr	r2, [r3, #4]
    83f0:	2a1f      	cmp	r2, #31
    83f2:	bfd8      	it	le
    83f4:	f102 0e01 	addle.w	lr, r2, #1
    83f8:	dd19      	ble.n	842e <__register_exitproc+0x6e>
    83fa:	f240 0300 	movw	r3, #0
    83fe:	f2c0 0300 	movt	r3, #0
    8402:	2b00      	cmp	r3, #0
    8404:	d03c      	beq.n	8480 <__register_exitproc+0xc0>
    8406:	f44f 70c8 	mov.w	r0, #400	; 0x190
    840a:	f3af 8000 	nop.w
    840e:	4603      	mov	r3, r0
    8410:	b3b0      	cbz	r0, 8480 <__register_exitproc+0xc0>
    8412:	f8d9 1148 	ldr.w	r1, [r9, #328]	; 0x148
    8416:	2000      	movs	r0, #0
    8418:	4602      	mov	r2, r0
    841a:	f04f 0e01 	mov.w	lr, #1
    841e:	6058      	str	r0, [r3, #4]
    8420:	6019      	str	r1, [r3, #0]
    8422:	f8c9 3148 	str.w	r3, [r9, #328]	; 0x148
    8426:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    842a:	f8c3 018c 	str.w	r0, [r3, #396]	; 0x18c
    842e:	b1bd      	cbz	r5, 8460 <__register_exitproc+0xa0>
    8430:	eb03 0182 	add.w	r1, r3, r2, lsl #2
    8434:	2d02      	cmp	r5, #2
    8436:	f04f 0c01 	mov.w	ip, #1
    843a:	f8c1 8088 	str.w	r8, [r1, #136]	; 0x88
    843e:	fa0c fc02 	lsl.w	ip, ip, r2
    8442:	f8d3 0188 	ldr.w	r0, [r3, #392]	; 0x188
    8446:	ea40 000c 	orr.w	r0, r0, ip
    844a:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    844e:	f8c1 7108 	str.w	r7, [r1, #264]	; 0x108
    8452:	bf02      	ittt	eq
    8454:	f8d3 118c 	ldreq.w	r1, [r3, #396]	; 0x18c
    8458:	ea41 010c 	orreq.w	r1, r1, ip
    845c:	f8c3 118c 	streq.w	r1, [r3, #396]	; 0x18c
    8460:	3202      	adds	r2, #2
    8462:	f8c3 e004 	str.w	lr, [r3, #4]
    8466:	6820      	ldr	r0, [r4, #0]
    8468:	f843 6022 	str.w	r6, [r3, r2, lsl #2]
    846c:	f7ff ffa6 	bl	83bc <__retarget_lock_release_recursive>
    8470:	2000      	movs	r0, #0
    8472:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    8476:	f509 73a6 	add.w	r3, r9, #332	; 0x14c
    847a:	f8c9 3148 	str.w	r3, [r9, #328]	; 0x148
    847e:	e7b6      	b.n	83ee <__register_exitproc+0x2e>
    8480:	6820      	ldr	r0, [r4, #0]
    8482:	f7ff ff9b 	bl	83bc <__retarget_lock_release_recursive>
    8486:	f04f 30ff 	mov.w	r0, #4294967295
    848a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    848e:	bf00      	nop

00008490 <_exit>:
    8490:	e7fe      	b.n	8490 <_exit>
    8492:	bf00      	nop

Disassembly of section .fini:

00008494 <_fini>:
    8494:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8496:	bf00      	nop
    8498:	bcf8      	pop	{r3, r4, r5, r6, r7}
    849a:	bc08      	pop	{r3}
    849c:	469e      	mov	lr, r3
    849e:	4770      	bx	lr

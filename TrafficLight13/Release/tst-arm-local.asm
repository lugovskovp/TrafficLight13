
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
    8012:	f000 f905 	bl	8220 <__call_exitprocs>
    8016:	4b04      	ldr	r3, [pc, #16]	; (8028 <exit+0x1c>)
    8018:	6818      	ldr	r0, [r3, #0]
    801a:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
    801c:	b103      	cbz	r3, 8020 <exit+0x14>
    801e:	4798      	blx	r3
    8020:	4620      	mov	r0, r4
    8022:	f000 fa07 	bl	8434 <_exit>
    8026:	bf00      	nop
    8028:	00008444 	.word	0x00008444

0000802c <register_fini>:
    802c:	4b02      	ldr	r3, [pc, #8]	; (8038 <register_fini+0xc>)
    802e:	b113      	cbz	r3, 8036 <register_fini+0xa>
    8030:	4802      	ldr	r0, [pc, #8]	; (803c <register_fini+0x10>)
    8032:	f000 b969 	b.w	8308 <atexit>
    8036:	4770      	bx	lr
    8038:	00000000 	.word	0x00000000
    803c:	00008315 	.word	0x00008315

00008040 <__do_global_dtors_aux>:
    8040:	b510      	push	{r4, lr}
    8042:	4c05      	ldr	r4, [pc, #20]	; (8058 <__do_global_dtors_aux+0x18>)
    8044:	7823      	ldrb	r3, [r4, #0]
    8046:	b933      	cbnz	r3, 8056 <__do_global_dtors_aux+0x16>
    8048:	4b04      	ldr	r3, [pc, #16]	; (805c <__do_global_dtors_aux+0x1c>)
    804a:	b113      	cbz	r3, 8052 <__do_global_dtors_aux+0x12>
    804c:	4804      	ldr	r0, [pc, #16]	; (8060 <__do_global_dtors_aux+0x20>)
    804e:	f3af 8000 	nop.w
    8052:	2301      	movs	r3, #1
    8054:	7023      	strb	r3, [r4, #0]
    8056:	bd10      	pop	{r4, pc}
    8058:	0001889c 	.word	0x0001889c
    805c:	00000000 	.word	0x00000000
    8060:	00008450 	.word	0x00008450

00008064 <frame_dummy>:
    8064:	4b0c      	ldr	r3, [pc, #48]	; (8098 <frame_dummy+0x34>)
    8066:	b143      	cbz	r3, 807a <frame_dummy+0x16>
    8068:	480c      	ldr	r0, [pc, #48]	; (809c <frame_dummy+0x38>)
    806a:	b510      	push	{r4, lr}
    806c:	490c      	ldr	r1, [pc, #48]	; (80a0 <frame_dummy+0x3c>)
    806e:	f3af 8000 	nop.w
    8072:	480c      	ldr	r0, [pc, #48]	; (80a4 <frame_dummy+0x40>)
    8074:	6803      	ldr	r3, [r0, #0]
    8076:	b923      	cbnz	r3, 8082 <frame_dummy+0x1e>
    8078:	bd10      	pop	{r4, pc}
    807a:	480a      	ldr	r0, [pc, #40]	; (80a4 <frame_dummy+0x40>)
    807c:	6803      	ldr	r3, [r0, #0]
    807e:	b933      	cbnz	r3, 808e <frame_dummy+0x2a>
    8080:	4770      	bx	lr
    8082:	4b09      	ldr	r3, [pc, #36]	; (80a8 <frame_dummy+0x44>)
    8084:	2b00      	cmp	r3, #0
    8086:	d0f7      	beq.n	8078 <frame_dummy+0x14>
    8088:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
    808c:	4718      	bx	r3
    808e:	4b06      	ldr	r3, [pc, #24]	; (80a8 <frame_dummy+0x44>)
    8090:	2b00      	cmp	r3, #0
    8092:	d0f5      	beq.n	8080 <frame_dummy+0x1c>
    8094:	4718      	bx	r3
    8096:	bf00      	nop
    8098:	00000000 	.word	0x00000000
    809c:	00008450 	.word	0x00008450
    80a0:	000188a0 	.word	0x000188a0
    80a4:	00018460 	.word	0x00018460
    80a8:	00000000 	.word	0x00000000

000080ac <_mainCRTStartup>:
    80ac:	4b15      	ldr	r3, [pc, #84]	; (8104 <_mainCRTStartup+0x58>)
    80ae:	2b00      	cmp	r3, #0
    80b0:	bf08      	it	eq
    80b2:	4b13      	ldreq	r3, [pc, #76]	; (8100 <_mainCRTStartup+0x54>)
    80b4:	469d      	mov	sp, r3
    80b6:	f5a3 3a80 	sub.w	sl, r3, #65536	; 0x10000
    80ba:	2100      	movs	r1, #0
    80bc:	468b      	mov	fp, r1
    80be:	460f      	mov	r7, r1
    80c0:	4813      	ldr	r0, [pc, #76]	; (8110 <_mainCRTStartup+0x64>)
    80c2:	4a14      	ldr	r2, [pc, #80]	; (8114 <_mainCRTStartup+0x68>)
    80c4:	1a12      	subs	r2, r2, r0
    80c6:	f000 f85d 	bl	8184 <memset>
    80ca:	4b0f      	ldr	r3, [pc, #60]	; (8108 <_mainCRTStartup+0x5c>)
    80cc:	2b00      	cmp	r3, #0
    80ce:	d000      	beq.n	80d2 <_mainCRTStartup+0x26>
    80d0:	4798      	blx	r3
    80d2:	4b0e      	ldr	r3, [pc, #56]	; (810c <_mainCRTStartup+0x60>)
    80d4:	2b00      	cmp	r3, #0
    80d6:	d000      	beq.n	80da <_mainCRTStartup+0x2e>
    80d8:	4798      	blx	r3
    80da:	2000      	movs	r0, #0
    80dc:	2100      	movs	r1, #0
    80de:	0004      	movs	r4, r0
    80e0:	000d      	movs	r5, r1
    80e2:	480d      	ldr	r0, [pc, #52]	; (8118 <_mainCRTStartup+0x6c>)
    80e4:	2800      	cmp	r0, #0
    80e6:	d002      	beq.n	80ee <_mainCRTStartup+0x42>
    80e8:	480c      	ldr	r0, [pc, #48]	; (811c <_mainCRTStartup+0x70>)
    80ea:	f000 f90d 	bl	8308 <atexit>
    80ee:	f000 f821 	bl	8134 <__libc_init_array>
    80f2:	0020      	movs	r0, r4
    80f4:	0029      	movs	r1, r5
    80f6:	f000 f813 	bl	8120 <main>
    80fa:	f7ff ff87 	bl	800c <exit>
    80fe:	bf00      	nop
    8100:	00080000 	.word	0x00080000
	...
    8110:	0001889c 	.word	0x0001889c
    8114:	000188dc 	.word	0x000188dc
    8118:	00008309 	.word	0x00008309
    811c:	00008315 	.word	0x00008315

00008120 <main>:
    8120:	b480      	push	{r7}
    8122:	b083      	sub	sp, #12
    8124:	af00      	add	r7, sp, #0
    8126:	2300      	movs	r3, #0
    8128:	71fb      	strb	r3, [r7, #7]
    812a:	79fb      	ldrb	r3, [r7, #7]
    812c:	3301      	adds	r3, #1
    812e:	71fb      	strb	r3, [r7, #7]
    8130:	e7fb      	b.n	812a <main+0xa>
	...

00008134 <__libc_init_array>:
    8134:	b570      	push	{r4, r5, r6, lr}
    8136:	4e0f      	ldr	r6, [pc, #60]	; (8174 <__libc_init_array+0x40>)
    8138:	4d0f      	ldr	r5, [pc, #60]	; (8178 <__libc_init_array+0x44>)
    813a:	1b76      	subs	r6, r6, r5
    813c:	10b6      	asrs	r6, r6, #2
    813e:	bf18      	it	ne
    8140:	2400      	movne	r4, #0
    8142:	d005      	beq.n	8150 <__libc_init_array+0x1c>
    8144:	3401      	adds	r4, #1
    8146:	f855 3b04 	ldr.w	r3, [r5], #4
    814a:	4798      	blx	r3
    814c:	42a6      	cmp	r6, r4
    814e:	d1f9      	bne.n	8144 <__libc_init_array+0x10>
    8150:	4e0a      	ldr	r6, [pc, #40]	; (817c <__libc_init_array+0x48>)
    8152:	4d0b      	ldr	r5, [pc, #44]	; (8180 <__libc_init_array+0x4c>)
    8154:	f7ff ff54 	bl	8000 <_init>
    8158:	1b76      	subs	r6, r6, r5
    815a:	10b6      	asrs	r6, r6, #2
    815c:	bf18      	it	ne
    815e:	2400      	movne	r4, #0
    8160:	d006      	beq.n	8170 <__libc_init_array+0x3c>
    8162:	3401      	adds	r4, #1
    8164:	f855 3b04 	ldr.w	r3, [r5], #4
    8168:	4798      	blx	r3
    816a:	42a6      	cmp	r6, r4
    816c:	d1f9      	bne.n	8162 <__libc_init_array+0x2e>
    816e:	bd70      	pop	{r4, r5, r6, pc}
    8170:	bd70      	pop	{r4, r5, r6, pc}
    8172:	bf00      	nop
    8174:	00018454 	.word	0x00018454
    8178:	00018454 	.word	0x00018454
    817c:	0001845c 	.word	0x0001845c
    8180:	00018454 	.word	0x00018454

00008184 <memset>:
    8184:	b470      	push	{r4, r5, r6}
    8186:	0786      	lsls	r6, r0, #30
    8188:	d046      	beq.n	8218 <memset+0x94>
    818a:	1e54      	subs	r4, r2, #1
    818c:	2a00      	cmp	r2, #0
    818e:	d041      	beq.n	8214 <memset+0x90>
    8190:	b2ca      	uxtb	r2, r1
    8192:	4603      	mov	r3, r0
    8194:	e002      	b.n	819c <memset+0x18>
    8196:	f114 34ff 	adds.w	r4, r4, #4294967295
    819a:	d33b      	bcc.n	8214 <memset+0x90>
    819c:	f803 2b01 	strb.w	r2, [r3], #1
    81a0:	079d      	lsls	r5, r3, #30
    81a2:	d1f8      	bne.n	8196 <memset+0x12>
    81a4:	2c03      	cmp	r4, #3
    81a6:	d92e      	bls.n	8206 <memset+0x82>
    81a8:	b2cd      	uxtb	r5, r1
    81aa:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
    81ae:	2c0f      	cmp	r4, #15
    81b0:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
    81b4:	d919      	bls.n	81ea <memset+0x66>
    81b6:	4626      	mov	r6, r4
    81b8:	f103 0210 	add.w	r2, r3, #16
    81bc:	3e10      	subs	r6, #16
    81be:	2e0f      	cmp	r6, #15
    81c0:	f842 5c10 	str.w	r5, [r2, #-16]
    81c4:	f842 5c0c 	str.w	r5, [r2, #-12]
    81c8:	f842 5c08 	str.w	r5, [r2, #-8]
    81cc:	f842 5c04 	str.w	r5, [r2, #-4]
    81d0:	f102 0210 	add.w	r2, r2, #16
    81d4:	d8f2      	bhi.n	81bc <memset+0x38>
    81d6:	f1a4 0210 	sub.w	r2, r4, #16
    81da:	f022 020f 	bic.w	r2, r2, #15
    81de:	f004 040f 	and.w	r4, r4, #15
    81e2:	3210      	adds	r2, #16
    81e4:	2c03      	cmp	r4, #3
    81e6:	4413      	add	r3, r2
    81e8:	d90d      	bls.n	8206 <memset+0x82>
    81ea:	461e      	mov	r6, r3
    81ec:	4622      	mov	r2, r4
    81ee:	3a04      	subs	r2, #4
    81f0:	2a03      	cmp	r2, #3
    81f2:	f846 5b04 	str.w	r5, [r6], #4
    81f6:	d8fa      	bhi.n	81ee <memset+0x6a>
    81f8:	1f22      	subs	r2, r4, #4
    81fa:	f022 0203 	bic.w	r2, r2, #3
    81fe:	3204      	adds	r2, #4
    8200:	4413      	add	r3, r2
    8202:	f004 0403 	and.w	r4, r4, #3
    8206:	b12c      	cbz	r4, 8214 <memset+0x90>
    8208:	b2c9      	uxtb	r1, r1
    820a:	441c      	add	r4, r3
    820c:	f803 1b01 	strb.w	r1, [r3], #1
    8210:	429c      	cmp	r4, r3
    8212:	d1fb      	bne.n	820c <memset+0x88>
    8214:	bc70      	pop	{r4, r5, r6}
    8216:	4770      	bx	lr
    8218:	4614      	mov	r4, r2
    821a:	4603      	mov	r3, r0
    821c:	e7c2      	b.n	81a4 <memset+0x20>
    821e:	bf00      	nop

00008220 <__call_exitprocs>:
    8220:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    8224:	4b35      	ldr	r3, [pc, #212]	; (82fc <__call_exitprocs+0xdc>)
    8226:	b085      	sub	sp, #20
    8228:	9001      	str	r0, [sp, #4]
    822a:	6818      	ldr	r0, [r3, #0]
    822c:	460e      	mov	r6, r1
    822e:	f000 f895 	bl	835c <__retarget_lock_acquire_recursive>
    8232:	4b33      	ldr	r3, [pc, #204]	; (8300 <__call_exitprocs+0xe0>)
    8234:	681b      	ldr	r3, [r3, #0]
    8236:	9302      	str	r3, [sp, #8]
    8238:	f503 73a4 	add.w	r3, r3, #328	; 0x148
    823c:	9303      	str	r3, [sp, #12]
    823e:	9b02      	ldr	r3, [sp, #8]
    8240:	f8d3 7148 	ldr.w	r7, [r3, #328]	; 0x148
    8244:	b337      	cbz	r7, 8294 <__call_exitprocs+0x74>
    8246:	f8dd a00c 	ldr.w	sl, [sp, #12]
    824a:	f04f 0901 	mov.w	r9, #1
    824e:	46d3      	mov	fp, sl
    8250:	687c      	ldr	r4, [r7, #4]
    8252:	1e65      	subs	r5, r4, #1
    8254:	d40e      	bmi.n	8274 <__call_exitprocs+0x54>
    8256:	f04f 0800 	mov.w	r8, #0
    825a:	3401      	adds	r4, #1
    825c:	eb07 0484 	add.w	r4, r7, r4, lsl #2
    8260:	b1fe      	cbz	r6, 82a2 <__call_exitprocs+0x82>
    8262:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
    8266:	429e      	cmp	r6, r3
    8268:	d01b      	beq.n	82a2 <__call_exitprocs+0x82>
    826a:	3d01      	subs	r5, #1
    826c:	1c6b      	adds	r3, r5, #1
    826e:	f1a4 0404 	sub.w	r4, r4, #4
    8272:	d1f5      	bne.n	8260 <__call_exitprocs+0x40>
    8274:	4b23      	ldr	r3, [pc, #140]	; (8304 <__call_exitprocs+0xe4>)
    8276:	b16b      	cbz	r3, 8294 <__call_exitprocs+0x74>
    8278:	687b      	ldr	r3, [r7, #4]
    827a:	2b00      	cmp	r3, #0
    827c:	d139      	bne.n	82f2 <__call_exitprocs+0xd2>
    827e:	683b      	ldr	r3, [r7, #0]
    8280:	b143      	cbz	r3, 8294 <__call_exitprocs+0x74>
    8282:	4638      	mov	r0, r7
    8284:	f8cb 3000 	str.w	r3, [fp]
    8288:	f3af 8000 	nop.w
    828c:	f8db 7000 	ldr.w	r7, [fp]
    8290:	2f00      	cmp	r7, #0
    8292:	d1dd      	bne.n	8250 <__call_exitprocs+0x30>
    8294:	4b19      	ldr	r3, [pc, #100]	; (82fc <__call_exitprocs+0xdc>)
    8296:	6818      	ldr	r0, [r3, #0]
    8298:	b005      	add	sp, #20
    829a:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    829e:	f000 b865 	b.w	836c <__retarget_lock_release_recursive>
    82a2:	687b      	ldr	r3, [r7, #4]
    82a4:	6822      	ldr	r2, [r4, #0]
    82a6:	3b01      	subs	r3, #1
    82a8:	42ab      	cmp	r3, r5
    82aa:	bf0c      	ite	eq
    82ac:	607d      	streq	r5, [r7, #4]
    82ae:	f8c4 8000 	strne.w	r8, [r4]
    82b2:	2a00      	cmp	r2, #0
    82b4:	d0d9      	beq.n	826a <__call_exitprocs+0x4a>
    82b6:	f8d7 1188 	ldr.w	r1, [r7, #392]	; 0x188
    82ba:	fa09 f305 	lsl.w	r3, r9, r5
    82be:	420b      	tst	r3, r1
    82c0:	f8d7 a004 	ldr.w	sl, [r7, #4]
    82c4:	d00f      	beq.n	82e6 <__call_exitprocs+0xc6>
    82c6:	f8d7 118c 	ldr.w	r1, [r7, #396]	; 0x18c
    82ca:	420b      	tst	r3, r1
    82cc:	d10d      	bne.n	82ea <__call_exitprocs+0xca>
    82ce:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
    82d2:	9801      	ldr	r0, [sp, #4]
    82d4:	4790      	blx	r2
    82d6:	687b      	ldr	r3, [r7, #4]
    82d8:	4553      	cmp	r3, sl
    82da:	d1b0      	bne.n	823e <__call_exitprocs+0x1e>
    82dc:	f8db 3000 	ldr.w	r3, [fp]
    82e0:	42bb      	cmp	r3, r7
    82e2:	d0c2      	beq.n	826a <__call_exitprocs+0x4a>
    82e4:	e7ab      	b.n	823e <__call_exitprocs+0x1e>
    82e6:	4790      	blx	r2
    82e8:	e7f5      	b.n	82d6 <__call_exitprocs+0xb6>
    82ea:	f8d4 0080 	ldr.w	r0, [r4, #128]	; 0x80
    82ee:	4790      	blx	r2
    82f0:	e7f1      	b.n	82d6 <__call_exitprocs+0xb6>
    82f2:	46bb      	mov	fp, r7
    82f4:	683f      	ldr	r7, [r7, #0]
    82f6:	2f00      	cmp	r7, #0
    82f8:	d1aa      	bne.n	8250 <__call_exitprocs+0x30>
    82fa:	e7cb      	b.n	8294 <__call_exitprocs+0x74>
    82fc:	00018898 	.word	0x00018898
    8300:	00008444 	.word	0x00008444
    8304:	00000000 	.word	0x00000000

00008308 <atexit>:
    8308:	2300      	movs	r3, #0
    830a:	4601      	mov	r1, r0
    830c:	461a      	mov	r2, r3
    830e:	4618      	mov	r0, r3
    8310:	f000 b82e 	b.w	8370 <__register_exitproc>

00008314 <__libc_fini_array>:
    8314:	b538      	push	{r3, r4, r5, lr}
    8316:	4c0a      	ldr	r4, [pc, #40]	; (8340 <__libc_fini_array+0x2c>)
    8318:	4d0a      	ldr	r5, [pc, #40]	; (8344 <__libc_fini_array+0x30>)
    831a:	1b64      	subs	r4, r4, r5
    831c:	10a4      	asrs	r4, r4, #2
    831e:	d00a      	beq.n	8336 <__libc_fini_array+0x22>
    8320:	f104 4380 	add.w	r3, r4, #1073741824	; 0x40000000
    8324:	3b01      	subs	r3, #1
    8326:	eb05 0583 	add.w	r5, r5, r3, lsl #2
    832a:	3c01      	subs	r4, #1
    832c:	f855 3904 	ldr.w	r3, [r5], #-4
    8330:	4798      	blx	r3
    8332:	2c00      	cmp	r4, #0
    8334:	d1f9      	bne.n	832a <__libc_fini_array+0x16>
    8336:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    833a:	f000 b87d 	b.w	8438 <_fini>
    833e:	bf00      	nop
    8340:	00018460 	.word	0x00018460
    8344:	0001845c 	.word	0x0001845c

00008348 <__retarget_lock_init>:
    8348:	4770      	bx	lr
    834a:	bf00      	nop

0000834c <__retarget_lock_init_recursive>:
    834c:	4770      	bx	lr
    834e:	bf00      	nop

00008350 <__retarget_lock_close>:
    8350:	4770      	bx	lr
    8352:	bf00      	nop

00008354 <__retarget_lock_close_recursive>:
    8354:	4770      	bx	lr
    8356:	bf00      	nop

00008358 <__retarget_lock_acquire>:
    8358:	4770      	bx	lr
    835a:	bf00      	nop

0000835c <__retarget_lock_acquire_recursive>:
    835c:	4770      	bx	lr
    835e:	bf00      	nop

00008360 <__retarget_lock_try_acquire>:
    8360:	2001      	movs	r0, #1
    8362:	4770      	bx	lr

00008364 <__retarget_lock_try_acquire_recursive>:
    8364:	2001      	movs	r0, #1
    8366:	4770      	bx	lr

00008368 <__retarget_lock_release>:
    8368:	4770      	bx	lr
    836a:	bf00      	nop

0000836c <__retarget_lock_release_recursive>:
    836c:	4770      	bx	lr
    836e:	bf00      	nop

00008370 <__register_exitproc>:
    8370:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    8374:	4d2c      	ldr	r5, [pc, #176]	; (8428 <__register_exitproc+0xb8>)
    8376:	4606      	mov	r6, r0
    8378:	6828      	ldr	r0, [r5, #0]
    837a:	4698      	mov	r8, r3
    837c:	460f      	mov	r7, r1
    837e:	4691      	mov	r9, r2
    8380:	f7ff ffec 	bl	835c <__retarget_lock_acquire_recursive>
    8384:	4b29      	ldr	r3, [pc, #164]	; (842c <__register_exitproc+0xbc>)
    8386:	681c      	ldr	r4, [r3, #0]
    8388:	f8d4 3148 	ldr.w	r3, [r4, #328]	; 0x148
    838c:	2b00      	cmp	r3, #0
    838e:	d03e      	beq.n	840e <__register_exitproc+0x9e>
    8390:	685a      	ldr	r2, [r3, #4]
    8392:	2a1f      	cmp	r2, #31
    8394:	dc1c      	bgt.n	83d0 <__register_exitproc+0x60>
    8396:	f102 0e01 	add.w	lr, r2, #1
    839a:	b176      	cbz	r6, 83ba <__register_exitproc+0x4a>
    839c:	2101      	movs	r1, #1
    839e:	eb03 0482 	add.w	r4, r3, r2, lsl #2
    83a2:	f8c4 9088 	str.w	r9, [r4, #136]	; 0x88
    83a6:	f8d3 0188 	ldr.w	r0, [r3, #392]	; 0x188
    83aa:	4091      	lsls	r1, r2
    83ac:	4308      	orrs	r0, r1
    83ae:	2e02      	cmp	r6, #2
    83b0:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    83b4:	f8c4 8108 	str.w	r8, [r4, #264]	; 0x108
    83b8:	d023      	beq.n	8402 <__register_exitproc+0x92>
    83ba:	3202      	adds	r2, #2
    83bc:	f8c3 e004 	str.w	lr, [r3, #4]
    83c0:	6828      	ldr	r0, [r5, #0]
    83c2:	f843 7022 	str.w	r7, [r3, r2, lsl #2]
    83c6:	f7ff ffd1 	bl	836c <__retarget_lock_release_recursive>
    83ca:	2000      	movs	r0, #0
    83cc:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    83d0:	4b17      	ldr	r3, [pc, #92]	; (8430 <__register_exitproc+0xc0>)
    83d2:	b30b      	cbz	r3, 8418 <__register_exitproc+0xa8>
    83d4:	f44f 70c8 	mov.w	r0, #400	; 0x190
    83d8:	f3af 8000 	nop.w
    83dc:	4603      	mov	r3, r0
    83de:	b1d8      	cbz	r0, 8418 <__register_exitproc+0xa8>
    83e0:	2000      	movs	r0, #0
    83e2:	f8d4 1148 	ldr.w	r1, [r4, #328]	; 0x148
    83e6:	f04f 0e01 	mov.w	lr, #1
    83ea:	6058      	str	r0, [r3, #4]
    83ec:	6019      	str	r1, [r3, #0]
    83ee:	4602      	mov	r2, r0
    83f0:	f8c4 3148 	str.w	r3, [r4, #328]	; 0x148
    83f4:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    83f8:	f8c3 018c 	str.w	r0, [r3, #396]	; 0x18c
    83fc:	2e00      	cmp	r6, #0
    83fe:	d0dc      	beq.n	83ba <__register_exitproc+0x4a>
    8400:	e7cc      	b.n	839c <__register_exitproc+0x2c>
    8402:	f8d3 018c 	ldr.w	r0, [r3, #396]	; 0x18c
    8406:	4301      	orrs	r1, r0
    8408:	f8c3 118c 	str.w	r1, [r3, #396]	; 0x18c
    840c:	e7d5      	b.n	83ba <__register_exitproc+0x4a>
    840e:	f504 73a6 	add.w	r3, r4, #332	; 0x14c
    8412:	f8c4 3148 	str.w	r3, [r4, #328]	; 0x148
    8416:	e7bb      	b.n	8390 <__register_exitproc+0x20>
    8418:	6828      	ldr	r0, [r5, #0]
    841a:	f7ff ffa7 	bl	836c <__retarget_lock_release_recursive>
    841e:	f04f 30ff 	mov.w	r0, #4294967295
    8422:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    8426:	bf00      	nop
    8428:	00018898 	.word	0x00018898
    842c:	00008444 	.word	0x00008444
    8430:	00000000 	.word	0x00000000

00008434 <_exit>:
    8434:	e7fe      	b.n	8434 <_exit>
    8436:	bf00      	nop

Disassembly of section .fini:

00008438 <_fini>:
    8438:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    843a:	bf00      	nop
    843c:	bcf8      	pop	{r3, r4, r5, r6, r7}
    843e:	bc08      	pop	{r3}
    8440:	469e      	mov	lr, r3
    8442:	4770      	bx	lr

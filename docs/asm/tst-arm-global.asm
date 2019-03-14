
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
    8012:	f000 f909 	bl	8228 <__call_exitprocs>
    8016:	4b04      	ldr	r3, [pc, #16]	; (8028 <exit+0x1c>)
    8018:	6818      	ldr	r0, [r3, #0]
    801a:	6bc3      	ldr	r3, [r0, #60]	; 0x3c
    801c:	b103      	cbz	r3, 8020 <exit+0x14>
    801e:	4798      	blx	r3
    8020:	4620      	mov	r0, r4
    8022:	f000 fa0b 	bl	843c <_exit>
    8026:	bf00      	nop
    8028:	0000844c 	.word	0x0000844c

0000802c <register_fini>:
    802c:	4b02      	ldr	r3, [pc, #8]	; (8038 <register_fini+0xc>)
    802e:	b113      	cbz	r3, 8036 <register_fini+0xa>
    8030:	4802      	ldr	r0, [pc, #8]	; (803c <register_fini+0x10>)
    8032:	f000 b96d 	b.w	8310 <atexit>
    8036:	4770      	bx	lr
    8038:	00000000 	.word	0x00000000
    803c:	0000831d 	.word	0x0000831d

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
    8058:	000188a4 	.word	0x000188a4
    805c:	00000000 	.word	0x00000000
    8060:	00008458 	.word	0x00008458

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
    809c:	00008458 	.word	0x00008458
    80a0:	000188a8 	.word	0x000188a8
    80a4:	00018468 	.word	0x00018468
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
    80c6:	f000 f861 	bl	818c <memset>
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
    80ea:	f000 f911 	bl	8310 <atexit>
    80ee:	f000 f825 	bl	813c <__libc_init_array>
    80f2:	0020      	movs	r0, r4
    80f4:	0029      	movs	r1, r5
    80f6:	f000 f813 	bl	8120 <main>
    80fa:	f7ff ff87 	bl	800c <exit>
    80fe:	bf00      	nop
    8100:	00080000 	.word	0x00080000
	...
    8110:	000188a4 	.word	0x000188a4
    8114:	000188e8 	.word	0x000188e8
    8118:	00008311 	.word	0x00008311
    811c:	0000831d 	.word	0x0000831d

00008120 <main>:
    8120:	b480      	push	{r7}
    8122:	af00      	add	r7, sp, #0
    8124:	4b04      	ldr	r3, [pc, #16]	; (8138 <main+0x18>)
    8126:	2200      	movs	r2, #0
    8128:	701a      	strb	r2, [r3, #0]
    812a:	4b03      	ldr	r3, [pc, #12]	; (8138 <main+0x18>)
    812c:	781b      	ldrb	r3, [r3, #0]
    812e:	3301      	adds	r3, #1
    8130:	b2da      	uxtb	r2, r3
    8132:	4b01      	ldr	r3, [pc, #4]	; (8138 <main+0x18>)
    8134:	701a      	strb	r2, [r3, #0]
    8136:	e7f8      	b.n	812a <main+0xa>
    8138:	000188c0 	.word	0x000188c0

0000813c <__libc_init_array>:
    813c:	b570      	push	{r4, r5, r6, lr}
    813e:	4e0f      	ldr	r6, [pc, #60]	; (817c <__libc_init_array+0x40>)
    8140:	4d0f      	ldr	r5, [pc, #60]	; (8180 <__libc_init_array+0x44>)
    8142:	1b76      	subs	r6, r6, r5
    8144:	10b6      	asrs	r6, r6, #2
    8146:	bf18      	it	ne
    8148:	2400      	movne	r4, #0
    814a:	d005      	beq.n	8158 <__libc_init_array+0x1c>
    814c:	3401      	adds	r4, #1
    814e:	f855 3b04 	ldr.w	r3, [r5], #4
    8152:	4798      	blx	r3
    8154:	42a6      	cmp	r6, r4
    8156:	d1f9      	bne.n	814c <__libc_init_array+0x10>
    8158:	4e0a      	ldr	r6, [pc, #40]	; (8184 <__libc_init_array+0x48>)
    815a:	4d0b      	ldr	r5, [pc, #44]	; (8188 <__libc_init_array+0x4c>)
    815c:	f7ff ff50 	bl	8000 <_init>
    8160:	1b76      	subs	r6, r6, r5
    8162:	10b6      	asrs	r6, r6, #2
    8164:	bf18      	it	ne
    8166:	2400      	movne	r4, #0
    8168:	d006      	beq.n	8178 <__libc_init_array+0x3c>
    816a:	3401      	adds	r4, #1
    816c:	f855 3b04 	ldr.w	r3, [r5], #4
    8170:	4798      	blx	r3
    8172:	42a6      	cmp	r6, r4
    8174:	d1f9      	bne.n	816a <__libc_init_array+0x2e>
    8176:	bd70      	pop	{r4, r5, r6, pc}
    8178:	bd70      	pop	{r4, r5, r6, pc}
    817a:	bf00      	nop
    817c:	0001845c 	.word	0x0001845c
    8180:	0001845c 	.word	0x0001845c
    8184:	00018464 	.word	0x00018464
    8188:	0001845c 	.word	0x0001845c

0000818c <memset>:
    818c:	b470      	push	{r4, r5, r6}
    818e:	0786      	lsls	r6, r0, #30
    8190:	d046      	beq.n	8220 <memset+0x94>
    8192:	1e54      	subs	r4, r2, #1
    8194:	2a00      	cmp	r2, #0
    8196:	d041      	beq.n	821c <memset+0x90>
    8198:	b2ca      	uxtb	r2, r1
    819a:	4603      	mov	r3, r0
    819c:	e002      	b.n	81a4 <memset+0x18>
    819e:	f114 34ff 	adds.w	r4, r4, #4294967295
    81a2:	d33b      	bcc.n	821c <memset+0x90>
    81a4:	f803 2b01 	strb.w	r2, [r3], #1
    81a8:	079d      	lsls	r5, r3, #30
    81aa:	d1f8      	bne.n	819e <memset+0x12>
    81ac:	2c03      	cmp	r4, #3
    81ae:	d92e      	bls.n	820e <memset+0x82>
    81b0:	b2cd      	uxtb	r5, r1
    81b2:	ea45 2505 	orr.w	r5, r5, r5, lsl #8
    81b6:	2c0f      	cmp	r4, #15
    81b8:	ea45 4505 	orr.w	r5, r5, r5, lsl #16
    81bc:	d919      	bls.n	81f2 <memset+0x66>
    81be:	4626      	mov	r6, r4
    81c0:	f103 0210 	add.w	r2, r3, #16
    81c4:	3e10      	subs	r6, #16
    81c6:	2e0f      	cmp	r6, #15
    81c8:	f842 5c10 	str.w	r5, [r2, #-16]
    81cc:	f842 5c0c 	str.w	r5, [r2, #-12]
    81d0:	f842 5c08 	str.w	r5, [r2, #-8]
    81d4:	f842 5c04 	str.w	r5, [r2, #-4]
    81d8:	f102 0210 	add.w	r2, r2, #16
    81dc:	d8f2      	bhi.n	81c4 <memset+0x38>
    81de:	f1a4 0210 	sub.w	r2, r4, #16
    81e2:	f022 020f 	bic.w	r2, r2, #15
    81e6:	f004 040f 	and.w	r4, r4, #15
    81ea:	3210      	adds	r2, #16
    81ec:	2c03      	cmp	r4, #3
    81ee:	4413      	add	r3, r2
    81f0:	d90d      	bls.n	820e <memset+0x82>
    81f2:	461e      	mov	r6, r3
    81f4:	4622      	mov	r2, r4
    81f6:	3a04      	subs	r2, #4
    81f8:	2a03      	cmp	r2, #3
    81fa:	f846 5b04 	str.w	r5, [r6], #4
    81fe:	d8fa      	bhi.n	81f6 <memset+0x6a>
    8200:	1f22      	subs	r2, r4, #4
    8202:	f022 0203 	bic.w	r2, r2, #3
    8206:	3204      	adds	r2, #4
    8208:	4413      	add	r3, r2
    820a:	f004 0403 	and.w	r4, r4, #3
    820e:	b12c      	cbz	r4, 821c <memset+0x90>
    8210:	b2c9      	uxtb	r1, r1
    8212:	441c      	add	r4, r3
    8214:	f803 1b01 	strb.w	r1, [r3], #1
    8218:	429c      	cmp	r4, r3
    821a:	d1fb      	bne.n	8214 <memset+0x88>
    821c:	bc70      	pop	{r4, r5, r6}
    821e:	4770      	bx	lr
    8220:	4614      	mov	r4, r2
    8222:	4603      	mov	r3, r0
    8224:	e7c2      	b.n	81ac <memset+0x20>
    8226:	bf00      	nop

00008228 <__call_exitprocs>:
    8228:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    822c:	4b35      	ldr	r3, [pc, #212]	; (8304 <__call_exitprocs+0xdc>)
    822e:	b085      	sub	sp, #20
    8230:	9001      	str	r0, [sp, #4]
    8232:	6818      	ldr	r0, [r3, #0]
    8234:	460e      	mov	r6, r1
    8236:	f000 f895 	bl	8364 <__retarget_lock_acquire_recursive>
    823a:	4b33      	ldr	r3, [pc, #204]	; (8308 <__call_exitprocs+0xe0>)
    823c:	681b      	ldr	r3, [r3, #0]
    823e:	9302      	str	r3, [sp, #8]
    8240:	f503 73a4 	add.w	r3, r3, #328	; 0x148
    8244:	9303      	str	r3, [sp, #12]
    8246:	9b02      	ldr	r3, [sp, #8]
    8248:	f8d3 7148 	ldr.w	r7, [r3, #328]	; 0x148
    824c:	b337      	cbz	r7, 829c <__call_exitprocs+0x74>
    824e:	f8dd a00c 	ldr.w	sl, [sp, #12]
    8252:	f04f 0901 	mov.w	r9, #1
    8256:	46d3      	mov	fp, sl
    8258:	687c      	ldr	r4, [r7, #4]
    825a:	1e65      	subs	r5, r4, #1
    825c:	d40e      	bmi.n	827c <__call_exitprocs+0x54>
    825e:	f04f 0800 	mov.w	r8, #0
    8262:	3401      	adds	r4, #1
    8264:	eb07 0484 	add.w	r4, r7, r4, lsl #2
    8268:	b1fe      	cbz	r6, 82aa <__call_exitprocs+0x82>
    826a:	f8d4 3100 	ldr.w	r3, [r4, #256]	; 0x100
    826e:	429e      	cmp	r6, r3
    8270:	d01b      	beq.n	82aa <__call_exitprocs+0x82>
    8272:	3d01      	subs	r5, #1
    8274:	1c6b      	adds	r3, r5, #1
    8276:	f1a4 0404 	sub.w	r4, r4, #4
    827a:	d1f5      	bne.n	8268 <__call_exitprocs+0x40>
    827c:	4b23      	ldr	r3, [pc, #140]	; (830c <__call_exitprocs+0xe4>)
    827e:	b16b      	cbz	r3, 829c <__call_exitprocs+0x74>
    8280:	687b      	ldr	r3, [r7, #4]
    8282:	2b00      	cmp	r3, #0
    8284:	d139      	bne.n	82fa <__call_exitprocs+0xd2>
    8286:	683b      	ldr	r3, [r7, #0]
    8288:	b143      	cbz	r3, 829c <__call_exitprocs+0x74>
    828a:	4638      	mov	r0, r7
    828c:	f8cb 3000 	str.w	r3, [fp]
    8290:	f3af 8000 	nop.w
    8294:	f8db 7000 	ldr.w	r7, [fp]
    8298:	2f00      	cmp	r7, #0
    829a:	d1dd      	bne.n	8258 <__call_exitprocs+0x30>
    829c:	4b19      	ldr	r3, [pc, #100]	; (8304 <__call_exitprocs+0xdc>)
    829e:	6818      	ldr	r0, [r3, #0]
    82a0:	b005      	add	sp, #20
    82a2:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    82a6:	f000 b865 	b.w	8374 <__retarget_lock_release_recursive>
    82aa:	687b      	ldr	r3, [r7, #4]
    82ac:	6822      	ldr	r2, [r4, #0]
    82ae:	3b01      	subs	r3, #1
    82b0:	42ab      	cmp	r3, r5
    82b2:	bf0c      	ite	eq
    82b4:	607d      	streq	r5, [r7, #4]
    82b6:	f8c4 8000 	strne.w	r8, [r4]
    82ba:	2a00      	cmp	r2, #0
    82bc:	d0d9      	beq.n	8272 <__call_exitprocs+0x4a>
    82be:	f8d7 1188 	ldr.w	r1, [r7, #392]	; 0x188
    82c2:	fa09 f305 	lsl.w	r3, r9, r5
    82c6:	420b      	tst	r3, r1
    82c8:	f8d7 a004 	ldr.w	sl, [r7, #4]
    82cc:	d00f      	beq.n	82ee <__call_exitprocs+0xc6>
    82ce:	f8d7 118c 	ldr.w	r1, [r7, #396]	; 0x18c
    82d2:	420b      	tst	r3, r1
    82d4:	d10d      	bne.n	82f2 <__call_exitprocs+0xca>
    82d6:	f8d4 1080 	ldr.w	r1, [r4, #128]	; 0x80
    82da:	9801      	ldr	r0, [sp, #4]
    82dc:	4790      	blx	r2
    82de:	687b      	ldr	r3, [r7, #4]
    82e0:	4553      	cmp	r3, sl
    82e2:	d1b0      	bne.n	8246 <__call_exitprocs+0x1e>
    82e4:	f8db 3000 	ldr.w	r3, [fp]
    82e8:	42bb      	cmp	r3, r7
    82ea:	d0c2      	beq.n	8272 <__call_exitprocs+0x4a>
    82ec:	e7ab      	b.n	8246 <__call_exitprocs+0x1e>
    82ee:	4790      	blx	r2
    82f0:	e7f5      	b.n	82de <__call_exitprocs+0xb6>
    82f2:	f8d4 0080 	ldr.w	r0, [r4, #128]	; 0x80
    82f6:	4790      	blx	r2
    82f8:	e7f1      	b.n	82de <__call_exitprocs+0xb6>
    82fa:	46bb      	mov	fp, r7
    82fc:	683f      	ldr	r7, [r7, #0]
    82fe:	2f00      	cmp	r7, #0
    8300:	d1aa      	bne.n	8258 <__call_exitprocs+0x30>
    8302:	e7cb      	b.n	829c <__call_exitprocs+0x74>
    8304:	000188a0 	.word	0x000188a0
    8308:	0000844c 	.word	0x0000844c
    830c:	00000000 	.word	0x00000000

00008310 <atexit>:
    8310:	2300      	movs	r3, #0
    8312:	4601      	mov	r1, r0
    8314:	461a      	mov	r2, r3
    8316:	4618      	mov	r0, r3
    8318:	f000 b82e 	b.w	8378 <__register_exitproc>

0000831c <__libc_fini_array>:
    831c:	b538      	push	{r3, r4, r5, lr}
    831e:	4c0a      	ldr	r4, [pc, #40]	; (8348 <__libc_fini_array+0x2c>)
    8320:	4d0a      	ldr	r5, [pc, #40]	; (834c <__libc_fini_array+0x30>)
    8322:	1b64      	subs	r4, r4, r5
    8324:	10a4      	asrs	r4, r4, #2
    8326:	d00a      	beq.n	833e <__libc_fini_array+0x22>
    8328:	f104 4380 	add.w	r3, r4, #1073741824	; 0x40000000
    832c:	3b01      	subs	r3, #1
    832e:	eb05 0583 	add.w	r5, r5, r3, lsl #2
    8332:	3c01      	subs	r4, #1
    8334:	f855 3904 	ldr.w	r3, [r5], #-4
    8338:	4798      	blx	r3
    833a:	2c00      	cmp	r4, #0
    833c:	d1f9      	bne.n	8332 <__libc_fini_array+0x16>
    833e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    8342:	f000 b87d 	b.w	8440 <_fini>
    8346:	bf00      	nop
    8348:	00018468 	.word	0x00018468
    834c:	00018464 	.word	0x00018464

00008350 <__retarget_lock_init>:
    8350:	4770      	bx	lr
    8352:	bf00      	nop

00008354 <__retarget_lock_init_recursive>:
    8354:	4770      	bx	lr
    8356:	bf00      	nop

00008358 <__retarget_lock_close>:
    8358:	4770      	bx	lr
    835a:	bf00      	nop

0000835c <__retarget_lock_close_recursive>:
    835c:	4770      	bx	lr
    835e:	bf00      	nop

00008360 <__retarget_lock_acquire>:
    8360:	4770      	bx	lr
    8362:	bf00      	nop

00008364 <__retarget_lock_acquire_recursive>:
    8364:	4770      	bx	lr
    8366:	bf00      	nop

00008368 <__retarget_lock_try_acquire>:
    8368:	2001      	movs	r0, #1
    836a:	4770      	bx	lr

0000836c <__retarget_lock_try_acquire_recursive>:
    836c:	2001      	movs	r0, #1
    836e:	4770      	bx	lr

00008370 <__retarget_lock_release>:
    8370:	4770      	bx	lr
    8372:	bf00      	nop

00008374 <__retarget_lock_release_recursive>:
    8374:	4770      	bx	lr
    8376:	bf00      	nop

00008378 <__register_exitproc>:
    8378:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    837c:	4d2c      	ldr	r5, [pc, #176]	; (8430 <__register_exitproc+0xb8>)
    837e:	4606      	mov	r6, r0
    8380:	6828      	ldr	r0, [r5, #0]
    8382:	4698      	mov	r8, r3
    8384:	460f      	mov	r7, r1
    8386:	4691      	mov	r9, r2
    8388:	f7ff ffec 	bl	8364 <__retarget_lock_acquire_recursive>
    838c:	4b29      	ldr	r3, [pc, #164]	; (8434 <__register_exitproc+0xbc>)
    838e:	681c      	ldr	r4, [r3, #0]
    8390:	f8d4 3148 	ldr.w	r3, [r4, #328]	; 0x148
    8394:	2b00      	cmp	r3, #0
    8396:	d03e      	beq.n	8416 <__register_exitproc+0x9e>
    8398:	685a      	ldr	r2, [r3, #4]
    839a:	2a1f      	cmp	r2, #31
    839c:	dc1c      	bgt.n	83d8 <__register_exitproc+0x60>
    839e:	f102 0e01 	add.w	lr, r2, #1
    83a2:	b176      	cbz	r6, 83c2 <__register_exitproc+0x4a>
    83a4:	2101      	movs	r1, #1
    83a6:	eb03 0482 	add.w	r4, r3, r2, lsl #2
    83aa:	f8c4 9088 	str.w	r9, [r4, #136]	; 0x88
    83ae:	f8d3 0188 	ldr.w	r0, [r3, #392]	; 0x188
    83b2:	4091      	lsls	r1, r2
    83b4:	4308      	orrs	r0, r1
    83b6:	2e02      	cmp	r6, #2
    83b8:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    83bc:	f8c4 8108 	str.w	r8, [r4, #264]	; 0x108
    83c0:	d023      	beq.n	840a <__register_exitproc+0x92>
    83c2:	3202      	adds	r2, #2
    83c4:	f8c3 e004 	str.w	lr, [r3, #4]
    83c8:	6828      	ldr	r0, [r5, #0]
    83ca:	f843 7022 	str.w	r7, [r3, r2, lsl #2]
    83ce:	f7ff ffd1 	bl	8374 <__retarget_lock_release_recursive>
    83d2:	2000      	movs	r0, #0
    83d4:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    83d8:	4b17      	ldr	r3, [pc, #92]	; (8438 <__register_exitproc+0xc0>)
    83da:	b30b      	cbz	r3, 8420 <__register_exitproc+0xa8>
    83dc:	f44f 70c8 	mov.w	r0, #400	; 0x190
    83e0:	f3af 8000 	nop.w
    83e4:	4603      	mov	r3, r0
    83e6:	b1d8      	cbz	r0, 8420 <__register_exitproc+0xa8>
    83e8:	2000      	movs	r0, #0
    83ea:	f8d4 1148 	ldr.w	r1, [r4, #328]	; 0x148
    83ee:	f04f 0e01 	mov.w	lr, #1
    83f2:	6058      	str	r0, [r3, #4]
    83f4:	6019      	str	r1, [r3, #0]
    83f6:	4602      	mov	r2, r0
    83f8:	f8c4 3148 	str.w	r3, [r4, #328]	; 0x148
    83fc:	f8c3 0188 	str.w	r0, [r3, #392]	; 0x188
    8400:	f8c3 018c 	str.w	r0, [r3, #396]	; 0x18c
    8404:	2e00      	cmp	r6, #0
    8406:	d0dc      	beq.n	83c2 <__register_exitproc+0x4a>
    8408:	e7cc      	b.n	83a4 <__register_exitproc+0x2c>
    840a:	f8d3 018c 	ldr.w	r0, [r3, #396]	; 0x18c
    840e:	4301      	orrs	r1, r0
    8410:	f8c3 118c 	str.w	r1, [r3, #396]	; 0x18c
    8414:	e7d5      	b.n	83c2 <__register_exitproc+0x4a>
    8416:	f504 73a6 	add.w	r3, r4, #332	; 0x14c
    841a:	f8c4 3148 	str.w	r3, [r4, #328]	; 0x148
    841e:	e7bb      	b.n	8398 <__register_exitproc+0x20>
    8420:	6828      	ldr	r0, [r5, #0]
    8422:	f7ff ffa7 	bl	8374 <__retarget_lock_release_recursive>
    8426:	f04f 30ff 	mov.w	r0, #4294967295
    842a:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    842e:	bf00      	nop
    8430:	000188a0 	.word	0x000188a0
    8434:	0000844c 	.word	0x0000844c
    8438:	00000000 	.word	0x00000000

0000843c <_exit>:
    843c:	e7fe      	b.n	843c <_exit>
    843e:	bf00      	nop

Disassembly of section .fini:

00008440 <_fini>:
    8440:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    8442:	bf00      	nop
    8444:	bcf8      	pop	{r3, r4, r5, r6, r7}
    8446:	bc08      	pop	{r3}
    8448:	469e      	mov	lr, r3
    844a:	4770      	bx	lr

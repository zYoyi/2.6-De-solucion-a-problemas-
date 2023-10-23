@@
@@ Instituto Tecnologico de Tijuana
@@ Depto de Sistemas y Computación
@@ Ing. En Sistemas Computacionales
@@   
@@ Autor : Ortega Jimenez Jordi Joel @zYoyi
@@ Repositorio: http://github.com/tectijuana/27problemas-zYoyi

@@ PROGRAMA EN C
@@
@@
@@

#include <stdio.h>

int main() {
    int multiplicando = 12;

    printf("Tabla de multiplicar del %dx12:\n", multiplicando);

    for (int multiplicador = 1; multiplicador <= 12; multiplicador++) {
        int resultado = multiplicando * multiplicador;
        printf("%d x %d = %d\n", multiplicador, multiplicando, resultado);
    }

    return 0;
}


@ ---------------------------------------
@	Code Section ARM
@ ---------------------------------------
 	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"tablamultiplicar.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Tabla de multiplicar del %dx12:\012\000"
	.align	2
.LC1:
	.ascii	"%d x %d = %d\012\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #12
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, .L5
	bl	printf
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	ldr	r0, .L5+4
	bl	printf
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #12
	ble	.L3
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits

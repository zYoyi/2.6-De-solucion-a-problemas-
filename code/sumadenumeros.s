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
    int suma = 0;

    for (int i = 1; i <= 20; i++) {
        suma += i;
    }

    printf("La suma de los números enteros del 1 al 20 es: %d\n", suma);

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
	.file	"sumadenumeros.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"La suma de los n\303\272meros enteros del 1 al 20 e"
	.ascii	"s: %d\012\000"
	.text
	.align	2
	.global	main
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #20
	ble	.L3
	ldr	r1, [fp, #-8]
	ldr	r0, .L5
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits

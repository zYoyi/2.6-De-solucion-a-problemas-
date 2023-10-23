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
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(0));
    
    char decision;

    while (1) {
        int dado = rand() % 6 + 1;
        printf("Lanzaste un dado y obtuviste un %d.\n", dado);

        if (dado % 2 == 0) {
            printf("¡Ganaste %d!\n", dado);
        } else {
            printf("¡Perdiste %d!\n", dado);
        }

        printf("¿Quieres seguir jugando? (s/n): ");
        scanf(" %c", &decision);

        if (decision != 's' && decision != 'S') {
            printf("Gracias por jugar.\n");
            break;
        }
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
	.file	"juegodado.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Lanzaste un dado y obtuviste un %d.\012\000"
	.align	2
.LC1:
	.ascii	"\302\241Ganaste %d!\012\000"
	.align	2
.LC2:
	.ascii	"\302\241Perdiste %d!\012\000"
	.align	2
.LC3:
	.ascii	"\302\277Quieres seguir jugando? (s/n): \000"
	.align	2
.LC4:
	.ascii	" %c\000"
	.align	2
.LC5:
	.ascii	"Gracias por jugar.\000"
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
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
.L6:
	bl	rand
	mov	r1, r0
	ldr	r3, .L9
	smull	r3, r2, r3, r1
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	sub	r2, r1, r3
	add	r3, r2, #1
	str	r3, [fp, #-8]
	ldr	r1, [fp, #-8]
	ldr	r0, .L9+4
	bl	printf
	ldr	r3, [fp, #-8]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L2
	ldr	r1, [fp, #-8]
	ldr	r0, .L9+8
	bl	printf
	b	.L3
.L2:
	ldr	r1, [fp, #-8]
	ldr	r0, .L9+12
	bl	printf
.L3:
	ldr	r0, .L9+16
	bl	printf
	sub	r3, fp, #9
	mov	r1, r3
	ldr	r0, .L9+20
	bl	__isoc99_scanf
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #115
	beq	.L6
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #83
	beq	.L6
	ldr	r0, .L9+24
	bl	puts
	nop
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L10:
	.align	2
.L9:
	.word	715827883
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits

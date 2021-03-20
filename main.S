.globl _start

_start:
	b main

main:
	@ Enable jtag on GPIO6C pins
	ldr r0, =0b00000111111111110000001010101010

	ldr r1, GRF_GPIO6C_IOMUX
	str r0, [r1]

	mov r0, #0x00000000	@ off
	mov r1, #0x00200000	@ on

	@ Set GPIO6C5 as output
	ldr r2, GPIO6_SWPORTA_DDR
	str r1, [r2]
	
	ldr r2, GPIO6_SWPORTA_DR

	mov r3, #0x10000

blink:
	@ LED on
	str r1, [r2]
	bl delay

	@ LED off
	str r0, [r2]
	bl delay

	b blink

delay:
	mov r3, #0x1000
1: 	subs r3, r3, #1
	bne 1b
	bx lr

GRF_GPIO6C_IOMUX:
	.word	0xff770064
GPIO6_SWPORTA_DR:
	.word	0xff7d0000
GPIO6_SWPORTA_DDR:
	.word	0xff7d0004

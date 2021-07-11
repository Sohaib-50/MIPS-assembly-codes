# Program to convert Celsius temperature in memory at cTemp to Fahrenheit
# equivalent in memory at fTemp

.data
cTemp: .word 96
fTemp: .word 0
res: .asciiz "The temperature in Fahrenheit is: "

.text

.globl main

.ent main

main:
la $t0, cTemp # store memory address of cTemp in t0
lw $s0, 0($t0)  # get cTemp from mem and store in s0

addi $t1, $0, 9
mult $s0, $t1
mflo $s0

addi $s0, $s0, 2

addi $t0, $0, 5
div $s0, $t0
mflo $s0

addi $s0, $s0, 32

addi $v0, $0, 4
la $a0, res
syscall

addi $v0, $0, 1
addi $a0, $s0, 0
syscall

jr $ra
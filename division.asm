.data
out1: .asciiz "Enter Dividend: "
out2: .asciiz "Enter Divisor: "
outfinal1: .asciiz "Quotient is: "
outfinal2: .asciiz " and remainder is: "

.text

.globl main

.ent main

main:

# print 1st input prompt
addi $v0, $0, 4
la $a0, out1
syscall

# get 1st int input and store in t0
addi $v0, $0, 5
syscall
addi $t0, $v0, 0

# print 2nd input prompt
addi $v0, $0, 4
la $a0, out2
syscall

# get 2nd int input and store in t1
addi $v0, $0, 5
syscall
addi $t1, $v0, 0

# calculate result
div $t0, $t1
mflo $t2
mfhi $t3

# print quotient output message string
addi $v0, $0, 4
la $a0, outfinal1
syscall

# print quotient
addi $v0, $0, 1
addi $a0, $t2, 0
syscall

# print remainder output message string
addi $v0, $0, 4
la $a0, outfinal2
syscall

# print remainder
addi $v0, $0, 1
addi $a0, $t3, 0
syscall




jr $ra
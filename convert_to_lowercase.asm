.data
out1: .asciiz "Enter uppercase alphabet followed by enter: "
outfinal: .ascii "\nYou entered: "

.text

.globl main

.ent main

main:

# print input prompt
addi $v0, $0, 4
la $a0, out1
syscall

# get uppercase aplhabet input and store in t0
addi $v0, $0, 12
syscall
addi $t0, $v0, 0

# convert to lowecase
addi $t0, $t0, 32

# print final output message string
addi $v0, $0, 4
la $a0, outfinal
syscall

# print result
addi $v0, $0, 11
addi $a0, $t0, 0
syscall


jr $ra
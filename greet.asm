.data
inp1: .asciiz "Enter your name: "
inp2: .asciiz "Enter your age: "
msg1: .asciiz "***Welcome "
msg2: .asciiz " ! You are "
msg3: .asciiz " years old now. Stay blessed***\n"

name: .space 20
age: .byte 0

.text

.globl main

.ent main

main:
# print name input prompt
li $v0, 4
la $a0, inp1
syscall

# get name input
li $v0, 8
la $a0, name
li $a1, 20
syscall

# print age input prompt
li $v0, 4
la $a0, inp2
syscall

# get age input
li $v0, 5
syscall
move $t0, $v0

# greet user
li $v0, 4
la $a0, msg1
syscall
li $v0, 4
la $a0, name
syscall
li $v0, 4
la $a0, msg2
syscall
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, msg3
syscall

li $v0, 10
syscall
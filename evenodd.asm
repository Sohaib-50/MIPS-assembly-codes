.data 
prompt: .asciiz "enter some integer: "
even_out: .asciiz "The number is even."
odd_out: .asciiz "The number is odd."
.text
.globl main 
.ent main

main:
# print input prompt
li $v0,4
la $a0,prompt
syscall

# get number input and store in t0
li $v0,5
syscall
move $t0, $v0

addi $t1, $0, 2
div $t0, $t1
mfhi $t2

beq $t2, $0, even

li $v0,4
la $a0,odd_out
syscall
j end

even:
li $v0,4
la $a0,even_out
syscall

end:
jr $ra
.end main 
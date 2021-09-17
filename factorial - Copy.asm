.data
inp1: .asciiz "Enter n: "
out1: .asciiz "Factorial of n is: "

.text

.globl main

.ent main

main:
# print n input prompt
li $v0, 4
la $a0, inp1
syscall

# get n input and store  in t0
li $v0, 5
syscall
move $t0, $v0
#s0 <- 1 (ans)
li $s0, 1

#s1 <- n (loop max)
move $s1, $t0
#s1 += 1
addi $s1, $s1, 1

# s2 <- 1 (loop variable)
li $s2, 1

LOOP:
slt  $t1, $s2, $s1
beq $t1, $0, ENDLOOP

# s0 = s0 * s2
mult $s0, $s2
mflo $s0

# S2 += 1
addi $s2, $s2, 1

j LOOP

ENDLOOP:

# print output message
li $v0, 4
la $a0 out1
syscall

# print fact answer
li $v0, 1
move $a0, $s0
syscall

li $v0, 10
syscall









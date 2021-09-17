.data
in1: .asciiz "Enter num: "
in2: .asciiz "Enter pow: "
out1: .asciiz "Answer: "
.text

.globl main

.ent main

main:
li $v0, 4
la $a0, in1
syscall

li $v0, 5
syscall
move $s0, $v0

li $v0, 4
la $a0, in2
syscall

li $v0, 5
syscall
move $s1, $v0

move $a0, $s0
move $a1, $s1

jal calc_power

move $s2, $v0

li $v0, 4
la $a0, out1
syscall

li $v0, 1
move $a0, $s2
syscall

# end
li $v0, 10
syscall



calc_power:
addi $sp, $sp, -4
sw $s0, 0($sp)

addi $sp, $sp, -4
sw $s1, 0($sp)

addi $sp, $sp, -4
sw $s2, 0($sp)

addi $sp, $sp, -4
sw $s3, 0($sp)

li $s0, 0  # loop start variable
move $s1, $a1  # loop end variable
move $s2, $a0
li $s3, 1  # answer

LOOP:
slt $t0, $s0, $s1
beq $t0, 0, ENDLOOP

mult $s3, $s2
mflo $s3

addi $s0, $s0, 1
j LOOP

ENDLOOP:

move $v0, $s3

lw $s3, 0($sp)
addi $sp, $sp, 4

lw $s2, 0($sp)
addi $sp, $sp, 4

lw $s1, 0($sp)
addi $sp, $sp, 4


lw $s0, 0($sp)
addi $sp, $sp, 4

jr $ra
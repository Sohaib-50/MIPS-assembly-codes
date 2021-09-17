.data

.text

.globl main

.ent main

main:
li $s0, 3
li $s1, 7
li $s2 1

move $a0, $s0
move $a1, $s1
move $a2, $s2

jal avg

move $s3, $v0

li $v0, 1
move $a0, $s3
syscall


li $v0, 10
syscall



avg:
addi $sp, $sp, -4
sw $s0, 0($sp)

addi $sp, $sp, -4
sw $s0, 0($sp)

addi $sp, $sp, -4
sw $s2, 0($sp)


add $t0, $s0, $s1
add $t0, $t0, $s2

addi $t0, $t0, 1

li $t1, 3

div $t0, $t1

mflo $v0

jr $ra



lw $s2, 0($sp)
addi $sp, $sp, 4

lw $s1, 0($sp)
addi $sp, $sp, 4


lw $s0, 0($sp)
addi $sp, $sp, 4
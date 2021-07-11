.data
out1: .asciiz "Enter some integer value followed by enter: "
outfinal: .asciiz "2's complement of your input is: "

.text

.globl main

.ent main

main:

# print input prompt
addi $v0, $0, 4
la $a0, out1
syscall

# get no. input and store in t0
addi $v0, $0, 5
syscall
addi $t0, $v0, 0

# calculate 1's complement
addi $t1, $0, 0
nor $t0, $t0, $t1

# add 1 to get 2's complement
addi $t0, $t0, 1

# print output message string
addi $v0, $0, 4
la $a0, outfinal
syscall

# print result
addi $v0, $0, 1
addi $a0, $t0, 0
syscall

jr $ra
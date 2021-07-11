.data
outx: .asciiz "Enter some integer value for x followed by enter: "
outy: .asciiz "Enter some integer value for y followed by enter: "
outz: .asciiz "Enter some integer value for z followed by enter: "
outfinal: .asciiz "Result of x - y + z - 96 is: "

.text

.globl main

.ent main

main:

# print x input message
addi $v0, $0, 4
la $a0, outx
syscall

# get x input and store in t0
addi $v0, $0, 5
syscall
addi $t0, $v0, 0


# print y input message
addi $v0, $0, 4
la $a0, outy
syscall

# get y input and store in t1
addi $v0, $0, 5
syscall
addi $t1, $v0, 0


# print z input message
addi $v0, $0, 4
la $a0, outz
syscall

# get z input and store in t2
addi $v0, $0, 5
syscall
addi $t2, $v0, 0


# calculate result
sub $s0, $t0, $t1
add $s0, $s0, $t2
addi $s0, $s0, -96

# print final output message string
addi $v0, $0, 4
la $a0, outfinal
syscall

# print result
addi $v0, $0, 1
addi $a0, $s0, 0
syscall


jr $ra
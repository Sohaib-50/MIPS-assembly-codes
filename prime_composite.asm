.data
inp: .asciiz "Enter some integer: "
outprime: .asciiz "The number is prime"
outcomp: .asciiz "The number is composite"

.text

.globl main

.ent main

main:
# print input prompt
li $v0, 4
la $a0, inp
syscall

# get number input
li $v0, 5
syscall
move $s0, $a0  # s0 <- input

## check if prime

# loop start variable = 2
li $s1, 2

LOOP:
slt $t0, $s1, $s0
beq $t0, $0, ENDLOOP

div $s0, $s1
mfhi $t1
bne $t1, $0, ENDIF

# print num is comp and exit loop
li $v0, 4
la $a0, outcomp
syscall
j EXIT

ENDIF:
# inc loop var
addi $s1, 1

ENDLOOP:
# print number is prime
li $v0, 4
la $a0, outprime
syscall

EXIT:
li $v0, 10
syscall
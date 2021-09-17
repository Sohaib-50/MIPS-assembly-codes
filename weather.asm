.data

inp1: .asciiz "Enter temperature of the day: "
out1: .asciiz "It is hot today"
out2: .asciiz "Pleasant weather"
out3: .asciiz "It is cold today"

.text

.globl main


.ent main

main:
# print input temperature prompt
li $v0, 4
la $a0, inp1
syscall

# read temperature input
li $v0, 5
syscall
move $s0, $v0  # s0 <- input_temp

# t0 <- 31
li $t0, 30
		
slt $t1, $t0, $s0
beq $t1, $0, elseif

# print 1st output
li $v0, 4
la $a0, out1
syscall
j end

elseif:
# t0 <- 20
li $t0, 20

slt $t1, $t0, $s0
beq $t1, $0, else

#print 2nd output
li $v0, 4
la $a0, out2
syscall
j end

else:

#print 3rd output
li $v0, 4
la $a0, out3
syscall

end:
#exit
li $v0, 10
syscall


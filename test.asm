.data
options: .byte 'y', 'n'

.text

.globl main

.ent main

main:
li $v0, 11
la $t0, options
lb $a0, 0($t0)
syscall


jr $ra
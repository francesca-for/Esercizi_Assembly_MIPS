               .data
vett:          .word 3, 2, 6, 5, 1, 9, 4
message:       .asciiz "Valore massimo: "
               .text
               .globl main
               .ent main

main:          la $a0, vett
               li $a1, 7
               jal massimo
               move $t1, $v0

               la $a0, message
               li $v0, 4
               syscall
               move $a0, $t1
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main

massimo:
               lw $t1, ($a0)
               addi $a1, $a1, -1
               move $t0, $t1   # $t0 = max

for:           addi $a0, $a0, 4
               lw $t1, ($a0)
               ble $t1, $t0, else
               move $t0, $t1
else:          addi $a1, $a1, -1
               bgt $a1, $0, for

               move $v0, $t0
               jr $ra

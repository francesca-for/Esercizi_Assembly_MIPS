               .data
num:           .word 3141592653
               .text
               .globl main
               .ent main
main:
               la $t0, num
               lw $s1, ($t0)
               #li $t2, 0   # contatore iterzioni
               move $t9, $sp

for:           divu $s1, $s1, 10
               mfhi $t0
               sw $t0, ($t9)
               addi $t9, $t9, -4  # aggiorno stack pointer
               bne $s1, 0, for

for2:          addi $t9, $t9, 4
               lw $a0, ($t9)
               li $v0, 11
               syscall
               bne $t9, $sp, for2

               li $v0, 10
               syscall
               .end main

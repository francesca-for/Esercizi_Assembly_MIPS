               .data
ora_in:        .byte 12, 47
ora_out:       .byte 18, 14
X:             .byte 1
Y:             .byte 40

               .text
               .globl main
               .ent main
main:
               addi $sp, $sp, -4
               sw $ra, ($sp)

               la $a0, ora_in
               la $a1, ora_out
               lbu $a2, X
               lbu $a3, Y
               jal costoParcheggio

               move $a0, $v0
               li $v0, 1
               syscall

               addi $sp, $sp, 4
               jr $ra
               .end main


costoParcheggio:
               move $t0, $a0
               mul $t0, $t0, 60
               lb $t1, 1($a0)
               add $t0, $t0, $t1  # $t0 = ora ingresso

               move $t2, $a1
               mul $t2, $t2, 60
               lb $t3, 1($a1)
               add $t2, $t2, $t3  # $t2 = ora uscita

               sub $t2, $t2, $t0   # t2 = res

               lb $t4, ($a2)  # prezzo
               lb $t5, ($a3)  # tempo
               div $t2, $t5
               mflo $t2
               mfhi $t7
               mul $t8, $t2, $t4   # t8 = costo tot
               beq $t7, $0, return
               addi $t8, $t8, 1
     return:   move $v0, $t8
               jr $ra

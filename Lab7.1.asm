               .data
               .text
               .globl main
               .ent main
main:
               addi $sp, $sp, -4
               sw $ra, ($sp)

               li $t0, 4
               li $t1, 2
               li $t2, -5
               li $t3, 3

               li $s0, 8
               li $s1, 4
               li $s2, 27
               li $s3, 9
               li $s4, 64
               li $s5, 16
               addi $t4, 7 #N

               addi $sp, $sp, -16
               sw $t0, 4($sp)
               sw $t1, 8($sp)
               sw $t2, 12($sp)
               sw $t3, 16($sp)

               addi $sp, $sp, -4
               sw $t4, ($sp)

               # calcolo p(1)
               add $t6, $t0, $t1
               add $t6, $t6, $t2
               add $t6, $t6, $t3
               move $a0, $t6

               # calcolo p(2)
               mul $a1, $t0, $s0
               mul $t6, $t1, $s1
               add $a1, $a1, $t6
               mul $t6, $t1, $s1

               # calcolo p(2)
               add $t6, $t0, $t1
               add $t6, $t6, $t2
               add $t6, $t6, $t3
               move $a0, $t6

               # calcolo p(2)
               add $t6, $t0, $t1
               add $t6, $t6, $t2
               add $t6, $t6, $t3
               move $a0, $t6

               jr $ra
               .end main

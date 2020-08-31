               .data
messageInput:  .asciiz "Inserire valori di n, k:\n"
messageOutput: .asciiz "\nC(n,k) = "

               .text
               .globl main
               .ent main
main:
               la $a0, messageInput
               li $v0 4
               syscall
               li $v0, 5
               syscall
               move $t1, $v0   # $t1 = n
               li $v0, 5
               syscall
               move $t2, $v0   # $t2 = k

               move $a0, $t1
               move $a1, $t2
               jal num
               move $t3, $v0   # numeratore

               jal denom
               move $t4, $v0   # denominatore

               div  $t3, $t4   # res
               mflo $t3

               la $a0, messageOutput  # stampa risultato
               li $v0 4
               syscall
               move $a0, $t3
               li $v0 1
               syscall

               li $v0, 10
               syscall
               .end main


num:           move $t1, $a0   # $t1 = n
               move $t2, $a1   # $t2 = k

               li $t7, 1   # contatore
               addi $t2, $t2, 1   # k+1

     for1:     sub $t3, $t1, $t7   # n-x,  x=1,2,3,...,k+1
               mul $t1, $t1, $t3
               addi $t7, $t7, 1
               blt $t7, $t2, for1

               move $v0, $t1
               jr $ra


denom:         move $t2, $a1   # $t2 = k
               move $t7, $t2   # contatore che decresce
               addi $t3, $t2, -1
     for2:     mul $t2, $t2, $t3
               addi $t3, $t2, -1
               addi $t7, $t7, -1  # decremento contatore
               bgt $t7, 0, for2

               move $v0, $t2
               jr $ra

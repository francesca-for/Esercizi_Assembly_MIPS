               .data
DIM = 5
inputMessage:  .asciiz "Inserisci \DIM numeri interi\n"

               .text
               .globl main
               .ent main
main:          move $t1, $0   # somma
               move $t2, $0   # contatore
               la $a0, inputMessage
               li $v0, 4
               syscall

Loop:          li $v0, 5
               syscall
               add $t1, $t1, $v0   # acquisisco 5 interi e li sommo
               addi $t2, $t2, 1    # incremento contatore
               blt $t2, DIM, Loop

               div $t0, $t1, DIM
               #div $t1, DIM
               #mflo $t2     #  = floor($s1 /DIM)
               #mfhi $t3    #  = $s1 mod DIM

               #div $t4, DIM, 2

               #ble $t3, $t4, print
               #addi $t0, $t2, 1

print:         move $a0, $t0
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main

          #   l'approssimazione avviene sempre per difetto

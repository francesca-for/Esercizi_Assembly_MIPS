               .data
vettColonna:   .word 1, 2, 3, 4
vettRiga:      .word 2, 3, 4, 5
matriceRes:    .space 84
DIM=4
OFFSET=4

               .text
               .globl main
               .ent main
main:          la $t1, vettColonna
               #lw $s1, ($t0)
               la $t2, vettRiga
               #lw $s2, ($t0)
               la $t3, matriceRes
               #lw $s3, ($t0)

               li $t4, 0   # i  –> colonna[i]
               li $t5, 0   # j  –> riga[j]

forExt:        lw $s1, ($t1)
               addi $t1, $t1, OFFSET    # aggiorno indirizzo
               addi $t4, $t4, 1   # incremento i

forInt:        lw $s2, ($t2)
               addi $t2, $t2, OFFSET    # aggiorno indirizzo
               addi $t5, $t5, 1   # incremento j
               mult $s1, $s2
               mflo $t0
               sw $t0, ($t3)
               addi $t3, $t3, OFFSET    # aggiorno indirizzo res
               bge DIM, $t5 forInt

               bge DIM, $t4 forExt

               li $v0, 10
               syscall
               .end main

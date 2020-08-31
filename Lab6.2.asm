               .data
messageInput:  .asciiz "Dimensione lato di triangolo e quadrato: "
messageOutput: .asciiz "\nFigura:\n"
CHAR = '*'
               .text
               .globl main
               .ent main
main:
               la $a0, messageInput
               li $v0, 4
               syscall
               li $v0, 5
               syscall
               move $t0, $v0

               la $a0, messageOutput
               li $v0, 4
               syscall

               move $a0, $t0
               jal stampaTriangolo
               move $a0, $t0
               jal stampaQuadrato

               li $v0, 10
               syscall
               .end main


stampaTriangolo:
               move $t0, $a0   # $t0 = DimLato
               li $t1, 0    # i
forT:          li $t2, 0    # j
     forIntT:  li $a0, CHAR
               li $v0, 11
               syscall
               addi $t2, $t2, 1   # j = j++
               ble $t2, $t1, forIntT   # if (j<i) -> salta

               li $a0, '\n'
               li $v0, 11
               syscall
               addi $t1, $t1, 1   # i = i++
               blt $t1, $t0, forT   # if (i<LATO) -> salta

               jr $ra


stampaQuadrato:
               move $t0, $a0   # $t0 = DimLato
               li $t1, 0    # i
forQ:          li $t2, 0    # j
     forIntQ:  li $a0, CHAR
               li $v0, 11
               syscall
               addi $t2, $t2, 1
               blt $t2, $t0, forIntQ

               li $a0, '\n'
               li $v0, 11
               syscall
               addi $t1, $t1, 1
               blt $t1, $t0, forQ   # if (i<DimLato) -> salta

               jr $ra

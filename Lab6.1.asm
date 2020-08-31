               .data
LATO = 8
CHAR = '*'
               .text
               .globl main
               .ent main
main:
               jal stampaTriangolo
               jal stampaQuadrato

               li $v0, 10
               syscall
               .end main


stampaTriangolo:
               li $t1, 0    # i
forT:          li $t2, 0    # j
     forIntT:  li $a0, CHAR
               li $v0, 11
               syscall
               addi $t2, $t2, 1   # j = j++
               ble $t2, $t1, forIntT   # if(j<i) -> salta

               li $a0, '\n'
               li $v0, 11
               syscall
               addi $t1, $t1, 1   # i = i++
               blt $t1, LATO, forT   # if(i<LATO) -> salta

               jr $ra


stampaQuadrato:
               li $t1, 0    # i
forQ:          li $t2, 0    # j
     forIntQ:  li $a0, CHAR
               li $v0, 11
               syscall
               addi $t2, $t2, 1
               blt $t2, LATO, forIntQ

               li $a0, '\n'
               li $v0, 11
               syscall
               addi $t1, $t1, 1
               blt $t1, LATO, forQ   # if(i<LATO) -> salta

               jr $ra

               .data
matrice:       .word  1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 3, 0, 0, 0, 0, 4
diag:          .asciiz "La matrice è diagonale:\n"
simm:          .asciiz "La matrice è simmetrica:\n"
random:        .asciiz "La matrice non è nè simmetrica nè diagonale:\n"
DIM = 4
               .text
               .globl main
               .ent main
main:          m
               .
               li $v0, 10
               syscall
               .end main

          # num ireazioni = ( DIM^2 - DIM ) / 2

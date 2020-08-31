               .data
message:       .asciiz "Inserire coeff. a, b, c\n"
noSol:         .asciiz "L'equazione non ha soluzioni reali\n"
unaSol:        .asciiz "L'equazione ha due soluzioni reali coincidenti\n"
dueSol:        .asciiz "L'equazione ha due soluzioni reali distinte\n"

               .text
               .globl main
               .ent main
main:          la $a0, message
               li $v0, 4
               syscall

               li $v0, 5
               syscall
               move $s1, $v0   # a

               li $v0, 5
               syscall
               move $s2, $v0   # b

               li $v0, 5
               syscall
               move $s3, $v0   # c

               mul $t1, $s2, $s2
               mul $t2, $s1, $s3
               mul $t2, $t2, 4
               sub $t1, $t1, $t2   # $t1 = delta

               slt $t0, $t1, $0
               bne $t0, $0,  sol_0

               beq $t1, $0, sol_1

               la $a0, dueSol
               li $v0, 4
               syscall
               j end

sol_0:         la $a0, noSol
               li $v0, 4
               syscall
               j end

sol_1:         la $a0, unaSol
               li $v0, 4
               syscall

end:           li $v0, 10
               syscall
               .end main

          # b^2 - 4ac ≥ 0

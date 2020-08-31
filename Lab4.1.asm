               .data
array:         .space 80

               .text
               .globl main
               .ent main
main:          li $t1, 0   # contatore
               li $s1, 1 # 1^
               li $s2, 1 # 2^
               la $t0, array
               sw $s1, ($t0)
               addi $t0, $t0, 4
               sw $s2, ($t0)
               addi $t0, $t0, 4

for:           beq $t1, 20, endFor
               add $t3, $s1, $s2  # t3 = s1 + s2
               sw $t3, ($t0)      #carico in memoria t3
               addi $t0, $t0, 4    # aggiorno indirizzo
               addi $s1, $s2,0     # s1 = s2
               addi $s2, $t3,0     # s2 = t3
               addi $t1, $t1, 1    # incremento contatore
               j for
endFor:
               li $v0 10
               syscall
               .end main

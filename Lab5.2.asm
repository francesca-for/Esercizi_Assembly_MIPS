               .data
message:       .asciiz "Inserire una parola:\n"
nonPalindroma: .asciiz "La parola inserita non è palindroma\n"
palindroma:    .asciiz "La parola inserita è palindroma\n"

               .text
               .globl main
               .ent main
main:          move $t8, $sp  # prima pos di sp
               move $t9, $sp  # ultima pos di sp
               li $t7, 0
               la $a0, message
               li $v0, 4
               syscall

for:           li $v0, 12
               syscall
               beq $v0, '\n', endFor
               sw $v0, ($t9)
               addi $t9, $t9, -4
               addi $t7, $t7, 1
               j for

endFor:        divu $t7, $t7, 2

forCheck:      lw $t1, ($t8)
               lw $t2, 4($t9)
               bne $t1, $t2, notPal
               addi $t8, $t8, -4
               addi $t9, $t9, 4
               addi $t7, $t7, -1
               bne $t7, 0, forCheck

               la $a0, palindroma
               li $v0, 4
               syscall
               j end

notPal:        la $a0, nonPalindroma
               li $v0, 4
               syscall

end:           li $v0, 10
               syscall
               .end main

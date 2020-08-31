               .data
errorMsg:      .asciiz "\nInput errato\n"
messageInput:  .asciiz "Inserire un numero\n"

               .text
               .globl main
               .ent main
main:          la $a0, messageInput
               li $v0, 4
               syscall
               andi $t1, $0, 0    # variabile
               addi $t2, $0, 10   # shift a sx di una pos in decimale
loop:          li $v0, 12
               syscall
               beq  $v0, '\n', end
               blt $v0, '0', err
               bgt $v0, '9', err
               mul $t1, $t1, $t2  # shifto cifre già presenti
               addi $t0, $v0, -48
               add $t1, $t1, $t0  # sommo nuova cifra
               j loop

err:           la $a0, errorMsg
               li $v0, 4
               syscall
               j main

end:           move $a0, $t1
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main

               #    #    #    #    #    #    #    #    #
#    E R R O R E  N E L L A   —–>   l a   $ a 0 ,   m e s s a g e
               .data
messageInput:  .asciiz "Inserire un numero\n"
errorMsg:      .asciiz "\nInput errato\n"
overflowMsg:   .asciiz "\nOverflow: il numero è troppo grande\n"

               .text
               .globl main
               .ent main
main:          la $a0, messageInput
               li $v0, 4
               syscall
               move $t1, $0     # variabile
               addi $t2, $0, 10    # shift a sx di una pos in decimale

loop:          li $v0, 12
               syscall
               beq  $v0, '\n', end
               blt $v0, '0', err   #controllo se il carattere è corretto
               bgt $v0, '9', err
               multu $t1, $t2   # shifto cifre già presenti -> t3 temp che contiene dato traslato
               mfhi $t3
               bne $t3, $0, overflowMsg
               mflo $t1
               addi $t0, $v0, -48
               add $t3, $t1, $t0   # sommo nuova cifra inserita
               blt $t1, $t3, overflowMsg     # overflow check
               move $t1, $t3
               j loop

err:           la $a0, errorMsg
               j printMsg

overflowMsg:   la $a0, overflowMsg

printMsg:      li $v0, 4
               syscall
               j main

end:           move $a0, $t1
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main

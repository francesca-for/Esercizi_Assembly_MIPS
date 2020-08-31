               .data
message_in:    .asciiz "Inserire un numero intero: "
message_out1:   .asciiz "Il numero è pari"
message_out2:   .asciiz "Il numero è dispari"

               .text
               .globl main
               .ent main
               #la $t1, message_in
               #la $t2, message_out1
               #la $t3, message_out2

main:          la $a0, message_in
               li $v0, 4
               syscall           # stampa messaggio
               li $v0, 5
               syscall           # legge un intero
               addi $t0, $0, 1   # $t0 = 00000001
               and $t0, $t0, $v0   # and logico

               bne $t0, $0, DISP
               la $a0, message_out1
               li $v0, 4
               syscall
               j PARI    # jump to PARI

DISP:          la $a0, message_out2
               li $v0, 4
               syscall
PARI:
               li $v0, 10
               syscall
               .end main

          #  00101010  and
          #  00000001 =
          #  00000000  -> è pari

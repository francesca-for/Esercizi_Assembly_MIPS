               .data
message_in:    .asciiz "Inserire un numero intero: "
err_mess:      .asciiz "uno dei valori non è rappresentabile su un byte"

               .text
               .globl main
               .ent main
main:
               la $a0, message_in
               li $v0, 4
               syscall
               li $v0, 5         # primo intero  $t1
               syscall
               addi $t1, $v0, 0
               la $a0, message_in
               li $v0, 4
               syscall
               li $v0, 5         # secondo intero  $t2
               syscall
               addi $t2, $v0, 0

               srl $t8, $t1, 8
               srl $t9, $t2, 8
               bne $t8, $0, ERR
               bne $t9, $0, ERR

               nor $t3, $t2, $0    # $t3 = not $t2  variabile temporanea
               and $t3, $t1, $3    # $t3 = $t1 and (not $t2)
               nor $t3, $t3, $0    # $t3 = not ( $t1 and (not $t2) )

               xor $t4, $t1, $t2   # $t4 = parte a destra

               or $t3, $t3, $t4    # t3 = res

               andi  $t3, $t3, 0x000000ff
               add $a0, $t3, $0    # stampo risultato
               li $v0, 1
               syscall

               j END

ERR:           la $a0, err_mess
               li $v0, 4
               syscall
END:
               li $v0, 10
               syscall
               .end main

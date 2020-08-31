               .data
OFFSET = 'A'-'a'
parola: .ascii "ciao"

               .text
               .globl main
               .ent main
main:
               la $t0, parola
               li $t1, 0

for:           lb $a0, ($t0)
               jal converti
               sb $v0, ($t0)
               addi $t0, $t0, 1   # incremento indirizzo di un byte
               addi $t1, $t1, 1   # incremento contatore
               blt $t1, 4, for

               la $a0, parola
               li $v0, 4
               syscall

               li $v0, 10
               syscall
               .end main


converti:      addi $v0, $a0, OFFSET
               jr $ra

               .data
opa:           .word 2043
opb:           .word 5
res:           .space 4
tab:           .word somma, sottrazione, moltiplic, divisione
inputMessage:  .asciiz "Quale operazione si vuole svoglere?\n0=somma 1=sottrazione 2=moltiplic 3=divisione\n"
printMessage:  .asciiz "Risultato: "

               .text
               .globl main
               .ent main
main:          la $t0, opa
               lw $s1, ($t0)
               la $t0, opb
               lw $s2, ($t0)
               #la $t0, tab

               la $a0, inputMessage
               li $v0, 4
               syscall

               li $v0, 5
               syscall

               mul $t0, $v0, 4
               lw $t2, tab($t0)
               jr $t2

somma:         add $t4, $s1, $s2
               j print

sottrazione:   sub $t4, $s1, $s2
               j print

moltiplic:     mult $s1, $s2
               mflo $t4
               j print

divisione:     div $s1, $s2
               mflo $t4

print:         la $t0, res
               sw $t4, ($t0)

               la $a0, printMessage
               li $v0, 4
               syscall

               move $a0, $t4
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main

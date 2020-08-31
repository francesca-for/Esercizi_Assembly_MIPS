#    Versione usando un ciclo
          # Errore : aggiorna sempre solo $t2 WTF??
          .data
          var1:     .byte 'm'
          var2:     .byte 'i'
          var3:     .byte 'p'
          var4:     .byte 's'
          var5:     .byte 0

          .text
          .globl main
          .ent main

main:     li $t0, 'A'
          li $t1, 'a'
          sub $t0, $t0, $t1   # $t0 = offset

          lb $t1, var1
          lb $t2, var2
          lb $t3, var3
          lb $t4, var4
          lb $t5, var5
          li $t6, 0    # $t6 = contatore
          #la $t7, var1   #indirizzo prima variabile

LOOP:     add $t2, $t2, $t0
          addi $t2, $t2, 4
          addi $t6, $t6, 1
          bne $t6, 3, LOOP

          sb $t1, var1
          sb $t2, var2
          sb $t3, var3
          sb $t4, var4
          sb $t5, var5

          li $v0, 4      # stampa
          la $a0, var1
          syscall

          li $v0, 10
          syscall
          .end main


#    versione semplice senza usare cicli
          .data
          var1: .byte 'm'
          var2: .byte 'i'
          var3: .byte 'p'
          var4: .byte 's'
          var5: .byte 0

          .text
          .globl main
          .ent main
main:
          lb $t1, var1
          lb $t2, var2
          lb $t3, var3
          lb $t4, var4
          lb $t5, var5
          li $t8, 'A'
          li $t9, 'a'
          sub $t8, $t8, $t9  # offset
          add $t1, $t1, $t8
          add $t2, $t2, $t8
          add $t3, $t3, $t8
          add $t4, $t4, $t8
          sb $t1, var1
          sb $t2, var2
          sb $t3, var3
          sb $t4, var4
          sb $t5, var5
          li $v0, 4
          la $a0, var1
          syscall
          li $v0, 10
          syscall
          .end main

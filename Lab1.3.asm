          .data
op1:      .byte 150
op2:      .byte 100

          .text
          .globl main
          .ent main

main:     lbu $t0, op1   # devo considerarli unsigned perchè 150 non è
          lbu $t1, op2   # rappresentabile in binario puro su 8 bit
          add $t0, $t0, $t1

          li $v0, 10
          syscall
          .end main

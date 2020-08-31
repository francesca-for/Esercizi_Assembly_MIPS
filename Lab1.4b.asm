          .data
          op2: .byte 0x3FFFFFF0

          .text
          .globl main
          .ent main
main:     lw $t1, op2
          sll $t1, $t1, 1
          li $t2, 40
          addi $t1, $t1, $t2

          li $v0, 1
          addi $a0, $t1, 0
          syscall

          li $v0, 0
          syscall
          .end main

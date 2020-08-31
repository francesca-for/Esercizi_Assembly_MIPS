          .data
          op2: .byte 0x3FFFFFF0    # 1073741808 in base 10

          .text
          .globl main
          .ent main
main:     lw $t1, op2
          sll $t1, $t1, 1
          addi $t2, $t1, 40
          li $v0, 1
          addi $a0, $t1, 0
          syscall
          li $v0, 1
          addi $a0, $t2, 0
          syscall

          li $v0, 10
          syscall
          .end main

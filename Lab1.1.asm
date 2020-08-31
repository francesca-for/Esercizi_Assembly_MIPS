          .data
n1:       .byte 10       # 10
n2:       .byte 0x10     # 16
n3:       .byte '1'      # 49 secondo codifica ASCII
res:      .space 1

          .text
          .globl main
          .ent main

main:     lb   $t0, n1
          lb   $t1, n2
          lb   $t2, n3
          add  $t1, $t1, $t2
          sub  $t0, $t0, $t1
          sb   $t0, res
          li   $v0, 10
          syscall
          .end main

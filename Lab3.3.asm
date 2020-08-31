               .data
giorni:        .byte 4
ore:           .byte 15
minuti:        .byte 37
               .align 3
res:           .space 4

               .text
               .globl main
               .ent main
main:          la $t0, giorni
               lb $t1, 0($t0)
               la $t0, ore
               lb $t2, 0($t0)
               la $t0, minuti
               lb $t3, 0($t0)
               #la $t4, res

               mul $t1, $t1, 24  # $t0 = registro temporaneo
               #mflo $t1
               mul $t1, $t1, 60
               #mflo $t1
               mul $t2, $t2, 60
               #mflo $t2
               add $t1, $t1, $t2
               add $t1, $t1, $t3

               #sw $t1, 0($t4)
               sw $t1, res

               li $v0, 10
               syscall
               .end main

               # max = n giorni, 23h, 59m
               # ≈ 2^31 = n·24·60 + 23·60 + 59
               # n = (2^31 - 23·60 - 59) / (24·60) ≈ 1490000
               # 1490000 = 101101011110001010000 NON RAPPRESENTABILE SU 1 byte

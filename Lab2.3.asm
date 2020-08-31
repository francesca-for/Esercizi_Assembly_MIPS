               .data
a0:             .word 62
b0:             .word 53
c0:             .word 27

               .text
               .globl main
               .ent main
main:
               la $t0, a0
               lw $t1, 0($t0)
               la $t0, b0
               lw $t2, 0($t0)
               la $t0, c0
               lw $t3, 0($t0)

               ble $t1, $t2, T1   # t1>t2 –> scambio
               addi $t0, $t1, 0
               addi $t1, $t2, 0
               addi $t2, $t0, 0
T1:            ble $t1, $t3, T2   # t1>t3 –> scambio
               addi $t0, $t1, 0
               addi $t1, $t3, 0
               addi $t3, $t0, 0
T2:            ble $t2, $t3, P   # t2>t3 –> scambio
               addi $t0, $t2, 0
               addi $t2, $t3, 0
               addi $t3, $t0, 0

P:             addi $a0, $t1, 0
               li $v0, 1
               syscall
               addi $a0, $t2, 0
               li $v0, 1
               syscall
               addi $a0, $t3, 0
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main


               #    3    2    1
               #    2    3    1
               #    1    3    2
               #    1    2    3

     .data
     mat  .word 0,2,4,6,8
          .word

     .text
     addi     $t5, $0, 5
     la       $t0, mat
     addi     $t1, $t0, 2
     sll      $t1, $t1, 2
     add      $t2, $0, 0      #inizializzo t2 a 0
     add      $t3, $t0, $t1
L1:  lw       $t4, 0($t3)
     addi     $t4, $t4, 1
     sw       $t4, 0($t3)
     addi,    $t2, $t2, 1
     add      $t3, $t3, 20     #
     bne      $t2, $t5, L1     # t5 conta iterazioni

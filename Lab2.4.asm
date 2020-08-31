               .data
operand:       .half 45867   # 45867 -> 1011 0011 0010 1011

               .text
               .globl main
               .ent main
main:
               la $t0, operand
               lh $s1, 0($t0)      # $s1 -> operand
               addi $s2, $0, 1     # $s2 -> mask = 0000 0000 0000 0001
               add $s3, $0, $0     # $s3 = 0 -> index
               add $s4, $0, $0     # $s4 = 0 -> cont
               ori $t1, $0, 15    # max iterazioni

FOR:           bgt $s3, $t1, done
               and $t0, $s1, $s2   # $t0 reg temporaneo
               beq $t0, $0, else
               addi $s4, $s4, 1
else:          sll $s2, $s2, 1
               addi $s3, $s3, 1
               j FOR

done:          addi $a0, $s4, 0
               li $v0, 1
               syscall

               li $v0, 10
               syscall
               .end main


          #   int cont=0;
          #   int i;
          #   mask = 0000 0000 0000 0001;
          #
          #   for(i=0; i<16; ){
          #      temp = operand and mask;
          #      if(temp != $0) {
          #         cont++;
          #      }
          #      shifto mask a sx di i bit;
          #      i++;
          #   }
          #
          #   stampa cont ( = num di 1 );

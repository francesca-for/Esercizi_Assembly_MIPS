# SOMMA DI SUE VARIABILI

#per convenzione i label sono allineati a sinistra, pseudo-istruzioni, istruzioni, direttive iniziano con un tab

	.data
	#dichiarazione dei dati
op1: .byte 3
op2:	.byte 2
res:	.space 1 # con byte devo indicare anche un valore di inizializzazione, con space indico il numero di byte da allocare

	.text
	#codice
	.globl main
	.ent main
main:	# qui stanno le istruzioni
	lb $t1, op1		#carico nei registri le variabili op1 e op2
	lb $t2, op2
	add $t1, $t1, $t2	#salvo in $t1 il ris di $t1 + $t2
	sb $t1, res		#salvo il risultato in res

	li $v0, 10		#istruzioni per terminare il programma
	syscall
	.end main

#lab4.s

main:
	li $s0, 0 # sum
	li $s1, 0 # index
	li $s2, 21 # max index (20 inclusive)
loop:
	beq $s1, $s2, done
	multu $s1, $s1 # square
	mflo, $t0 # Move 32 lsb to a temp register
	#(assume number is not over 32 bits)
	add $s0, $s0, $t0 # add number to sum register
	addi $s1, $s1, 1 # incremen index
	j loop
done:
	jr $ra

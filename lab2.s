#lab2.s
.text
main:
	li $s0, 0 # Sum
	li $s1, 0 # Index
	li $s2, 21 # Max Index
loop:
	beq $s1, $s2, done
	add $s0, $s0, $s1
	addi $s1, $s1, 1
	j loop
done: 
	jr $ra

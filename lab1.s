# lab1.s
.text
main: 
	li $s0, 0 #sum
	li $s1, 0 # Index
	li $s2, 10 # Limit of 10

loop: 
	beq $s1, $s2, done
	add $s0, $s0, $s1
	addi $s1, $s1, 1
	j loop
done: jr $ra

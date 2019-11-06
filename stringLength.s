# Find String Length

.data

string:			.asciiz "abc"
answerMessage:	.asciiz "The length is "

.text

main:
	# Handle stack
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	
	# Print string

	
	# Call function
	jal strlen
	
	# Handle stack
	add $sp, $sp, 4
	lw $ra, 0($sp)
	
	
	# Get return value from strlen
	la $t0, 0($v0)
	
	# print answerMessage
	la $a0, answerMessage
	li $v0, 4
	syscall
	
	# Print return value
	la $a0, 0($t0)
	li $v0, 1
	syscall
	
	# Exit program
	li $v0, 10
	syscall

strlen:
	la $t0, string
loop:
	
	lb $t1, 0($t0)
	beq $t1, $0, done
	addu $t0, $t0, 1
	addu $t2, $t2, 1
	
	j loop
	
done:
	la $v0, 0($t2)
	jr $ra
	

	
	
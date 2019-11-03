# factorial

.data
inputPrompt:		.asciiz("Input a number to get the factorial")
message:			.asciiz("\n The answer is")

number .word 0
answer .word 1
.text
main:
	# Set up intial conditions
	
	# Ask user input 
	la $a0, inputPrompt
	li $v0, 4
	syscall
	
	# Get user input
	li $v0, 5
	
	# Factorial function
	jal factorial
	
	# Get return value
	add $t0, $0, $v0
	
	# Output answer
	la $a0, message
	li $v0, 4
	syscall
	
	la $a0, 0($t0)
	li $v0, 1
	
	jr $ra
	
	
	
	
factorial:
			# Make room in stack for $ra and number
			
			sub $sp, $sp, 8
			sw $ra, 0($sp)
			sw $a0, 4($sp)
			
			li $s0, $a0
			
			# Base case
			beq $a0, 0, done
			
			jal factorial
			
			mul $a0, $v0, $v0 ??
			
done:
		# Return stack positions
		lw $ra, 0($sp)
		lw $v0, 4($sp)
		add $sp, $sp, 8
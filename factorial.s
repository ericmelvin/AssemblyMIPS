# factorial

.data
inputPrompt:		.asciiz "Input a number to get the factorial\n"
message:			.asciiz "\n The answer is"
newline:			.asciiz "\n"

number: .word 0
answer: .word 1

.text
main:
	# Set up intial conditions
	
	# Ask user input 
	la $a0, inputPrompt
	li $v0, 4
	syscall
	
	# Get user input
	li $v0, 5
	syscall
	
	sw $v0, number
	
	# Factorial function
	lw $a0, number
	jal factorial
	
	# Get return value
	sw $v0, answer
	
	# Output answer
	la $a0, message
	li $v0, 4
	syscall
	
	la $a0, answer
	li $v0, 1
	syscall
	
	
	li $v0, 10
	syscall
	
	
	
	
factorial:
			# Make room in stack for $ra and number
			
			sub $sp, $sp, 8
			sw $ra, 0($sp)
			sw $s0, 4($sp)
			
			
			
			# Base case
			li $v0, 1
			beq $a0, 0, done
			
			# Call function recursively
			move $s0, $a0
			sub $a0, $a0, 1
			jal factorial
			
			mul $v0, $s0, $v0
			
			# Debugging print statements	
			la $a0, ($v0)
			li $v0, 1
			syscall
			
			la $a0, newline
			li $v0, 4
			syscall
			
done:
		# Return stack positions
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		add $sp, $sp, 8
		jr $ra
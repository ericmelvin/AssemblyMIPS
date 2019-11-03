.data

x: .word 42

message: .asciiz "Hello world!\n"
newline: .asciiz "\n"
.text

main:
	addi $sp, $sp, -4 # Move down to a blank memory space in the stack
	sw $ra, 0($sp) 	  # Store the return address in the stack
	
	# To make a system call 1. load argument 2. put systemcall number in $v0 3. Call syscall
	
	# Print the number
	lw $a0, x         # load x's memory location in $a0 (argument register)
	li $v0, 1		  # Load the system call number into $v0 (subroutines that return value put their result in $v0
	syscall           # Execute the system call
	
	# Print new line
	la $a0, newline
	li $v0, 4
	syscall
	
	# Print hello world
	la $a0, message   # Load the address of message into $a0
	li $v0, 4         # Load the immidiate value 4 into $v0 (4 is the syscall that prints a string
	syscall           # Call operating system
	
	
	
	# Return to the operating system
	lw $ra, 0($sp)	   # Move old $ra stored in stack back into $ra
	addi $sp, $sp 4    # Decrement the stack
	
	jr $ra
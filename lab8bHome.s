#lab8b

# Print 1-20 inclusive to console

# Store memory in .data
.data
newline: .asciiz "\n"

.text # Without this .text you will be storing the code in memory.. NO

# Always have a main, its where the compiler starts
main:
	li $s0, 0			# Index for loop
	li $s1, 21			
	
loop:
	beq $s0, $s1, end
	
	# free up space in stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# Print value
	add $a0, $s0, $0
	li $v0, 1			# Load the syscall number into $v0
	syscall
	
	# Print newline
	la $a0, newline
	li $v0, 4
	syscall
	
	addi, $s0, $s0, 1   # Increment the index by 1
	
	j loop
end:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra				# Always end by jumping to $ra


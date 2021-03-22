# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 1: lpyear

.globl lpyear

lpyear:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	
	bltz x10, negative
	li t2, 400
	rem t1, x10,t2
	beqz t1, leap
	li t2, 100
	rem t1, x10, t2
	beqz t1, notleap
	li t2, 4
	rem t1, x10, t2
	beqz t1, leap
	bgez x10, notleap
negative:
	li a0, -1
	beqz zero, exit
leap:
	li a0,1
	beqz zero, exit
notleap:
	li a0,0
	beqz zero, exit
exit:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

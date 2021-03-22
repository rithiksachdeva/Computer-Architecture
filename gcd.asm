# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 2: gcd

.globl gcd

gcd:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	beqz x10, invalid
	beqz x11, invalid
	
	beq x10, x11, equal
	
	blt x10, x11, x10smaller
	blt x11, x10, x11smaller
	
x10smaller:
	li t0, 1
	mv t2, x10
	loop_head1:
		bge t0, t2, loop_end1
		rem t3, x11, t0
		beqz t3, update1
		j noupdate1
	update1:
		mv t4, t0
		addi t0, t0, 1
		j loop_head1
	noupdate1:
		addi t0, t0, 1
		j loop_head1
	loop_end1:
		beqz zero, print
	
x11smaller:

	li t0, 1
	mv t2, x11
	loop_head2:
		bge t0, t2, loop_end2
		rem t3, x10, t0
		beqz t3, update2
		j noupdate2
	update2:
		mv t4, t0
		addi t0, t0, 1
		j loop_head2
	noupdate2:
		addi t0, t0, 1
		j loop_head2
	loop_end2:
		beqz zero, print


print:
	mv a0, t4
	beqz zero, exit
equal: 
	mv a0, a1
	beqz zero, exit	
	
invalid:
	li a0, -1
	beqz zero, exit
exit:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

.globl division

division:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	# dividend in x10 and divisor in x11 --> x10/x11
	
	mv t0 x10 #move dividend to t0
	mv t3 x10 #dividend copy 2 --> x
	mv t1 x11 # move divisor to t1
	mv t4 x11 #divisor copy 2 --> y
	li t2 1 #set quotient to 1
	
double:
	slli t1, t1, 1 #denominator
	slli t2,t2, 1 #quotient
	bge t1, t0, subtract
	j double
subtract:
	sub t1 t1 t4
	addi t2 t2 -1
	bge t3 t1 exit
	j subtract
exit:
	mv x10 t2
	sub x11 t3 t1
	
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

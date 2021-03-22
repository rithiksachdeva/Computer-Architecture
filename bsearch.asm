
.globl bsearch

bsearch:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	#a0 is address of first element of sorted list
	#a1 is key
	#a2 is scratch
	
	addi a0 a0 4 # disregard first element as it has no predecessors
	li t0 1023 #1024 in the list
	li t1 2 #constant
loop:	
	div t0 t0 t1 #find midpoint of current list
	slli t3 t0 2
	add a0 a0 t3
	lw t2 0(a0)
	beqz t0 end
	blt a1 t2 leftside
	bgt a1 t2 rightside
	addi a0 a0 -4
	j end
	
leftside:
	sub a0 a0 t3
	j loop
rightside:
	j loop
	
end:	
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

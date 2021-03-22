.globl atoi

atoi:	

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register)

	mv s0, x10 
	lb t0, 0(s0) 
	li t1, 10
	li t2, 45
	li t3, 43
	li t5, 48
	li t6, 57
	beq t0,t2, negative
	beq t0,t3, positive
	j strtoint

negative: 
	li t0, 1 
	addi s0, s0,1 
	j strtoint

positive: 
	li t0, 0  
	addi s0,s0,1 
	j strtoint

strtoint: 
	li t4, 0 
strtointLoop: 	
	lb s1, 0(s0)
	beqz s1, exit
	blt s1, t5, unknown
	bgt s1, t6, unknown
	addi s1, s1, -48
	mul t4, t4, t1
	add t4, t4, s1
	addi s0, s0, 1
	j strtointLoop

exit: 
	beqz t0, isNumber
	li t6, 1
	bgt t0, t6, isNumber
	neg t4, t4	
	j isNumber

unknown:  
	li x10, -1 
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling 
isNumber: 
	add x10, t4, x0
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling 
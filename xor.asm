.globl max_xor

max_xor:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	mv t4, x10 #t4 is temp register where address of x10 is stored
	li s7 0
  	li t0, 0 #i
  	li t2, 0 #outerloop counter
  	j outerloop
outerloopprep:
	addi t0, t0, 1
	addi s8 s8 -1
	beq s8 t0 exit
	mv t4, x10
	li t2, 0
outerloop:
  	beq t0, t2, loadi # check if outerloop counter and i are equal, then load i
  	addi t4, t4, 4 # increment array address by 4
  	addi t2, t2, 1 # increment outerloop counter by 1
  	j outerloop
loadi:
	lw t3, 0(t4) #load arr[i] into t3
	li t2, 0 #reset outerloop counter to t2
	#mv t4, x10 #reassign t4 with starting address of the array
	addi t1, t0, 1 # set j = i+1
	addi t5, t1, -1 # set innerloop counter = i since thats where array address is at
	j innerloop

innerloopprep:
	addi t1, t1, 1
	mv s8 x11
	beq s8 t1, outerloopprep
innerloop:
	beq t5, t1, innerloopxor
	addi t4, t4, 4
	addi t5, t5, 1
	j innerloop
innerloopxor:
	lw t6, 0(t4)
	xor t6, t6, t3
	bgt t6,s7,update
	j innerloopprep
update:
	mv s7,t6
	j innerloopprep
	
exit:
	mv x10 s7
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

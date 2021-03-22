.globl sort

sort:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	li t0 0
	# save other registers to stack if needed
sortmain:
	addi s2 x11 -1
	beq t0 s2 exit
	li s7 0
	li s8 0
	li s9 0
	li s10 0 
	li s11 0 
	# body of the function, write your code here
	# x10 holds the array, x11 holds the length
	add t0 t0 x0 # t0 is i
	mv t1 x10
	mv s9 x11
	
	
sortActual:
	li t3, 0
findarri:
	beq t0, t3, loadi # check if outerloop counter and i are equal, then load i
  	addi t1, t1, 4 # increment array address by 4
  	addi t3, t3, 1 # increment outerloop counter by 1
  	j findarri
loadi:
	lw s7, 0(t1) #load arr[i] into s7
	mv s8 s7
	li t3, 0 #reset outerloop counter to t3
	addi t4, t0, 1 # set j = i+1
	mv t5, t0 # set innerloop counter = i since thats where array address is at
	j findarrj
findarrjprep:
	addi t4, t4, 1
	beq s9 t4, swap
findarrj:
	beq t5, t4, loadj
	addi t1, t1, 4
	addi t5, t5, 1
	j findarrj
loadj:
	lw s11, 0(t1)
	blt s11 s8 storememory
	j findarrjprep
storememory:
	mv s10 t1
	mv s8 s11
	j findarrjprep
swap:
	beq s10 x0 notlessthan
	sw s7, 0(s10)
	mv t1, x10
	li t3, 0
findarriswap:
	beq t0, t3, loadiswap # check if outerloop counter and i are equal, then load i
  	addi t1, t1, 4 # increment array address by 4
  	addi t3, t3, 1 # increment outerloop counter by 1
  	j findarriswap
loadiswap:
	sw s8, 0(t1)
	neg s3 t0
	slli s3 s3 2
	add t1 t1 s3
	mv x10 t1
	addi t0, t0, 1
	j sortmain
	
notlessthan:
	addi t4 t4 -1
	neg s3 t4
	slli s3 s3 2
	add t1 t1 s3
	mv x10 t1
	addi t0, t0, 1
	j sortmain
	

exit:	
	
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

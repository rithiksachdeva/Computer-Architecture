.globl insert

insert:
	#when I ran this with the example data, it took about 5 minutes - hopefully that's okay!
	addi sp, sp , -4 
	sw ra, 0(sp) 
	
	mv s9, a0
	mv s8, a1
	
	lw t0, 0(a1)
	sw t0, 0(a0) 
	li t0, 0
forloop:
	addi a1, a1, 4
	slli s4 t0 2
	add a0 s9 s4
	addi t0, t0, 1 
	li t5, 1024 
	beq t0 t5 end 
	
	lw t1, 0(a1) 
	mv t2, t0
	addi t2, t2, -1 
	li s1 0
	
whileloop:
	addi a1 a1 -4
	lw t3, 0(a0) 
	addi s1 s1 1
	blt t3 t1, updatekey
	bltz t2, updatekey
	
	addi a0,a0,4
	sw t3, 0(a0)
	addi t2 t2 -1
	addi a0 a0 -8
	j whileloop
	
updatekey:
	addi a0 a0 4
	sw t1, 0(a0)
	slli s1 s1 2
	add a1 a1 s1
	j forloop
	
end:
	mv a0, s9
	mv a1, s8
	li s1 0
	li s4 0
	li s8 0
	li s9 0 
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

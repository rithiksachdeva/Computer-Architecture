# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 4: palin

.globl palin

palin:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	beqz a0, invalid
	mv t0, a0
	li t1, 0xfffffff0
	li t2, 0
hexlenloop:
	beqz t0, evenorodd
	and t0, t0, t1
	addi t2, t2, 1
	slli t1, t1, 4
	j hexlenloop
evenorodd:
	mv a3, t2
	li t5, 1
	li t3, 2
	beq t2, t5, palindrometrue
	beq t2, t3, notpalindrome
	rem t3, t2, t3
	beqz t3, evensplit
	beqz zero, oddsplit
evensplit:
	mv t0, a0
	li t1, 0xffffffff
	li t3, 2
	div t2, t2, t3 #how many bits to shift the mask to get the first half
	li t3, 0
forloop1:
	beq t3, t2, maskcomplete
	slli t1, t1, 4
	addi t3, t3, 1
	j forloop1
maskcomplete:
	and t5, t0, t1 #set t5 to first half
	li t4, 4
	mul t2, t2, t4
	srl t5, t5, t2
	div t2, t2, t4
	
	li t3, 0
	li t1, 0xffffffff
forloop2:
	beq t3, t2, maskcomplete2
	slli t1, t1, 4
	addi t3, t3, 1
	j forloop2
maskcomplete2:
	not t1, t1
	and t4, t0, t1 #set t4 to second half
	mv a1, t4
	mv a2, t5
	
mv t1, a1
li t0, 0
li t5, 1
mv t6, a3
li t4, 2
div t6, t6, t4
addi t6, t6, -1
li t4, 0x0000000f
and t2, t1, t4
slli t2, t2, 4
forloop3:
	slli t4, t4, 4
	and t3, t1, t4
	addi t0, t0, 4
	srl t3, t3, t0
	or t2, t2, t3
	bgeu t5, t6, nowcompare
	addi t5, t5, 1
	bgeu t6, t5, shiftleft
shiftleft:
	slli t2, t2, 4
	beq t5, t5, forloop3
	
oddsplit:
	mv t0, a0
	li t1, 0xffffffff
	li t3, 2
	div t2, t2, t3 #how many bits to shift the mask to get the first half
	addi t2, t2, 1
	li t3, 0
forloop4:
	beq t3, t2, maskcomplete3
	slli t1, t1, 4
	addi t3, t3, 1
	j forloop4
maskcomplete3:
	and t5, t0, t1 #set t5 to first half
	li t4, 4
	mul t2, t2, t4
	srl t5, t5, t2
	div t2, t2, t4
	
	addi t2, t2, -1
	li t3, 0
	li t1, 0xffffffff
forloop5:
	beq t3, t2, maskcomplete4
	slli t1, t1, 4
	addi t3, t3, 1
	j forloop5
maskcomplete4:
	not t1, t1
	and t4, t0, t1 #set t4 to second half
	mv a1, t4
	mv a2, t5
	
mv t1, a1
li t0, 0
li t5, 1
mv t6, a3
li t4, 2
div t6, t6, t4
addi t6, t6, -1
li t4, 0x0000000f
and t2, t1, t4
slli t2, t2, 4
forloop6:
	slli t4, t4, 4
	and t3, t1, t4
	addi t0, t0, 4
	srl t3, t3, t0
	or t2, t2, t3
	bgeu t5, t6, nowcompare
	addi t5, t5, 1
	bgeu t6, t5, shiftleft2
shiftleft2:
	slli t2, t2, 4
	beq t5, t5, forloop6
	
nowcompare:
	beq t2, a2, palindrometrue
	beqz zero, notpalindrome
	
palindrometrue:
	li a0, 1
	beqz zero, exit
notpalindrome:
	li a0, 0
	beqz zero, exit
invalid:
	li a0, -1
	beqz zero, exit
exit:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

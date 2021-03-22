# Declare the listed label(s) as global to enable referencing from other files
# Use the following names for the function
# problem 3: npnum

# THIS FUNCTION IS A LITTLE FINICKY WHEN YOU GET GREATER THAN 100 --> IT TAKES SOME TIME SO PLZ BE PATIENT WITH IT :)

.globl npnum

npnum:

	addi sp, sp , -4 # allocate space for stack frame by adujusting the stack pointer (sp register)
	sw ra, 0(sp) # save the return address (ra register) 
	# save other registers to stack if needed
	
	# body of the function, write your code here
	beqz x10, valuezero
	
	li t1, 1 # i 
	li t2, 1 # j
Loop:
	ble t1, x10, label1 # while i < x10
	beqz zero, print
label1:
	li t3, 2
	li t4, 3
	beq t2, t3, true # does n = 2
	beq t2, t4, true # does n = 3
	rem t5, t2, t3 # does n%2 == 0
	beqz t5, false
	blt t2, t3, false #is n<2
	div t3, t2, t3
	addi t3, t3, 1	
loop_head:
	bge t4, t3, loop_end
	rem t5, t2, t4
	beqz t5 false
	addi t4, t4, 2
	j loop_head
loop_end:
	beqz zero, true
	
true:
	mv a2, t2
	addi t1, t1, 1
	addi t2, t2, 1
	j Loop
false:
	addi t2, t2, 1
	j Loop
print:
	mv a0, a2
	beqz zero, exit
valuezero:
	li a0, -1
	beqz zero, exit
exit:
	# restore registers from stack if needed
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point

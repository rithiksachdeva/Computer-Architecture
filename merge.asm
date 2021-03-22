.globl merge

merge:
	addi sp, sp , -4 
	sw ra, 0(sp) 
	#a0 is output
#a1 is input --> 
#a2 is scratch space --> temp

	mv s9, a0
	mv s8, a1

	li t2 0 #k=0
	li t3 1024 #totalsize(n)=1024
	li t4 0 #size=0
	li s1 0 #l1 = 0
	li s2 0 #h1 = 0
	li s3 0 #l2 = 0
	li s4 0 #h2 = 0

startingforloop:

	addi t4 t4 1 #size+1
	j sizelessthanN
topforlooppart2:
	li s1 0
	li t2 0
	j islowerlimitplussizelessthanN
whileloop1:
	add s5 s1 t4
	addi s5 s5 -1
	mv s2 s5
	addi s5 s2 1
	mv s3 s5
	add s5 s3 t4
	addi s5 s5 -1
	mv s4 s5
	blt s4 t3 whileloop2
	addi s4 t3 -1
	j whileloop2
ifinsidewhileloop2:
	slli s5 s3 2
	add a1 s8 s5
	lw s6 0(a1) #arr[j]
	sub a1 a1 s5

	slli s5 s1 2
	add a1 s8 s5
	lw s7 0(a1) #arr[i]
	sub a1 a1 s5

	bgt s7 s6 outputkplus1equalsinputjplus1x

	slli s5 s1 2
	add a1 s8 s5
	lw s6 0(a1) #arr[i++]
	sub a1 a1 s5
	addi s1 s1 1

	slli s5 t2 2
	add a0 s9 s5
	sw s6 0(a0) #temp[k++]
	sub a0 a0 s5
	addi t2 t2 1
	j whileloop2

outputkplus1equalsinputjplus1x:

	slli s5 s3 2
	add a1 s8 s5
	lw s6 0(a1) #arr[j++]
	sub a1 a1 s5
	addi s3 s3 1

	slli s5 t2 2
	add a0 s9 s5
	sw s6 0(a0) #temp[k++]
	sub a0 a0 s5
	addi t2 t2 1
whileloop2:
	bgt s1 s2 isIlehigherlimit1
	ble s3 s4 ifinsidewhileloop2
	j isIlehigherlimit1
outputkplus1equalsinputiplus1:

	slli s5 s1 2
	add a1 s8 s5
	lw s6 0(a1) #arr[i++]
	sub a1 a1 s5
	addi s1 s1 1


	slli s5 t2 2
	add a0 s9 s5
	sw s6 0(a0) #temp[k++]
	sub a0 a0 s5
	addi t2 t2 1

isIlehigherlimit1:
	ble s1 s2 outputkplus1equalsinputiplus1
jump1:
	j while3
outputkplus1equalsinputjplus1:

	slli s5 s3 2
	add a1 s8 s5
	lw s6 0(a1) #arr[j++]
	sub a1 a1 s5
	addi s3 s3 1


	slli s5 t2 2
	add a0 s9 s5
	sw s6 0(a0) #temp[k++]
	sub a0 a0 s5
	addi t2 t2 1

while3:
	ble s3 s4 outputkplus1equalsinputjplus1
lowerlimit1isequalto1plushigherlimit2:
	mv s1 s4
	addi s1 s1 1

islowerlimitplussizelessthanN:
	add s5 s1 t4
	blt s5 t3 whileloop1
anotherforloop:
	j klessthann
outputkplus1equalsinputi:
	slli s5 s1 2
	add a1 s8 s5
	lw s6 0(a1) #arr[i]
	sub a1 a1 s5


	slli s5 t2 2
	add a0 s9 s5
	sw s6 0(a0) #temp[k++]
	sub a0 a0 s5
	addi t2 t2 1

	addi s1 s1 1
klessthann:
	blt t2 t3 outputkplus1equalsinputi
	li s1 0
	j ilessthann
inputiequalsoutputi:
	slli s5 s1 2
	add a0 s9 s5
	lw s6 0(a0) #temp[i]
	sub a0 a0 s5

	slli s5 s1 2
	add a1 s8 s5
	sw s6 0(a1) #arr[i]
	sub a1 a1 s5

	addi s1 s1 1
ilessthann:
	blt s1 t3 inputiequalsoutputi
	add t4 t4 t4

sizelessthanN:
	blt t4 t3 topforlooppart2

end:
	lw ra, 0(sp) # Restore return address register
	addi sp, sp, 4 # deallocate space for stack frame
	ret # return to calling point



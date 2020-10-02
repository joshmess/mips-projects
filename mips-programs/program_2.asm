# Josh Messitte 
#
#	int  arr[ ]  =  {10,  3,  45,  90,  12};
#	int  i;
#	int  max  =  arr[0];
#	for (i  =  1;   i < arr.length;   i++)
#      if  (arr[i]  >  max)
#         max  =  arr[i];
#
#	System.out.printIn("Largest  in  given  array  is"  +  max);
#
#
# Convert above C code into assembly

.data
result: .asciiz "Largest in given array is "								
array: .word 10, 3, 45, 90, 12	
				
.text
main:   
	la $t1, array	# address of array 			
	lw $t2, 0($t1)	# store max at arr[0]
	li $t3, 0	# counter					
	li $s1, 5	# size				
	j loop						
loop:
	addi $t3, 1
	beq $t3, $s1, print # condition	
	lw $t4, 0($t1)  	# load val from array
	slt $t0, $t2, $t4		# maximum < array[i] ?
	beq $t0, $zero, loop	# no: continue
	add $t2, $t4, 0		
	j loop
	
	
print:
	li $v0, 4		#Print initial string	
	la $a0, result										
	syscall 
	
	li $v0, 1		# print integer
	move $a0, $t2	# move $s2 into $a0
	syscall			# system call
	

final:
	li $v0, 10	#end program
	syscall						
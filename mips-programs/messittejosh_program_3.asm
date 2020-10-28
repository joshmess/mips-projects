# Josh Messitte 
#
#	int  arr[ ]  =  {10,  3,  45,  90,  12, 4, 8, 15, 16, 23, 42, 66, 82, 20, 34, 6, 44, 72, 99, 7};
#	int  search = 23;
#	int  i;
#	for (i = 0;   i < arr.length;   i++)
#      if  (arr[i]  == search)
#         cout << "Index: " << i);
#		  return;
#
#	cout << -1
#
#
# Convert above C code into assembly

.data
result: .asciiz "Index: "					
array: .word 10, 3, 45, 90, 12, 4, 8, 15, 16, 23, 42, 66, 82, 20, 34, 6, 44, 72, 99, 7
				
.text
main:   
	la $t1, array	# address of array 			
	li $t2, 7	# store number to be searched inside t2
	li $t3, 0	# store i inside t3	
	li $s1, 20	# size				
	j loop						
loop:
	beq $t3, $s1, final		# condition	
	lw $t4, 0($t1)  	# load val from array inside t4
	beq $t2, $t4, print	#if search == curr, print and end
	addi $t3, 1		# increment counter
	addi $t1, $t1, 4	# increment array pos
	
	j loop
	
	
print:
	li $v0, 4		#Print initial string	
	la $a0, result										
	syscall 
	
	li $v0, 1		# print integer
	move $a0, $t3		# move $t3 inside $a0
	syscall			# system call
	
	li $v0, 10	#end program
	syscall			

final:
	li $v0, 1		# print -1
	li $a0, -1		# move -1 inside $a0
	syscall			# system call
	
	li $v0, 10	#end program
	syscall						

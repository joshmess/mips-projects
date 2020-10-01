# Josh Messitte 
#
#	int [ ]  A =  {10,  5,  6,  15,  17,  19,  25,  30,  12,  56 };
#	int [ ]  B =  {4,  15,  16,  5,  7,  9,  15,  10,  22,  6 };
#	int [ ]  C =   new  int[10];
#
#	for  (int  i=0;   i<A.length;   i++)
#		C[i]=A[i]  -  B[i];
#
#	System.out.println("Result is "  +   Arrays.toString(C));
#
#
#	MIPS assembly practice. Convert above C code into assembly


.data
result: .asciiz "Result is: "								# Store string
arrayA: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56			# Array1 
arrayB: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6				# Array2 
arrayC: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 					# Array3 

.text

main:   
	la $t1, arrayA  										# $t1 -> arrayA address
	la $t2, arrayB											# $t2 -> arrayB address
	la $t3,	arrayC											# $t3 -> arrayC address
     	
	li $t4, 0												# $t4 -> counter
	li $s1, 10												# $s1 -> size

	j loop													# jump to loop
	
loop:
	beq $t4, $s1, reset										# Check -> send to reset
	
	lw $t5, 0($t1)											# store value from arrayA
	lw $t6, 0($t2)											# store value from arrayB
	
	sub $t7, $t5, $t6										# store difference in $t7

	sw $t7, 0($t3)   										# store differnce in arrayC current spot

	
	addi $t1, $t1, 4										# increment arrayA
	addi $t2, $t2, 4										# increment arrayB
	addi $t3, $t3, 4										# increment arrayC
	addi $t4, $t4, 1										# increment counter
	
	j loop													# jump up
	
reset:
	li $t4, 0												# reset counter		
	la $t3, arrayC											# reset arrayC position
	
	li $v0, 4												# printing out string
	la $a0, result									
	syscall 		
	j print													# jump to print
	
print:

	beq $t4, $s1, final										# check first -> send to final
	
	lw $s2, 0($t3)											# stro current arrayC val to $s2

	li $v0, 1												# print current value
	move $a0, $s2											
	syscall													
	
	li $a0, 32												# print space
	li $v0, 11										
	syscall													

	addi $t3, $t3, 4										# increment arracyC position
	addi $t4, $t4, 1										# increment counter

	j print													# jump up
	
final:
	li $v0, 10
	syscall			#end the program
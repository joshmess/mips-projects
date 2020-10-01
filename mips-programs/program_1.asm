# Josh Messitte 
#
#	int [ ]  A =  {10,  5,  6,  15,  17,  19,  25,  30,  12,  56 };
#	int [ ]  B =  {4,  15,  16,  5,  7,  9,  15,  10,  22,  6 };
#	int [ ]  C =   new  int[10];
#	for  (int  i=0;   i<A.length;   i++)
#		C[i]=A[i]  -  B[i];
#
#	System.out.println("Result is "  +   Arrays.toString(C));
#
#
# Convert above C code into assembly


.data
result: .asciiz "Result is: "								
arrayA: .word 10, 5, 6, 15, 17, 19, 25, 30, 12, 56		
arrayB: .word 4, 15, 16, 5, 7, 9, 15, 10, 22, 6				
arrayC: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 					

.text

main:   
	la $t1, arrayA  			
	la $t2, arrayB				
	la $t3,	arrayC				
     	
	li $t4, 0					
	li $s1, 10					

	j loop						
	
loop:
	beq $t4, $s1, reset			
	
	lw $t5, 0($t1)
	lw $t6, 0($t2)	
	
	sub $t7, $t5, $t6

	sw $t7, 0($t3) 

	
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t3, $t3, 4
	addi $t4, $t4, 1
	
	j loop
	
reset:
	li $t4, 0
	la $t3, arrayC
	
	li $v0, 4			
	la $a0, result									
	syscall 		
	j print					
	
print:

	beq $t4, $s1, final		
	
	lw $s2, 0($t3)				

	li $v0, 1					
	move $a0, $s2											
	syscall													
	
	li $a0, 32					
	li $v0, 11										
	syscall													

	addi $t3, $t3, 4		
	addi $t4, $t4, 1		

	j print						
	
final:
	li $v0, 10
	syscall						
	.data
prompt: .ascii "\n Input N= "
results: .asciiz "\n result is=  "
Bye: .asciiz "\n good!\n"


	.globl main
	.text

main:
	li $v0, 4 		
	la $a0, prompt
	syscall
	li $v0, 5 	
	syscall

	jal fact	

	blez $v0, End

	li $t0, 0	
	add $t0, $t0, $v0
	
	li $v0, 4 	
	la $a0, results
	syscall
	li $v0, 1 		
	move $a0, $t0	
	syscall

	li $v0, 10 	
	syscall 	


	.globl fact
fact:
	addi $sp, $sp, -8	
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	slti $t0, $a0,1	
	beq $t0, $zero, L1	
	addi $v0, $zero, 1	
	addi $sp, $sp, 8	
	jr $ra	
L1:
	addi $a0, $a0, -1	
	jal fact		
	lw $a0, 0($sp)	
	lw $ra, 4($sp)	
	addi $sp, $sp, 8	
	mul $v0, $a0, $v0	
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text


main:
	li $t7, 1	
	li $t2, 1	

	li $v0, 4	
	la $a0, Prompt
	syscall

	li $v0, 5	
	syscall

	move $t0, $v0

	beq $t0, 0, fac
	jal L	

	li $v0, 1		
			
	move $a0,$t2	
	syscall

	li $v0,10	
	syscall

fac:
	li $v0, 1		
	move $a0, $t7
	syscall

L:
	beq $t0, 1, fac	

	mul $t2, $t2, $t0	
	sub $t0, $t0, 1	

	bne $t0, 1, L	
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
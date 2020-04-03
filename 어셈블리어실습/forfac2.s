	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text
main:
	li $v0, 4
	la $a0, Prompt
	syscall
	li $v0, 5	
	syscall
	blez $v0, End
	li $t0, 1		
Loop:
	mul $t0, $t0, $v0	
	addi $v0, $v0, -1	
	bne $v0,0, Loop	
	
	li $v0, 4		
	la $a0, Result	
	syscall

	li $v0, 1		
	move $a0, $t0	
	syscall
	b main		

End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10	
	syscall
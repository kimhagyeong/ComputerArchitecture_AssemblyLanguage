	.data
prompt: .ascii "\n Input N= "
results: .asciiz "\n result is=  "
Bye: .asciiz "\n good!\n"


	.globl main
	.text

main:
	li $v0, 4 		# print prompt string
	la $a0, prompt
	syscall
	li $v0, 5 		# read integer
	syscall

	jal fact		#fact 함수 호출

	blez $v0, End	#v0가 0미만이면 exit

	li $t0, 0		#t0선언
	add $t0, $t0, $v0	#t0에 최종 값인 v0값을 입력 왜냐면 v0는 바뀜
	
	li $v0, 4 		# print prompt string
	la $a0, results
	syscall
	li $v0, 1 		# print integer
	move $a0, $t0	# 최종값 출력
	syscall

	li $v0, 10 	
	syscall 	


	.globl fact
fact:
	addi $sp, $sp, -8		#초기 stack 주소 할당
	sw $ra, 4($sp)		#$ra 반환 주소 할당
	sw $a0, 0($sp)		#$a0 주소 할당
	slti $t0, $a0,1		#입력값이 1보다 작으면 (t0에 입력하는 이유는 a0의 값이 변환되면 안되기 때문)
	beq $t0, $zero, L1	#factDone으로 이동
	addi $v0, $zero, 1		#결과값은 1로 입력되고
	addi $sp, $sp, 8		#stack 주소를 반환(앞당긴다고 할 수 있음)
	jr $ra			#return
L1:
	addi $a0, $a0, -1		#a0--
	jal fact			#recursive call
	lw $a0, 0($sp)		#현재 n 값을 저장하고(감소된 값 = a0)
	lw $ra, 4($sp)		#주소를 반환하여 이동
	addi $sp, $sp, 8	
	mul $v0, $a0, $v0		#v0=a0*v0
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
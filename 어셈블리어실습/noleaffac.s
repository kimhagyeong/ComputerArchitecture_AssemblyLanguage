	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text

#t0 : 감소하는 값, $t1 : temp, $t2: 최종 값, $7:1(입력값이 0이나 1일때)

main:
	li $t7, 1		#$t7 초기화
	li $t2, 1		#$t2 초기화

	li $v0, 4		#초기 출력
	la $a0, Prompt
	syscall

	li $v0, 5		#입력값 받을 때
	syscall

	move $t0, $v0	#$v0 입력값이 회손되지 않도록 t0에 저장

	beq $t0, 0, fac	#입력값이 0일때 초기 fac 함수로 이동
	jal L		#아니면 L로 이동

	li $v0, 1		#최종 값 출력. 여기서 forfact했을 때 처럼 
			#result string을 출력시키고 싶었는데 잘 되지 않아 없앴다. 이유를 모르겠다.
	move $a0,$t2	#결과 출력. t2에 저장되어있음
	syscall

	li $v0,10		#exit
	syscall

fac:
	li $v0, 1		#int print
	move $a0, $t7	#입력값이 1인경우를 출력하기 위해 t7에 입력되어있는 1을 a0에 입력
	syscall

L:
	beq $t0, 1, fac	#t0가 1이 되면 fac로 이동

	mul $t2, $t2, $t0	#아니면 t2=t2*t0
	sub $t0, $t0, 1	#t0--

	bne $t0, 1, L	#t0가 1이 될 때까지 L을 반복
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text
main:
	li $v0, 4		#print_string
	la $a0, Prompt	#prompt의 .asciiz 스트링 내용 출력
	syscall
	li $v0, 5		#read_int
	syscall
	blez $v0, End	#입력값이 0보다 작으면 exit
	li $t0, 1		#$t0 초기화 1로 해줘야 0이 안됨
Loop:
	mul $t0, $t0, $v0	#t0 = t0 * v0
	addi $v0, $v0, -1	#v0--
	bne $v0,0, Loop	#if v0 != 0 이면 for 문
	
	li $v0, 4		#print_string
	la $a0, Result	#Result의 .asciiz 스트링 내용 출력
	syscall

	li $v0, 1		#print_int
	move $a0, $t0	#최종값 출력
	syscall
	b main		#main으로 이동

End: li $v0, 4		#print_string
	la $a0, Bye	#Bye의 .asciiz 스트링 내용 출력
	syscall
	li $v0, 10		#exit
	syscall
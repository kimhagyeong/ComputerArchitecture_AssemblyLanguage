	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text
main:
	li $v0, 4		#print_string
	la $a0, Prompt	#prompt�� .asciiz ��Ʈ�� ���� ���
	syscall
	li $v0, 5		#read_int
	syscall
	blez $v0, End	#�Է°��� 0���� ������ exit
	li $t0, 1		#$t0 �ʱ�ȭ 1�� ����� 0�� �ȵ�
Loop:
	mul $t0, $t0, $v0	#t0 = t0 * v0
	addi $v0, $v0, -1	#v0--
	bne $v0,0, Loop	#if v0 != 0 �̸� for ��
	
	li $v0, 4		#print_string
	la $a0, Result	#Result�� .asciiz ��Ʈ�� ���� ���
	syscall

	li $v0, 1		#print_int
	move $a0, $t0	#������ ���
	syscall
	b main		#main���� �̵�

End: li $v0, 4		#print_string
	la $a0, Bye	#Bye�� .asciiz ��Ʈ�� ���� ���
	syscall
	li $v0, 10		#exit
	syscall
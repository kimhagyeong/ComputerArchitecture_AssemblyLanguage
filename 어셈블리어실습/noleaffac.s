	.data
Prompt: .asciiz "\n Input N= "
Result: .asciiz "result is = "
Bye: .asciiz "\n good!\n"
	.globl main
	.text

#t0 : �����ϴ� ��, $t1 : temp, $t2: ���� ��, $7:1(�Է°��� 0�̳� 1�϶�)

main:
	li $t7, 1		#$t7 �ʱ�ȭ
	li $t2, 1		#$t2 �ʱ�ȭ

	li $v0, 4		#�ʱ� ���
	la $a0, Prompt
	syscall

	li $v0, 5		#�Է°� ���� ��
	syscall

	move $t0, $v0	#$v0 �Է°��� ȸ�յ��� �ʵ��� t0�� ����

	beq $t0, 0, fac	#�Է°��� 0�϶� �ʱ� fac �Լ��� �̵�
	jal L		#�ƴϸ� L�� �̵�

	li $v0, 1		#���� �� ���. ���⼭ forfact���� �� ó�� 
			#result string�� ��½�Ű�� �;��µ� �� ���� �ʾ� ���ݴ�. ������ �𸣰ڴ�.
	move $a0,$t2	#��� ���. t2�� ����Ǿ�����
	syscall

	li $v0,10		#exit
	syscall

fac:
	li $v0, 1		#int print
	move $a0, $t7	#�Է°��� 1�ΰ�츦 ����ϱ� ���� t7�� �ԷµǾ��ִ� 1�� a0�� �Է�
	syscall

L:
	beq $t0, 1, fac	#t0�� 1�� �Ǹ� fac�� �̵�

	mul $t2, $t2, $t0	#�ƴϸ� t2=t2*t0
	sub $t0, $t0, 1	#t0--

	bne $t0, 1, L	#t0�� 1�� �� ������ L�� �ݺ�
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
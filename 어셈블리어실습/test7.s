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

	jal fact		#fact �Լ� ȣ��

	blez $v0, End	#v0�� 0�̸��̸� exit

	li $t0, 0		#t0����
	add $t0, $t0, $v0	#t0�� ���� ���� v0���� �Է� �ֳĸ� v0�� �ٲ�
	
	li $v0, 4 		# print prompt string
	la $a0, results
	syscall
	li $v0, 1 		# print integer
	move $a0, $t0	# ������ ���
	syscall

	li $v0, 10 	
	syscall 	


	.globl fact
fact:
	addi $sp, $sp, -8		#�ʱ� stack �ּ� �Ҵ�
	sw $ra, 4($sp)		#$ra ��ȯ �ּ� �Ҵ�
	sw $a0, 0($sp)		#$a0 �ּ� �Ҵ�
	slti $t0, $a0,1		#�Է°��� 1���� ������ (t0�� �Է��ϴ� ������ a0�� ���� ��ȯ�Ǹ� �ȵǱ� ����)
	beq $t0, $zero, L1	#factDone���� �̵�
	addi $v0, $zero, 1		#������� 1�� �Էµǰ�
	addi $sp, $sp, 8		#stack �ּҸ� ��ȯ(�մ��ٰ� �� �� ����)
	jr $ra			#return
L1:
	addi $a0, $a0, -1		#a0--
	jal fact			#recursive call
	lw $a0, 0($sp)		#���� n ���� �����ϰ�(���ҵ� �� = a0)
	lw $ra, 4($sp)		#�ּҸ� ��ȯ�Ͽ� �̵�
	addi $sp, $sp, 8	
	mul $v0, $a0, $v0		#v0=a0*v0
	jr $ra
End: li $v0, 4
	la $a0, Bye
	syscall
	li $v0, 10
	syscall
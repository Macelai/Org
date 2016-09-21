.data
_save: .word 9999,9,6,6,6,6,6,6,6,6,6
_k: .word 6
_error: .asciiz "Index Out of Bound Exception"
.text
.globl main
main: # inicialização
 add $s3, $zero, $zero
 la $s6, _save
 lw $s5, _k
 lw $t2, 4($s6)   
Loop: # corpo do laço
 sltu $t5, $s3, $t2 
 beq $t5, $zero, IndexOutOfBounds 
 sll $t1,$s3,2
 add $t1, $t1, $s6
 lw $t0, 8($t1)
 bne $t0, $s5, Exit
 addi $s3, $s3, 1
 j Loop
Exit:
 # rotina para imprimir inteiro no console
 addi $v0,$zero, 1
 add $a0,$zero, $s3
 syscall
 j End
IndexOutOfBounds:
addi $v0,$zero, 4
la $a0,_error
syscall
End:
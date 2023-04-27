.macro printStringLabel(%string)
	li $v0, 4
	la $a0, %string
	syscall

.end_macro

.macro printString(%string)
	li $v0, 4
	.data
	word: .asciiz %string
	.text
	la $a0, word
	syscall
.end_macro

.macro usrInputString() #this needs to ask for userInput
	li $v0, 8
	la $a0, wordBuffer
	li $a1, 50
	syscall
	
	lb $s0, wordBuffer
.end_macro

.macro usrInputInteger()
	li $v0, 5
	syscall
	move $s0, $v0
.end_macro

.macro exit
	printString("Program will now exit...")
	li $v0, 10
	syscall

.end_macro
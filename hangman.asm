#hangman

#Create a prompt that will ask for 1st player or second player
#I need to provide error handling for wrong input

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

.data
welcome: .asciiz "----------Welcome to Hangman!----------\n"
howManyPlayers: .asciiz "Press 1 for single player\nPress 2 for 2-player\nPress 3 to exit\n"

wordBuffer: .space 51

.text
main:
	printStringLabel(welcome)
	printStringLabel(howManyPlayers)
	usrInputInteger
	
checkInput:
	beq $s0, 1, singlePlayer
	beq $s0, 2, twoPlayer
	beq $s0, 3, EXIT #how do i make this so that the comparison is a char?
	
	j invalidInput
	
invalidInput:
	printString("Invalid input, please enter 1 for single player\n2 for 2-player\n3 to exit program\n")
	usrInputInteger
	
	j checkInput
	
singlePlayer:
	printString("Single player starts here\n")
	
	#add the logic for single player
	
	j main




twoPlayer:
	printString("Two player starts here\n")
	
	#add the logic for two player
	
	j main

EXIT:
	exit

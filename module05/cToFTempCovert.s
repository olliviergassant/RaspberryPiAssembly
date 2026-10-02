#
# Prgram Name: cToFtempConvert.s
# Author: Ollivier Gassant
# Date: 10/2/2026 
# Purpose: Convert celsius to fahrenheit 
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4 //make space on the stack
  STR lr, [sp, #0] //store sp at offset #0 into the link register for later

  # Concept 1: Print the prompt to the terminal screen 
  LDR r0, =prompt //load into register0 the data to prompt
  BL printf //branh and link to the print f method

  # Concept 2: Taking in the user input and storing it 
  LDR r0, =format //load the address into register 0
  LDR r1, =userinput //load the address register 1
  BL scanf

  #Concept 3: converting celsius to fahrenheit using other registers multiplication
  LDR r1, =userinput
  MOV r1, [r1] //move into r2 the value stored in r1
  MUL r1, r1, #9 //store into r1 the vlaue in r1 multiplied by the immediate #9

  #Concept 4: division
  MOV r0, r1 //move the value stored in r1 into r0
  LDR r1, #5 //give r1 the immediate value of 5
  BL __aeabi_idiv //branch and link to the division poeration that will be stored into r0

  #Concpet 4: Adding 32 back to the quotient
  ADD r0, #32 // add the immediate value of 32 into the quotient
  
  #Concept 5: printing final value
  MOV r1, r0 // move value of r0 into r1
  LDR r0, =output //load the output data into r0
  BL printf
  

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "What is your temprature in Celsius: "
  output: .asciz "Temprature coverted to Fahrenheit: %d"
  format: .asciz "%d"
  userinput: .word 0

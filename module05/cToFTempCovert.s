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
  LDR r1, =userinput //load into register 1
  BL scanf

  #Concept 3: converting celsius to fahrenheit using other registers
  MOV r2, r1 //move into r2 the value stored in r1

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "What is your temprature in Celsius: "
  output: .asciz "Temprature coverted to Fahrenheit: %d"
  format: .asciz "%d"
  userinput: .word 0

#
# Prgram Name: multiByTen.s
# Author: Ollivier Gassant
# Date: 10/3/26
# Purpose: Read an integer and multiply it by 10 using only left logical shifts and addition, then print the result.
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: Print the promt to the terminal
  LDR r0, =prompt //load the prompt into r0
  BL printf //branch and link to the print function

  # Comcept 2: Take the input of the integer
  LDR r0, =format //load the format data to r0
  LDR r1, =number //load the number data to r1
  BL scanf //branch and link to the scanf function

  # Concept 3: Multiply by 10 using left hand shifts
  LDR r1, =number //load the number data to r1
  LDR r1, [r1] //load into r1 the value of the number 
 
  # Concept 4: Print the final result to the terminal 
  LSL r2, r1, #3 //load into r2 the user input by 8
  LSL r3, r1, #1 //load into r3 the user input by 2
  ADD r2, r2, r3 //load into r2 the value of r2 + r3 

  # Concept 5: Print to the terminal
  LDR r0, =output //print the final answer
  BL printf

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "enter your number: "
  output: .asciz "%d times ten  is %d\n"
  format: .asciz "%d"
  number: .word 0

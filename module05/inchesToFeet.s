#
# Prgram Name: inchesToFeet.s
# Author: Ollivier Gassant
# Date: 10/2/26
# Purpose: Convert the user input from inches into feet
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: printing to the terminal
  LDR r0, =prompt //load prompt into r0
  BL printf

  # Concept 2: getting user input
  LDR r0, =format //load forht format for the data
  LDR r0, =inches //load into r0 the inches 
  BL scanf //branch and link to scan user input
  STR r0, r12 //store the user input from register to memory

  # Concept 3: Converting inchest to feet
  LDR r0, r12
  LDR r0, [r0]
  MOV r1, #12
  BL __aeabi_idiv //branch and link division 

  # Concept 4: Printing conversion
  LDR r0, r2 //value of the quotient
  LDR r1, r12 //the original user input
  LDR r0, =output
  BL printf

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "Write you value in inches to convert to feet: "
  output: .asciz "%d inches converted to feet is %d \n"
  format: .asciz "%d"
  inches: .word 0

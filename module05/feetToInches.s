#
# Prgram Name: feetToInches.s
# Author: Ollivier Gassant
# Date: 10/2/26
# Purpose: convert feet to inche
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
  LDR r1, =feet //load into r0 the feet 
  BL scanf //branch and link to scan user input

  # Concept 3: convering feet to inches
  LDR r0, =feet
  LDR r0, [r0]
  MOV r1, #12
  MUL r2, r0, r1

  # Concept 4: printing conversion
  LDR r1, =feet
  LDR r1, [r1]
  LDR r0, =output
  BL printf

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "Write you value in feet to convert to inches: "
  output: .asciz "%d feet converted to inches is %d \n"
  format: .asciz "%d"
  feet: .word 0

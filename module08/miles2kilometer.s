#
# Prgram Name: milestokilometer.s
# Author: Ollivier Gassant
# Date: 10/25/26
# Purpose: Convert by computing (miles X 161) / 100
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Ask for the user for the MPH
  LDR r0, =prompt //load into R0 the address from the prompt
  BL printf //branch and link to print prompt
  
  # Scan and store the user input  
  LDR r0, =format //load into r0 the address for the format data
  LDR r1, =userinput
  BL scanf

  # Multiply the user MPH by 161
  LDR r1, =userinput //load into r1 the address to the user input
  LDR r1, [r1] //load into r1 the value at the address
  MOV r2, #161 //load the immediate value of 161 into r2
  MUL r1, r1, r2 //store into r1 the product of r1 and r2

  # Divide the previous value by 100
  MOV r0, r1 //store the product of r1 into r0
  MOV r1, #100 //store the immediate value of 100 into r1
  BL __aeabi_idiv //brnach and link to divide and store into r0 

  # Print the final value
  MOV r1, r0
  LDR r0, =output
  BL printf

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "Enter you speed in MPH -> "
  output: .asciz "Your speed in KPH ->%d\n"
  format: .asciz "%d"
  userinput: .word 0

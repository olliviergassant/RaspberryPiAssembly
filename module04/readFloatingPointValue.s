#
# Prgram Name: readingFloatingPointValue.s
# Author: Ollivier Gassant
# Date
# Purpose: Program to read the floating point value imput by the user and print
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: printing out the line
  LDR r0, =prompt1
  BL printf  

  # Concept 2: scan for the floating input
  LDR r0, =format1 //"%f"
  LDR r1, =number  //store the number value into r1
  BL scanf //branch and link to the scanf function

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "Enter the number you want scanned -> "
  output1: .asciz "Here is the scanned number -> %f "
  format1: .asciz "%f"
  number:  .space 40
 

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
  SUB sp, sp, #8
  STR lr, [sp, #0] 

  # Concept 1: printing out the line
  LDR r0, =prompt1 //load the register for prompt1
  BL printf //branch and link to the printf function

  # Concept 2: scan for the floating input
  LDR r0, =input1 //load the register for "%f"
  LDR r1, =number  //store the address into r1
  BL scanf //branch and link to the scanf function

  # Concept 3: Print out the output to the screen
  LDR r0, =output1
  LDR r1, =number //getting the addrress into r1
  LDR r2, [r1,#0] //loading in the value of number into r2
  LDR r3, [r1,#4] //loading in the value of number into r3
  BL printf

  # Return to the OS
  LDR lr, [sp, #0] // return to the location in memory
  ADD sp, sp, #8 //add back the bytes takes
  MOV pc, lr //return the PC to the link register

.data
  prompt1: .asciz "Enter the number you want scanned -> "
  output1: .asciz "Here is the scanned number -> %lf\n "
  input1: .asciz "%lf"
  .balign 8
  number:  .double  0
 

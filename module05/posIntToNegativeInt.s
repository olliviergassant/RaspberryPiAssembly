#
# Prgram Name: posIntToNegativeInt.s
# Author: Ollivier Gassant
# Date: 10/3/2026
# Purpose: A program that reads an integer and outputs its negative using two's complement.
# 
#

.text
.global main

main:

  # Concept 1: Read the number the user typed and store it
  LDR r0, =format // load format into r1
  LDR r1, =number // load format into r2
  BL scanf // branch and link to scanf
 
  # Concept 2: Put the number into r1
  LDR r1, =number // load number into r1
  LDR r1, [r1, #0]  // load into r1 the value
 
  # Concept 3: get the one's complement (flip all the bits)
  MVN r2, r1  // move into r2 the address from r1
 
  # Cencept 4: add 1 to get the two's complement (this is the negative)
  ADD r2, r2, #1 // move into r2 r2 + 1
 
  # Concept 5: Print the answer
  LDR r0, =output // load into r1 the output
  BL printf //branch and link to print
 
  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr
 
.data
  prompt: .asciz "Enter an integer: " 
  format: .asciz "%d"
  output: .asciz "The negative of %d is %d\n"
  number: .word 0
  

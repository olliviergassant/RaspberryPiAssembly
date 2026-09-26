#
# Prgram Name: promptUserAge.s
# Author: Ollivier Gassant
# Date: 9/22/26
# Purpose: To prompt user for age and print 
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: printing the prompt to the screeen
  LDR r0, =prompt1 //get the prompt1 data to be used  
  BL printf //branch and link to the printf method

  # Concept 2: Take the input of the number
  LDR r0, =format1 //get the format1 information to be used 
  LDR r1, =age1 //get the format1 information to be used
  BL scanf //branch and link to the scanf method

  # Concept 3: Print out the output to the screen
  LDR r0, =output1 //get the output1 string in the data seciton
  LDR r1, =age1 //data to be placed within the %s of the output
  BL printf //branch and link to the printf method

  # Return to the OS
  LDR lr, [sp, #0] // return to the location in memory
  ADD sp, sp, #4 //add back the bytes takes
  MOV pc, lr //return the PC to the link register

.data
  prompt1: .asciz "Please enter your age ->"  // add the data for the user age
  output1: .asciz "You age is %s\n" // add the data for the string with formatiing
  format1: .asciz "%s"
  age1:   .space 40

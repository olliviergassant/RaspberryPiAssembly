#
# Prgram Name: quotedStringPrompts.s
# Author: Ollivier Gassant
# Date
# Purpose: Write a program that prints a quoted string (e.g., This is my output "Hello world"). 
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: print the prompt to the screen
  LDR r0, =prompt1 //get prompt1 from data
  BL printf //branch and link to the printf method

  # Concept 2: The the input of the string
  LDR r0, =format1 //get the format1 from data
  LDR r1, =string1 //get string1 from data to registry
  BL scanf //branch and link to hthe method

  # Concept 3: Print out the output to the screen
  LDR r0, =output1 //get output1 from the the data
  LDR r1, =string1 //get string1 from the data
  BL printf //branch and link to the printf 

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt1: .asciz "What is the string you want shown? "
  output1: .asciz "This is your output '%s'\n"
  format1: .asciz "%39[^\n]"
  string1: .space 40  

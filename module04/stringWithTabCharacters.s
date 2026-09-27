#
# Prgram Name: stringWithTabCharacters.s
# Author: Ollivier Gassant
# Date
# Purpose: Program that prints a string with tab characters between a number and the surrounding text. 
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: printing the prompt to the screen
  LDR r0, =prompt1 //showing the prompt on screen
  BL printf //branch and link to printf method

  # concept 2: scanning the user input
  ldr r0, =format1 //
  ldr r1, =number1 //
  bl scanf //branch and link to scanf method

  # concept 3: printing the user intput to a formatted string 
  ldr r0, =output1 //printing the output to the terminal
  ldr r1, =number1
  bl printf //branch and link to printf method

  # return to the os
  ldr lr, [sp, #0]
  add sp, sp, #4
  mov pc, lr

.data
  prompt1: .asciz "enter your number -> " //scan for user data
  output1: .asciz "is this your number? \t%s\t i think it is\n!" //formatting for string
  format1: .asciz "%s"
  number1: .space 40

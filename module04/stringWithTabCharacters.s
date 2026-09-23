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

  # Enter your program here.

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

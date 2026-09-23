#
# Prgram Name: stringWithTabCharacters.s
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

  # Enter your program here.

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

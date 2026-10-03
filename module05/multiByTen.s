#
# Prgram Name: multiByTen.s
# Author: Ollivier Gassant
# Date: 10/3/26
# Purpose: Read an integer and multiply it by 10 using only left logical shifts and addition, then print the result.
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: Print the promt to the terminal

  # Comcept 2: Take the input of the integer

  # Concept 3: Multiply by 10 using left hand shifts

  # Concept 4: Print the final result to the terminal 

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

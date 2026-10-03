#
# Prgram Name: registerSwap.s
# Author: Ollivier Gassant
# Date: 10/3/2026
# Purpose: swaps two registers without using a temporary register, using only EOR (XOR) instructions.
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

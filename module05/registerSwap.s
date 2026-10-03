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
  
  # Concept 1: using XOR to swap registers
  EOR R1, R1, R2   // r1 = r1 XOR r2
  EOR R2, R1, R2   // r2 = r1 XOR r2 so r2 now holds the original r1)
  EOR R1, R1, R2   // r1 = r1 XOR r2  so r1 now holds the original r2)

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

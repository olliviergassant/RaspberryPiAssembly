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
  EOR R1, R1, R2   ; Step 1: R1 = R1 XOR R2
  EOR R2, R1, R2   ; Step 2: R2 = R1 XOR R2  //(R2 now holds the original R1)
  EOR R1, R1, R2   ; Step 3: R1 = R1 XOR R2  //(R1 now holds the original R2)

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data

# Prgram Name: program1.s
# Author: Ollivier Gassant
# Purpose: Recursive multiplication

# Define the global function
.global main

.text

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Take user input for multiplier

  # Store user input for multiplier into a different register

  # Take user input for number of additions

  # Store user input for number of additions into a different register

  # Compare number of add to 1. If they are equal we Branch to the if statement that prints the multiplier

  # If statement that prints m

  # Else statement if number of add doesn't equal 1. Where we call function again

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  promptUserForM: .asciz "Enter the number for your multiplier (M): " 
  inputForM: .asciz "%d"
  numberM: .word 0

  promptUserForN: .asciz "Enter the number for your number of additions (N): "
  inputForN: .asciz "%d"
  numberN: .word 0
#END of main

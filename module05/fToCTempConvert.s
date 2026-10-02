#
# Prgram Name: fRoCTempCovert.s
# Author: Ollivier Gassant
# Date: 10/2/26
# Purpose: convert fahrenheit to celsius
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Concept 1: Print the prompt to the terminal screen
  LDR r0, =prompt //load into r0 the address to the promp
  BL printf

  # Concept 2: Taking in the user input and storing it
  LDR r0, =format //load the format from datat into r0
  LDR r1, =userinput //store the value into r1
  BL scanf //branch to the scan function

  # Concept 3: Converting subtraction
  LDR r0, =userinput //load address into r0 from r1
  LDR r0, [r0] //mov the value into r0 from address
  SUB r0, r0, #32 //store into r0 user input - 32

  # Concept 4: Converting multiplication
  MOV r2, #5
  MUL r0, r0, r2 //strore into r0 product of r0 and 5

  # Concept 5: Conversion disivison ny 9
  MOV r1, #9
  BL __aeabi_idiv //branch and link to the division poeration that will be stored into r0

 # Concept 6: printing final value
  LDR r1, r0 //load value of r0 into r1
  LDR r0, =output //load output to r0
  BL printf //branch and link to printf function

 # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  prompt: .asciz "What is your temprature in Fahrenheit: "
  output: .asciz "Temprature coverted to celsius: %d"
  format: .asciz "%d"
  userinput: .word 0

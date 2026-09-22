#
# Prgram Name: template.s
# Author: Ollivier Gassant
# Date: 9/22/26
# Purpose: To prompt user for age and print 
# 
#

.text
.global main

main:
  # Save return to OS on stack
  SUB sp, sp, #4
  STR lr, [sp, #0] 

  # Enter your program here.
  // enter the user name string here
  // enter the value of the age here
  // print funtion to be used  

  # Return to the OS
  LDR lr, [sp, #0]
  ADD sp, sp, #4
  MOV pc, lr

.data
  // add the data for the user name
  // add the data for the string with formatiing

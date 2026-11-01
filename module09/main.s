#:
# Program Name: main.s
# Author: Ollivier Gassant
# Date: 11/1/26
# Purpose: Main assembly file
#  


.global main
.text

main:

   SUB sp, sp, #8
   STR lr, [sp, #0]

 # Function 1: ChkAlphaLOG
   LDR r0, =prompt1
   BL printf

   LDR r0, =charFormat
   LDR r1, =inchar
   BL scanf

   LDR r0, =inchar
   LDRB r0, [r0]
   BL ChkAlphaLOG

   LDR r1, =noMsg
   CMP r0, #1
   BNE print1
   LDR r1, =yesMsg
   
   print1:
    MOV r0, r1
    BL printf

# Function 2: ChkAlphaNOLOG
   LDR r0, =prompt2
   BL printf

   LDR r0, =charFormat
   LDR r1, =inchar
   BL scanf

   LDR r0, =inchar
   LDRB r0, [r0]
   BL ChkAlphaNOLOG

   LDR r1, =noMsg
   CMP r0, #1
   BNE print2
   LDR r1, =yesMsg
  
   print2:
    MOV r0, r1
    BL printf

#Function 3:  findMAXOf3 
   LDR r0, =prompt3
   BL printf

   LDR r0, =threeIntFormat
   LDR r1, =val1
   LDR r2, =val2
   LDR r3, =val3
   BL scanf

   LDR r0, =val1
   LDR r0, [r0]
   LDR r1, =val2
   LDR r1, [r1]
   LDR r2, =val3
   LDR r2, [r2]
   BL findMAXOf3

   MOV r1, r0
   LDR r0, =maxMsg
   BL printf

#Grade
   LDR r0, =prompt4
   BL printf

   LDR r0, =nameFormat
   LDR r1, =studentName
   BL scanf

   LDR r0, =prompt5
   BL printf

   LDR r0, =intFormat
   LDR r1, =score
   BL scanf

   LDR r0, =score
   LDR r0, [r0]
   BL Grade

   CMP r0, #-1
   BEQ gradeError

   MOV r2, r0
   LDR r1, =studentName
   LDR r0, =gradeMsg
   BL printf
   B endMain

  gradeError:
   LDR r0, =errorMsg
   BL printf

  endMain:
   LDR lr, [sp, #0]
   ADD sp, sp, #8
   MOV r0, #0
   MOV pc, lr

.data
   prompt1: .asciz "Enter a character (ChkAlphaLOG): "
   prompt2: .asciz "Enter a character (ChkAlphaNOLOG): "
   prompt3: .asciz "Enter three integers separated by spaces: "
   prompt4: .asciz "Enter the student name: "
   prompt5: .asciz "Enter the student score (0-100): "

   yesMsg: .asciz "Y\n"
   noMsg: .asciz "N\n"
   maxMsg: .asciz "Maximum value: %d\n"
   gradeMsg: .asciz "Student Name: %s\nGrade: %c\n"
   errorMsg: .asciz "Error: score must be between 0 and 100\n"

   charFormat: .asciz " %c"
   intFormat: .asciz "%d"
   threeIntFormat: .asciz "%d %d %d"
   nameFormat: .asciz " %99[^\n]"

   .align 2
   inchar: .word 0
   val1: .word 0
   val2: .word 0
   val3: .word 0
   score: .word 0
   studentName: .space 100

#END main

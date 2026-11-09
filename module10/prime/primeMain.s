@ primeMain.s - Problem 1: print all primes from 3 to n
@ r4 = current number, r5 = n

.global main

.text

main:
 SUB sp, sp, #16
 STR lr, [sp, #0]
 STR r4, [sp, #4]
 STR r5, [sp, #8]

 LDR r0, =prompt
 BL printf
 LDR r0, =inFormat
 LDR r1, =userInput
 BL scanf
 LDR r5, =userInput
 LDR r5, [r5]            @ r5 = n

 CMP r5, #3
 BLT badInput            @ n < 3 -> error

 MOV r4, #3              @ outer loop: 3 .. n
outerLoop:
 CMP r4, r5
 BGT printNewline

 MOV r0, r4
 BL isPrime
 CMP r0, #1
 LDREQ r0, =outFormat
 MOVEQ r1, r4
 BLEQ printf             @ print prime

 ADD r4, r4, #1
 B outerLoop

printNewline:
 LDR r0, =newline
 BL printf
 B done

badInput:
 LDR r0, =errorMsg
 BL printf

done:
 MOV r0, #0
 LDR lr, [sp, #0]
 LDR r4, [sp, #4]
 LDR r5, [sp, #8]
 ADD sp, sp, #16
 MOV pc, lr

.data
 prompt:    .asciz "Enter n: "
 inFormat:  .asciz "%d"
 outFormat: .asciz "%d "
 newline:   .asciz "\n"
 errorMsg:  .asciz "Error: n must be 3 or more\n"
 .align 2
 userInput: .word 0

#END main

.section .note.GNU-stack,"",%progbits

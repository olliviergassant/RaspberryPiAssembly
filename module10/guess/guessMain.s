@ guessMain.s - Problem 3: user guesses the computer's number
@ r4 = max, r5 = secret number, r6 = number of guesses

.global main

.text

main:
 SUB sp, sp, #16
 STR lr, [sp, #0]
 STR r4, [sp, #4]
 STR r5, [sp, #8]
 STR r6, [sp, #12]

 MOV r0, #0              @ srand(time(0))
 BL time
 BL srand

 LDR r0, =maxPrompt
 BL printf
 LDR r0, =inFormat
 LDR r1, =userInput
 BL scanf
 LDR r4, =userInput
 LDR r4, [r4]            @ r4 = max

 CMP r4, #1
 BLT badInput            @ max < 1 -> error

 MOV r0, r4
 BL randomNumber
 MOV r5, r0              @ r5 = secret
 MOV r6, #0              @ r6 = guesses

guessLoop:
 LDR r0, =guessPrompt
 BL printf
 LDR r0, =inFormat
 LDR r1, =userInput
 BL scanf
 CMP r0, #1              @ stop if input is not a number
 BNE badInput

 ADD r6, r6, #1          @ guesses++
 LDR r0, =userInput
 LDR r0, [r0]            @ r0 = guess
 CMP r0, r5
 BEQ correct
 LDRGT r0, =tooHigh
 LDRLT r0, =tooLow
 BL printf
 B guessLoop

correct:
 LDR r0, =correctMsg
 MOV r1, r6
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
 LDR r6, [sp, #12]
 ADD sp, sp, #16
 MOV pc, lr

.data
 maxPrompt:   .asciz "Enter the maximum value: "
 guessPrompt: .asciz "Enter your guess: "
 inFormat:    .asciz "%d"
 tooHigh:     .asciz "Too high\n"
 tooLow:      .asciz "Too low\n"
 correctMsg:  .asciz "Correct! Total number of guesses: %d\n"
 errorMsg:    .asciz "Error: invalid input\n"
 .align 2
 userInput:   .word 0

#END main

.section .note.GNU-stack,"",%progbits

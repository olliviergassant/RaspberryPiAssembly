@ libFunctions.s - functions for Problem 3 (User Guesses the Number)
@   remainder:    r0 = r0 rem r1   (no MOD/REM instruction)
@   randomNumber: r0 = random number from 1 to r0

.global remainder
.global randomNumber

.text

@ remainder = dividend - (dividend / divisor) * divisor
@ In: r0 = dividend, r1 = divisor   Out: r0 = remainder
remainder:
 SUB sp, sp, #16
 STR lr, [sp, #0]
 STR r4, [sp, #4]
 STR r5, [sp, #8]

 MOV r4, r0              @ r4 = dividend
 MOV r5, r1              @ r5 = divisor
 BL __aeabi_idiv         @ r0 = quotient
 MUL r1, r0, r5          @ r1 = quotient * divisor
 SUB r0, r4, r1          @ r0 = remainder

 LDR lr, [sp, #0]
 LDR r4, [sp, #4]
 LDR r5, [sp, #8]
 ADD sp, sp, #16
 MOV pc, lr

#END remainder

@ (rand() rem max) + 1
@ In: r0 = max   Out: r0 = number from 1 to max
randomNumber:
 SUB sp, sp, #8
 STR lr, [sp, #0]
 STR r4, [sp, #4]

 MOV r4, r0              @ r4 = max
 BL rand                 @ r0 = random value
 MOV r1, r4
 BL remainder            @ r0 = 0 .. max-1
 ADD r0, r0, #1          @ r0 = 1 .. max

 LDR lr, [sp, #0]
 LDR r4, [sp, #4]
 ADD sp, sp, #8
 MOV pc, lr

#END randomNumber

.section .note.GNU-stack,"",%progbits

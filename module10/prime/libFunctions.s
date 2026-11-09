@ libFunctions.s - functions for Problem 1 (Prime Numbers up to n)
@   remainder: r0 = r0 rem r1   (no MOD/REM instruction)
@   isPrime:   r0 = 1 if r0 is prime, else 0

.global remainder
.global isPrime

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

@ Test divisors 2 .. n/2; exit the loop as soon as one divides n.
@ In: r0 = n   Out: r0 = 1 (prime) or 0 (not prime)
isPrime:
 SUB sp, sp, #16
 STR lr, [sp, #0]
 STR r4, [sp, #4]
 STR r5, [sp, #8]

 MOV r4, r0              @ r4 = n
 MOV r5, #2              @ r5 = divisor

isPrimeLoop:
 CMP r5, r4, LSR #1      @ divisor > n/2 ?
 MOVGT r0, #1            @   yes: no divisor found -> prime
 BGT isPrimeEnd

 MOV r0, r4
 MOV r1, r5
 BL remainder            @ r0 = n rem divisor
 CMP r0, #0
 MOVEQ r0, #0            @ divisor found -> not prime
 BEQ isPrimeEnd

 ADD r5, r5, #1
 B isPrimeLoop

isPrimeEnd:
 LDR lr, [sp, #0]
 LDR r4, [sp, #4]
 LDR r5, [sp, #8]
 ADD sp, sp, #16
 MOV pc, lr

#END isPrime

.section .note.GNU-stack,"",%progbits

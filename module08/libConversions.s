.text
.global miles2kilometer
.global kph
.global CToF
.global InchesToFt


miles2kilometer:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r1, #161
    MUL r0, r1, r0
    MOV r1, #100
    BL __aeabi_idiv         

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
#END miles2kilometer


kph:
    # push stack (lr and r4, since r4 is callee-saved)
    SUB sp, sp, #8
    STR lr, [sp, #0]
    STR r4, [sp, #4]

    MOV r4, r0          
    MOV r0, r1         
    BL miles2kilometer

    CMP r4, #0
    MOVEQ r0, #0
    BEQ kph_done

    MOV r1, r4       
    BL __aeabi_idiv 

kph_done:
    # pop stack
    LDR lr, [sp, #0]
    LDR r4, [sp, #4]
    ADD sp, sp, #8
    MOV pc, lr
#END kph


CToF:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r1, #9
    MUL r0, r1, r0 
    MOV r1, #5
    BL __aeabi_idiv 
    ADD r0, r0, #32

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
#END CToF

InchesToFt:
    # push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    MOV r1, #12
    BL __aeabi_idiv 

    # pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
#END InchesToFt

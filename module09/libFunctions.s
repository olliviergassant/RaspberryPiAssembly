.text
.global ChkAlphaLOG 

ChkAlphaLOG:
    # Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Function
             

    # Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
#END ChkAlphaLOG 

ChkAlphaNOLOG:
    # Push stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Function
             

    # Pop stack
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
#END ChkAlphaNOLOG 



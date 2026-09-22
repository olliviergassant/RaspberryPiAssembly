
.text
/* text portion is the asembler directive. 
It tells the ARM assembler to start the process after the directive. */

.global main
main:
    SUB sp, sp, #4 // carving out 4 bytes from the stack
    STR lr, [sp] // adding the link register to go back to

    LDR r0, =helloWorld // going to the .data section to get the address for the string
    BL printf // branching out and linking to the external c function to print the string

    LDR lr, [sp] // going back to the link reginster that me marked before
    ADD sp, sp, #4 // loading back to 4 bytes to the stack
    MOV pc, lr //moving the link register back to the PC

.data
    helloWorld: .asciz "Hello World - the test works!\n"

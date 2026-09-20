
.text
/* text portion is the asembler directive. It tells the ARM assembler to start the process after the directive. */

.global main
main:
    SUB
    STR

    LDR
    BL

    LDR
    ADD
    Move

.data
    helloWorld: .asciz "Hello World - the test works!\n"`

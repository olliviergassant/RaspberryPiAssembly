#
# main.s
#

.text
.global main

main:
    # save and return to OD on stack
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Concept 1: convert miles to kilometers
    LDR r0, =promptMiles
    BL printf
    LDR r0, =formatInt
    LDR r1, =miles
    BL scanf

    LDR r0, =miles
    LDR r0, [r0]
    BL miles2kilometer
    MOV r1, r0
    LDR r0, =outKm
    BL printf

    # Concept 2: Convert too kph
    LDR r0, =promptMiles
    BL printf
    LDR r0, =formatInt
    LDR r1, =miles
    BL scanf

    LDR r0, =promptHours
    BL printf
    LDR r0, =formatInt
    LDR r1, =hours
    BL scanf

    LDR r0, =hours
    LDR r0, [r0]
    LDR r1, =miles
    LDR r1, [r1]
    BL kph
    MOV r1, r0
    LDR r0, =outKph
    BL printf

    # Concept 3: convert C to F 
    LDR r0, =promptCelsius
    BL printf
    LDR r0, =formatInt
    LDR r1, =celsius
    BL scanf

    LDR r0, =celsius
    LDR r0, [r0]
    BL CToF
    MOV r1, r0
    LDR r0, =outF
    BL printf

    # Concept 4: Convert inches to feet
    LDR r0, =promptInches
    BL printf
    LDR r0, =formatInt
    LDR r1, =inches
    BL scanf

    LDR r0, =inches
    LDR r0, [r0]
    BL InchesToFt
    MOV r1, r0
    LDR r0, =outFt
    BL printf

    # Return to the OS#
    MOV r0, #0
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr

.data
    promptMiles:   .asciz "Enter miles: "
    promptHours:   .asciz "Enter hours: "
    promptCelsius: .asciz "Enter temperature in Celsius: "
    promptInches:  .asciz "Enter inches: "
    formatInt:     .asciz "%d"
    outKm:         .asciz "Kilometers: %d\n\n"
    outKph:        .asciz "Kilometers per hour: %d\n\n"
    outF:          .asciz "Fahrenheit: %d\n\n"
    outFt:         .asciz "Feet: %d\n"
    miles:         .word 0
    hours:         .word 0
    celsius:       .word 0
    inches:        .word 0
#END main

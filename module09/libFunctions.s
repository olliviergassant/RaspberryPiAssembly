.global ChkAlphaLOG
.global ChkAlphaNOLOG
.global findMAXOf3
.global Grade
.text

ChkAlphaLOG:

 # r0 = inchar
 # returns r0 = 1 if letter, 0 if not
 # uses logical ops: ORR with 0x20 makes uppercase into lowercase

   AND r0, r0, #0xFF
   ORR r1, r0, #0x20

   MOV r0, #0

   CMP r1, #'a'
   BLT LOG_end
   CMP r1, #'z'
   BGT LOG_end

   MOV r0, #1

  LOG_end:
   MOV pc, lr

.data

#END ChkAlphaLOG

.text
ChkAlphaNOLOG:

 # r0 = inchar
 # returns r0 = 1 if letter, 0 if not
 # no logical ops, only compares

   MOV r1, r0
   MOV r0, #0

   CMP r1, #'A'
   BLT NOLOG_end
   CMP r1, #'Z'
   BLE NOLOG_yes

   CMP r1, #'a'
   BLT NOLOG_end
   CMP r1, #'z'
   BGT NOLOG_end

  NOLOG_yes:
   MOV r0, #1

  NOLOG_end:
   MOV pc, lr

  .data

#END ChkAlphaNOLOG

.text
findMAXOf3:

 # r0 = val1, r1 = val2, r2 = val3
 # returns r0 = largest value

   CMP r1, r0
   BLE MAX_check3
   MOV r0, r1

  MAX_check3:
   CMP r2, r0
   BLE MAX_end
   MOV r0, r2

  MAX_end:
   MOV pc, lr

.data

#END findMAXOf3

.text
Grade:

 # r0 = score
 # returns r0 = 'A', 'B', 'C', 'F'
 # returns r0 = -1 if score < 0 or > 100

   CMP r0, #0
   BLT Grade_error
   CMP r0, #100
   BGT Grade_error

   CMP r0, #90
   BGE Grade_A
   CMP r0, #80
   BGE Grade_B
   CMP r0, #70
   BGE Grade_C

   MOV r0, #'F'
   MOV pc, lr

  Grade_A:
   MOV r0, #'A'
   MOV pc, lr

  Grade_B:
   MOV r0, #'B'
   MOV pc, lr

  Grade_C:
   MOV r0, #'C'
   MOV pc, lr

  Grade_error:
   MOV r0, #-1
   MOV pc, lr

.data

#END Grade

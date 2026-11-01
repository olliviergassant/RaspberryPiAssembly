.global main
.text

main:

  SUB sp, sp #8
  STR lr, [sp, #0]

  #ChkAlphaLOG
  LDR r0, =prompt
  BL printf

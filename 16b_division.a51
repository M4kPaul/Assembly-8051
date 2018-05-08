;===============================================================================
; 16b / 16b
; division by subtraction, 1st byte must be greater than the 2nd one
;===============================================================================
include     REG515.INC  ;SFR Table
;-------------------------------------------------------------------------------

       MOV  R0,  #0EAh  ;60 000
       MOV  R1,  #060h
    
       MOV  R2,  #000h  ;3100
       MOV  R3,  #001h
       ;expected result - 00 13 + rest: 04 4C - 19 r 1100
     
SLOOP: CLR  C
       MOV  A,   R1
       SUBB A,   R3
       MOV  R1,  A
       MOV  A,   R0
       SUBB A,   R2
       MOV  R0,  A
       JC   ENDL
       MOV  A,   11h
       ADD  A,   #01h
       MOV  11h, A
       JNC  SLOOP
       INC  10h
       LJMP SLOOP
       
ENDL:  MOV  A,   R1
       ADD  A,   R3
       MOV  13h, A
       MOV  A,   R0
       ADDC A,   R2
       MOV  12h, A
      
MAIN:  LJMP MAIN
;-------------------------------------------------------------------------------
END


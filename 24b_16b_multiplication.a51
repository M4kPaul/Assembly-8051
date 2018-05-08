;===============================================================================
; 24b * 16b
;===============================================================================
;                                                 R0  R1  R2  - 24b
;                                                     R3  R4  - 16b
;;low  16b                           -----------------------
;                                    high(R2*R4)  low(R2*R4)
;                        high(R1*R4)  low(R1*R4)
;            high(R0*R4)  low(R0*R4)
;;high 16b
;                        high(R2*R3)  low(R2*R3)
;            high(R1*R3)  low(R1*R3)
;high(R0*R3)  low(R0*R3)
;-----------------------------------------------------------
;        10h         11h         12h         13h         14h  - result
;
;-------------------------------------------------------------------------------
include    REG515.INC ;SFR Table
;-------------------------------------------------------------------------------

      MOV  R0,  #0FFh ;16 777 215
      MOV  R1,  #0FFh
      MOV  R2,  #0FFh
                
      MOV  R3,  #0FFh ;65 535
      MOV  R4,  #0FFh 
      ;expected result - FF FE FF 00 01 - 1 099 494 785 025
      
      ;mulitply by low byte of 16b
      MOV  A,   R2
      MOV  B,   R4
      MUL  AB
      MOV  14h, A
      MOV  13h, B
      
      MOV  A,   R1
      MOV  B,   R4
      MUL  AB
      ADDC A,   13h
      MOV  13h, A
      MOV  A,   B
      ADDC A,   #00h
      MOV  12h, A
      
      MOV  A,   R0
      MOV  B,   R4
      MUL  AB
      ADDC A,   12h
      MOV  12h, A
      MOV  A,   B
      ADDC A,   #00h
      MOV  11h, A
      
      ;multiply by high byte of 16b
      MOV  A,   R2
      MOV  B,   R3
      MUL  AB
      ADDC A,   13h
      MOV  13h, A
      MOV  A,   B
      ADDC A,   12h
      MOV  12h, A
      MOV  A,   11h
      ADDC A,   #00h
      MOV  11h, A
      
      MOV  A,   R1
      MOV  B,   R3
      MUL  AB
      ADDC A,   12h
      MOV  12h, A
      MOV  A,   B
      ADDC A,   11h
      MOV  11h, A
      MOV  A,   10h
      ADDC A,   #00h
      MOV  10h, A
      
      MOV  A,   R0
      MOV  B,   R3
      MUL  AB
      ADDC A,   11h
      MOV  11h, A
      MOV  A,   B
      ADDC A,   10h
      MOV  10h, A

MAIN: LJMP MAIN

;-------------------------------------------------------------------------------
END


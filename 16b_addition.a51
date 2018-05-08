;===============================================================================
; 16b + 16b
;===============================================================================
include    REG515.INC  ;SFR Table
;-------------------------------------------------------------------------------

      MOV  R0,  #0FFh  ;65 535
      MOV  R1,  #0FFh
    
      MOV  R2,  #0FFh ;65 535
      MOV  R3,  #0FFh
      ;expected result - 1 FF FE - 131 070
    
      ;add lower byte
      MOV  A,   R1
      ADD  A,   R3
      MOV  12h, A
    
      ;add high byte and carry from low byte addition
      MOV  A,   R0
      ADDC A,   R2
      MOV  11h, A
    
      ;add carry from high byte addition
      JNC  MAIN
      MOV  10h, #01h
    
MAIN: LJMP MAIN
;-------------------------------------------------------------------------------
END


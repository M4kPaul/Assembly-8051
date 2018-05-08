;===============================================================================
; 16b - 16b
; Positive integers only, 1st byte must be greater than the 2nd one
;===============================================================================
include   REG515.INC  ;SFR Table
;-------------------------------------------------------------------------------

      MOV  R0,  #0FFh ;65 535
      MOV  R1,  #0FFh
    
      MOV  R2,  #03Ch ;15 535
      MOV  R3,  #0AFh
      ;expected result - C3 50 - 50 000
    
      ;subb lower byte
      MOV  A,   R1
      SUBB A,   R3
      MOV  11h, A
    
      ;subb high byte
      MOV  A,   R0
      SUBB A,   R2
      MOV  10h, A
    
MAIN: LJMP MAIN
;-------------------------------------------------------------------------------
END


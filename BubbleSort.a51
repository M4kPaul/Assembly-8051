;===============================================================================
; BubbleSort
; R0   - array size - 1 (inner loop compares current and next element)
; DPTR - beginning of the array
;===============================================================================
include    REG515.INC  ;SFR Table
;-------------------------------------------------------------------------------
      ;test data - 6 5 3 1 8 7 2 4
      MOV  DPTR, #4000h
      MOV  A, #06h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #05h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #03h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #01h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #08h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #07h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #02h
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, #04h
      MOVX @DPTR, A
      INC  DPTR
      ;---------------------------
      
      MOV  R0, #07h
OUTERL: 
      MOV  DPTR, #4000h
      MOV  A, R0
      MOV  R1, A
INNERL:
      MOVX A, @DPTR
      MOV  R2, A
      INC  DPTR
      MOVX A, @DPTR
      CLR  C
      SUBB A, R2
      JNC  SKIPS
      JZ   SKIPS
      ;SWAP
      MOVX A, @DPTR
      LCALL DEC_DPTR
      MOVX @DPTR, A
      INC  DPTR
      MOV  A, R2
      MOVX @DPTR, A
SKIPS:;SKIP SWAP
      DJNZ R1, INNERL
      DJNZ R0, OUTERL
      LJMP MAIN
     
DEC_DPTR: 
      XCH A, DPL
      DEC A
      CJNE A, #0FFh, _dec_dptr2
      DEC DPH
_dec_dptr2: 
      XCH A, DPL
      RET
        
MAIN: LJMP MAIN
;-------------------------------------------------------------------------------
END

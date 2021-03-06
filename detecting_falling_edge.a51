;===============================================================================
; CPL P3.0 after falling edge on P2.0
;===============================================================================
;        ____    __
; P2.0 _|    |__|  |__...
;             _____
; P3.0 ______|     |__...
;
;-------------------------------------------------------------------------------
include   REG515.INC  ;SFR Table
;-------------------------------------------------------------------------------

LOWS:  JNB  P2.0, LOWS
HIGHS: JB   P2.0, HIGHS
		 CPL  P3.0
		 LJMP LOWS

;-------------------------------------------------------------------------------
END


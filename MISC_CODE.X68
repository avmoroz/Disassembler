*------------------------------------------------------------------------------
* Title      : MISC_CODE
* Description: Handles parsing of NOT, JSR, and LEA. Redirects MOVEM.
*------------------------------------------------------------------------------
    ORG    $30C0

IF_MISC
    MOVE.W  A4,D3
    
    AND.W   #$FF00,D3
   
    CMP.W   #$4600,D3
    BEQ     IF_NOT
    
    CMP.W   #$4E00,D3
    BEQ     IF_JSR
    
    ;Check to see if it might be MULS.L OR DIVU.L
    
    MOVE.W  A4,D3
    AND.W   #$FFC0,D3
    
    CMP.W   #$4C00,D3
    BEQ     IF_MULS_L
    
    CMP.W   #$4C40,D3
    BEQ     IF_DIVU_L
    
    ;Check to see if it might be LEA
    AND.W   #$01C0,D3
    
    CMP.W   #$01C0,D3
    BEQ     IF_LEA
    
    ;Check if it's MOVEM
    BRA     IF_MOVEM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;NOT;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_NOT
    LEA     NOT_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3
    AND.W   #$00C0,D3
    
    CMP.W   #$0000,D3
    BEQ     DISPLAY_NOT_BYTE
    
    CMP.W   #$0040,D3
    BEQ     DISPLAY_NOT_WORD
    
    CMP.W   #$0080,D3
    BEQ     DISPLAY_NOT_LONG

    BRA     IF_INVALID_SIZE

DISPLAY_NOT_BYTE
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.W  A4,D4 ;register
    MOVE.W  A4,D5 ;mode
    
    AND.W   #$0007,D4
    
    AND.W   #$0038,D5
    LSR.W   #3,D5
    
    BSR     DISPLAY_ea_NOT

    BRA     ITERATE

DISPLAY_NOT_WORD
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.W  A4,D4 ;register
    MOVE.W  A4,D5 ;mode
    
    AND.W   #$0007,D4
    
    AND.W   #$0038,D5
    LSR.W   #3,D5
    
    BSR     DISPLAY_ea_NOT
    
    BRA     ITERATE

DISPLAY_NOT_LONG
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.W  A4,D4 ;register
    MOVE.W  A4,D5 ;mode
    
    AND.W   #$0007,D4
    
    AND.W   #$0038,D5
    LSR.W   #3,D5   
    
    BSR     DISPLAY_ea_NOT
    
    BRA     ITERATE


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;JSR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_JSR
    MOVE.W  A4,D4 ;register
    MOVE.W  A4,D5 ;mode
    
    AND.W   #$0007,D4
    
    AND.W   #$0038,D5
    LSR.W   #3,D5

    CMP.W   #%000,D5
    BEQ     IF_INVALID_OP_EA

    CMP.W   #%001,D5
    BEQ     IF_INVALID_OP_EA
    
    CMP.W   #%100,D5
    BEQ     IF_INVALID_OP_EA
    
    CMP.W   #%101,D5
    BEQ     IF_INVALID_OP_EA
    
    CMP.W   #%110,D5
    BEQ     IF_INVALID_OP_EA

    LEA     JSR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_ea_JSR_LEA
    
    BRA     ITERATE
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LEA;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_LEA
    LEA     LEA_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.W  A4,D4 ;ea register
    MOVE.W  A4,D5 ;ea mode

    AND.W   #$0007,D4
    AND.W   #$0038,D5
    
    LSR.W   #3,D5 
    
    BSR     DISPLAY_ea_JSR_LEA
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  A4,D1
    
    AND.W   #$0E00,D1
    
    LSR.L   #7,D1
    LSR.L   #2,D1   
        
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    
    BRA     ITERATE
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;MULS.L;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_MULS_L
    BRA     IF_INVALID_OP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;DIVU.L;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_DIVU_L
    BRA     IF_INVALID_OP

    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_ea_NOT
    CMP.W   #%000,D5
    BEQ     DISPLAY_Dn_NOT

    CMP.W   #%010,D5
    BEQ     DISPLAY_An_ADDRESS_NOT
    
    CMP.W   #%011,D5
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_NOT
    
    CMP.W   #%100,D5
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_NOT
    
    CMP.W   #%111,D5
    BEQ     DISPLAY_ADDRESS_OR_DATA_NOT
    
    BRA     IF_INVALID_OP_EA
    
DISPLAY_Dn_NOT
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    RTS

DISPLAY_An_ADDRESS_NOT
    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    RTS
    
DISPLAY_An_ADDRESS_LEA
    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  A4,D5
    ROR.W   #7,D5
    AND.L   #$00000007,D5
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    RTS    

DISPLAY_An_ADDRESS_INCREMENT_NOT
    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #PLUS,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    RTS

DISPLAY_An_ADDRESS_DECREMENT_NOT
    MOVE.B  #MINUS,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    RTS

DISPLAY_ADDRESS_OR_DATA_NOT
    CMP.W   #%000,D4
    BEQ     DISPLAY_ADDRESS_WORD_NOT
    
    CMP.W   #%001,D4
    BEQ     DISPLAY_ADDRESS_LONG_NOT

    BRA     IF_INVALID_OP_EA

DISPLAY_ADDRESS_WORD_NOT
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$0000FFFF,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    
    RTS

DISPLAY_ADDRESS_LONG_NOT
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  (A2),D1
    MOVE.B  #15,D0
    TRAP    #15
    
    ADDQ    #2,A2

    RTS
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_ea_JSR_LEA
    CMP.W   #%010,D5
    BEQ     DISPLAY_An_ADDRESS_NOT
    
    CMP.W   #%111,D5
    BEQ     DISPLAY_ADDRESS_OR_DATA_NOT
    
    BRA     IF_INVALID_OPMODE
    












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1C20

IF_ADDQ 
    MOVE.W  A4,D3
    
    MOVE.W  A4,D5
    AND.L   #$F100,D5
    CMP.W   #$5000,D5
    BEQ     IF_INVALID_OP
    
    ;Get the register
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A4 ;data
    
    BSR     CHECK_FOR_EIGHT

    ;Get the opmode
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A5 ;size

    ;Get the effective mode 
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A6 ;effective mode
    
    ;Get the effective register
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4 ;effective register
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    
    BRA     DISPLAY_ADDQ
    
DISPLAY_ADDQ
    LEA     ADDQ_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BRA     DISPLAY_ADDQ_SIZE

DISPLAY_ADDQ_SIZE
    CMP.W   #%00,A5
    BEQ     DISPLAY_ADDQ_BYTE
    
    CMP.W   #%01,A5
    BEQ     DISPLAY_ADDQ_WORD
    
    CMP.W   #%10,A5
    BEQ     DISPLAY_ADDQ_LONG
    
    BRA     IF_INVALID_SIZE

DISPLAY_ADDQ_BYTE
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_ADDQ_COMMA

DISPLAY_ADDQ_WORD
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_ADDQ_COMMA

DISPLAY_ADDQ_LONG
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_ADDQ_COMMA    
    
DISPLAY_ADDQ_COMMA
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BSR     GET_EFFECTIVE_ADDRESS_ea
    BRA     ITERATE

;subroutine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GET_EFFECTIVE_ADDRESS_ea_NO_DATA
    CMP.W   #%000,A6
    BEQ     DISPLAY_Dn_ea
    
    CMP.W   #%001,A6
    BEQ     DISPLAY_An_ea
    
    CMP.W   #%010,A6
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%011,A6
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_ea
    
    CMP.W   #%100,A6
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_ea
    
    CMP.W   #%111,A6
    BEQ     DISPLAY_ADDRESS_ea
    
    BRA     IF_INVALID_OP_EA

DISPLAY_ADDRESS_ea
    CMP.W   #%000,A6
    BEQ     DISPLAY_ADDRESS_WORD_ea
    
    CMP.W   #%001,A6
    BEQ     DISPLAY_ADDRESS_LONG_ea
    
    BRA     IF_INVALID_OP_EA
    

;subroutine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHECK_FOR_EIGHT
    CMP.W   #$0,A4
    BEQ     SET_TO_EIGHT 
    RTS

SET_TO_EIGHT
    MOVE.L  #$8,A4
    RTS
    
    








*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

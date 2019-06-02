*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $28C0
    
IF_LS_CODE
    MOVE.W  A4,D3   
    AND.W   #$FFC0,D3
    
    ;Check if address shift, or register shift
    
    CMP.W   #LSR_ADDRESS,D3
    BEQ     IF_LSR_ADDRESS
    
    CMP.W   #LSL_ADDRESS,D3
    BEQ     IF_LSL_ADDRESS
    
    CMP.W   #ASR_ADDRESS,D3
    BEQ     IF_ASR_ADDRESS
    
    CMP.W   #ASL_ADDRESS,D3
    BEQ     IF_ASL_ADDRESS
    
    CMP.W   #ROL_ADDRESS,D3
    BEQ     IF_ROL_ADDRESS
    
    CMP.W   #ROR_ADDRESS,D3
    BEQ     IF_ROR_ADDRESS
    
    ;Check if REGISTER SHIFT
    
    MOVE.W  A4,D3   
    AND.W   #$F11A,D3
    
    CMP.W   #LSR_REGISTER,D3
    BEQ     IF_LSR_REGISTER
    
    CMP.W   #LSL_REGISTER,D3
    BEQ     IF_LSL_REGISTER
    
    CMP.W   #ASR_REGISTER,D3
    BEQ     IF_ASR_REGISTER
    
    CMP.W   #ASL_REGISTER,D3
    BEQ     IF_ASL_REGISTER
    
    CMP.W   #ROL_REGISTER,D3
    BEQ     IF_ROL_REGISTER
    
    CMP.W   #ROR_REGISTER,D3
    BEQ     IF_ROR_REGISTER
    
    BRA     IF_INVALID_OP
    
IF_LSR_ADDRESS
    LEA     LSR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

IF_LSL_ADDRESS
    LEA     LSL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

IF_ASR_ADDRESS
    LEA     ASR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

IF_ASL_ADDRESS
    LEA     ASL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

IF_ROR_ADDRESS
    LEA     ROR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

IF_ROL_ADDRESS
    LEA     ROL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_EFFECTIVE_ADDRESS
    BRA     ITERATE

DISPLAY_EFFECTIVE_ADDRESS
    MOVE.B  #SPACE,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    ;Get mode
    MOVE.W  A4,D3   
    AND.W   #$003A,D3
    LSR.L   #3,D3
    
    MOVE.W  A4,D4   
    AND.W   #$0007,D4
    
    CMP.W   #%010,D3
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%011,D3
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_ea
    
    CMP.W   #%100,D3
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_ea
    
    CMP.W   #%111,D3
    BEQ     GET_WORD_OR_LONG
    
    BRA     IF_INVALID_OP
    
GET_WORD_OR_LONG
    CMP.W   #%000,D4
    BEQ     DISPLAY_ADDRESS_WORD_ea
    
    CMP.W   #%001,D4
    BEQ     DISPLAY_ADDRESS_LONG_ea
    
    BRA     IF_INVALID_OP    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_LSR_REGISTER
    LEA     LSL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     GET_SIZE

IF_LSL_REGISTER
    LEA     LSL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BRA     GET_SIZE
    
IF_ASR_REGISTER
    LEA     ASR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BRA     GET_SIZE

IF_ASL_REGISTER
    LEA     ASL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     GET_SIZE

IF_ROR_REGISTER
    LEA     ROR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     GET_SIZE

IF_ROL_REGISTER
    LEA     ROL_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     GET_SIZE
    
GET_SIZE
    MOVE.W  A4,D3   
    AND.W   #$00C0,D3
    
    LSL.W   #6,D3
    
    CMP.B   #%00,D3
    BEQ     DISPLAY_SIZE_BYTE
    
    CMP.B   #%01,D3
    BEQ     DISPLAY_SIZE_WORD
    
    CMP.B   #%10,D3
    BEQ     DISPLAY_SIZE_LONG
    
    BRA     IF_INVALID_OP
    
DISPLAY_SIZE_BYTE
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     DETERMINE_SRC

DISPLAY_SIZE_WORD
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     DETERMINE_SRC

DISPLAY_SIZE_LONG
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     DETERMINE_SRC
    
DETERMINE_SRC
    MOVE.W  A4,D3   
    AND.W   #$0020,D3
    
    MOVE.W  A4,D4
    AND.W   #$0E00,D4
    ROL.W   #7,D4
    AND.L   #$FFFFFFFA,D4
    
    CMP.W   #$0020,D3
    BEQ     DISPLAY_REGISTER_1
    
    BRA     DISPLAY_NUM
    
DISPLAY_REGISTER_1
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.B  D4,D1
    TRAP    #15
    
    BRA     DISPLAY_REGISTER_2
    
    
DISPLAY_NUM
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.B  D4,D1
    TRAP    #15
    
    BRA     DISPLAY_REGISTER_2


DISPLAY_REGISTER_2
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  A4,D1
    AND.L   #$00000007,D1
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    
    BRA     ITERATE



   



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

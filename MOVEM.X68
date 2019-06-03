*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $3D60

IF_MOVEM
    MOVE.W  A4,D3   
    AND.W   #$FF80,D3
    
    CMP.W   #$4A80,D3
    BEQ     IF_MOVEM_TO_ADDRESS
    
    CMP.W   #$4C80,D3
    BEQ     IF_MOVEM_TO_REGISTER
    
    BRA     IF_INVALID_OP
    
IF_MOVEM_TO_ADDRESS
    LEA     MOVEM_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$0080,D3
    
    CMP.W   #$0080,D3   
    BEQ     LONG_FOR_TO_ADDRESS
    
    BRA     WORD_FOR_TO_ADDRESS

WORD_FOR_TO_ADDRESS
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EA_TO_ADDRESS
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    BSR     GET_MASK
    BSR     LOAD_MASK
    BRA     ITERATE

LONG_FOR_TO_ADDRESS
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     DISPLAY_EA_TO_ADDRESS
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    BSR     GET_MASK
    BSR     LOAD_MASK
    BRA     ITERATE
    
DISPLAY_EA_TO_ADDRESS
    MOVE.W  A4,D3   
    AND.W   #$003A,D3
    LSR.L   #3,D3
    
    MOVE.W  A4,D4   
    AND.W   #$0007,D4
    
    CMP.W   #%010,D3
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%011,D3
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_ea
    
    CMP.W   #%111,D3
    BEQ     GET_WORD_OR_LONG
    
    BRA     IF_INVALID_OP

LOAD_MASK
    MOVE.W  A5,D3
    MOVE.W  A5,D4
    MOVE.L  #0,A6
    
    CMP.L   #0,D3
    BEQ     IF_INVALID_OP
    
    BRA     PARSE_MASK
    
PARSE_MASK
    CMP.L   #16,A6
    BEQ     END_PARSER

    AND.L   #$00000003,D3
    
    CMP.W   #%11,D3
    BEQ     DISPLAY_WITH_DASH
    
    CMP.W   #%01,D3
    BEQ     DISPLAY_WITHOUT_DASH
    
    CMP.W   #0,D3
    BGT     CHECK_DRAW_SLASH
    
    BRA     ITERATE_MASK
    
DISPLAY_WITH_DASH
    BSR     DISPLAY_REG
    
    BSR     DISPLAY_DASH
    
    MOVE.L #1,D6
    
    BRA     ITERATE_MASK


DISPLAY_WITHOUT_DASH
    MOVE.L  #0,D6
    MOVE.L  #1,D5
    BSR     DISPLAY_REG

CHECK_DRAW_SLASH
    CMP.W   #1,D5
    BEQ     DISPLAY_SLASH
    
    BRA     ITERATE_MASK

DISPLAY_SLASH
    MOVE.B  #SLASH,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BRA     ITERATE_MASK
    
END_PARSER
    RTS
    
DISPLAY_REG
    CMP.W   #$0,A6
    BEQ     DISPLAY_D0
    
    CMP.W   #$1,A6
    BEQ     DISPLAY_D1
    
    CMP.W   #$2,A6
    BEQ     DISPLAY_D2
    
    CMP.W   #$3,A6
    BEQ     DISPLAY_D3
    
    CMP.W   #$4,A6
    BEQ     DISPLAY_D4
    
    CMP.W   #$5,A6
    BEQ     DISPLAY_D5
    
    CMP.W   #$6,A6
    BEQ     DISPLAY_D6
    
    CMP.W   #$7,A6
    BEQ     DISPLAY_D7
    
    CMP.W   #$8,A6
    BEQ     DISPLAY_A0
    
    CMP.W   #$9,A6
    BEQ     DISPLAY_A1
    
    CMP.W   #$A,A6
    BEQ     DISPLAY_A2
    
    CMP.W   #$B,A6
    BEQ     DISPLAY_A3
    
    CMP.W   #$C,A6
    BEQ     DISPLAY_A4
    
    CMP.W   #$D,A6
    BEQ     DISPLAY_A5
    
    CMP.W   #$E,A6
    BEQ     DISPLAY_A6
    
    CMP.W   #$F,A6
    BEQ     DISPLAY_A7
    
    BRA     IF_INVALID_OP

DISPLAY_D0
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #0,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D1
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #1,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D2
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #2,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D3
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #3,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D4
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #4,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D5
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #5,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D6  
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #6,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_D7
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #7,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A0
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #0,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A1
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #1,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A2
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #2,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A3
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #3,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A4
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #4,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A5   
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #5,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A6
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #6,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

DISPLAY_A7
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #7,D1
    TRAP    #15
    
    BRA     ITERATE_MASK

ITERATE_MASK
    ADDQ    #1,A6
    LSR.W   #1,D4
    
    MOVE.W  D4,D3
    BRA     PARSE_MASK
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_MOVEM_TO_REGISTER
    LEA     MOVEM_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$0080,D3
    
    CMP.W   #$0080,D3   
    BEQ     LONG_FOR_TO_REGISTER
    
    BRA     WORD_FOR_TO_REGISTER

WORD_FOR_TO_REGISTER
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
   

LONG_FOR_TO_REGISTER
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    
DISPLAY_DASH
    CMP.W   #0,D6
    BNE     FINISH_SMOL_SUBROUTINE

    MOVE.B  #DASH,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    RTS

FINISH_SMOL_SUBROUTINE
    RTS
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

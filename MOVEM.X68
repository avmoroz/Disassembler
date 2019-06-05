*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $3D60

IF_MOVEM
    MOVE.W  A4,D3   
    AND.W   #$FC80,D3
    
    CMP.W   #$4880,D3
    BEQ     IF_MOVEM_TO_ADDRESS
    
    CMP.W   #$4C80,D3
    BEQ     IF_MOVEM_TO_REGISTER
    
    BRA     IF_INVALID_OP
    
IF_MOVEM_TO_REGISTER
    LEA     MOVEM_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$0040,D3
    
    CMP.W   #$0040,D3   
    BEQ     LONG_FOR_TO_REGISTER
    
    BRA     WORD_FOR_TO_REGISTER

WORD_FOR_TO_REGISTER
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    ADDQ    #2,A2
    MOVE.W  (A2),A5
    
    BSR     DISPLAY_EA_TO_REGISTER
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.L  #0,A6
    MOVE.W  A5,D3
    MOVE.W  A5,D4
    
    CMP.L   #0,D3
    BEQ     IF_INVALID_OP
    
    BSR     LOAD_PARSE_MASK
    BRA     ITERATE

LONG_FOR_TO_REGISTER
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    ADDQ    #2,A2
    MOVE.W  (A2),A5
    
    BSR     DISPLAY_EA_TO_REGISTER
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.L  #0,A6
    MOVE.W  A5,D3
    MOVE.W  A5,D4
    
    CMP.L   #0,D3
    BEQ     IF_INVALID_OP
    
    BSR     LOAD_PARSE_MASK
    BRA     ITERATE
    
DISPLAY_EA_TO_REGISTER
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
    
PARSE_MASK
    CMP.L   #16,A6
    BEQ     END_PARSER

    AND.L   #$00000001,D3
    
    CMP.W   #%1,D3
    BEQ     DISPLAY_REG
    
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
    MOVE.B  #A,D1
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
    
    RTS

ITERATE_MASK
    ADDQ    #1,A6
    
    BSR     IF_DRAW_SLASH_REGISTER
    
    LSR.W   #1,D4
    LSR.W   #1,D5
    MOVE.W  D4,D3
    
    CMP.W   #$F,A6
    BGT     END_PARSER
    
    BRA     PARSE_MASK
    
DISPLAY_EA_TO_ADDRESS
    MOVE.L  A4,D3   
    AND.L   #$0000003A,D3
    LSR.L   #3,D3
    
    MOVE.W  A4,D4   
    AND.L   #$00000007,D4
    
    CMP.W   #%010,D3
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%100,D3
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_ea
    
    CMP.W   #%111,D3
    BEQ     GET_WORD_OR_LONG
    
    BRA     IF_INVALID_OP
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF_MOVEM_TO_ADDRESS
    MOVE.L  #0,D5

    LEA     MOVEM_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$0040,D3
    
    CMP.W   #$0040,D3   
    BEQ     LONG_FOR_TO_ADDRESS
    
    BRA     WORD_FOR_TO_ADDRESS

WORD_FOR_TO_ADDRESS
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     GET_MASK_ADDRESS
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    BSR     DISPLAY_EA_TO_ADDRESS

    BRA     ITERATE

LONG_FOR_TO_ADDRESS
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     GET_MASK_ADDRESS
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    BSR     DISPLAY_EA_TO_ADDRESS

    BRA     ITERATE
    

GET_MASK_ADDRESS    
    MOVE.W  A4,D3   
    AND.W   #$0038,D3
    LSR.L   #3,D3
    
    ADDQ    #2,A2
    MOVE.W  (A2),A5
    
    CMP.W   #%100,D3
    BEQ     LOAD_MASK_ADDRESS    
    
    BRA     LOAD_PARSE_MASK

LOAD_PARSE_MASK
    MOVE.W  A5,D3
    MOVE.W  A5,D4
    MOVE.W  A5,D5
    LSR.W   #1,D5
    MOVE.L  #0,A6
    
    CMP.L   #$0,D3
    BEQ     IF_INVALID_OP
    
    BRA     PARSE_MASK

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LOAD_MASK_ADDRESS
    MOVE.W  A5,D3
    MOVE.W  A5,D4
    MOVE.W  A5,D5
    LSL.W   #1,D5
    MOVE.L  #0,A6
    
    CMP.L   #$0,D3
    BEQ     IF_INVALID_OP
    
    BRA     PARSE_MASK_ADDRESS
    
PARSE_MASK_ADDRESS
    CMP.L   #16,A6
    BEQ     END_PARSER

    AND.L   #$00008000,D3
    
    CMP.W   #$8000,D3
    BEQ     DISPLAY_REG_ADDRESS
    
    BRA     ITERATE_MASK_ADDRESS
    
DISPLAY_REG_ADDRESS
    CMP.W   #$0,A6
    BEQ     DISPLAY_D0_ADDRESS
    
    CMP.W   #$1,A6
    BEQ     DISPLAY_D1_ADDRESS
    
    CMP.W   #$2,A6
    BEQ     DISPLAY_D2_ADDRESS
    
    CMP.W   #$3,A6
    BEQ     DISPLAY_D3_ADDRESS
    
    CMP.W   #$4,A6
    BEQ     DISPLAY_D4_ADDRESS
    
    CMP.W   #$5,A6
    BEQ     DISPLAY_D5_ADDRESS
    
    CMP.W   #$6,A6
    BEQ     DISPLAY_D6_ADDRESS
    
    CMP.W   #$7,A6
    BEQ     DISPLAY_D7_ADDRESS
    
    CMP.W   #$8,A6
    BEQ     DISPLAY_A0_ADDRESS
    
    CMP.W   #$9,A6
    BEQ     DISPLAY_A1_ADDRESS
    
    CMP.W   #$A,A6
    BEQ     DISPLAY_A2_ADDRESS
    
    CMP.W   #$B,A6
    BEQ     DISPLAY_A3_ADDRESS
    
    CMP.W   #$C,A6
    BEQ     DISPLAY_A4_ADDRESS
    
    CMP.W   #$D,A6
    BEQ     DISPLAY_A5_ADDRESS
    
    CMP.W   #$E,A6
    BEQ     DISPLAY_A6_ADDRESS
    
    CMP.W   #$F,A6
    BEQ     DISPLAY_A7_ADDRESS
    
    BRA     IF_INVALID_OP

DISPLAY_D0_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #0,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D1_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #1,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D2_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #2,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D3_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #3,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D4_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #4,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D5_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #5,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D6_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #6,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_D7_ADDRESS
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #7,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A0_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #0,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A1_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #1,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A2_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #2,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A3_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #3,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A4_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #4,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A5_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #5,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A6_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #6,D1
    TRAP    #15
    
    BRA     ITERATE_MASK_ADDRESS

DISPLAY_A7_ADDRESS
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  #7,D1
    TRAP    #15
    
    RTS

ITERATE_MASK_ADDRESS
    ADDQ    #1,A6
    BSR     IF_DRAW_SLASH_ADDRESS
    
    LSL.L   #1,D4
    LSL.W   #1,D5
    
    MOVE.W  D4,D3
    
    CMP.W   #$F,A6
    BGT     END_PARSER
    
    BRA     PARSE_MASK_ADDRESS
    

    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

IF_DRAW_SLASH_ADDRESS
    CMP.W   #0,D5
    BNE     IF_DRAW_SLASH_2_ADDRESS
    
    RTS

IF_DRAW_SLASH_2_ADDRESS
    CMP.W   #$8000,D3
    BEQ     DRAW_SLASH
    
    RTS

IF_DRAW_SLASH_REGISTER
    CMP.W   #0,D3
    BNE     IF_DRAW_SLASH_2_REGISTER
    
    RTS

IF_DRAW_SLASH_2_REGISTER
    CMP.L   #0,D5
    BGT     DRAW_SLASH
    
    RTS

DRAW_SLASH
    MOVE.B  #SLASH,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    RTS



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

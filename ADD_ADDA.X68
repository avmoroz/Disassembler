*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

    ORG     $2040
    
IF_ADD_ADDA
    MOVE.W  A4,D3
    
    ;Get the register
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A4 ;register

    ;Get the opmode
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A5 ;opmode

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
    
    BRA     DISPLAY_ADD_ADDA
    
DISPLAY_ADD_ADDA
    CMP.W   #%011,A5
    BEQ     DISPLAY_ADDA_W
    
    CMP.W   #%111,A5
    BEQ     DISPLAY_ADDA_L
    
    BRA     DISPLAY_ADD

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DISPLAY_ADDA_W
    LEA     ADDA_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     GET_EFFECTIVE_ADDRESS_ea
    BRA     DISPLAY_ADDA_REGISTER

DISPLAY_ADDA_L
    LEA     ADDA_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     GET_EFFECTIVE_ADDRESS_ea
    BRA     DISPLAY_ADDA_REGISTER
    
;subroutine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GET_EFFECTIVE_ADDRESS_ea
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
    BEQ     DISPLAY_ADDRESS_OR_DATA_ea
    
    BRA     IF_INVALID_OP

DISPLAY_Dn_ea
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    RTS

DISPLAY_An_ea
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    
    TRAP    #15
    
    RTS

DISPLAY_An_ADDRESS_ea
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

DISPLAY_An_ADDRESS_INCREMENT_ea
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

DISPLAY_An_ADDRESS_DECREMENT_ea
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

DISPLAY_ADDRESS_OR_DATA_ea
    CMP.W   #%000,D4
    BEQ     DISPLAY_ADDRESS_WORD_ea
    
    CMP.W   #%001,D4
    BEQ     DISPLAY_ADDRESS_LONG_ea
    
    CMP.W   #%100,D4
    BEQ     DISPLAY_DATA_ea
    
    BRA     IF_INVALID_OP
    
DISPLAY_ADDRESS_WORD_ea
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$0000FFFF,D1
    MOVE.B  #15,D0
    TRAP    #15
    
    RTS

DISPLAY_ADDRESS_LONG_ea
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  (A2),D1
    MOVE.B  #15,D0
    TRAP    #15
    
    ADDQ    #2,A2
    
    RTS
    
DISPLAY_DATA_ea
    CMP.W   #%011,A5
    BEQ     DISPLAY_DATA_WORD_ea
    
    CMP.W   #%111,A5
    BEQ     DISPLAY_DATA_LONG_ea

    BRA     IF_INVALID_OP

DISPLAY_DATA_BYTE_ea
    ADDQ    #2,A2
    
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$000000FF,D1
    MOVE.B  #15,D0
    TRAP    #15
    RTS

DISPLAY_DATA_WORD_ea
    ADDQ    #2,A2
    
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$0000FFFF,D1
    MOVE.B  #15,D0
    TRAP    #15
    RTS
    
DISPLAY_DATA_LONG_ea
    ADDQ    #2,A2
    
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  (A2),D1
    MOVE.B  #15,D0
    TRAP    #15
    
    ADDQ    #2,A2
    
    RTS


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
DISPLAY_ADDA_REGISTER
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15
    
    BRA     ITERATE
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    

DISPLAY_ADD
    LEA     ADD_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     DISPLAY_ARGS
    
DISPLAY_ARGS    
    
    CMP.W   #%000,A5
    BEQ     DISPLAY_BYTE_SRC
    
    CMP.W   #%001,A5
    BEQ     DISPLAY_WORD_SRC
    
    CMP.W   #%010,A5
    BEQ     DISPLAY_LONG_SRC
    
    CMP.W   #%100,A5
    BEQ     DISPLAY_BYTE_DEST
    
    CMP.W   #%101,A5
    BEQ     DISPLAY_WORD_DEST
    
    CMP.W   #%110,A5
    BEQ     DISPLAY_LONG_DEST
    
    BRA     IF_INVALID_OP   
    
DISPLAY_BYTE_SRC
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_ea
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_WORD_SRC
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_ea

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_LONG_SRC
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_ea

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_BYTE_DEST
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_WORD_DEST
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_LONG_DEST
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE
    
DISPLAY_Dn_ADD
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15
    
    RTS

;subroutine;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GET_EFFECTIVE_ADDRESS_ea_DEST   
    CMP.W   #%010,A6
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%011,A6
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_ea
    
    CMP.W   #%100,A6
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_ea
    
    CMP.W   #%111,A6
    BEQ     DISPLAY_ADDRESS_OR_DATA_ea
    
    BRA     IF_INVALID_OP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    
    







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

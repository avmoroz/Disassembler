*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1800
    
PARSE_MOVE
    MOVE.W  A4,D3
    
    ;Get the destination register
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A4 ;Destination register

    ;Get the destination mode
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A5 ;Destination mode

    ;Get the source mode 
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4
    MOVE.L  D4,A6 ;Source mode
    
    ;Get the source register
    AND.W   #$0FFF,D3
    ASL.W   #3,D3
    MOVE.W  D3,D4
    AND.L   #$0000F000,D4
    ROL.W   #4,D4 ;Source register
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    
    CMP.W   #%001,A5
    BEQ     DISPLAY_MOVEA
    BRA     DISPLAY_MOVE
    
DISPLAY_MOVEA
    LEA     MOVEA_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_TYPE

DISPLAY_MOVE
    LEA     MOVE_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_TYPE
    
DISPLAY_TYPE
    CMP.W   #MOVE_B_CODE,D5
    BEQ     DISPLAY_BYTE
    
    CMP.W   #MOVE_W_CODE,D5
    BEQ     DISPLAY_WORD
    
    CMP.W   #MOVE_L_CODE,D5
    BEQ     DISPLAY_LONG
    
    BRA     IF_INVALID_OP     
    
DISPLAY_BYTE
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_SRC_MODE

DISPLAY_WORD
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_SRC_MODE

DISPLAY_LONG
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DISPLAY_SRC_MODE

DISPLAY_SRC_MODE
    CMP.W   #%000,A6
    BEQ     DISPLAY_Dn_SRC
    
    CMP.W   #%001,A6
    BEQ     DISPLAY_An_SRC
    
    CMP.W   #%010,A6
    BEQ     DISPLAY_AT_An_SRC
    
    CMP.W   #%011,A6
    BEQ     DISPLAY_AT_An_INCREMENT_SRC
    
    CMP.W   #%100,A6
    BEQ     DISPLAY_AT_An_DECREMENT_SRC
    
    CMP.W   #%111,A6
    BEQ     DISPLAY_ADDRESS_OR_DATA_SRC
    
    BRA     IF_INVALID_OP
    
DISPLAY_Dn_SRC
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15
    
    BRA     DISPLAY_DEST

DISPLAY_An_SRC
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  D4,D1
    TRAP    #15

    BRA     DISPLAY_DEST

DISPLAY_AT_An_SRC
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

    BRA     DISPLAY_DEST

DISPLAY_AT_An_INCREMENT_SRC
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
    
    BRA     DISPLAY_DEST

DISPLAY_AT_An_DECREMENT_SRC
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

    BRA     DISPLAY_DEST

DISPLAY_ADDRESS_OR_DATA_SRC
    CMP.W   #%000,D4
    BEQ     DISPLAY_ADDRESS_WORD_SRC
    
    CMP.W   #%001,D4
    BEQ     DISPLAY_ADDRESS_LONG_SRC

    CMP.W   #%100,D4
    BEQ     DISPLAY_DATA_SRC

    BRA     IF_INVALID_OP

DISPLAY_ADDRESS_WORD_SRC
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$0000FFFF,D1
    MOVE.B  #15,D0
    TRAP    #15
    
    BRA     DISPLAY_DEST

DISPLAY_ADDRESS_LONG_SRC
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  (A2),D1
    MOVE.B  #15,D0
    TRAP    #15
    
    ADDQ    #2,A2

    BRA     DISPLAY_DEST
    
DISPLAY_DATA_SRC
    CMP.W   #MOVE_B_CODE,D5
    BEQ     DISPLAY_DATA_SRC_BYTE
    
    CMP.W   #MOVE_W_CODE,D5
    BEQ     DISPLAY_DATA_SRC_WORD
    
    CMP.W   #MOVE_L_CODE,D5
    BEQ     DISPLAY_DATA_SRC_LONG

    BRA     IF_INVALID_OP
    
DISPLAY_DATA_SRC_BYTE
    ADDQ    #3,A2
    
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15    
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  (A2),D1
    AND.L   #$000000FF,D1
    MOVE.B  #15,D0
    TRAP    #15
    
    SUBQ    #1,A2

    BRA     DISPLAY_DEST

DISPLAY_DATA_SRC_WORD
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

    BRA     DISPLAY_DEST
    
DISPLAY_DATA_SRC_LONG
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
    
    BRA     DISPLAY_DEST
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DISPLAY_DEST
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15

    CMP.W   #%000,A5
    BEQ     DISPLAY_Dn_DEST
    
    CMP.W   #%001,A5
    BEQ     DISPLAY_An_DEST
    
    CMP.W   #%010,A5
    BEQ     DISPLAY_AT_An_DEST
    
    CMP.W   #%011,A5
    BEQ     DISPLAY_AT_An_INCREMENT_DEST
    
    CMP.W   #%100,A5
    BEQ     DISPLAY_AT_An_DECREMENT_DEST
    
    CMP.W   #%111,A5
    BEQ     DISPLAY_ADDRESS_OR_DATA_DEST
    
    BRA     IF_INVALID_OP

DISPLAY_Dn_DEST
    MOVE.B  #D,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15
    
    BRA     ITERATE

DISPLAY_An_DEST
    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15

    BRA     ITERATE

DISPLAY_AT_An_DEST
    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    BRA     ITERATE

DISPLAY_AT_An_INCREMENT_DEST
    MOVE.B  #LEFT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    MOVE.B  #A,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #PLUS,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BRA     ITERATE

DISPLAY_AT_An_DECREMENT_DEST
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
    MOVE.L  A4,D1
    TRAP    #15
    
    MOVE.B  #RIGHT_PAR,D1
    MOVE.B  #6,D0
    TRAP    #15

    BRA     ITERATE

DISPLAY_ADDRESS_OR_DATA_DEST
    CMP.W   #%000,A4
    BEQ     DISPLAY_ADDRESS_WORD_DEST
    
    CMP.W   #%001,A4
    BEQ     DISPLAY_ADDRESS_LONG_DEST

    BRA     IF_INVALID_OP

DISPLAY_ADDRESS_WORD_DEST
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  (A2),D1
    AND.L   #$0000FFFF,D1
    MOVE.B  #15,D0
    TRAP    #15
    
    BRA     ITERATE

DISPLAY_ADDRESS_LONG_DEST
    ADDQ    #2,A2
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.L  (A2),D1
    MOVE.B  #15,D0
    TRAP    #15
    
    ADDQ    #2,A2

    BRA     ITERATE









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $3500
IF_MULS_AND
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
    
    BRA     DETERMINE_MULS_AND
    
DETERMINE_MULS_AND
    CMP.W   #%111,A5
    BEQ     DISPLAY_MULS
    
    BRA     DISPLAY_AND


;AND;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_AND 
    LEA     AND_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    CMP.W   #%000,A5
    BEQ     DISPLAY_BYTE_SRC_AND
    
    CMP.W   #%001,A5
    BEQ     DISPLAY_WORD_SRC_AND
    
    CMP.W   #%010,A5
    BEQ     DISPLAY_LONG_SRC_AND
    
    CMP.W   #%100,A5
    BEQ     DISPLAY_BYTE_DEST_AND
    
    CMP.W   #%101,A5
    BEQ     DISPLAY_WORD_DEST_AND
    
    CMP.W   #%110,A5
    BEQ     DISPLAY_LONG_DEST_AND
    
    BRA     IF_INVALID_OP   
    
DISPLAY_BYTE_SRC_AND
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_AND_SRC  
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_WORD_SRC_AND
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_AND_SRC  

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_LONG_SRC_AND
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_AND_SRC  

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_BYTE_DEST_AND
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_WORD_DEST_AND
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_LONG_DEST_AND
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

GET_EFFECTIVE_ADDRESS_AND_SRC   
    CMP.W   #%000,A6
    BEQ     DISPLAY_Dn_ea

    CMP.W   #%010,A6
    BEQ     DISPLAY_An_ADDRESS_ea
    
    CMP.W   #%011,A6
    BEQ     DISPLAY_An_ADDRESS_INCREMENT_ea
    
    CMP.W   #%100,A6
    BEQ     DISPLAY_An_ADDRESS_DECREMENT_ea
    
    CMP.W   #%111,A6
    BEQ     DISPLAY_ADDRESS_OR_DATA_ea
    
    BRA     IF_INVALID_OP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;MULS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_MULS
    LEA     MULS_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     IF_INVALID_OP
    
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     IF_INVALID_OP
    
    BSR     GET_EFFECTIVE_ADDRESS_AND_SRC
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15 
    
    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE
    
    
    
    


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

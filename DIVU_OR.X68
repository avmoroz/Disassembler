*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $4000
IF_DIVU_OR
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
    
    BRA     DETERMINE_DIVU_OR

DETERMINE_DIVU_OR
    CMP.W   #%011,A5
    BEQ     DISPLAY_DIVU
    
    CMP.W   #%111,A5
    BEQ     IF_INVALID_OP
    
    BRA     DISPLAY_OR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;OR;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY_OR
    LEA     OR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    CMP.W   #%000,A5
    BEQ     DISPLAY_BYTE_SRC_OR
    
    CMP.W   #%001,A5
    BEQ     DISPLAY_WORD_SRC_OR
    
    CMP.W   #%010,A5
    BEQ     DISPLAY_LONG_SRC_OR
    
    CMP.W   #%100,A5
    BEQ     DISPLAY_BYTE_DEST_OR
    
    CMP.W   #%101,A5
    BEQ     DISPLAY_WORD_DEST_OR
    
    CMP.W   #%110,A5
    BEQ     DISPLAY_LONG_DEST_OR
    
    BRA     IF_INVALID_OP 

DISPLAY_BYTE_SRC_OR
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_OR_SRC  
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_WORD_SRC_OR
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_OR_SRC  

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_LONG_SRC_OR
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_OR_SRC  

    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     DISPLAY_Dn_ADD
    
    BRA     ITERATE

DISPLAY_BYTE_DEST_OR
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_WORD_DEST_OR
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

DISPLAY_LONG_DEST_OR
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     DISPLAY_Dn_ADD
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15    

    BSR     GET_EFFECTIVE_ADDRESS_ea_DEST 
    
    BRA     ITERATE

GET_EFFECTIVE_ADDRESS_OR_SRC   
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;DIVU;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;NOT IMPLEMENTED YET!

DISPLAY_DIVU
    BRA     IF_INVALID_OP


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

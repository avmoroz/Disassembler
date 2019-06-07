*------------------------------------------------------------------------------
* Title      : SUB
* Description: Handles parsing of SUB op.
*------------------------------------------------------------------------------
    ORG    $3D20

IF_SUB 
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
    
    BRA     DISPLAY_SUB
    
DISPLAY_SUB
    LEA     SUB_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    CMP.W   #%111,A5
    BEQ     DISPLAY_SUB_L
    
    CMP.W   #%011,A5
    BNE     DISPLAY_ARGS
  
    CMP.W   #%011,A5
    BEQ     DISPLAY_SUB_W
    
    BRA     IF_INVALID_OPMODE
    
DISPLAY_SUB_W
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    BSR     GET_EFFECTIVE_ADDRESS_ea
    BRA     DISPLAY_ADDA_REGISTER

DISPLAY_SUB_L
    LEA     L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
  
    BSR     GET_EFFECTIVE_ADDRESS_ea
    BRA     DISPLAY_ADDA_REGISTER
    
    
    
    




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

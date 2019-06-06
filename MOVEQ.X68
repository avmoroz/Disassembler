*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG     $34E0

IF_MOVEQ
    MOVE.W  A4,D3
    
    AND.W   #$F100,D3
    CMP.W   #$7000,D3
    BEQ     DISPLAY_MOVEQ
    
    BRA     IF_INVALID_OP
    
DISPLAY_MOVEQ
    LEA     MOVEQ_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    ;Display the value
    MOVE.B  #16,D2
    
    MOVE.B  #NUM,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.B  #HEX,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    MOVE.W  A4,D3
    AND.W   #$00FF,D3
    
    MOVE.B  #15,D0
    MOVE.L  D3,D1
    AND.L   #$000000FF,D3
    MOVE.B  #16,D2
    TRAP    #15
    
    MOVE.B  #COMMA,D1
    MOVE.B  #6,D0
    TRAP    #15
    
    ;Display the resgister
    MOVE.W  A4,D3
    AND.W   #$0E00,D3
    ROL.W   #7,D3
    
    MOVE.B  #15,D0
    MOVE.L  D3,D1
    AND.L   #$00000007,D3
    TRAP    #15
    
    BRA     ITERATE


    



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $2080

IF_Bcc_BRA
    MOVE.W  A4,D3   
    AND.W   #$FF00,D3
    
    CMP.W   #$6000,D3
    BEQ     DISPLAY_BRA
    
    CMP.W   #$6000,D3
    BEQ     DISPLAY_BGT
    
    CMP.W   #$6000,D3
    BEQ     DISPLAY_BLE
    
    CMP.W   #$6000,D3
    BEQ     DISPLAY_BEQ
    
    BRA     IF_INVALID_OP
    
DISPLAY_BRA
    LEA     BRA_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
   
DISPLAY_BGT
    LEA     BGT_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
    
    CMP.B   #$00,D3
    BRA     PARSE_DISPLACEMENT_BYTE
    
    CMP.B   #$FF,D3
    BRA     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_WORD
    
DISPLAY_BLE
    LEA     BLE_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
    
    CMP.B   #$00,D3
    BRA     PARSE_DISPLACEMENT_BYTE
    
    CMP.B   #$FF,D3
    BRA     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_WORD
    
DISPLAY_BEQ
    LEA     BEQ_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
    
    CMP.B   #$00,D3
    BRA     PARSE_DISPLACEMENT_WORD
    
    CMP.B   #$FF,D3
    BRA     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_BYTE
    
PARSE_DISPLACEMENT_BYTE
    MOVE.L  #$00000000,D1

    AND.L   #$FFFFFF00,D3
    CMP.B   #$A0,D3    
    BGE     IF_NEGATIVE_BYTE

    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

PARSE_DISPLACEMENT_WORD
    MOVE.L  #$00000000,D1

    ADDQ    #2,A2
    MOVE.W  (A2),D3
    
    AND.L   #$FFFF0000,D3
    CMP.W   #$A000,D3    
    BGE     IF_NEGATIVE_WORD

    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS
    
IF_NEGATIVE_BYTE
    MOVE.L  #$FFFFFF00,D1
    ADD.L   D3,D1
    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

IF_NEGATIVE_WORD
    MOVE.L  #$FFFF0000,D1
    ADD.L   D3,D1
    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

DISPLAY_DISPLACEMENT_AS_ADDRESS
    MOVE.B  #3,D0
    TRAP    #15
    BRA     ITERATE




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

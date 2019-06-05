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
    
    CMP.W   #$6E00,D3
    BEQ     DISPLAY_BGT
    
    CMP.W   #$6F00,D3
    BEQ     DISPLAY_BLE
    
    CMP.W   #$6700,D3
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
    BEQ     PARSE_DISPLACEMENT_WORD
    
    CMP.B   #$FF,D3
    BEQ     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_BYTE
    
DISPLAY_BLE
    LEA     BLE_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
    
    CMP.B   #$00,D3
    BEQ     PARSE_DISPLACEMENT_WORD
    
    CMP.B   #$FF,D3
    BEQ     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_BYTE
    
DISPLAY_BEQ
    LEA     BEQ_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.W  A4,D3   
    AND.W   #$00FF,D3
    
    CMP.B   #$00,D3
    BEQ     PARSE_DISPLACEMENT_WORD
    
    CMP.B   #$FF,D3
    BEQ     IF_INVALID_OP ;We don't handle 32 bit
    
    BRA     PARSE_DISPLACEMENT_BYTE
    
PARSE_DISPLACEMENT_BYTE
    LEA     B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.L  #$00000000,D1

    AND.L   #$000000FF,D3
      
    MOVE.L  D3,D4
    AND.L   #$000000A0,D4
    
    CMP.B   #$A0,D4     
    BEQ     IF_NEGATIVE_BYTE

    MOVE.L  D3,D1
    ADD.L   A2,D1
    ADDQ    #2,D1

    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

PARSE_DISPLACEMENT_WORD
    LEA     W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.L  #$00000000,D1

    ADDQ    #2,A2
    MOVE.W  (A2),D3
    
    AND.L   #$0000FFFF,D3
    
    MOVE.L  D3,D4
    AND.L   #$0000A000,D4
    
    CMP.W   #$A000,D4    
    BEQ     IF_NEGATIVE_WORD

    MOVE.L  D3,D1
    ADD.L   A2,D1

    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS
    
IF_NEGATIVE_BYTE
    MOVE.L  #$FFFFFF00,D1
    ADD.L   D3,D1
    
    ADD.L   A2,D1
    ADDQ    #2,D1
    
    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

IF_NEGATIVE_WORD
    MOVE.L  #$FFFF0000,D1
    ADD.L   D3,D1
    ADD.L   A2,D1
    BRA     DISPLAY_DISPLACEMENT_AS_ADDRESS

DISPLAY_DISPLACEMENT_AS_ADDRESS
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     ITERATE







*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

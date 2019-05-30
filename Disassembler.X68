*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        INCLUDE TestOps.X68
        INCLUDE MOVEQ.X68
        INCLUDE MISC_CODE.X68
        INCLUDE DIVU_OR.X68
        INCLUDE MOVE_MOVEA.X68
        INCLUDE ADD_ADDA.X68
        INCLUDE SUB.X68
        INCLUDE ADDQ.X68
        INCLUDE MULS_AND.X68
        
START   ORG    $1000

    ; first instruction of program
    
    ;TODO: put in an actual line counter 
    MOVE.L  #$6000,A2
    MOVE.L  #$7000,A3
    BRA     COMPARE

;Parses Simple Commands, such as NOP     
PARSE_SIMPLE    
    
    MOVE.W  (A2),A4
    
    CMP.W   #NOP_CODE,A4
    BEQ     IF_NOP 
    
    CMP.W   #RTS_CODE,A4
    BEQ     IF_RTS
    
    BRA     PARSE_COMPLEX

; For parsing more complex commands
PARSE_COMPLEX
    MOVE.W  A4,A5
    MOVE.W  A4,D3
    
    AND.W   #$F000,D3
    
    CMP.W   #MOVE_B_CODE,D3
    BEQ     IF_MOVE_B

    CMP.W   #MOVE_W_CODE,D3
    BEQ     IF_MOVE_W
    
    CMP.W   #MOVE_L_CODE,D3
    BEQ     IF_MOVE_L
    
    CMP.W   #ADD_CODE,D3
    BEQ     IF_ADD_ADDA
    
    CMP.W   #SUB_CODE,D3
    BEQ     IF_SUB
    
    CMP.W   #ADDQ_CODE,D3
    BEQ     IF_ADDQ
    
    CMP.W   #MULS_AND_CODE,D3
    BEQ     IF_MULS_AND
    
    CMP.W   #DIVU_OR_CODE,D3
    BEQ     IF_DIVU_OR
    
    CMP.W   #MISC_CODE,D3
    BEQ     IF_MISC
    
    CMP.W   #MOVEQ_CODE,D3
    BEQ     IF_MOVEQ
    
    BRA     IF_INVALID_OP
    
IF_NOP
    LEA     NOP_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     ITERATE

IF_RTS
    LEA     RTS_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     ITERATE

IF_MOVE_B
    MOVE.W  #MOVE_B_CODE,D5
    BRA     PARSE_MOVE

IF_MOVE_W
    MOVE.W  #MOVE_W_CODE,D5
    BRA     PARSE_MOVE

IF_MOVE_L
    MOVE.W  #MOVE_L_CODE,D5
    BRA     PARSE_MOVE

IF_INVALID_OP
    LEA     INVALID_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DONE

ITERATE
    ADDQ.L  #2,A2
    
    LEA     NEWLINE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     COMPARE
    
COMPARE    
    CMP     A3,A2     
    BGE     DONE
    BRA     PARSE_SIMPLE

DONE
    MOVE.B  #9,D0
    TRAP    #15

* Put variables and constants here

CR              EQU     $0D
LF              EQU     $0A
LEFT_PAR        EQU     $28
RIGHT_PAR       EQU     $29
A               EQU     $41
D               EQU     $44
PLUS            EQU     $2B
MINUS           EQU     $2D
NUM             EQU     $23
HEX             EQU     $24
COMMA           EQU     $2C

;Codes to be parsed
NOP_CODE        EQU     $4E71
RTS_CODE        EQU     $4E75
MOVE_B_CODE     EQU     $1000 ; MOVE.B, MOVEA.B (done)
MOVE_W_CODE     EQU     $3000 ; MOVE.W, MOVEA.W (done)
MOVE_L_CODE     EQU     $2000 ; MOVE.L, MOVEA.L (done)
MOVEQ_CODE      EQU     $7000 ; MOVEQ 
DIVU_OR_CODE    EQU     $8000 ; DIVU, OR (OR done)
SUB_CODE        EQU     $9000 ; SUB (done)
MULS_AND_CODE   EQU     $C000 ; MULS, AND (done)
ADD_CODE        EQU     $D000 ; ADD, ADDA (done)
LS_CODE         EQU     $E000 ; LOGICAL SHIFTS
ADDQ_CODE       EQU     $5000 ; ADDQ (done)
Bcc_BRA_CODE    EQU     $6000 ; Bcc (BGT, BLE, BEQ), BRA
MISC_CODE       EQU     $4000 ; LEA, NOT, JSR, MOVEM (LEA, NOT, JSR done)

;Sample outputs
NOP_OUTPUT      DC.B    'NOP',CR,LF,0
RTS_OUTPUT      DC.B    'RTS',CR,LF,0

MOVEA_OUTPUT    DC.B    'MOVEA',0
MOVE_OUTPUT     DC.B    'MOVE',0
ADDA_OUTPUT     DC.B    'ADDA',0
ADD_OUTPUT      DC.B    'ADD',0
SUB_OUTPUT      DC.B    'SUB',0
ADDQ_OUTPUT     DC.B    'ADDQ',0
AND_OUTPUT      DC.B    'AND',0
MULS_OUTPUT     DC.B    'MULS',0
OR_OUTPUT       DC.B    'OR',0
DIVU_OUTPUT     DC.B    'DIVU',0
NOT_OUTPUT      DC.B    'NOT',0
JSR_OUTPUT      DC.B    'JSR ',0
LEA_OUTPUT      DC.B    'LEA',0
MOVEQ_OUTPUT    DC.B    'MOVEQ ',0

B_OUTPUT        DC.B    '.B ',0
W_OUTPUT        DC.B    '.W ',0
L_OUTPUT        DC.B    '.L ',0

INVALID_OUTPUT  DC.B    'Invalid operation!',CR,LF,0
NEWLINE         DC.B    CR,LF,0

            END    START        ; last line of source












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

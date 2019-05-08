*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    
START   ORG    $1000
                      ; first instruction of program
    
    ;TODO: put in an actual line counter 
    MOVE.L  #$6000,A2
    MOVE.L  #$7000,A3
    BRA     COMPARE
    
PARSE_SIMPLE    
    
    MOVE.W  (A2),A4
    
    CMP.W   #NOP_CODE,A4
    BEQ     IF_NOP 
    
    CMP.W   #RTS_CODE,A4
    BEQ     IF_RTS
    
    BRA     PARSE_COMPLEX

PARSE_COMPLEX
    MOVE.W  A4,A5
    *AND.W   #$F000,A5
    
    CMP.W   #MOVE_B_CODE,A5
    BEQ     IF_MOVE_B

    CMP.W   #MOVE_W_CODE,A5
    BEQ     IF_MOVE_W
    
    CMP.W   #MOVE_W_CODE,A5
    BEQ     IF_MOVE_L
    
    BRA     IF_INVALID_OP
    
    
    
* Put program code here

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
    LEA     MOVE_B_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     ITERATE

IF_MOVE_W
    LEA     MOVE_W_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     ITERATE

IF_MOVE_L
    LEA     MOVE_L_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     ITERATE

IF_INVALID_OP
    LEA     INVALID_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    BRA     DONE

ITERATE
    ADDQ.L  #2,A2
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

NOP_CODE        EQU     $4E71
RTS_CODE        EQU     $4E75

MOVE_B_CODE     EQU     $1000 ; MOVE.B, MOVEA.B
MOVE_W_CODE     EQU     $3000 ; MOVE.W, MOVEA.W
MOVE_L_CODE     EQU     $2000 ; MOVE.L, MOVEA.L
MOVEQ_CODE      EQU     $7000 ; MOVEQ

DIVU_OR_CODE    EQU     $8000 ; DIVU, OR

SUB_CODE        EQU     $9000 ; SUB

MULS_AND_CODE   EQU     $A000 ; MULS, AND

ADD_CODE        EQU     $D000 ; ADD, ADDA


ADDQ_CODE       EQU     $5000 ; ADDQ
Bcc_BRA_CODE    EQU     $6000 ; Bcc (BGT, BLE, BEQ), BRA


MISC_CODE       EQU     $4000 ; MULS, LEA, NOT, JSR, MOVEM

NOP_OUTPUT      DC.B    'NOP',CR,LF,0
RTS_OUTPUT      DC.B    'RTS',CR,LF,0
MOVE_B_OUTPUT   DC.B    'MOVE.B',CR,LF,0
MOVE_W_OUTPUT   DC.B    'MOVE.W',CR,LF,0
MOVE_L_OUTPUT   DC.B    'MOVE.L',CR,LF,0
INVALID_OUTPUT  DC.B    'Invalid operation!',CR,LF,0

            END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

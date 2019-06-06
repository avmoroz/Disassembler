*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
        INCLUDE TestOps.X68
        INCLUDE MOVEM.X68
        INCLUDE LogicalShift.X68
        INCLUDE Bcc_BRA.X68
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
    
    
    MOVE.L  #0,D7
    
    MOVE.L  #0,A4
    MOVE.L  #9,A3
    
    LEA     INPUT1_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15    
    
    BRA     GET_INPUT1
    
    MOVE.L  #$60B0,A3
    BRA     COMPARE

GET_INPUT1
    ADDQ.L  #1,A4                
    CMP.L   A4,A3
    BEQ     LOAD_INPUT1
    
    MOVE.B  #5,D0
    TRAP    #15
    BSR     GET_NUMBER
    BRA     GET_INPUT1

LOAD_INPUT1
    MOVE.L  D2,A2
    MOVE.L  #$0,A4
    
    LEA     INPUT2_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15 
    
    BRA     GET_INPUT2
    
    
GET_INPUT2
    ADDQ.L  #1,A4                
    CMP.L   A4,A3
    BEQ     LOAD_INPUT2

    MOVE.B  #5,D0
    TRAP    #15
    BSR     GET_NUMBER
    
    BRA     GET_INPUT2
    
LOAD_INPUT2
    MOVE.L  D2,A3
        
    LEA     NEWLINE,A1
    MOVE.B  #14,D0
    TRAP    #15
    TRAP    #15
    
    BRA     PARSE_SIMPLE

;Parses Simple Commands, such as NOP     
PARSE_SIMPLE
    BSR     LOAD_0s_FOR_MEM_LOCATION
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.L  A2,D1
    TRAP    #15
    
    MOVE.B  #HT,D1
    MOVE.B  #6,D0
    TRAP    #15
    
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
    
    CMP.W   #Bcc_BRA_CODE,D3
    BEQ     IF_Bcc_BRA
    
    CMP.W   #LS_CODE,D3
    BEQ     IF_LS_CODE
    
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
    LEA     ERROR_OUTPUT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     LOAD_0s_FOR_DATA
    
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    MOVE.W  (A2),D1
    TRAP    #15
    
    BRA     ITERATE

ITERATE
    ADDQ.L  #2,A2
    
    ADDQ.L  #1,D7
        
    LEA     NEWLINE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BSR     SHOULD_PAUSE_PARSER
    
    BRA     COMPARE
    
COMPARE    
    CMP.L   A2,A3     
    BLT     SHOULD_RUN_AGAIN
    
    BRA     PARSE_SIMPLE

DONE
    LEA     DONE_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15

    MOVE.B  #9,D0
    TRAP    #15
    
GET_NUMBER
                BRA     IS_0
                
IS_0
                SUB.B   #$30,D1
                LSL.L   #4,D2
                CMP.B   #$0,D1
                BEQ     ADD_NUM
                BRA     IS_1                 

IS_1
                CMP.B   #$1,D1
                BEQ     ADD_NUM
                BRA     IS_2 

IS_2
                CMP.B   #$2,D1
                BEQ     ADD_NUM
                BRA     IS_3 

IS_3
                CMP.B   #$3,D1
                BEQ     ADD_NUM
                BRA     IS_4
    
IS_4
                CMP.B   #$4,D1
                BEQ     ADD_NUM
                BRA     IS_5 
    
IS_5
                CMP.B   #$5,D1
                BEQ     ADD_NUM
                BRA     IS_6 

IS_6
                CMP.B   #$6,D1
                BEQ     ADD_NUM
                BRA     IS_7 
    
IS_7
                CMP.B   #$7,D1
                BEQ     ADD_NUM
                BRA     IS_8 


IS_8
                CMP.B   #$8,D1
                BEQ     ADD_NUM
                BRA     IS_9 
    
IS_9
                CMP.B   #$9,D1
                BEQ     ADD_NUM
                BRA     IS_A
                
IS_A
                SUB.B   #$7,D1
                CMP.B   #$A,D1
                BEQ     ADD_NUM
                BRA     IS_B 
                
IS_B
                CMP.B   #$B,D1
                BEQ     ADD_NUM
                BRA     IS_C 

IS_C
                CMP.B   #$C,D1
                BEQ     ADD_NUM
                BRA     IS_D 

IS_D
                CMP.B   #$D,D1
                BEQ     ADD_NUM
                BRA     IS_E 

IS_E
                CMP.B   #$E,D1
                BEQ     ADD_NUM
                BRA     IS_F 

IS_F
                CMP.B   #$F,D1
                BEQ     ADD_NUM
                BRA     IS_INVALID

IS_INVALID
                ;LEA     ERROR_MESSAGE,A1
                ;MOVE.B  #14,D0
                ;TRAP    #15
                BRA     DONE
                
* Add the number in

ADD_NUM
                ADD.L   D1,D2
                RTS
                
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                
SHOULD_PAUSE_PARSER
    CMP.L   #20,D7
    BEQ     PAUSE_PARSER
    RTS
    
PAUSE_PARSER
    LEA     CONTINUTE_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     RESET_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     EXIT_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     SHOULD_CONTINUE
    
SHOULD_CONTINUE
    MOVE.B  #5,D0
    TRAP    #15
    
    CMP.B   #C_LOWER,D1
    BEQ     CONTINUE
    
    CMP.B   #C_UPPER,D1
    BEQ     CONTINUE
    
    CMP.B   #R_LOWER,D1
    BEQ     RESET
    
    CMP.B   #R_UPPER,D1
    BEQ     RESET
    
    CMP.B   #ESC,D1
    BEQ     DONE
    
    BRA     SHOULD_CONTINUE

CONTINUE
    MOVE.W  #$FF00,D1
    MOVE.B  #11,D0
    TRAP    #15
    
    LEA     NEWLINE,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    MOVE.L  #0,D7
    RTS

RESET
    MOVE.W  #$FF00,D1
    MOVE.B  #11,D0
    TRAP    #15
    BRA     START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SHOULD_RUN_AGAIN
    LEA     RESET_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    LEA     EXIT_TEXT,A1
    MOVE.B  #14,D0
    TRAP    #15
    
    BRA     RUN_AGAIN_CHECK
    
RUN_AGAIN_CHECK
    MOVE.B  #5,D0
    TRAP    #15
    
    CMP.B   #R_LOWER,D1
    BEQ     RESET
    
    CMP.B   #R_UPPER,D1
    BEQ     RESET
    
    CMP.B   #ESC,D1
    BEQ     DONE
    
    BRA     RUN_AGAIN_CHECK
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LOAD_0s_FOR_DATA
    MOVE.W  (A2),D5
    AND.L   #$0000FFFF,D5

    MOVE.B  #$30,D1
    MOVE.B  #6,D0
    
    CMP.L   #$0000000F,D5
    BLE     DISPLAY_ZERO_3
    
    CMP.L   #$000000FF,D5
    BLE     DISPLAY_ZERO_2
    
    CMP.L   #$00000FFF,D5
    BLE     DISPLAY_ZERO_1

    BRA     DISPLAY_NO_ZERO

LOAD_0s_FOR_MEM_LOCATION
    MOVE.B  #$30,D1
    MOVE.B  #6,D0
    
    CMP.L   #$0000000F,A2
    BLE     DISPLAY_ZERO_7
    
    CMP.L   #$000000FF,A2
    BLE     DISPLAY_ZERO_6
    
    CMP.L   #$00000FFF,A2
    BLE     DISPLAY_ZERO_5

    CMP.L   #$0000FFFF,A2
    BLE     DISPLAY_ZERO_4
    
    CMP.L   #$000FFFFF,A2
    BLE     DISPLAY_ZERO_3
    
    CMP.L   #$00FFFFFF,A2
    BLE     DISPLAY_ZERO_2
    
    CMP.L   #$0FFFFFFF,A2
    BLE     DISPLAY_ZERO_1
    
    BRA     DISPLAY_NO_ZERO

DISPLAY_ZERO_7
    TRAP    #15
    
DISPLAY_ZERO_6
    TRAP    #15
    
DISPLAY_ZERO_5
    TRAP    #15
    
DISPLAY_ZERO_4
    TRAP    #15
    
DISPLAY_ZERO_3
    TRAP    #15
    
DISPLAY_ZERO_2
    TRAP    #15
    
DISPLAY_ZERO_1
    TRAP    #15
    
DISPLAY_NO_ZERO
    RTS

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
SPACE           EQU     $20
SLASH           EQU     $2F
HT              EQU     $09
ESC             EQU     $1B
C_LOWER         EQU     $63
C_UPPER         EQU     $43
R_LOWER         EQU     $72
R_UPPER         EQU     $52
ZERO            EQU     $30


;Codes to be parsed
NOP_CODE        EQU     $4E71
RTS_CODE        EQU     $4E75
MOVE_B_CODE     EQU     $1000 ; MOVE.B, MOVEA.B (done)
MOVE_W_CODE     EQU     $3000 ; MOVE.W, MOVEA.W (done)
MOVE_L_CODE     EQU     $2000 ; MOVE.L, MOVEA.L (done)
MOVEQ_CODE      EQU     $7000 ; MOVEQ (done)
DIVU_OR_CODE    EQU     $8000 ; [DIVU], OR (done)
SUB_CODE        EQU     $9000 ; SUB (done)
MULS_AND_CODE   EQU     $C000 ; [MULS], AND (done)
ADD_CODE        EQU     $D000 ; ADD, ADDA (done)
LS_CODE         EQU     $E000 ; LOGICAL SHIFTS (done)
ADDQ_CODE       EQU     $5000 ; ADDQ (done)
Bcc_BRA_CODE    EQU     $6000 ; Bcc (BGT, BLE, BEQ), BRA
MISC_CODE       EQU     $4000 ; LEA, NOT, JSR, MOVEM (done)


LSR_ADDRESS     EQU     $E2C0
LSL_ADDRESS     EQU     $E3C0
ASR_ADDRESS     EQU     $E0C0
ASL_ADDRESS     EQU     $E1C0
ROR_ADDRESS     EQU     $E6C0
ROL_ADDRESS     EQU     $E7C0

LSR_REGISTER    EQU     $E008
LSL_REGISTER    EQU     $E108
ASR_REGISTER    EQU     $E000
ASL_REGISTER    EQU     $E100
ROR_REGISTER    EQU     $E018
ROL_REGISTER    EQU     $E118

;Sample outputs
NOP_OUTPUT      DC.B    'NOP',0
RTS_OUTPUT      DC.B    'RTS',0

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
LEA_OUTPUT      DC.B    'LEA ',0
MOVEQ_OUTPUT    DC.B    'MOVEQ ',0
MOVEM_OUTPUT    DC.B    'MOVEM',0

BRA_OUTPUT      DC.B    'BRA',0
BGT_OUTPUT      DC.B    'BGE',0
BLE_OUTPUT      DC.B    'BLE',0
BEQ_OUTPUT      DC.B    'BEQ',0

LSR_OUTPUT      DC.B    'LSR',0
LSL_OUTPUT      DC.B    'LSL',0
ASR_OUTPUT      DC.B    'ASR',0
ASL_OUTPUT      DC.B    'ASL',0
ROR_OUTPUT      DC.B    'ROR',0
ROL_OUTPUT      DC.B    'ROL',0

B_OUTPUT        DC.B    '.B ',0
W_OUTPUT        DC.B    '.W ',0
L_OUTPUT        DC.B    '.L ',0

INPUT1_OUTPUT   DC.B    'Please enter the starting address: ',0
INPUT2_OUTPUT   DC.B    CR,LF,'Please enter the end address: ',0

CONTINUTE_TEXT  DC.B    CR,LF,'Press [c] to continue disassembler',CR,LF,0
RESET_TEXT      DC.B    'Press [r] to reset disassembler',CR,LF,0
EXIT_TEXT       DC.B    'Press [esc] to end disassembler',CR,LF,0
DONE_TEXT       DC.B    CR,LF,'[Disassembler exited]',CR,LF,0

INVALID_OUTPUT  DC.B    'Invalid operation!',0
ERROR_OUTPUT    DC.B    'DATA ',0
NEWLINE         DC.B    CR,LF,0

            END    START        ; last line of source




























*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

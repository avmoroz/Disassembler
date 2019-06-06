*****************************
*
* demo_test.X68
*
* Created 12/05/2018
*
* Test program for CSS 422 Disassembler Project Demo
*
*****************************

    ORG $00009000
    
    JSR       (A0)
    JSR       $1234
    JSR       $12345678

    MULS.W    D0,D1
    MULS.W    (A0),D1
    MULS.W    -(A0),D1
    MULS.W    (A0)+,D1
    DIVU.W    D0,D1
    DIVU.W    (A0),D1
    DIVU.W    -(A0),D1
    DIVU.W    (A0)+,D1

    NOP
    RTS
    NOP
    RTS
    LEA     (A0),A0
    LEA     (A5),A0
    LEA     (A7),A0
    LEA     (A0),A7
    LEA     (A5),A7
    LEA     (A7),A7
    MOVE.B    D0,D1
    MOVE.B    D0,(A0)
    MOVE.B    D0,(A0)+
    MOVE.B    D0,-(A0)
    MOVE.B    (A0),D0
    MOVE.B    (A0),(A1)
    MOVE.B    (A0),(A1)+
    MOVE.B    (A0),-(A1)
    MOVE.B    (A0)+,D0
    MOVE.B    (A0)+,(A1)
    MOVE.B    (A0)+,(A1)+
    MOVE.B    (A0)+,-(A1)
    MOVE.B    -(A0),D0
    MOVE.B    -(A0),(A1)
    MOVE.B    -(A0),(A1)+
    MOVE.B    -(A0),-(A1)
    MOVE.W    D0,D1
    MOVE.W    D0,(A0)
    MOVE.W    D0,(A0)+
    MOVE.W    D0,-(A0)
    MOVE.W    A0,D0
    MOVE.W    A0,(A1)
    MOVE.W    A0,(A1)+
    MOVE.W    A0,-(A1)
    MOVE.W    (A0),D0
    MOVE.W    (A0),(A1)
    MOVE.W    (A0),(A1)+
    MOVE.W    (A0),-(A1)
    MOVE.W    (A0)+,D0
    MOVE.W    (A0)+,(A1)
    MOVE.W    (A0)+,(A1)+
    MOVE.W    (A0)+,-(A1)
    MOVE.W    -(A0),D0
    MOVE.W    -(A0),(A1)
    MOVE.W    -(A0),(A1)+
    MOVE.W    -(A0),-(A1)
    MOVE.L    D0,D1
    MOVE.L    D0,(A0)
    MOVE.L    D0,(A0)+
    MOVE.L    D0,-(A0)
    MOVE.L    A0,D0
    MOVE.L    A0,(A1)
    MOVE.L    A0,(A1)+
    MOVE.L    A0,-(A1)
    MOVE.L    (A0),D0
    MOVE.L    (A0),(A1)
    MOVE.L    (A0),(A1)+
    MOVE.L    (A0),-(A1)
    MOVE.L    (A0)+,D0
    MOVE.L    (A0)+,(A1)
    MOVE.L    (A0)+,(A1)+
    MOVE.L    (A0)+,-(A1)
    MOVE.L    -(A0),D0
    MOVE.L    -(A0),(A1)
    MOVE.L    -(A0),(A1)+
    MOVE.L    -(A0),-(A1)
    MOVEM.W   A1-A7,-(A1)
    MOVEM.L   D1-D7,-(A1)
    MOVEM.W   A1/D7,-(A1)
    MOVEM.L   A1/D7,-(A1)
    MOVEM.W   A1-A7,(A1)
    MOVEM.L   D1-D7,(A1)
    MOVEM.W   A1/D7,(A1)
    MOVEM.L   A1/D7,(A1)
    MOVEM.W   (A1)+,A1-A7
    MOVEM.L   (A1)+,D1-D7
    MOVEM.W   (A1)+,A1/D7
    MOVEM.L   (A1)+,A1/D7
    MOVEM.W   (A1),A1-A7
    MOVEM.L   (A1),D1-D7
    MOVEM.W   (A1),A1/D7
    MOVEM.L   (A1),A1/D7
    MOVEA.W    D0,A0
    MOVEA.W    A0,A0
    MOVEA.W    (A0),A0
    MOVEA.W    (A0)+,A0
    MOVEA.W    -(A0),A0
    MOVEA.L    D0,A0
    MOVEA.L    A0,A0
    MOVEA.L    (A0),A0
    MOVEA.L    (A0)+,A0
    MOVEA.L    -(A0),A0  
    ADD.B     D1,D2
    ADD.B     D1,(A1)
    ADD.B     D1,(A1)+
    ADD.B     D1,-(A1)
    ADD.B     (A1),D1
    ADD.B     (A1)+,D1
    ADD.B     -(A1),D1
    ADD.W     D1,D2
    ADD.W     D1,(A1)
    ADD.W     D1,(A1)+
    ADD.W     D1,-(A1)
    ADD.W     (A1),D1
    ADD.W     (A1)+,D1
    ADD.W     -(A1),D1
    ADD.L     D1,D2
    ADD.L     D1,(A1)
    ADD.L     D1,(A1)+
    ADD.L     D1,-(A1)
    ADD.L     (A1),D1
    ADD.L     (A1)+,D1
    ADD.L     -(A1),D1
    ADDA.W        D1,A2
    ADDA.W        (A1),A2
    ADDA.W        (A1)+,A2
    ADDA.W        -(A1),A2
    ADDA.L        D1,A2
    ADDA.L        (A1),A2
    ADDA.L        (A1)+,A2
    ADDA.L        -(A1),A2
    SUB.B     D1,D2
    SUB.B     D1,(A1)
    SUB.B     D1,(A1)+
    SUB.B     D1,-(A1)
    SUB.B     (A1),D1
    SUB.B     (A1)+,D1
    SUB.B     -(A1),D1
    SUB.W     D1,D2
    SUB.W     D1,A1
    SUB.W     D1,(A1)
    SUB.W     D1,(A1)+
    SUB.W     D1,-(A1)
    SUB.W     A1,D1
    SUB.W     (A1),D1
    SUB.W     (A1)+,D1
    SUB.W     -(A1),D1
    SUB.L     D1,D2
    SUB.L     D1,A1
    SUB.L     D1,(A1)
    SUB.L     D1,(A1)+
    SUB.L     D1,-(A1)
    SUB.L     A1,D1
    SUB.L     (A1),D1
    SUB.L     (A1)+,D1
    SUB.L     -(A1),D1    
    MULS.W    D0,D1
    MULS.W    (A0),D1
    MULS.W    -(A0),D1
    MULS.W    (A0)+,D1
    DIVU.W    D0,D1
    DIVU.W    (A0),D1
    DIVU.W    -(A0),D1
    DIVU.W    (A0)+,D1
    AND.B     D1,D2
    AND.B     D1,(A1)
    AND.B     D1,(A1)+
    AND.B     D1,-(A1)
    AND.B     (A1),D1
    AND.B     (A1)+,D1
    AND.B     -(A1),D1
    AND.W     D1,D2
    AND.W     D1,(A1)
    AND.W     D1,(A1)+
    AND.W     D1,-(A1)
    AND.W     (A1),D1
    AND.W     (A1)+,D1
    AND.W     -(A1),D1
    AND.L     D1,D2
    AND.L     D1,(A1)
    AND.L     D1,(A1)+
    AND.L     D1,-(A1)
    AND.L     (A1),D1
    AND.L     (A1)+,D1
    AND.L     -(A1),D1
    OR.B     D1,D2
    OR.B     D1,(A1)
    OR.B     D1,(A1)+
    OR.B     D1,-(A1)
    OR.B     (A1),D1
    OR.B     (A1)+,D1
    OR.B     -(A1),D1
    OR.W     D1,D2
    OR.W     D1,(A1)
    OR.W     D1,(A1)+
    OR.W     D1,-(A1)
    OR.W     (A1),D1
    OR.W     (A1)+,D1
    OR.W     -(A1),D1
    OR.L     D1,D2
    OR.L     D1,(A1)
    OR.L     D1,(A1)+
    OR.L     D1,-(A1)
    OR.L     (A1),D1
    OR.L     (A1)+,D1
    OR.L     -(A1),D1
    LSL.B     D1,D2
    LSL.W     D1,D2
    LSL.W     (A1)
    LSL.W     (A1)+
    LSL.W     -(A1)
    LSL.L     D1,D2
    LSR.B     D1,D2
    LSR.W     D1,D2
    LSR.W     (A1)
    LSR.W     (A1)+
    LSR.W     -(A1)
    LSR.L     D1,D2    
    ASR.B     D1,D2
    ASR.W     D1,D2
    ASR.W     (A1)
    ASR.W     (A1)+
    ASR.W     -(A1)
    ASR.L     D1,D2
    ASL.B     D1,D2
    ASL.W     D1,D2
    ASL.W     (A1)
    ASL.W     (A1)+
    ASL.W     -(A1)
    ASL.L     D1,D2  
    BGT.B     label1
    BGT.B     label2
    BLE.B     label1
    BLE.B     label2
    BGE.B     label1
    BEQ.B     label2
    BEQ.W     label1
    JSR       (A0)
    JSR       $1234
    JSR       $12345678
    JSR       label1
    JSR       label2
    JSR       label3
    NOP
    RTS
label1
    NOP
    RTS
    LEA       $12,A0
    LEA       $1234,A0
    LEA       $12345678,A0
label2
    MOVEQ     #$0,D0
    MOVEQ     #$12,D0
    MOVEQ     #$FF,D0
label3
    MOVEM.W   A1-A7,$12
    MOVEM.L   D1-D7,$12
    MOVEM.W   A1/D7,$12
    MOVEM.L   A1/D7,$12
    MOVEM.W   A1-A7,$1234
    MOVEM.L   D1-D7,$1234
    MOVEM.W   A1/D7,$1234
    MOVEM.L   A1/D7,$1234
    MOVEM.W   A1-A7,$12345678
    MOVEM.L   D1-D7,$12345678
    MOVEM.W   A1/D7,$12345678
    MOVEM.L   A1/D7,$12345678
    MOVEM.W   $12,A1-A7
    MOVEM.L   $12,D1-D7
    MOVEM.W   $12,A1/D7
    MOVEM.L   $12,A1/D7
    MOVEM.W   $1234,A1-A7
    MOVEM.L   $1234,D1-D7
    MOVEM.W   $1234,A1/D7
    MOVEM.L   $1234,A1/D7
    MOVEM.W   $12345678,A1-A7
    MOVEM.L   $12345678,D1-D7
    MOVEM.W   $12345678,A1/D7
    MOVEM.L   $12345678,A1/D7
    ADDA.W    $12,A2
    ADDA.W    $1234,A2
    ADDA.W    $12345678,A2
    ADDA.W    #$1234,A2
    ADDA.L    $12,A2
    ADDA.L    $1234,A2
    ADDA.L    $12345678,A2
    ADDA.L    #$12345678,A2
    MULS.W    $12,D1
    MULS.W    $1234,D1
    MULS.W    $12345678,D1
    MULS.W    #$1234,D1
    DIVU.W    $12,D1
    DIVU.W    $1234,D1
    DIVU.W    $12345678,D1
    DIVU.W    #$1234,D1
    AND.B     D1,$12
    AND.B     D1,$1234
    AND.B     D1,$12345678
    AND.B     $12,D1
    AND.B     $1234,D1
    AND.B     $12345678,D1
    AND.B     #$12,D1
    AND.W     D1,$12
    AND.W     D1,$1234
    AND.W     D1,$12345678
    AND.W     $12,D1
    AND.W     $1234,D1
    AND.W     $12345678,D1
    AND.W     #$1234,D1
    AND.L     D1,$12
    AND.L     D1,$1234
    AND.L     D1,$12345678
    AND.L     $12,D1
    AND.L     $1234,D1
    AND.L     $12345678,D1
    AND.L     #$12345678,D1
    LSL.B     #$1,D2
    LSL.W     #$2,D2
    LSL.L     #$3,D2
    LSL.W     $12
    LSL.W     $1234
    LSL.W     $12345678
    ASR.B     #$1,D2
    ASR.W     #$2,D2
    ASR.L     #$3,D2
    ASR.W     $12
    ASR.W     $1234
    ASR.W     $12345678
label4
    BGT.B     label4
    BGT.B     label4
    BGT.B     label4
    BLE.W     label1
    BLE.W     label2
    BLE.W     label3
    BEQ.W     label1
    BEQ.W     label2
    BEQ.W     label3
    JSR       label1
    JSR       label2
    JSR       label3
	
	JSR     (A0)
    JSR     (A1)
    JSR     (A2)
    JSR     (A3)
    JSR     (A4)
    JSR     (A5)
    JSR     (A6)
    JSR     (A7)
    NOT.L	D0
	NOT.L	(A0)
	NOT.L	(A0)+
	NOT.L	-(A0)
	NOT.L	D7
	NOT.L	(A7)
	NOT.L	(A7)+
	NOT.L	-(A7)
	NOT.L   $12
	NOT.L   $1234
	NOT.L   $12345678
	
	LSR     (A0)
    LSR     (A7)
    LSR     (A0)+
    LSR     (A7)+
    LSR     -(A0)
    LSR     -(A7)
    LSR     $12
    LSR     $1234
    LSR     $12345678

	LSL     (A0)
    LSL     (A7)
    LSL     (A0)+
    LSL     (A7)+
    LSL     -(A0)
    LSL     -(A7)
    LSL     $12
    LSL     $1234
    LSL     $12345678
	
	ASL     (A0)
    ASL     (A7)
    ASL     (A0)+
    ASL     (A7)+
    ASL     -(A0)
    ASL     -(A7)
    ASL     $12
    ASL     $1234
    ASL     $12345678
	
	ASR     (A0)
    ASR     (A7)
    ASR     (A0)+
    ASR     (A7)+
    ASR     -(A0)
    ASR     -(A7)
    ASR     $12
    ASR     $1234
    ASR     $12345678
	
	ROL     (A0)
    ROL     (A7)
    ROL     (A0)+
    ROL     (A7)+
    ROL     -(A0)
    ROL     -(A7)
    ROL     $12
    ROL     $1234
    ROL     $12345678
	
	ROR     (A0)
    ROR     (A7)
    ROR     (A0)+
    ROR     (A7)+
    ROR     -(A0)
    ROR     -(A7)
    ROR     $12
    ROR     $1234
    ROR     $12345678

    LSL.B   #1,D1
    LSL.B   #8,D1
    LSL.B   #1,D7
    LSL.B   #8,D7
	
	LSR.B   #1,D1
    LSR.B   #8,D1
    LSR.B   #1,D7
    LSR.B   #8,D7
	
	LSL.W   #1,D1
    LSL.W   #8,D1
    LSL.W   #1,D7
    LSL.W   #8,D7
	
	LSR.W   #1,D1
    LSR.W   #8,D1
    LSR.W   #1,D7
    LSR.W   #8,D7
	
	LSL.L   #1,D1
    LSL.L   #8,D1
    LSL.L   #1,D7
    LSL.L   #8,D7
	
	LSR.L   #1,D1
    LSR.L   #8,D1
    LSR.L   #1,D7
    LSR.L   #8,D7
	
;;;;;;;;;;;;;;;;;;;;
	
    ASL.B   #1,D1
    ASL.B   #8,D1
    ASL.B   #1,D7
    ASL.B   #8,D7
	
	ASR.B   #1,D1
    ASR.B   #8,D1
    ASR.B   #1,D7
    ASR.B   #8,D7
	
    ASL.W    #1,D1
    ASL.W   #8,D1
    ASL.W   #1,D7
    ASL.W   #8,D7
	
	ASR.W   #1,D1
    ASR.W   #8,D1
    ASR.W   #1,D7
    ASR.W   #8,D7
	
	ASL.L   #1,D1
    ASL.L   #8,D1
    ASL.L   #1,D7
    ASL.L   #8,D7
	
	ASR.L   #1,D1
    ASR.L   #8,D1
    ASR.L   #1,D7
    ASR.L   #8,D7

;;;;;;;;;;;;;;;;;;;;;;;;;

    ROL.B   #1,D1
    ROL.B   #8,D1
    ROL.B   #1,D7
    ROL.B   #8,D7
	
	ROR.B   #1,D1
    ROR.B   #8,D1
    ROR.B   #1,D7
    ROR.B   #8,D7
	
    ROL.W    #1,D1
    ROL.W   #8,D1
    ROL.W   #1,D7
    ROL.W   #8,D7
	
	ROR.W   #1,D1
    ROR.W   #8,D1
    ROR.W   #1,D7
    ROR.W   #8,D7
	
	ROL.L   #1,D1
    ROL.L   #8,D1
    ROL.L   #1,D7
    ROL.L   #8,D7
	
	ROR.L   #1,D1
    ROR.L   #8,D1
    ROR.L   #1,D7
    ROR.L   #8,D7
	
;;;;;;;;;;;;;;;;;;;;;;;;
    LSL.B   D1,D1
    LSL.B   D7,D1
    LSL.B   D1,D7
    LSL.B   D7,D7
	
	LSR.B   D1,D1
    LSR.B   D7,D1
    LSR.B   D1,D7
    LSR.B   D7,D7
	
    LSL.W   D1,D1
    LSL.W   D7,D1
    LSL.W   D1,D7
    LSL.W   D7,D7
	
	LSR.W   D1,D1
    LSR.W   D7,D1
    LSR.W   D1,D7
    LSR.W   D7,D7
	
    LSL.L   D1,D1
    LSL.L   D7,D1
    LSL.L   D1,D7
    LSL.L   D7,D7
	
	LSR.L   D1,D1
    LSR.L   D7,D1
    LSR.L   D1,D7
    LSR.L   D7,D7

;;;;;;;;;;;;;;;;;;;;;;;;
	ASL.B   D1,D1
    ASL.B   D7,D1
    ASL.B   D1,D7
    ASL.B   D7,D7
	
	ASR.B   D1,D1
    ASR.B   D7,D1
    ASR.B   D1,D7
    ASR.B   D7,D7
	
    ASL.W   D1,D1
    ASL.W   D7,D1
    ASL.W   D1,D7
    ASL.W   D7,D7
	
	ASR.W   D1,D1
    ASR.W   D7,D1
    ASR.W   D1,D7
    ASR.W   D7,D7
	
    ASL.L   D1,D1
    ASL.L   D7,D1
    ASL.L   D1,D7
    ASL.L   D7,D7
	
	ASR.L   D1,D1
    ASR.L   D7,D1
    ASR.L   D1,D7
    ASR.L   D7,D7
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	  ROL.B   D1,D1
    ROL.B   D7,D1
    ROL.B   D1,D7
    ROL.B   D7,D7
	
	ROR.B   D1,D1
    ROR.B   D7,D1
    ROR.B   D1,D7
    ROR.B   D7,D7
	
    ROL.W   D1,D1
    ROL.W   D7,D1
    ROL.W   D1,D7
    ROL.W   D7,D7
	
	ROR.W   D1,D1
    ROR.W   D7,D1
    ROR.W   D1,D7
    ROR.W   D7,D7
	
    ROL.L   D1,D1
    ROL.L   D7,D1
    ROL.L   D1,D7
    ROL.L   D7,D7
	
	ROR.L   D1,D1
    ROR.L   D7,D1
    ROR.L   D1,D7
    ROR.L   D7,D7
	
	* MOVEQ
    MOVEQ   #1,D0
    MOVEQ   #1,D1
    MOVEQ   #1,D2
    MOVEQ   #1,D3
    MOVEQ   #1,D4
    MOVEQ   #1,D5
    MOVEQ   #2,D0
    MOVEQ   #8,D0
    MOVEQ   #-8,D0
    MOVEQ   #127,D0
    
    MOVEQ   #-128,D0
    MOVEQ   #-1,D0
    MOVEQ   #-2,D0
    MOVEQ   #-4,D0
    MOVEQ   #-16,D0
    MOVEQ   #-32,D0
    MOVEQ   #-64,D0

* MOVEM <list>,<ea>
    MOVEM.W D0,(A0)
    MOVEM.L D0,-(A0)

    MOVEM.W D0/D1/D2/D3/A0-A7,(A0)
    MOVEM.W D0-D3,(A0)
    MOVEM.W D0,$2000
    MOVEM.W D0,$A000
    MOVEM.L D0,(A0)
    MOVEM.L D0,-(A0)
    MOVEM.L D0/D1/D2/D3/A0-A7,-(A0)

    MOVEM.L D0-D3,(A0)
    MOVEM.L D0,$2000
    MOVEM.L D0,$A000
    MOVEM.L D0/A1/D2/A3/A0/A6,$2000
    MOVEM.L D0/D5/D4/D3/A0/A7,$A000

* MOVEM <ea>,<list> 
    MOVEM.W (A0),D0
    MOVEM.W (A0)+,D0

    MOVEM.W $2000,D0
    MOVEM.W $A000,D0

    MOVEM.L (A0),D0
    MOVEM.L (A0)+,D0
    MOVEM.L (A0)+,D0/A1-A3/D2-D4/A3/A0/A6
    MOVEM.L $2000,D0
    MOVEM.L $A000,D0
    MOVEM.L $2000,D0/A1-A3/D2-D4/A3/A0/A6
    MOVEM.L $A000,D0/A1/D2/A1-A4/A0/A6





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

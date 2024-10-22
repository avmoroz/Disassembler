*-----------------------------------------------------------------------------
* Title      : TestCode
* Description: Sample tests of our ops written within group.
*------------------------------------------------------------------------------
    ORG    $6000

;--------------------Updates----------------------
;MOVEM -> 05/30
;BCC   -> 05/30


;--------------------MOVE--------------------------

* MOVE.B <ea>,<ea>
    MOVE.B      D0,D1
    MOVE.B      (A1),D1
    MOVE.B      (A1)+,D1
    MOVE.B      -(A1),D1
    MOVE.B      $1000,D1
    MOVE.B      $8000,D1
    MOVE.B      #7,D1

  
    MOVE.B      D0,(A0)
    MOVE.B      (A1),(A0)
    MOVE.B      (A1)+,(A0)
    MOVE.B      -(A1),(A0)
    MOVE.B      $1000,(A0)
    MOVE.B      $8000,(A0)
    MOVE.B      #7,(A0)


    MOVE.B      D0,(A0)+
    MOVE.B      (A1),(A0)+
    MOVE.B      (A1)+,(A0)+
    MOVE.B      -(A1),(A0)+
    MOVE.B      $1000,(A0)+
    MOVE.B      $8000,(A0)+
    MOVE.B      #7,(A0)+

    
    MOVE.B      D0,-(A0)
    MOVE.B      (A1),-(A0)
    MOVE.B      (A1)+,-(A0)
    MOVE.B      -(A1),-(A0)
    MOVE.B      $1000,-(A0)
    MOVE.B      $8000,-(A0)
    MOVE.B      #7,-(A0)


    MOVE.B      D0,$1000
    MOVE.B      (A1),$1000
    MOVE.B      (A1)+,$1000
    MOVE.B      -(A1),$1000
    MOVE.B      $1000,$1000
    MOVE.B      $8000,$1000
    MOVE.B      #7,$1000
    

    MOVE.B      D0,$8000
    MOVE.B      (A1),$8000
    MOVE.B      (A1)+,$8000
    MOVE.B      -(A1),$8000
    MOVE.B      $1000,$8000
    MOVE.B      $8000,$8000
    MOVE.B      #7,$8000


* MOVE.W <ea>,<ea>

    MOVE.W      D0,D1
    MOVE.W      A0,D1
    MOVE.W      (A1),D1
    MOVE.W      (A1)+,D1
    MOVE.W      -(A1),D1
    MOVE.W      $1000,D1
    MOVE.W      $8000,D1
    MOVE.W      #7,D1

    MOVE.W      D0,(A0)
    MOVE.W      A0,(A0)
    MOVE.W      (A1),(A0)
    MOVE.W      (A1)+,(A0)
    MOVE.W      -(A1),(A0)
    MOVE.W      $1000,(A0)
    MOVE.W      $8000,(A0)
    MOVE.W      #7,(A0)

    MOVE.W      D0,(A0)+
    MOVE.W      A0,(A0)+
    MOVE.W      (A1),(A0)+
    MOVE.W      (A1)+,(A0)+
    MOVE.W      -(A1),(A0)+
    MOVE.W      $1000,(A0)+
    MOVE.W      $8000,(A0)+
    MOVE.W      #7,(A0)+
    
    MOVE.W      D0,-(A0)
    MOVE.W      A0,-(A0)
    MOVE.W      (A1),-(A0)
    MOVE.W      (A1)+,-(A0)
    MOVE.W      -(A1),-(A0)
    MOVE.W      $1000,-(A0)
    MOVE.W      $8000,-(A0)
    MOVE.W      #7,-(A0)

    MOVE.W      D0,$1000
    MOVE.W      A0,$1000
    MOVE.W      (A1),$1000
    MOVE.W      (A1)+,$1000
    MOVE.W      -(A1),$1000
    MOVE.W      $1000,$1000
    MOVE.W      $8000,$1000
    MOVE.W      #7,$1000
    
    MOVE.W      D0,$8000
    MOVE.W      A0,$8000
    MOVE.W      (A1),$8000
    MOVE.W      (A1)+,$8000
    MOVE.W      -(A1),$8000
    MOVE.W      $1000,$8000
    MOVE.W      $8000,$8000
    MOVE.W      #7,$8000


* MOVE.L <ea>,<ea>

    MOVE.L      D0,D1
    MOVE.L      A0,D1
    MOVE.L      (A1),D1
    MOVE.L      (A1)+,D1
    MOVE.L      -(A1),D1
    MOVE.L      $1000,D1
    MOVE.L      $8000,D1
    MOVE.L      #7,D1

    MOVE.L      D0,(A0)
    MOVE.L      A0,(A0)
    MOVE.L      (A1),(A0)
    MOVE.L      (A1)+,(A0)
    MOVE.L      -(A1),(A0)
    MOVE.L      $1000,(A0)
    MOVE.L      $8000,(A0)
    MOVE.L      #7,(A0)

    MOVE.L      D0,(A0)+
    MOVE.L      A0,(A0)+
    MOVE.L      (A1),(A0)+
    MOVE.L      (A1)+,(A0)+
    MOVE.L      -(A1),(A0)+
    MOVE.L      $1000,(A0)+
    MOVE.L      $8000,(A0)+
    MOVE.L      #7,(A0)+

    MOVE.L      D0,-(A0)
    MOVE.L      A0,-(A0)
    MOVE.L      (A1),-(A0)
    MOVE.L      (A1)+,-(A0)
    MOVE.L      -(A1),-(A0)
    MOVE.L      $1000,-(A0)
    MOVE.L      $8000,-(A0)
    MOVE.L      #7,-(A0)
    
    MOVE.L      D0,$1000
    MOVE.L      A0,$1000
    MOVE.L      (A1),$1000
    MOVE.L      (A1)+,$1000
    MOVE.L      -(A1),$1000
    MOVE.L      $1000,$1000
    MOVE.L      $8000,$1000
    MOVE.L      #7,$1000
    
    MOVE.L      D0,$8000
    MOVE.L      A0,$8000
    MOVE.L      (A1),$8000
    MOVE.L      (A1)+,$8000
    MOVE.L      -(A1),$8000
    MOVE.L      $1000,$8000
    MOVE.L      $8000,$8000
    MOVE.L      #7,$8000


;--------------------MOVEA--------------------------

* MOVEA.L <ea>,An
    MOVEA.L     D1,A1
    MOVEA.L     A0,A1
    MOVEA.L     (A0),A1
    MOVEA.L     (A0)+,A1
    MOVEA.L     -(A0),A1
    MOVEA.L     $1000,A1
    MOVEA.L     $8000,A1
    MOVEA.L     #7,A1


* MOVEA.W <ea>,An
    MOVEA.W     D1,A1
    MOVEA.W     A0,A1
    MOVEA.W     (A0),A1
    MOVEA.W     (A0)+,A1
    MOVEA.W     -(A0),A1
    MOVEA.W     $1000,A1
    MOVEA.W     $8000,A1
    MOVEA.W     #7,A1


;-------------------MOVEQ----------------------------


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


;-------------------MOVEM----------------------------

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



;---------------------OR---------------------------

* OR.B <ea>,Dn
    CLR     D0
    CLR     D1
    MOVE.B  #%1011, D0
    MOVE.B  #%0100,D1
    
    OR.B    D0,D1
    OR.B    (A1),D0
    OR.B    (A1)+,D0
    OR.B    -(A1),D0
    OR.B    $1000,D0
    OR.B    $8000,D0
    OR.B    #127,D0
    OR.B    #-128,D0
    OR.B    #-1,D0


* OR.W <ea>,Dn
    OR.W    D0,D1
    OR.W    (A1),D0
    OR.W    (A1)+,D0
    OR.W    -(A1),D0
    OR.W    $1000,D0
    OR.W    $8000,D0
    OR.W    #$FFFF,D0
    OR.W    #$FF,D0
    OR.W    #$0,D0
    OR.W    #$8000,D0
    

* OR.L <ea>,Dn    
    OR.L    D0,D1
    OR.L    (A1),D0
    OR.L    (A1)+,D0
    OR.L    -(A1),D0
    OR.L    $1000,D0
    OR.L    $8000,D0
    OR.L    #$FFFFFFFF,D0
    OR.L    #$0,D0
    OR.L    #$9000,D0
    

* OR.B Dn,<ea>
    OR.B    D3,(A1)
    OR.B    D3,(A1)+
    OR.B    D3,-(A1)
    OR.B    D3,$1000
    OR.B    D3,$8000
    
* OR.W Dn,<ea>
    OR.W    D3,(A1)
    OR.W    D3,(A1)+
    OR.W    D3,-(A1)
    OR.W    D3,$1000
    OR.W    D3,$8000

* OR.L Dn,<ea>    
    OR.L    D3,(A1)
    OR.L    D3,(A1)+
    OR.L    D3,-(A1)
    OR.L    D3,$1000
    OR.L    D3,$8000


;----------------AND-----------------------


* AND.B <ea>,Dn
    AND.B   D0,D1
    AND.B   (A1),D1
    AND.B   (A1)+,D1
    AND.B   -(A1),D1
    AND.B   $1000,D1
    AND.B   $8000,D1
    AND.B   #$FF,D1
    AND.B   #$0,D1

* AND.W <ea>,Dn
    AND.W   D0,D1
    AND.W   (A1),D1
    AND.W   (A1)+,D1
    AND.W   -(A1),D1
    AND.W   $1000,D1
    AND.W   $8000,D1
    AND.W   #$FFFF,D1
    AND.W   #$0,D1
    AND.W   #$10,D1

* AND.L <ea>,Dn
    AND.L   D0,D1
    AND.L   (A1),D1
    AND.L   (A1)+,D1
    AND.L   -(A1),D1
    AND.L   $1000,D1
    AND.L   $8000,D1
    AND.L   #$FFFFFFFF,D1
    AND.L   #$10,D1
    AND.L   #$0,D1

* AND.B Dn,<ea>
    AND.B   D1,(A1)
    AND.B   D1,(A1)+
    AND.B   D1,-(A1)
    AND.B   D1,$1000
    AND.B   D1,$8000


* AND.W Dn,<ea>
    AND.W   D1,(A1)
    AND.W   D1,(A1)+
    AND.W   D1,-(A1)
    AND.W   D1,$1000
    AND.W   D1,$8000


* AND.L Dn,<ea>
    AND.L   D1,(A1)
    AND.L   D1,(A1)+
    AND.L   D1,-(A1)
    AND.L   D1,$1000
    AND.L   D1,$8000


;----------------------ADD-----------------

* ADD <ea>,Dn
* ADD.B <ea>,Dn
    ADD.B   D1,D0
    ADD.B   (A3),D0
    ADD.B   (A3)+,D0
    ADD.B   -(A3),D0
    ADD.B   $1000,D0
    ADD.B   $8000,D0
    ADD.B   #$FF,D0
    ADD.B   #$0,D0


* ADD.W <ea>,Dn
    ADD.W   D1,D0
    ADD.W   A3,D0
    ADD.W   (A3),D0
    ADD.W   (A3)+,D0
    ADD.W   -(A3),D0
    ADD.W   $1000,D0
    ADD.W   $8000,D0
    ADD.W   #$FF,D0
    ADD.W   #$0,D0
    ADD.W   #$FFFF,D0


* ADD.L <ea>,Dn
    ADD.L   D1,D0
    ADD.L   A3,D0
    ADD.L   (A3),D0
    ADD.L   (A3)+,D0
    ADD.L   -(A3),D0
    ADD.L   $1000,D0
    ADD.L   $8000,D0
    ADD.L   #$FF,D0
    ADD.L   #$0,D0
    ADD.L   #$FFFFFFFF,D0
    ADD.L   #$100,D0
    
    

* ADD Dn,<ea>
* ADD.B Dn,<ea>
    ADD.B   D0,(A3)
    ADD.B   D0,(A3)+
    ADD.B   D0,-(A3)
    ADD.B   D0,$1000
    ADD.B   D0,$8000     


* ADD.W Dn,<ea>
    ADD.W   D0,(A3)
    ADD.W   D0,(A3)+
    ADD.W   D0,-(A3)
    ADD.W   D0,$1000
    ADD.W   D0,$8000     

* ADD.L Dn,<ea>
    ADD.L   D0,(A3)
    ADD.L   D0,(A3)+
    ADD.L   D0,-(A3)
    ADD.L   D0,$1000
    ADD.L   D0,$8000   


;-----------------------ADDA---------------

* ADDA <ea>,An
* ADDA.W <ea>,An
    ADDA.W  D5,A3
    ADDA.W  A7,A3
    ADDA.W  (A7),A3
    ADDA.W  (A7)+,A3
    ADDA.W  -(A7),A3
    ADDA.W  $1000,A3
    ADDA.W  $8000,A3
    ADDA.W  #$10,A3
    ADDA.W  #$FFFF,A3
    ADDA.W  #$0,A3


* ADDA.L <ea>,An
    ADDA.L  D5,A3
    ADDA.L  A7,A3
    ADDA.L  (A7),A3
    ADDA.L  (A7)+,A3
    ADDA.L  -(A7),A3
    ADDA.L  $1000,A3
    ADDA.L  $8000,A3
    ADDA.L  #$10,A3
    ADDA.L  #$FFFFFFFF,A3
    ADDA.L  #$0,A3

;-----------------------ADDQ----------------

* ADDQ.W #<data>,<ea>
    ADDQ.B  #1,D0
    ADDQ.B  #2,D0
    ADDQ.B  #3,D0
    ADDQ.B  #4,D0
    ADDQ.B  #5,D0
    ADDQ.B  #6,D0
    ADDQ.B  #7,D0
    ADDQ.B  #8,D0

    ADDQ.B  #1,(A1)
    ADDQ.B  #1,(A1)+
    ADDQ.B  #1,-(A1)
    ADDQ.B  #1,$1000
    ADDQ.B  #1,$8000

    
    ADDQ.W  #1,D0
    ADDQ.W  #8,D0
    ADDQ.W  #1,A1
    ADDQ.W  #1,(A1)
    ADDQ.W  #1,(A1)+
    ADDQ.W  #1,-(A1)
    ADDQ.W  #1,$1000
    ADDQ.W  #1,$8000
    

    ADDQ.L  #1,D0
    ADDQ.L  #8,D0
    ADDQ.L  #1,A1
    ADDQ.L  #1,(A1)
    ADDQ.L  #1,(A1)+
    ADDQ.L  #1,-(A1)
    ADDQ.L  #1,$1000
    ADDQ.L  #1,$8000



;-------------------------SUB--------------


* SUB.B <ea>,Dn
    SUB.B   D1,D0
    SUB.B   (A1),D0
    SUB.B   (A1)+,D0
    SUB.B   -(A1),D0
    SUB.B   $1000,D0
    SUB.B   $8000,D0
    SUB.B   #127,D0
    SUB.B   #-128,D0
    SUB.B   #0,D0
    
* SUB.W <ea>,Dn
    SUB.W   D1,D0
    SUB.W   A1,D0
    SUB.W   (A1),D0
    SUB.W   (A1)+,D0
    SUB.W   -(A1),D0
    SUB.W   $1000,D0
    SUB.W   $8000,D0
    SUB.W   #$FFFF,D0
    SUB.W   #$0,D0
    SUB.W   #$80,D0

* SUB.L <ea>,Dn
    SUB.L   D1,D0
    SUB.L   A1,D0
    SUB.L   (A1),D0
    SUB.L   (A1)+,D0
    SUB.L   -(A1),D0
    SUB.L   $1000,D0
    SUB.L   $8000,D0
    SUB.L   #$FFFFFFFF,D0
    SUB.L   #$0,D0
    SUB.L   #$80,D0

**** SUB.B Dn,<ea>

    SUB.B   D0,(A1)
    SUB.B   D0,(A1)+
    SUB.B   D0,-(A1)
    SUB.B   D0,$1000
    SUB.B   D0,$8000
    

* SUB.W Dn,<ea>
    SUB.W   D0,(A1)
    SUB.W   D0,(A1)+
    SUB.W   D0,-(A1)
    SUB.W   D0,$1000
    SUB.W   D0,$8000
    

* SUB.L Dn,<ea>
    SUB.L   D0,(A1)
    SUB.L   D0,(A1)+
    SUB.L   D0,-(A1)
    SUB.L   D0,$1000
    SUB.L   D0,$8000

;---------------------DIVU--------------------

* DIVU.W
    MOVE.W  #32,D0
    MOVE.W  #2,D1
    DIVU.W  D1,D0

** might need to populate A1 with ints

    MOVE.W  #2,D0
    DIVU.W  (A1),D0

    MOVE.W  #2,D0
    DIVU.W  (A1)+,D0

    MOVE.W  #2,D0
    DIVU.W  -(A1),D0

    MOVE.W  #2,D0
    DIVU.W  $1000,D0

    MOVE.W  #2,D0
    DIVU.W  $8000,D0

    MOVE.W  #2,D0
    DIVU.W  #10,D0


;----------------------MULS--------------------


* MULS <ea>,Dn

    MULS.W  D1,D0
    MULS.W  (A1),D0
    MULS.W  (A1)+,D0
    MULS.W  -(A1),D0
    MULS.W  $1000,D0
    MULS.W  $8000,D0
    MULS.W  #$FFFF,D0
    MULS.W  #$0,D0


;----------------------LSL-----------------------



* LSL.W <ea> 

    LSL.B   D0,D1
    LSL.B   D7,D1
    LSL.B   #8,D1
    LSL.B   #1,D1
    

    LSL.W   D0,D1
    LSL.W   D7,D1
    LSL.W   #$8,D1
    LSL.W   #1,D1
    LSL.W   $8000
    LSL.W   $1000
    LSL.W   (A1)
    LSL.W   (A1)+
    LSL.W   -(A1)
    
    LSL.L   D0,D1
    LSL.L   D7,D1
    LSL.L   #8,D1
    LSL.L   #1,D1


;-----------------------LSR-------------------------


* LSR.W <ea> 
  
    LSR.B   D0,D1
    LSR.B   D7,D1
    LSR.B   #8,D1
    LSR.B   #1,D1


    LSR.W   D0,D1
    LSR.W   D7,D1
    LSR.W   #$8,D1
    LSR.W   #1,D1
    LSR.W   $8000
    LSR.W   $1000
    LSR.W   (A1)
    LSR.W   (A1)+
    LSR.W   -(A1)
    
    LSR.L   D0,D1
    LSR.L   D7,D1
    LSR.L   #8,D1
    LSR.L   #1,D1

    
;------------------------ASR----------------------------


* ASR.W <ea>
  
    ASR.B   D0,D1
    ASR.B   D7,D1
    ASR.B   #8,D1
    ASR.B   #1,D1
    

    ASR.W   D0,D1
    ASR.W   D7,D1
    ASR.W   #$8,D1
    ASR.W   #1,D1
    ASR.W   $8000
    ASR.W   $1000
    ASR.W   (A1)
    ASR.W   (A1)+
    ASR.W   -(A1)
    
    ASR.L   D0,D1
    ASR.L   D7,D1
    ASR.L   #8,D1
    ASR.L   #1,D1    


;------------------------ASL--------------------------


* ASL.W <ea>  
    ASL.B   D0,D1
    ASL.B   D7,D1
    ASL.B   #8,D1
    ASL.B   #1,D1
    

    ASL.W   D0,D1
    ASL.W   D7,D1
    ASL.W   #8,D1
    ASL.W   #1,D1
    ASL.W   $8000
    ASL.W   $1000
    ASL.W   (A1)
    ASL.W   (A1)+
    ASL.W   -(A1)

    ASL.L   D0,D1
    ASL.L   D7,D1
    ASL.L   #8,D1
    ASL.L   #1,D1


;-------------------------Bcc----------------------------

test1      EQU     $700
test2      EQU     $1000
test3      EQU     $2000

* 
* program for test code here
*
    BCC     test
    BCC     test1
    BCC     test2
    BCC     test3
    BEQ     test
    BGT     test
    BNE     test
    BRA     test

test    


;-------------------------LEA----------------------------



;-------------------------NOT----------------------------



;-------------------------JRS----------------------------



;-------------------------RTS----------------------------



;-------------------------NOP----------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

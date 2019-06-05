*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $6000
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

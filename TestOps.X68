*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $6000
* MOVE.B <ea>,<ea>
*--------------------MOVEA--------------------------
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
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

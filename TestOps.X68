*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $6000
    
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
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

// See sphrflak.pov for info

#if (SFLevel = 0)
    sphere { SFCen,SFRad texture { pigment { color rgb SFCen + <0.5,0.5,0.5> }
            finish { reflection 0.3 } } }
#else
    sphere { SFCen,SFRad texture { pigment { color rgb SFCen + <0.5,0.5,0.5> }
            finish { reflection 0.3 } } }

    // Change values for this level/instance of recursion
    #declare SFLevel = SFLevel - 1
    #declare SFRad = SFRad / 3
    #declare SFRight = vaxis_rotate(SFRight,SFUp,SFRot)

    #declare tmp = SFUp
    #declare SFUp = vaxis_rotate(SFRight,SFUp,60)
    #declare SFRight = tmp
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare SFUp = vaxis_rotate(SFUp,SFRight,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare SFUp = vaxis_rotate(SFUp,SFRight,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare SFUp = vaxis_rotate(SFUp,SFRight,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare SFUp = vaxis_rotate(SFUp,SFRight,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare SFUp = vaxis_rotate(SFUp,SFRight,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp

    #declare tmp = SFRight
    #declare SFRight = SFUp
    #declare SFUp = tmp

    #declare tmp = SFUp
    #declare SFUp = vaxis_rotate(SFRight,SFUp,30)
    #declare Orth = vcross(SFUp,tmp)
    #declare SFRight = vaxis_rotate(tmp,Orth,60)
    #declare SFUp = vaxis_rotate(SFUp,Orth,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp
    #declare Orth = vcross(SFUp,SFRight)
    #declare tmp = SFRight
    #declare SFRight = vaxis_rotate(SFUp,Orth,-60)
    #declare SFUp = vaxis_rotate(tmp,Orth,-60)

    #declare tmp = SFUp
    #declare SFUp = vaxis_rotate(SFRight,SFUp,120)
    #declare Orth = vcross(SFUp,tmp)
    #declare SFRight = vaxis_rotate(tmp,Orth,60)
    #declare SFUp = vaxis_rotate(SFUp,Orth,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp
    #declare Orth = vcross(SFUp,SFRight)
    #declare tmp = SFRight
    #declare SFRight = vaxis_rotate(SFUp,Orth,-60)
    #declare SFUp = vaxis_rotate(tmp,Orth,-60)

    #declare tmp = SFUp
    #declare SFUp = vaxis_rotate(SFRight,SFUp,120)
    #declare Orth = vcross(SFUp,tmp)
    #declare SFRight = vaxis_rotate(tmp,Orth,60)
    #declare SFUp = vaxis_rotate(SFUp,Orth,60)
    #declare SFCen = SFCen + SFRad * 4 * SFUp
    #include "sphrflak.inc"
    #declare SFCen = SFCen - SFRad * 4 * SFUp
    #declare Orth = vcross(SFUp,SFRight)
    #declare tmp = SFRight
    #declare SFRight = vaxis_rotate(SFUp,Orth,-60)
    #declare SFUp = vaxis_rotate(tmp,Orth,-60)

    #declare SFRight = vaxis_rotate(SFRight,SFUp,90)

    // Restore original "parameter" values
    #declare SFRight = vaxis_rotate(SFRight,SFUp,-SFRot)
    #declare SFRad = SFRad * 3
    #declare SFLevel = SFLevel + 1
#end

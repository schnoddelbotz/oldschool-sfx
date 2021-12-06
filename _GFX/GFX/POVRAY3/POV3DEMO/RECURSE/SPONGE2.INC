// See comments in sponge2.pov

#if (SpongeLevel = 0)
    box { <-0.5,-0.5,-0.5>,<0.5,0.5,0.5>
        scale SpongeRad
        translate SpongeCen
        texture { pigment { color rgb SpongeCen + <0.5,0.5,0.5> } }
    }
    #declare SpongeCounter = SpongeCounter + 1
#else if (SpongeLevel = 1)
    difference {
        box { <-0.5,-0.5,-0.5>,<0.5,0.5,0.5> }
        box { <-0.51,-0.166667,-0.166667>,<0.51,0.166667,0.166667> }
        box { <-0.166667,-0.51,-0.166667>,<0.166667,0.51,0.166667> }
        box { <-0.166667,-0.166667,-0.51>,<0.166667,0.166667,0.51> }
        scale SpongeRad
        translate SpongeCen
        texture { pigment { color rgb SpongeCen + <0.5,0.5,0.5> } }
    }
    #declare SpongeCounter = SpongeCounter + 4
#else
    // Recursively draw 20 smaller sponges.  Can't use loops here since
    // the indices would be changed by the recursive calls.

    #declare SpongeLevel = SpongeLevel - 1
    #declare SpongeRad = SpongeRad / 3

    // Top layer

    #declare SpongeCen = SpongeCen + <-SpongeRad,-SpongeRad,-SpongeRad>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge2.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"

    // Middle layer

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,-SpongeRad * 2,SpongeRad>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge2.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad * 2,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge2.inc"

    // Bottom layer

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,-SpongeRad * 2,SpongeRad>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge2.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge2.inc"

    // Restore to original calling values
    #declare SpongeCen = SpongeCen + <-SpongeRad,-SpongeRad,-SpongeRad>
    #declare SpongeRad = SpongeRad * 3
    #declare SpongeLevel = SpongeLevel + 1
#end
#end

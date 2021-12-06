// See comments in sponge1.pov

#if (SpongeLevel = 0)
    object { SpongeObj
        scale SpongeRad * 0.5
        translate SpongeCen
        texture { pigment { color rgb SpongeCen + <0.5,0.5,0.5> } }
    }
    #declare SpongeCounter = SpongeCounter + 1
#else
    // Recursively draw 20 smaller sponges.  Can't use loops here since
    // the indices would be changed by the recursive calls.

    #declare SpongeLevel = SpongeLevel - 1
    #declare SpongeRad = SpongeRad / 3

    // Top layer

    #declare SpongeCen = SpongeCen + <-SpongeRad,-SpongeRad,-SpongeRad>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge1.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"

    // Middle layer

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,-SpongeRad * 2,SpongeRad>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge1.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad * 2,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge1.inc"

    // Bottom layer

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,-SpongeRad * 2,SpongeRad>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad * 2,0,0>
    #include "sponge1.inc"

    #declare SpongeCen = SpongeCen + <-SpongeRad * 2,SpongeRad,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"
    #declare SpongeCen = SpongeCen + <SpongeRad,0,0>
    #include "sponge1.inc"

    // Restore to original calling values
    #declare SpongeCen = SpongeCen + <-SpongeRad,-SpongeRad,-SpongeRad>
    #declare SpongeRad = SpongeRad * 3
    #declare SpongeLevel = SpongeLevel + 1
#end

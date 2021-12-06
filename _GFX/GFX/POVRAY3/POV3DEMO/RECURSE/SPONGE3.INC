// See comments in sponge3.pov

#if (SpongeLevel > 0)

    #declare SpongeDim = SpongeDim / 6

    // Punch holes through center of current box, in each of three dimensions

    box { <-1.1,SpongeX - SpongeDim,SpongeY - SpongeDim>,
        <1.1,SpongeX + SpongeDim,SpongeY + SpongeDim>
    }
    box { <SpongeX - SpongeDim,-1.1,SpongeY - SpongeDim>,
        <SpongeX + SpongeDim,1.1,SpongeY + SpongeDim>
    }
    box { <SpongeX - SpongeDim,SpongeY - SpongeDim,-1.1>,
        <SpongeX + SpongeDim,SpongeY + SpongeDim,1.1>
    }
    #declare SpongeCounter = SpongeCounter + 3

    #declare SpongeDim = SpongeDim * 2

    #if (SpongeLevel > 1)

        // Recurse on the eight non-center areas of a 3x3 grid in the plane.
        // Can't use loops here since the indices would be changed by the
        // recursive calls.

        #declare SpongeLevel = SpongeLevel - 1

        #declare SpongeX = SpongeX - SpongeDim
        #declare SpongeY = SpongeY - SpongeDim
        #include "sponge3.inc"
        #declare SpongeX = SpongeX + SpongeDim
        #include "sponge3.inc"
        #declare SpongeX = SpongeX + SpongeDim
        #include "sponge3.inc"

        #declare SpongeX = SpongeX - SpongeDim * 2
        #declare SpongeY = SpongeY + SpongeDim
        #include "sponge3.inc"
        #declare SpongeX = SpongeX + SpongeDim * 2
        #include "sponge3.inc"

        #declare SpongeX = SpongeX - SpongeDim * 2
        #declare SpongeY = SpongeY + SpongeDim
        #include "sponge3.inc"
        #declare SpongeX = SpongeX + SpongeDim
        #include "sponge3.inc"
        #declare SpongeX = SpongeX + SpongeDim
        #include "sponge3.inc"

        // Restore to original calling values
        #declare SpongeX = SpongeX - SpongeDim
        #declare SpongeY = SpongeY - SpongeDim
        #declare SpongeLevel = SpongeLevel + 1
    #end
    #declare SpongeDim = SpongeDim * 3
#end

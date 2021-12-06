// Persistence Of Vision raytracer version 3.0 sample file.
// File by Steve Demlow
// Recursive Menger Sponge demo #2

// Recursively defines a Menger sponge.  The recursion is done by recursively
// including sponge2.inc.  Since there is no notion of private data, the state
// of all data must be restored to its original calling value when a level of
// recursion is finished.
//
// This implementation treats SpongeLevel = 1 as a special case to avoid
// a level of recursive calls at the bottom of the recursion tree, which
// saves a lot of parse time.  It also substitutes a difference composed of
// four boxes in place of the 20 boxes that are used in sponge1.inc.  This
// method is faster but less flexible (you can't specify your own object).

#version 3.0
global_settings { assumed_gamma 2.2 }
background { color red 0 green 0 blue 1 }

camera {
    location <1.75,0.9,1>
    direction <0,1.5,0>
    up <0,1,0>
    look_at <0,-0.1,0>
} // camera

light_source { <6, 2, 3> color rgb 0.9 }

// Define "parameters" for the Menger sponge "function"

#declare SpongeTxt = texture { pigment { color green 1.0 } }
#declare SpongeCen = <0,0,0>
#declare SpongeRad = 4.5 / 4.0  // Determined by XYZ->RGB mapping in sponge.inc
#declare SpongeLevel = 2 // Controls recursion depth, & hence sponge complexity
#declare SpongeCounter = 0

// Make top-level "call" to recursive sponge generator

#include "sponge2.inc"

#debug concat("\nRendering sponge with ", str(SpongeCounter,1,0),
    " primitives...\n")

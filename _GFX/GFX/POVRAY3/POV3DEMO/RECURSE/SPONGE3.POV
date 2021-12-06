// Persistence Of Vision raytracer version 3.0 sample file.
// File by Steve Demlow
// Recursive Menger Sponge demo #3

// Recursively defines a Menger sponge.  The recursion is done by recursively
// including sponge3.inc.  Since there is no notion of private data, the state
// of all data must be restored to its original calling value when a level of
// recursion is finished.
//
// This implementation starts with a single cube and differences (subtracts)
// away the "holes" of the sponge.  It recurses over a 2D area and uses the
// location variables (X and Y) as (X,Y), (X,Z), and (Y,Z) pairs to position
// the holes that are punched along each axis of the sponge.  This parses
// faster than sponge1.inc and sponge2.inc but renders slower since the
// automatic bounding doesn't work nearly as well on the larger primitives
// used here.

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
#declare SpongeX = 0
#declare SpongeY = 0
#declare SpongeDim = 1.0
#declare SpongeLevel = 3 // Controls recursion depth, & hence sponge complexity
#declare SpongeCounter = 0

// Make top-level "call" to recursive sponge generator

difference {
    box { -SpongeDim * 0.5,SpongeDim * 0.5 }
#   include "sponge3.inc"
    texture { SpongeTxt }
}

#debug concat("\nRendering sponge with ", str(SpongeCounter,1,0),
    " primitives...\n")

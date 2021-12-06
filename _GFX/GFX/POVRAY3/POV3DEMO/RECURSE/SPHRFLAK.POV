// Recursively defines a sphereflake of arbitrary complexity.
// Change the SFLevel value below to control the complexity of the sphereflake.
//
// This scene can be animated, by e.g. using '+kff29' to generate 30 frames.
// The animation consists of the child sphereflakes rotating around the
// axes defined by their center point and their parent's center point.
//
// The recursion is done by recursively including sphrflak.inc.
// Since there is no notion of private data, the state of all data must
// be restored to its original calling value when a level of recursion
// is finished.
//
// "Parameters":
//    SFLevel - level of recursion; recurses/decrements until 0 is reached
//    SFCen - point that current sphereflake level is centered at
//    SFRad - radius of current parent sphere
//    SFUp - unit vector around which the child spheres are oriented
//    SFRight - unit vector perpendicular to SFUp
//    SFRot - rotational value for animations (in degrees)

background { color red 0 green 0 blue 1 }

camera {
    location <3.5,3,2>
    location <1.3,1.1,0.6>
    direction <0,1.5,0>
    up <0,1,0>
    look_at <0,0.1,0>
} // camera

light_source { <6, 5, 3> color rgb 0.9 }

// Define "parameters" for the sphereflake "function"

#declare SFCen = <0,0,0>
#declare SFUp = <0,1,0>
#declare SFRight = <1,0,0>
#declare SFRad = 1 / 3
#declare SFRot = clock * 360       // Animate sphereflake at each level!
#declare SFLevel = 2     // Controls recursion depth, & hence model complexity

// Make top-level "call" to recursive sphereflake generator

#include "sphrflak.inc"

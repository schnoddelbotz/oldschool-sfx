// Persistence Of Vision Raytracer version 3.0 sample file.
// GRIDLOOP.POV
// Demonstrates nested looping (for/next loop, the hard way)

#version 3.0
global_settings { assumed_gamma 2.2 }
#include "colors.inc"
#include "textures.inc"

camera {
   location <0, 0, -20>
   up <0,1,0>
   direction z
   right x* 4/3
   look_at <0, 0, 0>
}

light_source { <0, 35, -25> White }

#declare XSIZE = 10
#declare YSIZE = 10

#declare I = -YSIZE /2                          // initialize  I
#while (I <= YSIZE /2)                          // for I =
    #declare J= -XSIZE /2                       // initialize J
    #while (J <= XSIZE /2)                      // for J =
        sphere { <I,J,0>, 0.5 pigment { White } }
        #declare J=J+1                          // next J
    #end
    #declare I=I+1                              // next I
#end


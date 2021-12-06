// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0.0, 0.0, 40.0>
   direction <0, 0, 1>
   up <0.0, 1.0, 0.0>
   right <1.0, 0.0, 0.0>
   look_at <0.0,0.0, 0.0>
}

light_source{ <10,10,30>
   colour Red
   spotlight
   point_at <0,0,0>
   radius 1
   falloff 15
}
light_source{ <-5,0,30>
   colour Green
   spotlight
   point_at <3,0,0>
   radius 1
   falloff 15
}
light_source{ <5,-10,30>
   colour Blue
   spotlight
   point_at <0,0,0>
   radius 1
   falloff 15
}

#declare Textur =
texture {
   pigment {colour Clear}
   finish {refraction 1 }
   halo {
      constant
      max_value 1.0
      exponent 0.5
      dust
      dust_type 2
      colour_map {
         [0.0 color rgbf <1.0,0.0,0.0,0.0> ]
         [1.0 color rgbf <1.0,0.0,0.0,0.6> ]
      }
   }
}


object{ Cube hollow texture{ Textur } scale <30,30,30> }


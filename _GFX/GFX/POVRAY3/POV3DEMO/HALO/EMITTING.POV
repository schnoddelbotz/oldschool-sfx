// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0, 0, -60>
   look_at <0, 0, 0>
   angle 5.5
}

light_source{<40,40,-40> colour White}

#declare Textur =
texture {
   pigment {colour Clear}
   halo {
      linear
      max_value 1.0
      spherical_mapping
      emitting
      turbulence 0.5
      colour_map {
         [0 color rgbt <1,0,0,1>]
         [1 color rgbt <1,1,0,0>]
      }
      samples 10
   }
}

object{Sphere hollow texture{ Textur } scale 1}


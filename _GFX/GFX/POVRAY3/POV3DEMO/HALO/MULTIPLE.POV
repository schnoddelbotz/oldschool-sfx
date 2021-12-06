// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0, 0, -40>
   look_at <0, 0, 0>
}

light_source { <40, 40, -40> colour White }

#declare Texture =
texture {
   pigment {colour Clear}
   halo {
      emitting
      linear
      cylindrical_mapping
      max_value 1.0

      colour_map {
         [ 0 color rgbt<1, 0, 0, 1.0> ]
         [ 1 color rgbt<1, 1, 0, 0.8> ]
      }

      scale 0.7
      translate -0.5*x
   }
   halo {
      emitting
      linear
      spherical_mapping
      max_value 1.0
      colour_map {
         [ 0 color rgbt<1, 0, 0, 1.0> ]
         [ 1 color rgbt<1, 1, 0, 0.8> ]
      }
      scale 0.7
      translate 0.3*x
   }
}


object {
   Cube
   hollow
   texture { Texture }
   scale 10
}



// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location <0, 10, -100>
   look_at <0, 0, 0>
   angle 3.3
}

light_source{ <-50, 50, -50> colour White } 

sphere { 0, 1
  hollow
  texture {
    pigment { colour Clear }
    halo {
    cubic
      max_value 3
      spherical_mapping
      glowing
      colour_map {
        [0 color rgbt <1, 0, 0, 1> ]
        [1 color rgbt <1, 1, 0, 0> ]
      }
      turbulence 1.6
      samples 50
      aa_level 4
      aa_threshold 0.2
    }
  }
} 


// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  location <15, 0, -100>
  look_at <0, 0, 0>
}

light_source{<-20,100,-100> colour White}

background { color SkyBlue }

sphere { 0, 1
  hollow
  texture {
    pigment { colour Clear }
    halo {
      linear
      max_value 1
      spherical_mapping
      attenuating
      turbulence 0.5
      colour_map {
        [0.0 color rgbt <1, 1, 1, 1>] 
        [1.0 color rgbt <1, 1, 1, 0>] 
      } 
      scale 0.7
      samples 10
      aa_level 0
      aa_threshold 0.3
    }
  }
  scale <50,20,20>
} 



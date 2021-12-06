// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <20.0, 10.0, -100.0>
   direction <0, 0, 1>	
   up <0.0, 1.0, 0.0>
   right <1.0, 0.0, 0.0>
   look_at <0.0,0.0, 0.0>
}

light_source {
  <-50, -30, -40>
  colour Red
  spotlight
  point_at <0, 0, 0>
  radius 20
  falloff 25
}

light_source { 
  <30, -50, -20>
  colour Green
  spotlight
  point_at <0, 0, 0>
  radius 20
  falloff 25
}

light_source { 
  <-10, 40, 30>
  colour Blue
  spotlight
  point_at <0, 0, 0>
  radius 20
  falloff 25
}

#declare Texture = texture {
  pigment { colour Clear }
  halo {
    dust
    dust_type 2
    constant
    spherical_mapping
    max_value 1.0
                
    colour_map {
      [ 0 color rgbt <1, 1, 1, 1.0> ]
      [ 1 color rgbt <1, 1, 1, 0.8> ]
    } 

    samples 100
    aa_level 5
    aa_threshold 0.1
    jitter 0.8
  }  
} 


object { Cube texture { Texture } scale 52 hollow }

object { Sphere texture { Red_Marble } scale 15 hollow }


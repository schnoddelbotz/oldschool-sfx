// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0.0, 0.0, -80.0>
   direction <0.0, 0.0, 1.0>
   up <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
}

sphere { <0.0, 0.0, 0.0>, 30.0
   pigment {
      bozo
      turbulence 0.5
      colour_map {
         [0.0 0.7  colour red 0.0 green 0.3 blue 0.8
                   colour red 0.0 green 0.3 blue 0.8]
         [0.7 1.0  colour red 0.0 green 0.7 blue 0.0
                   colour red 0.6 green 0.7 blue 0.0]
         [1.0 1.01 colour red 0.6 green 0.7 blue 0.0
                   colour red 0.7 green 0.3 blue 0.3]
      }
      scale 10.0
      translate 100*x
   }
   finish {
      crand 0.08
      ambient 0.0
      diffuse 1.0
   }
}

sphere { <0.0, 0.0, 0.0>, 30.2
   pigment {
      bozo
      turbulence 1.0
      colour_map {
         [0.0 0.4 colour red 1.0 green 1.0 blue 1.0 filter 1.0
                  colour red 1.0 green 1.0 blue 1.0 filter 1.0]
         [0.4 0.9 colour red 1.0 green 1.0 blue 1.0 filter 1.0
                  colour red 1.0 green 1.0 blue 1.0]
         [0.9 1.0 colour red 1.0 green 1.0 blue 1.0
                  colour red 1.0 green 1.0 blue 1.0]
      }
      scale <12.0, 3.0, 12.0>
      rotate <30.0, 0.0, -45.0>
   }
   finish {
      ambient 0.0
      diffuse 1.0
   }
}

plane { z, 80.0
   //  pigment {
   //      image_map { gif "stars.gif" /*640x400*/ }
   //      scale <100.0, 100.0, 100.0>
   //  }
   pigment { Black }
   finish {
      ambient 1.0
      diffuse 0.0
   }
   hollow
}

light_source { <-200.0, 200.0, -200.0> colour White }

#declare Halo = texture {
   pigment { colour Clear }
   halo {
      emitting
      spherical_mapping
      linear
      turbulence 0.5
      colour_map {
         [ 0 color rgbt <1, 0, 0, 1> ]
         [ 1 color rgbt <1, 1, 0, 0> ]
      }
      samples 10
   }
}

sphere { 0, 1 hollow texture { Halo } scale 32 }



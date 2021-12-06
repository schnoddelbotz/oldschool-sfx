// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// Modifications by David Cross (crossd@rpi.edu)

#version 3.0
// I prefer to do gamma correct after rendering
// global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0.0, 0.0, -80.0>
   direction <0.0, 0.0, 1.0>
   up <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
}

// The halo is applied twice for realism, so it must be defined earlier
#declare Halo = texture {
   pigment { colour Clear }
   halo {
      dust
      spherical_mapping
      linear
      turbulence 0.5
      colour_map {
         [ 0 color rgbft <0.75, 0.94, 1.00, 1.0, 0> ]
         [ 1 color rgbft <0.75, 0.94, 1.00, 1.0, 0> ]
      }
      samples 10
   }
}

//I took the colors from fractint's "topo.map" file
sphere { <0.0, 0.0, 0.0>, 30.0          //Biosphere
   pigment {
      bozo
      turbulence 0.5
      colour_map {
         [0.00 0.55  colour red 0.00 green 0.00 blue 0.65
                     colour red 0.32 green 0.69 blue 0.97]
         [0.55 0.99  colour red 0.16 green 0.49 blue 0.00
                     colour red 0.85 green 0.45 blue 0.03]
         [0.99 1.00  colour red 0.99 green 0.99 blue 0.99
                     colour red 0.99 green 0.99 blue 0.99]
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

sphere { <0.0, 0.0, 0.0>, 30.3        //clouds
   hollow
   texture { Halo }
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

sphere { 0, 1 hollow texture { Halo } scale 31.0 }

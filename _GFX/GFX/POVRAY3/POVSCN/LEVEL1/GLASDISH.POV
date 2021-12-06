// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"

camera {
   location  <0.0, 1.5, -2>
   direction <0, 0,   1>
   up        <0, 1,   0>
   right   <4/3, 0,   0>
   look_at   <0, 0,   0>
}

// Light source (backlit)
light_source {<0, 30, 10> color White
    spotlight
    point_at <0,0,0>
    radius 8
    falloff 20
}

// A "sky sphere" to reflect in the glass
sky_sphere {
    pigment {
        gradient y
        color_map {
            [0.0 Black ]
            [1.0 Gray50 ]
        }
    }
}

plane { y, -1
   texture {
       pigment {
          P_WoodGrain4A
          color_map { M_Wood4A }
//          scale 0.5
          translate <-1.5, 0.3, 1>
          warp
          {
            black_hole <0.5, 0, 0.5>, 1.25
            falloff 2
            strength 2
            inverse
            turbulence <0.15, 0.15, 0.15>
          }
          warp
          {
            black_hole <-1.5, 0, 0.3>, 1.5
            falloff 2
            strength 2
            inverse
            turbulence <0.75, 0.75, 0.75>
          }
          warp
          {
            black_hole <1, 0, -0.5>, 1.95
            falloff 1
            strength 2
            inverse
            turbulence <0.05, 0.05, 0.05>
          }
        }
    scale <1, 1, 2>
    }
}

// Crystal dish
intersection {
   sphere {<0, 0, 0>, 1}
   sphere {<0, 0.25, 0>, 0.75 inverse}
   plane  {y, 0.75 }
   texture {T_Glass3
      finish{
         reflection 0.25
         caustics 2.0
         fade_distance 2
         fade_power 2
     }
   }
}


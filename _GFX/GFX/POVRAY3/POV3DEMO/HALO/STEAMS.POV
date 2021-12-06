// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"

camera {
   location <0.0, 0.0, -100.0>
   direction <0, 0, 1>
   up <0.0, 1.0, 0.0>
   right <1.0, 0.0, 0.0>
   look_at <0.0,0.0, 0.0>
}

light_source{<-20,100,-100> colour White}

#declare Textur =
texture {
   pigment { colour Clear }
   finish { refraction 1 }

   halo {
      linear
      cylindrical_mapping
      emitting
      turbulence <0.6,0,0.0>
      colour_map {
         [0 color rgbt <0,0,0,1> ]
         [1 color rgbt <1,0,0,0.9>]
      }
      translate <-1,0,0>
   }
   halo {
      linear
      cylindrical_mapping
      emitting
      turbulence <0.0,0,0.6>
      colour_map {
         [0 color rgbt <0,0,0,1> ]
         [1 color rgbt <0,0,1,0.9>]
      }
      translate <0,0,1>
   }
   halo {
      linear
      cylindrical_mapping
      emitting
      turbulence <0.6,0,0.6>
      colour_map{
         [0 color rgbt <0,0,0,1> ]
         [1 color rgbt <0,1,0,0.9>]
      }
      rotate <20,-30,20>
      translate <0.5,-0.5,0>
   }
   scale 0.6
}


object{ Cube hollow texture{ Textur } scale 50 }


//
// Persistence Of Vision raytracer version 3.0 sample scene by Dieter Bayer.
//
// This scene shows a hollow, checkered sphere filled with fire.
//

#global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  location <-1.5, 30, -150>
  look_at <0, 25, 35>
  angle 33
}

background { color rgb<0.2, 0.4, 0.8> }

light_source { <100, 100, -200> colour White }

plane { <0, 1, 0>, 0
   pigment { NeonBlue }
   finish {reflection 0.15}
   hollow
}

sphere { 0, 1
  pigment {
    checker colour YellowGreen colour rgbt<1, 1, 1, 0.7>
    quick_color White
    scale <0.4, 0.5, 0.2>
    rotate <90, 0, -90>
  }
  finish {
    brilliance 8
    phong 1
    phong_size 100
  }
  halo {
    emitting
    spherical_mapping
    linear
    turbulence 1
    colour_map {
      [ 0 color rgbt <1, 0, 0,   1> ]
      [ 1 color rgbt <1, 1, 0, -10> ]
    } 
    samples 5
  }
  scale 25
  translate 25*y 
  hollow
} 


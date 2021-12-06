// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer, 1995

#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "metals.inc"

camera {
    location <0,  0.075, -0.45>
    up y
    right  <4/3, 0, 0>
    direction z
    look_at <0, 0.075, 0>
}

// Dark cloudy sky
sky_sphere {
    pigment {
        wrinkles
        turbulence 0.3
        omega 0.707
        octaves 5
        color_map {
            [0.0 color DustyRose * 2.5]
//            [0.2 color DustyRose ]
            [0.2 color Orange ]
//            [0.8 color DarkSlateGray * 0.5]
            [0.8 color SlateBlue * 0.25]
            [1.0 color SkyBlue]
        }
        scale <0.5, 0.1, 1000>
    }
}

// The Sun's halo
#declare SunGlow =
texture {
   pigment { colour Clear }
   halo {
      linear
      max_value 1.0
      spherical_mapping
      emitting
      colour_map {
         [0.15 color rgbf <1.0, 0.0, 0.0,  0.0> ]
         [0.75 color rgbf <1.0, 1.0, 0.0,  1.0> ]
      }
      samples 10
   }
}

#declare Sun =
union {
    sphere { 0, 1
        hollow
        no_shadow
        texture { SunGlow }
        scale 0.75
        scale <3, 3, 3>
        translate <0, 0.05, 0>
    }
    sphere { 0, 0.1
        no_shadow
        hollow
        pigment { Orange filter 0.5}
        finish { ambient 0.75 }
    }
    scale <1, 0.8, 1>
    translate <2.5, -0.25, 15>
}

light_source { <3000, 1000, -2000>  rgb <1, .95, .85> * 0.5 }
light_source { <0, 0.1, 4> DustyRose shadowless }
light_source { <0, 0.075, 4> Orange shadowless }

default { finish { diffuse 1 ambient 0.1 } }

#declare Sea =
plane { y, 0.045
    texture {
        T_Silver_1C
        normal {
            average
            normal_map {
                [ ripples 0.15 frequency 3 scale 0.008 translate <0, 0, 10> ]
                [ wrinkles 0.25 scale 0.01  ]
            }
        }
    }
}
object { Sun }
object { Sea }

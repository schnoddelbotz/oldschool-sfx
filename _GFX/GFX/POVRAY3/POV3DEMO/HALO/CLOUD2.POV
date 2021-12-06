// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "metals.inc"

camera {
  location <15, 2, -100>
  look_at <0, 0, 0>
}

//light_source{<-20,100,-100> colour White}
light_source{<-10, 40, 100> colour Orange}

sky_sphere {
    pigment {
        gradient y
        color_map {
            [0.0 Pink ]
            [0.2 SteelBlue ]
            [0.6 MidnightBlue ]
        }
    }
}

#declare Cloud =
sphere { 0, 1
  hollow
  texture {
    pigment { colour Clear }
    halo {
      linear
      max_value 0.1
      spherical_mapping
      attenuating
      turbulence 0.75
      octaves 6
      omega (1/1.618)
      lambda 1.618
      colour_map {
        [0.0 color rgbt <1, 1, 1, 1>]
        [0.5 color rgbt <1, 1, 1, 0.65>]
        [1.0 color rgbt <0, 0, 0, 0>]
      }
      scale <0.9, 0.4, 0.5>
      samples 10
      aa_level 0
      aa_threshold 0.3
    }
  }
  scale <100, 50, 20>
  translate y*10
}

// The Sun's halo
#declare SunGlow =
texture {
   pigment { colour Clear }
   halo {
      linear
      max_value 0.3
      spherical_mapping
      emitting
      colour_map {
         [0.05 color rgbt <1.0, 0.0, 0.0,  1.0> ]
         [0.30 color rgbt <1.0, 1.0, 0.0,  0.0> ]
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
    scale 4
    translate <2.5, -0.25, 15>
}

#declare Sea =
plane { y, 0
    texture { T_Silver_1A
        normal {
            wrinkles 0.5
            omega (1/1.618)
            lambda 1.618
        }
    }
}
object { Cloud }
object { Sun }
object { Sea }

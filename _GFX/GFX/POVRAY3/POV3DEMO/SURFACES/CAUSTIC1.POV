// Persistence Of Vision raytracer version 3.0 sample file.
// Caustics example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"

light_source { <15, 50, -50> color White }

camera {
    direction 2*z
    location <0, 13, -40>
    look_at <0, -3, -10>
}

plane { z, 15
    pigment { Gray50 }
    finish { Dull }
}

sphere { <0, 0, 0>, 4
    pigment { red 0.8 green 0.8 blue 1.0 filter 0.9 }
    finish {
        ambient 0 diffuse 0.7
        phong 0.5 phong_size 100
        refraction 1.0 ior 1.2
        caustics 1.0
    }
    translate <5, 0, -10>
}

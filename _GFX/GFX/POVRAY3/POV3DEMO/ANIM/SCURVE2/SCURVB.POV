// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer
// Smooth camera motion demonstration using SCurve function

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

#declare T = clock

// This S-Curve function gives a nice fade-in/fade-out blend
#declare SCurve = (T*T) * (3-(2*T))

camera {
    location <0.3, 0.75, -(5 + (10 * SCurve)) >
    up y
    right x*1.3333
    direction z
    look_at <0.3, 0, 0>
    #if(clock = 1)
        rotate  -y*90
    #end
}

background { Gray40 }
light_source { <0, 20, -25> rgb 1 }

plane { y, 0  pigment { Plum }}

sphere { <0, 0.4, 0>, 0.4
//     translate -y*1.8
//     rotate z * ((140 * SCurve) - 70)
//     translate y*1.8
    pigment { MandarinOrange }
    finish { specular 1 roughness 0.015 diffuse 0.85 }
}

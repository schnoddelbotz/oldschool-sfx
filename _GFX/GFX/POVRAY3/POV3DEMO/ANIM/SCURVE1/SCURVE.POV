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
    location <-2.0, 1.5, -4.5>
    right x*1.3333
    angle 70
    look_at <-0.75, -0.5, 0>
}

light_source { <20, 20, -25> rgb 1 }
plane { y, 0  pigment { Plum }}

sphere { <1.75, 0.4, 0>, 0.4
    pigment { MandarinOrange }
    finish { specular 1 roughness 0.015 }
    rotate y * (360*SCurve)
}

sphere { <-1.75, 0.4, -4.5+ (15*SCurve)>, 0.4
    pigment { LimeGreen }
    finish { specular 0.3 roughness 0.05 }
}


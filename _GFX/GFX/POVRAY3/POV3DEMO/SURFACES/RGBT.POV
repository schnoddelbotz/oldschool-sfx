// Persistence Of Vision raytracer version 3.0 sample file.
// Transmitted color example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera { 
  location <0,3,-31>
  direction 3*z
} 

plane {  z, 3.01  pigment {White} finish{ambient 0 diffuse .9}}

light_source { <500, 200, -500> White}

/* Upper left - filtered cyan, yellow & magenta */
union {
 disc {x/2,z,1 pigment { rgbf<1,1,0,1>} rotate z*000}
 disc {x/2,z,1 pigment { rgbf<1,0,1,1>} rotate z*120 translate z*.1}
 disc {x/2,z,1 pigment { rgbf<0,1,1,1>} rotate z*240 translate z*.2}
 translate <-2,6,0>
}

/* Lower left - non-filtered cyan, yellow & magenta */
union {
 disc {x/2,z,1 pigment { rgbt<1,1,0,0.5>} rotate z*000}
 disc {x/2,z,1 pigment { rgbt<1,0,1,0.5>} rotate z*120 translate z*.1}
 disc {x/2,z,1 pigment { rgbt<0,1,1,0.5>} rotate z*240 translate z*.2}
 translate <-2,1,0>
}

/* Upper right - filtered red, green, blue */
union {
 disc {x/2,z,1 pigment { rgbf<0,0,1,1>} rotate z*000}
 disc {x/2,z,1 pigment { rgbf<0,1,0,1>} rotate z*120 translate z*.1}
 disc {x/2,z,1 pigment { rgbf<1,0,0,1>} rotate z*240 translate z*.2}
 translate <4,6,0>
}

/* Lower right - non-filtered red, green, blue */
union {
 disc {x/2,z,1 pigment { rgbt<0,0,1,0.5>} rotate z*000}
 disc {x/2,z,1 pigment { rgbt<0,1,0,0.5>} rotate z*120 translate z*.1}
 disc {x/2,z,1 pigment { rgbt<1,0,0,0.5>} rotate z*240 translate z*.2}
 translate <4,1,0>
}


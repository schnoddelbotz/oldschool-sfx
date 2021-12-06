// Persistence Of Vision raytracer version 3.0 sample file.
// Number_of_waves example

#version 3.0
global_settings { 
 assumed_gamma 2.2 
 number_of_waves 1
}

#include "colors.inc"
#include "textures.inc"

camera {
   location  <0, 2, -4>
   direction <0, 0,  1>
   up        <0, 1,  0>
   right   <1, 0,  0>
   look_at   <0, 0, 0>
}

light_source {<20, 10, -10> color White }

// Floor plane
plane { y, 0
    texture { 
        pigment { checker color White color Green 
            rotate y*45
        }
        normal { 
            waves 1
//            frequency 10
            scale .1
        }
    }
}


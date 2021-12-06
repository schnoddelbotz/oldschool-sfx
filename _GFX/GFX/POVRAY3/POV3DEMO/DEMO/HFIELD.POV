// Persistence Of Vision raytracer version 3.0 sample file.
// Simple heightfield example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
    location <0, 0.75, -1.00 >
    right x*1.333
    up y
    direction z
    look_at <0, 0, 0>
}

light_source { <0, 10, -10> White }

height_field {                   // upper-right of image at <0.5, 0.0, 0.5>
    gif "test.gif"               // lower-left of image at <0.0, 0.0, 0.0>
    pigment {
        image_map { gif "test.gif" }
    rotate x*90                  // rotate the image to the x/z plane
    }
    translate <-0.5, 0, -0.5>    // center the whole shebang
}

// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer
// Cylindrical spotlight example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
    location <0, 2, -15>
    direction z
    look_at 0
}

atmosphere {
    type 1
    samples 60
    distance 100
    scattering .75
    aa_level 8
    aa_threshold 0.2
    jitter 0.05
}

light_source { <-15,20,0> Red * 3
    spotlight
    cylinder
    radius  1
    falloff 4
    point_at -y
}

light_source { <-12,20,0> Yellow * 3
    spotlight
    cylinder
    radius  1
    falloff 4
    point_at -y
}

light_source { <-9,20,0> Blue * 3
    spotlight
    cylinder
    radius  1
    falloff 4
    point_at -y
}

plane { y,  0 pigment { White }  finish { ambient 0.25 } hollow }


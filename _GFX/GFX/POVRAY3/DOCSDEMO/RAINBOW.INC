//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"

camera {
  location <0, 20, -100>
  look_at <0, 25, 0>
  angle 82
}

background { color SkyBlue }

// declare rainbow's colours

#declare r_violet1 = colour red 1.0 green 0.5 blue 1.0 filter 1.0
#declare r_violet2 = colour red 1.0 green 0.5 blue 1.0 filter 0.8
#declare r_indigo  = colour red 0.5 green 0.5 blue 1.0 filter 0.8
#declare r_blue    = colour red 0.2 green 0.2 blue 1.0 filter 0.8
#declare r_cyan    = colour red 0.2 green 1.0 blue 1.0 filter 0.8
#declare r_green   = colour red 0.2 green 1.0 blue 0.2 filter 0.8
#declare r_yellow  = colour red 1.0 green 1.0 blue 0.2 filter 0.8
#declare r_orange  = colour red 1.0 green 0.5 blue 0.2 filter 0.8
#declare r_red1    = colour red 1.0 green 0.2 blue 0.2 filter 0.8
#declare r_red2    = colour red 1.0 green 0.2 blue 0.2 filter 1.0

plane { y, -10 pigment { colour Green } }

light_source {<100, 120, 40> colour White}


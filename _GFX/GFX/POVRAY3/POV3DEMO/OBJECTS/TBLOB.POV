// Persistence Of Vision raytracer version 3.0 sample file.
// POV-Ray 2.0 sample data file written by Alexander Enzmann

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"

camera {
  location  <0, 3, -6>
  right <4/3, 0, 0>
  direction <0, 0, 1.9>
  look_at   <0, 0, 0>
}

light_source { <-15, 30, -25> color red 1 green 1 blue 1 }

blob {
  threshold 0.6
  component 1.0, 1.0, <0.75, 0, 0>
  component 1.0, 1.0, <-0.375, 0.64952, 0>
  component 1.0, 1.0, <-0.375, -0.64952, 0>

  texture { T_Glass1 }
 
  rotate 30*y
}

disc {
  <0, 0.001, 0>, <0, 1, 0>, 1000
  pigment { checker colour White colour Black }
  finish { ambient 0.4 diffuse 0.6 }
  translate <0,-2.5,0>
}

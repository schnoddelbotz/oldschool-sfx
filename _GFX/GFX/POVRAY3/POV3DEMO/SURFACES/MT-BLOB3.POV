// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// Blob with three spherical, glass components.

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

light_source { <-15,  30, -25> color Gray80 }
light_source { < 15,  30, -25> color Gray80 }

blob {
  threshold 0.6

  sphere { <0.75, 0, 0>, 1.0 strength 1.0 texture { T_Glass1 } }
  sphere { <-0.375, 0.64952, 0>, 1.0 strength 1.0 texture { T_Glass2} }
  sphere { <-0.375, -0.64952, 0>, 1.0 strength 1.0 texture { T_Green_Glass} }

  rotate 30*y
}

disc {
  <0, 0, 0>, <0, 1, 0>, 1000
  
  pigment { checker colour White colour Black }
  finish { ambient 0.1 diffuse 0.7 }
  
  translate <0, -2.5, 0>
}


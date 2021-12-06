// Persistence Of Vision raytracer version 3.0 sample file.
// Colored reflection example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  location <0.5, 1.8, -4>
  right 4/3*x
  up y
  look_at <0, 1.5, 0>
  angle 70
}

box { <-5, 0, -5>, <5, 3, 5>
  pigment { color White }
}

polygon {
  4, <0, 0>, <1, 0>, <1, 1>, <0, 1>
  scale <6, 2.5, 1>
  translate <-3, 0.25, 4.999>
  finish { ambient 0.2 diffuse 0 phong 1 phong_size 100 reflection 0.95 }
  pigment { color White }
}

/* Spheres without reflection color (standard) on left side. */

sphere { <-1, 0.5, 0>, 0.4
  finish { diffuse 0 reflection 0.9 }
  pigment { color rgb<0.2, 0.2, 1> }
}

sphere { <-1, 1.5, 0>, 0.4
  finish { diffuse 0 reflection 0.9 }
  pigment { color rgb<0.2, 1, 0.2> }
}

sphere { <-1, 2.5, 0>, 0.4
  finish { diffuse 0 reflection 0.9 }
  pigment { color rgb<1, 0.2, 0.2> }
}

/* Spheres with reflection color on right side. */

sphere { <1, 0.5, 0>, 0.4
  finish { diffuse 0 reflection rgb<0.2, 0.2, 0.9> }
  pigment { color rgb<0.2, 0.2, 1> }
}

sphere { <1, 1.5, 0>, 0.4
  finish { diffuse 0 reflection rgb<0.2, 0.9, 0.2> }
  pigment { color rgb<0.2, 1, 0.2> }
}

sphere { <1, 2.5, 0>, 0.4
  finish { diffuse 0 reflection rgb<0.9, 0.2, 0.2> }
  pigment { color rgb<1, 0.2, 0.2> }
}

light_source { <0, 2.9, 0> color Gray30 }
light_source { <-4, 2.9, -4> color Gray30 }
light_source { < 4, 2.9, -4> color Gray30 }


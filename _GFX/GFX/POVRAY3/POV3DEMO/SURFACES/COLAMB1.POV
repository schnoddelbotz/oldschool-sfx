// Persistence Of Vision raytracer version 3.0 sample file.
// Colored ambient example

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

 #default { finish { ambient 0.2 specular 0.5 roughness 0.005 } }

 box { <-5, 0, -5>, <5, 3, 5>
   pigment { color White }
 }

 polygon {
   4, <0, 0>, <1, 0>, <1, 1>, <0, 1>
   scale <6, 2.5, 1>
   translate <-3, 0.25, 4.999>
   finish { 
     ambient rgb <0.1, 0.1, 0.4> 
     diffuse 0 phong 1 phong_size 100
     reflection 0.95 }
   pigment { color White }
 }

 // LEFT SIDE
 /* Spheres without ambient color (standard). */
 sphere { <-1, 0.5, 0>, 0.4
   finish { ambient 0.2 }
   pigment { White }
 }

 sphere { <-1, 1.5, 0>, 0.4
   finish { ambient 0.2 }
   pigment { White }
 }

 sphere { <-1, 2.5, 0>, 0.4
   finish { ambient 0.2 }
   pigment { White }
 }

 // RIGHT SIDE
 /* Spheres with ambient color. */
 sphere { <1, 0.5, 0>, 0.4
   finish { ambient rgb <0.2, 0.4, 0.0> }
   pigment { White }
 }

 sphere { <1, 1.5, 0>, 0.4
   finish { ambient rgb <0.3, 0.3, 0.0> }
   pigment { White }
 }

 sphere { <1, 2.5, 0>, 0.4
   finish { ambient rgb <0.4, 0.2, 0.0> }
   pigment { White }
 }

 light_source { <0, 2.9, 0> color Gray30 }
 light_source { < 4, 2.9, -4> color Yellow }


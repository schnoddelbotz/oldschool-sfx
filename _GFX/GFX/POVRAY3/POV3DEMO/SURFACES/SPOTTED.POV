// Persistence Of Vision raytracer version 3.0 sample file.
// Spotted pattern example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

#declare T1=
 texture{
   pigment{
     spotted color_map{[0.0 Black][1.0 White]}
     scale 0.24
   }
 }

#declare T2=
 texture{
   pigment{White}
   normal{
     spotted 0.6
     scale 0.24
   }
   finish{phong 0.8 phong_size 200}
 }

#include "pignorm.inc"

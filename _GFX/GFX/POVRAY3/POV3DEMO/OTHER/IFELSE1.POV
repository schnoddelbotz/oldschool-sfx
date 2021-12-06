// Persistence Of Vision raytracer version 3.0 sample file.
// Illustrates conditional parsing.
// Run with +k0 results blue sphere
// Run with +k1 results blue box
// Run with +k2 adds check floor under blue box
// Run with +k3 changes blue box to red

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  location <0, 3, -5>
  direction <0, 0, 1.5>
  right <1.3333, 0, 0>
  look_at <0, 0 , 0>
}

light_source { <10, 20, -30> colour White}
light_source { <-5, 2, -3> colour White}


#declare My_Texture =
 texture {
   #if (clock > 2.5)
     pigment{Red}
   #else
     pigment{Blue}
     finish{phong 1}
   #end
 }

#if (clock > 0.5)
 box { <-1, -1, -1> <1, 1, 1> 
   texture{My_Texture}    
   rotate -y*45
 }
#else
 sphere { <0,1,0>, 1 texture{My_Texture}}
#end

#if (clock > 1.5)
 plane { y,-1
    pigment { checker Green,White }
 }
#end

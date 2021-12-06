// Persistence Of Vision raytracer version 3.0 sample file.
// Brick pattern example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  location <0, 50, -100>
  direction <0, 0, 3>
  look_at <0, 0 , 0>
}

light_source { <500, 1000, -2000> color White*.9 }
light_source { <-500, 1000, 2000> color White*.6}


#declare Mortar_Thickness=5/8
#declare Fudge= Mortar_Thickness+0.05
#declare Entire_Size = <6,3,6>

#declare Thing=
difference{
 box {0, Entire_Size*<4,3,4>-Fudge}
 box {Entire_Size/2-Fudge, Entire_Size*<3.5,4,3.5>+Fudge}
    pigment{
       brick White*.8, rgb<0.65, 0.3, 0.25>
       brick_size Entire_Size
       mortar Mortar_Thickness
    }
}

object{Thing rotate 45*y  translate -15*x}

// Persistence Of Vision raytracer version 3.0 sample file.
// Demonstrates #switch and #case directives
//
// If +k0 you get red pigment with phong finish, then it falls
//   through to #case(1) because there is no #break.  This adds
//   the normal bumps.
// If +k1 you get a red pigment with the bumps from #case(1)
//   but you do not get the phong.
// If +k2 the red pigment is overriden with blue.  No bumps or phong.
// If +k3 the red pigment is overriden with green.  No bumps or phong.
// If any other clock value is used, you get red pigment.  No bumps or phong.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location  <0, 20,-100>
}

plane { y, -10
   pigment {White}
   finish {ambient 0.2 diffuse 0.8}
}

sphere { <0, 25, 0>, 40
   pigment {Red}
   #switch (clock)
     #case (0)
       finish{phong 1}
     #case (1)
       normal{bumps 1 scale 5}
       #break
     #case (2)
       pigment{Blue}
       #break
     #case (3)
       pigment {Green}
   #end
}

light_source {<100, 120, -200> colour White}


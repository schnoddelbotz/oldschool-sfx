// Persistence Of Vision raytracer version 3.0 sample file.
// Demonstrates #switch and #case directives
//
// If +k0 or +k2 you get red pigment
// If +k1 or +k3 you get green pigment.
// If any other clock value is used, you get blue pigment.

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
   #switch (clock)
     #case (0)
     #case (2)
       pigment {Red}
       #break
     #case (1)
     #case (3)
       pigment {Green}
       #break
     #else
       pigment {Blue}
   #end
}

light_source {<100, 120, -200> colour White}


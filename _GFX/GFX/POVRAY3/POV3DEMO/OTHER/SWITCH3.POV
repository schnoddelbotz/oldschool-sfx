// Persistence Of Vision raytracer version 3.0 sample file.
// Demonstrates #switch #case and #range directives
//
// If +k0 you get red pigment
// If +k1 you get green pigment.
// If +k is any value from 2 through 4 inclusive, you get yellow pigment.
// All others are blue.

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
       pigment {Red}
       #break
     #range (2,4)
       pigment {Yellow}
       #break
     #case (1)
       pigment {Green}
       #break
     #else
       pigment {Blue}
   #end
}

light_source {<100, 120, -200> colour White}

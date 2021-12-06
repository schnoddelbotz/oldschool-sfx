// Persistence Of Vision raytracer version 3.0 sample file.
// Demonstrates #switch and #range directives
//
// If +k0 through +k2 you get red pigment
// If +k greater than 2 but less than or equal 3 you get green pigment.
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
     #range (0,2)      // Note clock=1 is red, not blue because
       pigment {Red}   // once a true condition is found, all
       #break          // other case or range values are ignored.
     #range (1,3)      // This range is only used if all previous
       pigment {Green} // ranges or cases are false.
       #break
     #else
       pigment {Blue}
   #end
}

light_source {<100, 120, -200> colour White}

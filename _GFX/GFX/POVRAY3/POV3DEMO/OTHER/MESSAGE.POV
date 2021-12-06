// Persistence Of Vision raytracer version 3.0 sample file.


#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location  <0, 20, -100>
   direction <0,  0,    1>
   up        <0,  1,    0>
   right   <4/3,  0,    0>
}

#warning "I told you so!"

background { colour SkyBlue }

#render "\nHere we go a rendering...\n"

plane { y, -10
   pigment {
      checker colour Yellow colour Green
      scale 20
   }
   finish {
      ambient 0.2
      diffuse 0.8
   }
}

#debug concat("The clock = ",str(clock,5,3))

sphere { <0, 25, 0>, 40
   pigment {Red}
   finish {
      ambient 0.2
      diffuse 0.6
      phong 1.0
      phong_size 20
   }
}

#statistics "Lots of people trace rays\n"

light_source {<100, 120, 40> colour White}

#if (clock > 10)
#error "You shouldn't have done that!"
#end

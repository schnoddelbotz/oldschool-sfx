// Persistence Of Vision raytracer version 3.0 sample file.


#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location  <0, 0,-20>
   direction <0, 0,  1>
   up        <0,  1,  0>
   right     <4/3, 0,  0>
   look_at   <0, 0, 0>
   }

background { color rgb <0.5, 0.5, 0.5> }

text { ttf
   "crystal.ttf",
   "POV-Ray", 1, 0
   pigment { color rgb <1, 0.2, 0.2> }
   finish {
      ambient 0.2
      diffuse 0.6
      phong 0.3
      phong_size 100
      }
   scale <4, 4, 1>
   translate <-10,6,0>
   }

text { ttf 
   "crystal.ttf",
   "Version:3.0", 1, 0
   pigment { color rgb <1, 0.2, 0.2> }
   finish {
      ambient 0.2
      diffuse 0.6
      phong 0.3
      phong_size 100
      }
   scale <4, 4, 1>
   translate <-10,2,0>
   }

text { ttf
   "cyrvetic.ttf",
   "POV-Ray", 1, 0
   pigment { color rgb <1, 0.2, 0.2> }
   finish {
      ambient 0.2
      diffuse 0.6
      phong 0.3
      phong_size 100
      }
   scale <4, 4, 1>
   translate <-10,-2,0>
   }

text { ttf
   "cyrvetic.ttf",
   "Version:3.0", 1, 0
   pigment { color rgb <1, 0.2, 0.2> }
   finish {
      ambient 0.2
      diffuse 0.6
      phong 0.3
      phong_size 100
      }
   scale <4, 4, 1>
   translate <-10,-6,0>
   }

light_source {<20, 30, -100> colour White}

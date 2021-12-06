// Persistence Of Vision raytracer version 3.0 sample file.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location  <0, 0,-30>
   direction <0, 0,  1>
   up        <0,  1,  0>
   right     <4/3, 0,  0>
   look_at   <0, 0, 0>
   }

background { color rgb <0.5, 0.5, 0.5> }

#declare T=texture{
   pigment { color rgb <1, 0.2, 0.2> }
   finish {
      ambient 0.2
      diffuse 0.6
      phong 0.3
      phong_size 100
      }
   }

text { ttf
   "crystal.ttf",
   concat("clock=",str(clock,6,2)), 1, 0
   texture{T}
   scale <4, 4, 1>
   translate <-18,10,0>
   }

text { ttf
   "crystal.ttf",
   concat("substr('ABCDE',2,3)='",substr("ABCDE",2,3),"'"), 1, 0
   texture{T}
   scale <4, 4, 1>
   translate <-18,6,0>
   }

text { ttf
   "crystal.ttf",
   concat("asc('abc')=",str(asc("abc"),-1,0)),1,0
   texture{T}
   scale <4, 4, 1>
   translate <-18,2,0>
   }

text { ttf
   "crystal.ttf",
   concat("strlen('abc')=",str(strlen("abc"),-1,-1)),1,0
   texture{T}
   scale <4, 4, 1>
   translate <-18,-2,0>
   }

text { ttf
   "crystal.ttf",
   concat("chr(169)='",chr(169),"'"), 1, 0
   texture{T}
   scale <4, 4, 1>
   translate <-18,-6,0>
   }

#if (clock>10)
#declare Ans="yes"
#else
#declare Ans="no"
#end

text { ttf
   "crystal.ttf",
   concat("clock>10?  '",Ans,"'"), 1, 0
   texture{T}
   scale <4, 4, 1>
   translate <-18,-10,0>
   }

light_source {<20, 30, -100> colour White}

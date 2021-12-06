// Persistence Of Vision raytracer version 3.0 sample file.
// File by Chris Young.
// Light distance attenuation example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

#declare Dist=27.5

camera{location <0,30,-180> direction 3*z look_at -y*5}

#default {finish{ambient .2}}

union {
  cone {-y*6,2,y,.5 open pigment{White*.85}}
  light_source{
     0 White spotlight radius 15  falloff 18 point_at -y
     area_light x/2,z/2,4,4 adaptive 1 jitter
     fade_distance Dist fade_power 0
  }
  translate <-30,20,0>
}

union {
  cone {-y*6,2,y,.5 open pigment{White*.85}}
  light_source{
     0 White spotlight radius 15  falloff 18 point_at -y
     area_light x/2,z/2,4,4 adaptive 1 jitter
     fade_distance Dist fade_power 1
  }
  translate <-10,20,0>
}
union {
  cone {-y*6,2,y,.5 open pigment{White*.85}}
  light_source{
     0 White spotlight radius 15  falloff 18 point_at -y
     area_light x/2,z/2,4,4 adaptive 1 jitter
     fade_distance Dist fade_power 2
  }
  translate <10,20,0>
}

union {
  cone {-y*6,2,y,.5 open pigment{White*.85}}
  light_source{
     0 White spotlight radius 15  falloff 18 point_at -y
     area_light x/2,z/2,4,4 adaptive 1 jitter
     fade_distance Dist fade_power 3
  }
  translate <30,20,0>
}

//plane {z,2 pigment{White}}
plane {y,-22 pigment{White}}

sphere{<-30-6,-20,-4>,2 pigment{White} finish{phong 1}}
sphere{<-10-6,-20,-4>,2 pigment{White} finish{phong 1}}
sphere{< 10-6,-20,-4>,2 pigment{White} finish{phong 1}}
sphere{< 30-6,-20,-4>,2 pigment{White} finish{phong 1}}

sphere{<-30-2,-7.5,-1>,2 pigment{White} finish{phong 1}}
sphere{<-10-2,-7.5,-1>,2 pigment{White} finish{phong 1}}
sphere{< 10-2,-7.5,-1>,2 pigment{White} finish{phong 1}}
sphere{< 30-2,-7.5,-1>,2 pigment{White} finish{phong 1}}

sphere{<-30+2,5,0>,2 pigment{White} finish{phong 1}}
sphere{<-10+2,5,0>,2 pigment{White} finish{phong 1}}
sphere{< 10+2,5,0>,2 pigment{White} finish{phong 1}}
sphere{< 30+2,5,0>,2 pigment{White} finish{phong 1}}

light_source {<-100,100,-250> White*.1 }

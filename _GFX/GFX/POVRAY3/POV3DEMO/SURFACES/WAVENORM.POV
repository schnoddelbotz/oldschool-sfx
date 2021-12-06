// Persistence Of Vision raytracer version 3.0 sample file.
// Example of wood normal perturbance using various waveforms.

#version 3
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera { 
  location <0,1,-11>
  direction 3*z
} 

plane {
  y, -1.01
  pigment {checker color White color Magenta}
}

plane {
  z, 3.01
  pigment {checker color White color Magenta}
}

light_source { <300, 500, -500> color Gray65}
light_source { <-100, 10, -500> color Gray65}

#declare N1=
   normal{
     wood  0.6
     scale 0.24
   }

#default {
  texture{
   pigment{White}
   finish{phong 0.8 phong_size 200}
  }
 }

box{<-1,-1,-1>,<1,1,1>
  scale .75
  normal{N1 ramp_wave}
  rotate <20,20,0>
  translate <-1,2,0>
}

box{<-1,-1,-1>,<1,1,1>
  scale .75
  normal{N1 triangle_wave}
  rotate <20,20,0>
  translate <1,2,0>
}

box{<-1,-1,-1>,<1,1,1>
  scale .75
  normal{N1 sine_wave}
  rotate <20,20,0>
  translate <-1,0,0>
}

box{<-1,-1,-1>,<1,1,1>
  scale .75
  normal{N1 scallop_wave}
  rotate <20,20,0>
  translate <1,0,0>
}


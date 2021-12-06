//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#version 3.0

global_settings { assumed_gamma 2.2 }

camera {
  location <0, 6, -20>
  look_at <0, 6, 0>
  angle 48
}

atmosphere {
  type 1
  samples 10     
  distance 20
  scattering 0.3
  aa_level 3
  aa_threshold 0.1
  jitter 0.2
}

light_source { <0, 15, 0> color red .7 green .7 blue .7 shadowless }

light_source { 
  <-5, 15, 0> color rgb <1, 0, 0>
  spotlight
  point_at <-5, 0, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

light_source { 
  <0, 15, 0> color rgb <0, 1, 0>
  spotlight
  point_at <0, 0, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

light_source { 
  <5, 15, 0> color rgb <0, 0, 1>
  spotlight
  point_at <5, 0, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

plane { z, 10
  pigment { checker color rgb<1, 0, 0> color rgb<0, 1, 0> }
  hollow
}


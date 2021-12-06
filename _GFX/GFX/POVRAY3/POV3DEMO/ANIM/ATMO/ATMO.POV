// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// Atmospheric environment with spotlights.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"

camera {
  location <5, 6, -18>
  right 4/3*x
  up y
  direction z
  angle 80
  look_at <0, 4, 0>
}

//
// Declare the various atmospheres. 
//
// Note the different reflectivities due to the different scattering models.
//

//
// Atmosphere with isotropic scattering (independent of incident light). 
//

#declare Atmosphere1 = atmosphere {
  type 1
  samples 50        // Number of samples in first distance interval
  distance 30       // Atmosphere density, similar to fog
  scattering 0.2    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Mie cattering, hazy atmosphere (dependent of incident light). 
//

#declare Atmosphere2 = atmosphere {
  type 2
  samples 50        // Number of samples in first distance interval
  distance 30       // Atmosphere density, similar to fog
  scattering 1.2    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Mie scattering, murky atmosphere (dependent of incident light).
//

#declare Atmosphere3 = atmosphere {
  type 3
  samples 50        // Number of samples in first distance interval
  distance 30       // Atmosphere density, similar to fog
  scattering 1.5    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Rayleigh scattering (dependent of incident light). 
//

#declare Atmosphere4 = atmosphere {
  type 4
  samples 50        // Number of samples in first distance interval
  distance 30       // Atmosphere density, similar to fog
  scattering 0.2    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Use atmosphere. 
//

atmosphere { Atmosphere1 }

//
// Light sources not interacting with the atmosphere.
//

light_source { <0, 15, 0> color Gray20 atmosphere off }

//
// Spotlights pointing at shaft.
//

light_source {
  <0, 0, 0> color White
  spotlight
  point_at <0, 100, 0>
  radius 25
  falloff 45
  tightness 2
  atmospheric_attenuation on
  rotate z*60 + (30*clock)
  translate y*6
  rotate y*(360*clock)
}

light_source {
  <0, 0, 0> color White
  spotlight
  point_at <0, 100, 0>
  radius 25
  falloff 60
  tightness 2
  atmospheric_attenuation on
  rotate -z*80 + (10*clock)
  translate y*6
  rotate y*(360*clock)
}

//
// Declare steps. 
//

#declare Step = prism
{
  linear_spline
  linear_sweep
  0, 1, 9
  <cos(radians(0*45)), sin(radians(0*45))>, 
  <cos(radians(1*45)), sin(radians(1*45))>, 
  <cos(radians(2*45)), sin(radians(2*45))>,
  <cos(radians(3*45)), sin(radians(3*45))>, 
  <cos(radians(4*45)), sin(radians(4*45))>, 
  <cos(radians(5*45)), sin(radians(5*45))>,
  <cos(radians(6*45)), sin(radians(6*45))>, 
  <cos(radians(7*45)), sin(radians(7*45))>,
  <cos(radians(0*45)), sin(radians(0*45))> 
  rotate 22.5*y
}

#declare Stair = union {
  object { 
    Step
    scale <10, 0.5, 10>
    translate <0, 0, 0>
  }
  object { 
    Step
    scale <8, 0.5, 8>
    translate <0, 0.5, 0>
  }
  object { 
    Step
    scale <6, 0.5, 6>
    translate <0, 1, 0>
  }
}

//
// Declare shaft. 
//

#declare Shaft = cylinder {
  <0, 0, 0>, <0, 1, 0>, 1
}

//
// Declare object.
//

#declare Thing = difference {
  box { <-1, -1, -1> <1, 1, 1> }
  box { <-0.7, -0.7, -1.1>, <0.7, 0.7, 1.1> }
  box { <-0.7, -0.7, -1.1>, <0.7, 0.7, 1.1> rotate 90*x }
  box { <-0.7, -0.7, -1.1>, <0.7, 0.7, 1.1> rotate 90*y }
}

//
// Position objects.
//

object {
  Stair
  pigment { color rgb<1.0, 0.3, 0.3> }
  finish { ambient 0.2 diffuse 0.5 }
}

object {
  Thing
  scale <3, 3, 3>
  translate <0, 1.5+3, 0>
  texture { Copper_Metal }
}

//
// Room.
//

box { <-25, 0, -25>, <25, 25, 25>
  pigment { color White }
  finish { ambient 0.2 diffuse 0.5 }
  hollow
}


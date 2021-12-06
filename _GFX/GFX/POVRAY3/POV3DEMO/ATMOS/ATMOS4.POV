// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// Atmospheric environment with spotlights.

#version 3.0
global_settings { assumed_gamma 2.2 }

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
  samples 20        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 0.3    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Mie cattering, hazy atmosphere (dependent of incident light). 
//

#declare Atmosphere2 = atmosphere {
  type 2
  samples 20        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 1      // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Mie scattering, murky atmosphere (dependent of incident light). 
//

#declare Atmosphere3 = atmosphere {
  type 3
  samples 20        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 1      // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Atmosphere with Rayleigh scattering (dependent of incident light). 
//

#declare Atmosphere4 = atmosphere {
  type 4
  samples 20        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 0.3    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.25       // Amount of sample jittering
}

//
// Use atmosphere. 
//

atmosphere { Atmosphere1 }

//
// Light source not interacting with the atmosphere. 
//

light_source { <0, 15, 0> color red .3 green .3 blue .3 atmosphere off }

//
// Bunch of spotlights. 
//

#declare Spot = light_source { 
  <0, 0, 0> color red 1 green 1 blue 1
  spotlight
  point_at <0, 1, 0>
  radius 2
  falloff 3
  tightness 2
  atmospheric_attenuation on
}

#declare Spots = union {
  object { Spot rotate <  0, 0, 0> }
  object { Spot rotate < 15, 0, 0> }
  object { Spot rotate < 30, 0, 0> }
  object { Spot rotate < 45, 0, 0> }
  object { Spot rotate < 60, 0, 0> }
  object { Spot rotate < 75, 0, 0> }
  object { Spot rotate < 90, 0, 0> }
  object { Spot rotate <105, 0, 0> }
  object { Spot rotate <120, 0, 0> }
  object { Spot rotate <135, 0, 0> }
  object { Spot rotate <150, 0, 0> }
  object { Spot rotate <165, 0, 0> }
  object { Spot rotate <180, 0, 0> }
  object { Spot rotate <195, 0, 0> }
  object { Spot rotate <210, 0, 0> }
  object { Spot rotate <225, 0, 0> }
  object { Spot rotate <240, 0, 0> }
  object { Spot rotate <255, 0, 0> }
  object { Spot rotate <270, 0, 0> }
  object { Spot rotate <285, 0, 0> }
  object { Spot rotate <300, 0, 0> }
  object { Spot rotate <315, 0, 0> }
  object { Spot rotate <330, 0, 0> }
  object { Spot rotate <345, 0, 0> }
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

declare Shaft1 = union {
  cylinder { <0, 0.0, 0>, <0, 4.0, 0>, 0.6 }
  cylinder { <0, 4.0, 0>, <0, 5.0, 0>, 0.8 }
  cylinder { <0, 5.0, 0>, <0, 6.0, 0>, 0.4 }
  cylinder { <0, 6.0, 0>, <0, 7.0, 0>, 0.2 }
}

//
// Position objects.
//

object {
  Spots
  translate <1, 6, 0>
}
object {
  Stair 
  pigment { color red 1 green 0.3 blue 0.3 }
  finish { ambient 0.2 diffuse 0.5 }
}

object { 
  Shaft1
  translate <0, 1.5, 0>
  pigment { color red 0.3 green 1 blue 0.3 }
  finish { ambient 0.2 diffuse 0.5 phong 1 phong_size 20 }
}

//
// Room. 
//

box { <-25, 0, -25>, <25, 25, 25>
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.2 diffuse 0.5 }
  hollow
}


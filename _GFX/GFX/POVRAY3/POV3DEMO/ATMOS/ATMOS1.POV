// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// Atmospheric environment with spotlights.

#version 3.0
global_settings { assumed_gamma 2.2 }

camera {
  location <10, 6, -20>
  right <4/3, 0, 0>
  up <0, 1, 0>
  direction <0, 0, 1.5>
  look_at <3, 4, 0>
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
  distance 20       // Atmosphere density, similar to fog
  scattering 0.3    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.2        // Amount of sample jittering
}

//
// Atmosphere with Mie cattering, hazy atmosphere (dependent of incident light). 
//

#declare Atmosphere2 = atmosphere {
  type 2
  samples 20        // Number of samples in first distance interval
  distance 20       // Atmosphere density, similar to fog
  scattering 1.2    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.2        // Amount of sample jittering
}

//
// Atmosphere with Mie scattering, murky atmosphere (dependent of incident light). 
//

#declare Atmosphere3 = atmosphere {
  type 3
  samples 20        // Number of samples in first distance interval
  distance 20       // Atmosphere density, similar to fog
  scattering 1.5    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.2        // Amount of sample jittering
}

//
// Atmosphere with Rayleigh scattering (dependent of incident light). 
//

#declare Atmosphere4 = atmosphere {
  type 4
  samples 20        // Number of samples in first distance interval
  distance 20       // Atmosphere density, similar to fog
  scattering 0.6    // Reflectivity of atmosphere, determines brightness
  aa_level 8        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.2        // Amount of sample jittering
}

//
// Use atmosphere. 
//

atmosphere { Atmosphere1 }

//
// Light source not interacting with the atmosphere. 
//

light_source { <0, 15, 0> color red .7 green .7 blue .7 atmosphere off }

//
// Spotlights pointing at balls. 
//

light_source { 
  <-10, 15, -5> color red 1 green .3 blue .3
  spotlight
  point_at <-5, 5, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

light_source { 
  <-5, 15, -5> color red .3 green 1 blue .3 
  spotlight
  point_at <0, 5, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

light_source { 
  <0, 15, -5> color red .3 green .3 blue 1 
  spotlight
  point_at <5, 5, 0>
  radius 10
  falloff 15
  tightness 1
  atmospheric_attenuation on
}

//
// Room. 
//

box { <-20, 0, -20>, <20, 20, 20>
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.2 diffuse 0.5 }
  hollow
}

//
// Balls. 
//

sphere { <-5, 5, 0>, 1
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.3 diffuse 0.7 phong 1 }
}

sphere { <0, 5, 0>, 1
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.3 diffuse 0.7 phong 1 }
}

sphere { <5, 5, 0>, 1
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.3 diffuse 0.7 phong 1 }
}


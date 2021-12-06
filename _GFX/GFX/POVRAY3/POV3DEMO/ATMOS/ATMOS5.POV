//
// Persistence Of Vision raytracer version 3.0 sample file.
//
// This scene shows the effect of a partially transparent image
// map inside an atmopshere.
//

#version 3.0

global_settings { assumed_gamma 2.2 }

camera {
  location <0, 3, -10>
  look_at <0, -0.5, 0>
  angle 13
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
  samples 10        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 0.8    // Reflectivity of atmosphere, determines brightness
  aa_level 5        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.1        // Amount of sample jittering
}

//
// Atmosphere with Mie cattering, hazy atmosphere (dependent of incident light). 
//

#declare Atmosphere2 = atmosphere {
  type 2
  samples 10        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 1.0    // Reflectivity of atmosphere, determines brightness
  aa_level 5        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.1        // Amount of sample jittering
}

//
// Atmosphere with Mie scattering, murky atmosphere (dependent of incident light). 
//

#declare Atmosphere3 = atmosphere {
  type 3
  samples 10        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 1.0    // Reflectivity of atmosphere, determines brightness
  aa_level 5        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.1        // Amount of sample jittering
}

//
// Atmosphere with Rayleigh scattering (dependent of incident light). 
//

#declare Atmosphere4 = atmosphere {
  type 4
  samples 10        // Number of samples in first distance interval
  distance 50       // Atmosphere density, similar to fog
  scattering 0.8    // Reflectivity of atmosphere, determines brightness
  aa_level 5        // Level of binary subdivision in case of aa
  aa_threshold 0.1  // Threshold for aa to push in
  jitter 0.1        // Amount of sample jittering
}

//
// Use atmosphere. 
//

atmosphere { Atmosphere1 }

//
// A shadowless light source that does not interact with the atmosphere.
//

light_source { <100, 100, -100> color rgb 0.3 atmosphere off shadowless }

//
// A spotlight pointing at the image map.
//

light_source { 
  <0, 5, 0> 
  color rgb 1 
  spotlight 
  point_at <0, 0, 0>
  falloff 10
  radius 8
}

//
// The partially translucent image map.
//

polygon {
  5, <-1, -1, 0>, <1, -1, 0>, <1, 1, 0>, <-1, 1, 0>, <-1, -1, 0>
  pigment { 
    image_map { 
      gif "test.gif" 
      once 
      interpolate 4 
      transmit 5, 1 
    } 
    translate <-0.5, -0.5, 0> 
  }
  scale 2
  rotate 90*x
  hollow
}

//
// The ground. 
//

plane { y, -1 pigment { color rgb 1 } hollow }


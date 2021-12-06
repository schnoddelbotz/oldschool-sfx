#ifdef(Atmos_Inc_Temp)
// do nothing
#else
#declare Atmos_Inc_Temp = version
#version 3.0

#ifdef(View_POV_Include_Stack)
#   debug "including atmos.inc\n"
#end

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
#version Atmos_Inc_Temp
#end

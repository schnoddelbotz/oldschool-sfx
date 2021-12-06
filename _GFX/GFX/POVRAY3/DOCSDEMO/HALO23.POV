//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "halo2.inc"

sphere { 0, 1.5
  pigment { color rgbt <1, 1, 1, 1> }
  halo {
    attenuating
    spherical_mapping
    linear
    turbulence 1
    color_map {
      [ 0 color rgbt <1, 0, 0,  1> ]
      [ 1 color rgbt <1, 0, 0, -1> ]
    } 
    samples 10
    scale <0.75, 0.5, 1>
    translate <-0.4, 0, 0>
  }
  halo {
    attenuating
    spherical_mapping
    linear
    turbulence 1
    color_map {
      [ 0 color rgbt <1, 0, 0,  1> ]
      [ 1 color rgbt <1, 0, 0, -1> ]
    } 
    samples 10
    scale <0.75, 0.5, 1>
    translate <0.4, 0, 0>
  }
  halo {
    attenuating
    spherical_mapping
    linear
    turbulence 1
    color_map {
      [ 0 color rgbt <1, 0, 0,  1> ]
      [ 1 color rgbt <1, 0, 0, -1> ]
    } 
    samples 10
    scale 0.5
    translate <0, 0.2, 0>
  }
  hollow
}


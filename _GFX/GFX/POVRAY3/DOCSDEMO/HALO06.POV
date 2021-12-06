//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "halo0.inc"

sphere { 0, 1.5
  pigment { color rgbt <1, 1, 1, 1> }
  halo {
    emitting
    spherical_mapping
    linear
    turbulence 0.5
    color_map {
      [ 0 color rgbt <0, 1, 0,  1.0> ]
      [ 1 color rgbt <1, 0, 0, -1.0> ]
    } 
    samples 10
    scale 0.75
  }
  hollow
  scale 1.5
}


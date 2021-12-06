//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "halo3.inc"

box { -1, 1
  pigment { colour rgbt <1, 1, 1, 1> }
  halo { 
    dust
    dust_type 1
    box_mapping
    linear

    turbulence 1
                
    colour_map {
      [ 0 color rgbt <1, 1, 1, 1.0> ]
      [ 1 color rgbt <1, 1, 1, 0.5> ]
    } 

    samples 50
    aa_level 3
    aa_threshold 0.2
    jitter 0.1
  }  
  hollow
  scale 5
} 


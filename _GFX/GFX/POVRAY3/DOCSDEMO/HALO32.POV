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
    constant
                
    colour_map {
      [ 0 color rgbt <1, 1, 1, 1.0> ]
      [ 1 color rgbt <1, 1, 1, 0.0> ]
    } 

    samples 10
  }  
  hollow
  scale 5
} 


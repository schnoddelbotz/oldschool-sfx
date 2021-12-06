//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "skysph1.inc"

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0 color Red]
      [1 color Blue]
    }
    scale 2
    translate -1
  }
}


//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "skysph2.inc"

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.000 0.002 color rgb <1.0, 0.2, 0.0> color rgb <1.0, 0.2, 0.0>]
      [0.002 0.200 color rgb <0.8, 0.1, 0.0> color rgb <0.2, 0.2, 0.3>]
    }
    scale 2
    translate -1
  }
  pigment {
    bozo
    turbulence 0.65
    octaves 6
    omega 0.7
    lambda 2
    color_map {
        [0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
        [0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
        [0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]
    }
    scale <0.2, 0.5, 0.2>
  }
  rotate -135*x
}


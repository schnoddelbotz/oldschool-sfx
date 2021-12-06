//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "color.inc"

camera {
  location <0, 0, -2.5>
  look_at <0, 0, 0>
}

background { color rgb <0.2, 0.4, 0.8> }

light_source { 
  <2.5, 2.5, -2.5>
  colour rgb <1, 1, 1>
  spotlight
  point_at <0, 0, 0>
  radius 12
  falloff 15
  tightness 1
}

difference {
  box { -1, 1 }
  box { <-1.1, -0.8, -0.8>, <1.1, 0.8, 0.8> }
  box { <-0.8, -1.1, -0.8>, <0.8, 1.1, 0.8> }
  box { <-0.8, -0.8, -1.1>, <0.8, 0.8, 1.1> }
  pigment { color rgb <1, 0.2, 0.2> }
  scale 0.5
  rotate 45*y
  rotate 45*x
}


//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"

camera {
  location <0, 1, -4>
  look_at <0, 2, 0>
  angle 82
}

light_source { <10, 10, -10> White }

sphere { 2*y, 1 
  pigment { color rgb <1, 1, 1> }
  finish { ambient 0.2 diffuse 0 reflection 0.6 }
}


//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "color.inc"

camera {
  location <0, 0, -2.5>
  look_at <0, 0, 0>
}

light_source { <10, 10, -10> color rgb 1 shadowless }

plane { z, 2 
  pigment { checker color rgb 0, color rgb 1 } 
  finish { ambient 1 diffuse 0 }
  scale 0.5
  hollow
}


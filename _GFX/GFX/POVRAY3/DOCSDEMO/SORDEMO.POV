//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//

#include "colors.inc"
#include "golds.inc"
 
global_settings { assumed_gamma 2.2 }

camera {
  location <10, 15, -20>
  look_at <0, 5, 0>
  angle 45
}

background { color rgb<0.2, 0.4, 0.8>  }

light_source { <100, 100, -100> color rgb 1 }

plane { y, 0
  pigment { checker color Red, color Green scale 10 }
}

sor {
  8,
  <0.0,  -0.5>,
  <3.0,   0.0>,
  <1.0,   0.2>,
  <0.5,   0.4>,
  <0.5,   4.0>,
  <1.0,   5.0>,
  <3.0,  10.0>,
  <4.0,  11.0>
  texture { T_Gold_1B }
}


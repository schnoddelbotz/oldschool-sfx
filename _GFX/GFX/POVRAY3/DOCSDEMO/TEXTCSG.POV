//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"
#include "stones.inc"

background { color rgb 1 }

camera {
  location <-3, 5, -15>
  look_at 0
  angle 26
}

light_source { <500,500,-1000> White }

difference {
  box { <-3.5, -1, 0.1>, <3.5, 1, 1>
    texture { T_Stone10 }
  }
  text { ttf "timrom.ttf" "POV-RAY 3.0" 0.15, 0
    pigment { BrightGold }
    finish { reflection .25 specular 1 }
    translate -3*x
  }
}


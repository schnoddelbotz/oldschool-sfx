//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//

//
// Note: image.pov has to be traced before this scene can be used.
//
 
#include "colors.inc"

camera{
  location <0, 2, -10>
  look_at 0
  angle 30
}

height_field {
  tga "image.tga"
  smooth
  pigment { White }
  translate <-.5, -.5, -.5>
  scale <17, 1.75, 17>
 }

light_source{ <1000,1000,-1000> White }


//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"
#include "textures.inc"

camera {
  location <10, 5, -20>
  look_at 0
  angle 15
}
background { color rgb <.5, .5, .5> }

light_source{ <10, 50, -100> White }

#declare Tile = superellipsoid {
  <0.5, 0.1>
  scale <1, .05, 1>
}

#declare Offset = 2.1

#declare Row = union {
  object { Tile }
  object { Tile translate z*Offset }
  object { Tile translate z*Offset*2 }
  object { Tile translate z*Offset*3 }
  object { Tile translate z*Offset*4 }
  object { Tile translate z*Offset*5 }
  object { Tile translate z*Offset*6 }
  object { Tile translate z*Offset*7 }
  object { Tile translate z*Offset*8 }
  object { Tile translate z*Offset*9 }
  object { Tile translate z*Offset*10 }
  object { Tile translate -z*Offset }
  object { Tile translate -z*Offset*2 }
  object { Tile translate -z*Offset*3 }
  object { Tile translate -z*Offset*4 }
  object { Tile translate -z*Offset*5 }
  object { Tile translate -z*Offset*6 }
}

union{
  object { Row }
  object { Row translate x*Offset }
  object { Row translate x*Offset*2 }
  object { Row translate x*Offset*3 }
  object { Row translate x*Offset*4 }
  object { Row translate x*Offset*5 }
  object { Row translate x*Offset*6 }
  object { Row translate x*Offset*7 }
  object { Row translate -x*Offset }
  object { Row translate -x*Offset*2 }
  object { Row translate -x*Offset*3 }
  object { Row translate -x*Offset*4 }
  object { Row translate -x*Offset*5 }
  object { Row translate -x*Offset*6 }
  object { Row translate -x*Offset*7 }
  pigment { White_Marble }
  finish { phong 1 phong_size 50 reflection .35 }
}

plane { y, 0  //this is the grout
  pigment { color White }
  finish { ambient .4 diffuse .7 }
}

superellipsoid { 
  <0.1, 1> 
  pigment { Red } 
  translate <5, 3, 0> 
  scale .45 
}

superellipsoid { 
  <1, 0.25> 
  pigment { Blue } 
  translate <-5, 3, 0> 
  scale .45 
}

superellipsoid { 
  <0.2, 0.6> 
  pigment { Green } 
  translate <0, 3, 5> 
  scale .45 
}

superellipsoid { 
  <0.25, 0.25> 
  pigment { Yellow } 
  translate <0, 3, -5> 
  scale .45 
}

superellipsoid { 
  <1, 1> 
  pigment { Pink } 
  translate y*3 
  scale .45 
}


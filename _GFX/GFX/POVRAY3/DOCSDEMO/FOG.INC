//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"

camera {
  location  <0, 20, -100>
}

background { colour SkyBlue }

plane { y, -10
  pigment {
    checker colour Yellow colour Green
    scale 20
  }
}

sphere { <0, 25, 0>, 40
  pigment { Red }
  finish { phong 1.0 phong_size 20 }
}

sphere { <-100, 150, 200>,  20
  pigment { Green }
  finish { phong 1.0 phong_size 20 }
}

sphere { <100, 25, 100>, 30
  pigment { Blue }
  finish { phong 1.0 phong_size 20 }
}

light_source { <100, 120, 40> colour White}


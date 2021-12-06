 
#include "colors.inc"
//#include "textures.inc"

camera {
  location <10, 5, -20>
  look_at 0
  angle 15
}
background { color rgb <.255, .123, .233> }

light_source{ <10, 50, -100> White }

#declare Tile = superellipsoid {
  <0.5, 0.1>
  scale <1, .05, 1>
}

#declare Offset = 2.1

//plane { y, 0  //this is the grout
//  pigment { color White }
//  finish { ambient .4 diffuse .7 }
//}


superellipsoid { 
  <2, 1> 
  pigment { Blue } 
  translate <-5, 3, 0> 
  scale .45 
}


//superellipsoid { 
//  <1, 0.25> 
//  pigment { Blue } 
//  translate <-5, 3, 0> 
//  scale .45 
//}

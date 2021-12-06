// Persistence Of Vision raytracer version 3.0 sample file.
// This scenes shows how to do shear with the matrix transformation.


#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

#declare Col1 = -5
#declare Col2 =  0
#declare Col3 =  5

#declare Row1 =  -4
#declare Row2 =   4

camera {
  orthographic
  location <25, 25, -50>
  right 15*4/3*x
  up 15*y
  look_at  <0, 0, 0>
}

light_source { <200, 200, -200> color rgb <1,1,1> }

//
// Use aloved famous raytrace green/yellow checkered wall
//

plane { z, 2
   pigment {
      checker colour Yellow colour Green
      scale 2
   }
   finish {
      ambient 0.2
      diffuse 0.8
   }
}

//
// Declare object to use.
//

#declare Thing = box { -1, 1 pigment { color Red } }
//#declare Thing = sphere { 0, 1 pigment { color Red } }
//#declare Thing = cylinder { -y, y, 1 pigment { color Red } }
//#declare Thing = torus { 1, 0.2 pigment { color Red } }
/*
#declare Thing = blob {
    threshold 0.6
    component 1.0, 1.0, <.75,     0,     0>
    component 1.0, 1.0, <-.375,  .64952, 0>
    component 1.0, 1.0, <-.375, -.64952, 0>
    pigment { color Red }
}
*/

//
// Place original object.
//

object { Thing }

//
// Place several sheared objects.
//

// Shear in positive x direction
object { Thing 
  matrix <    1,     0,  0,   
              1,     1,  0,    
              0,     0,  1,    
           Col1,  Row1,  0 >
}

// Shear in positive y direction
object { Thing 
  matrix <    1,     1,  0,   
              0,     1,  0,    
              0,     0,  1,    
           Col2,  Row1,  0 >
}

// Shear in positive z direction
object { Thing 
  matrix <    1,     0,  0,
              0,     1,  0, 
              1,     0,  1, 
           Col3,  Row1,  0 >
}

// Shear in negative x direction
object { Thing 
  matrix <    1,     0,  0,   
             -1,     1,  0,    
              0,     0,  1,    
           Col1,  Row2,  0 >
}

// Shear in negative y direction
object { Thing 
  matrix <    1,    -1,  0,   
              0,     1,  0,    
              0,     0,  1,    
           Col2,  Row2,  0 >
}

// Shear in negative z direction
object { Thing 
  matrix <    1,     0,  0,
              0,     1,  0, 
             -1,     0,  1, 
           Col3,  Row2,  0 >
}


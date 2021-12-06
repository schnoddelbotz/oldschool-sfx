// Persistence Of Vision raytracer version 3.0 sample file.
// Persistence Of Vision raytracer version 3.0 sample file.
// This scenes shows how to do shear with the matrix transformation.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

#declare Col1 = -7.5
#declare Col2 = -4.5
#declare Col3 = -1.5
#declare Col4 = +1.5
#declare Col5 = +4.5
#declare Col6 = +7.5

#declare Row1 =  5
#declare Row2 =  0
#declare Row3 = -5

camera {
  orthographic
  location <25, 25, -50>
  right 15 * 4/3 *x
  up 15 * y
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

//
// Declare basic texture.
//

#declare Texture = texture {
  pigment {
    checker colour Red colour Blue
    scale 1
  }
  finish {
    ambient 0.2
    diffuse 0.8
  }
}

//
// Define textures sheared in positive x direction.
//

#declare Texture01 = texture {
  Texture
  matrix <  1,  0,  0,   
            0,  1,  0,    
            0,  0,  1,    
            0,  0,  0 >
}

#declare Texture02 = texture {
  Texture
  matrix <   1,  0,  0,   
           0.2,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

#declare Texture03 = texture {
  Texture
  matrix <   1,  0,  0,   
           0.4,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

#declare Texture04 = texture {
  Texture
  matrix <   1,  0,  0,   
           0.6,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

#declare Texture05 = texture {
  Texture
  matrix <   1,  0,  0,   
           0.8,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

#declare Texture06 = texture {
  Texture
  matrix <   1,  0,  0,   
             1,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

//
// Define textures sheared in positive y direction.
//

#declare Texture07 = texture {
  Texture
  matrix <  1,   0,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

#declare Texture08 = texture {
  Texture
  matrix <  1, 0.2,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

#declare Texture09 = texture {
  Texture
  matrix <  1, 0.4,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

#declare Texture10 = texture {
  Texture
  matrix <  1, 0.6,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

#declare Texture11 = texture {
  Texture
  matrix <  1, 0.8,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

#declare Texture12 = texture {
  Texture
  matrix <  1,   1,  0,   
            0,   1,  0,    
            0,   0,  1,    
            0,   0,  0 >
}

//
// Define textures sheared in positive z direction.
//

#declare Texture13 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
             0,  0,  1,    
             0,  0,  0 >
}

#declare Texture14 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
           0.2,  0,  1,    
             0,  0,  0 >
}

#declare Texture15 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
           0.4,  0,  1,    
             0,  0,  0 >
}

#declare Texture16 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
           0.6,  0,  1,    
             0,  0,  0 >
}

#declare Texture17 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
           0.8,  0,  1,    
             0,  0,  0 >
}

#declare Texture18 = texture {
  Texture
  matrix <   1,  0,  0,   
             0,  1,  0,    
             1,  0,  1,    
             0,  0,  0 >
}

object { Thing translate <Col1, Row1, 0> texture { Texture01 } }

object { Thing translate <Col2, Row1, 0> texture { Texture02 } }

object { Thing translate <Col3, Row1, 0> texture { Texture03 } }

object { Thing translate <Col4, Row1, 0> texture { Texture04 } }

object { Thing translate <Col5, Row1, 0> texture { Texture05 } }

object { Thing translate <Col6, Row1, 0> texture { Texture06 } }

object { Thing translate <Col1, Row2, 0> texture { Texture07 } }

object { Thing translate <Col2, Row2, 0> texture { Texture08 } }

object { Thing translate <Col3, Row2, 0> texture { Texture09 } }

object { Thing translate <Col4, Row2, 0> texture { Texture10 } }

object { Thing translate <Col5, Row2, 0> texture { Texture11 } }

object { Thing translate <Col6, Row2, 0> texture { Texture12 } }

object { Thing translate <Col1, Row3, 0> texture { Texture13 } }

object { Thing translate <Col2, Row3, 0> texture { Texture14 } }

object { Thing translate <Col3, Row3, 0> texture { Texture15 } }

object { Thing translate <Col4, Row3, 0> texture { Texture16 } }

object { Thing translate <Col5, Row3, 0> texture { Texture17 } }

object { Thing translate <Col6, Row3, 0> texture { Texture18 } }


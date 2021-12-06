// Persistence Of Vision raytracer version 3.0 sample file.
//
// Demo using the spiral2 texture ... by Dieter Bayer, May 1994
//
// 9 cylinders with different spiral2 textures.
//
// The scaling factor of the texture, i.e. the number of turns
// one "arm" of the spiral makes, decreases from left to right.
//
// The number of arms of the spiral,
// increases from top to bottom.
//

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"

/* factors used for positioning the discs */

#declare X = 3
#declare Z = 3

/* arms used */

#declare O1 = 3
#declare O2 = 6
#declare O3 = 9

/* scaling used */

#declare S1 = 100
#declare S2 = 1
#declare S3 = 0.2

/* Spiral 1 */

#declare Spiral1 =
texture {
  pigment {
    spiral2 O1
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S1, S1, S1>
}

/* Spiral 2 */

#declare Spiral2 =
texture {
  pigment {
    spiral2 O1
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S2, S2, S2>
}

/* Spiral 3 */

#declare Spiral3 =
texture {
  pigment {
    spiral2 O1
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S3, S3, S3>
}

/* Spiral 4 */

#declare Spiral4 =
texture {
  pigment {
    spiral2 O2
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S1, S1, S1>
}

/* Spiral 5 */

#declare Spiral5 =
texture {
  pigment {
    spiral2 O2
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S2, S2, S2>
}

/* Spiral 6 */

#declare Spiral6 =
texture {
  pigment {
    spiral2 O2
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S3, S3, S3>
}

/* Spiral 7 */

#declare Spiral7 =
texture {
  pigment {
    spiral2 O3
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S1, S1, S1>
}

/* Spiral 8 */

#declare Spiral8 =
texture {
  pigment {
    spiral2 O3
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S2, S2, S2>
}

/* Spiral 9 */

#declare Spiral9 =
texture {
  pigment {
    spiral2 O3
    color_map { [0.0, 1.0  color Red color Green] }
  }
  finish { ambient 0.3 diffuse 0.5 phong 0.5 phong_size 20 }
  scale <S3, S3, S3>
}

camera {
  location <10, 10, -20>
  right <4/3, 0, 0>
  up <0, 1, 0>
  sky <0, 1, 0>
  direction <0, 0, 2.8>
  look_at <0, 0, 0>
}

background { color SkyBlue }

light_source { <15, 15, -20> colour Gray30 }

light_source { <-10, 50, -10> colour Gray30 }

light_source { <0, 50, 0> colour Gray30 }

plane { y, 0
  pigment {
    checker colour Yellow colour Green
    scale 5
  }
  finish {
    ambient 0.2
    diffuse 0.8
  }
}

cylinder { -y, y, 1 
  texture { Spiral1 rotate 90*x } 
  translate <-1*X, 1, +1*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral2 rotate 90*x } 
  translate <0*X, 1, +1*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral3 rotate 90*x } 
  translate <1*X, 1, +1*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral4 rotate 90*x } 
  translate <-1*X, 1, 0*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral5 rotate 90*x } 
  translate <0*X, 1, 0*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral6 rotate 90*x } 
  translate <1*X, 1, 0*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral7 rotate 90*x } 
  translate <-1*X, 1, -1*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral8 rotate 90*x } 
  translate <0*X, 1, -1*Z> 
}

cylinder { -y, y, 1 
  texture { Spiral9 rotate 90*x } 
  translate <1*X, 1, -1*Z> 
}



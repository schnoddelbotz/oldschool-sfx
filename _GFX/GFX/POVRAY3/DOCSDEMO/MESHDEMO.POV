//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
global_settings { assumed_gamma 2.2 }

camera {
  location <20, 20, -50>
  look_at <0, 5, 0>
}

light_source { <50, 50, -50> color rgb<1, 1, 1> }

#declare Red = texture {
  pigment { color rgb<0.8, 0.2, 0.2> }
  finish { ambient 0.2 diffuse 0.5 }
}

#declare Green = texture {
  pigment { color rgb<0.2, 0.8, 0.2> }
  finish { ambient 0.2 diffuse 0.5 }
}

#declare Blue = texture {
  pigment { color rgb<0.2, 0.2, 0.8> }
  finish { ambient 0.2 diffuse 0.5 }
}

mesh {
  /* top side */
  triangle { <-10, 10, -10>, <10, 10, -10>, <10, 10, 10> texture { Red } }
  triangle { <-10, 10, -10>, <-10, 10, 10>, <10, 10, 10> texture { Red } }
  /* bottom side */
  triangle { <-10, -10, -10>, <10, -10, -10>, <10, -10, 10> }
  triangle { <-10, -10, -10>, <-10, -10, 10>, <10, -10, 10> }
  /* left side */
  triangle { <-10, -10, -10>, <-10, -10, 10>, <-10, 10, 10> }
  triangle { <-10, -10, -10>, <-10, 10, -10>, <-10, 10, 10> }
  /* right side */
  triangle { <10, -10, -10>, <10, -10, 10>, <10, 10, 10> texture { Green } }
  triangle { <10, -10, -10>, <10, 10, -10>, <10, 10, 10> texture { Green } }
  /* front side */
  triangle { <-10, -10, -10>, <10, -10, -10>, <-10, 10, -10> texture { Blue } }
  triangle { <-10, 10, -10>, <10, 10, -10>, <10, -10, -10> texture { Blue } }
  /* back side */
  triangle { <-10, -10, 10>, <10, -10, 10>, <-10, 10, 10> }
  triangle { <-10, 10, 10>, <10, 10, 10>, <10, -10, 10> }
  texture {
    pigment { color rgb<0.9, 0.9, 0.9> }
    finish { ambient 0.2 diffuse 0.7 }
  }
}


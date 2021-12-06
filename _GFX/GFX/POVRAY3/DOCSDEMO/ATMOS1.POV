//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
global_settings { assumed_gamma 2.2 }

camera {
  location <-10, 8, -19>
  look_at <0, 5, 0>
  angle 82
}

background { color rgb<0.2, 0.4, 0.8>  }

light_source { <0, 19, 0> color red .5 green .5 blue .5 atmosphere off }

light_source { 
  <40, 25, 0> color rgb <1, 1, 1>
  spotlight
  point_at <0, 5, 0>
  radius 20
  falloff 20
  tightness 1
  atmospheric_attenuation on
}

union {
  difference {
    box { <-21, -1, -21>, <21, 21, 21> }
    box { <-20, 0, -20>, <20, 20, 20> }
    box { <19.9, 5, -3>, <21.1, 15, 3> }
  }
  box { <20, 5, -0.25>, <21, 15, 0.25> }
  box { <20, 9.775, -3>, <21, 10.25, 3> }
  pigment { color red 1 green 1 blue 1 }
  finish { ambient 0.2 diffuse 0.5 }
}


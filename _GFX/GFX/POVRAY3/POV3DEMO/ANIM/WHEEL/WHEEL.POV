// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
//
// This small animation shows the advantage of being able to create
// cyclic animations using the +KC command line switch or the
// equivalent INI-file setting.
//
// Trace this animation with and without the cyclic animation option
// to see the difference. Without the cyclic animation flag set the
// first and the last frames are the same.
//

#version 3.0
global_settings { assumed_gamma 2.2 }

camera {
  location <0, 0, -100>
  look_at <0, 0, 0>
  angle 46
}

#declare Wheel_Texture = texture {
  pigment { color rgb<1, 0.2, 0.2> }
  normal { radial 2 frequency 72 scallop_wave }
}
#declare Spoke_Texture = texture {
  pigment { color rgb<1, 0.2, 0.2> }
}

#declare Wheel = union {
  torus { 20, 2 texture { Wheel_Texture } rotate 90*x }
  cylinder { <0, 0, -1.25> <0, 0, 0>, 5
     pigment { rgb 0.75 }
     normal { radial 2 frequency 12 scallop_wave rotate 90*x }
  }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate   0*z texture { Spoke_Texture } }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate  30*z texture { Spoke_Texture } }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate  60*z texture { Spoke_Texture } }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate  90*z texture { Spoke_Texture } }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate 120*z texture { Spoke_Texture } }
  cylinder { <-20, 0, 0>, <20, 0, 0>, 1 rotate 150*z texture { Spoke_Texture } }
}

object {
  Wheel
  rotate 30*clock*z
  translate -10*z
}

plane { z, 0 pigment { color rgb<0.2, 1, 0.2> } }

light_source { <100, 100, -100> color rgb<1, 1, 1> }


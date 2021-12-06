// Persistence Of Vision raytracer version 3.0 sample file.
// Recursive cluster of mirrored and haloed spheres, by Dan Farmer 1996
// After the classic Sphereflake by Eric Haines

#version 3.0
global_settings { max_trace_level 20  assumed_gamma 2.2 }

#include "colors.inc"
#include "metals.inc"

#declare Small = 1      // 9 spheres
#declare Large = 2      // 91 spheres
#declare Size = Large

// Set to true if you want smooth shadows and don't mind the slowdown
#declare Use_Area_Lights = off

camera { // This is an unusual camera since it is a converted file
   location <2.31, 1.43, 1.65>
   up <0, 0, 1>          // The Z axis is up and
   right <-4/3, 0, 0> // The negative X axis is right
   direction <0, -1.60746, 0> // Field of view 45 degrees
   sky <0, 0, 1>
   look_at <0, 0, -0.1>
   angle 40
}
background { Gray15 }

light_source { <10, -40, 40> color White
#if(Use_Area_Lights)
    area_light x*5, y*5, 5, 5
    adaptive 1
#end
}

light_source { <-30, 10, 50> color White
#if(Use_Area_Lights)
    area_light x*5, y*5, 5, 5
    adaptive 1
#end
}

plane { z, -0.5 pigment { MidnightBlue } finish { reflection 0.25 diffuse 0.5 }}

#declare Glow_Texture =
texture {
   pigment {colour Clear }

   halo {
      //linear
      cubic

      //emitting
      glowing

      spherical_mapping
      max_value 1
      colour_map {
          [ 0.15 color rgbt<0.75, 0.25, 0.75, 0.00> ]
          [ 0.20 color rgbt<0.50, 0.50, 1.00, 0.50> ]
          [ 1.00 color rgbt<1.00, 0.50, 1.00, 0.20> ]
      }
   }
   scale 1.2
}

#declare Obj1 = sphere { 0, 1 hollow texture { Glow_Texture } }
#declare Obj2 = sphere { 0, 0.80 texture { T_Copper_4E } }

// Halo-textured sphereflake
#declare Glow_Flake =
union {
#   if(Size=Small)
        object { Obj1 scale 0.5}
        object { Obj1 scale 0.1666670 translate <-0.172546,-0.643951,  0>        }
        object { Obj1 scale 0.1666670 translate <-0.371785, 0.0996195, 0.544331> }
        object { Obj1 scale 0.1666670 translate <-0.471405, 0.471405,  0>        }
        object { Obj1 scale 0.1666670 translate <-0.643951,-0.172546,  0>        }
        object { Obj1 scale 0.1666670 translate <0.0996195,-0.371785,  0.544331> }
        object { Obj1 scale 0.1666670 translate <0.172546,  0.643951,  0>        }
        object { Obj1 scale 0.1666670 translate <0.272166,  0.272166,  0.544331> }
        object { Obj1 scale 0.1666670 translate <0.471405, -0.471405,  0>        }
        object { Obj1 scale 0.1666670 translate <0.643951,  0.172546,  0>        }
#   else
        object { Obj1 scale 0.5000000 translate <0, 0, 0>  }
        object { Obj1 scale 0.1666670 translate <0.643951, 0.172546, 0>  }
        object { Obj1 scale 0.1666670 translate <0.471405, -0.471405, 0>  }
        object { Obj1 scale 0.1666670 translate <0.272166, 0.272166, 0.544331>  }
        object { Obj1 scale 0.1666670 translate <0.172546, 0.643951, 0>  }
        object { Obj1 scale 0.1666670 translate <0.0996195, -0.371785, 0.544331>  }
        object { Obj1 scale 0.1666670 translate <-0.643951, -0.172546, 0>  }
        object { Obj1 scale 0.1666670 translate <-0.471405, 0.471405, 0>  }
        object { Obj1 scale 0.1666670 translate <-0.371785, 0.0996195, 0.544331>  }
        object { Obj1 scale 0.1666670 translate <-0.172546, -0.643951, 0>  }
        object { Obj1 scale 0.0555556 translate <0.852418, 0.0955788, 7.6165e-17>  }
        object { Obj1 scale 0.0555556 translate <0.802608, 0.281471, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.802608, 0.281471, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.69376, -0.0133465, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.69376, -0.0133465, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.690426, -0.508983, 8.16131e-17>  }
        object { Obj1 scale 0.0555556 translate <0.643951, 0.172546, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.643951, 0.172546, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.607487, -0.335322, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.607487, -0.335322, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.594141, 0.358439, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.594141, 0.358439, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.554344, -0.645066, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.554344, -0.645066, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.471405, -0.471405, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.471405, -0.471405, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.461844, 0.304709, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <0.4293, 0.115031, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <0.420314, 0.420314, 0.618405>  }
        object { Obj1 scale 0.0555556 translate <0.38777, 0.230635, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <0.358439, 0.594141, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.358439, 0.594141, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.335322, -0.607487, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.335322, -0.607487, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.31427, -0.31427, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <0.304709, 0.461844, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <0.281471, 0.802608, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.281471, 0.802608, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.247614, -0.494808, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <0.239622, 0.082487, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <0.230635, 0.38777, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <0.220501, -0.393621, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <0.172546, 0.643951, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.172546, 0.643951, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <0.166275, -0.191247, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <0.153845, -0.574159, 0.618405>  }
        object { Obj1 scale 0.0555556 translate <0.115031, 0.4293, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <0.0955788, 0.852418, -1.3628e-17>  }
        object { Obj1 scale 0.0555556 translate <0.082487, 0.239622, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <0.0329639, -0.552323, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <0.0133465, -0.69376, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.0133465, -0.69376, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <0.0058509, -0.451136, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <-0.835815, -0.157543, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.835815, -0.157543, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.786005, -0.343435, -3.33063e-17>  }
        object { Obj1 scale 0.0555556 translate <-0.69376, 0.0133465, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.69376, 0.0133465, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.645066, 0.554344, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.645066, 0.554344, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.643951, -0.172546, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.643951, -0.172546, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.607487, 0.335322, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.607487, 0.335322, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.594141, -0.358439, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.594141, -0.358439, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.574159, 0.153845, 0.618405>  }
        object { Obj1 scale 0.0555556 translate <-0.552323, 0.0329639, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <-0.508983, 0.690426, -1.91093e-17>  }
        object { Obj1 scale 0.0555556 translate <-0.494808, 0.247614, 0.43322>  }
        object { Obj1 scale 0.0555556 translate <-0.471405, 0.471405, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.471405, 0.471405, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.451136, 0.0058509, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <-0.4293, -0.115031, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <-0.393621, 0.220501, 0.729516>  }
        object { Obj1 scale 0.0555556 translate <-0.358439, -0.594141, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.358439, -0.594141, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.343435, -0.786005, -2.97525e-17>  }
        object { Obj1 scale 0.0555556 translate <-0.335322, 0.607487, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.335322, 0.607487, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.31427, 0.31427, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <-0.248762, -0.0483751, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <-0.191247, 0.166275, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <-0.172546, -0.643951, 0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.172546, -0.643951, -0.222222>  }
        object { Obj1 scale 0.0555556 translate <-0.157543, -0.835815, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.157543, -0.835815, -0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.115031, -0.4293, 0.544331>  }
        object { Obj1 scale 0.0555556 translate <-0.0483751, -0.248762, 0.655442>  }
        object { Obj1 scale 0.0555556 translate <-0.0133465, 0.69376, 0.111111>  }
        object { Obj1 scale 0.0555556 translate <-0.0133465, 0.69376, -0.111111>  }
#   end
}


// Sphereflake
#declare Sphere_Flake =
union {
#   if(Size=Small)
        object { Obj2 scale 0.5}
        object { Obj2 scale 0.1666670 translate <0.272166,  0.272166,  0.544331> }
        object { Obj2 scale 0.1666670 translate <0.643951,  0.172546,  0>        }
        object { Obj2 scale 0.1666670 translate <0.172546,  0.643951,  0>        }
        object { Obj2 scale 0.1666670 translate <-0.371785, 0.0996195, 0.544331> }
        object { Obj2 scale 0.1666670 translate <-0.471405, 0.471405,  0>        }
        object { Obj2 scale 0.1666670 translate <-0.643951,-0.172546,  0>        }
        object { Obj2 scale 0.1666670 translate <0.0996195,-0.371785,  0.544331> }
        object { Obj2 scale 0.1666670 translate <-0.172546,-0.643951,  0>        }
        object { Obj2 scale 0.1666670 translate <0.471405, -0.471405,  0>        }
#   else
        object { Obj2 scale 0.5 translate <0, 0, 0>  }
        object { Obj2 scale 0.1666670 translate <0.643951, 0.172546, 0>  }
        object { Obj2 scale 0.1666670 translate <0.471405, -0.471405, 0>  }
        object { Obj2 scale 0.1666670 translate <0.272166, 0.272166, 0.544331>  }
        object { Obj2 scale 0.1666670 translate <0.172546, 0.643951, 0>  }
        object { Obj2 scale 0.1666670 translate <0.0996195, -0.371785, 0.544331>  }
        object { Obj2 scale 0.1666670 translate <-0.643951, -0.172546, 0>  }
        object { Obj2 scale 0.1666670 translate <-0.471405, 0.471405, 0>  }
        object { Obj2 scale 0.1666670 translate <-0.371785, 0.0996195, 0.544331>  }
        object { Obj2 scale 0.1666670 translate <-0.172546, -0.643951, 0>  }
        object { Obj2 scale 0.0555556 translate <0.852418, 0.0955788, 7.6165e-17>  }
        object { Obj2 scale 0.0555556 translate <0.802608, 0.281471, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.802608, 0.281471, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.69376, -0.0133465, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.69376, -0.0133465, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.690426, -0.508983, 8.16131e-17>  }
        object { Obj2 scale 0.0555556 translate <0.643951, 0.172546, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.643951, 0.172546, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.607487, -0.335322, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.607487, -0.335322, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.594141, 0.358439, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.594141, 0.358439, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.554344, -0.645066, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.554344, -0.645066, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.471405, -0.471405, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.471405, -0.471405, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.461844, 0.304709, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <0.4293, 0.115031, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <0.420314, 0.420314, 0.618405>  }
        object { Obj2 scale 0.0555556 translate <0.38777, 0.230635, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <0.358439, 0.594141, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.358439, 0.594141, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.335322, -0.607487, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.335322, -0.607487, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.31427, -0.31427, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <0.304709, 0.461844, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <0.281471, 0.802608, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.281471, 0.802608, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.247614, -0.494808, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <0.239622, 0.082487, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <0.230635, 0.38777, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <0.220501, -0.393621, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <0.172546, 0.643951, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.172546, 0.643951, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <0.166275, -0.191247, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <0.153845, -0.574159, 0.618405>  }
        object { Obj2 scale 0.0555556 translate <0.115031, 0.4293, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <0.0955788, 0.852418, -1.3628e-17>  }
        object { Obj2 scale 0.0555556 translate <0.082487, 0.239622, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <0.0329639, -0.552323, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <0.0133465, -0.69376, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.0133465, -0.69376, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <0.0058509, -0.451136, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <-0.835815, -0.157543, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.835815, -0.157543, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.786005, -0.343435, -3.33063e-17>  }
        object { Obj2 scale 0.0555556 translate <-0.69376, 0.0133465, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.69376, 0.0133465, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.645066, 0.554344, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.645066, 0.554344, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.643951, -0.172546, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.643951, -0.172546, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.607487, 0.335322, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.607487, 0.335322, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.594141, -0.358439, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.594141, -0.358439, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.574159, 0.153845, 0.618405>  }
        object { Obj2 scale 0.0555556 translate <-0.552323, 0.0329639, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <-0.508983, 0.690426, -1.91093e-17>  }
        object { Obj2 scale 0.0555556 translate <-0.494808, 0.247614, 0.43322>  }
        object { Obj2 scale 0.0555556 translate <-0.471405, 0.471405, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.471405, 0.471405, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.451136, 0.0058509, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <-0.4293, -0.115031, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <-0.393621, 0.220501, 0.729516>  }
        object { Obj2 scale 0.0555556 translate <-0.358439, -0.594141, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.358439, -0.594141, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.343435, -0.786005, -2.97525e-17>  }
        object { Obj2 scale 0.0555556 translate <-0.335322, 0.607487, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.335322, 0.607487, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.31427, 0.31427, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <-0.248762, -0.0483751, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <-0.191247, 0.166275, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <-0.172546, -0.643951, 0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.172546, -0.643951, -0.222222>  }
        object { Obj2 scale 0.0555556 translate <-0.157543, -0.835815, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.157543, -0.835815, -0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.115031, -0.4293, 0.544331>  }
        object { Obj2 scale 0.0555556 translate <-0.0483751, -0.248762, 0.655442>  }
        object { Obj2 scale 0.0555556 translate <-0.0133465, 0.69376, 0.111111>  }
        object { Obj2 scale 0.0555556 translate <-0.0133465, 0.69376, -0.111111>  }
#   end
}

object { Glow_Flake }
object { Sphere_Flake }

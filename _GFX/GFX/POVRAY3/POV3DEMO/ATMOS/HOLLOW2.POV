//
// Persistence Of Vision raytracer version 3.0 sample scene by Dieter Bayer.
//
// This scene shows the effect of solid vs. hollow objects.
//
// Both spheres in this scene are enclosed by a halo container object.
//
// The left sphere is solid, i.e. it's not filled with the halo.
// The right sphere is hollow, i.e. it's filled with the halo.
//
// Note that you can see some discontinuities in the halo of the 
// right sphere. This is caused be the refraction. After the rays
// are bent they travel through the halo on a different path
// resulting in a different result than that for an unbend ray,
// which would show no discontinuities.
//

#global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
   location  <0, 20, -100>
   direction <0,  0,    1>
   up        <0,  1,    0>
   right   <4/3,  0,    0>
}

//
// Put down the beloved famous raytrace blue/green checkered floor
//

plane { y, -10
   pigment {
      checker colour Blue colour Green
      scale 20
   }
   finish {
      ambient 0.2
      diffuse 0.8
   }
   hollow
}

//
// Use beloved famous raytrace blue/green checkered wall
//

plane { z, 50
   pigment {
      checker colour Blue colour Green
      scale 20
   }
   finish {
      ambient 0.2
      diffuse 0.8
   }
   hollow
}

//
// Declare halo.
//

#declare Halo = texture {
  pigment { colour Clear }
  halo {
    emitting
    spherical_mapping
    linear
    turbulence 0.1
    colour_map {
      [ 0 color rgbt <1, 0, 0,   1> ]
      [ 1 color rgbt <1, 1, 0, -10> ]
    } 
    samples 5
  }
} 

//
// Solid, translucent sphere enclosed by halo.
//

sphere { <-29, 20, 0>, 25
  pigment { rgbt<1, 1, 1, 0.9> }
  finish {
    ambient 0.0
    diffuse 0.0
    phong 1.0
    phong_size 200
    refraction 1
    ior 1.1
  }
  hollow no
}

sphere { 0, 1 texture { Halo } scale 28 translate <-29, 20, 0> hollow }

//
// Hollow, translucent sphere enclosed by halo.
//

sphere { <29, 20, 0>, 25
  pigment { rgbt<1, 1, 1, 0.9> }
  finish {
    ambient 0.0
    diffuse 0.0
    phong 1.0
    phong_size 200
    refraction 1
    ior 1.1
  }
  hollow yes
}

sphere { 0, 1 texture { Halo } scale 28 translate <29, 20, 0> hollow }

//
// Cast some light.
//

light_source {
  <500, 600, -200> 
  colour White
}


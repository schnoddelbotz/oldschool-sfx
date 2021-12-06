// Persistence Of Vision raytracer version 3.0 sample file.
// File by Tom Price
// Modification to two-layer wood texture by Dan Farmer 01/92
// Image should be run at 640x480 or greater to take full advantage of
// the wood texture, preferably with a rather tight anti-aliasing threshold.
// Also commented out the random dithering values and bounded the coin
// object.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

// a dark wood with a greenish hue to it
#declare New_Dark_Wood1 = pigment {
   wood
   turbulence 0.02
   colour_map {
      [0.0 0.8  colour red  0.42857 green 0.23810 blue 0.04762
                colour red  0.42857 green 0.23810 blue 0.04762]
      [0.8 1.01 colour red 0.4 green 0.333 blue 0.066
                colour red 0.2 green 0.033 blue 0.033]
   }
}

// Overlaying woodgrain
#declare New_Dark_Wood2 = pigment {
   wood
   turbulence 0.022
   colour_map {
      [0.0 0.5  colour Clear  colour Clear]
      [0.5 1.01 colour red 0.4 green 0.333 blue 0.066 filter 0.5
                colour red 0.2 green 0.033 blue 0.033 filter 0.25]
   }
}

camera {
   location <0.0, 75.0, -100.0>
// direction <0.0, -0.5, 1.0>
   direction <0.0, 0.0, 1.20>
   up <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
   look_at <0.0 25.0 , 0.0>
}

plane {
   y, -10

   texture {
      pigment {
         New_Dark_Wood1
         scale <.25, .25, 1>
         rotate 90*y
         quick_color Brown
      }
      finish {
         ambient 0.8
         diffuse 0.2
         reflection 0.4
         brilliance 3.0
      }
   }

   texture {
      pigment {
         New_Dark_Wood2
         scale <.25, .25, 1>
         rotate <0, 90, 1.5>
         quick_color Brown
      }
   }
}

plane {
   y, 200

   texture {
      pigment { color blue 0.5 red 0.2 green 0.2 }
      finish {
         ambient 0.5
         diffuse 0.5
      }
   }
}

light_source { <60.0, 100.0, -110.0> color White }

light_source { <-60.0, 100.0, -110.0> color LightGray }


#declare Coin = intersection {
   object { Cylinder_Y scale <20.0, 1.0, 20.0> }
   plane { y, 1 }
   plane { y, -1 inverse }

   bounded_by { sphere { <0, 0, 0> 21} }

   texture {
      pigment { color red 1.0 green 0.89 blue 0.55 }
      finish {
         ambient 0.2  diffuse 0.6
         reflection 0.6
         brilliance 4.0
         specular 0.5
         metallic
      }
   }
}

object {
   Coin
   rotate <-15.0, 0.0, -2.0>
   translate <-27.0, -2.0, -3.0>
}

object {
   Coin
   rotate -15.0*x
   translate <-28.0, 3.0, 2.0>
}

object {
   Coin
   rotate -15.0*x
   translate <-30.0, 10.0, 0.0>
}

object {
   Coin
   rotate -15.0*x
   translate <-29.0, 20.0, -2.0>
}

object {
   Coin
   rotate <-15.0, 0.0, -10.0>
   translate <-31.0, 30.0, 3.0>
}

object {
   Coin
   rotate -15.0*y
   translate <-26.0, 40.0, 5.0>
}

object {
   Coin
   rotate <-25.0, 0.0, 15.0>
   translate <-23.0, 50.0, 8.0>
}

// A reflective sphere
sphere {
   <40, 25, 40>, 35

   texture {
      pigment { White }
      finish {
         ambient 0.1
         diffuse 0.3
         reflection 0.95
         brilliance 5.0
      }
   }
}

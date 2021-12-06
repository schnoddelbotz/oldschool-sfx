// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

// Special re-write of "Shiny" declaration.  Will override textures.inc.
#declare Shiny = finish {
   phong 1
   phong_size 200
   reflection 0.25
   ambient 0.15
   diffuse 0.75
}

#include "poolball.inc"

/* ***************** set up the view & light sources **************************/

camera {
   location <0.0, 6.0, -15.0>
   direction <0.0, 0.0, 1.5>
   up  <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
   look_at <0, -1, 0>
}

/* Overhead spotlight */
light_source {
    <0.0, 200.0, -3.0> color White
    spotlight
    point_at <0, 1, 3>
    tightness 800
    radius 8
    falloff 25
}

/* ************************** set up the table ********************************/

/* Felt table top */
plane { y, -1
   finish {
      crand 0.15
      ambient 0.2
      diffuse 0.8
   }
   pigment { MediumForestGreen }
}

/* Cue stick */
object { CueStick
   scale  <0.15, 0.15, 1.0>         /* Skinny and long */
   translate -7.5*z
}

/* Cue Ball */
object { Ball
   pigment { White }
   finish {
      Shiny
      crand 0.015
      ambient 0.25
   }

   translate -6*z
}

/* **************************** set up the balls ********************************/
// (The rotations here are just random values to rotate the stripes)

/* Row #1 */
object { _1_Ball }

/* Row #2 */
object { _3_Ball
   translate <1.0, 0.0, 1.732>
}

object { _10_Ball
   rotate <0.0, 0.0, -80>
   translate <-1.0, 0.0, 1.732>
}

/* Row #3 */
object { _11_Ball
   rotate <45.0, -35.0, -12.0>
   translate <2.0, 0.0, 3.464>
}

object { _8_Ball
   translate <0.0, 0.0, 3.464>
}

object { _5_Ball
   translate <-2.0, 0.0, 3.464 >
}


/* Row #4 */
object { _2_Ball
   translate <-3.0, 0.0, 5.196 >
}

object { _7_Ball
   translate <-1.0, 0.0, 5.196 >
}

object { _4_Ball
   translate <1.0, 0.0, 5.196 >
}

object { _14_Ball
   rotate <0.0, -15.0, -2.0>
   translate <3.0, 0.0, 5.196 >
}


/* Row #5 */
object { _15_Ball
   translate <-4.0, 0.0, 6.928 >
}

object { _13_Ball
   rotate <-5.0, 11.0, -1.0>
   translate <-2.0, 0.0, 6.928 >
}

object { _9_Ball
   rotate <-80.0, -13.0, 29.0>
   translate <0.0, 0.0, 6.928 >
}

object { _12_Ball
   rotate <15.0, 15.0, -2.0>
   translate <2.0, 0.0, 6.928>
}

object { _6_Ball
   translate <4.0, 0.0, 6.928>
}

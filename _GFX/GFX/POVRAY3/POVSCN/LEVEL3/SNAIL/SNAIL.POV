// Persistence Of Vision raytracer version 3.0 sample file.

#version 1.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "mmshape.inc"
#include "textures.inc"
#include "thesnail.inc"
#include "hallway.inc"


camera {
   location <0, 250, -300>
   direction <0, 0, 1>
   up <0, 1, 0>
   right <4/3, 0, 0>
   look_at <0, 58, 0>
}

sky_sphere {
   pigment { MidnightBlue }
}

object { light translate <600, 400, -1000> }
object { light translate <-1000, 2000, -200> }

/*------------------------ The Wet Spot ------------------------*/
#declare puddle = union {
   sphere { <0, 0, 0>, 1 scale <100, 2, 50> }
   sphere { <0, 0, 0>, 1 scale <150, 2, 70> translate <100, 0, 10> }

   texture { finish { Mirror } pigment { White } }
}


/*---------------- BUILD STAGE --------------------------------------------*/

object { the_floor scale <0.6, 0.6, 0.6> rotate 90*x translate <50, 0, 120> }
object { thesnail scale <1.5, 1.5, 1.5> rotate <0, -12, 0> translate <-130, 20, -60> }
object { wall translate <-310, 0, 200> }
object { wall scale <1.4, 0.8, 1> translate <200, 0, 530> }
object { body scale 1.7 rotate -90*y rotate -5*z translate <245, -23, -75> }
object { puddle translate <100, 5, -95> }


/*-----------------TEST FLOOR -----------------------*/
/*
plane {
   y, 0
   texture { pigment { Gray } }
}
*/

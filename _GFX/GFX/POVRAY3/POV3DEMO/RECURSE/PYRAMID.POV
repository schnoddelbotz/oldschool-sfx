/*
        iterated fractal * sample recursion

        Sven Hilscher * 3D-Max usergroup germany
        email: sven@rufus.central.de
*/

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"

union {

  #declare radius_max = 4
  #declare level = 5

  #declare x_pos = 0
  #declare y_pos = 0
  #declare z_pos = 0

  #declare dir = 1
                 // 1 = z->
                 // 2 = x->
                 // 3 = x<-
                 // 4 = y->
                 // 5 = y<-

  // go subroutine
  #include "pyramid.inc"

  //texture {  pigment { color rgb <1,1,0> } }
  texture { Polished_Chrome }
}

light_source { <2,20,10> color rgb <1,1,1> }

background { color rgb <.4, .3, .2> }

camera { location <5,17,19>
         look_at  <0,0,0>
}

// Persistence Of Vision raytracer version 3.0 sample file.
// File by Drew Wells
// A haunted tomb on a hill, gravestones, rusty fence, pumpkin patch.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "stones.inc"

/* Camera */
camera {
   direction <0.0, 0.0,  1.5>
   up  <0.0,  1.0,  0.0>
   right <-4/3, 0.0, 0.0>
   translate < -15.0,  5.0,  120.0>
   look_at <10.0, 12.0, 55.0>
}
#declare TombTex = texture { T_Stone8 finish { ambient .1 } scale 0.5 }
#declare HeadTex = texture { T_Stone3  }
#declare ColTex  = texture { T_Stone13 finish { phong .3 } scale .2 }
#declare Rust2 = texture { T_Stone1 }


#declare Yellow_Clouds = pigment {
   bozo
   turbulence 0.6
   colour_map {
      [0.0 0.3   colour red 0.9 green 0.5  blue 0.3
                 colour red 0.6 green 0.4  blue 0.0]
      [0.3 0.6   colour red 0.6 green 0.4  blue 0.0
                 colour red 0.4 green 0.4  blue 0.0 filter 1.0]  
      [0.6 0.8   colour red 0.4 green 0.4  blue 0.0 filter 1.0
                 colour Clear]  
      [0.8 1.001 colour Clear
                 colour Clear]
   }
}

#declare Sunset_Sky = pigment {
   gradient y
   
   colour_map {
      [0.0 0.4   colour red 0.8 green 0.0 blue 0.0
                 colour red 0.4 green 0.0 blue 0.4]
      [0.4 0.6   colour red 0.4 green 0.0 blue 0.4
                 colour red 0.0 green 0.0 blue 0.2]
      [0.6 1.001 colour red 0.0 green 0.0 blue 0.2
                 colour red 0.0 green 0.0 blue 0.1]
   }
   scale 700.0
}


/*************************************************/
/* Define objects for use in scene               */
/*************************************************/

#declare Cross = union {
   /* Tried to make celtic cross, but vga resolution is too coarse */
/*
      intersection {
         object {
            Cylinder_Z
            scale 0.4
            translate <0.0, 0.45, 0.0>
         }
         plane { -z, 0.02 }
         plane { z, 0.02 }
      }
 */

   /*vertical part*/
   intersection {
      /*top & bottom*/
      plane { y, 1.0 }
      plane { -y, 2.0 }
      /*front & back*/
      plane { z, 0.12 }
      plane { -z, 0.12 }
      /*left & right*/
      plane { x, 0.15 }
      plane { -x, 0.15 }
   }

   /*horizontal part*/
   intersection {
      /*top & bottom*/
      plane { y, 0.6 }
      plane { -y, -0.3 }
      /*front & back*/
      plane { z, 0.12 }
      plane { -z, 0.12 }
      /*left & right walls*/
      plane { x, 0.7 }
      plane { -x, 0.7 }
   }

   bounded_by { box { <-.8, -2.1, -.2>,  <.8, 1.1, .8> } }

   texture {
      HeadTex
      scale 0.1
      finish {
         ambient 0.1
         diffuse 0.7   
      }
   }
}

#declare Headstone = union {
   intersection {      
      object { Cylinder_Z }
      plane { -z, 0.1 }
      plane { z, 0.1 }
   }            

   intersection {
      /*top & bottom*/ 
      plane { y, 0.0 }
      plane { -y, 2.0 }
      /*front & back*/
      plane { z, 0.1 }
      plane { -z, 0.1 }
      /*left & right */
      plane { x, 1.0 }
      plane { -x, 1.0 }
   }

   texture { 
      HeadTex
      scale <0.1, 0.2, 0.1>

      finish {
         ambient 0.1
         diffuse 0.7   
      }
   }
}


#declare Pole = object { Cylinder_Y scale <0.1, 1.0, 0.1> }


#declare Xpole = object { Cylinder_X scale <0.1, 0.1, 0.1> }

/* Rusty iron gate & fence - object should have been composite to avoid the */
/*                           "carved from one piece" look. */
#declare Gate = union {
   intersection {
      object { Xpole }
      plane { x, 8.0 }
      plane { -x, 2.0 }
      translate 6.5*y
   }
   intersection {
      object { Xpole }
      plane { x, 8.0 }
      plane { -x, 2.0 }
      translate 1.9*y
   }
   intersection {
      object { Pole }
      plane { y, 7.5 }
      plane { -y, 0.0 }
      translate 1.0*x
   }
   sphere { <1.0, 7.5, 0.0>, 0.3 }
   intersection {
      object { Pole }
      plane { y, 7.75 }
      plane { -y, 0.2 }
      translate 2.5*x
   }
   sphere { <2.5, 7.75, 0.0>, 0.3 }
   intersection {
      object { Pole }
      plane { y, 8.0 }
      plane { -y, 0.2 }
      translate 4.0*x
   }
   sphere { <4.0, 8.0, 0.0>, 0.3 }
   intersection {
      object { Pole }
      plane { y, 7.75 }
      plane { -y, 0.2 }
      translate 5.5*x
   }
   sphere { <5.5, 7.75, 0.0>, 0.3 }
   intersection {
      object { Pole }
      plane { y, 7.5 }
      plane { -y, 0.2 }
      translate 7.0*x
   }
   sphere { <7.0, 7.5, 0.0>, 0.3 }

   bounded_by { box { <0.0, 0.0, -1.0>, <8.0, 9.0, 1.0> } }

   texture { 
      Rust2
      finish {
         ambient 0.2
         diffuse 0.9   
      }
   }    
}

/* a rectangular pad to serve as a footing for the column */
#declare BasePad = box {
   <-1.2, -0.25, -1.2>, <1.2, 0.25, 1.2>
   pigment { colour red 0.6 green 0.6 blue 0.4 }
}

#declare ColTop = union {
   box { <-1.5, -.1, -1.5>, <1.5, .2, 1.5> }
   box { <-1.25, .2, -1.25> <1.25, .4, 1.25> }
   box { <-1, .4, -1> <1, .6, 1> }

   pigment { color red .6 green .6 blue .4 }
}

#declare Beam = object { Cylinder_Y }

#declare Beam2 = object {
   Cylinder_Y
   inverse
   scale  <.3, 1, .3>
   translate 1.4*x
}

#declare Beam3 = intersection {
   object { Beam  scale <1.2, 1, 1.2> }
   object { Beam2 }
   object { Beam2 rotate  -45*y }
   object { Beam2 rotate  -90*y }
   object { Beam2 rotate -135*y }
   object { Beam2 rotate  180*y }
   object { Beam2 rotate   45*y }
   object { Beam2 rotate   90*y }
   object { Beam2 rotate  135*y }
   plane { y, 8 }
   plane { -y, 0 }

   pigment { color red .8 green 0 blue .0 }
}

#declare Column = union {
   object { Beam3   texture { ColTex } }
   //object { BasePad texture { ColTex finish {phong 0} } translate <0, 0, 0> }
   object { ColTop texture { ColTex finish {phong 0} } translate <0, 8, 0> }
}


#declare Tomb = union {
   difference {
      box { <-10, -5, -7.5>, <10, 10, 7.5> } // bulk
      box { <-3, -5, -7.0>, <3, 7, 7.6> } // door
   }
   /* Foundation */
   box { <-11, -2, -10.5>, <11, -1, 10.5> }
   box { <-12, -3, -11>,   <12, -2, 11> }
   box { <-13, -4, -12>,   <13, -3, 12> }
   box { <-14, -5, -13>,   <14, -4, 13> }

   bounded_by { box { <-14.1, -5.1, -13.1>, <14.1, 10.1, 18.6> } }
}

#declare InnerBeams = union {
   intersection {
      object { Beam }
      plane { y, 8.0 }
      plane { -y, 2.0 }
      translate < 5.0, 0.0, 7.5>
   }
   intersection {
      object { Beam }
      plane { y, 8.0 }
      plane { -y, 2.0 }
      translate < -5.0, 0.0, 7.5>
   }

   pigment { Blue }
}


#declare Pointy = object {
   /*pointy part*/
   intersection {
      plane { -y, 1 }
      plane { -z, 1 }
      plane { z, 1 rotate  27*y  rotate 40*x }
      plane { z, 1 rotate -27*y  rotate 40*x }
      plane { +x, 0 rotate   70*z }
      plane { -x, 0 rotate  -70*z }
      scale <3, 4, 1>
      translate < 0, 12, 8.5>
   }

   pigment { Blue }
}


#declare CornerBeams = union {
   intersection {
      object { Beam scale <1.5, 1.0, 1.5>}
      plane { y, 10.0 }
      plane { -y, 2.0 }
      translate < 10.0, 0.0, 7.5>
   }
   intersection {      
      object { Beam scale <1.5, 1.0, 1.5> }
      plane { y, 10.0 }
      plane { -y, 2.0 }
      translate <-10.0, 0.0, 7.5>
   }
   sphere { <-10.0, 10.0, 7.5>, 1.5 }
   sphere { < 10.0, 10.0, 7.5>, 1.5 }

   pigment { Blue }
}

/* Ghost in tomb doorway */
#declare Figure = intersection {
   object { Beam scale <2.3, 1.0, 2.3> }
   plane { y, 8.0 }
   plane { -y, 2.0 }
   translate 4.3*z

   texture {
      pigment {
         granite
         /* Use any ghost image you like for the tomb doorway or comment */
         /* out the Figure in TombAll */
         /*imagemap { gif "ghost.gif" once interpolate 2.0 } */
         scale < 6.5, 8.0, 6.5 >
         translate < -1.0, 7.5, 4.3 >
         quick_color Black
      }
      finish {
         ambient 0.10
         diffuse 0.3
      }
   }
}

/* TombAll is the completed tomb */
#declare TombAll = union {
   object { Tomb texture { TombTex } }
   object { InnerBeams texture { T_Stone21 } }
   object { Pointy texture { T_Stone4 } }
   object { CornerBeams texture { T_Stone18 scale <.5, .5, .5> } }
}

/* Pumpkin parts */
#declare Stem = intersection {
   object { Pole }
   plane { y, 0.04 rotate <0.0, -10.0, -10.0> }
   plane { -y, 1.0 }
   translate <0.0, 0.3, 0.0>

   texture {
      pigment { color red 0.04 green 0.33 blue 0.05 }
      normal {
         bumps 0.5
         scale 0.2
      }
      finish {
         ambient 0.1
         diffuse 0.9   
      }
   }
}

#declare Slice = sphere {
   <0, 0, 0>, 1
   translate <0.0, 0.0, 0.5>
   scale <0.28, 0.30, 0.40>
}

#declare Pumpkin = union {
   object { Slice }
   object { Slice  rotate  -20.0*y }
   object { Slice  rotate  -40.0*y }
   object { Slice  rotate  -60.0*y }
   object { Slice  rotate  -80.0*y }
   object { Slice  rotate -100.0*y }
   object { Slice  rotate -120.0*y }
   object { Slice  rotate -140.0*y }
   object { Slice  rotate -160.0*y }
   object { Slice  rotate -180.0*y }
   object { Slice  rotate -200.0*y }
   object { Slice  rotate -220.0*y }
   object { Slice  rotate -240.0*y }
   object { Slice  rotate -260.0*y }
   object { Slice  rotate -280.0*y }
   object { Slice  rotate -300.0*y }
   object { Slice  rotate -320.0*y }
   object { Slice  rotate -340.0*y }

   bounded_by { sphere { <0, 0, 0>, 1.5 } }

   texture {
      pigment { color red 0.5 green 0.22 blue 0.1 }
      normal {
         bumps 0.3
         scale 0.1
      }
      finish {
         ambient 0.1
         diffuse 0.9
         phong 0.75
         phong_size 30.0
      }
   }
}


/*******************************************/
/* Scene description     */
/*******************************************/

object {
   Cross
   scale <1.7, 2.0, 1.0>
   rotate -15.0*x
   translate <-16.0, 7.7, 61.5>    
}

object {
   Headstone
   scale <1.0, 1.0, 1.0>
   rotate 15.0*x
   translate <-14.0, 4.0, 76.0>
}

object {
   Headstone
   scale <1.0, 1.0, 1.0>
   translate <12.0, 4.0, 74.0>
}

object {
   Headstone
   scale <1.0, 1.0, 1.0>
   rotate -10.0*x
   translate <18.0, 8.0, 70.0>
}

object {
   Cross
   scale <1.5, 2.0, 1.0>
   rotate -15.0*x
   translate <17.0, 10.0, 60.0>
}

object {
   Cross
   scale <1.5, 2.0, 1.0>
   rotate -15.0*x
   translate <26.0, 10.0, 70.0>
}

object {
   Cross
   scale <1.5, 2.0, 1.0>
   rotate <-15.0, 0.0, -10.0>
   translate <31.0, 10.0, 78.0>
}


/* Little Pumpkin Patch */
object {
   Pumpkin
   scale <1.5, 2.0, 1.5>
   translate <5.0, 1.55, 95.0>
}

object {
   Stem
   scale <1.5, 2.5, 1.5>
   translate < 5.0, 1.55, 95.0>
}

object {
   Pumpkin
   scale <1.5, 2.5, 1.5>
   translate < 11.0, 1.6, 90.0>
}

object {
   Stem
   scale <1.5, 2.5, 1.5>
   translate < 11.0, 1.6, 90.0>
}


/* Ghastly Tomb!*/
object {
   TombAll
   rotate <7.0, 15.0, 0.0>
   translate <0.0, 16.0, 38.0>
}

/*left entry gate*/
object {
   Gate
   translate <-9.0, 0.0, 88.0>
}

/*right entry gate*/
object {
   Gate
   rotate <-10.0, -160.0, 0.0>
   translate <7.0, 0.0, 87.5>
}

/*Use gate object to make left & right fence*/
object {
   Gate
   translate <-19.0, 0.0, 88.0>
}

object {
   Gate
   translate <-31.0, 0.0, 88.0>
}

object {
   Gate
   translate <9.0, 0.0, 88.0>
}

object {
   Gate
   translate <19.0, 0.0, 88.0>
}

/* Columns to hold the fence and gates up */
object { Column translate <-20.0, 0.0, 88.0> }
object { Column translate <-10.0, 0.0, 88.0> }
object { Column translate < 8.0, 0.0, 88.0> }
object { Column translate < 18.0, 0.0, 88.0> }

/*hill under tomb*/
object {
   Paraboloid_Y
   scale <40.0, 10.0, 77.0>
   rotate <0.0, 0.0, 180.0>
   translate <0.0, 21.0, -28.0>

   texture {
      pigment { color red 0.5 green 0.6 blue 0.2 }
      normal {
         bumps 0.8
         scale 5.0
      }
      finish {
         ambient 0.1
         diffuse 0.7    
      }
   }                                         
}

/*hill to right of tomb*/
object {
   Paraboloid_Y
   scale <30.0, 10.0, 40.0>
   rotate 180.0*z
   translate <40.0, 14.0, 50.0>

   texture {
      pigment { color red 0.6 green 0.6 blue 0.1 }
      normal {
         bumps 0.8
         scale < 7.0, 5.0, 5.0>
      }
      finish {
         ambient 0.1
         diffuse 0.7
      }
   }
}

/* Ground */
plane {
   y, 1.0

   texture {
      pigment { color red 0.6 green 0.6 blue 0.1 }
      normal {
         bumps 0.7
         scale < 1.0, 1.0, 1.0>
      }
      finish {
         ambient 0.1
         diffuse 0.7
      }
   }
}

/*The Sun*/
light_source { <150.0, 30.0, 1200.0> color red 1 green .8 blue .65 }

/* Sky - gradient sunset*/
sphere {
   <0.0, 0.0, 0.0>, 2000.0
   inverse

   texture {
      pigment {
         Sunset_Sky
         translate 200.0*y
         scale 1.2
         quick_color Green
      }
      finish {
         ambient 0.6
         diffuse 0.0
      }
   }
}

/* Clouds - uses a sky texture with the sky portion defined as transparent */
/*          so the gradient behind it is visible  */
sphere {
   <0.0, 0.0, 0.0>, 1997.0
   texture {
      pigment {
         Yellow_Clouds
         scale <1000.0 30.0 100.0>
         quick_color Green
      }
      finish {
         ambient 0.7
         diffuse 0.0
      }
   }
}

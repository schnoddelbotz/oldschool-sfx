/*
 * chess.pov
 *
 * POV-Ray 3.0 scene description for chess board
 *
 * Copyright (c) 1991, 1996 Ville Saari
 *
 * Created: 01-Feb-91
 * Updated: 01-Jul-96
 *
 * Author:
 *
 *   Ville Saari
 *   Tallbergin puistotie 7 B 21
 *   00200 Helsinki
 *   FINLAND
 *
 *   EMail: vs@iki.fi
 */

include "shapes.inc"

global_settings { assumed_gamma 1.8 }
default { finish { ambient .3 diffuse .7 } }
declare r=seed(54321)

camera { location <59, 20, -48> look_at <0, 0, 1> }

light_source { <800, 600, -200> rgb 1 }

declare Pawn = union
   {
   sphere { 7*y, 1.5 }
   sphere { 0, 1 scale <1.2, .3, 1.2> translate 5.5*y }

   intersection
      {
      plane { y, 5.5 }
      object { Hyperboloid_Y translate 5*y scale <.5, 1, .5> }
      plane { -y, -2.5 }

      bounded_by { sphere { 3.75*y, 1.86 } }
      }

   sphere { 0, 1 scale <2, .5, 2> translate 2.3*y }

   intersection
      {
      sphere { 0, 2.5 }
      plane { -y, 0 }
      }
   }

declare Rook = union
   {
   difference
      {
      cylinder { 8*y, 10*y, 2 }
      object { Cylinder_Y scale <1.2, 1, 1.2> }
      box { <-.5, 9, -2.5>, <.5, 10.5, 2.5> }
      box { <-2.5, 9, -.5>, <2.5, 10.5, .5> }

      bounded_by { sphere { 9*y, sqrt(5) } }
      }

   intersection
      {
      plane { y, 8 }
      object { Hyperboloid_Y scale <1, 1.5, 1> translate 5.401924*y }
      plane { -y, -3 }

      bounded_by { sphere { 5.5*y, 3.14 } }
      }

   sphere { 0, 1 scale <2.5, .5, 2.5> translate 2.8*y }

   intersection
      {
      sphere { 0, 3 }
      plane { -y, 0 }
      }
   }

declare Knight = union
   {
   intersection
      {
      object { Cylinder_Z scale 17.875 translate <-18.625, 7, 0> inverse }
      object { Cylinder_Z scale 17.875 translate <18.625, 7, 0> inverse }
      object { Cylinder_X scale 5.1 translate <0, 11.2, -5> inverse }

      union
         {
         plane { y, 0 rotate 30*x translate 9.15*y }
         plane { z, 0 rotate -20*x translate 10*y }
         }

      union
         {
         plane { -y, 0 rotate 30*x translate 7.15*y }
         plane { y, 0 rotate 60*x translate 7.3*y }
         }

      union
         {
         plane { y, 0 rotate -45*z }
         plane { y, 0 rotate 45*z }
         translate 9*y
         }

      object { Cylinder_Y scale 2 }
      sphere { 7*y, 4 }

      bounded_by { sphere { 7*y, 4 } }
      }

   sphere { 0, 1 scale <2.5, .5, 2.5> translate 2.8*y }

   intersection
      {
      sphere { 0, 3 }
      plane { -y, 0 }
      }
   }

declare Bishop = union
   {
   sphere { 10.8*y, .4 }

   intersection
      {
      sphere { 0, 1 scale <1.4, 2.1, 1.4> translate 8.4*y }
      plane { -y, -7 }
      box { <-2, 0, -.25>, <2, 4, .25> rotate 30*x translate 8.5*y inverse }

      bounded_by { sphere { 0, 1 scale <1.4, 2.1, 1.4> translate 8.4*y } }
      }

   sphere { 0, 1 scale <1.5, .4, 1.5> translate 7*y }

   intersection
      {
      plane { y, 7 }
      object { Hyperboloid_Y scale <.6, 1.4, .6> translate 7*y }
      plane { -y, -3 }

      bounded_by { sphere { 4.64*y, 2.48 } }
      }

   sphere { 0, 1 scale <2.5, .5, 2.5> translate 2.8*y }

   intersection
      {
      sphere { 0, 3 }
      plane { -y, 0 }
      }
   }

declare QueenAndKing = union
   {
   sphere { 10.5*y, 1.5 }

   difference
      {
      cone { 11.5*y, 13/6, 8*y, 1 }

      sphere { <1.75, 12, 0>, .9 rotate  150*y }
      sphere { <1.75, 12, 0>, .9 rotate  120*y }
      sphere { <1.75, 12, 0>, .9 rotate   90*y }
      sphere { <1.75, 12, 0>, .9 rotate   60*y }
      sphere { <1.75, 12, 0>, .9 rotate   30*y }
      sphere { <1.75, 12, 0>, .9 }
      sphere { <1.75, 12, 0>, .9 rotate  -30*y }
      sphere { <1.75, 12, 0>, .9 rotate  -60*y }
      sphere { <1.75, 12, 0>, .9 rotate  -90*y }
      sphere { <1.75, 12, 0>, .9 rotate -120*y }
      sphere { <1.75, 12, 0>, .9 rotate -150*y }
      sphere { <1.75, 12, 0>, .9 rotate -180*y }

      bounded_by { box { <-13/6, 8, -13/6>, <13/6, 11.5, 13/6> } }
      }

   sphere { 0, 1 scale <1.8, .4, 1.8> translate 8*y }

   intersection
      {
      plane { y, 8 }
      object { Hyperboloid_Y scale <.7, 1.6, .7> translate <0, 7, 0> }
      plane { -y, -3 }

      bounded_by { sphere { 5.22*y, 2.93 } }
      }

   sphere { 0, 1 scale <2.5, .5, 2.5> translate 2.8*y }

   intersection
      {
      sphere { 0, 3 }
      plane { -y, 0 }
      }
   }

declare Queen = union
   {
   sphere { 12.3*y, .4 }
   object { QueenAndKing }
   }

declare King = union
   {
   box { <-.25, 11.5, -.25>, <.25, 13.5, .25> }
   box { <-.75, 12.5, -.25>, <.75, 13, .25> }
   object { QueenAndKing }
   }

declare WWood = texture
   {
   pigment
      {
      wood

      colour_map
         {
         [ .2 colour rgb <.7, .4, .1>   ]
         [ .5 colour rgb <.95, .62, .3> ]
         }

      turbulence .07
      quick_colour rgb <.95, .62, 0>
      rotate 90*x
      scale .4
      translate <200, 0, 100>
      }

   finish { specular 1 roughness .01 }
   }

declare BWood = texture
   {
   pigment
      {
      wood

      colour_map
         {
         [ .4 colour rgb <.45, .25, 0> ]
         [ .7 colour rgb <.3, .16, 0>  ]
         }

      turbulence .07
      quick_colour rgb <.4, .2, 0>
      rotate 90*x
      scale .4
      translate <100.0, 0, -200.0>
      }

   finish { specular 1 roughness .01 }
   }

declare FWood = texture
   {
   pigment
      {
      wood

      colour_map
         {
         [ .4 colour rgb <.55, .35, 0> ]
         [ .7 colour rgb <.35, .2, 0>  ]
         }

      quick_colour rgb <.45, .3, 0>

      turbulence .07
      scale <.6 .6 6>
      }

   finish { specular 1 roughness .02 }
   }

declare WPawn   = object { Pawn   texture { WWood } }
declare BPawn   = object { Pawn   texture { BWood } }
declare WRook   = object { Rook   texture { WWood } }
declare BRook   = object { Rook   texture { BWood } }
declare WKnight = object { Knight texture { WWood } }
declare BKnight = object { Knight texture { BWood } }
declare WBishop = object { Bishop texture { WWood } }
declare BBishop = object { Bishop texture { BWood } }
declare WQueen  = object { Queen  texture { WWood } }
declare BQueen  = object { Queen  texture { BWood } }
declare WKing   = object { King   texture { WWood } }
declare BKing   = object { King   texture { BWood } }

declare Frame_side = intersection
   {
   box { <-35, -3, -35>, <35, 0, -32> }
   plane { -x+z, 0 }
   plane { x+z, 0 }
   }

// The frame of the chessboard

union
   {
   object { Frame_side }
   object { Frame_side rotate 180*y }

   texture { FWood rotate -88*y translate <200, 40, -20> }
   }

union
   {
   object { Frame_side rotate -90*y }
   object { Frame_side rotate 90*y  }

   texture { FWood rotate 1.2*x translate <100, 30, 0> }
   }

// The board

box
   {
   <-32, -3, -32>, <32, 0, 32>

   texture
      {
      tiles
         {
         texture
            {
            pigment
               {
               marble

               colour_map
                  {
                  [ .7 colour rgb 1  ]
                  [ .9 colour rgb .8 ]
                  [ 1  colour rgb .5 ]
                  }

               quick_colour rgb .8
               turbulence 1
               scale .6
               rotate -30*y
               }

            finish { specular 1 roughness .02 reflection .25 }
            }
         tile2 texture
            {
            pigment
               {
               granite

               colour_map
                  {
                  [0 colour rgb 0  ]
                  [1 colour rgb .5 ]
                  }

               quick_colour rgb .3
               scale .3
               }

            finish { specular 1 roughness .02 reflection .25 }
            }
         }

      scale 8
      }
   }

// White pieces

union
   {
   object { WPawn rotate 360*rand(r)*y translate -28*x }
   object { WPawn rotate 360*rand(r)*y translate -20*x }
   object { WPawn rotate 360*rand(r)*y translate -12*x }
   object { WPawn rotate 360*rand(r)*y translate  -4*x }
   object { WPawn rotate 360*rand(r)*y translate   4*x }
   object { WPawn rotate 360*rand(r)*y translate  12*x }
   object { WPawn rotate 360*rand(r)*y translate  20*x }
   object { WPawn rotate 360*rand(r)*y translate  28*x }

   translate -20*z
   }

union
   {
   object { WRook   rotate 360*rand(r)*y translate -28*x }
   object { WKnight                      translate -20*x }
   object { WBishop rotate 360*rand(r)*y translate -12*x }
   object { WQueen  rotate 360*rand(r)*y translate  -4*x }
   object { WKing   rotate 360*rand(r)*y translate   4*x }
   object { WBishop rotate 360*rand(r)*y translate  12*x }
   object { WKnight                      translate  20*x }
   object { WRook   rotate 360*rand(r)*y translate  28*x }

   translate -28*z
   }

// Black pieces

union
   {
   object { BPawn rotate 360*rand(r)*y translate -28*x }
   object { BPawn rotate 360*rand(r)*y translate -20*x }
   object { BPawn rotate 360*rand(r)*y translate -12*x }
   object { BPawn rotate 360*rand(r)*y translate  -4*x }
   object { BPawn rotate 360*rand(r)*y translate   4*x }
   object { BPawn rotate 360*rand(r)*y translate  12*x }
   object { BPawn rotate 360*rand(r)*y translate  20*x }
   object { BPawn rotate 360*rand(r)*y translate  28*x }

   translate 20*z
   }

union
   {
   object { BRook   rotate 360*rand(r)*y translate -28*x }
   object { BKnight rotate 180*y         translate -20*x }
   object { BBishop rotate 360*rand(r)*y translate -12*x }
   object { BQueen  rotate 360*rand(r)*y translate  -4*x }
   object { BKing   rotate 360*rand(r)*y translate   4*x }
   object { BBishop rotate 360*rand(r)*y translate  12*x }
   object { BKnight rotate 180*y         translate  20*x }
   object { BRook   rotate 360*rand(r)*y translate  28*x }

   translate 28*z
   }

// Table

union
   {
   intersection
      {
      plane {  y, -3 }
      plane {  -y, 8 }
      sphere { -5.5*y, 55 }
      }
   
   intersection
      {
      plane { y, -8 }
      plane { -y, 80 }

      object
         {
         Hyperboloid_Y

         scale <10, 20, 10>
         translate -20*y
         }

      bounded_by { sphere { -50*y, 44.2 } }
      }
   
   pigment
      {
      granite
      scale 6
      quick_colour rgb .5
      }

   finish { specular 1 roughness .02 reflection .3 }
   }

// Sky

object
   {
   sphere { -39000*y, 40000 inverse }

   pigment
      {
      bozo

      colour_map
         {
         [.5, colour rgb <.4, .5, 1> ]
         [.7, colour rgb 1           ]
         [1   colour rgb .7          ]
         }

      turbulence .6
      quick_colour rgb <.4, .5, 1>

      scale 500
      }

   finish { ambient 1 diffuse 0 }

   no_shadow
   }

// Ground

object
   {
   plane { y, -80 }
   pigment { rgb <.1, .6, .05> }
   finish { crand .05 ambient .5 diffuse .5 }
   no_shadow
   }

/*
 * pacman.pov
 *
 * POV-Ray 3.0 scene description for Pac Man doing his favourite job
 *
 * Copyright (c) 1991, 1996 Ville Saari
 *
 * Created: 03-Jan-91
 * Updated: 02-Jul-96
 *
 * Needs image map file "maze.iff"
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

global_settings { assumed_gamma 1 }

camera { location <-80, 35, -140> look_at <40, 10, 0> }
light_source { <60, 120, -170> rgb 1 }

default { finish { ambient .08 diffuse .92 } }

plane // The maze-textured ground
   {
   y, 0

   pigment
      {
      image_map { iff "maze.iff" }
      quick_colour rgb <0, 0, 08>
      rotate x*90
      scale 1600
      translate <-196, 0, 160>
      }

   finish { reflection .5 }
   }

union // Pac Man
   {
   intersection // Body
      {
      sphere { 0, 30 }
      sphere { 0, 28 inverse }

      union
         {
         plane { y, 0 rotate -35*x }
         plane { -y, 0 rotate 10*x }
         }

      sphere { -29*z, 1.5 inverse rotate <16, -4, 0> }
      sphere { -29*z, 1.5 inverse rotate <16, 4, 0> }

      pigment { rgb <.83, .67, 0> }
      finish { specular .5 roughness .1 }
      }

   intersection // Mouth
      {
      sphere { 0, 28 }

      union
         {
         plane { y, -2 rotate -35*x }
         plane { -y, -2 rotate 10*x }
         }
   
      pigment { rgb <.29, 0, 0> }
      finish { ambient .05 diffuse .95 }
      }
   
   union // Tongue
      {
      sphere { <3, 0, -15>, 10 }
      sphere { <-3, 0, -15>, 10 }

      rotate -45*x

      pigment { rgb <1, 0, 0> }
      normal { wrinkles .5 scale .5 }
      finish { reflection .5 }
      }

   union // Right eye
      {
      union
         {
         sphere { 0, 6 pigment { rgb 1 } }
         sphere { -2.3*z, 4 pigment { rgb <.11, .19, .67> } }
         sphere { -5.5*z, 1 pigment { rgb 0 } }

         finish { reflection .5 }
         }

      sphere
         {
         0, 1

         scale <9, 2, 9>
         translate <0, 8, 6>
         rotate -10*z

         pigment { rgb 0 }
         }
   
      rotate <-25, -20, 0>
      translate -26*z
      rotate <25, 20, 0>
      }

   union // Left eye
      {
      union
         {
         sphere { 0, 6 pigment { rgb 1 } }
         sphere { -2.3*z, 4 pigment { rgb <.11, .19, .67> } }
         sphere { -5.5*z, 1 pigment { rgb 0 } }

         finish { reflection .5 }
         }

      sphere
         {
         0, 1

         scale <9, 2, 9>
         translate <0, 8, 6>
         rotate 10*z

         pigment { rgb 0 }
         }
   
      rotate <-25, 20, 0>
      translate -26*z
      rotate <25, -20, 0>
      }

   translate 32*y
   }

// Food

union
   {
   sphere { <0, 27, -25>, 4 }
   sphere { <0, 27, -45>, 4 }
   sphere { <0, 27, -65>, 4 }
   sphere { <0, 27, -85>, 4 }
   sphere { <0, 27, -105>, 4 }

   pigment { rgb 1 }
   finish { specular 2 roughness .01 reflection .6 }
   }

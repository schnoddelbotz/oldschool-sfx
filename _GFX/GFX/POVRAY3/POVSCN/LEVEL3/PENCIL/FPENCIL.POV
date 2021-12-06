// Persistence Of Vision raytracer version 3.0 sample file.
// FOCAL BLUR Version, modified by dmf
// File by Jorge Arreguin
// NOTE: Requires PENCIL_.GIF (320x200x256)
// This scene file makes a pencil along y axis
// with the label "Persistence Of Vision"
//
// Translation to English and dkb version 2.10 by Aaron a. Collins with a bit
// of help from David on the imagemap registration.
//
// note - unless this is rendered at a minimum of 640 x whatever, the logo
//        is quite unreadable.
//
// The Pencil - major export of Faber, Pennsylvania, due to the plentiful
// presence of pencilwood trees and eraser-root plants, and the nearby
// graphite mines.  (John Landis - Animal House)
//

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "metals.inc"

#declare PencilPaint = pigment { color red 1.0 green 0.6666 blue 0.33333 }
background { Gray70 }

camera {
   location <0.0, -70.0, 0.0>
   direction <0.0, 2.5, 0.0>
   up <0.0, 0.0, 1.0>
   right <4/3, 0.0, 0.0>
   rotate < -20.0, 0.0, -140.0 >
   translate < 0.0, 0.0, 2.0 >

//   aperture 10
   focal_point <0, 0, 0>

//    blur_samples 7
//    confidence 0.5             // default is 0.9
//    variance 1/64              // default is 1/128 (0.0078125)
//    #warning "\nFast focal blur used...\n"

//    blur_samples 19
//    confidence 0.90            // default is 0.9
//    variance 1/128             // default is 1/128 (0.0078125)
//    #warning "\nDefault focal blur used...\n"

   blur_samples 37
   confidence 0.975           // default is 0.9
   variance 1/255             // default is 1/128 (0.0078125)
   #warning "\nHigh Quality focal blur used...\n"


}

light_source { <30.0, 30.0, 55.0>  colour White }

light_source { <-40.0, -40.0, 35.0> colour Grey }


union {
   /*----------------------------- parte metalica ----------------------*/
   /*                             (that metal part)                     */
   union {
      union {
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate 2.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate 1.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate -1.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate -2.0*z }

         translate 38.5*z
         texture { T_Brass_3B }
      }

      union {
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate 2.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate 1.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate -1.0*z }
         sphere { <0, 0, 0>, 1 scale < 3.70, 3.70, 1.5 > translate -2.0*z }

         translate 30.5*z

         texture { T_Brass_3B }
      }

      object {
         Disk_Z
         scale < 3.35, 3.35, 3.0 >
         translate 34.0*z
         texture {
            pigment { Brown }
            finish { reflection 0.25 }
         }
      }

   }

   /*---------------------------------- borrador ----------------------------*/
   /*                (the rubber eraser, from eraser-root plants)            */

   union {
      object {
         Disk_Z
         scale < 3.35, 3.35, 3.0 >
         translate 41.0*z
         texture {
            pigment { Pink }
         }
      }
      sphere {
         < 0.0, 0.0, 44.0 >, 3.35
         texture { pigment { Pink } }
      }
   }

   /*---------------------------------- cuerpo de madera ---------------------*/
   /*                                 (body of pencilwood)                    */
   difference {
      intersection {
         plane {
            y, 3.031
            texture { pigment { PencilPaint } }
            texture {
               pigment {
                  image_map {
                     gif "pencil_.gif" filter 0 1.0  /* colour 0 is the "key" or transparent colour */
                     once
                  }
                  rotate <0, -90, -90>
                  scale <15.0 ,1.0, 15.0>
                  translate <-12.2, 0.0, 12.0 >
               }
            }

               /* Now for the complicated image mapping:
  Currently, the pencil is standing up in the z axis:
                   z

             eraser  ^ *vp
                     | |
                     | |
                     | |----/ y
                     |     /
                     |    /
                     |   /
                     |  /
                     | /
             point   |/
                     -------------->
                                   x

  We want the image to be mapped as follows (viewed from the +ve y axis):

          Right
          ---- z=28.0
          |  |
          |..|
          |..|
          |..|
          |ee|
          |ce|
      Top |ar| Bottom
          |rf|
          |t |
          | s|
          |b'|
          |Kt|
          |di|
          ---- z=12.7
          Left

          ^  ^
          |  |
    x=1.75   x=-1.75

 The image map above gives (viewed from the y axis):

                   ^ z
          1,1 Right|
             ------|
             |     |
             |     |
         Top |     |Bottom
             |     |
             |     |
         <----------
          x   Left

  Which is at least in the right orientation.

  Now, we must scale the image so the letters are the right size. */

               //         scale <15.0 1.0 15.0>  /* Never use 0 for any scale value */

               /* Now, we align the top left of the picture to the proper point on the
  pencil.  This is a bit tricky because the top left of the picture is now
  at x=15 z=0.  We have to move it to about x=-12, z=12 because the letters
  don't start at the very top of the image. */

               //         translate <-12.20 0 12>

               /* As you may have guessed, this still took a lot of trial and error to get it
  right, but some analysis of the picture before hand saved a lot of time. */
               //      }

         }
         plane {
            y, 3.031
            rotate 60.0*z
            pigment { PencilPaint }
         }
         plane {
            y, 3.031
            rotate 120.0*z
            pigment { PencilPaint }
         }
         plane {
            y, 3.031
            rotate 180.0*z
            pigment { PencilPaint }
         }
         plane {
            y, 3.031
            rotate 240.0*z
            pigment { PencilPaint }
         }
         plane {
            y, 3.031
            rotate 300.0*z
            pigment { PencilPaint }
         }
         plane { z, 28.0 }
         plane { z, 3.629 inverse }
      }
      object { QCone_Z inverse scale < 0.275558, 0.275558, 1.0 > }

      texture {
         pigment {
            Pine_Wood
            turbulence 0.1
            scale 0.15
            rotate 75*y
            translate 30*x
         }
      }
   }

   /*---------------------------- punta de grafito ------------------------------*/
   /*                            (point of graphite)                             */

   intersection {
      object { QCone_Z scale < 0.275558, 0.275558, 1.0 > }
      plane { z, 3.629 }
      plane { z, 0.001 inverse }

      texture {
         pigment { Black }
         finish {
            reflection 0.25
            phong 1.0
            phong_size 20
         }
      }
   }

   rotate 90.0*x
   translate < 0.0, 22.0, 3.5 >
}

/*-------------------------- plano de horizonte --------------------------*/
/*                           (plane of horizon)                           */

plane {
   z, 0.0

   texture {
      pigment { Green }
//      finish { reflection 0.25 }
   }
}


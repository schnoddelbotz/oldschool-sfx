// Persistence Of Vision raytracer version 3.0 sample file.
// Sample quartic file
// File by David Mason (of DTA fame!)

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "shapesq.inc"

#declare Steel = texture {
   pigment { SteelBlue }
   finish {
      phong 1.0
      phong_size 20
      ambient 0.2
      diffuse 0.8
   }
}

#declare Fin = difference {
   intersection {
      sphere { <0, 0, 0>, 1 scale <2, 4, 0.5> }
      plane { y, 0 inverse }
      plane { x, 0 }
   }
   sphere { <0, 0, 0>, 2 }

   translate -1.2*x
   texture { Steel }
}

#declare Fins = union {
   object { Fin rotate   0*y }
   object { Fin rotate  90*y }
   object { Fin rotate 180*y }
   object { Fin rotate 270*y }

   bounded_by {
      intersection {
         object { Cylinder_Y scale <3.5, 1, 3.5> }
         plane { y, 4 }
         plane { y, 0 inverse }
      }
   }
}

object { Fins rotate 25*y translate 6*y }

intersection {
   union {
      intersection {
         object {
            Piriform
            translate -0.75*x
            rotate -90*z
            scale <2, 6, 2>
            texture { Steel }
         }
         object {
            QCone_Y
            scale <1.8, 5.0, 1.8>
            rotate 180*x
            translate 5*y
            pigment { Clear }
         }
         plane { y, 5 pigment { Clear } }
         plane { y, 0 inverse pigment { Clear } }
      }
      intersection {
         object {
            Piriform
            translate -0.75*x
            rotate 90*z
            scale <2, 18, 2>
            texture { Steel }
         }
         object {
            QCone_Y
            scale <1.8, 15.0, 1.8>
            translate -15*y
            pigment { Clear }
         }
         plane { y, 0 pigment { Clear } }
         plane { y, -8 inverse pigment { Clear } }
      }
      intersection {
         object {
            Piriform
            translate -0.40*x
            rotate 90*z
            scale <2, 6, 2>
            texture { Steel }
         }
         plane { y, 0 inverse pigment { Clear } }
         translate -11*y
      }
   }
   object { Cylinder_Y scale <1.45, 1.0, 1.45> pigment { Clear } }

   bounded_by {
      intersection {
         object { Cylinder_Y scale <1.45, 1.0, 1.45> }
         plane { y, 5 }
         plane { y, -11 inverse }
      }
   }
   translate 18*y
}

union {
   intersection {
      object {
         Piriform
         texture { finish {Luminous} pigment { Yellow filter 0.7 } }
      }
      object { Cylinder_Y scale <0.8, 1.0, 0.8> pigment { Black } }
   }

   light_source { <0, 0, 0> color Yellow }

   translate -0.40*x
   rotate 90*z
   scale <0.8, 5, 0.8>

   bounded_by {
      intersection {
         object { Cylinder_Y scale <0.8, 1.0, 0.8> }
         plane { y, 6 }
         plane { y, -8 inverse }
      }
   }
   translate 4*y
}

camera {
   location  <3.0,  30, -20.0>
   up        <0.0,  1.0,  0.1>
   right     <4/3, 0.0,  0.0>
   look_at   <0.0,  12, 0>
}

light_source { <100, 100, -100> colour White }

plane {
   y, 0

   texture {
      pigment {
         checker colour Gold colour Aquamarine
         scale < 5, 5.1, 5 >
      }
      finish {
         reflection 0.5
         ambient 0.1
         diffuse 0.8
      }
   }
}

sphere {
   <0.0, 0.0, 0.0>, 300.0

   texture {
      pigment {
         gradient y
         colour_map {
            [0.0 0.8  colour red 1.0 green 0.3 blue 0.0
                      colour red 0.7 green 0.7 blue 1.0]
            [0.8 1.0  colour red 0.7 green 0.7 blue 1.0
                      colour red 0.7 green 0.7 blue 1.0]
         }
         scale 300.0
         quick_color red 0.7  green 0.7 blue 1.0
      }
      finish {
         ambient 0.7
         diffuse 0.0
      }
   }
}

sphere {
   <0.0, 0.0, 0.0>, 259.0

   texture {
      pigment {
         bozo
         turbulence 0.5
         colour_map {
            [0.0 0.6  colour red 1.0 green 1.0 blue 1.0 filter 1.0
                      colour red 1.0 green 1.0 blue 1.0 filter 1.0]
            [0.6 0.8 colour red 1.0 green 1.0 blue 1.0 filter 1.0
                     colour red 1.0 green 1.0 blue 1.0]
            [0.8 1.001 colour red 1.0 green 1.0 blue 1.0
                       colour red 0.8 green 0.8 blue 0.8]
         }
         scale <100.0, 20.0, 100.0>
         quick_color red 0.7 green 0.7 blue 1.0
      }
      finish {
         ambient 0.7
         diffuse 0.0
      }
   }
}

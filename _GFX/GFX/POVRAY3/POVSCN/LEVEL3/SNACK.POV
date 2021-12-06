// Persistence Of Vision raytracer version 3.0 sample file.
// File by Tom Price

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"

camera {
   location <0.0, 50.0, -150.0>
   up <0.0, 1.0, 0.0>
   right <4/3, 0.0, 0.0>
   look_at <0.0, 0.0, 0.0>
}


light_source { <50.0, 150.0, -250.0> colour White }

light_source { <-50.0, 150.0, -250.0> colour White }


/*The Sky*/
sphere {
   <0.0, -49000.0, -200.0>, 50000.0
   inverse

   texture { 
      pigment {
         Bright_Blue_Sky
         scale <5000.0, 1000.0, 5000.0>
         quick_color SkyBlue
      }
      finish {
         crand 0.05 
         ambient 0.7
         diffuse 0.0
      }
   }
}

/* The wood grain tabletop */
box {
   <-1, -1, -1>, <1, 1, 1>

   texture {
      pigment {
         Pine_Wood
         scale <7.0, 1.0, 0.7>
         rotate -30.0*y
      }
      finish {
         ambient 0.1
         diffuse 0.5
         reflection 0.15
         brilliance 3.0
      }
   }
   scale <200.0, 1.0, 200.0>
   translate -42.0*y
}


/* a salami */
#declare
Salami = union {
   /* the outside skin */
   union {
      cylinder { -10*x, 10*x, 20 }
      sphere { <-10.0, 0.0, 0.0>, 20.0 }

      texture {
         pigment { colour red 0.5 green 0.2 blue 0.2 }
         finish {
            crand 0.05
            ambient 0.1
            diffuse 0.8
            reflection 0.2
            brilliance 3.0
            phong 0.3
            phong_size 20.0
         }
      }
   }

   cylinder {
      -10*x, 10.01*x, 19.0

      texture {
         pigment { Pink }
         finish {
            crand 0.1
            ambient 0.3
            diffuse 0.7
         }
      }
   }
}

/* a salami slice */
#declare
Slice = union {
   /* the outside skin */
   cylinder {
      -0.5*x, 0.5*x, 20

      texture {
         pigment { colour red 0.5 green 0.2 blue 0.2 }
         finish {
            crand 0.05
            ambient 0.1
            diffuse 0.8
            reflection 0.2
            brilliance 3.0
            phong 0.3
            phong_size 20.0
         }
      }
   }

   cylinder {
      -0.51*x, 0.51*x, 19.0

      texture {
         finish {
            crand 0.1
            ambient 0.3
            diffuse 0.7
         }
         pigment { Pink }
      }
   }
}


/* a wedge of cheese*/
#declare
Cheese = intersection {
   object { Cylinder_Y scale <10.0, 1.0, 10.0> }
   plane { y, 20.0 }
   plane { y, 0.0 inverse }
   plane { x, 5.0 rotate 30.0*y }
   plane { x, -5.0 rotate -30.0*y inverse }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.5>
      rotate -20.0*y
      translate 10.0*y
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 2.0, 1.5>
      rotate <0.0, 20.0, -30>
      translate <0.0, 12.0, -4.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.0>
      translate <0.0, 15.0, -9.0>
      inverse
   }

    object {
      Cylinder_X
      scale <1.0, 2.0, 1.5>
      rotate <0.0, -30.0, -30.0>
      translate <0.0, 15.0, 5.0>
      inverse
   }

   object { 
      Cylinder_X
      scale <1.0, 1.5, 1.5>
      rotate <0.0, 0.0, -20.0>
      translate <0.0, 7.0, -9.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.0>
      rotate <0.0, 10.0, 10.0>
      translate <0.0, 10.0, -2.0>
      inverse
   }
      
   object {
      Cylinder_X
      scale <1.0, 1.0, 1.2>
      rotate <0.0, -10.0, 0.0>
      translate <0.0, 5.0, 0.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.3, 1.0>
      translate <0.0, 3.0, -3.0>
      inverse
   }

   texture {
      pigment { colour red 1.0 green 0.8 blue 0.0 }
      finish {
         crand 0.05
         ambient 0.2
         diffuse 0.8
      }
   }

   bounded_by {
      intersection {
         object { Cylinder_Y scale <10.01, 1.0, 10.01> }
         plane { y, 20.01 }
         plane { y, -0.01 inverse }
      }
   }
}

/* a slice of cheese*/
#declare
CheeseSlice = intersection {
   object { Cylinder_Y scale <10.0, 1.0, 10.0> }
   plane { y, 20.0 }
   plane { y, 0.0 inverse }
   plane { x, 0.2  }
   plane { x, -0.2 inverse }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.5>
      rotate <0.0, -20.0, 30>
      translate <0.0, 10.0, 0.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 2.0, 1.5>
      rotate <0.0, 20.0, -30>
      translate <0.0, 12.0, -4.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.0>
      translate <0.0, 15.0, -9.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 2.0, 1.5>
      rotate <0.0, -30.0, -30.0>
      translate <0.0, 15.0, 5.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.5, 1.5>
      rotate <0.0, 0.0, -20.0>
      translate <0.0, 7.0, -9.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.0>
      rotate <0.0, 10.0, 10.0>
      translate <0.0, 10.0, -2.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.0, 1.2>
      rotate <0.0, -10.0, 0.0>
      translate <0.0, 3.0, 5.0>
      inverse
   }

   object {
      Cylinder_X
      scale <1.0, 1.3, 1.0>
      rotate <0.0, 0.0, 0.0>
      translate <0.0, 2.0, 2.0>
      inverse
   }

   texture {
      pigment { colour red 1.0 green 0.8 blue 0.0 }
      finish {
         crand 0.05
         ambient 0.2
         diffuse 0.8
      }
   }

   bounded_by {
      intersection {
         object { Cylinder_Y scale <10.01, 1.0, 10.01> }
         plane { y, 20.01 }
         plane { y, -0.01 inverse }
         plane { x, 0.3 }
         plane { x, -0.3 inverse }
      }
   }
}

/* An oval glass dish */
#declare
Dish = union {
   intersection {
      sphere { <0, 0, 0>, 1 scale <100.0, 25.0, 25.0> }
      sphere { <0, 0, 0>, 1 scale <95.0, 24.0, 24.0> inverse }
      plane { y, 0.0 }
      plane { y, -5.0 inverse }
   }

   intersection {
      object { Cylinder_Y scale <95.0, 1.0, 24.0> }
      plane { y, -4.0 }
      plane { y, -5.0 inverse }
   }

   texture {
      pigment { Clear }
      finish {
         ambient 0.1
         diffuse 0.8
         refraction 0.95
         ior 1.5
         reflection 0.05
         brilliance 2.0
      }
   }
}

/* a slice of bread */
#declare
BreadSlice = union {
   union {
      box { <-10, -1, -10>, <10, 1, 10> }
      intersection {
         object {
            Cylinder_Y
            scale <11.0, 1.0, 7.0>
            translate <0.0, 0.0, 10.0>
         }
         plane { y, 1.0 }
         plane { y, -1.0 inverse }
      }

      texture {
         pigment { colour red 0.4 green 0.3 blue 0.1 }
         finish {
            crand 0.05
            ambient 0.3
            diffuse 0.7
      //      reflection 0.1
            brilliance 2.0
         }
      }
   }

   union {
      box { <-9.5, -1.01, -9.5>, <9.5, 1.01, 9.5> }
      intersection {
         object {
            Cylinder_Y
            scale <10.5, 1.0, 6.5>
            translate <0.0, 0.0, 10.0>
         }
         plane { y, 1.01 }
         plane { y, -1.01 inverse }
      }

      texture {
         pigment { colour red 0.7 green 0.6 blue 0.45 }
         finish {
            crand 0.1
            ambient 0.3
            diffuse 0.7
         }
      }
   }

//    bounded_by { box { <-10.1, -1.1, -10.1>, <10.1, 1.0, 10.1> } }
}

/* Now to put the scene together*/
union {
   object {
      Dish
      scale <0.7, 1.0, 1.2>
      translate <0.0, -36.0, -25.0>
   }

   object {
      Salami
      rotate 35.0*y
      translate <-30.0, -20.0, -20.0>
   }

   object {
      Cheese
      scale 2.0
      rotate 25.0*y
      translate <30.0, -40.0, -25.0>
   }

   translate 25.0*z
   rotate -15.0*y
   translate <-35.0, 0.0, 20.0>
}

/* now a sandwich */
union {
   object {
      Slice
      rotate 90.0*y
      rotate 90.0*x
      translate <45.0, -33.0, -35.0>
   }

   object {
      CheeseSlice
      scale <1.0, 2.0, 2.0>
      rotate -90.0*y
      rotate 90.0*x
      translate -16.0*z
      rotate 30.0*y
      translate <45.0, -35.0, -35.0>
   }

   object {
      BreadSlice
      scale <1.6, 2.0, 1.0>
      rotate -150.0*y
      translate <45.0, -38.0, -35.0>
   }

   object {
      BreadSlice
      scale <1.6, 2.0, 1.0>
      rotate -150.0*y
      translate <45.0, -29.0, -35.0>
   }

   translate <0.0, 15.0, 10.0>
}

/*spotlight on the sandwich*/
intersection {
   object { Cylinder_Y scale <7.5, 1.0, 7.5> }
   object { Cylinder_Y scale <7.4, 1.0, 7.4> inverse }
   plane { y, 50.0 }
   plane { y, 0.0 inverse }

   translate <45.0, 100.0, -25.0>

   texture {
      pigment { White }
      finish {
         ambient 0.3
         diffuse 0.7
      }
   }
}

light_source { <45.0, 145.0, -25.0> colour White }

object {
   Slice
   rotate 90.0*y
   rotate 65.0*x
   translate <-30.0, 25.0, 45.0>
}

object {
   Slice
   rotate 90.0*y
   rotate 60.0*x
   translate <35.0, 25.0, 25.0>
}

object {
   CheeseSlice
   scale <1.0, 2.0, 2.0>
   rotate -90.0*y
   rotate 50.0*x
   translate <-20.0, 35.0, 30.0>
}

object {
   CheeseSlice
   scale <1.0, 2.0, 2.0>
   rotate -90.0*y
   rotate 70.0*x
   translate <65.0, 15.0, 35.0>
}

object {
   BreadSlice
   scale <1.6, 2.0, 1.0>
   rotate <-40.0, -60.0, 0.0>
   translate <-60.0, 25.0, 35.0>
}

object {
   BreadSlice
   scale <1.6, 2.0, 1.0>
   rotate <60.0, 50.0, 0.0>
   translate <70.0, 0.0, 30.0>
}

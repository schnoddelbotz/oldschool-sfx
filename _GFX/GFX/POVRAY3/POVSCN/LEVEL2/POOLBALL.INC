// Persistence Of Vision raytracer version 2.0 sample file.

// include file for poolball.pov
/* ***************** set up a bunch of declarations ***************************/

#declare Ball = sphere { <0, 0, 0>, 1 }

#declare _1_Ball =
object {
   Ball
   finish { Shiny } pigment { Yellow }
}

#declare _2_Ball =
object {
   Ball
   finish { Shiny } pigment { Blue }
}

#declare _3_Ball =
object {
   Ball
   finish { Shiny } pigment { Red }
}

#declare _4_Ball =
object {
   Ball
   finish { Shiny } pigment { Violet }
}

#declare _5_Ball =
object {
   Ball
   finish { Shiny } pigment { Orange }
}

#declare _6_Ball =
object {
   Ball
   finish { Shiny } pigment { ForestGreen }
}

#declare _7_Ball =
object {
   Ball
   finish { Shiny } pigment { Maroon }
}

#declare _8_Ball =
object {
   Ball
   finish { Shiny } pigment { Black }
}


// Striped balls start here

#declare Stripe = color Yellow

#declare _9_Ball =
object { Ball
   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare Stripe = color Blue

#declare _10_Ball =  object {
   Ball

   finish { Shiny }
   pigment {
      gradient <0 1 0>
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare Stripe = color Red

#declare _11_Ball =
object {
   Ball

   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}


#declare Stripe = color Violet

#declare _12_Ball =
object {
   Ball

   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare Stripe = color Orange

#declare _13_Ball =
object {
   Ball

   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare Stripe = color ForestGreen

#declare _14_Ball =
object {
   Ball

   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare Stripe = color Maroon

#declare _15_Ball =
object {
   Ball

   finish { Shiny }
   pigment {
      gradient y
      color_map {
         [0.0 0.33 color White color White]
         [0.33 0.66 color Stripe color Stripe]
         [0.66 1.00 color White color White]
      }
      quick_color Stripe
      scale 2.0
      translate 1*y
   }
}

#declare CueStick =
intersection {
   object { Cylinder_Z }
   plane { z, 1 }

   pigment {
      Dark_Wood
      scale <0.01, 0.01, 1>
   }
   finish {
      ambient 0.1
      diffuse 0.7
      phong 1.0
      phong_size 90
      reflection 0.3
   }
}        

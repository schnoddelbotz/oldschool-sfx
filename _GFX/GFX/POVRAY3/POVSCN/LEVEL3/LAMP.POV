// Persistence Of Vision raytracer version 3.0 sample file.
// File by Jorge Arreguin

// This would have won the Intl. Obfuscated Raytrace Code Contest, So I
// reformatted it while converting it :-)  All kidding
// aside, nice job, Jorge!   -  Aaron A. Collins
// Note: This file is designed in "right-handed" coordinates: z=height y=depth
// This file has "Disk" primitives that may be different than those
// in shapes.inc!

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

camera {
   location <0.0, -80.0, 0.0>
   direction <0.0, 1.0, 0.0>
   up <0.0, 0.0, 1.0>
   right <4/3, 0.0, 0.0>
   translate < 25.0, 0.0, 5.0 >
   rotate < -30.0, 0.0, 30.0 >
}

light_source { <44.514, 0.0, 13.5> color White }

light_source { <-60.514, 0.0, 160.5> color rgb 0.7 shadowless }

sphere { 
   <0.0, 0.0, 0.0>, 5.0
   texture { Brass_Texture }
}

sphere {
   <9.307, 0.0, 30.288>, 1.0
   texture { Brass_Texture }
}

sphere {
   <38.161, 0.0, 17.197>, 1.0
   texture { Brass_Texture }
}

cylinder {
   <0, 0, 0>, <9.307, 0.0, 30.288>, 1.0
   texture { Brass_Texture }
}

cylinder {
   <9.307, 0.0, 30.288>, <38.161, 0.0, 17.197>, 1.0
   texture { Brass_Texture }
}

cylinder {
   <38.161, 0.0, 17.197>, <38.161+3.2, 0.0, 17.197>, 0.5
   texture { Brass_Texture }
}

intersection {
   object {
      QCone_Z
      scale <1.0, 1.0, 1.0>
      translate <44.514, 0.0, 17.685>
   }
   object {
      QCone_Z
      scale <1.0, 1.0, 1.0>
      translate <44.514, 0.0, 16.685>
      inverse
   }
   plane { z, 7.685 inverse }
   plane { z, 13.695 }

   texture { Brass_Texture }
}

intersection {
   object {
      QCone_Z
      scale <0.2, 0.2, 1.0>
      translate <44.514, 0.0, 33.496>
   }
   object {
      QCone_Z
      scale <0.2, 0.2, 1.0>
      translate <44.514, 0.0, 32.496>
      inverse
   }
   plane { z, 13.695 inverse }
   plane { z, 23.496 }

   texture { Brass_Texture }
}

plane {
   z, -4.0

   texture {
      pigment { Red }
      finish {
         ambient 0.4
         diffuse 0.6
         brilliance 8.0
         reflection 0.8
         phong 1.0
         phong_size 30.0
      }
   }
}

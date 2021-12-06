// Persistence Of Vision raytracer version 3.0 sample file.
// Weighted averaged pigments example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"

camera { 
  location <0,3,-31>
  direction 3*z
} 

plane { y, -1.01  pigment {White}}

plane {  z, 4.01  pigment {White}}

light_source { <500, 200, -500> White}

#declare Thing = plane{z,0.1 clipped_by{box{-2,2}}}
#declare Filt_Stripes=
  color_map {
    [1/7 rgbf<1,1,1,1>]
    [1/7 rgbf<1,1,0,1>]
    [2/7 rgbf<1,1,0,1>]
    [2/7 rgbf<0,1,0,1>]
    [3/7 rgbf<0,1,0,1>]
    [3/7 rgbf<0,1,1,1>]
    [4/7 rgbf<0,1,1,1>]
    [4/7 rgbf<0,0,1,1>]
    [5/7 rgbf<0,0,1,1>]
    [5/7 rgbf<1,0,1,1>]
    [6/7 rgbf<1,0,1,1>]
    [6/7 rgbf<1,0,0,1>]
  }

#declare Trans_Stripes=
  color_map {
    [1/7 rgbt<1,1,1,0.5>]
    [1/7 rgbt<1,1,0,0.5>]
    [2/7 rgbt<1,1,0,0.5>]
    [2/7 rgbt<0,1,0,0.5>]
    [3/7 rgbt<0,1,0,0.5>]
    [3/7 rgbt<0,1,1,0.5>]
    [4/7 rgbt<0,1,1,0.5>]
    [4/7 rgbt<0,0,1,0.5>]
    [5/7 rgbt<0,0,1,0.5>]
    [5/7 rgbt<1,0,1,0.5>]
    [6/7 rgbt<1,0,1,0.5>]
    [6/7 rgbt<1,0,0,0.5>]
  }

#declare Stripes=
  color_map {
    [1/7 rgb<1,1,1>]
    [1/7 rgb<1,1,0>]
    [2/7 rgb<1,1,0>]
    [2/7 rgb<0,1,0>]
    [3/7 rgb<0,1,0>]
    [3/7 rgb<0,1,1>]
    [4/7 rgb<0,1,1>]
    [4/7 rgb<0,0,1>]
    [5/7 rgb<0,0,1>]
    [5/7 rgb<1,0,1>]
    [6/7 rgb<1,0,1>]
    [6/7 rgb<1,0,0>]
  }


object{Thing
  pigment {
    average
    pigment_map {
      [gradient x color_map{Stripes}]
      [gradient y color_map{Stripes}]
    }
  }
  translate <-3,5.5,0>
}

object{Thing
  pigment {
    average
    pigment_map {
      [gradient x color_map{Filt_Stripes}]
      [gradient y color_map{Filt_Stripes}]
    }
  }
  translate <3,5.5,0>
}

object{Thing
  pigment {
    average
    pigment_map {
      [3.0 gradient x color_map{Stripes}]
      [1.0 gradient y color_map{Stripes}]
    }
  }
  translate <-3,1,0>
}

object{Thing
  pigment {
    average
    pigment_map {
      [gradient x color_map{Trans_Stripes}]
      [gradient y color_map{Trans_Stripes}]
    }
  }
  translate <3,1,0>
}

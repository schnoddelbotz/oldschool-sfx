// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// This scene shows a number of halos.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"

camera {
  orthographic
  location <0, 0, -10>
  right 16 * 4/3 * x
  up 16 * y
  look_at <0, 0, 0>
}

light_source { <50, 50, -100> color White }

plane { <0, 0, 1>, 5
  pigment { checker color Green color Blue }
  finish { ambient 0.1 diffuse 0.4 }
  hollow
}

#declare Row1 =  +6
#declare Row2 =  +2
#declare Row3 =  -2
#declare Row4 =  -6
#declare Col1 =  -6
#declare Col2 =  -2
#declare Col3 =  +2
#declare Col4 =  +6

#declare Turbulence = 0
#declare Samples = 5

//
// Declare container object.
//

#declare Thing = box { -1, 1 scale 1.5 hollow }

//
// Declare basic texture.
//

#declare Texture = texture {
  pigment { color Clear }
  finish { ambient 0 diffuse 0 }
}

//
// Declare basic halo.
//

#declare Halo = halo {
  constant
  attenuating
  planar_mapping
  max_value 1
  exponent 1.5
  color_map
  {
    [0.0 color rgbt <0, 0, 0, 1.0>]
    [1.0 color rgbt <1, 1, 1, 0.5>]
  }
  turbulence Turbulence
  samples Samples
  aa_level 0
  aa_threshold 0.3
  scale 1.5
}

//
// Declare constant halo with planar mapping
//

#declare Texture01 =
texture {
  Texture
  halo {
    Halo
    constant
    planar_mapping
  }
}

//
// Declare constant halo with spherical mapping
//

#declare Texture02 =
texture {
  Texture
  halo {
    Halo
    constant
    spherical_mapping
  }
}

//
// Declare constant halo with cylindrical mapping
//

#declare Texture03 =
texture {
  Texture
  halo {
    Halo
    constant
    cylindrical_mapping
    rotate 90*x
  }
}

//
// Declare constant halo with box mapping
//

#declare Texture04 =
texture {
  Texture
  halo {
    Halo
    constant
    box_mapping
  }
}

//
// Declare linear halo with planar mapping
//

#declare Texture05 = 
texture {
  Texture
  halo {
    Halo
    linear
    planar_mapping
  }
}

//
// Declare linear halo with spherical mapping
//

#declare Texture06 = 
texture {
  Texture
  halo {
    Halo
    linear
    spherical_mapping
  }
}

//
// Declare linear halo with cylindrical mapping
//

#declare Texture07 = 
texture {
  Texture
  halo {
    Halo
    linear
    cylindrical_mapping
    rotate 90*x
  }
}

//
// Declare linear halo with box mapping
//

#declare Texture08 = 
texture {
  Texture
  halo {
    Halo
    linear
    box_mapping
  }
}

//
// Declare cubic halo with planar mapping
//

#declare Texture09 = 
texture {
  Texture
  halo {
    Halo
    cubic
    planar_mapping
  }
}

//
// Declare cubic halo with spherical mapping
//

#declare Texture10 = 
texture {
  Texture
  halo {
    Halo
    cubic
    spherical_mapping
  }
}

//
// Declare cubic halo with cylindrical mapping
//

#declare Texture11 = 
texture {
  Texture
  halo {
    Halo
    cubic
    cylindrical_mapping
    rotate 90*x
  }
}

//
// Declare cubic halo with box mapping
//

#declare Texture12 = 
texture {
  Texture
  halo {
    Halo
    cubic
    box_mapping
  }
}


//
// Declare poly halo with planar mapping
//

#declare Texture13 = 
texture {
  Texture
  halo {
    Halo
    poly
    planar_mapping
  }
}

//
// Declare poly halo with spherical mapping
//

#declare Texture14 = 
texture {
  Texture
  halo {
    Halo
    poly
    spherical_mapping
  }
}

//
// Declare poly halo with cylindrical mapping
//

#declare Texture15 = 
texture {
  Texture
  halo {
    Halo
    poly
    cylindrical_mapping
    rotate 90*x
  }
}

//
// Declare poly halo with box mapping
//

#declare Texture16 = 
texture {
  Texture
  halo {
    Halo
    poly
    box_mapping
  }
}

object { Thing texture { Texture01 } translate <Col1, Row1, 0> }

object { Thing texture { Texture02 } translate <Col2, Row1, 0> }

object { Thing texture { Texture03 } translate <Col3, Row1, 0> }

object { Thing texture { Texture04 } translate <Col4, Row1, 0> }

object { Thing texture { Texture05 } translate <Col1, Row2, 0> }

object { Thing texture { Texture06 } translate <Col2, Row2, 0> }

object { Thing texture { Texture07 } translate <Col3, Row2, 0> }

object { Thing texture { Texture08 } translate <Col4, Row2, 0> }

object { Thing texture { Texture09 } translate <Col1, Row3, 0> }

object { Thing texture { Texture10 } translate <Col2, Row3, 0> }

object { Thing texture { Texture11 } translate <Col3, Row3, 0> }

object { Thing texture { Texture12 } translate <Col4, Row3, 0> }

object { Thing texture { Texture13 } translate <Col1, Row4, 0> }

object { Thing texture { Texture14 } translate <Col2, Row4, 0> }

object { Thing texture { Texture15 } translate <Col3, Row4, 0> }

object { Thing texture { Texture16 } translate <Col4, Row4, 0> }


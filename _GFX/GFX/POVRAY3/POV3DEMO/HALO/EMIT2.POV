// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dieter Bayer
// This scene shows emitting halos with a linear density function
// and spherical mapping with different color maps.

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

#declare Thing = sphere { 0, 1 hollow scale 1.5 }

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
  linear
  emitting
  spherical_mapping
  max_value 1
  color_map
  {
    [0.0 color rgbt<1, 0, 0, 1>]
    [1.0 color rgbt<1, 1, 0, 0>]
  }
  turbulence Turbulence
  samples Samples
  aa_level 3
  aa_threshold 0.3
  scale 1.5
}

//
// Declare four halos with increasing filter value, i.e. 
// increasing opacity for the high density color.
//

#declare Texture01 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [1.0 color rgbf<1, 1, 0, 0.25>]
    }
  }
}

#declare Texture02 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [1.0 color rgbf<1, 1, 0, 0.5>]
    }
  }
}

#declare Texture03 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [1.0 color rgbf<1, 1, 0, 0.75> ]
    }
  }
}

#declare Texture04 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [1.0 color rgbf<1, 1, 0, 1>]
    }
  }
}

//
// Declare four halos with increasing filter value, i.e.
// increasing opacity for the low density color.
//

#declare Texture05 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0.25>]
      [1.0 color rgbf<1, 1, 0, 1>]
    }
  }
}

//
// Declare halo
//

#declare Texture06 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0.5>]
      [1.0 color rgbf<1, 1, 0, 1>]
    }
  }
}

#declare Texture07 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0.75>]
      [1.0 color rgbf<1, 1, 0, 1>]
    }
  }
}

#declare Texture08 =
texture {
  Texture
  halo {
    Halo
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 1>]
      [1.0 color rgbf<1, 1, 0, 1>]
    }
  }
}

//
// Declare four halos with increasing max_value.
//

#declare Texture09 =
texture {
  Texture
  halo {
    Halo
    max_value 1
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture10 = 
texture {
  Texture
  halo {
    Halo
    max_value 2
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture11 = 
texture {
  Texture
  halo {
    Halo
    max_value 3
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture12 = 
texture {
  Texture
  halo {
    Halo
    max_value 4
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}


//
// Declare four halos with increasing frequencies and peridioc color map.
//

#declare Texture13 =
texture {
  Texture
  halo {
    Halo
    frequency 1
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture14 =
texture {
  Texture
  halo {
    Halo
    frequency 2
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture15 =
texture {
  Texture
  halo {
    Halo
    frequency 3
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
  }
}

#declare Texture16 = 
texture {
  Texture
  halo {
    Halo
    frequency 4
    color_map
    {
      [0.0 color rgbf<1, 0, 0, 0>]
      [0.5 color rgbf<1, 1, 0, 1>]
      [1.0 color rgbf<1, 0, 0, 0>]
    }
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


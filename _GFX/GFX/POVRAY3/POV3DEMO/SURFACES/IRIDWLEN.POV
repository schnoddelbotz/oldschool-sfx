// Persistence Of Vision raytracer version 3.0 sample file.
// Iridescence wavelength example

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

// Vary the iridescence wavelengths for custom effects
global_settings {
//    irid_wavelength rgb <.25, .18, .14>   // POV-Ray default
//    irid_wavelength rgb <.70, .52, .48>
    irid_wavelength rgb <.10, .20, .40>
}

camera {
  location <0, 1.5, -3>
  direction <0, 0, 1.5>
  right <1.3333, 0, 0>
  look_at <0, 0, 0>
}
light_source { < 15, 15, -25> colour Gray90 }

plane { y,0
    pigment { Gray45 }
    finish {
        ambient 0.2
        diffuse 0.2
        irid {0.5          // contribution to overall color
          thickness 1.2    // affects frequency, or "busy-ness"
          turbulence 1     // Variance in film thickness
        }
    }

}

sphere { <0,0, 0>, 0.45
    pigment { White }
    finish {
        Shiny
        diffuse 0.2
        irid {0.25 thickness 1 turbulence 0.75}
    }
    translate <-1, 0.45, 0>
}
sphere { <0,0, 0>, 0.45
    pigment { White }
    finish {
        Shiny
        diffuse 0.2
        irid {0.5 thickness 1 turbulence 0.75}
    }
    translate <0, 0.45, 0>
}
sphere { <0,0, 0>, 0.45
    pigment { White }
    finish {
        Shiny
        diffuse 0.2
        irid  {0.75 thickness 1 turbulence 0.75}
    }
    translate <1, 0.45, 0>
}


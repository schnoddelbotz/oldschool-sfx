// Persistence Of Vision raytracer version 3.0 sample file.
// The TEXTUREn.POV files demonstrate all textures in TEXTURES.INC
// and STONES.INC

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

#declare T01 = texture { pigment { Jade} }
#declare T02 = texture {pigment { Red_Marble} }
#declare T03 = texture {pigment { White_Marble} }

#declare T04 = texture {pigment { Blood_Marble} }
#declare T05 = texture {pigment { Blue_Agate} }
#declare T06 = texture {pigment { Sapphire_Agate} }

#declare T07 = texture {pigment { Brown_Agate} }
#declare T08 = texture {pigment { Pink_Granite} }
#declare T09 = texture { PinkAlabaster }

#declare T10 = texture {pigment { Blue_Sky} }
#declare T11 = texture {pigment { Bright_Blue_Sky} }
#declare T12 = texture {pigment { Blue_Sky2} }

#declare T13 = texture {pigment { Blue_Sky3} }
#declare T14 = texture {pigment { Blood_Sky} }
#declare T15 = texture {pigment { Apocalypse} }

#declare T16 = texture {pigment { Clouds} }
#declare T17 = texture {pigment { Cherry_Wood} }
#declare T18 = texture {pigment { Pine_Wood} }

#declare T19 = texture {pigment { Dark_Wood} }
#declare T20 = texture {pigment { Tan_Wood} }
#declare T21 = texture {pigment { White_Wood} }

#declare T22 = texture {pigment { Tom_Wood} }
#declare T23 = texture {pigment { DMFWood1} }
#declare T24 = texture {pigment { DMFWood2} }

#declare T25 = texture {pigment { DMFWood3} }
#declare T26 = texture {pigment { DMFWood4} }
#declare T27 = texture {pigment { DMFWood5} }

#include "shotxtr.inc"

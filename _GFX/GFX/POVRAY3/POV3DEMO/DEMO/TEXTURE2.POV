// Persistence Of Vision raytracer version 3.0 sample file.
// The TEXTUREn.POV files demonstrate all textures in TEXTURES.INC
// and STONES.INC

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "glass.inc"

#declare T01 = texture {EMBWood1}
#declare T02 = texture { pigment {DMFLightOak}}
#declare T03 = texture { pigment {DMFDarkOak}}

#declare T04 = texture {Yellow_Pine}
#declare T05 = texture {Rosewood}
#declare T06 = texture {Sandalwood}

#declare T07 = texture {finish { Dull} pigment{Blue}}
#declare T08 = texture {finish {Shiny} pigment{Blue}}
#declare T09 = texture {finish {Phong_Dull} pigment{Blue}}

#declare T10 = texture {finish {Phong_Shiny} pigment{Blue}}
#declare T11 = texture {finish {Glossy} pigment{Blue}}
#declare T12 = texture {finish {Phong_Glossy} pigment{Blue}}

#declare T13 = texture {finish {Luminous} pigment{Blue}}
#declare T14 = texture {finish {Mirror} pigment{White}}
#declare T15 = texture {T_Glass1}

#declare T16 = texture {T_Glass2}
#declare T17 = texture {T_Glass3}
#declare T18 = texture {T_Green_Glass}

#declare T19 = texture {Chrome_Texture}
#declare T20 = texture {finish {Metal} pigment{White}}
#declare T21 = texture {Brass_Texture}

#declare T22 = texture {Gold_Texture}
#declare T23 = texture {Bronze_Texture}
#declare T24 = texture {Copper_Texture}

#declare T25 = texture {Silver_Texture}
#declare T26 = texture {Brass_Valley}
#declare T27 = texture {Polished_Chrome}

#include "shotxtr.inc"

// Persistence Of Vision raytracer version 3.0 sample file.
// The TEXTUREn.POV files demonstrate all textures in TEXTURES.INC
// and STONES.INC

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "stones.inc"

#declare T01 = texture {Polished_Brass}
#declare T02 = texture {New_Brass}
#declare T03 = texture {Spun_Brass}

#declare T04 = texture {Silver1}
#declare T05 = texture {Silver2}
#declare T06 = texture {Silver3}

#declare T07 = texture {Rusty_Iron}
#declare T08 = texture {Rust}
#declare T09 = texture {pigment{Candy_Cane}}

#declare T10 = texture { Peel }
#declare T11 = texture {pigment{Y_Gradient}}
#declare T12 = texture {pigment{X_Gradient}}

#declare T13 = texture {Water pigment{SkyBlue}}
#declare T14 = texture {Cork}
#declare T15 = texture {T_Grnt0}

#declare T16 = texture {T_Grnt1}
#declare T17 = texture {T_Grnt2}
#declare T18 = texture {T_Grnt3}

#declare T19 = texture {T_Grnt4}
#declare T20 = texture {T_Grnt5}
#declare T21 = texture {T_Grnt6}

#declare T22 = texture {T_Grnt7}
#declare T23 = texture {T_Grnt8}
#declare T24 = texture {T_Grnt9}

#declare T25 = texture {T_Grnt10}
#declare T26 = texture {T_Grnt11}
#declare T27 = texture {T_Grnt12}

#include "shotxtr.inc"

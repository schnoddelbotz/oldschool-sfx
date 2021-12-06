//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "fog.inc"

fog { 
  distance 150 
  colour rgb<0.3, 0.5, 0.2> 
  fog_type 2
  fog_offset 25
  fog_alt 1
  turbulence 0.1
  turb_depth 0.2
}

fog { 
  distance 150 
  colour rgb<0.5, 0.1, 0.1> 
  fog_type 2
  fog_offset 15
  fog_alt 4
  turbulence 0.2
  turb_depth 0.2
}

fog { 
  distance 150 
  colour rgb<0.1, 0.1, 0.6> 
  fog_type 2
  fog_offset 10
  fog_alt 2
}


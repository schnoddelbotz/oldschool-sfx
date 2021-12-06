//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "rainbow.inc"

rainbow {
  angle 42.5
  width 5
  distance 1.0e7
  direction <-0.2, -0.2, 1>
  jitter 0.01
  colour_map {
    [0.000  colour r_violet1 transmit 0.98]
    [0.100  colour r_violet2 transmit 0.96]
    [0.214  colour r_indigo  transmit 0.94]
    [0.328  colour r_blue    transmit 0.92]
    [0.442  colour r_cyan    transmit 0.90]
    [0.556  colour r_green   transmit 0.92]
    [0.670  colour r_yellow  transmit 0.94]
    [0.784  colour r_orange  transmit 0.96]
    [0.900  colour r_red1    transmit 0.98]
  }
}


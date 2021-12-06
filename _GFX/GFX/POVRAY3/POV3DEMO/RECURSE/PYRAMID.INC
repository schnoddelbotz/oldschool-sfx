// recursive subroutine for PYRAMID.POV

// #debug str(level,4,0)

sphere { <x_pos, y_pos, z_pos>, radius_max }

#if (level > 0)
  #declare level      = level - 1
  #declare radius_max = radius_max / 2

  // z+
  #declare z_pos = z_pos + radius_max * 3
  #include "pyramid.inc"
  #declare z_pos = z_pos - radius_max * 3

  // z-
  #declare z_pos = z_pos - radius_max * 3
  #include "pyramid.inc"
  #declare z_pos = z_pos + radius_max * 3

  // x+
  #declare x_pos = x_pos + radius_max * 3
  #include "pyramid.inc"
  #declare x_pos = x_pos - radius_max * 3

  // x-
  #declare x_pos = x_pos - radius_max * 3
  #include "pyramid.inc"
  #declare x_pos = x_pos + radius_max * 3

  // y+
  #declare y_pos = y_pos + radius_max * 3
  #include "pyramid.inc"
  #declare y_pos = y_pos - radius_max * 3

  // y-
  #declare y_pos = y_pos - radius_max * 3
  #include "pyramid.inc"
  #declare y_pos = y_pos + radius_max * 3

  #declare level = level + 1
  #declare radius_max = radius_max * 2
#end

// Persistence Of Vision raytracer version 3.0 sample file.
// Illustrates that #if #else can be nested and it works with #include

#version 3.0
global_settings { assumed_gamma 2.2 }

#if (clock < 1.0)
#include "shear1.pov"
#else
  #if (clock < 2.0)
    #include "shear2.pov"
  #else
    #include "shear3.pov"
  #end
#end

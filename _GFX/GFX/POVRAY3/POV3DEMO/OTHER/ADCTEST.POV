 // at resolution 160x100 -a
 // using the following constants:
 //    Reflect = 0.5
 //    Filter = 0.5
 //    IOR = 1.45
 //    Refract = 1
 //
 // # Rays Saved : 166033 (total traced = 525525)
 // Max Level Traced: 9 (of 100 max)

#version 3.0
global_settings {
    assumed_gamma 2.2
    max_trace_level 100     // much higher than it needs
//    adc_bailout 0.003      // generally  best to not fiddle with this
    adc_bailout 0.5
}

 #include "colors.inc"
 #include "textures.inc"
 #include "shapes.inc"
 background { color Blue }

 camera {
   location <0, 12, -24>
   direction <0, 0, 1>
   right <1.3333, 0, 0>
   up y
   look_at <0, 0, 0>
 }

 light_source { <15, 20,  -100> color White }
 background { color Gray50 }
 plane { y, 0
     pigment { checker color Yellow color Green }
     finish {
         reflection 0.15
     }
 }

 #declare Reflect = 0.5
 #declare Filter = 0.5
 #declare IOR = 1.45
 #declare Refract = 1

 object { Cube scale <0.25, 7, 12>
     pigment { Blue filter Filter }
     finish {
         reflection Reflect
         ior IOR
         refraction Refract
         diffuse 1
     }
     rotate  y*30
     translate -x*4
 }

 object { Cube scale <0.25, 7, 12>
     pigment { Red  filter Filter }
     finish {
         reflection Reflect
         ior IOR
         refraction Refract
         diffuse 1
     }
     rotate -y*30
     translate  x*4
 }

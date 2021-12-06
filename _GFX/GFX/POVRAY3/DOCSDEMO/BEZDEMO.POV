//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//
 
#include "colors.inc"

camera {
  location <0, .1, -60>
  look_at 0
  angle 36
}

background { color Gray25 }  //to make the patch easier to see

light_source { <300, 300, -700> White }

plane { y, 500
  texture {
    pigment { SkyBlue }
    finish { ambient 1 diffuse 0}
   }
   texture {
     pigment {
       bozo
       turbulence .5
       color_map {
         [0 White]
         [1 White filter 1]
       }
     }
     finish { ambient 1 diffuse 0 }
     scale <1000, 250, 250>
     rotate <5, 45, 0>
  }
}

plane {y,-12
  texture {
    pigment {
      color <.85, .5, .15>
    }
    finish {
      ambient .25
      diffuse .6
      crand .5
    }
    normal {
      ripples .35
      turbulence .25
      frequency 5
    }
    scale 10
    translate 50*x
  }
}

#declare TeePeeTex = texture {
  pigment { Silver }
  finish {
    ambient .1
    diffuse .4
    specular 1
    roughness 0.001
    reflection .5
    metallic
  }
}

#declare TeePee = bicubic_patch { 
  type 1 flatness 0 u_steps 5 v_steps 5,
  <-5.174134, 5.528420, -13.211995>, 
  <-1.769023, 5.528420, 0.000000>,
  <1.636088, 5.528420, 0.000000>, 
  <5.041199, 5.528420, -13.003932>,
  <-5.174134, 1.862827, 0.000000>, 
  <0.038471, 0.031270, 18.101474>,
  <0.036657, 0.031270, 18.101474>, 
  <5.041199, 1.862827, 0.000000>,
  <-5.174134, -1.802766, 0.000000>, 
  <0.038471, 0.028792, 18.101474>,
  <0.036657, 0.028792, 18.101474>, 
  <5.041199, -1.802766, 0.000000>,
  <-5.174134, -5.468359, -13.070366>, 
  <-1.769023, -5.468359, 0.000000>,
  <1.636088, -5.468359, 0.000000>, 
  <4.974128, -5.468359, -12.801446>
  texture {
    TeePeeTex
   }
   rotate -90*x // to orient the object to LHC
   rotate 25*y  // to see the four "legs" better
}

object { TeePee }

object { TeePee translate <8, 0, 8> }

object { TeePee translate <-9, 0, 9> }

object { TeePee translate <18, 0, 24> }

object { TeePee translate <-18, 0, 24> }

#declare EggTex = texture {
  pigment { BrightGold }
  finish {
    ambient .1
    diffuse .4
    specular 1
    roughness 0.001
    reflection .5
    metallic
  }
}

#declare Egg = union { // Egg1
  bicubic_patch { 
    type 1 flatness 0 u_steps 5 v_steps 5,
    <2.023314, 0.000000, 4.355987>, 
    <2.023314, -0.000726, 4.355987>,
    <2.023312, -0.000726, 4.356867>, 
    <2.023312, 0.000000, 4.356867>,
    <2.032037, 0.000000, 2.734598>, 
    <2.032037, -1.758562, 2.734598>,
    <2.027431, -1.758562, 6.141971>, 
    <2.027431, 0.000000, 6.141971>,
    <-1.045672, 0.000000, 3.281572>, 
    <-1.045672, -1.758562, 3.281572>,
    <-1.050279, -1.758562, 5.414183>, 
    <-1.050279, 0.000000, 5.414183>,
    <-1.044333, 0.000000, 4.341816>,  
    <-1.044333, -0.002947, 4.341816>,
    <-1.044341, -0.002947, 4.345389>, 
    <-1.044341, 0.000000, 4.345389>
  }
  bicubic_patch { 
    type 1 flatness 0 u_steps 5 v_steps 5,
    <2.023312, 0.000000, 4.356867>, 
    <2.023312, 0.000726, 4.356867>,
    <2.023314, 0.000726, 4.355987>, 
    <2.023314, 0.000000, 4.355987>,
    <2.027431, 0.000000, 6.141971>, 
    <2.027431, 1.758562, 6.141971>,
    <2.032037, 1.758562, 2.734598>, 
    <2.032037, 0.000000, 2.734598>,
    <-1.050279, 0.000000, 5.414183>, 
    <-1.050279, 1.758562, 5.414183>,
    <-1.045672, 1.758562, 3.281572>, 
    <-1.045672, 0.000000, 3.281572>,
    <-1.044341, 0.000000, 4.345389>, 
    <-1.044341, 0.002947, 4.345389>,
    <-1.044333, 0.002947, 4.341816>, 
    <-1.044333, 0.000000, 4.341816>
  }
  texture { EggTex }
  translate <0.5, 0, -5>  // centers the egg around the origin
  translate -9.8*y        // places the egg on the ground
}

object { Egg }

object { Egg translate <8, 0, 8> }

object { Egg translate <-9, 0, 9> }

object { Egg translate <18, 0, 24> }

object { Egg translate <-18, 0, 24> }


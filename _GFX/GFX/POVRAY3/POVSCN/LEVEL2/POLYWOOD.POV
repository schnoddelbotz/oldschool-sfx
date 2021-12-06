// Persistence Of Vision raytracer version 3.0 sample file.
// PolyWood.pov - Wooden polyhedron hollowed by a sphere
// on a grassy hilly lawn.  Shows how easy it is to
// create interesting shapes with CSG operations
// and simple primitive shapes.
// File by Eduard [esp] Schwan

#version 3.0
global_settings { assumed_gamma 1.0 }

include "shapes.inc"
include "colors.inc"
include "textures.inc"

// Moi
camera {
   location   <-3.3,  0.8, -11.0>
   direction  <0.0,   0.0,   1.0>
   up         <0.0,   1.0,   0.0>
   right      <4/3,   0.0,   0.0>
   look_at    <0,     0,     0>
}

// Some Light just above the horizon for a long shadow
light_source
{
  <30, 6, -40>
  color White
}


// The Cloudy Blue Sky
sphere
{
  <0, 0, 0>, 10000
  pigment
  {
     Bright_Blue_Sky
     scale <4000, 600, 1000>
  }
}


// The Hilly Grassy Land
plane
{
  y, -4.1
  pigment { color red 0.2 green 1.0 blue 0.4 }
  finish
  {
      crand 0.025 // a little randomness to hide the rather severe color banding
      ambient 0.1
      diffuse 0.7
      roughness 1
   }
   normal { bumps 0.5  scale 10 }
}


// The Wooden Polyhedron
// The idea here is to take a few cubes rotated at 45 degrees
// along different axes from each other and intersect them,
// thus cutting some corners.  Then we carve out the center
// with a slightly oversized sphere, which protrudes slightly
// through the sides of the cubes, cutting portholes in the
// facets of the polyhedron.  Then we get out the wooden paint..
intersection {
   // polyhedron
   // Add small amount to each box to account for normal numerical inacurracies.
   // This fixes surface acne on coplanar surfaces.
   box { <-4.000, -4.000, -4.000>, <4.000, 4.000, 4.000> }
   box { <-4.001, -4.001, -4.001>, <4.001, 4.001, 4.001>   rotate 45*x }
   box { <-4.002, -4.002, -4.002>, <4.002, 4.002, 4.002>   rotate 45*y }
   box { <-4.003, -4.003, -4.003>, <4.003, 4.003, 4.003>   rotate 45*z }
   // hollow it out
   sphere { <0, 0, 0>, 4.25 inverse }

   // semi-dark wood with dark greenish rings
   pigment {
      wood
      turbulence 0.04
      colour_map {
        [0.0 0.4  color red 0.8 green 0.4 blue 0.2
                  color red 0.8 green 0.4 blue 0.1]
        [0.4 0.5  color red 0.1 green 0.3 blue 0.1
                  color red 0.1 green 0.3 blue 0.2]
        [0.5 0.8  color red 0.1 green 0.3 blue 0.2
                  color red 0.8 green 0.4 blue 0.1]
        [0.8 1.0  color red 0.8 green 0.4 blue 0.1
                  color red 0.8 green 0.4 blue 0.2]
      }
      scale <0.2, 0.2, 1>
      rotate <45, 0, 5>
      translate <2, 2, -4>
   }
   finish {
      // make it look wood-like
      ambient 0.15
      diffuse 0.6
      // make it a little bit shiny
      specular 0.3 roughness 0.01
      phong 0.3 phong_size 60
   }
}

// ttfn!

// Persistence Of Vision raytracer version 3.0 sample file.
// File: BlobLoop.POV
// Vers: 3
// Desc: Shows off the while loop for creating complex blob objects.
// Date: 10/1/95
// Auth: Eduard Schwan

#version 3.0
global_settings { assumed_gamma 1.0 }

// ------------------------------------------------------------------
// Look down at an angle at our creation
camera
{ 
  location  <0, 10, -8>
  direction 1*z
  look_at   <0, 0, 0>
} 


// ------------------------------------------------------------------
// Light source # 1
light_source { <30, 20, -30> color rgb 1 }

// Light source # 2
light_source { <-10, 30, -30> color rgb 0.5 }


// ------------------------------------------------------------------
// Simple dark background for a simple scene
background { color rgb <0.0, 0.1, 0.2> }


// ------------------------------------------------------------------
// A white marble floor
plane
{
  y, -0.1
  texture
  {
    pigment
    {
      marble
      turbulence 0.5 omega 0.7 rotate -40*y scale 6
      color_map
      {
        [0.50 color rgb 1.0]
        [0.57 color rgb 0.8]
        [0.60 color rgb <0.9,0.8,0.7>]
        [0.63 color rgb 1.0]
      }
    }
    finish {ambient 0.2 reflection 0.3}
  }
}


// ------------------------------------------------------------------
// Set up the loop variables:
// the Counter variable will go from 0.0 to 1.0 in NumIterations loops.
#declare NumIterations = 60     // You can change this, try 20, 40, 60 too

// leave these next calculations alone
#declare Increment     = 1.0/NumIterations
#declare NumTwists     = 360*2  // # of full twists
#declare Height        = 5      // total height of object


// ------------------------------------------------------------------
// Here is the large loop-generated blob
blob
{
  threshold 0.1

  // create a series of components, using a while-loop
  #declare Counter = 0.001
  #while (Counter<=1.0)
// #debug concat("Cnt=",str(Counter,2,4)," Inc=",str(Increment,5,8),"\n")

    // put a rod across axis
    cylinder
    {
      <-5*(1-Counter), Counter*Height, 0>,  // <xyz> of one end
      < 5*(1-Counter), Counter*Height, 0>,  // <xyz> of other end
      Increment*20,                         // radius
      2                                     // blob component strength
      // put down the texture AFTER the component is in place
      // so it lines up across them
      texture
      {
        // make the color change as we wind our way up the shape
        pigment { color rgb Counter/2 }
        finish { ambient 0.2 specular 0.6 reflection 0.3 roughness 0.01 }
      }
      rotate Counter*NumTwists*y
    }

    // now add a ball on each end of the rod
    sphere
    {
      <-5*(1-Counter), Counter*Height, 0>, Increment*30, 2
      rotate Counter*NumTwists*y
      // put down the texture AFTER the component is in place
      // so it lines up across them
      texture
      {
        // make the color change as we wind our way up the shape
        pigment { color rgb <Counter, 0, 1> }
        finish { ambient 0.2 specular 0.6 reflection 0.3 roughness 0.01 }
      }
    }

    sphere
    {
      < 5*(1-Counter), Counter*Height, 0>, Increment*30, 2
      rotate Counter*NumTwists*y
      // put down the texture AFTER the component is in place
      // so it lines up across them
      texture
      {
        // make the color change as we wind our way up the shape
        pigment { color rgb <1, 0, Counter> }
        finish { ambient 0.2 specular 0.6 reflection 0.3 roughness 0.01 }
      }
    }
    // manually increment our counter inside the loop
    #declare Counter=Counter+Increment
  #end

  rotate -30*y // view from a better angle
}



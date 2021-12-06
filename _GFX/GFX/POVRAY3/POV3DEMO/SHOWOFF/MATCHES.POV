// Persistence Of Vision raytracer version 3.0 sample file.
// Several match sticks, one burning, and one about to burn.
// By Dan Farmer 1996
// Inspired by an Aladdin Software Security, Inc. advertisement photo

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "textures.inc"
#include "woods.inc"

// Rendering dimensions should be multiples of these values
#declare Width =  9
#declare Height = 10
#declare Aspect = Width/Height

camera {
   location  <0, 0,-35>
   direction <0, 0, 1>
   up        <0, 1, 0>
   right   x * Aspect
   look_at   <0, 0, 0>
   angle 41 //45
}

// Background plane.  Didn't use sky_sphere because I want gradient shadows
plane { z, 60
    inverse  // needed to get camera "outside" plane
    pigment { green 0.3 }
    finish { ambient 0 diffuse 0.3 }
}

// A spotlight glancing off the left corner of the matchsticks
// and highlighting the matchheads
// The light is declared shadowless so that it won't interact with
// the atmosphere or cast shadows on the background
light_source {<-20, 30, -25> color White * 1.5
    spotlight
    point_at <10,0,0>
    radius 10
    falloff 11
    shadowless
}

// Background lighting (primarily illuminates the backplane)
// The light is declared shadowless so that it won't interact with
// the atmosphere or cast shadows on the background
light_source {<20, 20,  0> color White * 2
    spotlight
    point_at <0, 0, 60>
    radius  120
    falloff 130
    shadowless
}

// Some haze to make the flame light sources glow
#declare Atmosphere1 = atmosphere {
    type 4
    samples 30
    distance 500
    scattering 0.1
    aa_level 8
    aa_threshold 0.1
    jitter 0.1
}

// Several objects need to light up with the top of the matchstick
// so use a constant so its easier to adjust everything
#declare Match_Height = 14

#declare Match_Stick =
superellipsoid { <0.25, 0.25>
    // Underlying texture
    texture {
        T_Wood10            // light tan for soft match wood
        rotate x*90         // align with length of match stick
        scale 0.2
        normal { bumps 0.3 scale <0.1, 0.2, 0.1> } // roughen the surface
    }
    // The waxy coating near the match heads
    texture {
        pigment {
            gradient y
            color_map {
                [-1.00  Clear ]
                [ 0.90  Clear ]
                [ 1.00  Black ]
            }
        }
    }
    scale <1, Match_Height, 1>
}

// Match head is just several stacked, scaled blobby spheres
#declare Match_Head =
blob {
    threshold 0.15
    sphere { <0,Match_Height -1, 0>, 1.00, 1 }
    sphere { <0,Match_Height,    0>, 1.40, 1 }
    sphere { <0,Match_Height +1, 0>, 1.60, 1 }
    sphere { <0,Match_Height +2, 0>, 1.80, 1 }

    pigment { Red }
    finish { diffuse 0.3 }
    normal {
        bumps 0.6
        scale 0.075
    }
}

// FadeDst controls the size of the flame element
#declare FadeDst = 1.75 //2

// FadePwr determines spread of the glow
#declare FadePwr = 3.25   //3

// The burning match is rotated after the flame is applied, so
// the flame must first be counter rotated so that it'll still
// be pointing directly upward
#declare Burning_Match_Rotation = <0,0, 10>

// The match flame is an array of light sources.  I initially used
// spheres to help me set up the positions and sizes (FadeDst ~= radius)
// Flames are arranged in three columns.  The first is the major flame
// on the leftmost (burning) match.  The last is the new flame bursting
// from the match next to it, and the center column is just a little
// "fill" between the two.
#declare Flame =
union {
    light_source {<0, 14,   -1> Red    * 0.5 fade_distance FadeDst fade_power FadePwr * 1.25}
    light_source {<0, 12,   -1> Red    * 1.0 fade_distance FadeDst fade_power FadePwr}
    light_source {<0, 10,   -1> Red    * 1.2 fade_distance FadeDst fade_power FadePwr}
    light_source {<0,  8,   -1> Red    * 1.2 fade_distance FadeDst fade_power FadePwr}
    light_source {<0,  6,   -1> Orange * 1.3 fade_distance FadeDst fade_power FadePwr}
    light_source {<0,  4,   -1> Orange * 1.4 fade_distance FadeDst fade_power FadePwr}
    light_source {<0,  2,   -1> Yellow * 1.4 fade_distance FadeDst fade_power FadePwr}
    light_source {<0,  0,   -1> Orange * 1.5 fade_distance FadeDst fade_power FadePwr}
    light_source {<0, -0.45,-1> NeonBlue fade_distance 0.75 * FadeDst fade_power 1.5}

    light_source {< 2, 3,   -1> Orange * 0.8 fade_distance FadeDst fade_power FadePwr * 1.35}
    light_source {< 2, 1,   -1> Yellow * 0.8 fade_distance FadeDst fade_power FadePwr}

    light_source {< 4,10,   -1> Red    * 0.5 fade_distance FadeDst * 0.5 fade_power FadePwr * 2.20}
    light_source {< 4, 9,   -1> Red    * 0.5 fade_distance FadeDst * 0.5 fade_power FadePwr * 2.00}
    light_source {< 4, 8,   -1> Red    * 1.0 fade_distance FadeDst fade_power FadePwr * 1.66}
    light_source {< 4, 6,   -1> Orange * 1.0 fade_distance FadeDst fade_power FadePwr * 1.33}
    light_source {< 4, 4,   -1> Yellow * 1.0 fade_distance FadeDst fade_power FadePwr}
    light_source {< 4, 2,   -1> Orange * 1.0 fade_distance FadeDst fade_power FadePwr}

    rotate Burning_Match_Rotation    // counter-rotate for later match rotation
    translate y*Match_Height
}


// Build a complete match
#declare Match =
union {
    object { Match_Stick }
    object { Match_Head pigment { Red } }
}

// The burning match applies a new charred texture on the match stick,
// recolors the match head a charred gray,
// and adds the flame.  The flame is also dependant on the
// position of the neighboring matchstick so be careful of changing it.
#declare Burning_Match =
union {
    object { Match_Stick
    texture {
        pigment {
            gradient y
            color_map {
                [-1.00  Clear ]
                [ 0.80  Clear ]
                [ 0.90  BakersChoc ]
                [ 1.00  Gray10 ]
            }
        scale <1, Match_Height, 1>
        }
    }
    }
    object { Match_Head pigment { Gray10 } }
    object { Flame }
}

// This is the match adjacent to the burning one.  This match head
// is partially burned.  The finish needs to be modified to
// allow for the large amount of light coming from the flames.
#declare Catching_Match =
union {
    object { Match_Stick }
    object { Match_Head
        pigment {
            gradient y
            color_map {
                [0.60 Red ]
                [0.65 Gray40 ]
                [0.75 Black ]
            }
            turbulence 0.3
            rotate -z*15
            translate -y*2
            scale 4.2
        }
        finish { diffuse 0.2 ambient 0.15 brilliance 6 }
    }
}

// Put all matches together into a union that can be moved around
// as needed
union {
    object { Burning_Match
        rotate -Burning_Match_Rotation
        translate <-14,-8, 0>
    }
    object { Catching_Match rotate -y*180 translate <-8,-6, 0> }
    object { Match rotate  y*90  translate <-4,-3, 0> }
    object { Match rotate  y*180 translate < 0, 0, 0> }
    object { Match rotate -y*90  translate < 4, 3, 0> }
    object { Match rotate  y*0   translate < 8, 6, 0> }
    translate -y*12
    translate x*1.5
}

// Apply the atmosphere down here where its easy to turn on and off
// by simply adding or removing comment marks.
atmosphere { Atmosphere1 }


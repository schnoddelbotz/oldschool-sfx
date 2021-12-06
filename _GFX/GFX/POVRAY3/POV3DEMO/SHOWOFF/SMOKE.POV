// Persistence Of Vision raytracer version 3.0 sample file.
// File by Dan Farmer

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "metals.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"

// Dummy glass for testing
#declare Ashtray_Texture =
texture {
    T_Glass3
    finish {
        specular 0.3 roughness 0.01
        caustics 1
    }
}


camera {
  location <-50, 45, -140>
  angle 52
  look_at <15, 10, 0>
}

light_source{<-10, 100, 60> colour White }

// Cigarette smoke
#declare Smoke =
sphere { 0, 1
    hollow
    no_shadow
    pigment { colour Clear }
    halo {
        linear
        max_value 0.15
        cylindrical_mapping
        attenuating
        turbulence 0.75
        octaves 6
        omega (1/1.618)
        lambda 1.618
        colour_map {
             [0.0 color rgbt <1, 1, 1, 1>]
             [0.5 color rgbt <1, 1, 1, 0.65>]
             [1.0 color rgbt <0, 0, 0, 0>]
        }
        scale <0.4, 0.65, 0.4>
        samples 10
        aa_level 0
        aa_threshold 0.3
    }
    scale <10, 30, 10>
    translate <-5, 40, 0>
}


// Glowing ashes
#declare GlowTip =
    cylinder { -y, y, 1  hollow
    no_shadow
    pigment { colour Clear }
    halo {
        linear
        max_value 0.15
        cylindrical_mapping
        turbulence 0.3
        colour_map {
             [0.0 color rgbt <1, 0.5, 0, 1>]
             [0.95 color rgbt <1, 0.5, 0, 0>]
        }
        samples 10
        aa_level 0
        aa_threshold 0.3
        scale <0.75, 1.1, 1.1>
    }
    rotate z*90
    scale <2.0, 7.5, 7.5>
    translate -x*3                   // position at ash tip of cigarette
}

#declare Cigarette =
union {
    object { Smoke }
    union {
        // Glow surrounding burned tip
        object { GlowTip}

        // ashes... a cylinder with rounded cap ends
        superellipsoid { <1.0, 0.65> scale <4, 4, 5> rotate y*90
            pigment {
                gradient x
                turbulence 0.35
                color_map {
                    [ 0.00 Gray60 ]       // ashes
                    [ 0.05 Gray20 ]       // dark burned area
                    [ 0.10 Gray60 ]       // ashes
                    [ 0.15 Gray20 ]       // dark burned area
                    [ 0.20 Gray60 ]       // ashes
                    [ 0.25 Gray20 ]       // dark burned area
                    [ 0.30 Gray60 ]       // ashes
                    [ 0.50 Gray20 ]       // dark burned area
                    [ 0.60 Orange ]      // a little extra glow
                    [ 0.85 red 0.4 ]
                    [ 0.90 Gray20 ]
                    [ 1.00 White ]
                }
                scale 5.5
                translate -x*5
            }
            finish { ambient 0.4 }
        }

        // unburned portion of cigarette
        union {
            // white part
            cylinder { x, x*73 , 4 open
                pigment {
                    gradient x      // lightly banded paper
                    color_map {
                        [0.5 White ]
                        [0.5 White*0.95 ]
                        [1.0 White ]
                    }
                }
                finish { crand 0.05 ambient 0.30 diffuse 0.6 }
            }
            // Gold band
            cylinder { x*73 x*73.5, 4 open
                texture {
                    pigment { Tan }
                    finish { metallic ambient 0.3 diffuse 0.7 }
                }
            }
            // White band
            cylinder { x*73.5 x*75 , 4 open
                texture {
                    pigment { White }
                    finish { crand 0.15 ambient 0.30 diffuse 0.6 }
                }
            }
            // Gold band
            cylinder { x*75 x*75.5, 4 open
                texture {
                    pigment { Tan }
                    finish { metallic ambient 0.3 diffuse 0.7 }
                }
            }
            // White band
            cylinder { x*75.5 x*77 , 4 open
                texture {
                    pigment { White }
                    finish { crand 0.15 ambient 0.30 diffuse 0.6 }
                }
            }

            // filter part
            cylinder { x*77, x*100 , 4 open
                texture {
                Cork
                scale 30
                    finish { crand 0.15 ambient 0.30 diffuse 0.6 }
                }
            }
        }
        rotate z*9
    }
    translate -y*12
}


#declare FloorPlane =
plane { y, -20.001 pigment { Blue } }

// Cutout for notches in ashtray
#declare Groove =
union {
    cylinder { <0,0,0>, <0, 0, 1>, 1 }
    box { <-1 0, 0> <1, 5, 1> }
    scale <5, 5, 50>
    translate y*5
}


// Ashtray
#declare Ashtray =
difference {

    // Make outside shape
    superellipsoid { <0.5, 0.1> rotate x*90 scale <40, 10, 40> }

    // Cut out inside shape
    superellipsoid { <0.8, 0.2> rotate x*90 scale <35, 20, 35> translate y*12 }

    // Cut out grooves
    union {
        object { Groove rotate y*0 }
        object { Groove rotate y*90 }
        object { Groove rotate y*180 }
        object { Groove rotate y*270 }
    }
    texture {
        Ashtray_Texture
        finish {
            caustics 2
        }
    }
    translate -y*10
}

object { FloorPlane }
union {
    object { Cigarette }
    object { Ashtray }
}

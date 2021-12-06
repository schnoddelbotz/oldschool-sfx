// Persistence Of Vision raytracer version 3.0 sample file.

#version 3.0
global_settings { assumed_gamma 2.2 }

#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"

/* Camera: Camera01 */
camera {
   location <1072.8390, -1504.5500, 1272.3879>
   direction <0, 1.331, 0>
   up <0, 0, 1>
   sky  <0, 0, 1>
   right <1.333, 0, 0>
   look_at <-6.1602, -28.6256, -27.2782>
}

/* Light: Light01 */
light_source {
    <941.5319, -781.3810, 843.9290> color rgb <0.55, 0.55, 0.55>
}

/* Spotlight: Light02 */
light_source {
    <-328.1903, -1018.4644, 1591.2814> color rgb <1.00, 1.00, 1.00>
    spotlight
    point_at <-18.6508, -738.8054, -212.8073>
    tightness 0
    radius 0.50
    falloff 12.00
}

#declare RED_GLASS = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 1.00
        phong_size 36.4
        ior 1.1
        refraction 1.0
    }
    pigment { rgbf <0.911, 0.752, 0.752, 0.670> }
}

#declare GRAY_SEMIGLOSS = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 0.42
        phong_size 12.6
        metallic
    }
    pigment { rgb <0.663, 0.663, 0.663> }
}

#declare GOLD = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 0.54
        phong_size 16.1
        metallic
    }
    pigment { rgb <0.553, 0.408, 0.196> }
}

#declare BRASS_GIFMAP = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 0.98
        phong_size 29.4
        metallic
        reflection 0.300
    }
    pigment { rgb <0.580, 0.424, 0.196> }
}

#declare CREAM_PLASTIC = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 1.00
        phong_size 35.0
    }
    pigment { rgb <0.757, 0.773, 0.463> }
}

#declare CHROME_GIFMAP = texture {
    finish {
        ambient 0.10
        diffuse 0.90
        phong 1.00
        phong_size 42.7
        reflection 0.995
    }
    pigment { rgb <0.000, 0.000, 0.000> }
}

//   Object    CenterX    CenterY    CenterZ    LengthX    LengthY    LengthZ
// ---------- ---------- ---------- ---------- ---------- ---------- ----------
// Box            -19.98    -749.67    -227.95      79.01      86.54     204.24
// Floor           -2.10   -1514.86    -339.09   25724.66   23600.61       0.00
// Base           -15.13      76.18     -49.71     300.00     300.00     550.00
// Hand           -20.00    -730.00     475.00     160.00     110.00     100.00
// H_Shaft        -20.63    -387.10     470.60      50.00     572.88      50.00
// H_Arm          -20.00     -50.00     470.00      80.00     659.20      80.00
// Hinge          -20.00      80.00     435.00     160.00     100.00     110.00
// V_Shaft        -15.00      76.44      95.00      50.00      50.00     572.88

#include "robot.inc"

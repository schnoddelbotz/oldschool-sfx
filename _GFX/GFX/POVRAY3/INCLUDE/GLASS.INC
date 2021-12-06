#ifdef(Glass_Inc_Temp)
// do nothing
#else
#declare Glass_Inc_Temp=version
#version 3.0

#ifdef(View_POV_Include_Stack)
#   debug "including glass.inc\n"
#end

/*
              Persistence of Vision Raytracer Version 3.0
                      Glass finishes and textures
*/

// Glass Finishes
#declare F_Glass1 =
finish {
    specular 1
    roughness 0.001
    ambient 0
    diffuse 0
    refraction 1   
    reflection 0.1
    ior 1.5
}

#declare F_Glass2 = 
finish {
    ambient 0
    diffuse 0
    reflection 0.5
    refraction 1
    ior 1.5
    phong 0.3
    phong_size 60
}

#declare F_Glass3 =
finish  {
    ambient 0.1
    diffuse 0.1
    reflection 0.1
    refraction 1
    ior 1.45
    specular 0.8
    roughness 0.003
    phong 1
    phong_size 400
}

#declare F_Glass4 =
finish {
    ambient 0.1
    diffuse 0.1
    reflection .25
    refraction 1
    ior 1.5
    specular 1
    roughness 0.001
}

// Glass Textures

// Simple clear glass
#declare T_Glass1 =
texture {
    pigment { color rgbf<1.0, 1.0, 1.0, 0.7> }
    finish  { F_Glass1 }
}

// More like an acrylic plastic
#declare T_Glass2 =
texture {
    pigment { color rgbf<1.0, 1.0, 1.0, 1.0> }
    finish  { F_Glass2 }
}


// An excellent lead crystal glass!
#declare T_Glass3 =
texture {
    pigment { color rgbf <0.98, 0.98, 0.98, 0.9> }
    finish { F_Glass3 }
}

#declare T_Glass4 =
texture {
    pigment { color rgbf <0.98, 1.0, 0.99, 0.75> }
    finish { F_Glass4 }
}


#declare T_Old_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.8, 0.9, 0.85, 0.85> }
}

#declare T_Winebottle_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.4, 0.72, 0.4, 0.6> }
}

#declare T_Beerbottle_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.7, 0.5, 0.1, 0.6> }
}

// A few color variations on Norm's glass
// Ruby glass
#declare T_Ruby_Glass =
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.9, 0.1, 0.2, 0.8> }
}

#declare T_Green_Glass =
texture {
    pigment { color rgbf <0.8, 1, 0.95, 0.9> }
    finish { F_Glass3 }
}

#declare T_Dark_Green_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.1, 0.7, 0.8, 0.8> }
}

#declare T_Yellow_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.8, 0.8, 0.2, 0.8> }
}

// Orange/Amber glass
#declare T_Orange_Glass=
texture {
    finish { F_Glass4 }
    pigment { rgbf <1.0, 0.5, 0.0, 0.8> }
}

// Vicks bottle, glass
#declare T_Vicksbottle_Glass=
texture {
    finish { F_Glass4 }
    pigment { color rgbf <0.1, 0.15, 0.5, 0.9> }
}

#version Glass_Inc_Temp
#end

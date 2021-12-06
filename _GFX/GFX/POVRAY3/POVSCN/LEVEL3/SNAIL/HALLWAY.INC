// Persistence Of Vision raytracer version 3.0 sample file.

#version 3.0

// This data declares Hardwood, a Floor & walls w/base moulding

//Light tan to d.brown

#declare br01 = colour red 1.00 green 0.94 blue 0.71
#declare br02 = colour red 1.00 green 0.88 blue 0.65
#declare br03 = colour red 0.94 green 0.80 blue 0.59
#declare br03 = colour red 0.94 green 0.80 blue 0.59
#declare br04 = colour red 0.80 green 0.69 blue 0.52
#declare br05 = colour red 0.72 green 0.63 blue 0.46
#declare br06 = colour red 0.78 green 0.63 blue 0.46
#declare br07 = colour red 0.74 green 0.59 blue 0.49
#declare br08 = colour red 0.66 green 0.51 blue 0.41
#declare br09 = colour red 0.61 green 0.50 blue 0.42
#declare br10 = colour red 0.58 green 0.45 blue 0.32
#declare br11 = colour red 0.65 green 0.45 blue 0.32
#declare br12 = colour red 0.65 green 0.41 blue 0.28
#declare br13 = colour red 0.58 green 0.41 blue 0.28
#declare br14 = colour red 0.57 green 0.37 blue 0.24
#declare br15 = colour red 0.60 green 0.37 blue 0.24
#declare br16 = colour red 0.54 green 0.35 blue 0.25
#declare br17 = colour red 0.56 green 0.31 blue 0.21
#declare br18 = colour red 0.45 green 0.31 blue 0.16
#declare br19 = colour red 0.45 green 0.31 blue 0.21
#declare br20 = colour red 0.41 green 0.27 blue 0.17
#declare br21 = colour red 0.40 green 0.24 blue 0.14
#declare br22 = colour red 0.37 green 0.24 blue 0.11
#declare br23 = colour red 0.37 green 0.24 blue 0.18
#declare br24 = colour red 0.34 green 0.21 blue 0.15
#declare br25 = colour red 0.40 green 0.21 blue 0.15
#declare br26 = colour red 0.32 green 0.19 blue 0.07
#declare br27 = colour red 0.30 green 0.14 blue 0.02
#declare br28 = colour red 0.30 green 0.14 blue 0.10
#declare br29 = colour red 0.24 green 0.16 blue 0.12
#declare br30 = colour red 0.25 green 0.13 blue 0.09
#declare br31 = colour red 0.21 green 0.09 blue 0.05


#declare pop_wood = texture {
   pigment {
      marble
      color_map {
         [0.0 0.2 color br16 color br16]
         [0.2 0.4 color br16 color br14]
         [0.4 0.6 color br14 color br17]
         [0.6 0.8 color br17 color br17]
         [0.8 0.9 color br17 color br14]
         [0.9 1.01 color br14 color br16]
      }
   
      turbulence 0.4
      scale <13, 13, 1>
   }
   finish { ambient 0.8 phong 0.5 }
}

texture {
   pigment {
      wood
      color_map {
         [0.0 0.05 color br25 color br25 filter 0.5]
         [0.05 0.2 color br25 filter 0.5 color br21 filter 1.0]
         [0.2 0.7 color br21 filter 1.0 color br21 filter 0.8]
         [0.7 0.8 color br27 filter 0.7 color br27 filter 1.0]
         [0.8 0.9 color br27 filter 1.0 color br27 filter 0.7]
         [0.9 1.01 color br27 filter 1.0 color br30 filter 0.5]
      }
      turbulence 0.5
      scale <5, 15, 1>
   }
   finish {
      ambient 0.9
      phong 1.0
   }
}

/*************************************************************/

#declare zeb_wood = texture {
   pigment {
      marble
      color_map {
         [0.0 0.2 color br16 color br16]	
         [0.2 0.4 color br16 color br14]
         [0.4 0.6 color br14 color br17]
         [0.6 0.8 color br17 color br17]
         [0.8 0.9 color br17 color br14]
         [0.9 1.01 color br14 color br16]
      }
      turbulence 0.25
      scale <13 13 1>
   }
   finish {
      ambient 0.3
      diffuse 1.2
   }
}

texture {
   pigment {
      wood
      color_map {
         [0.0 0.05 color br25 color br25 filter 0.7]
         [0.05 0.2 color br25 filter 0.7 color br21 filter 1.0]
         [0.2 0.7 color br21 filter 1.0 color br21 filter 0.8]
         [0.7 0.8 color br27 filter 0.7 color br27 filter 1.0]
         [0.8 0.9 color br27 filter 1.0 color br27 filter 0.7]
         [0.9 1.01 color br27 filter 1.0 color br30 filter 0.7]
      }
      turbulence 0.3
      scale <5, 15, 5>
   }
   finish {
      ambient 0.6
      diffuse 0.9
   }
}

texture {
   pigment {
      wood
      color_map {
         [0.0 0.05 color br25 color br25 filter 0.4]
         [0.05 0.2 color br25 filter 0.4 color br21 filter 0.8]
         [0.2 0.7 color br21 filter 0.8 color br21 filter 0.9]
         [0.7 0.8 color br27 filter 0.8 color br27 filter 0.6]
         [0.8 0.9 color br27 filter 0.6 color br27 filter 0.4]
         [0.9 1.01 color br27 filter 0.5 color br30 filter 0.8]
      }
      turbulence 0.2
      scale <4, 20, 4>
   }
   finish {
      diffuse 0.9
      ambient 0.3
   }
}


/*------------------ MAKE HARDWOOD FLOOR ----------------------------------*/

#declare wt = texture {
   zeb_wood
   scale <10, 20, 20>
   finish {
      crand 0.01
      phong 0.5
      phong_size 20
   }
}

#declare plank = object {
   Cube
   scale <100, 700, 4>
   texture { wt }
}

#declare the_floor = union {
   object { plank texture { wt translate  100*y  } translate 0*x }
   object { plank texture { wt translate    0*y  } translate 204*x }
   object { plank texture { wt translate   50*y  rotate -20*z } translate 408*x }
   object { plank texture { wt translate -100*y  } translate 612*x }
   object { plank texture { wt translate  -30*y  } translate -204*x }
   object { plank texture { wt translate  100*y  } translate -408*x }
   object { plank texture { wt translate  -50*y rotate 20*z } translate -612*x }
   object { Cube scale <500, 500, 1> }

   texture { pigment { Black } translate <0, -4, 20> }
}


/*--------------------START THE WALLS-------------------------*/

#declare cwall = texture {
   pigment { DarkSlateGray }
   finish { crand 0.05 }
}

/*----------------  Build BaseBoards  ------------------------*/

#declare baseboard = difference {
   union {
      object { Cube scale <300, 50, 120> translate <0, 50, 0> }
      object { Cube scale <290, 25, 110> translate <0, 125, 0> }
      sphere { <0, 0, 0>, 10 translate <290, 110, -110> }
      sphere { <0, 0, 0>, 10 translate <290, 110, 110> }
      object { Disk_X scale <580, 10, 10> translate <-290, 110, -110>}
      object { Disk_Z scale <10, 10, 220> translate <290, 110, -110> }
   }
   object { Cylinder_X scale <1, 20, 20> translate <0, 150, -110> }
   object { Cylinder_Z scale <20, 20, 1> translate <290, 150, 0>  }

   pigment { Gray }
   finish { ambient 0.2 diffuse 0.7 phong 1.0 }

}

/*--------------- THE PLASTER WALL ------------------------------------*/
#declare plaster = object {
   Cube
   scale <260, 250, 80>
   texture { cwall }
}

/*-------------- WALL WITH BASE ATTACHED ------------------------------*/
#declare wall = union {
   object { plaster translate <0, 400, 0> }
   object { baseboard }
}

// Persistence Of Vision raytracer version 3.0 sample file.
// Simple demonstration of the matrix keyword

#version 3.0
global_settings { assumed_gamma 2.2 }

camera {
   location  <3, 5, -15>
   direction <0, 0, 4>
   look_at   <0, 1, 0>
}

light_source { <50, 100, -200> color rgb <1,1,1> }
plane { y, 0 pigment { color rgb <0,0,1> } }		// Ground plane

box {
    -1,1
    pigment { color rgb <1,1,1> }
}
box {
    -0.5,0.5
    pigment { color rgb <1,0,0> }

    // Matrix does rotation about the Y axis, shear along the Y axis, and
    // translation along the Y axis

    matrix <0.886, 0.5, 0.5,
	    0,     1,   0,
	    0.5,   0,  -0.886,
	    0,     1.5, 0>		// 4th 3-vector is translation
}

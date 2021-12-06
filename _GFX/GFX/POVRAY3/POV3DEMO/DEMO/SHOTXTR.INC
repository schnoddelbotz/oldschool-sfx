// Persistence Of Vision Raytracer version 2.0 sample file.
// The TEXTUREn.POV files demonstrate all textures in TEXTURES.INC

camera {
   location <0, 5, -30>
   direction <0, 0,  1.35>
   look_at 5*y
}

light_source {<0, 0, -1000> color LightGray}

light_source {<150, 50, -200> color LightGray}

#declare Stack =
union {
   object {UnitBox}
   object {Disk_Y translate 2*y}
   sphere{<0, 4, 0>, 1}
}

#declare Dist = 0

#declare Row1 = 10.5
#declare Row2 = 3.5
#declare Row3 = -3.5

#declare Col1  = -12
#declare Col2  = -9
#declare Col3  = -6
#declare Col4  = -3
#declare Col5  = 0
#declare Col6  = 3
#declare Col7  = 6
#declare Col8  = 9
#declare Col9  = 12



object {
   Stack
   texture{T01}
   translate <Col1 Row1 Dist>
}

object {
   Stack
   texture{T02}
   translate <Col2 Row1 Dist>
}

object {
   Stack
   texture{T03}
   translate <Col3 Row1 Dist>
}

object {
   Stack
   texture{T04}
   translate <Col4 Row1 Dist>
}

object {
   Stack
   texture{T05}
   translate <Col5 Row1 Dist>
}

object {
   Stack
   texture{T06}
   translate <Col6 Row1 Dist>
}

object {
   Stack
   texture{T07}
   translate <Col7 Row1 Dist>
}

object {
   Stack
   texture{T08}
   translate <Col8 Row1 Dist>
}

object {
   Stack
   texture{T09}
   translate <Col9 Row1 Dist>
}

object {
   Stack
   texture{T10}
   translate <Col1 Row2 Dist>
}

object {
   Stack
   texture{T11}
   translate <Col2 Row2 Dist>
}

object {
   Stack
   texture{T12}
   translate <Col3 Row2 Dist>
}

object {
   Stack
   texture{T13}
   translate <Col4 Row2 Dist>
}

object {
   Stack
   texture{T14}
   translate <Col5 Row2 Dist>
}

object {
   Stack
   texture{T15}
   translate <Col6 Row2 Dist>
}

object {
   Stack
   texture{T16}
   translate <Col7 Row2 Dist>
}

object {
   Stack
   texture{T17}
   translate <Col8 Row2 Dist>
}

object {
   Stack
   texture{T18}
   translate <Col9 Row2 Dist>
}

object {
   Stack
   texture{T19}
   translate <Col1 Row3 Dist>
}

object {
   Stack
   texture{T20}
   translate <Col2 Row3 Dist>
}

object {
   Stack
   texture{T21}
   translate <Col3 Row3 Dist>
}

object {
   Stack
   texture{T22}
   translate <Col4 Row3 Dist>
}

object {
   Stack
   texture{T23}
   translate <Col5 Row3 Dist>
}

object {
   Stack
   texture{T24}
   translate <Col6 Row3 Dist>
}

object {
   Stack
   texture{T25}
   translate <Col7 Row3 Dist>
}

object {
   Stack
   texture{T26}
   translate <Col8 Row3 Dist>
}

object {
   Stack
   texture{T27}
   translate <Col9 Row3 Dist>
}

plane { z, 1.1 pigment {White} }


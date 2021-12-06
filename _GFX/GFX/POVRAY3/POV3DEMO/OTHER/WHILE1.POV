 // Persistence Of Vision raytracer version 3.0 sample file.

#version 3.0
global_settings { assumed_gamma 2.2 }

 camera {
    location  <0, 0,-30>
    direction <0, 0,  1>
    up        <0,  1,  0>
    right     <4/3, 0,  0>
    look_at   <0, 0, 0>
    }

 background { color rgb <0.5, 0.5, 0.5> }


 light_source {<20, 30, -100> colour 1}

 #declare r1=12
 #declare A=0.1
 #declare B=0.25

 #declare Count=400

union{
  #while (Count>=0)
    #declare X=r1*sin(A*Count)*cos(B*Count)
    #declare Y=r1*sin(A*Count)*sin(B*Count)
    #declare Z=r1*cos(A*Count)
    sphere { <X,Y,Z>, 1 
      texture{
        pigment { color rgb <abs(X/r1), abs(Y/r1), abs(Z/r1)> }
        finish {
         ambient 0.2
         diffuse 0.6
         phong 0.3
         phong_size 100
        }
      }
    }
    #declare Count=Count-1
  #end
  rotate <-20,45,0>
}

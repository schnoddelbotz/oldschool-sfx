// Persistence Of Vision raytracer version 3.0 sample file.
camera {
    location <-2.0, 2, -5.25>
    right x*1.3333
    angle 70
    look_at <-0.75, -0.5, 0>
}

light_source { <20, 20, -25> rgb 1 }
plane { y, 0  pigment { checker Plum,Yellow*0.85}}

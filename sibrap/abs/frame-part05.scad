include <config.scad>

//translate([0,0,0])color([1,0,0])import("homut.stl");

// качество цилиндров
$fn=60;
// наружный радиус
r1=8;
// внутренний радиус
r2=4.45;
// габаритная высота
h1=8;
// щель
dx=4;

// радиус винта М3
r3=3/2;
// радиус головки винта М3
r4=6.2/2;
// радиус гайки М3
r5=6.4/2;
// высота гайки
h2=3.7;

module ear() {
intersection() {
    rotate([0,0,180+12])cube([7.96,9.5,h1]);
    rotate([0,0,180-24])translate([-3,0,0])cube([9,10.3,h1]);
    translate([-9.8,-9.8,0])cube([9.8,9.8,h1]);
}
}

module frame_part05() {
difference() {
    union() {
        cylinder(r=r1,h=h1);
        ear();
        mirror([1,0,0])ear();
    }
    translate([0,0,-DELTA])cylinder(r=r2,h=h1+DELTA*2);
    translate([-dx/2,-r1-2,-DELTA])cube([dx,r1+2,h1+DELTA*2]);
    translate([-r1,-5.85,h1/2])rotate([0,90,0]){
        cylinder(r=r3,h=2*r1);
        translate([0,0,2*r1-h2])cylinder(r=r4,h=h2);
        cylinder(r=r5,h=h2,$fn=6);
    }
}
}

frame_part05();

include <config.scad>
use <lib/halfcube.scad>

// расстояние между отверстиями
dx1=26;
dx=dx1/sqrt(2);
// радиус закругления
r1=4;

// габаритная длина
x1=22;
// габаритная высота
h1=4.4;

// высота ушек
h2=3;

// радиус отверстия
r2=3.2/2;

module hole() {
    translate([0,0,h2-1.5+0.1]) cylinder(h=2,r1=r2,r2=r2+2);
    translate([0,0,-DELTA]) cylinder(h=h2+DELTA,r=r2);
}

module frame_part06() {
rotate([180,0,0])translate([0,0,-h2])
difference() {
    union() {
    intersection() {
        // ушки - квадрат с закруглениями
        rotate([0,0,45])translate([-dx/2,-dx/2,0])
        minkowski() {
            cylinder(r=r1,h=h2/2);
            cube([dx,dx,h2/2]);
        }
        // обрезка двух углов
        translate([-dx1/2-r1,-x1/2,0])cube([dx1+r1*2,x1,h2]);
    }
        // утолщение
        translate([0,0,3-h1/2])cube([r1*2*sqrt(2)+(dx1-x1),x1,h1],true);
    }
    // отверстия под винты
    translate([-dx1/2,0,0])hole();
    translate([dx1/2,0,0])hole();
    // отверстие насквозь
    translate([0,0,3-h1/2])cube([13,17,h1+DELTA*2],true);
    translate([-2.5,8,-1.5])halfcube([5,2.7,7],"x");
    mirror([0,1,0])translate([-2.5,8,-1.5])halfcube([5,2.7,7],"x");
}
}

frame_part06();
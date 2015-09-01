include <config.scad>

// верхняя часть
// ребро квадрата
x1=10;
// радиус закругления
r1=3;
// длина
y1=45;

// продольное отверстие
// радиус
r2=4;
// глубина
y2=27;

// поперечное отверстие
// радиус
r3=4;
// глубина канавки
y3=10;

module holder_part01() {
rotate([90,0,0])
translate([-x1/2,r1,0])
difference() {
    linear_extrude(height=y1)offset(r=r1)square(x1);
    translate([x1/2,x1/2,-DELTA])cylinder(r=r2,h=y2+DELTA);
    rotate([-90,0,0])translate([x1/2,-y1+y3,-r1]){
        translate([0,0,-DELTA])cylinder(r=r3,h=x1+2*r1+DELTA*2);
        translate([-r3,-y3-DELTA,-DELTA])cube([r3*2,y3+DELTA,x1+2*r1+DELTA*2]);
    }
}
}

holder_part01();

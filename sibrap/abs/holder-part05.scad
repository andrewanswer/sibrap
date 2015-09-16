include <config.scad>

// диаметр поперечного отверстия
d3=5;

// боковая деталь - стенка
// длина (толщина)
x2=3;
// ширина
y2=30.8;
// высота
z2=16;
// расстояние от центра
x3=FRAME/2+0.1+x2;
// ширина хвостовой части
y3=15;

// ушко
// радиус закругления
r1=4;
// радиус отверстия
r2=3.4/2;
// длина
x1=2*r1;
// ширина
y1=8;
// высота
z1=3;

module quarter() {
intersection() {
    cylinder(r=x2, h=z2);
    cube([x2,x2,z2]);
}
}

module hpart_bottom() {
    translate([-x3,0,0])cube([x2,y2,z2]);
    translate([-x3+x2,y2,0])rotate([0,0,90])quarter();
    translate([-x3+x2,0,0])rotate([0,0,180])quarter();
    translate([-x3+x2,-y3,0])difference() {
        cube([x2,y3,z2]);
        translate([-DELTA,(y3-x2)/2,z2/2])rotate([0,90,0])cylinder(r=d3/2, h=x3);
    }
}

module ear() {
    difference() {
        union() {
            cube([x1,y1,z1]);
            translate([r1,y1,0])cylinder(r=r1,h=z1);
        }
        translate([r1,y1,-DELTA])cylinder(r=r2,h=z1+DELTA*2);
    }
}

module holder_part05() {
    hpart_bottom();
    mirror([1,0,0]) hpart_bottom();
    translate([-x3+x2-DELTA,y2,0])cube([(x3-x2)*2+DELTA*2,x2,z2]);

    translate([-x3,y2,0]) ear();
    translate([-x3,y2,z2-z1]) ear();
    translate([-x3,y2,0]) cube([x2,x2,z2]);
}

holder_part05();

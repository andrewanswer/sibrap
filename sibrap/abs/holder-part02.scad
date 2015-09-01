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

// верхняя часть
// ребро квадрата
x1=10;
// радиус закругления
r1=3;
// угол загиба, 0..360
a=60;
// ребро куба для вырезания
b=25;

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

module zagib() {
intersection() {
    rotate_extrude($fn=50)offset(r=r1)translate([r1,r1,0])square(x1);
    if (a<=90) cube(b);
    if (a<=90) rotate([0,0,a-90])cube(b);
        
    if (a>90 && a<=180) {
        cube(b);
        rotate([0,0,a-90])cube(b);
    }
    if (a>180 && a<=270) {
        translate([-b,0,0])cube([b*2,b,b]);
        rotate([0,0,a-90])cube(b);
    }
    if (a>270 && a<=360) {
        translate([-23,0,0])cube([b*2,b,b]);
        rotate([0,0,a-180])translate([-b,0,0])cube([b*2,b,b]);
    }
}
}

module holder_part02() {
hpart_bottom();
mirror([1,0,0]) hpart_bottom();
translate([-x3+x2-DELTA,y2,0])cube([(x3-x2)*2+DELTA*2,x2,z2]);

translate([0,y2+x2,x1+r1*2]) {
    rotate([a-90,0,0])
    translate([-x1/2,r1,0])
    difference() {
        linear_extrude(height=25)offset(r=r1)square(x1);
        translate([x1/2,x1/2,1])cylinder(r=4,h=25);
    }
    
    translate([x1/2+r1,0,0])rotate([-90,90-a,90])zagib();
}
}

holder_part02();
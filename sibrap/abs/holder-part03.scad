include <config.scad>

// верхняя деталь
// диаметр отверстия
d1=4.1;
// наружный диаметр
d2=9.1;
// длина
x1=2*d2;
// ширина
y1=38;
// высота
z1=16;
// ширина щели
x11=2;
// диаметр поперечного отверстия
d3=5;

// боковая деталь - стенка
// длина (толщина)
x2=3;
// ширина
y2=40.4;
// высота
z2=16;
// расстояние от центра
x3=FRAME/2+0.1+x2;
// ширина хвостовой части
y3=15;

module hpart_top() {
// кубическая часть вверху
difference() {
    cube([x1,y1,z1]);
    translate([x1/2,y1,DELTA])cylinder(r=4, h=z1);
    translate([(x1-x11)/2,-DELTA,-DELTA])cube([x11,y1,z1+2*DELTA]);
    translate([-DELTA,z2/2,(z1+x2)/2])rotate([0,90,0])cylinder(r=d3/2, h=d2*2+DELTA*2);
}

// круглая часть вверху
difference() {
    translate([x1/2,y1,0])cylinder(r=d2, h=z1);
    translate([x1/2,y1,DELTA])cylinder(r=d1, h=z1);
    translate([(x1-x11)/2,0,DELTA])cube([x11,y1,z1]);
}
}

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

module holder_part03_base() {
    difference() {
        union() {
            translate([-d2,0,0])hpart_top();
            rotate([90,0,0])translate([0,-y2,-z2]){
                hpart_bottom();
                mirror([1,0,0]) hpart_bottom();
            }
        }
        translate([-d2-0.5,y1-d2-1,-0.1])cube([2*d2+1,2*d2+1,8+0.1]);
        translate([0,y1-d2-4,-0.1])cylinder(r=6, h=6+0.1);
    }
}

module holder_part03() {
    translate([0,0,z1])rotate([180,0,0])holder_part03_base();
    translate([-x3+x2,-z2,y2+z1])cube([(x3-x2)*2,z2,0.5]);
}
    
holder_part03();

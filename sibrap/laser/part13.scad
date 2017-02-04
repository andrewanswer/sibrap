use <../abs/lib/halfcube.scad>

// габариты
// ширина
x0=94;
// высота
y0=54;
// толщина
z0=12;

// от левого нижнего угла детали
// до первого отверстия по X
x1=8;
// до первого отверстия по Y
y1=8;
// до оси двигателя по X
x2=x0-27;
// до оси двигателя по Y
y2=27;

// между первым и вторым отверстием по X
x3=16;
// между первым и вторым отверстием по Y
y3=25;

// между отверстиями крепления двигателя
dx=31;

$fn=30;
DELTA=0.1;

module part13() {
difference() {
    //linear_extrude(height=8, center=true)polygon(points=[[0,0], [0,13.36], [18.97,39.94], [98-30.99-9.32,y0], [98-30.99,y0], [98,35.46], [77.53,0]], paths=[[0,1,2,3,4,5,6]]);
    union() {
        linear_extrude(height=z0, center=true)
        polygon(points=[[x1,0], [0,x1], [0.45,10], [9.15,y1+y3+2], [x1+x3,y0-6], [x2-9,y0-6], [x2-3,y0], [x0-24,y0], [x0,y0-24], [x0,24], [x0-24,0]], paths=[[0,1,2,3,4,5,6,7,8,9,10]]);
        hull() {
            translate([x1,y1,-z0/2])cylinder(r=16/2,h=z0);
            translate([x1+x3,y1+y3,-z0/2])cylinder(r=30/2,h=z0);
        }
    }
    translate([x1,y1,-z0/2-DELTA]) {
        cylinder(r=4,h=z0+DELTA*2);
        translate([x3,y3,0])cylinder(r=4,h=z0+DELTA*2);
        translate([x2-x1,y2-y1,0])rotate([0,0,-45]){
            cylinder(r=11,h=z0+DELTA*2);
            translate([-dx/2,-dx/2,0])hole();
            translate([-dx/2,dx/2,0])hole();
            translate([dx/2,-dx/2,0])hole();
            translate([dx/2,dx/2,0])hole();
        }
    }
}
}

module hole() {
  cylinder(r=1.5,h=z0+DELTA*2);
  translate([0,0,8])cylinder(r=3.3,h=z0-8+DELTA*2);
}


module motor() {
intersection(){
    cube([42,42,8],true);
    rotate([0,0,45])cube([38*sqrt(2),38*sqrt(2),8],true);
}
}
//projection()
part13();

use <../abs/lib/halfcube.scad>

// габариты
// ширина
x0=98;
// высота
y0=53.36;

// от левого нижнего угла детали
// до первого отверстия по X
x1=10;
// до первого отверстия по Y
y1=8.36;
// до оси двигателя по X
x2=69;
// до оси двигателя по Y
y2=27;

// между первым и вторым отверстием по X
x3=16;
// между первым и вторым отверстием по Y
y3=25;

// между краем детали и посадочными отверстиями
x4=5.56;
y4=6.02;

// между отверстиями крепления двигателя
dx=31;

$fn=30;
DELTA=0.1;

module part13() {
difference() {
    linear_extrude(height=8,center=true)polygon(points=[[0,0],[0,13.36],[18.97,39.94],[98-30.99-9.32,y0],[98-30.99,y0],[98,35.46],[77.53,0]], paths=[[0,1,2,3,4,5,6]]);
    translate([x1,y1,-4-DELTA]) {
        cylinder(r=4,h=8+DELTA*2);
        translate([x3,y3,0])cylinder(r=4,h=8+DELTA*2);
        translate([x2-x1,y2-y1,0])rotate([0,0,-30]){
            cylinder(r=11,h=8+DELTA*2);
            translate([-dx/2,-dx/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([-dx/2,dx/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([dx/2,-dx/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([dx/2,dx/2,0])cylinder(r=1.5,h=8+DELTA*2);
        }
    }
}
}

//projection()
part13();

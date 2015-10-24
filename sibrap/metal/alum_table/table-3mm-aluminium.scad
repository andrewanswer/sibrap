use <../../abs/lib/halfcube.scad>

$fn=20;

x1=180;
y1=120;
z1=3;

d1=3;
d2=4;

module square_hole(r,x,y) {
    translate([0,0,-0.1]) {
        cylinder(r=r,h=z1+1);
        translate([x,0])cylinder(r=r,h=z1+1);
        translate([0,y])cylinder(r=r,h=z1+1);
        translate([x,y])cylinder(r=r,h=z1+1);
    }
}

module round_hole(r,t) {
    translate([0,0,-0.1]) {
        cylinder(r=r,h=z1+1);
        translate([t,0])cylinder(r=r,h=z1+1);
        translate([0,-r,0])cube([t,2*r,z1+1]);
    }
}

module rez() {
    difference() {
        cube([47,75,z1+1]);
        halfcube([19,19,z1],"z");
        translate([47,0])rotate([0,0,90])halfcube([11,11,z1],"z");
        translate([47,75])rotate([0,0,180])halfcube([5,5,z1],"z");
        translate([0,75])rotate([0,0,-90])halfcube([29,29,z1],"z");
    }
}

module table_3mm_plate() {
difference() {
    cube([x1,y1,z1]);
    translate([5,5])square_hole(d1/2,26,22);
    translate([x1-5-26,5])square_hole(d1/2,26,22);
    translate([5,y1-5-22])square_hole(d1/2,26,22);
    translate([x1-5-26,y1-5-22])square_hole(d1/2,26,22);
    translate([45,15])square_hole(d2/2,x1-90,y1-30);
    translate([x1/2-8,30])square_hole(d1/2,16,y1-13-25);
    translate([x1/2-8,5])rotate([0,0,90])round_hole(d1/2,10);
    translate([x1/2+8,5])rotate([0,0,90])round_hole(d1/2,10);
    translate([5+26,30,-0.1]) rez();
    translate([x1-5-26,30,-0.1]) mirror([1,0,0])rez();
}
}

//projection(true) 
table_3mm_plate();
include <config.scad>

x=10;
y=30;
z=FRAME;

// difference between details
delta=0.05;

module frame_part03() {
difference() {
	cube([x,y,z]);
    translate([x,y/2-1.5*sqrt(2)-3,-1])rotate([0,0,45])cube([3,3,z+2]);
    translate([x,y/2-1.5*sqrt(2)+3,-1])rotate([0,0,45])cube([3,3,z+2]);
	translate([x,y/2,-1])cylinder(r=4+delta,h=z+2);
	translate([-1,y/2-8,z/2])rotate([0,90,0])cylinder(r=2.5+delta,h=x+2);
	translate([-1,7,z/2])rotate([0,90,0])cylinder(r=4.25+delta,h=5.7+delta);
	translate([-1,y/2+8,z/2])rotate([0,90,0])cylinder(r=2.5+delta,h=x+2);
	translate([-1,23,z/2])rotate([0,90,0])cylinder(r=4.25+delta,h=5.7+delta);
}
}

frame_part03();
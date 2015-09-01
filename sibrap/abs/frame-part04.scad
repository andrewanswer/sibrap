include <config.scad>

x=17-FRAME/2;
y=30;
z=FRAME;

// difference between details
delta=0.05;

module frame_part04() {
difference() {
	cube([x,y,z]);
	translate([x,y/2,-1])cylinder(r=4,h=z+2);
	translate([x,y/2-1.5*sqrt(2)-3,-1])rotate([0,0,45])cube([3,3,z+2]);
	translate([x,y/2-1.5*sqrt(2)+3,-1])rotate([0,0,45])cube([3,3,z+2]);
	translate([-1,y/2-8,z/2])rotate([0,90,0])cylinder(r=2.5,h=x+2);
	//translate([-1,7,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
	translate([-1,y/2+8,z/2])rotate([0,90,0])cylinder(r=2.5,h=x+2);
	//translate([-1,23,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
}
}

frame_part04();
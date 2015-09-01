include <config.scad>
use <lib/halfcube.scad>

x=42; // width
y=15.5; // depth
z=12; // height
z0=z-2-1;

d1=23.5;
d2=8;
d3=3.4;
d4=9;
d5=3;
x1=18.5;
h1=9;
h2=12;
z1=z-3;

d6=6.5;
hh=6.5;
d7=6.8;

module head_part03() {
// freecad positioning
//translate([18.5,8,60.5])rotate([180,90,0])
mirror([1,0,0])
union(){
	translate([4,y/2,2])cylinder(0.5,r=d7/2,$fn=20);
difference(){
	// main part
	cube([x,y,z]);
	translate([0,-1,z-1])cube([x,y+2,z]); // Отрезаем весь верх
	translate([x-4.5,-1,z1])cube([d4,y+2,d4]);
	translate([x-4.5,-1,z1])rotate([0,40,0])cube([d4,y+2,d4]);

	// bearing
	translate([x1,y/2+h1/2,z0])rotate([90,0,0])cylinder(h1,r=d1/2,$fn=50);
	translate([x1,y/2,d1/2+z0])cube([d1,h1,d1],true);
	translate([x1,y/2+h2/2,z0])rotate([90,0,0])cylinder(h2,r=d2/2,$fn=50);
	translate([x1,y/2,d2/2+z0])cube([d2,h2,d2],true);

	// top slot
	translate([-1,-1,z-4])cube([x1-9,y+2,5]);
	translate([3,y/2,-1])cylinder(z+2,r=d3/2,$fn=20);
	translate([3,y/2,-1])cylinder(3,r=d7/2,$fn=20);

	// bottom round cut
	translate([x-4.5,-1,z1])rotate([-90,0,0])cylinder(y+2,r=d5/2,$fn=20);
	translate([x+1,-1,-1])rotate([0,-90,0])halfcube([7.6+3,y+2-hh,6.3],"y");

	translate([x-4.5,-1,z1])rotate([0,40,0])cube([d4,y+2,d4]);
	translate([x+1,y-hh,-1])rotate([0,-90,0])halfcube([11.9+4,hh+1,6],"y");
}

// bottom round thing
difference(){
	union(){
		translate([x-4.5,0,z1])rotate([-90,0,0])cylinder(y-hh,r=d4/2,$fn=50);
		translate([x-4.5,0,z1])rotate([-90,0,0])cylinder(y,r=d6/2,$fn=50);
	}
	translate([x-4.5,-1,z1])rotate([-90,0,0])cylinder(y+2,r=d5/2,$fn=20);
}
}
}

head_part03();
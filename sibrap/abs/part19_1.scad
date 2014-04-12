include <halfcube.scad>
x=41.5-2;
y=14.7;
z=10;
z0=6.5;

d1=22.9;
d2=8;
d3=3;
d4=9;
d5=2.5;
x1=16;
h1=8;
h2=11;
z1=7;
union(){
difference(){
	cube([x,y,z]);
	translate([x1,y/2+h1/2,z0])rotate([90,0,0])cylinder(h1,r=d1/2,$fn=50);
	translate([x1,y/2,d1/2+z0])cube([d1,h1,d1],true);
	translate([x1,y/2+h2/2,z0])rotate([90,0,0])cylinder(h2,r=d2/2,$fn=50);
	translate([x1,y/2,d2/2+z0])cube([d2,h2,d2],true);

	translate([-1,-1,z-3])cube([6.5,y+2,4]);
	translate([3,y/2,-1])cylinder(z+2,r=d3/2,$fn=20);

	translate([x-4.5,-1,z1])rotate([-90,0,0])cylinder(y+2,r=d5/2,$fn=20);
	translate([x-4.5,-1,z1])rotate([0,40,0])cube([d4,y+2,d4]);
	//translate([x-4.5,-1,-1])cube([d4,y+2,z+2]);
	translate([x+1,-1,-1])rotate([0,-90,0])halfcube([7.6,y+2,6.3],"y");
}
difference(){
	translate([x-4.5,0,z1])rotate([-90,0,0])cylinder(y,r=d4/2,$fn=50);
	translate([x-4.5,-1,z1])rotate([-90,0,0])cylinder(y+2,r=d5/2,$fn=20);
}
}
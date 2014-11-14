$fn=40;

x=8;
y=30;
z=18;
difference() {
	cube([x,y,z]);
	translate([x,y/2,-1])cylinder(r=4,h=z+2);
	translate([-1,y/2-8,z/2])rotate([0,90,0])cylinder(r=2.5,h=x+2);
	//translate([-1,7,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
	translate([-1,y/2+8,z/2])rotate([0,90,0])cylinder(r=2.5,h=x+2);
	//translate([-1,23,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
}

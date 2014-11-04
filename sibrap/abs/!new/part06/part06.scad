$fn=40;
difference() {
	cube([10,30,18]);
	translate([10,15,-1])cylinder(r=4,h=20);
	translate([-1,7,9])rotate([0,90,0])cylinder(r=2.5,h=12);
	translate([-1,7,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
	translate([-1,23,9])rotate([0,90,0])cylinder(r=2.5,h=12);
	translate([-1,23,9])rotate([0,90,0])cylinder(r=4.25,h=5.6);
}

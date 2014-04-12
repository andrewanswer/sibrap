union() {
	translate([0,14,6])cube([80,6,4]);
	difference() {
		cube([80,20,6]);
		translate([40,25,-2]) rotate([90,0,0])cylinder(82,r=5,$fn=20);
	}
}
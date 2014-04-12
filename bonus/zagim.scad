union() {
	translate([0,14,6])cube([80,4,4]);
	difference() {
		cube([80,18,6]);
		translate([-1,9,-2]) rotate([0,90,0])cylinder(82,r=4,$fn=20);
	}
}
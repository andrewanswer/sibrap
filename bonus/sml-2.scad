union() {
	translate([-5,-5,0]) cube([75,5,10]);
	translate([-5,-5,0]) cube([5,75,10]);
	difference() {
		cube([70,70,4]);
		translate([60,60,-0.5]) cylinder(5,r=2,$fn=20);
		translate([10,10,-0.5]) cube([45,45,5]);
	}
}

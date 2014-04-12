d1=12;
d2=9;
union() {
	difference() {
		cube([36,5,18]);
		translate([5,-1,5]) rotate([-90,0,0]) {
			cylinder(7,r=2/2,$fn=20);
			translate([0,0,3.5]) rotate([0,0,90])cylinder(3,r=6.6/2,$fa=60);
		}
		translate([31,-1,13]) rotate([-90,0,0]) {
			cylinder(7,r=2/2,$fn=20);
			translate([0,0,3.5]) rotate([0,0,90]) cylinder(3,r=6.6/2,$fa=60);
		}
	}
	translate([9,5,0])
	difference() {
		cube(18);
		translate([9,9,-1]) cylinder(20,r=d2/2,$fn=40);
		translate([9,9,4]) cylinder(20,r=d1/2,$fn=40);
	}
}
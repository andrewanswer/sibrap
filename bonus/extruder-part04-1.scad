module plashka() {
difference() {
	cube([20,35,2]);
	translate([5.5,3,-1]) cylinder(4,r=1.5,$fn=15);
	translate([5.5,31,-1]) cylinder(4,r=1.5,$fn=15);
}
}

//plashka();
a=3;
b=5;
c=4;
difference() {
	cube([20+2*a,36+2*a,2+b]);
	translate([a,a,b]) {
		cube([20,36,3]);
		translate([7.5,c,-b-1]) cylinder(b+2,r=1.5,$fn=15);
		translate([7.5,36-c,-b-1]) cylinder(b+2,r=1.5,$fn=15);
	}
}
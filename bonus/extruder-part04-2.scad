module plashka2() {
difference() {
	cube([25,35,2]);
	translate([10,14.5,-1]) cylinder(4,r=15.2/2,$fn=25);
	translate([5,6,-1]) cylinder(4,r=1.5,$fn=15);
	translate([5,35-12,-1]) cylinder(4,r=1.5,$fn=15);
	translate([25-5,14.5,-1]) cylinder(4,r=1.5,$fn=15);
}
}

//plashka2();
a=3;
b=5;
difference() {
	cube([25+2*a,36+2*a,2+b]);
	translate([a,a,b]) {
	cube([25,36,2+b]);
	translate([10,15.5,-1-b]) cylinder(4+b,r=15.2/2,$fn=25);
	translate([5,7,-1-b]) cylinder(4+b,r=1.5,$fn=15);
	translate([5,36-12,-1-b]) cylinder(4+b,r=1.5,$fn=15);
	translate([25-5,15.5,-1-b]) cylinder(4+b,r=1.5,$fn=15);
	}
}
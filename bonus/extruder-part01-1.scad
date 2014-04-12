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

//translate([10,14.5,-10])
difference() {
union() {
	cylinder(10,r=4.8,$fn=20);
	cylinder(5,r=13,$fn=35);
}
	translate([10,0,-1])cylinder(20,r=1.5,$fn=15);
	translate([-5,8.5,-1])cylinder(20,r=1.5,$fn=15);
	translate([-5,-8.5,-1])cylinder(20,r=1.5,$fn=15);

}
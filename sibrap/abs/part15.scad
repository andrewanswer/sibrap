module block() {
difference() {
	cube([40,50,18]);
	translate([13.9,5,-1])cube([8.2,40,23]);
	translate([18,25,5])cylinder(15,r=1.5,$fn=15);

	// втулка
translate([0,0.5,0]) {
	translate([32,11,-1]) cylinder(20,r=4.7,$fn=40);
	translate([32,11,-1]) cylinder(15,r=12/2,$fn=40);
}
	// гайка
translate([0,-0.5,0]) {
	translate([32,39,-1])cylinder(6.4,r=4.7,$fn=40);
	translate([32,39,10])cylinder(9,r=4.7,$fn=40);
	translate([35,32.4,-1])cube([6,13.2,20]);
	translate ([31.5,39,-1]) cylinder(20,r=15.2/2,$fa=60);
}

	// направляющая
	translate([9,-1,9])rotate([-90,0,0])cylinder(52,r=4.1,$fn=30);
	// вырезы у направляющей
	translate([-1,40,-1])cube([10,20,20]);
	translate([-1,-1,-1])cube([10,11,20]);
	translate([8,-1,8])cube([1,52,11]);

	// отверстие 1
	translate([-1,15,15.8])rotate([0,90,0])cylinder(15,r=1.5,$fn=15);
	translate([11,11.9,12.5])cube([3,6.2,6]);

	// отверстие 2
	translate([0,20,0]) {
		translate([-1,15,15.8])rotate([0,90,0])cylinder(15,r=1.5,$fn=15);
		translate([11,11.9,12.5])cube([3,6.2,6]);
	}
}
}

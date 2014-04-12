m8_diameter = 9;
m8_nut_diameter = 14.1;

m3_diameter = 3.2;
m3_nut_diameter = 5.3;
m3_nut_diameter_horizontal = 6.1;

outer_diameter = m8_diameter/2+3.3;
screw_hole_spacing = 20;
opening_size = m8_diameter-1.5; //openingsize

module endstop(){
difference(){
	union(){
		translate([outer_diameter,outer_diameter,-10]) cylinder(20,r=outer_diameter,$fn=20);
		translate([outer_diameter,0,0]) cube([15.5,outer_diameter*2,10]);
		translate([-14,0,0]) cube([37,4,10]);
		translate([17,17.5,5]) rotate([90,0,0]) cylinder(5,r=5.77,$fn=6);
	}
	translate([9,outer_diameter-opening_size/2,-10.1]) cube([18,opening_size,21]);
	translate([outer_diameter, outer_diameter,-10.1]) cylinder(21, r = m8_diameter/2,$fn=18);

	//Securing hole
	translate([17,17,5]) rotate([90,0,0]) cylinder(20,r=m3_diameter/2,$fn=10);
	translate([17,19.5,5]) rotate([90,0,0]) cylinder(5,r=m3_nut_diameter_horizontal/2+0.2,$fn=6);

	translate([-4.8,17,5]) rotate([90,0,0]) cylinder(20,r=2.5/2,$fn=10);
	translate([-11,17,5]) rotate([90,0,0]) cylinder(20,r=2.5/2,$fn=10);
}
}
rotate([180,0,0])
translate([-outer_diameter,-outer_diameter,-10])endstop();


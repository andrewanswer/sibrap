include <config.scad>

// d1=15;
// Увеличиваем внутренний диаметр на 0.4 мм
// Увеличиваем внутренний диаметр на 0.3 мм
d1=15.4;
d2=9;
module hole(x,y) {
		translate([x,-1,y]) rotate([-90,0,0]) {
			cylinder(7,r=3/2,$fn=20);
			translate([0,0,3.5]) rotate([0,0,90])cylinder(3,r=6.6/2,$fa=10);
		}
}


module table_part01() {
	difference() {
		cube([36,5,32]);
		hole(5,5);
		hole(5,27);
		hole(31,27);
		//hole(31,13);
		hole(31,5);
		translate([5,-1,5]) rotate([-90,0,0]) {
			translate([10,0,0]) rotate([-90,0,0]) {
				translate([3,-10,-28]) cylinder(30,r=d1/2,$fn=40);
				translate([3,-10,0]) rotate([0,0,90]) cylinder(20,r=d2/2,$fn=40);
			}
		}
	}
	translate([9,0,0])	difference() {
		cube([18,18,32]);
		translate([9,9,-1]) cylinder(25,r=d2/2,$fn=40);
		translate([9,9,4]) cylinder(30,r=d1/2,$fn=40);

// отверстия для извлечения подшипников
		translate([3,5.8,-1]) cylinder(25,r=0.8,$fn=40);
		translate([14.9,12.4,-1]) cylinder(25,r=0.8,$fn=40);
	}
}

table_part01();
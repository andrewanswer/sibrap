include <config.scad>

// наружный диаметр направляющей
d1=8;
// допуск на радиус направляющей
// (расстояние между стенками направляющей и детали)
delta1=0.2;
// диаметр М3
d2=3.2;
// диаметр гайки М3
d3=6.1;
// внешний диаметр концевика
d4=d1/2+3.3;
// вырез концевика
h1=d1-1.5;

module frame_part02() {
rotate([180,0,-90])
translate([-d4,-d4,-10])
difference(){
	union(){
		translate([d4,d4,-10]) cylinder(20,r=d4);
		translate([d4,0,0]) cube([15.5,d4*2,10]);
		translate([-14,0,0]) cube([37,4,10]);
		translate([17,17.5,5]) rotate([90,0,0]) cylinder(5,r=5.77,$fn=6);
	}
	translate([9,d4-h1/2,-10.1]) cube([18,h1,21]);
	translate([d4, d4,-10.1]) cylinder(21, r=d1/2+delta1);

	//Securing hole
	translate([17,17,5]) rotate([90,0,0]) cylinder(20,r=d2/2);
	translate([17,19.5,5]) rotate([90,0,0]) cylinder(5,r=d3/2+0.2,$fn=6);

	translate([-4.8,17,5]) rotate([90,0,0]) cylinder(20,r=2.5/2);
	translate([-11,17,5]) rotate([90,0,0]) cylinder(20,r=2.5/2);
}
}
frame_part02();


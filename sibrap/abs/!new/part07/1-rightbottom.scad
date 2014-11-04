module BIGblock() {
	module block() {
		M3 = 3.2/2;
		difference() {
		union() {
			translate([-2,0,0]) cube([43.8,50,18]);
			translate([-2,10,0])	cube([2,30,18]);
			// шапка над подшипником
			translate ([22.1,0,-9]) cube([19.7,23,9]);
		}

//	translate([-10,-10,-40])cube([100,100,50]);
//	translate([-10,-10,13])cube([100,100,50]);
//	translate([-78,-10,-20])cube([100,100,50]);

// вырез под оргстекло
//	translate([13.9,5,-1])cube([8.2,40,23]); - не входит
	translate([13.9,4.9,-1])cube([8.2,40.2,23]);

// линейный подшипник 24 * 15 * 8
	translate([32,11,-1]) cylinder(20,r=9.2/2,$fn=40);

//translate([32,11,-4]) cylinder(26,r=15.4/2,$fn=40); // для инверсии входа подшипника
	translate([32,11,-11]) cylinder(26,r=15.4/2,$fn=40);

	// Отверстия для извлечения подшипников
	translate([28,6,5]) cylinder(20,r=1,$fn=40);
	translate([36,16,5]) cylinder(20,r=1,$fn=40);

	// гайка  M5
//#	translate([32,39,-1])cylinder(6.4,r=4.7,$fn=40);
//#	translate([32,39,10])cylinder(9,r=4.7,$fn=40);
//#translate([35,32.4,-1])cube([6,13.2,20]);
	translate ([32,39,-1]) cylinder(20,r=9.4/2,$fa=60);


	// направляющая - слабо держит
//	translate([9,-1,9])rotate([-90,0,0])cylinder(52,r=8.4/2,$fn=30);
	// направляющая - меньше диаметр отверстия
#	translate([9,-1,9])rotate([-90,0,0])cylinder(52,r=8.3/2,$fn=30);
	// вырезы у направляющей
	translate([8,-1,8])cube([1,52,11]);

	// отверстие 1
	translate([-5,15,15.5])rotate([0,90,0])cylinder(20,r=M3,$fn=15);
	translate([12,15,15.5])rotate([0,90,0])cylinder(5,r=6.5/2,$fa=60);

	// отверстие 2
	translate([0,35,0]) {
		translate([-5,0,15.5])rotate([0,90,0])cylinder(20,r=M3,$fn=15);
	translate([12,0,15.5])rotate([0,90,0])cylinder(5,r=6.5/2,$fa=60);
	}
	// отверстие 3 в прижиме
	translate([-9.5,10,-6.6]) {
		translate([-5,15,15.8])rotate([0,90,0])cylinder(20,r=M3,$fn=15);
	translate([12,15,15.8])rotate([0,90,0])cylinder(4,r=6.8/2,$fa=60);
	}
	// сквозное отверстие в детали
		translate([-14.5,25,3])rotate([0,90,0])cylinder(60,r=M3,$fn=15);
}
}

	// шапка над гайкой, отверстие в ней
	difference() {
		translate ([23,0,16]) cube([18,20,2]);
		translate ([32,11,10]) cylinder(10,r=6/2,$fn=100);
	}
	translate ([23,0,15.4]) cube([18,20,0.6]);

// мост над трубкой - не нужен при верной ориентации прохода втулки
//	translate ([24,30.5,13.5]) cube([16,16,0.5]);

translate([0,50,18])
rotate([180,0,0])
block();
}

// расстояние между осью подшипника и осью гайки должно быть 28 мм
 BIGblock();

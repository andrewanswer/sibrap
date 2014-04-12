x=90;y=75;z=18;
x1=60;y1=15.5;
y2=9.8;
x3=25;y3=23;
d1=12;
d2=3;
x4=(x-x1)/2;
dz=31;
x5=15;
y5=22;
x6=x5+28+9;
d3=14;
d4=22.5;

v=10;
d5=16;
d6=8;
dz2=6;

module bolt() {
	translate([0,0,-1])cylinder(4,r=3.2,$fn=20);
	translate([0,0,4])cylinder(z-2,r=d2/2,$fn=20);
}
module belt() {
	difference() {
		translate([1,0,z-11.8])
		union() {
			cylinder(v,r=d5/2,$fn=30);
			translate([-d5/2,-d5/2,0]) cube([d5/2,d5,v]);
		}
		translate([1,0,z-11.8])
		union() {
			cylinder(v,r=d6/2,$fn=30);
			translate([-d6/2,-d6/2,0]) cube([d6/2,d6,v]);
		}
	}
	//translate([-1,0,z-7]) rotate([0,90,0]) cylinder(d6,r=d2/2,$fn=20);
	translate([7,0,0]){
		translate([0,0,-1])cylinder(4,r=3,$fn=20);
		translate([0,0,4])cylinder(z-6,r=d2/2,$fn=20);
	}
}
intersection () {                           
translate([-2,-2,-2])cube ([46.5,100,50]) ;
difference() {
	cube([x,y,z]);
	translate([(x-x1)/2,-1,-1]) cube([x1,y1,z+2]);
	translate([(x-x1)/2,y-y1+1,-1]) cube([x1,y1,z+2]);
	translate([x6-dz2,y5-dz2,z-4]) cube([2*dz2+dz+2,2*dz2+dz,5]);

	// направляющие
	translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([x-x4-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([x-x4-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);

	// квадратные отверстия
	//translate([x-x3-12.1,26.3,-1]) cube([x3,y3,z+2]);
	//translate([x-x3-48,26.3,-1]) cube([x3,y3,z+2]);
	
	// болты
	translate([x5-1,y5-1.5,0]) bolt();
	//translate([x5-1,y5+dz-1.5,0]) bolt();
	translate([x5+26,y5-1.5,0]) bolt();
	translate([x5+26,y5+dz-1.5,0]) bolt();

	translate([x6,y5,0]) bolt();
	translate([x6,y5+dz,0]) bolt();
	translate([x6+dz,y5,0]) bolt();
	translate([x6+dz,y5+dz,0]) bolt();

	// пазы
	//translate([x-61.25,44.38,-1]) cylinder(z+2,r=d3/2,$fn=40);
	// круглые отверстия
	translate([x-60.9,40.9,-1]) cylinder(9,r=d4/2,$fn=40);
	translate([x-60.9,40.9,8.5]) cylinder(10,r=13/2,$fn=40);
	translate([x-60.9,40.9,z-2]) cylinder(9,r=d4/2,$fn=40);
	// мотор
	translate([x6+dz/2,y5+dz/2,-1]) cylinder(z+2,r=d4/2,$fn=40);
	translate([x6+dz/2-d4/2,y5+dz/2-d4/2,z-11.8]) cube([d4,d4/2,z+2]);
	// продольный паз для ремня
	translate([-1,24,z-11.8]) cube([x+2,5,12]);

	// для ремней
	translate([3,41,0]) belt();
	translate([x,41,0]) mirror([1,0,0]) belt();
}
}
	//translate([3,0,0]) belt();
// расчет такого y2, чтобы расстояние между осями было верным
echo((y-(47.3+63.2)/2)/2);
// расчет крепления мотора
echo("x=",x6+dz/2);
echo("y=",y5+dz/2);

// втулка
/*color([1,0.5,0.3])
translate([-0.1,y2,z/2])
rotate([0,90,0])
difference() {
	cylinder(10.3,r=11.5/2);
	translate([0,0,-0.1])cylinder(10.5,r=7.9/2);
}

	translate([26.25,5.2,3.8]) %cube([18,11.7,10.5]);
translate([26.25+11.5/2,5.25+11.5/2,4])
difference() {
	cylinder(10.3,r=11.5/2);
	translate([0,0,-0.1])cylinder(10.5,r=7.9/2);
	

}
}
*/

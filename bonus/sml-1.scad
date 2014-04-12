w=36;
h=18;

module clamp() {
	// center
	translate([0,0,-0.5]) {
		translate([0,0,4]) cube([w,h,5],true);
		translate([-13,-4,-3]) cylinder(5,r=1.5,$fn=20);
		translate([13,4,-3]) cylinder(5,r=1.5,$fn=20);
	}
}

w1=24;
h1=10;

module belt() {
	// center
	translate([0,0,-0.5]) {
		translate([0,0,4]) cube([w1,h1,5],true);
		translate([-8,0,-3]) cylinder(5,r=1.5,$fn=20);
		translate([8,0,-3]) cylinder(5,r=1.5,$fn=20);
	}
}


x=180;
y=120;
z=4;
dx=5;
dy=5;
xx=x/2-w/2-dx;
yy=y/2-h/2-dy;
xx0=x/2-w1/2-dx;
yy0=y/2-h1/2-dy;

dx1=45;
dy1=45;
dd=4;
//translate([0,0,10]) cube([210,210,z],true);
intersection() {
cube([100,100,10]);
translate([0,0,z/2])
difference() {
	union() {
		cube([x,y,z],true);
		translate([x/4+z/2,y/2+dd/2,z/2])cube([x/2+z,dd,z*2],true);
		translate([x/2+dd/2,y/4+z/2,z/2])cube([dd,y/2+z,z*2],true);
	}
	translate([0,0,-0.5]) {
		translate([-45,20,0]) cube([70,30,6],true);
		translate([-45,-20,0]) cube([70,30,6],true);
		translate([45,20,0]) cube([70,30,6],true);
		translate([45,-20,0]) cube([70,30,6],true);
	}
	// направляющие
	translate([xx,yy,0]) clamp();
	translate([-xx,-yy,0]) clamp();
	translate([xx,-yy,0]) clamp();
	translate([-xx,yy,0]) clamp();

	// ремень
	translate([0,yy0,0]) belt();
	translate([0,-yy0,0]) belt();
	
	// верхняя площадка
	translate([-dx1,-dy1,-2.5]) cylinder(5,r=2,$fn=20);
	translate([-dx1,dy1,-2.5]) cylinder(5,r=2,$fn=20);
	translate([dx1,dy1,-2.5]) cylinder(5,r=2,$fn=20);
	translate([dx1,-dy1,-2.5]) cylinder(5,r=2,$fn=20);
}}
echo("between rods",2*xx);
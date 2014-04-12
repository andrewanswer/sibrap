x=90;
y=75;
z=18;
x1=60;
y1=15.5;
y2=10;
x3=25;
y3=23;
d0=8.5;
d1=12;
d2=3;
x4=(x-x1)/2;
dz=31;
x5=15;
y5=22;
x6=x5+37;
d3=14;
d4=22.7;
v=8;
d5=16;
d6=8;
dz2=6;
z6=(z-v)/2;
y6=5;

module bolt(h) {
   union() {
		translate([0,0,-1])cylinder(4,r=3.2,$fn=20);
		translate([0,0,4])cylinder(h-2,r=d2/2,$fn=20);
	}
}

module belt() {
	union() {
		difference() {
			translate([1,0,z6])
			union() {
				cylinder(v,r=d5/2,$fn=30);
				translate([-d5/2,-d5/2,0]) cube([d5/2,d5,v]);
			}
			translate([1,0,z6])
			union() {
				cylinder(v,r=d6/2,$fn=30);
				translate([-d6/2,-d6/2,0]) cube([d6/2,d6,v]);
			}
		}
		translate([7,0,0]) bolt(z/2);
	}
}

// freecad positioning
//translate([24.5,-32,0])rotate([-90,180,0])
mirror([1,0,0])
difference() {
   // main part
	cube([x,y,z]);
	
   // horizontal section
	//translate([-1,-1,9])cube([x+2,y+2,z]);

	// bushings
	translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([x-x4-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);
	translate([x-x4-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d1/2,$fn=40);

	// shaft holes
	//translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x+1,r=d0/2,$fn=40);
	//translate([-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x+1,r=d0/2,$fn=40);

   // shaft square slots
	translate([(x-x1)/2,-1,-1]) cube([x1,y1,z+2]);
	translate([(x-x1)/2,y-y1+1,-1]) cube([x1,y1,z+2]);

	// belt
	translate([-1,24,z6]) cube([x+2,y6,v]);
	translate([3,43,0]) belt();
	translate([x-2,43,0]) mirror([1,0,0]) belt();

	// head bolts
	translate([x5-2,y5,0]) bolt(z);
	//translate([x5-1,y5+dz,0]) bolt(z);
	translate([x5+26,y5,0]) bolt(z);
	translate([x5+26,y5+dz,0]) bolt(z);

	// motor bolts
	translate([x6,y5,0]) bolt(z);
	translate([x6,y5+dz,0]) bolt(z);
	translate([x6+dz,y5,0]) bolt(z);
	translate([x6+dz,y5+dz,0]) bolt(z);

	// motor
	translate([x6-dz2,y5-dz2,z-4]) cube([2*dz2+dz+2,2*dz2+dz,5]);
	translate([x6+dz/2-d4/2,y5+dz/2-d4/2-2,z6]) cube([d4,d4/2+2,z]);
	translate([x6+dz/2,y5+dz/2,-1]) cylinder(z+2,r=d4/2,$fn=40);

	// bearings
	translate([x-61,41,-1]) cylinder(9,r=d4/2,$fn=40);
	translate([x-61,41,8.5]) cylinder(10,r=13/2,$fn=40);
	translate([x-61,41,z-2]) cylinder(9,r=d4/2,$fn=40);
}

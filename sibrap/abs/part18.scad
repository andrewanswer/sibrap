x=43;
y=36;
z=23;

d1=3;
d2=23;
d3=12;
d4=9.7;
d5=5;
d6=12.5;

x0=5.5;
y0=4;
x1=24.5;
y1=20;
z1=z-6.25;

y2=15.5;
z2=13;
y22=15.5;
z22=13;
y3=3;
z3=6.3;

y4=4;
y5=9;
z4=2.5;
x5=24.5;
y6=5;
x6=14;
z6=5;

module nut() {
	translate([0,0,8.75])rotate([90,0,90])cylinder(z6,r=7/2,$fn=6);
}

// freecad positioning
//translate([15.5,13,17.5])rotate([-90,-90,180])
mirror([1,0,0])
// false=metal barrier, true=ftoroplast
part18(false);

module part18(barrier) {
union() {
difference() {
	// main part
	cube([x,y,z]);

	// horizontal section
	//translate([-1,-1,1])cube([x+2,y+2,z]);

	// bolts
	translate([x0,y0,-1])cylinder(z+2,r=d1/2,$fn=20);
	translate([x0,y-y0,-1])cylinder(z+2,r=d1/2,$fn=20);
	translate([x-x0-1,y-y0,-1])cylinder(z+2,r=d1/2,$fn=20);

	// hobbed bolt
	%translate([x1,y1,-1])cylinder(z+2,r=5.8/2,$fn=50);
	%translate([x1,y1,-1])cylinder(z+2,r=4,$fn=50);

	// bearings
	translate([x1,y1,-1])cylinder(z+2,r=d3/2,$fn=50);
	translate([x1,y1,z1])cylinder(7,r=d2/2,$fn=50);
	translate([x1-d3/2,y1-8,z1-7.8])cube([d3,8,9]);
	translate([x1,y1,-1])cylinder(8.5,r=d2/2,$fn=50);

	// part19 slot
	translate([-1,-1,5])cube([x+2,y4+1,z-4]);
	translate([x0,-1,5])cube([x/2-x0,8,z-4]);
	translate([x0,4,5])cylinder(z-4,r=d4/2,$fn=50);

	// part19 bearing
	translate([x5,y6,5])cylinder(z-4,r=d2/2+0.4,$fn=50);
	%translate([x5,y6,7])cylinder(13,r=4,$fn=50);
	%translate([x5,y6,10])cylinder(7,r=11,$fn=50);

	// part19 nut
	translate([x-4.5,y2-7,z2])rotate([-90,0,0])cylinder(y3,r=z3/2,$fn=6);
	translate([x-6,y2-7,z2-z3/2+0.25])cube([7,y3,z3-0.5]);
	translate([x-3,y4-1,z2])rotate([-90,0,0])cylinder(y5,r=d1/2,$fn=20);

	// profile slot
	translate([-1,-1,z-z4])cube([19,y+2,z4+1]);

	// ABS plastic 3mm
	%translate([-1,y2,z2])rotate([0,90,0])cylinder(x+2,r=3/2,$fn=20);
	translate([x1,y2,z2])rotate([0,90,0])cylinder(x-x1+1,r=d5/2,$fn=20);
	translate([-1,y22,z22])rotate([0,90,0])cylinder(x1+1,r=d5/2,$fn=20);

	if (barrier) {
	// hotend
	translate([-1,y22,z22])rotate([0,90,0])cylinder(x6,r=d6/2,$fn=50);

	// hotend nuts
	for(i=[0:2])translate([-1,y22,z2])rotate([120*i+60,0,0])nut();
	//translate([-1,y22-13.5,z-z4+1])rotate([0,90,0])cube([7.15,8,z6-.2]);
	}
}

// bearing cap & support
difference() {
	union() {
		translate([x1,y1,0.5])cylinder(8.5,r=d2/2+1,$fn=50);
		translate([12.5,6.9,0.5])cube([24,5,8.5]);
	}
	translate([x1,y1,7.9])cylinder(15,r=d3/2,$fn=50);
	translate([x1,y1,-1])cylinder(8.5,r=d2/2,$fn=50);
	translate([0.5,y1-d2/4,0.5])cube([14.5,d2/2,10]);
	translate([12,2,0.5])cube([25,5,9]);
	translate([-1,y22,z22])rotate([0,90,0])cylinder(x6,r=d6/2,$fn=50);
	translate([x5,y6,7])cylinder(13,r=4,$fn=50);
}
}
}

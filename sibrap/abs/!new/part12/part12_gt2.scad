w1=24;
h1=10;
a=4;
b=6.5;
hr1=0.7;
hr2=1.5;
xr1=1.2;
delta=1.1;
r0=1.5*delta;
$fn=20;

module beltclamp_base(z) {
	difference() {
		cube([w1,h1,z],true);
		translate([w1/2-a,0,-z/2-0.5]) cylinder(z+1,r=r0);
		translate([-w1/2+a,0,-z/2-0.5]) cylinder(z+1,r=r0);
    }
}

module beltclamp_top(z) {
	translate([0,0,z/2])
	difference() {
        beltclamp_base(z);
		translate([w1/2-a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2);
		translate([-w1/2+a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2);
	}
}

module beltclamp_nut(z) {
	translate([0,0,z/2])
	difference() {
        beltclamp_base(z);
		translate([w1/2-a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fn=6);
		translate([-w1/2+a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fn=6);
    }
}

module beltclamp_belt(z) {
	translate([0,0,z/2])
	difference() {
        beltclamp_base(z);
		translate([0,0,z-hr1]) cube([b,10,z],true);
		for (i=[0:5]) translate([0,-5+i*2,z-hr2]) cube([b,xr1,z],true);
		translate([0,10,0]) rotate([90,0,0]) cylinder(20,r=r0);
		translate([0,-2,0]) rotate([90,90,0]) cylinder(5,r=6.6/2,$fn=6);
    }
}

//#translate([8,0,-5]) cylinder(25,r=r0);
module stack(hh) {
	beltclamp_belt(9+hh);
	translate([0,0,9+hh]) beltclamp_nut(6);
	translate([0,0,-hh]) mirror([0,0,1]) beltclamp_top(6);
}

module printing(hh) {
	beltclamp_belt(9+hh);
	translate([0,-h1-5,0]) beltclamp_nut(6);
	translate([0,h1+5,0]) beltclamp_top(6);
}

// for freecad positioning
// 3 - толщина стола
//stack(3);

// for printing
// 3 - толщина стола
printing(3);

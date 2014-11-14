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

module beltclamp(z,nut,belt) {
	translate([0,0,z/2])
	difference() {
		cube([w1,h1,z],true);
		translate([w1/2-a,0,-z/2-0.5]) cylinder(z+1,r=r0);
		translate([-w1/2+a,0,-z/2-0.5]) cylinder(z+1,r=r0);
		if (nut) {
			translate([w1/2-a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fn=6);
			translate([-w1/2+a,0,-0.5]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fn=6);
		}
		if (belt) {
			translate([0,0,z-hr1]) cube([b,10,z],true);
			for(i=[0:5])translate([0,-5+i*2,z-hr2]) cube([b,xr1,z],true);
			translate([0,10,0])rotate([90,0,0])cylinder(20,r=r0);
			translate([0,-2,0]) rotate([90,90,0]) cylinder(5,r=6.6/2,$fn=6);
		}
	}
}

module stack(hh) {
	beltclamp(8+hh,false,true);
	translate([0,0,8+hh]) beltclamp(5,true,false);
	translate([0,0,-hh-2]) beltclamp(2);
}

module printing(hh) {
	beltclamp(8+hh,false,true);
	translate([0,-h1-5,0]) beltclamp(5,true,false);
	translate([0,h1+5,0]) beltclamp(2);
}

// for freecad positioning
// 3 - толщина стола
//stack(3);

// for printing
// 3 - толщина стола
printing(3);

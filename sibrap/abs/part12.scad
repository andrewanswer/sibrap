w1=24;
h1=10;
z=5;
a=4;
b=7;
hr1=0.7;
hr2=1.5;
xr1=1.2;
module beltclamp(nut,belt) {
	translate([0,0,z/2])
	difference() {
		cube([w1,h1,z],true);
		if (nut) translate([w1/2-a,0,0]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fa=60);
		translate([w1/2-a,0,-z/2-0.5]) cylinder(z+1,r=1.5,$fn=15);
		if (nut) translate([-w1/2+a,0,0]) rotate([0,0,90]) cylinder(5,r=6.6/2,$fa=60);
		translate([-w1/2+a,0,-z/2-0.5]) cylinder(z+1,r=1.5,$fn=15);
		
		if (belt=="T5") {
			translate([0,5,z-2.5]) cube([b,2.5,z],true);
			translate([0,0,z-2.5]) cube([b,2.5,z],true);
			translate([0,-5,z-2.5]) cube([b,2.5,z],true);
			translate([0,0,z-1]) cube([b,10,z],true);
		}
if (belt=="GT2") {
			translate([0,0,z-hr1]) cube([b,10,z],true);
			for (i=[0:5]) translate([0,-5+i*2,z-hr2]) cube([b,xr1,z],true);
}
	}
}

//beltclamp(false,"T5");
beltclamp(false,"GT2");
translate([0,-h1-5,0]) beltclamp(true);
translate([0,h1+5,0]) beltclamp();

$fn=40;

h1=18;
w=10;

//translate([-4,8,0])cube([60,18,h1]);
difference() {
	union() {
		cylinder(r=10,h=h1);
		translate([-w-4,0,0])
			cube([w,26,h1]);
		translate([-w-4,-10,0])
			cube([w+4,10,h1]);
			cube([10,10,h1]);
	}
	translate([0,0,-.1])cylinder(r=4,h=h1+.2);
	translate([-w-4-.1,-1,-.1])cube([w+4,2,h1+.2]);
	translate([-4,8,-.1])cube([18,18,h1+.2]);
	translate([-4-w/2,11,h1/2])rotate([90,0,0]){
		cylinder(r=1.5,h=21.1);
		cylinder(r=6.6/2,h=3,$fn=6);
		translate([-7,-2.85,0])cube([7,2.85*2,3]);
	}
	translate([-4.1-w,26-9,h1/2])rotate([0,90,0]) {
		cylinder(r=2.5,h=30.1);
		cylinder(r=4.25,h=5.6);
	}
}

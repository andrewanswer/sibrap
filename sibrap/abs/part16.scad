x=39;
x2=25;
y=10;
z=31;
h=2;
h2=10;
rotate([90,0,0])
difference() {
		translate([0,0,h/2])difference() {
		union() {
			translate([0,0,h2/2])cube([x,y,h+h2],true);
			translate([0,0,h2/2])cube([x2+2*h,y,h+h2],true);
		}
		translate([0,0,(h2-h)/2-.1])cube([x2,y+1,h2+.2],true);
	}
	translate([-z/2,0,-0.5])cylinder(13,r=3/2,$fn=20);
	translate([z/2,0,-0.5])cylinder(13,r=3/2,$fn=20);
	//translate([10,-y/2+1,h2+1])cube([3,3,3],true);
}
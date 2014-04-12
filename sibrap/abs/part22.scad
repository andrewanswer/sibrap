x=76;
y=55;
z=18;
x2=x+2;
y2=y+2;
z2=z+2;

r1=22.5;
r2=8;
r3=5;
r4=3;

z1=31;
h1=18;
difference() {
	cube([x,y,z],true);
	translate([0,0,-z2/2])cylinder(z2,r=r1/2,$fn=30);
	translate([0,-y/2,-z2/2])cylinder(z2,r=r2/2,$fn=30);
	for(i=[0:3])rotate([0,0,i*90])translate([z1/2,z1/2,-10])cylinder(z2,r=r4/2,$fn=30);
	for(i=[0:1])rotate([90,i*180,0])translate([x/2-8,0,-y2/2])cylinder(y2,r=r2/2,$fn=30);
	for(i=[0:1])rotate([-90,i*180,0])translate([8,0,-y2/2])cylinder(h1,r=r3/2,$fn=30);
}

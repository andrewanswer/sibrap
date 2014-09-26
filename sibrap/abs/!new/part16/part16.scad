x=39;
x2=23.5;//25;
y=12.4;//10;
z=31;
h=2;
h2=8.5;//10;
x3=3.5;
dw=12.6;
y3=2.6;
z2=h+h2;
d1=3.2;
d2=2.5;
y4=7;
d3=6.1;
z3=5;
delta=0.5;
$fn=20;

translate([0,0,z2])rotate([180,0,0])
difference() {
		translate([0,0,h/2])difference() {
		union() {
			translate([0,0,h2/2])cube([x,y,z2],true);
			translate([0,0,h2/2])cube([x2+2*h,y,z2],true);
		}
		translate([0,0,(h2-h)/2-.1])cube([x2,y+1,h2+.2],true);
	}
	translate([-z/2,0,-0.5])
{cylinder(z2-z3-0.5,r=d1/2);
translate([0,0,z2-4])cylinder(h=z3,r=d3/2);
}
	translate([z/2,0,-0.5])
{cylinder(z2-z3-0.5,r=d1/2);translate([0,0,z2+0.5-z3])cylinder(13,r=d3/2);}
translate([x/2-dw-x3,y/2-y3,0])cube([x3,y3+delta,z2+delta]);
translate([-x/2+dw,y/2-y3,0])cube([x3,y3+delta,z2+delta]);
translate([x2/2-d2/2,y/2-y3-y4,0])
{cylinder(r=d2/2,h=z2+delta);translate([0,-d2,z2/2])cube([d2,2*d2,z2+delta],true);}
translate([-x2/2+d2/2,y/2-y3-y4,0])
{cylinder(r=d2/2,h=z2+delta);translate([0,-d2,z2/2])cube([d2,2*d2,z2+delta],true);}
}
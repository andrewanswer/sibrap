x=42.5;
y=34.5;
z=23;

d1=3;
d2=22.2+.5;
d3=12;
d4=9;
d5=3.5;
//d6=15.5+.5;
d6=12.5;

x0=5.5;
y0=4;
x1=26.1;
y1=18.4;
z1=z-6.25;

y2=14.6;
z2=13;
y22=14.6;
z22=13;
y3=3;
z3=6.3;

y4=4;
y5=9;
z4=2.5;
union() {
difference() {
union(){
	cube([x,y-2,z]);
	translate([0,-2.5,0])cube([x,2.5,5]);
}
	translate([-1,-2.5,-1])cube([2,y+3,z]);
	// отверстия по углам
	translate([x0+2,y0-1-2,-1])cylinder(z+2,r=d1/2,$fn=20);
	translate([x0+2,y-y0-2,-1])cylinder(z+2,r=d1/2,$fn=20);
	translate([x-x0-0.5+2,y-y0-2,-1])cylinder(z+2,r=d1/2,$fn=20);

	// центр
	%translate([x1,y1,-1])cylinder(z+2,r=5.8/2,$fn=50);
	translate([x1,y1,-1])cylinder(z+2,r=d3/2,$fn=50);
	translate([x1,y1,z1])cylinder(7,r=d2/2,$fn=50);
	translate([x1-d3/2,y1-8,z1-7.8])cube([d3,8,9]);

	// передняя часть
	translate([-1,-1,5])cube([x+2,y4+1,z-4]);
	translate([x0,-1,5])cube([x/2-x0,8,z-4]);
	translate([x0,4,5])cylinder(z-4,r=d4/2,$fn=50);
	translate([26.1,3.2,5])cylinder(z-4,r=d2/2+0.5,$fn=50);

	// верх
	translate([-1,-1,z-z4])cube([19,y+2,z4+1]);

	translate([x1,y1,-1])cylinder(8.5,r=d2/2,$fn=50);
	translate([x1,y2,z2])rotate([0,90,0])cylinder(x-x1+1,r=d5/2,$fn=20);
	%translate([-1,y2,z2])rotate([0,90,0])cylinder(x+2,r=3/2,$fn=20);

	translate([x-6,y2-7,z2-z3/2])cube([7,y3,z3]);
	translate([x-2.7,y4-1,z2])rotate([-90,0,0])cylinder(y5,r=d1/2,$fn=20);

	// сопло
	translate([-1,y22,z22])rotate([0,90,0])cylinder(x1+1,r=d5/2,$fn=20);
	translate([-1,y22,z22])rotate([0,90,0])cylinder(16,r=d6/2,$fn=50);
	//translate([-1,y22+8.5,z-z4-3])rotate([0,90,0])cylinder(5,r=d1/2,$fn=20);
	translate([-1,y22+8.5,z-z4-3])rotate([0,90,0])cylinder(5,r=6.6/2,$fa=60);
	//translate([-1,y22,3.2])rotate([0,90,0])cylinder(5,r=d1/2,$fn=20);
	translate([-1,y22,3.2])rotate([0,90,0])cylinder(5,r=6.6/2,$fa=60);
	//translate([-1,y22-8.5,z-z4-3])rotate([0,90,0])cylinder(5,r=d1/2,$fn=20);
	translate([-1,y22-8.5,z-z4-3])rotate([0,90,0])cylinder(5,r=6.6/2,$fa=60);
	translate([-1,y22-8.5-3,z-z4-3.3+4])rotate([0,90,0])cube([7,3,3]);

}

difference() {
	union() {
		translate([x1,y1,0.5])cylinder(8.5,r=d2/2+1,$fn=50);
		translate([14,7,0.5])cube([24,5,8.5]);
	}
	translate([x1,y1,7.9])cylinder(15,r=d3/2,$fn=50);
	translate([x1,y1,-1])cylinder(8.5,r=d2/2,$fn=50);
	translate([0.5,y1-d2/4,0.5])cube([14.5,d2/2,10]);
	translate([14,2,0.5])cube([24,5,9]);
	translate([-1,y22,z22])rotate([0,90,0])cylinder(16,r=d6/2,$fn=50);
}
}

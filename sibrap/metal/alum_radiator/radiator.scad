// внутри радиатора резьба М12х1.5
$fn=40;

n=20;
h=15;
r1=6;
r12=8;
r2=15;
t=1.2;
t1=t/2;
a=4;

v=[0,1,2,3,4,6,7,8,9,10,11,13,14,15,16,17,19];

module radiator() {
difference() {

difference() {
union() {
cylinder(r=r12,h=h);
for(i=[0:n])
for(j=v)
if(i==j)
rotate([0,0,360/n*i]){
	translate([-t1,0,0])
translate([0,r2-t1,0])rotate([0,0,a])translate([0,-r2+t1,0])
cube([t,r2-t1,h]);

	translate([-t1,0,0])
translate([0,r2-t1,0])rotate([0,0,-a])translate([0,-r2+t1,0])
cube([t,r2-t1,h]);

	translate([0,r2-t1,0])cylinder(r=t1,h=h);
}
}
translate([0,0,-1])cylinder(r=r1,h=h+2);
}

translate([10,-15,-0.1])cube([15,30,15.2]);
}
}

//projection()
radiator();
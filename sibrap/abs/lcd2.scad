include <config.scad>
use <lib/halfcube.scad>

x2=145;
x3=120;
dx=(x2-x3)/2;
dx0=4;

x1=70;
y1=20;
z1=20;
h1=3;

r1=4.5;

module lcd() {
    rotate([90,0,0])
    difference() {
    union() {
        cube([x1,h1,z1]);
      translate([0,0,20])cube([5,h1,z1]);
        rotate([0,0,-30])translate([0,3,0])cube([h1,y1,z1+20]);
        translate([h1,h1,(z1-h1)/2])halfcube([x1-h1,y1-h1,h1],"z");
        translate([x1-11,0,z1-dx0-11])rotate([-90,0,0])cylinder(r=r1+3,h=h1);
    }
        rotate([0,0,-30]){translate([-3*3,0,0])cube([h1*3,y1+3,z1+20]);
        translate([-1,10,dx0+dx-13+30.6])rotate([0,90,0])cylinder(r=1.5,h=h1+2);
        translate([-1,10,z1-(dx0+dx)])rotate([0,90,0])cylinder(r=1.5,h=h1+2);}
        translate([x1-2.5-50,-1,dx0])rotate([-90,0,0])cylinder(r=1.5,h=10);
        translate([x1-2.5,-1,dx0])rotate([-90,0,0])cylinder(r=1.5,h=10);
        translate([x1-2.5-50,-1,z1-dx0])rotate([-90,0,0])cylinder(r=1.5,h=10);
        translate([x1-2.5,-1,z1-dx0])rotate([-90,0,0])cylinder(r=1.5,h=10);
        translate([x1-11,-1,z1-dx0-11])rotate([-90,0,0])cylinder(r=r1,h=10);
        translate([x1-11-r1,-1,z1-dx0-11])rotate([-90,0,0])cube([r1*2,r1,h1+2]);
        translate([x1-21-25-1,-0.1,-0.1])cube([27,2.3,20.2]);
    }
}

lcd();
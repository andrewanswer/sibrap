include <config.scad>

y1=14;
z1=2;

difference() {
    union() {
        cylinder(r=4,h=3);
        translate([-4,0,0])cube([8,y1,3]);
        translate([-4,5,0])cube([8,y1,z1]);
        translate([-4,y1,z1])rotate([0,90,0])cylinder(r=5,h=8);
    }
    translate([0,0,-DELTA])cylinder(r=1.5,h=3);
    translate([0,0,1])cylinder(r=m3_base[1]/2,h=m3_base[0],$fn=6);
    translate([-4-DELTA,y1-2,-DELTA])cube([8+DELTA*2,4,z1]);
    translate([-4-DELTA,y1,z1])rotate([0,90,0])cylinder(r=2+DELTA,h=8+DELTA*2);
    translate([-5,-5,-10])cube([10,y1+11,10]);
}


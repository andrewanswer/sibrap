include <config.scad>

module frame_part01() {
difference() {
    union() {
        cube([15,17,18]);
        translate([7.5,17,0])cylinder(r=7.5, h=18);
    }
    translate([7.5,17,-DELTA])cylinder(r=4, h=18+DELTA*2);
    translate([7,-DELTA,-DELTA])cube([1,17+DELTA,18+DELTA*2]);
    translate([-DELTA,7,9])rotate([0,90,0])cylinder(r=4, h=15+DELTA*2);
}
}

frame_part01();
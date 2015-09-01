include <config.scad>

//расстояние между отверстиями
y1=72;

module hole(){
        translate([2,2,3])cylinder(r1=4.4/2,r2=4,h=3+DELTA);
        translate([2,2,-DELTA])cylinder(r=4.4/2,h=3+2*DELTA);
}
module extra(){
    difference(){
        linear_extrude(height=6)offset(r=3)square(4);
        hole();
    }
}

module holder_part04() {
translate([5,5,0]){
    difference() {
        cube([5,y1,6]);
        translate([-2,-2,0])hole();
        translate([-2,y1-2,0])hole();
    }
    translate([-2,-2,0])extra();
    translate([-2,y1-2,0])extra();
}
translate([10,y1/2,0]){
    difference(){
        union(){
            cube([5,10,6]);
            translate([5,10,3])
            rotate([90,0,0])
            cylinder(r=6/2,h=10);
        }
        translate([5,10+DELTA,3])rotate([90,0,0])cylinder(r=3.4/2,h=10+2*DELTA);
    }
}
}

holder_part04();
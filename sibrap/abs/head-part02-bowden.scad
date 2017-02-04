/**
 * Bowden head (c) Andrew Answer 08 Oct 2015
 * I use modified original head for it
 */
include <config.scad>
use <head-part02.scad>
//use <head-part03-bowden.scad>

module motor() {
    difference() {
intersection(){
    cube([42,42,8],true);
    rotate([0,0,45])cube([38*sqrt(2),38*sqrt(2),8],true);
}
    translate([0,0,-5])cylinder(r=22.3/2,h=10,$fn=50);
    translate([-31/2,-31/2,-5])cylinder(r=3/2,h=10);
    translate([-31/2,31/2,-5])cylinder(r=3/2,h=10);
    translate([31/2,-31/2,-5])cylinder(r=3/2,h=10);
    translate([31/2,31/2,-5])cylinder(r=3/2,h=10);
}
}

//color([0,0.5,0.8])translate([-24.5,20,-4])motor();
head_part02(true);
//translate([-43-3.5,-4.5,5])rotate([90,0,180])head_part03();
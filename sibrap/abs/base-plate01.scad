// сборочный файл для печати комплектов деталей принтера SibRap
use <frame-part01.scad>
use <frame-part02.scad>
use <frame-part03.scad>
use <frame-part04.scad>
use <frame-part05.scad>
use <frame-part06.scad>

// plate
%color([0,0,0])cube([100,110,1]);

frame_part01();
translate([19,0,0])frame_part01();
translate([0,27,0])frame_part01();
translate([19,27,0])frame_part01();

translate([47,16,0]) {
    frame_part02();
    translate([19,0,0])frame_part02();
    translate([38,0,0])frame_part02();
}

translate([40,40,0]) {
    frame_part03();
    translate([13,0,0])frame_part03();
    translate([0,35,0])frame_part03();
    translate([13,35,0])frame_part03();
}

translate([66,40,0]) {
    frame_part04();
    translate([12,0,0])frame_part04();
    translate([0,35,0])frame_part04();
    translate([12,35,0])frame_part04();
}

translate([10,64,0]) {
    frame_part05();
    translate([19,0,0])frame_part05();
    translate([0,20,0])frame_part05();
    translate([19,20,0])frame_part05();
}

translate([20,115,0]) {
    //frame_part06();
}
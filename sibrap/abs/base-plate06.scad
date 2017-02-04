// сборочный файл для печати комплектов деталей принтера SibRap
use <frame-part01.scad>
use <table-part01.scad>
use <frame-part03.scad>
use <frame-part04.scad>

// plate
%color([0,0,0])cube([110,95,1]);

frame_part01();
translate([19,0,0])frame_part01();
translate([0,27,0])frame_part01();
translate([19,27,0])frame_part01();

translate([0,55,0]) {
    frame_part03();
    translate([13,0,0])frame_part03();
    translate([13*2,0,0])frame_part03();
    translate([13*3,0,0])frame_part03();
}

translate([52,55,0]) {
    frame_part04();
    translate([12,0,0])frame_part04();
    translate([12*2,0,0])frame_part04();
    translate([12*3,0,0])frame_part04();
}

translate([40,0,0]) {
    table_part01();
    translate([31,12,0])table_part01();
    translate([0,22,0])table_part01();
    translate([31,34,0])table_part01();
}

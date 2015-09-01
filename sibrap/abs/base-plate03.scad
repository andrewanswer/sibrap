// сборочный файл для печати комплектов деталей принтера SibRap
use <holder-part01.scad>
use <table-part01.scad>

// plate
%color([0,0,0])cube([120,50,1]);

translate([8,45,0])holder_part01();
translate([28,45,0])holder_part01();
translate([38,0,0]) {
    table_part01();
    translate([38,0,0]) table_part01();
    translate([0,22,0]) table_part01();
    translate([38,22,0]) table_part01();
}
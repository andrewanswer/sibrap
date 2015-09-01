// сборочный файл для печати комплектов деталей принтера SibRap
use <holder-part02.scad>
use <holder-part03.scad>
use <holder-part04.scad>
use <holder-part05.scad>

// plate
%color([0,0,0])cube([100,90,1]);

translate([15,20,0])holder_part02();
translate([42,50,0])holder_part03();
translate([69,29,0])holder_part05();
translate([80,2,0])holder_part04();

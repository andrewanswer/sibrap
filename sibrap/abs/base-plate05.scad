// сборочный файл для печати комплектов деталей принтера SibRap
// здесь только детали, зависящие от толщины рамы
use <frame-part04.scad>
use <holder-part02.scad>
use <holder-part03.scad>
use <holder-part05.scad>

// plate
%color([0,0,0])cube([100,90,1]);

translate([15,18,0])holder_part02();
translate([45,50,0])holder_part03();
translate([75,18,0])holder_part05();
translate([30,85,0]) rotate([0,0,-90]) {
    frame_part04();
    translate([12,0,0])frame_part04();
    translate([0,35,0])frame_part04();
    translate([12,35,0])frame_part04();
}

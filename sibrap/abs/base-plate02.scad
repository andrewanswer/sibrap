// сборочный файл для печати комплектов деталей принтера SibRap
use <head-part03.scad>
use <head-part05.scad>
use <head-part06.scad>
use <head-part07.scad>
use <head-part08.scad>
use <table-part02.scad>

// plate
%color([0,0,0])cube([105,70,1]);

translate([45,3,0])head_part03();
translate([56,10,11])head_part05();
translate([76,10,0])head_part08();
translate([94,13,0])head_part06();
translate([93,42,0])rotate([0,0,90])head_part07();
translate([17,42,0]){
    table_part02();
    translate([27,0,0])table_part02();
    translate([54,0,0])table_part02();
}

module shaiba() {
difference() {
	cylinder(2,r=20,$fn=40);
	translate([0,0,-0.5])cylinder(3,r=4,$fn=15);
}}

module shkiv() {
difference() {
	cylinder(8,r=18,$fn=40);
	translate([0,0,-0.5])cylinder(9,r=7.5,$fn=6);
}}

module nut_nylon() {
color([0.7,1,1])
difference() {
union() {
	cylinder(6.2,r=14.5/2,$fn=6);
	translate([0,0,6.2])cylinder(7.8-6.2,r=12.5/2,$fn=30);
}
	translate([0,0,-0.5])cylinder(9,r=4,$fn=15);
}}

%translate([0,0,-19])cylinder(50,r=4);

%translate([0,0,10])shaiba();
translate([0,0,2])shkiv();
translate([0,0,12])nut_nylon();
translate([0,0,2])nut_nylon();
mirror([0,0,1])nut_nylon();
%translate([0,0,0])shaiba();

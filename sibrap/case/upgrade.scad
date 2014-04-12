difference(){
cube([20,18,18]);
translate([-1,-1,-1])cube([4,20,20]);
translate([0,9,-1])cylinder(h=20,r=9);
translate([0,14,9])rotate([0,90,0])cylinder(h=22,r=2,$fn=10);
}
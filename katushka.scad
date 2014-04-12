
translate([0,0,-2])
difference() {
union() {
tube(17);
translate([0,0,7])for(i=[0:2])rotate([90,0,120*i])tube(50);
}
translate([0,0,-3])cube([150,150,10],true);
cylinder(17,r=4,$fn=30);
}



module tube(h) {
difference() {
	cylinder(h,r=9,$fn=30);
	translate([0,0,-0.5])cylinder(h+1,r=4,$fn=30);
}
}
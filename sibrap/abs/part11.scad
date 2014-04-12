difference() {
	cylinder(5.1,r=12.2/2,$fn=50);
	translate([0,0,-0.2])cylinder(5.5,r=9.6/2,$fn=50);
}
echo((12.2-9.6)/2);
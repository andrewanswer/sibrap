d=1;
difference() {
	cylinder(7,r=(40+d)/2,$fn=60);
	translate([0,0,-1]) {
		cylinder(9,r=(22+d)/2,$fn=30);
		translate([28.28/2,0,0])cylinder(9,r=(5+d)/2,$fn=60);
		translate([0,28.28/2,0])cylinder(9,r=(5+d)/2,$fn=60);
		translate([-28.28/2,0,0])cylinder(9,r=(5+d)/2,$fn=60);
		translate([0,-28.28/2,0])cylinder(9,r=(5+d)/2,$fn=60);
	}
}
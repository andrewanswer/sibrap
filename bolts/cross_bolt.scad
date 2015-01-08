use <MCAD/metric_fastners.scad>

// DIN 7985
// http://www.tdm-neva.ru/screws/din-7985-vint.htm

module cross_bolt(d,l) {
	d1=d*2;
	k=d/1.33;
	koef=0.2;
	c=koef*k;
	e=(1-koef)*k;
	p1=d/6;
	p2=d/2;
	p3=e;
	union() {
	cylinder(d=d,h=l,$fn=40);
	translate([0,0,-k+0.001])
	difference() {
		cylinder(d=d1,h=k,$fn=40);
		translate([0,0,e])cylinder_chamfer(d,e);
		translate([0,0,k-c])mirror([0,0,1])cylinder_chamfer(d,c);
		translate([0,0,p3/2-0.001]) {
			for(i=[0:3]) rotate([0,0,90*i]){
				translate([0,p2,0])rotate([0,0,5])translate([0,-p2/2,0])cube([p1,p2,p3],true);
				translate([0,p2,0])rotate([0,0,-5])translate([0,-p2/2,0])cube([p1,p2,p3],true);
			}
		}
	}
	}
}

//cross_bolt(3,40);

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
	cylinder(d=d,h=l,$fn=50);
	translate([0,0,-k+0.001])
	difference() {
		cylinder(d=d1,h=k,$fn=50);
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

// DIN 912
// http://www.tdm-neva.ru/screws/din-912-vint.htm

module inhex_bolt(d,l) {
    b=2*d+12;
    k=d;
    koef=0.1;
    c=koef*k;
    dk=d<=10? 1.5*d+1:1.5*d;
    s=d<=3? d-0.5:(d<=6?d-1:d-2);
    cylinder(r=d/2,h=l,$fn=50);
    translate([0,0,-k+0.001])
    difference() {
	cylinder(r=dk/2,h=k,$fn=50);
	translate([0,0,-0.001])cylinder(r=s/sqrt(3),h=k/2,$fn=6);
	translate([0,0,c])cylinder_chamfer(dk/2,c);
	//cube(s,true);
    }
}

//inhex_bolt(3,40);

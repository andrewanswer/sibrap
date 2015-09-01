delta=0.4;
d1=14.7;
d2=9.0+delta;
h=18;
//cube(12.7,true);
//cube(7.8,true);
difference() {
	cylinder($fa=60,r=d1/2,h=h);
	translate([0,0,3]) cylinder($fa=60,r=d2/2,h=h);
	cylinder($fn=12,r=2.6+delta,h=5);
}
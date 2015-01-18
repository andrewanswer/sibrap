// http://www.tdm-neva.ru/nuts/din-6923-gaika.htm
// http://www.rosmetizi.ru/gost/DIN_6923.pdf

$fn=50;

dd=[5,6,8,10,12,14,16,20];
c=[1,1.1,1.2,1.5,1.8,2.1,2.4,3];
e=[8.79,11.05,14.38,18.90,21.10,24.49,26.75,32.95];
ds=[11.8,14.2,17.9,21.8,26,29.9,34.5,42.8];

module flange_nut(idx) {
hh=ds[idx]*tan(30)/2;
echo(str("M",dd[idx],", s (wrench)=",floor(e[idx]*sqrt(3)/2*1.06)));
difference() {
union() {
cylinder(h=dd[idx],r=e[idx]/2,$fn=6);
cylinder(h=c[idx],r1=ds[idx]/2,r2=ds[idx]/2);
translate([0,0,c[idx]])cylinder(h=hh,r1=ds[idx]/2,r2=0);
}
translate([0,0,-0.1])
cylinder(h=dd[idx]+0.2,r=dd[idx]/2);

translate([0,0,dd[idx]*0.75])
difference() {
cylinder(h=hh,r=ds[idx]/2);
cylinder(h=hh,r1=ds[idx]/2,r2=0);
}
}
}

// not M8, but array index!
for(i=[0:7])
translate([i*50,0,0])flange_nut(i);

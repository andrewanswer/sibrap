//include <frame1-treug.scad>
//include <frame2-bottom.scad>
include <frame0-config.scad>
use <frame1-treug.scad>
use <frame2-bottom.scad>
use <frame3-top.scad>

// габариты деталей
x1 = 400;
y1 = 418;

x2 = 412;
y2 = 76;

x3 = 442;
y3 = 40;

// габаритные размеры листа
x0 = 1495;
y0 = 1655;
r0 = 220;

// между рамами
dy = 65;

module two_frame1() {
    //
    //translate([r0,y2+dh,0])frame3_laser();
    translate([y1,0,0])
        rotate([0,0,90])frame1_laser();
    translate([0,2*x1-dy,0])
        rotate([0,0,-90])frame1_laser();
}
module six_frame1() {
    two_frame1();
    translate([2*y1+dh,0,0])mirror([1,0,0])two_frame1();
    translate([2*y1+2*dh,0,0])two_frame1();
}
module six_frame2() {
    for(i=[0:2],j=[0:1])translate([i*(x2+dh),j*(y2+dh),0])frame2_laser();
}
module six_frame3() {
    for(i=[0:1],j=[0:3])translate([i*(x3+dh),j*(y3+dh),0])frame3_laser();
}

// info
echo(str("Габариты листа: ",x0," x ",y0));
echo(str("Габариты 1: ",x1," x ",y1));
echo(str("Габариты 2: ",x2," x ",y2));
echo(str("Габариты 3: ",x3," x ",y3));
echo(str("Толщина: ",dh));

projection(cut=true)
difference() {
// sheet
color([0,0.5,0])translate([r0-dh,r0-dh,-dh])minkowski(){
    cylinder(r=r0,h=dh/2);
    cube([x0-2*r0,y0-2*r0,dh/2]);
}

// MAIN
    six_frame1();
    translate([0,2*x1-2*dy,0])six_frame1();
    translate([x0-2*dh,r0-2.5*dh,0])rotate([0,0,90])six_frame2();
    translate([r0-2.5*dh,y0-4*(y3+dh)-dh,0])six_frame3();
}

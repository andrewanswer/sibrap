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
x0 = x3+2*dh + 810 + 418;
//y0 = (y2+dh)+y3+dh+y1*2+dh-48+2*dh;
y0 = (x1+dh)*2+y2+dh+y3+2*dh + 360 + 150;

echo(str("Габариты листа: ",x0," x ",y0));
echo(str("Габариты: ",x1," x ",y1));
echo(str("Габариты: ",x2," x ",y2));
echo(str("Габариты: ",x3," x ",y3));
echo(str("Толщина: ",dh));

color([0,0.5,0])translate([-dh,-dh,-dh])cube([x0,y0,dh]);

module frame_final() {
    frame2_laser();
    translate([0,y2+dh,0])frame3_laser();
    translate([0,x1+dh+y2+dh+y3,0])
        rotate([0,0,-90])frame1_laser();
    translate([0,(x1+dh)*2+y2+dh+y3,0])
        rotate([0,0,-90])frame1_laser();
}
//translate([200+y1+24,400,0])color([0,0,0])cube(dh);
projection() {
    for(i=[0:2]) {
        translate([(y1+dh-24+200)*i,0,0]) {
            frame_final();
            if (i<2) {
                translate([200,355,0])
                translate([472-2*dh,991-2*dh,0])rotate([0,0,180])frame_final();
            }
        }
    }
}

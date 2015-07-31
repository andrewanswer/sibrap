//include <frame1-treug.scad>
//include <frame2-bottom.scad>
include <frame0-config.scad>
use <frame1-treug.scad>
use <frame2-bottom.scad>
use <frame3-top.scad>

// габаритные размеры листа
y0 = 396;
x0 = 688;

//color([0,0.5,0])translate([-dh,-dh,-dh])cube([x0,y0,dh]);

module frame2_laser_cut() {
    translate([275,345,0]) rotate([0,0,-60])
    difference() {
        frame2_laser();
        xx1=22.5;
        yy1=22.5;
        halfcube([xx1,yy1,dh],"z");
        translate([0,76,0])rotate([0,0,-90])halfcube([xx1,yy1,dh],"z");
        translate([412,0,0])rotate([0,0,90])halfcube([xx1,yy1,dh],"z");
        translate([412,76,0])rotate([0,0,180])halfcube([xx1,yy1,dh],"z");
    }
}

module frame3_laser_cut() {
    translate([270,352,0]) rotate([0,0,-55])
    difference() {
        frame3_laser();
        xx1=22.5;
        yy1=22.5;
        translate([0,40,0])rotate([0,0,-90])halfcube([xx1,yy1,dh],"z");
        translate([442,0,0])rotate([0,0,90])halfcube([xx1,yy1,dh],"z");
    }
}

projection() {
    translate([70,70,0])
    intersection() {
        frame1_main();
        cube([100,48,dh]);
    }

    translate([140,70,0])
    intersection() {
        frame1_main();
        cube([100,48,dh]);
    }

    translate([0,-48,0])
    difference() {
        frame1_main();
        cube([400,48,dh]);
    }

    //frame2_laser_cut();
    //translate([110,0,0])frame2_laser_cut();

    frame3_laser_cut();
    translate([75,0,0])frame3_laser_cut();
}

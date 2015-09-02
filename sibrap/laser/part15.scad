$fn=30;
DELTA=0.1;
module part15() {
difference() {
union() {
    cube([50,37,8],true);
    cube([40,73,8],true);
    translate([25+22,0,0])cube([44,44,8],true);
}
    translate([-10,-33.25-DELTA/2,0])cube([6,6.5+DELTA,8+DELTA],true);
    translate([10,-33.25-DELTA/2,0])cube([6,6.5+DELTA,8+DELTA],true);
    translate([-10,33.25+DELTA/2,0])cube([6,6.5+DELTA,8+DELTA],true);
    translate([10,33.25+DELTA/2,0])cube([6,6.5+DELTA,8+DELTA],true);
    translate([0,0,-4-DELTA]){
        cylinder(r=4,h=8+DELTA*2);
        translate([0,73/2-15,0])cylinder(r=1.5,h=8+DELTA*2);
        translate([0,-(73/2-15),0])cylinder(r=1.5,h=8+DELTA*2);
        translate([25+22,0,0]){
            cylinder(r=11,h=8+DELTA*2);
            translate([-31/2,-31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([-31/2,31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([31/2,-31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([31/2,31/2,0])cylinder(r=1.5,h=8+DELTA*2);
        }
    }
}
}
projection() part15();
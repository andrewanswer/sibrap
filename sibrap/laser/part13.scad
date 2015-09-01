use <../abs/lib/halfcube.scad>

$fn=30;
DELTA=0.1;
translate([10,8.36,0])
difference() {
    translate([-10,-8.36,0]) {
union() {
    translate([0,0,-4])cube([77.53,53.36,8]);
    translate([69,27,0])rotate([0,0,60])cube([31+6.02*2,31+5.56*2,8],true);
    //translate([25+22,0,0])cube([44,44,8],true);
}
}
    translate([0,0,-4-DELTA]){
        translate([-10,-8.36,0]) {
            translate([0,39.94,0])mirror([0,1,0])halfcube([18.97,39.94-13.36,8+DELTA*2],"z");
            translate([18.97,53.36,0])mirror([0,1,0])halfcube([41,53.36-39.94,8+DELTA*2],"z");
            translate([0,39.94,0])cube([18.97,53.36-39.94,8+DELTA*2]);
            translate([0,53.36,0])cube([77.53,53.36,8+DELTA*2]);
            translate([0,-53.36,0])cube([77.53+DELTA*2,53.36,8+DELTA*2]);
        }
        cylinder(r=4,h=8+DELTA*2);
        translate([16,25,0])cylinder(r=4,h=8+DELTA*2);
        translate([59,27-8.36,4+DELTA])rotate([0,0,60])translate([31+6.02*2,0,0])cube([31+6.02*2,31+5.56*2,8+DELTA*2],true);
        translate([59,27-8,0])rotate([0,0,60]){
            cylinder(r=11,h=8+DELTA*2);
            translate([-31/2,-31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([-31/2,31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([31/2,-31/2,0])cylinder(r=1.5,h=8+DELTA*2);
            translate([31/2,31/2,0])cylinder(r=1.5,h=8+DELTA*2);
        }
    }
}

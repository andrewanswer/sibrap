//
// Fast Release Lever for AJGW Extruder
// (c) 2012 by Alain Mouette - GPL
//
// Derived from: Quick Release Lever for wade
//   by simon litwan, http://www.thingiverse.com/thing:22830
// Licence: Creative Commons: CC BY 3.0 (almost GPL...)


lever();
translate([18,-20,0])rotate([0,90,90]) bar();

layer_thickness=0.25;
$fn=36;
width=8;
extra_width=0.0;// extra on each side in idler fit
inclination=7;//6;
hole=9.55+0.3;
corner=[10,2.9,0];

bar_diameter=9.5+0.3;
bar_radiusr=bar_diameter/2;
bar_length=26;
bar_spring=7+0.2;

module lever(){
	difference(){
		union(){
			translate([2,0,0]) cylinder(r=17/2,h=width);// head
			rotate([0,0,-90]) cube([8.5,10,width]);// body right
			translate([-1,0,0]) rotate([0,0,-90]) cube([28,10,width]);// body right
			translate([-1,-16.6,0]) rotate([0,0,20]) cube([4,15,width]);// body left
			translate([-1,-14,0]) rotate([0,0,-101.6]) cube([17,5,width]);// body left
//			translate([-3.4,-29.8-1,0]) cylinder(r=1,h=width);
		}
		translate([-0.3,0,-0.1]) cylinder(r=hole/2, h=width+0.2);// center hole
		translate([10,2.9,-0.1]) rotate([0,0,-90-inclination]) cube([13,2,width+0.2]);// fit into idler
		translate([18.5,-14,-0.1]) cylinder(r=24/2, h=width+0.2);// bearing space
		translate([6.75,-36,-0.1]) cylinder(r=21/2, h=width+0.2);// finger space
		// 45° sides
		translate(corner+[-1,0,0]) rotate([0,0,-92]) translate([-3,0,0]){
			//cube([16,1,width]);// for viewing only
			translate([-0.1,0,-extra_width-0.1]) rotate([-45,0,0]) cube([16,2,2]);
			translate([-0.1,0,width+extra_width+0.1]) rotate([-45,0,0]) cube([16,2,2]);
		}
  	}
#	translate([-3,-30.6,0]) cylinder(r=1.4, h=width, $fn=12);
}

module bar(){
	difference(){
		translate([-bar_radiusr+2,0,0])cylinder(h=bar_length,r=bar_radiusr);
		translate([0,-bar_radiusr,0])cube([bar_diameter,bar_diameter,bar_length]);
		translate([0,0,5])rotate([0,90,180])m4Screw();
		translate([0,0,bar_length-5])rotate([0,90,180])m4Screw();
	}
}

module m4Screw(h=15) {
	union() {
		translate([0,0,3+layer_thickness])cylinder(h=h+3.3,r=4.3/2);
		translate([0,0,-0.1])cylinder(h=3,r=bar_spring/2,$fn=18);// round for spring
	}
}


// references
//%translate(corner+[-1,0,0]) rotate([0,0,-90]) cube([11.5,1,width]);// idler fit


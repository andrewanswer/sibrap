// Wade's Extruder Gears using Parametric Involute Bevel and Spur Gears by GregFrost
// by Nicholas C. Lewis (A RepRap Breeding Program)
//
// It is licensed under the Creative Commons - GNU GPL license.
// © 2010 by Nicholas C. Lewis
// © 2010 by Wolfgang
// © 2012 by Alain Mouette
// Fom  http://www.thingiverse.com/thing:5268
// original and iIncludes from  http://www.thingiverse.com/thing:4305
//
// Edited by Alain Mouette november 2012
// * tighter fit of tractor screw (modifications in mendel_misc.inc)
// * reduced width and smoothed the edges
// * same external surfaces on both gears to simplify adjustment
// I used subtract instead of altering the parameters to mantain compatibility


use <mendel_misc.inc>
use <parametric_involute_gear_v5.0.scad>
 WadeL_double_helix();

 //WadesS_double_helix();


module WadeL_double_helix(){
	//Large WADE's Gear - Double Helix

	circles=5;
	teeth=43;
	pitch=268;
	twist=200;
	height=11;
	pressure_angle=30;
	logo=14;

//translate([-40,0,-4.5])cube([10,3,4.5]);

	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =0,// height/2*0.5,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2*1.5-2,
			hub_diameter = 25,
			bore_diameter = 8,
			circles=circles,
			twist = twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness = height/2,
			rim_thickness = height/2,
			rim_width = 5,
			hub_thickness = height/2,
			hub_diameter=25,
			bore_diameter=8,
			//circles=circles,
			twist=twist/teeth);
		}
		// Головка болта
		//translate([0,0,-1])rotate([180,0,0])m8_hole_vert_with_hex(14.3,100);
		translate([0,0,-1])rotate([180,0,0])m8_hole_vert_with_hex(13.45,100);
		
		translate([0,0,3.5]) difference(){ // reduce width and  smooth
		cylinder(r=73.4/2, h=2.5);
			translate([0,0,1]) cylinder(r=20,h=2.6);
			cylinder(r1=67.4/2,r2=(67.5-3)/2,h=1);
		}
		mirror([0,0,1])translate([0,0,3.5]) difference(){
			cylinder(r=73.4/2, h=3);
			cylinder(r1=67.4/2,r2=(67.5-3)/2,h=1);
		}
		translate([0,0,4.3]) difference(){ // reduce width and smooth
			cylinder(r=25.1/2, h=2);
			cylinder(r1=25.1/2,r2=20.1/2,h=4);
		}
		// Капли - дырки
		for (n=[0:4]){
		rotate([0,0,n*360/5]) translate([18.3,0,-10])
			union(){
				cylinder(r=logo/2.5,h=20,$fn=24);
				rotate([0,0,45]) cube([logo/2.5,logo/2.5,20]);
			}
		}
	}
}

module WadesS_double_helix(){
	//small WADE's Gear
	//rotate([180,0,-23.5])translate([-10,-10,-18])color([ 100/255, 255/255, 200/255])import_stl("wades_gear.stl");

	circles=0;
	teeth=9;
	pitch=268;
	twist=200;
	height=25;
	pressure_angle=30;

//translate([10,0,0])cube([3,3,15]);
//translate([-13,0,0])cube([3,3,6.3]);
//translate([-12,0,-6.3])cube([3,3,6.3]);
//translate([-12,0,-4.5])cube([10,3,4.5]);

rotate([180,0,0])	difference(){
		union(){
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =  height/4,
			rim_thickness = height/4,
			rim_width = 4,
			hub_thickness = height/2*1.2-1.5,
			hub_diameter = 17,
//			hub_diameter = 17,
			bore_diameter = 0,
//			bore_diameter = 5.2,
			circles=circles,
			twist = twist/teeth);
		mirror([0,0,1])
		gear (number_of_teeth=teeth,
			circular_pitch=pitch,
			pressure_angle=pressure_angle,
			clearance = 0.2,
			gear_thickness =  height/4*1.2,
			rim_thickness =  height/4,
			rim_width = 5,
			hub_thickness = height/4,
			hub_diameter=20,
			bore_diameter=0,
//			bore_diameter=5.2,
			circles=circles,
			twist=twist/teeth);

		}
// Дырки под болт
		//translate([0,-5,10.7])cube([5.5,2.3,9],center = true);
		//translate([0,0,9.7])rotate([0,90,-90])cylinder(r=1.7,h=20,$fn=12);
		//translate([0,-10,10])cube([10,2,11],center = true);// chanfer3
translate([0,0,11])		cylinder(r=45, h=10);
		mirror([0,0,1]) translate([0,0,5]) cylinder(r=16.5/2, h=2); // shorter
		mirror([0,0,1]) translate([0,0,3.5]) difference(){
		cylinder(r=16.5/2, h=2);
			cylinder(r1=16.5/2,r2=(16.5-3)/2,h=1);
		}
	}
}


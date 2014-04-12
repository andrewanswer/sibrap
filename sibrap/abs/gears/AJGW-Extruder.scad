// Better Geared Extruder: AJGW - Alain/Jonas/Greg/Wade
// by Alain Mouette, nov-2012
// http://www.thingiverse.com/thing:
//
// Derived from: Greg's Wade reloaded
//   by Jonas Kühling, http://www.thingiverse.com/thing:18379
// Derived from: Accessible Wade's Extruder
//   by Greg Frost, http://www.thingiverse.com/thing:6713
// Based on prusa git repo, https://github.com/josefprusa/PrusaMendel
// Derived from: Wade's Geared Extruder - RepRap
//   by Wade, http://reprap.org/wiki/Wade's_Geared_Extruder
// Derived from (gears): Wade goes Fishing
//   by Stoffel15, http://www.thingiverse.com/thing:5268
// Derived from: Quick Release Lever for wade
//   by simon litwan, http://www.thingiverse.com/thing:22830
//
// Licensed under the GNU GPL license.
//  2010 by GregFrost, 2012/13 by AlainMouette
// Extruder based on prusa git repo.
// http://www.thingiverse.com/thing:6713
//

$fs=0.1;
include<configuration.scad>
include<jonaskuehling-default.scad>

// =======================================================
// ====             User configurations               ====
// =======================================================

show_support=true;				// Show Support structures (needed fo printing)
layer_thickness=0.25;			// other then 0.25 or 0.40 need more testings
layer_width=0.5;				// 0.5 for 0.25 thick, 0.6 for 0.4 thick (used only in idler support)
//hex_base_nuts=true;			// remove hex nuts on base if top mounting screw
//idler_screw_532=true;			// for using 5/32 x 2 1/2" screw for the idler (Brazil)

filament_diameter=3;				// 3 or 1.75 mm, filament diameter
filament_feed_hole_extra_offset=0;	// increase if tractor with deep grove, -0.5 to 1.0

// Select hot end type at the RENDER section

// =======================================================
// ====          Recomended Slic3r settings           ====
// =======================================================
// from Slic3r 0.9.7 up there are no (big) fill problems
// But this has generaly been optimized for these parameters
// Print Idler first to see if all goes well
// Allways use RepetierHost to check if Gcode is ok !!!
//
// File extensions:
//  *.stl			no optimization for layer height/width
//  *.25.stl		for printing with 0.25 layer height
//  *.40.stl		for printing with 0.40 layer height
//  *.2550.stl		.25 layer height, but width must be 0.50 (see bellow)
//  *.4060.stl		.40 layer height, but width must be 0.60 (see bellow)
//  *.scad			files is not dependant on layes height
//  gears			shouls allways be high resolution, 0.25 height
//  NOTE: all parts have their own built-in support (except one idler file)
//
//	Print settings > Layers and perimeters
//		Perimiter (minimum)		= 2
//		Generate extra perimiters= NO
//	Print settings > Skirt and brim
//		Don't use BRIM for big-gear and washers!!!
//		Brim essencial for Idler, recomended for the rest
// ==>> For 0.25mm layers:
//	Print settings > Layers and perimeters
//		Layer height					= 0.25 mm
//		Horizontal shells, Solid layers	= 4 (aprox 1mm)
//	Print settings > Advanced > Extrusion width
//		Default extrusion width		= 0.50 mm
//		First layer						= 0.48 mm
//		Perimiters						= 0.48 mm
//		Infill							= 0.48 mm
// ==>> For 0.40mm layers:
//	Print settings > Layers and perimeters
//		Layer height					= 0.40 mm
//		Horizontal shells, Solid layers	= 3 
//	Print settings > Advanced > Extrusion width
//		Default extrusion width		= 0.60 mm
//		First layer						= 0.58 mm
//		Perimiters						= 0.58 mm
//		Infill							= 0.58 mm
// There is some rounding problems and 0.48 or 0.58 allows for better thin walls
//
// ===============================================

// Define the hotend_mounting style you want by specifying hotend_mount=style1+style2 etc.
malcolm_hotend_mount=1;
groovemount=2;
peek_reprapsource_mount=4;
arcol_mount=8;
mendel_parts_v6_mount=16;
grrf_peek_mount=32;
wildseyed_mount=64;
geared_extruder_nozzle=128; // http://reprap.org/wiki/Geared_extruder_nozzle
jhead_mount=256;
reprapfaborg_mount=512;   // http://reprap-fab.org hotend with 10mm PEEK insulator
head_conical_screw=1024;  // for conical M3 screw (or wood screw 2.8x25mm (BR)
standard_mount=256;       // This is the standard 16mm Adrian Extruder mount  

//Set the hotend_mount to the sum of the hotends that you want the extruder to support:
//e.g. wade(hotend_mount=groovemount+peek_reprapsource_mount);


////////// RENDER EXTRUDER //////////////////////////////////////////////////////////////
//wade(hotend_mount=groovemount, legacy_mount=false);
//wade(hotend_mount=reprapfaborg_mount, legacy_mount=false);
wade(hotend_mount=standard_mount+head_conical_screw, legacy_mount=false);
//wade(hotend_mount=arcol_mount, legacy_mount=false);
//wade(hotend_mount=grrf_peek_mount, legacy_mount=false);

//intersection(){ // prints specifics parts  for fasters tests
// wade(hotend_mount=standard_mount+head_conical_screw, legacy_mount=false);
// translate([-15,44.5,0]) cube([40,100,12]); // lower support
// translate([-15,44.5,0]) cube([40,100,50]); // both supports
// translate([-5,0,0]) cube([23,13,50]); // hotend fit
//}


////////// RENDER IDLER /////////////////////////////////////////////////////////////////////

//translate([0,-15,27])									// POSITIONING SIDE-WISE
//  rotate([0,180,0])
//	wadeidler();

//translate([50,3,0])							// position for simultaneous printing
//	idler_with_support();						// Lateral printing

//	idler_vert_support();						// Vertical printing

//	translate([idler_fulcrum[0],idler_fulcrum[1],0])	// translate for position rotation
//	rotate([0,0,96])									// -5: inwards, 97: open
//	translate([-idler_fulcrum[0],-idler_fulcrum[1],0])
//	wadeidler();										// only this for normaloperating position

/**
 * Extruder
 * @name Extruder
 * @assembled
 * @using 1 small-gear
 * @id extruder
 * @using 1 idler
 * @using 1 extruder-body
 * @using 1 m3nut
 * @using 1 m3washer
 * @using 1 m3x25
 * @step Take idler and insert nut into small nut-trap inside the hinge.
 * @step While holding the nut in place, preprare M3x25 bolt with washer and screw it into the hinge just enough to hold the nut.
 * @step Now take the extruder body and idler. Place idler on the hinge counterpart and compleately screw the M3x25 bolt. This will create secured hinge.
 *
 * @using 2 m4nut
 * @step Place M4 nuts into their nut traps, secure them with piece of tape. We need them in place, since later they would be harder to access.
 *
 * @using 3 m3x10
 * @using 3 m3washer
 * @using 1 NEMA17
 * @step Prepare your NEMA17 stepper motor and three M3x10 screws with washers.
 * @step Hold motor on place and lightly tighten the screws. We need to adjust motor position later, no need to tighten it hard.
 *
 * @using 1 large-gear
 * @using 1 m8washer
 * @using 2 m8nut
 * @using 2 bearing-608
 * @step Place two skate bearings on ther position, they should snuggly fit in.
 * @step Insert prepared large gear into the body with mounted bearings.
 * @step Check if the alignment of hobbed part with the filament path. Adjust it accordingly with adding or removing M8 washers.
 * @step After adjusting, we need to fix the bolt in. So we place washer at the end of hobbed bolt and with two M8 nuts we will do locknut by tightening them against each other.
 * @step Check if large gear turns freely.
 *
 * @using 2 m3x40
 * @using 4 m3washer
 * @using 2 extruder-spring
 * @step Prepare two M3x40 screws with sandwitch of washer-spring-washer.
 * @step Insert two M3 nuts into nut traps on top of drive mechanism. [[extruder/top-nut-traps.png]]
 * @step Insert prepared screws into the holes on idler. Close the idler and tighten the screws into the trapped nuts. More you tighten those screws, more pressure will be on fillament.
 * @step Your extruder is done. [[extruder/assembled.jpg]]
 */

/**
 * Extruder body
 * @name Extruder body
 * @category Printed
 * @id extruder-body
 */

/**
 * Extruder idler
 * @name Extruder Idler
 * @id idler
 * @category Printed
 * @using 1 bearing-608
 * @using 1 idler-m8-piece
 * @step Insert piece of M8 rod into bearing.
 * @step Insert 608 bearing with rod into printed idler part.
 */

/**
 * Small M8 rod
 * @name Idler
 * @id idler-m8-piece
 * @category Rods and Bars
 */

/**
 * Spring used for idler on extruder.
 * @name Extruder spring
 * @id extruder-spring
 */

//===================================================
// Parameters defining the wade body:
//Set motor- and bolt-elevation for additional clearance when using e.g. 9/47 gears like in http://www.thingiverse.com/thing:11152
elevation=4;
//Set extra gear separation when using slightly bigger non-standard gears like 9/47 herringbone gears
extra_gear_separation=2;

wade_block_height=55+elevation;
wade_block_width=24;
wade_block_depth=28;
block_bevel_r=7;

// Nut wrench sizes ISO 4032
m3_wrench = 5.5;
m4_wrench = 7;

// Adjust for deeper groove in hobbed bolt, so that idler is still vertical when tightened
// Values like 0.5 to 1 should work, the more, the closer the idler will move to the bolt
// Sometimes the idler will be slightly angled towards the bolt which causes the idler screws
// to slip off the slots in die idler to the top.. Adjusting this should help:
less_idler_bolt_dist = 0;

base_thickness=7;
base_length=70;
base_leadout=25;

nema17_hole_spacing=1.23*25.4;
nema17_width=1.7*25.4;
nema17_support_d=11.6;//nema17_width-nema17_hole_spacing-1.0; // adjust thin-wall

// M3 allen screw head with washer needs 3mm recess
// increased slightly recess diameter from 7.2 to 7.5 (whasher is 7.0)
// M3x10mm screw into the motor should be 3mm, calculated as:
//   10mm - motor_mount_thickness + screw_head_recess_depth - washer_thickness
//   =10 - 9.5 + 3 - 0.5 = 3mm
screw_head_recess_diameter=7.5;
screw_head_recess_depth=3;
motor_mount_thickness=9.5; //8; [am] mottor better aligned for gear position
motor_mount_rotation=20;   //25 [am] allow clearing for top mount hex key
motor_mount_translation=[50.5+extra_gear_separation,34+elevation,0];
motor_slot_left=1;
motor_slot_right=2+2.5;    // [am] heringbone need extra spce to be removed
motor_center_hole=26;      // [am] clear hole in motor center for small gear

// calculate feed hole: 3=>3.5 or 1.75=>2
filament_feed_hole_d=filament_diameter*1.2-0.1;

m8_clearance_hole=8.8;
hole_for_608=22.6;
608_diameter=22;
608_center_clearance=1;

block_top_right=[wade_block_width,wade_block_height];

filament_feed_hole_offset=filament_diameter+1.5-filament_feed_hole_extra_offset;
idler_nut_trap_depth=7.3;
idler_nut_thickness=(idler_screw_532 ? 3.3 : 3.7);
idler_nut_wrench=(idler_screw_532 ? 6.3 : 7);// optional convenient screw for Brazil

gear_separation=7.4444+32.0111+0.25+extra_gear_separation;

function motor_hole(hole)=[motor_mount_translation[0],motor_mount_translation[1]] +
	rotated(45+motor_mount_rotation+hole*90)*nema17_hole_spacing/sqrt(2);

// Parameters defining the idler.

filament_pinch=[
	motor_mount_translation[0]-gear_separation-filament_feed_hole_offset-filament_diameter/2,
	motor_mount_translation[1],
	wade_block_depth/2];
idler_axis=filament_pinch-[608_diameter/2,0,0];
idler_fulcrum_offset=608_diameter/2+3.5+m3_diameter/2+0.7;
idler_fulcrum=idler_axis-[0+less_idler_bolt_dist,idler_fulcrum_offset,0];
idler_corners_radius=2.5; // was 4
idler_height=12;
idler_608_diameter=608_diameter+2;
idler_608_height=9;
idler_mounting_hole_across=8;
idler_mounting_hole_up=15;
idler_short_side=wade_block_depth-2;
idler_hinge_re=m3_diameter/2+3.5;   // radius extruder side
idler_hinge_rh=m3_diameter/2+3.7;   // radious idler side
idler_hinge_width=6.5;
idler_end_length=(idler_height-2)+5;
idler_mounting_hole_diameter=m4_diameter+0.25;// 5/32" and M4 are almost the same diameter
idler_mounting_hole_elongation=0.9;
idler_long_top=idler_mounting_hole_up+idler_mounting_hole_diameter/2+idler_mounting_hole_elongation+2.5;
idler_long_bottom=idler_fulcrum_offset;
idler_long_side=idler_long_top+idler_long_bottom;


module wade (hotend_mount=0,legacy_mount=false){
  idler_support_height=wade_block_depth/2-idler_short_side/2+idler_hinge_width+0.25+layer_thickness;
  support_wall=3;// used only for idler hindge support
  difference(){
   union(){
	difference (){
		union(){
			// The wade block.
			cube([wade_block_width,wade_block_height,wade_block_depth]);

			// Filler between wade block and motor mount.
			translate([wade_block_width-1,motor_mount_translation[1]-hole_for_608/2-5.2,0])
            rotate([0,0,-0.5])
			cube([wade_block_width/2+extra_gear_separation,
				wade_block_height-motor_mount_translation[1]+hole_for_608/2+5.2,
				motor_mount_thickness]);

			// Connect block to top of motor mount.
			linear_extrude(height=motor_mount_thickness)
			barbell(block_top_right-[0,5],motor_hole(0)-[motor_slot_left,0],5,nema17_support_d/2,100,60);

			//Connect motor mount to base.
			linear_extrude(height=motor_mount_thickness){
			barbell([base_length-base_leadout,
				base_thickness/2],motor_hole(2)-[motor_slot_left,0],base_thickness/2,
				nema17_support_d/2,100,60);
			barbell([base_length-base_leadout,
				base_thickness/2],motor_hole(2)+[motor_slot_right,0],base_thickness/2,
				nema17_support_d/2,100,60);
            }

			// Round the ends of the base
			translate([base_length-base_leadout,base_thickness/2,0])
			cylinder(r=base_thickness/2,h=wade_block_depth,$fn=20);

			translate([-base_leadout,base_thickness/2,0])
			cylinder(r=base_thickness/2,h=wade_block_depth,$fn=20);

			//Provide the bevel betweeen the base and the wade block.
			union()
			difference(){
				translate([-block_bevel_r,0,0])
				cube([block_bevel_r*2+wade_block_width,
					base_thickness+block_bevel_r,wade_block_depth]);
				translate([-block_bevel_r,block_bevel_r+base_thickness,-0.1])
				cylinder(r=block_bevel_r,h=wade_block_depth+0.2,$fn=60);
				translate([wade_block_width+block_bevel_r,
					block_bevel_r+base_thickness,-0.1])
				cylinder(r=block_bevel_r,h=wade_block_depth+0.2,$fn=60);
			}

			// The idler hinge.
			translate(idler_fulcrum){
				rotate(5) translate([idler_hinge_re,0,0])
				cube([idler_hinge_re*2,idler_hinge_re*2,idler_short_side-2*idler_hinge_width-0.5],
					center=true);
				rotate(-30){
					cylinder(r=idler_hinge_re,
						h=idler_short_side-2*idler_hinge_width-0.5,
						center=true,$fn=60);
					translate([idler_hinge_re+2,0,0])
					cube([idler_hinge_re*2+4,idler_hinge_re*2,
						idler_short_side-2*idler_hinge_width-0.5],
						center=true);
				}
			}

			// The idler hinge support. Wider for a better bridge [am]
			if (show_support){
				translate(idler_fulcrum){
                    intersection(){
                      union(){
						rotate(5) translate([0,idler_hinge_re+1,-wade_block_depth/2])
						  cube([idler_hinge_re*2,support_wall,idler_short_side-2*idler_hinge_width-0.5]);
						rotate(-30) translate([0,-idler_hinge_re-support_wall-1,-wade_block_depth/2])
						  cube([idler_hinge_re*2-2,support_wall,
						idler_short_side-2*idler_hinge_width-0.5]);
                        translate([0,0,-wade_block_depth/2])
                          intersection(){
                            difference(){
                             cylinder(r=idler_hinge_re+1+support_wall,h=10,$fn=50);
						     cylinder(r=idler_hinge_re+1,h=10,$fn=50);
                            }
                            union(){
                             rotate([0,0,90]) cube([20,20,20]);
                             rotate([0,0,150]) cube([20,20,20]);
                            }
                         } 
                      }   
                      translate([-idler_fulcrum[0]-21,-idler_hinge_re-10,-wade_block_depth/2])
                        cube([20,30,idler_support_height+1]);
                    }
					rotate(-15)
					translate([-(idler_hinge_re+3)+7,-idler_hinge_re-4,
						-idler_short_side/2+idler_hinge_width+0.25]){
    					cube([idler_hinge_re+5,
	    					idler_hinge_re*2+8,
		    				layer_thickness]);
                    	translate([-5,3,0])
                        	cube([idler_hinge_re+3,idler_hinge_re*2+2,
							layer_thickness]);
                    }
				}
			}

			//The base.
			translate([-base_leadout,0,0])
			cube([base_length,base_thickness,wade_block_depth]);

			motor_mount ();
			
			// extra 1.5mm reinforcement on top
			translate([13.0,wade_block_height,0]) cube([11,1.5,wade_block_depth]);
			translate([13+11,wade_block_height+1.5,0]) rotate([0,0,-100]) cube([2.5,9,9.5]);
			// left ramp the first part is here to get proper screw hole
			translate([13.0,wade_block_height+1.5,0]) rotate([0,0,-158]) cube([4.5,3,11]);
//			translate([13.0,wade_block_height+1.5,0]) rotate([0,0,-158]) cube([4.5,3,wade_block_depth]);

		} // of second union

		block_holes(legacy_mount=legacy_mount);
		motor_mount_holes ();

		translate([motor_mount_translation[0]-gear_separation-filament_feed_hole_offset,
			0,wade_block_depth/2])
		rotate([-90,0,0]){
			if (in_mask (hotend_mount,malcolm_hotend_mount))
				malcolm_hotend_holes ();
			if (in_mask (hotend_mount,groovemount))
				groovemount_holes ();
			if (in_mask (hotend_mount,peek_reprapsource_mount))
				peek_reprapsource_holes ();
			if (in_mask (hotend_mount,arcol_mount))
				arcol_mount_holes ();
			if (in_mask (hotend_mount,mendel_parts_v6_mount))
				mendel_parts_v6_holes(insulator_d=12.7);
			if (in_mask(hotend_mount,grrf_peek_mount))
				grrf_peek_mount_holes();
			if (in_mask(hotend_mount,wildseyed_mount))
				wildseyed_mount_holes(insulator_d=12.7);
			if (in_mask(hotend_mount,geared_extruder_nozzle))
				mendel_parts_v6_holes(insulator_d=15);
			if (in_mask(hotend_mount,jhead_mount))
				wildseyed_mount_holes(insulator_d=16);
			if (in_mask(hotend_mount,head_conical_screw))
				jh_conical_screw();
			if (in_mask(hotend_mount,reprapfaborg_mount))
				peek_reprapfaborg_holes();
		}
	} // of second difference
	// Back Reinforcement
	translate(motor_mount_translation)
	 translate([-gear_separation,0,wade_block_depth-10])
	 difference(){
	  union(){
		cylinder(r=32/2,h=10,$fn=60);
		mirror([0,0,1])
		cylinder(r1=32/2,r2=27/2,h=3,$fn=60);
	  }
	  translate([-16.9,-18,-4]) cube([30,36,20]);
	 }

    // Filament guide, fixed half
    translate([0,wade_block_height-8.3,8]){
        difference(){
            translate([0,-3,0]) cube([13,11.3,wade_block_depth/2-8-2]);
            translate([-0.2,-3,0]) rotate([45,0,0]) cube([13.4,11.3,wade_block_depth/2-8-2]);
        }
		translate([5-filament_feed_hole_offset,0,0]){
			translate([8.5,+1,0]) cube([filament_feed_hole_offset+1.5,7.3,7.5]);
			difference(){
				translate([6.6,+1,wade_block_depth/2-8-2-0.1])
					cube([2,7.3,2]);
				translate([6.6,1-0.1,wade_block_depth/2-8-0.1])
					rotate([-90,0,0]) cylinder(r=2,h=7.3+0.2,$fn=24);
			}
		}
    }
 } // of first union

	//Round off the top back of the block.
	translate([0,wade_block_height-block_bevel_r,-1])
	difference(){
		translate([-1,0,0])
		cube([block_bevel_r+1,block_bevel_r+1,wade_block_depth/2]);
		translate([block_bevel_r,0,0])
		cylinder(r=block_bevel_r,h=wade_block_depth/2,$fn=40);
	}
	//Round off the top front of the block.[am]
	translate([0,wade_block_height-block_bevel_r*2+0.2,wade_block_width/2+4])
	difference(){
		translate([-1,2,0.1])
		 cube([block_bevel_r*2,block_bevel_r*2-0.5,wade_block_depth+1]);
		translate([block_bevel_r*2-2,2,0])
		 cylinder(r=block_bevel_r*2-2,h=wade_block_depth+1,$fn=40);
	}
  } // of first difference

	// topt reiforcement, extra front details, theese are here to avoid he holes
	translate([13.0,wade_block_height+1.5,9]) rotate([0,0,-158+filament_feed_hole_extra_offset*9])
      cube([4.2-filament_feed_hole_extra_offset*0.7,2.5,6.5]);
	translate([13.0,wade_block_height+1.5,24.1]) rotate([0,0,-158]) cube([5,2.5,3.9]);

	if (show_support){
      // Front Reinforcement support [am]
      difference(){
	    union(){
		  translate([-1-4*layer_width,29,0]) cube([4*layer_width,31.5,wade_block_depth+layer_thickness-3.9+1]);
		  translate([-1-4*layer_width,26.5,wade_block_depth-3.9-2]) cube([4*layer_width,3,layer_thickness+2+1]);
		  translate([-1-4*layer_width,26.5,wade_block_depth-3.9-2]) rotate([-45,0,0])
            cube([4*layer_width,4*layer_width+1.4,2]);
	    }
        translate([-1.1-4*layer_width,29,0]) cube([4*layer_width+0.2,2.5,10]);
        translate([-1.1-4*layer_width,29+2.5,10]) rotate([135,0,0]) cube([4*layer_width+0.2,4,10]);
        translate([-1.1-4*layer_width,31.5,16]) rotate([-45,0,0]) cube([3.2,8,8]);
        translate([-1.1-4*layer_width,45.5,16]) rotate([-45,0,0]) cube([3.2,8,8]);
      }
      // support inside idler_nut_trap (it is too hard to remove, I tied a new aproach)
      for(sup=[0:1])
        translate([wade_block_width-idler_nut_trap_depth,
            wade_block_height-idler_nut_trap_depth+1.8,
            wade_block_depth/2+(sup?idler_mounting_hole_across-(m4_wrench+0.4)/2
                                   :-idler_mounting_hole_across-(m4_wrench+0.4)/2)]){
            translate([1.7,-2,0]) cube([0.52,idler_nut_trap_depth+1.7,6]);
			//difference(){
			//	translate([1.7+0.52/2,-2,4.45]) rotate([0,-45]) cube([1.8,idler_nut_trap_depth+1.7,1.8]);
			//	translate([1.7+0.52/2-1.5,-2-0.1,4.45+1.8/1.414]) cube([3,idler_nut_trap_depth+1.9,2]);
			//}
			//translate([0.7,-2,4.45+1.8/1.414]) cube([1.8*1.414,idler_nut_trap_depth+1.7,2*layer_thickness]);
        }
      translate([-1-4*layer_width,26.5,wade_block_depth-3.9])				// upper support
        cube([wade_block_width+2,23+4/*32.5-10*/,layer_thickness]);
      translate([-1-4*layer_width,wade_block_height-6,wade_block_depth-3.9])// upper support
        cube([wade_block_width-3.1+2.2,7.5,layer_thickness]);
      translate([-1-4*layer_width,wade_block_height-11.3,8])              	// lower support
        cube([wade_block_width-8.1+4*layer_width,11.3,layer_thickness]);
      translate([wade_block_width-9.1,wade_block_height-7.3,8])				// lower support
        cube([4.8,7.3+1.5,layer_thickness]);
	  translate([7,wade_block_height-idler_nut_trap_depth+1.8-2,3])			// extra support for bridge
            cube([0.52,idler_nut_trap_depth+0.2,6]);
	  translate([6,wade_block_height-idler_nut_trap_depth+1.8-2,11])			// extra support for bridge
            cube([0.52,idler_nut_trap_depth+0.2,13.5]);
      // Lower bearing center clearing support
      translate(motor_mount_translation+[-gear_separation,0,0]){
        difference(){
          translate([0,0,0]) cylinder(r=16/2-0.5,h=7+layer_thickness);
          translate([0,0,-0.1]) cylinder(r=16/2-3.5,h=7+layer_thickness+0.2);
          for(rot=[0:5]){
            rotate([0,0,rot*60]) translate([-0.25,0,-0.1]) cube([0.5,16/2,7.1]);
          }
        }
        difference(){
          translate([0,0,7-0.1]) cylinder(r=20/2+0.5,h=layer_thickness);
          translate([0,0,7-0.1]) cylinder(r=m8_clearance_hole/2+0.1,h=layer_thickness+0.2);
        }
      }
	}

}

function in_mask(mask,value)=(mask%(value*2))>(value-1);

//block_holes();

module block_holes(legacy_mount=false){
/* Moved at the end of everything
	//Round off the top back of the block.
	translate([0,wade_block_height-block_bevel_r,-1])
	difference(){
		translate([-1,0,0])
		cube([block_bevel_r+1,block_bevel_r+1,wade_block_depth/2]);
		translate([block_bevel_r,0,0])
		cylinder(r=block_bevel_r,h=wade_block_depth/2,$fn=40);
	}

	//Round off the top front of the block.[am]
	translate([0,wade_block_height-block_bevel_r*2+0.2,wade_block_depth/2+2])
	union()
	difference(){
		translate([-1,2,0.1])
		 cube([block_bevel_r*2,block_bevel_r*2-1,wade_block_depth/2]);
		translate([block_bevel_r*2-2,2,0.1])
		 cylinder(r=block_bevel_r*2-2,h=wade_block_depth/2-2,$fn=40);
	}*/

	// Round the top front corner.
	translate ([-base_leadout-base_thickness/2,-1,wade_block_depth-block_bevel_r])
	difference(){
		translate([-1,0,0])
		cube([block_bevel_r+1,base_thickness+2,block_bevel_r+1]);
		rotate([-90,0,0])
		translate([block_bevel_r,0,-1])
		cylinder(r=block_bevel_r,h=base_thickness+4);
	}

	// Round the top back corner.
	translate ([base_length-base_leadout+base_thickness/2-block_bevel_r,
		-1,wade_block_depth-block_bevel_r])
	difference(){
		translate([0,0,0])
		cube([block_bevel_r+1,base_thickness+2,block_bevel_r+1]);
		rotate([-90,0,0])
		translate([0,0,-1])
		cylinder(r=block_bevel_r,h=base_thickness+4);
	}

	// Round the bottom front corner.
	translate ([-base_leadout-base_thickness/2,-1,-2])
	difference(){
		translate([-1,0,-1])
		cube([block_bevel_r+1,base_thickness+2,block_bevel_r+1]);
		rotate([-90,0,0])
		translate([block_bevel_r,-block_bevel_r,-1])
		cylinder(r=block_bevel_r,h=base_thickness+4);
	}

	// Idler fulcrum hole.
	translate(idler_fulcrum+[0,0,(show_support?layer_thickness:-0.1)])
	cylinder(r=m3_diameter/2,h=idler_short_side-2*idler_hinge_width-0.5,center=true,$fn=16);

	translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1])
	cylinder(r=m3_nut_diameter/2+0.25,h=1,$fn=40);

	//Rounded cutout for idler hinge.
	difference(){
      translate(idler_fulcrum)
        cylinder(r=idler_hinge_rh+1.5,h=idler_short_side+4,center=true,$fn=60);
      translate(idler_fulcrum)
        cylinder(r=idler_hinge_rh+2,h=idler_short_side-2*idler_hinge_width-0.5,center=true);
      translate([-30.1,0,-2]) cube([30,40,wade_block_depth+4]);//eliminates interference with support
	}

	translate(motor_mount_translation){
		translate([-gear_separation,0,0]){
			//rotate([0,180,0])
			//translate([0,0,1])
			//import_stl("wade-large.stl");

			// Open the top to remove overhangs and to provide access to the hobbing.
			translate([-motor_mount_translation[0]+gear_separation-0.5,0,
                       wade_block_depth/2-idler_mounting_hole_across+1.4+
                       ((idler_mounting_hole_diameter*cos(180/6))/2)])
				cube([wade_block_width/2+1.5,
					wade_block_height-motor_mount_translation[1]+1+1,
					wade_block_depth-9.5-4.5+((idler_mounting_hole_diameter*cos(180/6))/2)-1.4]);

			// Open extra 20° access to tractor [am]
			translate([m8_clearance_hole/2,0,9.4]) rotate([0,0,100])
			cube([wade_block_width-2.5,8,wade_block_depth-9.5-3.3-0.5]);

            // lower bearing, eliminate the washer [am]
			translate([0,0,-0.2])
            cylinder(r=hole_for_608/2,h=7.2,$fn=48);
            //b608(height=7.1); // space for the bearing
            translate([0,0,7-0.1])
            cylinder(r=16/2,h=608_center_clearance+0.1);

            // Opening for the tractor screw
			translate([0,0,7+608_center_clearance+(show_support?layer_thickness:-0.1)])
			cylinder(r=m8_clearance_hole/2,h=wade_block_depth-(8+layer_thickness)+2);

            translate([0,0,21]) // [am] was 1mm too deep
			b608(height=8);

			translate([-13,0,9.5])
            b608(height=wade_block_depth-9.5-3.9); // [am]

			translate([0,0,21-608_center_clearance])
			cylinder(r=16/2,h=2);

			// Filament feed.
			translate([-filament_feed_hole_offset,0,wade_block_depth/2])
			rotate([90,0,0])
			rotate(360/16)
			cylinder(r=filament_feed_hole_d/2,h=wade_block_depth*3,center=true,$fn=16);

			// Mounting holes on the base.
			translate(legacy_mount?[-3.4,0,-1]:[0,0,0])
			for (mount=[0:1]){
				translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					-motor_mount_translation[1]-1,wade_block_depth/2])
				rotate([-90,0,0]) rotate(360/16)
				cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=12);
                if (hex_base_nuts){ // remove hex nuts un base if top mounting screw [am]
				    translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
					    -motor_mount_translation[1]+base_thickness/2,
					    wade_block_depth/2])
				    rotate([-90,0,0]){
    				//cylinder(r=m4_nut_diameter/2,h=base_thickness,$fn=6);
				    translate([0,0,base_thickness/2]) rotate([0,0,30]) 
                    nut_trap(m4_wrench,base_thickness,0);}
                } else {
                	if (mount==0) {  // just a surface for the washer
						translate([-filament_feed_hole_offset+25*((mount<1)?1:-1),
							-motor_mount_translation[1]+base_thickness,
							wade_block_depth/2])
						rotate([-90,0,0]) cylinder (r=12/2, h=4);
						//translate([0,0,base_thickness]) cylinder (r=12/2, h=4);
				    }
				    // extra 0.7mm hole width to compensate for deviations
					translate([-filament_feed_hole_offset+25.7*((mount<1)?1:-1),
						-motor_mount_translation[1]-1,wade_block_depth/2])
					rotate([-90,0,0]) rotate(360/16)
					cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=12);
                }
			}
            // Allen wrench for top side access [am]
			translate([wade_block_width-3.5,-motor_mount_translation[1]+base_thickness,wade_block_depth/2]){
			//rotate([-90,0,9]) cylinder(r=3.8/2,h=60,$fn=6);// this is a simulates key
			//rotate([-90,0,8]) rotate([0,0,45]) translate([0,0,35]) cube([5,5,50],center=true);
			rotate([-90,0,8]) rotate([0,0,45]) translate([-2.5,-3.5,10]) cube([6,6,50]);
            }
		}
		//translate([0,0,-8])
		//import_stl("wade-small.stl");
	}
	// Rouded bottom for filler between wade block and motor mount [am]
	translate([wade_block_width+5.4,motor_mount_translation[1]-hole_for_608/2-5.5,-0.1]){
		cylinder(r=5.4,h=motor_mount_thickness+0.2,$fn=48);
		translate([0.5,-1,0])cylinder(r=5.4,h=motor_mount_thickness+0.2,$fn=48);
	}

	// Idler mounting holes and nut traps.
	render()
	for (idle=[-1,1]){
		translate([0,
			idler_mounting_hole_up+motor_mount_translation[1],
			wade_block_depth/2+idler_mounting_hole_across*idle])
		rotate([0,90,0]){
			rotate([0,0,30]){
				// screw holes
				translate([0,0,-1])
				cylinder(r=idler_mounting_hole_diameter/2,h=wade_block_depth+6,$fn=6);

				// nut traps
				translate([0,0,wade_block_width-idler_nut_trap_depth+idler_nut_thickness/2])
				//cylinder(r=m4_nut_diameter/2,h=idler_nut_thickness,$fn=6);
				nut_trap(idler_nut_wrench,idler_nut_thickness);
			}
			// nut slots
			translate([0,10/2,wade_block_width-idler_nut_trap_depth+idler_nut_thickness/2])
			cube([idler_nut_wrench+0.3,10,idler_nut_thickness],center=true);

			// screw holes 30°
			for(tilt=[1:6]){
				translate([0,0,(wade_block_width-idler_nut_trap_depth+idler_nut_thickness/2)])
				rotate([tilt*5,0,0])
				rotate([0,0,30.1]) // 0.1 is to fix error importing in Slic3r
				translate([0,0,-28])
				cylinder(r=idler_mounting_hole_diameter/2,h=wade_block_depth+10,$fn=6);
			}

			// nut traps 30°
			translate([0,0,wade_block_width-idler_nut_trap_depth+idler_nut_thickness/2])
			for(tilt_nut=[1:6])
				rotate([tilt_nut*5,0,0])
				rotate([0,0,30])
				//cylinder(r=m4_nut_diameter/2,h=idler_nut_thickness,$fn=6);
				nut_trap(idler_nut_wrench,idler_nut_thickness);
		}
	}
    // open an access to de back of the idler mouting holes [am]
	translate([wade_block_width,wade_block_height-12,
        wade_block_depth/2-idler_mounting_hole_across-((idler_mounting_hole_diameter*cos(180/6))/2)]){
        cube([2.5,9,10]);
        translate([2.5,0,0]) rotate([0,-60,0]) cube([10,9,2.8]);
    }

}

module motor_mount(){
	linear_extrude(height=motor_mount_thickness){
		barbell (motor_hole(0),motor_hole(1)+[1,0],nema17_support_d/2,
			nema17_support_d/2+2,20,160);
		barbell (motor_hole(1)-[motor_slot_left,0],motor_hole(2)-[motor_slot_left,0],nema17_support_d/2+2,
			nema17_support_d/2,20,160);
		barbell (motor_hole(1)+[motor_slot_right,0],motor_hole(2)+[motor_slot_right,0],nema17_support_d/2,
			nema17_support_d/2,15,160);
	}
    for (hole=[0:2]) hull(){ // [am] extended base for extended holes
        translate(motor_hole(hole)) translate([-motor_slot_left,0,0])
            cylinder(r=nema17_support_d/2,h=motor_mount_thickness);
        translate(motor_hole(hole)) translate([motor_slot_right,0,0])
            cylinder(r=nema17_support_d/2,h=motor_mount_thickness);
    }
    //translate(motor_hole(1)) cylinder(r=nema17_support_d/2,h=motor_mount_thickness+48); // test fos screw access
}

module motor_mount_holes(){
	radius=3.3/2; // 4-> 3.3 narrower slots
	{
		translate([0,0,screw_head_recess_depth+(show_support?layer_thickness:-0.1)])
		for (hole=[0:2]) hull(){
			translate([motor_hole(hole)[0]-motor_slot_left,motor_hole(hole)[1],0])
			cylinder(h=motor_mount_thickness,r=radius,$fn=16);
			translate([motor_hole(hole)[0]+motor_slot_right,motor_hole(hole)[1],0])
			cylinder(h=motor_mount_thickness,r=radius,$fn=16);
		}

		translate([0,0,-1])
		for (hole=[0:2]) hull() {
			translate([motor_hole(hole)[0]-motor_slot_left,motor_hole(hole)[1],0])
			cylinder(h=screw_head_recess_depth+1,
				r=screw_head_recess_diameter/2,$fn=16);
			translate([motor_hole(hole)[0]+motor_slot_right,motor_hole(hole)[1],0])
			cylinder(h=screw_head_recess_depth+1,
				r=screw_head_recess_diameter/2,$fn=16);
		}
        hull(){
        translate(motor_mount_translation+[-motor_slot_left+0.5,0,-0.1])
        cylinder(r=motor_center_hole/2,h=motor_mount_thickness+0.2,$fn=32);
        translate(motor_mount_translation+[motor_slot_right,0,-0.1])
        cylinder(r=motor_center_hole/2,h=motor_mount_thickness+0.2,$fn=32);
        }
	}
}

module wadeidler(){
//%translate([-9.7,59,14])
//%cube([12,4,5],center=true);

	guide_height=12.3;
	guide_length=8.8;

	difference(){
		union(){
			//The idler block.
			translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0]){
				cube([idler_height,idler_long_side,idler_short_side],center=true);

				//Filament Guide, only the moving half
				translate([idler_height/2-0.1,idler_long_side/2-guide_length,-5.6])
					difference(){
						union(){
							cube([1.5+0.1,guide_length,5]);
							// Reinforcement
							difference(){
								translate([-0.1,-5.5,-4.8]) cube([1.6,7,20.8]);
								translate([-0.1,-5.5,-4.9]) rotate([0,0,-45]) cube([2,3,22]);// looks nicer...
								translate([-0.1,-5.5,-4.9]) rotate([0,45,0]) cube([2,10,3]);
								translate([-0.1,-5.5,-4.9+20.8]) rotate([0,45,0]) cube([3,10,2]);
							}
						}
						translate([1.5,-0.1,-3.3]) rotate([0,0,atan(1/guide_length)])
							cube([2,guide_length+1,20+0.2]);
					}
				translate([idler_height/2-0.1,idler_long_side/2-guide_length,-1.7])
				translate([-0.5,0,0])cube([7+0.1,guide_length,5]);
				difference(){
				translate([idler_height/2+7-0.6,idler_long_side/2-guide_length,0])
				cube([2,guide_length,2]);
				translate([idler_height/2+7+2.5-0.6,idler_long_side/2-guide_length-0.1,-0.5])
				rotate([-90,0,0]) cylinder(r=2.5,h=guide_length+0.2,$fn=24);
                }
				translate([idler_height/2,idler_long_side/2-guide_length,+1.9])
					difference(){
						cube([14+0.1,guide_length,3.7]);
						translate([14,-0.1,-0.1]) rotate([0,0,atan(1/guide_length)])
							cube([2,guide_length+1,3.7+0.2]);
					}
			}

			// The fulcrum Hinge
			translate(idler_fulcrum){
				rotate([0,0,-30]){
					cylinder(h=idler_short_side,r=idler_hinge_rh+0.5,center=true,$fn=60);
					translate([-idler_end_length/2,0,0])
					cube([idler_end_length,(idler_hinge_rh+0.5)*2,idler_short_side],center=true);
				}
			}
		}

		//Back of idler. Rueckseite glaetten
		translate(idler_axis+[-idler_height/2+2-idler_height,
			idler_long_side/2-idler_long_bottom-13,0])
		cube([idler_height,idler_long_side,idler_short_side+2],center=true);

		//Slot for idler fulcrum mount. Ausbruch Aufhaengung
		translate(idler_fulcrum){
			cylinder(h=idler_short_side-2*idler_hinge_width,
				r=idler_hinge_rh+0.6,center=true,$fn=60);
			rotate(-32)
			translate([0,-idler_hinge_rh-0.5,0])
			cube([idler_hinge_rh*2+1,idler_hinge_rh*2+1,
				idler_short_side-2*idler_hinge_width],center=true);

		}


		//Bearing cutout. Kugelleager Aufhaengung
		translate(idler_axis){
			difference(){
				cylinder(h=idler_608_height,r=idler_608_diameter/2,
					center=true,$fn=60);
				for (i=[0,1])
				rotate([180*i,0,0])
				translate([0,0,6.9/2])
				cylinder(r1=13/2,r2=17/2,h=2);
			}
			cylinder(h=idler_short_side-6,r=m8_diameter/2-0.25/*Tight*/,
				center=true,$fn=20);
			// bearing entry clearing
			translate([0,0,-idler_608_height/2])
				cube([idler_608_diameter,idler_608_diameter/2,idler_608_height]);
		}

		//Fulcrum hole. Gelenkloch
		translate(idler_fulcrum)
		rotate(360/12)
		cylinder(h=idler_short_side+2,r=m3_diameter/2-0.1,center=true,$fn=12);

		//Nut trap for fulcrum screw. Loch fuer Mutter
		translate(idler_fulcrum+[0,0,idler_short_side/2-idler_hinge_width-1+1.5])
//		rotate(360/16)
//		cylinder(h=3,r=m3_nut_diameter/2,$fn=6);
//		rotate([0,0,30])
		nut_trap(m3_wrench,3);

		for(idler_screw_hole=[-1,1])
		translate(idler_axis+[2-idler_height,0,0]){
			//Screw Holes. Schraubenloecher
			translate([-1,idler_mounting_hole_up-1,
				idler_screw_hole*idler_mounting_hole_across])
			rotate([0,90,0]){
				//cylinder(r=idler_mounting_hole_diameter/2,h=idler_height+2,$fn=16);//old, removed for vertical print
				translate([0,-idler_mounting_hole_diameter/2-0.7,0]) rotate([0,0,45])
					cube([idler_mounting_hole_diameter*0.707,idler_mounting_hole_diameter*0.707,idler_height+5]);
				translate([-idler_mounting_hole_diameter/2,-0.7,0])
				cube([idler_mounting_hole_diameter,idler_mounting_hole_elongation+7.7,
					idler_height+2]);
			}

			// Rounded corners, => ELIMINATED for vertical prining
			//render()
			//translate([idler_height/2,idler_long_top,
			//	idler_screw_hole*(idler_short_side/2)])
			//difference(){
			//	translate([0,-idler_corners_radius/2+0.5,-idler_screw_hole*(idler_corners_radius/2-0.5)])
			//	cube([idler_height+2,idler_corners_radius+1,idler_corners_radius+1],
			//		center=true);
			//	rotate([0,90,0])
			//	translate([idler_screw_hole*idler_corners_radius,-idler_corners_radius,0])
			//	cylinder(h=idler_height+4,r=idler_corners_radius,center=true,$fn=40);
			//}
		}
		
		// Cavity por the Quick Release Lever
		translate(idler_axis+[-idler_height/2+2,+idler_long_side/2-idler_long_bottom,0])
		translate([-idler_height/2-1.5,idler_long_side/2-13,-5])
		rotate([0,0,0-7.2]) difference(){
			cube([1.5,12,5*2]);
		   	translate([0,12,-0.1])  rotate([0,0,-55]) cube([4,4,5*2+0.2]);
		   	translate([0,-0.1,0])   rotate([0,45,0])  cube([4,12.2,4]);
		   	translate([0,-0.1,5*2]) rotate([0,45,0])  cube([4,12.2,4]);
		}
	}
}

module idler_with_support(w=4*layer_width,ex=layer_thickness){
	// w is width of external support struceture
	// with "Perimiter width" of 0.48 and 2 perimeters, it shold be 2mm
	// this is necessary so that the bridge has a base to stick to
	// ex is extra support after bridge, needed because of Slic3r algorithm
	translate([9,-15,27]) rotate([0,180,0])			// POSITIONING SIDE-WISE
		wadeidler();
	if (show_support){
		// filament guide and bottom screw
		translate([-w-1.8,34.8,0]) cube([w,9,7.3+ex+layer_thickness]);
		translate([26.5,34.8,0]) cube([w,9,7.3+ex+layer_thickness]);
		translate([-w-1.8,34.8,7.3]) cube([28.3+2*w,9,layer_thickness]);
		translate([13.2,34.8,2.5]) cube([layer_width,9,7]);
		// upper screw
		translate([13.2,45,0]) cube([12,w,23.3+ex+layer_thickness]);
		translate([13.2,35,23.3]) cube([12,10+w,layer_thickness]);
		// hindge
		rotate([0,0,30]) translate([6.2,-8.2,0]) cube([w,11.8,19.5+ex+layer_thickness]);
		rotate([0,0,30]) translate([6.2,-8.2,19.5]) cube([15+w,11.8,layer_thickness]);
		// bearing hole
		translate([26.5,16.3,0]) cube([w,13.3,17.5+ex+layer_thickness]);
		translate([12.5-1.5-w,12,0]) cube([w,22.5,17.5+ex+layer_thickness]);
		translate([12.5-1.5-w,16.3,16.45]) cube([14+1.5+2*w,13.3,layer_thickness]);
		translate([19.5,16.3,17.5]) cube([7+w,13.3,layer_thickness]);
		translate([12.5-1.5-w,12,17.5]) cube([10+1.5,3.5,layer_thickness]);
		translate([12.5-1.5-w,30.3,17.5]) cube([10+1.5,4.2,layer_thickness]);
	}
}

module idler_vert_support(w=4*layer_width,ex=layer_thickness){
	// w is width of external support struceture
	// with "Perimiter width" of 0.48 and 2 perimeters, it shold be 2mm
	// this is necessary so that the bridge has a base to stick to
	// ex is extra support after bridge, needed because of Slic3r algorithm
	translate([9,-15,58.8]) rotate([-90,0,0]){			// POSITIONING VERTICALY
		wadeidler();
		if (show_support){	// TODO: porca 
			// Suport for the bearing axis
			translate(idler_axis){
				// Support for Axis
				for(i=[-7.5-layer_width,-4-layer_width,4,7.5]) translate([-3,-4.5,i]) cube([5,9,layer_width]);
				// Support for bearing
				for(i=[-2.5-layer_width,-layer_width/2,2.5]) translate([-10,-11.5,i]) difference(){
					cube([5,24,layer_width]);
					translate([5,24,-0.1]) rotate([0,0,137]) cube([8,8,layer_width+0.2]);
				}
			}
			// Suport for the fulcum hindge
			translate(idler_fulcrum){
				 for(i=[-12-layer_width,-9.5-layer_width,-7-layer_width,7,9.5,12])
					translate([1.7,9,i]) rotate([0,0,-150]) cube([2,7,layer_width]);
				translate([-3/2,-3,6.5]) cube([3,7,layer_width]);
			}
		}
	}
	if (0){//show_support){
		// filament guide and bottom screw
		translate([-w-1.8,34.8,0]) cube([w,9,7.3+ex+layer_thickness]);
		translate([26.5,34.8,0]) cube([w,9,7.3+ex+layer_thickness]);
		translate([-w-1.8,34.8,7.3]) cube([28.3+2*w,9,layer_thickness]);
		translate([13.2,34.8,2.5]) cube([layer_width,9,7]);
		// upper screw
		translate([13.2,45,0]) cube([12,w,23.3+ex+layer_thickness]);
		translate([13.2,35,23.3]) cube([12,10+w,layer_thickness]);
		// hindge
		rotate([0,0,30]) translate([6.2,-8.2,0]) cube([w,11.8,19.5+ex+layer_thickness]);
		rotate([0,0,30]) translate([6.2,-8.2,19.5]) cube([15+w,11.8,layer_thickness]);
		// bearing hole
		translate([26.5,16.3,0]) cube([w,13.3,17.5+ex+layer_thickness]);
		translate([12.5-w,12,0]) cube([w,22.5,17.5+ex+layer_thickness]);
		translate([12.5-w,16.3,16.45]) cube([14+2*w,13.3,layer_thickness]);
		translate([19.5,16.3,17.5]) cube([7+w,13.3,layer_thickness]);
		translate([12.5-w,12,17.5]) cube([10,3.5,layer_thickness]);
		translate([12.5-w,30.3,17.5]) cube([10,4.2,layer_thickness]);
	}
}

module b608(height=8){
	translate([0,0,height/2]) cylinder(r=hole_for_608/2,h=height,center=true,$fn=60);
}

module barbell (x1,x2,r1,r2,r3,r4) {
	x3=triangulate (x1,x2,r1+r3,r2+r3);
	x4=triangulate (x2,x1,r2+r4,r1+r4);
	render()
	difference (){
		union(){
			translate(x1)
			circle (r=r1);
			translate(x2)
			circle(r=r2);
			polygon (points=[x1,x3,x2,x4]);
		}

		translate(x3)
		circle(r=r3,$fa=5);
		translate(x4)
		circle(r=r4,$fa=5);
	}
}

function triangulate (point1, point2, length1, length2) =
point1 +
length1*rotated(
atan2(point2[1]-point1[1],point2[0]-point1[0])+
angle(distance(point1,point2),length1,length2));

function distance(point1,point2)=
sqrt((point1[0]-point2[0])*(point1[0]-point2[0])+
(point1[1]-point2[1])*(point1[1]-point2[1]));

function angle(a,b,c) = acos((a*a+b*b-c*c)/(2*a*b));

function rotated(a)=[cos(a),sin(a),0];

//========================================================
// Modules for defining holes for hotend mounts:
// These assume the extruder is verical with the bottom filament exit hole at [0,0,0].

//malcolm_hotend_holes ();
module malcolm_hotend_holes (){
	extruder_recess_d=16;
	extruder_recess_h=3.5;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);
}

//groovemount_holes ();
module groovemount_holes (){
	extruder_recess_d=16;
	extruder_recess_h=5.5;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);
}

//peek_reprapsource_holes ();
module peek_reprapsource_holes (){
	extruder_recess_d=11;
	extruder_recess_h=19;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);

	// Mounting holes to affix the extruder into the recess.
	translate([0,0,min(extruder_recess_h/2, base_thickness)])
	rotate([-90,0,0])
	cylinder(r=m4_diameter/2-0.5/* tight */,h=wade_block_depth+2,center=true);
}

//arcol_mount_holes();
module arcol_mount_holes(){
	hole_axis_rotation=42.5;
	hole_separation=30;
	hole_slot_height=4;
	for(mount=[-1,1])
		translate([hole_separation/2*mount,-7,0]) {
			translate([0,0,-1])
				cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=8);

				translate([0,0,base_thickness/2])
				//rotate(hole_axis_rotation){
					cylinder(r=m4_nut_diameter/2,h=base_thickness/2+hole_slot_height,$fn=6);
				translate([0,-m4_nut_diameter,hole_slot_height/2+base_thickness/2])
					cube([m4_nut_diameter,m4_nut_diameter*2,hole_slot_height],center=true);
		}
}

//mendel_parts_v6_holes ();
module mendel_parts_v6_holes (insulator_d=12.7) {
	extruder_recess_d=insulator_d+0.7;
	extruder_recess_h=10;
	hole_axis_rotation=42.5;
	hole_separation=30;
	hole_slot_height=5;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);

	for(mount=[-1,1])
	rotate([0,0,hole_axis_rotation+90+90*mount])
	translate([hole_separation/2,0,0]){
		translate([0,0,-1])
		cylinder(r=m4_diameter/2,h=base_thickness+2,$fn=8);

		translate([0,0,base_thickness/2])
		rotate(-hole_axis_rotation+180){
//			rotate(30)
			cylinder(r=m4_nut_diameter/2,h=base_thickness/2+hole_slot_height,$fn=6);
			translate([0,-m4_nut_diameter,hole_slot_height/2+base_thickness/2])
			cube([m4_nut_diameter,m4_nut_diameter*2,hole_slot_height],
					center=true);
		}
	}
}

//grrf_peek_mount_holes();
module grrf_peek_mount_holes(){
	extruder_recess_d=16.5;
	extruder_recess_h=10;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);

	for (hole=[-1,1]){
		rotate(90,[1,0,0])
			translate([hole*(extruder_recess_d/2-1.5),3+1.5,-wade_block_depth/2-1]){
				translate([0,0,3.25+layer_thickness])
					cylinder(r=1.5,h=wade_block_depth+2,$fn=10);
				translate([0,0,1.75])
					nut_trap(m3_wrench, 3);
			}
	}
}

//wildseyed_mount_holes(insulator_d=16); //  16 is standard (J-head)
module wildseyed_mount_holes(insulator_d=12.7){
	extruder_recess_d=insulator_d+0.4;	// from 0.7 to 0.4
	extruder_recess_h=10+0.8;			// a little extra...

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1,$fn=36);

	for (hole=[-1,1])
	rotate(90,[1,0,0])
	translate([hole*(extruder_recess_d/2-1.5),3+1.5,-wade_block_depth/2-1])
	cylinder(r=(3-0.1)/2,h=wade_block_depth+2,$fn=16);// adjusted diameter
}

// conical screw head for Jhead 2.8x25mm (BR)
module jh_conical_screw(){
	extruder_recess_d=16+0.7; // for j-head only
	for (hole=[-1,1])
	rotate(90,[1,0,0])
	translate([hole*(extruder_recess_d/2-1.5),3+1.5,wade_block_depth/2-1.7])
	 cylinder(r1=1.5,r2=2.76,h=1.71,$fn=12);
}

//PEEK mount holes for reprap-fab.org 10mm dia insulator
module peek_reprapfaborg_holes(){
	extruder_recess_d=10.8;
	extruder_recess_h=20;

	// Recess in base
	translate([0,0,-1])
	cylinder(r=extruder_recess_d/2,h=extruder_recess_h+1);

	// Mounting holes to affix the extruder into the recess.
	translate([5,0,min(extruder_recess_h/2, base_thickness-2)])
	rotate([-90,0,0]){
//	cylinder(r=m3_diameter/2-0.5,/*tight*/,h=wade_block_depth+2,center=true);
	polyhole(2.5,wade_block_depth+2);}
	translate([-5,0,min(extruder_recess_h/2, base_thickness-2)])
	rotate([-90,0,0]){
//	cylinder(r=m3_diameter/2-0.5,/*tight*/,h=wade_block_depth+2,center=true);
	polyhole(2.5,wade_block_depth+2);}

	//cylinder(r=m4_diameter/2-0.5/* tight */,h=wade_block_depth+2,center=true);
}

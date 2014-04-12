//
// Washers for the extruder
//
// Licensed under the GNU GPL license.
//  2013 by AlainMouette
//

// it doesn't make sense to me to go out shopping for washers,
//   so I printed them,

// The 2mm M8 washer it fo inserting between the big gear and the extruder body
// I use an extra thin washer between the bearing and the fixing nuts
// A few 0.5mm washers are handy for adjusting tractor position

// I use some cheap springs for the idler but the ends are
//   not very smooth, a washer is needed but comercial ones
//   create a problem with the fast-release lever
//   so... I made two smaller washers for that



////////// RENDER TRACTOR WASHER ///////////////////////////////////////////////////
// Positioning for multiple parts
translate([32,4,0]) M8_washer(width=1.2);
translate([13,4,0]) M8_washer(width=2);

translate([0,0,0]) IdlerScrew_washer();
translate([0,9,0]) IdlerScrew_washer();


// Default is the same as comercial metal washers
module M8_washer(width=1.2){
	difference(){
		cylinder(r=17/2,h=width,$fn=32);
		translate([0,0,-1])
		cylinder(r=8.7/2,h=10,$fn=24);
	}
}

// smaller washer for the Idler Screw,
module IdlerScrew_washer(width=1.2){
	difference(){
		cylinder(r=7.5/2,h=width,$fn=32);
		translate([0,0,-1])
		cylinder(r=4.3/2,h=10,$fn=24);
	}
}
 

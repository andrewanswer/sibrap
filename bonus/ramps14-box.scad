// Sliding Project box V1.2, now with screw holes!
// John Newman, 25th November 2011
//
// Remixed by Gyrobot to reduce the height be 10mm and increase the length by 10mm. Moved fan vents onto end plate.
//
// This Sliding lid box parameterised for RAMPS 1.4
//
// A parameterised enclosure for electronic projects, with support for PCB slots, Screw holes and blocks
// and apertures in the lid and 'top' end.
// The lid slides on, which holds your PCB(s) in.
// Apertures are added with code in the modules "HoleInLid" and "HoleInEnd". See the comments.

// Outside dimensions of the box, and other structural dimensions

OutL = 120;		// Length in mm
OutW = 65.5 ; 	// Width in mm
OutD = 52;		// Depth in mm
WallT = 2.1	;	// Wall thickness (mm)

// PCB supports are defined by the distance to the underside of the PCB, from the top external of the box.
// Supports for the PCB are ribs above and below
PCBgap = 2 ;	// Slot size for PCB to slide into
PCB1 = 0;//33 ;		// Position of first PCB (0 if none)
PCB2 = 0;		// Position of second PCB (0 if none)
PCB3 = 0 ;		// Position of third PCB (0 if none)

// Screw fasteners are positioned by defining their centre , below the top external surface
// They will be positioned on either side at that height. You have to make sure they are not in a PCB slot!
Screws1 = WallT;//48 ;	// Position of top screws
Screws2 = WallT;//6.5;	// Second set of screws
// Optionally specify the screw hole diameter, to have the holes 'printed'. Otherwise drill them...
ScrewH = 2.0 ;	// Screw hole diameter, in base
ScrewL = 3.0 ;	// Screw hole diameter, in lid

// More obscure parameters
BRad = 0;//4;		// Radius of curvature, box edges (mm)
// For wide boxes (>50/60mm) you may want to use this, or make WallT larger for rigidity.
Ridge = 0;//0.5;		// Depth of reinforcing ridge at end of base. 0 to suppress, is WallT multiplier. (not mm!) e.g 1.5

Sdepth = 1.0 ;	// Depth of support ribs for Lid and PCB (mm)
Swidth = 1.5;
// Bevelled ridge to hold lid on (in mm)
RHeight = 3 ;	// Top ridge height
RWidth = 2 ;	// Top ridge width (out over the box)
// Plastic blocks to screw into
ScrewD = 10 ;	// Depth of screw block (which the screw goes into)
ScrewW = 6 ;	// Width of Screw block, and of countersink in lid

Allow = 0.5;		// Allowance for fit of the lid. A gap around it, and elsewhere.

// http://blog.arduino.cc/2011/01/05/nice-drawings-of-the-arduino-uno-and-mega-2560/
// or sibrap/specs/arduino_mega_drawing.svg
// sizes in mils (0.001")
k=25.4/1000;
Arduino1 = [550,100]*k;
Arduino2 = [3800,100]*k;
Arduino3 = [600,2000]*k;
Arduino4 = [3550,2000]*k;

echo(Arduino1);
echo(Arduino2);
echo(Arduino3);
echo(Arduino4);
// *******************************  View / render options ********************************

// FreeCad positioning
// ------box part 1------
/*a=25;
b=9;
color([0.8,0.8,0])
difference() {
pbox();
translate([-OutL/2+a,b,-OutD/2-1]){
cylinder(r=1.5,h=OutD,$fn=16);
translate([82,0,0])cylinder(r=1.5,h=OutD,$fn=16);
}
translate([-OutL/2+6,-OutW/2+10,-OutD/2-1]){
translate(Arduino1)cylinder(r=1.5,h=OutD,$fn=16);
translate(Arduino2)cylinder(r=1.5,h=OutD,$fn=16);
translate(Arduino3)cylinder(r=1.5,h=OutD,$fn=16);
translate(Arduino3)translate([0,0,0.95])cylinder(r1=3,r2=0,h=3,$fn=16);
translate(Arduino3)translate([0,0,WallT+1])specnut();
//translate(Arduino4)cylinder(r=1.5,h=OutD,$fn=16);
}
}
*/
// ------end box part 1------

// FreeCad positioning
// ------box part 2------


// brim width
dr=3;
// brim height
dh=1;
color([0,0,1])
rotate([0,180,0]) {
difference() {
union() {
pboxlid();
translate([0,0,-OutD/2+WallT])holes(2.3+dr,3.5+dr,dh);
}
translate([0,0,-OutD/2-1]) holes(2.3,3.5,OutD);
}
}

module holes(r1,r2,h) {
// table
translate([40,15,0])rbox(r2,1,h);
// motors
rbox(r2,35,h);
// endstops + cooler
translate([-40,15,0])rbox(r1,14,h);
}

module rbox(r,w,h) {
translate([-w/2,0,0])cylinder(r=r,h=h,$fn=40);
translate([-w/2,-r,0])cube([w,2*r,h]);
translate([w/2,0,0])cylinder(r=r,h=h,$fn=40);
}

// ------end box part 2------

// Print Box on on it's own
//translate([0,0,OutL/2-WallT]) rotate([0,-90,90]) pbox() ;  	// Rotate and position for printing


// Print Lid on it's own
//translate([0,0,OutD/2]) pboxlid() ;					// Rotate and position for printing


// Print both together (if they fit!)
//translate([0,-OutW/2-5,OutD/2]) pboxlid() ;
//translate([0,OutD/2+5,OutL/2-WallT]) rotate([0,-90,90]) pbox() ;


module specnut() {
difference() {
cylinder(10,r=6.6/2,$fn=6);
translate([0,0,-0.1])cylinder(10.2,r=3/2,$fn=16);
}
}

// ***************  Your modules to add apertures to  ***************************

// These two modules are where you can put function calls to create holes
// You should use the functions shown in comments, where the
// parameters are in measured from the top left (outside dimension) when looking at the surface (ext).
// Do a test, you'll see how it goes.
// X is across, Y is down, W is x width, D is y depth.

// Called by pboxlid to make any required holes in the lid face
module HoleInLid() {
//	lidround(x,y,w);		// for round holes, X & Y give the centre
//	lidrect(x,y,w,d);		// for rectangular holes, X & Y give the top left corner
	// Fan Mount holes
	lidround(OutW-10,OutL-8,3.8) ;
	lidround(OutW-42.5,OutL-8,3.8) ;
	lidround(OutW-10,OutL-40.5,3.8) ;
	lidround(OutW-42.5,OutL-40.5,3.8) ;

	// Air vent slots
	lidrect(OutW-34.5,OutL-8.5,16,2) ;
	lidrect(OutW-39,OutL-11.5,25,2) ;
	lidrect(OutW-41.5,OutL-14.5,30,2) ;

	lidrect(OutW-43,OutL-17.5,11,2) ;
	lidrect(OutW-21,OutL-17.5,11,2) ;

	lidrect(OutW-44.5,OutL-20.5,10,2) ;
	lidrect(OutW-18.5,OutL-20.5,10,2) ;

	lidrect(OutW-45.5,OutL-23.5,10,2) ;
	lidrect(OutW-17.5,OutL-23.5,10,2) ;

	lidrect(OutW-45.5,OutL-26.5,10,2) ;
	lidrect(OutW-17.5,OutL-26.5,10,2) ;

	lidrect(OutW-44.5,OutL-29.5,10,2) ;
	lidrect(OutW-18.5,OutL-29.5,10,2) ;

	lidrect(OutW-21,OutL-32.5,11,2) ;
	lidrect(OutW-43,OutL-32.5,11,2) ;

	lidrect(OutW-41.5,OutL-35.5,30,2) ;
	lidrect(OutW-39,OutL-38.5,25,2) ;
	lidrect(OutW-34.5,OutL-41.5,16,2) ;
}


// Called by pbox to make any required holes in the end of the box
module HoleInEnd() {
//	endround(x,y,w);		// for round holes, X & Y give the centre
//	endrect(x,y,w,d);		// for rectangular holes, X & Y give the top left corner
	translate([0,0,6]) {
	endrect(43,31,10,14) ;		// DC socket
	endrect(11,33,14,12);		// USB connector
	endrect(38,22,24,10);		// Power connector
//	endrect(43,19,2.5,4) ;		// 'teeth'
//	endrect(54.5,19,2.5,4) ;
	}

	// Vent slots
	endrect(3.5,7,12.9,4);
	endrect(18.5,7,12.9,4);
	endrect(33.5,7,12.9,4);
	endrect(48.5,7,12.9,4);

	endrect(3.5,13.2,12.9,4);
	endrect(18.5,13.2,12.9,4);
//	endrect(33.5,13.2,12.9,4);
//	endrect(48.5,13.2,12.9,4);

	endrect(3.5,19.4,12.9,4);
	endrect(18.5,19.4,12.9,4);
//	endrect(33.5,19.4,12.9,4);
//	endrect(48.5,19.4,12.9,4);
}


// **************** Main Box and Lid modules  *************************

// The Project Box
module pbox() {
	blen = OutL-WallT*2 ;		// Len of box w/o endplate
	rheight = WallT * Ridge ;	// Ridge height, if any
	slen = OutW-WallT*2+0.2  ;	// Lib support at end length
	union () {
		difference() {
			rotate ([0,90,0]) roundedBox(OutD,OutW,blen,BRad,$fn=40) ;
			translate([WallT*2,0,WallT*2]) rotate ([0,90,0]) roundedBox(OutD+(WallT*2),OutW-(WallT*2),OutL,BRad) ;
			HoleInEnd() ;
		}
		topridge() ;		// Add a ridge around the top to hold the lid on
		// Add support to hold the lid up at the sides
		//support(OutD/2-RHeight-0.5);
		rotate([0,90,0])support(OutL/2-WallT-RHeight-0.5);
		// Support the end of the lid
//		translate([-(OutL/2-WallT*2+0.1),OutW/2-WallT-0.1,OutD/2-RHeight-0.6-Sdepth]) rotate([0,0,-90]) cube([slen,Swidth,Sdepth]) ;
		translate([OutL/2-WallT-RHeight-0.5-1.5,OutW/2-WallT-0.1,-(OutD/2+WallT-RHeight-0.6-Sdepth)]) rotate([0,0,-90]) cube([slen,Swidth,Sdepth]) ;
		// Optional reinforcing ridge
		if (Ridge != 0) {
			translate([OutL/2-WallT,-OutW/2+BRad,-OutD/2+WallT+rheight-0.1]) rotate([0,180,0]) halfslab(rheight*2,OutW-BRad*2,rheight) ;
		}
		if (PCB1 != 0) {
			support(OutD/2 - PCB1) ;	// Support under the PCB
			support(OutD/2 - (PCB1 - Sdepth - PCBgap)) ;	// Support over the PCB
		}
		if (PCB2 != 0) {
			support(OutD/2 - PCB2) ;	// Support under the PCB
			support(OutD/2 - (PCB2 - Sdepth - PCBgap)) ;	// Support over the PCB
		}
		if (PCB3 != 0) {
			support(OutD/2 - PCB3) ;	// Support under the PCB
			support(OutD/2 - (PCB3 - Sdepth - PCBgap)) ;	// Support over the PCB
		}
		if (Screws1 != 0) {
//			translate([OutL/2-WallT,OutW/2-ScrewW/2-Allow,OutD/2-Screws1])
			translate([-OutL/2+WallT+ScrewW/2,OutW/2-ScrewW/2-Allow,OutD/2-Screws1])
//rotate([0,-90,0])
rotate([0,180,0])
sblock(ScrewW,ScrewH,ScrewD) ;
//			translate([OutL/2-WallT,-(OutW/2-ScrewW/2)+Allow,OutD/2-Screws1])
			translate([-OutL/2+WallT+ScrewW/2,-(OutW/2-ScrewW/2)+Allow,OutD/2-Screws1])
//rotate([0,90,180])
rotate([0,180,180])
sblock(ScrewW,ScrewH,ScrewD) ;
		}
		if (Screws2 != 0) {
//			translate([OutL/2-WallT,OutW/2-ScrewW/2-Allow,OutD/2-Screws2])
			translate([OutL/2-3*WallT-ScrewW/2,OutW/2-ScrewW/2-Allow,OutD/2-Screws2])
//rotate([0,-90,0])
rotate([0,180,0])
sblock(ScrewW,ScrewH,ScrewD) ;
//			translate([OutL/2-WallT,-(OutW/2-ScrewW/2)+Allow,OutD/2-Screws2])
			translate([OutL/2-3*WallT-ScrewW/2,-(OutW/2-ScrewW/2)+Allow,OutD/2-Screws2])
//rotate([0,90,180])
rotate([0,180,180])
sblock(ScrewW,ScrewH,ScrewD) ;
		}
	}
}

// Sliding lid for Box
module pboxlid() {
	wid = OutW-(WallT*2)-Allow ;
	dadj = Allow ;			// Depth adjustment of end plate, seems to help...
	union() {
		difference() {
			translate([0,0,0]) rotate ([0,90,0]) roundedBox(OutD-dadj,OutW,OutL,BRad) ;
			translate([-(OutL/2-WallT*2),-(OutW+5)/2,-(OutD/2+2.5)]) cube([OutL+5,OutW+5,OutD+5]) ;
translate ([-60,-24,5])
rotate ([90,0,90,])
HoleInLid ();

		}
		difference() {
		render() {
			translate([-(OutL/2-0.1),0,-OutD/2+RHeight]) rotate([180,0,0]) platform(RHeight,wid,wid-(RWidth*2),OutL-WallT-Allow) ;
		}

			// Hollow out end plate
			//translate([-(OutL/2-WallT),-(OutW/2)+ScrewW+Allow+WallT,-(OutD/2)+0.1]) cube([10,OutW-(ScrewW+WallT+Allow)*2,OutD-WallT*3]) ;
			translate([-(OutL/2-WallT),-(OutW/2)+ScrewW+Allow,-(OutD/2)+0.1]) cube([10,OutW-(ScrewW+Allow)*2,OutD-WallT*3]) ;
			// Support wedge
			//translate([WallT*2-OutL/2+0.1,-(OutW/2)+ScrewW+Allow+WallT-0.1,OutD/2-WallT])
			//		rotate([0,180,0]) halfslab(WallT,OutW-(ScrewW+WallT+Allow-0.1)*2,WallT*2) ; 
			translate([WallT*2-OutL/2+0.1,-(OutW/2)+ScrewW+Allow-0.1,OutD/2-WallT])
					rotate([0,180,0]) halfslab(WallT,OutW-(ScrewW+Allow-0.1)*2,WallT*2) ; 
			// Screw countersinks as req
			if (Screws1 != 0) {
				translate([0.3+OutL/2-3*WallT,OutW/2-ScrewW/2-Allow,-OutD/2+Screws1])
 //rotate([0,90,0])
 countersink() ;
				translate([0.3+OutL/2-3*WallT,-(OutW/2-ScrewW/2)+Allow,-OutD/2+Screws1])
 //rotate([0,90,0])
 countersink() ;
			}
			if (Screws1 != 0 && ScrewL != 0) {
				translate([-(OutL/2 + 2),OutW/2-ScrewW/2-Allow,-OutD/2+Screws1])
					//rotate([0,90,0])
 cylinder(WallT*4,ScrewL/2,ScrewL/2,$fn=8) ;
				translate([-(OutL/2 + 2),-(OutW/2-ScrewW/2)+Allow,-OutD/2+Screws1])
					//rotate([0,90,0])
 cylinder(WallT*4,ScrewL/2,ScrewL/2,$fn=8) ;
			}
			if (Screws2 != 0) {
				translate([0.3-OutL/2,OutW/2-ScrewW/2-Allow,-OutD/2+Screws2]) 
//rotate([0,90,0])
countersink() ;
				translate([0.3-OutL/2,-(OutW/2-ScrewW/2)+Allow,-OutD/2+Screws2]) 
//rotate([0,90,0])
countersink() ;
			}
			if (Screws2 != 0 && ScrewL != 0) {
				translate([-(OutL/2 + 2),OutW/2-ScrewW/2-Allow,-OutD/2+Screws2])
					//rotate([0,90,0])
 cylinder(WallT*4,ScrewL/2,ScrewL/2,$fn=8) ;
				translate([-(OutL/2 + 2),-(OutW/2-ScrewW/2)+Allow,-OutD/2+Screws2]) 
					//rotate([0,90,0])
 cylinder(WallT*4,ScrewL/2,ScrewL/2,$fn=8) ;
			}
}
	}
}

// ****************** Worker modules  ************************

module countersink() {
	difference() {
		union() {
			cylinder(WallT,ScrewW/2,1) ;
			translate([0,0,-(WallT-0.1)]) cylinder(WallT,ScrewW/2,ScrewW/2) ;
		}
	}
}

// Platform bevelled on three sides
// Parameters are height, width at base, width at top and length
module platform(h,wb,wt,l) {
	difference() {
		polyhedron (points=[[0,-(wb/2),0],[l,-(wb/2),0],[l,(wb/2),0],[0,(wb/2),0], [0,-(wt/2),h],[l,-(wt/2),h],[l,(wt/2),h],[0,(wt/2),h] ], 
			triangles=[[0,1,5],[0,5,4],[1,2,6],[1,6,5],[2,3,7],[2,7,6],[0,4,7],[0,7,3],[4,5,6],[4,6,7],[3,2,1],[3,1,0],]) ;
		translate([l/2-(RWidth+Allow),0,h/2-WallT]) cube([l,wt-1,h],true) ;
		translate([l-RWidth,-(OutW/2+4),RHeight]) rotate([0,90,0]) halfslab(RHeight,OutW+8,RWidth) ;
//		HoleInLid() ;			// Call user code for aperature
	}
}

// Block for Screws
module sblock(outs,ins,len) { 
	cone = 20 ;
	outr = outs/2 - 0.5;
	inr = ins/2 ;
	outL = outr * 0.87;
	outS = outr/2 ;
	inL = inr * 0.87 ;
	inS = inr /2 ;
	difference() {
		union() {
			cylinder(len,outs/2,outs/2) ;
			translate([0,0,len-((sin(cone)*outs/2))]) rotate([-cone,0,0],[0,0,len]) cylinder((outs/2)/tan(cone),outs/2,0) ;
		}
		if (ins !=0) {
			// translate([0,0,-2]) cylinder(len+2,ins/2,ins/2) ;
			translate([0,0,-0.1]) linear_extrude(10,true,10,0) 
				polygon(points=[[0,outr],[outL,outS],[outL,-outS],[0,-outr],[-outL,-outS],[-outL,outS],[-inS,inL],
					[inS,inL],[inr,0],[inS,-inL],[-inS,-inL],[-inr,0]], 
					paths=[[0,7,1,8,2,9,3,10,4,11,5,6]],convexity=6) ;
		}
	}
}


// size is a vector [w, h, d]
module roundedBox(width, height, depth, radius) {
	size=[width, height, depth];
	cube(size - [2*radius,0,0], true);
	cube(size - [0,2*radius,0], true);
	for (x = [radius-size[0]/2, -radius+size[0]/2],
		y = [radius-size[1]/2, -radius+size[1]/2]) {
		translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
	}
}

//  Kind of triangle cross section beam w->X; d->Y; h->Z
module halfslab(w,d,h) {
	polyhedron ( points = [[0, 0, h], [0, d, h], [0, d, 0], [0, 0, 0], [w, 0, h], [w, d, h]], 
		triangles = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3], ]);
}

// Top ridge which retains the lid
module topridge() {
	blen = 0 ;
rotate([90,-90,90]) {
//	translate([(OutL-WallT*2)/2-0.1, -(OutW/2-WallT+0.1),(OutD/2)-(RHeight+0.1)])
	translate([(OutD-WallT*4)/2-0.1, -(OutW/2-WallT+0.1),(OutL/2)-(RHeight+WallT+0.1)])
 rotate([0,0,90])
// halfslab(RWidth+0.2, OutL-(WallT*3), RHeight ) ;
 halfslab(RWidth+0.2, OutD-(WallT*3), RHeight ) ;
//	translate([-(OutL-WallT*4)/2+0.1, (OutW/2-WallT+0.1),(OutD/2)-(RHeight+0.1)])
	translate([-(OutD-WallT*2)/2+0.1, (OutW/2-WallT+0.1),(OutL/2)-(RHeight+WallT+0.1)])
 rotate([0,0,-90])
// halfslab(RWidth+0.2, OutL-(WallT*3), RHeight ) ;
 halfslab(RWidth+0.2, OutD-(WallT*3), RHeight ) ;
//	translate([-(OutL/2-WallT*2+0.1),- (OutW/2-WallT+0.1),(OutD/2)-(RHeight+0.1)])
	translate([-(OutD/2-WallT+0.1),- (OutW/2-WallT+0.1),(OutL/2)-(RHeight+WallT+0.1)])
 rotate([0,0,0])
// halfslab(RWidth+0.2, OutW-(WallT*2), RHeight ) ;
 halfslab(RWidth+0.2, OutW-(WallT*2), RHeight ) ;
}
}

// Support ridge for lid or PCB
module support(top) {
	translate([0,-(OutW/2-(WallT-0.1)),top]) rib() ;
	translate([0,(OutW/2-(WallT-0.1)-Swidth),top]) rib() ;
}

//Rib of support
module rib() {
	//len = OutL - (WallT*3) - Allow ;
	len = OutD - (WallT*3) - Allow ;
// Allow for 1 wall thickness at one end, 2 at the other, and an Allowance
	translate([-len/2 +0.1,0,-Sdepth]) cube([len,Swidth,Sdepth]) ;
}

module endround(x,y,w) {
	translate([-(10+OutL-WallT*4)/2,OutW/2-x,OutD/2-y]) rotate([0,90,0]) cylinder(10,w/2,w/2) ;
}

module endrect(x,y,w,d) {
	translate([-(10+OutL-WallT*4)/2,OutW/2-w-x,OutD/2-y]) rotate([0,90,0]) cube([d,w,10]) ;
}

module lidround(x,y,w) {
	translate([OutL-y,OutW/2-x,-10]) cylinder(20,w/2,w/2) ;
}

module lidrect(x,y,w,d) {
	translate([OutL-d-y,OutW/2-w-x,-8]) cube([d,w,20]) ;
}

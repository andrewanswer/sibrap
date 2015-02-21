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

// качество отверстий
$fn=16;
// Outside dimensions of the box, and other structural dimensions
OutL = 120;// Length in mm
OutW = 65.5;	// Width in mm
OutD = 52;// Depth in mm
WallT = 2.1;// Wall thickness (mm)

// расстояние между коробкой и крышкой для печати, а также увеличение диаметра отверстий.
Allow = 0.2;		// Allowance for fit of the lid. A gap around it, and elsewhere.

//color([1,0,0,1])cube([OutL,OutW,OutD],true);
// Screw fasteners are positioned by defining their centre , below the top external surface
// They will be positioned on either side at that height. You have to make sure they are not in a PCB slot!
Screws1 = WallT;//48 ;	// Position of top screws
Screws2 = WallT;//6.5;	// Second set of screws
// Optionally specify the screw hole diameter, to have the holes 'printed'. Otherwise drill them...
ScrewH = 3.0;	// Screw hole diameter, in base
ScrewL = 3+Allow;	// Screw hole diameter, in lid
// Plastic blocks to screw into
ScrewD = 10;	// Depth of screw block (which the screw goes into)
ScrewW = 6+Allow;	// Width of Screw block, and of countersink in lid

// More obscure parameters
//BRad = 4;		// Radius of curvature, box edges (mm)
// For wide boxes (>50/60mm) you may want to use this, or make WallT larger for rigidity.
//Ridge = 0;		// Depth of reinforcing ridge at end of base. 0 to suppress, is WallT multiplier. (not mm!) e.g 1.5

// размеры подпорки под крышку (в мм)
Sdepth = 1.0;	// Depth of support ribs for Lid and PCB (mm)
Swidth = 1.5;
// размеры треугольного профиля (в мм)
RHeight = WallT;//3.0;	// Top ridge height
RWidth = WallT;//2.0;	// Top ridge width (out over the box)

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

// КОМПИЛИРОВАТЬ ТУТ
part1(); // коробка
part2(); // крышка

// ------box part 1------
module part1() {
a=25;
b=9;

color([0.8,0.8,0])
difference() {
pbox();
translate([-OutL/2+a,b,-OutD/2-1]){
cylinder(r=ScrewL/2,h=OutD);
translate([82,0,0])cylinder(r=ScrewL/2,h=OutD);
}
translate([-OutL/2+6,-OutW/2+10,-OutD/2-1]){
translate(Arduino1)cylinder(r=ScrewL/2,h=OutD);
translate(Arduino2)cylinder(r=ScrewL/2,h=OutD);
translate(Arduino3)translate([0,0,1])countersink();
translate(Arduino3)translate([0,0,WallT+1])specnut();
//translate(Arduino4)cylinder(r=ScrewL/2,h=OutD);
}
}
}
// ------end box part 1------

// FreeCad positioning
// ------box part 2------
module part2() {
// brim width
dr=3;
// brim height
dh=1;
color([0,0,1])
rotate([0,180,0]) {
difference() {
union() {
pboxlid();
translate([0,0,-OutD/2+WallT]) holes(2.3+dr,3.5+dr,dh);
}
translate([0,0,-OutD/2-1]) holes(2.3,3.5,WallT+dh+2);
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
translate([-w/2,0,0])cylinder(r=r,h=h);
translate([-w/2,-r,0])cube([w,2*r,h]);
translate([w/2,0,0])cylinder(r=r,h=h);
}
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
cylinder(10,r=(6.6+Allow)/2,$fn=6);
translate([0,0,-0.1])cylinder(10.2,r=ScrewL/2);
}
}

// ***************  Your modules to add apertures to  ***************************

// These two modules are where you can put function calls to create holes
// You should use the functions shown in comments, where the
// parameters are in measured from the top left (outside dimension) when looking at the surface (ext).
// Do a test, you'll see how it goes.
// X is across, Y is down, W is x width, D is y depth.

// вентилятор в крышке
module HoleInLid() {
//	lidround(x,y,w);		// for round holes, X & Y give the centre
//	lidrect(x,y,w,d);		// for rectangular holes, X & Y give the top left corner
	// Fan Mount holes
	lidround(OutW-10,OutL-8,4+Allow);
	lidround(OutW-42.5,OutL-8,4+Allow);
	lidround(OutW-10,OutL-40.5,4+Allow);
	lidround(OutW-42.5,OutL-40.5,4+Allow);

	// Air vent slots
	lidrect(OutW-34.5,OutL-8.5,16,2);
	lidrect(OutW-39,OutL-11.5,25,2);
	lidrect(OutW-41.5,OutL-14.5,30,2);

	lidrect(OutW-43,OutL-17.5,11,2);
	lidrect(OutW-21,OutL-17.5,11,2);

	lidrect(OutW-44.5,OutL-20.5,10,2);
	lidrect(OutW-18.5,OutL-20.5,10,2);

	lidrect(OutW-45.5,OutL-23.5,10,2);
	lidrect(OutW-17.5,OutL-23.5,10,2);

	lidrect(OutW-45.5,OutL-26.5,10,2);
	lidrect(OutW-17.5,OutL-26.5,10,2);

	lidrect(OutW-44.5,OutL-29.5,10,2);
	lidrect(OutW-18.5,OutL-29.5,10,2);

	lidrect(OutW-21,OutL-32.5,11,2);
	lidrect(OutW-43,OutL-32.5,11,2);

	lidrect(OutW-41.5,OutL-35.5,30,2);
	lidrect(OutW-39,OutL-38.5,25,2);
	lidrect(OutW-34.5,OutL-41.5,16,2);
}


// разъемы в коробке
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

// коробка
module pbox() {
	//blen = OutL-WallT*2 ;		// Len of box w/o endplate
	//rheight = WallT * Ridge ;	// Ridge height, if any
	//slen = OutW-WallT*2+0.2  ;	// Lib support at end length
	union () {
		difference() {
			translate([0,0,-WallT/2])cube([OutL,OutW,OutD-WallT],true);
			translate([WallT,0,WallT]) cube([OutL,OutW-(WallT*2),OutD],true);
			HoleInEnd();
		}
		// Add a ridge around the top to hold the lid on
		topridge(OutL/2-RHeight/2);
		// Add support to hold the lid up at the sides
		topridge(OutL/2-3*RHeight/2-Allow);
		//supportcap(OutL/2-RHeight-Sdepth/2);
		// Optional reinforcing ridge
		/*if (Ridge != 0) {
			translate([OutL/2-WallT,-OutW/2+BRad,-OutD/2+WallT+rheight-0.1]) rotate([0,180,0]) halfslab(rheight*2,OutW-BRad*2,rheight) ;
		}*/
translate([-OutL/2+WallT+ScrewW/2,OutW/2-WallT/2-ScrewW/2,OutD/2-Screws1])
rotate([0,180,0]) {
sblock(ScrewW,ScrewH,ScrewD);
translate([3.35,0,ScrewD/2])rotate([90,0,-90])cube([5,ScrewD,3.7],true);
}
translate([-OutL/2+WallT+ScrewW/2,-(OutW/2-WallT/2-ScrewW/2),OutD/2-Screws1])
rotate([0,180,0])mirror([0,1,0]) {
sblock(ScrewW,ScrewH,ScrewD);
translate([3.35,0,ScrewD/2])rotate([90,0,-90])cube([5,ScrewD,3.7],true);
}
translate([OutL/2-WallT-ScrewW/2-0.2,OutW/2-WallT/2-ScrewW/2,OutD/2-Screws2])
rotate([0,180,0]) {
sblock(ScrewW,ScrewH,ScrewD);
translate([4.3,0,ScrewD/2])rotate([90,0,-90])halfslab(5,ScrewD,5);
}
translate([OutL/2-WallT-ScrewW/2-0.2,-(OutW/2-WallT/2-ScrewW/2),OutD/2-Screws2])
rotate([0,180,0])mirror([0,1,0]) {
sblock(ScrewW,ScrewH,ScrewD);
translate([4.3,0,ScrewD/2])rotate([90,0,-90])halfslab(5,ScrewD,5);
}
	}
}

// крышка
module pboxlid() {
	// верх
	difference() {
		translate([-OutL/2,-OutW/2,-OutD/2]) cube([OutL,OutW,WallT]);

			// Screw countersinks as req
translate([0,0,-WallT]) mirror([0,0,1]){
translate([OutL/2-WallT-ScrewW/2,OutW/2-WallT/2-ScrewW/2,OutD/2-Screws2])
rotate([0,180,0])
countersink();
translate([OutL/2-WallT-ScrewW/2,-(OutW/2-WallT/2-ScrewW/2),OutD/2-Screws2])
rotate([0,180,180])
countersink();
translate([-OutL/2+WallT+ScrewW/2+0.2,OutW/2-WallT/2-ScrewW/2,OutD/2-Screws1])
rotate([0,180,0])
countersink();
translate([-OutL/2+WallT+ScrewW/2+0.2,-(OutW/2-WallT/2-ScrewW/2),OutD/2-Screws1])
rotate([0,180,180])
countersink();
}
}
// бок с вентилятором
	difference() {
		union() {
			translate([-OutL/2+WallT/2,0,-RWidth/2-Allow/2]) cube([WallT,OutW-2*(WallT+RWidth+Allow),OutD-2*WallT-RWidth-Allow],true);	
			topridge2(-OutL/2-RHeight/2);
		}
		translate ([-60,-24,6])
		rotate ([90,0,90])
		HoleInLid();
	}
}

// ****************** Worker modules  ************************
// отверстия под шурупы в крышке
module countersink() {
	difference() {
		union() {
			cylinder(WallT,ScrewW/2,1);
			translate([0,0,-(WallT-0.1)]) cylinder(WallT,ScrewW/2,ScrewW/2);
			cylinder(WallT*2,ScrewL/2,ScrewL/2);
		}
	}
}

// Platform bevelled on three sides
// Parameters are height, width at base, width at top and length
/*module platform(h,wb,wt,l) {
	difference() {
		polyhedron (points=[[0,-(wb/2),0],[l,-(wb/2),0],[l,(wb/2),0],[0,(wb/2),0], [0,-(wt/2),h],[l,-(wt/2),h],[l,(wt/2),h],[0,(wt/2),h] ], 
			triangles=[[0,1,5],[0,5,4],[1,2,6],[1,6,5],[2,3,7],[2,7,6],[0,4,7],[0,7,3],[4,5,6],[4,6,7],[3,2,1],[3,1,0],]) ;
		translate([l/2-(RWidth+Allow),0,h/2-WallT]) cube([l,wt-1,h],true) ;
		translate([l-RWidth,-(OutW/2+4),RHeight]) rotate([0,90,0]) halfslab(RHeight,OutW+8,RWidth) ;
//		HoleInLid() ;			// Call user code for aperature
	}
}*/

// опора для шурупов
module sblock(outs,ins,len) { 
	cone = 20;
	outr = outs/2 - 0.5;
	inr = ins/2;
	outL = outr * 0.87;
	outS = outr/2;
	inL = inr * 0.87;
	inS = inr /2;
	difference() {
		union() {
			cylinder(len,outs/2,outs/2);
			//translate([0,0,len-((sin(cone)*outs/2))]) rotate([-cone,0,0],[0,0,len]) cylinder((outs/2)/tan(cone),outs/2,0);
			//translate([3.6,0,len/2])rotate([90,0,-90])halfslab(4.4,len,3);
		}
		if (ins !=0) {
			 translate([0,0,-1]) cylinder(len+2,ins/2,ins/2);
			//translate([0,0,-0.1]) linear_extrude(10,true,10,0) 
				//polygon(points=[[0,outr],[outL,outS],[outL,-outS],[0,-outr],[-outL,-outS],[-outL,outS],[-inS,inL],
					//[inS,inL],[inr,0],[inS,-inL],[-inS,-inL],[-inr,0]], 
					//paths=[[0,7,1,8,2,9,3,10,4,11,5,6]],convexity=6);
		}
	}
}


// size is a vector [w, h, d]
/*module roundedBox(width, height, depth, radius) {
	size=[width, height, depth];
	cube(size - [2*radius,0,0], true);
	cube(size - [0,2*radius,0], true);
	for (x = [radius-size[0]/2, -radius+size[0]/2],
		y = [radius-size[1]/2, -radius+size[1]/2]) {
		translate([x,y,0]) cylinder(r=radius, h=size[2], center=true);
	}
}*/

// треугольные выступы на крышке
module topridge2(top) {
translate([top,0,0]) {
translate([RHeight,-(OutW/2-RWidth/2-Allow-WallT),-WallT/2-Allow/2])
rotate([-90,0,-90])
halfslab(RWidth, OutD-(WallT*3)-Allow, RHeight);

translate([RHeight,OutW/2-RWidth/2-Allow-WallT,-WallT/2-Allow/2])
rotate([90,0,90])
halfslab(RWidth, OutD-(WallT*3)-Allow, RHeight);

translate([RHeight,0,OutD/2-RWidth/2-Allow-WallT])
rotate([0,-90,180])
halfslab(RWidth, OutW-WallT*4-Allow*2, RHeight);
}
}

// треугольные выступы на коробке для фиксации крышки
module topridge(top) {
translate([top,0,0]){

translate([0,-OutW/2+WallT+RWidth/2,0])
rotate([90,0,90])
halfslab(RWidth, OutD-(WallT*2), RHeight);

translate([0,OutW/2-WallT-RWidth/2,0])
rotate([90,180,90])
halfslab(RWidth, OutD-(WallT*2), RHeight);

translate([0,0,-OutD/2+WallT+RWidth/2])
rotate([0,180,0])
halfslab(RHeight, OutW-(WallT*2), RWidth);
}
}

// треугольный профиль w * h, d - длина
module halfslab(w,d,h) {
	translate([-w/2,-d/2,-h/2])
	polyhedron ( points = [[0, 0, h], [0, d, h], [0, d, 0], [0, 0, 0], [w, 0, h], [w, d, h]], 
		faces = [[0,3,2], [0,2,1], [3,0,4], [1,2,5], [0,5,4], [0,1,5],  [5,2,4], [4,2,3]]);
}

// подпорка под крышку
module supportcap(top) {
translate([top,0,0])rotate([0,90,0]) {
	translate([0,-(OutW/2-WallT-Swidth/2),0]) rib(OutD - WallT*2);
	translate([0,(OutW/2-WallT-Swidth/2),0]) rib(OutD - WallT*2);
	translate([OutD/2-WallT-Swidth/2,0,0]) rotate([0,0,-90]) rib(OutW - WallT*2);
}
}

// подпорка под крышку - 1 линия
module rib(len) {
	cube([len,Swidth,Sdepth],true);
}

/*module endround(x,y,w) {
	translate([-(10+OutL-WallT*4)/2,OutW/2-x,OutD/2-y]) rotate([0,90,0]) cylinder(10,w/2,w/2) ;
}*/

// решетка над разъемами
module endrect(x,y,w,d) {
	translate([-OutL/2-1,OutW/2-w-x,OutD/2-y]) rotate([0,90,0]) cube([d,w,WallT+2]) ;
}

// отверстия под болты вентилятора
module lidround(x,y,w) {
	translate([OutL-y,OutW/2-x,-1]) cylinder(WallT+2,w/2,w/2);
}

// решетка вентилятора
module lidrect(x,y,w,d) {
	translate([OutL-d-y,OutW/2-w-x,-1]) cube([d,w,WallT+2]);
}

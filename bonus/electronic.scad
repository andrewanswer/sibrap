use <../sibrap/abs/lib/halfcube.scad>

// RAMPS-электроника - гнезда для крепления
// http://blog.arduino.cc/2011/01/05/nice-drawings-of-the-arduino-uno-and-mega-2560/
// or sibrap/specs/arduino_mega_drawing.svg
// sizes in mils (0.001")

// качество цилиндров
$fn=20;
// радиус отверстий
r1=1.5;

// длина
RampsX=101.6;	
// ширина
RampsY=60.2;		
// высота
RampsZ = 2;

k = 25.4/1000;
Arduino1 = [550,100]*k;
Arduino2 = [3800,100]*k;
Arduino3 = [600,2000]*k;
Arduino4 = [3550,2000]*k;
echo(Arduino2-Arduino1,Arduino3-Arduino1);

module ramps() {
    difference() {
        cube([RampsX,RampsY,RampsZ]);
        translate([0,0,-1]) {
            translate(Arduino1)cylinder(r=r1,h=RampsZ+2);
            translate(Arduino2)cylinder(r=r1,h=RampsZ+2);
            translate(Arduino3)cylinder(r=r1,h=RampsZ+2);
        }
    }
}

// Китайский БП
// длина
x1 = 200;
// ширина
y1 = 98;
// высота
z1 = 42;
// Китайский БП - гнезда для крепления
// длина
xz1 = 120;
// ширина
yz1 = 80;
// смещение гнезд по X
dx1 = 18;
// смещение гнезд по Y
dy1 = 9;

module block12v15a() {
    difference() {
        cube([x1,y1,z1]);
        translate([dx1,dy1,-1]) {
            translate([xz1,0,0])cylinder(r=r1,h=z1+2);
            translate([xz1,yz1,0])cylinder(r=r1,h=z1+2);
            translate([0,yz1,0])cylinder(r=r1,h=z1+2);
            translate([0,0,0])cylinder(r=r1,h=z1+2);
        }
    }
}

// Компьютерный БП
// длина
x2 = 140;
// ширина
y2 = 149;
// высота
z2 = 84;
// Компьютерный БП - гнезда для крепления
// длина
xz2 = 95;
// ширина
yz2 = 135;
// смещение гнезд по X
dx2 = 9;
// смещение гнезд по Y
dy2 = 7;

module psu() {
    color([0,0.7,0,0.4])
    difference() {
        cube([x2,y2,z2]);
        translate([dx2,dy2,-1]) {
            translate([xz2,0])cylinder(r=r1,h=z2+2);
            translate([xz2,yz2])cylinder(r=r1,h=z2+2);
            translate([0,yz2])cylinder(r=r1,h=z2+2);
            translate([0,0])cylinder(r=r1,h=z2+2);
        }
    }
// cooler
color([0,0,0.7,0.4]){
    translate([x2-24,10,(z2-80)/2])cube([25,80,80]);
// switch
translate([x2-24,110,15])cube([25,20,15]);
// plug
translate([x2-24,95,15+15+20])cube([25,50,21]);
}
}

int1_dx1=42;
int1_dy1=65;
int1_dx2=47;
int1_dx3=72;
int1_dy3=28;

int2_dx1=60;
int2_dy1=30;
int2_dy2=34;

module two_treug(a,b,dx,dy) {
            halfcube([a,b,3],"z");
            translate([a+dx,b+dy,0])rotate([0,0,180])halfcube([a,b,3],"z");
}
module int1() {
    difference() {
        translate([0,(y1-y2)/2,0])cube([x2+5,y2,2]);
        // block12v15a
        translate([dx1,dy1,-1]) {
            translate([xz1,0])cylinder(r=r1,h=z1+2);
            translate([xz1,yz1])cylinder(r=r1,h=z1+2);
            translate([0,yz1])cylinder(r=r1,h=z1+2);
            translate([0,0])cylinder(r=r1,h=z1+2);
        }
        translate([x2,y2+(y1-y2)/2,0])rotate([0,0,180])
        // psu
        translate([dx2,dy2,-1]) {
            translate([xz2,0])cylinder(r=r1,h=z2+2);
            translate([xz2,yz2])cylinder(r=r1,h=z2+2);
            translate([0,yz2])cylinder(r=r1,h=z2+2);
            translate([0,0])cylinder(r=r1,h=z2+2);
        }
        // treug
        translate([5,13,-0.5])
            for(i=[0:2]) {
                translate([i*int1_dx2,0,0])two_treug(int1_dx1,int1_dy1,0,7);
            }
        translate([42,-20,-0.5])two_treug(int1_dx3,int1_dy3,10,0);
        translate([42,90,-0.5])two_treug(int1_dx3,int1_dy3,10,0);
    }
}

module int2() {
    difference() {
        translate([30,(y1-y2)/2+3,0])cube([x2-33,y2-6,2]);
        // ramps
        translate([RampsX+30,RampsY+45,0])rotate([0,0,180])
        translate([0,0,-1]) {
            translate(Arduino1)cylinder(r=r1,h=RampsZ+2);
            translate(Arduino2)cylinder(r=r1,h=RampsZ+2);
            translate(Arduino3)cylinder(r=r1,h=RampsZ+2);
        }
        translate([x2,y2+(y1-y2)/2,0])rotate([0,0,180])
        // psu
        translate([dx2,dy2,-1]) {
            translate([xz2,0])cylinder(r=r1,h=z2+2);
            translate([xz2,yz2])cylinder(r=r1,h=z2+2);
            translate([0,yz2])cylinder(r=r1,h=z2+2);
            translate([0,0])cylinder(r=r1,h=z2+2);
        }
        // treug
        for(i=[0:3]) {
            translate([42,-18+int2_dy2*i,-0.5])two_treug(int2_dx1,int2_dy1,10,0);
        }
    }
}

module current() {
    block12v15a();
    color([0,0.7,0,0.4])translate([abs(dx1-dx2),(y1-y2)-abs(dy1-dy2),z1+20])psu();
    color([0.7,0,0])translate([RampsX+30,RampsY+20,z1+z2+40])rotate([0,0,180])ramps();
}

module interfaced() {
    block12v15a();
    color([0.2,0.2,0.2,1.0])translate([0,0,z1+10])int1();
    translate([x2,y2+(y1-y2)/2,z1+20])rotate([0,0,180])psu();
    color([0.2,0.2,0.2,1.0])translate([0,0,z1+z2+30])int2();
    color([0.7,0,0])translate([RampsX+30,RampsY+45,z1+z2+40])rotate([0,0,180])ramps();
}

//current();
interfaced();

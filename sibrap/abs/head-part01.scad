include <config.scad>
use <lib/halfcube.scad>
use <head-part06.scad>
use <../../dimensions/dim.scad>

/* ПАРАМЕТРЫ */
// габариты
x=90;
y=75;
z=18;

// расстояние между соседними креплениями подшипников
x1=38;
y1=15.5;
y2=10;
x3=25;
y3=23;
d0=8.5;
// отверстие под подшипник
d1=15.4;
// отверстие под направляющие
d9=9; 
// отверстия М3
d2=3.1;
x4=(x-x1)/2;
dz=31;
x5=15;
y5=22;
x6=x5+37;
d3=14;
// диаметр подшипников
d4=22.3;
v=8;
// канавка ремня, внешний диаметр
d5=16; 
d5_new=16-0.5; 
d6=8;
dz2=6;
z6=(z-v)/2;
y6=5;
// толщина задней опорной стенки подшипника
xx1=2; 

/* РАЗМЕРЫ */
/*DOC_HEIGHT = 0;

color("Black")
translate([0, 0, DOC_HEIGHT])
union() {
    // X top
    //translate([(x1-x3)/2,0,0])
    //dim(x3,y1,2,0);

    // X bottom
    dim(-x,0,-2,0);
    translate([-(x-x1)/2,0,0])
    dim(-x1,0,-1,0);
    //translate([(x1-x3)/2,0,0])
    //dim(x,0,-2,0);
    //translate([(x1-x4)/2,0,0])
    //dim(x4,0,-1,0);
    //translate([-x6,0,0])
    //dim(x6,0,-1,0);

    // Y right
    translate([0,y,0])
    dim(y,0,2,-90);
    translate([0,y1,0])
    dim(y1,0,1,-90);
    //translate([(x1+x5)/2,y1,0])
    //dim(y5,0,1,-90);

    // Y left
    //dim(y1,0,1,90);
    //translate([(x1-x4)/2,0,0])
    //dim(y2,0,1,90);
}*/


/* МОДУЛИ */
// болты М3
module bolt(h) {
    union() {
        translate([0,0,-1]) cylinder(4,r=3.2);
        translate([0,0,4]) cylinder(h-2,r=d2/2);
    }
}


// зажим LM8UU на винтах
module Zazhim() {
    translate([13,0.8,-0.5]) cylinder(3,r=6.45/2);
    translate([13,0.8,3.5]) cylinder(3,r=3/2);
    translate([13,0.8,15.5])cylinder(4,r=6.45/2,$fn=6);
    translate([13,0.8,14]) cylinder(4,r=3/2);
}

// Ушки вокруг зажимов
module Ushki() {
    translate([13,0.8,-0]) cylinder(18,r=10/2);
}


// Канавка под ремень
module belt() {
	union() {
		difference() {
			translate([1,0,z6])
			union() {
				cylinder(v,r=d5/2);
				translate([-d5/2,-d5/2,0]) cube([d5/2,d5,v]);
			}
			translate([1,0,z6])
			union() {
				cylinder(v,r=d6/2);
				translate([-d6/2,-d6/2,0]) cube([d6/2,d6,v]);
			}
		}
		//translate([7,0,0]) bolt(z/2);
	}
}


// Канавка под ремень с натяжителем
module beltNew() {
	union() {
		difference() {
			translate([1,0,z6])
			union() {
				cylinder(v,r=d5_new/2);
				translate([-d5_new/2,-d5_new/2,0]) cube([d5_new/2,d5_new,v]);
			}
			//translate([1,0,z6])
			//union() {
//				cylinder(v,r=d6/2,$fn=30);
//				translate([-d6/2,-d6/2,0]) cube([d6/2,d6,v]);
			//}
		}
		translate([1,0,0]) bolt(z/2);
		translate([1,0,10]) bolt(z/2);
		translate([1,0,15]) cylinder(4,r=6.45/2);
	}
}

// Ушко с отверстием
module ushko() {
    difference() {
        Ushki();
        Zazhim();
        // вырезы в креплениях подшипников
        translate([-xx1+3,-6,5]) cube([24,y1,8]);
        // отверстия подшипников LM8UU
        translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+0.5-xx1,r=d1/2);
    }
}

/* ДЕТАЛЬ */
module main() {
//freecad positioning
//translate([24.5,-32,0])rotate([-90,180,0])
    // треугольные вставки у двигателя
    translate([90,16,14]) rotate([0,0,90]) halfcube([4,4,4],"z");
    translate([90,55+4,14]) rotate([0,0,180]) halfcube([4,4,4],"z");
    // ушки у LM8UU
    translate([0,0,0]) ushko();
    translate([64,0,0]) ushko();
    translate([64+26,73.4+1.6,0]) rotate([0,0,180]) ushko();
    translate([0+26,73.4+1.6,0]) rotate([0,0,180]) ushko();

    // чтобы не отлипало
    translate([0,0,0]) cylinder(r=5,h=1);
    translate([x,0,0]) cylinder(r=5,h=1);
    translate([0,y,0]) cylinder(r=5,h=1);
    translate([x,y,0]) cylinder(r=5,h=1);
difference() {
    cube([x,y,z]);
    // сечение
	//translate([-1,-1,9])cube([x+2,y+2,z]);
	//translate([-x/2,-y/2,-1])cube([x+2,y+2,z]);

    // отверстия подшипников LM8UU
    translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+0.5-xx1,r=d1/2);
    translate([x-x4+xx1,y2,z/2]) rotate([0,90,0]) cylinder(x4,r=d1/2);
    translate([-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+0.5-xx1,r=d1/2);
    translate([x-x4+xx1,y-y2,z/2]) rotate([0,90,0]) cylinder(x4,r=d1/2);


    // отверстия под направляющие
    translate([-1-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d9/2);
    translate([x-x4+1-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d9/2);
    translate([-1-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d9/2);
    translate([x-x4+1-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x4+1,r=d9/2);

	// shaft holes
	//translate([-0.5,y2,z/2]) rotate([0,90,0]) cylinder(x+1,r=d0/2,$fn=40);
	//translate([-0.5,y-y2,z/2]) rotate([0,90,0]) cylinder(x+1,r=d0/2,$fn=40);

    // пазы между креплениями подшипников
    translate([(x-x1)/2,1,-1]) cube([x1,y1-2,z+2]);
    translate([(x-x1)/2,y-y1+1,-1]) cube([x1,y1-2,z+2]);

    // вырезы в креплениях подшипников
    translate([-xx1-0.5+6,-6,5]) cube([28-6,y1,8]);
    translate([-xx1-0.5+6,y-y1+6,5]) cube([28-6,y1,8]);
    translate([62+xx1+0.5,-6,5]) cube([28-6,y1,8]);
    translate([62+xx1+0.5,y-y1+6,5]) cube([28-6,y1,8]);

	// канавка под ремень по всей длине
	translate([-1,24,z6]) cube([x+2,y6,v]);
    // смещаем углубление внутрь на 3 мм под шпулю
	translate([3+3,43,0]) beltNew();
	translate([x-2,43,0]) mirror([1,0,0]) belt();

    // 3 отверстия крепления головки
	translate([x5-2,y5,0]) bolt(z);
	//translate([x5-1,y5+dz,0]) bolt(z);
	translate([x5+26,y5,0]) bolt(z);
	translate([x5+26,y5+dz,0]) bolt(z);

	// 4 отверстия крепления мотора
	translate([x6,y5,0]) bolt(z);
	translate([x6,y5+dz,0]) bolt(z);
	translate([x6+dz,y5,0]) bolt(z);
	translate([x6+dz,y5+dz,0]) bolt(z);

	// гнездо под мотор
    //dz0=4;
    dz0=3;
    translate([x6-dz2,y5-dz2,z-dz0]) cube([2*dz2+dz+2,2*dz2+dz,5]);
	translate([x6+dz/2-d4/2,y5+dz/2-d4/2-2,z6]) cube([d4,d4/2+2,z]);
	translate([x6+dz/2,y5+dz/2,-1]) cylinder(z+2,r=d4/2);

	// гнезда под подшипники и болт подачи
	translate([x-61,41,-1-0.5]) cylinder(9,r=d4/2);
	translate([x-61,41,8]) cylinder(10,r=13/2);
	translate([x-61,41,z-2]) cylinder(9,r=d4/2);
    
    // зажимы LM8UU
    translate([0,0,0]) Zazhim();
    translate([64,0,0]) Zazhim();
    translate([64,73.4,0]) Zazhim();
    translate([0,73.4,0]) Zazhim();
}

// зубцы в канавке ремня
render() difference() {
    translate([x-3,y/2+5.5,z/2-4])
    union() {head_part06();
    translate([0,0,0.5])head_part06();
    cylinder(r=5,h=10-0.1);
    }
    translate([x+7,y/2+5.5,z/2])cube(14,true);
}
}


//main();
/* ПЕЧАТЬ */
module head_part01() {
    mirror([1,0,0]) main();
}

head_part01();

include <frame0-config.scad>

// Рама для 3д-принтера SibRap
// под любую толщину оргстекла
// Генерируются чертежи в dxf-формате
// Для установки толщины отредактируйте файл frame0-config.scad

// габаритные размеры
// длина
x1 = 412;
// ширина
y1 = 76;

// диаметр отверстий под винты M3
d1 = 3;

// крепление двигателя NEMA17
// расстояние между отверстиями
dx = 31;
// расстояние от края до отверстий
x2 = 12.5;
// диаметр отверстия под посадку
d2 = 24;
// вырез под винты - ширина
x21 = d2/2;

// вырез под крепление направляющей Z
// длина
x3 = 8;
// ширина
y3 = 30;

// вырез под раму
// длина
x4 = dh;
// ширина
y4 = 16;
// расстояние между осями вырезов по горизонтали
dx4 = 290+dh;
// диаметр отверстия под винт М5
d4 = 5;

module frame2_cut(d1,d4) {
    // крепление двигателя NEMA17
    translate([x2,(y1-dx)/2,0]) {
        cylinder(r=d1/2,h=dh,$fn=fn2);
        translate([dx,0,0])cylinder(r=d1/2,h=dh,$fn=fn2);
        translate([0,dx,0])cylinder(r=d1/2,h=dh,$fn=fn2);
        translate([dx,dx,0])cylinder(r=d1/2,h=dh,$fn=fn2);
        translate([dx/2,dx/2,0])cylinder(r=d2/2,h=dh);
        translate([(dx-x21)/2,dx/2,dh/2])cube([x21,d2,dh],true);
    }
    // вырез под крепление направляющей Z
    translate([0,(y1-dx)/2,0])cube([x3,y3,dh]);
    // вырез под раму
    translate([(x1-dx4)/2,0,0])cube([x4,y4,dh]);
    translate([(x1-dx4)/2,y1-y4,0])cube([x4,y4,dh]);
    // отверстие под винт
    translate([(x1-dx4+dh)/2,y1/2,0])cylinder(r=d4/2,h=dh);
}


module frame2_main(d1,d4) {
    difference() {
        cube([x1,y1,dh]);
        frame2_cut(d1,d4);
        translate([x1,0,0]) mirror([1,0,0]) frame2_cut(d1,d4);
    }
}

module frame2_laser() {
    d1_ = d1 < D_MIN ? 1 : d1;
    d4_ = d4 < D_MIN ? 1 : d4;
    frame2_main(d1_,d4_);
}

//projection() main(d1,d4);
projection() frame2_laser();

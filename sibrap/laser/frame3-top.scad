include <frame0-config.scad>

// Рама для 3д-принтера SibRap
// под любую толщину оргстекла
// Генерируются чертежи в dxf-формате
// Для установки толщины отредактируйте файл frame0-config.scad

// габаритные размеры
// длина
x1 = 442;
// ширина
y1 = 40;
echo(str("Габариты: ",x1," x ",y1));

// крепление направляющей Z
// диаметр отверстий под винты M5
d1 = 5;
// отступ от края
dx1 = 7;
// расстояние между отверстиями
dx11 = 16;

// вырез под раму
// длина
x2 = dh;
// ширина
y2 = 20;
// расстояние между осями вырезов по горизонтали
dx2 = 290+dh;

module frame3_cut(d1) {
    // крепление направляющей Z
    translate([dx1,y1/2,0])cylinder(r=d1/2,h=dh,$fn=fn2);
    translate([dx1+dx11,y1/2,0])cylinder(r=d1/2,h=dh,$fn=fn2);
    // вырез под раму
    translate([(x1-dx2)/2,0,0])cube([x2,y2,dh]);
}


module frame3_main(d1) {
    difference() {
        cube([x1,y1,dh]);
        frame3_cut(d1);
        translate([x1,0,0]) mirror([1,0,0]) frame3_cut(d1);
    }
}

module frame3_laser() {
    d1_ = d1 < D_MIN ? 1 : d1;
    frame3_main(d1_);
}

//projection() main(d1);
projection() frame3_laser();

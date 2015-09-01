include <config.scad>

// радиус скругления внизу
r1=1.5;
// габаритный радиус
r2=9.5;
// радиус вверху
r3=6.9;
// радиус мелких сфер
r4=r2-r3-0.1;
// высота гладкой части снизу
h1=9;
// габаритная высота
h2=20;

module head_part08() {
difference() {
    // боковая поверхность и скругление внизу
    rotate_extrude($fn=fn*5)translate([r1,r1,0])
        offset(r=r1,$fn=fn)square([r2-2*r1,h2-2*r1-DELTA]);
    // гайка внутри
    translate([0,0,-DELTA])rotate([0,0,90])cylinder(r=7.9,h=7+DELTA,$fn=6);
    // глухое отверстие внутри
    cylinder(r=4+DELTA,h=18,$fn=fn*2);
    // обрезание гладкой части
    translate([0,0,h1])cylinder(r=r2+DELTA,h=h2-h1,$fn=fn*5);
}

difference() {
    // верхний цилиндр
    translate([0,0,h1])cylinder(r=r3+DELTA,h=h2-h1,$fn=fn*5);
    // глухое отверстие внутри
    cylinder(r=4+DELTA,h=18,$fn=fn*2);
}

// мелкие сферы и боковые цилиндры
for(i=[0:9]) 
rotate([0,0,36*i]){
    translate([0,r2-r4,h1])cylinder(r=r4,h=h2-h1-r4+0.5+DELTA,$fn=fn*2);
    translate([0,r2-r4,h2-r4+0.5])scale([1,1,0.8])sphere(r=r4,$fn=fn*2);
}
}

head_part08();

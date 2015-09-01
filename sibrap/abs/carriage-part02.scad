use <carriage-part01.scad>
module carriage_part02() {
    mirror([0,1,0]) carriage_part01();
}

carriage_part02();

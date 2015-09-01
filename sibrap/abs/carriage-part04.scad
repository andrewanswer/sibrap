use <carriage-part03.scad>
module carriage_part04() {
    mirror([0,1,0]) carriage_part03();
}

carriage_part04();

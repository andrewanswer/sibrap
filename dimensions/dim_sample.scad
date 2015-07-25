include <dim.scad>

DIM_SPACE=10;

module test(x,y,z) {
    dim(x*x1,y*y1,2,z);
    dim(x*x2,y*y1,1,z);
    dim(x*x1,y*y1,0,z);
    dim(x*x2,y*y1,-1,z);
    dim(x*x1,y*y1,-2,z);
}

color("Black")
translate([0, 0, DOC_HEIGHT])
union() {
// normal
    // X 0
    test(1,0,0);
    // X y1
    test(1,1,0);
    // X -y1
    test(1,-1,0);

    // -X 0
    test(-1,0,0);
    // -X y1
    test(-1,1,0);
    // -X -y1
    test(-1,-1,0);

// left (90)
    // Y 0
    test(1,0,90);
    // Y y1
    test(1,1,90);
    // Y -y1
    test(1,-1,90);

    // -Y 0
    test(-1,0,90);
    // -Y y1
    test(-1,1,90);
    // -Y -y1
    test(-1,-1,90);

// right (-90)
    // Y 0
    test(1,0,-90);
    // Y y1
    test(1,1,-90);
    // Y -y1
    test(1,-1,-90);

    // -Y 0
    test(-1,0,-90);
    // -Y y1
    test(-1,1,-90);
    // -Y -y1
    test(-1,-1,-90);

// upside down (180)
    // X 0
    test(1,0,180);
    // X y1
    test(1,1,180);
    // X -y1
    test(1,-1,180);

    // -X 0
    test(-1,0,180);
    // -X y1
    test(-1,1,180);
    // -X -y1
    test(-1,-1,180);

}

x1=100;
y1=100;
x2=80;

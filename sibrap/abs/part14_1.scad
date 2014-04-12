//square ([20,20],center =true);

// inkscape
//import(file="111.dxf", layer="Layer_1", origin = [0,0], scale = 1);
//translate([-10,-225,0]) linear_extrude(file = "part15_1.dxf", layer = "0", height = 10, center = true, convexity = 10, twist = -0);

// corel
//import(file="part15_1_corel.dxf", layer="LAYER_1", origin = [0,0], scale = 1);
//translate([-10,-225,0]) linear_extrude(file = "part15_1.dxf", layer = "LAYER_1", height = 10, center = true, convexity = 10, twist = -0);

// старый вариант
//linear_extrude(height = 8, center = false, convexity = 10, twist = 0)
//import(file="part15_11.dxf", layer="Layer_1", origin = [0,0], scale = 1);

a=12;//8
b=30;//16
//translate([0,0,8])
difference () {
	union(){
	translate([5,0,0]) cube([40,61,8]);
	translate([0,12,0])cube ([20,37,8]);
	translate([35,8.5,0])cube ([59,44,8]);
	}
translate ([72.1,30.6,-1]) cylinder (18,r=23/2,$fn=b);
translate ([87.6,15.1,-1])cylinder (18,r=3/2,$fn=a);
translate ([87.6-31,15.1,-1])cylinder (18,r=3/2,$fn=a);
translate ([87.6,15.1+31,-1])cylinder (18,r=3/2,$fn=a);
translate ([87.6-31,15.1+31,-1])cylinder (18,r=3/2,$fn=a);
translate ([45,8,-1]) cube ([5,4,10]);
translate ([45,49,-1]) cube ([5,4,10]);
}

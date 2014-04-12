/*translate([-25,-30.5,0])
linear_extrude(height = 8, center = false, convexity = 10, twist = 0)
import(file="part15_22.dxf", layer="Layer_1", origin = [0,0], scale = 1);
*/

difference() {
translate([0,0,4])
union(){
cube([40,61,8],true);
cube([50,37,8],true);
}
translate([0,0,-1])cylinder(10,r=4);
}
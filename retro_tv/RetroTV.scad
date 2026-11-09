// Retro TV v0.5: 3 printed parts, no hardware. Units mm.
part="assembly"; // body, lid, stand, assembly
// Assumed PCB thickness 1.6; four posts stop at z=4.7 (0.1 mm play).
module body(){difference(){union(){
translate([-38.5, -21, 0]) cube([82.0, 42, 22]);
}
translate([-23, -13, -1]) cube([51, 26, 3]);
translate([-30.2, -15.2, 1.4]) cube([60.4, 30.4, 2.6]);
translate([-32.85, -15.6, 3]) cube([65.7, 31.2, 4]);
translate([-36.5, -19, 6]) cube([73.0, 38, 18]);
translate([-36.5, -9.5, 1.4]) cube([6.7, 19.0, 22.0]);
translate([-40, -7, 8]) cube([10, 14, 12]);
translate([32, -7, 8]) cube([13, 14, 12]);
translate([-4.3, -22, 11.8]) cube([8.6, 3.2, 2.5]);
translate([-4.3, 18.8, 11.8]) cube([8.6, 3.2, 2.5]);
translate([35.5, -2, -1]) cube([6.0, 0.8, 1.7]);
translate([35.5, 3.2, -1]) cube([6.0, 0.8, 1.7]);
translate([35.5, -1.2000000000000002, -1]) cube([0.8, 4.4, 1.7]);
translate([40.7, -1.2000000000000002, -1]) cube([0.8, 4.4, 1.7]);
translate([38.2, -0.5, -1]) cube([0.6, 3.0, 1.7]);
translate([35.5, 7, -1]) cube([6.0, 0.8, 1.7]);
translate([35.5, 12.2, -1]) cube([6.0, 0.8, 1.7]);
translate([35.5, 7.8, -1]) cube([0.8, 4.4, 1.7]);
translate([40.7, 7.8, -1]) cube([0.8, 4.4, 1.7]);
translate([38.2, 8.5, -1]) cube([0.6, 3.0, 1.7]);
translate([37.2, -14, -1]) cube([4.5, 1, 1.8]);
translate([37.2, -11, -1]) cube([4.5, 1, 1.8]);
translate([37.2, -8, -1]) cube([4.5, 1, 1.8]);
}}
module lid_base_assembled(){difference(){union(){
translate([-38.5, -21, 22]) cube([82.0, 42, 2]);
translate([-36.2, -18.7, 20]) cube([1.5, 37.4, 2]);
translate([34.7, -18.7, 20]) cube([1.5, 37.4, 2]);
translate([-34.7, -18.7, 20]) cube([29.7, 1.5, 2]);
translate([-34.7, 17.2, 20]) cube([29.7, 1.5, 2]);
translate([5, -18.7, 20]) cube([29.7, 1.5, 2]);
translate([5, 17.2, 20]) cube([29.7, 1.5, 2]);
translate([-4, -18.6, 12]) cube([8, 0.8, 10]);
translate([-4, 17.8, 12]) cube([8, 0.8, 10]);
translate([-32.4, -13, 4.7]) cube([2.0, 2.5, 17.3]);
translate([-32.4, 10.5, 4.7]) cube([2.0, 2.5, 17.3]);
translate([30.4, -13, 4.7]) cube([2.0, 2.5, 17.3]);
translate([30.4, 10.5, 4.7]) cube([2.0, 2.5, 17.3]);
}

}}
module stand(){difference(){union(){
translate([-43, -22, 0]) cube([86, 44, 3]);
translate([-28, -14.8, 3]) cube([56, 29.6, 8]);
}
translate([-29, -12.3, 7]) cube([58, 24.6, 6]);
}}
module nose(){translate([-4,0,0])rotate([90,0,90])linear_extrude(height=8)polygon([[18.6,12],[19.5,13],[19.5,14],[18.6,14]]);}
module lid_assembled(){union(){lid_base_assembled();nose();mirror([0,1,0])nose();}}
module lid(){translate([0,0,24])mirror([0,0,1])lid_assembled();}
if(part=="body")body();if(part=="lid")lid();if(part=="stand")stand();if(part=="assembly"){color("BurlyWood")body();color("Teal"){lid_assembled();multmatrix([[1,0,0,2.5],[0,0,1,-28],[0,1,0,12],[0,0,0,1]])stand();}}

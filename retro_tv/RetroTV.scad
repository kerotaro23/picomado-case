// Compact Retro TV v0.4. mm. Estimated fit; see README.
part="assembly"; // body, lid, retainer, stand, knob, assembly
$fn=48;
// Board 65x30.5, thickness assumed 1.6. Window center x=+2.5.
// Left FPC relief reaches x=-36.5 (4 mm beyond board), y=+-9.5.
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
translate([37.2, -14, -1]) cube([4.5, 1, 1.8]);
translate([37.2, -11, -1]) cube([4.5, 1, 1.8]);
translate([37.2, -8, -1]) cube([4.5, 1, 1.8]);
translate([-35.1, -17.8, -1]) cube([2.2, 2.2, 25]);
translate([-35.1, 15.6, -1]) cube([2.2, 2.2, 25]);
translate([32.9, -17.8, -1]) cube([2.2, 2.2, 25]);
translate([32.9, 15.6, -1]) cube([2.2, 2.2, 25]);
}}
module lid(){difference(){union(){
translate([-38.5, -21, 0]) cube([82.0, 42, 2]);
translate([-36.2, -18.7, 2]) cube([72.4, 37.4, 2]);
}
translate([-34.7, -17.2, 2]) cube([69.4, 34.4, 3]);
}}
module retainer_assembled(){difference(){union(){
translate([-35.8, -18.6, 6]) cube([71.6, 37.2, 2]);
translate([-32.4, -13, 4.9]) cube([2.0, 2.5, 1.1]);
translate([-32.4, 10.5, 4.9]) cube([2.0, 2.5, 1.1]);
translate([30.4, -13, 4.9]) cube([2.0, 2.5, 1.1]);
translate([30.4, 10.5, 4.9]) cube([2.0, 2.5, 1.1]);
}
translate([-30.4, -13.5, 4]) cube([60.8, 27.0, 5]);
translate([-37, -9.5, 4]) cube([8, 19.0, 5]);
translate([-35.1, -17.8, 4]) cube([2.2, 2.2, 5]);
translate([-35.1, 15.6, 4]) cube([2.2, 2.2, 5]);
translate([32.9, -17.8, 4]) cube([2.2, 2.2, 5]);
translate([32.9, 15.6, 4]) cube([2.2, 2.2, 5]);
}}
module stand(){difference(){union(){
translate([-43, -22, 0]) cube([86, 44, 3]);
translate([-28, -14.8, 3]) cube([56, 29.6, 8]);
}
translate([-29, -12.3, 7]) cube([58, 24.6, 6]);
}}
module retainer(){translate([0,0,8])mirror([0,0,1])retainer_assembled();}
module knob(){rotate_extrude()polygon([[0,0],[2.7,0],[3.2,.5],[3.2,2.5],[2.7,3],[0,3]]);}
if(part=="body")body(); if(part=="lid")lid(); if(part=="retainer")retainer(); if(part=="stand")stand(); if(part=="knob")knob();
if(part=="assembly"){color("BurlyWood")body(); color("Teal"){translate([0,0,24])mirror([0,0,1])lid();for(y=[1,10])translate([38.5,y,0])mirror([0,0,1])knob();multmatrix([[1,0,0,2.5],[0,0,1,-28],[0,1,0,12],[0,0,0,1]])stand();}color("Orange")retainer_assembled();}

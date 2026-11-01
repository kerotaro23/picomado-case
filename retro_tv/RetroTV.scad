// PicoMado Little Retro TV, fit-test v0.2. All dimensions in mm.
part="assembly"; // body, lid, stand, knob, assembly, layout
$fn=64;
pcb_w=65; pcb_h=30.5; pcb_clearance=.4;
window_w=60.4; window_h=30.4; window_x=0; window_y=0;
lid_clearance=.25;
stand_clearance=.3; // each side along depth
module box(x,y,z,w,h,d){translate([x,y,z])cube([w,h,d]);}
module body(){
 difference(){
  box(-39,-22,0,88,44,26);
  box(window_x-window_w/2,window_y-window_h/2,-1,window_w,window_h,4);
  box(-pcb_w/2-pcb_clearance,-pcb_h/2-pcb_clearance,2,pcb_w+2*pcb_clearance,pcb_h+2*pcb_clearance,4);
  box(-35,-18,5,70,36,23);
  box(37,-18,5,10,36,23);
  box(-40,-7,6,8,14,18);
  box(32,-7,6,18,14,18);
  for(y=[-14,-11,-8])box(38,y,-1,8,1,2);
 }
}
module lid(){
 difference(){
  union(){
   box(-39,-22,0,88,44,2);
   box(-35+lid_clearance,-18+lid_clearance,2,70-2*lid_clearance,36-2*lid_clearance,3);
  }
  box(-33.5+lid_clearance,-16.5+lid_clearance,2,67-2*lid_clearance,33-2*lid_clearance,4);
 }
}
module stand(){
 difference(){
  union(){
   box(-45,-26,0,90,52,4);
   box(-12,-9,4,24,18,12);
   box(-29,-16.3,16,58,32.6,7);
  }
  box(-30,-14-stand_clearance,19,60,28+2*stand_clearance,5);
 }
}
module knob(){
 rotate_extrude() polygon([[0,0],[4,0],[4.6,.6],[4.6,2.6],[4,3.2],[0,3.2]]);
}
module assembly(){
 color([.87,.62,.39])body();
 color([.27,.36,.36]){
  translate([0,0,28])mirror([0,0,1])lid();
  for(y=[0,11])translate([42,y,0])mirror([0,0,1])knob();
  // Map print Z upward along case Y; centered beneath housing.
  multmatrix([[1,0,0,5],[0,0,1,-41],[0,1,0,14],[0,0,0,1]])stand();
 }
}
if(part=="body")body();
if(part=="lid")lid();
if(part=="stand")stand();
if(part=="knob")knob();
if(part=="assembly")assembly();
if(part=="layout"){
 body();translate([0,54,0])lid();translate([105,0,0])stand();
 translate([70,48,0])knob();translate([84,48,0])knob();
}

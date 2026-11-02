// PicoMado Soft Frame. Millimetres. Physical fit unverified.
part="assembly"; // body, lid, stand, assembly, layout
$fn=64;
pcb_w=65; pcb_h=30.5; pcb_clearance=.4;
window_w=60.4; window_h=30.4; window_x=0; window_y=0;
lid_clearance=.25;
module rect(w,h,z,d){translate([-w/2,-h/2,z])cube([w,h,d]);}
module rounded(w,h,r,z,d){translate([0,0,z])linear_extrude(d)offset(r=r)square([w-2*r,h-2*r],center=true);}
module body(){difference(){
 rounded(82,48,6,0,26);
 translate([window_x,window_y,0])rect(window_w,window_h,-1,4);
 rect(pcb_w+2*pcb_clearance,pcb_h+2*pcb_clearance,2,4);
 rect(70,36,5,28);
 for(s=[-1,1])translate([s*39,0,0])rect(12,14,6,18);
}}
module lid(){difference(){union(){
 rounded(82,48,6,0,2);
 rect(70-2*lid_clearance,36-2*lid_clearance,2,3);
}rect(67-2*lid_clearance,33-2*lid_clearance,2,4);}}
// Broad separate cradle; 28.6 mm slot for 28 mm assembled case.
module cradle(){difference(){rounded(74,46,5,0,9);rect(84,28.6,4,8);}}
module assembly(){
 color([.89,.85,.74])body();
 color([.28,.40,.35])translate([0,0,28])mirror([0,0,1])lid();
 color([.28,.40,.35])multmatrix([[1,0,0,0],[0,0,1,-28],[0,1,0,14],[0,0,0,1]])cradle();
}
if(part=="body")body();
if(part=="lid")lid();
if(part=="stand")cradle();
if(part=="assembly")assembly();
if(part=="layout"){body();translate([0,58,0])lid();translate([92,0,0])cradle();}

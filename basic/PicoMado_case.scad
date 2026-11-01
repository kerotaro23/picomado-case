// PicoMado / Waveshare 19406 + Raspberry Pi Pico W
// Fit-test prototype. Units mm. No physical fit verification.
// Select body, lid, layout or assembly. STL files use identical rectangular geometry.
part = "layout";
pcb_w = 65;
pcb_h = 30.5;
pcb_clearance = 0.4; // each side
outer_w = 74;
outer_h = 40;
body_depth = 26;
wall = 2;
front_t = 2;
guide_depth = 3;
window_w = 60.4; // exposes entire glass outline, not just active pixels
window_h = 30.4;
window_x = 0; // adjust after checking actual glass placement
window_y = 0;
usb_w = 14;
usb_front_z = 6;
usb_back_z = 24;
lid_t = 2;
lip_h = 3;
lip_wall = 1.5;
lid_clearance = 0.25; // each side; alignment fit, not a snap latch

module rect(w,h,z0,d) { translate([-w/2,-h/2,z0]) cube([w,h,d]); }
module body() {
    difference() {
        rect(outer_w,outer_h,0,body_depth);
        translate([window_x,window_y,0]) rect(window_w,window_h,-1,front_t+2);
        rect(pcb_w+2*pcb_clearance,pcb_h+2*pcb_clearance,front_t,guide_depth+1);
        rect(outer_w-2*wall,outer_h-2*wall,front_t+guide_depth,body_depth);
        for (s=[-1,1]) translate([s*(outer_w/2-2),0,0])
            rect(6,usb_w,usb_front_z,usb_back_z-usb_front_z);
    }
}
module lid() {
    difference() {
        union() {
            rect(outer_w,outer_h,0,lid_t);
            rect(outer_w-2*wall-2*lid_clearance,outer_h-2*wall-2*lid_clearance,lid_t,lip_h);
        }
        rect(outer_w-2*wall-2*lid_clearance-2*lip_wall,outer_h-2*wall-2*lid_clearance-2*lip_wall,lid_t,lip_h+1);
    }
}
if(part=="body") body();
if(part=="lid") lid();
if(part=="layout") { body(); translate([0,outer_h+10,0]) lid(); }
if(part=="assembly") {
    color("SteelBlue") body();
    color("Tan") translate([0,0,body_depth+lid_t]) mirror([0,0,1]) lid();
}

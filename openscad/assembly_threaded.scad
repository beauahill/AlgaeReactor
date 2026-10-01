use <printed_body.scad>
use <deck_plate.scad>
use <lid.scad>
use <lib.scad>
include <params.scad>

module ring_in_place() {
    h_thread = thread_len + flange_t;
    difference() {
        cylinder(r = ring_r, h = h_thread + ring_lip);
        translate([0, 0, -0.01]) thread_solid(tube_od/2 + thread_clr, thread_depth, h_thread + 0.01);
        translate([0, 0, h_thread - 0.01]) cylinder(r = ring_lip_r, h = ring_lip + 0.02);
    }
}

module assembly_threaded(cut = true) {
    difference() {
        union() {
            color("gray") printed_body(true);
            color("white") translate([0, 0, plug_h]) deck_plate();
            color("gray") translate([0, 0, tube_len]) lid(true);
            color("orange") translate([0, 0, tube_len - thread_len]) ring_in_place();
            color("gold") translate([0, 0, plug_h + deck_t]) cylinder(d = tt_od, h = tt_len);
        }
        if (cut) translate([0, -200, -50]) cube([200, 200, 400]);
    }
}
assembly_threaded();

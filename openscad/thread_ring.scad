// Retaining ring: screws onto the printed body and clamps the lid flange. Print lip-down.
use <lib.scad>
include <params.scad>

module thread_ring() {
    h_thread = thread_len + flange_t;
    difference() {
        cylinder(r = ring_r, h = h_thread + ring_lip);
        translate([0, 0, -0.01]) thread_solid(tube_od/2 + thread_clr, thread_depth, h_thread + 0.01);
        translate([0, 0, h_thread - 0.01]) cylinder(r = ring_lip_r, h = ring_lip + 0.02);
        for (i = [0:11]) rotate(i*30) translate([ring_r + 0.5, 0, -1])
            cylinder(r = 3.5, h = h_thread + ring_lip + 2, $fn = 32);
    }
}

// print orientation: lip on the bed
translate([0, 0, thread_len + flange_t + ring_lip]) mirror([0, 0, 1]) thread_ring();

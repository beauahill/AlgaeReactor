// Retaining ring: screws onto the printed body and clamps the lid flange. Print lip-down.
use <lib.scad>
include <params.scad>

// print orientation: lip on the bed
translate([0, 0, thread_len + flange_t + ring_lip]) mirror([0, 0, 1]) thread_ring_body();

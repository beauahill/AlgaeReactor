// Bayonet retaining ring. Print lip-down (as exported).
use <lib.scad>
include <params.scad>
translate([0, 0, ring_under + ring_lip]) mirror([0, 0, 1]) bayonet_ring_body();

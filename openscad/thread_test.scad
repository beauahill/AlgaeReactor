// Thread fit coupon: a 20 mm slice of the body's threaded neck. Print this and thread_ring
// before committing to the full 210 mm body. Uses the same thread parameters.
use <lib.scad>
include <params.scad>

h = thread_len + 4;
difference() {
    union() {
        cylinder(d = tube_od, h = 4);
        translate([0, 0, 4]) thread_solid(tube_od/2, thread_depth, thread_len);
    }
    translate([0, 0, -1]) cylinder(d = tube_id, h = h + 2, $fn = 96);
}

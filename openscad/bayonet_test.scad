// Fit coupon: top 30 mm of the tube (lugs) with a stand-in lid flange on top.
// Print this with bayonet_ring first: the ring should drop on and turn 60 deg to the stop.
use <lib.scad>
include <params.scad>

intersection() {
    union() {
        cylinder(d = tube_od, h = tube_len);
        bayonet_lugs();
        translate([0, 0, tube_len]) cylinder(r = lid_narrow_flange_r, h = flange_t, $fn = 120);
    }
    translate([0, 0, tube_len - 30]) cylinder(r = 60, h = 60);
}

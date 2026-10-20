// Fit coupon: top 30 mm of the tube (lugs) + a stand-in lid flange.
// Print with bayonet_ring (and the flat lid gasket in TPU, see gasket.stl) before the full tube.
// Stack: coupon, gasket, flange disc, ring. The ring should drop on, turn ~70 deg, click and stop.
use <lib.scad>
include <params.scad>

intersection() {
    union() {
        cylinder(d = tube_od, h = tube_len);
        bayonet_lugs();
    }
    translate([0, 0, tube_len - 30]) cylinder(r = 60, h = 60);
}
// stand-in lid flange, printed beside the coupon
translate([84, 0, tube_len - 30]) cylinder(r = lid_narrow_flange_r, h = flange_t, $fn = 120);

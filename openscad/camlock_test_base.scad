// Bottom-lock fit coupon, base half: collar, tabs and plug stub on a 3 mm disc (no plenum/barb).
// The tube coupon should drop in, turn clockwise about 70 deg, tighten and stop.
use <base_camlock.scad>
include <params.scad>
translate([0, 0, 3]) intersection() {
    base_camlock();
    translate([0, 0, -3]) cylinder(r = cam_col_in + cam_col_wall + 1, h = 40);
}

// Printed tube with cam-lock lugs at BOTH ends: top lugs take the lid ring, bottom lugs
// twist into base_camlock. No silicone needed; both joints clamp a flat gasket.
use <lib.scad>
include <params.scad>

module printed_tube_v2() {
    difference() {
        union() {
            cylinder(d = tube_od, h = tube_len);
            bayonet_lugs();
            bayonet_lugs_bottom();
        }
        translate([0, 0, -1]) cylinder(d = tube_id + printed_bore_tol, h = tube_len + 2);
        // lead-in chamfer at the bottom of the bore
        translate([0, 0, -0.01]) cylinder(d1 = tube_id + printed_bore_tol + 3, d2 = tube_id + printed_bore_tol, h = 1.5);
    }
}

printed_tube_v2();

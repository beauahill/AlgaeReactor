// Plain printed tube with bayonet lugs on top. Sits on base_sealed's plug (O-ring) -
// no base junction in the tube, so the walls are continuous perimeters.
use <lib.scad>
include <params.scad>

module printed_tube() {
    difference() {
        union() {
            cylinder(d = tube_od, h = tube_len);
            bayonet_lugs();
        }
        translate([0, 0, -1]) cylinder(d = tube_id + printed_bore_tol, h = tube_len + 2);
        // lead-in chamfer at the bottom of the bore
        translate([0, 0, -0.01]) cylinder(d1 = tube_id + printed_bore_tol + 3, d2 = tube_id + printed_bore_tol, h = 1.5);
    }
}

printed_tube();

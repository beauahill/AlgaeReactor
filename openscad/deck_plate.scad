// Inlet diffuser: rests on the rim of the base plug / printed body and holds the test tube.
use <lib.scad>
include <params.scad>

module deck_plate() {
    ring_ro = tt_od/2 + 0.3 + 2;
    difference() {
        union() {
            cylinder(d = deck_od, h = deck_t);
            cylinder(r = ring_ro, h = deck_t + 10);
        }
        translate([0, 0, deck_t]) cylinder(d = tt_od + 0.6, h = 11);
        hole_rings(hole_d, ring_ro + 3.5, bore_r - 2, -0.1, deck_t + 0.2);
    }
}

deck_plate();

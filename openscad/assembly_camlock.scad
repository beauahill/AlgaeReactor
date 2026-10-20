use <base_camlock.scad>
use <printed_tube_v2.scad>
use <deck_plate.scad>
use <lid.scad>
use <lib.scad>
include <params.scad>

// Tube twisted into the base (clockwise bay_lock_rot), lid ring twisted the same again.
module assembly_camlock(cut = true) {
    difference() {
        union() {
            color("gray") base_camlock();
            color("lightblue") translate([0, 0, lg_comp]) rotate(-bay_lock_rot) printed_tube_v2();
            color("white") translate([0, 0, plug_h]) deck_plate();
            color("gray") translate([0, 0, lg_comp + tube_len + lg_comp]) lid(true);
            color("orange") translate([0, 0, lg_comp + tube_len + bay_ring_z0]) rotate(-2*bay_lock_rot) bayonet_ring_body();
            color("gold") translate([0, 0, plug_h + deck_t]) cylinder(d = tt_od, h = tt_len);
        }
        if (cut) translate([0, -200, -50]) cube([200, 200, 400]);
    }
}
assembly_camlock();

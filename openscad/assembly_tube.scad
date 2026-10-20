use <base_acrylic.scad>
use <printed_tube.scad>
use <deck_plate.scad>
use <lid.scad>
use <lib.scad>
include <params.scad>

module assembly_tube(cut = true) {
    difference() {
        union() {
            color("gray") base_acrylic(true, false);
            color("lightblue") printed_tube();
            color("white") translate([0, 0, plug_h]) deck_plate();
            color("gray") translate([0, 0, tube_len]) lid(true);
            color("orange") translate([0, 0, tube_len + bay_ring_z0]) rotate(-60) bayonet_ring_body();
            color("gold") translate([0, 0, plug_h + deck_t]) cylinder(d = tt_od, h = tt_len);
        }
        if (cut) translate([0, -200, -50]) cube([200, 200, 400]);
    }
}
assembly_tube();

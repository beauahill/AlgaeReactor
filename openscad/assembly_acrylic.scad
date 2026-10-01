use <base_acrylic.scad>
use <deck_plate.scad>
use <lid.scad>
include <params.scad>

module assembly_acrylic(cut = true) {
    difference() {
        union() {
            color("gray") base_acrylic();
            color("white") translate([0, 0, plug_h]) deck_plate();
            color("lightblue", 0.35) difference() {
                cylinder(d = tube_od, h = tube_len);
                translate([0, 0, -1]) cylinder(d = tube_id, h = tube_len + 2);
            }
            color("gray") translate([0, 0, tube_len]) lid();
            color("gold") translate([0, 0, plug_h + deck_t]) cylinder(d = tt_od, h = tt_len);
        }
        if (cut) translate([0, -200, -50]) cube([200, 200, 400]);
    }
}
assembly_acrylic();

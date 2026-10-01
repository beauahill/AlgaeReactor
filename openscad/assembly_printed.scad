use <printed_body.scad>
use <deck_plate.scad>
use <lid.scad>
include <params.scad>

module assembly_printed(cut = true) {
    difference() {
        union() {
            color("gray") printed_body();
            color("white") translate([0, 0, plug_h]) deck_plate();
            color("gray") translate([0, 0, tube_len]) lid();
            color("gold") translate([0, 0, plug_h + deck_t]) cylinder(d = tt_od, h = tt_len);
        }
        if (cut) translate([0, -200, -50]) cube([200, 200, 400]);
    }
}
assembly_printed();

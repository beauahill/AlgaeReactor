// Base for a separate tube (purchased acrylic or the printed tube). Tube slips over the plug.
// moat: sealant groove around the tube's outer corner. rods: tie-rod holes + nut pockets.
use <lib.scad>
include <params.scad>

module base_acrylic(moat = false, rods = true) {
    difference() {
        union() {
            translate([0, 0, -base_h]) cylinder(r = flange_r, h = base_h);
            cylinder(d = plug_od, h = plug_h);
            translate([flange_r - 5, 0, -base_h/2]) rotate([0, 90, 0]) barb();
        }
        plenum_cavity();
        // O-ring groove on plug, low so the O-ring is the last thing between water and the corner
        translate([0, 0, 1]) difference() {
            cylinder(r = plug_od/2 + 1, h = groove_w);
            translate([0, 0, -1]) cylinder(r = groove_root_r, h = groove_w + 2);
        }
        // inlet bore into plenum
        translate([20, 0, -base_h/2]) rotate([0, 90, 0]) cylinder(d = barb_bore, h = flange_r + barb_len, $fn = 48);
        if (rods) rod_holes_and_pockets(-base_h, 0);
        if (moat) translate([0, 0, -moat_d]) difference() {
            cylinder(r = tube_od/2 + 0.8 + moat_w, h = moat_d + 0.01, $fn = 120);
            translate([0, 0, -1]) cylinder(r = tube_od/2 + 0.8, h = moat_d + 2, $fn = 120);
        }
    }
    // centre post supporting the deck plate
    translate([0, 0, -base_h + floor_t - 0.01]) cylinder(d = 10, h = base_h - floor_t + plug_h);
}

base_acrylic();

// Option A: base for a purchased acrylic tube. Tube slips over the plug.
use <lib.scad>
include <params.scad>

module base_acrylic() {
    difference() {
        union() {
            translate([0, 0, -base_h]) cylinder(r = flange_r, h = base_h);
            cylinder(d = plug_od, h = plug_h);
            translate([flange_r - 5, 0, -base_h/2]) rotate([0, 90, 0]) barb();
        }
        // plenum + deck seat
        translate([0, 0, -base_h + floor_t]) cylinder(r = bore_r, h = base_h + plug_h);
        // O-ring groove on plug
        translate([0, 0, 4]) difference() {
            cylinder(r = plug_od/2 + 1, h = groove_w);
            translate([0, 0, -1]) cylinder(r = groove_root_r, h = groove_w + 2);
        }
        // inlet bore into plenum
        translate([20, 0, -base_h/2]) rotate([0, 90, 0]) cylinder(d = barb_bore, h = flange_r + barb_len, $fn = 48);
        rod_holes_and_pockets(-base_h, 0);
    }
    // centre post supporting the deck plate
    translate([0, 0, -base_h + floor_t - 0.01]) cylinder(d = 10, h = base_h - floor_t + plug_h);
}

base_acrylic();

// Option B: fully printed body (tube wall + base in one piece).
// Same inside diameter as the acrylic tube so lid and deck plate are shared.
use <lib.scad>
include <params.scad>

module printed_body() {
    difference() {
        union() {
            translate([0, 0, -base_h]) cylinder(r = flange_r, h = base_h);
            cylinder(d = tube_od, h = tube_len);
            translate([flange_r - 5, 0, -base_h/2]) rotate([0, 90, 0]) barb();
        }
        translate([0, 0, -base_h + floor_t]) cylinder(r = bore_r, h = base_h + plug_h);
        translate([0, 0, plug_h]) cylinder(d = tube_id + printed_bore_tol, h = tube_len);
        translate([20, 0, -base_h/2]) rotate([0, 90, 0]) cylinder(d = barb_bore, h = flange_r + barb_len, $fn = 48);
        rod_holes_and_pockets(-base_h, 0);
    }
    translate([0, 0, -base_h + floor_t - 0.01]) cylinder(d = 10, h = base_h - floor_t + plug_h);
}

printed_body();

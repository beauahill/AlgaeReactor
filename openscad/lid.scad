// Shared lid: outlet screen + plenum + vertical outlet barb + test-tube column.
// Modelled in assembly orientation (z = 0 is the top of the tube). Plug points down.
use <lib.scad>
include <params.scad>

module lid(threaded = false) {
    fr = threaded ? lid_th_flange_r : flange_r;
    r1 = threaded ? 34 : 36;
    difference() {
        union() {
            rotate_extrude() polygon([
                [0, -plug_h], [plug_od/2, -plug_h], [plug_od/2, 0],
                [fr, 0], [fr, flange_t], [r1, flange_t],
                [r1 - (top_z - flange_t), top_z], [0, top_z]
            ]);
            translate([lid_barb_x, 0, flange_t]) barb(top_z - flange_t + 24);
        }
        // outlet plenum under a 45 degree roof
        rotate_extrude() polygon([
            [col_r, -plug_h + screen_t], [bore_r, -plug_h + screen_t],
            [bore_r, 0], [col_r, roof_h]
        ]);
        // test tube bore + O-ring groove
        translate([0, 0, -plug_h - 1]) cylinder(r = tt_bore_r, h = top_z + plug_h + 2);
        translate([0, 0, 9]) cylinder(r = tt_groove_root_r, h = tt_groove_w);
        // tube-end O-ring groove on plug
        translate([0, 0, -plug_h + 5]) difference() {
            cylinder(r = plug_od/2 + 1, h = groove_w);
            translate([0, 0, -1]) cylinder(r = groove_root_r, h = groove_w + 2);
        }
        // outlet screen holes
        hole_rings(screen_hole_d, col_r + 3, bore_r - 2, -plug_h - 0.1, screen_t + 0.2);
        // outlet bore
        translate([lid_barb_x, 0, 3]) cylinder(d = barb_bore, h = top_z + 30, $fn = 48);
        if (!threaded) rod_holes_and_pockets(0, flange_t, false);
    }
}

lid();

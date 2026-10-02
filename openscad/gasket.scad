// TPU gaskets: rounded-square section rings that drop into the O-ring grooves.
// A round section prints badly flat; this prints with no supports at 100% infill.
include <params.scad>

module gasket(id, cs, corner = 0.7) {
    rotate_extrude($fn = 180)
        translate([id/2, 0]) offset(r = corner) offset(delta = -corner) square([cs, cs]);
}

// tube-end gasket (plug groove): same ID/section as the 64 x 2.5 O-ring
module gasket_tube()     gasket(oring_id, oring_cs);
// test-tube gasket (lid column groove): same as the 24 x 2 O-ring
module gasket_testtube() gasket(tt_od - 1, tt_oring_cs);

// both on one plate: 2x tube gasket (Option A uses two), 1x test tube gasket
translate([-40, 0, 0]) gasket_tube();
translate([ 40, 0, 0]) gasket_tube();
translate([  0, 0, 0]) gasket_testtube();

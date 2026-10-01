// Triangular core for LED strip: one strip per face, slides into the test tube.
include <params.scad>

spine_len   = tt_len - 15;
spine_r     = 10.2;     // vertex radius (test tube ID is ~22)
module led_spine() {
    difference() {
        linear_extrude(spine_len) circle(r = spine_r, $fn = 3);
        translate([0, 0, -1]) cylinder(d = 4, h = spine_len + 2, $fn = 24);
    }
}
led_spine();

// Base with a cam-lock socket for printed_tube_v2. No rods, no silicone moat:
// a flat gasket sits on the flange top and the twisted-in tube compresses it.
use <base_acrylic.scad>
use <lib.scad>
include <params.scad>

module base_camlock() {
    base_acrylic(moat = false, rods = false, groove_z = cam_groove_z);
    camlock_socket();
}

base_camlock();

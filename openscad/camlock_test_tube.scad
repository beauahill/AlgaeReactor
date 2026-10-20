// Bottom-lock fit coupon, tube half: the bottom 30 mm of printed_tube_v2.
// Print with camlock_test_base and a flat gasket (gasket_flat.stl).
use <printed_tube_v2.scad>
intersection() { printed_tube_v2(); cylinder(r = 60, h = 30); }

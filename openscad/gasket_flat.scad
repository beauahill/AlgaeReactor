// Two flat gaskets (TPU) for the camlock build: one under the lid, one under the tube.
// Placed diagonally so both fit a 150 mm bed.
use <gasket.scad>
include <params.scad>
translate([-28, -28, 0]) gasket_lid();
translate([ 28,  28, 0]) gasket_lid();

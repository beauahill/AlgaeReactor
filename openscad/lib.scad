include <params.scad>

// Hose barb pointing +Z, root at origin
module barb(len = barb_len) {
    cylinder(d = hose_id, h = len);
    for (i = [0:2])
        translate([0, 0, len - 6*(i + 1)])
            cylinder(d1 = hose_id + 1.6, d2 = hose_id - 0.4, h = 6);
}

// Rings of holes between radii r_in and r_out
module hole_rings(d, r_in, r_out, z0, h) {
    rings = 3;
    for (k = [0:rings - 1]) {
        r = r_in + (r_out - r_in) * k / (rings - 1);
        n = floor(2*PI*r / (d*2.4));
        for (i = [0:n - 1])
            rotate(i*360/n + k*7)
                translate([r, 0, z0]) cylinder(d = d, h = h, $fn = 24);
    }
}

module rod_holes_and_pockets(z_bottom, z_top, pockets = true) {
    for (a = rod_angles) rotate(a) translate([rod_r, 0, 0]) {
        translate([0, 0, z_bottom - 1]) cylinder(d = rod_hole_d, h = z_top - z_bottom + 2, $fn = 32);
        if (pockets) translate([0, 0, z_bottom - 0.01]) cylinder(d = nut_af/cos(30) + 0.3, h = nut_t + 0.4, $fn = 6);
    }
}

// Right-hand trapezoid thread profile: s = distance from tooth centre (fraction of pitch)
// -> 0..1 of thread depth. g widens the tooth axially (used for the ring's cutter).
function tprof(s, g = 0) =
    let (t = max(abs(s - 0.5) - g, 0))
    t <= 0.0812 ? 1 : t <= 0.37 ? 1 - (t - 0.0812)/0.2887 : 0;

// External thread from radius r_core to r_core + depth, z = 0..h.
// n points per turn and n slices per turn: every vertex lands on a neighbour's position
// one slice up, so the helix is true to ~0.04 mm instead of chord-sagging.
module thread_solid(r_core, depth, h, g = 0, n = 72) {
    linear_extrude(height = h, twist = -360*h/thread_pitch,
                   slices = ceil(h/thread_pitch*n), convexity = 10)
        polygon([for (k = [0:n - 1])
            let (a = 360*k/n, r = r_core + depth*tprof(k/n, g))
            [r*cos(a), r*sin(a)]]);
}

// Retaining ring, z = 0 at the thread end. Shared by the part file and the assembly.
module thread_ring_body() {
    h_thread = thread_len + flange_t;
    difference() {
        cylinder(r = ring_r, h = h_thread + ring_lip, $fn = 120);
        translate([0, 0, -0.01]) thread_solid(tube_od/2 + thread_clr, thread_depth, h_thread + 0.01, thread_ax);
        translate([0, 0, h_thread - 0.01]) cylinder(r = ring_lip_r, h = ring_lip + 0.02);
        // lead-in chamfer
        translate([0, 0, -0.01]) cylinder(r1 = tube_od/2 + thread_depth + thread_clr + 1.5, r2 = tube_od/2 + thread_clr, h = 1.5, $fn = 120);
        for (i = [0:11]) rotate(i*30) translate([ring_r + 0.5, 0, -1])
            cylinder(r = 3.5, h = h_thread + ring_lip + 2, $fn = 32);
    }
}

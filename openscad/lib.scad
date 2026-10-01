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

// Right-hand trapezoid thread profile, u = 0..1 across one pitch -> 0..1 of thread depth
function tprof(u) =
    u < 0.13   ? 0 :
    u < 0.4187 ? (u - 0.13)/0.2887 :
    u < 0.5812 ? 1 :
    u < 0.87   ? 1 - (u - 0.5812)/0.2887 : 0;

// External thread from radius r_core to r_core + depth, z = 0..h
module thread_solid(r_core, depth, h, n = 120) {
    linear_extrude(height = h, twist = -360*h/thread_pitch,
                   slices = ceil(h/thread_pitch*24), convexity = 10)
        polygon([for (k = [0:n - 1])
            let (a = 360*k/n, r = r_core + depth*tprof(k/n))
            [r*cos(a), r*sin(a)]]);
}

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

// Inlet plenum under the deck: chamfered floor corner so there is no sharp wet corner
module plenum_cavity(c = 3) {
    z0 = -base_h + floor_t;
    rotate_extrude($fn = 120) polygon([
        [0, z0], [bore_r - c, z0], [bore_r, z0 + c],
        [bore_r, plug_h + floor_t], [0, plug_h + floor_t]
    ]);
}

// Bayonet lugs on the top of the tube (absolute z; tube spans 0..tube_len)
module bayonet_lugs() {
    top = bay_lug_h + bay_lug_str;
    for (i = [0:bay_n - 1]) rotate(i*360/bay_n) translate([0, 0, tube_len + bay_lug_z0]) {
        rotate(-bay_lug_arc/2) rotate_extrude(angle = bay_lug_arc, $fn = 360)
            polygon([[bay_lug_r0, 0], [bay_lug_r0 + bay_lug_h, bay_lug_h],
                     [bay_lug_r0 + bay_lug_h, top], [bay_lug_r0, top]]);
        // stop wall on the clockwise side, reaches down past the tab's path
        rotate(-bay_lug_arc/2 - bay_stop_arc) rotate_extrude(angle = bay_stop_arc, $fn = 360)
            polygon([[bay_lug_r0, bay_ring_z0 - 1 - bay_lug_z0],
                     [bay_lug_r0 + bay_lug_h, bay_ring_z0 - 1 - bay_lug_z0],
                     [bay_lug_r0 + bay_lug_h, top], [bay_lug_r0, top]]);
    }
}

// Bayonet ring, z = 0 at the tabs. Tabs sit at 60/180/300 deg when the ring is dropped on.
module bayonet_ring_body() {
    h = ring_under + ring_lip;
    ro = bay_bore_r + 0.3;
    difference() {
        cylinder(r = ring_r, h = h, $fn = 120);
        translate([0, 0, -0.01]) cylinder(r = bay_bore_r, h = ring_under + 0.01, $fn = 120);
        translate([0, 0, ring_under - 0.01]) cylinder(r = ring_lip_r, h = ring_lip + 0.02, $fn = 120);
        for (i = [0:11]) rotate(i*30) translate([ring_r + 0.5, 0, -1])
            cylinder(r = 3, h = h + 2, $fn = 32);
    }
    for (i = [0:bay_n - 1]) rotate(60 + i*360/bay_n - bay_tab_arc/2)
        rotate_extrude(angle = bay_tab_arc, $fn = 360)
            polygon([[bay_tab_in, 0], [ro, 0],
                     [ro, bay_tab_h0 + (ro - bay_tab_in)], [bay_tab_in, bay_tab_h0]]);
}

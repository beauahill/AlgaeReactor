// Chaeto reactor - shared parameters (all dimensions in mm)
// Edit the "purchased parts" block to match what you actually buy,
// then re-export the STLs (see ../Makefile).

$fn = 96;

// ---------- purchased parts ----------
tube_od    = 76.2;     // acrylic tube OD (3")
tube_wall  = 3.175;    // acrylic tube wall (1/8"). MEASURE your tube's real ID.
tube_len   = 190;      // acrylic tube cut length (also the printed body height)
tt_od      = 25;       // test tube OD (rimless 25 x 200 borosilicate)
tt_len     = 200;      // test tube length
hose_id    = 12;       // tubing ID the barbs are sized for (1/2")
rod_d      = 4;        // M4 tie rods

// ---------- derived ----------
tube_id    = tube_od - 2*tube_wall;
plug_od    = tube_id - 0.3;           // slip fit inside the tube
plug_h     = 14;
bore_d     = 62;                      // plenum / outlet cavity diameter
bore_r     = bore_d/2;

// tube-end O-ring (round cord, ID x CS)
oring_cs        = 2.5;
oring_id        = 64;                 // 64 x 2.5 mm
groove_root_r   = tube_id/2 - 0.85*oring_cs;   // ~15% squeeze against the tube ID
groove_w        = oring_cs + 0.7;

// test tube O-ring in the lid column
tt_oring_cs     = 2;                  // 24 x 2 mm
tt_bore_r       = (tt_od + 0.5)/2;
tt_groove_root_r= tt_od/2 + 0.85*tt_oring_cs;
tt_groove_w     = tt_oring_cs + 0.6;

// flanges / tie rods
flange_r   = tube_od/2 + 12;
rod_r      = tube_od/2 + 6;
rod_hole_d = rod_d + 0.5;
rod_angles = [60, 180, 300];
nut_af     = 7;                       // M4 nut across flats
nut_t      = 3.2;

// base
base_h     = 20;                      // flange thickness below tube seat
floor_t    = 3;
deck_t     = 4;
deck_od    = tube_id - 0.4;

// lid
screen_t   = 3;
flange_t   = 6;
col_r      = tt_bore_r + 4;
roof_h     = bore_r - col_r;          // 45 deg roof, prints without supports
top_z      = roof_h + 3;
lid_barb_x = 26;

// barbs / holes
barb_len   = 32;
barb_bore  = 8;
hole_d     = 2.5;                     // deck holes (flow in)
screen_hole_d = 2.0;                  // lid screen holes (flow out)

printed_bore_tol = 0.1;               // extra clearance on the printed body ID

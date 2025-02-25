include <../../config.scad>;
use <../fixings/tube_clamp_round_3_way_through_116.scad>;
use <../fixings/tube_clamp_round_base_plate_132.scad>;
use <../common/metric_bolt.scad>;
use <../common/washer.scad>;

module front_leg_fixing() {
    echo("Front leg fixing assembly:");
    R_base_plate = get_R_plate_round_base_plate_132(D_AXLE_FRONT);
    h_leg = Z_OFFSET_BED_TO_AXLE - D_AXLE_FRONT / 2 - R_base_plate[2];
    offset_y_hole_base_plate = get_offset_hole_y_round_base_plate_132(D_AXLE_FRONT);
    size_hole_base_plate = get_diameter_hole_round_base_plate_132(D_AXLE_FRONT);
    h_bolt_head = get_metric_bolt_head_height(size_hole_base_plate);
    L_fastener = h_bolt_head * 2 + T_WASHER_BASE_PLATE * 2 + R_base_plate[2] + R_BED[2] + L_BOLT_EXTENSION;
    difference() {
        union() {
            // bracket - top, under bed
            // translate([0, 0, -R_fixing[2] / 2]) cylinder(R_fixing[2], R_fixing[0] / 2, R_fixing[0] / 2, center = true);
            rotate([0, 180, 0]) tube_clamp_round_base_plate_132(D_AXLE_FRONT); 
            // bed bracket fastening bolt
            for (index_side_y = [0 : 1 : 1]) {
                mirror([0, index_side_y, 0]) {
                    // bracket at bed fastener
                    translate([0, offset_y_hole_base_plate, L_fastener / 2 - R_base_plate[2] - L_BOLT_EXTENSION - h_bolt_head - T_WASHER_BASE_PLATE]) metric_bolt(size_hole_base_plate, L_fastener, true, L_BOLT_EXTENSION);
                    translate([0, offset_y_hole_base_plate, h_bolt_head / 2 - T_WASHER_BASE_PLATE / 2]) for (index_side_z = [0 : 1 : 1]) {
                        mirror([0, 0, index_side_z]) {
                            // bracket fastener washers
                            translate([0, 0, L_fastener / 2 - L_BOLT_EXTENSION / 2 - h_bolt_head - T_WASHER_BASE_PLATE / 2]) washer(T_WASHER_BASE_PLATE, D_WASHER_BASE_PLATE, size_hole_base_plate);
                        }
                    }
                }
            }
            // leg
            color(COLOUR_BEAM_ALUMINIUM) translate([0, 0, -R_base_plate[2] - h_leg / 2]) cylinder(h_leg, D_AXLE_FRONT / 2, D_AXLE_FRONT / 2, center = true);
            // bracket - bottom, against axle
            translate([0, 0, -Z_OFFSET_BED_TO_AXLE]) rotate([0, 0, 0]) tube_clamp_round_3_way_through_116(D_AXLE_FRONT); // translate([0, 0, -R_fixing[2] * 3 / 2 - h_leg - T_PLATE * 2 - D_AXLE_FRONT + z_overlap_tee_clamp_round * 1]) cylinder(R_fixing[2], R_fixing[0] / 2, R_fixing[0] / 2, center = true);
        }
        // front axle bearing hole
        translate([0, 0, -Z_OFFSET_BED_TO_AXLE + D_AXLE_FRONT / 2 + DEPTH_BOLT_FRONT_AXLE_BEARING - L_BOLT_FRONT_AXLE_BEARING]) cylinder(L_BOLT_FRONT_AXLE_BEARING, SIZE_BOLT_FRONT_AXLE_BEARING / 2, SIZE_BOLT_FRONT_AXLE_BEARING / 2, center = false);
    }
    // Shopping
    // bed fixing
    echo(str("Leg: Round Aluminium bar Φ", D_AXLE_FRONT, "mm x ", h_leg, "mm - x1"));
    // Base plate fastening bolts and nuts
    // echo(str("Base plate fastening washers: Washer Φ", D_WASHER_BASE_PLATE, "mm x ", T_WASHER_BASE_PLATE, "mm - x4")); // Base plate fastening washers
    // axle fixing
    echo(str("Tool: M", SIZE_BOLT_FRONT_AXLE_BEARING, " HSS tapping tool - x1"));
}

front_leg_fixing();

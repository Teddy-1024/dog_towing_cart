include <../../config.scad>;
use <../fixings/tube_clamp_round_tee_long_104.scad>;
use <../fixings/tube_clamp_round_base_plate_132.scad>;
use <../common/metric_bolt.scad>;
use <../common/washer.scad>;

module rear_leg_fixing() {
    echo("Rear leg fixing:");
    R_base_plate = get_R_plate_round_base_plate_132(D_AXLE_REAR);
    h_leg = Z_OFFSET_BED_TO_AXLE - R_base_plate[2] - D_AXLE_REAR / 2;
    offset_y_hole_base_plate = get_offset_hole_y_round_base_plate_132(D_AXLE_REAR);
    size_hole_base_plate = get_diameter_hole_round_base_plate_132(D_AXLE_REAR);
    h_bolt_head = get_metric_bolt_head_height(size_hole_base_plate);
    L_fastener = h_bolt_head * 2 + T_WASHER_BASE_PLATE * 2 + R_base_plate[2] + R_BED[2] + L_BOLT_EXTENSION;
    union() {
        // bracket bed
        rotate([0, 180, 0]) tube_clamp_round_base_plate_132(D_AXLE_REAR); // cylinder(R_fixing[2], R_fixing[0] / 2, R_fixing[0] / 2, center = true); // cube(R_fixing, center = true);
        
        for (index_side_y = [0 : 1 : 1]) {
            mirror([0, index_side_y, 0]) {
                // bracket at bed fastener
                translate([0, offset_y_hole_base_plate, L_fastener / 2 - R_base_plate[2] - L_BOLT_EXTENSION - h_bolt_head - T_WASHER_BASE_PLATE]) metric_bolt(size_hole_base_plate, L_fastener, true, L_BOLT_EXTENSION);
                translate([0, offset_y_hole_base_plate, h_bolt_head / 2 - 0* T_WASHER_BASE_PLATE / 2]) for (index_side_z = [0 : 1 : 1]) {
                    mirror([0, 0, index_side_z]) {
                        // bracket fastener washers
                        translate([0, 0, L_fastener / 2 - L_BOLT_EXTENSION / 2 - h_bolt_head - T_WASHER_BASE_PLATE / 2]) washer(T_WASHER_BASE_PLATE, D_WASHER_BASE_PLATE, size_hole_base_plate);
                    }
                }
            }
        }
        // leg
        color(COLOUR_BEAM_ALUMINIUM) translate([0, 0, -R_base_plate[2] - h_leg / 2]) cylinder(h_leg, D_AXLE_REAR / 2, D_AXLE_REAR / 2, center = true); // cube([t_beam, t_beam, h_leg], center = true);
        // bracket axle-side
        translate([0, 0, -Z_OFFSET_BED_TO_AXLE]) rotate([0, -90, 0]) tube_clamp_round_tee_long_104(D_AXLE_REAR); // cylinder(R_fixing[2], R_fixing[0] / 2, R_fixing[0] / 2, center = true);
    }
    // Shopping
    // bracket at bed
    // bracket bolt
    // echo(str("Base plate fastening washers: Washer Φ", D_WASHER_BASE_PLATE, "mm x ", T_WASHER_BASE_PLATE, "mm - x4")); // Base plate fastening washers
    echo(str("Leg: Round Aluminium bar Φ", D_AXLE_REAR, "mm x ", h_leg, "mm - x1"));
    // bracket at axle
}

rear_leg_fixing();


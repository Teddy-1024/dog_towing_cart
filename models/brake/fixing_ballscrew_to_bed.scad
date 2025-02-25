include <../../config.scad>;
use <../common/metric_bolt.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/washer.scad>;
use <../fixings/tube_clamp_square_base_plate_132.scad>;
use <../fixings/tube_clamp_square_base_plate_132_functions.scad>;
use <./beam_leg_ballscrew_to_bed.scad>;


module fixing_ballscrew_to_bed() {
    echo("Fixing ballscrew to bed: ");
    y_offset_hole_bed_fastener = get_offset_hole_x_square_base_plate_132(D_BEAM_BRAKE);
    d_hole_fastener = get_diameter_hole_square_base_plate_132();
    h_head_fastener = get_metric_bolt_head_height(d_hole_fastener);
    L_fastener = R_BED[2] + 2 * (T_WASHER_BASE_PLATE + h_head_fastener) + R_BASE_PLATE_FIXING_LEG_BRAKE_BALLSCREW_TO_BED[2] + L_BOLT_EXTENSION;
    // d_washer_outer = get_metric_bolt_washer_diameter_safe_working_clearance(d_hole_fastener);
    union() {
        // fixing tube clamp
        rotate([0, 180, 90]) tube_clamp_square_base_plate_132(D_BEAM_BRAKE);
        
        for (index_side_y = [0:1:1]) {
            mirror([0, index_side_y, 0]) translate([0, y_offset_hole_bed_fastener, 0]) {
                // fastener bolt
                translate([0, 0, -L_fastener / 2 + R_BED[2] + T_WASHER_BASE_PLATE + h_head_fastener]) metric_bolt(d_hole_fastener, L_fastener, true, L_BOLT_EXTENSION);
                // fastener washers
                // bed side
                translate([0, 0, R_BED[2] + T_WASHER_BASE_PLATE / 2]) washer(T_WASHER_BASE_PLATE, D_WASHER_BASE_PLATE, d_hole_fastener);
                // axle side
                translate([0, 0, -R_BASE_PLATE_FIXING_LEG_BRAKE_BALLSCREW_TO_BED[2] - T_WASHER_BASE_PLATE / 2]) washer(T_WASHER_BASE_PLATE, D_WASHER_BASE_PLATE, d_hole_fastener);
            }
        }
        // leg
        translate([0, 0, -R_BASE_PLATE_FIXING_LEG_BRAKE_BALLSCREW_TO_BED[2] - L_LEG_FIXING_BRAKE_BALLSCREW_TO_BED / 2]) beam_leg_ballscrew_to_bed();
    }
    // Shopping
    // Fixing leg to bed
    // Fixing fasteners
    // Fixing fastener washers
    // Leg
}

fixing_ballscrew_to_bed();

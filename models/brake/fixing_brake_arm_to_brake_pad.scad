include <../../config.scad>;
use <../common/angle_beam.scad>;
use <../common/metric_bolt.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/washer.scad>;


module fixing_brake_arm_to_brake_pad() {
    echo("Fixing brake arm to brake pad:");
    h_head_fastener = get_metric_bolt_head_height(SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD);
    L_fastener = 2 * (h_head_fastener + T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD) + R_BRAKE_ARM[2] + T_FIXING_BRAKE_ARM_TO_BRAKE_PAD + L_BOLT_EXTENSION;
    union() {
        // fixing
        color(COLOUR_BEAM_ALUMINIUM) difference() {
            // body
            rotate([90, 0, 180]) translate([0, 0, -L_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2]) angle_beam(L_FIXING_BRAKE_ARM_TO_BRAKE_PAD, W_FIXING_BRAKE_ARM_TO_BRAKE_PAD, T_FIXING_BRAKE_ARM_TO_BRAKE_PAD, false);
            // brake pad fastener hole
            translate([0, 0, T_FIXING_BRAKE_ARM_TO_BRAKE_PAD + (W_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_FIXING_BRAKE_ARM_TO_BRAKE_PAD) / 2]) rotate([0, 90, 0]) cylinder(W_FIXING_BRAKE_ARM_TO_BRAKE_PAD * 2, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, center = true);
            // brake arm fastener holes
            for (index_side_y = [0:1:1]) {
                mirror([0, index_side_y, 0]) {
                    translate([-T_FIXING_BRAKE_ARM_TO_BRAKE_PAD - (W_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_FIXING_BRAKE_ARM_TO_BRAKE_PAD) / 2, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, 0]) cylinder(W_FIXING_BRAKE_ARM_TO_BRAKE_PAD * 2, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, center = true);
                }
            }
        }
        // fasteners to brake arm
        for (index_side_y = [0:1:1]) {
            mirror([0, index_side_y, 0]) {
                translate([-T_FIXING_BRAKE_ARM_TO_BRAKE_PAD - (W_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_FIXING_BRAKE_ARM_TO_BRAKE_PAD) / 2, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, 0]) {
                    // bolt
                    translate([0, 0, -L_fastener / 2 + T_FIXING_BRAKE_ARM_TO_BRAKE_PAD + T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD + h_head_fastener]) metric_bolt(SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, L_fastener, true, L_BOLT_EXTENSION);
                    // washers
                    // upper
                    translate([0, 0, T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2 + T_FIXING_BRAKE_ARM_TO_BRAKE_PAD]) washer(T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD);
                    // lower
                    translate([0, 0, -T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2 - R_BRAKE_ARM[2]]) washer(T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD);
                }
            }
        }
        // fastener to brake pad
        // washer
        translate([-T_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, 0, T_FIXING_BRAKE_ARM_TO_BRAKE_PAD + (W_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_FIXING_BRAKE_ARM_TO_BRAKE_PAD) / 2]) rotate([0, 90, 0]) washer(T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD);
    }
    // Shopping
    // Angle beam
    // Fasteners
    // Washers
}

fixing_brake_arm_to_brake_pad();
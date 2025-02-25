include <../../config.scad>;
use <../common/metric_bolt.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/washer.scad>;


module fixing_brake_arm_to_rear_axle_leg() {
    echo("Fixing brake arm to rear axle leg:");
    count_washers_each_end = 3;
    h_nut = get_metric_bolt_head_height(SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG);
    L_bolt = D_AXLE_REAR + 2 * (T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG * count_washers_each_end + h_nut) + L_BOLT_EXTENSION;
    rotate([0, 0, -ANGLE_BRAKE_ROD_MAX]) for (index_side_z = [0 : 1 : 1]) {
        mirror([0, 0, index_side_z]) translate([0, 0, R_BRAKE_ARM[2] / 2]) {
            // axle washer
            translate([0, 0, 0]) washer(T_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, D_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, D_AXLE_REAR, centre = false);
            // bolt
            translate([0, -L_bolt / 2 + D_AXLE_REAR / 2 + T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG + h_nut, T_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG + D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG / 2]) rotate([-90, 0, 0]) metric_bolt(SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, L_bolt, true, L_BOLT_EXTENSION);
            // bolt washer
            for (index_washer = [0 : 1 : count_washers_each_end]) {
                // front
                translate([0, D_AXLE_REAR / 2 + index_washer * T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, T_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG + D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG / 2]) rotate([-90, 0, 0]) washer(T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, centre = false);
                // rear
                translate([0, -D_AXLE_REAR / 2 - index_washer * T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, T_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG + D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG / 2]) rotate([90, 0, 0]) washer(T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG, centre = false);
            }
        }
    }
    // Shopping
    // Axle washers
    // Bolts
    // Bolt washers front
    // Bolt washers rear
}

fixing_brake_arm_to_rear_axle_leg();


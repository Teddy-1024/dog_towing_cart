include <../../config.scad>;
use <../common/metric_bolt.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/washer.scad>;
use <../fixings/tube_clamp_square_base_plate_132.scad>;
use <../fixings/tube_clamp_square_base_plate_132_functions.scad>;
use <./brake_assembly_functions.scad>;
use <./fixing_ballscrew_to_bed.scad>;
use <./power_wheel_assembly.scad>;
use <./fixing_brake_ballscrew_to_brake_arms.scad>;
use <./brake_arm.scad>;
use <./fixing_brake_arm_to_brake_pad.scad>;
use <./brake_pad.scad>;
use <./fixing_brake_arm_to_rear_axle_leg.scad>;
use <./brake_spring_load_assembly.scad>;



module brake_assembly(angle_brake_rod) {
    echo("Brake assembly:");
    // Y_POS_LEAD_FIXING_BALLSCREW_TO_BRAKE_ARMS 
    y_pos_lead_fixing_ballscrew_to_brake_arms = get_y_pos_lead_fixing_ballscrew_to_brake_arms(angle_brake_rod, Y_POS_AXLE_REAR, X_POS_AXLE_LEG_REAR, X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE);
    y_pos_ballscrew_end_front = -R_BED[1] / 2 + L_BRAKE_BALLSCREW_AXLE;
    union() {
        // ballscrew axle
        color(COLOUR_ROD_THREADED) translate([0, y_pos_ballscrew_end_front, -Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE]) rotate([90, 0, 0]) cylinder(L_BRAKE_BALLSCREW_AXLE, D_BRAKE_BALLSCREW_AXLE / 2, D_BRAKE_BALLSCREW_AXLE / 2, center = false);
        // fixing ballscrew to bed front
        translate([0, y_pos_ballscrew_end_front - Y_OFFSET_BALLSCREW_LEG_FRONT_FIXING_FROM_END, 0]) fixing_ballscrew_to_bed();
        // fixing ballscrew to bed rear
        translate([0, -R_BED[1] / 2 + Y_OFFSET_BALLSCREW_LEG_REAR_FIXING_FROM_END, 0]) fixing_ballscrew_to_bed();
        // ballscrew power wheel
        translate([0, -R_BED[1] / 2 + Y_OFFSET_BALLSCREW_LEG_REAR_FIXING_FROM_END - D_BEAM_BRAKE / 2 - T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL - T_BRAKE_BALLSCREW_POWER_WHEEL / 2, -Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE]) power_wheel_assembly();
        // ballscrew power wheel washer
        translate([0, -R_BED[1] / 2 + Y_OFFSET_BALLSCREW_LEG_REAR_FIXING_FROM_END - D_BEAM_BRAKE / 2 - T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL / 2, -Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE]) rotate([90, 0, 0]) washer(T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_AXLE);
        // fixing ballscrew to brake rod
        translate([0, y_pos_lead_fixing_ballscrew_to_brake_arms, -Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE]) {
            fixing_brake_ballscrew_to_brake_arms();
            
            for (index_side_x = [0:1:1]) {
                mirror([index_side_x, 0, 0]) {
                    translate([X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE, 0, 0]) rotate([0, 0, (90 - angle_brake_rod)]) {
                        // brake arm
                        translate([R_BRAKE_ARM[0] / 2, 0, 0]) brake_arm();
                        // fixing brake arm to brake pad
                        translate([R_BRAKE_ARM[0] - X_OFFSET_FIXING_BRAKE_ARM_TO_BRAKE_PAD_FROM_END, 0, R_BRAKE_ARM[2] / 2]) rotate([0, 0, -(90 - angle_brake_rod)]) fixing_brake_arm_to_brake_pad();
                        // brake pad
                        translate([R_BRAKE_ARM[0] - X_OFFSET_FIXING_BRAKE_ARM_TO_BRAKE_PAD_FROM_END, 0, R_BRAKE_ARM[2] / 2 + T_FIXING_BRAKE_ARM_TO_BRAKE_PAD + (W_FIXING_BRAKE_ARM_TO_BRAKE_PAD - T_FIXING_BRAKE_ARM_TO_BRAKE_PAD) / 2]) rotate([0, 0, -(90 - angle_brake_rod)]) translate([T_FIXING_BRAKE_ARM_TO_BRAKE_PAD, 0, 0]) brake_pad();
                    }
                    // fixing brake arm to rear axle leg
                    translate([X_POS_AXLE_LEG_REAR, -y_pos_lead_fixing_ballscrew_to_brake_arms + Y_POS_AXLE_REAR, 0]) fixing_brake_arm_to_rear_axle_leg();
                }
            }
        }
        // Spring-loading assembly
        translate([0, y_pos_ballscrew_end_front - Y_OFFSET_BALLSCREW_LEG_FRONT_FIXING_FROM_END + D_BEAM_BRAKE / 2, -Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE]) brake_spring_load_assembly();
    }
    
    // Shopping
    echo(str("Ballscrew axle: Threaded Steel rod M", D_BRAKE_BALLSCREW_AXLE, " x ", L_BRAKE_BALLSCREW_AXLE, " - x1"));
    // Fixing ballscrew to bed front
    // Fixing ballscrew to bed rear
    // Ballscrew power wheel
    // Ballscrew power wheel washer
    // Fixing ballscrew to brake arms
    // Brake arms
    // Fixings brake arm to brake pad
    // Brake pads
    // fixing brake arm to rear axle leg
    // Spring-load assembly
}


angle_brake_rod = ANGLE_BRAKE_ROD_MAX;

brake_assembly(angle_brake_rod);


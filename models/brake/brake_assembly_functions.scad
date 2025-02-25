// include <../../config.scad>; // circular reference!

function get_y_pos_lead_fixing_ballscrew_to_brake_arms(angle_brake_rod, y_pos_axle_rear, x_pos_axle_leg_rear, x_offset_fixing_brake_arm_to_lead_plate) = y_pos_axle_rear - (x_pos_axle_leg_rear - x_offset_fixing_brake_arm_to_lead_plate) / tan(angle_brake_rod); // (X_POS_AXLE_LEG_REAR - X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE)
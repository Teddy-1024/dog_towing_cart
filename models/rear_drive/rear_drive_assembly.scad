
include <../../config.scad>;
use <../fixings/tube_clamp_round_tee_long_104.scad>;
use <../fixings/tube_clamp_round_base_plate_132.scad>;
use <../rear_drive/rear_leg_fixing.scad>;
use <../rear_drive/rear_wheel_fastener.scad>;
use <../common/washer.scad>;
use <../common/wheel.scad>;

module rear_drive_assembly() {
    echo("Rear drive assembly:");
    L_shaft_short_leg_to_axle = get_L_shaft_short_round_tee_long_104(D_AXLE_REAR);
    L_shaft_long_leg_to_axle = get_L_shaft_long_round_tee_long_104(D_AXLE_REAR);
    // L_axial_rear_wheel_fastener = SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING + T_WASHER_AXLE_REAR_WHEEL_POSITIONING + D_WASHER_BOLT_REAR_WHEEL_POSITIONING;
    // x_pos_wheel_centre = X_POS_AXLE_LEG_REAR + L_shaft_long_leg_to_axle / 2 + L_axial_rear_wheel_fastener + T_WHEEL / 2;
    L_axle = 2 * (X_POS_WHEEL_CENTRE + T_WHEEL / 2 + SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING + T_WASHER_AXLE_REAR_WHEEL_POSITIONING + D_WASHER_BOLT_REAR_WHEEL_POSITIONING);
    translate([0, Y_POS_AXLE_REAR, -R_BED[2] / 2]) union() {
        for (index_side_bed = [0:1:1]) {
            mirror([index_side_bed, 0, 0]) { 
                // leg fixings
                translate([X_POS_AXLE_LEG_REAR, 0, 0]) rear_leg_fixing();
                // wheels
                translate([X_POS_WHEEL_CENTRE, 0, -Z_OFFSET_BED_TO_AXLE]) wheel();
                translate([X_POS_WHEEL_CENTRE, 0, -Z_OFFSET_BED_TO_AXLE]) for(index_side_wheel = [0:1:1]) {
                    mirror([index_side_wheel, 0, 0]) translate([T_WHEEL / 2 + SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING + T_WASHER_AXLE_REAR_WHEEL_POSITIONING + D_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2, 0, 0]) {
                        // wheel positioning fasteners
                        rear_wheel_fastener();
                        // washer
                        translate([-D_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2 - T_WASHER_AXLE_REAR_WHEEL_POSITIONING / 2, 0, 0]) rotate([0, 90, 0]) washer(T_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_AXLE_REAR);
                    }
                }
            }
        }
        // axle
        color(COLOUR_BEAM_ALUMINIUM) translate([0, 0, -Z_OFFSET_BED_TO_AXLE]) rotate([0, 90, 0]) cylinder(L_axle, D_AXLE_REAR / 2, D_AXLE_REAR / 2, center = true);
    }
    // Shopping
    // Rear leg fixing
    // Wheel
    // Rear wheel fastener
    // echo(str("Rear wheel positioning axle washer: Washer Φ", D_WASHER_AXLE_REAR_WHEEL_POSITIONING, "mm x ", T_WASHER_AXLE_REAR_WHEEL_POSITIONING, "mm - x4")); // Rear wheel positioning axle washer
    echo(str("Rear axle: Round Aluminium bar Φ", D_AXLE_REAR, "mm x ", L_axle, "mm - x1"));
}

rear_drive_assembly();

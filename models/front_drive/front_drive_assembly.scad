include <../../config.scad>;
use <../front_drive/front_leg_fixing.scad>;
use <../front_drive/tiller_assembly.scad>;
use <../rear_drive/rear_wheel_fastener.scad>;
use <../common/metric_bolt.scad>;
use <../common/washer.scad>;
use <../common/wheel.scad>;

module front_drive_assembly(angle_incline_tiller) {
    echo("Front drive assembly:");
    y_pos_axis = R_BED[1] / 2 - D_WHEEL / 2;
    L_axle_long = R_BED[0] - T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 2;
    L_axle_short = T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 2 + T_WHEEL + D_WASHER_BOLT_REAR_WHEEL_POSITIONING;
    height_bolt_head = get_metric_bolt_head_height(SIZE_BOLT_REAR_WHEEL_POSITIONING);
    L_bolt_axle_extension = D_AXLE_FRONT + 2 * (T_WASHER_BOLT_REAR_WHEEL_POSITIONING + height_bolt_head) + L_BOLT_EXTENSION;
    offset_axle_extension_fastener_axial = 2 * SIZE_BOLT_REAR_WHEEL_POSITIONING;
    L_bolt_wheel_positioning = D_AXLE_REAR + 2 * (T_WASHER_BOLT_REAR_WHEEL_POSITIONING + height_bolt_head) + L_BOLT_EXTENSION;
    translate([0, y_pos_axis, -R_BED[2] / 2]) union() {
        // leg fixing
        front_leg_fixing();
        // left-right symmetry
        translate([0, 0, -Z_OFFSET_BED_TO_AXLE]) for (index_side = [0:1:1]) {
            mirror([index_side, 0, 0]) {
                // axle extensions
                color(COLOUR_BEAM_ALUMINIUM) translate([L_axle_long / 2 + L_axle_short / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_axle_short, D_AXLE_REAR / 2, D_AXLE_REAR / 2, center = true);
                // axle extension fixing bolt
                translate([L_axle_long / 2 - offset_axle_extension_fastener_axial, 0, -L_BOLT_EXTENSION / 2]) metric_bolt(SIZE_BOLT_REAR_WHEEL_POSITIONING, L_bolt_axle_extension, true, L_BOLT_EXTENSION);
                // axle extension fixing bolt washers
                translate([L_axle_long / 2 - offset_axle_extension_fastener_axial, 0, 0]) for (index_side_z = [0 : 1 : 1]) {
                    mirror([0, 0, index_side_z]) {
                        translate([0, 0, D_AXLE_FRONT / 2 + T_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2]) washer(T_WASHER_BOLT_REAR_WHEEL_POSITIONING, D_WASHER_BOLT_REAR_WHEEL_POSITIONING, SIZE_BOLT_REAR_WHEEL_POSITIONING);
                    }
                }
                // inner wheel axis washers
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING / 2, 0, 0]) rotate([0, 90, 0]) washer(T_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_AXLE_REAR);
                // wheels
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING + T_WHEEL / 2, 0, 0]) wheel();
                // outer wheel axis washers
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 3 / 2 + T_WHEEL, 0, 0]) rotate([0, 90, 0]) washer(T_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_WASHER_AXLE_REAR_WHEEL_POSITIONING, D_AXLE_REAR);
                
                /* replaced with rear_wheel_fastener below
                // wheel positioning bolts
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 2 + T_WHEEL + D_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2, 0, -L_BOLT_EXTENSION / 2]) metric_bolt(SIZE_BOLT_REAR_WHEEL_POSITIONING, L_bolt_wheel_positioning, true, L_BOLT_EXTENSION);
                // wheel positioning bolt washers
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 2 + T_WHEEL + D_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2, 0, 0]) for (index_side_z = [0 : 1 : 1]) {
                    mirror([0, 0, index_side_z]) {
                        translate([0, 0, D_AXLE_REAR / 2 + T_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2]) washer(T_WASHER_BOLT_REAR_WHEEL_POSITIONING, D_WASHER_BOLT_REAR_WHEEL_POSITIONING, SIZE_BOLT_REAR_WHEEL_POSITIONING);
                    }
                }
                */
                translate([L_axle_long / 2 + T_WASHER_AXLE_REAR_WHEEL_POSITIONING * 2 + T_WHEEL + D_WASHER_BOLT_REAR_WHEEL_POSITIONING / 2, 0, 0]) rear_wheel_fastener();
            }
        }
        // axle
        color(COLOUR_BEAM_ALUMINIUM) translate([0, 0, -Z_OFFSET_BED_TO_AXLE]) rotate([0, 90, 0]) cylinder(L_axle_long, D_AXLE_FRONT / 2, D_AXLE_FRONT / 2, center = true);
        // tiller
        translate([0, D_AXLE_FRONT / 2, -Z_OFFSET_BED_TO_AXLE]) tiller_assembly(angle_incline_tiller);
        // joint axle to tiller
        translate([0, 0, -Z_OFFSET_BED_TO_AXLE + L_BOLT_FRONT_AXLE_BEARING / 2 - D_AXLE_FRONT / 2 - T_JOINT_FRONT_AXLE_TO_TILLER - DEPTH_BOLT_FRONT_AXLE_BEARING - COUNT_WASHERS_JOINT_FRONT_AXLE_TO_TILLER * T_WASHER_JOINT_FRONT_AXLE_TO_TILLER]) mirror([0, 0, 1]) metric_bolt(SIZE_BOLT_FRONT_AXLE_BEARING, L_BOLT_FRONT_AXLE_BEARING, false);
        // joint axle to tiller washers
        for (index_washer = [0 : 1 : COUNT_WASHERS_JOINT_FRONT_AXLE_TO_TILLER - 1]) {
            translate([0, 0, -Z_OFFSET_BED_TO_AXLE - D_AXLE_FRONT / 2 - T_JOINT_FRONT_AXLE_TO_TILLER - T_WASHER_JOINT_FRONT_AXLE_TO_TILLER * (index_washer + 1 / 2)]) washer(T_WASHER_JOINT_FRONT_AXLE_TO_TILLER, D_WASHER_JOINT_FRONT_AXLE_TO_TILLER, SIZE_BOLT_FRONT_AXLE_BEARING);
        }
    }
    // Shopping
    // front leg fixing
    echo(str("Axle extension: Round Aluminium bar Φ", D_AXLE_REAR, "mm x ", L_axle_short, "mm - x2"));
    // Axle extension fixing bolt
    // echo(str("Axle extension fixing bolt washer: Washer Φ", D_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm x ", T_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm - x4")); // Axle extension fixing bolt washers
    // echo(str("Wheel positioning washer: Washer Φ", D_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm x ", T_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm - x4")); // Wheel positioning washers
    // wheels
    // wheel positioning fastener
    // echo(str("Wheel positioning bolt washer: Washer Φ", D_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm x ", T_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm - x4")); // Wheel positioning bolt washers
    echo(str("Axle: Round Aluminium bar Φ", D_AXLE_FRONT, "mm x ", L_axle_long, "mm - x1"));
    // tiller assembly
    // front axis bearing bolt
    // echo(str("Front axis bearing washers: Washer Φ", D_WASHER_JOINT_FRONT_AXLE_TO_TILLER, "mm x ", T_WASHER_JOINT_FRONT_AXLE_TO_TILLER, "mm - x", COUNT_WASHERS_JOINT_FRONT_AXLE_TO_TILLER)); // Front axis bearing washers
}

front_drive_assembly(20);
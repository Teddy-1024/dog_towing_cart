include <../../config.scad>;
use <../common/metric_bolt.scad>;
use <../common/washer.scad>;

module tiller_joint() {
    echo("Tiller joint assembly:");
    R_plate_tiller = [T_PLATE, L_JOINT_TILLER_EXTENSION, 3 * SIZE_BOLT_JOINT_TILLER_EXTENSION];
    x_pos_plate = (D_AXLE_FRONT + R_plate_tiller[0]) / 2 + T_WASHER_TILLER_JOINT;
    h_bolt_head = get_metric_bolt_head_height(SIZE_BOLT_JOINT_TILLER_EXTENSION);
    L_bolt = D_AXLE_FRONT + 2 * (h_bolt_head + T_WASHER_TILLER_JOINT * 2 + R_plate_tiller[0]) + L_BOLT_EXTENSION;
    y_pos_bolt = R_plate_tiller[1] / 2 - OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL;
    x_pos_washer_internal = D_AXLE_FRONT / 2 + T_WASHER_TILLER_JOINT / 2;
    x_pos_washer_external = L_bolt / 2 - L_BOLT_EXTENSION / 2 - h_bolt_head - T_WASHER_TILLER_JOINT / 2;
    count_washers_each_side_front = 5;
    union() {
        for (index_side_x = [0 : 1 : 1]) {
            mirror([index_side_x, 0, 0]) {
                // plates
                color(COLOUR_BEAM_ALUMINIUM) translate([x_pos_plate, 0, 0]) cube(R_plate_tiller, center = true);
                
                for (index_side_y = [0 : 1 : 1]) {
                    mirror([0, index_side_y, 0]) {
                        // washers
                        // external
                        translate([x_pos_washer_external, y_pos_bolt, 0]) rotate([0, 90, 0]) washer(T_WASHER_TILLER_JOINT, D_WASHER_TILLER_JOINT, SIZE_BOLT_JOINT_TILLER_EXTENSION);
                    }
                }
                // rear internal washers
                translate([x_pos_washer_internal, -y_pos_bolt, 0]) rotate([0, 90, 0]) washer(T_WASHER_TILLER_JOINT, D_WASHER_TILLER_JOINT, SIZE_BOLT_JOINT_TILLER_EXTENSION);
                // front internal washers
                for (index_washer_front = [0 : 1 : count_washers_each_side_front]) {
                    translate([x_pos_washer_internal - T_WASHER_TILLER_JOINT * index_washer_front, y_pos_bolt, 0]) rotate([0, 90, 0]) washer(T_WASHER_TILLER_JOINT, D_WASHER_TILLER_JOINT, SIZE_BOLT_JOINT_TILLER_EXTENSION);
                }
            }
        }
        for (index_side_y_only = [0 : 1 : 1]) {
            mirror([0, index_side_y_only, 0]) {
                // bolts
                translate([-L_BOLT_EXTENSION / 2, y_pos_bolt, 0]) rotate([0, 90, 0]) metric_bolt(SIZE_BOLT_JOINT_TILLER_EXTENSION, L_bolt, true, L_BOLT_EXTENSION);
            }
        }
    }
    // Shopping
    echo(str("Plate: Aluminium sheet ", R_plate_tiller[0], "mm x ", R_plate_tiller[1], "mm x ", R_plate_tiller[2], "mm - x2"));
    // echo(str("Washer: Washer Φ", D_WASHER_TILLER_JOINT, "mm x ", T_WASHER_TILLER_JOINT, "mm - x8")); // Tiller joint washers
    // Bolts
}

// output
tiller_joint();

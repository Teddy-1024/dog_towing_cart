include <../../config.scad>;
use <../fixings/tube_clamp_round_base_plate_132.scad>;

module bed() {
    offset_hole_y_front = get_offset_hole_y_round_base_plate_132(D_AXLE_FRONT);
    d_hole_front = get_diameter_hole_round_base_plate_132(D_AXLE_FRONT);
    offset_hole_y_rear = get_offset_hole_y_round_base_plate_132(D_AXLE_REAR);
    d_hole_rear = get_diameter_hole_round_base_plate_132(D_AXLE_REAR);
    count_shafts_y = 3;
    color("burlywood") difference() {
        cube(R_BED, center = true);
        // front axle leg holes
        translate([0, Y_POS_AXLE_FRONT, 0]) for (index_side_y = [0 : 1 : 1]) {
            mirror([0, index_side_y, 0]) {
                translate([0, offset_hole_y_front, 0]) cylinder(R_BED[2], d_hole_front / 2, d_hole_front / 2, center = true);
            }
        }
        // rear axle leg holes
        translate([0, Y_POS_AXLE_REAR, 0]) for (index_side_x = [0 : 1 : 1]) {
            mirror([index_side_x, 0, 0]) {
                translate([X_POS_AXLE_LEG_REAR, 0, 0]) for (index_side_y = [0 : 1 : 1]) {
                    mirror([0, index_side_y, 0]) {
                        translate([0, offset_hole_y_rear, 0]) cylinder(R_BED[2], d_hole_rear / 2, d_hole_rear / 2, center = true);
                    }
                }
            }
        }
        // top crate perimeter shaft holes
        for (index_side_x = [0 : 1 : 1]) {
            mirror([index_side_x, 0, 0]) {
                translate([R_BED[0] / 2 - D_WASHER_SHAFT_TOP_CRATE / 2, 0, 0]) for (index_shaft_y = [0 : 1 : count_shafts_y]) {
                    translate([0, -R_BED[1] / 2 + D_WASHER_SHAFT_TOP_CRATE / 2 + index_shaft_y * (R_BED[1] - D_WASHER_SHAFT_TOP_CRATE) / (count_shafts_y - 1), 0]) cylinder(R_BED[2], D_SHAFT_TOP_CRATE / 2, D_SHAFT_TOP_CRATE / 2, center = true);
                }
            }
        }
    }
    // Shopping
    echo(str("Bed: MDF board ", R_BED[1], "mm x ", R_BED[0], "mm x ", R_BED[2], "mm - x1"));
}

bed();
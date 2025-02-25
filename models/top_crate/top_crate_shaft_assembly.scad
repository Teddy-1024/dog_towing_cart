include <../../config.scad>;
use <./fixing_top_crate_shaft.scad>;

module top_crate_shaft_assembly() {
    echo("Top crate shaft assembly:");
    union() {
        // shafts along y
        for (index_side_x = [0 : 1 : 1]) {
            mirror([index_side_x, 0, 0]) {
                translate([R_BED[0] / 2 - D_WASHER_SHAFT_TOP_CRATE / 2, 0, 0]) for (index_shaft_y = [0 : 1 : COUNT_SHAFTS_TOP_CRATE_Y - 1]) {
                    translate([0, -R_BED[1] / 2 + D_WASHER_SHAFT_TOP_CRATE / 2 + index_shaft_y * (R_BED[1] - D_WASHER_SHAFT_TOP_CRATE) / (COUNT_SHAFTS_TOP_CRATE_Y - 1), 0]) fixing_top_crate_shaft();
                }
            }
        }
        // shafts along x
        if (COUNT_SHAFTS_TOP_CRATE_X > 2) {
            for (index_side_y = [0 : 1 : 1]) {
                mirror([0, index_side_y, 0]) {
                    translate([0, R_BED[1] / 2 - D_WASHER_SHAFT_TOP_CRATE / 2, 0]) for (index_shaft_x = [1 : 1 : COUNT_SHAFTS_TOP_CRATE_X - 2]) {
                        translate([-R_BED[0] / 2 + D_WASHER_SHAFT_TOP_CRATE / 2 + index_shaft_x * (R_BED[0] - D_WASHER_SHAFT_TOP_CRATE) / (COUNT_SHAFTS_TOP_CRATE_X - 1), 0, 0]) fixing_top_crate_shaft();
                    }
                }
            }
        }
    }
    // Shopping
}

top_crate_shaft_assembly();
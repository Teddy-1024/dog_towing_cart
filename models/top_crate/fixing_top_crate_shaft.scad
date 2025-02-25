include <../../config.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/metric_nut.scad>;
use <../common/washer.scad>;

module fixing_top_crate_shaft() {
    echo("Fixing top crate shaft:");
    h_nut = get_metric_bolt_head_height(D_SHAFT_TOP_CRATE);
    union() {
        // shaft (threaded rod)
        color(COLOUR_ROD_THREADED) translate([0, 0, -R_BED[2] / 2 - T_WASHER_SHAFT_TOP_CRATE * COUNT_WASHERS_SHAFT_TOP_CRATE_EACH_END - h_nut]) cylinder(L_SHAFT_TOP_CRATE, D_SHAFT_TOP_CRATE / 2, D_SHAFT_TOP_CRATE / 2, center = false);
        // fixing
        for (index_side_bed_z = [0 : 1 : 1]) {
            mirror([0, 0, index_side_bed_z]) {
                // washers
                for (index_washer = [0 : 1 : COUNT_WASHERS_SHAFT_TOP_CRATE_EACH_END]) {
                    translate([0, 0, R_BED[2] / 2 + T_WASHER_SHAFT_TOP_CRATE * index_washer]) washer(T_WASHER_SHAFT_TOP_CRATE, D_WASHER_SHAFT_TOP_CRATE, D_SHAFT_TOP_CRATE, centre = false);
                }
                // nuts
                translate([0, 0, R_BED[2] / 2 + T_WASHER_SHAFT_TOP_CRATE * COUNT_WASHERS_SHAFT_TOP_CRATE_EACH_END]) metric_nut(D_SHAFT_TOP_CRATE, centre = false);
            }
        }
    }
    // Shopping
    echo(str("Top crate shaft: Threaded Steel rod M", D_SHAFT_TOP_CRATE, " x ", L_SHAFT_TOP_CRATE, "mm - x1"));
    // Fixing washers
    // Fixing nuts
}

fixing_top_crate_shaft();
include <../../config.scad>;
use <../common/metric_nut.scad>;
use <../common/washer.scad>;

module fixing_brake_ballscrew_to_brake_arms() {
    h_nut = get_metric_bolt_head_height(D_BRAKE_BALLSCREW_AXLE);
    count_nuts_each_side = 2;
    union() {
        // ballscrew positioning plate
        color(COLOUR_FILAMENT_3D_PRINTER) cube(R_LEAD_FIXING_BRAKE_BALLSCREW_TO_BRAKE_ARMS, center = true);
        
        for (index_side_y = [0:1:1]) {
            mirror([0, index_side_y, 0]) {
                // washers
                translate([0, R_LEAD_FIXING_BRAKE_BALLSCREW_TO_BRAKE_ARMS[1] / 2 + T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL / 2, 0]) rotate([-90, 0, 0]) washer(T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_AXLE);
                // nuts
                for (index_nut = [0 : 1 : count_nuts_each_side - 1]) {
                    translate([0, R_LEAD_FIXING_BRAKE_BALLSCREW_TO_BRAKE_ARMS[1] / 2 + T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL + h_nut * index_nut, 0]) rotate([-90, 0, 0]) rotate([0, 0, 30 * index_nut]) metric_nut(D_BRAKE_BALLSCREW_AXLE, centre = false);
                }
            }
        }
    }
    // Shopping
    echo("Fixing brake ballscrew to brake arms: 3D printed component - x1");
    // Axle fastener washers
    // Axle fastener nuts
}

fixing_brake_ballscrew_to_brake_arms();
include <../../config.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/metric_nut.scad>;
use <../common/compression_spring.scad>;
use <../common/washer.scad>;


module brake_spring_load_assembly() {
    echo("Brake spring-load assembly:");
    /* design variables
        echo(str("DELTA_L_SPRING_BALLSCREW_MAX: ", DELTA_L_SPRING_BALLSCREW_MAX, "mm")); = 19
    */
    L_spring_free = 110;
    d_spring_outer = 21.6;
    d_spring_wire = 1.6;
    pitch = L_spring_free / 8;
    
    h_nut = get_metric_bolt_head_height(D_BRAKE_BALLSCREW_AXLE);
    d_nut = get_metric_bolt_head_diameter(D_BRAKE_BALLSCREW_AXLE);
    
    union() {
        // washer rear
        rotate([-90, 0, 0]) washer(T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_AXLE, false);
        // spring
        translate([0, T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL + L_spring_free / 2, 0]) rotate([-90, 0, 0]) compression_spring(L_spring_free, d_spring_outer, d_spring_outer - d_spring_wire * 2, pitch);
        // washer front
        translate([0, T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL + L_spring_free, 0]) rotate([-90, 0, 0]) washer(T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_WASHER_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_AXLE, false);
        // nut(s)
        color("gray") for (index_nut = [0 : 1 : 1]) {
            translate([0, T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL * 2 + L_spring_free + index_nut * h_nut, 0]) rotate([-90, 0, 0]) rotate([0, 0, index_nut * 30]) metric_nut(D_BRAKE_BALLSCREW_AXLE, centre = false); // cylinder(h_nut, d_nut / 2, d_nut / 2, center = false);
        }
    }
    // Shopping
    // spring
    // https://uk.rs-online.com/web/p/compression-springs/0121242
    // washers
    // nuts
}

// $fn = 20;
brake_spring_load_assembly();



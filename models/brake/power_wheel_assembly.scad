include <../../config.scad>;
use <../common/beam_hexagonal.scad>
use <../common/metric_nut.scad>;
use <../common/metric_bolt_functions.scad>;
use <../common/washer.scad>


module power_wheel_assembly() {
    echo("Power wheel assembly:");
    d_nut = get_metric_bolt_head_diameter(D_BRAKE_BALLSCREW_AXLE);
    h_nut = get_metric_bolt_head_height(D_BRAKE_BALLSCREW_AXLE);
    union() {
        // power wheel
        rotate([90, 0, 0]) {
            color(COLOUR_FILAMENT_3D_PRINTER) difference() {
                // body
                cylinder(T_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_POWER_WHEEL / 2, D_BRAKE_BALLSCREW_POWER_WHEEL / 2, center = true);
                // nut slot
                beam_hexagonal(h_nut, d_nut, centre = true, suppress_shopping_outputs = true); // cylinder(T_BRAKE_BALLSCREW_POWER_WHEEL, d_nut / 2, d_nut / 2, center = true);
            }
            // ballscrew bearing (nut)
            /*
            color("gray") difference() {
                // body
                cylinder(T_BRAKE_BALLSCREW_POWER_WHEEL, d_nut / 2, d_nut / 2, center = true);
                // hole
                cylinder(T_BRAKE_BALLSCREW_POWER_WHEEL, D_BRAKE_BALLSCREW_AXLE / 2, D_BRAKE_BALLSCREW_AXLE / 2, center = true);
            }
            */
            metric_nut(D_BRAKE_BALLSCREW_AXLE);
        }
    }
    // Shopping
    echo("Power wheel: 3D printed component - x1");
    // Power wheel bearing (nut)
}

power_wheel_assembly();


// include <../../config.scad>;
use <./beam_hexagonal.scad>;
use <./metric_bolt_functions.scad>;

module metric_nut(size, centre = true) {
    height = get_metric_bolt_head_height(size);
    diameter = get_metric_bolt_head_diameter(size);
    radius = diameter / 2;
    color("gray") difference() {
        // body
        beam_hexagonal(height, diameter, centre = centre, suppress_shopping_outputs = true);
        // hole
        cylinder(height, size / 2, size / 2, center = centre);
    }
    // Shopping
    echo(str("Nut: Nut M", size, " - x1"));
}

// $fn = 200;
metric_nut(12);
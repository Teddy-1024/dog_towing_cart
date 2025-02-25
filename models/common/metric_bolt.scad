// include <../../config.scad>;
use <./beam_hexagonal.scad>;
use <./metric_bolt_functions.scad>;
use <./metric_nut.scad>;

module metric_bolt(size, length, has_nut = true, offset_nut_from_end = 0) {
    echo("Metric bolt assembly:");
    head_height = get_metric_bolt_head_height(size);
    head_diameter = get_metric_bolt_head_diameter(size);
    head_radius = head_diameter / 2;
    color("gray") union() {
        // Stem
        cylinder(length, size / 2, size / 2, center = true);
        // Head
        translate([0, 0, length / 2 - size / 2]) beam_hexagonal(head_height, head_diameter, centre = true, suppress_shopping_outputs = true);
        if (has_nut) {
            // Nut
            translate([0, 0, -(length / 2 - size / 2) + offset_nut_from_end]) metric_nut(size);
        }
    }
    // Shopping
    echo(str("Bolt: Bolt M", size, " x ", length, "mm - x1"));
}

// $fn = 200;
metric_bolt(12, 100);
translate([30, 0, 0]) metric_bolt(12, 100, false);
translate([60, 0, 0]) metric_bolt(12, 100, true, 5);
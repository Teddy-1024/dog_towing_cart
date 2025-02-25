include <../../config.scad>;
use <./tube_clamp_round_3_way_through_116_functions.scad>;

module tube_clamp_round_3_way_through_116(tube_diameter) {
    t = get_thickness_round_3_way_through_116(tube_diameter);
    L_shaft_long = get_L_shaft_long_round_3_way_through_116(tube_diameter);
    L_shaft_short = get_L_shaft_short_round_3_way_through_116(tube_diameter);
    color("LightGrey") difference() {
        union() {
            // short horizontal section
            rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
            // long vertical section
            translate([0, 0, L_shaft_long / 2]) rotate([0, 0, 0]) cylinder(L_shaft_long, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
            // long horizontal section
            translate([0, L_shaft_long / 2, 0]) rotate([90, 0, 0]) cylinder(L_shaft_long, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
        }
        rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2, tube_diameter / 2, center = true);
        translate([0, 0, L_shaft_long / 2]) rotate([0, 0, 0]) cylinder(L_shaft_long, tube_diameter / 2, tube_diameter / 2, center = true);
        translate([0, L_shaft_long / 2, 0]) rotate([90, 0, 0]) cylinder(L_shaft_long, tube_diameter / 2, tube_diameter / 2, center = true);
    }
    // Shopping
    echo("Round 3-way through 116: Tube clamp - x1");
}

// test output
tube_clamp_round_3_way_through_116(27);
translate([200, 0, 0]) tube_clamp_round_3_way_through_116(42);
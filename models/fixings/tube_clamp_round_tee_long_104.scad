include <../../config.scad>;
use <./tube_clamp_round_tee_long_104_functions.scad>;

module tube_clamp_round_tee_long_104(tube_diameter) {
    t = 7;
    L_shaft_long = get_L_shaft_long_round_tee_long_104(tube_diameter);
    L_shaft_short = get_L_shaft_short_round_tee_long_104(tube_diameter);
    color("LightGrey") difference() {
        union() {
            // long edge
            cylinder(L_shaft_long, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
            // short perpendicular section
            translate([L_shaft_short / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
        }
        cylinder(L_shaft_long, tube_diameter / 2, tube_diameter / 2, center = true);
        translate([L_shaft_short / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2, tube_diameter / 2, center = true);
    }
    // Shopping
    echo("Round tee long 104: Tube clamp - x1");
}

// test output
tube_clamp_round_tee_long_104(27);
translate([200, 0, 0]) tube_clamp_round_tee_long_104(42);
include <../../config.scad>;

function  get_L_shaft_long_round_3_way_outlet_tee_176(tube_diameter) = 
    (tube_diameter == 27) ? 
        85
    : (tube_diameter == 42) ?
        122
    : 25
;
function get_L_shaft_short_round_3_way_outlet_tee_176(tube_diameter) = 
    (tube_diameter == 27) ? 
        42
    : (tube_diameter == 42) ?
        61
    : 10
;

module tube_clamp_round_3_way_outlet_tee_176(tube_diameter) {
    t = 7;
    L_shaft_long = get_L_shaft_long_round_3_way_outlet_tee_176(tube_diameter);
    L_shaft_short = get_L_shaft_short_round_3_way_outlet_tee_176(tube_diameter);
    color("LightGrey") difference() {
        union() {
            // long edge
            cylinder(L_shaft_long, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
            // short perpendicular section
            translate([L_shaft_short / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
        }
        cylinder(L_shaft_long, tube_diameter / 2, tube_diameter / 2, center = true);
        translate([L_shaft_short / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_shaft_short, tube_diameter / 2, tube_diameter / 2, center = true);
        rotate([90, 0, 0]) cylinder(L_shaft_long, tube_diameter / 2, tube_diameter / 2, center = true);
    }
    // Shopping
    echo("Round 3-way outlet tee 176: Tube clamp - x1");
}

// test output
tube_clamp_round_3_way_outlet_tee_176(27);
translate([200, 0, 0]) tube_clamp_round_3_way_outlet_tee_176(42);
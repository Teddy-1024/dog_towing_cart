include <../../config.scad>;
use <./tube_clamp_round_base_plate_132_functions.scad>;

module tube_clamp_round_base_plate_132(tube_diameter) {
    L_shaft_with_base_plate = get_L_shaft_with_base_plate_round_base_plate_132(tube_diameter);
    R_plate = get_R_plate_round_base_plate_132(tube_diameter);
    t = R_plate[2];
    offset_hole_y = get_offset_hole_y_round_base_plate_132(tube_diameter);
    d_hole_bolt_round_base_plate_132 = get_diameter_hole_round_base_plate_132(tube_diameter);
    color("LightGrey") union() {
        // cylinder section
        translate([0, 0, L_shaft_with_base_plate / 2]) difference() {
            cylinder(L_shaft_with_base_plate, tube_diameter / 2 + t, tube_diameter / 2 + t, center = true);
            cylinder(L_shaft_with_base_plate, tube_diameter / 2, tube_diameter / 2, center = true);
        }
        // base plate
        translate([0, 0, R_plate[2] / 2]) difference() {
            cube(R_plate, center = true);
            translate([0, offset_hole_y, 0]) cylinder(R_plate[2], d_hole_bolt_round_base_plate_132 / 2, d_hole_bolt_round_base_plate_132 / 2, center = true);
            translate([0, -offset_hole_y, 0]) cylinder(R_plate[2], d_hole_bolt_round_base_plate_132 / 2, d_hole_bolt_round_base_plate_132 / 2, center = true);
        }
    }
    // Shopping
    echo(str("Round base plate 132: Tube clamp Φ", tube_diameter, "mm - x1"));
}

// test output
tube_clamp_round_base_plate_132(27);
translate([200, 0, 0]) tube_clamp_round_base_plate_132(42);
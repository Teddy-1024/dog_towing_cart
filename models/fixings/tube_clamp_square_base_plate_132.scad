include <../../config.scad>;
use <./tube_clamp_square_base_plate_132_functions.scad>;

module tube_clamp_square_base_plate_132(beam_width) {
    L_shaft_with_base_plate = get_L_shaft_with_base_plate_square_base_plate_132(beam_width);
    R_plate = get_R_plate_square_base_plate_132(beam_width);
    t = get_thickness_square_base_plate_132(beam_width);
    offset_hole_x = get_offset_hole_x_square_base_plate_132(beam_width);
    d_hole_bolt_square_base_plate_132 = get_diameter_hole_square_base_plate_132(beam_width);
    color("LightGrey") union() {
        // shaft section
        translate([0, 0, L_shaft_with_base_plate / 2]) difference() {
            cube([beam_width + t * 2, beam_width + t * 2, L_shaft_with_base_plate], center = true);
            cube([beam_width, beam_width, L_shaft_with_base_plate], center = true);
        }
        // base plate
        translate([0, 0, R_plate[2] / 2]) difference() {
            cube(R_plate, center = true);
            translate([offset_hole_x, 0, 0]) cylinder(R_plate[2], d_hole_bolt_square_base_plate_132 / 2, d_hole_bolt_square_base_plate_132 / 2, center = true);
            translate([-offset_hole_x, 0, 0]) cylinder(R_plate[2], d_hole_bolt_square_base_plate_132 / 2, d_hole_bolt_square_base_plate_132 / 2, center = true);
        }
    }
    // Shopping
    echo("Square base plate 132: Tube clamp - x1");
}

// test output
tube_clamp_square_base_plate_132(42);
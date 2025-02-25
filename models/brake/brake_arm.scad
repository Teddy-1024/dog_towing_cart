include <../../config.scad>;


module brake_arm() {
    L_big = 2 * max(R_BRAKE_ARM);
    color(COLOUR_BEAM_ALUMINIUM) difference() {
        // body
        cube(R_BRAKE_ARM, center = true);
        // chamfer across end face for wheel overlap
        translate([R_BRAKE_ARM[0] / 2 - R_BRAKE_ARM[1] / 2 * tan(ANGLE_BRAKE_ROD_MAX), 0, 0]) rotate([0, 0, -(90 - ANGLE_BRAKE_ROD_MAX)]) translate([0, -L_big / 2, -L_big / 2]) cube(L_big, center = false);
    }
    // Shopping
    echo(str("Brake arm: Aluminium sheet ", R_BRAKE_ARM[1], "mm x ", R_BRAKE_ARM[0], "mm x ", R_BRAKE_ARM[2], "mm - x1"));
}

brake_arm();

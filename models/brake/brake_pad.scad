include <../../config.scad>;


module brake_pad() {
    union() {
        color("black") cube(R_BRAKE_PAD, center = true);
        color("gray") translate([-R_BRAKE_PAD[0] / 2 - L_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, 0, 0]) rotate([0, 90, 0]) cylinder(L_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD / 2, center = true);
    }
    // Shopping
    echo(str("Brake pad: Bike V-brake pad - x1"));
}

brake_pad();
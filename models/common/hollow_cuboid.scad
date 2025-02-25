// include <../../config.scad>;

module hollow_cuboid(R, t) {
    difference() {
        cube(R, center = true);
        cube([R[0] - t * 2, R[1] - t * 2, R[2] - t * 2], center = true);
    }
    // Shopping
    echo(str("Hollow cuboid: Hollow cuboid ", R[0], "mm x ", R[1], "mm x ", R[2], "mm x ", R[3], "mm - x1"));
}

hollow_cuboid([100, 200, 300], 5);
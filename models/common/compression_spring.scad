// include <../../config.scad>;

module compression_spring(L_free, d_outer, d_inner, pitch) {
    r_wire = (d_outer - d_inner) / 2;
    r_mean = (d_outer + d_inner) / 4;
    angle_rotation = 360 * L_free / pitch;
    color("DimGray") union() {
        difference() {
            // spiral
            linear_extrude(height = L_free - r_wire * 2, center = true, convexity = 10, twist = angle_rotation) translate([r_mean, 0, 0]) scale([1, 3, 1]) circle(r_wire);
            // end blocks
        }
        // ring top
        translate([0, 0, L_free / 2 - r_wire]) rotate_extrude(angle = 360) translate([r_mean, 0, 0]) circle(r_wire);
        // ring bottom
        translate([0, 0, -L_free / 2 + r_wire]) rotate_extrude(angle = 360) translate([r_mean, 0, 0]) circle(r_wire);
    }
    // Shopping
    echo(str("Compression spring: Compression spring Φ", d_outer, "mm x ", d_inner, "mm x ", L_free, "mm - x1"));
}

// $fn = 20;
compression_spring(100, 25, 20, 10);

include <../../config.scad>;

module washer(t, d_outer, d_inner, centre = true) {
    r_outer = d_outer / 2;
    r_inner = d_inner / 2;
    color("silver") difference() {
        cylinder(t, r_outer, r_outer, center = centre);
        cylinder(t, r_inner, r_inner, center = centre);
    }
    // Shopping
    echo(str("Washer: Washer Φ", d_outer, "mm x ", d_inner, "mm x ", t, "mm - x1"));
}

// $fn = 200;
washer(3, 10, 40);
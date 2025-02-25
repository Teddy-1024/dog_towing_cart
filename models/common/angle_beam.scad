
module angle_beam(L, w, t, centre = true) {
    R_offset_centre = [-w / 2, -w / 2, -L / 2];
    translate(centre ? R_offset_centre : [0, 0, 0]) union() {
        cube([w, t, L], center = false);
        cube([t, w, L], center = false);
    }
    // Shopping
    echo(str("Rectangular Aluminium angle beam: Rectangular Aluminium angle beam ", L, "mm x ", w, "mm x ", t, "mm - x1"));
    // https://www.metals4u.co.uk/materials/aluminium/aluminium-angle/aa25-4x25-4x4-8-p
}

angle_beam(500, 50, 5);
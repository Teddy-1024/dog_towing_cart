
module beam_hollow_rectangular(L, w, d, t, suppress_shopping_outputs = false) {
    difference() {
        cube([w, d, L], center = true);
        cube([w - t * 2, d - t * 2, L], center = true);
    }
    // Shopping
    if (!suppress_shopping_outputs) {
        echo(str("Rectangular Aluminium hollow beam: Rectangular Aluminium hollow beam ", L, "mm x ", w, "mm x ", d, "mm x ", t, "mm - x1"));
    }
}

beam_hollow_rectangular(500, 50, 30, 5);
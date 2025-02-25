// include <../../config.scad>;

module beam_hexagonal(L, d, centre = true, suppress_shopping_outputs = false) {
    radius = d / 2;
    linear_extrude(L, center = centre) polygon([[radius, 0], [radius * cos(60), radius * sin(60)], [radius * cos(120), radius * sin(120)], [radius * cos(180), radius * sin(180)], [radius * cos(240), radius * sin(240)], [radius * cos(300), radius * sin(300)]]);
    // Shopping
    if (!suppress_shopping_outputs) {
        echo(str("Hexagonal beam: Hexagonal beam Φ", d, "mm x ", L, "mm - x1"));
    }
}

// $fn = 200;
beam_hexagonal(500, 50);
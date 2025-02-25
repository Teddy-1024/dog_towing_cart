include <../../config.scad>;
use <./beam_hollow_rectangular.scad>;

module beam_hollow_square(L, D, T) {
    color(COLOUR_BEAM_ALUMINIUM) beam_hollow_rectangular(L, D, D, T, suppress_shopping_outputs = true);
    // Shopping
    echo(str("Square Aluminium hollow beam: Square Aluminium hollow beam ", L, "mm x ", D, "mm x ", D, "mm x ", T, "mm - x1"));
}

beam_hollow_square(L, D, T);
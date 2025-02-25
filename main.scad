// Molly Dog Towing Cart
echo("Shopping");

include <./config.scad>;
use <./models/dog_cart/dog_cart.scad>;

// Customisable parameters
angle_incline_tiller = 20; // [-20:5:135]
angle_brake_rod = 60; // [45:5:60]

$fn = 100;

// output
dog_cart(angle_incline_tiller, angle_brake_rod);

/*
Shopping
Components

Tools
M10 tap (HSS) - size change, check spreadsheet
*/
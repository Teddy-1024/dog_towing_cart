// Molly Dog Towing Cart

include <../../config.scad>;
use <../bed/bed.scad>;
use <../top_crate/top_crate_shaft_assembly.scad>;
use <../rear_drive/rear_drive_assembly.scad>;
use <../brake/brake_assembly.scad>;
use <../front_drive/front_drive_assembly.scad>;

module dog_cart(angle_incline_tiller, angle_brake_rod) {
    echo("Dog cart assembly:");
    // bed
    bed();
    // top crate shaft assembly
    top_crate_shaft_assembly();
    // rear drive assembly
    rear_drive_assembly();
    // brake assembly
    translate([0, 0, -R_BED[2] / 2]) brake_assembly(angle_brake_rod);
    // front drive assembly
    front_drive_assembly(angle_incline_tiller);
    
    // Shopping
    // bed
    // top crate shaft assembly
    // rear drive assembly
    // front drive assembly
}

// output
dog_cart(20);

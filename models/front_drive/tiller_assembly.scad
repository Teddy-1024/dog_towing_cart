include <../../config.scad>;
use <./tiller_joint.scad>;
use <../common/metric_bolt.scad>;
use <../fixings/tube_clamp_round_tee_long_104.scad>;

module tiller_assembly(angle_incline_tiller) {
    echo("Tiller assembly:");
    /*
    t_universal_joint = get_universal_joint_thickness();
    d_universal_joint = get_universal_joint_d();
    d_hole_universal_joint = get_universal_joint_d_hole();
    d_hole_bore_universal_joint = get_universal_joint_d_bore_hole();
    L_universal_joint = get_universal_joint_length();
    joint_axial_offset = get_universal_joint_joint_axial_offset();
    pin_axial_offset = get_universal_joint_pin_axial_offset();
    L_hole = t_universal_joint + d_hole_universal_joint / 2 + pin_axial_offset;
    L_bolt_fastener =  D_AXLE_FRONT + d_hole_universal_joint * 4 + T_WASHER_UNIVERSAL_JOINT;
    echo("t_universal_joint", t_universal_joint, "mm");
    echo("d_hole_universal_joint", d_hole_universal_joint, "mm");
    echo("pin_axial_offset", pin_axial_offset, "mm");
    echo("L_hole", t_universal_joint + d_hole_universal_joint / 2 + pin_axial_offset, "mm");
    echo("L_universal_joint / 2 - joint_axial_offset - L_hole", L_universal_joint / 2 - joint_axial_offset - L_hole, "mm");
    */
    
    union() {
        // tiller
        color(COLOUR_BEAM_ALUMINIUM) difference() {
            // body
            rotate([-90, 0, 0]) cylinder(L_TILLER, D_AXLE_FRONT / 2, D_AXLE_FRONT / 2, center = false);
            // joint fastening hole normal
            translate([L_TILLER - OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL, 0, 0]) cylinder(D_AXLE_FRONT, SIZE_BOLT_JOINT_TILLER_EXTENSION / 2, SIZE_BOLT_JOINT_TILLER_EXTENSION / 2, center = false);
        }
        /*
        // universal joint
        translate([L_TILLER - L_hole, 0, 0]) universal_joint();
        // tiller universal joint fastening
        translate([L_TILLER - L_hole / 2, 0, 0]) metric_bolt(d_hole_universal_joint, L_bolt_fastener);
        */
        // tiller joint
        translate([0, L_TILLER + L_JOINT_TILLER_EXTENSION / 2 - OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL * 2, 0]) tiller_joint();
        // tiller extension
        translate([0, L_TILLER + L_JOINT_TILLER_EXTENSION - OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL * 4, 0]) rotate([angle_incline_tiller, 0, 0]) {
            color(COLOUR_BEAM_ALUMINIUM) difference() {
                // body
                rotate([-90, 0, 0]) cylinder(L_TILLER_EXTENSION, D_HANDLE_BAR / 2, D_HANDLE_BAR / 2, center = false);
                // joint fastening hole normal
                translate([0, OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL, 0]) cylinder(D_AXLE_FRONT, SIZE_BOLT_JOINT_TILLER_EXTENSION / 2, SIZE_BOLT_JOINT_TILLER_EXTENSION / 2, center = false);
            }
            // handle beam
            color(COLOUR_BEAM_ALUMINIUM) translate([0, L_TILLER_EXTENSION + D_HANDLE_BAR / 2, 0]) rotate([0, 90, 0]) cylinder(W_HANDLE_BAR, D_HANDLE_BAR / 2, D_HANDLE_BAR / 2, center = true);
            // handle fixing
            translate([0, L_TILLER_EXTENSION + D_HANDLE_BAR / 2, 0]) rotate([90, 0, -90]) tube_clamp_round_tee_long_104(D_HANDLE_BAR);
        }
    }
    // Shopping
    echo(str("Tiller: Round Aluminium bar Φ", D_AXLE_FRONT, "mm x ", L_TILLER, "mm - x1"));
    // Tiller extension joint
    echo(str("Tiller extension: Round Aluminium bar Φ", D_HANDLE_BAR, "mm x ", L_TILLER_EXTENSION, "mm - x1"));
    echo(str("Handle bar: Round Aluminium bar Φ", D_HANDLE_BAR, "mm x ", W_HANDLE_BAR, "mm - x1"));
    // Handle fixing
}

// $fn = 100;
tiller_assembly(20);
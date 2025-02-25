include <../../config.scad>;

function get_universal_joint_length() = 40;
function get_universal_joint_d_bore_hole() = 6;
function get_universal_joint_d_hole() = 4;
function get_universal_joint_d() = 11;
function get_universal_joint_thickness() = (get_universal_joint_d() - get_universal_joint_d_bore_hole()) / 2;
function get_universal_joint_joint_axial_offset() = get_universal_joint_thickness() * 2;
function get_universal_joint_pin_axial_offset() = get_universal_joint_thickness() + get_universal_joint_d_hole() / 2;

module universal_joint() {
    echo("Universal joint assembly: ERROR MISSING");
    L = get_universal_joint_length();
    t = get_universal_joint_thickness();
    joint_axial_offset = get_universal_joint_joint_axial_offset();
    translate([L / 2, 0, 0]) mirror([1, 0, 0]) universal_joint_half();
    translate([L / 2 - joint_axial_offset, 0, 0]) rotate([90, -ANGLE_INCLINE_TILLER, 0]) translate([-joint_axial_offset, 0, 0]) universal_joint_half();
}

module universal_joint_half() {
    d_hole_bore = get_universal_joint_d_bore_hole();
    d_hole = get_universal_joint_d_hole();
    d = get_universal_joint_d();
    L = get_universal_joint_length();
    t = get_universal_joint_thickness();
    joint_axial_offset = get_universal_joint_joint_axial_offset();
    pin_axial_offset = get_universal_joint_pin_axial_offset();
    color("orange") union() { 
        difference() {
            // body
            rotate([0, 90, 0]) cylinder(L / 2, d / 2, d / 2, center = false);
            // threaded hole
            translate([L - pin_axial_offset, 0, 0]) cylinder(d, d_hole / 2, d_hole / 2, center = true);
            // bore hole
            rotate([0, 90, 0]) cylinder(L / 2, d_hole / 2, d_hole / 2, center = false);
            // joint slot
            translate([L / 8, 0, 0]) cube([L / 4, d - t * 2, d], center = true);
        }
        // joint
        translate([joint_axial_offset, 0, 0]) rotate([90, 0, 0]) cylinder(d, t, t, center = true);
    }
}

// output
translate([100, 0, 0]) universal_joint_half();
universal_joint();

// shopping
//https://www.amazon.co.uk/Ohamtes-diameter-universal-coupling-Rotatable/dp/B09NXCKJY7/ref=sr_1_1_sspa?crid=3DS7BH7WHYTF4&dib=eyJ2IjoiMSJ9.qTSAOeHpLAIx1plz8THvnJuCvLh8y4zf-H37BRTvT5TTF4M6kqHBg50e-40C5hjdmTAPJLEgHg0Jx5cbB8m_wQM7WCaEibSQJBNZnTwHBZ3w0jHw-znfaRDSaMRP0xlHOblYtwBc9XbF5-KNpHR9dtRmXPDooHcnFM8vchBOqGp-5rR5c6o9Nh0TCq9APO-csslNPAa4bTVjWtniflkcqc39VaQL55CghNaz2NQGdQRrifAgcEqwIM5BpJODfEizqzlotNlbrk6F1gdAZw2clQOw5dIVvjbKLGTCgXnK2xI.vL2JYm04p6ohOn9Jf1OMaPuo9PoqjzItE0AQg2irL0E&dib_tag=se&keywords=UNIVERSAL%2BJOINT&qid=1739725484&sprefix=universal%2Bjoint%2Caps%2C66&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&th=1
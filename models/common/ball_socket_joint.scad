include <../../config.scad>;

/*
function get_universal_joint_length() = 40;
function get_universal_joint_d_bore_hole() = 6;
function get_universal_joint_d_hole() = 4;
function get_universal_joint_d() = 11;
function get_universal_joint_thickness() = (get_universal_joint_d() - get_universal_joint_d_bore_hole()) / 2;
function get_universal_joint_joint_axial_offset() = get_universal_joint_thickness() * 2;
function get_universal_joint_pin_axial_offset() = get_universal_joint_thickness() + get_universal_joint_d_hole() / 2;

module ball_socket_joint() {
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

*/

// shopping
// https://www.amazon.co.uk/HiPicco-Universal-M5-Automotive-Cupboard/dp/B0BK28WXY8/ref=sr_1_21?crid=6A6OMRNKNXFR&dib=eyJ2IjoiMSJ9.e8gSWrg3UPxR5gMbATNC91I6qERE0rN5FCcOtnZJmGbFIHW9Rz6Rtq02WZj_C2CYgbwA8KHdd1W1xyOxZrH60UtwiGKd9MkmAbd09h9ACi4yGnbOLjhWb-Iboe0IZ_tvxh3XFdo4ygZ-iV98DODCXzl1WdVpTyUg3N4bok5qGtTP2CWfzPOmUFwyTe7_snV4fb7jlTGHK_ks3tR4FSDiUtCwEnuzxJUqdZSRNp4EhGo.2_e9Kal7A7FfEcIzWVEzQXH2zOWiECkGj9UqjIb_8XQ&dib_tag=se&keywords=metric%2Bball%2BJOINT&qid=1739814661&sprefix=metric%2Bball%2Bjoint%2Caps%2C99&sr=8-21&th=1
include <../../config.scad>;

module wheel() {
    r_wheel = D_WHEEL / 2;
    r_wheel_bore = D_WHEEL_BORE / 2;
    color("red") rotate([0, 90, 0]) difference() {
        cylinder(T_WHEEL, r_wheel, r_wheel, center = true);
        cylinder(T_WHEEL, r_wheel_bore, r_wheel_bore, center = true);
    }
    // Shopping
    echo("Wheel: Wheel - x1");
}
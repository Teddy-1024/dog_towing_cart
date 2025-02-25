
include <../../config.scad>;
use <../common/metric_bolt.scad>;
use <../common/washer.scad>;

module rear_wheel_fastener() {
    echo("Rear wheel fastener:");
    height_bolt_head = get_metric_bolt_head_height(SIZE_BOLT_REAR_WHEEL_POSITIONING);
    count_washers_each_end = 7;
    L_bolt = D_AXLE_REAR + 2 * height_bolt_head + 2 * T_WASHER_BOLT_REAR_WHEEL_POSITIONING * count_washers_each_end + L_BOLT_EXTENSION;
    union() {
        // bolt
        translate([0, 0, -L_BOLT_EXTENSION / 2]) metric_bolt(SIZE_BOLT_REAR_WHEEL_POSITIONING, L_bolt, true, L_BOLT_EXTENSION);
        for (index_side_bolt = [0 : 1 : 1]) {
            mirror([0, 0, index_side_bolt]) { 
                // washer
                for (index_washer = [0 : 1 : max(0, count_washers_each_end - 1)]) {
                    translate([0, 0, D_AXLE_REAR / 2 + T_WASHER_BOLT_REAR_WHEEL_POSITIONING * (index_washer + 1/2)]) washer(T_WASHER_BOLT_REAR_WHEEL_POSITIONING, D_WASHER_BOLT_REAR_WHEEL_POSITIONING, SIZE_BOLT_REAR_WHEEL_POSITIONING);
                }
            }
        }
    }
    // Shopping
    // bolt
    // echo(str("Bolt washer: Washer Φ", D_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm x ", T_WASHER_BOLT_REAR_WHEEL_POSITIONING, "mm - x", 2 * count_washers_each_end)); // Rear wheel fastener bolt washers
}

rear_wheel_fastener();

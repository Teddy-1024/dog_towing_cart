
use <./models/common/metric_bolt_functions.scad>;
use <./models/brake/brake_assembly_functions.scad>;
use <./models/fixings/tube_clamp_round_tee_long_104_functions.scad>;
use <./models/fixings/tube_clamp_round_3_way_through_116_functions.scad>;
use <./models/fixings/tube_clamp_round_base_plate_132_functions.scad>;
use <./models/fixings/tube_clamp_square_base_plate_132_functions.scad>;

// Configuration
R_BED = [400, 1200, 18];
T_WHEEL = 100;
D_WHEEL = 400;
D_WHEEL_BORE = 25;

T_PLATE = 8;
T_CLAMP = 20;

// D_AXIS = 25;
D_AXLE_FRONT = 42;
D_AXLE_REAR = 27;
Y_POS_AXLE_FRONT = R_BED[1] / 2 - D_WHEEL / 2;
Y_POS_AXLE_REAR = -R_BED[1] / 2 + D_WHEEL / 2;
X_POS_WHEEL_CENTRE = R_BED[0] / 2 + T_WHEEL / 2;

SPACING_XY_BED_BORDER = 10;
Z_OVERLAP_TEE_CLAMP_ROUND = 80;
Z_OFFSET_WHEEL_TO_BED_BASE = 5;
Z_OFFSET_BED_TO_AXLE = D_WHEEL / 2 + Z_OFFSET_WHEEL_TO_BED_BASE;
M_TOTAL = 160;

L_BOLT_EXTENSION = 10;
SIZE_BOLT = 25; // M25
SIZE_BOLT_REAR_WHEEL_POSITIONING = 10;
T_WASHER_BOLT_REAR_WHEEL_POSITIONING = 1.5;
D_WASHER_BOLT_REAR_WHEEL_POSITIONING = 30; // get_metric_bolt_washer_diameter_safe_working_clearance(SIZE_BOLT_REAR_WHEEL_POSITIONING);
T_WASHER_AXLE_REAR_WHEEL_POSITIONING = 4;
D_WASHER_AXLE_REAR_WHEEL_POSITIONING = 50;
SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING = 1;

R_FIXING_AXLE_LEG_REAR_TO_BED = get_R_plate_round_base_plate_132(D_AXLE_REAR);
L_SHAFT_AXLE_FIXING_AXLE_REAR_TO_LEG = get_L_shaft_long_round_tee_long_104(D_AXLE_REAR);
X_POS_AXLE_LEG_REAR = min(X_POS_WHEEL_CENTRE - T_WHEEL / 2 - SPACING_WASHER_AXLE_REAR_WHEEL_POSITIONING - T_WASHER_AXLE_REAR_WHEEL_POSITIONING - D_WASHER_BOLT_REAR_WHEEL_POSITIONING - L_SHAFT_AXLE_FIXING_AXLE_REAR_TO_LEG / 2, R_BED[0] / 2 - SPACING_XY_BED_BORDER - R_FIXING_AXLE_LEG_REAR_TO_BED[0] / 2);

// BRAKE
// THICKNESS_SHELL_BRAKE_BEAM = 5;
// L_BEAM_BRAKE_BELT_TENSION_FIXING = 150;
D_BEAM_BRAKE = 40;
T_BEAM_BRAKE = 5;
D_BRAKE_BALLSCREW_AXLE = 16; // M16 pitch 1.5
L_BRAKE_BALLSCREW_AXLE = 700;
D_BRAKE_BALLSCREW_POWER_WHEEL = 120;
T_BRAKE_BALLSCREW_POWER_WHEEL = get_metric_bolt_head_height(D_BRAKE_BALLSCREW_AXLE);
D_WASHER_BRAKE_BALLSCREW_POWER_WHEEL = 50; // get_metric_bolt_washer_diameter_safe_working_clearance(D_BRAKE_BALLSCREW_AXLE);
T_WASHER_BRAKE_BALLSCREW_POWER_WHEEL = 3;
Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE = 125; // D_BRAKE_BALLSCREW_POWER_WHEEL / 2 + 25;
Y_OFFSET_BALLSCREW_LEG_REAR_FIXING_FROM_END = 100;
Y_OFFSET_BALLSCREW_LEG_FRONT_FIXING_FROM_END = Y_OFFSET_BALLSCREW_LEG_REAR_FIXING_FROM_END + 100;
// L_BEAM_FIXING_BALLSCREW_TO_BED = D_BRAKE_BALLSCREW_AXLE + D_WASHER_FIXING_BALLSCREW_TO_BED * 2; // beam lying along bed, not perpendicular to bed
R_BASE_PLATE_FIXING_LEG_BRAKE_BALLSCREW_TO_BED = get_R_plate_square_base_plate_132(D_BEAM_BRAKE);
L_LEG_FIXING_BRAKE_BALLSCREW_TO_BED = Z_OFFSET_BALLSCREW_AXLE_TO_BED_BASE - R_BASE_PLATE_FIXING_LEG_BRAKE_BALLSCREW_TO_BED[2] + D_BEAM_BRAKE / 2;
R_LEAD_FIXING_BRAKE_BALLSCREW_TO_BRAKE_ARMS = [100, 10, D_BEAM_BRAKE];
X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE = D_BEAM_BRAKE;
ANGLE_BRAKE_ROD_MIN = 50; // angle between ballscrew axle and brake rod radius about pivot
ANGLE_BRAKE_ROD_MAX = 60; // atan((X_POS_AXLE_LEG_REAR - X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE) / Y_OFFSET_LEAD_FIXING_TO_AXLE_REAR_MIN);
SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 6; // M6
L_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 20; // 20-25mm
D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 25; // get_metric_bolt_washer_diameter_safe_working_clearance(SIZE_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD);
T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 1.5;
R_BRAKE_PAD = [10, 75, 10];
T_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 4.8;
W_FIXING_BRAKE_ARM_TO_BRAKE_PAD = 25.4;
R_BRAKE_ARM = [240, 75, 5]; // (X_POS_WHEEL_CENTRE - T_WHEEL / 2 - R_BRAKE_PAD[0] - T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD - X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE + tan(90 - ANGLE_BRAKE_ROD_MAX) * 75 / 2) / sin(ANGLE_BRAKE_ROD_MAX) // TOO SHORT?
L_FIXING_BRAKE_ARM_TO_BRAKE_PAD = D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD * 3; // R_BRAKE_PAD[1];
L_BRAKE_ARM_TOTAL = R_BRAKE_ARM[0] + R_BRAKE_PAD[0] + L_BOLT_FIXING_BRAKE_ARM_TO_BRAKE_PAD;
// Y_OFFSET_LEAD_FIXING_TO_AXLE_REAR_MIN = 50;
X_OFFSET_FIXING_BRAKE_ARM_TO_BRAKE_PAD_FROM_END = R_BRAKE_ARM[1] / 2 * tan(ANGLE_BRAKE_ROD_MAX);
// X_OFFSET_HOLE_AXLE_FROM_BRAKE_ARM_END_INNER = (X_POS_AXLE_LEG_REAR - X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE) / tan(ANGLE_BRAKE_ROD_MAX);
DELTA_L_SPRING_BALLSCREW_MAX = get_y_pos_lead_fixing_ballscrew_to_brake_arms(ANGLE_BRAKE_ROD_MIN, Y_POS_AXLE_REAR, X_POS_AXLE_LEG_REAR, X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE) - get_y_pos_lead_fixing_ballscrew_to_brake_arms(ANGLE_BRAKE_ROD_MAX, Y_POS_AXLE_REAR, X_POS_AXLE_LEG_REAR, X_OFFSET_FIXING_BRAKE_ARM_TO_LEAD_PLATE);
SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG = 10;
D_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG = 30; // get_metric_bolt_washer_diameter_safe_working_clearance(SIZE_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG);
T_WASHER_BOLT_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG = 1.5;
D_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG = 50;
T_WASHER_AXLE_FIXING_BRAKE_ARM_TO_REAR_AXLE_LEG = 4;

// ANGLE_INCLINE_TILLER = 20; // [-20:5:135]
ANGLE_INCLINE_TILLER_MAX = 101;
L_TILLER = R_BED[1] / 2 - Y_POS_AXLE_FRONT + D_AXLE_FRONT / 2 + Z_OFFSET_BED_TO_AXLE * tan(ANGLE_INCLINE_TILLER_MAX - 90);
// T_WASHER_UNIVERSAL_JOINT = 2; // Deprecated
L_TILLER_EXTENSION = 1000;
L_JOINT_TILLER_EXTENSION = 85;
SIZE_BOLT_JOINT_TILLER_EXTENSION = SIZE_BOLT_REAR_WHEEL_POSITIONING; // 6;
D_WASHER_TILLER_JOINT = D_WASHER_BOLT_REAR_WHEEL_POSITIONING; // 25;
T_WASHER_TILLER_JOINT = T_WASHER_BOLT_REAR_WHEEL_POSITIONING; // 3;
OFFSET_BOLT_JOINT_TILLER_EXTENSION_AXIAL = SIZE_BOLT_JOINT_TILLER_EXTENSION * 3 / 2;

D_HANDLE_BAR = 27;
W_HANDLE_BAR = 300;

SIZE_BOLT_FRONT_AXLE_BEARING = 20;
DEPTH_BOLT_FRONT_AXLE_BEARING = get_metric_bolt_head_height(SIZE_BOLT_FRONT_AXLE_BEARING);
T_JOINT_FRONT_AXLE_TO_TILLER = get_thickness_round_3_way_through_116(D_AXLE_FRONT);
T_WASHER_JOINT_FRONT_AXLE_TO_TILLER = 3;
D_WASHER_JOINT_FRONT_AXLE_TO_TILLER = 39; // get_metric_bolt_washer_diameter_safe_working_clearance(SIZE_BOLT_FRONT_AXLE_BEARING);
COUNT_WASHERS_JOINT_FRONT_AXLE_TO_TILLER = 3;
L_BOLT_FRONT_AXLE_BEARING = T_JOINT_FRONT_AXLE_TO_TILLER + 2 * DEPTH_BOLT_FRONT_AXLE_BEARING + D_AXLE_FRONT + COUNT_WASHERS_JOINT_FRONT_AXLE_TO_TILLER * T_WASHER_JOINT_FRONT_AXLE_TO_TILLER;

T_WASHER_BASE_PLATE = T_WASHER_BOLT_REAR_WHEEL_POSITIONING;
D_WASHER_BASE_PLATE = D_WASHER_BOLT_REAR_WHEEL_POSITIONING;

L_SHAFT_TOP_CRATE = 333;
D_SHAFT_TOP_CRATE = 16;
D_WASHER_SHAFT_TOP_CRATE = 50; // get_metric_bolt_washer_diameter_safe_working_clearance(D_SHAFT_TOP_CRATE);
T_WASHER_SHAFT_TOP_CRATE = 3;
COUNT_SHAFTS_TOP_CRATE_X = 2;
COUNT_SHAFTS_TOP_CRATE_Y = 3;
COUNT_WASHERS_SHAFT_TOP_CRATE_EACH_END = 3;


// Constants
SAFETY_FACTOR = 2;
PI = 3.1415926536;
G = 9.81;

COLOUR_ROD_THREADED = "Gray";
COLOUR_BEAM_ALUMINIUM = "DarkGray";
COLOUR_FILAMENT_3D_PRINTER = "HotPink";


// Engineering analysis
W_TOTAL_SAFE = M_TOTAL * G * SAFETY_FACTOR;

SHEAR_STRESS_YIELD_STAINLESS_STEEL = 200 * 10 ^ 6;
SHEAR_STRESS_YIELD_ALUMINIUM = 200 * 10 ^ 6;

/*
T_BOLT_MAX = PI * (D_AXLE_FRONT / 1000) ^ 3 / 16 * SHEAR_STRESS_YIELD_ALUMINIUM;

T_BOLT_ACTUAL = W_TOTAL_SAFE * (3 * T_BEAM / 1000);
*/

T_FRONT_WHEEL_AXIS_CENTRE_Y = W_TOTAL_SAFE * (R_BED[1] / 2 + T_WHEEL / 2) / 1000;
T_FRONT_WHEEL_AXIS_X = W_TOTAL_SAFE * (D_WHEEL / 2) / 1000;

F_FRONT_WHEEL_AXIS_INTERSECTION_Z_MAX = SHEAR_STRESS_YIELD_ALUMINIUM * PI * (SIZE_BOLT / 1000) ^ 3 / 32 / ((R_BED[0] + T_WHEEL) / 1000);

T_REAR_WHEEL_AXIS_Y_MAX = PI * (D_AXLE_REAR / 1000) ^ 3 / 16 * SHEAR_STRESS_YIELD_ALUMINIUM;
// T_REAR_WHEEL_AXIS_Y_ACTUAL = W_TOTAL_SAFE * (T_WHEEL / 2 + SPACING_XY_BED_BORDER + R_FIXING_ROUND[0] / 2) / 1000;

/* output
// echo("L_TILLER: ", L_TILLER, "mm");
echo("load safe max: ", W_TOTAL_SAFE, "N");
echo("T_front_wheel_axis_centre_y: ", T_FRONT_WHEEL_AXIS_CENTRE_Y, "Nm");
echo("T_front_wheel_axis_x: ", T_FRONT_WHEEL_AXIS_X, "Nm - fully dispersed by wheel");
echo("F_front_wheel_axis_intersection_z_max: ", F_FRONT_WHEEL_AXIS_INTERSECTION_Z_MAX, "N");
echo("T_rear_wheel_axis_y_max: ", T_REAR_WHEEL_AXIS_Y_MAX, "Nm");
echo("T_rear_wheel_axis_y_actual: ", T_REAR_WHEEL_AXIS_Y_ACTUAL, "Nm");
*/
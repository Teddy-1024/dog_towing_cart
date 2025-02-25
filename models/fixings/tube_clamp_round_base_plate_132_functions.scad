
function get_L_shaft_with_base_plate_round_base_plate_132(tube_diameter) = 
    (tube_diameter == 27) ? 
        85
    : (tube_diameter == 42) ?
        122
    : 25
;
function get_R_plate_round_base_plate_132(tube_diameter) = 
    (tube_diameter == 27) ? 
        [64, 114, 7]
    : (tube_diameter == 42) ?
        [80, 140, 10]
    : [10, 20, 1]
;
function get_offset_hole_y_round_base_plate_132(tube_diameter) = 
    (tube_diameter == 27) ? 
        38
    : (tube_diameter == 42) ?
        50
    : 10
;
function get_diameter_hole_round_base_plate_132(tube_diameter) = 10;

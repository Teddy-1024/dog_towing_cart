
function  get_L_shaft_long_round_3_way_through_116(tube_diameter) = 
    (tube_diameter == 27) ? 
        42
    : (tube_diameter == 42) ?
        60
    : 25
;
function get_thickness_round_3_way_through_116(tube_diameter) = 7;
function get_L_shaft_short_round_3_way_through_116(tube_diameter) = tube_diameter + 2 * get_thickness_round_3_way_through_116();
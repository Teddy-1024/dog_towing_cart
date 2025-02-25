// include <../../config.scad>;

function get_L_shaft_long_round_tee_long_104(tube_diameter) = 
    (tube_diameter == 27) ? 
        85
    : (tube_diameter == 42) ?
        122
    : 25
;
function get_L_shaft_short_round_tee_long_104(tube_diameter) = 
    (tube_diameter == 27) ? 
        42
    : (tube_diameter == 42) ?
        61
    : 10
;

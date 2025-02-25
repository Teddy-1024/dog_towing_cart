
function get_metric_bolt_head_height(size) = size;
function get_metric_bolt_head_diameter(size) = size * 2;
function get_metric_bolt_washer_diameter_safe_working_clearance(size) = 
    (size < 20) ?
        4 * size
    :
        3 * size
;
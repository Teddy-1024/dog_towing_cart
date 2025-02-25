include <../../config.scad>;
use <../common/beam_hollow_square.scad>;

module beam_leg_ballscrew_to_bed() {
    color(COLOUR_BEAM_ALUMINIUM) beam_hollow_square(L_LEG_FIXING_BRAKE_BALLSCREW_TO_BED, D_BEAM_BRAKE, T_BEAM_BRAKE);
    // Shopping
    // Beam leg ballscrew to bed
}

beam_leg_ballscrew_to_bed();
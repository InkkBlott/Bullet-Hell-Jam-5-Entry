destroy_timer = undefined //(number)
destroy_out_of_bounds = false
scroll_with_stage = false
scroll_factor = 1

initial_x = x
initial_y = y
movement_x = 0
movement_y = 0
movement_counter = 0
movement_duration = undefined //(number)
movement_curve = undefined //(animation curve)
destroy_at_destination = false

alpha_fade = 0
speed_accelleration = 0
sprite_rotation = 0

/// @function goTo
goTo = function(target_x, target_y, duration, destroy_after=false, anim_curve=undefined) {
	initial_x = x
	initial_y = y
	movement_x = target_x-x
	movement_y = target_y-y
	movement_duration = duration
	movement_counter = 0
	destroy_at_destination = destroy_after
	movement_curve = anim_curve
}
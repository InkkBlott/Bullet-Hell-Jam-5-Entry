if (destroy_timer != undefined and (destroy_timer --) <= 0) {
	instance_destroy()
	exit;
}

if (movement_duration != undefined and movement_counter < movement_duration) {
	movement_counter ++
	var progress = movement_counter / movement_duration
	if (movement_curve != undefined) progress = animcurve_channel_evaluate(animcurve_get_channel(movement_curve, 0), progress)
	x = initial_x + (movement_x * progress)
	y = initial_y + (movement_y * progress)
	if (movement_counter >= movement_duration and destroy_at_destination) {
		instance_destroy()
		exit;
	}
}

if (speed_accelleration != 0) speed += speed_accelleration
if (alpha_fade != 0) image_alpha += alpha_fade
if (sprite_rotation != 0) image_angle += sprite_rotation
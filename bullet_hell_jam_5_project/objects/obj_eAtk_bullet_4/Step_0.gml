event_inherited()

//homing effect
if (homing_delay > 0) homing_delay --
if (homing_delay <= 0 and homing_factor > 0) {
	if (instance_exists(PLAYER_INSTANCE)) direction += clamp(angle_difference(point_direction(x, y, PLAYER_INSTANCE.x, PLAYER_INSTANCE.y), direction), -homing_factor, homing_factor)
	if (homing_factor_decay > 0) homing_factor = max(homing_factor - homing_factor_decay, 0)
}
image_angle = direction
if ((trail_effect_timer ++) >= 5) {
	trail_effect_timer = 0
	WORLD.new_fx(x, y, obj_fx_bulletTrail, 20, DEPTH_LEVEL.BACKGROUND).image_angle = direction
}
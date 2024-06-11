// Inherit the parent event
event_inherited();

if (aim_mode == 1) {
	image_angle = direction
}
else if (aim_mode == 2) {
	if (instance_exists(PLAYER_INSTANCE)) image_angle = point_direction(x, y, PLAYER_INSTANCE.x, PLAYER_INSTANCE.y)
}
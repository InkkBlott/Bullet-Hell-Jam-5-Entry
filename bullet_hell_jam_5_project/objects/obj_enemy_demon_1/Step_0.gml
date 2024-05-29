// Inherit the parent event
event_inherited();

if (instance_exists(PLAYER_INSTANCE)) eye_direction = point_direction(x, y, PLAYER_INSTANCE.x, PLAYER_INSTANCE.y)
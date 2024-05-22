event_inherited()

if (instance_exists(PLAYER_INSTANCE)) {
	x = PLAYER_INSTANCE.x
	y = PLAYER_INSTANCE.y
	if (sprite_index != PLAYER_INSTANCE.sprite_index) sprite_index = PLAYER_INSTANCE.sprite_index
}
image_xscale += 0.01667
image_yscale += 0.01667
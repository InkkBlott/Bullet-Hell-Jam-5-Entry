event_inherited()

if (contact_damage and instance_exists(PLAYER_INSTANCE) and PLAYER_INSTANCE.is_vulnerable() and instance_place(x, y, PLAYER_INSTANCE)) {
	hit_player()
}
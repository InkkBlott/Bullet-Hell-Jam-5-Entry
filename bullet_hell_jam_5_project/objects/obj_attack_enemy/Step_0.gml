if (attack_active and instance_exists(PLAYER.instance) 
and PLAYER_INSTANCE.is_vulnerable() and instance_place(x, y, PLAYER_INSTANCE)) {
	hit_player()
}
if (destroy_timer != undefined and (destroy_timer -- ) <= 0) instance_destroy()
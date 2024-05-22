depth = DEPTH_LEVEL.ENEMY_ATTACKS

attack_active = true
destroy_on_hit = false
destroy_out_of_bounds = false
out_of_bounds_buffer = 0
destroy_timer = undefined //(number)
scroll_with_stage = false
scroll_factor = 1
player_hit = false //for use in destroy event

/// @function hit_player
hit_player = function() {
	//escape on invalid target
	if (!instance_exists(PLAYER_INSTANCE)) return;
	//inflict damage
	PLAYER_INSTANCE.damage()
	player_hit = true
	//destroy on hit
	if (destroy_on_hit) instance_destroy()
}
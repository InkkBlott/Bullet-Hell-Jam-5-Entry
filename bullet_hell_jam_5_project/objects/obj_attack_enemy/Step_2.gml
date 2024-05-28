if (destroy_out_of_bounds and !point_in_rectangle(x, y, 0-out_of_bounds_buffer, 0-out_of_bounds_buffer, room_width+out_of_bounds_buffer, room_height+out_of_bounds_buffer)) {
	instance_destroy()
}
else {
	if (attack_active and instance_exists(PLAYER.instance) 
	and PLAYER_INSTANCE.is_vulnerable() and collision_check(PLAYER_INSTANCE)) {
		if (PLAYER_INSTANCE.is_parrying()) {
			parried = true
			WORLD.score_points += parry_point_value
			PLAYER_INSTANCE.register_parry(id)
			if (destroy_on_parry) instance_destroy()
		}
		else {
			hit_player()
		}
	}
}
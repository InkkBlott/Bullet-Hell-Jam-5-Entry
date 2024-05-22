attack_power = 1
attack_active = true
destroy_on_hit = true
collisions = [] //in each index: [collision_instance, expiration_timer]
collision_expiration_time = undefined //(number) When set, makes collisions "expire" and get removed from the array after XX frames
collision_confirmed = false
collision_enemy_confirmed = false
destroy_out_of_bounds = false
out_of_bounds_buffer = 0

/// @function hit
hit = function(target) {
	//escape on invalid target
	if (!instance_exists(target)) return;
	//inflict damage
	target.damage(attack_power, id)
	//add to collision array
	array_push(collisions, [target, collision_expiration_time])
	collision_confirmed = true
	collision_enemy_confirmed = true
	//destroy on hit
	if (destroy_on_hit) instance_destroy()
}
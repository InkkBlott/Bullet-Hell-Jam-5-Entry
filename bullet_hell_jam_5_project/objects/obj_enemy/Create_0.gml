event_inherited()

if (!variable_instance_exists(id, "stage")) stage = noone 
hp = 100
hp_max = 100
alive = true
combat_active = true
contact_damage = true //when true, player takes damage from touching
player_hit = false
destroy_out_of_bounds = false
out_of_bounds_buffer = 0
scroll_with_stage = false
scroll_factor = 1
damage_effect_timer = 0

/// @function setHP
setHP = function(val) { hp = clamp(val, 0, hp_max) }


/// @function is_vulnerable
is_vulnerable = function() {
	return (combat_active and alive)
}
/// @function damage
damage = function(dmg_amount, source_instance=noone) {
	setHP(hp-dmg_amount)
	damage_effect_timer = 3
	show_debug_message($"{id} ({object_get_name(object_index)}) - HP: {hp}/{hp_max}")
}
/// @function death
death = function() {
	instance_destroy()
}

/// @function hit_player
hit_player = function() {
	//escape on invalid target
	if (!instance_exists(PLAYER_INSTANCE)) return;
	//inflict damage
	PLAYER_INSTANCE.damage()
	player_hit = true
}

/// @function shoot(object, [direction], [speed], [offset_x], [offset_y], [rotate_offset?])
shoot = function(obj, dir=undefined, spd=undefined, off_x=0, off_y=0, off_rot=false) {
	var px = x + off_x
	var py = y + off_y
	if (off_rot) {
		var ang = point_direction(x, y, off_x, off_y) + direction
		var dist = point_distance(0, 0, off_x, off_y)
		px = x + (dcos(ang) * dist)
		py = y - (dsin(ang) * dist)
	}
	var o = instance_create_depth(px, py, DEPTH_LEVEL.ENEMY_ATTACKS, obj)
	if (dir) o.direction = dir
	if (spd) o.speed = spd
	return o
}

attack = function() {
	attack_ongoing = true
	instance_set_timeline(id, tml_enemyAttack_TEST)
}
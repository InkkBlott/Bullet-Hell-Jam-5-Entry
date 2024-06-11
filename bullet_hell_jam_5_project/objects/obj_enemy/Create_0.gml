event_inherited()

if (!variable_instance_exists(id, "stage")) stage = noone 
hp = 10
hp_max = 10
point_value = 100
gauge_fill_value = 0.1
gauge_fill_index = 0
gauge_fill_on_death = false
gauge_fill_on_escape = true

alive = true
boss_status = false //when true, killing this enemy will set the "stage complete" status
combat_active = true
contact_damage = true //when true, player takes damage from touching
player_hit = false
destroy_out_of_bounds = false
out_of_bounds_buffer = 50
scroll_with_stage = false
scroll_factor = 1
damage_effect_timer = 0

preset_attacks = [tml_eAtk_TEST]
attack_code = 0
attack_index = 0
attack_variables = []


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
	WORLD.score_points += point_value
	if (gauge_fill_on_death) WORLD.fill_gauge(gauge_fill_index, gauge_fill_value)
	if (boss_status) WORLD.stage_complete = true
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

attack = function(code=undefined) {
	attack_ongoing = true
	attack_code = code ?? (attack_index ++)
	attack_index %= array_length(preset_attacks)
	attack_variables = []
	instance_set_timeline(id, preset_attacks[attack_code])
}

draw_mask = function() { //override
	//draw outline of mask
	draw_sprite_stretched_ext(spr_shape_square_corner, 0, bbox_left, bbox_top, bbox_right-bbox_left, 1, c_red, 1)
	draw_sprite_stretched_ext(spr_shape_square_corner, 0, bbox_left, bbox_bottom-1, bbox_right-bbox_left, 1, c_red, 1)
	draw_sprite_stretched_ext(spr_shape_square_corner, 0, bbox_left, bbox_top, 1, bbox_bottom-bbox_top, c_red, 1)
	draw_sprite_stretched_ext(spr_shape_square_corner, 0, bbox_right-1, bbox_top, 1, bbox_bottom-bbox_top, c_red, 1)
}
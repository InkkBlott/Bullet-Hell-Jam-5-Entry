event_inherited()

<<<<<<< HEAD
normal_sprite = spr_playerShip_default_00
shielded_sprite = spr_playerShip_default_01
normal_mask = spr_playerShip_default_00
attacking_mask = spr_playerShip_default_01

focus_mode = false
movement_speed = 3
movement_speed_focus = 1.5
=======
movement_speed = 3
movement_speed_slow = 1.5
normal_sprite = spr_playerShip_default_00
attacking_sprite = spr_playerShip_default_01
focus_mode = false
>>>>>>> origin/main

level = 0
player_control_active = true
hit_invincibility = 0
hit_invincibility_max = 60
alive = true
trigger_death_fx = false

parry_cooldown_counter = 0
parry_window_counter = 0
parry_invincibility = 0
parry_invincibility_max = 30
shielded = true

action_queue = [
	[CHARACTER_ACTION.MOVE_PATH, pth_playerSpawn, 60, acv_ease],
	[CHARACTER_ACTION.METHOD, function() { hit_invincibility = 30; image_blend = c_white; image_xscale = 1; image_yscale = 1; image_angle = 0;}],
]
action_queue_label = ACTION_QUEUE_LABEL.PLAYER_SPAWN

attack = function() { //override
	attack_ongoing = true //Set to false at the end of attack timelines
	instance_set_timeline(id, PLAYER.levels[level].attack_timeline)
}

/// @function is_player_controlled
is_player_controlled = function() {
	return (alive and player_control_active and array_length(action_queue) == 0)
}

/// @function is_vulnerable
is_vulnerable = function() {
	return (is_player_controlled() and hit_invincibility <= 0 and parry_invincibility <= 0)
}

/// @function damage
damage = function() {
	if (shielded) {
		shielded = false 
		//TODO: play shield destroy sound
	} else {
		PLAYER.hp = max(PLAYER.hp - 1, 0)
		parry_cooldown_counter = max(parry_cooldown_counter, 180)
		//TODO: play hurt sound
	}
	GAME.toggle_pause(PLAYER.hp == 0 ? PAUSE_EVENT.HITSTOP_MAJOR : PAUSE_EVENT.HITSTOP_MINOR)
	hit_invincibility = hit_invincibility_max
	parry_window_counter = 0
	if (alive and PLAYER.hp == 0) {
		death()
	}
}

/// @function is_parrying
is_parrying = function() {
	return (parry_window_counter > 0 and hit_invincibility <= 0)
}

/// @function register_parry
register_parry = function(parried_attack) {
	parry_window_counter = 0
	parry_invincibility = parry_invincibility_max
	parry_cooldown_counter = max(parry_cooldown_counter, 180)
	WORLD.new_fx(x, y, obj_effectAnim, 3, DEPTH_LEVEL.FOREGROUND,,, spr_fx_crossFlare_big, c_aqua, id).destroy_on_animation_end = false
	GAME.toggle_pause(PAUSE_EVENT.HITSTOP_MINOR)
}

/// @function death
death = function() {
	alive = false
	trigger_death_fx = true
}

draw_mask = function() { //override
<<<<<<< HEAD
	draw_sprite_stretched_ext((mask_index == attacking_mask) ? spr_shape_circle_small : spr_shape_square_corner, 0, bbox_left, bbox_top, bbox_right-bbox_left, bbox_bottom-bbox_top, c_lime, 1)
=======
	draw_sprite_stretched_ext((mask_index == attacking_sprite) ? spr_shape_circle_small : spr_shape_square_corner, 0, bbox_left, bbox_top, bbox_right-bbox_left, bbox_bottom-bbox_top, c_lime, 1)
>>>>>>> origin/main
}
event_inherited()

player_control_active = true
attack_cooldown = 0
attack_cooldown_max = 25
movement_speed = 3.5
movement_speed_slow = 1.5
hit_invincibility = 0
hit_invincibility_max = 60
alive = true
trigger_death_fx = false

action_queue = [
	[CHARACTER_ACTION.MOVE_PATH, pth_playerSpawn, 60, acv_ease],
	[CHARACTER_ACTION.METHOD, function() { hit_invincibility = 30; image_blend = c_white; image_xscale = 1; image_yscale = 1; image_angle = 0;}],
]
action_queue_label = ACTION_QUEUE_LABEL.PLAYER_SPAWN

attack = function() { //override
	attack_ongoing = true
	instance_set_timeline(id, tml_playerAttack_default_TEST)
}

/// @function is_player_controlled
is_player_controlled = function() {
	return (alive and player_control_active and array_length(action_queue) == 0)
}

/// @function is_vulnerable
is_vulnerable = function() {
	return (is_player_controlled() and hit_invincibility <= 0)
}

/// @function damage
damage = function() {
	PLAYER.hp = max(PLAYER.hp - 1, 0)
	GAME.toggle_pause(PLAYER.hp == 0 ? PAUSE_EVENT.HITSTOP_MAJOR : PAUSE_EVENT.HITSTOP_MINOR)
	hit_invincibility = hit_invincibility_max
	if (alive and PLAYER.hp == 0) {
		death()
	}
}

/// @function death
death = function() {
	alive = false
	trigger_death_fx = true
}
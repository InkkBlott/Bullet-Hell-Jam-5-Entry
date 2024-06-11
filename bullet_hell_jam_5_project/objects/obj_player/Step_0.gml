event_inherited()

if (attack_ongoing and !instance_timeline_is_running(id)) attack_ongoing = false //should be set at the end of attack timelines, but just in case
if (focus_mode) focus_mode = false
var m_dir = -1, attack_this_frame = false
if (is_player_controlled()) {
	//level up
	var level_up = false
	while (level < array_length(PLAYER.levels)-1 and WORLD.score_points >= PLAYER.levels[level+1].score_requirement) {
		level ++
		level_up = true
	}
	if (level_up) WORLD.new_fx(x, y, obj_fx_playerLevelUpShadow, 60, DEPTH_LEVEL.PLAYER_EFFECTS,,,,, id)
	
	//movement direction
	var m_x = 0, m_y = 0
	if (keyboard_check(vk_left)) m_x --
	if (keyboard_check(vk_right)) m_x ++
	if (keyboard_check(vk_up)) m_y --
	if (keyboard_check(vk_down)) m_y ++
	
	if (m_x != 0 or m_y != 0) m_dir = point_direction(0, 0, m_x, m_y)
	
	//focus mode
	if (keyboard_check(vk_shift)) focus_mode = true
	
	//shoot
	if (!attack_ongoing and keyboard_check(vk_space)) { 
		attack()
		attack_this_frame = true
	}

	//parry
	if (parry_window_counter > 0) parry_window_counter --
	if (parry_cooldown_counter > 0) parry_cooldown_counter --
	if (parry_cooldown_counter == 0) {
		WORLD.new_fx(x, y, obj_effectAnim, 3, DEPTH_LEVEL.FOREGROUND,,, spr_fx_crossFlare_small, c_aqua, id).destroy_on_animation_end = false
		with (WORLD.new_fx(x, y, obj_effectAnim, 3, DEPTH_LEVEL.FOREGROUND,,, spr_fx_crossFlare_small, c_aqua, id)) {
			destroy_on_animation_end = false
			image_angle = 45
			image_xscale = 0.8
			image_yscale = 0.8
		}
		parry_cooldown_counter = -1
	}
	if (hit_invincibility > 0) parry_cooldown_counter = max(parry_cooldown_counter, 60)
	if (attack_this_frame) {
		if (parry_cooldown_counter <= 0) parry_window_counter = parry_window_max //parry window activation
		parry_cooldown_counter = max(parry_cooldown_counter, 90)
	}
}

//movement
if (m_dir != -1) {
	direction = m_dir
	speed = (focus_mode ? movement_speed_focus : movement_speed)
} else speed = 0

//combat status
if (parry_invincibility > 0) parry_invincibility --
if (hit_invincibility > 0) hit_invincibility --
sprite_index = (shielded) ? shielded_sprite : normal_sprite
mask_index = (attack_this_frame or attack_ongoing or is_parrying()) ? attacking_mask : normal_mask //bigger collision mask when attacking
visible = (alive and (hit_invincibility <= 0 or hit_invincibility % 4 < 2))

if (trigger_death_fx) {
	repeat(10) {
		WORLD.new_fx(irandom_range(x-7, x+7), irandom_range(y-7, y+7), obj_fx_poof, 120, DEPTH_LEVEL.PLAYER_EFFECTS, random(360), random_range(1, 5),, c_aqua).image_speed = random_range(0.5, 1.5)
		WORLD.new_fx(irandom_range(x-7, x+7), irandom_range(y-7, y+7), obj_fx_playerDeathParticle, 120, DEPTH_LEVEL.FOREGROUND, random_range(30, 150), random_range(2, 5))
	}
	trigger_death_fx = false
}
event_inherited()

if (attack_ongoing and !instance_timeline_is_running(id)) attack_ongoing = false //should be set at the end of attack timelines, but just in case

var m_dir = -1
if (is_player_controlled()) {
	//movement
	var m_x = 0, m_y = 0
	if (keyboard_check(vk_left)) m_x --
	if (keyboard_check(vk_right)) m_x ++
	if (keyboard_check(vk_up)) m_y --
	if (keyboard_check(vk_down)) m_y ++
	
	if (m_x != 0 or m_y != 0) m_dir = point_direction(0, 0, m_x, m_y)
	
	//shoot
	if (!attack_ongoing and keyboard_check(vk_space)) { 
		attack()
	}
}
if (m_dir != -1) {
	direction = m_dir
	speed = (keyboard_check(vk_shift) ? movement_speed_slow : movement_speed)
} else speed = 0

if (hit_invincibility > 0) hit_invincibility --

visible = (alive and (hit_invincibility <= 0 or hit_invincibility % 4 < 2))

if (trigger_death_fx) {
	repeat(10) {
		WORLD.new_fx(irandom_range(x-7, x+7), irandom_range(y-7, y+7), obj_fx_poof, 120, DEPTH_LEVEL.PLAYER_EFFECTS, random(360), random_range(1, 5),, c_aqua).image_speed = random_range(0.5, 1.5)
		WORLD.new_fx(irandom_range(x-7, x+7), irandom_range(y-7, y+7), obj_fx_playerDeathParticle, 120, DEPTH_LEVEL.FOREGROUND, random_range(30, 150), random_range(2, 5))
	}
	trigger_death_fx = false
}
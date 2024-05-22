//spawn action effects
if (action_queue_label == ACTION_QUEUE_LABEL.PLAYER_SPAWN and get_current_action_code() == CHARACTER_ACTION.MOVE_PATH) {
	var progress = (action_counter / get_current_action()[2])
	image_blend = make_color_hsv(0, 0, progress*255)
	image_xscale = 4 - (progress * 3)
	image_yscale = image_xscale
	image_angle = direction-90
}

if (is_player_controlled()) {
	//movement lock
	x = clamp(x, 0, room_width-1)
	y = clamp(y, 0, room_height-1)
	
	//level up
	var level_up = false
	while (level < array_length(PLAYER.levels)-1 and WORLD.score_points >= PLAYER.levels[level+1].score_requirement) {
		level ++
		level_up = true
	}
	if (level_up) WORLD.new_fx(x, y, obj_fx_playerLevelUpShadow, 60, DEPTH_LEVEL.PLAYER_EFFECTS)
}
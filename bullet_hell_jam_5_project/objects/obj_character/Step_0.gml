if (attack_ongoing and !timeline_running) attack_ongoing = false

//execute queued actions
var act = get_current_action()
if (act != undefined) {
	var act_code = act[0]
	if (act_code == CHARACTER_ACTION.WAIT) { // #frames
		if (++ action_counter >= act[1]) action_finished = true
	} 
	else if (act_code == CHARACTER_ACTION.FACE_DIRECTION) { // #direction, [#turn_speed]
		if (array_length(act) == 3) {
			var t = clamp(angle_difference(act[1], image_angle), -1, 1)
			image_angle += t
			if (abs(t) <= 1) action_finished = true
		} else {
			image_angle = act[1]
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.MOVE_DIRECTION) { // #direction, #speed, [#frames]
		if (action_counter == 0) {
			direction = act[1]
			speed = act[2]
		}
		if (array_length(act) < 4) {
			action_finished = true
		}
		else if (++ action_counter >= act[3]) {
			speed = 0
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.MOVE_POSITION) { // #pos_x, #pos_y, #frames, [@anim_curve]
		if (action_counter == 0) {
			action_variables[0] = x
			action_variables[1] = y
			action_variables[2] = act[1] - x
			action_variables[3] = act[2] - y
			direction = point_direction(x, y, act[1], act[2])
		}
		action_counter ++
		var progress = action_counter / act[3]
		if (array_length(act) == 5) progress = animcurve_channel_evaluate(animcurve_get_channel(act[4], 0), progress) //apply curve
		x = action_variables[0] + (action_variables[2] * progress)
		y = action_variables[1] + (action_variables[3] * progress)
		if (action_counter >= act[3]) action_finished = true
	}
	else if (act_code == CHARACTER_ACTION.MOVE_PATH) { // @path, #frames, [@anim_curve]
		if (action_counter == 0) {
			action_variables[0] = x
			action_variables[1] = y
		}
		action_counter ++
		var progress = action_counter / act[2]
		if (array_length(act) == 4) progress = animcurve_channel_evaluate(animcurve_get_channel(act[3], 0), progress) //apply curve
		var prev_x = x, prev_y = y
		x = action_variables[0] + path_get_x(act[1], progress)
		y = action_variables[1] + path_get_y(act[1], progress)
		direction = point_direction(prev_x, prev_y, x, y)
		if (action_counter >= act[2]) action_finished = true
	}
	else if (act_code == CHARACTER_ACTION.TIMELINE) { // @timeline, [?wait_until_done]
		if (action_counter == 0) {
			instance_set_timeline(id, act[1])
			action_counter ++
		} else if (!timeline_running or array_length(act) < 3 or !act[2]) {
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.ATTACK) { // [?wait_until_done]
		if (action_counter == 0) {
			attack()
			action_counter ++
		}
		if (!attack_ongoing or array_length(act) < 2 or !act[1]) {
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.METHOD) { // {}method_function, [[]argument_array]
		method(id, act[1])(array_length(act) == 3 ? act[2] : undefined)
		action_finished = true
	}
	else if (act_code == CHARACTER_ACTION.DESTROY) { // (no args)
		instance_destroy()
		action_finished = true
	}
	if (action_finished) next_action()
}
else if (action_queue_default != undefined) {
	set_action_queue(action_queue_default, ACTION_QUEUE_LABEL.DEFAULT)
}
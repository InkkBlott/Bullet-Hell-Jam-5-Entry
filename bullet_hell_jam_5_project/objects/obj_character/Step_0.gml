if (attack_ongoing and !instance_timeline_is_running(id)) attack_ongoing = false

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
		if (array_length(act) == 5 and act[4] != undefined) progress = animcurve_channel_evaluate(animcurve_get_channel(act[4], 0), progress) //apply curve
		x = action_variables[0] + (action_variables[2] * progress)
		y = action_variables[1] + (action_variables[3] * progress)
		if (action_counter >= act[3]) action_finished = true
	}
	else if (act_code == CHARACTER_ACTION.MOVE_PATH) { // @path, #frames, [@anim_curve], [#scale_x], [#scale_y]
		if (array_length(action_variables) == 0) {
			action_variables[0] = x
			action_variables[1] = y
		}
		action_counter ++
		var progress = action_counter / act[2]
		if (array_length(act) >= 4 and act[3] != undefined) progress = animcurve_channel_evaluate(animcurve_get_channel(act[3], 0), progress) //apply curve
		var prev_x = x, prev_y = y
		var scale_x = (array_length(act) >= 5) ? act[4] : 1
		var scale_y = (array_length(act) >= 6) ? act[5] : 1
		if (progress < 0) { scale_x *= -1; scale_y *= -1; progress *= -1 } //invert for negative progress values (-1 .. 0)
		x = action_variables[0] + (path_get_x(act[1], progress) * scale_x)
		y = action_variables[1] + (path_get_y(act[1], progress) * scale_y)
		direction = point_direction(prev_x, prev_y, x, y)
		if (action_counter >= act[2]) action_finished = true
	}
	else if (act_code == CHARACTER_ACTION.TIMELINE) { // @timeline, [?wait_until_done]
		if (action_counter == 0) {
			instance_set_timeline(id, act[1])
			action_counter ++
		} else if (!instance_timeline_is_running(id) or array_length(act) < 3 or !act[2]) {
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.ATTACK) { // [attack_index], [?wait_until_done]
		if (action_counter == 0) {
			var atk_code = (array_length(act) >= 2) ? act[1] : undefined
			attack(atk_code)
			action_counter ++
		}
		if (!attack_ongoing or array_length(act) < 3 or !act[2]) {
			action_finished = true
		}
	}
	else if (act_code == CHARACTER_ACTION.STOP_ATTACK) { // (no args)
		instance_stop_timeline(id)
		attack_ongoing = false
		action_finished = true
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
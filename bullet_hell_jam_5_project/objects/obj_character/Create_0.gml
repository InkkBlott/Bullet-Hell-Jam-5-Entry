action_queue = []
action_queue_label = undefined
action_counter = 0
action_variables = []
action_finished = false
action_queue_default = undefined
preset_action_queues = []
attack_ongoing = false

/// @function get_current_action
get_current_action = function() {
	if (array_length(action_queue) == 0) return undefined
	return action_queue[0]
}

/// @function get_current_action_code
get_current_action_code = function() {
	if (array_length(action_queue) == 0) return undefined
	return action_queue[0][0]
}

/// @function set_action_queue
set_action_queue = function(queue_array_or_index, label=undefined) {
	action_queue = (typeof(queue_array_or_index) == "array") ? func_array_copy(queue_array_or_index) : func_array_copy(preset_action_queues[queue_array_or_index])
	action_queue_label = label
	action_counter = 0
	action_variables = []
	action_finished = false
}

/// @function next_action
next_action = function() {
	if (array_length(action_queue) > 0) array_delete(action_queue, 0, 1)
	action_counter = 0
	action_variables = []
	action_finished = false
}

/// @function init()
/// @desc Initializes position and action queue based on post-creation values. Should always be called on creation
init = function() {
	if (get_current_action() == undefined and action_queue_default != undefined) {
		set_action_queue(action_queue_default, ACTION_QUEUE_LABEL.DEFAULT)
	}
	var act = get_current_action()
	if (act[0] == CHARACTER_ACTION.MOVE_PATH) {
		//override first cycle of this action in step event
		action_variables[0] = x
		action_variables[1] = y
		x += path_get_x(act[1], 0)
		y += path_get_y(act[1], 0)
	}
}

/// @function attack([attack_code])
// should be overwritten by children that attack
attack = function(code=undefined) {
	attack_ongoing = true
	if (code) attack_code = code
}

/// @function draw_mask
draw_mask = function() {
	//draw_sprite_stretched_ext(spr_shape_square_corner, 0, bbox_left, bbox_top, bbox_right-bbox_left, bbox_bottom-bbox_top, c_lime, 1)
}
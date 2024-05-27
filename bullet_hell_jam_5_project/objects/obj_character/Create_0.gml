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
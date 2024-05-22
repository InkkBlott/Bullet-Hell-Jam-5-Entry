action_queue = []
action_queue_label = undefined
action_counter = 0
action_variables = []
action_finished = false
action_queue_default = undefined

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
set_action_queue = function(action_array, label=undefined) {
	action_queue = func_array_copy(action_array)
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

/// @function attack(attack_code)
// should be overwritten by children that attack
attack = function(code=0) {
	attack_ongoing = true
	attack_code = code
}
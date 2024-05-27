#region System Functions

function window_position_reset() { window_set_position((display_get_width()/2)-(window_get_width()/2), (display_get_height()/2)-(window_get_height()/2)) }

#endregion

#region Debug Functions

///@function draw_text_2(x, y, string, [color], [align_x], [align_y], [big])
function draw_text_2(x,y,str, color=c_white, align_x=0, align_y=0, big=false) {
	var c = draw_get_color()
	var f = draw_get_font()
	
	draw_set_font(big ? fnt_tahoma_14 : fnt_tahoma_10)
	x -= string_width_scribble(str)*align_x
	y -= string_height_scribble(str)*align_y
	draw_set_color(c_black)
	draw_text_scribble(x-1,y+1,str)
	draw_set_color(color)
	draw_text_scribble(x,y,str)
	
	draw_set_font(f)
	draw_set_color(c)
}

///@function draw_rectangle_outline
//convenient because the outline feature of the standard GMS2 function sometimes comes out dark/weird, and has no thickness option
function draw_rectangle_outline(x1, y1, x2, y2, thickness=1) {
	draw_line_width(x1, y1, x2, y1, thickness) //top
	draw_line_width(x1, y2, x2, y2, thickness) //bottom
	draw_line_width(x1, y1, x1, y2, thickness) //left
	draw_line_width(x2, y1, x2, y2, thickness) //right
}

#endregion

#region Convenience functions

/// @function func_shader_rgb
function func_shader_rgb(r, g, b) { return [r/255, g/255, b/255] }

/// @function func_shader_rgba
function func_shader_rgba(r, g, b, a) { return [r/255, g/255, b/255, a] }

/// @function func_correct_angle(angle)
/// @description converts an angle value outside the bounds of 0 and 359.999.. to one within those bounds
/// @param {real} angle Angle value to be corrected
function func_correct_angle(angle) {
	if (angle >= 360) return angle % 360
	if (angle < 0) return (angle % 360) + 360
	return angle
}

///	@function func_array_copy(source_array)
/// @desc Simplified array copy function. Returns copy of the provided source array
/// @param {array} source_array Array to copy
function func_array_copy(source_array) {
	var return_array = []
	array_copy(return_array, 0, source_array, 0, array_length(source_array))
	return return_array
}

///	@function func_array_drain(array)
/// @desc Like array_pop, but it deletes and returns the value at position 0
function func_array_drain(array) {
	var r = array[0]
	array_delete(array, 0, 1)
	return r
}

/// @function point_in_direction(direction, distance)
/// @desc Returns an [x, y] coordinate pair representing a positional offset in the given direction
function point_in_direction(dir, dist) { return [dcos(dir)*dist, 0-dsin(dir)*dist] }

/// @function instance_is_a(instance, object1, object2*, ...)
/// @param {object} instance Instance to check object lineage of
/// @param {object} object1 (mandatory) First object to check instance against
/// @param {object} object2* (optional) Additional objects to check instance against
// QoL function to easily see if an instance is or is partented by one of the objects listed in the arguments
function instance_is_a() {
	if (!argument[0]) return false
	for (var i=1; i<argument_count; i++) {
		if (argument[0].id == argument[i] or argument[0].object_index == argument[i] or object_is_ancestor(argument0.object_index,  argument[i])) { return true }
	}
	return false
}

/// @function instance_set_timeline(id, timeline, [speed])
function instance_set_timeline(_id, _timeline, _speed=1) {
	_id.timeline_index = _timeline
	_id.timeline_position = 0
	_id.timeline_speed = _speed
	_id.timeline_running = true
}

/// @function instance_stop_timeline(id)
function instance_stop_timeline(_id) {
	_id.timeline_index = undefined
	_id.timeline_position = 0
	_id.timeline_speed = 1
	_id.timeline_running = false
}

/// @function instance_timeline_is_running(id)
//the built in variable doesn't change once the timeline executes its last action, so this is a more comprehensive check
function instance_timeline_is_running(_id) {
	return (_id.timeline_running and timeline_exists(_id.timeline_index) and _id.timeline_position <= timeline_max_moment(_id.timeline_index))
}

#endregion
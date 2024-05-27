if (instance_exists(attached_instance)) {
	x += (attached_instance.x - attached_instance.xprevious)
	y += (attached_instance.y - attached_instance.yprevious)
}
if (!in_bounds_confirm and rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 0, 0, room_width, room_height)) in_bounds_confirm = true
//destroy out of bounds after having been confirmed "in-frame" at least one frame
if (destroy_out_of_bounds and in_bounds_confirm and !rectangle_in_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 0, 0, room_width, room_height)) instance_destroy()
if ((destroy_timer --) <= 0) instance_destroy()
if (flicker) {
	flicker_timer ++
	flicker_timer %= 4
	visible = (flicker_timer < 2)
}
// Inherit the parent event
event_inherited()

if (speed < speed_max) {
	speed = min(speed + speed_accelleration, speed_max)
}
if (!warp_valid and point_in_rectangle(x, y, 0, 0, room_width, room_height)) warp_valid = true
if (warp_valid) {
	if (warp_x and ((hspeed < 0 and x < 25) or (hspeed > 0 and x >= room_width-25))) {
		warp_x = false
		var o = instance_create_depth(x + (x < 25 ? room_width : -room_width), y, depth, object_index)
		o.direction = direction
		o.speed = speed
		o.image_index = image_index
		o.speed_max = speed_max
		o.speed_accelleration = speed_accelleration
		o.warp_x = warp_x
		o.warp_y = warp_y
		o.warp_valid = true
	}
	if (warp_y and ((vspeed < 0 and y < 25) or (vspeed > 0 and y >= room_height-25))) {
		warp_y = false
		var o = instance_create_depth(x, y + (y < 25 ? room_height : -room_height), depth, object_index)
		o.direction = direction
		o.speed = speed
		o.image_index = image_index
		o.speed_max = speed_max
		o.speed_accelleration = speed_accelleration
		o.warp_x = warp_x
		o.warp_y = warp_y
		o.warp_valid = true
	}
}
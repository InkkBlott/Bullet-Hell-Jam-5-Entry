event_inherited()

image_angle --

if (((x < 0 and hspeed < 0) or (x >= room_width and hspeed > 0)) and bounces_x < bounce_limit) {
	hspeed *= -1
	bounces_x ++
}
if (((y < 0 and vspeed < 0) or (y >= room_height and vspeed > 0)) and bounces_y < bounce_limit) {
	vspeed *= -1
	bounces_y ++
}
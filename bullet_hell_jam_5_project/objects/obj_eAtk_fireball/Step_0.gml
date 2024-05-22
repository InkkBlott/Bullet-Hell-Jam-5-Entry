event_inherited()

image_angle = direction


trail_timer --
if (trail_timer <= 0) {
	var pt = point_in_direction(direction + 90, dsin(trail_position) * 10)
	instance_create_depth(x + pt[0], y + pt[1], DEPTH_LEVEL.ENEMY_ATTACKS, obj_eAtk_fireTrail)
	trail_timer = 8
}
trail_position += 10
if (trail_position >= 360) trail_position -= 360
